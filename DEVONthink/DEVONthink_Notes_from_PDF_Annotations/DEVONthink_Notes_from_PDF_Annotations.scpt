FasdUAS 1.101.10   ��   ��    k             l     ��  ��    , & DEVONthink Notes from PDF Annotations     � 	 	 L   D E V O N t h i n k   N o t e s   f r o m   P D F   A n n o t a t i o n s   
  
 l     ��  ��    2 , version 1.1, licensed under the MIT license     �   X   v e r s i o n   1 . 1 ,   l i c e n s e d   u n d e r   t h e   M I T   l i c e n s e      l     ��������  ��  ��        l     ��  ��    B < by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de     �   x   b y   M a t t h i a s   S t e f f e n s ,   k e y p o i n t s . a p p ,   m a t ( a t ) e x t r a c t s ( d o t ) d e      l     ��������  ��  ��        l     ��  ��    o i For each of the PDFs selected in DEVONthink, this script will iterate over its contained PDF annotations     �   �   F o r   e a c h   o f   t h e   P D F s   s e l e c t e d   i n   D E V O N t h i n k ,   t h i s   s c r i p t   w i l l   i t e r a t e   o v e r   i t s   c o n t a i n e d   P D F   a n n o t a t i o n s      l     ��   ��    Q K and create or update a Markdown record for each markup or text annotation.      � ! ! �   a n d   c r e a t e   o r   u p d a t e   a   M a r k d o w n   r e c o r d   f o r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n .   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & l f This script requires macOS 10.14 (High Sierra) or greater, the KeypointsScriptingLib v1.4 or greater,    ' � ( ( �   T h i s   s c r i p t   r e q u i r e s   m a c O S   1 0 . 1 4   ( H i g h   S i e r r a )   o r   g r e a t e r ,   t h e   K e y p o i n t s S c r i p t i n g L i b   v 1 . 4   o r   g r e a t e r , %  ) * ) l     �� + ,��   + g a and DEVONthink Pro v3.x or greater (DEVONthink Pro v3.9 or greater will be required to have deep    , � - - �   a n d   D E V O N t h i n k   P r o   v 3 . x   o r   g r e a t e r   ( D E V O N t h i n k   P r o   v 3 . 9   o r   g r e a t e r   w i l l   b e   r e q u i r e d   t o   h a v e   d e e p *  . / . l     �� 0 1��   0 0 * links to PDF annotations work correctly).    1 � 2 2 T   l i n k s   t o   P D F   a n n o t a t i o n s   w o r k   c o r r e c t l y ) . /  3 4 3 l     ��������  ��  ��   4  5 6 5 l     ��������  ��  ��   6  7 8 7 l     �� 9 :��   9   Setup:    : � ; ;    S e t u p : 8  < = < l     ��������  ��  ��   =  > ? > l     �� @ A��   @ s m -- Before running the script, do this once: Adjust the DEVONthink label <-> color mapping via the properties    A � B B �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   d o   t h i s   o n c e :   A d j u s t   t h e   D E V O N t h i n k   l a b e l   < - >   c o l o r   m a p p i n g   v i a   t h e   p r o p e r t i e s ?  C D C l     �� E F��   E B <     `label1` ... `label7` below and save this script again.    F � G G x           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w   a n d   s a v e   t h i s   s c r i p t   a g a i n . D  H I H l     ��������  ��  ��   I  J K J l     �� L M��   L t n -- You may also want to check the other properties below. These allow to customize the script, e.g. to enable    M � N N �   - -   Y o u   m a y   a l s o   w a n t   t o   c h e c k   t h e   o t h e r   p r o p e r t i e s   b e l o w .   T h e s e   a l l o w   t o   c u s t o m i z e   t h e   s c r i p t ,   e . g .   t o   e n a b l e K  O P O l     �� Q R��   Q L F     updating of existing notes, or automatic fetching of BibTeX data.    R � S S �           u p d a t i n g   o f   e x i s t i n g   n o t e s ,   o r   a u t o m a t i c   f e t c h i n g   o f   B i b T e X   d a t a . P  T U T l     ��������  ��  ��   U  V W V l     �� X Y��   X u o -- Copy the script to a suitable place, like the DEVONthink script folder, or the system's script menu folder.    Y � Z Z �   - -   C o p y   t h e   s c r i p t   t o   a   s u i t a b l e   p l a c e ,   l i k e   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   o r   t h e   s y s t e m ' s   s c r i p t   m e n u   f o l d e r . W  [ \ [ l     �� ] ^��   ] N H     For a guide on how to enable and use the system's script menu, see:    ^ � _ _ �           F o r   a   g u i d e   o n   h o w   t o   e n a b l e   a n d   u s e   t h e   s y s t e m ' s   s c r i p t   m e n u ,   s e e : \  ` a ` l     �� b c��   b ? 9     https://iworkautomation.com/numbers/script-menu.html    c � d d r           h t t p s : / / i w o r k a u t o m a t i o n . c o m / n u m b e r s / s c r i p t - m e n u . h t m l a  e f e l     ��������  ��  ��   f  g h g l     �� i j��   i q k -- If you've placed your script into the DEVONthink script folder, you may also append a keyboard shortcut    j � k k �   - -   I f   y o u ' v e   p l a c e d   y o u r   s c r i p t   i n t o   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   y o u   m a y   a l s o   a p p e n d   a   k e y b o a r d   s h o r t c u t h  l m l l     �� n o��   n t n     description (like `___Command-Shift-Alt-A`) to the script's name. After restarting DEVONthink, you should    o � p p �           d e s c r i p t i o n   ( l i k e   ` _ _ _ C o m m a n d - S h i f t - A l t - A ` )   t o   t h e   s c r i p t ' s   n a m e .   A f t e r   r e s t a r t i n g   D E V O N t h i n k ,   y o u   s h o u l d m  q r q l     �� s t��   s J D     be able to run your script via the specified keyboard shortcut.    t � u u �           b e   a b l e   t o   r u n   y o u r   s c r i p t   v i a   t h e   s p e c i f i e d   k e y b o a r d   s h o r t c u t . r  v w v l     ��������  ��  ��   w  x y x l     ��������  ��  ��   y  z { z l     �� | }��   |   Run script:    } � ~ ~    R u n   s c r i p t : {   �  l     ��������  ��  ��   �  � � � l     �� � ���   � n h -- Before running the script, please select one or more PDF records with PDF annotations in DEVONthink.    � � � � �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   p l e a s e   s e l e c t   o n e   o r   m o r e   P D F   r e c o r d s   w i t h   P D F   a n n o t a t i o n s   i n   D E V O N t h i n k . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- To run the script, select its menu entry from the (DEVONthink or system's) script menu, or press your    � � � � �   - -   T o   r u n   t h e   s c r i p t ,   s e l e c t   i t s   m e n u   e n t r y   f r o m   t h e   ( D E V O N t h i n k   o r   s y s t e m ' s )   s c r i p t   m e n u ,   o r   p r e s s   y o u r �  � � � l     �� � ���   � ' !     specified keyboard shortcut.    � � � � B           s p e c i f i e d   k e y b o a r d   s h o r t c u t . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- After the script has finished, you'll see a dialog with feedback on how many PDFs have been processed    � � � � �   - -   A f t e r   t h e   s c r i p t   h a s   f i n i s h e d ,   y o u ' l l   s e e   a   d i a l o g   w i t h   f e e d b a c k   o n   h o w   m a n y   P D F s   h a v e   b e e n   p r o c e s s e d �  � � � l     �� � ���   � m g     and how many note records have been created/updated. For each PDF, its annotation notes are stored    � � � � �           a n d   h o w   m a n y   n o t e   r e c o r d s   h a v e   b e e n   c r e a t e d / u p d a t e d .   F o r   e a c h   P D F ,   i t s   a n n o t a t i o n   n o t e s   a r e   s t o r e d �  � � � l     �� � ���   � m g     within a DEVONthink group next to the PDF. By default, the group is named identical to the PDF but    � � � � �           w i t h i n   a   D E V O N t h i n k   g r o u p   n e x t   t o   t h e   P D F .   B y   d e f a u l t ,   t h e   g r o u p   i s   n a m e d   i d e n t i c a l   t o   t h e   P D F   b u t �  � � � l     �� � ���   � / )     contains an " � Annotations" suffix.    � � � � R           c o n t a i n s   a n   "      A n n o t a t i o n s "   s u f f i x . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � m g -- Note that you can run the script multiple times with the same PDF record(s) selected in DEVONthink.    � � � � �   - -   N o t e   t h a t   y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k . �  � � � l     �� � ���   � n h     On a subsequent run of the script, all notes that were newly created (or updated) will be selected.    � � � � �           O n   a   s u b s e q u e n t   r u n   o f   t h e   s c r i p t ,   a l l   n o t e s   t h a t   w e r e   n e w l y   c r e a t e d   ( o r   u p d a t e d )   w i l l   b e   s e l e c t e d . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Notes:    � � � �    N o t e s : �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � | v -- The script will only recognize these annotation types: "Highlight", "StrikeOut", "Underline", "Squiggly" & "Text".    � � � � �   - -   T h e   s c r i p t   w i l l   o n l y   r e c o g n i z e   t h e s e   a n n o t a t i o n   t y p e s :   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y "   &   " T e x t " . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � u o -- For each selected PDF with PDF annotations, the script will create a DEVONthink group next to it containing    � � � � �   - -   F o r   e a c h   s e l e c t e d   P D F   w i t h   P D F   a n n o t a t i o n s ,   t h e   s c r i p t   w i l l   c r e a t e   a   D E V O N t h i n k   g r o u p   n e x t   t o   i t   c o n t a i n i n g �  � � � l     �� � ���   � y s     Markdown record(s) for all recognized PDF annotation(s). The group's name can be controlled via the properties    � � � � �           M a r k d o w n   r e c o r d ( s )   f o r   a l l   r e c o g n i z e d   P D F   a n n o t a t i o n ( s ) .   T h e   g r o u p ' s   n a m e   c a n   b e   c o n t r o l l e d   v i a   t h e   p r o p e r t i e s �  � � � l     �� � ���   � A ;     `noteFolderNamePrefix` & `noteFolderNameSuffix` below.    � � � � v           ` n o t e F o l d e r N a m e P r e f i x `   &   ` n o t e F o l d e r N a m e S u f f i x `   b e l o w . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � v p -- You can run the script multiple times with the same PDF record(s) selected in DEVONthink. If PDF annotations    � � � � �   - -   Y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k .   I f   P D F   a n n o t a t i o n s �  � � � l     �� � ���   � { u     have been added to the PDF file after the last script run, the next script run will add Markdown records for the    � � � � �           h a v e   b e e n   a d d e d   t o   t h e   P D F   f i l e   a f t e r   t h e   l a s t   s c r i p t   r u n ,   t h e   n e x t   s c r i p t   r u n   w i l l   a d d   M a r k d o w n   r e c o r d s   f o r   t h e �  � � � l     �� � ���   � z t     newly created PDF annotations. Note that deletions will not get synced across. If existing PDF annotations have    � � � � �           n e w l y   c r e a t e d   P D F   a n n o t a t i o n s .   N o t e   t h a t   d e l e t i o n s   w i l l   n o t   g e t   s y n c e d   a c r o s s .   I f   e x i s t i n g   P D F   a n n o t a t i o n s   h a v e �  � � � l     �� � ���   � y s     been updated the script can update the corresponding Markdown records. While this is off by default, it can be    � � � � �           b e e n   u p d a t e d   t h e   s c r i p t   c a n   u p d a t e   t h e   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d s .   W h i l e   t h i s   i s   o f f   b y   d e f a u l t ,   i t   c a n   b e �  � � � l     �� � ���   � { u     enabled by setting below property `updateExistingNotes` to `true`. In that case, these properties can be updated    � � � � �           e n a b l e d   b y   s e t t i n g   b e l o w   p r o p e r t y   ` u p d a t e E x i s t i n g N o t e s `   t o   ` t r u e ` .   I n   t h a t   c a s e ,   t h e s e   p r o p e r t i e s   c a n   b e   u p d a t e d �  � � � l     �� � ���   � x r     (if enabled below): name, note text, modification date, flagged status, rating, label, tags, custom metadata.    � � � � �           ( i f   e n a b l e d   b e l o w ) :   n a m e ,   n o t e   t e x t ,   m o d i f i c a t i o n   d a t e ,   f l a g g e d   s t a t u s ,   r a t i n g ,   l a b e l ,   t a g s ,   c u s t o m   m e t a d a t a . �  � � � l     �� � ���   � ~ x     Note that if you change a PDF annotation's annotation type (say, from "Highlight" to "Underline"), this will always    � � � � �           N o t e   t h a t   i f   y o u   c h a n g e   a   P D F   a n n o t a t i o n ' s   a n n o t a t i o n   t y p e   ( s a y ,   f r o m   " H i g h l i g h t "   t o   " U n d e r l i n e " ) ,   t h i s   w i l l   a l w a y s �  � � � l     �� � ���   � &       create a new Markdown note.    � � � � @           c r e a t e   a   n e w   M a r k d o w n   n o t e . �  �  � l     ��������  ��  ��     l     ����   w q -- If possible, the PDF annotation's source text will get added to the body text of the Markdown record. However    � �   - -   I f   p o s s i b l e ,   t h e   P D F   a n n o t a t i o n ' s   s o u r c e   t e x t   w i l l   g e t   a d d e d   t o   t h e   b o d y   t e x t   o f   t h e   M a r k d o w n   r e c o r d .   H o w e v e r  l     ��	��   z t     note that, depending on the tool used for PDF annotation, this may fail or be inaccurate. In that case, you may   	 �

 �           n o t e   t h a t ,   d e p e n d i n g   o n   t h e   t o o l   u s e d   f o r   P D F   a n n o t a t i o n ,   t h i s   m a y   f a i l   o r   b e   i n a c c u r a t e .   I n   t h a t   c a s e ,   y o u   m a y  l     ����   v p     improve text extraction success by tweaking the properties `lineWidthEnlargement` & `lineHeightEnlargement`    � �           i m p r o v e   t e x t   e x t r a c t i o n   s u c c e s s   b y   t w e a k i n g   t h e   p r o p e r t i e s   ` l i n e W i d t h E n l a r g e m e n t `   &   ` l i n e H e i g h t E n l a r g e m e n t `  l     ����         below.    �            b e l o w .  l     ��������  ��  ��    l     ����   w q -- Notes that have been added to a PDF annotation will also get added to the Markdown record's body text. Within    � �   - -   N o t e s   t h a t   h a v e   b e e n   a d d e d   t o   a   P D F   a n n o t a t i o n   w i l l   a l s o   g e t   a d d e d   t o   t h e   M a r k d o w n   r e c o r d ' s   b o d y   t e x t .   W i t h i n  l     ����   { u     a PDF annotation note, you can use following (Keypoints-style) syntax to explicitly set the name of the Markdown    �   �           a   P D F   a n n o t a t i o n   n o t e ,   y o u   c a n   u s e   f o l l o w i n g   ( K e y p o i n t s - s t y l e )   s y n t a x   t o   e x p l i c i t l y   s e t   t h e   n a m e   o f   t h e   M a r k d o w n !"! l     ��#$��  # ( "     record and/or its properties:   $ �%% D           r e c o r d   a n d / o r   i t s   p r o p e r t i e s :" &'& l     ��()��  ( x r     - A line prefixed with `# ` (like a Markdown first-level heading) will be used as the Markdown record's name.   ) �** �           -   A   l i n e   p r e f i x e d   w i t h   ` #   `   ( l i k e   a   M a r k d o w n   f i r s t - l e v e l   h e a d i n g )   w i l l   b e   u s e d   a s   t h e   M a r k d o w n   r e c o r d ' s   n a m e .' +,+ l     ��-.��  - v p     - One or more line(s) prefixed with `< ` indicate a metadata line which will get stripped from the record's   . �// �           -   O n e   o r   m o r e   l i n e ( s )   p r e f i x e d   w i t h   ` <   `   i n d i c a t e   a   m e t a d a t a   l i n e   w h i c h   w i l l   g e t   s t r i p p e d   f r o m   t h e   r e c o r d ' s, 010 l     ��23��  2 E ?        body text but which will set record properties instead:   3 �44 ~                 b o d y   t e x t   b u t   w h i c h   w i l l   s e t   r e c o r d   p r o p e r t i e s   i n s t e a d :1 565 l     ��78��  7 z t        - In a metadata line, include 1 to 5 asterisks or `?`characters to set the record's star-rating, for example   8 �99 �                 -   I n   a   m e t a d a t a   l i n e ,   i n c l u d e   1   t o   5   a s t e r i s k s   o r   `& ` c h a r a c t e r s   t o   s e t   t h e   r e c o r d ' s   s t a r - r a t i n g ,   f o r   e x a m p l e6 :;: l     ��<=��  < K E          `< ****` would set a 4-star rating for the Markdown record.   = �>> �                     ` <   * * * * `   w o u l d   s e t   a   4 - s t a r   r a t i n g   f o r   t h e   M a r k d o w n   r e c o r d .; ?@? l     ��AB��  A x r        - In a metadata line, add the special tag `@:flagged` to set the Markdown record's flagged status to true.   B �CC �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   t h e   s p e c i a l   t a g   ` @ : f l a g g e d `   t o   s e t   t h e   M a r k d o w n   r e c o r d ' s   f l a g g e d   s t a t u s   t o   t r u e .@ DED l     ��FG��  F w q        - In a metadata line, add any tags like `@tag` or `@another tag` to set these as the tags of the Markdown   G �HH �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   t a g s   l i k e   ` @ t a g `   o r   ` @ a n o t h e r   t a g `   t o   s e t   t h e s e   a s   t h e   t a g s   o f   t h e   M a r k d o w nE IJI l     ��KL��  K            record.   L �MM "                     r e c o r d .J NON l     ��PQ��  P v p        - In a metadata line, add any custom key:value attributes like `@:key:Some value` to set these as custom   Q �RR �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   c u s t o m   k e y : v a l u e   a t t r i b u t e s   l i k e   ` @ : k e y : S o m e   v a l u e `   t o   s e t   t h e s e   a s   c u s t o mO STS l     ��UV��  U w q          metadata of the Markdown record. A custom attribute w/o a value (like `@:key`) will get a default value   V �WW �                     m e t a d a t a   o f   t h e   M a r k d o w n   r e c o r d .   A   c u s t o m   a t t r i b u t e   w / o   a   v a l u e   ( l i k e   ` @ : k e y ` )   w i l l   g e t   a   d e f a u l t   v a l u eT XYX l     ��Z[��  Z            of `true`.   [ �\\ (                     o f   ` t r u e ` .Y ]^] l     ��_`��  _ p j        Note that you can also include any/all of these properties on a single metadata line, for example:   ` �aa �                 N o t e   t h a t   y o u   c a n   a l s o   i n c l u d e   a n y / a l l   o f   t h e s e   p r o p e r t i e s   o n   a   s i n g l e   m e t a d a t a   l i n e ,   f o r   e x a m p l e :^ bcb l     �de�  d C =        `< **** @:flagged @tag @another tag @:key:Some value`   e �ff z                 ` <   * * * *   @ : f l a g g e d   @ t a g   @ a n o t h e r   t a g   @ : k e y : S o m e   v a l u e `c ghg l     �~�}�|�~  �}  �|  h iji l     �{kl�{  k { u -- For your PDF record, as well as for each of the created Markdown records, a link to the "... � Annotations" group   l �mm �   - -   F o r   y o u r   P D F   r e c o r d ,   a s   w e l l   a s   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s ,   a   l i n k   t o   t h e   " . . .      A n n o t a t i o n s "   g r o u pj non l     �zpq�z  p { u     folder will be copied to a custom metadata field (named `pdfannotations`). This allows you to easily get back to   q �rr �           f o l d e r   w i l l   b e   c o p i e d   t o   a   c u s t o m   m e t a d a t a   f i e l d   ( n a m e d   ` p d f a n n o t a t i o n s ` ) .   T h i s   a l l o w s   y o u   t o   e a s i l y   g e t   b a c k   t oo sts l     �yuv�y  u / )     the PDF's group of annotation notes.   v �ww R           t h e   P D F ' s   g r o u p   o f   a n n o t a t i o n   n o t e s .t xyx l     �x�w�v�x  �w  �v  y z{z l     �u|}�u  | x r -- The URL field of each Markdown record will be set to a deep link that directly points to the corresponding PDF   } �~~ �   - -   T h e   U R L   f i e l d   o f   e a c h   M a r k d o w n   r e c o r d   w i l l   b e   s e t   t o   a   d e e p   l i n k   t h a t   d i r e c t l y   p o i n t s   t o   t h e   c o r r e s p o n d i n g   P D F{ � l     �t���t  � } w     annotation. I.e., clicking this deep link will open the associated PDF and scroll the corresponding PDF annotation   � ��� �           a n n o t a t i o n .   I . e . ,   c l i c k i n g   t h i s   d e e p   l i n k   w i l l   o p e n   t h e   a s s o c i a t e d   P D F   a n d   s c r o l l   t h e   c o r r e s p o n d i n g   P D F   a n n o t a t i o n� ��� l     �s���s  � H B     into view. Note that this requires DEVONthink 3.9 or greater.   � ��� �           i n t o   v i e w .   N o t e   t h a t   t h i s   r e q u i r e s   D E V O N t h i n k   3 . 9   o r   g r e a t e r .� ��� l     �r�q�p�r  �q  �p  � ��� l     �o���o  �  y -- For each Markdown record, the script will try to assign a color label that matches your annotation's highlight color.   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   t r y   t o   a s s i g n   a   c o l o r   l a b e l   t h a t   m a t c h e s   y o u r   a n n o t a t i o n ' s   h i g h l i g h t   c o l o r .� ��� l     �n���n  � x r     Note that, to suit your personal DEVONthink label setup, you'll need to adjust the mapping via the properties   � ��� �           N o t e   t h a t ,   t o   s u i t   y o u r   p e r s o n a l   D E V O N t h i n k   l a b e l   s e t u p ,   y o u ' l l   n e e d   t o   a d j u s t   t h e   m a p p i n g   v i a   t h e   p r o p e r t i e s� ��� l     �m���m  � ' !     `label1` ... `label7` below.   � ��� B           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w .� ��� l     �l�k�j�l  �k  �j  � ��� l     �i���i  � w q -- For each Markdown record, the script will also add an ID-like alias (like "039H-8GAB-1GPA") that's unique and   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   a l s o   a d d   a n   I D - l i k e   a l i a s   ( l i k e   " 0 3 9 H - 8 G A B - 1 G P A " )   t h a t ' s   u n i q u e   a n d� ��� l     �h���h  � y s     which optionally can be used to create a stable Wiki-link (like "[[039H-8GAB-1GPA]]") to this Markdown record.   � ��� �           w h i c h   o p t i o n a l l y   c a n   b e   u s e d   t o   c r e a t e   a   s t a b l e   W i k i - l i n k   ( l i k e   " [ [ 0 3 9 H - 8 G A B - 1 G P A ] ] " )   t o   t h i s   M a r k d o w n   r e c o r d .� ��� l     �g�f�e�g  �f  �e  � ��� l     �d���d  � v p -- If the PDF metadata contain a DOI, this DOI will get written to the `doi` custom metadata field for your PDF   � ��� �   - -   I f   t h e   P D F   m e t a d a t a   c o n t a i n   a   D O I ,   t h i s   D O I   w i l l   g e t   w r i t t e n   t o   t h e   ` d o i `   c u s t o m   m e t a d a t a   f i e l d   f o r   y o u r   P D F� ��� l     �c���c  � _ Y     record, the "... � Annotations" group, and for each of the created Markdown records.   � ��� �           r e c o r d ,   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .� ��� l     �b�a�`�b  �a  �`  � ��� l     �_���_  �  y -- Similarly, if the PDF record's custom metadata contain a citekey, this citekey will also get written to the `citekey`   � ��� �   - -   S i m i l a r l y ,   i f   t h e   P D F   r e c o r d ' s   c u s t o m   m e t a d a t a   c o n t a i n   a   c i t e k e y ,   t h i s   c i t e k e y   w i l l   a l s o   g e t   w r i t t e n   t o   t h e   ` c i t e k e y `� ��� l     �^���^  � q k     custom metadata field for the "... � Annotations" group, and for each of the created Markdown records.   � ��� �           c u s t o m   m e t a d a t a   f i e l d   f o r   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .� ��� l     �]�\�[�]  �\  �[  � ��� l     �Z���Z  � } w -- If a DOI was found for the PDF, the script will also attempt to fetch its bibliographic metadata and set the custom   � ��� �   - -   I f   a   D O I   w a s   f o u n d   f o r   t h e   P D F ,   t h e   s c r i p t   w i l l   a l s o   a t t e m p t   t o   f e t c h   i t s   b i b l i o g r a p h i c   m e t a d a t a   a n d   s e t   t h e   c u s t o m� ��� l     �Y���Y  � y s     metadata and/or the Finder comment of the "... � Annotations" group & its Markdown records accordingly. Please   � ��� �           m e t a d a t a   a n d / o r   t h e   F i n d e r   c o m m e n t   o f   t h e   " . . .      A n n o t a t i o n s "   g r o u p   &   i t s   M a r k d o w n   r e c o r d s   a c c o r d i n g l y .   P l e a s e� ��� l     �X���X  � W Q     see the properties below for options to disable or fine-tune this behaviour.   � ��� �           s e e   t h e   p r o p e r t i e s   b e l o w   f o r   o p t i o n s   t o   d i s a b l e   o r   f i n e - t u n e   t h i s   b e h a v i o u r .� ��� l     �W�V�U�W  �V  �U  � ��� l     �T�S�R�T  �S  �R  � ��� l     �Q���Q  �   Ideas for improvement:   � ��� .   I d e a s   f o r   i m p r o v e m e n t :� ��� l     �P�O�N�P  �O  �N  � ��� l     �M���M  � V P allow name & content of created Markdown records to be generated via a template   � ��� �   a l l o w   n a m e   &   c o n t e n t   o f   c r e a t e d   M a r k d o w n   r e c o r d s   t o   b e   g e n e r a t e d   v i a   a   t e m p l a t e� ��� l     �L���L  � � � allow the script to be called by a smart rule (displaying feedback on completion in a notification and w/o selecting any updated records)   � ���   a l l o w   t h e   s c r i p t   t o   b e   c a l l e d   b y   a   s m a r t   r u l e   ( d i s p l a y i n g   f e e d b a c k   o n   c o m p l e t i o n   i n   a   n o t i f i c a t i o n   a n d   w / o   s e l e c t i n g   a n y   u p d a t e d   r e c o r d s )� ��� l     �K���K  � q k offer a configuration option to specify which metadata shall get exported into which custom metadata field   � ��� �   o f f e r   a   c o n f i g u r a t i o n   o p t i o n   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l d� ��� l     �J���J  � f ` if just some DEVONthink groups were selected, allow to get all contained PDFs and process these   � ��� �   i f   j u s t   s o m e   D E V O N t h i n k   g r o u p s   w e r e   s e l e c t e d ,   a l l o w   t o   g e t   a l l   c o n t a i n e d   P D F s   a n d   p r o c e s s   t h e s e� ��� l     �I���I  � � � allow to optionally look-up the PDF file in a reference manager like Bookends and auto-fetch citekey & citation info from there   � ���    a l l o w   t o   o p t i o n a l l y   l o o k - u p   t h e   P D F   f i l e   i n   a   r e f e r e n c e   m a n a g e r   l i k e   B o o k e n d s   a n d   a u t o - f e t c h   c i t e k e y   &   c i t a t i o n   i n f o   f r o m   t h e r e� ��� l     �H���H  � k e improve the sort order of DEVONthink note records created for PDF annotations from the same PDF page   � ��� �   i m p r o v e   t h e   s o r t   o r d e r   o f   D E V O N t h i n k   n o t e   r e c o r d s   c r e a t e d   f o r   P D F   a n n o t a t i o n s   f r o m   t h e   s a m e   P D F   p a g e� ��� l     �G���G  � x r allow to (optionally) remove tags from Markdown records for PDF annotations whose corresponding tags were removed   � ��� �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   t a g s   f r o m   M a r k d o w n   r e c o r d s   f o r   P D F   a n n o t a t i o n s   w h o s e   c o r r e s p o n d i n g   t a g s   w e r e   r e m o v e d� ��� l     �F� �F  � w q allow to (optionally) remove Markdown records from DEVONthink for PDF annotations that were deleted from the PDF     � �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   M a r k d o w n   r e c o r d s   f r o m   D E V O N t h i n k   f o r   P D F   a n n o t a t i o n s   t h a t   w e r e   d e l e t e d   f r o m   t h e   P D F�  l     �E�E   i c support any annotation types other than "Highlight", "StrikeOut", "Underline", "Squiggly" & "Text"    � �   s u p p o r t   a n y   a n n o t a t i o n   t y p e s   o t h e r   t h a n   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y "   &   " T e x t "  l     �D	
�D  	 0 * (see also inline TODOs in the code below)   
 � T   ( s e e   a l s o   i n l i n e   T O D O s   i n   t h e   c o d e   b e l o w )  l     �C�B�A�C  �B  �A    l     �@�?�>�@  �?  �>    l     �=�=   W Q ------------- optionally adopt the property values below this line -------------    � �   - - - - - - - - - - - - -   o p t i o n a l l y   a d o p t   t h e   p r o p e r t y   v a l u e s   b e l o w   t h i s   l i n e   - - - - - - - - - - - - -  l     �<�;�:�<  �;  �:    l     �9�8�7�9  �8  �7    l     �6�6   c ] Prefix prepended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.    � �   P r e f i x   p r e p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .  j     �5 �5 ,0 notefoldernameprefix noteFolderNamePrefix  m     !! �""   #$# l     �4�3�2�4  �3  �2  $ %&% l     �1'(�1  ' b \ Suffix appended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.   ( �)) �   S u f f i x   a p p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .& *+* j    �0,�0 ,0 notefoldernamesuffix noteFolderNameSuffix, m    -- �..       A n n o t a t i o n s+ /0/ l     �/�.�-�/  �.  �-  0 121 l     �,34�,  3 ` Z Maps DEVONthink label indexes to color names. Please set the `colorName` values according   4 �55 �   M a p s   D E V O N t h i n k   l a b e l   i n d e x e s   t o   c o l o r   n a m e s .   P l e a s e   s e t   t h e   ` c o l o r N a m e `   v a l u e s   a c c o r d i n g2 676 l     �+89�+  8 d ^  to the label <-> color mapping that you've chosen in your DEVONthink Settings under "Color".   9 �:: �     t o   t h e   l a b e l   < - >   c o l o r   m a p p i n g   t h a t   y o u ' v e   c h o s e n   i n   y o u r   D E V O N t h i n k   S e t t i n g s   u n d e r   " C o l o r " .7 ;<; l     �*=>�*  = ] W E.g., if your "Color" settings specify a yellowish color for the first label, then use   > �?? �   E . g . ,   i f   y o u r   " C o l o r "   s e t t i n g s   s p e c i f y   a   y e l l o w i s h   c o l o r   f o r   t h e   f i r s t   l a b e l ,   t h e n   u s e< @A@ l     �)BC�)  B ` Z `{labelIndex:1, colorName:"yellow"}`. Note that each label must have a unique color name.   C �DD �   ` { l a b e l I n d e x : 1 ,   c o l o r N a m e : " y e l l o w " } ` .   N o t e   t h a t   e a c h   l a b e l   m u s t   h a v e   a   u n i q u e   c o l o r   n a m e .A EFE l     �(GH�(  G c ] Available color names: red, orange, yellow, green, cyan, light blue, dark blue, purple, pink   H �II �   A v a i l a b l e   c o l o r   n a m e s :   r e d ,   o r a n g e ,   y e l l o w ,   g r e e n ,   c y a n ,   l i g h t   b l u e ,   d a r k   b l u e ,   p u r p l e ,   p i n kF JKJ j    �'L�' 
0 label1  L K    MM �&NO�& 0 
labelindex 
labelIndexN m    �%�% O �$P�#�$ 0 	colorname 	colorNameP m   	 
QQ �RR  r e d�#  K STS j    �"U�" 
0 label2  U K    VV �!WX�! 0 
labelindex 
labelIndexW m    � �  X �Y�� 0 	colorname 	colorNameY m    ZZ �[[ 
 g r e e n�  T \]\ j    �^� 
0 label3  ^ K    __ �`a� 0 
labelindex 
labelIndex` m    �� a �b�� 0 	colorname 	colorNameb m    cc �dd  l i g h t   b l u e�  ] efe j    %�g� 
0 label4  g K    $hh �ij� 0 
labelindex 
labelIndexi m     �� j �k�� 0 	colorname 	colorNamek m   ! "ll �mm  y e l l o w�  f non j   & /�p� 
0 label5  p K   & .qq �rs� 0 
labelindex 
labelIndexr m   ' (�� s �t�� 0 	colorname 	colorNamet m   ) ,uu �vv  o r a n g e�  o wxw j   0 ;�y� 
0 label6  y K   0 :zz �{|� 0 
labelindex 
labelIndex{ m   1 4�� | �}�
� 0 	colorname 	colorName} m   5 8~~ �  d a r k   b l u e�
  x ��� j   < G�	��	 
0 label7  � K   < F�� ���� 0 
labelindex 
labelIndex� m   = @�� � ���� 0 	colorname 	colorName� m   A D�� ���  p u r p l e�  � ��� l     ����  �  �  � ��� l     ����  � h b Set to `true` if you want this script to update Markdown records that already exist in DEVONthink   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   u p d a t e   M a r k d o w n   r e c o r d s   t h a t   a l r e a d y   e x i s t   i n   D E V O N t h i n k� ��� l     � ���   � j d for PDF annotations from your PDF file(s) and which were created on previous script runs. This will   � ��� �   f o r   P D F   a n n o t a t i o n s   f r o m   y o u r   P D F   f i l e ( s )   a n d   w h i c h   w e r e   c r e a t e d   o n   p r e v i o u s   s c r i p t   r u n s .   T h i s   w i l l� ��� l     ������  � i c be only necessary if you've made changes to the PDF annotations (or their associated notes) within   � ��� �   b e   o n l y   n e c e s s a r y   i f   y o u ' v e   m a d e   c h a n g e s   t o   t h e   P D F   a n n o t a t i o n s   ( o r   t h e i r   a s s o c i a t e d   n o t e s )   w i t h i n� ��� l     ������  � 9 3 the PDF file after importing them into DEVONthink.   � ��� f   t h e   P D F   f i l e   a f t e r   i m p o r t i n g   t h e m   i n t o   D E V O N t h i n k .� ��� l     ������  �   Notes:   � ���    N o t e s :� ��� l     ������  � e _ - @warning Note that updating of existing notes may override any additions/changes that you've   � ��� �   -   @ w a r n i n g   N o t e   t h a t   u p d a t i n g   o f   e x i s t i n g   n o t e s   m a y   o v e r r i d e   a n y   a d d i t i o n s / c h a n g e s   t h a t   y o u ' v e� ��� l     ������  � 7 1    made to these Markdown records in DEVONthink.   � ��� b         m a d e   t o   t h e s e   M a r k d o w n   r e c o r d s   i n   D E V O N t h i n k .� ��� l     ������  � j d - See below properties to specify which attributes shall get updated and which shall be left alone.   � ��� �   -   S e e   b e l o w   p r o p e r t i e s   t o   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e .� ��� j   H J����� *0 updateexistingnotes updateExistingNotes� m   H I��
�� boovfals� ��� l     ��������  ��  ��  � ��� l     ������  � c ] When updating existing Markdown records, specify which attributes shall get updated (`true`)   � ��� �   W h e n   u p d a t i n g   e x i s t i n g   M a r k d o w n   r e c o r d s ,   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   ( ` t r u e ` )� ��� l     ������  � / ) and which shall be left alone (`false`).   � ��� R   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e   ( ` f a l s e ` ) .� ��� l     ������  �   Notes:   � ���    N o t e s :� ��� l     ������  � m g - Tags will only be added to any existing list of record tags, so these won't get replaced as a whole.   � ��� �   -   T a g s   w i l l   o n l y   b e   a d d e d   t o   a n y   e x i s t i n g   l i s t   o f   r e c o r d   t a g s ,   s o   t h e s e   w o n ' t   g e t   r e p l a c e d   a s   a   w h o l e .� ��� l     ������  � M G    Also, tags won't get removed from the existing list of record tags.   � ��� �         A l s o ,   t a g s   w o n ' t   g e t   r e m o v e d   f r o m   t h e   e x i s t i n g   l i s t   o f   r e c o r d   t a g s .� ��� l     ������  � d ^ - Custom metadata fields will also get added to any existing record metadata, and only fields   � ��� �   -   C u s t o m   m e t a d a t a   f i e l d s   w i l l   a l s o   g e t   a d d e d   t o   a n y   e x i s t i n g   r e c o r d   m e t a d a t a ,   a n d   o n l y   f i e l d s� ��� l     ������  � , &    of the same name may get replaced.   � ��� L         o f   t h e   s a m e   n a m e   m a y   g e t   r e p l a c e d .� ��� j   K M����� 80 updatenameforexistingnotes updateNameForExistingNotes� m   K L��
�� boovfals� ��� j   N P����� F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes� m   N O��
�� boovtrue� ��� j   Q S����� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes� m   Q R��
�� boovtrue� ��� j   T V����� J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes� m   T U��
�� boovtrue� ��� j   W Y����� <0 updateratingforexistingnotes updateRatingForExistingNotes� m   W X��
�� boovtrue� ��� j   Z \����� :0 updatelabelforexistingnotes updateLabelForExistingNotes� m   Z [��
�� boovtrue� ��� j   ] a����� 80 updatetagsforexistingnotes updateTagsForExistingNotes� m   ] ^��
�� boovtrue� ��� j   b f����� L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes� m   b c��
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � f ` Specify if custom metadata of the DEVONthink groups that host a PDF file's Markdown notes shall   � ��� �   S p e c i f y   i f   c u s t o m   m e t a d a t a   o f   t h e   D E V O N t h i n k   g r o u p s   t h a t   h o s t   a   P D F   f i l e ' s   M a r k d o w n   n o t e s   s h a l l� ��� l     ������  � l f get updated (`true`) or not (`false`). If set to `true`, this script may populate the custom metadata   � ��� �   g e t   u p d a t e d   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   s e t   t o   ` t r u e ` ,   t h i s   s c r i p t   m a y   p o p u l a t e   t h e   c u s t o m   m e t a d a t a� � � l     ����   j d properties `sourcefile`, `citekey` & `doi`, as well as any bibliographic metadata that were fetched    � �   p r o p e r t i e s   ` s o u r c e f i l e ` ,   ` c i t e k e y `   &   ` d o i ` ,   a s   w e l l   a s   a n y   b i b l i o g r a p h i c   m e t a d a t a   t h a t   w e r e   f e t c h e d   l     ����     for a DOI (see below).    � .   f o r   a   D O I   ( s e e   b e l o w ) . 	
	 j   g k���� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders m   g h��
�� boovtrue
  l     ��������  ��  ��    l     ����   i c Set to `true` if you want this script to select all records that were actually created or updated.    � �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   s e l e c t   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   c r e a t e d   o r   u p d a t e d .  j   l p���� ,0 selectupdatedrecords selectUpdatedRecords m   l m��
�� boovtrue  l     ��������  ��  ��    l     ����   j d Set to `true` if you want this script to fetch bibliographic metadata for a PDF's DOI via an online    � �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I   v i a   a n   o n l i n e  l     �� ��   V P request to OpenAlex.org (and possibly further requests to CrossRef, see below).     �!! �   r e q u e s t   t o   O p e n A l e x . o r g   ( a n d   p o s s i b l y   f u r t h e r   r e q u e s t s   t o   C r o s s R e f ,   s e e   b e l o w ) . "#" l     ��$%��  $ o i Note that setting this to `false` will disable all online requests, i.e. this will also prevent fetching   % �&& �   N o t e   t h a t   s e t t i n g   t h i s   t o   ` f a l s e `   w i l l   d i s a b l e   a l l   o n l i n e   r e q u e s t s ,   i . e .   t h i s   w i l l   a l s o   p r e v e n t   f e t c h i n g# '(' l     ��)*��  ) l f of BibTeX data & formatted citations even if the respective properties have been set to `true` below.   * �++ �   o f   B i b T e X   d a t a   &   f o r m a t t e d   c i t a t i o n s   e v e n   i f   t h e   r e s p e c t i v e   p r o p e r t i e s   h a v e   b e e n   s e t   t o   ` t r u e `   b e l o w .( ,-, j   q u��.�� $0 fetchdoimetadata fetchDOIMetadata. m   q r��
�� boovtrue- /0/ l     ��������  ��  ��  0 121 l     ��34��  3 j d Set to `true` if you want this script to _always_ fetch bibliographic metadata for a PDF's DOI, and   4 �55 �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   _ a l w a y s _   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   a n d2 676 l     ��89��  8 h b not only once for each PDF (when creating the DEVONthink group that hosts the PDF file's Markdown   9 �:: �   n o t   o n l y   o n c e   f o r   e a c h   P D F   ( w h e n   c r e a t i n g   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n7 ;<; l     ��=>��  = o i notes). Usually, you'd want the latter (i.e. `false`). But setting this property (temporarily) to `true`   > �?? �   n o t e s ) .   U s u a l l y ,   y o u ' d   w a n t   t h e   l a t t e r   ( i . e .   ` f a l s e ` ) .   B u t   s e t t i n g   t h i s   p r o p e r t y   ( t e m p o r a r i l y )   t o   ` t r u e `< @A@ l     ��BC��  B i c can be useful to add or update bibliographic metadata for existing notes folders & Markdown notes.   C �DD �   c a n   b e   u s e f u l   t o   a d d   o r   u p d a t e   b i b l i o g r a p h i c   m e t a d a t a   f o r   e x i s t i n g   n o t e s   f o l d e r s   &   M a r k d o w n   n o t e s .A EFE j   v z��G�� 00 alwaysfetchdoimetadata alwaysFetchDOIMetadataG m   v w��
�� boovfalsF HIH l     ��������  ��  ��  I JKJ l     ��LM��  L e _ When fetching bibliographic metadata for a PDF's DOI, this script can also fetch corresponding   M �NN �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   c o r r e s p o n d i n gK OPO l     ��QR��  Q ` Z BibTeX data (which will be copied to a custom ("bibtex") metadata field, and which can be   R �SS �   B i b T e X   d a t a   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " b i b t e x " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n   b eP TUT l     ��VW��  V X R appended to the Finder comment of a created Markdown record as well (see below)).   W �XX �   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .U YZY l     ��[\��  [ h b Set to `true` if you also want to fetch BibTeX data for the given DOI from CrossRef.org, else set   \ �]] �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   B i b T e X   d a t a   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,   e l s e   s e tZ ^_^ l     ��`a��  ` c ] to `false`. Note that this will cause an extra online request which may take a second or so.   a �bb �   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   s e c o n d   o r   s o ._ cdc j   { ��e�� 0 fetchbibtex fetchBibTeXe m   { |��
�� boovfalsd fgf l     ��������  ��  ��  g hih l     ��jk��  j i c Set to `true` if you want this script to append the BibTeX data (that was fetched for a PDF's DOI)   k �ll �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   B i b T e X   d a t a   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s   D O I )i mnm l     ��op��  o < 6 to the Finder comment of the created Markdown record.   p �qq l   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .n rsr j   � ���t�� :0 appendbibtextofindercomment appendBibTeXToFinderCommentt m   � ���
�� boovfalss uvu l     ��������  ��  ��  v wxw l     ��yz��  y g a When fetching bibliographic metadata for a PDF's DOI, this script can also fetch a corresponding   z �{{ �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   a   c o r r e s p o n d i n gx |}| l     ��~��  ~ g a formatted citation (which will be copied to a custom ("reference") metadata field, and which can    ��� �   f o r m a t t e d   c i t a t i o n   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " r e f e r e n c e " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n} ��� l     ������  � [ U be appended to the Finder comment of a created Markdown record as well (see below)).   � ��� �   b e   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .� ��� l     ������  � h b Set to `true` if you also want to fetch a formatted citation for the given DOI from CrossRef.org,   � ��� �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   a   f o r m a t t e d   c i t a t i o n   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,� ��� l     ������  � k e else set to `false`. Note that this will cause an extra online request which may take a few seconds.   � ��� �   e l s e   s e t   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   f e w   s e c o n d s .� ��� j   � ������ 00 fetchformattedcitation fetchFormattedCitation� m   � ���
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � k e Set to `true` if you want this script to append the formatted citation (that was fetched for a PDF's   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   f o r m a t t e d   c i t a t i o n   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s� ��� l     ������  � A ; DOI) to the Finder comment of the created Markdown record.   � ��� v   D O I )   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .� ��� j   � ������ P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment� m   � ���
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � f ` The name of the citation style file (as obtained from https://www.zotero.org/styles) to be used   � ��� �   T h e   n a m e   o f   t h e   c i t a t i o n   s t y l e   f i l e   ( a s   o b t a i n e d   f r o m   h t t p s : / / w w w . z o t e r o . o r g / s t y l e s )   t o   b e   u s e d� ��� l     ������  � 2 , when generating a formatted citation, e.g.:   � ��� X   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :� ��� l     ������  � i c apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,   � ��� �   a p a   ( d e f a u l t ) ,   a p a - 6 t h - e d i t i o n ,   c h i c a g o - a u t h o r - d a t e ,   e l s e v i e r - h a r v a r d ,   s p r i n g e r - b a s i c - a u t h o r - d a t e ,� ��� l     ������  � 9 3 modern-language-association, vancouver-author-date   � ��� f   m o d e r n - l a n g u a g e - a s s o c i a t i o n ,   v a n c o u v e r - a u t h o r - d a t e� ��� j   � ������ &0 citationstylename citationStyleName� m   � ��� ���  a p a� ��� l     ��������  ��  ��  � ��� l     ������  � i c The locale code that specifies which localization data (term translations, localized date formats,   � ��� �   T h e   l o c a l e   c o d e   t h a t   s p e c i f i e s   w h i c h   l o c a l i z a t i o n   d a t a   ( t e r m   t r a n s l a t i o n s ,   l o c a l i z e d   d a t e   f o r m a t s ,� ��� l     ������  � U O and grammar options) shall be used when generating a formatted citation, e.g.:   � ��� �   a n d   g r a m m a r   o p t i o n s )   s h a l l   b e   u s e d   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :� ��� l     ������  � @ : en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN   � ��� t   e n - U S   ( d e f a u l t ) ,   e n - G B ,   f r - F R ,   e s - E S ,   d e - D E ,   r u - R U ,   z h - C N� ��� j   � ������  0 citationlocale citationLocale� m   � ��� ��� 
 e n - U S� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � W Q ----------- usually, you don't need to edit anything below this line -----------   � ��� �   - - - - - - - - - - -   u s u a l l y ,   y o u   d o n ' t   n e e d   t o   e d i t   a n y t h i n g   b e l o w   t h i s   l i n e   - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     �������  ��  �  � ��� l     �~���~  � Z T Decimal numbers that specify how much the bounding box encompassing an annotation's   � ��� �   D e c i m a l   n u m b e r s   t h a t   s p e c i f y   h o w   m u c h   t h e   b o u n d i n g   b o x   e n c o m p a s s i n g   a n   a n n o t a t i o n ' s� ��� l     �}���}  � c ] individual line shall be enlarged vertically & horizontally so that it fully covers all text   � ��� �   i n d i v i d u a l   l i n e   s h a l l   b e   e n l a r g e d   v e r t i c a l l y   &   h o r i z o n t a l l y   s o   t h a t   i t   f u l l y   c o v e r s   a l l   t e x t� ��� l     �|���|  �    highlighted on that line.   � ��� 4   h i g h l i g h t e d   o n   t h a t   l i n e .� ��� l     �{���{  � e _ If you find that this script somehow fails to fully extract all of an annotation's text (or if   � ��� �   I f   y o u   f i n d   t h a t   t h i s   s c r i p t   s o m e h o w   f a i l s   t o   f u l l y   e x t r a c t   a l l   o f   a n   a n n o t a t i o n ' s   t e x t   ( o r   i f� ��� l     �z���z  � [ U it extracts too much) then you may want to adjust these decimal numbers (e.g. by 0.1   � ��� �   i t   e x t r a c t s   t o o   m u c h )   t h e n   y o u   m a y   w a n t   t o   a d j u s t   t h e s e   d e c i m a l   n u m b e r s   ( e . g .   b y   0 . 1� ��� l     �y���y  �   increments).   � ���    i n c r e m e n t s ) .� ��� l     �x �x    a [ However, note that larger values will increase the likeliness that adjacent characters not    � �   H o w e v e r ,   n o t e   t h a t   l a r g e r   v a l u e s   w i l l   i n c r e a s e   t h e   l i k e l i n e s s   t h a t   a d j a c e n t   c h a r a c t e r s   n o t�  l     �w�w   = 7 belonging to the annotation will get included as well.    � n   b e l o n g i n g   t o   t h e   a n n o t a t i o n   w i l l   g e t   i n c l u d e d   a s   w e l l . 	 j   � ��v
�v ,0 linewidthenlargement lineWidthEnlargement
 m   � � ?�ffffff	  j   � ��u�u .0 lineheightenlargement lineHeightEnlargement m   � � ?�333333  l     �t�s�r�t  �s  �r    l     �q�q   c ] Defines lower and upper hue limits for common colors. Limit values are inclusive and must be    � �   D e f i n e s   l o w e r   a n d   u p p e r   h u e   l i m i t s   f o r   c o m m o n   c o l o r s .   L i m i t   v a l u e s   a r e   i n c l u s i v e   a n d   m u s t   b e  l     �p�p   a [ given as degrees (0-359) of the hue in the HSB (hue, saturation, brightness) color scheme.    � �   g i v e n   a s   d e g r e e s   ( 0 - 3 5 9 )   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .  j   � ��o�o "0 redcolormapping redColorMapping K   � � �n !�n 0 	colorname 	colorName  m   � �"" �##  r e d! �m$%�m 0 lowerhuelimit lowerHueLimit$ m   � ��l�l^% �k&�j�k 0 upperhuelimit upperHueLimit& m   � ��i�i �j   '(' j   � ��h)�h (0 orangecolormapping orangeColorMapping) K   � �** �g+,�g 0 	colorname 	colorName+ m   � �-- �..  o r a n g e, �f/0�f 0 lowerhuelimit lowerHueLimit/ m   � ��e�e 0 �d1�c�d 0 upperhuelimit upperHueLimit1 m   � ��b�b ,�c  ( 232 j   � ��a4�a (0 yellowcolormapping yellowColorMapping4 K   � �55 �`67�` 0 	colorname 	colorName6 m   � �88 �99  y e l l o w7 �_:;�_ 0 lowerhuelimit lowerHueLimit: m   � ��^�^ -; �]<�\�] 0 upperhuelimit upperHueLimit< m   � ��[�[ A�\  3 =>= j   �
�Z?�Z &0 greencolormapping greenColorMapping? K   �@@ �YAB�Y 0 	colorname 	colorNameA m   � �CC �DD 
 g r e e nB �XEF�X 0 lowerhuelimit lowerHueLimitE m   � ��W�W BF �VG�U�V 0 upperhuelimit upperHueLimitG m   �T�T ��U  > HIH j  "�SJ�S $0 cyancolormapping cyanColorMappingJ K  KK �RLM�R 0 	colorname 	colorNameL m  NN �OO  c y a nM �QPQ�Q 0 lowerhuelimit lowerHueLimitP m  �P�P �Q �OR�N�O 0 upperhuelimit upperHueLimitR m  �M�M ��N  I STS j  #:�LU�L .0 lightbluecolormapping lightBlueColorMappingU K  #7VV �KWX�K 0 	colorname 	colorNameW m  $'YY �ZZ  l i g h t   b l u eX �J[\�J 0 lowerhuelimit lowerHueLimit[ m  *-�I�I �\ �H]�G�H 0 upperhuelimit upperHueLimit] m  03�F�F ��G  T ^_^ j  ;R�E`�E ,0 darkbluecolormapping darkBlueColorMapping` K  ;Oaa �Dbc�D 0 	colorname 	colorNameb m  <?dd �ee  d a r k   b l u ec �Cfg�C 0 lowerhuelimit lowerHueLimitf m  BE�B�B �g �Ah�@�A 0 upperhuelimit upperHueLimith m  HK�?�? ��@  _ iji j  Sj�>k�> (0 purplecolormapping purpleColorMappingk K  Sgll �=mn�= 0 	colorname 	colorNamem m  TWoo �pp  p u r p l en �<qr�< 0 lowerhuelimit lowerHueLimitq m  Z]�;�; �r �:s�9�: 0 upperhuelimit upperHueLimits m  `c�8�8D�9  j tut j  k��7v�7 $0 pinkcolormapping pinkColorMappingv K  kww �6xy�6 0 	colorname 	colorNamex m  lozz �{{  p i n ky �5|}�5 0 lowerhuelimit lowerHueLimit| m  ru�4�4E} �3~�2�3 0 upperhuelimit upperHueLimit~ m  x{�1�1]�2  u � l     �0�/�.�0  �/  �.  � ��� j  ���-��- 0 colormappings colorMappings� J  ���� ��� o  ���,�, "0 redcolormapping redColorMapping� ��� o  ���+�+ (0 orangecolormapping orangeColorMapping� ��� o  ���*�* (0 yellowcolormapping yellowColorMapping� ��� o  ���)�) &0 greencolormapping greenColorMapping� ��� o  ���(�( $0 cyancolormapping cyanColorMapping� ��� o  ���'�' .0 lightbluecolormapping lightBlueColorMapping� ��� o  ���&�& ,0 darkbluecolormapping darkBlueColorMapping� ��� o  ���%�% (0 purplecolormapping purpleColorMapping� ��$� o  ���#�# $0 pinkcolormapping pinkColorMapping�$  � ��� l     �"�!� �"  �!  �   � ��� j  ����� 0 labelmappings labelMappings� J  ���� ��� o  ���� 
0 label1  � ��� o  ���� 
0 label2  � ��� o  ���� 
0 label3  � ��� o  ���� 
0 label4  � ��� o  ���� 
0 label5  � ��� o  ���� 
0 label6  � ��� o  ���� 
0 label7  �  � ��� l     ����  �  �  � ��� j  ����� &0 creatednotescount createdNotesCount� m  ����  � ��� j  ����� &0 updatednotescount updatedNotesCount� m  ����  � ��� l     ����  �  �  � ��� l     ����  � d ^ The "KeypointsScriptingLib.scptd" scripting library provides utility methods for this script.   � ��� �   T h e   " K e y p o i n t s S c r i p t i n g L i b . s c p t d "   s c r i p t i n g   l i b r a r y   p r o v i d e s   u t i l i t y   m e t h o d s   f o r   t h i s   s c r i p t .� ��� l     ����  � d ^ It can be made available to this script by copying it into a "Script Libraries" folder inside   � ��� �   I t   c a n   b e   m a d e   a v a i l a b l e   t o   t h i s   s c r i p t   b y   c o p y i n g   i t   i n t o   a   " S c r i p t   L i b r a r i e s "   f o l d e r   i n s i d e� ��� l     �
���
  � ; 5 the "Library" folder that's within your Home folder.   � ��� j   t h e   " L i b r a r y "   f o l d e r   t h a t ' s   w i t h i n   y o u r   H o m e   f o l d e r .� ��� l     �	���	  � i c see https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / e x t r a c t s / m a c - s c r i p t i n g / t r e e / m a s t e r / S c r i p t i n g L i b r a r i e s / K e y p o i n t s S c r i p t i n g L i b� ��� l     ���� x  ������ 0 keypointslib KeypointsLib� 4  ����
� 
scpt� m  ���� ��� * K e y p o i n t s S c r i p t i n g L i b�  �   v1.4 or greater required   � ��� 2   v 1 . 4   o r   g r e a t e r   r e q u i r e d� ��� l     ����  �  �  � ��� x  ������  � 4  ��� �
�  
frmk� m  ���� ��� V / S y s t e m / L i b r a r y / F r a m e w o r k s / A p p K i t . f r a m e w o r k�  � ��� x  ��������  � 4  ����
�� 
frmk� m   �� ��� V / S y s t e m / L i b r a r y / F r a m e w o r k s / Q u a r t z . f r a m e w o r k��  � ��� x  !�������  � 2 ��
�� 
osax��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   Main handler.   � ���    M a i n   h a n d l e r .� ��� i  !$��� I     ������
�� .aevtoappnull  �   � ****��  ��  � k    !�� ��� l     ������  � 9 3 DEVONthink must be running for this script to work   � ��� f   D E V O N t h i n k   m u s t   b e   r u n n i n g   f o r   t h i s   s c r i p t   t o   w o r k� ��� Z    ������� H     �� n    ��� I    �������� $0 checkappsrunning checkAppsRunning��  ��  �  f     � L   	 ����  ��  ��  � ��� l   ��������  ��  ��  � ��� n      I    ������ 0 setupprogress setupProgress �� m     � p C r e a t i n g   M a r k d o w n   n o t e s   f o r   a n n o t a t i o n s   i n   s e l e c t e d   P D F s��  ��   o    ���� 0 keypointslib KeypointsLib�  l   ��������  ��  ��   	 l   ��
��  
 J D only deal with currently selected PDFs that contain PDF annotations    � �   o n l y   d e a l   w i t h   c u r r e n t l y   s e l e c t e d   P D F s   t h a t   c o n t a i n   P D F   a n n o t a t i o n s	  r    " n     I     �������� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations��  ��    f     o      ���� 0 
pdfrecords 
pdfRecords  l  # #��������  ��  ��    r   # * m   # $����   o      ���� &0 creatednotescount createdNotesCount  r   + 2 m   + ,����   o      ���� &0 updatednotescount updatedNotesCount  r   3 :  I  3 8��!��
�� .corecnte****       ****! o   3 4���� 0 
pdfrecords 
pdfRecords��    o      ���� 0 pdfcount pdfCount "#" n  ; E$%$ I   @ E��&���� 40 settotalstepsforprogress setTotalStepsForProgress& '��' o   @ A���� 0 pdfcount pdfCount��  ��  % o   ; @���� 0 keypointslib KeypointsLib# ()( l  F F��������  ��  ��  ) *+* l  F F��,-��  , + % process PDF annotations for each PDF   - �.. J   p r o c e s s   P D F   a n n o t a t i o n s   f o r   e a c h   P D F+ /0/ Y   F �1��23��1 k   P �44 565 r   P V787 n   P T9:9 4   Q T��;
�� 
cobj; o   R S���� 0 i  : o   P Q���� 0 
pdfrecords 
pdfRecords8 o      ���� 0 	pdfrecord 	pdfRecord6 <=< O  W e>?> r   _ d@A@ n   _ bBCB 1   ` b��
�� 
DTfnC o   _ `���� 0 	pdfrecord 	pdfRecordA o      ���� 0 pdffilename pdfFilename? 5   W \��D��
�� 
cappD m   Y ZEE �FF  D N t p
�� kfrmID  = GHG n  f �IJI I   k ���K����  0 updateprogress updateProgressK LML o   k l���� 0 i  M N��N b   l OPO b   l {QRQ b   l ySTS b   l uUVU b   l sWXW b   l oYZY m   l m[[ �\\  P r o c e s s i n g   P D F  Z o   m n���� 0 i  X m   o r]] �^^    o f  V o   s t���� 0 pdfcount pdfCountT m   u x__ �``    ( "R o   y z���� 0 pdffilename pdfFilenameP m   { ~aa �bb  " ) .��  ��  J o   f k���� 0 keypointslib KeypointsLibH c��c r   � �ded n  � �fgf I   � ���h���� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDFh i��i o   � ����� 0 	pdfrecord 	pdfRecord��  ��  g  f   � �e o      ����  0 updatedrecords updatedRecords��  �� 0 i  2 m   I J���� 3 o   J K���� 0 pdfcount pdfCount��  0 jkj l  � ���������  ��  ��  k lml l  � ���no��  n 2 , select records that were created or updated   o �pp X   s e l e c t   r e c o r d s   t h a t   w e r e   c r e a t e d   o r   u p d a t e dm qrq Z   � �st����s F   � �uvu =  � �wxw o   � ����� ,0 selectupdatedrecords selectUpdatedRecordsx m   � ���
�� boovtruev >  � �yzy o   � �����  0 updatedrecords updatedRecordsz J   � �����  t O   � �{|{ k   � �}} ~~ r   � ���� 4   � ����
�� 
brws� m   � ����� � o      ���� 0 frontwindow frontWindow ���� r   � ���� o   � �����  0 updatedrecords updatedRecords� n      ��� 1   � ���
�� 
DTsl� o   � ����� 0 frontwindow frontWindow��  | 5   � ������
�� 
capp� m   � ��� ���  D N t p
�� kfrmID  ��  ��  r ��� l  � ���������  ��  ��  � ��� l  � �������  � Z T display a dialog with feedback (number of PDFs processed and notes created/updated)   � ��� �   d i s p l a y   a   d i a l o g   w i t h   f e e d b a c k   ( n u m b e r   o f   P D F s   p r o c e s s e d   a n d   n o t e s   c r e a t e d / u p d a t e d )� ���� O   �!��� k   � �� ��� I  � �������
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
dflt� m  �� ���  O K��  ��  � 5   � ����~
� 
capp� m   � ��� ���  D N t p
�~ kfrmID  ��  � ��� l     �}�|�{�}  �|  �{  � ��� l     �z�y�x�z  �y  �x  � ��� l     �w���w  � + % Checks if DEVONthink Pro is running.   � ��� J   C h e c k s   i f   D E V O N t h i n k   P r o   i s   r u n n i n g .� ��� l     �v���v  � 6 0 Credits: modified after script code by Rob Trew   � ��� `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     �u���u  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i  %(��� I      �t�s�r�t $0 checkappsrunning checkAppsRunning�s  �r  � k     5�� ��� O     2��� l   1���� Z    1���q�p� A    ��� l   ��o�n� I   �m��l
�m .corecnte****       ****� l   ��k�j� 6  ��� 2   �i
�i 
prcs� =    ��� 1    �h
�h 
fcrt� m    �� ���  D N t p�k  �j  �l  �o  �n  � m    �g�g � k    -�� ��� n   *��� I   " *�f��e�f 0 displayerror displayError� ��� m   " #�� ��� 6 D E V O N t h i n k   P r o   n o t   r u n n i n g !� ��� m   # $�� ��� � P l e a s e   o p e n   D E V O N t h i n k   P r o   a n d   s e l e c t   s o m e   P D F ( s ) ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .� ��� m   $ %�d�d � ��c� m   % &�b
�b boovtrue�c  �e  � o    "�a�a 0 keypointslib KeypointsLib� ��`� L   + -   m   + ,�_
�_ boovfals�`  �q  �p  � "  application "System Events"   � � 8   a p p l i c a t i o n   " S y s t e m   E v e n t s "� 5     �^�]
�^ 
capp m     �  s e v s
�] kfrmID  � �\ L   3 5 m   3 4�[
�[ boovtrue�\  �  l     �Z�Y�X�Z  �Y  �X   	
	 l     �W�V�U�W  �V  �U  
  l     �T�T   X R Returns all PDF records from the records selected in DEVONthink that contain some    � �   R e t u r n s   a l l   P D F   r e c o r d s   f r o m   t h e   r e c o r d s   s e l e c t e d   i n   D E V O N t h i n k   t h a t   c o n t a i n   s o m e  l     �S�S   \ V PDF annotations. If there's currently no selection in DEVONthink (or if the selection    � �   P D F   a n n o t a t i o n s .   I f   t h e r e ' s   c u r r e n t l y   n o   s e l e c t i o n   i n   D E V O N t h i n k   ( o r   i f   t h e   s e l e c t i o n  l     �R�R   \ V contains no PDFs with PDF annotations) presents an error alert and aborts the script.    � �   c o n t a i n s   n o   P D F s   w i t h   P D F   a n n o t a t i o n s )   p r e s e n t s   a n   e r r o r   a l e r t   a n d   a b o r t s   t h e   s c r i p t .  i  ), I      �Q�P�O�Q T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�P  �O   k     a   r     !"! J     �N�N  " o      �M�M 0 annotatedpdfs annotatedPDFs  #$# l   �L�K�J�L  �K  �J  $ %&% O    ^'(' k    ])) *+* r    ,-, l   .�I�H. c    /0/ 1    �G
�G 
DTsl0 m    �F
�F 
list�I  �H  - o      �E�E 0 
therecords 
theRecords+ 121 X    D3�D43 Z   % ?56�C�B5 F   % 4787 l  % *9�A�@9 =  % *:;: n   % (<=< 1   & (�?
�? 
DTty= o   % &�>�> 0 	therecord 	theRecord; m   ( )�=
�= OCRdpdf �A  �@  8 l  - 2>�<�;> ?   - 2?@? n   - 0ABA 1   . 0�:
�: 
DTnaB o   - .�9�9 0 	therecord 	theRecord@ m   0 1�8�8  �<  �;  6 s   7 ;CDC o   7 8�7�7 0 	therecord 	theRecordD n      EFE  ;   9 :F o   8 9�6�6 0 annotatedpdfs annotatedPDFs�C  �B  �D 0 	therecord 	theRecord4 o    �5�5 0 
therecords 
theRecords2 GHG l  E E�4�3�2�4  �3  �2  H I�1I Z  E ]JK�0�/J =  E ILML o   E F�.�. 0 annotatedpdfs annotatedPDFsM J   F H�-�-  K n  L YNON I   Q Y�,P�+�, 0 displayerror displayErrorP QRQ m   Q RSS �TT P N o   P D F ( s )   w i t h   P D F   a n n o t a t i o n s   s e l e c t e d !R UVU m   R SWW �XX � P l e a s e   o p e n   D E V O N t h i n k   a n d   s e l e c t   s o m e   P D F ( s )   w i t h   P D F   a n n o t a t i o n s .V YZY m   S T�*�* Z [�)[ m   T U�(
�( boovtrue�)  �+  O o   L Q�'�' 0 keypointslib KeypointsLib�0  �/  �1  ( 5    
�&\�%
�& 
capp\ m    ]] �^^  D N t p
�% kfrmID  & _`_ l  _ _�$�#�"�$  �#  �"  ` a�!a L   _ abb o   _ `� �  0 annotatedpdfs annotatedPDFs�!   cdc l     ����  �  �  d efe l     ����  �  �  f ghg l     �ij�  i W Q Iterates over the given PDF's contained PDF annotations and creates a DEVONthink   j �kk �   I t e r a t e s   o v e r   t h e   g i v e n   P D F ' s   c o n t a i n e d   P D F   a n n o t a t i o n s   a n d   c r e a t e s   a   D E V O N t h i n kh lml l     �no�  n K E record for each markup or text annotation (if it doesn't exist yet).   o �pp �   r e c o r d   f o r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n   ( i f   i t   d o e s n ' t   e x i s t   y e t ) .m qrq l     �st�  s ` Z Returns a list with all records that were actually updated. I.e., if a PDF annotation did   t �uu �   R e t u r n s   a   l i s t   w i t h   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   u p d a t e d .   I . e . ,   i f   a   P D F   a n n o t a t i o n   d i dr vwv l     �xy�  x V P already have a corresponding Markdown record in DEVONthink which wasn't updated   y �zz �   a l r e a d y   h a v e   a   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d   i n   D E V O N t h i n k   w h i c h   w a s n ' t   u p d a t e dw {|{ l     �}~�  } ^ X (since its text content & properties were already up-to-date), it won't get included in   ~ � �   ( s i n c e   i t s   t e x t   c o n t e n t   &   p r o p e r t i e s   w e r e   a l r e a d y   u p - t o - d a t e ) ,   i t   w o n ' t   g e t   i n c l u d e d   i n| ��� l     ����  �   the returned list.   � ��� &   t h e   r e t u r n e d   l i s t .� ��� l     ����  � T N @param pdfRecord The DEVONthink record representing the PDF whose annotations   � ��� �   @ p a r a m   p d f R e c o r d   T h e   D E V O N t h i n k   r e c o r d   r e p r e s e n t i n g   t h e   P D F   w h o s e   a n n o t a t i o n s� ��� l     ����  �   shall be extracted.   � ��� (   s h a l l   b e   e x t r a c t e d .� ��� i  -0��� I      ���� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF� ��� o      �� 0 	pdfrecord 	pdfRecord�  �  � k    ��� ��� l     ����  � U O assemble info for the PDF record and its (possibly to be created) notes folder   � ��� �   a s s e m b l e   i n f o   f o r   t h e   P D F   r e c o r d   a n d   i t s   ( p o s s i b l y   t o   b e   c r e a t e d )   n o t e s   f o l d e r� ��� O     ���� k    ��� ��� r    ��� n    ��� 1   	 �
� 
ppth� o    	�� 0 	pdfrecord 	pdfRecord� o      �
�
 0 pdfpath pdfPath� ��� r    ��� n    ��� 1    �	
�	 
rURL� o    �� 0 	pdfrecord 	pdfRecord� o      �� 
0 pdfurl  � ��� r    ��� n    ��� 1    �
� 
DTlo� o    �� 0 	pdfrecord 	pdfRecord� o      �� "0 pdflocationpath pdfLocationPath� ��� l   ����  �  �  � ��� r    ��� n    ��� 1    � 
�  
DTcm� o    ���� 0 	pdfrecord 	pdfRecord� o      ���� 0 pdfmetadata pdfMetadata� ��� Q     =���� k   # 1�� ��� l  # #������  � N H pdfMetadata may be undefined in which case this triggers the error case   � ��� �   p d f M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e� ���� Z  # 1������� =  # &��� o   # $���� 0 pdfmetadata pdfMetadata� m   $ %��
�� 
msng� r   ) -��� J   ) +����  � o      ���� 0 pdfmetadata pdfMetadata��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r   9 =��� J   9 ;����  � o      ���� 0 pdfmetadata pdfMetadata� ��� l  > >��������  ��  ��  � ��� l  > >������  � p j if necessary, create the notes folder, i.e. the DEVONthink group that hosts the PDF file's Markdown notes   � ��� �   i f   n e c e s s a r y ,   c r e a t e   t h e   n o t e s   f o l d e r ,   i . e .   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n   n o t e s� ��� r   > O��� b   > M��� b   > G��� o   > C���� ,0 notefoldernameprefix noteFolderNamePrefix� n   C F��� 1   D F��
�� 
pnam� o   C D���� 0 	pdfrecord 	pdfRecord� o   G L���� ,0 notefoldernamesuffix noteFolderNameSuffix� o      ����  0 notefoldername noteFolderName� ��� r   P W��� l  P U������ b   P U��� b   P S��� o   P Q���� "0 pdflocationpath pdfLocationPath� o   Q R����  0 notefoldername noteFolderName� m   S T�� ���  /��  ��  � o      ���� (0 folderlocationpath folderLocationPath� ��� r   X _��� I  X ]�����
�� .DTpacd53bool       utxt� o   X Y���� (0 folderlocationpath folderLocationPath��  � o      ����  0 folderdidexist folderDidExist� ��� r   ` g��� I  ` e�����
�� .DTpacd52DTrc       utxt� o   ` a���� (0 folderlocationpath folderLocationPath��  � o      ����  0 folderlocation folderLocation� ��� r   h m��� n   h k��� 1   i k��
�� 
rURL� o   h i����  0 folderlocation folderLocation� o      ���� 0 	folderurl 	folderURL� ��� r   n u��� b   n q��� o   n o���� 
0 pdfurl  � m   o p   �  ? p a g e = 0� n       1   r t��
�� 
pURL o   q r����  0 folderlocation folderLocation�  l  v v��������  ��  ��    r   v {	 n   v y

 1   w y��
�� 
DTcm o   v w����  0 folderlocation folderLocation	 o      ����  0 foldermetadata folderMetadata �� Q   | � k    �  l   ����   Q K folderMetadata may be undefined in which case this triggers the error case    � �   f o l d e r M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e �� Z   ����� =   � o    �����  0 foldermetadata folderMetadata m   � ���
�� 
msng r   � � J   � �����   o      ����  0 foldermetadata folderMetadata��  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��   r   � � J   � �����   o      ����  0 foldermetadata folderMetadata��  � 5     ����
�� 
capp m       �!!  D N t p
�� kfrmID  � "#" l  � ���������  ��  ��  # $%$ l  � ���&'��  & E ? extract any DOI & citekey for the PDF from its custom metadata   ' �(( ~   e x t r a c t   a n y   D O I   &   c i t e k e y   f o r   t h e   P D F   f r o m   i t s   c u s t o m   m e t a d a t a% )*) r   � �+,+ m   � �-- �..  , o      ���� 0 	sourcedoi 	sourceDOI* /0/ r   � �121 m   � �33 �44  2 o      ���� 0 sourcecitekey sourceCitekey0 565 Z   �78����7 >  � �9:9 o   � ����� 0 pdfmetadata pdfMetadata: J   � �����  8 k   �
;; <=< r   � �>?> l  � �@����@ n  � �ABA I   � ���C���� .0 valueforkey_inrecord_ valueForKey_inRecord_C DED m   � �FF �GG 
 m d d o iE H��H o   � ����� 0 pdfmetadata pdfMetadata��  ��  B o   � ����� 0 keypointslib KeypointsLib��  ��  ? o      ���� 0 metadatadoi metadataDOI= IJI Z   � �KL����K F   � �MNM >  � �OPO o   � ����� 0 metadatadoi metadataDOIP m   � ���
�� 
msngN >  � �QRQ o   � ����� 0 metadatadoi metadataDOIR m   � �SS �TT  L r   � �UVU n  � �WXW I   � ���Y���� 0 matchdoi matchDOIY Z��Z o   � ����� 0 metadatadoi metadataDOI��  ��  X o   � ����� 0 keypointslib KeypointsLibV o      ���� 0 	sourcedoi 	sourceDOI��  ��  J [\[ r   � �]^] l  � �_����_ n  � �`a` I   � ���b���� .0 valueforkey_inrecord_ valueForKey_inRecord_b cdc m   � �ee �ff  m d c i t e k e yd g��g o   � ����� 0 pdfmetadata pdfMetadata��  ��  a o   � ����� 0 keypointslib KeypointsLib��  ��  ^ o      ���� "0 metadatacitekey metadataCitekey\ h��h Z   �
ij����i F   � klk >  � �mnm o   � ����� "0 metadatacitekey metadataCitekeyn m   � ���
�� 
msngl >  � �opo o   � ����� "0 metadatacitekey metadataCitekeyp m   � �qq �rr  j r  sts o  ���� "0 metadatacitekey metadataCitekeyt o      ���� 0 sourcecitekey sourceCitekey��  ��  ��  ��  ��  6 uvu l ��������  ��  ��  v wxw l ��yz��  y J D assemble info for all PDF annotations as a list of property records   z �{{ �   a s s e m b l e   i n f o   f o r   a l l   P D F   a n n o t a t i o n s   a s   a   l i s t   o f   p r o p e r t y   r e c o r d sx |}| r  -~~ n ��� I  ������� &0 pdfannotationinfo pdfAnnotationInfo� ��� o  ���� 0 pdfpath pdfPath� ��� o  ���� 
0 pdfurl  � ��� o  ���� 0 	sourcedoi 	sourceDOI� ���� o  ���� 0 sourcecitekey sourceCitekey��  ��  �  f   J      �� ��� o      ���� (0 pdfannotationslist pdfAnnotationsList� ���� o      ���� 0 	sourcedoi 	sourceDOI��  } ��� l ..��������  ��  ��  � ��� l ..������  � \ V set custom metadata fields for the PDF record: DOI & DT link back to the notes folder   � ��� �   s e t   c u s t o m   m e t a d a t a   f i e l d s   f o r   t h e   P D F   r e c o r d :   D O I   &   D T   l i n k   b a c k   t o   t h e   n o t e s   f o l d e r� ��� r  .>��� b  .<��� o  ./�� 0 pdfmetadata pdfMetadata� K  /;�� �~���~ 0 doi  � o  23�}�} 0 	sourcedoi 	sourceDOI� �|��{�| 0 pdfannotations  � o  67�z�z 0 	folderurl 	folderURL�{  � o      �y�y 0 pdfmetadata pdfMetadata� ��� n ?F��� I  @F�x��w�x 00 setmetadatafordtrecord setMetadataForDTRecord� ��� o  @A�v�v 0 	pdfrecord 	pdfRecord� ��u� o  AB�t�t 0 pdfmetadata pdfMetadata�u  �w  �  f  ?@� ��� l GG�s�r�q�s  �r  �q  � ��� l GG�p���p  � = 7 if the notes folder just got created, set its metadata   � ��� n   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   s e t   i t s   m e t a d a t a� ��� r  GM��� J  GI�o�o  � o      �n�n 0 bibmetadata bibMetadata� ��� r  NU��� m  NQ�� ���  � o      �m�m &0 formattedcitation formattedCitation� ��� r  V]��� m  VY�� ���  � o      �l�l 0 
bibtexdata 
bibTeXData� ��� Z  ^����k�j� G  ^o��� = ^a��� o  ^_�i�i  0 folderdidexist folderDidExist� m  _`�h
�h boovfals� = dk��� o  di�g�g 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata� m  ij�f
�f boovtrue� k  r��� ��� l rr�e���e  � 5 / fetch bibliographic metadata for the PDF's DOI   � ��� ^   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   P D F ' s   D O I� ��� Z  r����d�c� F  r���� F  r���� = ry��� o  rw�b�b $0 fetchdoimetadata fetchDOIMetadata� m  wx�a
�a boovtrue� > |��� o  |}�`�` 0 	sourcedoi 	sourceDOI� m  }~�_
�_ 
msng� > ����� o  ���^�^ 0 	sourcedoi 	sourceDOI� m  ���� ���  � k  ���� ��� r  ����� n ����� I  ���]��\�] &0 bibmetadatafordoi bibMetadataForDOI� ��� o  ���[�[ 0 	sourcedoi 	sourceDOI� ��Z� o  ���Y�Y 0 sourcecitekey sourceCitekey�Z  �\  �  f  ��� o      �X�X 0 bibmetadata bibMetadata� ��W� Z  �����V�U� > ����� o  ���T�T 0 bibmetadata bibMetadata� J  ���S�S  � k  ���� ��� r  ����� l ����R�Q� n ����� I  ���P��O�P .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  r e f e r e n c e� ��N� o  ���M�M 0 bibmetadata bibMetadata�N  �O  � o  ���L�L 0 keypointslib KeypointsLib�R  �Q  � o      �K�K &0 formattedcitation formattedCitation� ��J� r  ����� l ����I�H� n ��   I  ���G�F�G .0 valueforkey_inrecord_ valueForKey_inRecord_  m  �� �  b i b t e x �E o  ���D�D 0 bibmetadata bibMetadata�E  �F   o  ���C�C 0 keypointslib KeypointsLib�I  �H  � o      �B�B 0 
bibtexdata 
bibTeXData�J  �V  �U  �W  �d  �c  � 	 l ���A�@�?�A  �@  �?  	 

 r  �� b  �� o  ���>�>  0 foldermetadata folderMetadata K  �� �=�= 0 
sourcefile 
sourceFile o  ���<�< 0 pdfpath pdfPath �;�; 0 citekey   o  ���:�: 0 sourcecitekey sourceCitekey �9�8�9 0 doi   o  ���7�7 0 	sourcedoi 	sourceDOI�8   o      �6�6  0 foldermetadata folderMetadata  r  �� b  �� o  ���5�5  0 foldermetadata folderMetadata o  ���4�4 0 bibmetadata bibMetadata o      �3�3  0 foldermetadata folderMetadata  l ���2�1�0�2  �1  �0   �/ n ��  I  ���.!�-�. 00 setmetadatafordtfolder setMetadataForDTFolder! "#" o  ���,�,  0 folderlocation folderLocation# $�+$ o  ���*�*  0 foldermetadata folderMetadata�+  �-     f  ���/  �k  �j  � %&% l   �)�(�'�)  �(  �'  & '(' l   �&)*�&  ) s m if the notes folder just got created, append BibTeX data and/or the formatted citation to its Finder comment   * �++ �   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   a p p e n d   B i b T e X   d a t a   a n d / o r   t h e   f o r m a t t e d   c i t a t i o n   t o   i t s   F i n d e r   c o m m e n t( ,-, Z   m./�%�$. =  010 o   �#�#  0 folderdidexist folderDidExist1 m  �"
�" boovfals/ k  i22 343 Z  756�!� 5 F  '787 F  9:9 = ;<; o  �� P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment< m  �
� boovtrue: > =>= o  �� &0 formattedcitation formattedCitation> m  �
� 
msng8 > #?@? o  �� &0 formattedcitation formattedCitation@ m  "AA �BB  6 n *3CDC I  +3�E�� 60 appendtocommentofdtfolder appendToCommentOfDTFolderE FGF o  +,��  0 folderlocation folderLocationG H�H o  ,/�� &0 formattedcitation formattedCitation�  �  D  f  *+�!  �   4 I�I Z  8iJK��J F  8YLML F  8KNON = 8?PQP o  8=�� :0 appendbibtextofindercomment appendBibTeXToFinderCommentQ m  =>�
� boovtrueO > BGRSR o  BE�� 0 
bibtexdata 
bibTeXDataS m  EF�
� 
msngM > NUTUT o  NQ�� 0 
bibtexdata 
bibTeXDataU m  QTVV �WW  K n \eXYX I  ]e�Z�� 60 appendtocommentofdtfolder appendToCommentOfDTFolderZ [\[ o  ]^��  0 folderlocation folderLocation\ ]�
] o  ^a�	�	 0 
bibtexdata 
bibTeXData�
  �  Y  f  \]�  �  �  �%  �$  - ^_^ l nn����  �  �  _ `a` r  ntbcb J  np��  c o      ��  0 updatedrecords updatedRecordsa ded l uu����  �  �  e fgf l uu� hi�   h n h loop over each markup or text annotation in the PDF and create/update its corresponding Markdown record   i �jj �   l o o p   o v e r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n   i n   t h e   P D F   a n d   c r e a t e / u p d a t e   i t s   c o r r e s p o n d i n g   M a r k d o w n   r e c o r dg klk X  u�m��nm k  ��oo pqp r  ��rsr l ��t����t n ��uvu o  ������ 0 comment  v o  ������ 0 pdfannotation pdfAnnotation��  ��  s o      ���� 0 acomment aCommentq wxw Z ��yz����y = ��{|{ o  ������ 0 acomment aComment| l ��}����} n ��~~ o  ������ 0 null   n ����� o  ������ 0 nsnull NSNull� m  ����
