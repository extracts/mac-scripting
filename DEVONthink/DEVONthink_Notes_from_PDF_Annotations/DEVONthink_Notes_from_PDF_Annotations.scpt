FasdUAS 1.101.10   ��   ��    k             l     ��  ��    , & DEVONthink Notes from PDF Annotations     � 	 	 L   D E V O N t h i n k   N o t e s   f r o m   P D F   A n n o t a t i o n s   
  
 l     ��  ��    2 , version 1.2, licensed under the MIT license     �   X   v e r s i o n   1 . 2 ,   l i c e n s e d   u n d e r   t h e   M I T   l i c e n s e      l     ��������  ��  ��        l     ��  ��    B < by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de     �   x   b y   M a t t h i a s   S t e f f e n s ,   k e y p o i n t s . a p p ,   m a t ( a t ) e x t r a c t s ( d o t ) d e      l     ��������  ��  ��        l     ��  ��    o i For each of the PDFs selected in DEVONthink, this script will iterate over its contained PDF annotations     �   �   F o r   e a c h   o f   t h e   P D F s   s e l e c t e d   i n   D E V O N t h i n k ,   t h i s   s c r i p t   w i l l   i t e r a t e   o v e r   i t s   c o n t a i n e d   P D F   a n n o t a t i o n s      l     ��   ��    Q K and create or update a Markdown record for each markup or text annotation.      � ! ! �   a n d   c r e a t e   o r   u p d a t e   a   M a r k d o w n   r e c o r d   f o r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n .   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & l f This script requires macOS 10.14 (High Sierra) or greater, the KeypointsScriptingLib v1.4 or greater,    ' � ( ( �   T h i s   s c r i p t   r e q u i r e s   m a c O S   1 0 . 1 4   ( H i g h   S i e r r a )   o r   g r e a t e r ,   t h e   K e y p o i n t s S c r i p t i n g L i b   v 1 . 4   o r   g r e a t e r , %  ) * ) l     �� + ,��   + g a and DEVONthink Pro v3.x or greater (DEVONthink Pro v3.9 or greater will be required to have deep    , � - - �   a n d   D E V O N t h i n k   P r o   v 3 . x   o r   g r e a t e r   ( D E V O N t h i n k   P r o   v 3 . 9   o r   g r e a t e r   w i l l   b e   r e q u i r e d   t o   h a v e   d e e p *  . / . l     �� 0 1��   0 0 * links to PDF annotations work correctly).    1 � 2 2 T   l i n k s   t o   P D F   a n n o t a t i o n s   w o r k   c o r r e c t l y ) . /  3 4 3 l     ��������  ��  ��   4  5 6 5 l     ��������  ��  ��   6  7 8 7 l     �� 9 :��   9   Setup:    : � ; ;    S e t u p : 8  < = < l     ��������  ��  ��   =  > ? > l     �� @ A��   @ s m -- Before running the script, do this once: Adjust the DEVONthink label <-> color mapping via the properties    A � B B �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   d o   t h i s   o n c e :   A d j u s t   t h e   D E V O N t h i n k   l a b e l   < - >   c o l o r   m a p p i n g   v i a   t h e   p r o p e r t i e s ?  C D C l     �� E F��   E v p     `label1` ... `label7` below and save this script again. If saving generates an error, please try again with    F � G G �           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w   a n d   s a v e   t h i s   s c r i p t   a g a i n .   I f   s a v i n g   g e n e r a t e s   a n   e r r o r ,   p l e a s e   t r y   a g a i n   w i t h D  H I H l     �� J K��   J ` Z     Script Debugger (which has a free "lite" mode): https://latenightsw.com/sd8/download/    K � L L �           S c r i p t   D e b u g g e r   ( w h i c h   h a s   a   f r e e   " l i t e "   m o d e ) :   h t t p s : / / l a t e n i g h t s w . c o m / s d 8 / d o w n l o a d / I  M N M l     ��������  ��  ��   N  O P O l     �� Q R��   Q t n -- You may also want to check the other properties below. These allow to customize the script, e.g. to enable    R � S S �   - -   Y o u   m a y   a l s o   w a n t   t o   c h e c k   t h e   o t h e r   p r o p e r t i e s   b e l o w .   T h e s e   a l l o w   t o   c u s t o m i z e   t h e   s c r i p t ,   e . g .   t o   e n a b l e P  T U T l     �� V W��   V L F     updating of existing notes, or automatic fetching of BibTeX data.    W � X X �           u p d a t i n g   o f   e x i s t i n g   n o t e s ,   o r   a u t o m a t i c   f e t c h i n g   o f   B i b T e X   d a t a . U  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     �� ] ^��   ] u o -- Copy the script to a suitable place, like the DEVONthink script folder, or the system's script menu folder.    ^ � _ _ �   - -   C o p y   t h e   s c r i p t   t o   a   s u i t a b l e   p l a c e ,   l i k e   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   o r   t h e   s y s t e m ' s   s c r i p t   m e n u   f o l d e r . \  ` a ` l     �� b c��   b N H     For a guide on how to enable and use the system's script menu, see:    c � d d �           F o r   a   g u i d e   o n   h o w   t o   e n a b l e   a n d   u s e   t h e   s y s t e m ' s   s c r i p t   m e n u ,   s e e : a  e f e l     �� g h��   g ? 9     https://iworkautomation.com/numbers/script-menu.html    h � i i r           h t t p s : / / i w o r k a u t o m a t i o n . c o m / n u m b e r s / s c r i p t - m e n u . h t m l f  j k j l     ��������  ��  ��   k  l m l l     �� n o��   n q k -- If you've placed your script into the DEVONthink script folder, you may also append a keyboard shortcut    o � p p �   - -   I f   y o u ' v e   p l a c e d   y o u r   s c r i p t   i n t o   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   y o u   m a y   a l s o   a p p e n d   a   k e y b o a r d   s h o r t c u t m  q r q l     �� s t��   s t n     description (like `___Command-Shift-Alt-A`) to the script's name. After restarting DEVONthink, you should    t � u u �           d e s c r i p t i o n   ( l i k e   ` _ _ _ C o m m a n d - S h i f t - A l t - A ` )   t o   t h e   s c r i p t ' s   n a m e .   A f t e r   r e s t a r t i n g   D E V O N t h i n k ,   y o u   s h o u l d r  v w v l     �� x y��   x J D     be able to run your script via the specified keyboard shortcut.    y � z z �           b e   a b l e   t o   r u n   y o u r   s c r i p t   v i a   t h e   s p e c i f i e d   k e y b o a r d   s h o r t c u t . w  { | { l     ��������  ��  ��   |  } ~ } l     ��������  ��  ��   ~   �  l     �� � ���   �   Usage:    � � � �    U s a g e : �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � n h -- Before running the script, please select one or more PDF records with PDF annotations in DEVONthink.    � � � � �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   p l e a s e   s e l e c t   o n e   o r   m o r e   P D F   r e c o r d s   w i t h   P D F   a n n o t a t i o n s   i n   D E V O N t h i n k . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- To run the script, select its menu entry from the (DEVONthink or system's) script menu, or press your    � � � � �   - -   T o   r u n   t h e   s c r i p t ,   s e l e c t   i t s   m e n u   e n t r y   f r o m   t h e   ( D E V O N t h i n k   o r   s y s t e m ' s )   s c r i p t   m e n u ,   o r   p r e s s   y o u r �  � � � l     �� � ���   � ' !     specified keyboard shortcut.    � � � � B           s p e c i f i e d   k e y b o a r d   s h o r t c u t . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- After the script has finished, you'll see a dialog with feedback on how many PDFs have been processed    � � � � �   - -   A f t e r   t h e   s c r i p t   h a s   f i n i s h e d ,   y o u ' l l   s e e   a   d i a l o g   w i t h   f e e d b a c k   o n   h o w   m a n y   P D F s   h a v e   b e e n   p r o c e s s e d �  � � � l     �� � ���   � m g     and how many note records have been created/updated. For each PDF, its annotation notes are stored    � � � � �           a n d   h o w   m a n y   n o t e   r e c o r d s   h a v e   b e e n   c r e a t e d / u p d a t e d .   F o r   e a c h   P D F ,   i t s   a n n o t a t i o n   n o t e s   a r e   s t o r e d �  � � � l     �� � ���   � m g     within a DEVONthink group next to the PDF. By default, the group is named identical to the PDF but    � � � � �           w i t h i n   a   D E V O N t h i n k   g r o u p   n e x t   t o   t h e   P D F .   B y   d e f a u l t ,   t h e   g r o u p   i s   n a m e d   i d e n t i c a l   t o   t h e   P D F   b u t �  � � � l     �� � ���   � / )     contains an " � Annotations" suffix.    � � � � R           c o n t a i n s   a n   "      A n n o t a t i o n s "   s u f f i x . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � m g -- Note that you can run the script multiple times with the same PDF record(s) selected in DEVONthink.    � � � � �   - -   N o t e   t h a t   y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k . �  � � � l     �� � ���   � n h     On a subsequent run of the script, all notes that were newly created (or updated) will be selected.    � � � � �           O n   a   s u b s e q u e n t   r u n   o f   t h e   s c r i p t ,   a l l   n o t e s   t h a t   w e r e   n e w l y   c r e a t e d   ( o r   u p d a t e d )   w i l l   b e   s e l e c t e d . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Discussion & Help:    � � � � &   D i s c u s s i o n   &   H e l p : �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � y s -- https://discourse.devontechnologies.com/t/script-to-create-individual-markdown-notes-from-pdf-annotations/80987    � � � � �   - -   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / s c r i p t - t o - c r e a t e - i n d i v i d u a l - m a r k d o w n - n o t e s - f r o m - p d f - a n n o t a t i o n s / 8 0 9 8 7 �  � � � l     �� � ���   � @ :     https://github.com/extracts/mac-scripting/discussions    � � � � t           h t t p s : / / g i t h u b . c o m / e x t r a c t s / m a c - s c r i p t i n g / d i s c u s s i o n s �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Notes:    � � � �    N o t e s : �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � z t -- The script will only recognize these annotation types: "Highlight", "StrikeOut", "Underline", "Squiggly", "Text"    � � � � �   - -   T h e   s c r i p t   w i l l   o n l y   r e c o g n i z e   t h e s e   a n n o t a t i o n   t y p e s :   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y " ,   " T e x t " �  � � � l     �� � ���   �       and "FreeText".    � � � � (           a n d   " F r e e T e x t " . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � u o -- For each selected PDF with PDF annotations, the script will create a DEVONthink group next to it containing    � � � � �   - -   F o r   e a c h   s e l e c t e d   P D F   w i t h   P D F   a n n o t a t i o n s ,   t h e   s c r i p t   w i l l   c r e a t e   a   D E V O N t h i n k   g r o u p   n e x t   t o   i t   c o n t a i n i n g �  � � � l     �� � ���   � y s     Markdown record(s) for all recognized PDF annotation(s). The group's name can be controlled via the properties    � � � � �           M a r k d o w n   r e c o r d ( s )   f o r   a l l   r e c o g n i z e d   P D F   a n n o t a t i o n ( s ) .   T h e   g r o u p ' s   n a m e   c a n   b e   c o n t r o l l e d   v i a   t h e   p r o p e r t i e s �  � � � l     �� � ���   � A ;     `noteFolderNamePrefix` & `noteFolderNameSuffix` below.    � � � � v           ` n o t e F o l d e r N a m e P r e f i x `   &   ` n o t e F o l d e r N a m e S u f f i x `   b e l o w . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � v p -- You can run the script multiple times with the same PDF record(s) selected in DEVONthink. If PDF annotations    � � � � �   - -   Y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k .   I f   P D F   a n n o t a t i o n s �  � � � l     �� � ���   � { u     have been added to the PDF file after the last script run, the next script run will add Markdown records for the    � � � � �           h a v e   b e e n   a d d e d   t o   t h e   P D F   f i l e   a f t e r   t h e   l a s t   s c r i p t   r u n ,   t h e   n e x t   s c r i p t   r u n   w i l l   a d d   M a r k d o w n   r e c o r d s   f o r   t h e �    l     ����   z t     newly created PDF annotations. Note that deletions will not get synced across. If existing PDF annotations have    � �           n e w l y   c r e a t e d   P D F   a n n o t a t i o n s .   N o t e   t h a t   d e l e t i o n s   w i l l   n o t   g e t   s y n c e d   a c r o s s .   I f   e x i s t i n g   P D F   a n n o t a t i o n s   h a v e  l     ����   y s     been updated the script can update the corresponding Markdown records. While this is off by default, it can be    �		 �           b e e n   u p d a t e d   t h e   s c r i p t   c a n   u p d a t e   t h e   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d s .   W h i l e   t h i s   i s   o f f   b y   d e f a u l t ,   i t   c a n   b e 

 l     ����   { u     enabled by setting below property `updateExistingNotes` to `true`. In that case, these properties can be updated    � �           e n a b l e d   b y   s e t t i n g   b e l o w   p r o p e r t y   ` u p d a t e E x i s t i n g N o t e s `   t o   ` t r u e ` .   I n   t h a t   c a s e ,   t h e s e   p r o p e r t i e s   c a n   b e   u p d a t e d  l     ����   x r     (if enabled below): name, note text, modification date, flagged status, rating, label, tags, custom metadata.    � �           ( i f   e n a b l e d   b e l o w ) :   n a m e ,   n o t e   t e x t ,   m o d i f i c a t i o n   d a t e ,   f l a g g e d   s t a t u s ,   r a t i n g ,   l a b e l ,   t a g s ,   c u s t o m   m e t a d a t a .  l     ����   ~ x     Note that if you change a PDF annotation's annotation type (say, from "Highlight" to "Underline"), this will always    � �           N o t e   t h a t   i f   y o u   c h a n g e   a   P D F   a n n o t a t i o n ' s   a n n o t a t i o n   t y p e   ( s a y ,   f r o m   " H i g h l i g h t "   t o   " U n d e r l i n e " ) ,   t h i s   w i l l   a l w a y s  l     ����   &       create a new Markdown note.    � @           c r e a t e   a   n e w   M a r k d o w n   n o t e .  l     ��������  ��  ��    !  l     ��"#��  " w q -- If possible, the PDF annotation's source text will get added to the body text of the Markdown record. However   # �$$ �   - -   I f   p o s s i b l e ,   t h e   P D F   a n n o t a t i o n ' s   s o u r c e   t e x t   w i l l   g e t   a d d e d   t o   t h e   b o d y   t e x t   o f   t h e   M a r k d o w n   r e c o r d .   H o w e v e r! %&% l     ��'(��  ' z t     note that, depending on the tool used for PDF annotation, this may fail or be inaccurate. In that case, you may   ( �)) �           n o t e   t h a t ,   d e p e n d i n g   o n   t h e   t o o l   u s e d   f o r   P D F   a n n o t a t i o n ,   t h i s   m a y   f a i l   o r   b e   i n a c c u r a t e .   I n   t h a t   c a s e ,   y o u   m a y& *+* l     ��,-��  , v p     improve text extraction success by tweaking the properties `lineWidthEnlargement` & `lineHeightEnlargement`   - �.. �           i m p r o v e   t e x t   e x t r a c t i o n   s u c c e s s   b y   t w e a k i n g   t h e   p r o p e r t i e s   ` l i n e W i d t h E n l a r g e m e n t `   &   ` l i n e H e i g h t E n l a r g e m e n t `+ /0/ l     ��12��  1       below.   2 �33            b e l o w .0 454 l     ��������  ��  ��  5 676 l     ��89��  8 w q -- Notes that have been added to a PDF annotation will also get added to the Markdown record's body text. Within   9 �:: �   - -   N o t e s   t h a t   h a v e   b e e n   a d d e d   t o   a   P D F   a n n o t a t i o n   w i l l   a l s o   g e t   a d d e d   t o   t h e   M a r k d o w n   r e c o r d ' s   b o d y   t e x t .   W i t h i n7 ;<; l     �=>�  = { u     a PDF annotation note, you can use following (Keypoints-style) syntax to explicitly set the name of the Markdown   > �?? �           a   P D F   a n n o t a t i o n   n o t e ,   y o u   c a n   u s e   f o l l o w i n g   ( K e y p o i n t s - s t y l e )   s y n t a x   t o   e x p l i c i t l y   s e t   t h e   n a m e   o f   t h e   M a r k d o w n< @A@ l     �~BC�~  B ( "     record and/or its properties:   C �DD D           r e c o r d   a n d / o r   i t s   p r o p e r t i e s :A EFE l     �}GH�}  G x r     - A line prefixed with `# ` (like a Markdown first-level heading) will be used as the Markdown record's name.   H �II �           -   A   l i n e   p r e f i x e d   w i t h   ` #   `   ( l i k e   a   M a r k d o w n   f i r s t - l e v e l   h e a d i n g )   w i l l   b e   u s e d   a s   t h e   M a r k d o w n   r e c o r d ' s   n a m e .F JKJ l     �|LM�|  L v p     - One or more line(s) prefixed with `< ` indicate a metadata line which will get stripped from the record's   M �NN �           -   O n e   o r   m o r e   l i n e ( s )   p r e f i x e d   w i t h   ` <   `   i n d i c a t e   a   m e t a d a t a   l i n e   w h i c h   w i l l   g e t   s t r i p p e d   f r o m   t h e   r e c o r d ' sK OPO l     �{QR�{  Q E ?        body text but which will set record properties instead:   R �SS ~                 b o d y   t e x t   b u t   w h i c h   w i l l   s e t   r e c o r d   p r o p e r t i e s   i n s t e a d :P TUT l     �zVW�z  V { u        - In a metadata line, include 1 to 5 asterisks or `?` characters to set the record's star-rating, for example   W �XX �                 -   I n   a   m e t a d a t a   l i n e ,   i n c l u d e   1   t o   5   a s t e r i s k s   o r   `& `   c h a r a c t e r s   t o   s e t   t h e   r e c o r d ' s   s t a r - r a t i n g ,   f o r   e x a m p l eU YZY l     �y[\�y  [ K E          `< ****` would set a 4-star rating for the Markdown record.   \ �]] �                     ` <   * * * * `   w o u l d   s e t   a   4 - s t a r   r a t i n g   f o r   t h e   M a r k d o w n   r e c o r d .Z ^_^ l     �x`a�x  ` x r        - In a metadata line, add the special tag `@:flagged` to set the Markdown record's flagged status to true.   a �bb �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   t h e   s p e c i a l   t a g   ` @ : f l a g g e d `   t o   s e t   t h e   M a r k d o w n   r e c o r d ' s   f l a g g e d   s t a t u s   t o   t r u e ._ cdc l     �wef�w  e w q        - In a metadata line, add any tags like `@tag` or `@another tag` to set these as the tags of the Markdown   f �gg �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   t a g s   l i k e   ` @ t a g `   o r   ` @ a n o t h e r   t a g `   t o   s e t   t h e s e   a s   t h e   t a g s   o f   t h e   M a r k d o w nd hih l     �vjk�v  j            record.   k �ll "                     r e c o r d .i mnm l     �uop�u  o v p        - In a metadata line, add any custom key:value attributes like `@:key:Some value` to set these as custom   p �qq �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   c u s t o m   k e y : v a l u e   a t t r i b u t e s   l i k e   ` @ : k e y : S o m e   v a l u e `   t o   s e t   t h e s e   a s   c u s t o mn rsr l     �ttu�t  t w q          metadata of the Markdown record. A custom attribute w/o a value (like `@:key`) will get a default value   u �vv �                     m e t a d a t a   o f   t h e   M a r k d o w n   r e c o r d .   A   c u s t o m   a t t r i b u t e   w / o   a   v a l u e   ( l i k e   ` @ : k e y ` )   w i l l   g e t   a   d e f a u l t   v a l u es wxw l     �syz�s  y            of `true`.   z �{{ (                     o f   ` t r u e ` .x |}| l     �r~�r  ~ p j        Note that you can also include any/all of these properties on a single metadata line, for example:    ��� �                 N o t e   t h a t   y o u   c a n   a l s o   i n c l u d e   a n y / a l l   o f   t h e s e   p r o p e r t i e s   o n   a   s i n g l e   m e t a d a t a   l i n e ,   f o r   e x a m p l e :} ��� l     �q���q  � C =        `< **** @:flagged @tag @another tag @:key:Some value`   � ��� z                 ` <   * * * *   @ : f l a g g e d   @ t a g   @ a n o t h e r   t a g   @ : k e y : S o m e   v a l u e `� ��� l     �p�o�n�p  �o  �n  � ��� l     �m���m  � t n -- If your PDF annotation notes contain custom markup syntax, you can use the `preprocessAnnotationComment()`   � ��� �   - -   I f   y o u r   P D F   a n n o t a t i o n   n o t e s   c o n t a i n   c u s t o m   m a r k u p   s y n t a x ,   y o u   c a n   u s e   t h e   ` p r e p r o c e s s A n n o t a t i o n C o m m e n t ( ) `� ��� l     �l���l  � h b     method to preprocess & transform this syntax to the (Keypoints-style) format described above.   � ��� �           m e t h o d   t o   p r e p r o c e s s   &   t r a n s f o r m   t h i s   s y n t a x   t o   t h e   ( K e y p o i n t s - s t y l e )   f o r m a t   d e s c r i b e d   a b o v e .� ��� l     �k�j�i�k  �j  �i  � ��� l     �h���h  � { u -- For your PDF record, as well as for each of the created Markdown records, a link to the "... � Annotations" group   � ��� �   - -   F o r   y o u r   P D F   r e c o r d ,   a s   w e l l   a s   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s ,   a   l i n k   t o   t h e   " . . .      A n n o t a t i o n s "   g r o u p� ��� l     �g���g  � { u     folder will be copied to a custom metadata field (named `pdfannotations`). This allows you to easily get back to   � ��� �           f o l d e r   w i l l   b e   c o p i e d   t o   a   c u s t o m   m e t a d a t a   f i e l d   ( n a m e d   ` p d f a n n o t a t i o n s ` ) .   T h i s   a l l o w s   y o u   t o   e a s i l y   g e t   b a c k   t o� ��� l     �f���f  � / )     the PDF's group of annotation notes.   � ��� R           t h e   P D F ' s   g r o u p   o f   a n n o t a t i o n   n o t e s .� ��� l     �e�d�c�e  �d  �c  � ��� l     �b���b  � x r -- The URL field of each Markdown record will be set to a deep link that directly points to the corresponding PDF   � ��� �   - -   T h e   U R L   f i e l d   o f   e a c h   M a r k d o w n   r e c o r d   w i l l   b e   s e t   t o   a   d e e p   l i n k   t h a t   d i r e c t l y   p o i n t s   t o   t h e   c o r r e s p o n d i n g   P D F� ��� l     �a���a  � } w     annotation. I.e., clicking this deep link will open the associated PDF and scroll the corresponding PDF annotation   � ��� �           a n n o t a t i o n .   I . e . ,   c l i c k i n g   t h i s   d e e p   l i n k   w i l l   o p e n   t h e   a s s o c i a t e d   P D F   a n d   s c r o l l   t h e   c o r r e s p o n d i n g   P D F   a n n o t a t i o n� ��� l     �`���`  � H B     into view. Note that this requires DEVONthink 3.9 or greater.   � ��� �           i n t o   v i e w .   N o t e   t h a t   t h i s   r e q u i r e s   D E V O N t h i n k   3 . 9   o r   g r e a t e r .� ��� l     �_�^�]�_  �^  �]  � ��� l     �\���\  �  y -- For each Markdown record, the script will try to assign a color label that matches your annotation's highlight color.   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   t r y   t o   a s s i g n   a   c o l o r   l a b e l   t h a t   m a t c h e s   y o u r   a n n o t a t i o n ' s   h i g h l i g h t   c o l o r .� ��� l     �[���[  � x r     Note that, to suit your personal DEVONthink label setup, you'll need to adjust the mapping via the properties   � ��� �           N o t e   t h a t ,   t o   s u i t   y o u r   p e r s o n a l   D E V O N t h i n k   l a b e l   s e t u p ,   y o u ' l l   n e e d   t o   a d j u s t   t h e   m a p p i n g   v i a   t h e   p r o p e r t i e s� ��� l     �Z���Z  � ' !     `label1` ... `label7` below.   � ��� B           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w .� ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V���V  � w q -- For each Markdown record, the script will also add an ID-like alias (like "039H-8GAB-1GPA") that's unique and   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   a l s o   a d d   a n   I D - l i k e   a l i a s   ( l i k e   " 0 3 9 H - 8 G A B - 1 G P A " )   t h a t ' s   u n i q u e   a n d� ��� l     �U���U  � y s     which optionally can be used to create a stable Wiki-link (like "[[039H-8GAB-1GPA]]") to this Markdown record.   � ��� �           w h i c h   o p t i o n a l l y   c a n   b e   u s e d   t o   c r e a t e   a   s t a b l e   W i k i - l i n k   ( l i k e   " [ [ 0 3 9 H - 8 G A B - 1 G P A ] ] " )   t o   t h i s   M a r k d o w n   r e c o r d .� ��� l     �T�S�R�T  �S  �R  � ��� l     �Q���Q  � � | -- For each Markdown record, the script will also add a sort identifier string (like "2-1-125" which codifies with integers   � ��� �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   a l s o   a d d   a   s o r t   i d e n t i f i e r   s t r i n g   ( l i k e   " 2 - 1 - 1 2 5 "   w h i c h   c o d i f i e s   w i t h   i n t e g e r s� ��� l     �P���P  � { u     the annotation's page, column & position from top) to the `annotationorder` custom metadata field. This metadata   � ��� �           t h e   a n n o t a t i o n ' s   p a g e ,   c o l u m n   &   p o s i t i o n   f r o m   t o p )   t o   t h e   ` a n n o t a t i o n o r d e r `   c u s t o m   m e t a d a t a   f i e l d .   T h i s   m e t a d a t a� ��� l     �O���O  � z t     field can be used in DEVONthink to sort annotations in the order they appear in the text of a page. By default,   � ��� �           f i e l d   c a n   b e   u s e d   i n   D E V O N t h i n k   t o   s o r t   a n n o t a t i o n s   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   t e x t   o f   a   p a g e .   B y   d e f a u l t ,� ��� l     �N���N  � � z     sort identifiers will be generated so that they try to respect a typical 2-column text layout. Note that this may not   � ��� �           s o r t   i d e n t i f i e r s   w i l l   b e   g e n e r a t e d   s o   t h a t   t h e y   t r y   t o   r e s p e c t   a   t y p i c a l   2 - c o l u m n   t e x t   l a y o u t .   N o t e   t h a t   t h i s   m a y   n o t� ��� l     �M���M  � ~ x     always be perfect. To further control sort identifier generation, see the properties `respectMultiColumnPDFLayouts`   � ��� �           a l w a y s   b e   p e r f e c t .   T o   f u r t h e r   c o n t r o l   s o r t   i d e n t i f i e r   g e n e r a t i o n ,   s e e   t h e   p r o p e r t i e s   ` r e s p e c t M u l t i C o l u m n P D F L a y o u t s `� ��� l     �L���L  � &       and `maxTextColumns` below.   � ��� @           a n d   ` m a x T e x t C o l u m n s `   b e l o w .� ��� l     �K�J�I�K  �J  �I  � ��� l     �H���H  � v p -- If the PDF metadata contain a DOI, this DOI will get written to the `doi` custom metadata field for your PDF   � ��� �   - -   I f   t h e   P D F   m e t a d a t a   c o n t a i n   a   D O I ,   t h i s   D O I   w i l l   g e t   w r i t t e n   t o   t h e   ` d o i `   c u s t o m   m e t a d a t a   f i e l d   f o r   y o u r   P D F� ��� l     �G���G  � _ Y     record, the "... � Annotations" group, and for each of the created Markdown records.   � ��� �           r e c o r d ,   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .� ��� l     �F�E�D�F  �E  �D  � � � l     �C�C    y -- Similarly, if the PDF record's custom metadata contain a citekey, this citekey will also get written to the `citekey`    � �   - -   S i m i l a r l y ,   i f   t h e   P D F   r e c o r d ' s   c u s t o m   m e t a d a t a   c o n t a i n   a   c i t e k e y ,   t h i s   c i t e k e y   w i l l   a l s o   g e t   w r i t t e n   t o   t h e   ` c i t e k e y `   l     �B�B   q k     custom metadata field for the "... � Annotations" group, and for each of the created Markdown records.    � �           c u s t o m   m e t a d a t a   f i e l d   f o r   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s . 	
	 l     �A�@�?�A  �@  �?  
  l     �>�>   } w -- If a DOI was found for the PDF, the script will also attempt to fetch its bibliographic metadata and set the custom    � �   - -   I f   a   D O I   w a s   f o u n d   f o r   t h e   P D F ,   t h e   s c r i p t   w i l l   a l s o   a t t e m p t   t o   f e t c h   i t s   b i b l i o g r a p h i c   m e t a d a t a   a n d   s e t   t h e   c u s t o m  l     �=�=   y s     metadata and/or the Finder comment of the "... � Annotations" group & its Markdown records accordingly. Please    � �           m e t a d a t a   a n d / o r   t h e   F i n d e r   c o m m e n t   o f   t h e   " . . .      A n n o t a t i o n s "   g r o u p   &   i t s   M a r k d o w n   r e c o r d s   a c c o r d i n g l y .   P l e a s e  l     �<�<   W Q     see the properties below for options to disable or fine-tune this behaviour.    � �           s e e   t h e   p r o p e r t i e s   b e l o w   f o r   o p t i o n s   t o   d i s a b l e   o r   f i n e - t u n e   t h i s   b e h a v i o u r .  l     �;�:�9�;  �:  �9    l     �8�7�6�8  �7  �6    l     �5 !�5      Ideas for Improvement:   ! �"" .   I d e a s   f o r   I m p r o v e m e n t : #$# l     �4�3�2�4  �3  �2  $ %&% l     �1'(�1  '  y allow name & content of created Markdown records to be generated via a template (e.g., to allow for custom YAML headers)   ( �)) �   a l l o w   n a m e   &   c o n t e n t   o f   c r e a t e d   M a r k d o w n   r e c o r d s   t o   b e   g e n e r a t e d   v i a   a   t e m p l a t e   ( e . g . ,   t o   a l l o w   f o r   c u s t o m   Y A M L   h e a d e r s )& *+* l     �0,-�0  , � � allow the script to be called by a smart rule (displaying feedback on completion in a notification and w/o selecting any updated records)   - �..   a l l o w   t h e   s c r i p t   t o   b e   c a l l e d   b y   a   s m a r t   r u l e   ( d i s p l a y i n g   f e e d b a c k   o n   c o m p l e t i o n   i n   a   n o t i f i c a t i o n   a n d   w / o   s e l e c t i n g   a n y   u p d a t e d   r e c o r d s )+ /0/ l     �/12�/  1 q k offer a configuration option to specify which metadata shall get exported into which custom metadata field   2 �33 �   o f f e r   a   c o n f i g u r a t i o n   o p t i o n   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l d0 454 l     �.67�.  6 f ` if just some DEVONthink groups were selected, allow to get all contained PDFs and process these   7 �88 �   i f   j u s t   s o m e   D E V O N t h i n k   g r o u p s   w e r e   s e l e c t e d ,   a l l o w   t o   g e t   a l l   c o n t a i n e d   P D F s   a n d   p r o c e s s   t h e s e5 9:9 l     �-;<�-  ; � � allow to optionally look-up the PDF file in a reference manager like Bookends and auto-fetch citekey & citation info from there   < �==    a l l o w   t o   o p t i o n a l l y   l o o k - u p   t h e   P D F   f i l e   i n   a   r e f e r e n c e   m a n a g e r   l i k e   B o o k e n d s   a n d   a u t o - f e t c h   c i t e k e y   &   c i t a t i o n   i n f o   f r o m   t h e r e: >?> l     �,@A�,  @ x r allow to (optionally) remove tags from Markdown records for PDF annotations whose corresponding tags were removed   A �BB �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   t a g s   f r o m   M a r k d o w n   r e c o r d s   f o r   P D F   a n n o t a t i o n s   w h o s e   c o r r e s p o n d i n g   t a g s   w e r e   r e m o v e d? CDC l     �+EF�+  E w q allow to (optionally) remove Markdown records from DEVONthink for PDF annotations that were deleted from the PDF   F �GG �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   M a r k d o w n   r e c o r d s   f r o m   D E V O N t h i n k   f o r   P D F   a n n o t a t i o n s   t h a t   w e r e   d e l e t e d   f r o m   t h e   P D FD HIH l     �*JK�*  J u o support any annotation types other than "Highlight", "StrikeOut", "Underline", "Squiggly", "Text" & "FreeText"   K �LL �   s u p p o r t   a n y   a n n o t a t i o n   t y p e s   o t h e r   t h a n   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y " ,   " T e x t "   &   " F r e e T e x t "I MNM l     �)OP�)  O 0 * (see also inline TODOs in the code below)   P �QQ T   ( s e e   a l s o   i n l i n e   T O D O s   i n   t h e   c o d e   b e l o w )N RSR l     �(�'�&�(  �'  �&  S TUT l     �%�$�#�%  �$  �#  U VWV l     �"XY�"  X W Q ------------- optionally adopt the property values below this line -------------   Y �ZZ �   - - - - - - - - - - - - -   o p t i o n a l l y   a d o p t   t h e   p r o p e r t y   v a l u e s   b e l o w   t h i s   l i n e   - - - - - - - - - - - - -W [\[ l     �!� ��!  �   �  \ ]^] l     ����  �  �  ^ _`_ l     �ab�  a c ] Prefix prepended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.   b �cc �   P r e f i x   p r e p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .` ded j     �f� ,0 notefoldernameprefix noteFolderNamePrefixf m     gg �hh  e iji l     ����  �  �  j klk l     �mn�  m b \ Suffix appended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.   n �oo �   S u f f i x   a p p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .l pqp j    �r� ,0 notefoldernamesuffix noteFolderNameSuffixr m    ss �tt       A n n o t a t i o n sq uvu l     ����  �  �  v wxw l     �yz�  y ` Z Maps DEVONthink label indexes to color names. Please set the `colorName` values according   z �{{ �   M a p s   D E V O N t h i n k   l a b e l   i n d e x e s   t o   c o l o r   n a m e s .   P l e a s e   s e t   t h e   ` c o l o r N a m e `   v a l u e s   a c c o r d i n gx |}| l     �~�  ~ d ^  to the label <-> color mapping that you've chosen in your DEVONthink Settings under "Color".    ��� �     t o   t h e   l a b e l   < - >   c o l o r   m a p p i n g   t h a t   y o u ' v e   c h o s e n   i n   y o u r   D E V O N t h i n k   S e t t i n g s   u n d e r   " C o l o r " .} ��� l     ����  � ] W E.g., if your "Color" settings specify a yellowish color for the first label, then use   � ��� �   E . g . ,   i f   y o u r   " C o l o r "   s e t t i n g s   s p e c i f y   a   y e l l o w i s h   c o l o r   f o r   t h e   f i r s t   l a b e l ,   t h e n   u s e� ��� l     ����  � ` Z `{labelIndex:1, colorName:"yellow"}`. Note that each label must have a unique color name.   � ��� �   ` { l a b e l I n d e x : 1 ,   c o l o r N a m e : " y e l l o w " } ` .   N o t e   t h a t   e a c h   l a b e l   m u s t   h a v e   a   u n i q u e   c o l o r   n a m e .� ��� l     ����  � c ] Available color names: red, orange, yellow, green, cyan, light blue, dark blue, purple, pink   � ��� �   A v a i l a b l e   c o l o r   n a m e s :   r e d ,   o r a n g e ,   y e l l o w ,   g r e e n ,   c y a n ,   l i g h t   b l u e ,   d a r k   b l u e ,   p u r p l e ,   p i n k� ��� j    ��� 
0 label1  � K    �� ���� 0 
labelindex 
labelIndex� m    �
�
 � �	���	 0 	colorname 	colorName� m   	 
�� ���  r e d�  � ��� j    ��� 
0 label2  � K    �� ���� 0 
labelindex 
labelIndex� m    �� � ���� 0 	colorname 	colorName� m    �� ��� 
 g r e e n�  � ��� j    ��� 
0 label3  � K    �� ���� 0 
labelindex 
labelIndex� m    � �  � ������� 0 	colorname 	colorName� m    �� ���  l i g h t   b l u e��  � ��� j    %����� 
0 label4  � K    $�� ������ 0 
labelindex 
labelIndex� m     ���� � ������� 0 	colorname 	colorName� m   ! "�� ���  y e l l o w��  � ��� j   & /����� 
0 label5  � K   & .�� ������ 0 
labelindex 
labelIndex� m   ' (���� � ������� 0 	colorname 	colorName� m   ) ,�� ���  o r a n g e��  � ��� j   0 ;����� 
0 label6  � K   0 :�� ������ 0 
labelindex 
labelIndex� m   1 4���� � ������� 0 	colorname 	colorName� m   5 8�� ���  d a r k   b l u e��  � ��� j   < G����� 
0 label7  � K   < F�� ������ 0 
labelindex 
labelIndex� m   = @���� � ������� 0 	colorname 	colorName� m   A D�� ���  p u r p l e��  � ��� l     ��������  ��  ��  � ��� l     ������  � h b Set to `true` if you want this script to update Markdown records that already exist in DEVONthink   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   u p d a t e   M a r k d o w n   r e c o r d s   t h a t   a l r e a d y   e x i s t   i n   D E V O N t h i n k� ��� l     ������  � j d for PDF annotations from your PDF file(s) and which were created on previous script runs. This will   � ��� �   f o r   P D F   a n n o t a t i o n s   f r o m   y o u r   P D F   f i l e ( s )   a n d   w h i c h   w e r e   c r e a t e d   o n   p r e v i o u s   s c r i p t   r u n s .   T h i s   w i l l� ��� l     ������  � i c be only necessary if you've made changes to the PDF annotations (or their associated notes) within   � ��� �   b e   o n l y   n e c e s s a r y   i f   y o u ' v e   m a d e   c h a n g e s   t o   t h e   P D F   a n n o t a t i o n s   ( o r   t h e i r   a s s o c i a t e d   n o t e s )   w i t h i n� ��� l     ������  � 9 3 the PDF file after importing them into DEVONthink.   � ��� f   t h e   P D F   f i l e   a f t e r   i m p o r t i n g   t h e m   i n t o   D E V O N t h i n k .� ��� l     ������  �   Notes:   � ���    N o t e s :� ��� l     ������  � e _ - @warning Note that updating of existing notes may override any additions/changes that you've   � ��� �   -   @ w a r n i n g   N o t e   t h a t   u p d a t i n g   o f   e x i s t i n g   n o t e s   m a y   o v e r r i d e   a n y   a d d i t i o n s / c h a n g e s   t h a t   y o u ' v e� ��� l     ������  � 7 1    made to these Markdown records in DEVONthink.   � ��� b         m a d e   t o   t h e s e   M a r k d o w n   r e c o r d s   i n   D E V O N t h i n k .� ��� l     ������  � j d - See below properties to specify which attributes shall get updated and which shall be left alone.   � ��� �   -   S e e   b e l o w   p r o p e r t i e s   t o   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e .� ��� j   H J����� *0 updateexistingnotes updateExistingNotes� m   H I��
�� boovfals� ��� l     ��������  ��  ��  � ��� l     �� ��    c ] When updating existing Markdown records, specify which attributes shall get updated (`true`)    � �   W h e n   u p d a t i n g   e x i s t i n g   M a r k d o w n   r e c o r d s ,   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   ( ` t r u e ` )�  l     ����   / ) and which shall be left alone (`false`).    � R   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e   ( ` f a l s e ` ) . 	 l     ��
��  
   Notes:    �    N o t e s :	  l     ����   m g - Tags will only be added to any existing list of record tags, so these won't get replaced as a whole.    � �   -   T a g s   w i l l   o n l y   b e   a d d e d   t o   a n y   e x i s t i n g   l i s t   o f   r e c o r d   t a g s ,   s o   t h e s e   w o n ' t   g e t   r e p l a c e d   a s   a   w h o l e .  l     ����   M G    Also, tags won't get removed from the existing list of record tags.    � �         A l s o ,   t a g s   w o n ' t   g e t   r e m o v e d   f r o m   t h e   e x i s t i n g   l i s t   o f   r e c o r d   t a g s .  l     ����   d ^ - Custom metadata fields will also get added to any existing record metadata, and only fields    � �   -   C u s t o m   m e t a d a t a   f i e l d s   w i l l   a l s o   g e t   a d d e d   t o   a n y   e x i s t i n g   r e c o r d   m e t a d a t a ,   a n d   o n l y   f i e l d s  l     ����   , &    of the same name may get replaced.    �   L         o f   t h e   s a m e   n a m e   m a y   g e t   r e p l a c e d . !"! j   K M��#�� 80 updatenameforexistingnotes updateNameForExistingNotes# m   K L��
