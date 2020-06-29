# MobileChallenge2
RequestHandler - Delegate Class where http request is handled
  delegate method for urlsession
  Read json file form nsbundle
  Json serialisation
  

TableCell - Created custom cell for Listing

Utilities - Constant file for macros like baseurl , parameters etc.

ViewController - To Display List.
   It has pull to refresh feature in table
   Null string handler
   Internet connection handler
   3rd party usuage of SDWebImage via pods to download image in background
   
   
Detail View Controller - To Display details of image. 
   Portfolio link is clickable.
   download image via dispatch block in background
   Indicator view till the image is not loaded
   

JsonResponse.json - UNSPLASH API sometime provides invalid json which is not parsable.
So i had handled error and read Json from local to run the project and show my work on list and detail page.


PODS is used to implement 3rd party to download image
