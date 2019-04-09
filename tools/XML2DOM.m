function [VarStruct,msg] = XML2DOM(value)

    if strcmp(value,'ReadVariantsFromXML') 
        xDoc = xmlread(fullfile('varinfo.xml'));
        allListitems = xDoc.getElementsByTagName('listitem');

        for k = 0:allListitems.getLength-1

           thisListitem = allListitems.item(k);

           % Get the label element. In this file, each
           % listitem contains only one label.
           thisList = thisListitem.getElementsByTagName('label');
           %thisElement = thisList.item(0);

           % Check whether this is the label you want.
           % The text is in the first child node.
           %if strcmp(thisElement.getFirstChild.getData, findLabel)
           thisList = thisListitem.getElementsByTagName('label');
           thisElement = thisList.item(0);
           VarStruct(k+1).Name = char(thisElement.getFirstChild.getData);
           thisList = thisListitem.getElementsByTagName('value');
           thisElement = thisList.item(0);
           VarStruct(k+1).Value = (thisElement.getFirstChild.getData);
           
           msg = 'Variants Read Successfully From XML';
           
        end
    else
         VarStruct = struct('Name','','Value','');
         msg = 'Variants Not Read From XML';        
    end
    
end
			   