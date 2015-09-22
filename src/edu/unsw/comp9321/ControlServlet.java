package edu.unsw.comp9321;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.sun.org.apache.xerces.internal.parsers.DOMParser;

/**
 * Servlet implementation class ControlServlet
 */
@WebServlet(urlPatterns="/control",displayName="ControlServlet")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	XPathFactory fac=XPathFactory.newInstance();
	XPath nav=fac.newXPath();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
		 String check= request.getParameter("check");
		 String delete= request.getParameter("delete");
		 String advanced= request.getParameter("advanced");
		 String nextPage = request.getParameter("nextPage");
		 String dt = request.getParameter("dt");
		 String num= request.getParameter("num");
			 nextPage = nextPage.concat(".jsp");
		 //System.out.println(action);
		 if (action != null) {
			 try{
				 //System.out.println(action);
				 //Vector<String> places1=new Vector<String>();
				 	Vector<Node> beannode=new Vector<Node>();
				 	JourneyBean journey1 = (JourneyBean) request.getSession().getAttribute("journey1");
					DOMParser parser=new DOMParser();
					ServletContext context = getServletContext();
					InputSource xmlFile = new InputSource(context.getResourceAsStream("/WEB-INF/dblp.xml"));
					parser.parse(xmlFile);
					Document doc = parser.getDocument();
					//NodeList nodelist=doc.getElementsByTagName("title");
					//String s ="Total number :"+ nodelist.getLength();
					//Element root = doc.getDocumentElement();
					//doc.getFirstChild()
					XPathExpression xp;
					xp=nav.compile("/dblp/*");
					//System.out.println(advanced);
					if (advanced!=null) {
						if (advanced == "dblp"){
							advanced="";
							NodeList nodes = (NodeList) xp.evaluate(doc, XPathConstants.NODESET);
							Vector<String> plac=new Vector<String>();
							for (int i = 0;i<=nodes.getLength();i++) {
								Node a = nodes.item(i);
							if (nodes.item(i).getNodeName().equals(advanced)) {
								//Vector<Node> subnodes=journey1.getNode();
								NodeList subnodes=a.getChildNodes();
								for (int j =0; j<subnodes.getLength();j++) {
									if (subnodes.item(j)!=null && subnodes.item(j).getNodeName()=="title") {
										plac.add(subnodes.item(j).getTextContent());
										beannode.add(a);
									}
								}
							}
							}

							journey1.setPlaces(plac);
							journey1.setNode(beannode);
						}
						else {
							//System.out.println(advanced);
							NodeList nodes = (NodeList) xp.evaluate(doc, XPathConstants.NODESET);
							Vector<String> plac=new Vector<String>();
							for (int i = 0;i<=nodes.getLength();i++) {
								Node a = nodes.item(i);
							//System.out.println(nodes.getLength());
							if (a != null) {
								//Vector<Node> subnodes=journey1.getNode();
								NodeList subnodes=a.getChildNodes();
								for (int j =0; j<subnodes.getLength();j++) {
									if (subnodes.item(j).getTextContent().toLowerCase().contains(action.toLowerCase()) && subnodes.item(j).getNodeName().toLowerCase().equals(advanced.toLowerCase())) {	
										plac.add(subnodes.item(j).getTextContent());
										beannode.add(a);
									}
								}
								}
							}

							journey1.setPlaces(plac);
							journey1.setNode(beannode);
						}
						//System.out.println("This file contains "+nodelist.getLength()+" <article> elements!");
						//journey1.setPlaces(places1);
					}
					else {
						NodeList nodes = (NodeList) xp.evaluate(doc, XPathConstants.NODESET);
						Vector<String> plac=new Vector<String>();
						//System.out.println(advanced);
						for (int i = 0;i<=nodes.getLength();i++) {
							Node a = nodes.item(i);
							//System.out.println(nodes.getLength());
							if (a != null && nodes.item(i).getTextContent().toLowerCase().contains(action.toLowerCase())) {
								//Vector<Node> subnodes=journey1.getNode();
								NodeList subnodes=a.getChildNodes();
								for (int j =0; j<subnodes.getLength();j++) {
									if (subnodes.item(j)!=null && subnodes.item(j).getNodeName()=="title") {
										plac.add(subnodes.item(j).getTextContent());
										beannode.add(a);
									}
								}
								}
						}
						//System.out.println("This file contains "+nodelist.getLength()+" <article> elements!");
						//journey1.setPlaces(places1);
						journey1.setPlaces(plac);
						journey1.setNode(beannode);
					}
					
				}
				catch (Exception e){
					e.printStackTrace(System.err);
				}
		 }
		 else {
			 JourneyBean journey1 = (JourneyBean) request.getSession().getAttribute("journey1");
			 journey1.setPlaces(null);
		 }
		 if (dt != null) {
			 //System.out.println("zhe jiu dui le");
			 JourneyBean det = (JourneyBean) request.getSession().getAttribute("detail");
			 Vector<String> plac=new Vector<String>();
			 plac.add(dt);
			 det.setString(num);
			 det.setPlaces(plac);
		 }
			
		
	 if (check != null) {
		JourneyBean journey1 = (JourneyBean) request.getSession().getAttribute("journey1");
		JourneyBean det = (JourneyBean) request.getSession().getAttribute("detail");
		Node node1=journey1.getNode().elementAt(Integer.parseInt(det.getString()));
		JourneyBean cart = (JourneyBean) request.getSession().getAttribute("cart");
		Vector<Node> ca=cart.getNode();
		boolean is=false;
		for (int i=0;i<ca.size();i++) {
			if (ca.elementAt(i)==node1) {
				is=true;
				break;
			}
		}
		if (!is) {
			ca.add(node1);
			cart.setNode(ca);
		}
	 }
	 if (delete!=null) {
		 JourneyBean cart = (JourneyBean) request.getSession().getAttribute("cart");
		 Vector<Node> ca=cart.getNode();
		 if (!ca.isEmpty()) {
			 ca.remove(Integer.parseInt(delete));
			 cart.setNode(ca);
		 }
	 }
	 RequestDispatcher rd = request.getRequestDispatcher("/"+nextPage);
	 rd.forward(request, response);
	}
}