�� boovfals" $%$ j   N P��&�� F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes& m   N O��
�� boovtrue% '(' j   Q S��)�� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes) m   Q R��
�� boovtrue( *+* j   T V��,�� J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes, m   T U��
�� boovtrue+ -.- j   W Y��/�� <0 updateratingforexistingnotes updateRatingForExistingNotes/ m   W X��
�� boovtrue. 010 j   Z \��2�� :0 updatelabelforexistingnotes updateLabelForExistingNotes2 m   Z [��
�� boovtrue1 343 j   ] a��5�� 80 updatetagsforexistingnotes updateTagsForExistingNotes5 m   ] ^��
�� boovtrue4 676 j   b f��8�� L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes8 m   b c��
�� boovtrue7 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  = f ` Specify if custom metadata of the DEVONthink groups that host a PDF file's Markdown notes shall   > �?? �   S p e c i f y   i f   c u s t o m   m e t a d a t a   o f   t h e   D E V O N t h i n k   g r o u p s   t h a t   h o s t   a   P D F   f i l e ' s   M a r k d o w n   n o t e s   s h a l l< @A@ l     ��BC��  B l f get updated (`true`) or not (`false`). If set to `true`, this script may populate the custom metadata   C �DD �   g e t   u p d a t e d   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   s e t   t o   ` t r u e ` ,   t h i s   s c r i p t   m a y   p o p u l a t e   t h e   c u s t o m   m e t a d a t aA EFE l     ��GH��  G j d properties `sourcefile`, `citekey` & `doi`, as well as any bibliographic metadata that were fetched   H �II �   p r o p e r t i e s   ` s o u r c e f i l e ` ,   ` c i t e k e y `   &   ` d o i ` ,   a s   w e l l   a s   a n y   b i b l i o g r a p h i c   m e t a d a t a   t h a t   w e r e   f e t c h e dF JKJ l     ��LM��  L   for a DOI (see below).   M �NN .   f o r   a   D O I   ( s e e   b e l o w ) .K OPO j   g k��Q�� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFoldersQ m   g h��
�� boovtrueP RSR l     ��������  ��  ��  S TUT l     ��VW��  V i c Set to `true` if you want this script to select all records that were actually created or updated.   W �XX �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   s e l e c t   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   c r e a t e d   o r   u p d a t e d .U YZY j   l p��[�� ,0 selectupdatedrecords selectUpdatedRecords[ m   l m��
�� boovtrueZ \]\ l     ��������  ��  ��  ] ^_^ l     ��`a��  ` j d Set to `true` if you want this script to fetch bibliographic metadata for a PDF's DOI via an online   a �bb �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I   v i a   a n   o n l i n e_ cdc l     ��ef��  e V P request to OpenAlex.org (and possibly further requests to CrossRef, see below).   f �gg �   r e q u e s t   t o   O p e n A l e x . o r g   ( a n d   p o s s i b l y   f u r t h e r   r e q u e s t s   t o   C r o s s R e f ,   s e e   b e l o w ) .d hih l     ��jk��  j o i Note that setting this to `false` will disable all online requests, i.e. this will also prevent fetching   k �ll �   N o t e   t h a t   s e t t i n g   t h i s   t o   ` f a l s e `   w i l l   d i s a b l e   a l l   o n l i n e   r e q u e s t s ,   i . e .   t h i s   w i l l   a l s o   p r e v e n t   f e t c h i n gi mnm l     ��op��  o l f of BibTeX data & formatted citations even if the respective properties have been set to `true` below.   p �qq �   o f   B i b T e X   d a t a   &   f o r m a t t e d   c i t a t i o n s   e v e n   i f   t h e   r e s p e c t i v e   p r o p e r t i e s   h a v e   b e e n   s e t   t o   ` t r u e `   b e l o w .n rsr j   q u��t�� $0 fetchdoimetadata fetchDOIMetadatat m   q r��
�� boovtrues uvu l     ��������  ��  ��  v wxw l     ��yz��  y j d Set to `true` if you want this script to _always_ fetch bibliographic metadata for a PDF's DOI, and   z �{{ �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   _ a l w a y s _   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   a n dx |}| l     ��~��  ~ h b not only once for each PDF (when creating the DEVONthink group that hosts the PDF file's Markdown    ��� �   n o t   o n l y   o n c e   f o r   e a c h   P D F   ( w h e n   c r e a t i n g   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n} ��� l     ������  � o i notes). Usually, you'd want the latter (i.e. `false`). But setting this property (temporarily) to `true`   � ��� �   n o t e s ) .   U s u a l l y ,   y o u ' d   w a n t   t h e   l a t t e r   ( i . e .   ` f a l s e ` ) .   B u t   s e t t i n g   t h i s   p r o p e r t y   ( t e m p o r a r i l y )   t o   ` t r u e `� ��� l     ������  � i c can be useful to add or update bibliographic metadata for existing notes folders & Markdown notes.   � ��� �   c a n   b e   u s e f u l   t o   a d d   o r   u p d a t e   b i b l i o g r a p h i c   m e t a d a t a   f o r   e x i s t i n g   n o t e s   f o l d e r s   &   M a r k d o w n   n o t e s .� ��� j   v z����� 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata� m   v w��
�� boovfals� ��� l     ��������  ��  ��  � ��� l     ������  � e _ When fetching bibliographic metadata for a PDF's DOI, this script can also fetch corresponding   � ��� �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   c o r r e s p o n d i n g� ��� l     ������  � ` Z BibTeX data (which will be copied to a custom ("bibtex") metadata field, and which can be   � ��� �   B i b T e X   d a t a   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " b i b t e x " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n   b e� ��� l     ������  � X R appended to the Finder comment of a created Markdown record as well (see below)).   � ��� �   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .� ��� l     ������  � h b Set to `true` if you also want to fetch BibTeX data for the given DOI from CrossRef.org, else set   � ��� �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   B i b T e X   d a t a   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,   e l s e   s e t� ��� l     ������  � c ] to `false`. Note that this will cause an extra online request which may take a second or so.   � ��� �   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   s e c o n d   o r   s o .� ��� j   { ����� 0 fetchbibtex fetchBibTeX� m   { |��
�� boovfals� ��� l     ��������  ��  ��  � ��� l     ������  � i c Set to `true` if you want this script to append the BibTeX data (that was fetched for a PDF's DOI)   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   B i b T e X   d a t a   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s   D O I )� ��� l     ������  � < 6 to the Finder comment of the created Markdown record.   � ��� l   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .� ��� j   � ������ :0 appendbibtextofindercomment appendBibTeXToFinderComment� m   � ���
�� boovfals� ��� l     ��������  ��  ��  � ��� l     ������  � g a When fetching bibliographic metadata for a PDF's DOI, this script can also fetch a corresponding   � ��� �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   a   c o r r e s p o n d i n g� ��� l     ������  � g a formatted citation (which will be copied to a custom ("reference") metadata field, and which can   � ��� �   f o r m a t t e d   c i t a t i o n   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " r e f e r e n c e " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n� ��� l     ������  � [ U be appended to the Finder comment of a created Markdown record as well (see below)).   � ��� �   b e   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .� ��� l     ������  � h b Set to `true` if you also want to fetch a formatted citation for the given DOI from CrossRef.org,   � ��� �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   a   f o r m a t t e d   c i t a t i o n   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,� ��� l     ������  � k e else set to `false`. Note that this will cause an extra online request which may take a few seconds.   � ��� �   e l s e   s e t   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   f e w   s e c o n d s .� ��� j   � ������ 00 fetchformattedcitation fetchFormattedCitation� m   � ���
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � k e Set to `true` if you want this script to append the formatted citation (that was fetched for a PDF's   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   f o r m a t t e d   c i t a t i o n   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s� ��� l     ������  � A ; DOI) to the Finder comment of the created Markdown record.   � ��� v   D O I )   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .� ��� j   � ������ P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment� m   � ���
�� boovtrue� ��� l     ��~�}�  �~  �}  � ��� l     �|���|  � f ` The name of the citation style file (as obtained from https://www.zotero.org/styles) to be used   � ��� �   T h e   n a m e   o f   t h e   c i t a t i o n   s t y l e   f i l e   ( a s   o b t a i n e d   f r o m   h t t p s : / / w w w . z o t e r o . o r g / s t y l e s )   t o   b e   u s e d� ��� l     �{���{  � 2 , when generating a formatted citation, e.g.:   � ��� X   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :� ��� l     �z���z  � i c apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,   � ��� �   a p a   ( d e f a u l t ) ,   a p a - 6 t h - e d i t i o n ,   c h i c a g o - a u t h o r - d a t e ,   e l s e v i e r - h a r v a r d ,   s p r i n g e r - b a s i c - a u t h o r - d a t e ,� ��� l     �y���y  � 9 3 modern-language-association, vancouver-author-date   � ��� f   m o d e r n - l a n g u a g e - a s s o c i a t i o n ,   v a n c o u v e r - a u t h o r - d a t e� ��� j   � ��x �x &0 citationstylename citationStyleName  m   � � �  a p a�  l     �w�v�u�w  �v  �u    l     �t�t   i c The locale code that specifies which localization data (term translations, localized date formats,    �		 �   T h e   l o c a l e   c o d e   t h a t   s p e c i f i e s   w h i c h   l o c a l i z a t i o n   d a t a   ( t e r m   t r a n s l a t i o n s ,   l o c a l i z e d   d a t e   f o r m a t s , 

 l     �s�s   U O and grammar options) shall be used when generating a formatted citation, e.g.:    � �   a n d   g r a m m a r   o p t i o n s )   s h a l l   b e   u s e d   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :  l     �r�r   @ : en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN    � t   e n - U S   ( d e f a u l t ) ,   e n - G B ,   f r - F R ,   e s - E S ,   d e - D E ,   r u - R U ,   z h - C N  j   � ��q�q  0 citationlocale citationLocale m   � � � 
 e n - U S  l     �p�o�n�p  �o  �n    l     �m�l�k�m  �l  �k    l     �j �j   W Q ----------- usually, you don't need to edit anything below this line -----------     �!! �   - - - - - - - - - - -   u s u a l l y ,   y o u   d o n ' t   n e e d   t o   e d i t   a n y t h i n g   b e l o w   t h i s   l i n e   - - - - - - - - - - - "#" l     �i�h�g�i  �h  �g  # $%$ l     �f�e�d�f  �e  �d  % &'& l     �c()�c  ( Z T Decimal numbers that specify how much the bounding box encompassing an annotation's   ) �** �   D e c i m a l   n u m b e r s   t h a t   s p e c i f y   h o w   m u c h   t h e   b o u n d i n g   b o x   e n c o m p a s s i n g   a n   a n n o t a t i o n ' s' +,+ l     �b-.�b  - c ] individual line shall be enlarged vertically & horizontally so that it fully covers all text   . �// �   i n d i v i d u a l   l i n e   s h a l l   b e   e n l a r g e d   v e r t i c a l l y   &   h o r i z o n t a l l y   s o   t h a t   i t   f u l l y   c o v e r s   a l l   t e x t, 010 l     �a23�a  2    highlighted on that line.   3 �44 4   h i g h l i g h t e d   o n   t h a t   l i n e .1 565 l     �`78�`  7 e _ If you find that this script somehow fails to fully extract all of an annotation's text (or if   8 �99 �   I f   y o u   f i n d   t h a t   t h i s   s c r i p t   s o m e h o w   f a i l s   t o   f u l l y   e x t r a c t   a l l   o f   a n   a n n o t a t i o n ' s   t e x t   ( o r   i f6 :;: l     �_<=�_  < [ U it extracts too much) then you may want to adjust these decimal numbers (e.g. by 0.1   = �>> �   i t   e x t r a c t s   t o o   m u c h )   t h e n   y o u   m a y   w a n t   t o   a d j u s t   t h e s e   d e c i m a l   n u m b e r s   ( e . g .   b y   0 . 1; ?@? l     �^AB�^  A   increments).   B �CC    i n c r e m e n t s ) .@ DED l     �]FG�]  F a [ However, note that larger values will increase the likeliness that adjacent characters not   G �HH �   H o w e v e r ,   n o t e   t h a t   l a r g e r   v a l u e s   w i l l   i n c r e a s e   t h e   l i k e l i n e s s   t h a t   a d j a c e n t   c h a r a c t e r s   n o tE IJI l     �\KL�\  K = 7 belonging to the annotation will get included as well.   L �MM n   b e l o n g i n g   t o   t h e   a n n o t a t i o n   w i l l   g e t   i n c l u d e d   a s   w e l l .J NON j   � ��[P�[ ,0 linewidthenlargement lineWidthEnlargementP m   � �QQ ?�ffffffO RSR j   � ��ZT�Z .0 lineheightenlargement lineHeightEnlargementT m   � �UU ?�333333S VWV l     �Y�X�W�Y  �X  �W  W XYX l     �VZ[�V  Z c ] Defines lower and upper hue limits for common colors. Limit values are inclusive and must be   [ �\\ �   D e f i n e s   l o w e r   a n d   u p p e r   h u e   l i m i t s   f o r   c o m m o n   c o l o r s .   L i m i t   v a l u e s   a r e   i n c l u s i v e   a n d   m u s t   b eY ]^] l     �U_`�U  _ a [ given as degrees (0-359) of the hue in the HSB (hue, saturation, brightness) color scheme.   ` �aa �   g i v e n   a s   d e g r e e s   ( 0 - 3 5 9 )   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .^ bcb j   � ��Td�T "0 redcolormapping redColorMappingd K   � �ee �Sfg�S 0 	colorname 	colorNamef m   � �hh �ii  r e dg �Rjk�R 0 lowerhuelimit lowerHueLimitj m   � ��Q�Q^k �Pl�O�P 0 upperhuelimit upperHueLimitl m   � ��N�N �O  c mnm j   � ��Mo�M (0 orangecolormapping orangeColorMappingo K   � �pp �Lqr�L 0 	colorname 	colorNameq m   � �ss �tt  o r a n g er �Kuv�K 0 lowerhuelimit lowerHueLimitu m   � ��J�J v �Iw�H�I 0 upperhuelimit upperHueLimitw m   � ��G�G ,�H  n xyx j   � ��Fz�F (0 yellowcolormapping yellowColorMappingz K   � �{{ �E|}�E 0 	colorname 	colorName| m   � �~~ �  y e l l o w} �D���D 0 lowerhuelimit lowerHueLimit� m   � ��C�C -� �B��A�B 0 upperhuelimit upperHueLimit� m   � ��@�@ A�A  y ��� j   �
�?��? &0 greencolormapping greenColorMapping� K   ��� �>���> 0 	colorname 	colorName� m   � ��� ��� 
 g r e e n� �=���= 0 lowerhuelimit lowerHueLimit� m   � ��<�< B� �;��:�; 0 upperhuelimit upperHueLimit� m   �9�9 ��:  � ��� j  "�8��8 $0 cyancolormapping cyanColorMapping� K  �� �7���7 0 	colorname 	colorName� m  �� ���  c y a n� �6���6 0 lowerhuelimit lowerHueLimit� m  �5�5 �� �4��3�4 0 upperhuelimit upperHueLimit� m  �2�2 ��3  � ��� j  #:�1��1 .0 lightbluecolormapping lightBlueColorMapping� K  #7�� �0���0 0 	colorname 	colorName� m  $'�� ���  l i g h t   b l u e� �/���/ 0 lowerhuelimit lowerHueLimit� m  *-�.�. �� �-��,�- 0 upperhuelimit upperHueLimit� m  03�+�+ ��,  � ��� j  ;R�*��* ,0 darkbluecolormapping darkBlueColorMapping� K  ;O�� �)���) 0 	colorname 	colorName� m  <?�� ���  d a r k   b l u e� �(���( 0 lowerhuelimit lowerHueLimit� m  BE�'�' �� �&��%�& 0 upperhuelimit upperHueLimit� m  HK�$�$ ��%  � ��� j  Sj�#��# (0 purplecolormapping purpleColorMapping� K  Sg�� �"���" 0 	colorname 	colorName� m  TW�� ���  p u r p l e� �!���! 0 lowerhuelimit lowerHueLimit� m  Z]� �  �� ���� 0 upperhuelimit upperHueLimit� m  `c��D�  � ��� j  k���� $0 pinkcolormapping pinkColorMapping� K  k�� ���� 0 	colorname 	colorName� m  lo�� ���  p i n k� ���� 0 lowerhuelimit lowerHueLimit� m  ru��E� ���� 0 upperhuelimit upperHueLimit� m  x{��]�  � ��� l     ����  �  �  � ��� j  ����� 0 colormappings colorMappings� J  ���� ��� o  ���� "0 redcolormapping redColorMapping� ��� o  ���� (0 orangecolormapping orangeColorMapping� ��� o  ���� (0 yellowcolormapping yellowColorMapping� ��� o  ���� &0 greencolormapping greenColorMapping� ��� o  ���� $0 cyancolormapping cyanColorMapping� ��� o  ���� .0 lightbluecolormapping lightBlueColorMapping� ��� o  ���� ,0 darkbluecolormapping darkBlueColorMapping� ��� o  ���
�
 (0 purplecolormapping purpleColorMapping� ��	� o  ���� $0 pinkcolormapping pinkColorMapping�	  � ��� l     ����  �  �  � ��� j  ����� 0 labelmappings labelMappings� J  ���� ��� o  ���� 
0 label1  � ��� o  ���� 
0 label2  � ��� o  ���� 
0 label3  � ��� o  ��� �  
0 label4  � ��� o  ������ 
0 label5  � ��� o  ������ 
0 label6  � ���� o  ������ 
0 label7  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � e _ Set to `true` if you want this script to associate annotations to text columns in multi-column   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a s s o c i a t e   a n n o t a t i o n s   t o   t e x t   c o l u m n s   i n   m u l t i - c o l u m n� ��� l     ������  � 4 . PDF layouts when generating sort identifiers.   � ��� \   P D F   l a y o u t s   w h e n   g e n e r a t i n g   s o r t   i d e n t i f i e r s .� ��� l     ������  � b \ Sort identifiers will be placed in an `annotationorder` metadata field which can be used in   � ��� �   S o r t   i d e n t i f i e r s   w i l l   b e   p l a c e d   i n   a n   ` a n n o t a t i o n o r d e r `   m e t a d a t a   f i e l d   w h i c h   c a n   b e   u s e d   i n�    l     ����   d ^ DEVONthink for sorting so that annotations can be listed in the order they appear in the text    � �   D E V O N t h i n k   f o r   s o r t i n g   s o   t h a t   a n n o t a t i o n s   c a n   b e   l i s t e d   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   t e x t  l     ����   ? 9 of a page (optionally respecting a multi-column layout).    �		 r   o f   a   p a g e   ( o p t i o n a l l y   r e s p e c t i n g   a   m u l t i - c o l u m n   l a y o u t ) . 

 l     ����   V P Sort identifier format: `<PAGE>-<COLUMN>-<POSITION_FROM_TOP>` (e.g. "2-1-207").    � �   S o r t   i d e n t i f i e r   f o r m a t :   ` < P A G E > - < C O L U M N > - < P O S I T I O N _ F R O M _ T O P > `   ( e . g .   " 2 - 1 - 2 0 7 " ) .  l     ����   I C If this property is set to `false`, `<COLUMN>` will be always "1".    � �   I f   t h i s   p r o p e r t y   i s   s e t   t o   ` f a l s e ` ,   ` < C O L U M N > `   w i l l   b e   a l w a y s   " 1 " .  l     ����   ^ X Note that, depending on the layout of the PDF page and the specific annotation's width,    � �   N o t e   t h a t ,   d e p e n d i n g   o n   t h e   l a y o u t   o f   t h e   P D F   p a g e   a n d   t h e   s p e c i f i c   a n n o t a t i o n ' s   w i d t h ,  l     ����   F @ correctly guessing the annotation's text column may still fail.    � �   c o r r e c t l y   g u e s s i n g   t h e   a n n o t a t i o n ' s   t e x t   c o l u m n   m a y   s t i l l   f a i l .  j  ���� �� <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts  m  ����
�� boovtrue !"! l     ��������  ��  ��  " #$# l     ��%&��  % \ V The number of text columns supported by this script when generating sort identifiers.   & �'' �   T h e   n u m b e r   o f   t e x t   c o l u m n s   s u p p o r t e d   b y   t h i s   s c r i p t   w h e n   g e n e r a t i n g   s o r t   i d e n t i f i e r s .$ ()( l     ��*+��  * e _ If you're often dealing with PDF text layouts that have more than the specified number of text   + �,, �   I f   y o u ' r e   o f t e n   d e a l i n g   w i t h   P D F   t e x t   l a y o u t s   t h a t   h a v e   m o r e   t h a n   t h e   s p e c i f i e d   n u m b e r   o f   t e x t) -.- l     ��/0��  / ` Z columns then you may want to adjust this integer number. However, note that larger values   0 �11 �   c o l u m n s   t h e n   y o u   m a y   w a n t   t o   a d j u s t   t h i s   i n t e g e r   n u m b e r .   H o w e v e r ,   n o t e   t h a t   l a r g e r   v a l u e s. 232 l     ��45��  4 ] W will increase the likeliness that short annotations or annotations from document parts   5 �66 �   w i l l   i n c r e a s e   t h e   l i k e l i n e s s   t h a t   s h o r t   a n n o t a t i o n s   o r   a n n o t a t i o n s   f r o m   d o c u m e n t   p a r t s3 787 l     ��9:��  9 J D spanning multiple columns (like the abstract) won't sort correctly.   : �;; �   s p a n n i n g   m u l t i p l e   c o l u m n s   ( l i k e   t h e   a b s t r a c t )   w o n ' t   s o r t   c o r r e c t l y .8 <=< j  ����>��  0 maxtextcolumns maxTextColumns> m  ������ = ?@? l     ��������  ��  ��  @ ABA l     ��CD��  C c ] Approximate average width of the (left or right) white space between text & page origin/end.   D �EE �   A p p r o x i m a t e   a v e r a g e   w i d t h   o f   t h e   ( l e f t   o r   r i g h t )   w h i t e   s p a c e   b e t w e e n   t e x t   &   p a g e   o r i g i n / e n d .B FGF l     ��HI��  H g a Note that this is just a wild guess for the average margin of a PDF page as properly calculating   I �JJ �   N o t e   t h a t   t h i s   i s   j u s t   a   w i l d   g u e s s   f o r   t h e   a v e r a g e   m a r g i n   o f   a   P D F   p a g e   a s   p r o p e r l y   c a l c u l a t i n gG KLK l     ��MN��  M b \ margins isn't straightforward. However, specifying some value for an average margin usually   N �OO �   m a r g i n s   i s n ' t   s t r a i g h t f o r w a r d .   H o w e v e r ,   s p e c i f y i n g   s o m e   v a l u e   f o r   a n   a v e r a g e   m a r g i n   u s u a l l yL PQP l     ��RS��  R ^ X helps when trying to associate annotations to text columns in multi-column PDF layouts.   S �TT �   h e l p s   w h e n   t r y i n g   t o   a s s o c i a t e   a n n o t a t i o n s   t o   t e x t   c o l u m n s   i n   m u l t i - c o l u m n   P D F   l a y o u t s .Q UVU j  ����W�� 0 
pagemargin 
pageMarginW m  ������ V XYX l     ��������  ��  ��  Y Z[Z j  ����\�� &0 creatednotescount createdNotesCount\ m  ������  [ ]^] j  ����_�� &0 updatednotescount updatedNotesCount_ m  ������  ^ `a` l     ��������  ��  ��  a bcb l     ��de��  d d ^ The "KeypointsScriptingLib.scptd" scripting library provides utility methods for this script.   e �ff �   T h e   " K e y p o i n t s S c r i p t i n g L i b . s c p t d "   s c r i p t i n g   l i b r a r y   p r o v i d e s   u t i l i t y   m e t h o d s   f o r   t h i s   s c r i p t .c ghg l     ��ij��  i d ^ It can be made available to this script by copying it into a "Script Libraries" folder inside   j �kk �   I t   c a n   b e   m a d e   a v a i l a b l e   t o   t h i s   s c r i p t   b y   c o p y i n g   i t   i n t o   a   " S c r i p t   L i b r a r i e s "   f o l d e r   i n s i d eh lml l     ��no��  n ; 5 the "Library" folder that's within your Home folder.   o �pp j   t h e   " L i b r a r y "   f o l d e r   t h a t ' s   w i t h i n   y o u r   H o m e   f o l d e r .m qrq l     ��st��  s i c see https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib   t �uu �   s e e   h t t p s : / / g i t h u b . c o m / e x t r a c t s / m a c - s c r i p t i n g / t r e e / m a s t e r / S c r i p t i n g L i b r a r i e s / K e y p o i n t s S c r i p t i n g L i br vwv l     xyzx x  ����{���� 0 keypointslib KeypointsLib{ 4  ����|
�� 
scpt| m  ��}} �~~ * K e y p o i n t s S c r i p t i n g L i b��  y   v1.4 or greater required   z � 2   v 1 . 4   o r   g r e a t e r   r e q u i r e dw ��� l     ��������  ��  ��  � ��� x  ��������  � 4  �����
�� 
frmk� m  ���� ��� V / S y s t e m / L i b r a r y / F r a m e w o r k s / A p p K i t . f r a m e w o r k��  � ��� x  �������  � 4  ���
�� 
frmk� m  �� ��� V / S y s t e m / L i b r a r y / F r a m e w o r k s / Q u a r t z . f r a m e w o r k��  � ��� x  2�������  � 2 $)��
�� 
osax��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   Main handler.   � ���    M a i n   h a n d l e r .� ��� i  25��� I     ������
�� .aevtoappnull  �   � ****��  ��  � k    !�� ��� l     ������  � 9 3 DEVONthink must be running for this script to work   � ��� f   D E V O N t h i n k   m u s t   b e   r u n n i n g   f o r   t h i s   s c r i p t   t o   w o r k� ��� Z    ������� H     �� n    ��� I    �������� $0 checkappsrunning checkAppsRunning��  ��  �  f     � L   	 ����  ��  ��  � ��� l   ��������  ��  ��  � ��� n   ��� I    ������� 0 setupprogress setupProgress� ���� m    �� ��� p C r e a t i n g   M a r k d o w n   n o t e s   f o r   a n n o t a t i o n s   i n   s e l e c t e d   P D F s��  ��  � o    ���� 0 keypointslib KeypointsLib� ��� l   ��������  ��  ��  � ��� l   ������  � J D only deal with currently selected PDFs that contain PDF annotations   � ��� �   o n l y   d e a l   w i t h   c u r r e n t l y   s e l e c t e d   P D F s   t h a t   c o n t a i n   P D F   a n n o t a t i o n s� ��� r    "��� n    ��� I     �������� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations��  ��  �  f    � o      ���� 0 
pdfrecords 
pdfRecords� ��� l  # #��������  ��  ��  � ��� l  # #������  � $  initialize progress reporting   � ��� <   i n i t i a l i z e   p r o g r e s s   r e p o r t i n g� ��� r   # *��� m   # $����  � o      ���� &0 creatednotescount createdNotesCount� ��� r   + 2��� m   + ,����  � o      ���� &0 updatednotescount updatedNotesCount� ��� r   3 :��� I  3 8�����
�� .corecnte****       ****� o   3 4���� 0 
pdfrecords 
pdfRecords��  � o      ���� 0 pdfcount pdfCount� ��� n  ; E��� I   @ E������� 40 settotalstepsforprogress setTotalStepsForProgress� ���� o   @ A���� 0 pdfcount pdfCount��  ��  � o   ; @���� 0 keypointslib KeypointsLib� ��� l  F F��������  ��  ��  � ��� l  F F������  � + % process PDF annotations for each PDF   � ��� J   p r o c e s s   P D F   a n n o t a t i o n s   f o r   e a c h   P D F� ��� Y   F ��������� k   P ��� ��� r   P V��� n   P T��� 4   Q T���
�� 
cobj� o   R S���� 0 i  � o   P Q���� 0 
pdfrecords 
pdfRecords� o      ���� 0 	pdfrecord 	pdfRecord� ��� O  W e��� r   _ d��� n   _ b��� 1   ` b��
�� 
DTfn� o   _ `���� 0 	pdfrecord 	pdfRecord� o      ���� 0 pdffilename pdfFilename� 5   W \���~
� 
capp� m   Y Z�� ���  D N t p
�~ kfrmID  � ��� n  f ���� I   k ��}��|�}  0 updateprogress updateProgress�    o   k l�{�{ 0 i   �z b   l  b   l { b   l y b   l u	
	 b   l s b   l o m   l m �  P r o c e s s i n g   P D F   o   m n�y�y 0 i   m   o r �    o f  
 o   s t�x�x 0 pdfcount pdfCount m   u x �    ( " o   y z�w�w 0 pdffilename pdfFilename m   { ~ �  " ) .�z  �|  � o   f k�v�v 0 keypointslib KeypointsLib� �u r   � � n  � � I   � ��t�s�t :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF �r o   � ��q�q 0 	pdfrecord 	pdfRecord�r  �s    f   � � o      �p�p  0 updatedrecords updatedRecords�u  �� 0 i  � m   I J�o�o � o   J K�n�n 0 pdfcount pdfCount��  �  l  � ��m�l�k�m  �l  �k    !  l  � ��j"#�j  " 2 , select records that were created or updated   # �$$ X   s e l e c t   r e c o r d s   t h a t   w e r e   c r e a t e d   o r   u p d a t e d! %&% Z   � �'(�i�h' F   � �)*) =  � �+,+ o   � ��g�g ,0 selectupdatedrecords selectUpdatedRecords, m   � ��f
�f boovtrue* >  � �-.- o   � ��e�e  0 updatedrecords updatedRecords. J   � ��d�d  ( O   � �/0/ k   � �11 232 r   � �454 4   � ��c6
�c 
brws6 m   � ��b�b 5 o      �a�a 0 frontwindow frontWindow3 7�`7 r   � �898 o   � ��_�_  0 updatedrecords updatedRecords9 n      :;: 1   � ��^
�^ 
DTsl; o   � ��]�] 0 frontwindow frontWindow�`  0 5   � ��\<�[
�\ 
capp< m   � �== �>>  D N t p
�[ kfrmID  �i  �h  & ?@? l  � ��Z�Y�X�Z  �Y  �X  @ ABA l  � ��WCD�W  C Z T display a dialog with feedback (number of PDFs processed and notes created/updated)   D �EE �   d i s p l a y   a   d i a l o g   w i t h   f e e d b a c k   ( n u m b e r   o f   P D F s   p r o c e s s e d   a n d   n o t e s   c r e a t e d / u p d a t e d )B F�VF O   �!GHG k   � II JKJ I  � ��U�T�S
�U .miscactvnull��� ��� null�T  �S  K L�RL I  � �QMN
�Q .sysodlogaskr        TEXTM b   �OPO b   � �QRQ b   � �STS b   � �UVU b   � �WXW b   � �YZY b   � �[\[ m   � �]] �^^   P r o c e s s e d   P D F s :  \ o   � ��P�P 0 pdfcount pdfCountZ 1   � ��O
�O 
lnfdX m   � �__ �``  C r e a t e d   n o t e s :  V o   � ��N�N &0 creatednotescount createdNotesCountT 1   � ��M
�M 
lnfdR m   � �aa �bb  U p d a t e d   n o t e s :  P l 
 �c�L�Kc o   ��J�J &0 updatednotescount updatedNotesCount�L  �K  N �Ide
�I 
apprd m  ff �gg D F i n i s h e d   I m p o r t   o f   P D F   A n n o t a t i o n se �Hhi
�H 
disph m  �G�G i �Fjk
�F 
btnsj J  ll m�Em m  nn �oo  O K�E  k �Dp�C
�D 
dfltp m  qq �rr  O K�C  �R  H 5   � ��Bs�A
�B 
capps m   � �tt �uu  D N t p
�A kfrmID  �V  � vwv l     �@�?�>�@  �?  �>  w xyx l     �=�<�;�=  �<  �;  y z{z l     �:|}�:  | + % Checks if DEVONthink Pro is running.   } �~~ J   C h e c k s   i f   D E V O N t h i n k   P r o   i s   r u n n i n g .{ � l     �9���9  � 6 0 Credits: modified after script code by Rob Trew   � ��� `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     �8���8  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i  69��� I      �7�6�5�7 $0 checkappsrunning checkAppsRunning�6  �5  � k     5�� ��� O     2��� l   1���� Z    1���4�3� A    ��� l   ��2�1� I   �0��/
�0 .corecnte****       ****� l   ��.�-� 6  ��� 2   �,
�, 
prcs� =    ��� 1    �+
�+ 
fcrt� m    �� ���  D N t p�.  �-  �/  �2  �1  � m    �*�* � k    -�� ��� n   *��� I   " *�)��(�) 0 displayerror displayError� ��� m   " #�� ��� 6 D E V O N t h i n k   P r o   n o t   r u n n i n g !� ��� m   # $�� ��� � P l e a s e   o p e n   D E V O N t h i n k   P r o   a n d   s e l e c t   s o m e   P D F ( s ) ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .� ��� m   $ %�'�' � ��&� m   % &�%
�% boovtrue�&  �(  � o    "�$�$ 0 keypointslib KeypointsLib� ��#� L   + -�� m   + ,�"
�" boovfals�#  �4  �3  � "  application "System Events"   � ��� 8   a p p l i c a t i o n   " S y s t e m   E v e n t s "� 5     �!�� 
�! 
capp� m    �� ���  s e v s
�  kfrmID  � ��� L   3 5�� m   3 4�
� boovtrue�  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � X R Returns all PDF records from the records selected in DEVONthink that contain some   � ��� �   R e t u r n s   a l l   P D F   r e c o r d s   f r o m   t h e   r e c o r d s   s e l e c t e d   i n   D E V O N t h i n k   t h a t   c o n t a i n   s o m e� ��� l     ����  � \ V PDF annotations. If there's currently no selection in DEVONthink (or if the selection   � ��� �   P D F   a n n o t a t i o n s .   I f   t h e r e ' s   c u r r e n t l y   n o   s e l e c t i o n   i n   D E V O N t h i n k   ( o r   i f   t h e   s e l e c t i o n� ��� l     ����  � \ V contains no PDFs with PDF annotations) presents an error alert and aborts the script.   � ��� �   c o n t a i n s   n o   P D F s   w i t h   P D F   a n n o t a t i o n s )   p r e s e n t s   a n   e r r o r   a l e r t   a n d   a b o r t s   t h e   s c r i p t .� ��� i  :=��� I      ���� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�  �  � k     a�� ��� r     ��� J     ��  � o      �� 0 annotatedpdfs annotatedPDFs� ��� l   ����  �  �  � ��� O    ^��� k    ]�� ��� r    ��� l   ���� c    ��� 1    �

�
 
DTsl� m    �	
�	 
list�  �  � o      �� 0 
therecords 
theRecords� ��� X    D���� Z   % ?����� F   % 4��� l  % *���� =  % *��� n   % (��� 1   & (�
� 
DTty� o   % &�� 0 	therecord 	theRecord� m   ( )� 
�  OCRdpdf �  �  � l  - 2������ ?   - 2��� n   - 0��� 1   . 0��
�� 
DTna� o   - .���� 0 	therecord 	theRecord� m   0 1����  ��  ��  � s   7 ;��� o   7 8���� 0 	therecord 	theRecord� n      ���  ;   9 :� o   8 9���� 0 annotatedpdfs annotatedPDFs�  �  � 0 	therecord 	theRecord� o    ���� 0 
therecords 
theRecords� ��� l  E E��������  ��  ��  � ���� Z  E ]������� =  E I   o   E F���� 0 annotatedpdfs annotatedPDFs J   F H����  � n  L Y I   Q Y������ 0 displayerror displayError  m   Q R � P N o   P D F ( s )   w i t h   P D F   a n n o t a t i o n s   s e l e c t e d ! 	
	 m   R S � � P l e a s e   o p e n   D E V O N t h i n k   a n d   s e l e c t   s o m e   P D F ( s )   w i t h   P D F   a n n o t a t i o n s .
  m   S T����  �� m   T U��
�� boovtrue��  ��   o   L Q���� 0 keypointslib KeypointsLib��  ��  ��  � 5    
����
�� 
capp m     �  D N t p
�� kfrmID  �  l  _ _��������  ��  ��   �� L   _ a o   _ `���� 0 annotatedpdfs annotatedPDFs��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   W Q Iterates over the given PDF's contained PDF annotations and creates a DEVONthink    � �   I t e r a t e s   o v e r   t h e   g i v e n   P D F ' s   c o n t a i n e d   P D F   a n n o t a t i o n s   a n d   c r e a t e s   a   D E V O N t h i n k  !  l     ��"#��  " K E record for each markup or text annotation (if it doesn't exist yet).   # �$$ �   r e c o r d   f o r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n   ( i f   i t   d o e s n ' t   e x i s t   y e t ) .! %&% l     ��'(��  ' ` Z Returns a list with all records that were actually updated. I.e., if a PDF annotation did   ( �)) �   R e t u r n s   a   l i s t   w i t h   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   u p d a t e d .   I . e . ,   i f   a   P D F   a n n o t a t i o n   d i d& *+* l     ��,-��  , V P already have a corresponding Markdown record in DEVONthink which wasn't updated   - �.. �   a l r e a d y   h a v e   a   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d   i n   D E V O N t h i n k   w h i c h   w a s n ' t   u p d a t e d+ /0/ l     ��12��  1 ^ X (since its text content & properties were already up-to-date), it won't get included in   2 �33 �   ( s i n c e   i t s   t e x t   c o n t e n t   &   p r o p e r t i e s   w e r e   a l r e a d y   u p - t o - d a t e ) ,   i t   w o n ' t   g e t   i n c l u d e d   i n0 454 l     ��67��  6   the returned list.   7 �88 &   t h e   r e t u r n e d   l i s t .5 9:9 l     ��;<��  ; T N @param pdfRecord The DEVONthink record representing the PDF whose annotations   < �== �   @ p a r a m   p d f R e c o r d   T h e   D E V O N t h i n k   r e c o r d   r e p r e s e n t i n g   t h e   P D F   w h o s e   a n n o t a t i o n s: >?> l     ��@A��  @   shall be extracted.   A �BB (   s h a l l   b e   e x t r a c t e d .? CDC i  >AEFE I      ��G���� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDFG H��H o      ���� 0 	pdfrecord 	pdfRecord��  ��  F k    �II JKJ l     ��LM��  L U O assemble info for the PDF record and its (possibly to be created) notes folder   M �NN �   a s s e m b l e   i n f o   f o r   t h e   P D F   r e c o r d   a n d   i t s   ( p o s s i b l y   t o   b e   c r e a t e d )   n o t e s   f o l d e rK OPO O     �QRQ k    �SS TUT r    VWV n    XYX 1   	 ��
�� 
ppthY o    	���� 0 	pdfrecord 	pdfRecordW o      ���� 0 pdfpath pdfPathU Z[Z r    \]\ n    ^_^ 1    ��
�� 
rURL_ o    ���� 0 	pdfrecord 	pdfRecord] o      ���� 
0 pdfurl  [ `a` r    bcb n    ded 1    ��
�� 
DTloe o    ���� 0 	pdfrecord 	pdfRecordc o      ���� "0 pdflocationpath pdfLocationPatha fgf l   ��������  ��  ��  g hih r    jkj n    lml 1    ��
�� 
DTcmm o    ���� 0 	pdfrecord 	pdfRecordk o      ���� 0 pdfmetadata pdfMetadatai non Q     =pqrp k   # 1ss tut l  # #��vw��  v N H pdfMetadata may be undefined in which case this triggers the error case   w �xx �   p d f M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s eu y��y Z  # 1z{����z =  # &|}| o   # $���� 0 pdfmetadata pdfMetadata} m   $ %��
�� 
msng{ r   ) -~~ J   ) +����   o      ���� 0 pdfmetadata pdfMetadata��  ��  ��  q R      ������
�� .ascrerr ****      � ****��  ��  r r   9 =��� J   9 ;����  � o      ���� 0 pdfmetadata pdfMetadatao ��� l  > >��������  ��  ��  � ��� l  > >������  � p j if necessary, create the notes folder, i.e. the DEVONthink group that hosts the PDF file's Markdown notes   � ��� �   i f   n e c e s s a r y ,   c r e a t e   t h e   n o t e s   f o l d e r ,   i . e .   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n   n o t e s� ��� r   > O��� b   > M��� b   > G��� o   > C���� ,0 notefoldernameprefix noteFolderNamePrefix� n   C F��� 1   D F��
�� 
pnam� o   C D���� 0 	pdfrecord 	pdfRecord� o   G L���� ,0 notefoldernamesuffix noteFolderNameSuffix� o      ����  0 notefoldername noteFolderName� ��� r   P W��� l  P U������ b   P U��� b   P S��� o   P Q���� "0 pdflocationpath pdfLocationPath� o   Q R����  0 notefoldername noteFolderName� m   S T�� ���  /��  ��  � o      ���� (0 folderlocationpath folderLocationPath� ��� r   X _��� I  X ]�����
�� .DTpacd53bool       utxt� o   X Y���� (0 folderlocationpath folderLocationPath��  � o      ����  0 folderdidexist folderDidExist� ��� r   ` g��� I  ` e�����
�� .DTpacd52DTrc       utxt� o   ` a���� (0 folderlocationpath folderLocationPath��  � o      ����  0 folderlocation folderLocation� ��� r   h m��� n   h k��� 1   i k��
�� 
rURL� o   h i����  0 folderlocation folderLocation� o      ���� 0 	folderurl 	folderURL� ��� r   n u��� b   n q��� o   n o���� 
0 pdfurl  � m   o p�� ���  ? p a g e = 0� n      ��� 1   r t��
�� 
pURL� o   q r����  0 folderlocation folderLocation� ��� l  v v��������  ��  ��  � ��� r   v {��� n   v y��� 1   w y��
�� 
DTcm� o   v w����  0 folderlocation folderLocation� o      ����  0 foldermetadata folderMetadata� ���� Q   | ����� k    ��� ��� l   ������  � Q K folderMetadata may be undefined in which case this triggers the error case   � ��� �   f o l d e r M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e� ���� Z   �������� =   ���� o    �����  0 foldermetadata folderMetadata� m   � ���
�� 
msng� r   � ���� J   � �����  � o      ����  0 foldermetadata folderMetadata��  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  � r   � ���� J   � �����  � o      ����  0 foldermetadata folderMetadata��  R 5     �����
�� 
capp� m    �� ���  D N t p
�� kfrmID  P ��� l  � ��������  ��  �  � ��� l  � ��~���~  � E ? extract any DOI & citekey for the PDF from its custom metadata   � ��� ~   e x t r a c t   a n y   D O I   &   c i t e k e y   f o r   t h e   P D F   f r o m   i t s   c u s t o m   m e t a d a t a� ��� r   � ���� m   � ��� ���  � o      �}�} 0 	sourcedoi 	sourceDOI� ��� r   � ���� m   � ��� ���  � o      �|�| 0 sourcecitekey sourceCitekey� ��� Z   ����{�z� >  � ���� o   � ��y�y 0 pdfmetadata pdfMetadata� J   � ��x�x  � k   �
�� ��� r   � ���� l  � ���w�v� n  � ���� I   � ��u��t�u .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m   � ��� ��� 
 m d d o i� ��s� o   � ��r�r 0 pdfmetadata pdfMetadata�s  �t  � o   � ��q�q 0 keypointslib KeypointsLib�w  �v  � o      �p�p 0 metadatadoi metadataDOI� ��� Z   � �� �o�n� F   � � >  � � o   � ��m�m 0 metadatadoi metadataDOI m   � ��l
�l 
msng >  � � o   � ��k�k 0 metadatadoi metadataDOI m   � � �    r   � �	
	 n  � � I   � ��j�i�j 0 matchdoi matchDOI �h o   � ��g�g 0 metadatadoi metadataDOI�h  �i   o   � ��f�f 0 keypointslib KeypointsLib
 o      �e�e 0 	sourcedoi 	sourceDOI�o  �n  �  r   � � l  � ��d�c n  � � I   � ��b�a�b .0 valueforkey_inrecord_ valueForKey_inRecord_  m   � � �  m d c i t e k e y �` o   � ��_�_ 0 pdfmetadata pdfMetadata�`  �a   o   � ��^�^ 0 keypointslib KeypointsLib�d  �c   o      �]�] "0 metadatacitekey metadataCitekey �\ Z   �
�[�Z F   �   >  � �!"! o   � ��Y�Y "0 metadatacitekey metadataCitekey" m   � ��X
�X 
msng  >  � �#$# o   � ��W�W "0 metadatacitekey metadataCitekey$ m   � �%% �&&   r  '(' o  �V�V "0 metadatacitekey metadataCitekey( o      �U�U 0 sourcecitekey sourceCitekey�[  �Z  �\  �{  �z  � )*) l �T�S�R�T  �S  �R  * +,+ l �Q-.�Q  - J D assemble info for all PDF annotations as a list of property records   . �// �   a s s e m b l e   i n f o   f o r   a l l   P D F   a n n o t a t i o n s   a s   a   l i s t   o f   p r o p e r t y   r e c o r d s, 010 r  -232 n 454 I  �P6�O�P &0 pdfannotationinfo pdfAnnotationInfo6 787 o  �N�N 0 pdfpath pdfPath8 9:9 o  �M�M 
0 pdfurl  : ;<; o  �L�L 0 	sourcedoi 	sourceDOI< =�K= o  �J�J 0 sourcecitekey sourceCitekey�K  �O  5  f  3 J      >> ?@? o      �I�I (0 pdfannotationslist pdfAnnotationsList@ A�HA o      �G�G 0 	sourcedoi 	sourceDOI�H  1 BCB l ..�F�E�D�F  �E  �D  C DED l ..�CFG�C  F n h sort all PDF annotations so that they are listed in the order they appear in the document & on the page   G �HH �   s o r t   a l l   P D F   a n n o t a t i o n s   s o   t h a t   t h e y   a r e   l i s t e d   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   d o c u m e n t   &   o n   t h e   p a g eE IJI l ..�BKL�B  K W Q NOTE: by default, PDF annotations seem to be ordered by page & creation date (?)   L �MM �   N O T E :   b y   d e f a u l t ,   P D F   a n n o t a t i o n s   s e e m   t o   b e   o r d e r e d   b y   p a g e   &   c r e a t i o n   d a t e   ( ? )J NON l ..�APQ�A  P � �set pdfAnnotationsList to KeypointsLib's sortList:pdfAnnotationsList byKey:"sortString" inAscendingOrder:true usingSelector:"localizedStandardCompare:"   Q �RR. s e t   p d f A n n o t a t i o n s L i s t   t o   K e y p o i n t s L i b ' s   s o r t L i s t : p d f A n n o t a t i o n s L i s t   b y K e y : " s o r t S t r i n g "   i n A s c e n d i n g O r d e r : t r u e   u s i n g S e l e c t o r : " l o c a l i z e d S t a n d a r d C o m p a r e : "O STS l ..�@�?�>�@  �?  �>  T UVU l ..�=WX�=  W \ V set custom metadata fields for the PDF record: DOI & DT link back to the notes folder   X �YY �   s e t   c u s t o m   m e t a d a t a   f i e l d s   f o r   t h e   P D F   r e c o r d :   D O I   &   D T   l i n k   b a c k   t o   t h e   n o t e s   f o l d e rV Z[Z r  .>\]\ b  .<^_^ o  ./�<�< 0 pdfmetadata pdfMetadata_ K  /;`` �;ab�; 0 doi  a o  23�:�: 0 	sourcedoi 	sourceDOIb �9c�8�9 0 pdfannotations  c o  67�7�7 0 	folderurl 	folderURL�8  ] o      �6�6 0 pdfmetadata pdfMetadata[ ded n ?Ffgf I  @F�5h�4�5 00 setmetadatafordtrecord setMetadataForDTRecordh iji o  @A�3�3 0 	pdfrecord 	pdfRecordj k�2k o  AB�1�1 0 pdfmetadata pdfMetadata�2  �4  g  f  ?@e lml l GG�0�/�.�0  �/  �.  m non l GG�-pq�-  p = 7 if the notes folder just got created, set its metadata   q �rr n   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   s e t   i t s   m e t a d a t ao sts r  GMuvu J  GI�,�,  v o      �+�+ 0 bibmetadata bibMetadatat wxw r  NUyzy m  NQ{{ �||  z o      �*�* &0 formattedcitation formattedCitationx }~} r  V]� m  VY�� ���  � o      �)�) 0 
bibtexdata 
bibTeXData~ ��� Z  ^����(�'� G  ^o��� = ^a��� o  ^_�&�&  0 folderdidexist folderDidExist� m  _`�%
�% boovfals� = dk��� o  di�$�$ 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata� m  ij�#
�# boovtrue� k  r��� ��� l rr�"���"  � 5 / fetch bibliographic metadata for the PDF's DOI   � ��� ^   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   P D F ' s   D O I� ��� Z  r����!� � F  r���� F  r���� = ry��� o  rw�� $0 fetchdoimetadata fetchDOIMetadata� m  wx�
� boovtrue� > |��� o  |}�� 0 	sourcedoi 	sourceDOI� m  }~�
� 
msng� > ����� o  ���� 0 	sourcedoi 	sourceDOI� m  ���� ���  � k  ���� ��� r  ����� n ����� I  ������ &0 bibmetadatafordoi bibMetadataForDOI� ��� o  ���� 0 	sourcedoi 	sourceDOI� ��� o  ���� 0 sourcecitekey sourceCitekey�  �  �  f  ��� o      �� 0 bibmetadata bibMetadata� ��� Z  ������� > ����� o  ���� 0 bibmetadata bibMetadata� J  ����  � k  ���� ��� r  ����� l ������ n ����� I  ������ .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  r e f e r e n c e� ��� o  ���
�
 0 bibmetadata bibMetadata�  �  � o  ���	�	 0 keypointslib KeypointsLib�  �  � o      �� &0 formattedcitation formattedCitation� ��� r  ����� l ������ n ����� I  ������ .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  b i b t e x� ��� o  ���� 0 bibmetadata bibMetadata�  �  � o  ��� �  0 keypointslib KeypointsLib�  �  � o      ���� 0 
bibtexdata 
bibTeXData�  �  �  �  �!  �   � ��� l ����������  ��  ��  � ��� r  ����� b  ����� o  ������  0 foldermetadata folderMetadata� K  ���� ������ 0 
sourcefile 
sourceFile� o  ������ 0 pdfpath pdfPath� ������ 0 citekey  � o  ������ 0 sourcecitekey sourceCitekey� ������� 0 doi  � o  ������ 0 	sourcedoi 	sourceDOI��  � o      ����  0 foldermetadata folderMetadata� ��� r  ����� b  ����� o  ������  0 foldermetadata folderMetadata� o  ������ 0 bibmetadata bibMetadata� o      ����  0 foldermetadata folderMetadata� ��� l ����������  ��  ��  � ���� n ����� I  ��������� 00 setmetadatafordtfolder setMetadataForDTFolder� ��� o  ������  0 folderlocation folderLocation� ���� o  ������  0 foldermetadata folderMetadata��  ��  �  f  ����  �(  �'  � ��� l   ��������  ��  ��  � ��� l   ������  � s m if the notes folder just got created, append BibTeX data and/or the formatted citation to its Finder comment   � ��� �   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   a p p e n d   B i b T e X   d a t a   a n d / o r   t h e   f o r m a t t e d   c i t a t i o n   t o   i t s   F i n d e r   c o m m e n t� ��� Z   m������� =  ��� o   ����  0 folderdidexist folderDidExist� m  ��
�� boovfals� k  i�� ��� Z  7������� F  '��� F  ��� = 	 		  o  ���� P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment	 m  ��
�� boovtrue� > 			 o  ���� &0 formattedcitation formattedCitation	 m  ��
�� 
msng� > #			 o  ���� &0 formattedcitation formattedCitation	 m  "		 �		  � n *3				 I  +3��	
���� 60 appendtocommentofdtfolder appendToCommentOfDTFolder	
 			 o  +,����  0 folderlocation folderLocation	 	��	 o  ,/���� &0 formattedcitation formattedCitation��  ��  		  f  *+��  ��  � 	��	 Z  8i		����	 F  8Y			 F  8K			 = 8?			 o  8=���� :0 appendbibtextofindercomment appendBibTeXToFinderComment	 m  =>��
�� boovtrue	 > BG			 o  BE���� 0 
bibtexdata 
bibTeXData	 m  EF��
�� 
msng	 > NU			 o  NQ���� 0 
bibtexdata 
bibTeXData	 m  QT		 �		  	 n \e			 I  ]e��	���� 60 appendtocommentofdtfolder appendToCommentOfDTFolder	 	 	!	  o  ]^����  0 folderlocation folderLocation	! 	"��	" o  ^a���� 0 
bibtexdata 
bibTeXData��  ��  	  f  \]��  ��  ��  ��  ��  � 	#	$	# l nn��������  ��  ��  	$ 	%	&	% r  nt	'	(	' J  np����  	( o      ����  0 updatedrecords updatedRecords	& 	)	*	) l uu��������  ��  ��  	* 	+	,	+ l uu��	-	.��  	- n h loop over each markup or text annotation in the PDF and create/update its corresponding Markdown record   	. �	/	/ �   l o o p   o v e r   e a c h   m a r k u p   o r   t e x t   a n n o t a t i o n   i n   t h e   P D F   a n d   c r e a t e / u p d a t e   i t s   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d	, 	0	1	0 X  u�	2��	3	2 k  ��	4	4 	5	6	5 r  ��	7	8	7 l ��	9����	9 n ��	:	;	: o  ������ 0 comment  	; o  ������ 0 pdfannotation pdfAnnotation��  ��  	8 o      ���� 0 acomment aComment	6 	<	=	< Z ��	>	?����	> = ��	@	A	@ o  ������ 0 acomment aComment	A l ��	B����	B n ��	C	D	C o  ������ 0 null  	D n ��	E	F	E o  ������ 0 nsnull NSNull	F m  ����
�� misccura��  ��  	? r  ��	G	H	G m  ����
�� 
msng	H o      ���� 0 acomment aComment��  ��  	= 	I	J	I Z  ��	K	L����	K > ��	M	N	M o  ������ 0 acomment aComment	N m  ����
�� 
msng	L r  ��	O	P	O n ��	Q	R	Q I  ����	S���� :0 preprocessannotationcomment preprocessAnnotationComment	S 	T��	T c  ��	U	V	U o  ������ 0 acomment aComment	V m  ����
�� 
TEXT��  ��  	R  f  ��	P o      ���� 0 acomment aComment��  ��  	J 	W	X	W l ����������  ��  ��  	X 	Y	Z	Y r  ��	[	\	[ l ��	]����	] n ��	^	_	^ o  ������ 0 	annottext 	annotText	_ o  ������ 0 pdfannotation pdfAnnotation��  ��  	\ o      ���� 0 	annottext 	annotText	Z 	`	a	` Z ��	b	c����	b = ��	d	e	d o  ������ 0 	annottext 	annotText	e l ��	f����	f n ��	g	h	g o  ������ 0 null  	h n ��	i	j	i o  ������ 0 nsnull NSNull	j m  ����
�� misccura��  ��  	c r  ��	k	l	k m  ����
�� 
msng	l o      ���� 0 	annottext 	annotText��  ��  	a 	m	n	m Z �	o	p����	o > ��	q	r	q o  ������ 0 	annottext 	annotText	r m  ����
�� 
msng	p r  �		s	t	s c  �	u	v	u o  ����� 0 	annottext 	annotText	v m  ��
�� 
TEXT	t o      ���� 0 	annottext 	annotText��  ��  	n 	w	x	w l ��������  ��  ��  	x 	y	z	y r  	{	|	{ l 	}����	} n 	~		~ o  ���� 0 	pagelabel 	pageLabel	 o  ���� 0 pdfannotation pdfAnnotation��  ��  	| o      ���� 0 
apagelabel 
aPageLabel	z 	�	�	� l �������  ��  �  	� 	�	�	� l �~	�	��~  	� = 7 assemble record content from annotation text & comment   	� �	�	� n   a s s e m b l e   r e c o r d   c o n t e n t   f r o m   a n n o t a t i o n   t e x t   &   c o m m e n t	� 	�	�	� r  )	�	�	� n %	�	�	� I  %�}	��|�} H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData	� 	�	�	� o  �{�{ 0 	annottext 	annotText	� 	��z	� o  !�y�y 0 acomment aComment�z  �|  	�  f  	� o      �x�x  0 recordcontents recordContents	� 	�	�	� l **�w�v�u�w  �v  �u  	� 	�	�	� l **�t	�	��t  	� F @ assemble record name from annotation text, comment & page label   	� �	�	� �   a s s e m b l e   r e c o r d   n a m e   f r o m   a n n o t a t i o n   t e x t ,   c o m m e n t   &   p a g e   l a b e l	� 	�	�	� r  *<	�	�	� n *8	�	�	� I  +8�s	��r�s B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData	� 	�	�	� o  +.�q�q 0 	annottext 	annotText	� 	�	�	� o  .1�p�p 0 acomment aComment	� 	��o	� o  14�n�n 0 
apagelabel 
aPageLabel�o  �r  	�  f  *+	� o      �m�m 0 
recordname 
recordName	� 	�	�	� l ==�l�k�j�l  �k  �j  	� 	�	�	� l ==�i	�	��i  	� * $ record modification & creation date   	� �	�	� H   r e c o r d   m o d i f i c a t i o n   &   c r e a t i o n   d a t e	� 	�	�	� r  =L	�	�	� c  =H	�	�	� l =D	��h�g	� n =D	�	�	� o  @D�f�f 0 modifieddate modifiedDate	� o  =@�e�e 0 pdfannotation pdfAnnotation�h  �g  	� m  DG�d
�d 
ldt 	� o      �c�c 00 recordmodificationdate recordModificationDate	� 	�	�	� Z  Mq	�	��b�a	� > MR	�	�	� o  MP�`�` 00 recordmodificationdate recordModificationDate	� m  PQ�_
�_ 
msng	� k  Um	�	� 	�	�	� r  U\	�	�	� o  UX�^�^ 00 recordmodificationdate recordModificationDate	� o      �]�] (0 recordcreationdate recordCreationDate	� 	��\	� r  ]m	�	�	� n ]i	�	�	� I  bi�[	��Z�[ (0 keypointsidfordate keypointsIDForDate	� 	��Y	� o  be�X�X (0 recordcreationdate recordCreationDate�Y  �Z  	� o  ]b�W�W 0 keypointslib KeypointsLib	� o      �V�V 0 recordaliases recordAliases�\  �b  �a  	� 	�	�	� l rr�U�T�S�U  �T  �S  	� 	�	�	� r  r�	�	�	� c  r}	�	�	� l ry	��R�Q	� n ry	�	�	� o  uy�P�P 0 deeplink deepLink	� o  ru�O�O 0 pdfannotation pdfAnnotation�R  �Q  	� m  y|�N
�N 
TEXT	� o      �M�M 0 	recordurl 	recordURL	� 	�	�	� l ���L�K�J�L  �K  �J  	� 	�	�	� l ���I	�	��I  	�   record metadata   	� �	�	�     r e c o r d   m e t a d a t a	� 	�	�	� r  ��	�	�	� c  ��	�	�	� l ��	��H�G	� n ��	�	�	� o  ���F�F 0 	annottype 	annotType	� o  ���E�E 0 pdfannotation pdfAnnotation�H  �G  	� m  ���D
�D 
TEXT	� o      �C�C 0 	annottype 	annotType	� 	�	�	� r  ��	�	�	� c  ��	�	�	� l ��	��B�A	� n ��	�	�	� o  ���@�@ 0 
sortstring 
sortString	� o  ���?�? 0 pdfannotation pdfAnnotation�B  �A  	� m  ���>
�> 
TEXT	� o      �=�= "0 annotsortstring annotSortString	� 	�	�	� r  ��	�	�	� b  ��	�	�	� o  ���<�< 0 bibmetadata bibMetadata	� K  ��	�	� �;	�	��; 0 pdfannotations  	� o  ���:�: 0 	folderurl 	folderURL	� �9	�	��9  0 annotationtype annotationType	� o  ���8�8 0 	annottype 	annotType	� �7	��6�7 "0 annotationorder annotationOrder	� o  ���5�5 "0 annotsortstring annotSortString�6  	� o      �4�4  0 recordmetadata recordMetadata	� 	�	�	� l ���3�2�1�3  �2  �1  	� 	�	�	� r  ��	�	�	� l ��	��0�/	� n ��	�	�	� o  ���.�. 0 username userName	� o  ���-�- 0 pdfannotation pdfAnnotation�0  �/  	� o      �,�, 0 	ausername 	aUserName	� 	�
 	� Z ��

�+�*
 F  ��


 > ��


 o  ���)�) 0 	ausername 	aUserName
 m  ���(
�( 
msng
 > ��


 o  ���'�' 0 	ausername 	aUserName
 m  ��
	
	 �



  
 r  ��


 b  ��


 o  ���&�&  0 recordmetadata recordMetadata
 K  ��

 �%
�$�% 0 	createdby 	createdBy
 l ��
�#�"
 c  ��


 o  ���!�! 0 	ausername 	aUserName
 m  ��� 
�  
TEXT�#  �"  �$  
 o      ��  0 recordmetadata recordMetadata�+  �*  
  


 l ������  �  �  
 


 Z �(

��
 F  �


 > ��


 o  ���� 0 
apagelabel 
aPageLabel
 m  ���
� 
msng
 > 	


 o  �� 0 
apagelabel 
aPageLabel
 m  
 
  �
!
!  
 r  $
"
#
" b   
$
%
$ o  ��  0 recordmetadata recordMetadata
% K  
&
& �
'�� 0 
sourcepage 
sourcePage
' l 
(��
( c  
)
*
) o  �� 0 
apagelabel 
aPageLabel
* m  �
� 
TEXT�  �  �  
# o      ��  0 recordmetadata recordMetadata�  �  
 
+
,
+ l ))����  �  �  
, 
-
.
- Z )A
/
0��

