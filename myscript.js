function loadXMLDoc(filename)
{
if (window.ActiveXObject)
  {
  xhttp = new ActiveXObject("Msxml2.XMLHTTP");
  }
else 
  {
  xhttp = new XMLHttpRequest();
  }
xhttp.open("GET", filename, false);
try {xhttp.responseType = "ms-document"} catch(err) {} // Helping IE11
xhttp.send("");
return xhttp.responseXML;
}
    
    
function displayResult()
{
xml = loadXMLDoc("status.xml");
xsl = loadXMLDoc("myxsl.xsl");
// code for IE
if (window.ActiveXObject || xhttp.responseType == "ms-document")
  {
  ex = xml.transformNode(xsl);

    var newItem = document.createElement("LI");
    var textnode = document.createTextNode("Version" + 0);
    newItem.appendChild(textnode);
    newItem.appendChild(ex);

  document.getElementById("example").appendChild(newItem);
  }
// code for Chrome, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
  {
  xsltProcessor = new XSLTProcessor();
  xsltProcessor.importStylesheet(xsl);
  resultDocument = xsltProcessor.transformToFragment(xml, document);
    var newItem = document.createElement("LI");
    var textnode = document.createTextNode("Version" + 0);
    newItem.appendChild(textnode);
    newItem.appendChild(resultDocument);
    document.getElementById("example").appendChild(newItem);
  }
}

var inter = setInterval(insertResult, 60000);
var number = 0;



var countDownDate = new Date().getTime();

var x = setInterval(function() {

	// Get todays date and time
	var now = new Date().getTime();

	// Find the distance
	var distance = now - countDownDate;

	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	var seconds = Math.floor((distance % (1000 * 60)) / 1000);

	// Output the result in an element with id="demo"
	document.getElementById("timer").innerHTML = minutes + "m " + seconds + "s ";

}, 1000);

    
function insertResult()
{
xml = loadXMLDoc("status.xml");
xsl = loadXMLDoc("myxsl.xsl");
// code for IE
if (window.ActiveXObject || xhttp.responseType == "msxml-document")
  {
  ex = xml.transformNode(xsl);

    var newItem = document.createElement("LI");
    var textnode = document.createTextNode("Version" + 0);
    newItem.appendChild(textnode);
    newItem.appendChild(ex);

  document.getElementById("example").appendChild(newItem);

  }
// code for Chrome, Firefox, Opera, etc.
else if (document.implementation && document.implementation.createDocument)
  {
  xsltProcessor = new XSLTProcessor();
  xsltProcessor.importStylesheet(xsl);
  resultDocument = xsltProcessor.transformToFragment(xml, document);
//  document.getElementById("example").appendChild(resultDocument);
    var newItem = document.createElement("LI");
      number = number + 1; 
      var textnode = document.createTextNode("Version" + number);
      newItem.appendChild(textnode);
      newItem.appendChild(resultDocument);
      var list = document.getElementById("example");
      list.replaceChild(newItem, list.childNodes[1]);
  }
}

