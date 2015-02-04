import QtQuick 1.1
import "components"

Item {
    id: mainView
    width: 480
    height: 272
     Rectangle {
         id: page
         width: 480; height: 272
         color: "lightgray"

         Text {
             id: helloText
             text: "Copy MFG Image to NAND"
             y: 30
             anchors.horizontalCenter: page.horizontalCenter
             font.pointSize: 24; font.bold: true
         }

         Rectangle {
            width: 150
            height: 75
            color: "grey"
            y: 100
            anchors.horizontalCenter: page.horizontalCenter

            Text {
		id: buttonText 
                anchors.centerIn: parent
                text: "Copy"
            }
   
           MouseArea {
              anchors.fill: parent
              onClicked: {
			parent.color = "blue";
			buttonText.text = "Working"
			var test = system.execute("/application/src/do_upgrade.sh")
			console.log(test);
			helloText.text = "Finished. Insert boot jumper and reboot."			
			parent.color = "grey";
			buttonText.text = "Copy";
	      }
           }
		System {
			id: system
		}
        }
     }
}