/ > ),
1
2
1 o  )*�	�	 0 pdfpath pdfPath
2 m  *+�
� 
msng
0 r  /=
3
4
3 b  /9
5
6
5 o  /2��  0 recordmetadata recordMetadata
6 K  28
7
7 �
8�� 0 
sourcefile 
sourceFile
8 o  56�� 0 pdfpath pdfPath�  
4 o      ��  0 recordmetadata recordMetadata�  �
  
. 
9
:
9 l BB��� �  �  �   
: 
;
<
; l BB��
=
>��  
= � � TODO: allow to extract (& prioritize) the citekey from the annotation comment (e.g. `< #Miller+Johns2024` or `< [#Miller+Johns2024]`)   
> �
?
?   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   c i t e k e y   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   # M i l l e r + J o h n s 2 0 2 4 `   o r   ` <   [ # M i l l e r + J o h n s 2 0 2 4 ] ` )
< 
@
A
@ r  BM
B
C
B l BI
D����
D n BI
E
F
E o  EI���� 0 citekey  
F o  BE���� 0 pdfannotation pdfAnnotation��  ��  
C o      ���� 0 citekey  
A 
G
H
G Z Nx
I
J����
I F  Na
K
L
K > NS
M
N
M o  NQ���� 0 citekey  
N m  QR��
�� 
msng
L > V]
O
P
O o  VY���� 0 citekey  
P m  Y\
Q
Q �
R
R  
J r  dt
S
T
S b  dp
U
V
U o  dg����  0 recordmetadata recordMetadata
V K  go
W
W ��
X���� 0 citekey  
X o  jm���� 0 citekey  ��  
T o      ����  0 recordmetadata recordMetadata��  ��  
H 
Y
Z
Y l yy��������  ��  ��  
Z 
[
\
[ Z y�
]
^����
] F  y�
_
`
_ > y|
a
b
a o  yz���� 0 	sourcedoi 	sourceDOI
b m  z{��
�� 
msng
` > �
c
d
c o  ����� 0 	sourcedoi 	sourceDOI
d m  ��
e
e �
f
f  
^ r  ��
g
h
g b  ��
i
j
i o  ������  0 recordmetadata recordMetadata
j K  ��
k
k ��
l���� 0 doi  
l o  ������ 0 	sourcedoi 	sourceDOI��  
h o      ����  0 recordmetadata recordMetadata��  ��  
\ 
m
n
m l ����������  ��  ��  
n 
o
p
o l ����
q
r��  
q j d extract tags (like `< @tag @another tag` or `< [@tag] [@another tag]`) as well as custom attributes   
r �
s
s �   e x t r a c t   t a g s   ( l i k e   ` <   @ t a g   @ a n o t h e r   t a g `   o r   ` <   [ @ t a g ]   [ @ a n o t h e r   t a g ] ` )   a s   w e l l   a s   c u s t o m   a t t r i b u t e s
p 
t
u
t l ����
v
w��  
v q k (i.e., special tags like `< @:key:value @:key` or `< [@:key:value] [@:key]`) within the annotation comment   
w �
x
x �   ( i . e . ,   s p e c i a l   t a g s   l i k e   ` <   @ : k e y : v a l u e   @ : k e y `   o r   ` <   [ @ : k e y : v a l u e ]   [ @ : k e y ] ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t
u 
y
z
y r  ��
{
|
{ n ��
}
~
} I  ����
���� T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote
 
�
�
� o  ������ 0 acomment aComment
� 
���
� J  ��
�
� 
���
� m  ��
�
� �
�
�  f l a g g e d��  ��  ��  
~ o  ������ 0 keypointslib KeypointsLib
| J      
�
� 
�
�
� o      ���� $0 customattributes customAttributes
� 
���
� o      ���� 0 
recordtags 
recordTags��  
z 
�
�
� l ����������  ��  ��  
� 
�
�
� l ����
�
���  
� G A set the extracted custom attributes as dedicated record metadata   
� �
�
� �   s e t   t h e   e x t r a c t e d   c u s t o m   a t t r i b u t e s   a s   d e d i c a t e d   r e c o r d   m e t a d a t a
� 
�
�
� X  �R
���
�
� k  �M
�
� 
�
�
� r  ��
�
�
� n ��
�
�
� o  ������ 0 	attribkey 	attribKey
� o  ������ "0 customattribute customAttribute
� o      ���� 0 akey aKey
� 
�
�
� r  ��
�
�
� n ��
�
�
� o  ������ 0 attribvalue attribValue
� o  ������ "0 customattribute customAttribute
� o      ���� 0 avalue aValue
� 
�
�
� l ����������  ��  ��  
� 
�
�
� l ����
�
���  
� z t allow multiple occurrences of the same custom key with different values (e.g. `@:key:Some value @:key:Other value`)   
� �
�
� �   a l l o w   m u l t i p l e   o c c u r r e n c e s   o f   t h e   s a m e   c u s t o m   k e y   w i t h   d i f f e r e n t   v a l u e s   ( e . g .   ` @ : k e y : S o m e   v a l u e   @ : k e y : O t h e r   v a l u e ` )
� 
�
�
� r  �
�
�
� l �
�����
� n �
�
�
� I  ���
����� .0 valueforkey_inrecord_ valueForKey_inRecord_
� 
�
�
� o  ������ 0 akey aKey
� 
���
� o  � ����  0 recordmetadata recordMetadata��  ��  
� o  ������ 0 keypointslib KeypointsLib��  ��  
� o      ���� 0 existingvalue existingValue
� 
���
� Z  	M
�
���
�
� > 	
�
�
� o  	���� 0 existingvalue existingValue
� m  ��
�� 
msng
� r  /
�
�
� l +
�����
� n +
�
�
� I  +��
����� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_
� 
�
�
� l !
�����
� b  !
�
�
� b  
�
�
� o  ���� 0 existingvalue existingValue
� m  
�
� �
�
�  ;
� o   ���� 0 avalue aValue��  ��  
� 
�
�
� o  !$���� 0 akey aKey
� 
���
� o  $'����  0 recordmetadata recordMetadata��  ��  
� o  ���� 0 keypointslib KeypointsLib��  ��  
� o      ����  0 recordmetadata recordMetadata��  
� r  2M
�
�
� b  2I
�
�
� o  25����  0 recordmetadata recordMetadata
� l 5H
�����
� n 5H
�
�
� I  :H��
����� :0 recordfromlabels_andvalues_ recordFromLabels_andValues_
� 
�
�
� J  :?
�
� 
���
� o  :=���� 0 akey aKey��  
� 
���
� J  ?D
�
� 
���
� o  ?B���� 0 avalue aValue��  ��  ��  
� o  5:���� 0 keypointslib KeypointsLib��  ��  
� o      ����  0 recordmetadata recordMetadata��  �� "0 customattribute customAttribute
� o  ������ $0 customattributes customAttributes
� 
�
�
� l SS��������  ��  ��  
� 
�
�
� l SS��
�
���  
� P J honor a flagged status (like `< @:flagged`) within the annotation comment   
� �
�
� �   h o n o r   a   f l a g g e d   s t a t u s   ( l i k e   ` <   @ : f l a g g e d ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t
� 
�
�
� r  Sc
�
�
� n S_
�
�
� I  X_��
����� @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged
� 
���
� o  X[���� 0 acomment aComment��  ��  
� o  SX���� 0 keypointslib KeypointsLib
� o      ���� 0 	isflagged 	isFlagged
� 
�
�
� l dd��������  ��  ��  
� 
�
�
� l dd��
�
���  
� B < honor a rating (like `< ***`) within the annotation comment   
� �
�
� x   h o n o r   a   r a t i n g   ( l i k e   ` <   * * * ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t
� 
�
�
� r  dt
�
�
� n dp
�
�
� I  ip��
����� 60 keypointsnoteratingnumber keypointsNoteRatingNumber
� 
���
� o  il���� 0 acomment aComment��  ��  
� o  di���� 0 keypointslib KeypointsLib
� o      ���� 0 recordrating recordRating
� 
�
�
� l uu��������  ��  ��  
� 
�
�
� l uu��
�
���  
� H B attempt to map the annotation's color to a DEVONthink label index   
� �   �   a t t e m p t   t o   m a p   t h e   a n n o t a t i o n ' s   c o l o r   t o   a   D E V O N t h i n k   l a b e l   i n d e x
�  l uu����    y TODO: allow to extract (& prioritize) the DEVONthink label from the annotation comment (e.g. `< (@Important)` or `< @1`)    � �   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   D E V O N t h i n k   l a b e l   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   ( @ I m p o r t a n t ) `   o r   ` <   @ 1 ` )  r  u�	 n u�

 I  v������� 00 labelindexforcolorname labelIndexForColorName �� n v} o  y}����  0 annotcolorname annotColorName o  vy���� 0 pdfannotation pdfAnnotation��  ��    f  uv	 o      ���� $0 recordlabelindex recordLabelIndex  l ����~�}�  �~  �}    l ���|�|   A ; create a Markdown record for this annotation in DEVONthink    � v   c r e a t e   a   M a r k d o w n   r e c o r d   f o r   t h i s   a n n o t a t i o n   i n   D E V O N t h i n k  r  �� n �� I  ���{�z�{  0 createdtrecord createDTRecord  o  ���y�y  0 folderlocation folderLocation  !  o  ���x�x  0 foldermetadata folderMetadata! "#" o  ���w�w 0 
recordname 
recordName# $%$ o  ���v�v 0 recordaliases recordAliases% &'& o  ���u�u 0 	recordurl 	recordURL' ()( o  ���t�t 0 
recordtags 
recordTags) *+* o  ���s�s 0 	isflagged 	isFlagged+ ,-, o  ���r�r  0 recordcontents recordContents- ./. o  ���q�q (0 recordcreationdate recordCreationDate/ 010 o  ���p�p 00 recordmodificationdate recordModificationDate1 232 o  ���o�o  0 recordmetadata recordMetadata3 454 o  ���n�n 0 recordrating recordRating5 6�m6 o  ���l�l $0 recordlabelindex recordLabelIndex�m  �z    f  �� J      77 898 o      �k�k 0 dtrecord dtRecord9 :�j: o      �i�i $0 recordwasupdated recordWasUpdated�j   ;<; l ���h�g�f�h  �g  �f  < =�e= Z  ��>?�d�c> = ��@A@ o  ���b�b $0 recordwasupdated recordWasUpdatedA m  ���a
�a boovtrue? s  ��BCB o  ���`�` 0 dtrecord dtRecordC n      DED  ;  ��E o  ���_�_  0 updatedrecords updatedRecords�d  �c  �e  �� 0 pdfannotation pdfAnnotation	3 o  xy�^�^ (0 pdfannotationslist pdfAnnotationsList	1 FGF l ���]�\�[�]  �\  �[  G H�ZH L  ��II o  ���Y�Y  0 updatedrecords updatedRecords�Z  D JKJ l     �X�W�V�X  �W  �V  K LML l     �U�T�S�U  �T  �S  M NON l     �RPQ�R  P Z T For the given PDF, returns a list of records (where each record contains info about   Q �RR �   F o r   t h e   g i v e n   P D F ,   r e t u r n s   a   l i s t   o f   r e c o r d s   ( w h e r e   e a c h   r e c o r d   c o n t a i n s   i n f o   a b o u tO STS l     �QUV�Q  U V P one of its PDF annotations) as well as any DOI extracted from the PDF metadata.   V �WW �   o n e   o f   i t s   P D F   a n n o t a t i o n s )   a s   w e l l   a s   a n y   D O I   e x t r a c t e d   f r o m   t h e   P D F   m e t a d a t a .T XYX l     �PZ[�P  Z = 7 @param pdfPath The POSIX path to the PDF file on disk.   [ �\\ n   @ p a r a m   p d f P a t h   T h e   P O S I X   p a t h   t o   t h e   P D F   f i l e   o n   d i s k .Y ]^] l     �O_`�O  _ V P @param pdfurl The `x-devonthink-item://...` URL of the corresponding PDF record   ` �aa �   @ p a r a m   p d f u r l   T h e   ` x - d e v o n t h i n k - i t e m : / / . . . `   U R L   o f   t h e   c o r r e s p o n d i n g   P D F   r e c o r d^ bcb l     �Nde�N  d   in DEVONthink.   e �ff    i n   D E V O N t h i n k .c ghg l     �Mij�M  i Q K @param sourceDOI The DOI of the publication represented by the PDF (may be   j �kk �   @ p a r a m   s o u r c e D O I   T h e   D O I   o f   t h e   p u b l i c a t i o n   r e p r e s e n t e d   b y   t h e   P D F   ( m a y   b eh lml l     �Lno�L  n   empty).   o �pp    e m p t y ) .m qrq l     �Kst�K  s V P @param sourceCitekey The citekey of the publication represented by the PDF (may   t �uu �   @ p a r a m   s o u r c e C i t e k e y   T h e   c i t e k e y   o f   t h e   p u b l i c a t i o n   r e p r e s e n t e d   b y   t h e   P D F   ( m a yr vwv l     �Jxy�J  x   be empty).   y �zz    b e   e m p t y ) .w {|{ l     �I}~�I  } @ : Credits: this method was inspired by a script by mdbraber   ~ � t   C r e d i t s :   t h i s   m e t h o d   w a s   i n s p i r e d   b y   a   s c r i p t   b y   m d b r a b e r| ��� l     �H���H  �  y See https://discourse.devontechnologies.com/t/stream-annotations-from-your-pdf-reading-sessions-with-devonthink/70727/30   � ��� �   S e e   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / s t r e a m - a n n o t a t i o n s - f r o m - y o u r - p d f - r e a d i n g - s e s s i o n s - w i t h - d e v o n t h i n k / 7 0 7 2 7 / 3 0� ��� i  BE��� I      �G��F�G &0 pdfannotationinfo pdfAnnotationInfo� ��� o      �E�E 0 pdfpath pdfPath� ��� o      �D�D 
0 pdfurl  � ��� o      �C�C 0 	sourcedoi 	sourceDOI� ��B� o      �A�A 0 sourcecitekey sourceCitekey�B  �F  � k    ��� ��� r     ��� n    ��� I    �@��?�@ 0 initwithurl_ initWithURL_� ��>� l   ��=�<� n   ��� I   
 �;��:�; $0 fileurlwithpath_ fileURLWithPath_� ��9� o   
 �8�8 0 pdfpath pdfPath�9  �:  � n   
��� o    
�7�7 	0 NSURL  � m    �6
�6 misccura�=  �<  �>  �?  � n    ��� I    �5�4�3�5 	0 alloc  �4  �3  � n    ��� o    �2�2 0 pdfdocument PDFDocument� m     �1
�1 misccura� o      �0�0 0 pdfdoc pdfDoc� ��� l   �/�.�-�/  �.  �-  � ��� l   �,���,  � Z T if there's no given DOI yet, try to get any DOI from PDF metadata or first PDF page   � ��� �   i f   t h e r e ' s   n o   g i v e n   D O I   y e t ,   t r y   t o   g e t   a n y   D O I   f r o m   P D F   m e t a d a t a   o r   f i r s t   P D F   p a g e� ��� Z    <���+�*� =   ��� o    �)�) 0 	sourcedoi 	sourceDOI� m    �� ���  � k    8�� ��� r    *��� n   (��� I   ! (�(��'�( 0 
doifrompdf 
doiFromPDF� ��� o   ! "�&�& 0 pdfpath pdfPath� ��� o   " #�%�% 0 pdfdoc pdfDoc� ��$� m   # $�#
�# boovtrue�$  �'  � o    !�"�" 0 keypointslib KeypointsLib� o      �!�! 0 pdfdoi pdfDOI� �� � Z   + 8����� >  + .��� o   + ,�� 0 pdfdoi pdfDOI� m   , -�� ���  � r   1 4��� o   1 2�� 0 pdfdoi pdfDOI� o      �� 0 	sourcedoi 	sourceDOI�  �  �   �+  �*  � ��� l  = =����  �  �  � ��� l  = =����  � = 7 iterate over each PDF page and process its annotations   � ��� n   i t e r a t e   o v e r   e a c h   P D F   p a g e   a n d   p r o c e s s   i t s   a n n o t a t i o n s� ��� r   = F��� n  = D��� I   @ D���� 0 new  �  �  � n  = @��� o   > @��  0 nsmutablearray NSMutableArray� m   = >�
� misccura� o      �� *0 pdfannotationsarray pdfAnnotationsArray� ��� r   G J��� m   G H�� � o      �� 0 columnid columnID� ��� Y   K������� l  [����� k   [��� ��� r   [ c��� l  [ a���� n  [ a��� I   \ a�
��	�
 0 pageatindex_ pageAtIndex_� ��� o   \ ]�� 0 i  �  �	  � o   [ \�� 0 pdfdoc pdfDoc�  �  � o      �� 0 pdfpage pdfPage� ��� r   d ~��� n   d o��� 4   l o��
� 
cobj� m   m n�� � l  d l���� n  d l��� I   e l� ����  0 boundsforbox_ boundsForBox_� ���� l  e h������ n  e h��� o   f h���� 00 kpdfdisplayboxmediabox kPDFDisplayBoxMediaBox� m   e f��
�� misccura��  ��  ��  ��  � o   d e���� 0 pdfpage pdfPage�  �  � J      �� � � o      ���� 0 	pagewidth 	pageWidth  �� o      ���� 0 
pageheight 
pageHeight��  �  r    � ^    � l   ����� \    �	
	 o    ����� 0 	pagewidth 	pageWidth
 l  � ����� ]   � � m   � �����  o   � ����� 0 
pagemargin 
pageMargin��  ��  ��  ��   o   � �����  0 maxtextcolumns maxTextColumns o      ���� 0 columnwidth columnWidth  r   � � n  � � I   � ��������� 	0 label  ��  ��   o   � ����� 0 pdfpage pdfPage o      ���� 0 	pagelabel 	pageLabel  r   � � n  � � I   � ��������� 0 annotations  ��  ��   o   � ����� 0 pdfpage pdfPage o      ���� 0 pdfannotations    l  � ���������  ��  ��   �� X   ���� k   ��  !  r   � �"#" n  � �$%$ I   � ��������� 0 type  ��  ��  % o   � ����� 0 pdfannotation pdfAnnotation# o      ���� 0 	annottype 	annotType! &'& l  � ���������  ��  ��  ' (��( Z   ��)*����) E  � �+,+ J   � �-- ./. m   � �00 �11  H i g h l i g h t/ 232 m   � �44 �55  S t r i k e O u t3 676 m   � �88 �99  U n d e r l i n e7 :;: m   � �<< �==  S q u i g g l y; >?> m   � �@@ �AA  T e x t? B��B m   � �CC �DD  F r e e T e x t��  , o   � ����� 0 	annottype 	annotType* k   ��EE FGF Z   � �HI��JH E  � �KLK J   � �MM NON m   � �PP �QQ  H i g h l i g h tO RSR m   � �TT �UU  S t r i k e O u tS V��V m   � �WW �XX  U n d e r l i n e��  L o   � ����� 0 	annottype 	annotTypeI r   � �YZY n  � �[\[ I   � ��������� 0 
markuptype 
markupType��  ��  \ o   � ����� 0 pdfannotation pdfAnnotationZ o      ���� 0 
markuptype 
markupType��  J r   � �]^] m   � ���
�� 
msng^ o      ���� 0 
markuptype 
markupTypeG _`_ l   ��������  ��  ��  ` aba l   ��cd��  c [ U TODO: parse & set key/value pairs from dictionary returned by `annotationKeyValues`?   d �ee �   T O D O :   p a r s e   &   s e t   k e y / v a l u e   p a i r s   f r o m   d i c t i o n a r y   r e t u r n e d   b y   ` a n n o t a t i o n K e y V a l u e s ` ?b fgf l   ��hi��  h y s            - `/CreationDate` (example: `/CreationDate:"D:20240810112845Z"`), set by DTTG but not DT/PDFKit on Mac?   i �jj �                         -   ` / C r e a t i o n D a t e `   ( e x a m p l e :   ` / C r e a t i o n D a t e : " D : 2 0 2 4 0 8 1 0 1 1 2 8 4 5 Z " ` ) ,   s e t   b y   D T T G   b u t   n o t   D T / P D F K i t   o n   M a c ?g klk l   ��mn��  m o i            - `/Name` if it contains something more concrete than just "/Note" (example: `/Name:"/Note"`)   n �oo �                         -   ` / N a m e `   i f   i t   c o n t a i n s   s o m e t h i n g   m o r e   c o n c r e t e   t h a n   j u s t   " / N o t e "   ( e x a m p l e :   ` / N a m e : " / N o t e " ` )l pqp l   ��rs��  r ? 9set annotKeyDict to pdfAnnotation's annotationKeyValues()   s �tt r s e t   a n n o t K e y D i c t   t o   p d f A n n o t a t i o n ' s   a n n o t a t i o n K e y V a l u e s ( )q uvu l   ��������  ��  ��  v wxw l   ��yz��  y !  get the annotation's color   z �{{ 6   g e t   t h e   a n n o t a t i o n ' s   c o l o rx |}| r   ~~ I      ������� (0 colorforannotation colorForAnnotation� ���� o  ���� 0 pdfannotation pdfAnnotation��  ��   J      �� ��� o      ���� 0 
annotcolor 
annotColor� ���� o      ����  0 annotcolorname annotColorName��  } ��� l ��������  ��  ��  � ��� r  #��� n ��� I  �������� 0 username userName��  ��  � o  ���� 0 pdfannotation pdfAnnotation� o      ���� 0 annotusername annotUserName� ��� r  $-��� n $)��� I  %)�������� $0 modificationdate modificationDate��  ��  � o  $%���� 0 pdfannotation pdfAnnotation� o      ���� 0 annotmoddate annotModDate� ��� l ..��������  ��  ��  � ��� r  .7��� n .3��� I  /3�������� 
0 bounds  ��  ��  � o  ./���� 0 pdfannotation pdfAnnotation� o      ���� 0 annotbounds annotBounds� ��� l 8Q���� r  8Q��� n  8>��� 4 ;>���
�� 
cobj� m  <=���� � o  8;���� 0 annotbounds annotBounds� J      �� ��� o      ���� 0 annotoriginx annotOriginX� ���� o      ���� 0 annotoriginy annotOriginY��  �   origin   � ���    o r i g i n� ��� l Rk���� r  Rk��� n  RX��� 4 UX���
�� 
cobj� m  VW���� � o  RU���� 0 annotbounds annotBounds� J      �� ��� o      ���� 0 
annotwidth 
annotWidth� ���� o      ���� 0 annotheight annotHeight��  �   size   � ��� 
   s i z e� ��� l ll��������  ��  ��  � ��� l ll������  � � � calculate a string identifier that can be used for sorting (so that annotations can be listed in the order they appear in the text of a page)   � ���   c a l c u l a t e   a   s t r i n g   i d e n t i f i e r   t h a t   c a n   b e   u s e d   f o r   s o r t i n g   ( s o   t h a t   a n n o t a t i o n s   c a n   b e   l i s t e d   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   t e x t   o f   a   p a g e )� ��� l ll������  � b \ NOTE: including a `columnID` allows to better sort annotations in multi-column PDF articles   � ��� �   N O T E :   i n c l u d i n g   a   ` c o l u m n I D `   a l l o w s   t o   b e t t e r   s o r t   a n n o t a t i o n s   i n   m u l t i - c o l u m n   P D F   a r t i c l e s� ��� l ly���� r  ly��� \  lu��� o  lm���� 0 
pageheight 
pageHeight� l mt������ [  mt��� o  mp���� 0 annotoriginy annotOriginY� o  ps���� 0 annotheight annotHeight��  ��  � o      ���� .0 annottopmarginfromtop annotTopMarginFromTop� N H in page space, the origin lies at the lower-left corner of the PDF page   � ��� �   i n   p a g e   s p a c e ,   t h e   o r i g i n   l i e s   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e� ��� l z����� Z z�������� = z���� o  z���� <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts� m  ���
�� boovtrue� r  ����� [  ����� m  ������ � l �������� I ������ z����
�� .sysorondlong        doub
�� misccura� l �����~� ^  ����� o  ���}�} 0 annotoriginx annotOriginX� o  ���|�| 0 columnwidth columnWidth�  �~  � �{��z
�{ 
dire� m  ���y
�y olierndD�z  ��  ��  � o      �x�x 0 columnid columnID��  ��  � G A the identifier of the column containing this annotation's origin   � ��� �   t h e   i d e n t i f i e r   o f   t h e   c o l u m n   c o n t a i n i n g   t h i s   a n n o t a t i o n ' s   o r i g i n� ��� r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ���  � [  ����� o  ���w�w 0 i  � m  ���v�v � m  ���� ���  -� o  ���u�u 0 columnid columnID� m  ���� ���  -� l 	����t�s� l �� �r�q  I �� z�p�o
�p .sysorondlong        doub
�o misccura o  ���n�n .0 annottopmarginfromtop annotTopMarginFromTop �m�l
�m 
dire m  ���k
�k olierndS�l  �r  �q  �t  �s  � o      �j�j 0 
sortstring 
sortString�  l ���i�h�g�i  �h  �g    l ���f	
�f  	 , & get the annotation's highlighted text   
 � L   g e t   t h e   a n n o t a t i o n ' s   h i g h l i g h t e d   t e x t  Z  ��e E �� J  ��  m  �� �  H i g h l i g h t  m  �� �  S t r i k e O u t  m  �� �  U n d e r l i n e  �d  m  ��!! �""  S q u i g g l y�d   o  ���c�c 0 	annottype 	annotType k  �## $%$ r  ��&'& n ��()( I  ���b�a�`�b *0 quadrilateralpoints quadrilateralPoints�a  �`  ) o  ���_�_ 0 pdfannotation pdfAnnotation' o      �^�^ 0 
quadpoints 
quadPoints% *+* r  ��,-, n ��./. I  ���]0�\�] 00 annotationboundsbyline annotationBoundsByLine0 121 o  ���[�[ 0 
quadpoints 
quadPoints2 3�Z3 o  ���Y�Y 0 annotbounds annotBounds�Z  �\  /  f  ��- o      �X�X 0 boundsbyline boundsByLine+ 4�W4 r  �565 n �787 I  ��V9�U�V  0 annotationtext annotationText9 :;: o  ���T�T 0 pdfpage pdfPage; <�S< o  � �R�R 0 boundsbyline boundsByLine�S  �U  8  f  ��6 o      �Q�Q 0 	annottext 	annotText�W  �e   r  =>= m  ?? �@@  > o      �P�P 0 	annottext 	annotText ABA l �O�N�M�O  �N  �M  B CDC r  EFE n GHG I  �L�K�J�L 0 contents  �K  �J  H o  �I�I 0 pdfannotation pdfAnnotationF o      �H�H 0 annotcomment annotCommentD IJI l �G�F�E�G  �F  �E  J KLK l �DMN�D  M - ' create a deep link for this annotation   N �OO N   c r e a t e   a   d e e p   l i n k   f o r   t h i s   a n n o t a t i o nL PQP r  HRSR b  DTUT b  <VWV b  8XYX b  0Z[Z b  ,\]\ b  (^_^ b  $`a` b  "bcb o  �C�C 
0 pdfurl  c l 	!d�B�Ad m  !ee �ff  ? p a g e =�B  �A  a o  "#�@�@ 0 i  _ l 	$'g�?�>g m  $'hh �ii  & a n n o t a t i o n =�?  �>  ] o  (+�=�= 0 	annottype 	annotType[ l 	,/j�<�;j m  ,/kk �ll  & x =�<  �;  Y l 07m�:�9m c  07non o  03�8�8 0 annotoriginx annotOriginXo m  36�7
�7 
long�:  �9  W l 	8;p�6�5p m  8;qq �rr  & y =�6  �5  U l <Cs�4�3s c  <Ctut o  <?�2�2 0 annotoriginy annotOriginYu m  ?B�1
�1 
long�4  �3  S o      �0�0 0 annoturl annotURLQ vwv l II�/�.�-�/  �.  �-  w x�,x l I�y�+�*y n I�z{z I  J��)|�(�) 0 
addobject_ 
addObject_| }�'} K  J�~~ �&��& 0 citekey   o  MN�%�% 0 sourcecitekey sourceCitekey� �$���$ 0 page  � o  QR�#�# 0 i  � �"���" 0 	pagelabel 	pageLabel� o  UV�!�! 0 	pagelabel 	pageLabel� � ���  0 	annottype 	annotType� o  Y\�� 0 	annottype 	annotType� ���� 0 
markuptype 
markupType� o  _b�� 0 
markuptype 
markupType� ���� 0 
annotcolor 
annotColor� o  eh�� 0 
annotcolor 
annotColor� ����  0 annotcolorname annotColorName� o  kn��  0 annotcolorname annotColorName� ���� 0 username userName� o  qt�� 0 annotusername annotUserName� ���� 0 modifieddate modifiedDate� o  wz�� 0 annotmoddate annotModDate� ���� 0 	annottext 	annotText� o  }��� 0 	annottext 	annotText� ���� 0 comment  � o  ���� 0 annotcomment annotComment� ���� 0 deeplink deepLink� o  ���� 0 annoturl annotURL� ���� 0 
sortstring 
sortString� o  ���� 0 
sortstring 
sortString�  �'  �(  { o  IJ�� *0 pdfannotationsarray pdfAnnotationsArray�+  �*  �,  ��  ��  ��  �� 0 pdfannotation pdfAnnotation o   � ��
�
 0 pdfannotations  ��  � &   PDF pages are 0-based in PDFKit   � ��� @   P D F   p a g e s   a r e   0 - b a s e d   i n   P D F K i t� 0 i  � m   N O�	�	  � l  O V���� \   O V��� l  O T���� n  O T��� I   P T���� 0 	pageCount  �  �  � o   O P�� 0 pdfdoc pdfDoc�  �  � m   T U� �  �  �  �  � ��� l ����������  ��  ��  � ���� L  ���� J  ���� ��� c  ����� o  ������ *0 pdfannotationsarray pdfAnnotationsArray� m  ����
�� 
list� ���� o  ������ 0 	sourcedoi 	sourceDOI��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � T N Assembles the content of a Markdown record from the given PDF annotation text   � ��� �   A s s e m b l e s   t h e   c o n t e n t   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t� ��� l     ������  �   and comment.   � ���    a n d   c o m m e n t .� ��� i  FI��� I      ������� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� ��� o      ���� 0 	annottext 	annotText� ���� o      ���� 0 annotcomment annotComment��  ��  � k     ��� ��� r     ��� J     ����  � o      ���� (0 recordcontentparts recordContentParts� ��� Z    ������� F    ��� >   ��� o    ���� 0 	annottext 	annotText� m    ��
�� 
msng� >   ��� o    ���� 0 	annottext 	annotText� m    �� ���  � s    ��� b    ��� m    �� ���  >  � l   ������ c    ��� o    ���� 0 	annottext 	annotText� m    ��
�� 
TEXT��  ��  � n      ���  ;    � o    ���� (0 recordcontentparts recordContentParts��  ��  � ��� l     ��������  ��  ��  � ��� Z     �������� F     +��� >    #��� o     !���� 0 annotcomment annotComment� m   ! "��
�� 
msng� >  & )��� o   & '���� 0 annotcomment annotComment� m   ' (�� ���  � k   . ��� ��� r   . 1��� o   . /���� 0 annotcomment annotComment� o      ���� $0 processedcomment processedComment� ��� l  2 2��������  ��  ��  � ��� l  2 2������  � Y S ensure that a first-level heading at the top of the annotation comment stays there   � ��� �   e n s u r e   t h a t   a   f i r s t - l e v e l   h e a d i n g   a t   t h e   t o p   o f   t h e   a n n o t a t i o n   c o m m e n t   s t a y s   t h e r e� ��� l  2 2������  � ? 9 (even when annotation text gets inserted as a quotation)   � ��� r   ( e v e n   w h e n   a n n o t a t i o n   t e x t   g e t s   i n s e r t e d   a s   a   q u o t a t i o n )� ��� r   2 5��� m   2 3�� ��� 4 ^ ( ? : \ s * [ \ r \ n ] ) * ( # [   \ t ] + . + )� o      ���� 00 firstlevelheadingregex firstLevelHeadingRegex�    r   6 C n  6 A I   ; A������ 0 
regexmatch 
regexMatch  o   ; <���� 0 annotcomment annotComment 	��	 o   < =���� 00 firstlevelheadingregex firstLevelHeadingRegex��  ��   o   6 ;���� 0 keypointslib KeypointsLib o      ���� &0 firstlevelheading firstLevelHeading 

 Z   D r���� >  D G o   D E���� &0 firstlevelheading firstLevelHeading m   E F �   k   J n  r   J X n  J V I   O V������ 0 regexreplace regexReplace  o   O P���� &0 firstlevelheading firstLevelHeading  o   P Q���� 00 firstlevelheadingregex firstLevelHeadingRegex �� m   Q R �    $ 1��  ��   o   J O���� 0 keypointslib KeypointsLib o      ���� &0 firstlevelheading firstLevelHeading !"! s   Y ]#$# o   Y Z���� &0 firstlevelheading firstLevelHeading$ n      %&%  :   [ \& o   Z [���� (0 recordcontentparts recordContentParts" '(' l  ^ ^��������  ��  ��  ( )��) r   ^ n*+* n  ^ l,-, I   c l��.���� 0 regexreplace regexReplace. /0/ o   c d���� $0 processedcomment processedComment0 121 b   d g343 o   d e���� 00 firstlevelheadingregex firstLevelHeadingRegex4 m   e f55 �66 & [ \ r \ n ] ? ( \ s * [ \ r \ n ] ) *2 7��7 m   g h88 �99  ��  ��  - o   ^ c���� 0 keypointslib KeypointsLib+ o      ���� $0 processedcomment processedComment��  ��  ��   :;: l  s s��������  ��  ��  ; <=< l  s s��>?��  > r l for the record content, add the remaining annotation comment w/o any metadata lines (which start with "< ")   ? �@@ �   f o r   t h e   r e c o r d   c o n t e n t ,   a d d   t h e   r e m a i n i n g   a n n o t a t i o n   c o m m e n t   w / o   a n y   m e t a d a t a   l i n e s   ( w h i c h   s t a r t   w i t h   " <   " )= ABA r   s �CDC n  s ~EFE I   x ~��G���� F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLinesG HIH o   x y���� $0 processedcomment processedCommentI J��J m   y z��
�� boovfals��  ��  F o   s x���� 0 keypointslib KeypointsLibD o      ���� $0 processedcomment processedCommentB KLK l  � ���������  ��  ��  L M��M s   � �NON o   � ����� $0 processedcomment processedCommentO n      PQP  ;   � �Q o   � ����� (0 recordcontentparts recordContentParts��  ��  ��  � RSR l  � ���������  ��  ��  S TUT Z   � �VW��XV >  � �YZY o   � ����� (0 recordcontentparts recordContentPartsZ J   � �����  W r   � �[\[ n  � �]^] I   � ���_����  0 mergetextitems mergeTextItems_ `a` o   � ����� (0 recordcontentparts recordContentPartsa b��b b   � �cdc 1   � ���
�� 
lnfdd 1   � ���
�� 
lnfd��  ��  ^ o   � ����� 0 keypointslib KeypointsLib\ o      ����  0 recordcontents recordContents��  X r   � �efe m   � �gg �hh  ( n o   c o n t e n t )f o      ����  0 recordcontents recordContentsU iji l  � ���������  ��  ��  j k��k L   � �ll o   � �����  0 recordcontents recordContents��  � mnm l     ��������  ��  ��  n opo l     ��������  ��  ��  p qrq l     ��st��  s R L Assembles the name of a Markdown record from the given PDF annotation text,   t �uu �   A s s e m b l e s   t h e   n a m e   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t ,r vwv l     ��xy��  x   comment and page label.   y �zz 0   c o m m e n t   a n d   p a g e   l a b e l .w {|{ i  JM}~} I      ������ B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData ��� o      ���� 0 	annottext 	annotText� ��� o      ���� 0 annotcomment annotComment� ��� o      �~�~ 0 	pagelabel 	pageLabel�  ��  ~ k     ��� ��� r     ��� J     �}�}  � o      �|�| "0 recordnameparts recordNameParts� ��� Z    ���{�z� F    ��� >   ��� o    �y�y 0 	pagelabel 	pageLabel� m    �x
�x 
msng� >   ��� o    �w�w 0 	pagelabel 	pageLabel� m    �� ���  � s    ��� b    ��� m    �� ���  p� l   ��v�u� c    ��� o    �t�t 0 	pagelabel 	pageLabel� m    �s
�s 
TEXT�v  �u  � n      ���  ;    � o    �r�r "0 recordnameparts recordNameParts�{  �z  � ��� l     �q�p�o�q  �p  �o  � ��� r     #��� m     !�� ���  � o      �n�n  0 recordnamepart recordNamePart� ��� Z   $ }���m�l� F   $ /��� >  $ '��� o   $ %�k�k 0 annotcomment annotComment� m   % &�j
�j 
msng� >  * -��� o   * +�i�i 0 annotcomment annotComment� m   + ,�� ���  � k   2 y�� ��� l  2 2�h���h  � f ` for the record's name, use any first-level heading (if there's one in the annotation's comment)   � ��� �   f o r   t h e   r e c o r d ' s   n a m e ,   u s e   a n y   f i r s t - l e v e l   h e a d i n g   ( i f   t h e r e ' s   o n e   i n   t h e   a n n o t a t i o n ' s   c o m m e n t )� ��� r   2 ?��� n  2 =��� I   7 =�g��f�g 40 markdownheadingsfromtext markdownHeadingsFromText� ��� o   7 8�e�e 0 annotcomment annotComment� ��d� m   8 9�� ���  #�d  �f  � o   2 7�c�c 0 keypointslib KeypointsLib� o      �b�b $0 markdownheadings markdownHeadings� ��� Z   @ S���a�`� >  @ D��� o   @ A�_�_ $0 markdownheadings markdownHeadings� J   A C�^�^  � r   G O��� n   G M��� o   K M�]�] 0 heading  � n   G K��� 4  H K�\�
�\ 
cobj� m   I J�[�[ � o   G H�Z�Z $0 markdownheadings markdownHeadings� o      �Y�Y  0 recordnamepart recordNamePart�a  �`  � ��� l  T T�X�W�V�X  �W  �V  � ��� l  T T�U���U  � H B otherwise, use up to 12 words from the beginning of the "comment"   � ��� �   o t h e r w i s e ,   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " c o m m e n t "� ��T� Z   T y���S�R� =  T W��� o   T U�Q�Q  0 recordnamepart recordNamePart� m   U V�� ���  � k   Z u�� ��� r   Z g��� n  Z e��� I   _ e�P��O�P F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines� ��� o   _ `�N�N 0 annotcomment annotComment� ��M� m   ` a�L
�L boovtrue�M  �O  � o   Z _�K�K 0 keypointslib KeypointsLib� o      �J�J 0 annotcomment annotComment� ��I� r   h u��� n  h s��� I   m s�H��G�H (0 firstwordsfromtext firstWordsFromText� ��� o   m n�F�F 0 annotcomment annotComment� ��E� m   n o�D�D �E  �G  � o   h m�C�C 0 keypointslib KeypointsLib� o      �B�B  0 recordnamepart recordNamePart�I  �S  �R  �T  �m  �l  � ��� l  ~ ~�A�@�?�A  �@  �?  � ��� l  ~ ~�>���>  � E ? else use up to 12 words from the beginning of the "annotText"    � ��� ~   e l s e   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " a n n o t T e x t "  � ��� Z   ~ �� �=�<� =  ~ � o   ~ �;�;  0 recordnamepart recordNamePart m    � �    k   � �  r   � �	 n  � �

 I   � ��:�9�: (0 firstwordsfromtext firstWordsFromText  o   � ��8�8 0 	annottext 	annotText �7 m   � ��6�6 �7  �9   o   � ��5�5 0 keypointslib KeypointsLib	 o      �4�4  0 recordnamepart recordNamePart �3 Z   � ��2�1 >  � � o   � ��0�0  0 recordnamepart recordNamePart m   � � �   k   � �  l  � ��/�/   e _ wrap the extracted text in quotes to indicate that it's quoted text (and not your own comment)    � �   w r a p   t h e   e x t r a c t e d   t e x t   i n   q u o t e s   t o   i n d i c a t e   t h a t   i t ' s   q u o t e d   t e x t   ( a n d   n o t   y o u r   o w n   c o m m e n t ) �. r   � � b   � � !  b   � �"#" m   � �$$ �%%  "# o   � ��-�-  0 recordnamepart recordNamePart! m   � �&& �''  " o      �,�,  0 recordnamepart recordNamePart�.  �2  �1  �3  �=  �<  � ()( l  � ��+�*�)�+  �*  �)  ) *+* Z  � �,-�(�', =  � �./. o   � ��&�&  0 recordnamepart recordNamePart/ m   � �00 �11  - r   � �232 m   � �44 �55  ( u n t i t l e d )3 o      �%�%  0 recordnamepart recordNamePart�(  �'  + 676 s   � �898 o   � ��$�$  0 recordnamepart recordNamePart9 n      :;:  ;   � �; o   � ��#�# "0 recordnameparts recordNameParts7 <=< l  � ��"�!� �"  �!  �   = >?> Z   � �@A�B@ >  � �CDC o   � ��� "0 recordnameparts recordNamePartsD J   � ���  A r   � �EFE n  � �GHG I   � ��I��  0 mergetextitems mergeTextItemsI JKJ o   � ��� "0 recordnameparts recordNamePartsK L�L m   � �MM �NN  :  �  �  H o   � ��� 0 keypointslib KeypointsLibF o      �� 0 
recordname 
recordName�  B r   � �OPO m   � �QQ �RR  ( u n t i t l e d )P o      �� 0 
recordname 
recordName? STS l  � �����  �  �  T U�U L   � �VV o   � ��� 0 
recordname 
recordName�  | WXW l     ����  �  �  X YZY l     ����  �  �  Z [\[ l     �
]^�
  ] U O Creates a new (Markdown) record in DEVONthink with the given text & properties   ^ �__ �   C r e a t e s   a   n e w   ( M a r k d o w n )   r e c o r d   i n   D E V O N t h i n k   w i t h   t h e   g i v e n   t e x t   &   p r o p e r t i e s\ `a` l     �	bc�	  b [ U and returns it. If an existing record with the same URL exists at the same location,   c �dd �   a n d   r e t u r n s   i t .   I f   a n   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   e x i s t s   a t   t h e   s a m e   l o c a t i o n ,a efe l     �gh�  g 9 3 this record will get updated and returned instead.   h �ii f   t h i s   r e c o r d   w i l l   g e t   u p d a t e d   a n d   r e t u r n e d   i n s t e a d .f jkj l     �lm�  l _ Y Note that the actual return value is a list with two items with the first item being the   m �nn �   N o t e   t h a t   t h e   a c t u a l   r e t u r n   v a l u e   i s   a   l i s t   w i t h   t w o   i t e m s   w i t h   t h e   f i r s t   i t e m   b e i n g   t h ek opo l     �qr�  q Z T created/modified record and the second item being a boolean value indicating if the   r �ss �   c r e a t e d / m o d i f i e d   r e c o r d   a n d   t h e   s e c o n d   i t e m   b e i n g   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h ep tut l     �vw�  v L F returned record actually has been modified ('true') or not (`false`):   w �xx �   r e t u r n e d   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) :u yzy l     �{|�  { "  `{dtRecord, didUpdateNote}`   | �}} 8   ` { d t R e c o r d ,   d i d U p d a t e N o t e } `z ~~ l     ����  � 6 0 Credits: modified after script code by Rob Trew   � ��� `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w ��� l     ����  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i  NQ��� I      ��� �  0 createdtrecord createDTRecord� ��� o      ����  0 folderlocation folderLocation� ��� o      ����  0 foldermetadata folderMetadata� ��� o      ���� 0 
recordname 
recordName� ��� o      ���� 0 recordaliases recordAliases� ��� o      ���� 0 	recordurl 	recordURL� ��� o      ���� 0 
recordtags 
recordTags� ��� o      ���� 0 	isflagged 	isFlagged� ��� o      ���� 0 
recordtext 
recordText� ��� o      ���� (0 recordcreationdate recordCreationDate� ��� o      ���� 00 recordmodificationdate recordModificationDate� ��� o      ����  0 recordmetadata recordMetadata� ��� o      ���� 0 recordrating recordRating� ���� o      ���� $0 recordlabelindex recordLabelIndex��  �   � O    ��� k   �� ��� r    ��� K    �� ����
�� 
DTty� m   	 
��
�� Ctypmkdn� ����
�� 
DTcn� o    ���� 0 
recordtext 
recordText� �����
�� 
pnam� o    ���� 0 
recordname 
recordName��  � o      ���� 0 newrecorddata newRecordData� ��� l   ��������  ��  ��  � ��� Z    %������� >   ��� o    ���� (0 recordcreationdate recordCreationDate� m    ��
�� 
msng� r    !��� b    ��� o    ���� 0 newrecorddata newRecordData� K    �� �����
�� 
DTcr� o    ���� (0 recordcreationdate recordCreationDate��  � o      ���� 0 newrecorddata newRecordData��  ��  � ��� l  & &��������  ��  ��  � ��� Z   & 8������� >  & )��� o   & '���� 0 	recordurl 	recordURL� m   ' (�� ���  � r   , 4��� b   , 2��� o   , -���� 0 newrecorddata newRecordData� K   - 1�� �����
�� 
pURL� o   . /���� 0 	recordurl 	recordURL��  � o      ���� 0 newrecorddata newRecordData��  ��  � ��� l  9 9��������  ��  ��  � ��� Z   9 K������� >  9 <��� o   9 :���� 0 recordaliases recordAliases� m   : ;�� ���  � r   ? G��� b   ? E��� o   ? @���� 0 newrecorddata newRecordData� K   @ D�� �����
�� 
DTal� o   A B���� 0 recordaliases recordAliases��  � o      ���� 0 newrecorddata newRecordData��  ��  � ��� l  L L��������  ��  ��  � ��� r   L O��� m   L M��
�� 
msng� o      ���� 0 arecord aRecord� ��� r   P S��� m   P Q��
�� boovfals� o      ���� 0 didcreatenote didCreateNote� ��� r   T Y��� m   T U��
�� boovfals� o      ���� 0 didupdatenote didUpdateNote� ��� l  Z Z��������  ��  ��  � ��� l  Z Z������  � Q K use any existing record with the same URL that exists at the same location   � ��� �   u s e   a n y   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   t h a t   e x i s t s   a t   t h e   s a m e   l o c a t i o n� ��� r   Z _��� m   Z [��
�� boovfals� o      ���� $0 isexistingrecord isExistingRecord� ��� Z   ` �������� >  ` c��� o   ` a���� 0 	recordurl 	recordURL� m   a b   �  � k   f �  r   f o I  f k����
�� .DTpacd49list       utxt o   f g���� 0 	recordurl 	recordURL��   o      ���� "0 existingrecords existingRecords �� Z   p �	
����	 >  p v o   p s���� "0 existingrecords existingRecords J   s u����  
 k   y �  r   y � b   y � b   y � n   y ~ 1   z ~��
�� 
DTlo o   y z����  0 folderlocation folderLocation n   ~ � 1    ���
�� 
pnam o   ~ ����  0 folderlocation folderLocation m   � � �  / o      ����  0 targetlocation targetLocation �� X   � ��� Z   � � ���� F   � �!"! l  � �#����# =  � �$%$ o   � ����� 0 arecord aRecord% m   � ���
�� 
msng��  ��  " l  � �&����& =   � �'(' n   � �)*) 1   � ���
�� 
DTlo* o   � �����  0 existingrecord existingRecord( o   � �����  0 targetlocation targetLocation��  ��    k   � �++ ,-, r   � �./. o   � �����  0 existingrecord existingRecord/ o      ���� 0 arecord aRecord- 0��0 r   � �121 m   � ���
�� boovtrue2 o      ���� $0 isexistingrecord isExistingRecord��  ��  ��  ��  0 existingrecord existingRecord o   � ����� "0 existingrecords existingRecords��  ��  ��  ��  ��  ��  � 343 l  � ���������  ��  ��  4 565 Z   �78����7 =  � �9:9 o   � ����� 0 arecord aRecord: m   � ���
�� 
msng8 k   �;; <=< r   � �>?> I  � ���@A
�� .DTpacd08DTrc       reco@ o   � ����� 0 newrecorddata newRecordDataA ��B��
�� 
DTinB o   � �����  0 folderlocation folderLocation��  ? o      ���� 0 arecord aRecord= CDC l  � ���������  ��  ��  D EFE l  � ���GH��  G c ] newly created Markdown notes inherit their notes folder's existing metadata & Finder comment   H �II �   n e w l y   c r e a t e d   M a r k d o w n   n o t e s   i n h e r i t   t h e i r   n o t e s   f o l d e r ' s   e x i s t i n g   m e t a d a t a   &   F i n d e r   c o m m e n tF JKJ r   � �LML b   � �NON o   � �����  0 recordmetadata recordMetadataO o   � �����  0 foldermetadata folderMetadataM o      ����  0 recordmetadata recordMetadataK PQP r   � �RSR n  � �TUT 1   � ���
�� 
DTcoU o   � ���  0 folderlocation folderLocationS n     VWV 1   � ��~
�~ 
DTcoW o   � ��}�} 0 arecord aRecordQ XYX l  � ��|�{�z�|  �{  �z  Y Z[Z r   � �\]\ m   � ��y
�y boovtrue] o      �x�x 0 didcreatenote didCreateNote[ ^�w^ r   �_`_ [   �aba o   ��v�v &0 creatednotescount createdNotesCountb m  �u�u ` o      �t�t &0 creatednotescount createdNotesCount�w  ��  ��  6 cdc l �s�r�q�s  �r  �q  d efe Z  gh�p�og G  #iji = klk o  �n�n $0 isexistingrecord isExistingRecordl m  �m
�m boovfalsj = mnm o  �l�l *0 updateexistingnotes updateExistingNotesn m  �k
�k boovtrueh k  &oo pqp Z  &Krs�j�ir = &-tut o  &+�h�h 80 updatenameforexistingnotes updateNameForExistingNotesu m  +,�g
�g boovtrues Z  0Gvw�f�ev >  05xyx n  03z{z 1  13�d
�d 
pnam{ o  01�c�c 0 arecord aRecordy o  34�b�b 0 
recordname 
recordNamew k  8C|| }~} r  8=� m  89�a
�a boovtrue� o      �`�` 0 didupdatenote didUpdateNote~ ��_� r  >C��� o  >?�^�^ 0 
recordname 
recordName� n      ��� 1  @B�]
�] 
pnam� o  ?@�\�\ 0 arecord aRecord�_  �f  �e  �j  �i  q ��� l LL�[�Z�Y�[  �Z  �Y  � ��� Z  Lu���X�W� = LS��� o  LQ�V�V F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes� m  QR�U
�U boovtrue� Z  Vq���T�S� >  V]��� n  V[��� 1  W[�R
�R 
DTpl� o  VW�Q�Q 0 arecord aRecord� o  [\�P�P 0 
recordtext 
recordText� k  `m�� ��� r  `e��� m  `a�O
�O boovtrue� o      �N�N 0 didupdatenote didUpdateNote� ��M� r  fm��� o  fg�L�L 0 
recordtext 
recordText� n      ��� 1  hl�K
�K 
DTpl� o  gh�J�J 0 arecord aRecord�M  �T  �S  �X  �W  � ��� l vv�I�H�G�I  �H  �G  � ��� Z  v����F�E� F  v���� l v���D�C� G  v���� = v{��� o  vy�B�B $0 isexistingrecord isExistingRecord� m  yz�A
�A boovfals� = ~���� o  ~��@�@ P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes� m  ���?
�? boovtrue�D  �C  � > ����� o  ���>�> 00 recordmodificationdate recordModificationDate� m  ���=
�= 
msng� k  ���� ��� l ���<���<  � j d TODO: should we force update recordModificationDate when an existing record's property got updated?   � ��� �   T O D O :   s h o u l d   w e   f o r c e   u p d a t e   r e c o r d M o d i f i c a t i o n D a t e   w h e n   a n   e x i s t i n g   r e c o r d ' s   p r o p e r t y   g o t   u p d a t e d ?� ��;� Z  �����:�9� >  ����� n  ����� 1  ���8
�8 
DTmo� o  ���7�7 0 arecord aRecord� o  ���6�6 00 recordmodificationdate recordModificationDate� k  ���� ��� r  ����� m  ���5
�5 boovtrue� o      �4�4 0 didupdatenote didUpdateNote� ��3� r  ����� o  ���2�2 00 recordmodificationdate recordModificationDate� n      ��� 1  ���1
�1 
DTmo� o  ���0�0 0 arecord aRecord�3  �:  �9  �;  �F  �E  � ��� l ���/�.�-�/  �.  �-  � ��� Z  �����,�+� G  ����� = ����� o  ���*�* $0 isexistingrecord isExistingRecord� m  ���)
�) boovfals� = ����� o  ���(�( J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes� m  ���'
�' boovtrue� Z  �����&�%� >  ����� n  ����� 1  ���$
�$ 
DTst� o  ���#�# 0 arecord aRecord� o  ���"�" 0 	isflagged 	isFlagged� k  ���� ��� r  ����� m  ���!
�! boovtrue� o      � �  0 didupdatenote didUpdateNote� ��� r  ����� o  ���� 0 	isflagged 	isFlagged� n      ��� 1  ���
� 
DTst� o  ���� 0 arecord aRecord�  �&  �%  �,  �+  � ��� l ������  �  �  � ��� Z  �!����� G  ����� = ����� o  ���� $0 isexistingrecord isExistingRecord� m  ���
� boovfals� = ����� o  ���� <0 updateratingforexistingnotes updateRatingForExistingNotes� m  ���
� boovtrue� Z  ����� >  	��� n  ��� 1  �
� 
DTrt� o  �� 0 arecord aRecord� o  �� 0 recordrating recordRating� k  �� ��� r  ��� m  �
� boovtrue� o      �� 0 didupdatenote didUpdateNote� ��� r  ��� o  �
�
 0 recordrating recordRating� n      ��� 1  �	
�	 
DTrt� o  �� 0 arecord aRecord�  �  �  �  �  � ��� l ""����  �  �  �    Z  "W�� G  "5 = "' o  "%�� $0 isexistingrecord isExistingRecord m  %&�
� boovfals = *1	 o  */� �  :0 updatelabelforexistingnotes updateLabelForExistingNotes	 m  /0��
�� boovtrue Z  8S
����
 >  8? n  8= 1  9=��
�� 
DTla o  89���� 0 arecord aRecord o  =>���� $0 recordlabelindex recordLabelIndex k  BO  r  BG m  BC��
�� boovtrue o      ���� 0 didupdatenote didUpdateNote �� r  HO o  HI���� $0 recordlabelindex recordLabelIndex n       1  JN��
�� 
DTla o  IJ���� 0 arecord aRecord��  ��  ��  �  �    l XX��������  ��  ��    Z  X����� F  Xv !  l Xk"����" G  Xk#$# = X]%&% o  X[���� $0 isexistingrecord isExistingRecord& m  [\��
�� boovfals$ = `g'(' o  `e���� 80 updatetagsforexistingnotes updateTagsForExistingNotes( m  ef��
�� boovtrue��  ��  ! > nr)*) o  no���� 0 
recordtags 
recordTags* J  oq����   k  y�++ ,-, r  y�./. n  y~010 1  z~��
�� 
tags1 o  yz���� 0 arecord aRecord/ o      ���� (0 existingrecordtags existingRecordTags- 232 X  ��4��54 Z ��67����6 H  ��88 E ��9:9 o  ������ (0 existingrecordtags existingRecordTags: o  ������ 0 atag aTag7 r  ��;<; m  ����
�� boovtrue< o      ���� 0 didupdatenote didUpdateNote��  ��  �� 0 atag aTag5 o  ������ 0 
recordtags 
recordTags3 =��= r  ��>?> b  ��@A@ o  ������ (0 existingrecordtags existingRecordTagsA o  ������ 0 
recordtags 
recordTags? n      BCB 1  ����
�� 
tagsC o  ������ 0 arecord aRecord��  ��  ��   DED l ����������  ��  ��  E FGF Z  ��HI����H l ��J����J G  ��KLK = ��MNM o  ������ $0 isexistingrecord isExistingRecordN m  ����
�� boovfalsL = ��OPO o  ������ L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotesP m  ����
�� boovtrue��  ��  I Z  ��QR����Q l ��S����S n ��TUT I  ����V���� 60 updatemetadatafordtrecord updateMetadataForDTRecordV WXW o  ������ 0 arecord aRecordX Y��Y o  ������  0 recordmetadata recordMetadata��  ��  U  f  ����  ��  R r  ��Z[Z m  ����
�� boovtrue[ o      ���� 0 didupdatenote didUpdateNote��  ��  ��  ��  G \]\ l ����������  ��  ��  ] ^��^ Z  �_`����_ F  ��aba = ��cdc o  ������ 0 didupdatenote didUpdateNoted m  ����
�� boovtrueb = ��efe o  ������ 0 didcreatenote didCreateNotef m  ����
�� boovfals` r  ghg [  iji o  ���� &0 updatednotescount updatedNotesCountj m  ���� h o      ���� &0 updatednotescount updatedNotesCount��  ��  ��  �p  �o  f klk l ��������  ��  ��  l m��m L  nn J  oo pqp o  ���� 0 arecord aRecordq r��r o  ���� 0 didupdatenote didUpdateNote��  ��  � 5     ��s��
�� 
capps m    tt �uu  D N t p
�� kfrmID  � vwv l     ��������  ��  ��  w xyx l     ��������  ��  ��  y z{z l     ��|}��  | > 8 Sets the custom metadata of the given DEVONthink group.   } �~~ p   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .{ � l     ������  � U O @param folderLocation The DEVONthink group whose custom metadata shall be set.   � ��� �   @ p a r a m   f o l d e r L o c a t i o n   T h e   D E V O N t h i n k   g r o u p   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .� ��� l     ������  � M G @param folderMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   f o l d e r M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  RU��� I      ������� 00 setmetadatafordtfolder setMetadataForDTFolder� ��� o      ����  0 folderlocation folderLocation� ���� o      ����  0 foldermetadata folderMetadata��  ��  � Z     5������� F      ��� F     ��� F     ��� =    ��� o     ���� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders� m    ��
�� boovtrue� >  
 ��� o   
 ����  0 folderlocation folderLocation� m    ��
�� 
msng� >   ��� o    ����  0 foldermetadata folderMetadata� m    ��
�� 
msng� >   ��� o    ����  0 foldermetadata folderMetadata� J    ����  � O  # 1��� r   + 0��� o   + ,����  0 foldermetadata folderMetadata� n      ��� 1   - /��
�� 
DTcm� o   , -����  0 folderlocation folderLocation� 5   # (�����
�� 
capp� m   % &�� ���  D N t p
�� kfrmID  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � ? 9 Sets the custom metadata of the given DEVONthink record.   � ��� r   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .� ��� l     ������  � O I @param aRecord The DEVONthink record whose custom metadata shall be set.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .� ��� l     ������  � M G @param recordMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  VY��� I      ������� 00 setmetadatafordtrecord setMetadataForDTRecord� ��� o      ���� 0 arecord aRecord� ���� o      ����  0 recordmetadata recordMetadata��  ��  � Z     )����~� F     ��� F     ��� >    ��� o     �}�} 0 arecord aRecord� m    �|
�| 
msng� >   	��� o    �{�{  0 recordmetadata recordMetadata� m    �z
�z 
msng� >   ��� o    �y�y  0 recordmetadata recordMetadata� J    �x�x  � O   %��� r    $��� o     �w�w  0 recordmetadata recordMetadata� n      ��� 1   ! #�v
�v 
DTcm� o     !�u�u 0 arecord aRecord� 5    �t��s
�t 
capp� m    �� ���  D N t p
�s kfrmID  �  �~  � ��� l     �r�q�p�r  �q  �p  � ��� l     �o�n�m�o  �n  �m  � ��� l     �l���l  � l f Updates the custom metadata of the given DEVONthink record. Returns a boolean value indicating if the   � ��� �   U p d a t e s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h e� ��� l     �k���k  � I C given record actually has been modified ('true') or not (`false`).   � ��� �   g i v e n   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) .� ��� l     �j���j  � S M @param aRecord The DEVONthink record whose custom metadata shall be updated.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   u p d a t e d .� ��� l     �i���i  � M G @param recordMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  Z]��� I      �h��g�h 60 updatemetadatafordtrecord updateMetadataForDTRecord� ��� o      �f�f 0 arecord aRecord� ��e� o      �d�d  0 recordmetadata recordMetadata�e  �g  � k     ��� ��� Z    ���c�b� G     � � G      =     o     �a�a 0 arecord aRecord m    �`
�` 
msng =   	 o    �_�_  0 recordmetadata recordMetadata m    �^
�^ 
msng  =    o    �]�]  0 recordmetadata recordMetadata J    �\�\  � L    		 m    �[
�[ boovfals�c  �b  � 

 l   �Z�Y�X�Z  �Y  �X    r    ! m    �W
�W boovfals o      �V�V 0 didupdatenote didUpdateNote  l  " "�U�T�S�U  �T  �S    O   " � k   * �  r   * / n   * - 1   + -�R
�R 
DTcm o   * +�Q�Q 0 arecord aRecord o      �P�P 00 existingrecordmetadata existingRecordMetadata  Q   0 M ! k   3 A"" #$# l  3 3�O%&�O  % Y S existingRecordMetadata may be undefined in which case this triggers the error case   & �'' �   e x i s t i n g R e c o r d M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e$ (�N( Z  3 A)*�M�L) =  3 6+,+ o   3 4�K�K 00 existingrecordmetadata existingRecordMetadata, m   4 5�J
�J 
msng* r   9 =-.- J   9 ;�I�I  . o      �H�H 00 existingrecordmetadata existingRecordMetadata�M  �L  �N    R      �G�F�E
�G .ascrerr ****      � ****�F  �E  ! r   I M/0/ J   I K�D�D  0 o      �C�C 00 existingrecordmetadata existingRecordMetadata 121 l  N N�B�A�@�B  �A  �@  2 343 Z   N �56�?�>5 >  N R787 o   N O�=�= 00 existingrecordmetadata existingRecordMetadata8 J   O Q�<�<  6 k   U �99 :;: r   U a<=< n  U _>?> I   Z _�;@�:�; 0 keysofrecord_ keysOfRecord_@ A�9A o   Z [�8�8 00 existingrecordmetadata existingRecordMetadata�9  �:  ? o   U Z�7�7 0 keypointslib KeypointsLib= o      �6�6 0 existingkeys existingKeys; BCB r   b nDED n  b lFGF I   g l�5H�4�5 0 keysofrecord_ keysOfRecord_H I�3I o   g h�2�2  0 recordmetadata recordMetadata�3  �4  G o   b g�1�1 0 keypointslib KeypointsLibE o      �0�0 0 thekeys theKeysC JKJ l  o o�/�.�-�/  �.  �-  K LML l  o o�,NO�,  N � � NOTE: updating non-empty values for existing keys doesn't seem to work unless we clear the key's value or remove the key entirely   O �PP   N O T E :   u p d a t i n g   n o n - e m p t y   v a l u e s   f o r   e x i s t i n g   k e y s   d o e s n ' t   s e e m   t o   w o r k   u n l e s s   w e   c l e a r   t h e   k e y ' s   v a l u e   o r   r e m o v e   t h e   k e y   e n t i r e l yM QRQ X   o �S�+TS k    �UU VWV r    �XYX n   �Z[Z I   � ��*\�)�* F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName\ ]�(] o   � ��'�' 0 thekey theKey�(  �)  [  f    �Y o      �&�& 0 dtkey dtKeyW ^_^ l  � ��%�$�#�%  �$  �#  _ `�"` Z   � �ab�!ca E  � �ded o   � �� �  0 existingkeys existingKeyse o   � ��� 0 dtkey dtKeyb k   � �ff ghg r   � �iji l  � �k��k n  � �lml I   � ��n�� .0 valueforkey_inrecord_ valueForKey_inRecord_n opo o   � ��� 0 thekey theKeyp q�q o   � ���  0 recordmetadata recordMetadata�  �  m o   � ��� 0 keypointslib KeypointsLib�  �  j o      �� 0 thevalue theValueh rsr r   � �tut l  � �v��v n  � �wxw I   � ��y�� .0 valueforkey_inrecord_ valueForKey_inRecord_y z{z o   � ��� 0 dtkey dtKey{ |�| o   � ��� 00 existingrecordmetadata existingRecordMetadata�  �  x o   � ��� 0 keypointslib KeypointsLib�  �  u o      �� 0 existingvalue existingValues }~} l  � ����
�  �  �
  ~ �	 Z   � ������ >   � ���� o   � ��� 0 thevalue theValue� o   � ��� 0 existingvalue existingValue� k   � ��� ��� r   � ���� m   � ��
� boovtrue� o      �� 0 didupdatenote didUpdateNote� ��� r   � ���� l  � ���� � n  � ���� I   � �������� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_� ��� l  � ������� m   � ���
�� 
msng��  ��  � ��� o   � ����� 0 dtkey dtKey� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib�  �   � o      ���� 00 existingrecordmetadata existingRecordMetadata�  �  �  �	  �!  c r   � ���� m   � ���
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote�"  �+ 0 thekey theKeyT o   r s���� 0 thekeys theKeysR ��� l  � ���������  ��  ��  � ���� r   � ���� n  � ���� I   � �������� <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_� ��� o   � �����  0 recordmetadata recordMetadata� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib� o      ����  0 recordmetadata recordMetadata��  �?  �>  4 ��� l  � ���������  ��  ��  � ���� r   � ���� o   � �����  0 recordmetadata recordMetadata� n      ��� 1   � ���
�� 
DTcm� o   � ����� 0 arecord aRecord��   5   " '�����
�� 
capp� m   $ %�� ���  D N t p
�� kfrmID   ��� l  � ���������  ��  ��  � ���� L   � ��� o   � ����� 0 didupdatenote didUpdateNote��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � [ U Returns the metadata identifier name that DEVONthink would use in scripting contexts   � ��� �   R e t u r n s   t h e   m e t a d a t a   i d e n t i f i e r   n a m e   t h a t   D E V O N t h i n k   w o u l d   u s e   i n   s c r i p t i n g   c o n t e x t s� ��� l     ������  �   for the given key name.   � ��� 0   f o r   t h e   g i v e n   k e y   n a m e .� ��� i  ^a��� I      ������� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName� ���� o      ���� 0 thekey theKey��  ��  � k      �� ��� r     ��� n    
��� I    
������� 0 lowercasetext lowercaseText� ���� o    ���� 0 thekey theKey��  ��  � o     ���� 0 keypointslib KeypointsLib� o      ���� 0 dtkey dtKey� ��� r    ��� n   ��� I    ������� 0 regexreplace regexReplace� ��� o    ���� 0 dtkey dtKey� ��� m    �� ���  \ s +� ���� m    �� ���  ��  ��  � o    ���� 0 keypointslib KeypointsLib� o      ���� 0 dtkey dtKey� ��� l   ��������  ��  ��  � ���� L     �� b    ��� m    �� ���  m d� o    ���� 0 dtkey dtKey��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � T N Appends the given string to the Finder comment of the given DEVONthink group.   � ��� �   A p p e n d s   t h e   g i v e n   s t r i n g   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .� ��� i  be��� I      ������� 60 appendtocommentofdtfolder appendToCommentOfDTFolder� ��� o      ����  0 folderlocation folderLocation� ���� o      ���� 0 foldercomment folderComment��  ��  � Z     T������� F     ��� >    ��� o     ���� 0 foldercomment folderComment� m    ��
�� 
msng� >   
��� o    ���� 0 foldercomment folderComment� J    	����  � k    P��    r     J    ����   o      ���� 0 commentparts commentParts �� O    P k    O 	 r    !

 l   ���� n     1    ��
�� 
DTco o    ����  0 folderlocation folderLocation��  ��   o      ���� .0 existingfoldercomment existingFolderComment	  Z  " 8���� F   " - >  " % o   " #���� .0 existingfoldercomment existingFolderComment m   # $��
�� 
msng >  ( + o   ( )���� .0 existingfoldercomment existingFolderComment m   ) * �   s   0 4 o   0 1���� .0 existingfoldercomment existingFolderComment n        ;   2 3 o   1 2���� 0 commentparts commentParts��  ��     s   9 =!"! o   9 :���� 0 foldercomment folderComment" n      #$#  ;   ; <$ o   : ;���� 0 commentparts commentParts  %&% l  > >��������  ��  ��  & '��' r   > O()( n  > K*+* I   C K��,����  0 mergetextitems mergeTextItems, -.- o   C D���� 0 commentparts commentParts. /��/ b   D G010 1   D E��
�� 
lnfd1 1   E F��
�� 
lnfd��  ��  + o   > C���� 0 keypointslib KeypointsLib) n      232 1   L N��
�� 
DTco3 o   K L����  0 folderlocation folderLocation��   5    ��4��
�� 
capp4 m    55 �66  D N t p
�� kfrmID  ��  ��  ��  � 787 l     ��������  ��  ��  8 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  = c ] Returns a record of bibliographic metadata for the given DOI (as fetched from OpenAlex.org),   > �?? �   R e t u r n s   a   r e c o r d   o f   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   g i v e n   D O I   ( a s   f e t c h e d   f r o m   O p e n A l e x . o r g ) ,< @A@ l     ��BC��  B 9 3 ready to be used as custom metadata in DEVONthink.   C �DD f   r e a d y   t o   b e   u s e d   a s   c u s t o m   m e t a d a t a   i n   D E V O N t h i n k .A EFE l     ��GH��  G L F @param doi The DOI for which bibliographic metadata shall be fetched.   H �II �   @ p a r a m   d o i   T h e   D O I   f o r   w h i c h   b i b l i o g r a p h i c   m e t a d a t a   s h a l l   b e   f e t c h e d .F JKJ l     ��LM��  L ` Z @param citekey The citekey to be used with the fetched BibTeX data; may be empty in which   M �NN �   @ p a r a m   c i t e k e y   T h e   c i t e k e y   t o   b e   u s e d   w i t h   t h e   f e t c h e d   B i b T e X   d a t a ;   m a y   b e   e m p t y   i n   w h i c hK OPO l     ��QR��  Q + % case a default citekey will be used.   R �SS J   c a s e   a   d e f a u l t   c i t e k e y   w i l l   b e   u s e d .P TUT l     �VW�  V ` Z TODO: allow to specify which metadata shall get exported into which custom metadata field   W �XX �   T O D O :   a l l o w   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l dU YZY i  fi[\[ I      �~]�}�~ &0 bibmetadatafordoi bibMetadataForDOI] ^_^ o      �|�| 0 doi  _ `�{` o      �z�z 0 citekey  �{  �}  \ k    aa bcb Z    de�y�xd G     fgf =    hih o     �w�w 0 doi  i m    �v
�v 
msngg =   	jkj o    �u�u 0 doi  k m    ll �mm  e L    nn J    �t�t  �y  �x  c opo l   �s�r�q�s  �r  �q  p qrq r    /sts n   -uvu I    -�pw�o�p  0 metadatafordoi metadataForDOIw xyx o    �n�n 0 doi  y z{z o    !�m�m 0 fetchbibtex fetchBibTeX{ |}| o   ! &�l�l 00 fetchformattedcitation fetchFormattedCitation} ~~ m   & '�� ���  a p a ��� m   ' (�� ��� 
 e n - G B� ��k� o   ( )�j�j 0 citekey  �k  �o  v o    �i�i 0 keypointslib KeypointsLibt o      �h�h "0 publicationdata publicationDatar ��� Z  0 >���g�f� =  0 4��� o   0 1�e�e "0 publicationdata publicationData� J   1 3�d�d  � L   7 :�� J   7 9�c�c  �g  �f  � ��� l  ? ?�b�a�`�b  �a  �`  � ��� r   ? C��� J   ? A�_�_  � o      �^�^ 0 bibmetadata bibMetadata� ��� l  D D�]�\�[�]  �\  �[  � ��� l  D Q���� r   D Q��� n  D O��� I   I O�Z��Y�Z .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m   I J�� ���  a u t h o r s� ��X� o   J K�W�W "0 publicationdata publicationData�X  �Y  � o   D I�V�V 0 keypointslib KeypointsLib� o      �U�U 0 
pubauthors 
pubAuthors� 4 . single author: string, multiple authors: list   � ��� \   s i n g l e   a u t h o r :   s t r i n g ,   m u l t i p l e   a u t h o r s :   l i s t� ��� Z   R ����T�S� F   R f��� F   R ]��� >  R U��� o   R S�R�R 0 
pubauthors 
pubAuthors� m   S T�Q
�Q 
msng� >  X [��� o   X Y�P�P 0 
pubauthors 
pubAuthors� m   Y Z�� ���  � >  ` d��� o   ` a�O�O 0 
pubauthors 
pubAuthors� J   a c�N�N  � k   i ��� ��� r   i {��� b   i y��� o   i j�M�M 0 bibmetadata bibMetadata� K   j x�� �L��K�L 0 authors  � l  k v��J�I� n  k v��� I   p v�H��G�H  0 mergetextitems mergeTextItems� ��� o   p q�F�F 0 
pubauthors 
pubAuthors� ��E� 1   q r�D
�D 
lnfd�E  �G  � o   k p�C�C 0 keypointslib KeypointsLib�J  �I  �K  � o      �B�B 0 bibmetadata bibMetadata� ��� l  | |�A�@�?�A  �@  �?  � ��� r   | ���� I  | ��>��=
�> .corecnte****       ****� o   | }�<�< 0 
pubauthors 
pubAuthors�=  � o      �;�; "0 pubauthorscount pubAuthorsCount� ��:� Z   � ������ =  � ���� o   � ��9�9 "0 pubauthorscount pubAuthorsCount� m   � ��8�8 � r   � ���� b   � ���� o   � ��7�7 0 bibmetadata bibMetadata� K   � ��� �6��5�6 
0 author  � n   � ���� 4  � ��4�
�4 
cobj� m   � ��3�3 � o   � ��2�2 0 
pubauthors 
pubAuthors�5  � o      �1�1 0 bibmetadata bibMetadata� ��� =  � ���� o   � ��0�0 "0 pubauthorscount pubAuthorsCount� m   � ��/�/ � ��.� r   � ���� b   � ���� o   � ��-�- 0 bibmetadata bibMetadata� K   � ��� �,��+�, 
0 author  � b   � ���� b   � ���� n   � ���� 4  � ��*�
�* 
cobj� m   � ��)�) � o   � ��(�( 0 
pubauthors 
pubAuthors� m   � ��� ���    &  � n   � ���� 4  � ��'�
�' 
cobj� m   � ��&�& � o   � ��%�% 0 
pubauthors 
pubAuthors�+  � o      �$�$ 0 bibmetadata bibMetadata�.  � l  � ����� r   � ���� b   � ���� o   � ��#�# 0 bibmetadata bibMetadata� K   � ��� �"��!�" 
0 author  � b   � ���� n   � �� � 4  � �� 
�  
cobj m   � ���   o   � ��� 0 
pubauthors 
pubAuthors� m   � � �    e t   a l .�!  � o      �� 0 bibmetadata bibMetadata�  
 3 or more   � �    3   o r   m o r e�:  �T  �S  �  l  � �����  �  �    r   � �	
	 n  � � I   � ���� .0 valueforkey_inrecord_ valueForKey_inRecord_  m   � � �  d a t e � o   � ��� "0 publicationdata publicationData�  �   o   � ��� 0 keypointslib KeypointsLib
 o      �� 0 pubdate pubDate  Z  � ��� >  � � o   � ��� 0 pubdate pubDate m   � ��
� 
msng r   � � b   � � o   � ��� 0 bibmetadata bibMetadata K   � � ��� 0 date   c   � �  o   � ��� 0 pubdate pubDate  m   � ��
� 
ldt �   o      �
�
 0 bibmetadata bibMetadata�  �   !"! l  � ��	���	  �  �  " #$# r   �%&% n  � �'(' I   � ��)�� .0 valueforkey_inrecord_ valueForKey_inRecord_) *+* m   � �,, �--  p u b l i s h e r+ .�. o   � ��� "0 publicationdata publicationData�  �  ( o   � ��� 0 keypointslib KeypointsLib& o      �� 0 pubpublisher pubPublisher$ /0/ Z  12� ��1 F  343 > 565 o  ���� 0 pubpublisher pubPublisher6 m  ��
�� 
msng4 > 787 o  	���� 0 pubpublisher pubPublisher8 m  	99 �::  2 r  ;<; b  =>= o  ���� 0 bibmetadata bibMetadata> K  ?? ��@���� 0 	publisher  @ o  ���� 0 pubpublisher pubPublisher��  < o      ���� 0 bibmetadata bibMetadata�   ��  0 ABA l !!��������  ��  ��  B CDC r  !0EFE n !.GHG I  &.��I���� .0 valueforkey_inrecord_ valueForKey_inRecord_I JKJ m  &)LL �MM  i s s nK N��N o  )*���� "0 publicationdata publicationData��  ��  H o  !&���� 0 keypointslib KeypointsLibF o      ���� 0 pubissn pubISSND OPO Z 1OQR����Q F  1>STS > 14UVU o  12���� 0 pubissn pubISSNV m  23��
�� 
msngT > 7<WXW o  78���� 0 pubissn pubISSNX m  8;YY �ZZ  R r  AK[\[ b  AI]^] o  AB���� 0 bibmetadata bibMetadata^ K  BH__ ��`���� 0 is?n  ` o  EF���� 0 pubissn pubISSN��  \ o      ���� 0 bibmetadata bibMetadata��  ��  P aba l PP��������  ��  ��  b cdc r  P_efe n P]ghg I  U]��i���� .0 valueforkey_inrecord_ valueForKey_inRecord_i jkj m  UXll �mm  j o u r n a lk n��n o  XY���� "0 publicationdata publicationData��  ��  h o  PU���� 0 keypointslib KeypointsLibf o      ���� 0 
pubjournal 
pubJournald opo Z `~qr����q F  `msts > `cuvu o  `a���� 0 
pubjournal 
pubJournalv m  ab��
�� 
msngt > fkwxw o  fg���� 0 
pubjournal 
pubJournalx m  gjyy �zz  r r  pz{|{ b  px}~} o  pq���� 0 bibmetadata bibMetadata~ K  qw ������� 0 journal  � o  tu���� 0 
pubjournal 
pubJournal��  | o      ���� 0 bibmetadata bibMetadata��  ��  p ��� l ��������  ��  ��  � ��� r  ���� n ���� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  v o l u m e� ���� o  ������ "0 publicationdata publicationData��  ��  � o  ����� 0 keypointslib KeypointsLib� o      ���� 0 	pubvolume 	pubVolume� ��� r  ����� n ����� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ��� 
 i s s u e� ���� o  ������ "0 publicationdata publicationData��  ��  � o  ������ 0 keypointslib KeypointsLib� o      ���� 0 pubissue pubIssue� ��� Z  ��������� F  ����� > ����� o  ������ 0 	pubvolume 	pubVolume� m  ����
�� 
msng� > ����� o  ������ 0 	pubvolume 	pubVolume� m  ���� ���  � k  ���� ��� Z ��������� F  ����� > ����� o  ������ 0 pubissue pubIssue� m  ����
�� 
msng� > ����� o  ������ 0 pubissue pubIssue� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ 0 	pubvolume 	pubVolume� m  ���� ���  (� o  ������ 0 pubissue pubIssue� m  ���� ���  )� o      ���� 0 	pubvolume 	pubVolume��  ��  � ���� r  ����� b  ����� o  ������ 0 bibmetadata bibMetadata� K  ���� ������� 
0 volume  � o  ������ 0 	pubvolume 	pubVolume��  � o      ���� 0 bibmetadata bibMetadata��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� n ����� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  p a g e� ���� o  ������ "0 publicationdata publicationData��  ��  � o  ������ 0 keypointslib KeypointsLib� o      ���� 0 pubpages pubPages� ��� Z �������� F  ����� > ����� o  ������ 0 pubpages pubPages� m  ����
�� 
msng� > ����� o  ������ 0 pubpages pubPages� m  ���� ���  � r   
��� b   ��� o   ���� 0 bibmetadata bibMetadata� K  �� ������� 0 page  � o  ���� 0 pubpages pubPages��  � o      ���� 0 bibmetadata bibMetadata��  ��  � ��� l ��������  ��  ��  � ��� r  ��� n ��� I  ������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  �� ���  c i t a t i o n� ���� o  ���� "0 publicationdata publicationData��  ��  � o  ���� 0 keypointslib KeypointsLib� o      ���� 0 pubcitation pubCitation� ��� Z =������� F  ,��� > "��� o   ���� 0 pubcitation pubCitation� m   !�
� 
msng� > %*��� o  %&�� 0 pubcitation pubCitation� m  &)�� �    � r  /9 b  /7 o  /0�� 0 bibmetadata bibMetadata K  06 ��� 0 	reference   o  34�� 0 pubcitation pubCitation�   o      �� 0 bibmetadata bibMetadata��  ��  �  l >>����  �  �   	
	 r  >M n >K I  CK��� .0 valueforkey_inrecord_ valueForKey_inRecord_  m  CF �  b i b t e x � o  FG�� "0 publicationdata publicationData�  �   o  >C�� 0 keypointslib KeypointsLib o      �� 0 	pubbibtex 	pubBibTeX
  Z Nl��~ F  N[ > NQ o  NO�}�} 0 	pubbibtex 	pubBibTeX m  OP�|
�| 
msng > TY o  TU�{�{ 0 	pubbibtex 	pubBibTeX m  UX �     r  ^h!"! b  ^f#$# o  ^_�z�z 0 bibmetadata bibMetadata$ K  _e%% �y&�x�y 
0 bibtex  & o  bc�w�w 0 	pubbibtex 	pubBibTeX�x  " o      �v�v 0 bibmetadata bibMetadata�  �~   '(' l mm�u�t�s�u  �t  �s  ( )*) r  m|+,+ n mz-.- I  rz�r/�q�r .0 valueforkey_inrecord_ valueForKey_inRecord_/ 010 m  ru22 �33  u r l1 4�p4 o  uv�o�o "0 publicationdata publicationData�p  �q  . o  mr�n�n 0 keypointslib KeypointsLib, o      �m�m 0 publink pubLink* 565 Z }�78�l�k7 F  }�9:9 > }�;<; o  }~�j�j 0 publink pubLink< m  ~�i
�i 
msng: > ��=>= o  ���h�h 0 publink pubLink> m  ��?? �@@  8 r  ��ABA b  ��CDC o  ���g�g 0 bibmetadata bibMetadataD K  ��EE �fF�e�f 0 link  F o  ���d�d 0 publink pubLink�e  B o      �c�c 0 bibmetadata bibMetadata�l  �k  6 GHG l ���b�a�`�b  �a  �`  H IJI r  ��KLK n ��MNM I  ���_O�^�_ .0 valueforkey_inrecord_ valueForKey_inRecord_O PQP m  ��RR �SS  p m i dQ T�]T o  ���\�\ "0 publicationdata publicationData�]  �^  N o  ���[�[ 0 keypointslib KeypointsLibL o      �Z�Z 0 pubpmid pubPMIDJ UVU Z ��WX�Y�XW F  ��YZY > ��[\[ o  ���W�W 0 pubpmid pubPMID\ m  ���V
�V 
msngZ > ��]^] o  ���U�U 0 pubpmid pubPMID^ m  ��__ �``  X r  ��aba b  ��cdc o  ���T�T 0 bibmetadata bibMetadatad K  ��ee �Sf�R�S 0 pmid  f o  ���Q�Q 0 pubpmid pubPMID�R  b o      �P�P 0 bibmetadata bibMetadata�Y  �X  V ghg l ���O�N�M�O  �N  �M  h iji r  ��klk n ��mnm I  ���Lo�K�L .0 valueforkey_inrecord_ valueForKey_inRecord_o pqp m  ��rr �ss 
 p m c i dq t�Jt o  ���I�I "0 publicationdata publicationData�J  �K  n o  ���H�H 0 keypointslib KeypointsLibl o      �G�G 0 pubpmcid pubPMCIDj uvu Z �	wx�F�Ew F  ��yzy > ��{|{ o  ���D�D 0 pubpmcid pubPMCID| m  ���C
�C 
msngz > ��}~} o  ���B�B 0 pubpmcid pubPMCID~ m  �� ���  x r  ���� b  ���� o  ���A�A 0 bibmetadata bibMetadata� K  ��� �@��?�@ 	0 pmcid  � o  � �>�> 0 pubpmcid pubPMCID�?  � o      �=�= 0 bibmetadata bibMetadata�F  �E  v ��� l 

�<�;�:�<  �;  �:  � ��9� L  
�� o  
�8�8 0 bibmetadata bibMetadata�9  Z ��� l     �7�6�5�7  �6  �5  � ��� l     �4�3�2�4  �3  �2  � ��� l     �1���1  � L F Maps the given color name to a DEVONthink label index and returns it.   � ��� �   M a p s   t h e   g i v e n   c o l o r   n a m e   t o   a   D E V O N t h i n k   l a b e l   i n d e x   a n d   r e t u r n s   i t .� ��� i  jm��� I      �0��/�0 00 labelindexforcolorname labelIndexForColorName� ��.� o      �-�- 0 	colorname 	colorName�.  �/  � k     >�� ��� Z    ���,�+� G     ��� =    ��� o     �*�* 0 	colorname 	colorName� m    �)
�) 
msng� =   	��� o    �(�( 0 	colorname 	colorName� m    �� ���  � L    �� m    �'�'  �,  �+  � ��� l   �&�%�$�&  �%  �$  � ��� r    ��� m    �#�#  � o      �"�" $0 recordlabelindex recordLabelIndex� ��� r    +��� l   )��!� � n   )��� I    )���� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_� ��� m    �� ���  c o l o r N a m e� ��� o     �� 0 	colorname 	colorName� ��� o     %�� 0 labelmappings labelMappings�  �  � o    �� 0 keypointslib KeypointsLib�!  �   � o      �� 0 labelmapping labelMapping� ��� Z   , ;����� >  , /��� o   , -�� 0 labelmapping labelMapping� m   - .�
� 
msng� r   2 7��� n  2 5��� o   3 5�� 0 
labelindex 
labelIndex� o   2 3�� 0 labelmapping labelMapping� o      �� $0 recordlabelindex recordLabelIndex�  �  � ��� l  < <����  �  �  � ��� L   < >�� o   < =�� $0 recordlabelindex recordLabelIndex�  � ��� l     ���
�  �  �
  � ��� l     �	���	  �  �  � ��� l     ����  � [ U Returns the name of the approximate color (like "red", "blue", "green", etc) for the   � ��� �   R e t u r n s   t h e   n a m e   o f   t h e   a p p r o x i m a t e   c o l o r   ( l i k e   " r e d " ,   " b l u e " ,   " g r e e n " ,   e t c )   f o r   t h e� ��� l     ����  �   given hue degree.   � ��� $   g i v e n   h u e   d e g r e e .� ��� l     ����  � U O @param hueDegree A color's hue component given as a degree (0-359) of the hue    � ��� �   @ p a r a m   h u e D e g r e e   A   c o l o r ' s   h u e   c o m p o n e n t   g i v e n   a s   a   d e g r e e   ( 0 - 3 5 9 )   o f   t h e   h u e  � ��� l     ����  � = 7 in the HSB (hue, saturation, brightness) color scheme.   � ��� n   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .� ��� i  nq��� I      ���� "0 colornameforhue colorNameForHue� �� � o      ���� 0 	huedegree 	hueDegree�   �  � k     c�� ��� r     ��� m     �� ���  � o      ���� 0 	colorname 	colorName� ��� l   ��������  ��  ��  � ��� X    8����� Z    3������� F    '��� @    ��� o    ���� 0 	huedegree 	hueDegree� n   ��� o    ���� 0 lowerhuelimit lowerHueLimit� o    ���� 0 colormapping colorMapping� B     %��� o     !���� 0 	huedegree 	hueDegree� n  ! $   o   " $���� 0 upperhuelimit upperHueLimit o   ! "���� 0 colormapping colorMapping� r   * / n  * - o   + -���� 0 	colorname 	colorName o   * +���� 0 colormapping colorMapping o      ���� 0 	colorname 	colorName��  ��  �� 0 colormapping colorMapping� o    ���� 0 colormappings colorMappings�  Z   9 `	���� F   9 P

 =  9 < o   9 :���� 0 	colorname 	colorName m   : ; �   l  ? N���� G   ? N @   ? D o   ? @���� 0 	huedegree 	hueDegree n  @ C o   A C���� 0 lowerhuelimit lowerHueLimit o   @ A���� 0 colormapping colorMapping B   G L o   G H���� 0 	huedegree 	hueDegree n  H K o   I K���� 0 upperhuelimit upperHueLimit o   H I���� 0 colormapping colorMapping��  ��  	 r   S \ n  S Z o   X Z���� 0 	colorname 	colorName o   S X���� "0 redcolormapping redColorMapping o      ���� 0 	colorname 	colorName��  ��     l  a a��������  ��  ��    !��! L   a c"" o   a b���� 0 	colorname 	colorName��  � #$# l     ��������  ��  ��  $ %&% l     ��������  ��  ��  & '(' l     ��)*��  ) W Q Attempts to extract the annotation's text from its line-based bounds rectangles.   * �++ �   A t t e m p t s   t o   e x t r a c t   t h e   a n n o t a t i o n ' s   t e x t   f r o m   i t s   l i n e - b a s e d   b o u n d s   r e c t a n g l e s .( ,-, l     ��./��  . Q K @param boundsByLine List of line-based bounds, where each bounds rectangle   / �00 �   @ p a r a m   b o u n d s B y L i n e   L i s t   o f   l i n e - b a s e d   b o u n d s ,   w h e r e   e a c h   b o u n d s   r e c t a n g l e- 121 l     ��34��  3 S M specifies the bounding box of an annotation's individual line in page space.   4 �55 �   s p e c i f i e s   t h e   b o u n d i n g   b o x   o f   a n   a n n o t a t i o n ' s   i n d i v i d u a l   l i n e   i n   p a g e   s p a c e .2 676 i  ru898 I      ��:����  0 annotationtext annotationText: ;<; o      ���� 0 pdfpage pdfPage< =��= o      ���� 0 boundsbyline boundsByLine��  ��  9 k     n>> ?@? r     ABA J     ����  B o      ���� 0 
textbyline 
textByLine@ CDC l   ��������  ��  ��  D EFE X    aG��HG k    \II JKJ r    LML l   N����N n   OPO I    ��Q���� &0 selectionforrect_ selectionForRect_Q R��R o    ���� 0 	thebounds 	theBounds��  ��  P o    ���� 0 pdfpage pdfPage��  ��  M o      �� 0 pdfselection pdfSelectionK STS r    %UVU n   #WXW I    #���� 
0 string  �  �  X o    �� 0 pdfselection pdfSelectionV o      �� 0 linetext lineTextT YZY l  & &����  �  �  Z [�[ Z   & \\]��\ F   & 1^_^ >  & )`a` o   & '�� 0 linetext lineTexta m   ' (�
� 
msng_ >  , /bcb o   , -�� 0 linetext lineTextc m   - .dd �ee  ] k   4 Xff ghg l  4 4�ij�  i W Q replace any trailing whitespace or "\n" at the end of a line with a single space   j �kk �   r e p l a c e   a n y   t r a i l i n g   w h i t e s p a c e   o r   " \ n "   a t   t h e   e n d   o f   a   l i n e   w i t h   a   s i n g l e   s p a c eh lml r   4 Dnon n  4 Bpqp I   9 B�r�� 0 regexreplace regexReplacer sts c   9 <uvu o   9 :�� 0 linetext lineTextv m   : ;�
� 
TEXTt wxw m   < =yy �zz  ( \ s + | \ \ n ) $x {�{ m   = >|| �}}   �  �  q o   4 9�� 0 keypointslib KeypointsLibo o      �� 0 linetext lineTextm ~~ l  E E����  �  �   ��� l  E E����  � b \ assume that a hyphen (and optional space) at the end of a line indicates a word hyphenation   � ��� �   a s s u m e   t h a t   a   h y p h e n   ( a n d   o p t i o n a l   s p a c e )   a t   t h e   e n d   o f   a   l i n e   i n d i c a t e s   a   w o r d   h y p h e n a t i o n� ��� l  E E����  � e _ NOTE: while this assumption is often correct, it's not always true so it may incorrectly merge   � ��� �   N O T E :   w h i l e   t h i s   a s s u m p t i o n   i s   o f t e n   c o r r e c t ,   i t ' s   n o t   a l w a y s   t r u e   s o   i t   m a y   i n c o r r e c t l y   m e r g e� ��� l  E E����  � !            hyphenated words   � ��� 6                       h y p h e n a t e d   w o r d s� ��� r   E S��� n  E Q��� I   J Q���� 0 regexreplace regexReplace� ��� o   J K�� 0 linetext lineText� ��� m   K L�� ���  -   $� ��� m   L M�� ���  �  �  � o   E J�� 0 keypointslib KeypointsLib� o      �� 0 linetext lineText� ��� l  T T����  �  �  � ��� s   T X��� o   T U�� 0 linetext lineText� n      ���  ;   V W� o   U V�� 0 
textbyline 
textByLine�  �  �  �  �� 0 	thebounds 	theBoundsH o    	�� 0 boundsbyline boundsByLineF ��� l  b b����  �  �  � ��� L   b n�� n  b m��� I   g m����  0 mergetextitems mergeTextItems� ��� o   g h�� 0 
textbyline 
textByLine� ��� m   h i�� ���  �  �  � o   b g�� 0 keypointslib KeypointsLib�  7 ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � @ : Return's the annotation's color & approximate color name.   � ��� t   R e t u r n ' s   t h e   a n n o t a t i o n ' s   c o l o r   &   a p p r o x i m a t e   c o l o r   n a m e .� ��� l     ����  � [ U Note that the actual return value is a list with two items with the first item being   � ��� �   N o t e   t h a t   t h e   a c t u a l   r e t u r n   v a l u e   i s   a   l i s t   w i t h   t w o   i t e m s   w i t h   t h e   f i r s t   i t e m   b e i n g� ��� l     ����  � W Q the annotation's color (specified as a NSColor object) and the second item being   � ��� �   t h e   a n n o t a t i o n ' s   c o l o r   ( s p e c i f i e d   a s   a   N S C o l o r   o b j e c t )   a n d   t h e   s e c o n d   i t e m   b e i n g� ��� l     ����  � M G the color's approximate color name (like "red", "blue", "green", etc):   � ��� �   t h e   c o l o r ' s   a p p r o x i m a t e   c o l o r   n a m e   ( l i k e   " r e d " ,   " b l u e " ,   " g r e e n " ,   e t c ) :� ��� l     ����  � %  `{annotColor, annotColorName}`   � ��� >   ` { a n n o t C o l o r ,   a n n o t C o l o r N a m e } `� ��� i  vy��� I      ���� (0 colorforannotation colorForAnnotation� ��� o      �~�~ 0 pdfannotation pdfAnnotation�  �  � k    |�� ��� Z    ���}�|� =    ��� o     �{�{ 0 pdfannotation pdfAnnotation� m    �z
�z 
msng� L    �� J    
�� ��� m    �y
�y 
msng� ��x� m    �� ���  �x  �}  �|  � ��� l   �w�v�u�w  �v  �u  � ��� r    ��� m    �t
�t 
msng� o      �s�s 0 
annotcolor 
annotColor� ��� r    ��� m    �� ���  � o      �r�r  0 annotcolorname annotColorName� ��� r    ��� n   ��� I    �q�p�o�q 0 type  �p  �o  � o    �n�n 0 pdfannotation pdfAnnotation� o      �m�m 0 	annottype 	annotType� ��� r     '��� n    %��� I   ! %�l�k�j�l *0 annotationkeyvalues annotationKeyValues�k  �j  � o     !�i�i 0 pdfannotation pdfAnnotation� o      �h�h 0 annotkeydict annotKeyDict� ��� l  ( (�g�f�e�g  �f  �e  � ��� Z   (� �d� E  ( / J   ( + �c m   ( ) �  F r e e T e x t�c   l  + .�b�a c   + .	
	 o   + ,�`�` 0 	annottype 	annotType
 m   , -�_
�_ 
TEXT�b  �a    k   2  l  2 < r   2 < c   2 : l  2 8�^�] n  2 8 I   3 8�\�[�\ 0 valueforkey_ valueForKey_ �Z m   3 4 �  / D S�Z  �[   o   2 3�Y�Y 0 annotkeydict annotKeyDict�^  �]   m   8 9�X
�X 
TEXT o      �W�W 0 defaultstyle defaultStyle O I e.g.: NSString "font-family: Helvetica; font-size: 12pt; color: #FF4015"    � �   e . g . :   N S S t r i n g   " f o n t - f a m i l y :   H e l v e t i c a ;   f o n t - s i z e :   1 2 p t ;   c o l o r :   # F F 4 0 1 5 " �V Z   =�U  >  = @!"! o   = >�T�T 0 defaultstyle defaultStyle" m   > ?�S
�S 
msng k   C �## $%$ r   C P&'& n  C N()( I   H N�R*�Q�R 0 
regexmatch 
regexMatch* +,+ o   H I�P�P 0 defaultstyle defaultStyle, -�O- m   I J.. �//  # [ 0 - 9 A - F ] { 6 }�O  �Q  ) o   C H�N�N 0 keypointslib KeypointsLib' o      �M�M  0 hexcolorstring hexColorString% 0�L0 Z   Q �12�K�J1 >  Q T343 o   Q R�I�I  0 hexcolorstring hexColorString4 m   R S55 �66  2 k   W �77 898 r   W w:;: l  W a<�H�G< n  W a=>= I   \ a�F?�E�F .0 rgbcolorfromhexcolor_ RGBColorFromHexColor_? @�D@ o   \ ]�C�C  0 hexcolorstring hexColorString�D  �E  > o   W \�B�B 0 keypointslib KeypointsLib�H  �G  ; J      AA BCB o      �A�A 0 thered theRedC DED o      �@�@ 0 thegreen theGreenE F�?F o      �>�> 0 theblue theBlue�?  9 G�=G r   x �HIH l  x �J�<�;J n  x �KLK I   { ��:M�9�: @0 colorwithred_green_blue_alpha_ colorWithRed_green_blue_alpha_M NON ^   { �PQP o   { |�8�8 0 thered theRedQ m   | �7�7 �O RSR ^   � �TUT o   � ��6�6 0 thegreen theGreenU m   � ��5�5 �S VWV ^   � �XYX o   � ��4�4 0 theblue theBlueY m   � ��3�3 �W Z�2Z m   � �[[ ?�      �2  �9  L n  x {\]\ o   y {�1�1 0 nscolor NSColor] m   x y�0
�0 misccura�<  �;  I o      �/�/ 0 
annotcolor 
annotColor�=  �K  �J  �L  �U    l  �^_`^ k   �aa bcb l  � �defd r   � �ghg c   � �iji l  � �k�.�-k n  � �lml I   � ��,n�+�, 0 valueforkey_ valueForKey_n o�*o m   � �pp �qq  / D A�*  �+  m o   � ��)�) 0 annotkeydict annotKeyDict�.  �-  j m   � ��(
�( 
TEXTh o      �'�' &0 defaultappearance defaultAppearancee = 7 e.g.: NSString "/Helvetica 12 Tf 1.000 0.251 0.082 rg"   f �rr n   e . g . :   N S S t r i n g   " / H e l v e t i c a   1 2   T f   1 . 0 0 0   0 . 2 5 1   0 . 0 8 2   r g "c s�&s Z   �tu�%�$t >  � �vwv o   � ��#�# &0 defaultappearance defaultAppearancew m   � ��"
�" 
msngu k   �xx yzy r   � �{|{ m   � �}} �~~ L . * ?   ( \ d + \ . \ d + )   ( \ d + \ . \ d + )   ( \ d + \ . \ d + ) . *| o      �!�! 0 
colorregex 
colorRegexz �  Z   ������ >  � ���� l  � ����� n  � ���� I   � ����� 0 
regexmatch 
regexMatch� ��� o   � ��� &0 defaultappearance defaultAppearance� ��� o   � ��� 0 
colorregex 
colorRegex�  �  � o   � ��� 0 keypointslib KeypointsLib�  �  � m   � ��� ���  � k   ��� ��� r   � ���� n  � ���� I   � ����� 0 regexreplace regexReplace� ��� o   � ��� &0 defaultappearance defaultAppearance� ��� o   � ��� 0 
colorregex 
colorRegex� ��� m   � ��� ���  $ 1�  �  � o   � ��� 0 keypointslib KeypointsLib� o      �� 0 thered theRed� ��� r   � ���� n  � ���� I   � ����� 0 regexreplace regexReplace� ��� o   � ��� &0 defaultappearance defaultAppearance� ��� o   � ��� 0 
colorregex 
colorRegex� ��
� m   � ��� ���  $ 2�
  �  � o   � ��	�	 0 keypointslib KeypointsLib� o      �� 0 thegreen theGreen� ��� r   � ���� n  � ���� I   � ����� 0 regexreplace regexReplace� ��� o   � ��� &0 defaultappearance defaultAppearance� ��� o   � ��� 0 
colorregex 
colorRegex� ��� m   � ��� ���  $ 3�  �  � o   � ��� 0 keypointslib KeypointsLib� o      �� 0 theblue theBlue� �� � r   ���� l  �	������ n  �	��� I   �	������� @0 colorwithred_green_blue_alpha_ colorWithRed_green_blue_alpha_� ��� o   � ����� 0 thered theRed� ��� o   � ����� 0 thegreen theGreen� ��� o   � ���� 0 theblue theBlue� ���� m   �� ?�      ��  ��  � n  � ���� o   � ����� 0 nscolor NSColor� m   � ���
�� misccura��  ��  � o      ���� 0 
annotcolor 
annotColor�   �  �  �   �%  �$  �&  _ 1 + if "/DS" isn't available fallback to "/DA"   ` ��� V   i f   " / D S "   i s n ' t   a v a i l a b l e   f a l l b a c k   t o   " / D A "�V  �d   r  ��� n ��� I  �������� 	0 color  ��  ��  � o  ���� 0 pdfannotation pdfAnnotation� o      ���� 0 
annotcolor 
annotColor� ��� l ��������  ��  ��  � ��� Z  v������� > !��� o  ���� 0 
annotcolor 
annotColor� m   ��
�� 
msng� k  $r�� ��� Z  $J������� > $3��� n $)��� o  %)���� 0 
colorspace 
colorSpace� o  $%���� 0 
annotcolor 
annotColor� l )2������ n )2��� I  .2�������� *0 devicergbcolorspace deviceRGBColorSpace��  ��  � n ).��� o  *.���� 0 nscolorspace NSColorSpace� m  )*��
�� misccura��  ��  � r  6F��� l 6D������ n 6D��� I  7D������� .0 colorusingcolorspace_ colorUsingColorSpace_� ���� l 7@������ n 7@��� I  <@�������� *0 devicergbcolorspace deviceRGBColorSpace��  ��  � n 7<��� o  8<���� 0 nscolorspace NSColorSpace� m  78��
�� misccura��  ��  ��  ��  � o  67���� 0 
annotcolor 
annotColor��  ��  � o      ���� 0 
annotcolor 
annotColor��  ��  � ��� l KK��������  ��  ��  � ��� l KK������  � �  approximate the name of the annotation's color via the degree of the hue in the HSB (hue, saturation, brightness) color scheme   � ��� �   a p p r o x i m a t e   t h e   n a m e   o f   t h e   a n n o t a t i o n ' s   c o l o r   v i a   t h e   d e g r e e   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e� ��� r  Ki��� I Kg���� z����
�� .sysorondlong        doub
�� misccura� l O\������ ]  O\� � l OX���� c  OX n OT I  PT�������� 0 huecomponent hueComponent��  ��   o  OP���� 0 
annotcolor 
annotColor m  TW��
�� 
nmbr��  ��    m  X[����h��  ��  � ��
� 
dire m  _b�
� olierndS�  � o      �� 0 	huedegree 	hueDegree� � r  jr	 n jp

 I  kp��� "0 colornameforhue colorNameForHue � o  kl�� 0 	huedegree 	hueDegree�  �    f  jk	 o      ��  0 annotcolorname annotColorName�  ��  ��  �  l ww����  �  �   � L  w| J  w{  o  wx�� 0 
annotcolor 
annotColor � o  xy��  0 annotcolorname annotColorName�  �  �  l     ����  �  �    l     ����  �  �    l     ��   ` Z Converts a list of quadrilateral points to a list of line-based bounds, where each bounds    � �   C o n v e r t s   a   l i s t   o f   q u a d r i l a t e r a l   p o i n t s   t o   a   l i s t   o f   l i n e - b a s e d   b o u n d s ,   w h e r e   e a c h   b o u n d s   l     �!"�  ! ] W rectangle specifies the bounding box of an annotation's individual line in page space.   " �## �   r e c t a n g l e   s p e c i f i e s   t h e   b o u n d i n g   b o x   o f   a n   a n n o t a t i o n ' s   i n d i v i d u a l   l i n e   i n   p a g e   s p a c e .  $%$ l     �&'�  & n h @param quadPoints List of quadrilateral points (as obtained by `pdfAnnotation's quadrilateralPoints()`,   ' �(( �   @ p a r a m   q u a d P o i n t s   L i s t   o f   q u a d r i l a t e r a l   p o i n t s   ( a s   o b t a i n e d   b y   ` p d f A n n o t a t i o n ' s   q u a d r i l a t e r a l P o i n t s ( ) ` ,% )*) l     �+,�  + m g with each point wrapped as NSValue object) where each quadrilateral (i.e., a group of four consecutive   , �-- �   w i t h   e a c h   p o i n t   w r a p p e d   a s   N S V a l u e   o b j e c t )   w h e r e   e a c h   q u a d r i l a t e r a l   ( i . e . ,   a   g r o u p   o f   f o u r   c o n s e c u t i v e* ./. l     �01�  0 g a points ordered in Z-form {topLeft, topRight, bottomLeft, bottomRight} so that points with higher   1 �22 �   p o i n t s   o r d e r e d   i n   Z - f o r m   { t o p L e f t ,   t o p R i g h t ,   b o t t o m L e f t ,   b o t t o m R i g h t }   s o   t h a t   p o i n t s   w i t h   h i g h e r/ 343 l     �56�  5 r l y-values come first) encircles a line of text to be highlighted. The coordinates of each point are relative   6 �77 �   y - v a l u e s   c o m e   f i r s t )   e n c i r c l e s   a   l i n e   o f   t e x t   t o   b e   h i g h l i g h t e d .   T h e   c o o r d i n a t e s   o f   e a c h   p o i n t   a r e   r e l a t i v e4 898 l     �:;�  : 6 0 to the bound�s origin of the markup annotation.   ; �<< `   t o   t h e   b o u n d  s   o r i g i n   o f   t h e   m a r k u p   a n n o t a t i o n .9 =>= l     �?@�  ? c ] @param annotationBounds The bounding box for the annotation in page space (which is a 72 dpi   @ �AA �   @ p a r a m   a n n o t a t i o n B o u n d s   T h e   b o u n d i n g   b o x   f o r   t h e   a n n o t a t i o n   i n   p a g e   s p a c e   ( w h i c h   i s   a   7 2   d p i> BCB l     �DE�  D b \ coordinate system with the origin at the lower-left corner of the PDF page), as obtained by   E �FF �   c o o r d i n a t e   s y s t e m   w i t h   t h e   o r i g i n   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e ) ,   a s   o b t a i n e d   b yC GHG l     �IJ�  I $  `pdfAnnotation's |bounds|()`.   J �KK <   ` p d f A n n o t a t i o n ' s   | b o u n d s | ( ) ` .H LML i  z}NON I      �P�� 00 annotationboundsbyline annotationBoundsByLineP QRQ o      �� 0 
quadpoints 
quadPointsR S�S o      �� $0 annotationbounds annotationBounds�  �  O k     �TT UVU l    WXYW r     Z[Z n     \]\ 4   �^
� 
cobj^ m    �� ] o     �� $0 annotationbounds annotationBounds[ o      �� 0 	theorigin 	theOriginX A ; a point specified as a list of x/y positions: {xPos, YPos}   Y �__ v   a   p o i n t   s p e c i f i e d   a s   a   l i s t   o f   x / y   p o s i t i o n s :   { x P o s ,   Y P o s }V `a` r    bcb J    	��  c o      �� 0 boundsbyline boundsByLinea ded r    fgf ^    hih l   j��j I   �k�
� .corecnte****       ****k o    �� 0 
quadpoints 
quadPoints�  �  �  i m    �� g o      �� 0 maxquadcount maxQuadCounte lml r    non m    �� o o      �� 0 	quadcount 	quadCountm pqp l   ����  �  �  q rsr l   �tu�  t m g iterate over each quadrilateral (4 points: topLeft, topRight, bottomLeft, bottomRight) representing an   u �vv �   i t e r a t e   o v e r   e a c h   q u a d r i l a t e r a l   ( 4   p o i n t s :   t o p L e f t ,   t o p R i g h t ,   b o t t o m L e f t ,   b o t t o m R i g h t )   r e p r e s e n t i n g   a ns wxw l   �yz�  y 7 1 annotation line and get its bounds in page space   z �{{ b   a n n o t a t i o n   l i n e   a n d   g e t   i t s   b o u n d s   i n   p a g e   s p a c ex |}| U    �~~ k   ! ��� ��� l  ! !����  � K E get the top left & bottom right quad points for this annotation line   � ��� �   g e t   t h e   t o p   l e f t   &   b o t t o m   r i g h t   q u a d   p o i n t s   f o r   t h i s   a n n o t a t i o n   l i n e� ��� r   ! +��� n  ! )��� I   % )���� 0 
pointvalue 
pointValue�  �  � l  ! %���� n   ! %��� 4   " %��
� 
cobj� o   # $�~�~ 0 	quadcount 	quadCount� o   ! "�}�} 0 
quadpoints 
quadPoints�  �  � o      �|�| 0 topleftpoint topLeftPoint� ��� r   , 8��� n  , 6��� I   2 6�{�z�y�{ 0 
pointvalue 
pointValue�z  �y  � l  , 2��x�w� n   , 2��� 4   - 2�v�
�v 
cobj� l  . 1��u�t� [   . 1��� o   . /�s�s 0 	quadcount 	quadCount� m   / 0�r�r �u  �t  � o   , -�q�q 0 
quadpoints 
quadPoints�x  �w  � o      �p�p $0 bottomrightpoint bottomRightPoint� ��� l  9 9�o�n�m�o  �n  �m  � ��� l  9 9�l���l  � b \ convert each quad point (whose coordinates are relative to the bound�s origin of the markup   � ��� �   c o n v e r t   e a c h   q u a d   p o i n t   ( w h o s e   c o o r d i n a t e s   a r e   r e l a t i v e   t o   t h e   b o u n d  s   o r i g i n   o f   t h e   m a r k u p� ��� l  9 9�k���k  � a [ annotation) to page space (where the origin lies at the lower-left corner of the PDF page)   � ��� �   a n n o t a t i o n )   t o   p a g e   s p a c e   ( w h e r e   t h e   o r i g i n   l i e s   a t   t h e   l o w e r - l e f t   c o r n e r   o f   t h e   P D F   p a g e )� ��� l  9 9�j���j  � d ^ NOTE: w/o the adjustment of values, the rectangle would be too small to match underlying text   � ��� �   N O T E :   w / o   t h e   a d j u s t m e n t   o f   v a l u e s ,   t h e   r e c t a n g l e   w o u l d   b e   t o o   s m a l l   t o   m a t c h   u n d e r l y i n g   t e x t� ��� r   9 K��� \   9 G��� [   9 A��� l  9 <��i�h� n   9 <��� o   : <�g�g 0 x  � o   9 :�f�f 0 topleftpoint topLeftPoint�i  �h  � l  < @��e�d� n   < @��� 4  = @�c�
�c 
cobj� m   > ?�b�b � o   < =�a�a 0 	theorigin 	theOrigin�e  �d  � o   A F�`�` ,0 linewidthenlargement lineWidthEnlargement� n      ��� o   H J�_�_ 0 x  � o   G H�^�^ 0 topleftpoint topLeftPoint� ��� r   L ^��� [   L Z��� [   L T��� l  L O��]�\� n   L O��� o   M O�[�[ 0 y  � o   L M�Z�Z 0 topleftpoint topLeftPoint�]  �\  � l  O S��Y�X� n   O S��� 4  P S�W�
�W 
cobj� m   Q R�V�V � o   O P�U�U 0 	theorigin 	theOrigin�Y  �X  � o   T Y�T�T .0 lineheightenlargement lineHeightEnlargement� n      ��� o   [ ]�S�S 0 y  � o   Z [�R�R 0 topleftpoint topLeftPoint� ��� l  _ _�Q�P�O�Q  �P  �O  � ��� r   _ q��� [   _ m��� [   _ g��� l  _ b��N�M� n   _ b��� o   ` b�L�L 0 x  � o   _ `�K�K $0 bottomrightpoint bottomRightPoint�N  �M  � l  b f��J�I� n   b f��� 4  c f�H�
�H 
cobj� m   d e�G�G � o   b c�F�F 0 	theorigin 	theOrigin�J  �I  � o   g l�E�E ,0 linewidthenlargement lineWidthEnlargement� n      ��� o   n p�D�D 0 x  � o   m n�C�C $0 bottomrightpoint bottomRightPoint� ��� r   r ���� \   r ���� [   r z��� l  r u��B�A� n   r u��� o   s u�@�@ 0 y  � o   r s�?�? $0 bottomrightpoint bottomRightPoint�B  �A  � l  u y��>�=� n   u y��� 4  v y�<�
�< 
cobj� m   w x�;�; � o   u v�:�: 0 	theorigin 	theOrigin�>  �=  � o   z �9�9 .0 lineheightenlargement lineHeightEnlargement� n      ��� o   � ��8�8 0 y  � o   � ��7�7 $0 bottomrightpoint bottomRightPoint� ��� l  � ��6�5�4�6  �5  �4  � ��� l  � ��3���3  � k e create a bounds rectangle (specified by origin {x,y} & size {width,height}) for this annotation line   � ��� �   c r e a t e   a   b o u n d s   r e c t a n g l e   ( s p e c i f i e d   b y   o r i g i n   { x , y }   &   s i z e   { w i d t h , h e i g h t } )   f o r   t h i s   a n n o t a t i o n   l i n e� ��� r   � ���� n  � �� � I   � ��2�1�2 0 
makensrect 
makeNSRect �0 J   � �  J   � �  n   � �	
	 o   � ��/�/ 0 x  
 o   � ��.�. 0 topleftpoint topLeftPoint �- n   � � o   � ��,�, 0 y   o   � ��+�+ 0 topleftpoint topLeftPoint�-   �* J   � �  n   � � o   � ��)�) 0 x   o   � ��(�( $0 bottomrightpoint bottomRightPoint �' n   � � o   � ��&�& 0 y   o   � ��%�% $0 bottomrightpoint bottomRightPoint�'  �*  �0  �1     f   � �� o      �$�$ 0 
linebounds 
lineBounds�  s   � � o   � ��#�# 0 
linebounds 
lineBounds n        ;   � � o   � ��"�" 0 boundsbyline boundsByLine  l  � ��!� ��!  �   �   � r   � � !  [   � �"#" o   � ��� 0 	quadcount 	quadCount# m   � ��� ! o      �� 0 	quadcount 	quadCount�   o    �� 0 maxquadcount maxQuadCount} $%$ l  � �����  �  �  % &�& L   � �'' o   � ��� 0 boundsbyline boundsByLine�  M ()( l     ����  �  �  ) *+* l     ����  �  �  + ,-, l     �./�  . f ` Takes a a rectangle specified via its top left & bottom right points (given as a list of lists:   / �00 �   T a k e s   a   a   r e c t a n g l e   s p e c i f i e d   v i a   i t s   t o p   l e f t   &   b o t t o m   r i g h t   p o i n t s   ( g i v e n   a s   a   l i s t   o f   l i s t s :- 121 l     �34�  3 b \ {{topLeftX, topLeftY}, {bottomRightX, bottomRightY}}) and converts it to a bounds rectangle   4 �55 �   { { t o p L e f t X ,   t o p L e f t Y } ,   { b o t t o m R i g h t X ,   b o t t o m R i g h t Y } } )   a n d   c o n v e r t s   i t   t o   a   b o u n d s   r e c t a n g l e2 676 l     �89�  8 Z T given as a record with `origin` & `size` properties each containing again a record:   9 �:: �   g i v e n   a s   a   r e c o r d   w i t h   ` o r i g i n `   &   ` s i z e `   p r o p e r t i e s   e a c h   c o n t a i n i n g   a g a i n   a   r e c o r d :7 ;<; l     �=>�  = m g {origin:{x:topLeftX, y:topLeftY}, |size|:{width:bottomRightX-topLeftX, height:bottomRightY-topLeftY}}    > �?? �   { o r i g i n : { x : t o p L e f t X ,   y : t o p L e f t Y } ,   | s i z e | : { w i d t h : b o t t o m R i g h t X - t o p L e f t X ,   h e i g h t : b o t t o m R i g h t Y - t o p L e f t Y } }  < @A@ l     �
BC�
  B ` Z Credits: by Takaaki Naganoya, Piyomaru Software (see http://piyocast.com/as/archives/643)   C �DD �   C r e d i t s :   b y   T a k a a k i   N a g a n o y a ,   P i y o m a r u   S o f t w a r e   ( s e e   h t t p : / / p i y o c a s t . c o m / a s / a r c h i v e s / 6 4 3 )A EFE i  ~�GHG I      �	I��	 0 
makensrect 
makeNSRectI J�J c      KLK o      �� 0 alist aListL m      �
� 
list�  �  H Q     ]MNOM k    SPP QRQ s    1STS o    �� 0 alist aListT J      UU VWV J      XX YZY o      �� 0 x1  Z [�[ o      �� 0 y1  �  W \� \ J      ]] ^_^ o      ���� 0 x2  _ `��` o      ���� 0 y2  ��  �   R aba r   2 7cdc l  2 5e����e \   2 5fgf o   2 3���� 0 x2  g o   3 4���� 0 x1  ��  ��  d o      ���� 0 xwidth xWidthb hih l  8 =jklj r   8 =mnm l  8 ;o����o \   8 ;pqp o   8 9���� 0 y2  q o   9 :���� 0 y1  ��  ��  n o      ���� 0 yheight yHeightk J D TODO: doesn't this create a negative height? use `y1 - y2` instead?   l �rr �   T O D O :   d o e s n ' t   t h i s   c r e a t e   a   n e g a t i v e   h e i g h t ?   u s e   ` y 1   -   y 2 `   i n s t e a d ?i sts r   > Puvu K   > Nww ��xy�� 
0 origin  x K   ? Ezz ��{|�� 0 x  { o   @ A���� 0 x1  | ��}���� 0 y  } o   B C���� 0 y1  ��  y ��~���� 0 size  ~ K   F L ������ 	0 width  � o   G H���� 0 xwidth xWidth� ������� 
0 height  � o   I J���� 0 yheight yHeight��  ��  v o      ���� 0 a1rect a1Rectt ���� L   Q S�� o   Q R���� 0 a1rect a1Rect��  N R      ������
�� .ascrerr ****      � ****��  ��  O L   [ ]�� m   [ \��
�� 
msngF ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � f ` This method serves as a hook which gets called for every annotation with an annotation comment.   � ��� �   T h i s   m e t h o d   s e r v e s   a s   a   h o o k   w h i c h   g e t s   c a l l e d   f o r   e v e r y   a n n o t a t i o n   w i t h   a n   a n n o t a t i o n   c o m m e n t .� ��� l     ������  � h b It can be used to transform the given annotation comment (which may contain custom markup syntax)   � ��� �   I t   c a n   b e   u s e d   t o   t r a n s f o r m   t h e   g i v e n   a n n o t a t i o n   c o m m e n t   ( w h i c h   m a y   c o n t a i n   c u s t o m   m a r k u p   s y n t a x )� ��� l     ������  � E ? into a Keypoints-style format that's supported by this script.   � ��� ~   i n t o   a   K e y p o i n t s - s t y l e   f o r m a t   t h a t ' s   s u p p o r t e d   b y   t h i s   s c r i p t .� ��� i  ����� I      ������� :0 preprocessannotationcomment preprocessAnnotationComment� ���� o      ���� 0 acomment aComment��  ��  � k     r�� ��� l    ���� L     �� o     ���� 0 acomment aComment� ] W comment out this line (i.e., prefix it with "--") if you want to use custom code below   � ��� �   c o m m e n t   o u t   t h i s   l i n e   ( i . e . ,   p r e f i x   i t   w i t h   " - - " )   i f   y o u   w a n t   t o   u s e   c u s t o m   c o d e   b e l o w� ��� l   ��������  ��  ��  � ��� l   ������  � b \ NOTE: below code is just an example that shows how you could transform the given annotation   � ��� �   N O T E :   b e l o w   c o d e   i s   j u s t   a n   e x a m p l e   t h a t   s h o w s   h o w   y o u   c o u l d   t r a n s f o r m   t h e   g i v e n   a n n o t a t i o n� ��� l   ������  � [ U           comment so that it matches the Keypoints-style format used by this script.   � ��� �                       c o m m e n t   s o   t h a t   i t   m a t c h e s   t h e   K e y p o i n t s - s t y l e   f o r m a t   u s e d   b y   t h i s   s c r i p t .� ��� l   ��������  ��  ��  � ��� l   ������  �   convert tags   � ���    c o n v e r t   t a g s� ��� l   ������  � e _ - input: an annotation comment containing a separate line that starts with �Tags:� followed by   � ��� �   -   i n p u t :   a n   a n n o t a t i o n   c o m m e n t   c o n t a i n i n g   a   s e p a r a t e   l i n e   t h a t   s t a r t s   w i t h    T a g s :    f o l l o w e d   b y� ��� l   ������  � l f             comma-separated values that represent the tags, e.g.: "Tags: some tag, another tag, test"   � ��� �                           c o m m a - s e p a r a t e d   v a l u e s   t h a t   r e p r e s e n t   t h e   t a g s ,   e . g . :   " T a g s :   s o m e   t a g ,   a n o t h e r   t a g ,   t e s t "� ��� l   ������  � \ V - output: an annotation comment containing a Keypoints-style metadata line with tags,   � ��� �   -   o u t p u t :   a n   a n n o t a t i o n   c o m m e n t   c o n t a i n i n g   a   K e y p o i n t s - s t y l e   m e t a d a t a   l i n e   w i t h   t a g s ,� ��� l   ������  � 9 3             e.g.: "< @some tag @another tag @test"   � ��� f                           e . g . :   " <   @ s o m e   t a g   @ a n o t h e r   t a g   @ t e s t "� ��� r    ��� J    ����  � o      ���� $0 transformedlines transformedLines� ��� r    ��� m    	�� ��� * ( ? < = ^ | [ \ r \ n ] ) T a g s : \ s *� o      ���� 0 tagslineregex tagsLineRegex� ��� r    ��� m    �� ��� 4 ( ? < = ^ < | [ \ r \ n ] < ) \ s + | \ s * , \ s *� o      ���� &0 tagdelimiterregex tagDelimiterRegex� ��� l   ����  �  �  � ��� X    _���� k   " Z�� ��� Z   " S����� >  " /��� l  " -���� n  " -��� I   ' -���� 0 
regexmatch 
regexMatch� ��� o   ' (�� 0 aline aLine� ��� o   ( )�� 0 tagslineregex tagsLineRegex�  �  � o   " '�� 0 keypointslib KeypointsLib�  �  � m   - .�� ���  � k   2 O�� ��� r   2 @��� n  2 >��� I   7 >���� 0 regexreplace regexReplace� ��� o   7 8�� 0 aline aLine� ��� o   8 9�� 0 tagslineregex tagsLineRegex�  �  m   9 : �  <  �  �  � o   2 7�� 0 keypointslib KeypointsLib� o      �� 0 aline aLine� � r   A O n  A M I   F M��� 0 regexreplace regexReplace 	
	 o   F G�� 0 aline aLine
  o   G H�� &0 tagdelimiterregex tagDelimiterRegex � m   H I �    @�  �   o   A F�� 0 keypointslib KeypointsLib o      �� 0 aline aLine�  �  �  � � s   T Z c   T W o   T U�� 0 aline aLine m   U V�
� 
ctxt n        ;   X Y o   W X�� $0 transformedlines transformedLines�  � 0 aline aLine� n     2   �
� 
cpar o    �� 0 acomment aComment�  l  ` `����  �  �    r   ` o b   ` m  n  ` k!"! I   e k�#��  0 mergetextitems mergeTextItems# $%$ o   e f�� $0 transformedlines transformedLines% &�& 1   f g�
� 
lnfd�  �  " o   ` e�� 0 keypointslib KeypointsLib  1   k l�
� 
lnfd o      �� &0 transformedstring transformedString '(' l  p p����  �  �  ( )�) L   p r** o   p q�� &0 transformedstring transformedString�  � +�+ l     ����  �  �  �       G�,gs-./0123����������~�}�|�{�z�y�x�wQU456789:;<=>�v�u�t�s�r?@ABCDEFGHIJKLMNOPQRSTU�  , E�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�2�1�0�/�.�-�q ,0 notefoldernameprefix noteFolderNamePrefix�p ,0 notefoldernamesuffix noteFolderNameSuffix�o 
0 label1  �n 
0 label2  �m 
0 label3  �l 
0 label4  �k 
0 label5  �j 
0 label6  �i 
0 label7  �h *0 updateexistingnotes updateExistingNotes�g 80 updatenameforexistingnotes updateNameForExistingNotes�f F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes�e P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes�d J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes�c <0 updateratingforexistingnotes updateRatingForExistingNotes�b :0 updatelabelforexistingnotes updateLabelForExistingNotes�a 80 updatetagsforexistingnotes updateTagsForExistingNotes�` L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes�_ P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders�^ ,0 selectupdatedrecords selectUpdatedRecords�] $0 fetchdoimetadata fetchDOIMetadata�\ 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata�[ 0 fetchbibtex fetchBibTeX�Z :0 appendbibtextofindercomment appendBibTeXToFinderComment�Y 00 fetchformattedcitation fetchFormattedCitation�X P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment�W &0 citationstylename citationStyleName�V  0 citationlocale citationLocale�U ,0 linewidthenlargement lineWidthEnlargement�T .0 lineheightenlargement lineHeightEnlargement�S "0 redcolormapping redColorMapping�R (0 orangecolormapping orangeColorMapping�Q (0 yellowcolormapping yellowColorMapping�P &0 greencolormapping greenColorMapping�O $0 cyancolormapping cyanColorMapping�N .0 lightbluecolormapping lightBlueColorMapping�M ,0 darkbluecolormapping darkBlueColorMapping�L (0 purplecolormapping purpleColorMapping�K $0 pinkcolormapping pinkColorMapping�J 0 colormappings colorMappings�I 0 labelmappings labelMappings�H <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts�G  0 maxtextcolumns maxTextColumns�F 0 
pagemargin 
pageMargin�E &0 creatednotescount createdNotesCount�D &0 updatednotescount updatedNotesCount
�C 
pimr�B 0 keypointslib KeypointsLib
�A .aevtoappnull  �   � ****�@ $0 checkappsrunning checkAppsRunning�? T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�> :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�= &0 pdfannotationinfo pdfAnnotationInfo�< H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�; B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�:  0 createdtrecord createDTRecord�9 00 setmetadatafordtfolder setMetadataForDTFolder�8 00 setmetadatafordtrecord setMetadataForDTRecord�7 60 updatemetadatafordtrecord updateMetadataForDTRecord�6 F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�5 60 appendtocommentofdtfolder appendToCommentOfDTFolder�4 &0 bibmetadatafordoi bibMetadataForDOI�3 00 labelindexforcolorname labelIndexForColorName�2 "0 colornameforhue colorNameForHue�1  0 annotationtext annotationText�0 (0 colorforannotation colorForAnnotation�/ 00 annotationboundsbyline annotationBoundsByLine�. 0 
makensrect 
makeNSRect�- :0 preprocessannotationcomment preprocessAnnotationComment- �,�+V�, 0 
labelindex 
labelIndex�+ V �*��)�* 0 	colorname 	colorName�)  . �(�'W�( 0 
labelindex 
labelIndex�' W �&��%�& 0 	colorname 	colorName�%  / �$�#X�$ 0 
labelindex 
labelIndex�# X �"��!�" 0 	colorname 	colorName�!  0 � �Y�  0 
labelindex 
labelIndex� Y ���� 0 	colorname 	colorName�  1 ��Z� 0 
labelindex 
labelIndex� Z ���� 0 	colorname 	colorName�  2 ��[� 0 
labelindex 
labelIndex� [ ���� 0 	colorname 	colorName�  3 ��\� 0 
labelindex 
labelIndex� \ ���� 0 	colorname 	colorName�  
� boovfals
� boovfals
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
� boovtrue
�~ boovtrue
�} boovtrue
�| boovtrue
�{ boovfals
�z boovfals
�y boovfals
�x boovtrue
�w boovtrue4 �h]� 0 	colorname 	colorName] ��^� 0 lowerhuelimit lowerHueLimit�^^ ���� 0 upperhuelimit upperHueLimit� �  5 �
s_�
 0 	colorname 	colorName_ �	�`�	 0 lowerhuelimit lowerHueLimit� ` ���� 0 upperhuelimit upperHueLimit� ,�  6 �~a� 0 	colorname 	colorNamea ��b� 0 lowerhuelimit lowerHueLimit� -b �� ��� 0 upperhuelimit upperHueLimit�  A��  7 ���c�� 0 	colorname 	colorNamec ����d�� 0 lowerhuelimit lowerHueLimit�� Bd �������� 0 upperhuelimit upperHueLimit�� ���  8 ���e�� 0 	colorname 	colorNamee ����f�� 0 lowerhuelimit lowerHueLimit�� �f �������� 0 upperhuelimit upperHueLimit�� ���  9 ���g�� 0 	colorname 	colorNameg ����h�� 0 lowerhuelimit lowerHueLimit�� �h �������� 0 upperhuelimit upperHueLimit�� ���  : ���i�� 0 	colorname 	colorNamei ����j�� 0 lowerhuelimit lowerHueLimit�� �j �������� 0 upperhuelimit upperHueLimit�� ���  ; ���k�� 0 	colorname 	colorNamek ����l�� 0 lowerhuelimit lowerHueLimit�� �l �������� 0 upperhuelimit upperHueLimit��D��  < ���m�� 0 	colorname 	colorNamem ����n�� 0 lowerhuelimit lowerHueLimit��En �������� 0 upperhuelimit upperHueLimit��]��  = ��o�� 	o 	 456789:;<> ��p�� p  -./0123
�v boovtrue�u �t �s  �r  ? ��q�� q  rstur ��v��
�� 
cobjv ww   ��}
�� 
scpt��  s ��x��
�� 
cobjx yy   ���
�� 
frmk��  t ��z��
�� 
cobjz {{   ���
�� 
frmk��  u ��|��
�� 
cobj| }}   ��
�� 
osax��  @ ~~   ��}
�� 
scptA ����������
�� .aevtoappnull  �   � ****��  ��   ���� 0 i  � *�������������������������=���t�]�_a�f��n�q���� $0 checkappsrunning checkAppsRunning�� 0 setupprogress setupProgress�� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�� 0 
pdfrecords 
pdfRecords
�� .corecnte****       ****�� 0 pdfcount pdfCount� 40 settotalstepsforprogress setTotalStepsForProgress
� 
cobj� 0 	pdfrecord 	pdfRecord
� 
capp
� kfrmID  
� 
DTfn� 0 pdffilename pdfFilename�  0 updateprogress updateProgress� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�  0 updatedrecords updatedRecords
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
� .sysodlogaskr        TEXT��")j+   hY hOb  /�k+ O)j+ E�OjEc  ,OjEc  -O�j E�Ob  /�k+ O Lk�kh  ��/E�O)���0 ��,E�UOb  /��%a %�%a %�%a %l+ O)�k+ E` [OY��Ob  e 	 _ jva & &)�a �0 *a k/E` O_ _ a ,FUY hO)�a �0 G*j Oa �%_ %a %b  ,%_ %a  %b  -%a !a "a #la $a %kva &a 'a ( )UB �������� $0 checkappsrunning checkAppsRunning�  �  �  � �������������
� 
capp
� kfrmID  
� 
prcs�  
� 
fcrt
� .corecnte****       ****� � � 0 displayerror displayError� 6)���0 +*�-�[�,\Z�81j k b  /���e�+ OfY hUOeC �������� T0 (selecteddevonthinkpdfswithpdfannotations (selectedDEVONthinkPDFsWithPDFAnnotations�  �  � ���� 0 annotatedpdfs annotatedPDFs� 0 
therecords 
theRecords� 0 	therecord 	theRecord� ���������������������
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
�� 
DTty
�� OCRdpdf 
�� 
DTna
�� 
bool�� �� �� 0 displayerror displayError� bjvE�O)���0 R*�,�&E�O .�[��l kh ��,� 	 	��,j�& 	��6GY h[OY��O�jv  b  /���e�+ Y hUO�D ��F���������� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�� ����� �  ���� 0 	pdfrecord 	pdfRecord��  � .��������~�}�|�{�z�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�� 0 	pdfrecord 	pdfRecord�� 0 pdfpath pdfPath�� 
0 pdfurl  � "0 pdflocationpath pdfLocationPath�~ 0 pdfmetadata pdfMetadata�}  0 notefoldername noteFolderName�| (0 folderlocationpath folderLocationPath�{  0 folderdidexist folderDidExist�z  0 folderlocation folderLocation�y 0 	folderurl 	folderURL�x  0 foldermetadata folderMetadata�w 0 	sourcedoi 	sourceDOI�v 0 sourcecitekey sourceCitekey�u 0 metadatadoi metadataDOI�t "0 metadatacitekey metadataCitekey�s (0 pdfannotationslist pdfAnnotationsList�r 0 bibmetadata bibMetadata�q &0 formattedcitation formattedCitation�p 0 
bibtexdata 
bibTeXData�o  0 updatedrecords updatedRecords�n 0 pdfannotation pdfAnnotation�m 0 acomment aComment�l 0 	annottext 	annotText�k 0 
apagelabel 
aPageLabel�j  0 recordcontents recordContents�i 0 
recordname 
recordName�h 00 recordmodificationdate recordModificationDate�g (0 recordcreationdate recordCreationDate�f 0 recordaliases recordAliases�e 0 	recordurl 	recordURL�d 0 	annottype 	annotType�c "0 annotsortstring annotSortString�b  0 recordmetadata recordMetadata�a 0 	ausername 	aUserName�` 0 citekey  �_ $0 customattributes customAttributes�^ 0 
recordtags 
recordTags�] "0 customattribute customAttribute�\ 0 akey aKey�[ 0 avalue aValue�Z 0 existingvalue existingValue�Y 0 	isflagged 	isFlagged�X 0 recordrating recordRating�W $0 recordlabelindex recordLabelIndex�V 0 dtrecord dtRecord�U $0 recordwasupdated recordWasUpdated� T�T��S�R�Q�P�O�N�M�L�K��J�I��H����G�F�E%�D�C�B�A�@�?{���>���=�<�;�:	�9	�8�7�6�5�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$
	�#
 �"
