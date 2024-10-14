FasdUAS 1.101.10   ��   ��    k             l     ��  ��    , & DEVONthink Notes from PDF Annotations     � 	 	 L   D E V O N t h i n k   N o t e s   f r o m   P D F   A n n o t a t i o n s   
  
 l     ��  ��    2 , version 1.0, licensed under the MIT license     �   X   v e r s i o n   1 . 0 ,   l i c e n s e d   u n d e r   t h e   M I T   l i c e n s e      l     ��������  ��  ��        l     ��  ��    B < by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de     �   x   b y   M a t t h i a s   S t e f f e n s ,   k e y p o i n t s . a p p ,   m a t ( a t ) e x t r a c t s ( d o t ) d e      l     ��������  ��  ��        l     ��  ��    o i For each of the PDFs selected in DEVONthink, this script will iterate over its contained PDF annotations     �   �   F o r   e a c h   o f   t h e   P D F s   s e l e c t e d   i n   D E V O N t h i n k ,   t h i s   s c r i p t   w i l l   i t e r a t e   o v e r   i t s   c o n t a i n e d   P D F   a n n o t a t i o n s      l     ��   ��    Q K and create or update a Markdown record for each markup or text annotation.      � ! ! �   a n d   c r e a t e   o r   u p d a t e   a   M a r k d o w n   r e c o r d   f o r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n .   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & l f This script requires macOS 10.14 (High Sierra) or greater, the KeypointsScriptingLib v1.3 or greater,    ' � ( ( �   T h i s   s c r i p t   r e q u i r e s   m a c O S   1 0 . 1 4   ( H i g h   S i e r r a )   o r   g r e a t e r ,   t h e   K e y p o i n t s S c r i p t i n g L i b   v 1 . 3   o r   g r e a t e r , %  ) * ) l     �� + ,��   + g a and DEVONthink Pro v3.x or greater (DEVONthink Pro v3.9 or greater will be required to have deep    , � - - �   a n d   D E V O N t h i n k   P r o   v 3 . x   o r   g r e a t e r   ( D E V O N t h i n k   P r o   v 3 . 9   o r   g r e a t e r   w i l l   b e   r e q u i r e d   t o   h a v e   d e e p *  . / . l     �� 0 1��   0 0 * links to PDF annotations work correctly).    1 � 2 2 T   l i n k s   t o   P D F   a n n o t a t i o n s   w o r k   c o r r e c t l y ) . /  3 4 3 l     ��������  ��  ��   4  5 6 5 l     ��������  ��  ��   6  7 8 7 l     �� 9 :��   9   Setup:    : � ; ;    S e t u p : 8  < = < l     ��������  ��  ��   =  > ? > l     �� @ A��   @ s m -- Before running the script, do this once: Adjust the DEVONthink label <-> color mapping via the properties    A � B B �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   d o   t h i s   o n c e :   A d j u s t   t h e   D E V O N t h i n k   l a b e l   < - >   c o l o r   m a p p i n g   v i a   t h e   p r o p e r t i e s ?  C D C l     �� E F��   E B <     `label1` ... `label7` below and save this script again.    F � G G x           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w   a n d   s a v e   t h i s   s c r i p t   a g a i n . D  H I H l     ��������  ��  ��   I  J K J l     �� L M��   L t n -- You may also want to check the other properties below. These allow to customize the script, e.g. to enable    M � N N �   - -   Y o u   m a y   a l s o   w a n t   t o   c h e c k   t h e   o t h e r   p r o p e r t i e s   b e l o w .   T h e s e   a l l o w   t o   c u s t o m i z e   t h e   s c r i p t ,   e . g .   t o   e n a b l e K  O P O l     �� Q R��   Q L F     updating of existing notes, or automatic fetching of BibTeX data.    R � S S �           u p d a t i n g   o f   e x i s t i n g   n o t e s ,   o r   a u t o m a t i c   f e t c h i n g   o f   B i b T e X   d a t a . P  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X u o -- Copy the script to a suitable place, like the DEVONthink script folder, or the system's script menu folder.    Y � Z Z �   - -   C o p y   t h e   s c r i p t   t o   a   s u i t a b l e   p l a c e ,   l i k e   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   o r   t h e   s y s t e m ' s   s c r i p t   m e n u   f o l d e r . W  [ \ [ l     �� ] ^��   ] N H     For a guide on how to enable and use the system's script menu, see:    ^ � _ _ �           F o r   a   g u i d e   o n   h o w   t o   e n a b l e   a n d   u s e   t h e   s y s t e m ' s   s c r i p t   m e n u ,   s e e : \  ` a ` l     �� b c��   b ? 9     https://iworkautomation.com/numbers/script-menu.html    c � d d r           h t t p s : / / i w o r k a u t o m a t i o n . c o m / n u m b e r s / s c r i p t - m e n u . h t m l a  e f e l     ��������  ��  ��   f  g h g l     �� i j��   i q k -- If you've placed your script into the DEVONthink script folder, you may also append a keyboard shortcut    j � k k �   - -   I f   y o u ' v e   p l a c e d   y o u r   s c r i p t   i n t o   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   y o u   m a y   a l s o   a p p e n d   a   k e y b o a r d   s h o r t c u t h  l m l l     �� n o��   n t n     description (like `___Command-Shift-Alt-A`) to the script's name. After restarting DEVONthink, you should    o � p p �           d e s c r i p t i o n   ( l i k e   ` _ _ _ C o m m a n d - S h i f t - A l t - A ` )   t o   t h e   s c r i p t ' s   n a m e .   A f t e r   r e s t a r t i n g   D E V O N t h i n k ,   y o u   s h o u l d m  q r q l     �� s t��   s J D     be able to run your script via the specified keyboard shortcut.    t � u u �           b e   a b l e   t o   r u n   y o u r   s c r i p t   v i a   t h e   s p e c i f i e d   k e y b o a r d   s h o r t c u t . r  v w v l     ��������  ��  ��   w  x y x l     ��������  ��  ��   y  z { z l     �� | }��   |   Run script:    } � ~ ~    R u n   s c r i p t : {   �  l     ��������  ��  ��   �  � � � l     �� � ���   � n h -- Before running the script, please select one or more PDF records with PDF annotations in DEVONthink.    � � � � �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   p l e a s e   s e l e c t   o n e   o r   m o r e   P D F   r e c o r d s   w i t h   P D F   a n n o t a t i o n s   i n   D E V O N t h i n k . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- To run the script, select its menu entry from the (DEVONthink or system's) script menu, or press your    � � � � �   - -   T o   r u n   t h e   s c r i p t ,   s e l e c t   i t s   m e n u   e n t r y   f r o m   t h e   ( D E V O N t h i n k   o r   s y s t e m ' s )   s c r i p t   m e n u ,   o r   p r e s s   y o u r �  � � � l     �� � ���   � ' !     specified keyboard shortcut.    � � � � B           s p e c i f i e d   k e y b o a r d   s h o r t c u t . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- After the script has finished, you'll see a dialog with feedback on how many PDFs have been processed    � � � � �   - -   A f t e r   t h e   s c r i p t   h a s   f i n i s h e d ,   y o u ' l l   s e e   a   d i a l o g   w i t h   f e e d b a c k   o n   h o w   m a n y   P D F s   h a v e   b e e n   p r o c e s s e d �  � � � l     �� � ���   � m g     and how many note records have been created/updated. For each PDF, its annotation notes are stored    � � � � �           a n d   h o w   m a n y   n o t e   r e c o r d s   h a v e   b e e n   c r e a t e d / u p d a t e d .   F o r   e a c h   P D F ,   i t s   a n n o t a t i o n   n o t e s   a r e   s t o r e d �  � � � l     �� � ���   � m g     within a DEVONthink group next to the PDF. By default, the group is named identical to the PDF but    � � � � �           w i t h i n   a   D E V O N t h i n k   g r o u p   n e x t   t o   t h e   P D F .   B y   d e f a u l t ,   t h e   g r o u p   i s   n a m e d   i d e n t i c a l   t o   t h e   P D F   b u t �  � � � l     �� � ���   � / )     contains an " � Annotations" suffix.    � � � � R           c o n t a i n s   a n   "      A n n o t a t i o n s "   s u f f i x . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � m g -- Note that you can run the script multiple times with the same PDF record(s) selected in DEVONthink.    � � � � �   - -   N o t e   t h a t   y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k . �  � � � l     �� � ���   � n h     On a subsequent run of the script, all notes that were newly created (or updated) will be selected.    � � � � �           O n   a   s u b s e q u e n t   r u n   o f   t h e   s c r i p t ,   a l l   n o t e s   t h a t   w e r e   n e w l y   c r e a t e d   ( o r   u p d a t e d )   w i l l   b e   s e l e c t e d . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Notes:    � � � �    N o t e s : �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � | v -- The script will only recognize these annotation types: "Highlight", "StrikeOut", "Underline", "Squiggly" & "Text".    � � � � �   - -   T h e   s c r i p t   w i l l   o n l y   r e c o g n i z e   t h e s e   a n n o t a t i o n   t y p e s :   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y "   &   " T e x t " . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � u o -- For each selected PDF with PDF annotations, the script will create a DEVONthink group next to it containing    � � � � �   - -   F o r   e a c h   s e l e c t e d   P D F   w i t h   P D F   a n n o t a t i o n s ,   t h e   s c r i p t   w i l l   c r e a t e   a   D E V O N t h i n k   g r o u p   n e x t   t o   i t   c o n t a i n i n g �  � � � l     �� � ���   � y s     Markdown record(s) for all recognized PDF annotation(s). The group's name can be controlled via the properties    � � � � �           M a r k d o w n   r e c o r d ( s )   f o r   a l l   r e c o g n i z e d   P D F   a n n o t a t i o n ( s ) .   T h e   g r o u p ' s   n a m e   c a n   b e   c o n t r o l l e d   v i a   t h e   p r o p e r t i e s �  � � � l     �� � ���   � A ;     `noteFolderNamePrefix` & `noteFolderNameSuffix` below.    � � � � v           ` n o t e F o l d e r N a m e P r e f i x `   &   ` n o t e F o l d e r N a m e S u f f i x `   b e l o w . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � v p -- You can run the script multiple times with the same PDF record(s) selected in DEVONthink. If PDF annotations    � � � � �   - -   Y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k .   I f   P D F   a n n o t a t i o n s �  � � � l     �� � ���   � { u     have been added to the PDF file after the last script run, the next script run will add Markdown records for the    � � � � �           h a v e   b e e n   a d d e d   t o   t h e   P D F   f i l e   a f t e r   t h e   l a s t   s c r i p t   r u n ,   t h e   n e x t   s c r i p t   r u n   w i l l   a d d   M a r k d o w n   r e c o r d s   f o r   t h e �  � � � l     �� � ���   � z t     newly created PDF annotations. Note that deletions will not get synced across. If existing PDF annotations have    � � � � �           n e w l y   c r e a t e d   P D F   a n n o t a t i o n s .   N o t e   t h a t   d e l e t i o n s   w i l l   n o t   g e t   s y n c e d   a c r o s s .   I f   e x i s t i n g   P D F   a n n o t a t i o n s   h a v e �  � � � l     �� � ���   � y s     been updated the script can update the corresponding Markdown records. While this is off by default, it can be    � � � � �           b e e n   u p d a t e d   t h e   s c r i p t   c a n   u p d a t e   t h e   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d s .   W h i l e   t h i s   i s   o f f   b y   d e f a u l t ,   i t   c a n   b e �  � � � l     �� � ���   � { u     enabled by setting below property `updateExistingNotes` to `true`. In that case, these properties can be updated    � � � � �           e n a b l e d   b y   s e t t i n g   b e l o w   p r o p e r t y   ` u p d a t e E x i s t i n g N o t e s `   t o   ` t r u e ` .   I n   t h a t   c a s e ,   t h e s e   p r o p e r t i e s   c a n   b e   u p d a t e d �  � � � l     �� � ���   � x r     (if enabled below): name, note text, modification date, flagged status, rating, label, tags, custom metadata.    � � � � �           ( i f   e n a b l e d   b e l o w ) :   n a m e ,   n o t e   t e x t ,   m o d i f i c a t i o n   d a t e ,   f l a g g e d   s t a t u s ,   r a t i n g ,   l a b e l ,   t a g s ,   c u s t o m   m e t a d a t a . �  � � � l     �� � ���   � ~ x     Note that if you change a PDF annotation's annotation type (say, from "Highlight" to "Underline"), this will always    � � � � �           N o t e   t h a t   i f   y o u   c h a n g e   a   P D F   a n n o t a t i o n ' s   a n n o t a t i o n   t y p e   ( s a y ,   f r o m   " H i g h l i g h t "   t o   " U n d e r l i n e " ) ,   t h i s   w i l l   a l w a y s �  � � � l     �� � ���   � &       create a new Markdown note.    � � � � @           c r e a t e   a   n e w   M a r k d o w n   n o t e . �  �  � l     ��������  ��  ��     l     ����   w q -- If possible, the PDF annotation's source text will get added to the body text of the Markdown record. However    � �   - -   I f   p o s s i b l e ,   t h e   P D F   a n n o t a t i o n ' s   s o u r c e   t e x t   w i l l   g e t   a d d e d   t o   t h e   b o d y   t e x t   o f   t h e   M a r k d o w n   r e c o r d .   H o w e v e r  l     ��	��   z t     note that, depending on the tool used for PDF annotation, this may fail or be inaccurate. In that case, you may   	 �

 �           n o t e   t h a t ,   d e p e n d i n g   o n   t h e   t o o l   u s e d   f o r   P D F   a n n o t a t i o n ,   t h i s   m a y   f a i l   o r   b e   i n a c c u r a t e .   I n   t h a t   c a s e ,   y o u   m a y  l     ����   v p     improve text extraction success by tweaking the properties `lineWidthEnlargement` & `lineHeightEnlargement`    � �           i m p r o v e   t e x t   e x t r a c t i o n   s u c c e s s   b y   t w e a k i n g   t h e   p r o p e r t i e s   ` l i n e W i d t h E n l a r g e m e n t `   &   ` l i n e H e i g h t E n l a r g e m e n t `  l     ����         below.    �            b e l o w .  l     ��������  ��  ��    l     ����   w q -- Notes that have been added to a PDF annotation will also get added to the Markdown record's body text. Within    � �   - -   N o t e s   t h a t   h a v e   b e e n   a d d e d   t o   a   P D F   a n n o t a t i o n   w i l l   a l s o   g e t   a d d e d   t o   t h e   M a r k d o w n   r e c o r d ' s   b o d y   t e x t .   W i t h i n  l     ����   { u     a PDF annotation note, you can use following (Keypoints-style) syntax to explicitly set the name of the Markdown    �   �           a   P D F   a n n o t a t i o n   n o t e ,   y o u   c a n   u s e   f o l l o w i n g   ( K e y p o i n t s - s t y l e )   s y n t a x   t o   e x p l i c i t l y   s e t   t h e   n a m e   o f   t h e   M a r k d o w n !"! l     ��#$��  # ( "     record and/or its properties:   $ �%% D           r e c o r d   a n d / o r   i t s   p r o p e r t i e s :" &'& l     ��()��  ( x r     - A line prefixed with `# ` (like a Markdown first-level heading) will be used as the Markdown record's name.   ) �** �           -   A   l i n e   p r e f i x e d   w i t h   ` #   `   ( l i k e   a   M a r k d o w n   f i r s t - l e v e l   h e a d i n g )   w i l l   b e   u s e d   a s   t h e   M a r k d o w n   r e c o r d ' s   n a m e .' +,+ l     ��-.��  - v p     - One or more line(s) prefixed with `< ` indicate a metadata line which will get stripped from the record's   . �// �           -   O n e   o r   m o r e   l i n e ( s )   p r e f i x e d   w i t h   ` <   `   i n d i c a t e   a   m e t a d a t a   l i n e   w h i c h   w i l l   g e t   s t r i p p e d   f r o m   t h e   r e c o r d ' s, 010 l     ��23��  2 E ?        body text but which will set record properties instead:   3 �44 ~                 b o d y   t e x t   b u t   w h i c h   w i l l   s e t   r e c o r d   p r o p e r t i e s   i n s t e a d :1 565 l     ��78��  7 z t        - In a metadata line, include 1 to 5 asterisks or `?`characters to set the record's star-rating, for example   8 �99 �                 -   I n   a   m e t a d a t a   l i n e ,   i n c l u d e   1   t o   5   a s t e r i s k s   o r   `& ` c h a r a c t e r s   t o   s e t   t h e   r e c o r d ' s   s t a r - r a t i n g ,   f o r   e x a m p l e6 :;: l     ��<=��  < K E          `< ****` would set a 4-star rating for the Markdown record.   = �>> �                     ` <   * * * * `   w o u l d   s e t   a   4 - s t a r   r a t i n g   f o r   t h e   M a r k d o w n   r e c o r d .; ?@? l     ��AB��  A x r        - In a metadata line, add the special tag `@:flagged` to set the Markdown record's flagged status to true.   B �CC �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   t h e   s p e c i a l   t a g   ` @ : f l a g g e d `   t o   s e t   t h e   M a r k d o w n   r e c o r d ' s   f l a g g e d   s t a t u s   t o   t r u e .@ DED l     ��FG��  F w q        - In a metadata line, add any tags like `@tag` or `@another tag` to set these as the tags of the Markdown   G �HH �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   t a g s   l i k e   ` @ t a g `   o r   ` @ a n o t h e r   t a g `   t o   s e t   t h e s e   a s   t h e   t a g s   o f   t h e   M a r k d o w nE IJI l     ��KL��  K            record.   L �MM "                     r e c o r d .J NON l     ��PQ��  P v p        - In a metadata line, add any custom key:value attributes like `@:key:Some value` to set these as custom   Q �RR �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   c u s t o m   k e y : v a l u e   a t t r i b u t e s   l i k e   ` @ : k e y : S o m e   v a l u e `   t o   s e t   t h e s e   a s   c u s t o mO STS l     ��UV��  U w q          metadata of the Markdown record. A custom attribute w/o a value (like `@:key`) will get a default value   V �WW �                     m e t a d a t a   o f   t h e   M a r k d o w n   r e c o r d .   A   c u s t o m   a t t r i b u t e   w / o   a   v a l u e   ( l i k e   ` @ : k e y ` )   w i l l   g e t   a   d e f a u l t   v a l u eT XYX l     ��Z[��  Z            of `true`.   [ �\\ (                     o f   ` t r u e ` .Y ]^] l     ��_`��  _ p j        Note that you can also include any/all of these properties on a single metadata line, for example:   ` �aa �                 N o t e   t h a t   y o u   c a n   a l s o   i n c l u d e   a n y / a l l   o f   t h e s e   p r o p e r t i e s   o n   a   s i n g l e   m e t a d a t a   l i n e ,   f o r   e x a m p l e :^ bcb l     �de�  d C =        `< **** @:flagged @tag @another tag @:key:Some value`   e �ff z                 ` <   * * * *   @ : f l a g g e d   @ t a g   @ a n o t h e r   t a g   @ : k e y : S o m e   v a l u e `c ghg l     �~�}�|�~  �}  �|  h iji l     �{kl�{  k { u -- For your PDF record, as well as for each of the created Markdown records, a link to the "... � Annotations" group   l �mm �   - -   F o r   y o u r   P D F   r e c o r d ,   a s   w e l l   a s   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s ,   a   l i n k   t o   t h e   " . . .      A n n o t a t i o n s "   g r o u pj non l     �zpq�z  p { u     folder will be copied to a custom metadata field (named `pdfannotations`). This allows you to easily get back to   q �rr �           f o l d e r   w i l l   b e   c o p i e d   t o   a   c u s t o m   m e t a d a t a   f i e l d   ( n a m e d   ` p d f a n n o t a t i o n s ` ) .   T h i s   a l l o w s   y o u   t o   e a s i l y   g e t   b a c k   t oo sts l     �yuv�y  u / )     the PDF's group of annotation notes.   v �ww R           t h e   P D F ' s   g r o u p   o f   a n n o t a t i o n   n o t e s .t xyx l     �x�w�v�x  �w  �v  y z{z l     �u|}�u  | x r -- The URL field of each Markdown record will be set to a deep link that directly points to the corresponding PDF   } �~~ �   - -   T h e   U R L   f i e l d   o f   e a c h   M a r k d o w n   r e c o r d   w i l l   b e   s e t   t o   a   d e e p   l i n k   t h a t   d i r e c t l y   p o i n t s   t o   t h e   c o r r e s p o n d i n g   P D F{ � l     �t���t  � } w     annotation. I.e., clicking this deep link will open the associated PDF and scroll the corresponding PDF annotation   � ��� �           a n n o t a t i o n .   I . e . ,   c l i c k i n g   t h i s   d e e p   l i n k   w i l l   o p e n   t h e   a s s o c i a t e d   P D F   a n d   s c r o l l   t h e   c o r r e s p o n d i n g   P D F   a n n o t a t i o n� ��� l     �s���s  � H B     into view. Note that this requires DEVONthink 3.9 or greater.   � ��� �           i n t o   v i e w .   N o t e   t h a t   t h i s   r e q u i r e s   D E V O N t h i n k   3 . 9   o r   g r e a t e r .� ��� l     �r�q�p�r  �q  �p  � ��� l     �o���o  �  y -- For each Markdown record, the script will try to assign a color label that matches your annotation's highlight color.   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   t r y   t o   a s s i g n   a   c o l o r   l a b e l   t h a t   m a t c h e s   y o u r   a n n o t a t i o n ' s   h i g h l i g h t   c o l o r .� ��� l     �n���n  � x r     Note that, to suit your personal DEVONthink label setup, you'll need to adjust the mapping via the properties   � ��� �           N o t e   t h a t ,   t o   s u i t   y o u r   p e r s o n a l   D E V O N t h i n k   l a b e l   s e t u p ,   y o u ' l l   n e e d   t o   a d j u s t   t h e   m a p p i n g   v i a   t h e   p r o p e r t i e s� ��� l     �m���m  � ' !     `label1` ... `label7` below.   � ��� B           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w .� ��� l     �l�k�j�l  �k  �j  � ��� l     �i���i  � w q -- For each Markdown record, the script will also add an ID-like alias (like "039H-8GAB-1GPA") that's unique and   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   a l s o   a d d   a n   I D - l i k e   a l i a s   ( l i k e   " 0 3 9 H - 8 G A B - 1 G P A " )   t h a t ' s   u n i q u e   a n d� ��� l     �h���h  � y s     which optionally can be used to create a stable Wiki-link (like "[[039H-8GAB-1GPA]]") to this Markdown record.   � ��� �           w h i c h   o p t i o n a l l y   c a n   b e   u s e d   t o   c r e a t e   a   s t a b l e   W i k i - l i n k   ( l i k e   " [ [ 0 3 9 H - 8 G A B - 1 G P A ] ] " )   t o   t h i s   M a r k d o w n   r e c o r d .� ��� l     �g�f�e�g  �f  �e  � ��� l     �d���d  � v p -- If the PDF metadata contain a DOI, this DOI will get written to the `doi` custom metadata field for your PDF   � ��� �   - -   I f   t h e   P D F   m e t a d a t a   c o n t a i n   a   D O I ,   t h i s   D O I   w i l l   g e t   w r i t t e n   t o   t h e   ` d o i `   c u s t o m   m e t a d a t a   f i e l d   f o r   y o u r   P D F� ��� l     �c���c  � _ Y     record, the "... � Annotations" group, and for each of the created Markdown records.   � ��� �           r e c o r d ,   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .� ��� l     �b�a�`�b  �a  �`  � ��� l     �_���_  �  y -- Similarly, if the PDF record's custom metadata contain a citekey, this citekey will also get written to the `citekey`   � ��� �   - -   S i m i l a r l y ,   i f   t h e   P D F   r e c o r d ' s   c u s t o m   m e t a d a t a   c o n t a i n   a   c i t e k e y ,   t h i s   c i t e k e y   w i l l   a l s o   g e t   w r i t t e n   t o   t h e   ` c i t e k e y `� ��� l     �^���^  � q k     custom metadata field for the "... � Annotations" group, and for each of the created Markdown records.   � ��� �           c u s t o m   m e t a d a t a   f i e l d   f o r   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .� ��� l     �]�\�[�]  �\  �[  � ��� l     �Z���Z  � } w -- If a DOI was found for the PDF, the script will also attempt to fetch its bibliographic metadata and set the custom   � ��� �   - -   I f   a   D O I   w a s   f o u n d   f o r   t h e   P D F ,   t h e   s c r i p t   w i l l   a l s o   a t t e m p t   t o   f e t c h   i t s   b i b l i o g r a p h i c   m e t a d a t a   a n d   s e t   t h e   c u s t o m� ��� l     �Y���Y  � y s     metadata and/or the Finder comment of the "... � Annotations" group & its Markdown records accordingly. Please   � ��� �           m e t a d a t a   a n d / o r   t h e   F i n d e r   c o m m e n t   o f   t h e   " . . .      A n n o t a t i o n s "   g r o u p   &   i t s   M a r k d o w n   r e c o r d s   a c c o r d i n g l y .   P l e a s e� ��� l     �X���X  � W Q     see the properties below for options to disable or fine-tune this behaviour.   � ��� �           s e e   t h e   p r o p e r t i e s   b e l o w   f o r   o p t i o n s   t o   d i s a b l e   o r   f i n e - t u n e   t h i s   b e h a v i o u r .� ��� l     �W�V�U�W  �V  �U  � ��� l     �T�S�R�T  �S  �R  � ��� l     �Q���Q  �   Ideas for improvement:   � ��� .   I d e a s   f o r   i m p r o v e m e n t :� ��� l     �P�O�N�P  �O  �N  � ��� l     �M���M  � � � allow the script to be called by a smart rule (w/o displaying a feedback dialog once done and w/o selecting any updated records)   � ���   a l l o w   t h e   s c r i p t   t o   b e   c a l l e d   b y   a   s m a r t   r u l e   ( w / o   d i s p l a y i n g   a   f e e d b a c k   d i a l o g   o n c e   d o n e   a n d   w / o   s e l e c t i n g   a n y   u p d a t e d   r e c o r d s )� ��� l     �L���L  � q k offer a configuration option to specify which metadata shall get exported into which custom metadata field   � ��� �   o f f e r   a   c o n f i g u r a t i o n   o p t i o n   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l d� ��� l     �K���K  � f ` if just some DEVONthink groups were selected, allow to get all contained PDFs and process these   � ��� �   i f   j u s t   s o m e   D E V O N t h i n k   g r o u p s   w e r e   s e l e c t e d ,   a l l o w   t o   g e t   a l l   c o n t a i n e d   P D F s   a n d   p r o c e s s   t h e s e� ��� l     �J���J  � � � allow to optionally look-up the PDF file in a reference manager like Bookends and auto-fetch citekey & citation info from there   � ���    a l l o w   t o   o p t i o n a l l y   l o o k - u p   t h e   P D F   f i l e   i n   a   r e f e r e n c e   m a n a g e r   l i k e   B o o k e n d s   a n d   a u t o - f e t c h   c i t e k e y   &   c i t a t i o n   i n f o   f r o m   t h e r e� ��� l     �I���I  � k e improve the sort order of DEVONthink note records created for PDF annotations from the same PDF page   � ��� �   i m p r o v e   t h e   s o r t   o r d e r   o f   D E V O N t h i n k   n o t e   r e c o r d s   c r e a t e d   f o r   P D F   a n n o t a t i o n s   f r o m   t h e   s a m e   P D F   p a g e� ��� l     �H���H  � x r allow to (optionally) remove tags from Markdown records for PDF annotations whose corresponding tags were removed   � ��� �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   t a g s   f r o m   M a r k d o w n   r e c o r d s   f o r   P D F   a n n o t a t i o n s   w h o s e   c o r r e s p o n d i n g   t a g s   w e r e   r e m o v e d� ��� l     �G���G  � w q allow to (optionally) remove Markdown records from DEVONthink for PDF annotations that were deleted from the PDF   � ��� �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   M a r k d o w n   r e c o r d s   f r o m   D E V O N t h i n k   f o r   P D F   a n n o t a t i o n s   t h a t   w e r e   d e l e t e d   f r o m   t h e   P D F� ��� l     �F� �F  � i c support any annotation types other than "Highlight", "StrikeOut", "Underline", "Squiggly" & "Text"     � �   s u p p o r t   a n y   a n n o t a t i o n   t y p e s   o t h e r   t h a n   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y "   &   " T e x t "�  l     �E�E   0 * (see also inline TODOs in the code below)    � T   ( s e e   a l s o   i n l i n e   T O D O s   i n   t h e   c o d e   b e l o w )  l     �D�C�B�D  �C  �B   	
	 l     �A�@�?�A  �@  �?  
  l     �>�>   W Q ------------- optionally adopt the property values below this line -------------    � �   - - - - - - - - - - - - -   o p t i o n a l l y   a d o p t   t h e   p r o p e r t y   v a l u e s   b e l o w   t h i s   l i n e   - - - - - - - - - - - - -  l     �=�<�;�=  �<  �;    l     �:�9�8�:  �9  �8    l     �7�7   c ] Prefix prepended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.    � �   P r e f i x   p r e p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .  j     �6�6 ,0 notefoldernameprefix noteFolderNamePrefix m      �    l     �5�4�3�5  �4  �3    !  l     �2"#�2  " b \ Suffix appended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.   # �$$ �   S u f f i x   a p p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .! %&% j    �1'�1 ,0 notefoldernamesuffix noteFolderNameSuffix' m    (( �))       A n n o t a t i o n s& *+* l     �0�/�.�0  �/  �.  + ,-, l     �-./�-  . ` Z Maps DEVONthink label indexes to color names. Please set the `colorName` values according   / �00 �   M a p s   D E V O N t h i n k   l a b e l   i n d e x e s   t o   c o l o r   n a m e s .   P l e a s e   s e t   t h e   ` c o l o r N a m e `   v a l u e s   a c c o r d i n g- 121 l     �,34�,  3 d ^  to the label <-> color mapping that you've chosen in your DEVONthink Settings under "Color".   4 �55 �     t o   t h e   l a b e l   < - >   c o l o r   m a p p i n g   t h a t   y o u ' v e   c h o s e n   i n   y o u r   D E V O N t h i n k   S e t t i n g s   u n d e r   " C o l o r " .2 676 l     �+89�+  8 ] W E.g., if your "Color" settings specify a yellowish color for the first label, then use   9 �:: �   E . g . ,   i f   y o u r   " C o l o r "   s e t t i n g s   s p e c i f y   a   y e l l o w i s h   c o l o r   f o r   t h e   f i r s t   l a b e l ,   t h e n   u s e7 ;<; l     �*=>�*  = ` Z `{labelIndex:1, colorName:"yellow"}`. Note that each label must have a unique color name.   > �?? �   ` { l a b e l I n d e x : 1 ,   c o l o r N a m e : " y e l l o w " } ` .   N o t e   t h a t   e a c h   l a b e l   m u s t   h a v e   a   u n i q u e   c o l o r   n a m e .< @A@ l     �)BC�)  B c ] Available color names: red, orange, yellow, green, cyan, light blue, dark blue, purple, pink   C �DD �   A v a i l a b l e   c o l o r   n a m e s :   r e d ,   o r a n g e ,   y e l l o w ,   g r e e n ,   c y a n ,   l i g h t   b l u e ,   d a r k   b l u e ,   p u r p l e ,   p i n kA EFE j    �(G�( 
0 label1  G K    HH �'IJ�' 0 
labelindex 
labelIndexI m    �&�& J �%K�$�% 0 	colorname 	colorNameK m   	 
LL �MM  r e d�$  F NON j    �#P�# 
0 label2  P K    QQ �"RS�" 0 
labelindex 
labelIndexR m    �!�! S � T��  0 	colorname 	colorNameT m    UU �VV 
 g r e e n�  O WXW j    �Y� 
0 label3  Y K    ZZ �[\� 0 
labelindex 
labelIndex[ m    �� \ �]�� 0 	colorname 	colorName] m    ^^ �__  l i g h t   b l u e�  X `a` j    %�b� 
0 label4  b K    $cc �de� 0 
labelindex 
labelIndexd m     �� e �f�� 0 	colorname 	colorNamef m   ! "gg �hh  y e l l o w�  a iji j   & /�k� 
0 label5  k K   & .ll �mn� 0 
labelindex 
labelIndexm m   ' (�� n �o�� 0 	colorname 	colorNameo m   ) ,pp �qq  o r a n g e�  j rsr j   0 ;�t� 
0 label6  t K   0 :uu �vw� 0 
labelindex 
labelIndexv m   1 4�� w �x�� 0 	colorname 	colorNamex m   5 8yy �zz  d a r k   b l u e�  s {|{ j   < G�
}�
 
0 label7  } K   < F~~ �	��	 0 
labelindex 
labelIndex m   = @�� � ���� 0 	colorname 	colorName� m   A D�� ���  p u r p l e�  | ��� l     ����  �  �  � ��� l     ����  � h b Set to `true` if you want this script to update Markdown records that already exist in DEVONthink   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   u p d a t e   M a r k d o w n   r e c o r d s   t h a t   a l r e a d y   e x i s t   i n   D E V O N t h i n k� ��� l     ����  � j d for PDF annotations from your PDF file(s) and which were created on previous script runs. This will   � ��� �   f o r   P D F   a n n o t a t i o n s   f r o m   y o u r   P D F   f i l e ( s )   a n d   w h i c h   w e r e   c r e a t e d   o n   p r e v i o u s   s c r i p t   r u n s .   T h i s   w i l l� ��� l     � ���   � i c be only necessary if you've made changes to the PDF annotations (or their associated notes) within   � ��� �   b e   o n l y   n e c e s s a r y   i f   y o u ' v e   m a d e   c h a n g e s   t o   t h e   P D F   a n n o t a t i o n s   ( o r   t h e i r   a s s o c i a t e d   n o t e s )   w i t h i n� ��� l     ������  � 9 3 the PDF file after importing them into DEVONthink.   � ��� f   t h e   P D F   f i l e   a f t e r   i m p o r t i n g   t h e m   i n t o   D E V O N t h i n k .� ��� l     ������  �   Notes:   � ���    N o t e s :� ��� l     ������  � e _ - @warning Note that updating of existing notes may override any additions/changes that you've   � ��� �   -   @ w a r n i n g   N o t e   t h a t   u p d a t i n g   o f   e x i s t i n g   n o t e s   m a y   o v e r r i d e   a n y   a d d i t i o n s / c h a n g e s   t h a t   y o u ' v e� ��� l     ������  � 7 1    made to these Markdown records in DEVONthink.   � ��� b         m a d e   t o   t h e s e   M a r k d o w n   r e c o r d s   i n   D E V O N t h i n k .� ��� l     ������  � j d - See below properties to specify which attributes shall get updated and which shall be left alone.   � ��� �   -   S e e   b e l o w   p r o p e r t i e s   t o   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e .� ��� j   H J����� *0 updateexistingnotes updateExistingNotes� m   H I��
�� boovfals� ��� l     ��������  ��  ��  � ��� l     ������  � c ] When updating existing Markdown records, specify which attributes shall get updated (`true`)   � ��� �   W h e n   u p d a t i n g   e x i s t i n g   M a r k d o w n   r e c o r d s ,   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   ( ` t r u e ` )� ��� l     ������  � / ) and which shall be left alone (`false`).   � ��� R   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e   ( ` f a l s e ` ) .� ��� l     ������  �   Notes:   � ���    N o t e s :� ��� l     ������  � m g - Tags will only be added to any existing list of record tags, so these won't get replaced as a whole.   � ��� �   -   T a g s   w i l l   o n l y   b e   a d d e d   t o   a n y   e x i s t i n g   l i s t   o f   r e c o r d   t a g s ,   s o   t h e s e   w o n ' t   g e t   r e p l a c e d   a s   a   w h o l e .� ��� l     ������  � M G    Also, tags won't get removed from the existing list of record tags.   � ��� �         A l s o ,   t a g s   w o n ' t   g e t   r e m o v e d   f r o m   t h e   e x i s t i n g   l i s t   o f   r e c o r d   t a g s .� ��� l     ������  � d ^ - Custom metadata fields will also get added to any existing record metadata, and only fields   � ��� �   -   C u s t o m   m e t a d a t a   f i e l d s   w i l l   a l s o   g e t   a d d e d   t o   a n y   e x i s t i n g   r e c o r d   m e t a d a t a ,   a n d   o n l y   f i e l d s� ��� l     ������  � , &    of the same name may get replaced.   � ��� L         o f   t h e   s a m e   n a m e   m a y   g e t   r e p l a c e d .� ��� j   K M����� 80 updatenameforexistingnotes updateNameForExistingNotes� m   K L��
�� boovfals� ��� j   N P����� F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes� m   N O��
�� boovtrue� ��� j   Q S����� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes� m   Q R��
�� boovtrue� ��� j   T V����� J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes� m   T U��
�� boovtrue� ��� j   W Y����� <0 updateratingforexistingnotes updateRatingForExistingNotes� m   W X��
�� boovtrue� ��� j   Z \����� :0 updatelabelforexistingnotes updateLabelForExistingNotes� m   Z [��
�� boovtrue� ��� j   ] a����� 80 updatetagsforexistingnotes updateTagsForExistingNotes� m   ] ^��
�� boovtrue� ��� j   b f����� L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes� m   b c��
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � f ` Specify if custom metadata of the DEVONthink groups that host a PDF file's Markdown notes shall   � ��� �   S p e c i f y   i f   c u s t o m   m e t a d a t a   o f   t h e   D E V O N t h i n k   g r o u p s   t h a t   h o s t   a   P D F   f i l e ' s   M a r k d o w n   n o t e s   s h a l l� ��� l     ������  � l f get updated (`true`) or not (`false`). If set to `true`, this script may populate the custom metadata   � ��� �   g e t   u p d a t e d   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   s e t   t o   ` t r u e ` ,   t h i s   s c r i p t   m a y   p o p u l a t e   t h e   c u s t o m   m e t a d a t a� ��� l     ������  � j d properties `sourcefile`, `citekey` & `doi`, as well as any bibliographic metadata that were fetched   � ��� �   p r o p e r t i e s   ` s o u r c e f i l e ` ,   ` c i t e k e y `   &   ` d o i ` ,   a s   w e l l   a s   a n y   b i b l i o g r a p h i c   m e t a d a t a   t h a t   w e r e   f e t c h e d� � � l     ����     for a DOI (see below).    � .   f o r   a   D O I   ( s e e   b e l o w ) .   j   g k���� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders m   g h��
�� boovtrue  l     ��������  ��  ��   	
	 l     ����   i c Set to `true` if you want this script to select all records that were actually created or updated.    � �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   s e l e c t   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   c r e a t e d   o r   u p d a t e d .
  j   l p���� ,0 selectupdatedrecords selectUpdatedRecords m   l m��
�� boovtrue  l     ��������  ��  ��    l     ����   j d Set to `true` if you want this script to fetch bibliographic metadata for a PDF's DOI via an online    � �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I   v i a   a n   o n l i n e  l     ����   V P request to OpenAlex.org (and possibly further requests to CrossRef, see below).    � �   r e q u e s t   t o   O p e n A l e x . o r g   ( a n d   p o s s i b l y   f u r t h e r   r e q u e s t s   t o   C r o s s R e f ,   s e e   b e l o w ) .  l     �� ��   o i Note that setting this to `false` will disable all online requests, i.e. this will also prevent fetching     �!! �   N o t e   t h a t   s e t t i n g   t h i s   t o   ` f a l s e `   w i l l   d i s a b l e   a l l   o n l i n e   r e q u e s t s ,   i . e .   t h i s   w i l l   a l s o   p r e v e n t   f e t c h i n g "#" l     ��$%��  $ l f of BibTeX data & formatted citations even if the respective properties have been set to `true` below.   % �&& �   o f   B i b T e X   d a t a   &   f o r m a t t e d   c i t a t i o n s   e v e n   i f   t h e   r e s p e c t i v e   p r o p e r t i e s   h a v e   b e e n   s e t   t o   ` t r u e `   b e l o w .# '(' j   q u��)�� $0 fetchdoimetadata fetchDOIMetadata) m   q r��
�� boovtrue( *+* l     ��������  ��  ��  + ,-, l     ��./��  . j d Set to `true` if you want this script to _always_ fetch bibliographic metadata for a PDF's DOI, and   / �00 �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   _ a l w a y s _   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   a n d- 121 l     ��34��  3 h b not only once for each PDF (when creating the DEVONthink group that hosts the PDF file's Markdown   4 �55 �   n o t   o n l y   o n c e   f o r   e a c h   P D F   ( w h e n   c r e a t i n g   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n2 676 l     ��89��  8 o i notes). Usually, you'd want the latter (i.e. `false`). But setting this property (temporarily) to `true`   9 �:: �   n o t e s ) .   U s u a l l y ,   y o u ' d   w a n t   t h e   l a t t e r   ( i . e .   ` f a l s e ` ) .   B u t   s e t t i n g   t h i s   p r o p e r t y   ( t e m p o r a r i l y )   t o   ` t r u e `7 ;<; l     ��=>��  = i c can be useful to add or update bibliographic metadata for existing notes folders & Markdown notes.   > �?? �   c a n   b e   u s e f u l   t o   a d d   o r   u p d a t e   b i b l i o g r a p h i c   m e t a d a t a   f o r   e x i s t i n g   n o t e s   f o l d e r s   &   M a r k d o w n   n o t e s .< @A@ j   v z��B�� 00 alwaysfetchdoimetadata alwaysFetchDOIMetadataB m   v w��
�� boovfalsA CDC l     ��������  ��  ��  D EFE l     ��GH��  G e _ When fetching bibliographic metadata for a PDF's DOI, this script can also fetch corresponding   H �II �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   c o r r e s p o n d i n gF JKJ l     ��LM��  L ` Z BibTeX data (which will be copied to a custom ("bibtex") metadata field, and which can be   M �NN �   B i b T e X   d a t a   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " b i b t e x " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n   b eK OPO l     ��QR��  Q X R appended to the Finder comment of a created Markdown record as well (see below)).   R �SS �   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .P TUT l     ��VW��  V h b Set to `true` if you also want to fetch BibTeX data for the given DOI from CrossRef.org, else set   W �XX �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   B i b T e X   d a t a   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,   e l s e   s e tU YZY l     ��[\��  [ c ] to `false`. Note that this will cause an extra online request which may take a second or so.   \ �]] �   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   s e c o n d   o r   s o .Z ^_^ j   { ��`�� 0 fetchbibtex fetchBibTeX` m   { |��
�� boovfals_ aba l     ��������  ��  ��  b cdc l     ��ef��  e i c Set to `true` if you want this script to append the BibTeX data (that was fetched for a PDF's DOI)   f �gg �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   B i b T e X   d a t a   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s   D O I )d hih l     ��jk��  j < 6 to the Finder comment of the created Markdown record.   k �ll l   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .i mnm j   � ���o�� :0 appendbibtextofindercomment appendBibTeXToFinderCommento m   � ���
�� boovfalsn pqp l     ��������  ��  ��  q rsr l     ��tu��  t g a When fetching bibliographic metadata for a PDF's DOI, this script can also fetch a corresponding   u �vv �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   a   c o r r e s p o n d i n gs wxw l     ��yz��  y g a formatted citation (which will be copied to a custom ("reference") metadata field, and which can   z �{{ �   f o r m a t t e d   c i t a t i o n   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " r e f e r e n c e " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a nx |}| l     ��~��  ~ [ U be appended to the Finder comment of a created Markdown record as well (see below)).    ��� �   b e   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .} ��� l     ������  � h b Set to `true` if you also want to fetch a formatted citation for the given DOI from CrossRef.org,   � ��� �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   a   f o r m a t t e d   c i t a t i o n   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,� ��� l     ������  � k e else set to `false`. Note that this will cause an extra online request which may take a few seconds.   � ��� �   e l s e   s e t   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   f e w   s e c o n d s .� ��� j   � ������ 00 fetchformattedcitation fetchFormattedCitation� m   � ���
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � k e Set to `true` if you want this script to append the formatted citation (that was fetched for a PDF's   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   f o r m a t t e d   c i t a t i o n   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s� ��� l     ������  � A ; DOI) to the Finder comment of the created Markdown record.   � ��� v   D O I )   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .� ��� j   � ������ P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment� m   � ���
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � f ` The name of the citation style file (as obtained from https://www.zotero.org/styles) to be used   � ��� �   T h e   n a m e   o f   t h e   c i t a t i o n   s t y l e   f i l e   ( a s   o b t a i n e d   f r o m   h t t p s : / / w w w . z o t e r o . o r g / s t y l e s )   t o   b e   u s e d� ��� l     ������  � 2 , when generating a formatted citation, e.g.:   � ��� X   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :� ��� l     ������  � i c apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,   � ��� �   a p a   ( d e f a u l t ) ,   a p a - 6 t h - e d i t i o n ,   c h i c a g o - a u t h o r - d a t e ,   e l s e v i e r - h a r v a r d ,   s p r i n g e r - b a s i c - a u t h o r - d a t e ,� ��� l     ������  � 9 3 modern-language-association, vancouver-author-date   � ��� f   m o d e r n - l a n g u a g e - a s s o c i a t i o n ,   v a n c o u v e r - a u t h o r - d a t e� ��� j   � ������ &0 citationstylename citationStyleName� m   � ��� ���  a p a� ��� l     ��������  ��  ��  � ��� l     ������  � i c The locale code that specifies which localization data (term translations, localized date formats,   � ��� �   T h e   l o c a l e   c o d e   t h a t   s p e c i f i e s   w h i c h   l o c a l i z a t i o n   d a t a   ( t e r m   t r a n s l a t i o n s ,   l o c a l i z e d   d a t e   f o r m a t s ,� ��� l     ������  � U O and grammar options) shall be used when generating a formatted citation, e.g.:   � ��� �   a n d   g r a m m a r   o p t i o n s )   s h a l l   b e   u s e d   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :� ��� l     ������  � @ : en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN   � ��� t   e n - U S   ( d e f a u l t ) ,   e n - G B ,   f r - F R ,   e s - E S ,   d e - D E ,   r u - R U ,   z h - C N� ��� j   � ������  0 citationlocale citationLocale� m   � ��� ��� 
 e n - U S� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � W Q ----------- usually, you don't need to edit anything below this line -----------   � ��� �   - - - - - - - - - - -   u s u a l l y ,   y o u   d o n ' t   n e e d   t o   e d i t   a n y t h i n g   b e l o w   t h i s   l i n e   - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ����  � Z T Decimal numbers that specify how much the bounding box encompassing an annotation's   � ��� �   D e c i m a l   n u m b e r s   t h a t   s p e c i f y   h o w   m u c h   t h e   b o u n d i n g   b o x   e n c o m p a s s i n g   a n   a n n o t a t i o n ' s� ��� l     �~���~  � c ] individual line shall be enlarged vertically & horizontally so that it fully covers all text   � ��� �   i n d i v i d u a l   l i n e   s h a l l   b e   e n l a r g e d   v e r t i c a l l y   &   h o r i z o n t a l l y   s o   t h a t   i t   f u l l y   c o v e r s   a l l   t e x t� ��� l     �}���}  �    highlighted on that line.   � ��� 4   h i g h l i g h t e d   o n   t h a t   l i n e .� ��� l     �|���|  � e _ If you find that this script somehow fails to fully extract all of an annotation's text (or if   � ��� �   I f   y o u   f i n d   t h a t   t h i s   s c r i p t   s o m e h o w   f a i l s   t o   f u l l y   e x t r a c t   a l l   o f   a n   a n n o t a t i o n ' s   t e x t   ( o r   i f� ��� l     �{���{  � [ U it extracts too much) then you may want to adjust these decimal numbers (e.g. by 0.1   � ��� �   i t   e x t r a c t s   t o o   m u c h )   t h e n   y o u   m a y   w a n t   t o   a d j u s t   t h e s e   d e c i m a l   n u m b e r s   ( e . g .   b y   0 . 1� ��� l     �z���z  �   increments).   � ���    i n c r e m e n t s ) .� ��� l     �y���y  � a [ However, note that larger values will increase the likeliness that adjacent characters not   � ��� �   H o w e v e r ,   n o t e   t h a t   l a r g e r   v a l u e s   w i l l   i n c r e a s e   t h e   l i k e l i n e s s   t h a t   a d j a c e n t   c h a r a c t e r s   n o t� ��� l     �x �x    = 7 belonging to the annotation will get included as well.    � n   b e l o n g i n g   t o   t h e   a n n o t a t i o n   w i l l   g e t   i n c l u d e d   a s   w e l l .�  j   � ��w�w ,0 linewidthenlargement lineWidthEnlargement m   � � ?�ffffff  j   � ��v	�v .0 lineheightenlargement lineHeightEnlargement	 m   � �

 ?�333333  l     �u�t�s�u  �t  �s    l     �r�r   c ] Defines lower and upper hue limits for common colors. Limit values are inclusive and must be    � �   D e f i n e s   l o w e r   a n d   u p p e r   h u e   l i m i t s   f o r   c o m m o n   c o l o r s .   L i m i t   v a l u e s   a r e   i n c l u s i v e   a n d   m u s t   b e  l     �q�q   a [ given as degrees (0-359) of the hue in the HSB (hue, saturation, brightness) color scheme.    � �   g i v e n   a s   d e g r e e s   ( 0 - 3 5 9 )   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .  j   � ��p�p "0 redcolormapping redColorMapping K   � � �o�o 0 	colorname 	colorName m   � � �  r e d �n �n 0 lowerhuelimit lowerHueLimit m   � ��m�m^  �l!�k�l 0 upperhuelimit upperHueLimit! m   � ��j�j �k   "#" j   � ��i$�i (0 orangecolormapping orangeColorMapping$ K   � �%% �h&'�h 0 	colorname 	colorName& m   � �(( �))  o r a n g e' �g*+�g 0 lowerhuelimit lowerHueLimit* m   � ��f�f + �e,�d�e 0 upperhuelimit upperHueLimit, m   � ��c�c ,�d  # -.- j   � ��b/�b (0 yellowcolormapping yellowColorMapping/ K   � �00 �a12�a 0 	colorname 	colorName1 m   � �33 �44  y e l l o w2 �`56�` 0 lowerhuelimit lowerHueLimit5 m   � ��_�_ -6 �^7�]�^ 0 upperhuelimit upperHueLimit7 m   � ��\�\ A�]  . 898 j   �
�[:�[ &0 greencolormapping greenColorMapping: K   �;; �Z<=�Z 0 	colorname 	colorName< m   � �>> �?? 
 g r e e n= �Y@A�Y 0 lowerhuelimit lowerHueLimit@ m   � ��X�X BA �WB�V�W 0 upperhuelimit upperHueLimitB m   �U�U ��V  9 CDC j  "�TE�T $0 cyancolormapping cyanColorMappingE K  FF �SGH�S 0 	colorname 	colorNameG m  II �JJ  c y a nH �RKL�R 0 lowerhuelimit lowerHueLimitK m  �Q�Q �L �PM�O�P 0 upperhuelimit upperHueLimitM m  �N�N ��O  D NON j  #:�MP�M .0 lightbluecolormapping lightBlueColorMappingP K  #7QQ �LRS�L 0 	colorname 	colorNameR m  $'TT �UU  l i g h t   b l u eS �KVW�K 0 lowerhuelimit lowerHueLimitV m  *-�J�J �W �IX�H�I 0 upperhuelimit upperHueLimitX m  03�G�G ��H  O YZY j  ;R�F[�F ,0 darkbluecolormapping darkBlueColorMapping[ K  ;O\\ �E]^�E 0 	colorname 	colorName] m  <?__ �``  d a r k   b l u e^ �Dab�D 0 lowerhuelimit lowerHueLimita m  BE�C�C �b �Bc�A�B 0 upperhuelimit upperHueLimitc m  HK�@�@ ��A  Z ded j  Sj�?f�? (0 purplecolormapping purpleColorMappingf K  Sggg �>hi�> 0 	colorname 	colorNameh m  TWjj �kk  p u r p l ei �=lm�= 0 lowerhuelimit lowerHueLimitl m  Z]�<�< �m �;n�:�; 0 upperhuelimit upperHueLimitn m  `c�9�9D�:  e opo j  k��8q�8 $0 pinkcolormapping pinkColorMappingq K  krr �7st�7 0 	colorname 	colorNames m  louu �vv  p i n kt �6wx�6 0 lowerhuelimit lowerHueLimitw m  ru�5�5Ex �4y�3�4 0 upperhuelimit upperHueLimity m  x{�2�2]�3  p z{z l     �1�0�/�1  �0  �/  { |}| j  ���.~�. 0 colormappings colorMappings~ J  �� ��� o  ���-�- "0 redcolormapping redColorMapping� ��� o  ���,�, (0 orangecolormapping orangeColorMapping� ��� o  ���+�+ (0 yellowcolormapping yellowColorMapping� ��� o  ���*�* &0 greencolormapping greenColorMapping� ��� o  ���)�) $0 cyancolormapping cyanColorMapping� ��� o  ���(�( .0 lightbluecolormapping lightBlueColorMapping� ��� o  ���'�' ,0 darkbluecolormapping darkBlueColorMapping� ��� o  ���&�& (0 purplecolormapping purpleColorMapping� ��%� o  ���$�$ $0 pinkcolormapping pinkColorMapping�%  } ��� l     �#�"�!�#  �"  �!  � ��� j  ��� ��  0 labelmappings labelMappings� J  ���� ��� o  ���� 
0 label1  � ��� o  ���� 
0 label2  � ��� o  ���� 
0 label3  � ��� o  ���� 
0 label4  � ��� o  ���� 
0 label5  � ��� o  ���� 
0 label6  � ��� o  ���� 
0 label7  �  � ��� l     ����  �  �  � ��� j  ����� &0 creatednotescount createdNotesCount� m  ����  � ��� j  ����� &0 updatednotescount updatedNotesCount� m  ����  � ��� l     ����  �  �  � ��� l     ����  � d ^ The "KeypointsScriptingLib.scptd" scripting library provides utility methods for this script.   � ��� �   T h e   " K e y p o i n t s S c r i p t i n g L i b . s c p t d "   s c r i p t i n g   l i b r a r y   p r o v i d e s   u t i l i t y   m e t h o d s   f o r   t h i s   s c r i p t .� ��� l     ����  � d ^ It can be made available to this script by copying it into a "Script Libraries" folder inside   � ��� �   I t   c a n   b e   m a d e   a v a i l a b l e   t o   t h i s   s c r i p t   b y   c o p y i n g   i t   i n t o   a   " S c r i p t   L i b r a r i e s "   f o l d e r   i n s i d e� ��� l     ����  � ; 5 the "Library" folder that's within your Home folder.   � ��� j   t h e   " L i b r a r y "   f o l d e r   t h a t ' s   w i t h i n   y o u r   H o m e   f o l d e r .� ��� l     �
���
  � i c see https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / e x t r a c t s / m a c - s c r i p t i n g / t r e e / m a s t e r / S c r i p t i n g L i b r a r i e s / K e y p o i n t s S c r i p t i n g L i b� ��� l     ���� x  ���	���	 0 keypointslib KeypointsLib� 4  ����
� 
scpt� m  ���� ��� * K e y p o i n t s S c r i p t i n g L i b�  �   v1.3 or greater required   � ��� 2   v 1 . 3   o r   g r e a t e r   r e q u i r e d� ��� l     ����  �  �  � ��� x  ������  � 4  ����
� 
frmk� m  ���� ��� V / S y s t e m / L i b r a r y / F r a m e w o r k s / A p p K i t . f r a m e w o r k�  � ��� x  �� ����   � 4  ����
�� 
frmk� m   �� ��� V / S y s t e m / L i b r a r y / F r a m e w o r k s / Q u a r t z . f r a m e w o r k��  � ��� x  !�������  � 2 ��
�� 
osax��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   Main handler.   � ���    M a i n   h a n d l e r .� ��� i  !$��� I     ������
�� .aevtoappnull  �   � ****��  ��  � k    !�� ��� l     ������  � 9 3 DEVONthink must be running for this script to work   � ��� f   D E V O N t h i n k   m u s t   b e   r u n n i n g   f o r   t h i s   s c r i p t   t o   w o r k� ��� Z    ������� H     �� n    ��� I    �������� $0 checkappsrunning checkAppsRunning��  ��  �  f     � L   	 ����  ��  ��  � ��� l   ��������  ��  ��  � ��� n   ��� I    ������� 0 setupprogress setupProgress� ���� m    �� �   p C r e a t i n g   M a r k d o w n   n o t e s   f o r   a n n o t a t i o n s   i n   s e l e c t e d   P D F s��  ��  � o    ���� 0 keypointslib KeypointsLib�  l   ��������  ��  ��    l   ����   J D only deal with currently selected PDFs that contain PDF annotations    � �   o n l y   d e a l   w i t h   c u r r e n t l y   s e l e c t e d   P D F s   t h a t   c o n t a i n   P D F   a n n o t a t i o n s 	 r    "

 n     I     �������� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations��  ��    f     o      ���� 0 
pdfrecords 
pdfRecords	  l  # #��������  ��  ��    r   # * m   # $����   o      ���� &0 creatednotescount createdNotesCount  r   + 2 m   + ,����   o      ���� &0 updatednotescount updatedNotesCount  r   3 : I  3 8����
�� .corecnte****       **** o   3 4���� 0 
pdfrecords 
pdfRecords��   o      ���� 0 pdfcount pdfCount  n  ; E  I   @ E��!���� 40 settotalstepsforprogress setTotalStepsForProgress! "��" o   @ A���� 0 pdfcount pdfCount��  ��    o   ; @���� 0 keypointslib KeypointsLib #$# l  F F��������  ��  ��  $ %&% l  F F��'(��  ' + % process PDF annotations for each PDF   ( �)) J   p r o c e s s   P D F   a n n o t a t i o n s   f o r   e a c h   P D F& *+* Y   F �,��-.��, k   P �// 010 r   P V232 n   P T454 4   Q T��6
�� 
cobj6 o   R S���� 0 i  5 o   P Q���� 0 
pdfrecords 
pdfRecords3 o      ���� 0 	pdfrecord 	pdfRecord1 787 O  W e9:9 r   _ d;<; n   _ b=>= 1   ` b��
�� 
DTfn> o   _ `���� 0 	pdfrecord 	pdfRecord< o      ���� 0 pdffilename pdfFilename: 5   W \��?��
�� 
capp? m   Y Z@@ �AA  D N t p
�� kfrmID  8 BCB n  f �DED I   k ���F����  0 updateprogress updateProgressF GHG o   k l���� 0 i  H I��I b   l JKJ b   l {LML b   l yNON b   l uPQP b   l sRSR b   l oTUT m   l mVV �WW  P r o c e s s i n g   P D F  U o   m n���� 0 i  S m   o rXX �YY    o f  Q o   s t���� 0 pdfcount pdfCountO m   u xZZ �[[    ( "M o   y z���� 0 pdffilename pdfFilenameK m   { ~\\ �]]  " ) .��  ��  E o   f k���� 0 keypointslib KeypointsLibC ^��^ r   � �_`_ n  � �aba I   � ���c���� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDFc d��d o   � ����� 0 	pdfrecord 	pdfRecord��  ��  b  f   � �` o      ����  0 updatedrecords updatedRecords��  �� 0 i  - m   I J���� . o   J K���� 0 pdfcount pdfCount��  + efe l  � ���������  ��  ��  f ghg l  � ���ij��  i 2 , select records that were created or updated   j �kk X   s e l e c t   r e c o r d s   t h a t   w e r e   c r e a t e d   o r   u p d a t e dh lml Z   � �no����n F   � �pqp =  � �rsr o   � ����� ,0 selectupdatedrecords selectUpdatedRecordss m   � ���
�� boovtrueq >  � �tut o   � �����  0 updatedrecords updatedRecordsu J   � �����  o O   � �vwv k   � �xx yzy r   � �{|{ 4   � ���}
�� 
brws} m   � ����� | o      ���� 0 frontwindow frontWindowz ~��~ r   � �� o   � �����  0 updatedrecords updatedRecords� n      ��� 1   � ���
�� 
DTsl� o   � ����� 0 frontwindow frontWindow��  w 5   � ������
�� 
capp� m   � ��� ���  D N t p
�� kfrmID  ��  ��  m ��� l  � ���������  ��  ��  � ��� l  � �������  � Z T display a dialog with feedback (number of PDFs processed and notes created/updated)   � ��� �   d i s p l a y   a   d i a l o g   w i t h   f e e d b a c k   ( n u m b e r   o f   P D F s   p r o c e s s e d   a n d   n o t e s   c r e a t e d / u p d a t e d )� ���� O   �!��� k   � �� ��� I  � �������
�� .miscactvnull��� ��� null��  ��  � ���� I  � ����
�� .sysodlogaskr        TEXT� b   ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���   P r o c e s s e d   P D F s :  � o   � ����� 0 pdfcount pdfCount� 1   � ���
�� 
lnfd� m   � ��� ���  C r e a t e d   n o t e s :  � o   � ����� &0 creatednotescount createdNotesCount� 1   � ���
�� 
lnfd� m   � ��� ���  U p d a t e d   n o t e s :  � l 
 ������� o   ����� &0 updatednotescount updatedNotesCount��  ��  � ����
�� 
appr� m  �� ��� D F i n i s h e d   I m p o r t   o f   P D F   A n n o t a t i o n s� ����
�� 
disp� m  ���� � ����
�� 
btns� J  �� ���� m  �� ���  O K��  � �����
�� 
dflt� m  �� ���  O K��  ��  � 5   � �����
�� 
capp� m   � ��� ���  D N t p
� kfrmID  ��  � ��� l     �~�}�|�~  �}  �|  � ��� l     �{�z�y�{  �z  �y  � ��� l     �x���x  � + % Checks if DEVONthink Pro is running.   � ��� J   C h e c k s   i f   D E V O N t h i n k   P r o   i s   r u n n i n g .� ��� l     �w���w  � 6 0 Credits: modified after script code by Rob Trew   � ��� `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     �v���v  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i  %(��� I      �u�t�s�u $0 checkappsrunning checkAppsRunning�t  �s  � k     5�� ��� O     2��� l   1���� Z    1���r�q� A    ��� l   ��p�o� I   �n��m
�n .corecnte****       ****� l   ��l�k� 6  ��� 2   �j
�j 
prcs� =    ��� 1    �i
�i 
fcrt� m    �� ���  D N t p�l  �k  �m  �p  �o  � m    �h�h � k    -�� ��� n   *��� I   " *�g��f�g 0 displayerror displayError� ��� m   " #�� ��� 6 D E V O N t h i n k   P r o   n o t   r u n n i n g !� ��� m   # $�� ��� � P l e a s e   o p e n   D E V O N t h i n k   P r o   a n d   s e l e c t   s o m e   P D F ( s ) ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .� ��� m   $ %�e�e � ��d� m   % &�c
�c boovtrue�d  �f  � o    "�b�b 0 keypointslib KeypointsLib� ��a� L   + -�� m   + ,�`
�` boovfals�a  �r  �q  � "  application "System Events"   � ��� 8   a p p l i c a t i o n   " S y s t e m   E v e n t s "� 5     �_��^
�_ 
capp� m    �� ���  s e v s
�^ kfrmID  �  �]  L   3 5 m   3 4�\
�\ boovtrue�]  �  l     �[�Z�Y�[  �Z  �Y    l     �X�W�V�X  �W  �V    l     �U	�U   X R Returns all PDF records from the records selected in DEVONthink that contain some   	 �

 �   R e t u r n s   a l l   P D F   r e c o r d s   f r o m   t h e   r e c o r d s   s e l e c t e d   i n   D E V O N t h i n k   t h a t   c o n t a i n   s o m e  l     �T�T   \ V PDF annotations. If there's currently no selection in DEVONthink (or if the selection    � �   P D F   a n n o t a t i o n s .   I f   t h e r e ' s   c u r r e n t l y   n o   s e l e c t i o n   i n   D E V O N t h i n k   ( o r   i f   t h e   s e l e c t i o n  l     �S�S   \ V contains no PDFs with PDF annotations) presents an error alert and aborts the script.    � �   c o n t a i n s   n o   P D F s   w i t h   P D F   a n n o t a t i o n s )   p r e s e n t s   a n   e r r o r   a l e r t   a n d   a b o r t s   t h e   s c r i p t .  i  ), I      �R�Q�P�R T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�Q  �P   k     a  r      J     �O�O   o      �N�N 0 annotatedpdfs annotatedPDFs  l   �M�L�K�M  �L  �K    !  O    ^"#" k    ]$$ %&% r    '(' l   )�J�I) c    *+* 1    �H
�H 
DTsl+ m    �G
�G 
list�J  �I  ( o      �F�F 0 
therecords 
theRecords& ,-, X    D.�E/. Z   % ?01�D�C0 F   % 4232 l  % *4�B�A4 =  % *565 n   % (787 1   & (�@
�@ 
DTty8 o   % &�?�? 0 	therecord 	theRecord6 m   ( )�>
�> OCRdpdf �B  �A  3 l  - 29�=�<9 ?   - 2:;: n   - 0<=< 1   . 0�;
�; 
DTna= o   - .�:�: 0 	therecord 	theRecord; m   0 1�9�9  �=  �<  1 s   7 ;>?> o   7 8�8�8 0 	therecord 	theRecord? n      @A@  ;   9 :A o   8 9�7�7 0 annotatedpdfs annotatedPDFs�D  �C  �E 0 	therecord 	theRecord/ o    �6�6 0 
therecords 
theRecords- BCB l  E E�5�4�3�5  �4  �3  C D�2D Z  E ]EF�1�0E =  E IGHG o   E F�/�/ 0 annotatedpdfs annotatedPDFsH J   F H�.�.  F n  L YIJI I   Q Y�-K�,�- 0 displayerror displayErrorK LML m   Q RNN �OO P N o   P D F ( s )   w i t h   P D F   a n n o t a t i o n s   s e l e c t e d !M PQP m   R SRR �SS � P l e a s e   o p e n   D E V O N t h i n k   a n d   s e l e c t   s o m e   P D F ( s )   w i t h   P D F   a n n o t a t i o n s .Q TUT m   S T�+�+ U V�*V m   T U�)
�) boovtrue�*  �,  J o   L Q�(�( 0 keypointslib KeypointsLib�1  �0  �2  # 5    
�'W�&
�' 
cappW m    XX �YY  D N t p
�& kfrmID  ! Z[Z l  _ _�%�$�#�%  �$  �#  [ \�"\ L   _ a]] o   _ `�!�! 0 annotatedpdfs annotatedPDFs�"   ^_^ l     � ���   �  �  _ `a` l     ����  �  �  a bcb l     �de�  d W Q Iterates over the given PDF's contained PDF annotations and creates a DEVONthink   e �ff �   I t e r a t e s   o v e r   t h e   g i v e n   P D F ' s   c o n t a i n e d   P D F   a n n o t a t i o n s   a n d   c r e a t e s   a   D E V O N t h i n kc ghg l     �ij�  i K E record for each markup or text annotation (if it doesn't exist yet).   j �kk �   r e c o r d   f o r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n   ( i f   i t   d o e s n ' t   e x i s t   y e t ) .h lml l     �no�  n ` Z Returns a list with all records that were actually updated. I.e., if a PDF annotation did   o �pp �   R e t u r n s   a   l i s t   w i t h   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   u p d a t e d .   I . e . ,   i f   a   P D F   a n n o t a t i o n   d i dm qrq l     �st�  s V P already have a corresponding Markdown record in DEVONthink which wasn't updated   t �uu �   a l r e a d y   h a v e   a   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d   i n   D E V O N t h i n k   w h i c h   w a s n ' t   u p d a t e dr vwv l     �xy�  x ^ X (since its text content & properties were already up-to-date), it won't get included in   y �zz �   ( s i n c e   i t s   t e x t   c o n t e n t   &   p r o p e r t i e s   w e r e   a l r e a d y   u p - t o - d a t e ) ,   i t   w o n ' t   g e t   i n c l u d e d   i nw {|{ l     �}~�  }   the returned list.   ~ � &   t h e   r e t u r n e d   l i s t .| ��� l     ����  � T N @param pdfRecord The DEVONthink record representing the PDF whose annotations   � ��� �   @ p a r a m   p d f R e c o r d   T h e   D E V O N t h i n k   r e c o r d   r e p r e s e n t i n g   t h e   P D F   w h o s e   a n n o t a t i o n s� ��� l     ����  �   shall be extracted.   � ��� (   s h a l l   b e   e x t r a c t e d .� ��� i  -0��� I      ���� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF� ��� o      �� 0 	pdfrecord 	pdfRecord�  �  � k    �� ��� l     ����  � U O assemble info for the PDF record and its (possibly to be created) notes folder   � ��� �   a s s e m b l e   i n f o   f o r   t h e   P D F   r e c o r d   a n d   i t s   ( p o s s i b l y   t o   b e   c r e a t e d )   n o t e s   f o l d e r� ��� O     ���� k    ��� ��� r    ��� n    ��� 1   	 �
� 
ppth� o    	�� 0 	pdfrecord 	pdfRecord� o      �� 0 pdfpath pdfPath� ��� r    ��� n    ��� 1    �

�
 
rURL� o    �	�	 0 	pdfrecord 	pdfRecord� o      �� 
0 pdfurl  � ��� r    ��� n    ��� 1    �
� 
DTlo� o    �� 0 	pdfrecord 	pdfRecord� o      �� "0 pdflocationpath pdfLocationPath� ��� l   ����  �  �  � ��� r    ��� n    ��� 1    �
� 
DTcm� o    � �  0 	pdfrecord 	pdfRecord� o      ���� 0 pdfmetadata pdfMetadata� ��� Q     =���� k   # 1�� ��� l  # #������  � N H pdfMetadata may be undefined in which case this triggers the error case   � ��� �   p d f M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e� ���� Z  # 1������� =  # &��� o   # $���� 0 pdfmetadata pdfMetadata� m   $ %��
�� 
msng� r   ) -��� J   ) +����  � o      ���� 0 pdfmetadata pdfMetadata��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r   9 =��� J   9 ;����  � o      ���� 0 pdfmetadata pdfMetadata� ��� l  > >��������  ��  ��  � ��� l  > >������  � p j if necessary, create the notes folder, i.e. the DEVONthink group that hosts the PDF file's Markdown notes   � ��� �   i f   n e c e s s a r y ,   c r e a t e   t h e   n o t e s   f o l d e r ,   i . e .   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n   n o t e s� ��� r   > O��� b   > M��� b   > G��� o   > C���� ,0 notefoldernameprefix noteFolderNamePrefix� n   C F��� 1   D F��
�� 
pnam� o   C D���� 0 	pdfrecord 	pdfRecord� o   G L���� ,0 notefoldernamesuffix noteFolderNameSuffix� o      ����  0 notefoldername noteFolderName� ��� r   P W��� l  P U������ b   P U��� b   P S��� o   P Q���� "0 pdflocationpath pdfLocationPath� o   Q R����  0 notefoldername noteFolderName� m   S T�� ���  /��  ��  � o      ���� (0 folderlocationpath folderLocationPath� ��� r   X _��� I  X ]�����
�� .DTpacd53bool       utxt� o   X Y���� (0 folderlocationpath folderLocationPath��  � o      ����  0 folderdidexist folderDidExist� ��� r   ` g��� I  ` e�����
�� .DTpacd52DTrc       utxt� o   ` a���� (0 folderlocationpath folderLocationPath��  � o      ����  0 folderlocation folderLocation� ��� r   h m��� n   h k��� 1   i k��
�� 
rURL� o   h i����  0 folderlocation folderLocation� o      ���� 0 	folderurl 	folderURL� ��� r   n u��� b   n q��� o   n o���� 
0 pdfurl  � m   o p�� ���  ? p a g e = 0� n      ��� 1   r t��
�� 
pURL� o   q r����  0 folderlocation folderLocation� � � l  v v��������  ��  ��     r   v { n   v y 1   w y��
�� 
DTcm o   v w����  0 folderlocation folderLocation o      ����  0 foldermetadata folderMetadata �� Q   | �	
 k    �  l   ����   Q K folderMetadata may be undefined in which case this triggers the error case    � �   f o l d e r M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e �� Z   ����� =   � o    �����  0 foldermetadata folderMetadata m   � ���
�� 
msng r   � � J   � �����   o      ����  0 foldermetadata folderMetadata��  ��  ��  	 R      ������
�� .ascrerr ****      � ****��  ��  
 r   � � J   � �����   o      ����  0 foldermetadata folderMetadata��  � 5     ����
�� 
capp m     �  D N t p
�� kfrmID  �  l  � ���������  ��  ��     l  � ���!"��  ! ? 9 extract any citekey for the PDF from its custom metadata   " �## r   e x t r a c t   a n y   c i t e k e y   f o r   t h e   P D F   f r o m   i t s   c u s t o m   m e t a d a t a  $%$ r   � �&'& m   � �(( �))  ' o      ���� 0 sourcecitekey sourceCitekey% *+* r   � �,-, l  � �.����. n  � �/0/ I   � ���1���� .0 valueforkey_inrecord_ valueForKey_inRecord_1 232 m   � �44 �55  m d c i t e k e y3 6��6 o   � ����� 0 pdfmetadata pdfMetadata��  ��  0 o   � ����� 0 keypointslib KeypointsLib��  ��  - o      ���� "0 metadatacitekey metadataCitekey+ 787 Z   � �9:����9 F   � �;<; >  � �=>= o   � ����� "0 metadatacitekey metadataCitekey> m   � ���
�� 
msng< >  � �?@? o   � ����� "0 metadatacitekey metadataCitekey@ m   � �AA �BB  : r   � �CDC o   � ����� "0 metadatacitekey metadataCitekeyD o      ���� 0 sourcecitekey sourceCitekey��  ��  8 EFE l  � ���������  ��  ��  F GHG l  � ���IJ��  I J D assemble info for all PDF annotations as a list of property records   J �KK �   a s s e m b l e   i n f o   f o r   a l l   P D F   a n n o t a t i o n s   a s   a   l i s t   o f   p r o p e r t y   r e c o r d sH LML r   � �NON n  � �PQP I   � ���R���� &0 pdfannotationinfo pdfAnnotationInfoR STS o   � ����� 0 pdfpath pdfPathT UVU o   � ����� 
0 pdfurl  V W��W o   � ����� 0 sourcecitekey sourceCitekey��  ��  Q  f   � �O J      XX YZY o      ���� (0 pdfannotationslist pdfAnnotationsListZ [��[ o      ���� 0 pdfdoi pdfDOI��  M \]\ l  � ���������  ��  ��  ] ^_^ l  � ���`a��  ` \ V set custom metadata fields for the PDF record: DOI & DT link back to the notes folder   a �bb �   s e t   c u s t o m   m e t a d a t a   f i e l d s   f o r   t h e   P D F   r e c o r d :   D O I   &   D T   l i n k   b a c k   t o   t h e   n o t e s   f o l d e r_ cdc r   � �efe b   � �ghg o   � ����� 0 pdfmetadata pdfMetadatah K   � �ii ��jk�� 0 doi  j o   � ����� 0 pdfdoi pdfDOIk ��l���� 0 pdfannotations  l o   � ����� 0 	folderurl 	folderURL��  f o      ���� 0 pdfmetadata pdfMetadatad mnm n  � �opo I   � ���q���� 00 setmetadatafordtrecord setMetadataForDTRecordq rsr o   � ����� 0 	pdfrecord 	pdfRecords t��t o   � ����� 0 pdfmetadata pdfMetadata��  ��  p  f   � �n uvu l   ��������  ��  ��  v wxw l   ��yz��  y = 7 if the notes folder just got created, set its metadata   z �{{ n   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   s e t   i t s   m e t a d a t ax |}| r   ~~ J   ����   o      ���� 0 bibmetadata bibMetadata} ��� r  ��� m  �� ���  � o      ���� &0 formattedcitation formattedCitation� ��� r  ��� m  �� ���  � o      ���� 0 
bibtexdata 
bibTeXData� ��� Z  �������� G  &��� = ��� o  ����  0 folderdidexist folderDidExist� m  ��
�� boovfals� = "��� o   ���� 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata� m   !��
�� boovtrue� k  )��� ��� l ))������  � 5 / fetch bibliographic metadata for the PDF's DOI   � ��� ^   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   P D F ' s   D O I� ��� Z  )�����~� F  )F��� F  ):��� = )0��� o  ).�}�} $0 fetchdoimetadata fetchDOIMetadata� m  ./�|
�| boovtrue� > 36��� o  34�{�{ 0 pdfdoi pdfDOI� m  45�z
�z 
msng� > =B��� o  =>�y�y 0 pdfdoi pdfDOI� m  >A�� ���  � k  I��� ��� r  IR��� n IP��� I  JP�x��w�x &0 bibmetadatafordoi bibMetadataForDOI� ��� o  JK�v�v 0 pdfdoi pdfDOI� ��u� o  KL�t�t 0 sourcecitekey sourceCitekey�u  �w  �  f  IJ� o      �s�s 0 bibmetadata bibMetadata� ��r� Z  S����q�p� > SW��� o  ST�o�o 0 bibmetadata bibMetadata� J  TV�n�n  � k  Z}�� ��� r  Zk��� l Zg��m�l� n Zg��� I  _g�k��j�k .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  _b�� ���  r e f e r e n c e� ��i� o  bc�h�h 0 bibmetadata bibMetadata�i  �j  � o  Z_�g�g 0 keypointslib KeypointsLib�m  �l  � o      �f�f &0 formattedcitation formattedCitation� ��e� r  l}��� l ly��d�c� n ly��� I  qy�b��a�b .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  qt�� ���  b i b t e x� ��`� o  tu�_�_ 0 bibmetadata bibMetadata�`  �a  � o  lq�^�^ 0 keypointslib KeypointsLib�d  �c  � o      �]�] 0 
bibtexdata 
bibTeXData�e  �q  �p  �r  �  �~  � ��� l ���\�[�Z�\  �[  �Z  � ��� r  ����� b  ����� o  ���Y�Y  0 foldermetadata folderMetadata� K  ���� �X���X 0 
sourcefile 
sourceFile� o  ���W�W 0 pdfpath pdfPath� �V���V 0 citekey  � o  ���U�U 0 sourcecitekey sourceCitekey� �T��S�T 0 doi  � o  ���R�R 0 pdfdoi pdfDOI�S  � o      �Q�Q  0 foldermetadata folderMetadata� ��� r  ����� b  ����� o  ���P�P  0 foldermetadata folderMetadata� o  ���O�O 0 bibmetadata bibMetadata� o      �N�N  0 foldermetadata folderMetadata� ��� l ���M�L�K�M  �L  �K  � ��J� n ����� I  ���I��H�I 00 setmetadatafordtfolder setMetadataForDTFolder� ��� o  ���G�G  0 folderlocation folderLocation� ��F� o  ���E�E  0 foldermetadata folderMetadata�F  �H  �  f  ���J  ��  ��  � ��� l ���D�C�B�D  �C  �B  � ��� l ���A���A  � s m if the notes folder just got created, append BibTeX data and/or the formatted citation to its Finder comment   � ��� �   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   a p p e n d   B i b T e X   d a t a   a n d / o r   t h e   f o r m a t t e d   c i t a t i o n   t o   i t s   F i n d e r   c o m m e n t� ��� Z  ����@�?� = ����� o  ���>�>  0 folderdidexist folderDidExist� m  ���=
�= boovfals� k  �    Z  ���<�; F  �� F  �� = ��	
	 o  ���:�: P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment
 m  ���9
�9 boovtrue > �� o  ���8�8 &0 formattedcitation formattedCitation m  ���7
�7 
msng > �� o  ���6�6 &0 formattedcitation formattedCitation m  �� �   n �� I  ���5�4�5 60 appendtocommentofdtfolder appendToCommentOfDTFolder  o  ���3�3  0 folderlocation folderLocation �2 o  ���1�1 &0 formattedcitation formattedCitation�2  �4    f  ���<  �;   �0 Z  ��/�. F  � F  �� = �� o  ���-�- :0 appendbibtextofindercomment appendBibTeXToFinderComment m  ���,
�, boovtrue > �� !  o  ���+�+ 0 
bibtexdata 
bibTeXData! m  ���*
�* 
msng > �"#" o  ���)�) 0 
bibtexdata 
bibTeXData# m  �$$ �%%   n 	&'& I  
�((�'�( 60 appendtocommentofdtfolder appendToCommentOfDTFolder( )*) o  
�&�&  0 folderlocation folderLocation* +�%+ o  �$�$ 0 
bibtexdata 
bibTeXData�%  �'  '  f  	
�/  �.  �0  �@  �?  � ,-, l �#�"�!�#  �"  �!  - ./. r  !010 J  � �   1 o      ��  0 updatedrecords updatedRecords/ 232 l ""����  �  �  3 454 l ""�67�  6 n h loop over each markup or text annotation in the PDF and create/update its corresponding Markdown record   7 �88 �   l o o p   o v e r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n   i n   t h e   P D F   a n d   c r e a t e / u p d a t e   i t s   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d5 9:9 X  "	;�<; k  6== >?> r  6A@A@ l 6=B��B n 6=CDC o  9=�� 0 comment  D o  69�� 0 pdfannotation pdfAnnotation�  �  A o      �� 0 acomment aComment? EFE r  BMGHG l BII��I n BIJKJ o  EI�� 0 	annottext 	annotTextK o  BE�� 0 pdfannotation pdfAnnotation�  �  H o      �� 0 	annottext 	annotTextF LML r  NYNON l NUP��P n NUQRQ o  QU�� 0 	pagelabel 	pageLabelR o  NQ�� 0 pdfannotation pdfAnnotation�  �  O o      �� 0 
apagelabel 
aPageLabelM STS l ZZ�
�	��
  �	  �  T UVU l ZZ�WX�  W = 7 assemble record content from annotation text & comment   X �YY n   a s s e m b l e   r e c o r d   c o n t e n t   f r o m   a n n o t a t i o n   t e x t   &   c o m m e n tV Z[Z r  Zi\]\ n Ze^_^ I  [e�`�� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData` aba o  [^�� 0 	annottext 	annotTextb c�c o  ^a�� 0 acomment aComment�  �  _  f  Z[] o      ��  0 recordcontents recordContents[ ded l jj� �����   ��  ��  e fgf l jj��hi��  h F @ assemble record name from annotation text, comment & page label   i �jj �   a s s e m b l e   r e c o r d   n a m e   f r o m   a n n o t a t i o n   t e x t ,   c o m m e n t   &   p a g e   l a b e lg klk r  j|mnm n jxopo I  kx��q���� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationDataq rsr o  kn���� 0 	annottext 	annotTexts tut o  nq���� 0 acomment aCommentu v��v o  qt���� 0 
apagelabel 
aPageLabel��  ��  p  f  jkn o      ���� 0 
recordname 
recordNamel wxw l }}��������  ��  ��  x yzy l }}��{|��  { * $ record modification & creation date   | �}} H   r e c o r d   m o d i f i c a t i o n   &   c r e a t i o n   d a t ez ~~ r  }���� c  }���� l }������� n }���� o  ������ 0 modifieddate modifiedDate� o  }����� 0 pdfannotation pdfAnnotation��  ��  � m  ����
�� 
ldt � o      ���� 00 recordmodificationdate recordModificationDate ��� Z  ��������� > ����� o  ������ 00 recordmodificationdate recordModificationDate� m  ����
�� 
msng� k  ���� ��� r  ����� o  ������ 00 recordmodificationdate recordModificationDate� o      ���� (0 recordcreationdate recordCreationDate� ���� r  ����� n ����� I  ��������� (0 keypointsidfordate keypointsIDForDate� ���� o  ������ (0 recordcreationdate recordCreationDate��  ��  � o  ������ 0 keypointslib KeypointsLib� o      ���� 0 recordaliases recordAliases��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� c  ����� l �������� n ����� o  ������ 0 deeplink deepLink� o  ������ 0 pdfannotation pdfAnnotation��  ��  � m  ����
�� 
TEXT� o      ���� 0 	recordurl 	recordURL� ��� l ����������  ��  ��  � ��� l ��������  �   record metadata   � ���     r e c o r d   m e t a d a t a� ��� r  ����� c  ����� l �������� n ����� o  ������ 0 	annottype 	annotType� o  ������ 0 pdfannotation pdfAnnotation��  ��  � m  ����
�� 
TEXT� o      ���� 0 	annottype 	annotType� ��� r  ����� b  ����� o  ������ 0 bibmetadata bibMetadata� K  ���� ������ 0 pdfannotations  � o  ������ 0 	folderurl 	folderURL� �������  0 annotationtype annotationType� o  ������ 0 	annottype 	annotType��  � o      ����  0 recordmetadata recordMetadata� ��� l ����������  ��  ��  � ��� r  ����� l �������� n ����� o  ������ 0 username userName� o  ������ 0 pdfannotation pdfAnnotation��  ��  � o      ���� 0 	ausername 	aUserName� ��� Z �!������� F  ���� > ����� o  ������ 0 	ausername 	aUserName� m  ����
�� 
msng� > ���� o  ������ 0 	ausername 	aUserName� m  ��� ���  � r  	��� b  	��� o  	����  0 recordmetadata recordMetadata� K  �� ������� 0 	createdby 	createdBy� l ������ c  ��� o  ���� 0 	ausername 	aUserName� m  ��
�� 
TEXT��  ��  ��  � o      ����  0 recordmetadata recordMetadata��  ��  � ��� l ""��������  ��  ��  � ��� Z "P������� F  "5��� > "'��� o  "%���� 0 
apagelabel 
aPageLabel� m  %&��
�� 
msng� > *1��� o  *-���� 0 
apagelabel 
aPageLabel� m  -0�� ���  � r  8L��� b  8H��� o  8;����  0 recordmetadata recordMetadata� K  ;G�� ������� 0 
sourcepage 
sourcePage� l >E������ c  >E��� o  >A���� 0 
apagelabel 
aPageLabel� m  AD��
�� 
TEXT��  ��  ��  � o      ����  0 recordmetadata recordMetadata��  ��  � ��� l QQ��������  ��  ��  � ��� Z Qi������� > QT��� o  QR���� 0 pdfpath pdfPath� m  RS��
�� 
msng� r  We��� b  Wa��� o  WZ����  0 recordmetadata recordMetadata� K  Z`�� ��	 ���� 0 
sourcefile 
sourceFile	  o  ]^���� 0 pdfpath pdfPath��  � o      ����  0 recordmetadata recordMetadata��  ��  � 			 l jj��������  ��  ��  	 			 l jj��		��  	 � � TODO: allow to extract (& prioritize) the citekey from the annotation comment (e.g. `< #Miller+Johns2024` or `< [#Miller+Johns2024]`)   	 �		   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   c i t e k e y   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   # M i l l e r + J o h n s 2 0 2 4 `   o r   ` <   [ # M i l l e r + J o h n s 2 0 2 4 ] ` )	 				 r  ju	
		
 l jq	����	 n jq			 o  mq���� 0 citekey  	 o  jm���� 0 pdfannotation pdfAnnotation��  ��  	 o      ���� 0 citekey  		 			 Z v�		����	 F  v�			 > v{			 o  vy���� 0 citekey  	 m  yz��
�� 
msng	 > ~�			 o  ~����� 0 citekey  	 m  ��		 �		  	 r  ��			 b  ��			 o  ������  0 recordmetadata recordMetadata	 K  ��		 ��	 ���� 0 citekey  	  o  ������ 0 citekey  ��  	 o      ����  0 recordmetadata recordMetadata��  ��  	 	!	"	! l ������~��  �  �~  	" 	#	$	# Z ��	%	&�}�|	% F  ��	'	(	' > ��	)	*	) o  ���{�{ 0 pdfdoi pdfDOI	* m  ���z
�z 
msng	( > ��	+	,	+ o  ���y�y 0 pdfdoi pdfDOI	, m  ��	-	- �	.	.  	& r  ��	/	0	/ b  ��	1	2	1 o  ���x�x  0 recordmetadata recordMetadata	2 K  ��	3	3 �w	4�v�w 0 doi  	4 o  ���u�u 0 pdfdoi pdfDOI�v  	0 o      �t�t  0 recordmetadata recordMetadata�}  �|  	$ 	5	6	5 l ���s�r�q�s  �r  �q  	6 	7	8	7 l ���p	9	:�p  	9 j d extract tags (like `< @tag @another tag` or `< [@tag] [@another tag]`) as well as custom attributes   	: �	;	; �   e x t r a c t   t a g s   ( l i k e   ` <   @ t a g   @ a n o t h e r   t a g `   o r   ` <   [ @ t a g ]   [ @ a n o t h e r   t a g ] ` )   a s   w e l l   a s   c u s t o m   a t t r i b u t e s	8 	<	=	< l ���o	>	?�o  	> q k (i.e., special tags like `< @:key:value @:key` or `< [@:key:value] [@:key]`) within the annotation comment   	? �	@	@ �   ( i . e . ,   s p e c i a l   t a g s   l i k e   ` <   @ : k e y : v a l u e   @ : k e y `   o r   ` <   [ @ : k e y : v a l u e ]   [ @ : k e y ] ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t	= 	A	B	A r  ��	C	D	C n ��	E	F	E I  ���n	G�m�n T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote	G 	H	I	H o  ���l�l 0 acomment aComment	I 	J�k	J J  ��	K	K 	L�j	L m  ��	M	M �	N	N  f l a g g e d�j  �k  �m  	F o  ���i�i 0 keypointslib KeypointsLib	D J      	O	O 	P	Q	P o      �h�h $0 customattributes customAttributes	Q 	R�g	R o      �f�f 0 
recordtags 
recordTags�g  	B 	S	T	S l ���e�d�c�e  �d  �c  	T 	U	V	U l ���b	W	X�b  	W G A set the extracted custom attributes as dedicated record metadata   	X �	Y	Y �   s e t   t h e   e x t r a c t e d   c u s t o m   a t t r i b u t e s   a s   d e d i c a t e d   r e c o r d   m e t a d a t a	V 	Z	[	Z X  �z	\�a	]	\ k  u	^	^ 	_	`	_ r  	a	b	a n 	c	d	c o  �`�` 0 	attribkey 	attribKey	d o  �_�_ "0 customattribute customAttribute	b o      �^�^ 0 akey aKey	` 	e	f	e r  	g	h	g n 	i	j	i o  �]�] 0 attribvalue attribValue	j o  �\�\ "0 customattribute customAttribute	h o      �[�[ 0 avalue aValue	f 	k	l	k l �Z�Y�X�Z  �Y  �X  	l 	m	n	m l �W	o	p�W  	o z t allow multiple occurrences of the same custom key with different values (e.g. `@:key:Some value @:key:Other value`)   	p �	q	q �   a l l o w   m u l t i p l e   o c c u r r e n c e s   o f   t h e   s a m e   c u s t o m   k e y   w i t h   d i f f e r e n t   v a l u e s   ( e . g .   ` @ : k e y : S o m e   v a l u e   @ : k e y : O t h e r   v a l u e ` )	n 	r	s	r r  0	t	u	t l ,	v�V�U	v n ,	w	x	w I  ",�T	y�S�T .0 valueforkey_inrecord_ valueForKey_inRecord_	y 	z	{	z o  "%�R�R 0 akey aKey	{ 	|�Q	| o  %(�P�P  0 recordmetadata recordMetadata�Q  �S  	x o  "�O�O 0 keypointslib KeypointsLib�V  �U  	u o      �N�N 0 existingvalue existingValue	s 	}�M	} Z  1u	~	�L	�	~ > 16	�	�	� o  14�K�K 0 existingvalue existingValue	� m  45�J
�J 
msng	 r  9W	�	�	� l 9S	��I�H	� n 9S	�	�	� I  >S�G	��F�G 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_	� 	�	�	� l >I	��E�D	� b  >I	�	�	� b  >E	�	�	� o  >A�C�C 0 existingvalue existingValue	� m  AD	�	� �	�	�  ;	� o  EH�B�B 0 avalue aValue�E  �D  	� 	�	�	� o  IL�A�A 0 akey aKey	� 	��@	� o  LO�?�?  0 recordmetadata recordMetadata�@  �F  	� o  9>�>�> 0 keypointslib KeypointsLib�I  �H  	� o      �=�=  0 recordmetadata recordMetadata�L  	� r  Zu	�	�	� b  Zq	�	�	� o  Z]�<�<  0 recordmetadata recordMetadata	� l ]p	��;�:	� n ]p	�	�	� I  bp�9	��8�9 :0 recordfromlabels_andvalues_ recordFromLabels_andValues_	� 	�	�	� J  bg	�	� 	��7	� o  be�6�6 0 akey aKey�7  	� 	��5	� J  gl	�	� 	��4	� o  gj�3�3 0 avalue aValue�4  �5  �8  	� o  ]b�2�2 0 keypointslib KeypointsLib�;  �:  	� o      �1�1  0 recordmetadata recordMetadata�M  �a "0 customattribute customAttribute	] o  ���0�0 $0 customattributes customAttributes	[ 	�	�	� l {{�/�.�-�/  �.  �-  	� 	�	�	� l {{�,	�	��,  	� P J honor a flagged status (like `< @:flagged`) within the annotation comment   	� �	�	� �   h o n o r   a   f l a g g e d   s t a t u s   ( l i k e   ` <   @ : f l a g g e d ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t	� 	�	�	� r  {�	�	�	� n {�	�	�	� I  ���+	��*�+ @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged	� 	��)	� o  ���(�( 0 acomment aComment�)  �*  	� o  {��'�' 0 keypointslib KeypointsLib	� o      �&�& 0 	isflagged 	isFlagged	� 	�	�	� l ���%�$�#�%  �$  �#  	� 	�	�	� l ���"	�	��"  	� B < honor a rating (like `< ***`) within the annotation comment   	� �	�	� x   h o n o r   a   r a t i n g   ( l i k e   ` <   * * * ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t	� 	�	�	� r  ��	�	�	� n ��	�	�	� I  ���!	�� �! 60 keypointsnoteratingnumber keypointsNoteRatingNumber	� 	��	� o  ���� 0 acomment aComment�  �   	� o  ���� 0 keypointslib KeypointsLib	� o      �� 0 recordrating recordRating	� 	�	�	� l ������  �  �  	� 	�	�	� l ���	�	��  	� H B attempt to map the annotation's color to a DEVONthink label index   	� �	�	� �   a t t e m p t   t o   m a p   t h e   a n n o t a t i o n ' s   c o l o r   t o   a   D E V O N t h i n k   l a b e l   i n d e x	� 	�	�	� l ���	�	��  	�  y TODO: allow to extract (& prioritize) the DEVONthink label from the annotation comment (e.g. `< (@Important)` or `< @1`)   	� �	�	� �   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   D E V O N t h i n k   l a b e l   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   ( @ I m p o r t a n t ) `   o r   ` <   @ 1 ` )	� 	�	�	� r  ��	�	�	� n ��	�	�	� I  ���	��� 00 labelindexforcolorname labelIndexForColorName	� 	��	� n ��	�	�	� o  ����  0 annotcolorname annotColorName	� o  ���� 0 pdfannotation pdfAnnotation�  �  	�  f  ��	� o      �� $0 recordlabelindex recordLabelIndex	� 	�	�	� l ������  �  �  	� 	�	�	� l ���	�	��  	� A ; create a Markdown record for this annotation in DEVONthink   	� �	�	� v   c r e a t e   a   M a r k d o w n   r e c o r d   f o r   t h i s   a n n o t a t i o n   i n   D E V O N t h i n k	� 	�	�	� r  ��	�	�	� n ��	�	�	� I  ���	���  0 createdtrecord createDTRecord	� 	�	�	� o  ���
�
  0 folderlocation folderLocation	� 	�	�	� o  ���	�	  0 foldermetadata folderMetadata	� 	�	�	� o  ���� 0 
recordname 
recordName	� 	�	�	� o  ���� 0 recordaliases recordAliases	� 	�	�	� o  ���� 0 	recordurl 	recordURL	� 	�	�	� o  ���� 0 
recordtags 
recordTags	� 	�	�	� o  ���� 0 	isflagged 	isFlagged	� 	�	�	� o  ����  0 recordcontents recordContents	� 	�	�	� o  ���� (0 recordcreationdate recordCreationDate	� 	�	�	� o  ���� 00 recordmodificationdate recordModificationDate	� 	�	�	� o  ��� �   0 recordmetadata recordMetadata	� 	�	�	� o  ������ 0 recordrating recordRating	� 	���	� o  ������ $0 recordlabelindex recordLabelIndex��  �  	�  f  ��	� J      	�	� 
 

  o      ���� 0 dtrecord dtRecord
 
��
 o      ���� $0 recordwasupdated recordWasUpdated��  	� 


 l ����������  ��  ��  
 
��
 Z  �

����
 = ��

	
 o  ������ $0 recordwasupdated recordWasUpdated
	 m  ����
�� boovtrue
 s  � 




 o  ������ 0 dtrecord dtRecord
 n      


  ;  ��
 o  ������  0 updatedrecords updatedRecords��  ��  ��  � 0 pdfannotation pdfAnnotation< o  %&���� (0 pdfannotationslist pdfAnnotationsList: 


 l 

��������  ��  ��  
 
��
 L  


 o  
����  0 updatedrecords updatedRecords��  � 


 l     ��������  ��  ��  
 


 l     ��������  ��  ��  
 


 l     ��

��  
 Z T For the given PDF, returns a list of records (where each record contains info about   
 �

 �   F o r   t h e   g i v e n   P D F ,   r e t u r n s   a   l i s t   o f   r e c o r d s   ( w h e r e   e a c h   r e c o r d   c o n t a i n s   i n f o   a b o u t
 


 l     ��

��  
 V P one of its PDF annotations) as well as any DOI extracted from the PDF metadata.   
 �

 �   o n e   o f   i t s   P D F   a n n o t a t i o n s )   a s   w e l l   a s   a n y   D O I   e x t r a c t e d   f r o m   t h e   P D F   m e t a d a t a .
 
 
!
  l     ��
"
#��  
" = 7 @param pdfPath The POSIX path to the PDF file on disk.   
# �
$
$ n   @ p a r a m   p d f P a t h   T h e   P O S I X   p a t h   t o   t h e   P D F   f i l e   o n   d i s k .
! 
%
&
% l     ��
'
(��  
' V P @param pdfurl The `x-devonthink-item://...` URL of the corresponding PDF record   
( �
)
) �   @ p a r a m   p d f u r l   T h e   ` x - d e v o n t h i n k - i t e m : / / . . . `   U R L   o f   t h e   c o r r e s p o n d i n g   P D F   r e c o r d
& 
*
+
* l     ��
,
-��  
,   in DEVONthink.   
- �
.
.    i n   D E V O N t h i n k .
+ 
/
0
/ l     ��
1
2��  
1 V P @param sourceCitekey The citekey of the publication represented by the PDF (may   
2 �
3
3 �   @ p a r a m   s o u r c e C i t e k e y   T h e   c i t e k e y   o f   t h e   p u b l i c a t i o n   r e p r e s e n t e d   b y   t h e   P D F   ( m a y
0 
4
5
4 l     ��
6
7��  
6   be empty).   
7 �
8
8    b e   e m p t y ) .
5 
9
:
9 l     ��
;
<��  
; @ : Credits: this method was inspired by a script by mdbraber   
< �
=
= t   C r e d i t s :   t h i s   m e t h o d   w a s   i n s p i r e d   b y   a   s c r i p t   b y   m d b r a b e r
: 
>
?
> l     ��
@
A��  
@  y See https://discourse.devontechnologies.com/t/stream-annotations-from-your-pdf-reading-sessions-with-devonthink/70727/30   
A �
B
B �   S e e   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / s t r e a m - a n n o t a t i o n s - f r o m - y o u r - p d f - r e a d i n g - s e s s i o n s - w i t h - d e v o n t h i n k / 7 0 7 2 7 / 3 0
? 
C
D
C i  14
E
F
E I      ��
G���� &0 pdfannotationinfo pdfAnnotationInfo
G 
H
I
H o      ���� 0 pdfpath pdfPath
I 
J
K
J o      ���� 
0 pdfurl  
K 
L��
L o      ���� 0 sourcecitekey sourceCitekey��  ��  
F k    
M
M 
N
O
N r     
P
Q
P n    
R
S
R I    ��
T���� 0 initwithurl_ initWithURL_
T 
U��
U l   
V����
V n   
W
X
W I   
 ��
Y���� $0 fileurlwithpath_ fileURLWithPath_
Y 
Z��
Z o   
 ���� 0 pdfpath pdfPath��  ��  
X n   

[
\
[ o    
���� 	0 NSURL  
\ m    ��
�� misccura��  ��  ��  ��  
S n    
]
^
] I    �������� 	0 alloc  ��  ��  
^ n    
_
`
_ o    ���� 0 pdfdocument PDFDocument
` m     ��
�� misccura
Q o      ���� 0 pdfdoc pdfDoc
O 
a
b
a l   ��������  ��  ��  
b 
c
d
c l   ��
e
f��  
e = 7 try to get any DOI from PDF metadata or first PDF page   
f �
g
g n   t r y   t o   g e t   a n y   D O I   f r o m   P D F   m e t a d a t a   o r   f i r s t   P D F   p a g e
d 
h
i
h r    $
j
k
j n   "
l
m
l I    "��
n���� 0 
doifrompdf 
doiFromPDF
n 
o
p
o o    ���� 0 pdfpath pdfPath
p 
q
r
q o    ���� 0 pdfdoc pdfDoc
r 
s��
s m    ��
�� boovtrue��  ��  
m o    ���� 0 keypointslib KeypointsLib
k o      ���� 0 pdfdoi pdfDOI
i 
t
u
t l  % %��������  ��  ��  
u 
v
w
v l  % %��
x
y��  
x = 7 iterate over each PDF page and process its annotations   
y �
z
z n   i t e r a t e   o v e r   e a c h   P D F   p a g e   a n d   p r o c e s s   i t s   a n n o t a t i o n s
w 
{
|
{ r   % .
}
~
} n  % ,

�
 I   ( ,�������� 0 new  ��  ��  
� n  % (
�
�
� o   & (����  0 nsmutablearray NSMutableArray
� m   % &��
�� misccura
~ o      ���� *0 pdfannotationsarray pdfAnnotationsArray
| 
�
�
� Y   /�
���
�
���
� l  ?�
�
�
�
� k   ?�
�
� 
�
�
� r   ? G
�
�
� l  ? E
�����
� n  ? E
�
�
� I   @ E��
����� 0 pageatindex_ pageAtIndex_
� 
���
� o   @ A���� 0 i  ��  ��  
� o   ? @���� 0 pdfdoc pdfDoc��  ��  
� o      ���� 0 pdfpage pdfPage
� 
�
�
� r   H O
�
�
� n  H M
�
�
� I   I M�������� 	0 label  ��  ��  
� o   H I���� 0 pdfpage pdfPage
� o      ���� 0 	pagelabel 	pageLabel
� 
�
�
� r   P W
�
�
� n  P U
�
�
� I   Q U�������� 0 annotations  ��  ��  
� o   P Q���� 0 pdfpage pdfPage
� o      ���� 0 pdfannotations  
� 
���
� X   X�
���
�
� k   h�
�
� 
�
�
� r   h o
�
�
� n  h m
�
�
� I   i m�������� 0 type  ��  ��  
� o   h i���� 0 pdfannotation pdfAnnotation
� o      ���� 0 	annottype 	annotType
� 
�
�
� l  p p��������  ��  ��  
� 
���
� Z   p�
�
�����
� E  p �
�
�
� J   p �
�
� 
�
�
� m   p s
�
� �
�
�  H i g h l i g h t
� 
�
�
� m   s v
�
� �
�
�  S t r i k e O u t
� 
�
�
� m   v y
�
� �
�
�  U n d e r l i n e
� 
�
�
� m   y |
�
� �
�
�  S q u i g g l y
� 
���
� m   | 
�
� �
�
�  T e x t��  
� o   � ����� 0 	annottype 	annotType
� k   ��
�
� 
�
�
� Z   � �
�
���
�
� E  � �
�
�
� J   � �
�
� 
�
�
� m   � �
�
� �
�
�  H i g h l i g h t
� 
�
�
� m   � �
�
� �
�
�  S t r i k e O u t
� 
���
� m   � �
�
� �
�
�  U n d e r l i n e��  
� o   � ����� 0 	annottype 	annotType
� r   � �
�
�
� n  � �
�
�
� I   � ��������� 0 
markuptype 
markupType��  ��  
� o   � ����� 0 pdfannotation pdfAnnotation
� o      ���� 0 
markuptype 
markupType��  
� r   � �
�
�
� m   � ���
�� 
msng
� o      ���� 0 
markuptype 
markupType
� 
�
�
� l  � �����~��  �  �~  
� 
�
�
� l  � ��}
�
��}  
� !  get the annotation's color   
� �
�
� 6   g e t   t h e   a n n o t a t i o n ' s   c o l o r
� 
�
�
� r   � �
�
�
� n  � �
�
�
� I   � ��|�{�z�| 	0 color  �{  �z  
� o   � ��y�y 0 pdfannotation pdfAnnotation
� o      �x�x 0 
annotcolor 
annotColor
� 
�
�
� l  � ��w�v�u�w  �v  �u  
� 
�
�
� l  � ��t
�
��t  
� �  approximate the name of the annotation's color via the degree of the hue in the HSB (hue, saturation, brightness) color scheme   
� �
�
� �   a p p r o x i m a t e   t h e   n a m e   o f   t h e   a n n o t a t i o n ' s   c o l o r   v i a   t h e   d e g r e e   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e
� 
�
�
� r   � �
�
�
� I  � �
�
�
�
� z�s�r
�s .sysorondlong        doub
�r misccura
� l  � �
��q�p
� ]   � �
�
�
� l  � �
��o�n
� c   � �
� 
� n  � � I   � ��m�l�k�m 0 huecomponent hueComponent�l  �k   o   � ��j�j 0 
annotcolor 
annotColor  m   � ��i
�i 
nmbr�o  �n  
� m   � ��h�hh�q  �p  
� �g�f
�g 
dire m   � ��e
�e olierndS�f  
� o      �d�d 0 	huedegree 	hueDegree
�  r   � � n  � �	 I   � ��c
�b�c "0 colornameforhue colorNameForHue
 �a o   � ��`�` 0 	huedegree 	hueDegree�a  �b  	  f   � � o      �_�_  0 annotcolorname annotColorName  l  � ��^�]�\�^  �]  �\    r   � � n  � � I   � ��[�Z�Y�[ 0 username userName�Z  �Y   o   � ��X�X 0 pdfannotation pdfAnnotation o      �W�W 0 annotusername annotUserName  r   � � n  � � I   � ��V�U�T�V $0 modificationdate modificationDate�U  �T   o   � ��S�S 0 pdfannotation pdfAnnotation o      �R�R 0 annotmoddate annotModDate  l  � ��Q�P�O�Q  �P  �O    r   � � n  � � !  I   � ��N�M�L�N 
0 bounds  �M  �L  ! o   � ��K�K 0 pdfannotation pdfAnnotation o      �J�J 0 annotbounds annotBounds "#" r   � $%$ n   � �&'& 4  � ��I(
�I 
cobj( m   � ��H�H ' o   � ��G�G 0 annotbounds annotBounds% o      �F�F 0 annotorigin annotOrigin# )*) r  $+,+ n  -.- J  // 010 4 �E2
�E 
cobj2 m  �D�D 1 3�C3 4 
�B4
�B 
cobj4 m  �A�A �C  . o  �@�@ 0 annotorigin annotOrigin, J      55 676 o      �?�? 0 	annotposx 	annotPosX7 8�>8 o      �=�= 0 	annotposy 	annotPosY�>  * 9:9 l %%�<�;�:�<  �;  �:  : ;<; l %%�9=>�9  = , & get the annotation's highlighted text   > �?? L   g e t   t h e   a n n o t a t i o n ' s   h i g h l i g h t e d   t e x t< @A@ Z  %kBC�8DB E %7EFE J  %5GG HIH m  %(JJ �KK  H i g h l i g h tI LML m  (+NN �OO  S t r i k e O u tM PQP m  +.RR �SS  U n d e r l i n eQ T�7T m  .1UU �VV  S q u i g g l y�7  F o  56�6�6 0 	annottype 	annotTypeC k  :aWW XYX r  :CZ[Z n :?\]\ I  ;?�5�4�3�5 *0 quadrilateralpoints quadrilateralPoints�4  �3  ] o  :;�2�2 0 pdfannotation pdfAnnotation[ o      �1�1 0 
quadpoints 
quadPointsY ^_^ r  DS`a` n DObcb I  EO�0d�/�0 00 annotationboundsbyline annotationBoundsByLined efe o  EH�.�. 0 
quadpoints 
quadPointsf g�-g o  HK�,�, 0 annotbounds annotBounds�-  �/  c  f  DEa o      �+�+ 0 boundsbyline boundsByLine_ h�*h r  Taiji n T]klk I  U]�)m�(�)  0 annotationtext annotationTextm non o  UV�'�' 0 pdfpage pdfPageo p�&p o  VY�%�% 0 boundsbyline boundsByLine�&  �(  l  f  TUj o      �$�$ 0 	annottext 	annotText�*  �8  D r  dkqrq m  dgss �tt  r o      �#�# 0 	annottext 	annotTextA uvu l ll�"�!� �"  �!  �   v wxw r  luyzy n lq{|{ I  mq���� 0 contents  �  �  | o  lm�� 0 pdfannotation pdfAnnotationz o      �� 0 annotcomment annotCommentx }~} l vv����  �  �  ~ � r  v���� b  v���� b  v���� b  v���� b  v���� b  v���� b  v���� b  v}��� b  v{��� o  vw�� 
0 pdfurl  � l 	wz���� m  wz�� ���  ? p a g e =�  �  � o  {|�� 0 i  � l 	}����� m  }��� ���  & a n n o t a t i o n =�  �  � o  ���� 0 	annottype 	annotType� l 	������ m  ���� ���  & x =�  �  � l ������ c  ����� o  ���� 0 	annotposx 	annotPosX� m  ���
� 
long�  �  � l 	����
�	� m  ���� ���  & y =�
  �	  � l ������ c  ����� o  ���� 0 	annotposy 	annotPosY� m  ���
� 
long�  �  � o      �� 0 annoturl annotURL� ��� l ������  �  �  � ��� l ��� ���   � [ U TODO: parse & set key/value pairs from dictionary returned by `annotationKeyValues`?   � ��� �   T O D O :   p a r s e   &   s e t   k e y / v a l u e   p a i r s   f r o m   d i c t i o n a r y   r e t u r n e d   b y   ` a n n o t a t i o n K e y V a l u e s ` ?� ��� l ��������  � y s            - `/CreationDate` (example: `/CreationDate:"D:20240810112845Z"`), set by DTTG but not DT/PDFKit on Mac?   � ��� �                         -   ` / C r e a t i o n D a t e `   ( e x a m p l e :   ` / C r e a t i o n D a t e : " D : 2 0 2 4 0 8 1 0 1 1 2 8 4 5 Z " ` ) ,   s e t   b y   D T T G   b u t   n o t   D T / P D F K i t   o n   M a c ?� ��� l ��������  � o i            - `/Name` if it contains something more concrete than just "/Note" (example: `/Name:"/Note"`)   � ��� �                         -   ` / N a m e `   i f   i t   c o n t a i n s   s o m e t h i n g   m o r e   c o n c r e t e   t h a n   j u s t   " / N o t e "   ( e x a m p l e :   ` / N a m e : " / N o t e " ` )� ��� r  ����� n ����� I  ���������� *0 annotationkeyvalues annotationKeyValues��  ��  � o  ������ 0 pdfannotation pdfAnnotation� o      ���� 0 annotkeydict annotKeyDict� ��� l ����������  ��  ��  � ���� l �������� n ����� I  ��������� 0 
addobject_ 
addObject_� ���� K  ���� ������ 0 citekey  � o  ������ 0 sourcecitekey sourceCitekey� ������ 0 page  � o  ������ 0 i  � ������ 0 	pagelabel 	pageLabel� o  ������ 0 	pagelabel 	pageLabel� ������ 0 	annottype 	annotType� o  ������ 0 	annottype 	annotType� ������ 0 
markuptype 
markupType� o  ������ 0 
markuptype 
markupType� ������ 0 
annotcolor 
annotColor� o  ������ 0 
annotcolor 
annotColor� ������  0 annotcolorname annotColorName� o  ������  0 annotcolorname annotColorName� ������ 0 username userName� o  ������ 0 annotusername annotUserName� ������ 0 modifieddate modifiedDate� o  ������ 0 annotmoddate annotModDate� ������ 0 	annottext 	annotText� o  ������ 0 	annottext 	annotText� ������ 0 comment  � o  ������ 0 annotcomment annotComment� ������� 0 deeplink deepLink� o  ������ 0 annoturl annotURL��  ��  ��  � o  ������ *0 pdfannotationsarray pdfAnnotationsArray��  ��  ��  ��  ��  ��  �� 0 pdfannotation pdfAnnotation
� o   [ \���� 0 pdfannotations  ��  
� &   PDF pages are 0-based in PDFKit   
� ��� @   P D F   p a g e s   a r e   0 - b a s e d   i n   P D F K i t�� 0 i  
� m   2 3����  
� l  3 :������ \   3 :��� l  3 8������ n  3 8��� I   4 8�������� 0 	pageCount  ��  ��  � o   3 4���� 0 pdfdoc pdfDoc��  ��  � m   8 9���� ��  ��  ��  
� ��� l ����������  ��  ��  � ���� L  ��� J  ��� ��� c  ���� o  ������ *0 pdfannotationsarray pdfAnnotationsArray� m  � ��
�� 
list� ���� o  ���� 0 pdfdoi pdfDOI��  ��  
D ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � T N Assembles the content of a Markdown record from the given PDF annotation text   � ��� �   A s s e m b l e s   t h e   c o n t e n t   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t� ��� l     ������  �   and comment.   � ���    a n d   c o m m e n t .� ��� i  58��� I      ������� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�    o      ���� 0 	annottext 	annotText �� o      ���� 0 annotcomment annotComment��  ��  � k     �  r      J     ����   o      ���� (0 recordcontentparts recordContentParts 	 Z    
����
 F     >    o    ���� 0 	annottext 	annotText m    ��
�� 
msng >    o    ���� 0 	annottext 	annotText m     �   s     b     m     �  >   l   ���� c     o    ���� 0 	annottext 	annotText m    ��
�� 
TEXT��  ��   n        ;     o    ���� (0 recordcontentparts recordContentParts��  ��  	   l     ��������  ��  ��    !"! Z     �#$����# F     7%&% F     /'(' >    #)*) o     !���� 0 annotcomment annotComment* m   ! "��
�� 
msng( >  & -+,+ o   & '���� 0 annotcomment annotComment, l  ' ,-����- n  ' ,./. o   * ,���� 0 null  / n  ' *010 o   ( *���� 0 nsnull NSNull1 m   ' (��
�� misccura��  ��  & >  2 5232 o   2 3���� 0 annotcomment annotComment3 m   3 444 �55  $ k   : �66 787 r   : =9:9 o   : ;���� 0 annotcomment annotComment: o      ���� $0 processedcomment processedComment8 ;<; l  > >��������  ��  ��  < =>= l  > >��?@��  ? Y S ensure that a first-level heading at the top of the annotation comment stays there   @ �AA �   e n s u r e   t h a t   a   f i r s t - l e v e l   h e a d i n g   a t   t h e   t o p   o f   t h e   a n n o t a t i o n   c o m m e n t   s t a y s   t h e r e> BCB l  > >��DE��  D ? 9 (even when annotation text gets inserted as a quotation)   E �FF r   ( e v e n   w h e n   a n n o t a t i o n   t e x t   g e t s   i n s e r t e d   a s   a   q u o t a t i o n )C GHG r   > AIJI m   > ?KK �LL 4 ^ ( ? : \ s * [ \ r \ n ] ) * ( # [   \ t ] + . + )J o      ���� 00 firstlevelheadingregex firstLevelHeadingRegexH MNM r   B OOPO n  B MQRQ I   G M��S���� 0 
regexmatch 
regexMatchS TUT o   G H���� 0 annotcomment annotCommentU V��V o   H I���� 00 firstlevelheadingregex firstLevelHeadingRegex��  ��  R o   B G���� 0 keypointslib KeypointsLibP o      ���� &0 firstlevelheading firstLevelHeadingN WXW Z   P ~YZ����Y >  P S[\[ o   P Q���� &0 firstlevelheading firstLevelHeading\ m   Q R]] �^^  Z k   V z__ `a` r   V dbcb n  V bded I   [ b��f���� 0 regexreplace regexReplacef ghg o   [ \���� &0 firstlevelheading firstLevelHeadingh iji o   \ ]���� 00 firstlevelheadingregex firstLevelHeadingRegexj k��k m   ] ^ll �mm  $ 1��  ��  e o   V [���� 0 keypointslib KeypointsLibc o      ���� &0 firstlevelheading firstLevelHeadinga non s   e ipqp o   e f���� &0 firstlevelheading firstLevelHeadingq n      rsr  :   g hs o   f g���� (0 recordcontentparts recordContentPartso tut l  j j����~��  �  �~  u v�}v r   j zwxw n  j xyzy I   o x�|{�{�| 0 regexreplace regexReplace{ |}| o   o p�z�z $0 processedcomment processedComment} ~~ b   p s��� o   p q�y�y 00 firstlevelheadingregex firstLevelHeadingRegex� m   q r�� ��� & [ \ r \ n ] ? ( \ s * [ \ r \ n ] ) * ��x� m   s t�� ���  �x  �{  z o   j o�w�w 0 keypointslib KeypointsLibx o      �v�v $0 processedcomment processedComment�}  ��  ��  X ��� l   �u�t�s�u  �t  �s  � ��� l   �r���r  � r l for the record content, add the remaining annotation comment w/o any metadata lines (which start with "< ")   � ��� �   f o r   t h e   r e c o r d   c o n t e n t ,   a d d   t h e   r e m a i n i n g   a n n o t a t i o n   c o m m e n t   w / o   a n y   m e t a d a t a   l i n e s   ( w h i c h   s t a r t   w i t h   " <   " )� ��� r    ���� n   ���� I   � ��q��p�q 0 regexreplace regexReplace� ��� o   � ��o�o $0 processedcomment processedComment� ��� m   � ��� ��� 6 ( ? < = ^ | [ \ r \ n ] ) <   . + ( [ \ r \ n ] | $ )� ��n� m   � ��� ���  �n  �p  � o    ��m�m 0 keypointslib KeypointsLib� o      �l�l $0 processedcomment processedComment� ��k� s   � ���� o   � ��j�j $0 processedcomment processedComment� n      ���  ;   � �� o   � ��i�i (0 recordcontentparts recordContentParts�k  ��  ��  " ��� l  � ��h�g�f�h  �g  �f  � ��e� Z   � ����d�� >  � ���� o   � ��c�c (0 recordcontentparts recordContentParts� J   � ��b�b  � r   � ���� n  � ���� I   � ��a��`�a  0 mergetextitems mergeTextItems� ��� o   � ��_�_ (0 recordcontentparts recordContentParts� ��^� b   � ���� 1   � ��]
�] 
lnfd� 1   � ��\
�\ 
lnfd�^  �`  � o   � ��[�[ 0 keypointslib KeypointsLib� o      �Z�Z  0 recordcontents recordContents�d  � r   � ���� m   � ��� ���  ( n o   c o n t e n t )� o      �Y�Y  0 recordcontents recordContents�e  � ��� l     �X�W�V�X  �W  �V  � ��� l     �U�T�S�U  �T  �S  � ��� l     �R���R  � R L Assembles the name of a Markdown record from the given PDF annotation text,   � ��� �   A s s e m b l e s   t h e   n a m e   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t ,� ��� l     �Q���Q  �   comment and page label.   � ��� 0   c o m m e n t   a n d   p a g e   l a b e l .� ��� i  9<��� I      �P��O�P B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData� ��� o      �N�N 0 	annottext 	annotText� ��� o      �M�M 0 annotcomment annotComment� ��L� o      �K�K 0 	pagelabel 	pageLabel�L  �O  � k     ��� ��� r     ��� J     �J�J  � o      �I�I "0 recordnameparts recordNameParts� ��� Z    ���H�G� F    ��� >   ��� o    �F�F 0 	pagelabel 	pageLabel� m    �E
�E 
msng� >   ��� o    �D�D 0 	pagelabel 	pageLabel� m    �� ���  � s    ��� b    ��� m    �� ���  p� l   ��C�B� c    ��� o    �A�A 0 	pagelabel 	pageLabel� m    �@
�@ 
TEXT�C  �B  � n      ���  ;    � o    �?�? "0 recordnameparts recordNameParts�H  �G  � ��� l     �>�=�<�>  �=  �<  � ��� r     #��� m     !�� ���  � o      �;�;  0 recordnamepart recordNamePart� ��� Z   $ u���:�9� F   $ /��� >  $ '��� o   $ %�8�8 0 annotcomment annotComment� m   % &�7
�7 
msng� >  * -��� o   * +�6�6 0 annotcomment annotComment� m   + ,�� �    � k   2 q  r   2 7 c   2 5 o   2 3�5�5 0 annotcomment annotComment m   3 4�4
�4 
TEXT o      �3�3 0 annotcomment annotComment 	 l  8 8�2
�2  
 f ` for the record's name, use any first-level heading (if there's one in the annotation's comment)    � �   f o r   t h e   r e c o r d ' s   n a m e ,   u s e   a n y   f i r s t - l e v e l   h e a d i n g   ( i f   t h e r e ' s   o n e   i n   t h e   a n n o t a t i o n ' s   c o m m e n t )	  r   8 E n  8 C I   = C�1�0�1 40 markdownheadingsfromtext markdownHeadingsFromText  o   = >�/�/ 0 annotcomment annotComment �. m   > ? �  #�.  �0   o   8 =�-�- 0 keypointslib KeypointsLib o      �,�, $0 markdownheadings markdownHeadings  Z   F Y�+�* >  F J o   F G�)�) $0 markdownheadings markdownHeadings J   G I�(�(   r   M U  n   M S!"! o   Q S�'�' 0 heading  " n   M Q#$# 4  N Q�&%
�& 
cobj% m   O P�%�% $ o   M N�$�$ $0 markdownheadings markdownHeadings  o      �#�#  0 recordnamepart recordNamePart�+  �*   &'& l  Z Z�"�!� �"  �!  �   ' ()( l  Z Z�*+�  * H B otherwise, use up to 12 words from the beginning of the "comment"   + �,, �   o t h e r w i s e ,   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " c o m m e n t ") -�- Z   Z q./��. =  Z ]010 o   Z [��  0 recordnamepart recordNamePart1 m   [ \22 �33  / r   ` m454 n  ` k676 I   e k�8�� (0 firstwordsfromtext firstWordsFromText8 9:9 o   e f�� 0 annotcomment annotComment: ;�; m   f g�� �  �  7 o   ` e�� 0 keypointslib KeypointsLib5 o      ��  0 recordnamepart recordNamePart�  �  �  �:  �9  � <=< l  v v����  �  �  = >?> l  v v�@A�  @ E ? else use up to 12 words from the beginning of the "annotText"    A �BB ~   e l s e   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " a n n o t T e x t "  ? CDC Z   v �EF��E =  v yGHG o   v w��  0 recordnamepart recordNamePartH m   w xII �JJ  F k   | �KK LML r   | �NON n  | �PQP I   � ��R�� (0 firstwordsfromtext firstWordsFromTextR STS o   � ��
�
 0 	annottext 	annotTextT U�	U m   � ��� �	  �  Q o   | ��� 0 keypointslib KeypointsLibO o      ��  0 recordnamepart recordNamePartM V�V Z   � �WX��W >  � �YZY o   � ���  0 recordnamepart recordNamePartZ m   � �[[ �\\  X k   � �]] ^_^ l  � ��`a�  ` e _ wrap the extracted text in quotes to indicate that it's quoted text (and not your own comment)   a �bb �   w r a p   t h e   e x t r a c t e d   t e x t   i n   q u o t e s   t o   i n d i c a t e   t h a t   i t ' s   q u o t e d   t e x t   ( a n d   n o t   y o u r   o w n   c o m m e n t )_ c� c r   � �ded b   � �fgf b   � �hih m   � �jj �kk  "i o   � �����  0 recordnamepart recordNamePartg m   � �ll �mm  "e o      ����  0 recordnamepart recordNamePart�   �  �  �  �  �  D non l  � ���������  ��  ��  o pqp Z  � �rs����r =  � �tut o   � �����  0 recordnamepart recordNamePartu m   � �vv �ww  s r   � �xyx m   � �zz �{{  ( u n t i t l e d )y o      ����  0 recordnamepart recordNamePart��  ��  q |}| s   � �~~ o   � �����  0 recordnamepart recordNamePart n      ���  ;   � �� o   � ����� "0 recordnameparts recordNameParts} ��� l  � ���������  ��  ��  � ��� Z   � ������� >  � ���� o   � ����� "0 recordnameparts recordNameParts� J   � �����  � r   � ���� n  � ���� I   � ��������  0 mergetextitems mergeTextItems� ��� o   � ����� "0 recordnameparts recordNameParts� ���� m   � ��� ���  :  ��  ��  � o   � ����� 0 keypointslib KeypointsLib� o      ���� 0 
recordname 
recordName��  � r   � ���� m   � ��� ���  ( u n t i t l e d )� o      ���� 0 
recordname 
recordName� ��� l  � ���������  ��  ��  � ���� L   � ��� o   � ����� 0 
recordname 
recordName��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � U O Creates a new (Markdown) record in DEVONthink with the given text & properties   � ��� �   C r e a t e s   a   n e w   ( M a r k d o w n )   r e c o r d   i n   D E V O N t h i n k   w i t h   t h e   g i v e n   t e x t   &   p r o p e r t i e s� ��� l     ������  � [ U and returns it. If an existing record with the same URL exists at the same location,   � ��� �   a n d   r e t u r n s   i t .   I f   a n   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   e x i s t s   a t   t h e   s a m e   l o c a t i o n ,� ��� l     ������  � 9 3 this record will get updated and returned instead.   � ��� f   t h i s   r e c o r d   w i l l   g e t   u p d a t e d   a n d   r e t u r n e d   i n s t e a d .� ��� l     ������  � _ Y Note that the actual return value is a list with two items with the first item being the   � ��� �   N o t e   t h a t   t h e   a c t u a l   r e t u r n   v a l u e   i s   a   l i s t   w i t h   t w o   i t e m s   w i t h   t h e   f i r s t   i t e m   b e i n g   t h e� ��� l     ������  � Z T created/modified record and the second item being a boolean value indicating if the   � ��� �   c r e a t e d / m o d i f i e d   r e c o r d   a n d   t h e   s e c o n d   i t e m   b e i n g   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h e� ��� l     ������  � L F returned record actually has been modified ('true') or not (`false`):   � ��� �   r e t u r n e d   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) :� ��� l     ������  � "  `{dtRecord, didUpdateNote}`   � ��� 8   ` { d t R e c o r d ,   d i d U p d a t e N o t e } `� ��� l     ������  � 6 0 Credits: modified after script code by Rob Trew   � ��� `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     ������  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i  =@��� I      �������  0 createdtrecord createDTRecord� ��� o      ����  0 folderlocation folderLocation� ��� o      ����  0 foldermetadata folderMetadata� ��� o      ���� 0 
recordname 
recordName� ��� o      ���� 0 recordaliases recordAliases� ��� o      ���� 0 	recordurl 	recordURL� ��� o      ���� 0 
recordtags 
recordTags� ��� o      ���� 0 	isflagged 	isFlagged� ��� o      ���� 0 
recordtext 
recordText� ��� o      ���� (0 recordcreationdate recordCreationDate� ��� o      ���� 00 recordmodificationdate recordModificationDate� ��� o      ����  0 recordmetadata recordMetadata� ��� o      ���� 0 recordrating recordRating� ���� o      ���� $0 recordlabelindex recordLabelIndex��  ��  � O    ��� k   �� ��� r    ��� K    �� ����
�� 
DTty� m   	 
��
�� Ctypmkdn� ����
�� 
DTcn� o    ���� 0 
recordtext 
recordText� �����
�� 
pnam� o    ���� 0 
recordname 
recordName��  � o      ���� 0 newrecorddata newRecordData� ��� l   ��������  ��  ��  � ��� Z    %������� >   � � o    ���� (0 recordcreationdate recordCreationDate  m    ��
�� 
msng� r    ! b     o    ���� 0 newrecorddata newRecordData K     ����
�� 
DTcr o    ���� (0 recordcreationdate recordCreationDate��   o      ���� 0 newrecorddata newRecordData��  ��  �  l  & &��������  ��  ��   	
	 Z   & 8���� >  & ) o   & '���� 0 	recordurl 	recordURL m   ' ( �   r   , 4 b   , 2 o   , -���� 0 newrecorddata newRecordData K   - 1 ����
�� 
pURL o   . /���� 0 	recordurl 	recordURL��   o      ���� 0 newrecorddata newRecordData��  ��  
  l  9 9��������  ��  ��    Z   9 K���� >  9 < o   9 :���� 0 recordaliases recordAliases m   : ; �     r   ? G!"! b   ? E#$# o   ? @���� 0 newrecorddata newRecordData$ K   @ D%% ��&��
�� 
DTal& o   A B���� 0 recordaliases recordAliases��  " o      ���� 0 newrecorddata newRecordData��  ��   '(' l  L L��������  ��  ��  ( )*) r   L O+,+ m   L M��
�� 
msng, o      ���� 0 arecord aRecord* -.- r   P S/0/ m   P Q��
�� boovfals0 o      ���� 0 didcreatenote didCreateNote. 121 r   T Y343 m   T U��
�� boovfals4 o      ���� 0 didupdatenote didUpdateNote2 565 l  Z Z��������  ��  ��  6 787 l  Z Z��9:��  9 Q K use any existing record with the same URL that exists at the same location   : �;; �   u s e   a n y   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   t h a t   e x i s t s   a t   t h e   s a m e   l o c a t i o n8 <=< r   Z _>?> m   Z [��
�� boovfals? o      ���� $0 isexistingrecord isExistingRecord= @A@ Z   ` �BC����B >  ` cDED o   ` a���� 0 	recordurl 	recordURLE m   a bFF �GG  C k   f �HH IJI r   f oKLK I  f k��M��
�� .DTpacd49list       utxtM o   f g���� 0 	recordurl 	recordURL��  L o      ���� "0 existingrecords existingRecordsJ N��N Z   p �OP����O >  p vQRQ o   p s���� "0 existingrecords existingRecordsR J   s u��  P k   y �SS TUT r   y �VWV b   y �XYX b   y �Z[Z n   y ~\]\ 1   z ~�~
�~ 
DTlo] o   y z�}�}  0 folderlocation folderLocation[ n   ~ �^_^ 1    ��|
�| 
pnam_ o   ~ �{�{  0 folderlocation folderLocationY m   � �`` �aa  /W o      �z�z  0 targetlocation targetLocationU b�yb X   � �c�xdc Z   � �ef�w�ve F   � �ghg l  � �i�u�ti =  � �jkj o   � ��s�s 0 arecord aRecordk m   � ��r
�r 
msng�u  �t  h l  � �l�q�pl =   � �mnm n   � �opo 1   � ��o
�o 
DTlop o   � ��n�n  0 existingrecord existingRecordn o   � ��m�m  0 targetlocation targetLocation�q  �p  f k   � �qq rsr r   � �tut o   � ��l�l  0 existingrecord existingRecordu o      �k�k 0 arecord aRecords v�jv r   � �wxw m   � ��i
�i boovtruex o      �h�h $0 isexistingrecord isExistingRecord�j  �w  �v  �x  0 existingrecord existingRecordd o   � ��g�g "0 existingrecords existingRecords�y  ��  ��  ��  ��  ��  A yzy l  � ��f�e�d�f  �e  �d  z {|{ Z   �}~�c�b} =  � �� o   � ��a�a 0 arecord aRecord� m   � ��`
�` 
msng~ k   ��� ��� r   � ���� I  � ��_��
�_ .DTpacd08DTrc       reco� o   � ��^�^ 0 newrecorddata newRecordData� �]��\
�] 
DTin� o   � ��[�[  0 folderlocation folderLocation�\  � o      �Z�Z 0 arecord aRecord� ��� l  � ��Y�X�W�Y  �X  �W  � ��� l  � ��V���V  � c ] newly created Markdown notes inherit their notes folder's existing metadata & Finder comment   � ��� �   n e w l y   c r e a t e d   M a r k d o w n   n o t e s   i n h e r i t   t h e i r   n o t e s   f o l d e r ' s   e x i s t i n g   m e t a d a t a   &   F i n d e r   c o m m e n t� ��� r   � ���� b   � ���� o   � ��U�U  0 recordmetadata recordMetadata� o   � ��T�T  0 foldermetadata folderMetadata� o      �S�S  0 recordmetadata recordMetadata� ��� r   � ���� n  � ���� 1   � ��R
�R 
DTco� o   � ��Q�Q  0 folderlocation folderLocation� n     ��� 1   � ��P
�P 
DTco� o   � ��O�O 0 arecord aRecord� ��� l  � ��N�M�L�N  �M  �L  � ��� r   � ���� m   � ��K
�K boovtrue� o      �J�J 0 didcreatenote didCreateNote� ��I� r   ���� [   ���� o   ��H�H &0 creatednotescount createdNotesCount� m  �G�G � o      �F�F &0 creatednotescount createdNotesCount�I  �c  �b  | ��� l �E�D�C�E  �D  �C  � ��� Z  ���B�A� G  #��� = ��� o  �@�@ $0 isexistingrecord isExistingRecord� m  �?
�? boovfals� = ��� o  �>�> *0 updateexistingnotes updateExistingNotes� m  �=
�= boovtrue� k  &�� ��� Z  &K���<�;� = &-��� o  &+�:�: 80 updatenameforexistingnotes updateNameForExistingNotes� m  +,�9
�9 boovtrue� Z  0G���8�7� >  05��� n  03��� 1  13�6
�6 
pnam� o  01�5�5 0 arecord aRecord� o  34�4�4 0 
recordname 
recordName� k  8C�� ��� r  8=��� m  89�3
�3 boovtrue� o      �2�2 0 didupdatenote didUpdateNote� ��1� r  >C��� o  >?�0�0 0 
recordname 
recordName� n      ��� 1  @B�/
�/ 
pnam� o  ?@�.�. 0 arecord aRecord�1  �8  �7  �<  �;  � ��� l LL�-�,�+�-  �,  �+  � ��� Z  Lu���*�)� = LS��� o  LQ�(�( F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes� m  QR�'
�' boovtrue� Z  Vq���&�%� >  V]��� n  V[��� 1  W[�$
�$ 
DTpl� o  VW�#�# 0 arecord aRecord� o  [\�"�" 0 
recordtext 
recordText� k  `m�� ��� r  `e��� m  `a�!
�! boovtrue� o      � �  0 didupdatenote didUpdateNote� ��� r  fm��� o  fg�� 0 
recordtext 
recordText� n      ��� 1  hl�
� 
DTpl� o  gh�� 0 arecord aRecord�  �&  �%  �*  �)  � ��� l vv����  �  �  � ��� Z  v������ F  v���� l v����� G  v���� = v{��� o  vy�� $0 isexistingrecord isExistingRecord� m  yz�
� boovfals� = ~���� o  ~��� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes� m  ���
� boovtrue�  �  � > ����� o  ���� 00 recordmodificationdate recordModificationDate� m  ���
� 
msng� k  ���� ��� l ������  � j d TODO: should we force update recordModificationDate when an existing record's property got updated?   � ��� �   T O D O :   s h o u l d   w e   f o r c e   u p d a t e   r e c o r d M o d i f i c a t i o n D a t e   w h e n   a n   e x i s t i n g   r e c o r d ' s   p r o p e r t y   g o t   u p d a t e d ?� ��� Z  ������� >  ����� n  ��   1  ���

�
 
DTmo o  ���	�	 0 arecord aRecord� o  ���� 00 recordmodificationdate recordModificationDate� k  ��  r  �� m  ���
� boovtrue o      �� 0 didupdatenote didUpdateNote � r  ��	 o  ���� 00 recordmodificationdate recordModificationDate	 n      

 1  ���
� 
DTmo o  ���� 0 arecord aRecord�  �  �  �  �  �  �  l ���� ���  �   ��    Z  ������ G  �� = �� o  ������ $0 isexistingrecord isExistingRecord m  ����
�� boovfals = �� o  ������ J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes m  ����
�� boovtrue Z  ������ >  �� n  �� 1  ����
�� 
DTst o  ������ 0 arecord aRecord o  ������ 0 	isflagged 	isFlagged k  ��   r  ��!"! m  ����
�� boovtrue" o      ���� 0 didupdatenote didUpdateNote  #��# r  ��$%$ o  ������ 0 	isflagged 	isFlagged% n      &'& 1  ����
�� 
DTst' o  ������ 0 arecord aRecord��  ��  ��  ��  ��   ()( l ����������  ��  ��  ) *+* Z  �!,-����, G  ��./. = ��010 o  ������ $0 isexistingrecord isExistingRecord1 m  ����
�� boovfals/ = ��232 o  ������ <0 updateratingforexistingnotes updateRatingForExistingNotes3 m  ����
�� boovtrue- Z  45����4 >  	676 n  898 1  ��
�� 
DTrt9 o  ���� 0 arecord aRecord7 o  ���� 0 recordrating recordRating5 k  :: ;<; r  =>= m  ��
�� boovtrue> o      ���� 0 didupdatenote didUpdateNote< ?��? r  @A@ o  ���� 0 recordrating recordRatingA n      BCB 1  ��
�� 
DTrtC o  ���� 0 arecord aRecord��  ��  ��  ��  ��  + DED l ""��������  ��  ��  E FGF Z  "WHI����H G  "5JKJ = "'LML o  "%���� $0 isexistingrecord isExistingRecordM m  %&��
�� boovfalsK = *1NON o  */���� :0 updatelabelforexistingnotes updateLabelForExistingNotesO m  /0��
�� boovtrueI Z  8SPQ����P >  8?RSR n  8=TUT 1  9=��
�� 
DTlaU o  89���� 0 arecord aRecordS o  =>���� $0 recordlabelindex recordLabelIndexQ k  BOVV WXW r  BGYZY m  BC��
�� boovtrueZ o      ���� 0 didupdatenote didUpdateNoteX [��[ r  HO\]\ o  HI���� $0 recordlabelindex recordLabelIndex] n      ^_^ 1  JN��
�� 
DTla_ o  IJ���� 0 arecord aRecord��  ��  ��  ��  ��  G `a` l XX��������  ��  ��  a bcb Z  X�de����d F  Xvfgf l Xkh����h G  Xkiji = X]klk o  X[���� $0 isexistingrecord isExistingRecordl m  [\��
�� boovfalsj = `gmnm o  `e���� 80 updatetagsforexistingnotes updateTagsForExistingNotesn m  ef��
�� boovtrue��  ��  g > nropo o  no���� 0 
recordtags 
recordTagsp J  oq����  e k  y�qq rsr r  y�tut n  y~vwv 1  z~��
�� 
tagsw o  yz���� 0 arecord aRecordu o      ���� (0 existingrecordtags existingRecordTagss xyx X  ��z��{z Z ��|}����| H  ��~~ E ��� o  ������ (0 existingrecordtags existingRecordTags� o  ������ 0 atag aTag} r  ����� m  ����
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote��  ��  �� 0 atag aTag{ o  ������ 0 
recordtags 
recordTagsy ���� r  ����� b  ����� o  ������ (0 existingrecordtags existingRecordTags� o  ������ 0 
recordtags 
recordTags� n      ��� 1  ����
�� 
tags� o  ������ 0 arecord aRecord��  ��  ��  c ��� l ����������  ��  ��  � ��� Z  ��������� l �������� G  ����� = ����� o  ������ $0 isexistingrecord isExistingRecord� m  ����
�� boovfals� = ����� o  ������ L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes� m  ����
�� boovtrue��  ��  � Z  ��������� l �������� n ����� I  ��������� 60 updatemetadatafordtrecord updateMetadataForDTRecord� ��� o  ������ 0 arecord aRecord� ���� o  ������  0 recordmetadata recordMetadata��  ��  �  f  ����  ��  � r  ����� m  ����
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote��  ��  ��  ��  � ��� l ����������  ��  ��  � ���� Z  �������� F  ����� = ����� o  ������ 0 didupdatenote didUpdateNote� m  ����
�� boovtrue� = ����� o  ������ 0 didcreatenote didCreateNote� m  ����
�� boovfals� r  ��� [  ��� o  ���� &0 updatednotescount updatedNotesCount� m  ���� � o      ���� &0 updatednotescount updatedNotesCount��  ��  ��  �B  �A  � ��� l ��������  ��  ��  � ���� L  �� J  �� ��� o  ���� 0 arecord aRecord� ���� o  �� 0 didupdatenote didUpdateNote��  ��  � 5     �~��}
�~ 
capp� m    �� ���  D N t p
�} kfrmID  � ��� l     �|�{�z�|  �{  �z  � ��� l     �y�x�w�y  �x  �w  � ��� l     �v���v  � > 8 Sets the custom metadata of the given DEVONthink group.   � ��� p   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .� ��� l     �u���u  � U O @param folderLocation The DEVONthink group whose custom metadata shall be set.   � ��� �   @ p a r a m   f o l d e r L o c a t i o n   T h e   D E V O N t h i n k   g r o u p   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .� ��� l     �t���t  � M G @param folderMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   f o l d e r M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  AD��� I      �s��r�s 00 setmetadatafordtfolder setMetadataForDTFolder� ��� o      �q�q  0 folderlocation folderLocation� ��p� o      �o�o  0 foldermetadata folderMetadata�p  �r  � Z     5���n�m� F      ��� F     ��� F     ��� =    ��� o     �l�l P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders� m    �k
�k boovtrue� >  
 ��� o   
 �j�j  0 folderlocation folderLocation� m    �i
�i 
msng� >   ��� o    �h�h  0 foldermetadata folderMetadata� m    �g
�g 
msng� >   ��� o    �f�f  0 foldermetadata folderMetadata� J    �e�e  � O  # 1��� r   + 0��� o   + ,�d�d  0 foldermetadata folderMetadata� n      ��� 1   - /�c
�c 
DTcm� o   , -�b�b  0 folderlocation folderLocation� 5   # (�a��`
�a 
capp� m   % &�� ���  D N t p
�` kfrmID  �n  �m  � ��� l     �_�^�]�_  �^  �]  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y���Y  � ? 9 Sets the custom metadata of the given DEVONthink record.   � ��� r   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .� ��� l     �X���X  � O I @param aRecord The DEVONthink record whose custom metadata shall be set.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .� ��� l     �W �W    M G @param recordMetadata The record of custom metadata that shall be set.    � �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .�  i  EH I      �V�U�V 00 setmetadatafordtrecord setMetadataForDTRecord 	 o      �T�T 0 arecord aRecord	 
�S
 o      �R�R  0 recordmetadata recordMetadata�S  �U   Z     )�Q�P F      F      >     o     �O�O 0 arecord aRecord m    �N
�N 
msng >   	 o    �M�M  0 recordmetadata recordMetadata m    �L
�L 
msng >    o    �K�K  0 recordmetadata recordMetadata J    �J�J   O   % r    $ o     �I�I  0 recordmetadata recordMetadata n       1   ! #�H
�H 
DTcm o     !�G�G 0 arecord aRecord 5    �F�E
�F 
capp m     �  D N t p
�E kfrmID  �Q  �P    !  l     �D�C�B�D  �C  �B  ! "#" l     �A�@�?�A  �@  �?  # $%$ l     �>&'�>  & l f Updates the custom metadata of the given DEVONthink record. Returns a boolean value indicating if the   ' �(( �   U p d a t e s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h e% )*) l     �=+,�=  + I C given record actually has been modified ('true') or not (`false`).   , �-- �   g i v e n   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) .* ./. l     �<01�<  0 S M @param aRecord The DEVONthink record whose custom metadata shall be updated.   1 �22 �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   u p d a t e d ./ 343 l     �;56�;  5 M G @param recordMetadata The record of custom metadata that shall be set.   6 �77 �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .4 898 i  IL:;: I      �:<�9�: 60 updatemetadatafordtrecord updateMetadataForDTRecord< =>= o      �8�8 0 arecord aRecord> ?�7? o      �6�6  0 recordmetadata recordMetadata�7  �9  ; k     �@@ ABA Z    CD�5�4C G     EFE G     GHG =    IJI o     �3�3 0 arecord aRecordJ m    �2
�2 
msngH =   	KLK o    �1�1  0 recordmetadata recordMetadataL m    �0
�0 
msngF =   MNM o    �/�/  0 recordmetadata recordMetadataN J    �.�.  D L    OO m    �-
�- boovfals�5  �4  B PQP l   �,�+�*�,  �+  �*  Q RSR r    !TUT m    �)
�) boovfalsU o      �(�( 0 didupdatenote didUpdateNoteS VWV l  " "�'�&�%�'  �&  �%  W XYX O   " �Z[Z k   * �\\ ]^] r   * /_`_ n   * -aba 1   + -�$
�$ 
DTcmb o   * +�#�# 0 arecord aRecord` o      �"�" 00 existingrecordmetadata existingRecordMetadata^ cdc Q   0 Mefge k   3 Ahh iji l  3 3�!kl�!  k Y S existingRecordMetadata may be undefined in which case this triggers the error case   l �mm �   e x i s t i n g R e c o r d M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s ej n� n Z  3 Aop��o =  3 6qrq o   3 4�� 00 existingrecordmetadata existingRecordMetadatar m   4 5�
� 
msngp r   9 =sts J   9 ;��  t o      �� 00 existingrecordmetadata existingRecordMetadata�  �  �   f R      ���
� .ascrerr ****      � ****�  �  g r   I Muvu J   I K��  v o      �� 00 existingrecordmetadata existingRecordMetadatad wxw l  N N����  �  �  x yzy Z   N �{|��{ >  N R}~} o   N O�� 00 existingrecordmetadata existingRecordMetadata~ J   O Q��  | k   U � ��� r   U a��� n  U _��� I   Z _���� 0 keysofrecord_ keysOfRecord_� ��� o   Z [�
�
 00 existingrecordmetadata existingRecordMetadata�  �  � o   U Z�	�	 0 keypointslib KeypointsLib� o      �� 0 existingkeys existingKeys� ��� r   b n��� n  b l��� I   g l���� 0 keysofrecord_ keysOfRecord_� ��� o   g h��  0 recordmetadata recordMetadata�  �  � o   b g�� 0 keypointslib KeypointsLib� o      �� 0 thekeys theKeys� ��� l  o o�� ���  �   ��  � ��� l  o o������  � � � NOTE: updating non-empty values for existing keys doesn't seem to work unless we clear the key's value or remove the key entirely   � ���   N O T E :   u p d a t i n g   n o n - e m p t y   v a l u e s   f o r   e x i s t i n g   k e y s   d o e s n ' t   s e e m   t o   w o r k   u n l e s s   w e   c l e a r   t h e   k e y ' s   v a l u e   o r   r e m o v e   t h e   k e y   e n t i r e l y� ��� X   o ������ k    ��� ��� r    ���� n   ���� I   � �������� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName� ���� o   � ����� 0 thekey theKey��  ��  �  f    �� o      ���� 0 dtkey dtKey� ��� l  � ���������  ��  ��  � ���� Z   � ������� E  � ���� o   � ����� 0 existingkeys existingKeys� o   � ����� 0 dtkey dtKey� k   � ��� ��� r   � ���� l  � ������� n  � ���� I   � �������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� o   � ����� 0 thekey theKey� ���� o   � �����  0 recordmetadata recordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib��  ��  � o      ���� 0 thevalue theValue� ��� r   � ���� l  � ������� n  � ���� I   � �������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� o   � ����� 0 dtkey dtKey� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib��  ��  � o      ���� 0 existingvalue existingValue� ��� l  � ���������  ��  ��  � ���� Z   � �������� >   � ���� o   � ����� 0 thevalue theValue� o   � ����� 0 existingvalue existingValue� k   � ��� ��� r   � ���� m   � ���
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote� ���� r   � ���� l  � ������� n  � ���� I   � �������� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_� ��� l  � ������� m   � ���
�� 
msng��  ��  � ��� o   � ����� 0 dtkey dtKey� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib��  ��  � o      ���� 00 existingrecordmetadata existingRecordMetadata��  ��  ��  ��  ��  � r   � ���� m   � ���
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote��  �� 0 thekey theKey� o   r s���� 0 thekeys theKeys� ��� l  � ���������  ��  ��  � ���� r   � ���� n  � ���� I   � �������� <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_� ��� o   � �����  0 recordmetadata recordMetadata� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib� o      ����  0 recordmetadata recordMetadata��  �  �  z ��� l  � ���������  ��  ��  � ���� r   � ���� o   � �����  0 recordmetadata recordMetadata� n      ��� 1   � ���
�� 
DTcm� o   � ����� 0 arecord aRecord��  [ 5   " '�����
�� 
capp� m   $ %�� ���  D N t p
�� kfrmID  Y ��� l  � ���������  ��  ��  � ���� L   � ��� o   � ����� 0 didupdatenote didUpdateNote��  9 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � [ U Returns the metadata identifier name that DEVONthink would use in scripting contexts   � ��� �   R e t u r n s   t h e   m e t a d a t a   i d e n t i f i e r   n a m e   t h a t   D E V O N t h i n k   w o u l d   u s e   i n   s c r i p t i n g   c o n t e x t s�    l     ����     for the given key name.    � 0   f o r   t h e   g i v e n   k e y   n a m e .  i  MP I      ��	���� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName	 
��
 o      ���� 0 thekey theKey��  ��   k        r      n    
 I    
������ 0 lowercasetext lowercaseText �� o    ���� 0 thekey theKey��  ��   o     ���� 0 keypointslib KeypointsLib o      ���� 0 dtkey dtKey  r     n    I    ������ 0 regexreplace regexReplace  o    ���� 0 dtkey dtKey  m     �    \ s + !��! m    "" �##  ��  ��   o    ���� 0 keypointslib KeypointsLib o      ���� 0 dtkey dtKey $%$ l   ��������  ��  ��  % &��& L     '' b    ()( m    ** �++  m d) o    ���� 0 dtkey dtKey��   ,-, l     ��������  ��  ��  - ./. l     ��������  ��  ��  / 010 l     ��23��  2 T N Appends the given string to the Finder comment of the given DEVONthink group.   3 �44 �   A p p e n d s   t h e   g i v e n   s t r i n g   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .1 565 i  QT787 I      ��9���� 60 appendtocommentofdtfolder appendToCommentOfDTFolder9 :;: o      ����  0 folderlocation folderLocation; <��< o      ���� 0 foldercomment folderComment��  ��  8 Z     T=>����= F     ?@? >    ABA o     ���� 0 foldercomment folderCommentB m    �
� 
msng@ >   
CDC o    �~�~ 0 foldercomment folderCommentD J    	�}�}  > k    PEE FGF r    HIH J    �|�|  I o      �{�{ 0 commentparts commentPartsG J�zJ O    PKLK k    OMM NON r    !PQP l   R�y�xR n    STS 1    �w
�w 
DTcoT o    �v�v  0 folderlocation folderLocation�y  �x  Q o      �u�u .0 existingfoldercomment existingFolderCommentO UVU Z  " 8WX�t�sW F   " -YZY >  " %[\[ o   " #�r�r .0 existingfoldercomment existingFolderComment\ m   # $�q
�q 
msngZ >  ( +]^] o   ( )�p�p .0 existingfoldercomment existingFolderComment^ m   ) *__ �``  X s   0 4aba o   0 1�o�o .0 existingfoldercomment existingFolderCommentb n      cdc  ;   2 3d o   1 2�n�n 0 commentparts commentParts�t  �s  V efe s   9 =ghg o   9 :�m�m 0 foldercomment folderCommenth n      iji  ;   ; <j o   : ;�l�l 0 commentparts commentPartsf klk l  > >�k�j�i�k  �j  �i  l m�hm r   > Onon n  > Kpqp I   C K�gr�f�g  0 mergetextitems mergeTextItemsr sts o   C D�e�e 0 commentparts commentPartst u�du b   D Gvwv 1   D E�c
�c 
lnfdw 1   E F�b
�b 
lnfd�d  �f  q o   > C�a�a 0 keypointslib KeypointsLibo n      xyx 1   L N�`
�` 
DTcoy o   K L�_�_  0 folderlocation folderLocation�h  L 5    �^z�]
�^ 
cappz m    {{ �||  D N t p
�] kfrmID  �z  ��  ��  6 }~} l     �\�[�Z�\  �[  �Z  ~ � l     �Y�X�W�Y  �X  �W  � ��� l     �V���V  � c ] Returns a record of bibliographic metadata for the given DOI (as fetched from OpenAlex.org),   � ��� �   R e t u r n s   a   r e c o r d   o f   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   g i v e n   D O I   ( a s   f e t c h e d   f r o m   O p e n A l e x . o r g ) ,� ��� l     �U���U  � 9 3 ready to be used as custom metadata in DEVONthink.   � ��� f   r e a d y   t o   b e   u s e d   a s   c u s t o m   m e t a d a t a   i n   D E V O N t h i n k .� ��� l     �T���T  � L F @param doi The DOI for which bibliographic metadata shall be fetched.   � ��� �   @ p a r a m   d o i   T h e   D O I   f o r   w h i c h   b i b l i o g r a p h i c   m e t a d a t a   s h a l l   b e   f e t c h e d .� ��� l     �S���S  � ` Z @param citekey The citekey to be used with the fetched BibTeX data; may be empty in which   � ��� �   @ p a r a m   c i t e k e y   T h e   c i t e k e y   t o   b e   u s e d   w i t h   t h e   f e t c h e d   B i b T e X   d a t a ;   m a y   b e   e m p t y   i n   w h i c h� ��� l     �R���R  � + % case a default citekey will be used.   � ��� J   c a s e   a   d e f a u l t   c i t e k e y   w i l l   b e   u s e d .� ��� l     �Q���Q  � ` Z TODO: allow to specify which metadata shall get exported into which custom metadata field   � ��� �   T O D O :   a l l o w   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l d� ��� i  UX��� I      �P��O�P &0 bibmetadatafordoi bibMetadataForDOI� ��� o      �N�N 0 doi  � ��M� o      �L�L 0 citekey  �M  �O  � k    �� ��� Z    ���K�J� G     ��� =    ��� o     �I�I 0 doi  � m    �H
�H 
msng� =   	��� o    �G�G 0 doi  � m    �� ���  � L    �� J    �F�F  �K  �J  � ��� l   �E�D�C�E  �D  �C  � ��� r    /��� n   -��� I    -�B��A�B  0 metadatafordoi metadataForDOI� ��� o    �@�@ 0 doi  � ��� o    !�?�? 0 fetchbibtex fetchBibTeX� ��� o   ! &�>�> 00 fetchformattedcitation fetchFormattedCitation� ��� m   & '�� ���  a p a� ��� m   ' (�� ��� 
 e n - G B� ��=� o   ( )�<�< 0 citekey  �=  �A  � o    �;�; 0 keypointslib KeypointsLib� o      �:�: "0 publicationdata publicationData� ��� Z  0 >���9�8� =  0 4��� o   0 1�7�7 "0 publicationdata publicationData� J   1 3�6�6  � L   7 :�� J   7 9�5�5  �9  �8  � ��� l  ? ?�4�3�2�4  �3  �2  � ��� r   ? C��� J   ? A�1�1  � o      �0�0 0 bibmetadata bibMetadata� ��� l  D D�/�.�-�/  �.  �-  � ��� l  D Q���� r   D Q��� n  D O��� I   I O�,��+�, .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m   I J�� ���  a u t h o r s� ��*� o   J K�)�) "0 publicationdata publicationData�*  �+  � o   D I�(�( 0 keypointslib KeypointsLib� o      �'�' 0 
pubauthors 
pubAuthors� 4 . single author: string, multiple authors: list   � ��� \   s i n g l e   a u t h o r :   s t r i n g ,   m u l t i p l e   a u t h o r s :   l i s t� ��� Z   R ����&�%� F   R f��� F   R ]��� >  R U��� o   R S�$�$ 0 
pubauthors 
pubAuthors� m   S T�#
�# 
msng� >  X [��� o   X Y�"�" 0 
pubauthors 
pubAuthors� m   Y Z�� ���  � >  ` d��� o   ` a�!�! 0 
pubauthors 
pubAuthors� J   a c� �   � k   i ��� ��� r   i {� � b   i y o   i j�� 0 bibmetadata bibMetadata K   j x ��� 0 authors   l  k v�� n  k v I   p v���  0 mergetextitems mergeTextItems 	
	 o   p q�� 0 
pubauthors 
pubAuthors
 � 1   q r�
� 
lnfd�  �   o   k p�� 0 keypointslib KeypointsLib�  �  �    o      �� 0 bibmetadata bibMetadata�  l  | |����  �  �    r   | � I  | ���
� .corecnte****       **** o   | }�� 0 
pubauthors 
pubAuthors�   o      �� "0 pubauthorscount pubAuthorsCount � Z   � � =  � � o   � ��� "0 pubauthorscount pubAuthorsCount m   � ��
�
  r   � � b   � � o   � ��	�	 0 bibmetadata bibMetadata K   � � ��� 
0 author   n   � � !  4  � ��"
� 
cobj" m   � ��� ! o   � ��� 0 
pubauthors 
pubAuthors�   o      �� 0 bibmetadata bibMetadata #$# =  � �%&% o   � ��� "0 pubauthorscount pubAuthorsCount& m   � ��� $ '� ' r   � �()( b   � �*+* o   � ����� 0 bibmetadata bibMetadata+ K   � �,, ��-���� 
0 author  - b   � �./. b   � �010 n   � �232 4  � ���4
�� 
cobj4 m   � ����� 3 o   � ����� 0 
pubauthors 
pubAuthors1 m   � �55 �66    &  / n   � �787 4  � ���9
�� 
cobj9 m   � ����� 8 o   � ����� 0 
pubauthors 
pubAuthors��  ) o      ���� 0 bibmetadata bibMetadata�    l  � �:;<: r   � �=>= b   � �?@? o   � ����� 0 bibmetadata bibMetadata@ K   � �AA ��B���� 
0 author  B b   � �CDC n   � �EFE 4  � ���G
�� 
cobjG m   � ����� F o   � ����� 0 
pubauthors 
pubAuthorsD m   � �HH �II    e t   a l .��  > o      ���� 0 bibmetadata bibMetadata;  
 3 or more   < �JJ    3   o r   m o r e�  �&  �%  � KLK l  � ���������  ��  ��  L MNM r   � �OPO n  � �QRQ I   � ���S���� .0 valueforkey_inrecord_ valueForKey_inRecord_S TUT m   � �VV �WW  d a t eU X��X o   � ����� "0 publicationdata publicationData��  ��  R o   � ����� 0 keypointslib KeypointsLibP o      ���� 0 pubdate pubDateN YZY Z  � �[\����[ >  � �]^] o   � ����� 0 pubdate pubDate^ m   � ���
�� 
msng\ r   � �_`_ b   � �aba o   � ����� 0 bibmetadata bibMetadatab K   � �cc ��d���� 0 date  d c   � �efe o   � ����� 0 pubdate pubDatef m   � ���
�� 
ldt ��  ` o      ���� 0 bibmetadata bibMetadata��  ��  Z ghg l  � ���������  ��  ��  h iji r   �klk n  � �mnm I   � ���o���� .0 valueforkey_inrecord_ valueForKey_inRecord_o pqp m   � �rr �ss  p u b l i s h e rq t��t o   � ����� "0 publicationdata publicationData��  ��  n o   � ����� 0 keypointslib KeypointsLibl o      ���� 0 pubpublisher pubPublisherj uvu Z  wx����w F  yzy > {|{ o  ���� 0 pubpublisher pubPublisher| m  ��
�� 
msngz > }~} o  	���� 0 pubpublisher pubPublisher~ m  	 ���  x r  ��� b  ��� o  ���� 0 bibmetadata bibMetadata� K  �� ������� 0 	publisher  � o  ���� 0 pubpublisher pubPublisher��  � o      ���� 0 bibmetadata bibMetadata��  ��  v ��� l !!��������  ��  ��  � ��� r  !0��� n !.��� I  &.������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  &)�� ���  i s s n� ���� o  )*���� "0 publicationdata publicationData��  ��  � o  !&���� 0 keypointslib KeypointsLib� o      ���� 0 pubissn pubISSN� ��� Z 1O������� F  1>��� > 14��� o  12���� 0 pubissn pubISSN� m  23��
�� 
msng� > 7<��� o  78���� 0 pubissn pubISSN� m  8;�� ���  � r  AK��� b  AI��� o  AB���� 0 bibmetadata bibMetadata� K  BH�� ������� 0 is?n  � o  EF���� 0 pubissn pubISSN��  � o      ���� 0 bibmetadata bibMetadata��  ��  � ��� l PP��������  ��  ��  � ��� r  P_��� n P]��� I  U]������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  UX�� ���  j o u r n a l� ���� o  XY���� "0 publicationdata publicationData��  ��  � o  PU���� 0 keypointslib KeypointsLib� o      ���� 0 
pubjournal 
pubJournal� ��� Z `~������� F  `m��� > `c��� o  `a���� 0 
pubjournal 
pubJournal� m  ab��
�� 
msng� > fk��� o  fg���� 0 
pubjournal 
pubJournal� m  gj�� ���  � r  pz��� b  px��� o  pq���� 0 bibmetadata bibMetadata� K  qw�� ������� 0 journal  � o  tu���� 0 
pubjournal 
pubJournal��  � o      ���� 0 bibmetadata bibMetadata��  ��  � ��� l ��������  ��  ��  � ��� r  ���� n ���� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  v o l u m e� ���� o  ������ "0 publicationdata publicationData��  ��  � o  ����� 0 keypointslib KeypointsLib� o      ���� 0 	pubvolume 	pubVolume� ��� r  ����� n ����� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ��� 
 i s s u e� ���� o  ������ "0 publicationdata publicationData��  ��  � o  ������ 0 keypointslib KeypointsLib� o      ���� 0 pubissue pubIssue� ��� Z  ��������� F  ����� > ����� o  ������ 0 	pubvolume 	pubVolume� m  ����
�� 
msng� > ����� o  ������ 0 	pubvolume 	pubVolume� m  ���� ���  � k  ���� ��� Z ��������� F  ����� > ����� o  ������ 0 pubissue pubIssue� m  ����
�� 
msng� > ����� o  ������ 0 pubissue pubIssue� m  ���� ���  � r  ����� b  ����� b  ����� b  ��   o  ������ 0 	pubvolume 	pubVolume m  �� �  (� o  ������ 0 pubissue pubIssue� m  �� �  )� o      ���� 0 	pubvolume 	pubVolume��  ��  � �� r  �� b  ��	
	 o  ������ 0 bibmetadata bibMetadata
 K  �� ������ 
0 volume   o  ������ 0 	pubvolume 	pubVolume��   o      ���� 0 bibmetadata bibMetadata��  ��  ��  �  l ������~��  �  �~    r  �� n �� I  ���}�|�} .0 valueforkey_inrecord_ valueForKey_inRecord_  m  �� �  p a g e �{ o  ���z�z "0 publicationdata publicationData�{  �|   o  ���y�y 0 keypointslib KeypointsLib o      �x�x 0 pubpages pubPages  Z ��w�v F  ��  > ��!"! o  ���u�u 0 pubpages pubPages" m  ���t
�t 
msng  > ��#$# o  ���s�s 0 pubpages pubPages$ m  ��%% �&&   r   
'(' b   )*) o   �r�r 0 bibmetadata bibMetadata* K  ++ �q,�p�q 0 page  , o  �o�o 0 pubpages pubPages�p  ( o      �n�n 0 bibmetadata bibMetadata�w  �v   -.- l �m�l�k�m  �l  �k  . /0/ r  121 n 343 I  �j5�i�j .0 valueforkey_inrecord_ valueForKey_inRecord_5 676 m  88 �99  c i t a t i o n7 :�h: o  �g�g "0 publicationdata publicationData�h  �i  4 o  �f�f 0 keypointslib KeypointsLib2 o      �e�e 0 pubcitation pubCitation0 ;<; Z ==>�d�c= F  ,?@? > "ABA o   �b�b 0 pubcitation pubCitationB m   !�a
�a 
msng@ > %*CDC o  %&�`�` 0 pubcitation pubCitationD m  &)EE �FF  > r  /9GHG b  /7IJI o  /0�_�_ 0 bibmetadata bibMetadataJ K  06KK �^L�]�^ 0 	reference  L o  34�\�\ 0 pubcitation pubCitation�]  H o      �[�[ 0 bibmetadata bibMetadata�d  �c  < MNM l >>�Z�Y�X�Z  �Y  �X  N OPO r  >MQRQ n >KSTS I  CK�WU�V�W .0 valueforkey_inrecord_ valueForKey_inRecord_U VWV m  CFXX �YY  b i b t e xW Z�UZ o  FG�T�T "0 publicationdata publicationData�U  �V  T o  >C�S�S 0 keypointslib KeypointsLibR o      �R�R 0 	pubbibtex 	pubBibTeXP [\[ Z Nl]^�Q�P] F  N[_`_ > NQaba o  NO�O�O 0 	pubbibtex 	pubBibTeXb m  OP�N
�N 
msng` > TYcdc o  TU�M�M 0 	pubbibtex 	pubBibTeXd m  UXee �ff  ^ r  ^hghg b  ^fiji o  ^_�L�L 0 bibmetadata bibMetadataj K  _ekk �Kl�J�K 
0 bibtex  l o  bc�I�I 0 	pubbibtex 	pubBibTeX�J  h o      �H�H 0 bibmetadata bibMetadata�Q  �P  \ mnm l mm�G�F�E�G  �F  �E  n opo r  m|qrq n mzsts I  rz�Du�C�D .0 valueforkey_inrecord_ valueForKey_inRecord_u vwv m  ruxx �yy  u r lw z�Bz o  uv�A�A "0 publicationdata publicationData�B  �C  t o  mr�@�@ 0 keypointslib KeypointsLibr o      �?�? 0 publink pubLinkp {|{ Z }�}~�>�=} F  }�� > }���� o  }~�<�< 0 publink pubLink� m  ~�;
�; 
msng� > ����� o  ���:�: 0 publink pubLink� m  ���� ���  ~ r  ����� b  ����� o  ���9�9 0 bibmetadata bibMetadata� K  ���� �8��7�8 0 link  � o  ���6�6 0 publink pubLink�7  � o      �5�5 0 bibmetadata bibMetadata�>  �=  | ��� l ���4�3�2�4  �3  �2  � ��� r  ����� n ����� I  ���1��0�1 .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  p m i d� ��/� o  ���.�. "0 publicationdata publicationData�/  �0  � o  ���-�- 0 keypointslib KeypointsLib� o      �,�, 0 pubpmid pubPMID� ��� Z �����+�*� F  ����� > ����� o  ���)�) 0 pubpmid pubPMID� m  ���(
�( 
msng� > ����� o  ���'�' 0 pubpmid pubPMID� m  ���� ���  � r  ����� b  ����� o  ���&�& 0 bibmetadata bibMetadata� K  ���� �%��$�% 0 pmid  � o  ���#�# 0 pubpmid pubPMID�$  � o      �"�" 0 bibmetadata bibMetadata�+  �*  � ��� l ���!� ��!  �   �  � ��� r  ����� n ����� I  ������ .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ��� 
 p m c i d� ��� o  ���� "0 publicationdata publicationData�  �  � o  ���� 0 keypointslib KeypointsLib� o      �� 0 pubpmcid pubPMCID� ��� Z �	����� F  ����� > ����� o  ���� 0 pubpmcid pubPMCID� m  ���
� 
msng� > ����� o  ���� 0 pubpmcid pubPMCID� m  ���� ���  � r  ���� b  ���� o  ���� 0 bibmetadata bibMetadata� K  ��� ���� 	0 pmcid  � o  � �� 0 pubpmcid pubPMCID�  � o      �� 0 bibmetadata bibMetadata�  �  � ��� l 

����  �  �  � ��� L  
�� o  
�
�
 0 bibmetadata bibMetadata�  � ��� l     �	���	  �  �  � ��� l     ����  �  �  � ��� l     ����  � L F Maps the given color name to a DEVONthink label index and returns it.   � ��� �   M a p s   t h e   g i v e n   c o l o r   n a m e   t o   a   D E V O N t h i n k   l a b e l   i n d e x   a n d   r e t u r n s   i t .� ��� i  Y\��� I      ���� 00 labelindexforcolorname labelIndexForColorName� �� � o      ���� 0 	colorname 	colorName�   �  � k     >�� ��� Z    ������� G     ��� =    ��� o     ���� 0 	colorname 	colorName� m    ��
�� 
msng� =   	��� o    ���� 0 	colorname 	colorName� m    �� ���  � L    �� m    ����  ��  ��  � ��� l   ��������  ��  ��  � ��� r    ��� m    ����  � o      ���� $0 recordlabelindex recordLabelIndex� ��� r    +��� l   )������ n   )��� I    )������� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_� ��� m    �� ���  c o l o r N a m e�    o     ���� 0 	colorname 	colorName �� o     %���� 0 labelmappings labelMappings��  ��  � o    ���� 0 keypointslib KeypointsLib��  ��  � o      ���� 0 labelmapping labelMapping�  Z   , ;���� >  , / o   , -���� 0 labelmapping labelMapping m   - .��
�� 
msng r   2 7	
	 n  2 5 o   3 5���� 0 
labelindex 
labelIndex o   2 3���� 0 labelmapping labelMapping
 o      ���� $0 recordlabelindex recordLabelIndex��  ��    l  < <��������  ��  ��   �� L   < > o   < =���� $0 recordlabelindex recordLabelIndex��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   [ U Returns the name of the approximate color (like "red", "blue", "green", etc) for the    � �   R e t u r n s   t h e   n a m e   o f   t h e   a p p r o x i m a t e   c o l o r   ( l i k e   " r e d " ,   " b l u e " ,   " g r e e n " ,   e t c )   f o r   t h e  l     ����     given hue degree.    � $   g i v e n   h u e   d e g r e e .   l     ��!"��  ! U O @param hueDegree A color's hue component given as a degree (0-359) of the hue    " �## �   @ p a r a m   h u e D e g r e e   A   c o l o r ' s   h u e   c o m p o n e n t   g i v e n   a s   a   d e g r e e   ( 0 - 3 5 9 )   o f   t h e   h u e    $%$ l     ��&'��  & = 7 in the HSB (hue, saturation, brightness) color scheme.   ' �(( n   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .% )*) i  ]`+,+ I      ��-���� "0 colornameforhue colorNameForHue- .��. o      ���� 0 	huedegree 	hueDegree��  ��  , k     c// 010 r     232 m     44 �55  3 o      ���� 0 	colorname 	colorName1 676 l   ��������  ��  ��  7 898 X    8:��;: Z    3<=����< F    '>?> @    @A@ o    ���� 0 	huedegree 	hueDegreeA n   BCB o    ���� 0 lowerhuelimit lowerHueLimitC o    ���� 0 colormapping colorMapping? B     %DED o     !���� 0 	huedegree 	hueDegreeE n  ! $FGF o   " $���� 0 upperhuelimit upperHueLimitG o   ! "���� 0 colormapping colorMapping= r   * /HIH n  * -JKJ o   + -���� 0 	colorname 	colorNameK o   * +���� 0 colormapping colorMappingI o      ���� 0 	colorname 	colorName��  ��  �� 0 colormapping colorMapping; o    ���� 0 colormappings colorMappings9 LML Z   9 `NO����N F   9 PPQP =  9 <RSR o   9 :���� 0 	colorname 	colorNameS m   : ;TT �UU  Q l  ? NV����V G   ? NWXW @   ? DYZY o   ? @���� 0 	huedegree 	hueDegreeZ n  @ C[\[ o   A C���� 0 lowerhuelimit lowerHueLimit\ o   @ A���� 0 colormapping colorMappingX B   G L]^] o   G H���� 0 	huedegree 	hueDegree^ n  H K_`_ o   I K���� 0 upperhuelimit upperHueLimit` o   H I���� 0 colormapping colorMapping��  ��  O r   S \aba n  S Zcdc o   X Z���� 0 	colorname 	colorNamed o   S X���� "0 redcolormapping redColorMappingb o      ���� 0 	colorname 	colorName��  ��  M efe l  a a��������  ��  ��  f g��g L   a chh o   a b���� 0 	colorname 	colorName��  * iji l     ��������  ��  ��  j klk l     ��������  ��  ��  l mnm l     ��op��  o W Q Attempts to extract the annotation's text from its line-based bounds rectangles.   p �qq �   A t t e m p t s   t o   e x t r a c t   t h e   a n n o t a t i o n ' s   t e x t   f r o m   i t s   l i n e - b a s e d   b o u n d s   r e c t a n g l e s .n rsr l     ��tu��  t Q K @param boundsByLine List of line-based bounds, where each bounds rectangle   u �vv �   @ p a r a m   b o u n d s B y L i n e   L i s t   o f   l i n e - b a s e d   b o u n d s ,   w h e r e   e a c h   b o u n d s   r e c t a n g l es wxw l     ��yz��  y S M specifies the bounding box of an annotation's individual line in page space.   z �{{ �   s p e c i f i e s   t h e   b o u n d i n g   b o x   o f   a n   a n n o t a t i o n ' s   i n d i v i d u a l   l i n e   i n   p a g e   s p a c e .x |}| i  ad~~ I      �������  0 annotationtext annotationText� ��� o      ���� 0 pdfpage pdfPage� ���� o      ���� 0 boundsbyline boundsByLine��  ��   k     n�� ��� r     ��� J     ����  � o      ���� 0 
textbyline 
textByLine� ��� l   ��������  ��  ��  � ��� X    a����� k    \�� ��� r    ��� l   ������ n   ��� I    ������� &0 selectionforrect_ selectionForRect_� ���� o    ���� 0 	thebounds 	theBounds��  ��  � o    ���� 0 pdfpage pdfPage��  ��  � o      ���� 0 pdfselection pdfSelection� ��� r    %��� n   #��� I    #������ 
0 string  �  �  � o    �� 0 pdfselection pdfSelection� o      �� 0 linetext lineText� ��� l  & &����  �  �  � ��� Z   & \����� F   & 1��� >  & )��� o   & '�� 0 linetext lineText� m   ' (�
� 
msng� >  , /��� o   , -�� 0 linetext lineText� m   - .�� ���  � k   4 X�� ��� l  4 4����  � W Q replace any trailing whitespace or "\n" at the end of a line with a single space   � ��� �   r e p l a c e   a n y   t r a i l i n g   w h i t e s p a c e   o r   " \ n "   a t   t h e   e n d   o f   a   l i n e   w i t h   a   s i n g l e   s p a c e� ��� r   4 D��� n  4 B��� I   9 B���� 0 regexreplace regexReplace� ��� c   9 <��� o   9 :�� 0 linetext lineText� m   : ;�~
�~ 
TEXT� ��� m   < =�� ���  ( \ s + | \ \ n ) $� ��}� m   = >�� ���   �}  �  � o   4 9�|�| 0 keypointslib KeypointsLib� o      �{�{ 0 linetext lineText� ��� l  E E�z�y�x�z  �y  �x  � ��� l  E E�w���w  � b \ assume that a hyphen (and optional space) at the end of a line indicates a word hyphenation   � ��� �   a s s u m e   t h a t   a   h y p h e n   ( a n d   o p t i o n a l   s p a c e )   a t   t h e   e n d   o f   a   l i n e   i n d i c a t e s   a   w o r d   h y p h e n a t i o n� ��� l  E E�v���v  � e _ NOTE: while this assumption is often correct, it's not always true so it may incorrectly merge   � ��� �   N O T E :   w h i l e   t h i s   a s s u m p t i o n   i s   o f t e n   c o r r e c t ,   i t ' s   n o t   a l w a y s   t r u e   s o   i t   m a y   i n c o r r e c t l y   m e r g e� ��� l  E E�u���u  � !            hyphenated words   � ��� 6                       h y p h e n a t e d   w o r d s� ��� r   E S��� n  E Q��� I   J Q�t��s�t 0 regexreplace regexReplace� ��� o   J K�r�r 0 linetext lineText� ��� m   K L�� ���  -   $� ��q� m   L M�� ���  �q  �s  � o   E J�p�p 0 keypointslib KeypointsLib� o      �o�o 0 linetext lineText� ��� l  T T�n�m�l�n  �m  �l  � ��k� s   T X��� o   T U�j�j 0 linetext lineText� n      ���  ;   V W� o   U V�i�i 0 
textbyline 
textByLine�k  �  �  �  �� 0 	thebounds 	theBounds� o    	�h�h 0 boundsbyline boundsByLine� ��� l  b b�g�f�e�g  �f  �e  � ��d� L   b n�� n  b m��� I   g m�c��b�c  0 mergetextitems mergeTextItems� ��� o   g h�a�a 0 
textbyline 
textByLine� ��`� m   h i�� ���  �`  �b  � o   b g�_�_ 0 keypointslib KeypointsLib�d  } ��� l     �^�]�\�^  �]  �\  � ��� l     �[�Z�Y�[  �Z  �Y  � ��� l     �X���X  � ` Z Converts a list of quadrilateral points to a list of line-based bounds, where each bounds   � �   �   C o n v e r t s   a   l i s t   o f   q u a d r i l a t e r a l   p o i n t s   t o   a   l i s t   o f   l i n e - b a s e d   b o u n d s ,   w h e r e   e a c h   b o u n d s�  l     �W�W   ] W rectangle specifies the bounding box of an annotation's individual line in page space.    � �   r e c t a n g l e   s p e c i f i e s   t h e   b o u n d i n g   b o x   o f   a n   a n n o t a t i o n ' s   i n d i v i d u a l   l i n e   i n   p a g e   s p a c e .  l     �V	�V   n h @param quadPoints List of quadrilateral points (as obtained by `pdfAnnotation's quadrilateralPoints()`,   	 �

 �   @ p a r a m   q u a d P o i n t s   L i s t   o f   q u a d r i l a t e r a l   p o i n t s   ( a s   o b t a i n e d   b y   ` p d f A n n o t a t i o n ' s   q u a d r i l a t e r a l P o i n t s ( ) ` ,  l     �U�U   m g with each point wrapped as NSValue object) where each quadrilateral (i.e., a group of four consecutive    � �   w i t h   e a c h   p o i n t   w r a p p e d   a s   N S V a l u e   o b j e c t )   w h e r e   e a c h   q u a d r i l a t e r a l   ( i . e . ,   a   g r o u p   o f   f o u r   c o n s e c u t i v e  l     �T�T   g a points ordered in Z-form {topLeft, topRight, bottomLeft, bottomRight} so that points with higher    � �   p o i n t s   o r d e r e d   i n   Z - f o r m   { t o p L e f t ,   t o p R i g h t ,   b o t t o m L e f t ,   b o t t o m R i g h t }   s o   t h a t   p o i n t s   w i t h   h i g h e r  l     �S�S   r l y-values come first) encircles a line of text to be highlighted. The coordinates of each point are relative    � �   y - v a l u e s   c o m e   f i r s t )   e n c i r c l e s   a   l i n e   o f   t e x t   t o   b e   h i g h l i g h t e d .   T h e   c o o r d i n a t e s   o f   e a c h   p o i n t   a r e   r e l a t i v e  l     �R�R   6 0 to the bound�s origin of the markup annotation.    � `   t o   t h e   b o u n d  s   o r i g i n   o f   t h e   m a r k u p   a n n o t a t i o n .   l     �Q!"�Q  ! c ] @param annotationBounds The bounding box for the annotation in page space (which is a 72 dpi   " �## �   @ p a r a m   a n n o t a t i o n B o u n d s   T h e   b o u n d i n g   b o x   f o r   t h e   a n n o t a t i o n   i n   p a g e   s p a c e   ( w h i c h   i s   a   7 2   d p i  $%$ l     �P&'�P  & b \ coordinate system with the origin at the lower-left corner of the PDF page), as obtained by   ' �(( �   c o o r d i n a t e   s y s t e m   w i t h   t h e   o r i g i n   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e ) ,   a s   o b t a i n e d   b y% )*) l     �O+,�O  + $  `pdfAnnotation's |bounds|()`.   , �-- <   ` p d f A n n o t a t i o n ' s   | b o u n d s | ( ) ` .* ./. i  eh010 I      �N2�M�N 00 annotationboundsbyline annotationBoundsByLine2 343 o      �L�L 0 
quadpoints 
quadPoints4 5�K5 o      �J�J $0 annotationbounds annotationBounds�K  �M  1 k     �66 787 l    9:;9 r     <=< n     >?> 4   �I@
�I 
cobj@ m    �H�H ? o     �G�G $0 annotationbounds annotationBounds= o      �F�F 0 	theorigin 	theOrigin: A ; a point specified as a list of x/y positions: {xPos, YPos}   ; �AA v   a   p o i n t   s p e c i f i e d   a s   a   l i s t   o f   x / y   p o s i t i o n s :   { x P o s ,   Y P o s }8 BCB r    DED J    	�E�E  E o      �D�D 0 boundsbyline boundsByLineC FGF r    HIH ^    JKJ l   L�C�BL I   �AM�@
�A .corecnte****       ****M o    �?�? 0 
quadpoints 
quadPoints�@  �C  �B  K m    �>�> I o      �=�= 0 maxquadcount maxQuadCountG NON r    PQP m    �<�< Q o      �;�; 0 	quadcount 	quadCountO RSR l   �:�9�8�:  �9  �8  S TUT l   �7VW�7  V m g iterate over each quadrilateral (4 points: topLeft, topRight, bottomLeft, bottomRight) representing an   W �XX �   i t e r a t e   o v e r   e a c h   q u a d r i l a t e r a l   ( 4   p o i n t s :   t o p L e f t ,   t o p R i g h t ,   b o t t o m L e f t ,   b o t t o m R i g h t )   r e p r e s e n t i n g   a nU YZY l   �6[\�6  [ 7 1 annotation line and get its bounds in page space   \ �]] b   a n n o t a t i o n   l i n e   a n d   g e t   i t s   b o u n d s   i n   p a g e   s p a c eZ ^_^ U    �`a` k   ! �bb cdc l  ! !�5ef�5  e K E get the top left & bottom right quad points for this annotation line   f �gg �   g e t   t h e   t o p   l e f t   &   b o t t o m   r i g h t   q u a d   p o i n t s   f o r   t h i s   a n n o t a t i o n   l i n ed hih r   ! +jkj n  ! )lml I   % )�4�3�2�4 0 
pointvalue 
pointValue�3  �2  m l  ! %n�1�0n n   ! %opo 4   " %�/q
�/ 
cobjq o   # $�.�. 0 	quadcount 	quadCountp o   ! "�-�- 0 
quadpoints 
quadPoints�1  �0  k o      �,�, 0 topleftpoint topLeftPointi rsr r   , 8tut n  , 6vwv I   2 6�+�*�)�+ 0 
pointvalue 
pointValue�*  �)  w l  , 2x�(�'x n   , 2yzy 4   - 2�&{
�& 
cobj{ l  . 1|�%�$| [   . 1}~} o   . /�#�# 0 	quadcount 	quadCount~ m   / 0�"�" �%  �$  z o   , -�!�! 0 
quadpoints 
quadPoints�(  �'  u o      � �  $0 bottomrightpoint bottomRightPoints � l  9 9����  �  �  � ��� l  9 9����  � b \ convert each quad point (whose coordinates are relative to the bound�s origin of the markup   � ��� �   c o n v e r t   e a c h   q u a d   p o i n t   ( w h o s e   c o o r d i n a t e s   a r e   r e l a t i v e   t o   t h e   b o u n d  s   o r i g i n   o f   t h e   m a r k u p� ��� l  9 9����  � a [ annotation) to page space (where the origin lies at the lower-left corner of the PDF page)   � ��� �   a n n o t a t i o n )   t o   p a g e   s p a c e   ( w h e r e   t h e   o r i g i n   l i e s   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e )� ��� l  9 9����  � d ^ NOTE: w/o the adjustment of values, the rectangle would be too small to match underlying text   � ��� �   N O T E :   w / o   t h e   a d j u s t m e n t   o f   v a l u e s ,   t h e   r e c t a n g l e   w o u l d   b e   t o o   s m a l l   t o   m a t c h   u n d e r l y i n g   t e x t� ��� r   9 K��� \   9 G��� [   9 A��� l  9 <���� n   9 <��� o   : <�� 0 x  � o   9 :�� 0 topleftpoint topLeftPoint�  �  � l  < @���� n   < @��� 4  = @��
� 
cobj� m   > ?�� � o   < =�� 0 	theorigin 	theOrigin�  �  � o   A F�� ,0 linewidthenlargement lineWidthEnlargement� n      ��� o   H J�� 0 x  � o   G H�� 0 topleftpoint topLeftPoint� ��� r   L ^��� [   L Z��� [   L T��� l  L O���� n   L O��� o   M O�� 0 y  � o   L M�
�
 0 topleftpoint topLeftPoint�  �  � l  O S��	�� n   O S��� 4  P S��
� 
cobj� m   Q R�� � o   O P�� 0 	theorigin 	theOrigin�	  �  � o   T Y�� .0 lineheightenlargement lineHeightEnlargement� n      ��� o   [ ]�� 0 y  � o   Z [�� 0 topleftpoint topLeftPoint� ��� l  _ _�� ���  �   ��  � ��� r   _ q��� [   _ m��� [   _ g��� l  _ b������ n   _ b��� o   ` b���� 0 x  � o   _ `���� $0 bottomrightpoint bottomRightPoint��  ��  � l  b f������ n   b f��� 4  c f���
�� 
cobj� m   d e���� � o   b c���� 0 	theorigin 	theOrigin��  ��  � o   g l���� ,0 linewidthenlargement lineWidthEnlargement� n      ��� o   n p���� 0 x  � o   m n���� $0 bottomrightpoint bottomRightPoint� ��� r   r ���� \   r ���� [   r z��� l  r u������ n   r u��� o   s u���� 0 y  � o   r s���� $0 bottomrightpoint bottomRightPoint��  ��  � l  u y������ n   u y��� 4  v y���
�� 
cobj� m   w x���� � o   u v���� 0 	theorigin 	theOrigin��  ��  � o   z ���� .0 lineheightenlargement lineHeightEnlargement� n      ��� o   � ����� 0 y  � o   � ����� $0 bottomrightpoint bottomRightPoint� ��� l  � ���������  ��  ��  � ��� l  � �������  � k e create a bounds rectangle (specified by origin {x,y} & size {width,height}) for this annotation line   � ��� �   c r e a t e   a   b o u n d s   r e c t a n g l e   ( s p e c i f i e d   b y   o r i g i n   { x , y }   &   s i z e   { w i d t h , h e i g h t } )   f o r   t h i s   a n n o t a t i o n   l i n e� ��� r   � ���� n  � ���� I   � �������� 0 
makensrect 
makeNSRect� ���� J   � ��� ��� J   � ��� ��� n   � ���� o   � ����� 0 x  � o   � ����� 0 topleftpoint topLeftPoint� ���� n   � ���� o   � ����� 0 y  � o   � ����� 0 topleftpoint topLeftPoint��  � ���� J   � ��� ��� n   � ���� o   � ����� 0 x  � o   � ����� $0 bottomrightpoint bottomRightPoint� ���� n   � ���� o   � ����� 0 y  � o   � ����� $0 bottomrightpoint bottomRightPoint��  ��  ��  ��  �  f   � �� o      ���� 0 
linebounds 
lineBounds� ��� s   � ���� o   � ����� 0 
linebounds 
lineBounds� n      ���  ;   � �� o   � ����� 0 boundsbyline boundsByLine� � � l  � ���������  ��  ��    �� r   � � [   � � o   � ����� 0 	quadcount 	quadCount m   � �����  o      ���� 0 	quadcount 	quadCount��  a o    ���� 0 maxquadcount maxQuadCount_  l  � ���������  ��  ��   �� L   � �		 o   � ����� 0 boundsbyline boundsByLine��  / 

 l     ��������  ��  ��    l     �������  ��  �    l     ��   f ` Takes a a rectangle specified via its top left & bottom right points (given as a list of lists:    � �   T a k e s   a   a   r e c t a n g l e   s p e c i f i e d   v i a   i t s   t o p   l e f t   &   b o t t o m   r i g h t   p o i n t s   ( g i v e n   a s   a   l i s t   o f   l i s t s :  l     ��   b \ {{topLeftX, topLeftY}, {bottomRightX, bottomRightY}}) and converts it to a bounds rectangle    � �   { { t o p L e f t X ,   t o p L e f t Y } ,   { b o t t o m R i g h t X ,   b o t t o m R i g h t Y } } )   a n d   c o n v e r t s   i t   t o   a   b o u n d s   r e c t a n g l e  l     ��   Z T given as a record with `origin` & `size` properties each containing again a record:    � �   g i v e n   a s   a   r e c o r d   w i t h   ` o r i g i n `   &   ` s i z e `   p r o p e r t i e s   e a c h   c o n t a i n i n g   a g a i n   a   r e c o r d :  l     � �   m g {origin:{x:topLeftX, y:topLeftY}, |size|:{width:bottomRightX-topLeftX, height:bottomRightY-topLeftY}}      �!! �   { o r i g i n : { x : t o p L e f t X ,   y : t o p L e f t Y } ,   | s i z e | : { w i d t h : b o t t o m R i g h t X - t o p L e f t X ,   h e i g h t : b o t t o m R i g h t Y - t o p L e f t Y } }   "#" l     �$%�  $ ` Z Credits: by Takaaki Naganoya, Piyomaru Software (see http://piyocast.com/as/archives/643)   % �&& �   C r e d i t s :   b y   T a k a a k i   N a g a n o y a ,   P i y o m a r u   S o f t w a r e   ( s e e   h t t p : / / p i y o c a s t . c o m / a s / a r c h i v e s / 6 4 3 )# '(' i  il)*) I      �+�� 0 
makensrect 
makeNSRect+ ,�, c      -.- o      �� 0 alist aList. m      �
� 
list�  �  * Q     ]/01/ k    S22 343 s    1565 o    �� 0 alist aList6 J      77 898 J      :: ;<; o      �� 0 x1  < =�= o      �� 0 y1  �  9 >�> J      ?? @A@ o      �� 0 x2  A B�B o      �� 0 y2  �  �  4 CDC r   2 7EFE l  2 5G��G \   2 5HIH o   2 3�� 0 x2  I o   3 4�� 0 x1  �  �  F o      �� 0 xwidth xWidthD JKJ l  8 =LMNL r   8 =OPO l  8 ;Q��Q \   8 ;RSR o   8 9�� 0 y2  S o   9 :�� 0 y1  �  �  P o      �� 0 yheight yHeightM J D TODO: doesn't this create a negative height? use `y1 - y2` instead?   N �TT �   T O D O :   d o e s n ' t   t h i s   c r e a t e   a   n e g a t i v e   h e i g h t ?   u s e   ` y 1   -   y 2 `   i n s t e a d ?K UVU r   > PWXW K   > NYY �Z[� 
0 origin  Z K   ? E\\ �]^� 0 x  ] o   @ A�� 0 x1  ^ �_�� 0 y  _ o   B C�� 0 y1  �  [ �`�� 0 size  ` K   F Laa �bc� 	0 width  b o   G H�� 0 xwidth xWidthc �d�� 
0 height  d o   I J�� 0 yheight yHeight�  �  X o      �� 0 a1rect a1RectV e�e L   Q Sff o   Q R�� 0 a1rect a1Rect�  0 R      ���
� .ascrerr ****      � ****�  �  1 L   [ ]gg m   [ \�
� 
msng( h�h l     ����  �  �  �       B�i(jklmnop������������~�}�|�{�z�y��
qrstuvwxyz{�x�w|}~������������������  i @�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�v ,0 notefoldernameprefix noteFolderNamePrefix�u ,0 notefoldernamesuffix noteFolderNameSuffix�t 
0 label1  �s 
0 label2  �r 
0 label3  �q 
0 label4  �p 
0 label5  �o 
0 label6  �n 
0 label7  �m *0 updateexistingnotes updateExistingNotes�l 80 updatenameforexistingnotes updateNameForExistingNotes�k F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes�j P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes�i J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes�h <0 updateratingforexistingnotes updateRatingForExistingNotes�g :0 updatelabelforexistingnotes updateLabelForExistingNotes�f 80 updatetagsforexistingnotes updateTagsForExistingNotes�e L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes�d P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders�c ,0 selectupdatedrecords selectUpdatedRecords�b $0 fetchdoimetadata fetchDOIMetadata�a 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata�` 0 fetchbibtex fetchBibTeX�_ :0 appendbibtextofindercomment appendBibTeXToFinderComment�^ 00 fetchformattedcitation fetchFormattedCitation�] P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment�\ &0 citationstylename citationStyleName�[  0 citationlocale citationLocale�Z ,0 linewidthenlargement lineWidthEnlargement�Y .0 lineheightenlargement lineHeightEnlargement�X "0 redcolormapping redColorMapping�W (0 orangecolormapping orangeColorMapping�V (0 yellowcolormapping yellowColorMapping�U &0 greencolormapping greenColorMapping�T $0 cyancolormapping cyanColorMapping�S .0 lightbluecolormapping lightBlueColorMapping�R ,0 darkbluecolormapping darkBlueColorMapping�Q (0 purplecolormapping purpleColorMapping�P $0 pinkcolormapping pinkColorMapping�O 0 colormappings colorMappings�N 0 labelmappings labelMappings�M &0 creatednotescount createdNotesCount�L &0 updatednotescount updatedNotesCount
�K 
pimr�J 0 keypointslib KeypointsLib
�I .aevtoappnull  �   � ****�H $0 checkappsrunning checkAppsRunning�G T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�F :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�E &0 pdfannotationinfo pdfAnnotationInfo�D H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�C B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�B  0 createdtrecord createDTRecord�A 00 setmetadatafordtfolder setMetadataForDTFolder�@ 00 setmetadatafordtrecord setMetadataForDTRecord�? 60 updatemetadatafordtrecord updateMetadataForDTRecord�> F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�= 60 appendtocommentofdtfolder appendToCommentOfDTFolder�< &0 bibmetadatafordoi bibMetadataForDOI�; 00 labelindexforcolorname labelIndexForColorName�: "0 colornameforhue colorNameForHue�9  0 annotationtext annotationText�8 00 annotationboundsbyline annotationBoundsByLine�7 0 
makensrect 
makeNSRectj �6�5��6 0 
labelindex 
labelIndex�5 � �4L�3�4 0 	colorname 	colorName�3  k �2�1��2 0 
labelindex 
labelIndex�1 � �0U�/�0 0 	colorname 	colorName�/  l �.�-��. 0 
labelindex 
labelIndex�- � �,^�+�, 0 	colorname 	colorName�+  m �*�)��* 0 
labelindex 
labelIndex�) � �(g�'�( 0 	colorname 	colorName�'  n �&�%��& 0 
labelindex 
labelIndex�% � �$p�#�$ 0 	colorname 	colorName�#  o �"�!��" 0 
labelindex 
labelIndex�! � � y��  0 	colorname 	colorName�  p ���� 0 
labelindex 
labelIndex� � ���� 0 	colorname 	colorName�  
� boovfals
� boovfals
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
�~ boovtrue
�} boovfals
�| boovfals
�{ boovfals
�z boovtrue
�y boovtrueq ��� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit�^� ���� 0 upperhuelimit upperHueLimit� �  r �(�� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit� � ���� 0 upperhuelimit upperHueLimit� ,�  s �3�� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit� -� ��
�	� 0 upperhuelimit upperHueLimit�
 A�	  t �>�� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit� B� ���� 0 upperhuelimit upperHueLimit� ��  u �I�� 0 	colorname 	colorName� �� �� 0 lowerhuelimit lowerHueLimit�  �� �������� 0 upperhuelimit upperHueLimit�� ���  v ��T��� 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit�� ���  w ��_��� 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit�� ���  x ��j��� 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit��D��  y ��u��� 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit��E� �������� 0 upperhuelimit upperHueLimit��]��  z ����� 	� 	 qrstuvwxy{ ����� �  jklmnop�x  �w  | ����� �  ����� �����
�� 
cobj� ��   ���
�� 
scpt��  � �����
�� 
cobj� ��   ���
�� 
frmk��  � �����
�� 
cobj� ��   ���
�� 
frmk��  � �����
�� 
cobj� ��   ��
�� 
osax��  } ��   ���
�� 
scpt~ �����������
�� .aevtoappnull  �   � ****��  ��  � ���� 0 i  � *���������������������@������VXZ\���������������������������� $0 checkappsrunning checkAppsRunning�� 0 setupprogress setupProgress�� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�� 0 
pdfrecords 
pdfRecords
�� .corecnte****       ****�� 0 pdfcount pdfCount�� 40 settotalstepsforprogress setTotalStepsForProgress
�� 
cobj�� 0 	pdfrecord 	pdfRecord
�� 
capp
�� kfrmID  
�� 
DTfn�� 0 pdffilename pdfFilename��  0 updateprogress updateProgress�� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF��  0 updatedrecords updatedRecords
� 
bool
� 
brws� 0 frontwindow frontWindow
� 
DTsl
� .miscactvnull��� ��� null
� 
lnfd
� 
appr
� 
disp
� 
btns
� 
dflt� 
� .sysodlogaskr        TEXT��")j+   hY hOb  ,�k+ O)j+ E�OjEc  )OjEc  *O�j E�Ob  ,�k+ O Lk�kh  ��/E�O)���0 ��,E�UOb  ,��%a %�%a %�%a %l+ O)�k+ E` [OY��Ob  e 	 _ jva & &)�a �0 *a k/E` O_ _ a ,FUY hO)�a �0 G*j Oa �%_ %a %b  )%_ %a  %b  *%a !a "a #la $a %kva &a 'a ( )U �������� $0 checkappsrunning checkAppsRunning�  �  �  � �������������
� 
capp
� kfrmID  
� 
prcs�  
� 
fcrt
� .corecnte****       ****� � � 0 displayerror displayError� 6)���0 +*�-�[�,\Z�81j k b  ,���e�+ OfY hUOe� ������� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�  �  � ���� 0 annotatedpdfs annotatedPDFs� 0 
therecords 
theRecords� 0 	therecord 	theRecord� �X����������NR���
� 
capp
� kfrmID  
� 
DTsl
� 
list
� 
kocl
� 
cobj
� .corecnte****       ****
� 
DTty
� OCRdpdf 
� 
DTna
� 
bool� � � 0 displayerror displayError� bjvE�O)���0 R*�,�&E�O .�[��l kh ��,� 	 	��,j�& 	��6GY h[OY��O�jv  b  ,���e�+ Y hUO�� �������� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF� ��� �  �� 0 	pdfrecord 	pdfRecord�  � ,���������������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a� 0 	pdfrecord 	pdfRecord� 0 pdfpath pdfPath� 
0 pdfurl  � "0 pdflocationpath pdfLocationPath� 0 pdfmetadata pdfMetadata�  0 notefoldername noteFolderName� (0 folderlocationpath folderLocationPath�  0 folderdidexist folderDidExist�  0 folderlocation folderLocation� 0 	folderurl 	folderURL�  0 foldermetadata folderMetadata� 0 sourcecitekey sourceCitekey� "0 metadatacitekey metadataCitekey� (0 pdfannotationslist pdfAnnotationsList�~ 0 pdfdoi pdfDOI�} 0 bibmetadata bibMetadata�| &0 formattedcitation formattedCitation�{ 0 
bibtexdata 
bibTeXData�z  0 updatedrecords updatedRecords�y 0 pdfannotation pdfAnnotation�x 0 acomment aComment�w 0 	annottext 	annotText�v 0 
apagelabel 
aPageLabel�u  0 recordcontents recordContents�t 0 
recordname 
recordName�s 00 recordmodificationdate recordModificationDate�r (0 recordcreationdate recordCreationDate�q 0 recordaliases recordAliases�p 0 	recordurl 	recordURL�o 0 	annottype 	annotType�n  0 recordmetadata recordMetadata�m 0 	ausername 	aUserName�l 0 citekey  �k $0 customattributes customAttributes�j 0 
recordtags 
recordTags�i "0 customattribute customAttribute�h 0 akey aKey�g 0 avalue aValue�f 0 existingvalue existingValue�e 0 	isflagged 	isFlagged�d 0 recordrating recordRating�c $0 recordlabelindex recordLabelIndex�b 0 dtrecord dtRecord�a $0 recordwasupdated recordWasUpdated� J�`�_�^�]�\�[�Z�Y�X�W��V�U��T(4�SA�R�Q�P�O�N�M�L����K���J�I�H�G�F$�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7��6��5		-	M�4�3�2	��1�0�/�.�-�,�+�*
�` 
capp
�_ kfrmID  
�^ 
ppth
�] 
rURL
�\ 
DTlo
�[ 
DTcm
�Z 
msng�Y  �X  
�W 
pnam
�V .DTpacd53bool       utxt
�U .DTpacd52DTrc       utxt
�T 
pURL�S .0 valueforkey_inrecord_ valueForKey_inRecord_
�R 
bool�Q &0 pdfannotationinfo pdfAnnotationInfo
�P 
cobj�O 0 doi  �N 0 pdfannotations  �M �L 00 setmetadatafordtrecord setMetadataForDTRecord�K &0 bibmetadatafordoi bibMetadataForDOI�J 0 
sourcefile 
sourceFile�I 0 citekey  �H �G 00 setmetadatafordtfolder setMetadataForDTFolder�F 60 appendtocommentofdtfolder appendToCommentOfDTFolder
�E 
kocl
�D .corecnte****       ****�C 0 comment  �B 0 	annottext 	annotText�A 0 	pagelabel 	pageLabel�@ H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�? B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�> 0 modifieddate modifiedDate
�= 
ldt �< (0 keypointsidfordate keypointsIDForDate�; 0 deeplink deepLink
�: 
TEXT�9 0 	annottype 	annotType�8  0 annotationtype annotationType�7 0 username userName�6 0 	createdby 	createdBy�5 0 
sourcepage 
sourcePage�4 T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote�3 0 	attribkey 	attribKey�2 0 attribvalue attribValue�1 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_�0 :0 recordfromlabels_andvalues_ recordFromLabels_andValues_�/ @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged�. 60 keypointsnoteratingnumber keypointsNoteRatingNumber�-  0 annotcolorname annotColorName�, 00 labelindexforcolorname labelIndexForColorName�+ �*  0 createdtrecord createDTRecord�)���0 ���,E�O��,E�O��,E�O��,E�O ��  	jvE�Y hW X  	jvE�Ob   ��,%b  %E�O��%�%E�O�j E�O�j E�O��,E�O��%��,FO��,E�O ��  	jvE�Y hW X  	jvE�UOa E�Ob  ,a �l+ E�O��	 �a a & �E�Y hO)���m+ E[a k/E�Z[a l/E�ZO�a �a �a %E�O)��l+ OjvE�Oa E^ Oa E^ O�f 
 b  e a & �b  e 	 	��a &	 �a a & =)��l+ E�O�jv (b  ,a �l+ E^ Ob  ,a  �l+ E^ Y hY hO�a !�a "�a �a #%E�O��%E�O)��l+ $Y hO�f  hb  e 	 ] �a &	 ] a %a & )�] l+ &Y hOb  e 	 ] �a &	 ] a 'a & )�] l+ &Y hY hOjvE^ O�[a (a l )kh ] a *,E^ O] a +,E^ O] a ,,E^ O)] ] l+ -E^ O)] ] ] m+ .E^ O] a /,a 0&E^ O] � ] E^ Ob  ,] k+ 1E^ Y hO] a 2,a 3&E^ O] a 4,a 3&E^ O�a �a 5] a %E^ O] a 6,E^ O] �	 ] a 7a & ] a 8] a 3&l%E^ Y hO] �	 ] a 9a & ] a :] a 3&l%E^ Y hO�� ] a !�l%E^ Y hO] a ",E^  O]  �	 ]  a ;a & ] a "]  l%E^ Y hO��	 �a <a & ] a �l%E^ Y hOb  ,] a =kvl+ >E[a k/E^ !Z[a l/E^ "ZO �] ![a (a l )kh #] #a ?,E^ $O] #a @,E^ %Ob  ,] $] l+ E^ &O] &� #b  ,] &a A%] %%] $] m+ BE^ Y ] b  ,] $kv] %kvl+ C%E^ [OY��Ob  ,] k+ DE^ 'Ob  ,] k+ EE^ (O)] a F,k+ GE^ )O)��] ] ] ] "] '] ] ] ] ] (] )a H+ IE[a k/E^ *Z[a l/E^ +ZO] +e  ] *] 6GY h[OY�,O] � �)
F�(�'���&�) &0 pdfannotationinfo pdfAnnotationInfo�( �%��% �  �$�#�"�$ 0 pdfpath pdfPath�# 
0 pdfurl  �" 0 sourcecitekey sourceCitekey�'  � �!� ����������������������
�	����! 0 pdfpath pdfPath�  
0 pdfurl  � 0 sourcecitekey sourceCitekey� 0 pdfdoc pdfDoc� 0 pdfdoi pdfDOI� *0 pdfannotationsarray pdfAnnotationsArray� 0 i  � 0 pdfpage pdfPage� 0 	pagelabel 	pageLabel� 0 pdfannotations  � 0 pdfannotation pdfAnnotation� 0 	annottype 	annotType� 0 
markuptype 
markupType� 0 
annotcolor 
annotColor� 0 	huedegree 	hueDegree�  0 annotcolorname annotColorName� 0 annotusername annotUserName� 0 annotmoddate annotModDate� 0 annotbounds annotBounds� 0 annotorigin annotOrigin� 0 	annotposx 	annotPosX� 0 	annotposy 	annotPosY� 0 
quadpoints 
quadPoints�
 0 boundsbyline boundsByLine�	 0 	annottext 	annotText� 0 annotcomment annotComment� 0 annoturl annotURL� 0 annotkeydict annotKeyDict� D������ ����������������������
�
�
�
�
���
�
�
���������������������������JNRU��������s������������������������������������
� misccura� 0 pdfdocument PDFDocument� 	0 alloc  � 	0 NSURL  � $0 fileurlwithpath_ fileURLWithPath_�  0 initwithurl_ initWithURL_�� 0 
doifrompdf 
doiFromPDF��  0 nsmutablearray NSMutableArray�� 0 new  �� 0 	pageCount  �� 0 pageatindex_ pageAtIndex_�� 	0 label  �� 0 annotations  
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 type  �� �� 0 
markuptype 
markupType
�� 
msng�� 	0 color  �� 0 huecomponent hueComponent
�� 
nmbr��h
�� 
dire
�� olierndS
�� .sysorondlong        doub�� "0 colornameforhue colorNameForHue�� 0 username userName�� $0 modificationdate modificationDate�� 
0 bounds  �� �� *0 quadrilateralpoints quadrilateralPoints�� 00 annotationboundsbyline annotationBoundsByLine��  0 annotationtext annotationText�� 0 contents  
�� 
long�� *0 annotationkeyvalues annotationKeyValues�� 0 citekey  �� 0 page  �� 0 	pagelabel 	pageLabel�� 0 	annottype 	annotType�� 0 
annotcolor 
annotColor��  0 annotcolorname annotColorName�� 0 modifieddate modifiedDate�� 0 	annottext 	annotText�� 0 comment  �� 0 deeplink deepLink�� �� 0 
addobject_ 
addObject_
�� 
list�&��,j+ ��,�k+ k+ E�Ob  ,��em+ E�O��,j+ E�O�j�j+ 	kkh ��k+ 
E�O�j+ E�O�j+ E�O��[��l kh 
�j+ E�Oa a a a a a v�ja a a mv� �j+ E�Y a E�O�j+ E�O� �j+ a &a  a  a !l "UE�O)�k+ #E�O�j+ $E^ O�j+ %E^ O�j+ &E^ O] �k/E^ O] [�k/\[�l/\ZlvE[�k/E^ Z[�l/E^ ZOa 'a (a )a *a +v� ,�j+ ,E^ O)] ] l+ -E^ O)�] l+ .E^ Y 	a /E^ O�j+ 0E^ O�a 1%�%a 2%�%a 3%] a 4&%a 5%] a 4&%E^ O�j+ 6E^ O�a 7�a 8�a 9�a :�a �a ;�a <�a $] a =] a >] a ?] a @] a Ak+ BY h[OY�q[OY�CO�a C&�lv� ������������� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�� ����� �  ������ 0 	annottext 	annotText�� 0 annotcomment annotComment��  � ���������������� 0 	annottext 	annotText�� 0 annotcomment annotComment�� (0 recordcontentparts recordContentParts�� $0 processedcomment processedComment�� 00 firstlevelheadingregex firstLevelHeadingRegex�� &0 firstlevelheading firstLevelHeading��  0 recordcontents recordContents� �����������4K�]l��������
�� 
msng
�� 
bool
�� 
TEXT
�� misccura�� 0 nsnull NSNull� 0 null  � 0 
regexmatch 
regexMatch� 0 regexreplace regexReplace
� 
lnfd�  0 mergetextitems mergeTextItems�� �jvE�O��	 ���& ��&%�6GY hO��	 ���,�,�&	 ���& a�E�O�E�Ob  ,��l+ 
E�O�� )b  ,���m+ E�O��5GOb  ,���%�m+ E�Y hOb  ,�a a m+ E�O��6GY hO�jv b  ,�_ _ %l+ E�Y a E�� �������� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData� ��� �  ���� 0 	annottext 	annotText� 0 annotcomment annotComment� 0 	pagelabel 	pageLabel�  � �������� 0 	annottext 	annotText� 0 annotcomment annotComment� 0 	pagelabel 	pageLabel� "0 recordnameparts recordNameParts�  0 recordnamepart recordNamePart� $0 markdownheadings markdownHeadings� 0 
recordname 
recordName� ����������2��I[jlvz���
� 
msng
� 
bool
� 
TEXT� 40 markdownheadingsfromtext markdownHeadingsFromText
� 
cobj� 0 heading  � � (0 firstwordsfromtext firstWordsFromText�  0 mergetextitems mergeTextItems� �jvE�O��	 ���& ��&%�6GY hO�E�O��	 ���& D��&E�Ob  ,��l+ E�O�jv ��k/�,E�Y hO��  b  ,��l+ E�Y hY hO��  (b  ,��l+ E�O�� a �%a %E�Y hY hO�a   
a E�Y hO��6GO�jv b  ,�a l+ E�Y a E�O�� ��������  0 createdtrecord createDTRecord� ��� �  ��������������  0 folderlocation folderLocation�  0 foldermetadata folderMetadata� 0 
recordname 
recordName� 0 recordaliases recordAliases� 0 	recordurl 	recordURL� 0 
recordtags 
recordTags� 0 	isflagged 	isFlagged� 0 
recordtext 
recordText� (0 recordcreationdate recordCreationDate� 00 recordmodificationdate recordModificationDate�  0 recordmetadata recordMetadata� 0 recordrating recordRating� $0 recordlabelindex recordLabelIndex�  � �������������������~�}�|�{�z�  0 folderlocation folderLocation�  0 foldermetadata folderMetadata� 0 
recordname 
recordName� 0 recordaliases recordAliases� 0 	recordurl 	recordURL� 0 
recordtags 
recordTags� 0 	isflagged 	isFlagged� 0 
recordtext 
recordText� (0 recordcreationdate recordCreationDate� 00 recordmodificationdate recordModificationDate�  0 recordmetadata recordMetadata� 0 recordrating recordRating� $0 recordlabelindex recordLabelIndex� 0 newrecorddata newRecordData� 0 arecord aRecord� 0 didcreatenote didCreateNote� 0 didupdatenote didUpdateNote� $0 isexistingrecord isExistingRecord�~ "0 existingrecords existingRecords�}  0 targetlocation targetLocation�|  0 existingrecord existingRecord�{ (0 existingrecordtags existingRecordTags�z 0 atag aTag�  �y��x�w�v�u�t�s�r�q�p�oF�n�m`�l�k�j�i�h�g�f�e�d�c�b�a�`�_
�y 
capp
�x kfrmID  
�w 
DTty
�v Ctypmkdn
�u 
DTcn
�t 
pnam�s 
�r 
msng
�q 
DTcr
�p 
pURL
�o 
DTal
�n .DTpacd49list       utxt
�m 
DTlo
�l 
kocl
�k 
cobj
�j .corecnte****       ****
�i 
bool
�h 
DTin
�g .DTpacd08DTrc       reco
�f 
DTco
�e 
DTpl
�d 
DTmo
�c 
DTst
�b 
DTrt
�a 
DTla
�` 
tags�_ 60 updatemetadatafordtrecord updateMetadataForDTRecord� )���0�����E�O�� ��l%E�Y hO�� ��l%E�Y hO�� ���l%E�Y hO�E�OfE�OfE^ OfE^ O�� p�j E^ O] jv Y�a ,��,%a %E^ O A] [a a l kh �� 	 ] a ,]  a & ] E�OeE^ Y h[OY��Y hY hO��  4�a �l E�O��%E�O�a ,�a ,FOeE�Ob  )kEc  )Y hO] f 
 b  	e a &�b  
e  ��,� eE^ O���,FY hY hOb  e   �a ,� eE^ O��a ,FY hY hO] f 
 b  e a &	 	��a &  �a ,� eE^ O��a ,FY hY hO] f 
 b  e a &  �a ,� eE^ O��a ,FY hY hO] f 
 b  e a &  �a ,� eE^ O��a ,FY hY hO] f 
 b  e a &  �a ,� eE^ O��a ,FY hY hO] f 
 b  e a &	 
�jva & H�a ,E^ O ,�[a a l kh ] ]  
eE^ Y h[OY��O] �%�a ,FY hO] f 
 b  e a & )��l+  
eE^ Y hY hO] e 	 	�f a & b  *kEc  *Y hY hO�] lvU� �^��]�\���[�^ 00 setmetadatafordtfolder setMetadataForDTFolder�] �Z��Z �  �Y�X�Y  0 folderlocation folderLocation�X  0 foldermetadata folderMetadata�\  � �W�V�W  0 folderlocation folderLocation�V  0 foldermetadata folderMetadata� �U�T�S��R�Q
�U 
msng
�T 
bool
�S 
capp
�R kfrmID  
�Q 
DTcm�[ 6b  e 	 ���&	 ���&	 �jv�& )���0 ���,FUY h� �P�O�N���M�P 00 setmetadatafordtrecord setMetadataForDTRecord�O �L��L �  �K�J�K 0 arecord aRecord�J  0 recordmetadata recordMetadata�N  � �I�H�I 0 arecord aRecord�H  0 recordmetadata recordMetadata� �G�F�E�D�C
�G 
msng
�F 
bool
�E 
capp
�D kfrmID  
�C 
DTcm�M *��	 ���&	 �jv�& )���0 ���,FUY h� �B;�A�@���?�B 60 updatemetadatafordtrecord updateMetadataForDTRecord�A �>��> �  �=�<�= 0 arecord aRecord�<  0 recordmetadata recordMetadata�@  � 
�;�:�9�8�7�6�5�4�3�2�; 0 arecord aRecord�:  0 recordmetadata recordMetadata�9 0 didupdatenote didUpdateNote�8 00 existingrecordmetadata existingRecordMetadata�7 0 existingkeys existingKeys�6 0 thekeys theKeys�5 0 thekey theKey�4 0 dtkey dtKey�3 0 thevalue theValue�2 0 existingvalue existingValue� �1�0�/��.�-�,�+�*�)�(�'�&�%�$�#
�1 
msng
�0 
bool
�/ 
capp
�. kfrmID  
�- 
DTcm�,  �+  �* 0 keysofrecord_ keysOfRecord_
�) 
kocl
�( 
cobj
�' .corecnte****       ****�& F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�% .0 valueforkey_inrecord_ valueForKey_inRecord_�$ 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_�# <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_�? �� 
 �� �&
 �jv �& fY hOfE�O)���0 ���,E�O ��  	jvE�Y hW X  jvE�O�jv �b  ,�k+ E�Ob  ,�k+ E�O a�[��l kh )�k+ E�O�� =b  ,��l+ E�Ob  ,��l+ E�O�� eE�Ob  ,ৣm+ E�Y hY eE�[OY��Ob  ,��l+ E�Y hO���,FUO�� �"�!� ����" F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�! ��� �  �� 0 thekey theKey�   � ��� 0 thekey theKey� 0 dtkey dtKey� �"�*� 0 lowercasetext lowercaseText� 0 regexreplace regexReplace� !b  ,�k+  E�Ob  ,���m+ E�O�%� �8������ 60 appendtocommentofdtfolder appendToCommentOfDTFolder� ��� �  ���  0 folderlocation folderLocation� 0 foldercomment folderComment�  � �����  0 folderlocation folderLocation� 0 foldercomment folderComment� 0 commentparts commentParts� .0 existingfoldercomment existingFolderComment� 	���{�
�	_��
� 
msng
� 
bool
� 
capp
�
 kfrmID  
�	 
DTco
� 
lnfd�  0 mergetextitems mergeTextItems� U��	 �jv�& FjvE�O)���0 5��,E�O��	 ���& 	��6GY hO��6GOb  ,���%l+ ��,FUY h� �������� &0 bibmetadatafordoi bibMetadataForDOI� ��� �  �� � 0 doi  �  0 citekey  �  � �������������������������������������� 0 doi  �� 0 citekey  �� "0 publicationdata publicationData�� 0 bibmetadata bibMetadata�� 0 
pubauthors 
pubAuthors�� "0 pubauthorscount pubAuthorsCount�� 0 pubdate pubDate�� 0 pubpublisher pubPublisher�� 0 pubissn pubISSN�� 0 
pubjournal 
pubJournal�� 0 	pubvolume 	pubVolume�� 0 pubissue pubIssue�� 0 pubpages pubPages�� 0 pubcitation pubCitation�� 0 	pubbibtex 	pubBibTeX�� 0 publink pubLink�� 0 pubpmid pubPMID�� 0 pubpmcid pubPMCID� 7���������������������������5HV����r����������������%��8E��Xe��x�����������
�� 
msng
�� 
bool�� ��  0 metadatafordoi metadataForDOI�� .0 valueforkey_inrecord_ valueForKey_inRecord_�� 0 authors  
�� 
lnfd��  0 mergetextitems mergeTextItems
�� .corecnte****       ****�� 
0 author  
�� 
cobj�� 0 date  
�� 
ldt �� 0 	publisher  �� 0 is?n  �� 0 journal  �� 
0 volume  �� 0 page  �� 0 	reference  �� 
0 bibtex  �� 0 link  �� 0 pmid  �� 	0 pmcid  ��� 
 �� �& jvY hOb  ,�b  b  ���+ E�O�jv  jvY hOjvE�Ob  ,�l+ E�O��	 ���&	 �jv�& `��b  ,��l+ l%E�O�j E�O�k  ���k/l%E�Y .�l  ���k/a %��l/%l%E�Y ���k/a %l%E�Y hOb  ,a �l+ E�O�� �a �a &l%E�Y hOb  ,a �l+ E�O��	 	�a �& �a �l%E�Y hOb  ,a �l+ E�O��	 	�a �& �a �l%E�Y hOb  ,a �l+ E�O��	 	�a �& �a �l%E�Y hOb  ,a �l+ E�Ob  ,a �l+ E�O��	 	�a  �& 1��	 	�a !�& �a "%�%a #%E�Y hO�a $�l%E�Y hOb  ,a %�l+ E�O��	 	�a &�& �a '�l%E�Y hOb  ,a (�l+ E�O��	 	�a )�& �a *�l%E�Y hOb  ,a +�l+ E�O��	 	�a ,�& �a -�l%E�Y hOb  ,a .�l+ E�O��	 	�a /�& �a 0�l%E�Y hOb  ,a 1�l+ E^ O] �	 ] a 2�& �a 3] l%E�Y hOb  ,a 4�l+ E^ O] �	 ] a 5�& �a 6] l%E�Y hO�� ������������� 00 labelindexforcolorname labelIndexForColorName�� ����� �  ���� 0 	colorname 	colorName��  � �������� 0 	colorname 	colorName�� $0 recordlabelindex recordLabelIndex�� 0 labelmapping labelMapping� ����������
�� 
msng
�� 
bool�� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_�� 0 
labelindex 
labelIndex�� ?�� 
 �� �& jY hOjE�Ob  ,�b  (m+ E�O�� 
��,E�Y hO�� ��,���������� "0 colornameforhue colorNameForHue�� ����� �  ���� 0 	huedegree 	hueDegree��  � �������� 0 	huedegree 	hueDegree�� 0 	colorname 	colorName�� 0 colormapping colorMapping� 	4��������T
�� 
kocl
� 
cobj
� .corecnte****       ****� 0 lowerhuelimit lowerHueLimit� 0 upperhuelimit upperHueLimit
� 
bool� 0 	colorname 	colorName�� d�E�O 3b  '[��l kh ���,	 	���,�& 
��,E�Y h[OY��O�� 	 ���,
 	���,�&�& b  �,E�Y hO�� �������  0 annotationtext annotationText� ��� �  ��� 0 pdfpage pdfPage� 0 boundsbyline boundsByLine�  � ������� 0 pdfpage pdfPage� 0 boundsbyline boundsByLine� 0 
textbyline 
textByLine� 0 	thebounds 	theBounds� 0 pdfselection pdfSelection� 0 linetext lineText� ����������������
� 
kocl
� 
cobj
� .corecnte****       ****� &0 selectionforrect_ selectionForRect_� 
0 string  
� 
msng
� 
bool
� 
TEXT� 0 regexreplace regexReplace�  0 mergetextitems mergeTextItems� ojvE�O [�[��l kh ��k+ E�O�j+ E�O��	 ���& )b  ,��&��m+ E�Ob  ,���m+ E�O��6GY h[OY��Ob  ,��l+ � �1������ 00 annotationboundsbyline annotationBoundsByLine� ��� �  ��� 0 
quadpoints 
quadPoints� $0 annotationbounds annotationBounds�  � 	���������� 0 
quadpoints 
quadPoints� $0 annotationbounds annotationBounds� 0 	theorigin 	theOrigin� 0 boundsbyline boundsByLine� 0 maxquadcount maxQuadCount� 0 	quadcount 	quadCount� 0 topleftpoint topLeftPoint� $0 bottomrightpoint bottomRightPoint� 0 
linebounds 
lineBounds� �����������
� 
cobj
� .corecnte****       ****� �� 0 
pointvalue 
pointValue�� 0 x  �� 0 y  �� 0 
makensrect 
makeNSRect� ���k/E�OjvE�O�j �!E�OkE�O ��kh��/j+ E�O��m/j+ E�O��,��k/b  ��,FO��,��l/b  ��,FO��,��k/b  ��,FO��,��l/b  ��,FO)��,��,lv��,��,lvlvk+ E�O��6GO��E�[OY�tO�� ��*���������� 0 
makensrect 
makeNSRect�� ����� �  �� {�������� 0 alist aList
�� 
list��  ��  � ����������~�}�|�� 0 alist aList�� 0 x1  �� 0 y1  �� 0 x2  � 0 y2  �~ 0 xwidth xWidth�} 0 yheight yHeight�| 0 a1rect a1Rect� �{�z�y�x�w�v�u�t�s�r�q
�{ 
cobj�z 
0 origin  �y 0 x  �x 0 y  �w �v 0 size  �u 	0 width  �t 
0 height  �s  �r  
�q 
msng�� ^ U�E[�k/E[�k/EQ�Z[�l/EQ�ZZ[�l/E[�k/EQ�Z[�l/EQ�ZZO��E�O��E�O���������E�O�W 	X  	� ascr  ��ޭ