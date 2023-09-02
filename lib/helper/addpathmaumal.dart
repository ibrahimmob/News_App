
import 'package:newsapi/catogry/catogry.dart';

class ApiCategory{

  List<CategoryModel> category =[];
 List<CategoryModel> getCategories(){

   CategoryModel categories = CategoryModel();
   categories.title="health";
   categories.urlToImage="https://wtop.com/wp-content/uploads/2023/08/cbsn-fusion-doctors-warn-covid-hospitalizations-are-spiking-thumbnail-2172101-640x360-1.jpg";
   category.add(categories);

   categories=CategoryModel();
   categories.title="business";
   categories.urlToImage="https://i.insider.com/64e7a163a7adf70019075b73?width=1200&format=jpeg";
   category.add(categories);


   categories=CategoryModel();
   categories.title="entertainment";
   categories.urlToImage="https://media.cnn.com/api/v1/images/stellar/prod/230826163114-02-jacksonville-shooting-082623-still.jpg?c=16x9&q=w_800,c_fill";
   category.add(categories);

   categories=CategoryModel();
   categories.title="science";
   categories.urlToImage="https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/S2Y5JE45K3H3ERGLQSUDAJLL2U_size-normalized.jpg&w=1440";
   category.add(categories);

   categories=CategoryModel();
   categories.title="technology";
   categories.urlToImage="https://cdn.vox-cdn.com/thumbor/rE1yBNCacywxPoPXYhOmgCy72S4=/0x0:2594x1496/1200x628/filters:focal(1297x748:1298x749)/cdn.vox-cdn.com/uploads/chorus_asset/file/24875918/Screenshot_2023_08_26_at_4.25.23_PM.png";
   category.add(categories);

   categories=CategoryModel();
   categories.title="sports";
   categories.urlToImage=""
       "https://assets3.cbsnewsstatic.com/hub/i/r/2023/08/27/e8badaa0-3de3-40e9-ba0a-1765186bf955/thumbnail/1200x630/7762ef385e1df2a6e43c7b35d87c241b/gettyimages-1641554377.jpg?v=85153828b1c3c07a041ab8e73ff87e39";
   category.add(categories);
    return category;
  }
}