Q
e
��!� �
���������
�T 
capp
�S kfrmID  
�R 
ppth
�Q 
rURL
�P 
DTlo
�O 
DTcm
�N 
msng�M  �L  
�K 
pnam
�J .DTpacd53bool       utxt
�I .DTpacd52DTrc       utxt
�H 
pURL�G .0 valueforkey_inrecord_ valueForKey_inRecord_
�F 
bool�E 0 matchdoi matchDOI�D �C &0 pdfannotationinfo pdfAnnotationInfo
�B 
cobj�A 0 doi  �@ 0 pdfannotations  �? 00 setmetadatafordtrecord setMetadataForDTRecord�> &0 bibmetadatafordoi bibMetadataForDOI�= 0 
sourcefile 
sourceFile�< 0 citekey  �; �: 00 setmetadatafordtfolder setMetadataForDTFolder�9 60 appendtocommentofdtfolder appendToCommentOfDTFolder
�8 
kocl
�7 .corecnte****       ****�6 0 comment  
�5 misccura�4 0 nsnull NSNull�3 0 null  
�2 
TEXT�1 :0 preprocessannotationcomment preprocessAnnotationComment�0 0 	annottext 	annotText�/ 0 	pagelabel 	pageLabel�. H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�- B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�, 0 modifieddate modifiedDate
�+ 
ldt �* (0 keypointsidfordate keypointsIDForDate�) 0 deeplink deepLink�( 0 	annottype 	annotType�' 0 
sortstring 
sortString�&  0 annotationtype annotationType�% "0 annotationorder annotationOrder�$ 0 username userName�# 0 	createdby 	createdBy�" 0 
sourcepage 
sourcePage�! T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote�  0 	attribkey 	attribKey� 0 attribvalue attribValue� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_� :0 recordfromlabels_andvalues_ recordFromLabels_andValues_� @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged� 60 keypointsnoteratingnumber keypointsNoteRatingNumber�  0 annotcolorname annotColorName� 00 labelindexforcolorname labelIndexForColorName� �  0 createdtrecord createDTRecord���)���0 ���,E�O��,E�O��,E�O��,E�O ��  	jvE�Y hW X  	jvE�Ob   ��,%b  %E�O��%�%E�O�j E�O�j E�O��,E�O��%��,FO��,E�O ��  	jvE�Y hW X  	jvE�UOa E�Oa E�O�jv ab  /a �l+ E�O��	 �a a & b  /�k+ E�Y hOb  /a �l+ E�O��	 �a a & �E�Y hY hO)����a + E[a k/E�Z[a l/E�ZO�a �a �a %E�O)��l+ OjvE^ Oa E^ Oa  E^ O�f 
 b  e a & �b  e 	 	��a &	 �a !a & E)��l+ "E^ O] jv ,b  /a #] l+ E^ Ob  /a $] l+ E^ Y hY hO�a %�a &�a �a '%E�O�] %E�O)��l+ (Y hO�f  hb  e 	 ] �a &	 ] a )a & )�] l+ *Y hOb  e 	 ] �a &	 ] a +a & )�] l+ *Y hY hOjvE^ Ok�[a ,a l -kh ] a .,E^ O] a /a 0,a 1,  