�� misccura��  ��  z r  ����� m  ����
�� 
msng� o      ���� 0 acomment aComment��  ��  x ��� Z ��������� > ����� o  ������ 0 acomment aComment� m  ����
�� 
msng� r  ����� c  ����� o  ������ 0 acomment aComment� m  ����
�� 
TEXT� o      ���� 0 acomment aComment��  ��  � ��� l ����������  ��  ��  � ��� r  ����� l �������� n ����� o  ������ 0 	annottext 	annotText� o  ������ 0 pdfannotation pdfAnnotation��  ��  � o      ���� 0 	annottext 	annotText� ��� Z ��������� = ����� o  ������ 0 	annottext 	annotText� l �������� n ����� o  ������ 0 null  � n ����� o  ������ 0 nsnull NSNull� m  ����
�� misccura��  ��  � r  ����� m  ����
�� 
msng� o      ���� 0 	annottext 	annotText��  ��  � ��� Z �������� > ����� o  ������ 0 	annottext 	annotText� m  ����
�� 
msng� r  ���� c  � ��� o  ������ 0 	annottext 	annotText� m  ����
�� 
TEXT� o      ���� 0 	annottext 	annotText��  ��  � ��� l 		��������  ��  ��  � ��� r  	��� l 	������ n 	��� o  ���� 0 	pagelabel 	pageLabel� o  	���� 0 pdfannotation pdfAnnotation��  ��  � o      ���� 0 
apagelabel 
aPageLabel� ��� l ��������  ��  ��  � ��� l ������  � = 7 assemble record content from annotation text & comment   � ��� n   a s s e m b l e   r e c o r d   c o n t e n t   f r o m   a n n o t a t i o n   t e x t   &   c o m m e n t� ��� r  $��� n  ��� I   ������� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� ��� o  ���� 0 	annottext 	annotText� ���� o  ���� 0 acomment aComment��  ��  �  f  � o      ����  0 recordcontents recordContents� ��� l %%��������  ��  ��  � ��� l %%������  � F @ assemble record name from annotation text, comment & page label   � ��� �   a s s e m b l e   r e c o r d   n a m e   f r o m   a n n o t a t i o n   t e x t ,   c o m m e n t   &   p a g e   l a b e l� ��� r  %7��� n %3��� I  &3������� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData� ��� o  &)���� 0 	annottext 	annotText� ��� o  ),���� 0 acomment aComment� ���� o  ,/���� 0 
apagelabel 
aPageLabel��  ��  �  f  %&� o      ���� 0 
recordname 
recordName� ��� l 88��������  ��  ��  � ��� l 88������  � * $ record modification & creation date   � ��� H   r e c o r d   m o d i f i c a t i o n   &   c r e a t i o n   d a t e� ��� r  8G��� c  8C��� l 8?������ n 8?��� o  ;?���� 0 modifieddate modifiedDate� o  8;���� 0 pdfannotation pdfAnnotation��  ��  � m  ?B��
�� 
ldt � o      ���� 00 recordmodificationdate recordModificationDate� ��� Z  Hl������� > HM��� o  HK���� 00 recordmodificationdate recordModificationDate� m  KL��
�� 
msng� k  Ph�� ��� r  PW��� o  PS���� 00 recordmodificationdate recordModificationDate� o      ���� (0 recordcreationdate recordCreationDate� ���� r  Xh��� n Xd��� I  ]d������� (0 keypointsidfordate keypointsIDForDate� ���� o  ]`���� (0 recordcreationdate recordCreationDate��  ��  � o  X]���� 0 keypointslib KeypointsLib� o      ���� 0 recordaliases recordAliases��  ��  ��  � ��� l mm��������  ��  ��  � �	 � r  m|			 c  mx			 l mt	����	 n mt			 o  pt���� 0 deeplink deepLink	 o  mp���� 0 pdfannotation pdfAnnotation��  ��  	 m  tw��
�� 
TEXT	 o      ���� 0 	recordurl 	recordURL	  				 l }}��������  ��  ��  		 	
		
 l }}��		��  	   record metadata   	 �		     r e c o r d   m e t a d a t a	 			 r  }�			 c  }�			 l }�	����	 n }�			 o  ������ 0 	annottype 	annotType	 o  }����� 0 pdfannotation pdfAnnotation��  ��  	 m  ����
�� 
TEXT	 o      ���� 0 	annottype 	annotType	 			 r  ��			 b  ��			 o  ������ 0 bibmetadata bibMetadata	 K  ��		 ��		 �� 0 pdfannotations  	 o  ������ 0 	folderurl 	folderURL	  ��	!����  0 annotationtype annotationType	! o  ������ 0 	annottype 	annotType��  	 o      ����  0 recordmetadata recordMetadata	 	"	#	" l ���������  ��  �  	# 	$	%	$ r  ��	&	'	& l ��	(�~�}	( n ��	)	*	) o  ���|�| 0 username userName	* o  ���{�{ 0 pdfannotation pdfAnnotation�~  �}  	' o      �z�z 0 	ausername 	aUserName	% 	+	,	+ Z ��	-	.�y�x	- F  ��	/	0	/ > ��	1	2	1 o  ���w�w 0 	ausername 	aUserName	2 m  ���v
�v 
msng	0 > ��	3	4	3 o  ���u�u 0 	ausername 	aUserName	4 m  ��	5	5 �	6	6  	. r  ��	7	8	7 b  ��	9	:	9 o  ���t�t  0 recordmetadata recordMetadata	: K  ��	;	; �s	<�r�s 0 	createdby 	createdBy	< l ��	=�q�p	= c  ��	>	?	> o  ���o�o 0 	ausername 	aUserName	? m  ���n
�n 
TEXT�q  �p  �r  	8 o      �m�m  0 recordmetadata recordMetadata�y  �x  	, 	@	A	@ l ���l�k�j�l  �k  �j  	A 	B	C	B Z �	D	E�i�h	D F  ��	F	G	F > ��	H	I	H o  ���g�g 0 
apagelabel 
aPageLabel	I m  ���f
�f 
msng	G > ��	J	K	J o  ���e�e 0 
apagelabel 
aPageLabel	K m  ��	L	L �	M	M  	E r  �		N	O	N b  �	P	Q	P o  ���d�d  0 recordmetadata recordMetadata	Q K  �	R	R �c	S�b�c 0 
sourcepage 
sourcePage	S l �	T�a�`	T c  �	U	V	U o  ���_�_ 0 
apagelabel 
aPageLabel	V m  ��^
�^ 
TEXT�a  �`  �b  	O o      �]�]  0 recordmetadata recordMetadata�i  �h  	C 	W	X	W l �\�[�Z�\  �[  �Z  	X 	Y	Z	Y Z &	[	\�Y�X	[ > 	]	^	] o  �W�W 0 pdfpath pdfPath	^ m  �V
�V 
msng	\ r  "	_	`	_ b  	a	b	a o  �U�U  0 recordmetadata recordMetadata	b K  	c	c �T	d�S�T 0 
sourcefile 
sourceFile	d o  �R�R 0 pdfpath pdfPath�S  	` o      �Q�Q  0 recordmetadata recordMetadata�Y  �X  	Z 	e	f	e l ''�P�O�N�P  �O  �N  	f 	g	h	g l ''�M	i	j�M  	i � � TODO: allow to extract (& prioritize) the citekey from the annotation comment (e.g. `< #Miller+Johns2024` or `< [#Miller+Johns2024]`)   	j �	k	k   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   c i t e k e y   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   # M i l l e r + J o h n s 2 0 2 4 `   o r   ` <   [ # M i l l e r + J o h n s 2 0 2 4 ] ` )	h 	l	m	l r  '2	n	o	n l '.	p�L�K	p n '.	q	r	q o  *.�J�J 0 citekey  	r o  '*�I�I 0 pdfannotation pdfAnnotation�L  �K  	o o      �H�H 0 citekey  	m 	s	t	s Z 3]	u	v�G�F	u F  3F	w	x	w > 38	y	z	y o  36�E�E 0 citekey  	z m  67�D
�D 
msng	x > ;B	{	|	{ o  ;>�C�C 0 citekey  	| m  >A	}	} �	~	~  	v r  IY		�	 b  IU	�	�	� o  IL�B�B  0 recordmetadata recordMetadata	� K  LT	�	� �A	��@�A 0 citekey  	� o  OR�?�? 0 citekey  �@  	� o      �>�>  0 recordmetadata recordMetadata�G  �F  	t 	�	�	� l ^^�=�<�;�=  �<  �;  	� 	�	�	� Z ^�	�	��:�9	� F  ^m	�	�	� > ^a	�	�	� o  ^_�8�8 0 	sourcedoi 	sourceDOI	� m  _`�7
�7 
msng	� > di	�	�	� o  de�6�6 0 	sourcedoi 	sourceDOI	� m  eh	�	� �	�	�  	� r  p~	�	�	� b  pz	�	�	� o  ps�5�5  0 recordmetadata recordMetadata	� K  sy	�	� �4	��3�4 0 doi  	� o  vw�2�2 0 	sourcedoi 	sourceDOI�3  	� o      �1�1  0 recordmetadata recordMetadata�:  �9  	� 	�	�	� l ���0�/�.�0  �/  �.  	� 	�	�	� l ���-	�	��-  	� j d extract tags (like `< @tag @another tag` or `< [@tag] [@another tag]`) as well as custom attributes   	� �	�	� �   e x t r a c t   t a g s   ( l i k e   ` <   @ t a g   @ a n o t h e r   t a g `   o r   ` <   [ @ t a g ]   [ @ a n o t h e r   t a g ] ` )   a s   w e l l   a s   c u s t o m   a t t r i b u t e s	� 	�	�	� l ���,	�	��,  	� q k (i.e., special tags like `< @:key:value @:key` or `< [@:key:value] [@:key]`) within the annotation comment   	� �	�	� �   ( i . e . ,   s p e c i a l   t a g s   l i k e   ` <   @ : k e y : v a l u e   @ : k e y `   o r   ` <   [ @ : k e y : v a l u e ]   [ @ : k e y ] ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t	� 	�	�	� r  ��	�	�	� n ��	�	�	� I  ���+	��*�+ T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote	� 	�	�	� o  ���)�) 0 acomment aComment	� 	��(	� J  ��	�	� 	��'	� m  ��	�	� �	�	�  f l a g g e d�'  �(  �*  	� o  ���&�& 0 keypointslib KeypointsLib	� J      	�	� 	�	�	� o      �%�% $0 customattributes customAttributes	� 	��$	� o      �#�# 0 
recordtags 
recordTags�$  	� 	�	�	� l ���"�!� �"  �!  �   	� 	�	�	� l ���	�	��  	� G A set the extracted custom attributes as dedicated record metadata   	� �	�	� �   s e t   t h e   e x t r a c t e d   c u s t o m   a t t r i b u t e s   a s   d e d i c a t e d   r e c o r d   m e t a d a t a	� 	�	�	� X  �7	��	�	� k  �2	�	� 	�	�	� r  ��	�	�	� n ��	�	�	� o  ���� 0 	attribkey 	attribKey	� o  ���� "0 customattribute customAttribute	� o      �� 0 akey aKey	� 	�	�	� r  ��	�	�	� n ��	�	�	� o  ���� 0 attribvalue attribValue	� o  ���� "0 customattribute customAttribute	� o      �� 0 avalue aValue	� 	�	�	� l ������  �  �  	� 	�	�	� l ���	�	��  	� z t allow multiple occurrences of the same custom key with different values (e.g. `@:key:Some value @:key:Other value`)   	� �	�	� �   a l l o w   m u l t i p l e   o c c u r r e n c e s   o f   t h e   s a m e   c u s t o m   k e y   w i t h   d i f f e r e n t   v a l u e s   ( e . g .   ` @ : k e y : S o m e   v a l u e   @ : k e y : O t h e r   v a l u e ` )	� 	�	�	� r  ��	�	�	� l ��	���	� n ��	�	�	� I  ���	��� .0 valueforkey_inrecord_ valueForKey_inRecord_	� 	�	�	� o  ���� 0 akey aKey	� 	��	� o  ����  0 recordmetadata recordMetadata�  �  	� o  ���� 0 keypointslib KeypointsLib�  �  	� o      �� 0 existingvalue existingValue	� 	��
	� Z  �2	�	��		�	� > ��	�	�	� o  ���� 0 existingvalue existingValue	� m  ���
� 
msng	� r  �	�	�	� l �	���	� n �	�	�	� I  ��	��� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_	� 	�	�	� l �	���	� b  �	�	�	� b  �	�	�	� o  ��� �  0 existingvalue existingValue	� m  �	�	� �	�	�  ;	� o  ���� 0 avalue aValue�  �  	� 	�	�	� o  	���� 0 akey aKey	� 	���	� o  	����  0 recordmetadata recordMetadata��  �  	� o  ������ 0 keypointslib KeypointsLib�  �  	� o      ����  0 recordmetadata recordMetadata�	  	� r  2	�	�	� b  .	�	�	� o  ����  0 recordmetadata recordMetadata	� l -	�����	� n -	�	�	� I  -��
 ���� :0 recordfromlabels_andvalues_ recordFromLabels_andValues_
  


 J  $

 
��
 o  "���� 0 akey aKey��  
 
��
 J  $)

 
��
 o  $'���� 0 avalue aValue��  ��  ��  	� o  ���� 0 keypointslib KeypointsLib��  ��  	� o      ����  0 recordmetadata recordMetadata�
  � "0 customattribute customAttribute	� o  ������ $0 customattributes customAttributes	� 

	
 l 88��������  ��  ��  
	 




 l 88��

��  
 P J honor a flagged status (like `< @:flagged`) within the annotation comment   
 �

 �   h o n o r   a   f l a g g e d   s t a t u s   ( l i k e   ` <   @ : f l a g g e d ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t
 


 r  8H


 n 8D


 I  =D��
���� @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged
 
��
 o  =@���� 0 acomment aComment��  ��  
 o  8=���� 0 keypointslib KeypointsLib
 o      ���� 0 	isflagged 	isFlagged
 


 l II��������  ��  ��  
 


 l II��

��  
 B < honor a rating (like `< ***`) within the annotation comment   
 �

 x   h o n o r   a   r a t i n g   ( l i k e   ` <   * * * ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t
 


 r  IY
 
!
  n IU
"
#
" I  NU��
$���� 60 keypointsnoteratingnumber keypointsNoteRatingNumber
$ 
%��
% o  NQ���� 0 acomment aComment��  ��  
# o  IN���� 0 keypointslib KeypointsLib
! o      ���� 0 recordrating recordRating
 
&
'
& l ZZ��������  ��  ��  
' 
(
)
( l ZZ��
*
+��  
* H B attempt to map the annotation's color to a DEVONthink label index   
+ �
,
, �   a t t e m p t   t o   m a p   t h e   a n n o t a t i o n ' s   c o l o r   t o   a   D E V O N t h i n k   l a b e l   i n d e x
) 
-
.
- l ZZ��
/
0��  
/  y TODO: allow to extract (& prioritize) the DEVONthink label from the annotation comment (e.g. `< (@Important)` or `< @1`)   
0 �
1
1 �   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   D E V O N t h i n k   l a b e l   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   ( @ I m p o r t a n t ) `   o r   ` <   @ 1 ` )
. 
2
3
2 r  Zj
4
5
4 n Zf
6
7
6 I  [f��
8���� 00 labelindexforcolorname labelIndexForColorName
8 
9��
9 n [b
:
;
: o  ^b����  0 annotcolorname annotColorName
; o  [^���� 0 pdfannotation pdfAnnotation��  ��  
7  f  Z[
5 o      ���� $0 recordlabelindex recordLabelIndex
3 
<
=
< l kk��������  ��  ��  
= 
>
?
> l kk��
@
A��  
@ A ; create a Markdown record for this annotation in DEVONthink   
A �
B
B v   c r e a t e   a   M a r k d o w n   r e c o r d   f o r   t h i s   a n n o t a t i o n   i n   D E V O N t h i n k
? 
C
D
C r  k�
E
F
E n k�
G
H
G I  l���
I����  0 createdtrecord createDTRecord
I 
J
K
J o  lm����  0 folderlocation folderLocation
K 
L
M
L o  mn����  0 foldermetadata folderMetadata
M 
N
O
N o  nq���� 0 
recordname 
recordName
O 
P
Q
P o  qt���� 0 recordaliases recordAliases
Q 
R
S
R o  tw���� 0 	recordurl 	recordURL
S 
T
U
T o  wz���� 0 
recordtags 
recordTags
U 
V
W
V o  z}���� 0 	isflagged 	isFlagged
W 
X
Y
X o  }�����  0 recordcontents recordContents
Y 
Z
[
Z o  ������ (0 recordcreationdate recordCreationDate
[ 
\
]
\ o  ������ 00 recordmodificationdate recordModificationDate
] 
^
_
^ o  ������  0 recordmetadata recordMetadata
_ 
`
a
` o  ������ 0 recordrating recordRating
a 
b��
b o  ������ $0 recordlabelindex recordLabelIndex��  ��  
H  f  kl
F J      
c
c 
d
e
d o      ���� 0 dtrecord dtRecord
e 
f��
f o      ���� $0 recordwasupdated recordWasUpdated��  
D 
g
h
g l ����������  ��  ��  
h 
i��
i Z  ��
j
k����
j = ��
l
m
l o  ������ $0 recordwasupdated recordWasUpdated
m m  ����
�� boovtrue
k s  ��
n
o
n o  ������ 0 dtrecord dtRecord
o n      
p
q
p  ;  ��
q o  ������  0 updatedrecords updatedRecords��  ��  ��  �� 0 pdfannotation pdfAnnotationn o  xy���� (0 pdfannotationslist pdfAnnotationsListl 
r
s
r l ����������  ��  ��  
s 
t��
t L  ��
u
u o  ������  0 updatedrecords updatedRecords��  � 
v
w
v l     ��������  ��  ��  
w 
x
y
x l     ��������  ��  ��  
y 
z
{
z l     ��
|
}��  
| Z T For the given PDF, returns a list of records (where each record contains info about   
} �
~
~ �   F o r   t h e   g i v e n   P D F ,   r e t u r n s   a   l i s t   o f   r e c o r d s   ( w h e r e   e a c h   r e c o r d   c o n t a i n s   i n f o   a b o u t
{ 

�
 l     ��
�
���  
� V P one of its PDF annotations) as well as any DOI extracted from the PDF metadata.   
� �
�
� �   o n e   o f   i t s   P D F   a n n o t a t i o n s )   a s   w e l l   a s   a n y   D O I   e x t r a c t e d   f r o m   t h e   P D F   m e t a d a t a .
� 
�
�
� l     ��
�
���  
� = 7 @param pdfPath The POSIX path to the PDF file on disk.   
� �
�
� n   @ p a r a m   p d f P a t h   T h e   P O S I X   p a t h   t o   t h e   P D F   f i l e   o n   d i s k .
� 
�
�
� l     ��
�
���  
� V P @param pdfurl The `x-devonthink-item://...` URL of the corresponding PDF record   
� �
�
� �   @ p a r a m   p d f u r l   T h e   ` x - d e v o n t h i n k - i t e m : / / . . . `   U R L   o f   t h e   c o r r e s p o n d i n g   P D F   r e c o r d
� 
�
�
� l     ��
�
���  
�   in DEVONthink.   
� �
�
�    i n   D E V O N t h i n k .
� 
�
�
� l     ��
�
���  
� Q K @param sourceDOI The DOI of the publication represented by the PDF (may be   
� �
�
� �   @ p a r a m   s o u r c e D O I   T h e   D O I   o f   t h e   p u b l i c a t i o n   r e p r e s e n t e d   b y   t h e   P D F   ( m a y   b e
� 
�
�
� l     ��
�
���  
�   empty).   
� �
�
�    e m p t y ) .
� 
�
�
� l     ��
�
���  
� V P @param sourceCitekey The citekey of the publication represented by the PDF (may   
� �
�
� �   @ p a r a m   s o u r c e C i t e k e y   T h e   c i t e k e y   o f   t h e   p u b l i c a t i o n   r e p r e s e n t e d   b y   t h e   P D F   ( m a y
� 
�
�
� l     ��
�
���  
�   be empty).   
� �
�
�    b e   e m p t y ) .
� 
�
�
� l     ��
�
���  
� @ : Credits: this method was inspired by a script by mdbraber   
� �
�
� t   C r e d i t s :   t h i s   m e t h o d   w a s   i n s p i r e d   b y   a   s c r i p t   b y   m d b r a b e r
� 
�
�
� l     ��
�
���  
�  y See https://discourse.devontechnologies.com/t/stream-annotations-from-your-pdf-reading-sessions-with-devonthink/70727/30   
� �
�
� �   S e e   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / s t r e a m - a n n o t a t i o n s - f r o m - y o u r - p d f - r e a d i n g - s e s s i o n s - w i t h - d e v o n t h i n k / 7 0 7 2 7 / 3 0
� 
�
�
� i  14
�
�
� I      ��
����� &0 pdfannotationinfo pdfAnnotationInfo
� 
�
�
� o      ���� 0 pdfpath pdfPath
� 
�
�
� o      ���� 
0 pdfurl  
� 
�
�
� o      ���� 0 	sourcedoi 	sourceDOI
� 
���
� o      ���� 0 sourcecitekey sourceCitekey��  ��  
� k    -
�
� 
�
�
� r     
�
�
� n    
�
�
� I    ��
����� 0 initwithurl_ initWithURL_
� 
���
� l   
�����
� n   
�
�
� I   
 ��
����� $0 fileurlwithpath_ fileURLWithPath_
� 
���
� o   
 ���� 0 pdfpath pdfPath��  ��  
� n   

�
�
� o    
���� 	0 NSURL  
� m    ��
�� misccura��  ��  ��  ��  
� n    
�
�
� I    �������� 	0 alloc  ��  ��  
� n    
�
�
� o    ���� 0 pdfdocument PDFDocument
� m     �
� misccura
� o      �~�~ 0 pdfdoc pdfDoc
� 
�
�
� l   �}�|�{�}  �|  �{  
� 
�
�
� l   �z
�
��z  
� Z T if there's no given DOI yet, try to get any DOI from PDF metadata or first PDF page   
� �
�
� �   i f   t h e r e ' s   n o   g i v e n   D O I   y e t ,   t r y   t o   g e t   a n y   D O I   f r o m   P D F   m e t a d a t a   o r   f i r s t   P D F   p a g e
� 
�
�
� Z    <
�
��y�x
� =   
�
�
� o    �w�w 0 	sourcedoi 	sourceDOI
� m    
�
� �
�
�  
� k    8
�
� 
�
�
� r    *
�
�
� n   (
�
�
� I   ! (�v
��u�v 0 
doifrompdf 
doiFromPDF
� 
�
�
� o   ! "�t�t 0 pdfpath pdfPath
� 
�
�
� o   " #�s�s 0 pdfdoc pdfDoc
� 
��r
� m   # $�q
�q boovtrue�r  �u  
� o    !�p�p 0 keypointslib KeypointsLib
� o      �o�o 0 pdfdoi pdfDOI
� 
��n
� Z   + 8
�
��m�l
� >  + .
�
�
� o   + ,�k�k 0 pdfdoi pdfDOI
� m   , -
�
� �
�
�  
� r   1 4
�
�
� o   1 2�j�j 0 pdfdoi pdfDOI
� o      �i�i 0 	sourcedoi 	sourceDOI�m  �l  �n  �y  �x  
� 
�
�
� l  = =�h�g�f�h  �g  �f  
� 
�
�
� l  = =�e
�
��e  
� = 7 iterate over each PDF page and process its annotations   
� �
�
� n   i t e r a t e   o v e r   e a c h   P D F   p a g e   a n d   p r o c e s s   i t s   a n n o t a t i o n s
� 
�
�
� r   = F
� 
� n  = D I   @ D�d�c�b�d 0 new  �c  �b   n  = @ o   > @�a�a  0 nsmutablearray NSMutableArray m   = >�`
�` misccura  o      �_�_ *0 pdfannotationsarray pdfAnnotationsArray
�  Y   G#�^	�] l  W

 k   W  r   W _ l  W ]�\�[ n  W ] I   X ]�Z�Y�Z 0 pageatindex_ pageAtIndex_ �X o   X Y�W�W 0 i  �X  �Y   o   W X�V�V 0 pdfdoc pdfDoc�\  �[   o      �U�U 0 pdfpage pdfPage  r   ` g n  ` e I   a e�T�S�R�T 	0 label  �S  �R   o   ` a�Q�Q 0 pdfpage pdfPage o      �P�P 0 	pagelabel 	pageLabel  r   h o  n  h m!"! I   i m�O�N�M�O 0 annotations  �N  �M  " o   h i�L�L 0 pdfpage pdfPage  o      �K�K 0 pdfannotations   #�J# X   p$�I%$ k   �&& '(' r   � �)*) n  � �+,+ I   � ��H�G�F�H 0 type  �G  �F  , o   � ��E�E 0 pdfannotation pdfAnnotation* o      �D�D 0 	annottype 	annotType( -.- l  � ��C�B�A�C  �B  �A  . /�@/ Z   �01�?�>0 E  � �232 J   � �44 565 m   � �77 �88  H i g h l i g h t6 9:9 m   � �;; �<<  S t r i k e O u t: =>= m   � �?? �@@  U n d e r l i n e> ABA m   � �CC �DD  S q u i g g l yB E�=E m   � �FF �GG  T e x t�=  3 o   � ��<�< 0 	annottype 	annotType1 k   �HH IJI Z   � �KL�;MK E  � �NON J   � �PP QRQ m   � �SS �TT  H i g h l i g h tR UVU m   � �WW �XX  S t r i k e O u tV Y�:Y m   � �ZZ �[[  U n d e r l i n e�:  O o   � ��9�9 0 	annottype 	annotTypeL r   � �\]\ n  � �^_^ I   � ��8�7�6�8 0 
markuptype 
markupType�7  �6  _ o   � ��5�5 0 pdfannotation pdfAnnotation] o      �4�4 0 
markuptype 
markupType�;  M r   � �`a` m   � ��3
�3 
msnga o      �2�2 0 
markuptype 
markupTypeJ bcb l  � ��1�0�/�1  �0  �/  c ded l  � ��.fg�.  f !  get the annotation's color   g �hh 6   g e t   t h e   a n n o t a t i o n ' s   c o l o re iji r   � �klk n  � �mnm I   � ��-�,�+�- 	0 color  �,  �+  n o   � ��*�* 0 pdfannotation pdfAnnotationl o      �)�) 0 
annotcolor 
annotColorj opo l  � ��(�'�&�(  �'  �&  p qrq l  � ��%st�%  s �  approximate the name of the annotation's color via the degree of the hue in the HSB (hue, saturation, brightness) color scheme   t �uu �   a p p r o x i m a t e   t h e   n a m e   o f   t h e   a n n o t a t i o n ' s   c o l o r   v i a   t h e   d e g r e e   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m er vwv r   � �xyx I  � �z{|z z�$�#
�$ .sysorondlong        doub
�# misccura{ l  � �}�"�!} ]   � �~~ l  � ��� �� c   � ���� n  � ���� I   � ����� 0 huecomponent hueComponent�  �  � o   � ��� 0 
annotcolor 
annotColor� m   � ��
� 
nmbr�   �   m   � ���h�"  �!  | ���
� 
dire� m   � ��
� olierndS�  y o      �� 0 	huedegree 	hueDegreew ��� r   � ���� n  � ���� I   � ����� "0 colornameforhue colorNameForHue� ��� o   � ��� 0 	huedegree 	hueDegree�  �  �  f   � �� o      ��  0 annotcolorname annotColorName� ��� l  � �����  �  �  � ��� r   � ���� n  � ���� I   � ����
� 0 username userName�  �
  � o   � ��	�	 0 pdfannotation pdfAnnotation� o      �� 0 annotusername annotUserName� ��� r   ���� n  ���� I   ����� $0 modificationdate modificationDate�  �  � o   � ��� 0 pdfannotation pdfAnnotation� o      �� 0 annotmoddate annotModDate� ��� l ��� �  �  �   � ��� r  ��� n ��� I  	�������� 
0 bounds  ��  ��  � o  	���� 0 pdfannotation pdfAnnotation� o      ���� 0 annotbounds annotBounds� ��� r  ��� n  ��� 4 ���
�� 
cobj� m  ���� � o  ���� 0 annotbounds annotBounds� o      ���� 0 annotorigin annotOrigin� ��� r  J��� n  3��� J  "3�� ��� 4 #(���
�� 
cobj� m  &'���� � ���� 4 */���
�� 
cobj� m  -.���� ��  � o  "���� 0 annotorigin annotOrigin� J      �� ��� o      ���� 0 	annotposx 	annotPosX� ���� o      ���� 0 	annotposy 	annotPosY��  � ��� l KK��������  ��  ��  � ��� l KK������  � , & get the annotation's highlighted text   � ��� L   g e t   t h e   a n n o t a t i o n ' s   h i g h l i g h t e d   t e x t� ��� Z  K������� E K]��� J  K[�� ��� m  KN�� ���  H i g h l i g h t� ��� m  NQ�� ���  S t r i k e O u t� ��� m  QT�� ���  U n d e r l i n e� ���� m  TW�� ���  S q u i g g l y��  � o  [\���� 0 	annottype 	annotType� k  `��� ��� r  `i��� n `e��� I  ae�������� *0 quadrilateralpoints quadrilateralPoints��  ��  � o  `a���� 0 pdfannotation pdfAnnotation� o      ���� 0 
quadpoints 
quadPoints� ��� r  jy��� n ju��� I  ku������� 00 annotationboundsbyline annotationBoundsByLine� ��� o  kn���� 0 
quadpoints 
quadPoints� ���� o  nq���� 0 annotbounds annotBounds��  ��  �  f  jk� o      ���� 0 boundsbyline boundsByLine� ���� r  z���� n z���� I  {��������  0 annotationtext annotationText� ��� o  {|���� 0 pdfpage pdfPage� ���� o  |���� 0 boundsbyline boundsByLine��  ��  �  f  z{� o      ���� 0 	annottext 	annotText��  ��  � r  ����� m  ���� ���  � o      ���� 0 	annottext 	annotText� ��� l ����������  ��  ��  � ��� r  ����� n ����� I  ���������� 0 contents  ��  ��  � o  ������ 0 pdfannotation pdfAnnotation� o      ���� 0 annotcomment annotComment� � � l ����������  ��  ��     l ������   - ' create a deep link for this annotation    � N   c r e a t e   a   d e e p   l i n k   f o r   t h i s   a n n o t a t i o n  r  ��	 b  ��

 b  �� b  �� b  �� b  �� b  �� b  �� b  �� o  ������ 
0 pdfurl   l 	������ m  �� �  ? p a g e =��  ��   o  ������ 0 i   l 	������ m  �� �  & a n n o t a t i o n =��  ��   o  ������ 0 	annottype 	annotType l 	�� ����  m  ��!! �""  & x =��  ��   l ��#����# c  ��$%$ o  ������ 0 	annotposx 	annotPosX% m  ����
�� 
long��  ��   l 	��&����& m  ��'' �((  & y =��  ��   l ��)����) c  ��*+* o  ������ 0 	annotposy 	annotPosY+ m  ����
�� 
long��  ��  	 o      ���� 0 annoturl annotURL ,-, l ����������  ��  ��  - ./. l ����01��  0 [ U TODO: parse & set key/value pairs from dictionary returned by `annotationKeyValues`?   1 �22 �   T O D O :   p a r s e   &   s e t   k e y / v a l u e   p a i r s   f r o m   d i c t i o n a r y   r e t u r n e d   b y   ` a n n o t a t i o n K e y V a l u e s ` ?/ 343 l ����56��  5 y s            - `/CreationDate` (example: `/CreationDate:"D:20240810112845Z"`), set by DTTG but not DT/PDFKit on Mac?   6 �77 �                         -   ` / C r e a t i o n D a t e `   ( e x a m p l e :   ` / C r e a t i o n D a t e : " D : 2 0 2 4 0 8 1 0 1 1 2 8 4 5 Z " ` ) ,   s e t   b y   D T T G   b u t   n o t   D T / P D F K i t   o n   M a c ?4 898 l ����:;��  : o i            - `/Name` if it contains something more concrete than just "/Note" (example: `/Name:"/Note"`)   ; �<< �                         -   ` / N a m e `   i f   i t   c o n t a i n s   s o m e t h i n g   m o r e   c o n c r e t e   t h a n   j u s t   " / N o t e "   ( e x a m p l e :   ` / N a m e : " / N o t e " ` )9 =>= r  ��?@? n ��ABA I  ���������� *0 annotationkeyvalues annotationKeyValues��  ��  B o  ������ 0 pdfannotation pdfAnnotation@ o      ���� 0 annotkeydict annotKeyDict> CDC l ����������  ��  ��  D E��E l �F����F n �GHG I  ���I���� 0 
addobject_ 
addObject_I J��J K  �KK ��LM�� 0 citekey  L o  ������ 0 sourcecitekey sourceCitekeyM ��NO�� 0 page  N o  ������ 0 i  O ��PQ�� 0 	pagelabel 	pageLabelP o  ������ 0 	pagelabel 	pageLabelQ ��RS�� 0 	annottype 	annotTypeR o  ������ 0 	annottype 	annotTypeS ��TU�� 0 
markuptype 
markupTypeT o  ������ 0 
markuptype 
markupTypeU ��VW�� 0 
annotcolor 
annotColorV o  ������ 0 
annotcolor 
annotColorW ��XY��  0 annotcolorname annotColorNameX o  ������  0 annotcolorname annotColorNameY ��Z[�� 0 username userNameZ o  ������ 0 annotusername annotUserName[ ��\]�� 0 modifieddate modifiedDate\ o  ������ 0 annotmoddate annotModDate] ��^_�� 0 	annottext 	annotText^ o  ����� 0 	annottext 	annotText_ ��`a�� 0 comment  ` o  ���� 0 annotcomment annotCommenta ��b���� 0 deeplink deepLinkb o  
���� 0 annoturl annotURL��  ��  ��  H o  ������ *0 pdfannotationsarray pdfAnnotationsArray��  ��  ��  �?  �>  �@  �I 0 pdfannotation pdfAnnotation% o   s t���� 0 pdfannotations  �J   &   PDF pages are 0-based in PDFKit    �cc @   P D F   p a g e s   a r e   0 - b a s e d   i n   P D F K i t�^ 0 i   m   J K����  	 l  K Rd����d \   K Refe l  K Pg����g n  K Phih I   L P��~�}� 0 	pageCount  �~  �}  i o   K L�|�| 0 pdfdoc pdfDoc��  ��  f m   P Q�{�{ ��  ��  �]   jkj l $$�z�y�x�z  �y  �x  k l�wl L  $-mm J  $,nn opo c  $)qrq o  $%�v�v *0 pdfannotationsarray pdfAnnotationsArrayr m  %(�u
�u 
listp s�ts o  )*�s�s 0 	sourcedoi 	sourceDOI�t  �w  
� tut l     �r�q�p�r  �q  �p  u vwv l     �o�n�m�o  �n  �m  w xyx l     �lz{�l  z T N Assembles the content of a Markdown record from the given PDF annotation text   { �|| �   A s s e m b l e s   t h e   c o n t e n t   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x ty }~} l     �k��k     and comment.   � ���    a n d   c o m m e n t .~ ��� i  58��� I      �j��i�j H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� ��� o      �h�h 0 	annottext 	annotText� ��g� o      �f�f 0 annotcomment annotComment�g  �i  � k     ��� ��� r     ��� J     �e�e  � o      �d�d (0 recordcontentparts recordContentParts� ��� Z    ���c�b� F    ��� >   ��� o    �a�a 0 	annottext 	annotText� m    �`
�` 
msng� >   ��� o    �_�_ 0 	annottext 	annotText� m    �� ���  � s    ��� b    ��� m    �� ���  >  � l   ��^�]� c    ��� o    �\�\ 0 	annottext 	annotText� m    �[
�[ 
TEXT�^  �]  � n      ���  ;    � o    �Z�Z (0 recordcontentparts recordContentParts�c  �b  � ��� l     �Y�X�W�Y  �X  �W  � ��� Z     ����V�U� F     +��� >    #��� o     !�T�T 0 annotcomment annotComment� m   ! "�S
�S 
msng� >  & )��� o   & '�R�R 0 annotcomment annotComment� m   ' (�� ���  � k   . ��� ��� r   . 1��� o   . /�Q�Q 0 annotcomment annotComment� o      �P�P $0 processedcomment processedComment� ��� l  2 2�O�N�M�O  �N  �M  � ��� l  2 2�L���L  � Y S ensure that a first-level heading at the top of the annotation comment stays there   � ��� �   e n s u r e   t h a t   a   f i r s t - l e v e l   h e a d i n g   a t   t h e   t o p   o f   t h e   a n n o t a t i o n   c o m m e n t   s t a y s   t h e r e� ��� l  2 2�K���K  � ? 9 (even when annotation text gets inserted as a quotation)   � ��� r   ( e v e n   w h e n   a n n o t a t i o n   t e x t   g e t s   i n s e r t e d   a s   a   q u o t a t i o n )� ��� r   2 5��� m   2 3�� ��� 4 ^ ( ? : \ s * [ \ r \ n ] ) * ( # [   \ t ] + . + )� o      �J�J 00 firstlevelheadingregex firstLevelHeadingRegex� ��� r   6 C��� n  6 A��� I   ; A�I��H�I 0 
regexmatch 
regexMatch� ��� o   ; <�G�G 0 annotcomment annotComment� ��F� o   < =�E�E 00 firstlevelheadingregex firstLevelHeadingRegex�F  �H  � o   6 ;�D�D 0 keypointslib KeypointsLib� o      �C�C &0 firstlevelheading firstLevelHeading� ��� Z   D r���B�A� >  D G��� o   D E�@�@ &0 firstlevelheading firstLevelHeading� m   E F�� ���  � k   J n�� ��� r   J X��� n  J V��� I   O V�?��>�? 0 regexreplace regexReplace� ��� o   O P�=�= &0 firstlevelheading firstLevelHeading� ��� o   P Q�<�< 00 firstlevelheadingregex firstLevelHeadingRegex� ��;� m   Q R�� ���  $ 1�;  �>  � o   J O�:�: 0 keypointslib KeypointsLib� o      �9�9 &0 firstlevelheading firstLevelHeading� ��� s   Y ]��� o   Y Z�8�8 &0 firstlevelheading firstLevelHeading� n      ���  :   [ \� o   Z [�7�7 (0 recordcontentparts recordContentParts� ��� l  ^ ^�6�5�4�6  �5  �4  � ��3� r   ^ n��� n  ^ l��� I   c l�2��1�2 0 regexreplace regexReplace� ��� o   c d�0�0 $0 processedcomment processedComment� ��� b   d g��� o   d e�/�/ 00 firstlevelheadingregex firstLevelHeadingRegex� m   e f   � & [ \ r \ n ] ? ( \ s * [ \ r \ n ] ) *� �. m   g h �  �.  �1  � o   ^ c�-�- 0 keypointslib KeypointsLib� o      �,�, $0 processedcomment processedComment�3  �B  �A  �  l  s s�+�*�)�+  �*  �)    l  s s�(	
�(  	 r l for the record content, add the remaining annotation comment w/o any metadata lines (which start with "< ")   
 � �   f o r   t h e   r e c o r d   c o n t e n t ,   a d d   t h e   r e m a i n i n g   a n n o t a t i o n   c o m m e n t   w / o   a n y   m e t a d a t a   l i n e s   ( w h i c h   s t a r t   w i t h   " <   " )  r   s � n  s ~ I   x ~�'�&�' F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines  o   x y�%�% $0 processedcomment processedComment �$ m   y z�#
�# boovfals�$  �&   o   s x�"�" 0 keypointslib KeypointsLib o      �!�! $0 processedcomment processedComment  l  � �� ���   �  �   � s   � � o   � ��� $0 processedcomment processedComment n        ;   � � o   � ��� (0 recordcontentparts recordContentParts�  �V  �U  �  l  � �����  �  �     Z   � �!"�#! >  � �$%$ o   � ��� (0 recordcontentparts recordContentParts% J   � ���  " r   � �&'& n  � �()( I   � ��*��  0 mergetextitems mergeTextItems* +,+ o   � ��� (0 recordcontentparts recordContentParts, -�- b   � �./. 1   � ��
� 
lnfd/ 1   � ��
� 
lnfd�  �  ) o   � ��� 0 keypointslib KeypointsLib' o      ��  0 recordcontents recordContents�  # r   � �010 m   � �22 �33  ( n o   c o n t e n t )1 o      ��  0 recordcontents recordContents  454 l  � ���
�	�  �
  �	  5 6�6 L   � �77 o   � ���  0 recordcontents recordContents�  � 898 l     ����  �  �  9 :;: l     ����  �  �  ; <=< l     � >?�   > R L Assembles the name of a Markdown record from the given PDF annotation text,   ? �@@ �   A s s e m b l e s   t h e   n a m e   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t ,= ABA l     ��CD��  C   comment and page label.   D �EE 0   c o m m e n t   a n d   p a g e   l a b e l .B FGF i  9<HIH I      ��J���� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationDataJ KLK o      ���� 0 	annottext 	annotTextL MNM o      ���� 0 annotcomment annotCommentN O��O o      ���� 0 	pagelabel 	pageLabel��  ��  I k     �PP QRQ r     STS J     ����  T o      ���� "0 recordnameparts recordNamePartsR UVU Z    WX����W F    YZY >   [\[ o    ���� 0 	pagelabel 	pageLabel\ m    ��
�� 
msngZ >   ]^] o    ���� 0 	pagelabel 	pageLabel^ m    __ �``  X s    aba b    cdc m    ee �ff  pd l   g����g c    hih o    ���� 0 	pagelabel 	pageLabeli m    ��
�� 
TEXT��  ��  b n      jkj  ;    k o    ���� "0 recordnameparts recordNameParts��  ��  V lml l     ��������  ��  ��  m non r     #pqp m     !rr �ss  q o      ����  0 recordnamepart recordNameParto tut Z   $ }vw����v F   $ /xyx >  $ 'z{z o   $ %���� 0 annotcomment annotComment{ m   % &��
�� 
msngy >  * -|}| o   * +���� 0 annotcomment annotComment} m   + ,~~ �  w k   2 y�� ��� l  2 2������  � f ` for the record's name, use any first-level heading (if there's one in the annotation's comment)   � ��� �   f o r   t h e   r e c o r d ' s   n a m e ,   u s e   a n y   f i r s t - l e v e l   h e a d i n g   ( i f   t h e r e ' s   o n e   i n   t h e   a n n o t a t i o n ' s   c o m m e n t )� ��� r   2 ?��� n  2 =��� I   7 =������� 40 markdownheadingsfromtext markdownHeadingsFromText� ��� o   7 8���� 0 annotcomment annotComment� ���� m   8 9�� ���  #��  ��  � o   2 7���� 0 keypointslib KeypointsLib� o      ���� $0 markdownheadings markdownHeadings� ��� Z   @ S������� >  @ D��� o   @ A���� $0 markdownheadings markdownHeadings� J   A C����  � r   G O��� n   G M��� o   K M���� 0 heading  � n   G K��� 4  H K���
�� 
cobj� m   I J���� � o   G H���� $0 markdownheadings markdownHeadings� o      ����  0 recordnamepart recordNamePart��  ��  � ��� l  T T��������  ��  ��  � ��� l  T T������  � H B otherwise, use up to 12 words from the beginning of the "comment"   � ��� �   o t h e r w i s e ,   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " c o m m e n t "� ���� Z   T y������� =  T W��� o   T U����  0 recordnamepart recordNamePart� m   U V�� ���  � k   Z u�� ��� r   Z g��� n  Z e��� I   _ e������� F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines� ��� o   _ `���� 0 annotcomment annotComment� ���� m   ` a��
�� boovtrue��  ��  � o   Z _���� 0 keypointslib KeypointsLib� o      ���� 0 annotcomment annotComment� ���� r   h u��� n  h s��� I   m s������� (0 firstwordsfromtext firstWordsFromText� ��� o   m n���� 0 annotcomment annotComment� ���� m   n o���� ��  ��  � o   h m���� 0 keypointslib KeypointsLib� o      ����  0 recordnamepart recordNamePart��  ��  ��  ��  ��  ��  u ��� l  ~ ~��������  ��  ��  � ��� l  ~ ~������  � E ? else use up to 12 words from the beginning of the "annotText"    � ��� ~   e l s e   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " a n n o t T e x t "  � ��� Z   ~ �������� =  ~ ���� o   ~ ����  0 recordnamepart recordNamePart� m    ��� ���  � k   � ��� ��� r   � ���� n  � ���� I   � �������� (0 firstwordsfromtext firstWordsFromText� ��� o   � ����� 0 	annottext 	annotText� ���� m   � ����� ��  ��  � o   � ����� 0 keypointslib KeypointsLib� o      ����  0 recordnamepart recordNamePart� ���� Z   � �������� >  � ���� o   � �����  0 recordnamepart recordNamePart� m   � ��� ���  � k   � ��� ��� l  � �������  � e _ wrap the extracted text in quotes to indicate that it's quoted text (and not your own comment)   � ��� �   w r a p   t h e   e x t r a c t e d   t e x t   i n   q u o t e s   t o   i n d i c a t e   t h a t   i t ' s   q u o t e d   t e x t   ( a n d   n o t   y o u r   o w n   c o m m e n t )� ���� r   � ���� b   � ���� b   � ���� m   � ��� ���  "� o   � �����  0 recordnamepart recordNamePart� m   � ��� ���  "� o      ����  0 recordnamepart recordNamePart��  ��  ��  ��  ��  ��  � ��� l  � ���������  ��  ��  � ��� Z  � �������� =  � ���� o   � �����  0 recordnamepart recordNamePart� m   � ��� ���  � r   � ���� m   � ��� �    ( u n t i t l e d )� o      ����  0 recordnamepart recordNamePart��  ��  �  s   � � o   � �����  0 recordnamepart recordNamePart n        ;   � � o   � ����� "0 recordnameparts recordNameParts  l  � ���������  ��  ��   	
	 Z   � ��� >  � � o   � ����� "0 recordnameparts recordNameParts J   � �����   r   � � n  � � I   � �������  0 mergetextitems mergeTextItems  o   � ����� "0 recordnameparts recordNameParts �� m   � � �  :  ��  ��   o   � ����� 0 keypointslib KeypointsLib o      ���� 0 
recordname 
recordName��   r   � � m   � � �  ( u n t i t l e d ) o      ���� 0 
recordname 
recordName
  l  � ���������  ��  ��    ��  L   � �!! o   � ����� 0 
recordname 
recordName��  G "#" l     ��������  ��  ��  # $%$ l     ��������  ��  ��  % &'& l     ��()��  ( U O Creates a new (Markdown) record in DEVONthink with the given text & properties   ) �** �   C r e a t e s   a   n e w   ( M a r k d o w n )   r e c o r d   i n   D E V O N t h i n k   w i t h   t h e   g i v e n   t e x t   &   p r o p e r t i e s' +,+ l     ��-.��  - [ U and returns it. If an existing record with the same URL exists at the same location,   . �// �   a n d   r e t u r n s   i t .   I f   a n   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   e x i s t s   a t   t h e   s a m e   l o c a t i o n ,, 010 l     ��23��  2 9 3 this record will get updated and returned instead.   3 �44 f   t h i s   r e c o r d   w i l l   g e t   u p d a t e d   a n d   r e t u r n e d   i n s t e a d .1 565 l     ��78��  7 _ Y Note that the actual return value is a list with two items with the first item being the   8 �99 �   N o t e   t h a t   t h e   a c t u a l   r e t u r n   v a l u e   i s   a   l i s t   w i t h   t w o   i t e m s   w i t h   t h e   f i r s t   i t e m   b e i n g   t h e6 :;: l     ��<=��  < Z T created/modified record and the second item being a boolean value indicating if the   = �>> �   c r e a t e d / m o d i f i e d   r e c o r d   a n d   t h e   s e c o n d   i t e m   b e i n g   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h e; ?@? l     ��AB��  A L F returned record actually has been modified ('true') or not (`false`):   B �CC �   r e t u r n e d   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) :@ DED l     �FG�  F "  `{dtRecord, didUpdateNote}`   G �HH 8   ` { d t R e c o r d ,   d i d U p d a t e N o t e } `E IJI l     �~KL�~  K 6 0 Credits: modified after script code by Rob Trew   L �MM `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e wJ NON l     �}PQ�}  P l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   Q �RR �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p tO STS i  =@UVU I      �|W�{�|  0 createdtrecord createDTRecordW XYX o      �z�z  0 folderlocation folderLocationY Z[Z o      �y�y  0 foldermetadata folderMetadata[ \]\ o      �x�x 0 
recordname 
recordName] ^_^ o      �w�w 0 recordaliases recordAliases_ `a` o      �v�v 0 	recordurl 	recordURLa bcb o      �u�u 0 
recordtags 
recordTagsc ded o      �t�t 0 	isflagged 	isFlaggede fgf o      �s�s 0 
recordtext 
recordTextg hih o      �r�r (0 recordcreationdate recordCreationDatei jkj o      �q�q 00 recordmodificationdate recordModificationDatek lml o      �p�p  0 recordmetadata recordMetadatam non o      �o�o 0 recordrating recordRatingo p�np o      �m�m $0 recordlabelindex recordLabelIndex�n  �{  V O    qrq k   ss tut r    vwv K    xx �lyz
�l 
DTtyy m   	 
�k
�k Ctypmkdnz �j{|
�j 
DTcn{ o    �i�i 0 
recordtext 
recordText| �h}�g
�h 
pnam} o    �f�f 0 
recordname 
recordName�g  w o      �e�e 0 newrecorddata newRecordDatau ~~ l   �d�c�b�d  �c  �b   ��� Z    %���a�`� >   ��� o    �_�_ (0 recordcreationdate recordCreationDate� m    �^
�^ 
msng� r    !��� b    ��� o    �]�] 0 newrecorddata newRecordData� K    �� �\��[
�\ 
DTcr� o    �Z�Z (0 recordcreationdate recordCreationDate�[  � o      �Y�Y 0 newrecorddata newRecordData�a  �`  � ��� l  & &�X�W�V�X  �W  �V  � ��� Z   & 8���U�T� >  & )��� o   & '�S�S 0 	recordurl 	recordURL� m   ' (�� ���  � r   , 4��� b   , 2��� o   , -�R�R 0 newrecorddata newRecordData� K   - 1�� �Q��P
�Q 
pURL� o   . /�O�O 0 	recordurl 	recordURL�P  � o      �N�N 0 newrecorddata newRecordData�U  �T  � ��� l  9 9�M�L�K�M  �L  �K  � ��� Z   9 K���J�I� >  9 <��� o   9 :�H�H 0 recordaliases recordAliases� m   : ;�� ���  � r   ? G��� b   ? E��� o   ? @�G�G 0 newrecorddata newRecordData� K   @ D�� �F��E
�F 
DTal� o   A B�D�D 0 recordaliases recordAliases�E  � o      �C�C 0 newrecorddata newRecordData�J  �I  � ��� l  L L�B�A�@�B  �A  �@  � ��� r   L O��� m   L M�?
�? 
msng� o      �>�> 0 arecord aRecord� ��� r   P S��� m   P Q�=
�= boovfals� o      �<�< 0 didcreatenote didCreateNote� ��� r   T Y��� m   T U�;
�; boovfals� o      �:�: 0 didupdatenote didUpdateNote� ��� l  Z Z�9�8�7�9  �8  �7  � ��� l  Z Z�6���6  � Q K use any existing record with the same URL that exists at the same location   � ��� �   u s e   a n y   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   t h a t   e x i s t s   a t   t h e   s a m e   l o c a t i o n� ��� r   Z _��� m   Z [�5
�5 boovfals� o      �4�4 $0 isexistingrecord isExistingRecord� ��� Z   ` ����3�2� >  ` c��� o   ` a�1�1 0 	recordurl 	recordURL� m   a b�� ���  � k   f ��� ��� r   f o��� I  f k�0��/
�0 .DTpacd49list       utxt� o   f g�.�. 0 	recordurl 	recordURL�/  � o      �-�- "0 existingrecords existingRecords� ��,� Z   p ����+�*� >  p v��� o   p s�)�) "0 existingrecords existingRecords� J   s u�(�(  � k   y ��� ��� r   y ���� b   y ���� b   y ���� n   y ~��� 1   z ~�'
�' 
DTlo� o   y z�&�&  0 folderlocation folderLocation� n   ~ ���� 1    ��%
�% 
pnam� o   ~ �$�$  0 folderlocation folderLocation� m   � ��� ���  /� o      �#�#  0 targetlocation targetLocation� ��"� X   � ���!�� Z   � ���� �� F   � ���� l  � ����� =  � ���� o   � ��� 0 arecord aRecord� m   � ��
� 
msng�  �  � l  � ����� =   � ���� n   � ���� 1   � ��
� 
DTlo� o   � ���  0 existingrecord existingRecord� o   � ���  0 targetlocation targetLocation�  �  � k   � ��� ��� r   � ���� o   � ���  0 existingrecord existingRecord� o      �� 0 arecord aRecord� ��� r   � ���� m   � ��
� boovtrue� o      �� $0 isexistingrecord isExistingRecord�  �   �  �!  0 existingrecord existingRecord� o   � ��� "0 existingrecords existingRecords�"  �+  �*  �,  �3  �2  � ��� l  � �����  �  �  �    Z   ��� =  � � o   � ��
�
 0 arecord aRecord m   � ��	
�	 
msng k   �  r   � �	
	 I  � ��
� .DTpacd08DTrc       reco o   � ��� 0 newrecorddata newRecordData ��
� 
DTin o   � ���  0 folderlocation folderLocation�  
 o      �� 0 arecord aRecord  l  � ���� �  �  �     l  � �����   c ] newly created Markdown notes inherit their notes folder's existing metadata & Finder comment    � �   n e w l y   c r e a t e d   M a r k d o w n   n o t e s   i n h e r i t   t h e i r   n o t e s   f o l d e r ' s   e x i s t i n g   m e t a d a t a   &   F i n d e r   c o m m e n t  r   � � b   � � o   � �����  0 recordmetadata recordMetadata o   � �����  0 foldermetadata folderMetadata o      ����  0 recordmetadata recordMetadata  r   � � n  � �  1   � ���
�� 
DTco  o   � �����  0 folderlocation folderLocation n     !"! 1   � ���
�� 
DTco" o   � ����� 0 arecord aRecord #$# l  � ���������  ��  ��  $ %&% r   � �'(' m   � ���
�� boovtrue( o      ���� 0 didcreatenote didCreateNote& )��) r   �*+* [   �,-, o   ����� &0 creatednotescount createdNotesCount- m  ���� + o      ���� &0 creatednotescount createdNotesCount��  �  �   ./. l ��������  ��  ��  / 010 Z  23����2 G  #454 = 676 o  ���� $0 isexistingrecord isExistingRecord7 m  ��
�� boovfals5 = 898 o  ���� *0 updateexistingnotes updateExistingNotes9 m  ��
�� boovtrue3 k  &:: ;<; Z  &K=>����= = &-?@? o  &+���� 80 updatenameforexistingnotes updateNameForExistingNotes@ m  +,��
�� boovtrue> Z  0GAB����A >  05CDC n  03EFE 1  13��
�� 
pnamF o  01���� 0 arecord aRecordD o  34���� 0 
recordname 
recordNameB k  8CGG HIH r  8=JKJ m  89��
�� boovtrueK o      ���� 0 didupdatenote didUpdateNoteI L��L r  >CMNM o  >?���� 0 
recordname 
recordNameN n      OPO 1  @B��
�� 
pnamP o  ?@���� 0 arecord aRecord��  ��  ��  ��  ��  < QRQ l LL��������  ��  ��  R STS Z  LuUV����U = LSWXW o  LQ���� F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotesX m  QR��
�� boovtrueV Z  VqYZ����Y >  V][\[ n  V[]^] 1  W[��
�� 
DTpl^ o  VW���� 0 arecord aRecord\ o  [\���� 0 
recordtext 
recordTextZ k  `m__ `a` r  `ebcb m  `a��
�� boovtruec o      ���� 0 didupdatenote didUpdateNotea d��d r  fmefe o  fg���� 0 
recordtext 
recordTextf n      ghg 1  hl��
�� 
DTplh o  gh���� 0 arecord aRecord��  ��  ��  ��  ��  T iji l vv��������  ��  ��  j klk Z  v�mn����m F  v�opo l v�q����q G  v�rsr = v{tut o  vy���� $0 isexistingrecord isExistingRecordu m  yz��
�� boovfalss = ~�vwv o  ~����� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotesw m  ����
�� boovtrue��  ��  p > ��xyx o  ������ 00 recordmodificationdate recordModificationDatey m  ����
�� 
msngn k  ��zz {|{ l ����}~��  } j d TODO: should we force update recordModificationDate when an existing record's property got updated?   ~ � �   T O D O :   s h o u l d   w e   f o r c e   u p d a t e   r e c o r d M o d i f i c a t i o n D a t e   w h e n   a n   e x i s t i n g   r e c o r d ' s   p r o p e r t y   g o t   u p d a t e d ?| ���� Z  ��������� >  ����� n  ����� 1  ����
�� 
DTmo� o  ������ 0 arecord aRecord� o  ������ 00 recordmodificationdate recordModificationDate� k  ���� ��� r  ����� m  ����
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote� ���� r  ����� o  ������ 00 recordmodificationdate recordModificationDate� n      ��� 1  ����
�� 
DTmo� o  ������ 0 arecord aRecord��  ��  ��  ��  ��  ��  l ��� l ����������  ��  ��  � ��� Z  ��������� G  ����� = ����� o  ������ $0 isexistingrecord isExistingRecord� m  ����
�� boovfals� = ����� o  ������ J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes� m  ����
�� boovtrue� Z  ��������� >  ����� n  ����� 1  ����
�� 
DTst� o  ������ 0 arecord aRecord� o  ������ 0 	isflagged 	isFlagged� k  ���� ��� r  ����� m  ����
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote� ���� r  ����� o  ������ 0 	isflagged 	isFlagged� n      ��� 1  ����
�� 
DTst� o  ������ 0 arecord aRecord��  ��  ��  ��  ��  � ��� l ����������  ��  ��  � ��� Z  �!������� G  ����� = ����� o  ������ $0 isexistingrecord isExistingRecord� m  ����
�� boovfals� = ����� o  ������ <0 updateratingforexistingnotes updateRatingForExistingNotes� m  ����
�� boovtrue� Z  ������� >  	��� n  ��� 1  ��
�� 
DTrt� o  ���� 0 arecord aRecord� o  ���� 0 recordrating recordRating� k  �� ��� r  ��� m  ��
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote� ���� r  ��� o  ���� 0 recordrating recordRating� n      ��� 1  ��
�� 
DTrt� o  ���� 0 arecord aRecord��  ��  ��  ��  ��  � ��� l ""��������  ��  ��  � ��� Z  "W����~� G  "5��� = "'��� o  "%�}�} $0 isexistingrecord isExistingRecord� m  %&�|
�| boovfals� = *1��� o  */�{�{ :0 updatelabelforexistingnotes updateLabelForExistingNotes� m  /0�z
�z boovtrue� Z  8S���y�x� >  8?��� n  8=��� 1  9=�w
�w 
DTla� o  89�v�v 0 arecord aRecord� o  =>�u�u $0 recordlabelindex recordLabelIndex� k  BO�� ��� r  BG��� m  BC�t
�t boovtrue� o      �s�s 0 didupdatenote didUpdateNote� ��r� r  HO��� o  HI�q�q $0 recordlabelindex recordLabelIndex� n      ��� 1  JN�p
�p 
DTla� o  IJ�o�o 0 arecord aRecord�r  �y  �x  �  �~  � ��� l XX�n�m�l�n  �m  �l  � ��� Z  X����k�j� F  Xv��� l Xk��i�h� G  Xk��� = X]��� o  X[�g�g $0 isexistingrecord isExistingRecord� m  [\�f
�f boovfals� = `g��� o  `e�e�e 80 updatetagsforexistingnotes updateTagsForExistingNotes� m  ef�d
�d boovtrue�i  �h  � > nr��� o  no�c�c 0 
recordtags 
recordTags� J  oq�b�b  � k  y��� ��� r  y���� n  y~��� 1  z~�a
�a 
tags� o  yz�`�` 0 arecord aRecord� o      �_�_ (0 existingrecordtags existingRecordTags� ��� X  ����^ � Z ���]�\ H  �� E �� o  ���[�[ (0 existingrecordtags existingRecordTags o  ���Z�Z 0 atag aTag r  �� m  ���Y
�Y boovtrue o      �X�X 0 didupdatenote didUpdateNote�]  �\  �^ 0 atag aTag  o  ���W�W 0 
recordtags 
recordTags� �V r  ��	
	 b  �� o  ���U�U (0 existingrecordtags existingRecordTags o  ���T�T 0 
recordtags 
recordTags
 n       1  ���S
�S 
tags o  ���R�R 0 arecord aRecord�V  �k  �j  �  l ���Q�P�O�Q  �P  �O    Z  ���N�M l ���L�K G  �� = �� o  ���J�J $0 isexistingrecord isExistingRecord m  ���I
�I boovfals = �� o  ���H�H L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes m  ���G
�G boovtrue�L  �K   Z  ���F�E l ���D�C n ��  I  ���B!�A�B 60 updatemetadatafordtrecord updateMetadataForDTRecord! "#" o  ���@�@ 0 arecord aRecord# $�?$ o  ���>�>  0 recordmetadata recordMetadata�?  �A     f  ���D  �C   r  ��%&% m  ���=
�= boovtrue& o      �<�< 0 didupdatenote didUpdateNote�F  �E  �N  �M   '(' l ���;�:�9�;  �:  �9  ( )�8) Z  �*+�7�6* F  ��,-, = ��./. o  ���5�5 0 didupdatenote didUpdateNote/ m  ���4
�4 boovtrue- = ��010 o  ���3�3 0 didcreatenote didCreateNote1 m  ���2
�2 boovfals+ r  232 [  454 o  �1�1 &0 updatednotescount updatedNotesCount5 m  �0�0 3 o      �/�/ &0 updatednotescount updatedNotesCount�7  �6  �8  ��  ��  1 676 l �.�-�,�.  �-  �,  7 8�+8 L  99 J  :: ;<; o  �*�* 0 arecord aRecord< =�)= o  �(�( 0 didupdatenote didUpdateNote�)  �+  r 5     �'>�&
�' 
capp> m    ?? �@@  D N t p
�& kfrmID  T ABA l     �%�$�#�%  �$  �#  B CDC l     �"�!� �"  �!  �   D EFE l     �GH�  G > 8 Sets the custom metadata of the given DEVONthink group.   H �II p   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .F JKJ l     �LM�  L U O @param folderLocation The DEVONthink group whose custom metadata shall be set.   M �NN �   @ p a r a m   f o l d e r L o c a t i o n   T h e   D E V O N t h i n k   g r o u p   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .K OPO l     �QR�  Q M G @param folderMetadata The record of custom metadata that shall be set.   R �SS �   @ p a r a m   f o l d e r M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .P TUT i  ADVWV I      �X�� 00 setmetadatafordtfolder setMetadataForDTFolderX YZY o      ��  0 folderlocation folderLocationZ [�[ o      ��  0 foldermetadata folderMetadata�  �  W Z     5\]��\ F      ^_^ F     `a` F     bcb =    ded o     �� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolderse m    �
� boovtruec >  
 fgf o   
 ��  0 folderlocation folderLocationg m    �
� 
msnga >   hih o    ��  0 foldermetadata folderMetadatai m    �
� 
msng_ >   jkj o    ��  0 foldermetadata folderMetadatak J    ��  ] O  # 1lml r   + 0non o   + ,��  0 foldermetadata folderMetadatao n      pqp 1   - /�
� 
DTcmq o   , -��  0 folderlocation folderLocationm 5   # (�
r�	
�
 
cappr m   % &ss �tt  D N t p
�	 kfrmID  �  �  U uvu l     ����  �  �  v wxw l     ����  �  �  x yzy l     �{|�  { ? 9 Sets the custom metadata of the given DEVONthink record.   | �}} r   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .z ~~ l     ����  � O I @param aRecord The DEVONthink record whose custom metadata shall be set.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t . ��� l     � ���   � M G @param recordMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  EH��� I      ������� 00 setmetadatafordtrecord setMetadataForDTRecord� ��� o      ���� 0 arecord aRecord� ���� o      ����  0 recordmetadata recordMetadata��  ��  � Z     )������� F     ��� F     ��� >    ��� o     ���� 0 arecord aRecord� m    ��
�� 
msng� >   	��� o    ����  0 recordmetadata recordMetadata� m    ��
�� 
msng� >   ��� o    ����  0 recordmetadata recordMetadata� J    ����  � O   %��� r    $��� o     ����  0 recordmetadata recordMetadata� n      ��� 1   ! #��
�� 
DTcm� o     !���� 0 arecord aRecord� 5    �����
�� 
capp� m    �� ���  D N t p
�� kfrmID  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � l f Updates the custom metadata of the given DEVONthink record. Returns a boolean value indicating if the   � ��� �   U p d a t e s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h e� ��� l     ������  � I C given record actually has been modified ('true') or not (`false`).   � ��� �   g i v e n   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) .� ��� l     ������  � S M @param aRecord The DEVONthink record whose custom metadata shall be updated.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   u p d a t e d .� ��� l     ������  � M G @param recordMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  IL��� I      ������� 60 updatemetadatafordtrecord updateMetadataForDTRecord� ��� o      ���� 0 arecord aRecord� ���� o      ����  0 recordmetadata recordMetadata��  ��  � k     ��� ��� Z    ������� G     ��� G     ��� =    ��� o     ���� 0 arecord aRecord� m    ��
�� 
msng� =   	��� o    ����  0 recordmetadata recordMetadata� m    ��
�� 
msng� =   ��� o    ����  0 recordmetadata recordMetadata� J    ����  � L    �� m    ��
�� boovfals��  ��  � ��� l   ��������  ��  ��  � ��� r    !��� m    ��
�� boovfals� o      ���� 0 didupdatenote didUpdateNote� ��� l  " "��������  ��  ��  � ��� O   " ���� k   * ��� ��� r   * /��� n   * -��� 1   + -��
�� 
DTcm� o   * +���� 0 arecord aRecord� o      ���� 00 existingrecordmetadata existingRecordMetadata� ��� Q   0 M���� k   3 A�� ��� l  3 3������  � Y S existingRecordMetadata may be undefined in which case this triggers the error case   � ��� �   e x i s t i n g R e c o r d M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e� ���� Z  3 A������� =  3 6��� o   3 4���� 00 existingrecordmetadata existingRecordMetadata� m   4 5��
�� 
msng� r   9 =��� J   9 ;����  � o      ���� 00 existingrecordmetadata existingRecordMetadata��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r   I M��� J   I K����  � o      ���� 00 existingrecordmetadata existingRecordMetadata� ��� l  N N��������  ��  ��  � ��� Z   N � ����  >  N R o   N O���� 00 existingrecordmetadata existingRecordMetadata J   O Q����   k   U �  r   U a n  U _	
	 I   Z _������ 0 keysofrecord_ keysOfRecord_ �� o   Z [���� 00 existingrecordmetadata existingRecordMetadata��  ��  
 o   U Z���� 0 keypointslib KeypointsLib o      ���� 0 existingkeys existingKeys  r   b n n  b l I   g l������ 0 keysofrecord_ keysOfRecord_ �� o   g h����  0 recordmetadata recordMetadata��  ��   o   b g���� 0 keypointslib KeypointsLib o      ���� 0 thekeys theKeys  l  o o��������  ��  ��    l  o o����   � � NOTE: updating non-empty values for existing keys doesn't seem to work unless we clear the key's value or remove the key entirely    �   N O T E :   u p d a t i n g   n o n - e m p t y   v a l u e s   f o r   e x i s t i n g   k e y s   d o e s n ' t   s e e m   t o   w o r k   u n l e s s   w e   c l e a r   t h e   k e y ' s   v a l u e   o r   r e m o v e   t h e   k e y   e n t i r e l y  X   o ��� k    �   !"! r    �#$# n   �%&% I   � ���'���� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName' (��( o   � ����� 0 thekey theKey��  ��  &  f    �$ o      ���� 0 dtkey dtKey" )*) l  � ���������  ��  ��  * +��+ Z   � �,-��., E  � �/0/ o   � ����� 0 existingkeys existingKeys0 o   � ����� 0 dtkey dtKey- k   � �11 232 r   � �454 l  � �6����6 n  � �787 I   � ���9���� .0 valueforkey_inrecord_ valueForKey_inRecord_9 :;: o   � ����� 0 thekey theKey; <��< o   � �����  0 recordmetadata recordMetadata��  ��  8 o   � ����� 0 keypointslib KeypointsLib��  ��  5 o      ���� 0 thevalue theValue3 =>= r   � �?@? l  � �A����A n  � �BCB I   � ���D���� .0 valueforkey_inrecord_ valueForKey_inRecord_D EFE o   � ����� 0 dtkey dtKeyF G��G o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  C o   � ����� 0 keypointslib KeypointsLib��  ��  @ o      ���� 0 existingvalue existingValue> HIH l  � ���������  ��  ��  I J��J Z   � �KL����K >   � �MNM o   � ����� 0 thevalue theValueN o   � ����� 0 existingvalue existingValueL k   � �OO PQP r   � �RSR m   � ��
� boovtrueS o      �~�~ 0 didupdatenote didUpdateNoteQ T�}T r   � �UVU l  � �W�|�{W n  � �XYX I   � ��zZ�y�z 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_Z [\[ l  � �]�x�w] m   � ��v
�v 
msng�x  �w  \ ^_^ o   � ��u�u 0 dtkey dtKey_ `�t` o   � ��s�s 00 existingrecordmetadata existingRecordMetadata�t  �y  Y o   � ��r�r 0 keypointslib KeypointsLib�|  �{  V o      �q�q 00 existingrecordmetadata existingRecordMetadata�}  ��  ��  ��  ��  . r   � �aba m   � ��p
�p boovtrueb o      �o�o 0 didupdatenote didUpdateNote��  �� 0 thekey theKey o   r s�n�n 0 thekeys theKeys cdc l  � ��m�l�k�m  �l  �k  d e�je r   � �fgf n  � �hih I   � ��ij�h�i <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_j klk o   � ��g�g  0 recordmetadata recordMetadatal m�fm o   � ��e�e 00 existingrecordmetadata existingRecordMetadata�f  �h  i o   � ��d�d 0 keypointslib KeypointsLibg o      �c�c  0 recordmetadata recordMetadata�j  ��  ��  � non l  � ��b�a�`�b  �a  �`  o p�_p r   � �qrq o   � ��^�^  0 recordmetadata recordMetadatar n      sts 1   � ��]
�] 
DTcmt o   � ��\�\ 0 arecord aRecord�_  � 5   " '�[u�Z
�[ 
cappu m   $ %vv �ww  D N t p
�Z kfrmID  � xyx l  � ��Y�X�W�Y  �X  �W  y z�Vz L   � �{{ o   � ��U�U 0 didupdatenote didUpdateNote�V  � |}| l     �T�S�R�T  �S  �R  } ~~ l     �Q�P�O�Q  �P  �O   ��� l     �N���N  � [ U Returns the metadata identifier name that DEVONthink would use in scripting contexts   � ��� �   R e t u r n s   t h e   m e t a d a t a   i d e n t i f i e r   n a m e   t h a t   D E V O N t h i n k   w o u l d   u s e   i n   s c r i p t i n g   c o n t e x t s� ��� l     �M���M  �   for the given key name.   � ��� 0   f o r   t h e   g i v e n   k e y   n a m e .� ��� i  MP��� I      �L��K�L F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName� ��J� o      �I�I 0 thekey theKey�J  �K  � k      �� ��� r     ��� n    
��� I    
�H��G�H 0 lowercasetext lowercaseText� ��F� o    �E�E 0 thekey theKey�F  �G  � o     �D�D 0 keypointslib KeypointsLib� o      �C�C 0 dtkey dtKey� ��� r    ��� n   ��� I    �B��A�B 0 regexreplace regexReplace� ��� o    �@�@ 0 dtkey dtKey� ��� m    �� ���  \ s +� ��?� m    �� ���  �?  �A  � o    �>�> 0 keypointslib KeypointsLib� o      �=�= 0 dtkey dtKey� ��� l   �<�;�:�<  �;  �:  � ��9� L     �� b    ��� m    �� ���  m d� o    �8�8 0 dtkey dtKey�9  � ��� l     �7�6�5�7  �6  �5  � ��� l     �4�3�2�4  �3  �2  � ��� l     �1���1  � T N Appends the given string to the Finder comment of the given DEVONthink group.   � ��� �   A p p e n d s   t h e   g i v e n   s t r i n g   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .� ��� i  QT��� I      �0��/�0 60 appendtocommentofdtfolder appendToCommentOfDTFolder� ��� o      �.�.  0 folderlocation folderLocation� ��-� o      �,�, 0 foldercomment folderComment�-  �/  � Z     T���+�*� F     ��� >    ��� o     �)�) 0 foldercomment folderComment� m    �(
�( 
msng� >   
��� o    �'�' 0 foldercomment folderComment� J    	�&�&  � k    P�� ��� r    ��� J    �%�%  � o      �$�$ 0 commentparts commentParts� ��#� O    P��� k    O�� ��� r    !��� l   ��"�!� n    ��� 1    � 
�  
DTco� o    ��  0 folderlocation folderLocation�"  �!  � o      �� .0 existingfoldercomment existingFolderComment� ��� Z  " 8����� F   " -��� >  " %��� o   " #�� .0 existingfoldercomment existingFolderComment� m   # $�
� 
msng� >  ( +��� o   ( )�� .0 existingfoldercomment existingFolderComment� m   ) *�� ���  � s   0 4��� o   0 1�� .0 existingfoldercomment existingFolderComment� n      ���  ;   2 3� o   1 2�� 0 commentparts commentParts�  �  � ��� s   9 =��� o   9 :�� 0 foldercomment folderComment� n      ���  ;   ; <� o   : ;�� 0 commentparts commentParts� ��� l  > >����  �  �  � ��� r   > O��� n  > K��� I   C K����  0 mergetextitems mergeTextItems� ��� o   C D�� 0 commentparts commentParts� ��� b   D G��� 1   D E�
� 
lnfd� 1   E F�
� 
lnfd�  �  � o   > C�
�
 0 keypointslib KeypointsLib� n      ��� 1   L N�	
�	 
DTco� o   K L��  0 folderlocation folderLocation�  � 5    ���
� 
capp� m       �  D N t p
� kfrmID  �#  �+  �*  �  l     ����  �  �    l     ��� �  �  �     l     ��	��   c ] Returns a record of bibliographic metadata for the given DOI (as fetched from OpenAlex.org),   	 �

 �   R e t u r n s   a   r e c o r d   o f   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   g i v e n   D O I   ( a s   f e t c h e d   f r o m   O p e n A l e x . o r g ) ,  l     ����   9 3 ready to be used as custom metadata in DEVONthink.    � f   r e a d y   t o   b e   u s e d   a s   c u s t o m   m e t a d a t a   i n   D E V O N t h i n k .  l     ����   L F @param doi The DOI for which bibliographic metadata shall be fetched.    � �   @ p a r a m   d o i   T h e   D O I   f o r   w h i c h   b i b l i o g r a p h i c   m e t a d a t a   s h a l l   b e   f e t c h e d .  l     ����   ` Z @param citekey The citekey to be used with the fetched BibTeX data; may be empty in which    � �   @ p a r a m   c i t e k e y   T h e   c i t e k e y   t o   b e   u s e d   w i t h   t h e   f e t c h e d   B i b T e X   d a t a ;   m a y   b e   e m p t y   i n   w h i c h  l     ����   + % case a default citekey will be used.    � J   c a s e   a   d e f a u l t   c i t e k e y   w i l l   b e   u s e d .   l     ��!"��  ! ` Z TODO: allow to specify which metadata shall get exported into which custom metadata field   " �## �   T O D O :   a l l o w   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l d  $%$ i  UX&'& I      ��(���� &0 bibmetadatafordoi bibMetadataForDOI( )*) o      ���� 0 doi  * +��+ o      ���� 0 citekey  ��  ��  ' k    ,, -.- Z    /0����/ G     121 =    343 o     ���� 0 doi  4 m    ��
�� 
msng2 =   	565 o    ���� 0 doi  6 m    77 �88  0 L    99 J    ����  ��  ��  . :;: l   ��������  ��  ��  ; <=< r    />?> n   -@A@ I    -��B����  0 metadatafordoi metadataForDOIB CDC o    ���� 0 doi  D EFE o    !���� 0 fetchbibtex fetchBibTeXF GHG o   ! &���� 00 fetchformattedcitation fetchFormattedCitationH IJI m   & 'KK �LL  a p aJ MNM m   ' (OO �PP 
 e n - G BN Q��Q o   ( )���� 0 citekey  ��  ��  A o    ���� 0 keypointslib KeypointsLib? o      ���� "0 publicationdata publicationData= RSR Z  0 >TU����T =  0 4VWV o   0 1���� "0 publicationdata publicationDataW J   1 3����  U L   7 :XX J   7 9����  ��  ��  S YZY l  ? ?��������  ��  ��  Z [\[ r   ? C]^] J   ? A����  ^ o      ���� 0 bibmetadata bibMetadata\ _`_ l  D D��������  ��  ��  ` aba l  D Qcdec r   D Qfgf n  D Ohih I   I O��j���� .0 valueforkey_inrecord_ valueForKey_inRecord_j klk m   I Jmm �nn  a u t h o r sl o��o o   J K���� "0 publicationdata publicationData��  ��  i o   D I���� 0 keypointslib KeypointsLibg o      ���� 0 
pubauthors 
pubAuthorsd 4 . single author: string, multiple authors: list   e �pp \   s i n g l e   a u t h o r :   s t r i n g ,   m u l t i p l e   a u t h o r s :   l i s tb qrq Z   R �st����s F   R fuvu F   R ]wxw >  R Uyzy o   R S���� 0 
pubauthors 
pubAuthorsz m   S T��
�� 
msngx >  X [{|{ o   X Y���� 0 
pubauthors 
pubAuthors| m   Y Z}} �~~  v >  ` d� o   ` a���� 0 
pubauthors 
pubAuthors� J   a c����  t k   i ��� ��� r   i {��� b   i y��� o   i j���� 0 bibmetadata bibMetadata� K   j x�� ������� 0 authors  � l  k v������ n  k v��� I   p v�������  0 mergetextitems mergeTextItems� ��� o   p q���� 0 
pubauthors 
pubAuthors� ���� 1   q r��
�� 
lnfd��  ��  � o   k p���� 0 keypointslib KeypointsLib��  ��  ��  � o      ���� 0 bibmetadata bibMetadata� ��� l  | |��������  ��  ��  � ��� r   | ���� I  | ������
�� .corecnte****       ****� o   | }���� 0 
pubauthors 
pubAuthors��  � o      ���� "0 pubauthorscount pubAuthorsCount� ���� Z   � ������ =  � ���� o   � ����� "0 pubauthorscount pubAuthorsCount� m   � ����� � r   � ���� b   � ���� o   � ����� 0 bibmetadata bibMetadata� K   � ��� ������� 
0 author  � n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors��  � o      ���� 0 bibmetadata bibMetadata� ��� =  � ���� o   � ����� "0 pubauthorscount pubAuthorsCount� m   � ����� � ���� r   � ���� b   � ���� o   � ����� 0 bibmetadata bibMetadata� K   � ��� ������� 
0 author  � b   � ���� b   � ���� n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors� m   � ��� ���    &  � n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors��  � o      ���� 0 bibmetadata bibMetadata��  � l  � ����� r   � ���� b   � ���� o   � ����� 0 bibmetadata bibMetadata� K   � ��� ������� 
0 author  � b   � ���� n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors� m   � ��� ���    e t   a l .��  � o      ���� 0 bibmetadata bibMetadata�  
 3 or more   � ���    3   o r   m o r e��  ��  ��  r ��� l  � ���������  ��  ��  � ��� r   � ���� n  � ���� I   � �������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m   � ��� ���  d a t e� ���� o   � ����� "0 publicationdata publicationData��  ��  � o   � ����� 0 keypointslib KeypointsLib� o      ���� 0 pubdate pubDate� ��� Z  � �������� >  � ���� o   � ����� 0 pubdate pubDate� m   � ���
�� 
msng� r   � ���� b   � ���� o   � ����� 0 bibmetadata bibMetadata� K   � ��� ������� 0 date  � c   � ���� o   � ����� 0 pubdate pubDate� m   � ���
�� 
ldt ��  � o      ���� 0 bibmetadata bibMetadata��  ��  � ��� l  � ���������  ��  ��  � ��� r   ���� n  � ���� I   � �������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m   � ��� ���  p u b l i s h e r� ��� o   � ��~�~ "0 publicationdata publicationData�  ��  � o   � ��}�} 0 keypointslib KeypointsLib� o      �|�| 0 pubpublisher pubPublisher� ��� Z  ���{�z� F  ��� >    o  �y�y 0 pubpublisher pubPublisher m  �x
�x 
msng� >  o  	�w�w 0 pubpublisher pubPublisher m  	 �  � r   b  	 o  �v�v 0 bibmetadata bibMetadata	 K  

 �u�t�u 0 	publisher   o  �s�s 0 pubpublisher pubPublisher�t   o      �r�r 0 bibmetadata bibMetadata�{  �z  �  l !!�q�p�o�q  �p  �o    r  !0 n !. I  &.�n�m�n .0 valueforkey_inrecord_ valueForKey_inRecord_  m  &) �  i s s n �l o  )*�k�k "0 publicationdata publicationData�l  �m   o  !&�j�j 0 keypointslib KeypointsLib o      �i�i 0 pubissn pubISSN  Z 1O�h�g F  1> > 14 !  o  12�f�f 0 pubissn pubISSN! m  23�e
�e 
msng > 7<"#" o  78�d�d 0 pubissn pubISSN# m  8;$$ �%%   r  AK&'& b  AI()( o  AB�c�c 0 bibmetadata bibMetadata) K  BH** �b+�a�b 0 is?n  + o  EF�`�` 0 pubissn pubISSN�a  ' o      �_�_ 0 bibmetadata bibMetadata�h  �g   ,-, l PP�^�]�\�^  �]  �\  - ./. r  P_010 n P]232 I  U]�[4�Z�[ .0 valueforkey_inrecord_ valueForKey_inRecord_4 565 m  UX77 �88  j o u r n a l6 9�Y9 o  XY�X�X "0 publicationdata publicationData�Y  �Z  3 o  PU�W�W 0 keypointslib KeypointsLib1 o      �V�V 0 
pubjournal 
pubJournal/ :;: Z `~<=�U�T< F  `m>?> > `c@A@ o  `a�S�S 0 
pubjournal 
pubJournalA m  ab�R
�R 
msng? > fkBCB o  fg�Q�Q 0 
pubjournal 
pubJournalC m  gjDD �EE  = r  pzFGF b  pxHIH o  pq�P�P 0 bibmetadata bibMetadataI K  qwJJ �OK�N�O 0 journal  K o  tu�M�M 0 
pubjournal 
pubJournal�N  G o      �L�L 0 bibmetadata bibMetadata�U  �T  ; LML l �K�J�I�K  �J  �I  M NON r  �PQP n �RSR I  ���HT�G�H .0 valueforkey_inrecord_ valueForKey_inRecord_T UVU m  ��WW �XX  v o l u m eV Y�FY o  ���E�E "0 publicationdata publicationData�F  �G  S o  ��D�D 0 keypointslib KeypointsLibQ o      �C�C 0 	pubvolume 	pubVolumeO Z[Z r  ��\]\ n ��^_^ I  ���B`�A�B .0 valueforkey_inrecord_ valueForKey_inRecord_` aba m  ��cc �dd 
 i s s u eb e�@e o  ���?�? "0 publicationdata publicationData�@  �A  _ o  ���>�> 0 keypointslib KeypointsLib] o      �=�= 0 pubissue pubIssue[ fgf Z  ��hi�<�;h F  ��jkj > ��lml o  ���:�: 0 	pubvolume 	pubVolumem m  ���9
�9 
msngk > ��non o  ���8�8 0 	pubvolume 	pubVolumeo m  ��pp �qq  i k  ��rr sts Z ��uv�7�6u F  ��wxw > ��yzy o  ���5�5 0 pubissue pubIssuez m  ���4
�4 
msngx > ��{|{ o  ���3�3 0 pubissue pubIssue| m  ��}} �~~  v r  ��� b  ����� b  ����� b  ����� o  ���2�2 0 	pubvolume 	pubVolume� m  ���� ���  (� o  ���1�1 0 pubissue pubIssue� m  ���� ���  )� o      �0�0 0 	pubvolume 	pubVolume�7  �6  t ��/� r  ����� b  ����� o  ���.�. 0 bibmetadata bibMetadata� K  ���� �-��,�- 
0 volume  � o  ���+�+ 0 	pubvolume 	pubVolume�,  � o      �*�* 0 bibmetadata bibMetadata�/  �<  �;  g ��� l ���)�(�'�)  �(  �'  � ��� r  ����� n ����� I  ���&��%�& .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  p a g e� ��$� o  ���#�# "0 publicationdata publicationData�$  �%  � o  ���"�" 0 keypointslib KeypointsLib� o      �!�! 0 pubpages pubPages� ��� Z ���� �� F  ����� > ����� o  ���� 0 pubpages pubPages� m  ���
� 
msng� > ����� o  ���� 0 pubpages pubPages� m  ���� ���  � r   
��� b   ��� o   �� 0 bibmetadata bibMetadata� K  �� ���� 0 page  � o  �� 0 pubpages pubPages�  � o      �� 0 bibmetadata bibMetadata�   �  � ��� l ����  �  �  � ��� r  ��� n ��� I  ���� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  �� ���  c i t a t i o n� ��� o  �� "0 publicationdata publicationData�  �  � o  �� 0 keypointslib KeypointsLib� o      �� 0 pubcitation pubCitation� ��� Z =����� F  ,��� > "��� o   �� 0 pubcitation pubCitation� m   !�

�
 
msng� > %*��� o  %&�	�	 0 pubcitation pubCitation� m  &)�� ���  � r  /9��� b  /7��� o  /0�� 0 bibmetadata bibMetadata� K  06�� ���� 0 	reference  � o  34�� 0 pubcitation pubCitation�  � o      �� 0 bibmetadata bibMetadata�  �  � ��� l >>����  �  �  � ��� r  >M��� n >K��� I  CK� ����  .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  CF�� ���  b i b t e x� ���� o  FG���� "0 publicationdata publicationData��  ��  � o  >C���� 0 keypointslib KeypointsLib� o      ���� 0 	pubbibtex 	pubBibTeX� ��� Z Nl������� F  N[��� > NQ��� o  NO���� 0 	pubbibtex 	pubBibTeX� m  OP��
�� 
msng� > TY��� o  TU���� 0 	pubbibtex 	pubBibTeX� m  UX�� ���  � r  ^h��� b  ^f��� o  ^_���� 0 bibmetadata bibMetadata� K  _e�� ������� 
0 bibtex  � o  bc���� 0 	pubbibtex 	pubBibTeX��  � o      ���� 0 bibmetadata bibMetadata��  ��  � ��� l mm��������  ��  ��  � ��� r  m|��� n mz��� I  rz������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ru�� ���  u r l� ���� o  uv���� "0 publicationdata publicationData��  ��  � o  mr���� 0 keypointslib KeypointsLib� o      ���� 0 publink pubLink�    Z }����� F  }� > }� o  }~���� 0 publink pubLink m  ~��
�� 
msng > ��	 o  ������ 0 publink pubLink	 m  ��

 �   r  �� b  �� o  ������ 0 bibmetadata bibMetadata K  �� ������ 0 link   o  ������ 0 publink pubLink��   o      ���� 0 bibmetadata bibMetadata��  ��    l ����������  ��  ��    r  �� n �� I  �������� .0 valueforkey_inrecord_ valueForKey_inRecord_  m  �� �  p m i d �� o  ������ "0 publicationdata publicationData��  ��   o  ������ 0 keypointslib KeypointsLib o      ���� 0 pubpmid pubPMID  !  Z ��"#����" F  ��$%$ > ��&'& o  ������ 0 pubpmid pubPMID' m  ����
�� 
msng% > ��()( o  ������ 0 pubpmid pubPMID) m  ��** �++  # r  ��,-, b  ��./. o  ������ 0 bibmetadata bibMetadata/ K  ��00 ��1���� 0 pmid  1 o  ������ 0 pubpmid pubPMID��  - o      ���� 0 bibmetadata bibMetadata��  ��  ! 232 l ����������  ��  ��  3 454 r  ��676 n ��898 I  ����:���� .0 valueforkey_inrecord_ valueForKey_inRecord_: ;<; m  ��== �>> 
 p m c i d< ?��? o  ������ "0 publicationdata publicationData��  ��  9 o  ������ 0 keypointslib KeypointsLib7 o      ���� 0 pubpmcid pubPMCID5 @A@ Z �	BC����B F  ��DED > ��FGF o  ������ 0 pubpmcid pubPMCIDG m  ����
�� 
msngE > ��HIH o  ������ 0 pubpmcid pubPMCIDI m  ��JJ �KK  C r  �LML b  �NON o  ������ 0 bibmetadata bibMetadataO K  �PP ��Q���� 	0 pmcid  Q o  � ���� 0 pubpmcid pubPMCID��  M o      ���� 0 bibmetadata bibMetadata��  ��  A RSR l 

��������  ��  ��  S T��T L  
UU o  
���� 0 bibmetadata bibMetadata��  % VWV l     ��������  ��  ��  W XYX l     ��������  ��  ��  Y Z[Z l     ��\]��  \ L F Maps the given color name to a DEVONthink label index and returns it.   ] �^^ �   M a p s   t h e   g i v e n   c o l o r   n a m e   t o   a   D E V O N t h i n k   l a b e l   i n d e x   a n d   r e t u r n s   i t .[ _`_ i  Y\aba I      ��c���� 00 labelindexforcolorname labelIndexForColorNamec d��d o      ���� 0 	colorname 	colorName��  ��  b k     >ee fgf Z    hi����h G     jkj =    lml o     ���� 0 	colorname 	colorNamem m    ��
�� 
msngk =   	non o    ���� 0 	colorname 	colorNameo m    pp �qq  i L    rr m    ����  ��  ��  g sts l   ��������  ��  ��  t uvu r    wxw m    ����  x o      ���� $0 recordlabelindex recordLabelIndexv yzy r    +{|{ l   )}����} n   )~~ I    )������� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_� ��� m    �� ���  c o l o r N a m e� ��� o     ���� 0 	colorname 	colorName� ���� o     %���� 0 labelmappings labelMappings��  ��   o    ���� 0 keypointslib KeypointsLib��  ��  | o      ���� 0 labelmapping labelMappingz ��� Z   , ;������� >  , /��� o   , -���� 0 labelmapping labelMapping� m   - .��
�� 
msng� r   2 7��� n  2 5��� o   3 5�� 0 
labelindex 
labelIndex� o   2 3�� 0 labelmapping labelMapping� o      �� $0 recordlabelindex recordLabelIndex��  ��  � ��� l  < <����  �  �  � ��� L   < >�� o   < =�� $0 recordlabelindex recordLabelIndex�  ` ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � [ U Returns the name of the approximate color (like "red", "blue", "green", etc) for the   � ��� �   R e t u r n s   t h e   n a m e   o f   t h e   a p p r o x i m a t e   c o l o r   ( l i k e   " r e d " ,   " b l u e " ,   " g r e e n " ,   e t c )   f o r   t h e� ��� l     ����  �   given hue degree.   � ��� $   g i v e n   h u e   d e g r e e .� ��� l     ����  � U O @param hueDegree A color's hue component given as a degree (0-359) of the hue    � ��� �   @ p a r a m   h u e D e g r e e   A   c o l o r ' s   h u e   c o m p o n e n t   g i v e n   a s   a   d e g r e e   ( 0 - 3 5 9 )   o f   t h e   h u e  � ��� l     �~���~  � = 7 in the HSB (hue, saturation, brightness) color scheme.   � ��� n   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .� ��� i  ]`��� I      �}��|�} "0 colornameforhue colorNameForHue� ��{� o      �z�z 0 	huedegree 	hueDegree�{  �|  � k     c�� ��� r     ��� m     �� ���  � o      �y�y 0 	colorname 	colorName� ��� l   �x�w�v�x  �w  �v  � ��� X    8��u�� Z    3���t�s� F    '��� @    ��� o    �r�r 0 	huedegree 	hueDegree� n   ��� o    �q�q 0 lowerhuelimit lowerHueLimit� o    �p�p 0 colormapping colorMapping� B     %��� o     !�o�o 0 	huedegree 	hueDegree� n  ! $��� o   " $�n�n 0 upperhuelimit upperHueLimit� o   ! "�m�m 0 colormapping colorMapping� r   * /��� n  * -��� o   + -�l�l 0 	colorname 	colorName� o   * +�k�k 0 colormapping colorMapping� o      �j�j 0 	colorname 	colorName�t  �s  �u 0 colormapping colorMapping� o    �i�i 0 colormappings colorMappings� ��� Z   9 `���h�g� F   9 P��� =  9 <��� o   9 :�f�f 0 	colorname 	colorName� m   : ;�� ���  � l  ? N��e�d� G   ? N��� @   ? D��� o   ? @�c�c 0 	huedegree 	hueDegree� n  @ C��� o   A C�b�b 0 lowerhuelimit lowerHueLimit� o   @ A�a�a 0 colormapping colorMapping� B   G L��� o   G H�`�` 0 	huedegree 	hueDegree� n  H K��� o   I K�_�_ 0 upperhuelimit upperHueLimit� o   H I�^�^ 0 colormapping colorMapping�e  �d  � r   S \��� n  S Z��� o   X Z�]�] 0 	colorname 	colorName� o   S X�\�\ "0 redcolormapping redColorMapping� o      �[�[ 0 	colorname 	colorName�h  �g  � ��� l  a a�Z�Y�X�Z  �Y  �X  � ��W� L   a c�� o   a b�V�V 0 	colorname 	colorName�W  � ��� l     �U�T�S�U  �T  �S  � ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O���O  � W Q Attempts to extract the annotation's text from its line-based bounds rectangles.   � ��� �   A t t e m p t s   t o   e x t r a c t   t h e   a n n o t a t i o n ' s   t e x t   f r o m   i t s   l i n e - b a s e d   b o u n d s   r e c t a n g l e s .� ��� l     �N���N  � Q K @param boundsByLine List of line-based bounds, where each bounds rectangle   � ��� �   @ p a r a m   b o u n d s B y L i n e   L i s t   o f   l i n e - b a s e d   b o u n d s ,   w h e r e   e a c h   b o u n d s   r e c t a n g l e� ��� l     �M���M  � S M specifies the bounding box of an annotation's individual line in page space.   � �   �   s p e c i f i e s   t h e   b o u n d i n g   b o x   o f   a n   a n n o t a t i o n ' s   i n d i v i d u a l   l i n e   i n   p a g e   s p a c e .�  i  ad I      �L�K�L  0 annotationtext annotationText  o      �J�J 0 pdfpage pdfPage �I o      �H�H 0 boundsbyline boundsByLine�I  �K   k     n		 

 r      J     �G�G   o      �F�F 0 
textbyline 
textByLine  l   �E�D�C�E  �D  �C    X    a�B k    \  r     l   �A�@ n    I    �?�>�? &0 selectionforrect_ selectionForRect_ �= o    �<�< 0 	thebounds 	theBounds�=  �>   o    �;�; 0 pdfpage pdfPage�A  �@   o      �:�: 0 pdfselection pdfSelection  r    % !  n   #"#" I    #�9�8�7�9 
0 string  �8  �7  # o    �6�6 0 pdfselection pdfSelection! o      �5�5 0 linetext lineText $%$ l  & &�4�3�2�4  �3  �2  % &�1& Z   & \'(�0�/' F   & 1)*) >  & )+,+ o   & '�.�. 0 linetext lineText, m   ' (�-
�- 
msng* >  , /-.- o   , -�,�, 0 linetext lineText. m   - .// �00  ( k   4 X11 232 l  4 4�+45�+  4 W Q replace any trailing whitespace or "\n" at the end of a line with a single space   5 �66 �   r e p l a c e   a n y   t r a i l i n g   w h i t e s p a c e   o r   " \ n "   a t   t h e   e n d   o f   a   l i n e   w i t h   a   s i n g l e   s p a c e3 787 r   4 D9:9 n  4 B;<; I   9 B�*=�)�* 0 regexreplace regexReplace= >?> c   9 <@A@ o   9 :�(�( 0 linetext lineTextA m   : ;�'
�' 
TEXT? BCB m   < =DD �EE  ( \ s + | \ \ n ) $C F�&F m   = >GG �HH   �&  �)  < o   4 9�%�% 0 keypointslib KeypointsLib: o      �$�$ 0 linetext lineText8 IJI l  E E�#�"�!�#  �"  �!  J KLK l  E E� MN�   M b \ assume that a hyphen (and optional space) at the end of a line indicates a word hyphenation   N �OO �   a s s u m e   t h a t   a   h y p h e n   ( a n d   o p t i o n a l   s p a c e )   a t   t h e   e n d   o f   a   l i n e   i n d i c a t e s   a   w o r d   h y p h e n a t i o nL PQP l  E E�RS�  R e _ NOTE: while this assumption is often correct, it's not always true so it may incorrectly merge   S �TT �   N O T E :   w h i l e   t h i s   a s s u m p t i o n   i s   o f t e n   c o r r e c t ,   i t ' s   n o t   a l w a y s   t r u e   s o   i t   m a y   i n c o r r e c t l y   m e r g eQ UVU l  E E�WX�  W !            hyphenated words   X �YY 6                       h y p h e n a t e d   w o r d sV Z[Z r   E S\]\ n  E Q^_^ I   J Q�`�� 0 regexreplace regexReplace` aba o   J K�� 0 linetext lineTextb cdc m   K Lee �ff  -   $d g�g m   L Mhh �ii  �  �  _ o   E J�� 0 keypointslib KeypointsLib] o      �� 0 linetext lineText[ jkj l  T T����  �  �  k l�l s   T Xmnm o   T U�� 0 linetext lineTextn n      opo  ;   V Wp o   U V�� 0 
textbyline 
textByLine�  �0  �/  �1  �B 0 	thebounds 	theBounds o    	�� 0 boundsbyline boundsByLine qrq l  b b����  �  �  r s�s L   b ntt n  b muvu I   g m�w��  0 mergetextitems mergeTextItemsw xyx o   g h�
�
 0 
textbyline 
textByLiney z�	z m   h i{{ �||  �	  �  v o   b g�� 0 keypointslib KeypointsLib�   }~} l     ����  �  �  ~ � l     ����  �  �  � ��� l     ����  � ` Z Converts a list of quadrilateral points to a list of line-based bounds, where each bounds   � ��� �   C o n v e r t s   a   l i s t   o f   q u a d r i l a t e r a l   p o i n t s   t o   a   l i s t   o f   l i n e - b a s e d   b o u n d s ,   w h e r e   e a c h   b o u n d s� ��� l     � ���   � ] W rectangle specifies the bounding box of an annotation's individual line in page space.   � ��� �   r e c t a n g l e   s p e c i f i e s   t h e   b o u n d i n g   b o x   o f   a n   a n n o t a t i o n ' s   i n d i v i d u a l   l i n e   i n   p a g e   s p a c e .� ��� l     ������  � n h @param quadPoints List of quadrilateral points (as obtained by `pdfAnnotation's quadrilateralPoints()`,   � ��� �   @ p a r a m   q u a d P o i n t s   L i s t   o f   q u a d r i l a t e r a l   p o i n t s   ( a s   o b t a i n e d   b y   ` p d f A n n o t a t i o n ' s   q u a d r i l a t e r a l P o i n t s ( ) ` ,� ��� l     ������  � m g with each point wrapped as NSValue object) where each quadrilateral (i.e., a group of four consecutive   � ��� �   w i t h   e a c h   p o i n t   w r a p p e d   a s   N S V a l u e   o b j e c t )   w h e r e   e a c h   q u a d r i l a t e r a l   ( i . e . ,   a   g r o u p   o f   f o u r   c o n s e c u t i v e� ��� l     ������  � g a points ordered in Z-form {topLeft, topRight, bottomLeft, bottomRight} so that points with higher   � ��� �   p o i n t s   o r d e r e d   i n   Z - f o r m   { t o p L e f t ,   t o p R i g h t ,   b o t t o m L e f t ,   b o t t o m R i g h t }   s o   t h a t   p o i n t s   w i t h   h i g h e r� ��� l     ������  � r l y-values come first) encircles a line of text to be highlighted. The coordinates of each point are relative   � ��� �   y - v a l u e s   c o m e   f i r s t )   e n c i r c l e s   a   l i n e   o f   t e x t   t o   b e   h i g h l i g h t e d .   T h e   c o o r d i n a t e s   o f   e a c h   p o i n t   a r e   r e l a t i v e� ��� l     ������  � 6 0 to the bound�s origin of the markup annotation.   � ��� `   t o   t h e   b o u n d  s   o r i g i n   o f   t h e   m a r k u p   a n n o t a t i o n .� ��� l     ������  � c ] @param annotationBounds The bounding box for the annotation in page space (which is a 72 dpi   � ��� �   @ p a r a m   a n n o t a t i o n B o u n d s   T h e   b o u n d i n g   b o x   f o r   t h e   a n n o t a t i o n   i n   p a g e   s p a c e   ( w h i c h   i s   a   7 2   d p i� ��� l     ������  � b \ coordinate system with the origin at the lower-left corner of the PDF page), as obtained by   � ��� �   c o o r d i n a t e   s y s t e m   w i t h   t h e   o r i g i n   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e ) ,   a s   o b t a i n e d   b y� ��� l     ������  � $  `pdfAnnotation's |bounds|()`.   � ��� <   ` p d f A n n o t a t i o n ' s   | b o u n d s | ( ) ` .� ��� i  eh��� I      ������� 00 annotationboundsbyline annotationBoundsByLine� ��� o      ���� 0 
quadpoints 
quadPoints� ���� o      ���� $0 annotationbounds annotationBounds��  ��  � k     ��� ��� l    ���� r     ��� n     ��� 4   ���
�� 
cobj� m    ���� � o     ���� $0 annotationbounds annotationBounds� o      ���� 0 	theorigin 	theOrigin� A ; a point specified as a list of x/y positions: {xPos, YPos}   � ��� v   a   p o i n t   s p e c i f i e d   a s   a   l i s t   o f   x / y   p o s i t i o n s :   { x P o s ,   Y P o s }� ��� r    ��� J    	����  � o      ���� 0 boundsbyline boundsByLine� ��� r    ��� ^    ��� l   ������ I   �����
�� .corecnte****       ****� o    ���� 0 
quadpoints 
quadPoints��  ��  ��  � m    ���� � o      ���� 0 maxquadcount maxQuadCount� ��� r    ��� m    ���� � o      ���� 0 	quadcount 	quadCount� ��� l   ��������  ��  ��  � ��� l   ������  � m g iterate over each quadrilateral (4 points: topLeft, topRight, bottomLeft, bottomRight) representing an   � ��� �   i t e r a t e   o v e r   e a c h   q u a d r i l a t e r a l   ( 4   p o i n t s :   t o p L e f t ,   t o p R i g h t ,   b o t t o m L e f t ,   b o t t o m R i g h t )   r e p r e s e n t i n g   a n� ��� l   ������  � 7 1 annotation line and get its bounds in page space   � ��� b   a n n o t a t i o n   l i n e   a n d   g e t   i t s   b o u n d s   i n   p a g e   s p a c e� ��� U    ���� k   ! ��� ��� l  ! !������  � K E get the top left & bottom right quad points for this annotation line   � ��� �   g e t   t h e   t o p   l e f t   &   b o t t o m   r i g h t   q u a d   p o i n t s   f o r   t h i s   a n n o t a t i o n   l i n e� ��� r   ! +��� n  ! )��� I   % )�������� 0 
pointvalue 
pointValue��  ��  � l  ! %������ n   ! %��� 4   " %���
�� 
cobj� o   # $���� 0 	quadcount 	quadCount� o   ! "���� 0 
quadpoints 
quadPoints��  ��  � o      ���� 0 topleftpoint topLeftPoint� ��� r   , 8��� n  , 6��� I   2 6�������� 0 
pointvalue 
pointValue��  ��  � l  , 2������ n   , 2��� 4   - 2�� 
�� 
cobj  l  . 1���� [   . 1 o   . /���� 0 	quadcount 	quadCount m   / 0���� ��  ��  � o   , -���� 0 
quadpoints 
quadPoints��  ��  � o      ���� $0 bottomrightpoint bottomRightPoint�  l  9 9��������  ��  ��    l  9 9��	��   b \ convert each quad point (whose coordinates are relative to the bound�s origin of the markup   	 �

 �   c o n v e r t   e a c h   q u a d   p o i n t   ( w h o s e   c o o r d i n a t e s   a r e   r e l a t i v e   t o   t h e   b o u n d  s   o r i g i n   o f   t h e   m a r k u p  l  9 9����   a [ annotation) to page space (where the origin lies at the lower-left corner of the PDF page)    � �   a n n o t a t i o n )   t o   p a g e   s p a c e   ( w h e r e   t h e   o r i g i n   l i e s   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e )  l  9 9����   d ^ NOTE: w/o the adjustment of values, the rectangle would be too small to match underlying text    � �   N O T E :   w / o   t h e   a d j u s t m e n t   o f   v a l u e s ,   t h e   r e c t a n g l e   w o u l d   b e   t o o   s m a l l   t o   m a t c h   u n d e r l y i n g   t e x t  r   9 K \   9 G [   9 A l  9 <���� n   9 < o   : <���� 0 x   o   9 :�� 0 topleftpoint topLeftPoint��  ��   l  < @ ��  n   < @!"! 4  = @�#
� 
cobj# m   > ?�� " o   < =�� 0 	theorigin 	theOrigin�  �   o   A F�� ,0 linewidthenlargement lineWidthEnlargement n      $%$ o   H J�� 0 x  % o   G H�� 0 topleftpoint topLeftPoint &'& r   L ^()( [   L Z*+* [   L T,-, l  L O.��. n   L O/0/ o   M O�� 0 y  0 o   L M�� 0 topleftpoint topLeftPoint�  �  - l  O S1��1 n   O S232 4  P S�4
� 
cobj4 m   Q R�� 3 o   O P�� 0 	theorigin 	theOrigin�  �  + o   T Y�� .0 lineheightenlargement lineHeightEnlargement) n      565 o   [ ]�� 0 y  6 o   Z [�� 0 topleftpoint topLeftPoint' 787 l  _ _����  �  �  8 9:9 r   _ q;<; [   _ m=>= [   _ g?@? l  _ bA��A n   _ bBCB o   ` b�� 0 x  C o   _ `�� $0 bottomrightpoint bottomRightPoint�  �  @ l  b fD��D n   b fEFE 4  c f�G
� 
cobjG m   d e�� F o   b c�� 0 	theorigin 	theOrigin�  �  > o   g l�� ,0 linewidthenlargement lineWidthEnlargement< n      HIH o   n p�� 0 x  I o   m n�� $0 bottomrightpoint bottomRightPoint: JKJ r   r �LML \   r �NON [   r zPQP l  r uR��R n   r uSTS o   s u�� 0 y  T o   r s�� $0 bottomrightpoint bottomRightPoint�  �  Q l  u yU��U n   u yVWV 4  v y�X
� 
cobjX m   w x�� W o   u v�� 0 	theorigin 	theOrigin�  �  O o   z �� .0 lineheightenlargement lineHeightEnlargementM n      YZY o   � ��� 0 y  Z o   � ��� $0 bottomrightpoint bottomRightPointK [\[ l  � �����  �  �  \ ]^] l  � ��_`�  _ k e create a bounds rectangle (specified by origin {x,y} & size {width,height}) for this annotation line   ` �aa �   c r e a t e   a   b o u n d s   r e c t a n g l e   ( s p e c i f i e d   b y   o r i g i n   { x , y }   &   s i z e   { w i d t h , h e i g h t } )   f o r   t h i s   a n n o t a t i o n   l i n e^ bcb r   � �ded n  � �fgf I   � ��h�� 0 
makensrect 
makeNSRecth i�i J   � �jj klk J   � �mm non n   � �pqp o   � ��� 0 x  q o   � ��� 0 topleftpoint topLeftPointo r�r n   � �sts o   � ��� 0 y  t o   � ��� 0 topleftpoint topLeftPoint�  l u�u J   � �vv wxw n   � �yzy o   � ��� 0 x  z o   � ��� $0 bottomrightpoint bottomRightPointx {�{ n   � �|}| o   � ��� 0 y  } o   � ��~�~ $0 bottomrightpoint bottomRightPoint�  �  �  �  g  f   � �e o      �}�} 0 
linebounds 
lineBoundsc ~~ s   � ���� o   � ��|�| 0 
linebounds 
lineBounds� n      ���  ;   � �� o   � ��{�{ 0 boundsbyline boundsByLine ��� l  � ��z�y�x�z  �y  �x  � ��w� r   � ���� [   � ���� o   � ��v�v 0 	quadcount 	quadCount� m   � ��u�u � o      �t�t 0 	quadcount 	quadCount�w  � o    �s�s 0 maxquadcount maxQuadCount� ��� l  � ��r�q�p�r  �q  �p  � ��o� L   � ��� o   � ��n�n 0 boundsbyline boundsByLine�o  � ��� l     �m�l�k�m  �l  �k  � ��� l     �j�i�h�j  �i  �h  � ��� l     �g���g  � f ` Takes a a rectangle specified via its top left & bottom right points (given as a list of lists:   � ��� �   T a k e s   a   a   r e c t a n g l e   s p e c i f i e d   v i a   i t s   t o p   l e f t   &   b o t t o m   r i g h t   p o i n t s   ( g i v e n   a s   a   l i s t   o f   l i s t s :� ��� l     �f���f  � b \ {{topLeftX, topLeftY}, {bottomRightX, bottomRightY}}) and converts it to a bounds rectangle   � ��� �   { { t o p L e f t X ,   t o p L e f t Y } ,   { b o t t o m R i g h t X ,   b o t t o m R i g h t Y } } )   a n d   c o n v e r t s   i t   t o   a   b o u n d s   r e c t a n g l e� ��� l     �e���e  � Z T given as a record with `origin` & `size` properties each containing again a record:   � ��� �   g i v e n   a s   a   r e c o r d   w i t h   ` o r i g i n `   &   ` s i z e `   p r o p e r t i e s   e a c h   c o n t a i n i n g   a g a i n   a   r e c o r d :� ��� l     �d���d  � m g {origin:{x:topLeftX, y:topLeftY}, |size|:{width:bottomRightX-topLeftX, height:bottomRightY-topLeftY}}    � ��� �   { o r i g i n : { x : t o p L e f t X ,   y : t o p L e f t Y } ,   | s i z e | : { w i d t h : b o t t o m R i g h t X - t o p L e f t X ,   h e i g h t : b o t t o m R i g h t Y - t o p L e f t Y } }  � ��� l     �c���c  � ` Z Credits: by Takaaki Naganoya, Piyomaru Software (see http://piyocast.com/as/archives/643)   � ��� �   C r e d i t s :   b y   T a k a a k i   N a g a n o y a ,   P i y o m a r u   S o f t w a r e   ( s e e   h t t p : / / p i y o c a s t . c o m / a s / a r c h i v e s / 6 4 3 )� ��� i  il��� I      �b��a�b 0 
makensrect 
makeNSRect� ��`� c      ��� o      �_�_ 0 alist aList� m      �^
�^ 
list�`  �a  � Q     ]���� k    S�� ��� s    1��� o    �]�] 0 alist aList� J      �� ��� J      �� ��� o      �\�\ 0 x1  � ��[� o      �Z�Z 0 y1  �[  � ��Y� J      �� ��� o      �X�X 0 x2  � ��W� o      �V�V 0 y2  �W  �Y  � ��� r   2 7��� l  2 5��U�T� \   2 5��� o   2 3�S�S 0 x2  � o   3 4�R�R 0 x1  �U  �T  � o      �Q�Q 0 xwidth xWidth� ��� l  8 =���� r   8 =��� l  8 ;��P�O� \   8 ;��� o   8 9�N�N 0 y2  � o   9 :�M�M 0 y1  �P  �O  � o      �L�L 0 yheight yHeight� J D TODO: doesn't this create a negative height? use `y1 - y2` instead?   � ��� �   T O D O :   d o e s n ' t   t h i s   c r e a t e   a   n e g a t i v e   h e i g h t ?   u s e   ` y 1   -   y 2 `   i n s t e a d ?� ��� r   > P��� K   > N�� �K���K 
0 origin  � K   ? E�� �J���J 0 x  � o   @ A�I�I 0 x1  � �H��G�H 0 y  � o   B C�F�F 0 y1  �G  � �E��D�E 0 size  � K   F L�� �C���C 	0 width  � o   G H�B�B 0 xwidth xWidth� �A��@�A 
0 height  � o   I J�?�? 0 yheight yHeight�@  �D  � o      �>�> 0 a1rect a1Rect� ��=� L   Q S�� o   Q R�<�< 0 a1rect a1Rect�=  � R      �;�:�9
�; .ascrerr ****      � ****�:  �9  � L   [ ]�� m   [ \�8
�8 
msng� ��7� l     �6�5�4�6  �5  �4  �7       B�3�!-��������2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"������������ �!� 	
�3  � @����������������������
�	��������� ����������������������������������������������������������������� ,0 notefoldernameprefix noteFolderNamePrefix� ,0 notefoldernamesuffix noteFolderNameSuffix� 
0 label1  � 
0 label2  � 
0 label3  � 
0 label4  � 
0 label5  � 
0 label6  � 
0 label7  � *0 updateexistingnotes updateExistingNotes� 80 updatenameforexistingnotes updateNameForExistingNotes� F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes� J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes� <0 updateratingforexistingnotes updateRatingForExistingNotes� :0 updatelabelforexistingnotes updateLabelForExistingNotes� 80 updatetagsforexistingnotes updateTagsForExistingNotes� L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders� ,0 selectupdatedrecords selectUpdatedRecords� $0 fetchdoimetadata fetchDOIMetadata�
 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata�	 0 fetchbibtex fetchBibTeX� :0 appendbibtextofindercomment appendBibTeXToFinderComment� 00 fetchformattedcitation fetchFormattedCitation� P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment� &0 citationstylename citationStyleName�  0 citationlocale citationLocale� ,0 linewidthenlargement lineWidthEnlargement� .0 lineheightenlargement lineHeightEnlargement� "0 redcolormapping redColorMapping�  (0 orangecolormapping orangeColorMapping�� (0 yellowcolormapping yellowColorMapping�� &0 greencolormapping greenColorMapping�� $0 cyancolormapping cyanColorMapping�� .0 lightbluecolormapping lightBlueColorMapping�� ,0 darkbluecolormapping darkBlueColorMapping�� (0 purplecolormapping purpleColorMapping�� $0 pinkcolormapping pinkColorMapping�� 0 colormappings colorMappings�� 0 labelmappings labelMappings�� &0 creatednotescount createdNotesCount�� &0 updatednotescount updatedNotesCount
�� 
pimr�� 0 keypointslib KeypointsLib
�� .aevtoappnull  �   � ****�� $0 checkappsrunning checkAppsRunning�� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�� &0 pdfannotationinfo pdfAnnotationInfo�� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData��  0 createdtrecord createDTRecord�� 00 setmetadatafordtfolder setMetadataForDTFolder�� 00 setmetadatafordtrecord setMetadataForDTRecord�� 60 updatemetadatafordtrecord updateMetadataForDTRecord�� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�� 60 appendtocommentofdtfolder appendToCommentOfDTFolder�� &0 bibmetadatafordoi bibMetadataForDOI�� 00 labelindexforcolorname labelIndexForColorName�� "0 colornameforhue colorNameForHue��  0 annotationtext annotationText�� 00 annotationboundsbyline annotationBoundsByLine�� 0 
makensrect 
makeNSRect� ������ 0 
labelindex 
labelIndex��  ��Q���� 0 	colorname 	colorName��  � ������ 0 
labelindex 
labelIndex��  ��Z���� 0 	colorname 	colorName��  � ������ 0 
labelindex 
labelIndex��  ��c���� 0 	colorname 	colorName��  � ������ 0 
labelindex 
labelIndex��  ��l���� 0 	colorname 	colorName��  � ������ 0 
labelindex 
labelIndex��  ��u���� 0 	colorname 	colorName��  � ������ 0 
labelindex 
labelIndex��  ��~���� 0 	colorname 	colorName��  � ������ 0 
labelindex 
labelIndex��  ������� 0 	colorname 	colorName��  
�2 boovfals
�1 boovfals
�0 boovtrue
�/ boovtrue
�. boovtrue
�- boovtrue
�, boovtrue
�+ boovtrue
�* boovtrue
�) boovtrue
�( boovtrue
�' boovtrue
�& boovfals
�% boovfals
�$ boovfals
�# boovtrue
�" boovtrue� ��"�� 0 	colorname 	colorName ������ 0 lowerhuelimit lowerHueLimit��^ ������ 0 upperhuelimit upperHueLimit� �  � �-� 0 	colorname 	colorName �� � 0 lowerhuelimit lowerHueLimit�   ���� 0 upperhuelimit upperHueLimit� ,�  � �8!� 0 	colorname 	colorName! ��"� 0 lowerhuelimit lowerHueLimit� -" ���� 0 upperhuelimit upperHueLimit� A�  � �C#� 0 	colorname 	colorName# ��$� 0 lowerhuelimit lowerHueLimit� B$ ���� 0 upperhuelimit upperHueLimit� ��  � �N%� 0 	colorname 	colorName% ��&� 0 lowerhuelimit lowerHueLimit� �& ���� 0 upperhuelimit upperHueLimit� ��  � �Y'� 0 	colorname 	colorName' ��(� 0 lowerhuelimit lowerHueLimit� �( ���� 0 upperhuelimit upperHueLimit� ��  � �d)� 0 	colorname 	colorName) ��*� 0 lowerhuelimit lowerHueLimit� �* ���� 0 upperhuelimit upperHueLimit� ��  � �o+� 0 	colorname 	colorName+ ��,� 0 lowerhuelimit lowerHueLimit� �, ���� 0 upperhuelimit upperHueLimit�D�  � �z-� 0 	colorname 	colorName- ��.� 0 lowerhuelimit lowerHueLimit�E. ���� 0 upperhuelimit upperHueLimit�]�  � �/� 	/ 	 ���������  �0� 0  ��������!  �    �1� 1  23452 �6�
� 
cobj6 77   ��
� 
scpt�  3 �8�
� 
cobj8 99   ��
� 
frmk�  4 �:�
� 
cobj: ;;   ��
� 
frmk�  5 �<�
� 
cobj< ==   �
� 
osax�   >>   �~�
�~ 
scpt �}��|�{?@�z
�} .aevtoappnull  �   � ****�|  �{  ? �y�y 0 i  @ *�x�w�v�u�t�s�r�q�p�oE�n�m�l[]_a�k�j�i�h��g�f�e��d��c���b��a�`��_��^�]�x $0 checkappsrunning checkAppsRunning�w 0 setupprogress setupProgress�v T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�u 0 
pdfrecords 
pdfRecords
�t .corecnte****       ****�s 0 pdfcount pdfCount�r 40 settotalstepsforprogress setTotalStepsForProgress
�q 
cobj�p 0 	pdfrecord 	pdfRecord
�o 
capp
�n kfrmID  
�m 
DTfn�l 0 pdffilename pdfFilename�k  0 updateprogress updateProgress�j :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�i  0 updatedrecords updatedRecords
�h 
bool
�g 
brws�f 0 frontwindow frontWindow
�e 
DTsl
�d .miscactvnull��� ��� null
�c 
lnfd
�b 
appr
�a 
disp
�` 
btns
�_ 
dflt�^ 
�] .sysodlogaskr        TEXT�z")j+   hY hOb  ,�k+ O)j+ E�OjEc  )OjEc  *O�j E�Ob  ,�k+ O Lk�kh  ��/E�O)���0 ��,E�UOb  ,��%a %�%a %�%a %l+ O)�k+ E` [OY��Ob  e 	 _ jva & &)�a �0 *a k/E` O_ _ a ,FUY hO)�a �0 G*j Oa �%_ %a %b  )%_ %a  %b  *%a !a "a #la $a %kva &a 'a ( )U �\��[�ZAB�Y�\ $0 checkappsrunning checkAppsRunning�[  �Z  A  B �X�W�VC�U��T���S�R�Q
�X 
capp
�W kfrmID  
�V 
prcsC  
�U 
fcrt
�T .corecnte****       ****�S �R �Q 0 displayerror displayError�Y 6)���0 +*�-�[�,\Z�81j k b  ,���e�+ OfY hUOe �P�O�NDE�M�P T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�O  �N  D �L�K�J�L 0 annotatedpdfs annotatedPDFs�K 0 
therecords 
theRecords�J 0 	therecord 	theRecordE �I]�H�G�F�E�D�C�B�A�@�?SW�>�=�<
�I 
capp
�H kfrmID  
�G 
DTsl
�F 
list
�E 
kocl
�D 
cobj
�C .corecnte****       ****
�B 
DTty
�A OCRdpdf 
�@ 
DTna
�? 
bool�> �= �< 0 displayerror displayError�M bjvE�O)���0 R*�,�&E�O .�[��l kh ��,� 	 	��,j�& 	��6GY h[OY��O�jv  b  ,���e�+ Y hUO� �;��:�9FG�8�; :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�: �7H�7 H  �6�6 0 	pdfrecord 	pdfRecord�9  F -�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����������������������
�	�5 0 	pdfrecord 	pdfRecord�4 0 pdfpath pdfPath�3 
0 pdfurl  �2 "0 pdflocationpath pdfLocationPath�1 0 pdfmetadata pdfMetadata�0  0 notefoldername noteFolderName�/ (0 folderlocationpath folderLocationPath�.  0 folderdidexist folderDidExist�-  0 folderlocation folderLocation�, 0 	folderurl 	folderURL�+  0 foldermetadata folderMetadata�* 0 	sourcedoi 	sourceDOI�) 0 sourcecitekey sourceCitekey�( 0 metadatadoi metadataDOI�' "0 metadatacitekey metadataCitekey�& (0 pdfannotationslist pdfAnnotationsList�% 0 bibmetadata bibMetadata�$ &0 formattedcitation formattedCitation�# 0 
bibtexdata 
bibTeXData�"  0 updatedrecords updatedRecords�! 0 pdfannotation pdfAnnotation�  0 acomment aComment� 0 	annottext 	annotText� 0 
apagelabel 
aPageLabel�  0 recordcontents recordContents� 0 
recordname 
recordName� 00 recordmodificationdate recordModificationDate� (0 recordcreationdate recordCreationDate� 0 recordaliases recordAliases� 0 	recordurl 	recordURL� 0 	annottype 	annotType�  0 recordmetadata recordMetadata� 0 	ausername 	aUserName� 0 citekey  � $0 customattributes customAttributes� 0 
recordtags 
recordTags� "0 customattribute customAttribute� 0 akey aKey� 0 avalue aValue� 0 existingvalue existingValue� 0 	isflagged 	isFlagged� 0 recordrating recordRating� $0 recordlabelindex recordLabelIndex�
 0 dtrecord dtRecord�	 $0 recordwasupdated recordWasUpdatedG Q� �������� ������� ��-3F��S����eq��������������������������A��V������������������������������������	5��	L��	}	�	�������	�����������������
� 
capp
� kfrmID  
� 
ppth
� 
rURL
� 
DTlo
� 
DTcm
� 
msng�  �   
�� 
pnam
�� .DTpacd53bool       utxt
�� .DTpacd52DTrc       utxt
�� 
pURL�� .0 valueforkey_inrecord_ valueForKey_inRecord_
�� 
bool�� 0 matchdoi matchDOI�� �� &0 pdfannotationinfo pdfAnnotationInfo
�� 
cobj�� 0 doi  �� 0 pdfannotations  �� 00 setmetadatafordtrecord setMetadataForDTRecord�� &0 bibmetadatafordoi bibMetadataForDOI�� 0 
sourcefile 
sourceFile�� 0 citekey  �� �� 00 setmetadatafordtfolder setMetadataForDTFolder�� 60 appendtocommentofdtfolder appendToCommentOfDTFolder
�� 
kocl
�� .corecnte****       ****�� 0 comment  
�� misccura�� 0 nsnull NSNull�� 0 null  
�� 
TEXT�� 0 	annottext 	annotText�� 0 	pagelabel 	pageLabel�� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�� 0 modifieddate modifiedDate
�� 
ldt �� (0 keypointsidfordate keypointsIDForDate�� 0 deeplink deepLink�� 0 	annottype 	annotType��  0 annotationtype annotationType�� 0 username userName�� 0 	createdby 	createdBy�� 0 
sourcepage 
sourcePage�� T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote�� 0 	attribkey 	attribKey�� 0 attribvalue attribValue�� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_�� :0 recordfromlabels_andvalues_ recordFromLabels_andValues_�� @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged�� 60 keypointsnoteratingnumber keypointsNoteRatingNumber��  0 annotcolorname annotColorName�� 00 labelindexforcolorname labelIndexForColorName�� ��  0 createdtrecord createDTRecord�8�)���0 ���,E�O��,E�O��,E�O��,E�O ��  	jvE�Y hW X  	jvE�Ob   ��,%b  %E�O��%�%E�O�j E�O�j E�O��,E�O��%��,FO��,E�O ��  	jvE�Y hW X  	jvE�UOa E�Oa E�O�jv ab  ,a �l+ E�O��	 �a a & b  ,�k+ E�Y hOb  ,a �l+ E�O��	 �a a & �E�Y hY hO)����a + E[a k/E�Z[a l/E�ZO�a �a �a %E�O)��l+ OjvE^ Oa E^ Oa  E^ O�f 
 b  e a & �b  e 	 	��a &	 �a !a & E)��l+ "E^ O] jv ,b  ,a #] l+ E^ Ob  ,a $] l+ E^ Y hY hO�a %�a &�a �a '%E�O�] %E�O)��l+ (Y hO�f  hb  e 	 ] �a &	 ] a )a & )�] l+ *Y hOb  e 	 ] �a &	 ] a +a & )�] l+ *Y hY hOjvE^ OP�[a ,a l -kh ] a .,E^ O] a /a 0,a 1,  
�E^ Y hO] � ] a 2&E^ Y hO] a 3,E^ O] a /a 0,a 1,  
�E^ Y hO] � ] a 2&E^ Y hO] a 4,E^ O)] ] l+ 5E^ O)] ] ] m+ 6E^ O] a 7,a 8&E^ O] � ] E^ Ob  ,] k+ 9E^ Y hO] a :,a 2&E^ O] a ;,a 2&E^ O] a �a <] a %E^ O] a =,E^  O]  �	 ]  a >a & ] a ?]  a 2&l%E^ Y hO] �	 ] a @a & ] a A] a 2&l%E^ Y hO�� ] a %�l%E^ Y hO] a &,E^ !O] !�	 ] !a Ba & ] a &] !l%E^ Y hO��	 �a Ca & ] a �l%E^ Y hOb  ,] a Dkvl+ EE[a k/E^ "Z[a l/E^ #ZO �] "[a ,a l -kh $] $a F,E^ %O] $a G,E^ &Ob  ,] %] l+ E^ 'O] '� #b  ,] 'a H%] &%] %] m+ IE^ Y ] b  ,] %kv] &kvl+ J%E^ [OY��Ob  ,] k+ KE^ (Ob  ,] k+ LE^ )O)] a M,k+ NE^ *O)��] ] ] ] #] (] ] ] ] ] )] *a O+ PE[a k/E^ +Z[a l/E^ ,ZO] ,e  ] +] 6GY h[OY��O]  ��
�����IJ���� &0 pdfannotationinfo pdfAnnotationInfo�� ��K�� K  ���������� 0 pdfpath pdfPath�� 
0 pdfurl  �� 0 	sourcedoi 	sourceDOI�� 0 sourcecitekey sourceCitekey��  I ������������������������������������ 0 pdfpath pdfPath�� 
0 pdfurl  �� 0 	sourcedoi 	sourceDOI�� 0 sourcecitekey sourceCitekey�� 0 pdfdoc pdfDoc� 0 pdfdoi pdfDOI� *0 pdfannotationsarray pdfAnnotationsArray� 0 i  � 0 pdfpage pdfPage� 0 	pagelabel 	pageLabel� 0 pdfannotations  � 0 pdfannotation pdfAnnotation� 0 	annottype 	annotType� 0 
markuptype 
markupType� 0 
annotcolor 
annotColor� 0 	huedegree 	hueDegree�  0 annotcolorname annotColorName� 0 annotusername annotUserName� 0 annotmoddate annotModDate� 0 annotbounds annotBounds� 0 annotorigin annotOrigin� 0 	annotposx 	annotPosX� 0 	annotposy 	annotPosY� 0 
quadpoints 
quadPoints� 0 boundsbyline boundsByLine� 0 	annottext 	annotText� 0 annotcomment annotComment� 0 annoturl annotURL� 0 annotkeydict annotKeyDictJ F������
��
�����������7;?CF�SWZ�����������������������!�'�����~�}�|�{�z�y�x�w�v�u
� misccura� 0 pdfdocument PDFDocument� 	0 alloc  � 	0 NSURL  � $0 fileurlwithpath_ fileURLWithPath_� 0 initwithurl_ initWithURL_� 0 
doifrompdf 
doiFromPDF�  0 nsmutablearray NSMutableArray� 0 new  � 0 	pageCount  � 0 pageatindex_ pageAtIndex_� 	0 label  � 0 annotations  
� 
kocl
� 
cobj
� .corecnte****       ****� 0 type  � � 0 
markuptype 
markupType
� 
msng� 	0 color  � 0 huecomponent hueComponent
� 
nmbr�h
� 
dire
� olierndS
� .sysorondlong        doub� "0 colornameforhue colorNameForHue� 0 username userName� $0 modificationdate modificationDate� 
0 bounds  � � *0 quadrilateralpoints quadrilateralPoints� 00 annotationboundsbyline annotationBoundsByLine�  0 annotationtext annotationText� 0 contents  
� 
long� *0 annotationkeyvalues annotationKeyValues� 0 citekey  � 0 page  � 0 	pagelabel 	pageLabel�~ 0 	annottype 	annotType�} 0 
annotcolor 
annotColor�|  0 annotcolorname annotColorName�{ 0 modifieddate modifiedDate�z 0 	annottext 	annotText�y 0 comment  �x 0 deeplink deepLink�w �v 0 
addobject_ 
addObject_
�u 
list��.��,j+ ��,�k+ k+ E�O��  !b  ,��em+ E�O�� �E�Y hY hO��,j+ 
E�O�j�j+ kkh ��k+ E�O�j+ E�O�j+ E�O��[�a l kh �j+ E�Oa a a a a a v�xa a a mv� �j+ E�Y a E�O�j+ E�O� �j+ a  &a ! a "a #l $UE�O)�k+ %E^ O�j+ &E^ O�j+ 'E^ O�j+ (E^ O] a k/E^ O] [a k/\[a l/\ZlvE[a k/E^ Z[a l/E^ ZOa )a *a +a ,a -v� ,�j+ .E^ O)] ] l+ /E^ O)�] l+ 0E^ Y 	a 1E^ O�j+ 2E^ O�a 3%�%a 4%�%a 5%] a 6&%a 7%] a 6&%E^ O�j+ 8E^ O�a 9�a :�a ;�a <�a �a =�a >] a &] a ?] a @] a A] a B] a Ck+ DY h[OY�c[OY�3O�a E&�lv �t��s�rLM�q�t H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�s �pN�p N  �o�n�o 0 	annottext 	annotText�n 0 annotcomment annotComment�r  L �m�l�k�j�i�h�g�m 0 	annottext 	annotText�l 0 annotcomment annotComment�k (0 recordcontentparts recordContentParts�j $0 processedcomment processedComment�i 00 firstlevelheadingregex firstLevelHeadingRegex�h &0 firstlevelheading firstLevelHeading�g  0 recordcontents recordContentsM �f��e��d���c���b �a�`�_2
�f 
msng
�e 
bool
�d 
TEXT�c 0 
regexmatch 
regexMatch�b 0 regexreplace regexReplace�a F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines
�` 
lnfd�_  0 mergetextitems mergeTextItems�q �jvE�O��	 ���& ��&%�6GY hO��	 ���& \�E�O�E�Ob  ,��l+ E�O�� )b  ,���m+ 
E�O��5GOb  ,���%�m+ 
E�Y hOb  ,�fl+ E�O��6GY hO�jv b  ,���%l+ E�Y a E�O�	 �^I�]�\OP�[�^ B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�] �ZQ�Z Q  �Y�X�W�Y 0 	annottext 	annotText�X 0 annotcomment annotComment�W 0 	pagelabel 	pageLabel�\  O �V�U�T�S�R�Q�P�V 0 	annottext 	annotText�U 0 annotcomment annotComment�T 0 	pagelabel 	pageLabel�S "0 recordnameparts recordNameParts�R  0 recordnamepart recordNamePart�Q $0 markdownheadings markdownHeadings�P 0 
recordname 
recordNameP �O_�Ne�Mr~��L�K�J��I�H�G�������F
�O 
msng
�N 
bool
�M 
TEXT�L 40 markdownheadingsfromtext markdownHeadingsFromText
�K 
cobj�J 0 heading  �I F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines�H �G (0 firstwordsfromtext firstWordsFromText�F  0 mergetextitems mergeTextItems�[ �jvE�O��	 ���& ��&%�6GY hO�E�O��	 ���& Lb  ,��l+ E�O�jv ��k/�,E�Y hO��   b  ,�el+ E�Ob  ,��l+ E�Y hY hO��  *b  ,��l+ E�O�a  a �%a %E�Y hY hO�a   
a E�Y hO��6GO�jv b  ,�a l+ E�Y a E�O�
 �EV�D�CRS�B�E  0 createdtrecord createDTRecord�D �AT�A T  �@�?�>�=�<�;�:�9�8�7�6�5�4�@  0 folderlocation folderLocation�?  0 foldermetadata folderMetadata�> 0 
recordname 
recordName�= 0 recordaliases recordAliases�< 0 	recordurl 	recordURL�; 0 
recordtags 
recordTags�: 0 	isflagged 	isFlagged�9 0 
recordtext 
recordText�8 (0 recordcreationdate recordCreationDate�7 00 recordmodificationdate recordModificationDate�6  0 recordmetadata recordMetadata�5 0 recordrating recordRating�4 $0 recordlabelindex recordLabelIndex�C  R �3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����3  0 folderlocation folderLocation�2  0 foldermetadata folderMetadata�1 0 
recordname 
recordName�0 0 recordaliases recordAliases�/ 0 	recordurl 	recordURL�. 0 
recordtags 
recordTags�- 0 	isflagged 	isFlagged�, 0 
recordtext 
recordText�+ (0 recordcreationdate recordCreationDate�* 00 recordmodificationdate recordModificationDate�)  0 recordmetadata recordMetadata�( 0 recordrating recordRating�' $0 recordlabelindex recordLabelIndex�& 0 newrecorddata newRecordData�% 0 arecord aRecord�$ 0 didcreatenote didCreateNote�# 0 didupdatenote didUpdateNote�" $0 isexistingrecord isExistingRecord�! "0 existingrecords existingRecords�   0 targetlocation targetLocation�  0 existingrecord existingRecord� (0 existingrecordtags existingRecordTags� 0 atag aTagS  �?����������������������
�	�������
� 
capp
� kfrmID  
� 
DTty
� Ctypmkdn
� 
DTcn
� 
pnam� 
� 
msng
� 
DTcr
� 
pURL
� 
DTal
� .DTpacd49list       utxt
� 
DTlo
� 
kocl
� 
cobj
� .corecnte****       ****
� 
bool
� 
DTin
�
 .DTpacd08DTrc       reco
�	 
DTco
� 
DTpl
� 
DTmo
� 
DTst
� 
DTrt
� 
DTla
� 
tags� 60 updatemetadatafordtrecord updateMetadataForDTRecord�B )���0�����E�O�� ��l%E�Y hO�� ��l%E�Y hO�� ���l%E�Y hO�E�OfE�OfE^ OfE^ O�� p�j E^ O] jv Y�a ,��,%a %E^ O A] [a a l kh �� 	 ] a ,]  a & ] E�OeE^ Y h[OY��Y hY hO��  4�a �l E�O��%E�O�a ,�a ,FOeE�Ob  )kEc  )Y hO] f 
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
eE^ Y hY hO] e 	 	�f a & b  *kEc  *Y hY hO�] lvU �W� ��UV��� 00 setmetadatafordtfolder setMetadataForDTFolder�  ��W�� W  ������  0 folderlocation folderLocation��  0 foldermetadata folderMetadata��  U ������  0 folderlocation folderLocation��  0 foldermetadata folderMetadataV ������s����
�� 
msng
�� 
bool
�� 
capp
�� kfrmID  
�� 
DTcm�� 6b  e 	 ���&	 ���&	 �jv�& )���0 ���,FUY h �������XY���� 00 setmetadatafordtrecord setMetadataForDTRecord�� ��Z�� Z  ������ 0 arecord aRecord��  0 recordmetadata recordMetadata��  X ������ 0 arecord aRecord��  0 recordmetadata recordMetadataY �����������
�� 
msng
�� 
bool
�� 
capp
�� kfrmID  
�� 
DTcm�� *��	 ���&	 �jv�& )���0 ���,FUY h �������[\���� 60 updatemetadatafordtrecord updateMetadataForDTRecord�� ��]�� ]  ������ 0 arecord aRecord��  0 recordmetadata recordMetadata��  [ 
���������������������� 0 arecord aRecord��  0 recordmetadata recordMetadata�� 0 didupdatenote didUpdateNote�� 00 existingrecordmetadata existingRecordMetadata�� 0 existingkeys existingKeys�� 0 thekeys theKeys�� 0 thekey theKey�� 0 dtkey dtKey�� 0 thevalue theValue�� 0 existingvalue existingValue\ ������v������������������������
�� 
msng
�� 
bool
�� 
capp
�� kfrmID  
�� 
DTcm��  ��  �� 0 keysofrecord_ keysOfRecord_
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�� .0 valueforkey_inrecord_ valueForKey_inRecord_�� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_�� <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_�� �� 
 �� �&
 �jv �& fY hOfE�O)���0 ���,E�O ��  	jvE�Y hW X  jvE�O�jv �b  ,�k+ E�Ob  ,�k+ E�O a�[��l kh )�k+ E�O�� =b  ,��l+ E�Ob  ,��l+ E�O�� eE�Ob  ,ৣm+ E�Y hY eE�[OY��Ob  ,��l+ E�Y hO���,FUO� �������^_���� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�� ��`�� `  ���� 0 thekey theKey��  ^ ��� 0 thekey theKey� 0 dtkey dtKey_ ������ 0 lowercasetext lowercaseText� 0 regexreplace regexReplace�� !b  ,�k+  E�Ob  ,���m+ E�O�% ����ab�� 60 appendtocommentofdtfolder appendToCommentOfDTFolder� �c� c  ���  0 folderlocation folderLocation� 0 foldercomment folderComment�  a �����  0 folderlocation folderLocation� 0 foldercomment folderComment� 0 commentparts commentParts� .0 existingfoldercomment existingFolderCommentb 	��� �����
� 
msng
� 
bool
� 
capp
� kfrmID  
� 
DTco
� 
lnfd�  0 mergetextitems mergeTextItems� U��	 �jv�& FjvE�O)���0 5��,E�O��	 ���& 	��6GY hO��6GOb  ,���%l+ ��,FUY h �'��de�� &0 bibmetadatafordoi bibMetadataForDOI� �f� f  ��� 0 doi  � 0 citekey  �  d ������������������� 0 doi  � 0 citekey  � "0 publicationdata publicationData� 0 bibmetadata bibMetadata� 0 
pubauthors 
pubAuthors� "0 pubauthorscount pubAuthorsCount� 0 pubdate pubDate� 0 pubpublisher pubPublisher� 0 pubissn pubISSN� 0 
pubjournal 
pubJournal� 0 	pubvolume 	pubVolume� 0 pubissue pubIssue� 0 pubpages pubPages� 0 pubcitation pubCitation� 0 	pubbibtex 	pubBibTeX� 0 publink pubLink� 0 pubpmid pubPMID� 0 pubpmcid pubPMCIDe 7�7��KO����m��}����������������������$��7D��Wcp}����������~���}�
�|*�{=J�z
� 
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
0 volume  � 0 page  �~ 0 	reference  �} 
0 bibtex  �| 0 link  �{ 0 pmid  �z 	0 pmcid  ��� 
 �� �& jvY hOb  ,�b  b  ���+ E�O�jv  jvY hOjvE�Ob  ,�l+ E�O��	 ���&	 �jv�& `��b  ,��l+ l%E�O�j E�O�k  ���k/l%E�Y .�l  ���k/a %��l/%l%E�Y ���k/a %l%E�Y hOb  ,a �l+ E�O�� �a �a &l%E�Y hOb  ,a �l+ E�O��	 	�a �& �a �l%E�Y hOb  ,a �l+ E�O��	 	�a �& �a �l%E�Y hOb  ,a �l+ E�O��	 	�a �& �a �l%E�Y hOb  ,a �l+ E�Ob  ,a �l+ E�O��	 	�a  �& 1��	 	�a !�& �a "%�%a #%E�Y hO�a $�l%E�Y hOb  ,a %�l+ E�O��	 	�a &�& �a '�l%E�Y hOb  ,a (�l+ E�O��	 	�a )�& �a *�l%E�Y hOb  ,a +�l+ E�O��	 	�a ,�& �a -�l%E�Y hOb  ,a .�l+ E�O��	 	�a /�& �a 0�l%E�Y hOb  ,a 1�l+ E^ O] �	 ] a 2�& �a 3] l%E�Y hOb  ,a 4�l+ E^ O] �	 ] a 5�& �a 6] l%E�Y hO� �yb�x�wgh�v�y 00 labelindexforcolorname labelIndexForColorName�x �ui�u i  �t�t 0 	colorname 	colorName�w  g �s�r�q�s 0 	colorname 	colorName�r $0 recordlabelindex recordLabelIndex�q 0 labelmapping labelMappingh �pp�o��n�m
�p 
msng
�o 
bool�n P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_�m 0 
labelindex 
labelIndex�v ?�� 
 �� �& jY hOjE�Ob  ,�b  (m+ E�O�� 
��,E�Y hO� �l��k�jjk�i�l "0 colornameforhue colorNameForHue�k �hl�h l  �g�g 0 	huedegree 	hueDegree�j  j �f�e�d�f 0 	huedegree 	hueDegree�e 0 	colorname 	colorName�d 0 colormapping colorMappingk 	��c�b�a�`�_�^�]�
�c 
kocl
�b 
cobj
�a .corecnte****       ****�` 0 lowerhuelimit lowerHueLimit�_ 0 upperhuelimit upperHueLimit
�^ 
bool�] 0 	colorname 	colorName�i d�E�O 3b  '[��l kh ���,	 	���,�& 
��,E�Y h[OY��O�� 	 ���,
 	���,�&�& b  �,E�Y hO� �\�[�Zmn�Y�\  0 annotationtext annotationText�[ �Xo�X o  �W�V�W 0 pdfpage pdfPage�V 0 boundsbyline boundsByLine�Z  m �U�T�S�R�Q�P�U 0 pdfpage pdfPage�T 0 boundsbyline boundsByLine�S 0 
textbyline 
textByLine�R 0 	thebounds 	theBounds�Q 0 pdfselection pdfSelection�P 0 linetext lineTextn �O�N�M�L�K�J/�I�HDG�Geh{�F
�O 
kocl
�N 
cobj
�M .corecnte****       ****�L &0 selectionforrect_ selectionForRect_�K 
0 string  
�J 
msng
�I 
bool
�H 
TEXT�G 0 regexreplace regexReplace�F  0 mergetextitems mergeTextItems�Y ojvE�O [�[��l kh ��k+ E�O�j+ E�O��	 ���& )b  ,��&��m+ E�Ob  ,���m+ E�O��6GY h[OY��Ob  ,��l+  �E��D�Cpq�B�E 00 annotationboundsbyline annotationBoundsByLine�D �Ar�A r  �@�?�@ 0 
quadpoints 
quadPoints�? $0 annotationbounds annotationBounds�C  p 	�>�=�<�;�:�9�8�7�6�> 0 
quadpoints 
quadPoints�= $0 annotationbounds annotationBounds�< 0 	theorigin 	theOrigin�; 0 boundsbyline boundsByLine�: 0 maxquadcount maxQuadCount�9 0 	quadcount 	quadCount�8 0 topleftpoint topLeftPoint�7 $0 bottomrightpoint bottomRightPoint�6 0 
linebounds 
lineBoundsq �5�4�3�2�1�0�/
�5 
cobj
�4 .corecnte****       ****�3 �2 0 
pointvalue 
pointValue�1 0 x  �0 0 y  �/ 0 
makensrect 
makeNSRect�B ���k/E�OjvE�O�j �!E�OkE�O ��kh��/j+ E�O��m/j+ E�O��,��k/b  ��,FO��,��l/b  ��,FO��,��k/b  ��,FO��,��l/b  ��,FO)��,��,lv��,��,lvlvk+ E�O��6GO��E�[OY�tO� �.��-�,st�+�. 0 
makensrect 
makeNSRect�- �*u�* u  vv {�)�(�'�) 0 alist aList
�( 
list�'  �,  s �&�%�$�#�"�!� ��& 0 alist aList�% 0 x1  �$ 0 y1  �# 0 x2  �" 0 y2  �! 0 xwidth xWidth�  0 yheight yHeight� 0 a1rect a1Rectt �����������
� 
cobj� 
0 origin  � 0 x  � 0 y  � � 0 size  � 	0 width  � 
0 height  �  �  
� 
msng�+ ^ U�E[�k/E[�k/EQ�Z[�l/EQ�ZZ[�l/E[�k/EQ�Z[�l/EQ�ZZO��E�O��E�O���������E�O�W 	X  	� ascr  ��ޭ