�E^ Y hO] � )] a 2&k+ 3E^ Y hO] a 4,E^ O] a /a 0,a 1,  
�E^ Y hO] � ] a 2&E^ Y hO] a 5,E^ O)] ] l+ 6E^ O)] ] ] m+ 7E^ O] a 8,a 9&E^ O] � ] E^ Ob  /] k+ :E^ Y hO] a ;,a 2&E^ O] a <,a 2&E^ O] a =,a 2&E^ O] a �a >] a ?] a '%E^  O] a @,E^ !O] !�	 ] !a Aa & ]  a B] !a 2&l%E^  Y hO] �	 ] a Ca & ]  a D] a 2&l%E^  Y hO�� ]  a %�l%E^  Y hO] a &,E^ "O] "�	 ] "a Ea & ]  a &] "l%E^  Y hO��	 �a Fa & ]  a �l%E^  Y hOb  /] a Gkvl+ HE[a k/E^ #Z[a l/E^ $ZO �] #[a ,a l -kh %] %a I,E^ &O] %a J,E^ 'Ob  /] &]  l+ E^ (O] (� #b  /] (a K%] '%] &]  m+ LE^  Y ]  b  /] &kv] 'kvl+ M%E^  [OY��Ob  /] k+ NE^ )Ob  /] k+ OE^ *O)] a P,k+ QE^ +O)��] ] ] ] $] )] ] ] ]  ] *] +a R+ SE[a k/E^ ,Z[a l/E^ -ZO] -e  ] ,] 6GY h[OY��O] E �������� &0 pdfannotationinfo pdfAnnotationInfo� ��� �  ����� 0 pdfpath pdfPath� 
0 pdfurl  � 0 	sourcedoi 	sourceDOI� 0 sourcecitekey sourceCitekey�  � "����
�	��������� ����������������������������������������� 0 pdfpath pdfPath� 
0 pdfurl  � 0 	sourcedoi 	sourceDOI�
 0 sourcecitekey sourceCitekey�	 0 pdfdoc pdfDoc� 0 pdfdoi pdfDOI� *0 pdfannotationsarray pdfAnnotationsArray� 0 columnid columnID� 0 i  � 0 pdfpage pdfPage� 0 	pagewidth 	pageWidth� 0 
pageheight 
pageHeight� 0 columnwidth columnWidth�  0 	pagelabel 	pageLabel�� 0 pdfannotations  �� 0 pdfannotation pdfAnnotation�� 0 	annottype 	annotType�� 0 
markuptype 
markupType�� 0 
annotcolor 
annotColor��  0 annotcolorname annotColorName�� 0 annotusername annotUserName�� 0 annotmoddate annotModDate�� 0 annotbounds annotBounds�� 0 annotoriginx annotOriginX�� 0 annotoriginy annotOriginY�� 0 
annotwidth 
annotWidth�� 0 annotheight annotHeight�� .0 annottopmarginfromtop annotTopMarginFromTop�� 0 
sortstring 
sortString�� 0 
quadpoints 
quadPoints�� 0 boundsbyline boundsByLine�� 0 	annottext 	annotText�� 0 annotcomment annotComment�� 0 annoturl annotURL� I����������������������������������������048<@C��PTW�����������������������!��������?��ehk��q����������������������
�� misccura�� 0 pdfdocument PDFDocument�� 	0 alloc  �� 	0 NSURL  �� $0 fileurlwithpath_ fileURLWithPath_�� 0 initwithurl_ initWithURL_�� 0 
doifrompdf 
doiFromPDF��  0 nsmutablearray NSMutableArray�� 0 new  �� 0 	pageCount  �� 0 pageatindex_ pageAtIndex_�� 00 kpdfdisplayboxmediabox kPDFDisplayBoxMediaBox�� 0 boundsforbox_ boundsForBox_
�� 
cobj�� 	0 label  �� 0 annotations  
�� 
kocl
�� .corecnte****       ****�� 0 type  �� �� 0 
markuptype 
markupType
�� 
msng�� (0 colorforannotation colorForAnnotation�� 0 username userName�� $0 modificationdate modificationDate�� 
0 bounds  
�� 
dire
�� olierndD
�� .sysorondlong        doub
�� olierndS�� �� *0 quadrilateralpoints quadrilateralPoints�� 00 annotationboundsbyline annotationBoundsByLine��  0 annotationtext annotationText�� 0 contents  
�� 
long�� 0 citekey  �� 0 page  �� 0 	pagelabel 	pageLabel�� 0 	annottype 	annotType�� 0 
annotcolor 
annotColor��  0 annotcolorname annotColorName�� 0 modifieddate modifiedDate�� 0 	annottext 	annotText� 0 comment  � 0 deeplink deepLink� 0 
sortstring 
sortString� � 0 
addobject_ 
addObject_
� 
list����,j+ ��,�k+ k+ E�O��  !b  /��em+ E�O�� �E�Y hY hO��,j+ 
E�OkE�O\j�j+ kkh ��k+ E�O���,k+ �l/E[�k/E�Z[�l/E�ZO�lb  + b  *!E�O�j+ E�O�j+ E�O�[a �l kh �j+ E^ Oa a a a a a a v] �a a a mv]  �j+ E^ Y 	a  E^ O*�k+ !E[�k/E^ Z[�l/E^ ZO�j+ "E^ O�j+ #E^ O�j+ $E^ O] �k/E[�k/E^ Z[�l/E^ ZO] �l/E[�k/E^ Z[�l/E^ ZO�] ] E^ Ob  )e  k� ] �!a %a &l 'UE�Y hOa (�k%a )%�%a *%� ] a %a +l 'U%E^ Oa ,a -a .a /a 0v]  ,�j+ 1E^ O)] ] l+ 2E^ O)�] l+ 3E^ Y 	a 4E^ O�j+ 5E^  O�a 6%�%a 7%] %a 8%] a 9&%a :%] a 9&%E^ !O�a ;�a <�a =�a >] a ] a ?] a @] a "] a A] a B] a C]  a D] !a E] a Fk+ GY h[OY�[OY��O�a H&�lvF �������� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� ��� �  ��� 0 	annottext 	annotText� 0 annotcomment annotComment�  � �������� 0 	annottext 	annotText� 0 annotcomment annotComment� (0 recordcontentparts recordContentParts� $0 processedcomment processedComment� 00 firstlevelheadingregex firstLevelHeadingRegex� &0 firstlevelheading firstLevelHeading�  0 recordcontents recordContents� ���������58���g
� 
msng
� 
bool
� 
TEXT� 0 
regexmatch 
regexMatch� 0 regexreplace regexReplace� F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines
� 
lnfd�  0 mergetextitems mergeTextItems� �jvE�O��	 ���& ��&%�6GY hO��	 ���& \�E�O�E�Ob  /��l+ E�O�� )b  /���m+ 
E�O��5GOb  /���%�m+ 
E�Y hOb  /�fl+ E�O��6GY hO�jv b  /���%l+ E�Y a E�O�G �~������ B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData� ��� �  ���� 0 	annottext 	annotText� 0 annotcomment annotComment� 0 	pagelabel 	pageLabel�  � �������� 0 	annottext 	annotText� 0 annotcomment annotComment� 0 	pagelabel 	pageLabel� "0 recordnameparts recordNameParts�  0 recordnamepart recordNamePart� $0 markdownheadings markdownHeadings� 0 
recordname 
recordName� ���������������$&04M�Q
� 
msng
� 
bool
� 
TEXT� 40 markdownheadingsfromtext markdownHeadingsFromText
� 
cobj� 0 heading  � F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines� � (0 firstwordsfromtext firstWordsFromText�  0 mergetextitems mergeTextItems� �jvE�O��	 ���& ��&%�6GY hO�E�O��	 ���& Lb  /��l+ E�O�jv ��k/�,E�Y hO��   b  /�el+ E�Ob  /��l+ E�Y hY hO��  *b  /��l+ E�O�a  a �%a %E�Y hY hO�a   
a E�Y hO��6GO�jv b  /�a l+ E�Y a E�O�H ��������  0 createdtrecord createDTRecord� ��� �  ��������~�}�|�{�z�y�  0 folderlocation folderLocation�  0 foldermetadata folderMetadata� 0 
recordname 
recordName� 0 recordaliases recordAliases� 0 	recordurl 	recordURL� 0 
recordtags 
recordTags� 0 	isflagged 	isFlagged�~ 0 
recordtext 
recordText�} (0 recordcreationdate recordCreationDate�| 00 recordmodificationdate recordModificationDate�{  0 recordmetadata recordMetadata�z 0 recordrating recordRating�y $0 recordlabelindex recordLabelIndex�  � �x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�x  0 folderlocation folderLocation�w  0 foldermetadata folderMetadata�v 0 
recordname 
recordName�u 0 recordaliases recordAliases�t 0 	recordurl 	recordURL�s 0 
recordtags 
recordTags�r 0 	isflagged 	isFlagged�q 0 
recordtext 
recordText�p (0 recordcreationdate recordCreationDate�o 00 recordmodificationdate recordModificationDate�n  0 recordmetadata recordMetadata�m 0 recordrating recordRating�l $0 recordlabelindex recordLabelIndex�k 0 newrecorddata newRecordData�j 0 arecord aRecord�i 0 didcreatenote didCreateNote�h 0 didupdatenote didUpdateNote�g $0 isexistingrecord isExistingRecord�f "0 existingrecords existingRecords�e  0 targetlocation targetLocation�d  0 existingrecord existingRecord�c (0 existingrecordtags existingRecordTags�b 0 atag aTag�  �at�`�_�^�]�\�[�Z�Y��X��W �V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G
�a 
capp
�` kfrmID  
�_ 
DTty
�^ Ctypmkdn
�] 
DTcn
�\ 
pnam�[ 
�Z 
msng
�Y 
DTcr
�X 
pURL
�W 
DTal
�V .DTpacd49list       utxt
�U 
DTlo
�T 
kocl
�S 
cobj
�R .corecnte****       ****
�Q 
bool
�P 
DTin
�O .DTpacd08DTrc       reco
�N 
DTco
�M 
DTpl
�L 
DTmo
�K 
DTst
�J 
DTrt
�I 
DTla
�H 
tags�G 60 updatemetadatafordtrecord updateMetadataForDTRecord� )���0�����E�O�� ��l%E�Y hO�� ��l%E�Y hO�� ���l%E�Y hO�E�OfE�OfE^ OfE^ O�� p�j E^ O] jv Y�a ,��,%a %E^ O A] [a a l kh �� 	 ] a ,]  a & ] E�OeE^ Y h[OY��Y hY hO��  4�a �l E�O��%E�O�a ,�a ,FOeE�Ob  ,kEc  ,Y hO] f 
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
eE^ Y hY hO] e 	 	�f a & b  -kEc  -Y hY hO�] lvUI �F��E�D���C�F 00 setmetadatafordtfolder setMetadataForDTFolder�E �B��B �  �A�@�A  0 folderlocation folderLocation�@  0 foldermetadata folderMetadata�D  � �?�>�?  0 folderlocation folderLocation�>  0 foldermetadata folderMetadata� �=�<�;��:�9
�= 
msng
�< 
bool
�; 
capp
�: kfrmID  
�9 
DTcm�C 6b  e 	 ���&	 ���&	 �jv�& )���0 ���,FUY hJ �8��7�6���5�8 00 setmetadatafordtrecord setMetadataForDTRecord�7 �4��4 �  �3�2�3 0 arecord aRecord�2  0 recordmetadata recordMetadata�6  � �1�0�1 0 arecord aRecord�0  0 recordmetadata recordMetadata� �/�.�-��,�+
�/ 
msng
�. 
bool
�- 
capp
�, kfrmID  
�+ 
DTcm�5 *��	 ���&	 �jv�& )���0 ���,FUY hK �*��)�(���'�* 60 updatemetadatafordtrecord updateMetadataForDTRecord�) �&��& �  �%�$�% 0 arecord aRecord�$  0 recordmetadata recordMetadata�(  � 
�#�"�!� �������# 0 arecord aRecord�"  0 recordmetadata recordMetadata�! 0 didupdatenote didUpdateNote�  00 existingrecordmetadata existingRecordMetadata� 0 existingkeys existingKeys� 0 thekeys theKeys� 0 thekey theKey� 0 dtkey dtKey� 0 thevalue theValue� 0 existingvalue existingValue� ����������������
� 
msng
� 
bool
� 
capp
� kfrmID  
� 
DTcm�  �  � 0 keysofrecord_ keysOfRecord_
� 
kocl
� 
cobj
� .corecnte****       ****� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName� .0 valueforkey_inrecord_ valueForKey_inRecord_� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_� <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_�' �� 
 �� �&
 �jv �& fY hOfE�O)���0 ���,E�O ��  	jvE�Y hW X  jvE�O�jv �b  /�k+ E�Ob  /�k+ E�O a�[��l kh )�k+ E�O�� =b  /��l+ E�Ob  /��l+ E�O�� eE�Ob  /ৣm+ E�Y hY eE�[OY��Ob  /��l+ E�Y hO���,FUO�L �
��	�����
 F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�	 ��� �  �� 0 thekey theKey�  � ��� 0 thekey theKey� 0 dtkey dtKey� ������ 0 lowercasetext lowercaseText� 0 regexreplace regexReplace� !b  /�k+  E�Ob  /���m+ E�O�%M � ����������  60 appendtocommentofdtfolder appendToCommentOfDTFolder�� ����� �  ������  0 folderlocation folderLocation�� 0 foldercomment folderComment��  � ����������  0 folderlocation folderLocation�� 0 foldercomment folderComment�� 0 commentparts commentParts�� .0 existingfoldercomment existingFolderComment� 	������5��������
�� 
msng
�� 
bool
�� 
capp
�� kfrmID  
�� 
DTco
�� 
lnfd��  0 mergetextitems mergeTextItems�� U��	 �jv�& FjvE�O)���0 5��,E�O��	 ���& 	��6GY hO��6GOb  /���%l+ ��,FUY hN ��\���������� &0 bibmetadatafordoi bibMetadataForDOI�� ����� �  ������ 0 doi  �� 0 citekey  ��  � �������������������������������������� 0 doi  �� 0 citekey  �� "0 publicationdata publicationData�� 0 bibmetadata bibMetadata�� 0 
pubauthors 
pubAuthors�� "0 pubauthorscount pubAuthorsCount�� 0 pubdate pubDate�� 0 pubpublisher pubPublisher�� 0 pubissn pubISSN�� 0 
pubjournal 
pubJournal�� 0 	pubvolume 	pubVolume�� 0 pubissue pubIssue�� 0 pubpages pubPages�� 0 pubcitation pubCitation�� 0 	pubbibtex 	pubBibTeX�� 0 publink pubLink�� 0 pubpmid pubPMID�� 0 pubpmcid pubPMCID� 7��l�����������������������������,9��LY��ly��������������������2?��R_��r�
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
0 bibtex  �� 0 link  �� 0 pmid  � 	0 pmcid  ���� 
 �� �& jvY hOb  /�b  b  ���+ E�O�jv  jvY hOjvE�Ob  /�l+ E�O��	 ���&	 �jv�& `��b  /��l+ l%E�O�j E�O�k  ���k/l%E�Y .�l  ���k/a %��l/%l%E�Y ���k/a %l%E�Y hOb  /a �l+ E�O�� �a �a &l%E�Y hOb  /a �l+ E�O��	 	�a �& �a �l%E�Y hOb  /a �l+ E�O��	 	�a �& �a �l%E�Y hOb  /a �l+ E�O��	 	�a �& �a �l%E�Y hOb  /a �l+ E�Ob  /a �l+ E�O��	 	�a  �& 1��	 	�a !�& �a "%�%a #%E�Y hO�a $�l%E�Y hOb  /a %�l+ E�O��	 	�a &�& �a '�l%E�Y hOb  /a (�l+ E�O��	 	�a )�& �a *�l%E�Y hOb  /a +�l+ E�O��	 	�a ,�& �a -�l%E�Y hOb  /a .�l+ E�O��	 	�a /�& �a 0�l%E�Y hOb  /a 1�l+ E^ O] �	 ] a 2�& �a 3] l%E�Y hOb  /a 4�l+ E^ O] �	 ] a 5�& �a 6] l%E�Y hO�O �������� 00 labelindexforcolorname labelIndexForColorName� ��� �  �� 0 	colorname 	colorName�  � ���� 0 	colorname 	colorName� $0 recordlabelindex recordLabelIndex� 0 labelmapping labelMapping� ������
� 
msng
� 
bool� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_� 0 
labelindex 
labelIndex� ?�� 
 �� �& jY hOjE�Ob  /�b  (m+ E�O�� 
��,E�Y hO�P �������� "0 colornameforhue colorNameForHue� ��� �  �� 0 	huedegree 	hueDegree�  � ���� 0 	huedegree 	hueDegree� 0 	colorname 	colorName� 0 colormapping colorMapping� 	��������
� 
kocl
� 
cobj
� .corecnte****       ****� 0 lowerhuelimit lowerHueLimit� 0 upperhuelimit upperHueLimit
� 
bool� 0 	colorname 	colorName� d�E�O 3b  '[��l kh ���,	 	���,�& 
��,E�Y h[OY��O�� 	 ���,
 	���,�&�& b  �,E�Y hO�Q �9������  0 annotationtext annotationText� ��� �  ��� 0 pdfpage pdfPage� 0 boundsbyline boundsByLine�  � ������� 0 pdfpage pdfPage� 0 boundsbyline boundsByLine� 0 
textbyline 
textByLine� 0 	thebounds 	theBounds� 0 pdfselection pdfSelection� 0 linetext lineText� ������d��y|�����
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
TEXT� 0 regexreplace regexReplace�  0 mergetextitems mergeTextItems� ojvE�O [�[��l kh ��k+ E�O�j+ E�O��	 ���& )b  /��&��m+ E�Ob  /���m+ E�O��6GY h[OY��Ob  /��l+ R �������� (0 colorforannotation colorForAnnotation� ��� �  �� 0 pdfannotation pdfAnnotation�  � �������~�}�|�{�z�y�x� 0 pdfannotation pdfAnnotation� 0 
annotcolor 
annotColor�  0 annotcolorname annotColorName� 0 	annottype 	annotType� 0 annotkeydict annotKeyDict� 0 defaultstyle defaultStyle�~  0 hexcolorstring hexColorString�} 0 thered theRed�| 0 thegreen theGreen�{ 0 theblue theBlue�z &0 defaultappearance defaultAppearance�y 0 
colorregex 
colorRegex�x 0 	huedegree 	hueDegree� '�w���v�u�t�s.�r5�q�p�o�n�m[�l�kp}���j���i�h�g�f�e�d�c�b�a�`�_�^
�w 
msng�v 0 type  �u *0 annotationkeyvalues annotationKeyValues
�t 
TEXT�s 0 valueforkey_ valueForKey_�r 0 
regexmatch 
regexMatch�q .0 rgbcolorfromhexcolor_ RGBColorFromHexColor_
�p 
cobj
�o misccura�n 0 nscolor NSColor�m ��l �k @0 colorwithred_green_blue_alpha_ colorWithRed_green_blue_alpha_�j 0 regexreplace regexReplace�i 	0 color  �h 0 
colorspace 
colorSpace�g 0 nscolorspace NSColorSpace�f *0 devicergbcolorspace deviceRGBColorSpace�e .0 colorusingcolorspace_ colorUsingColorSpace_�d 0 huecomponent hueComponent
�c 
nmbr�bh
�a 
dire
�` olierndS
�_ .sysorondlong        doub�^ "0 colornameforhue colorNameForHue�}��  
��lvY hO�E�O�E�O�j+ E�O�j+ E�O�kv��& ��k+ �&E�O�� [b  /��l+ 
E�O�� Cb  /�k+ E[�k/E�Z[�l/E�Z[�m/E�ZO��,�a !�a !�a !a a + E�Y hY y�a k+ �&E�O�� ea E�Ob  /��l+ 
a  Ib  /��a m+ E�Ob  /��a m+ E�Ob  /��a m+ E�O��,���a a + E�Y hY hY 	�j+ E�O�� S�a ,�a ,j+  ��a ,j+ k+ E�Y hO� �j+  a !&a " a #a $l %UE�O)�k+ &E�Y hO��lvS �]O�\�[���Z�] 00 annotationboundsbyline annotationBoundsByLine�\ �Y��Y �  �X�W�X 0 
quadpoints 
quadPoints�W $0 annotationbounds annotationBounds�[  � 	�V�U�T�S�R�Q�P�O�N�V 0 
quadpoints 
quadPoints�U $0 annotationbounds annotationBounds�T 0 	theorigin 	theOrigin�S 0 boundsbyline boundsByLine�R 0 maxquadcount maxQuadCount�Q 0 	quadcount 	quadCount�P 0 topleftpoint topLeftPoint�O $0 bottomrightpoint bottomRightPoint�N 0 
linebounds 
lineBounds� �M�L�K�J�I�H�G
�M 
cobj
�L .corecnte****       ****�K �J 0 
pointvalue 
pointValue�I 0 x  �H 0 y  �G 0 
makensrect 
makeNSRect�Z ���k/E�OjvE�O�j �!E�OkE�O ��kh��/j+ E�O��m/j+ E�O��,��k/b  ��,FO��,��l/b  ��,FO��,��k/b  ��,FO��,��l/b  ��,FO)��,��,lv��,��,lvlvk+ E�O��6GO��E�[OY�tO�T �FH�E�D���C�F 0 
makensrect 
makeNSRect�E �B��B �  �� {�A�@�?�A 0 alist aList
�@ 
list�?  �D  � �>�=�<�;�:�9�8�7�> 0 alist aList�= 0 x1  �< 0 y1  �; 0 x2  �: 0 y2  �9 0 xwidth xWidth�8 0 yheight yHeight�7 0 a1rect a1Rect� �6�5�4�3�2�1�0�/�.�-�,
�6 
cobj�5 
0 origin  �4 0 x  �3 0 y  �2 �1 0 size  �0 	0 width  �/ 
0 height  �.  �-  
�, 
msng�C ^ U�E[�k/E[�k/EQ�Z[�l/EQ�ZZ[�l/E[�k/EQ�Z[�l/EQ�ZZO��E�O��E�O���������E�O�W 	X  	�U �+��*�)���(�+ :0 preprocessannotationcomment preprocessAnnotationComment�* �'��' �  �&�& 0 acomment aComment�)  � �%�$�#�"�!� �% 0 acomment aComment�$ $0 transformedlines transformedLines�# 0 tagslineregex tagsLineRegex�" &0 tagdelimiterregex tagDelimiterRegex�! 0 aline aLine�  &0 transformedstring transformedString� ������������
� 
cpar
� 
kocl
� 
cobj
� .corecnte****       ****� 0 
regexmatch 
regexMatch� 0 regexreplace regexReplace
� 
ctxt
� 
lnfd�  0 mergetextitems mergeTextItems�( s�OjvE�O�E�O�E�O N��-[��l kh b  /��l+ � "b  /���m+ 	E�Ob  /���m+ 	E�Y hO��&�6G[OY��Ob  /��l+ �%E�O� ascr  ��ޭ