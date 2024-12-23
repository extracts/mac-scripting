FasdUAS 1.101.10   ��   ��    k             l     ��  ��    , & DEVONthink Notes from PDF Annotations     � 	 	 L   D E V O N t h i n k   N o t e s   f r o m   P D F   A n n o t a t i o n s   
  
 l     ��  ��    2 , version 1.3, licensed under the MIT license     �   X   v e r s i o n   1 . 3 ,   l i c e n s e d   u n d e r   t h e   M I T   l i c e n s e      l     ��������  ��  ��        l     ��  ��    B < by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de     �   x   b y   M a t t h i a s   S t e f f e n s ,   k e y p o i n t s . a p p ,   m a t ( a t ) e x t r a c t s ( d o t ) d e      l     ��������  ��  ��        l     ��  ��    o i For each of the PDFs selected in DEVONthink, this script will iterate over its contained PDF annotations     �   �   F o r   e a c h   o f   t h e   P D F s   s e l e c t e d   i n   D E V O N t h i n k ,   t h i s   s c r i p t   w i l l   i t e r a t e   o v e r   i t s   c o n t a i n e d   P D F   a n n o t a t i o n s      l     ��   ��    \ V and create or update a Markdown record for each markup, text or free text annotation.      � ! ! �   a n d   c r e a t e   o r   u p d a t e   a   M a r k d o w n   r e c o r d   f o r   e a c h   m a r k u p ,   t e x t   o r   f r e e   t e x t   a n n o t a t i o n .   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & m g This script can also be triggered via a DEVONthink smart rule to automatically extract PDF annotations    ' � ( ( �   T h i s   s c r i p t   c a n   a l s o   b e   t r i g g e r e d   v i a   a   D E V O N t h i n k   s m a r t   r u l e   t o   a u t o m a t i c a l l y   e x t r a c t   P D F   a n n o t a t i o n s %  ) * ) l     �� + ,��   + : 4 from imported/saved PDFs (see Setup & Usage below).    , � - - h   f r o m   i m p o r t e d / s a v e d   P D F s   ( s e e   S e t u p   &   U s a g e   b e l o w ) . *  . / . l     ��������  ��  ��   /  0 1 0 l     �� 2 3��   2 l f This script requires macOS 10.14 (High Sierra) or greater, the KeypointsScriptingLib v1.5 or greater,    3 � 4 4 �   T h i s   s c r i p t   r e q u i r e s   m a c O S   1 0 . 1 4   ( H i g h   S i e r r a )   o r   g r e a t e r ,   t h e   K e y p o i n t s S c r i p t i n g L i b   v 1 . 5   o r   g r e a t e r , 1  5 6 5 l     �� 7 8��   7 g a and DEVONthink Pro v3.x or greater (DEVONthink Pro v3.9 or greater will be required to have deep    8 � 9 9 �   a n d   D E V O N t h i n k   P r o   v 3 . x   o r   g r e a t e r   ( D E V O N t h i n k   P r o   v 3 . 9   o r   g r e a t e r   w i l l   b e   r e q u i r e d   t o   h a v e   d e e p 6  : ; : l     �� < =��   < 0 * links to PDF annotations work correctly).    = � > > T   l i n k s   t o   P D F   a n n o t a t i o n s   w o r k   c o r r e c t l y ) . ;  ? @ ? l     ��������  ��  ��   @  A B A l     ��������  ��  ��   B  C D C l     �� E F��   E   Setup:    F � G G    S e t u p : D  H I H l     ��������  ��  ��   I  J K J l     �� L M��   L h b -- Before running the script, do this once: Adjust the DEVONthink label <-> color mapping via the    M � N N �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   d o   t h i s   o n c e :   A d j u s t   t h e   D E V O N t h i n k   l a b e l   < - >   c o l o r   m a p p i n g   v i a   t h e K  O P O l     �� Q R��   Q r l     properties `label1` ... `label7` below and save this script again. If saving generates an error, please    R � S S �           p r o p e r t i e s   ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w   a n d   s a v e   t h i s   s c r i p t   a g a i n .   I f   s a v i n g   g e n e r a t e s   a n   e r r o r ,   p l e a s e P  T U T l     �� V W��   V o i     try again with Script Debugger (which has a free "lite" mode): https://latenightsw.com/sd8/download/    W � X X �           t r y   a g a i n   w i t h   S c r i p t   D e b u g g e r   ( w h i c h   h a s   a   f r e e   " l i t e "   m o d e ) :   h t t p s : / / l a t e n i g h t s w . c o m / s d 8 / d o w n l o a d / U  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     �� ] ^��   ] m g -- You may also want to check the other properties below. These allow to customize the script, e.g. to    ^ � _ _ �   - -   Y o u   m a y   a l s o   w a n t   t o   c h e c k   t h e   o t h e r   p r o p e r t i e s   b e l o w .   T h e s e   a l l o w   t o   c u s t o m i z e   t h e   s c r i p t ,   e . g .   t o \  ` a ` l     �� b c��   b S M     enable updating of existing notes, or automatic fetching of BibTeX data.    c � d d �           e n a b l e   u p d a t i n g   o f   e x i s t i n g   n o t e s ,   o r   a u t o m a t i c   f e t c h i n g   o f   B i b T e X   d a t a . a  e f e l     ��������  ��  ��   f  g h g l     �� i j��   i o i -- Copy the script to a suitable place, like the DEVONthink script folder. To open this folder, activate    j � k k �   - -   C o p y   t h e   s c r i p t   t o   a   s u i t a b l e   p l a c e ,   l i k e   t h e   D E V O N t h i n k   s c r i p t   f o l d e r .   T o   o p e n   t h i s   f o l d e r ,   a c t i v a t e h  l m l l     �� n o��   n q k     DEVONthink, select the Scripts menu(*) and choose "Open Scripts Folder". This will open the DEVONthink    o � p p �           D E V O N t h i n k ,   s e l e c t   t h e   S c r i p t s   m e n u ( * )   a n d   c h o o s e   " O p e n   S c r i p t s   F o l d e r " .   T h i s   w i l l   o p e n   t h e   D E V O N t h i n k m  q r q l     �� s t��   s } w     Scripts folder in the Finder. It is located at `~/Library/Application Scripts/com.devon-technologies.think3/Menu`.    t � u u �           S c r i p t s   f o l d e r   i n   t h e   F i n d e r .   I t   i s   l o c a t e d   a t   ` ~ / L i b r a r y / A p p l i c a t i o n   S c r i p t s / c o m . d e v o n - t e c h n o l o g i e s . t h i n k 3 / M e n u ` . r  v w v l     �� x y��   x � �     (*): https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/menus-scripts.html    y � z z           ( * ) :   h t t p s : / / d o w n l o a d . d e v o n t e c h n o l o g i e s . c o m / d o w n l o a d / d e v o n t h i n k / 3 . 8 . 2 / D E V O N t h i n k . h e l p / C o n t e n t s / R e s o u r c e s / p g s / m e n u s - s c r i p t s . h t m l w  { | { l     ��������  ��  ��   |  } ~ } l     ��  ���    r l     Alternatively, you can copy the script to the system's script menu folder. For a guide on how to enable    � � � � �           A l t e r n a t i v e l y ,   y o u   c a n   c o p y   t h e   s c r i p t   t o   t h e   s y s t e m ' s   s c r i p t   m e n u   f o l d e r .   F o r   a   g u i d e   o n   h o w   t o   e n a b l e ~  � � � l     �� � ���   � f `     and use the system's script menu, see: https://iworkautomation.com/numbers/script-menu.html    � � � � �           a n d   u s e   t h e   s y s t e m ' s   s c r i p t   m e n u ,   s e e :   h t t p s : / / i w o r k a u t o m a t i o n . c o m / n u m b e r s / s c r i p t - m e n u . h t m l �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � q k -- If you've placed your script into the DEVONthink script folder, you may also append a keyboard shortcut    � � � � �   - -   I f   y o u ' v e   p l a c e d   y o u r   s c r i p t   i n t o   t h e   D E V O N t h i n k   s c r i p t   f o l d e r ,   y o u   m a y   a l s o   a p p e n d   a   k e y b o a r d   s h o r t c u t �  � � � l     �� � ���   � m g     description (like `___Command-Shift-Alt-A`) to the script's name. After restarting DEVONthink, you    � � � � �           d e s c r i p t i o n   ( l i k e   ` _ _ _ C o m m a n d - S h i f t - A l t - A ` )   t o   t h e   s c r i p t ' s   n a m e .   A f t e r   r e s t a r t i n g   D E V O N t h i n k ,   y o u �  � � � l     �� � ���   � Q K     should be able to run your script via the specified keyboard shortcut.    � � � � �           s h o u l d   b e   a b l e   t o   r u n   y o u r   s c r i p t   v i a   t h e   s p e c i f i e d   k e y b o a r d   s h o r t c u t . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � q k -- If you want this script to be triggered by a DEVONthink smart rule instead, please move the script into    � � � � �   - -   I f   y o u   w a n t   t h i s   s c r i p t   t o   b e   t r i g g e r e d   b y   a   D E V O N t h i n k   s m a r t   r u l e   i n s t e a d ,   p l e a s e   m o v e   t h e   s c r i p t   i n t o �  � � � l     �� � ���   � � {     the DEVONthink smart rule scripts folder at `~/Library/Application Scripts/com.devon-technologies.think3/Smart Rules`.    � � � � �           t h e   D E V O N t h i n k   s m a r t   r u l e   s c r i p t s   f o l d e r   a t   ` ~ / L i b r a r y / A p p l i c a t i o n   S c r i p t s / c o m . d e v o n - t e c h n o l o g i e s . t h i n k 3 / S m a r t   R u l e s ` . �  � � � l     �� � ���   � p j     Then, in your smart rule, add an "Execute Script" action and choose "External" as well as your script    � � � � �           T h e n ,   i n   y o u r   s m a r t   r u l e ,   a d d   a n   " E x e c u t e   S c r i p t "   a c t i o n   a n d   c h o o s e   " E x t e r n a l "   a s   w e l l   a s   y o u r   s c r i p t �  � � � l     �� � ���   � g a     from the dropdown menus. For more info on DEVONthink smart rules and assigning scripts, see:    � � � � �           f r o m   t h e   d r o p d o w n   m e n u s .   F o r   m o r e   i n f o   o n   D E V O N t h i n k   s m a r t   r u l e s   a n d   a s s i g n i n g   s c r i p t s ,   s e e : �  � � � l     �� � ���   � � �     https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/automation-smartrules.html    � � � �           h t t p s : / / d o w n l o a d . d e v o n t e c h n o l o g i e s . c o m / d o w n l o a d / d e v o n t h i n k / 3 . 8 . 2 / D E V O N t h i n k . h e l p / C o n t e n t s / R e s o u r c e s / p g s / a u t o m a t i o n - s m a r t r u l e s . h t m l �  � � � l     �� � ���   � � �     https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/automation-smartrulescripts.html     � � � �           h t t p s : / / d o w n l o a d . d e v o n t e c h n o l o g i e s . c o m / d o w n l o a d / d e v o n t h i n k / 3 . 8 . 2 / D E V O N t h i n k . h e l p / C o n t e n t s / R e s o u r c e s / p g s / a u t o m a t i o n - s m a r t r u l e s c r i p t s . h t m l   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �   Usage:    � � � �    U s a g e : �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � n h -- Before running the script, please select one or more PDF records with PDF annotations in DEVONthink.    � � � � �   - -   B e f o r e   r u n n i n g   t h e   s c r i p t ,   p l e a s e   s e l e c t   o n e   o r   m o r e   P D F   r e c o r d s   w i t h   P D F   a n n o t a t i o n s   i n   D E V O N t h i n k . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- To run the script, select its menu entry from the (DEVONthink or system's) script menu, or press your    � � � � �   - -   T o   r u n   t h e   s c r i p t ,   s e l e c t   i t s   m e n u   e n t r y   f r o m   t h e   ( D E V O N t h i n k   o r   s y s t e m ' s )   s c r i p t   m e n u ,   o r   p r e s s   y o u r �  � � � l     �� � ���   � ' !     specified keyboard shortcut.    � � � � B           s p e c i f i e d   k e y b o a r d   s h o r t c u t . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � o i -- After the script has finished, you'll see a dialog with feedback on how many PDFs have been processed    � � � � �   - -   A f t e r   t h e   s c r i p t   h a s   f i n i s h e d ,   y o u ' l l   s e e   a   d i a l o g   w i t h   f e e d b a c k   o n   h o w   m a n y   P D F s   h a v e   b e e n   p r o c e s s e d �  � � � l     �� � ���   � m g     and how many note records have been created/updated. For each PDF, its annotation notes are stored    � � � � �           a n d   h o w   m a n y   n o t e   r e c o r d s   h a v e   b e e n   c r e a t e d / u p d a t e d .   F o r   e a c h   P D F ,   i t s   a n n o t a t i o n   n o t e s   a r e   s t o r e d �  � � � l     �� � ���   � m g     within a DEVONthink group next to the PDF. By default, the group is named identical to the PDF but    � � � � �           w i t h i n   a   D E V O N t h i n k   g r o u p   n e x t   t o   t h e   P D F .   B y   d e f a u l t ,   t h e   g r o u p   i s   n a m e d   i d e n t i c a l   t o   t h e   P D F   b u t �  � � � l     �� � ���   � / )     contains an " � Annotations" suffix.    � � � � R           c o n t a i n s   a n   "      A n n o t a t i o n s "   s u f f i x . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � m g -- Note that you can run the script multiple times with the same PDF record(s) selected in DEVONthink.    � � � � �   - -   N o t e   t h a t   y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k . �  � � � l     �� � ���   � n h     On a subsequent run of the script, all notes that were newly created (or updated) will be selected.    � � � � �           O n   a   s u b s e q u e n t   r u n   o f   t h e   s c r i p t ,   a l l   n o t e s   t h a t   w e r e   n e w l y   c r e a t e d   ( o r   u p d a t e d )   w i l l   b e   s e l e c t e d . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � m g -- As an alternative, this script can be run automatically from within a DEVONthink smart rule that's,    � � � � �   - -   A s   a n   a l t e r n a t i v e ,   t h i s   s c r i p t   c a n   b e   r u n   a u t o m a t i c a l l y   f r o m   w i t h i n   a   D E V O N t h i n k   s m a r t   r u l e   t h a t ' s , �  � � � l     �� � ��   � o i     for example, triggered by an Import or Save event. Note that, when triggered by a smart rule, script     � �           f o r   e x a m p l e ,   t r i g g e r e d   b y   a n   I m p o r t   o r   S a v e   e v e n t .   N o t e   t h a t ,   w h e n   t r i g g e r e d   b y   a   s m a r t   r u l e ,   s c r i p t �  l     ����   f `     feedback will be reported via a notification, and created/updated notes won't get selected.    � �           f e e d b a c k   w i l l   b e   r e p o r t e d   v i a   a   n o t i f i c a t i o n ,   a n d   c r e a t e d / u p d a t e d   n o t e s   w o n ' t   g e t   s e l e c t e d .  l     ��������  ��  ��   	
	 l     ��������  ��  ��  
  l     ����     Discussion & Help:    � &   D i s c u s s i o n   &   H e l p :  l     ��������  ��  ��    l     ����   y s -- https://discourse.devontechnologies.com/t/script-to-create-individual-markdown-notes-from-pdf-annotations/80987    � �   - -   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / s c r i p t - t o - c r e a t e - i n d i v i d u a l - m a r k d o w n - n o t e s - f r o m - p d f - a n n o t a t i o n s / 8 0 9 8 7  l     ����   @ :     https://github.com/extracts/mac-scripting/discussions    � t           h t t p s : / / g i t h u b . c o m / e x t r a c t s / m a c - s c r i p t i n g / d i s c u s s i o n s  l     ��������  ��  ��    l     ��������  ��  ��    !  l     ��"#��  "   Notes:   # �$$    N o t e s :! %&% l     ��������  ��  ��  & '(' l     ��)*��  ) z t -- The script will only recognize these annotation types: "Highlight", "StrikeOut", "Underline", "Squiggly", "Text"   * �++ �   - -   T h e   s c r i p t   w i l l   o n l y   r e c o g n i z e   t h e s e   a n n o t a t i o n   t y p e s :   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y " ,   " T e x t "( ,-, l     ��./��  .       and "FreeText".   / �00 (           a n d   " F r e e T e x t " .- 121 l     �������  ��  �  2 343 l     �~56�~  5 u o -- For each selected PDF with PDF annotations, the script will create a DEVONthink group next to it containing   6 �77 �   - -   F o r   e a c h   s e l e c t e d   P D F   w i t h   P D F   a n n o t a t i o n s ,   t h e   s c r i p t   w i l l   c r e a t e   a   D E V O N t h i n k   g r o u p   n e x t   t o   i t   c o n t a i n i n g4 898 l     �}:;�}  : y s     Markdown record(s) for all recognized PDF annotation(s). The group's name can be controlled via the properties   ; �<< �           M a r k d o w n   r e c o r d ( s )   f o r   a l l   r e c o g n i z e d   P D F   a n n o t a t i o n ( s ) .   T h e   g r o u p ' s   n a m e   c a n   b e   c o n t r o l l e d   v i a   t h e   p r o p e r t i e s9 =>= l     �|?@�|  ? A ;     `noteFolderNamePrefix` & `noteFolderNameSuffix` below.   @ �AA v           ` n o t e F o l d e r N a m e P r e f i x `   &   ` n o t e F o l d e r N a m e S u f f i x `   b e l o w .> BCB l     �{�z�y�{  �z  �y  C DED l     �xFG�x  F v p -- You can run the script multiple times with the same PDF record(s) selected in DEVONthink. If PDF annotations   G �HH �   - -   Y o u   c a n   r u n   t h e   s c r i p t   m u l t i p l e   t i m e s   w i t h   t h e   s a m e   P D F   r e c o r d ( s )   s e l e c t e d   i n   D E V O N t h i n k .   I f   P D F   a n n o t a t i o n sE IJI l     �wKL�w  K { u     have been added to the PDF file after the last script run, the next script run will add Markdown records for the   L �MM �           h a v e   b e e n   a d d e d   t o   t h e   P D F   f i l e   a f t e r   t h e   l a s t   s c r i p t   r u n ,   t h e   n e x t   s c r i p t   r u n   w i l l   a d d   M a r k d o w n   r e c o r d s   f o r   t h eJ NON l     �vPQ�v  P z t     newly created PDF annotations. Note that deletions will not get synced across. If existing PDF annotations have   Q �RR �           n e w l y   c r e a t e d   P D F   a n n o t a t i o n s .   N o t e   t h a t   d e l e t i o n s   w i l l   n o t   g e t   s y n c e d   a c r o s s .   I f   e x i s t i n g   P D F   a n n o t a t i o n s   h a v eO STS l     �uUV�u  U y s     been updated the script can update the corresponding Markdown records. While this is off by default, it can be   V �WW �           b e e n   u p d a t e d   t h e   s c r i p t   c a n   u p d a t e   t h e   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d s .   W h i l e   t h i s   i s   o f f   b y   d e f a u l t ,   i t   c a n   b eT XYX l     �tZ[�t  Z { u     enabled by setting below property `updateExistingNotes` to `true`. In that case, these properties can be updated   [ �\\ �           e n a b l e d   b y   s e t t i n g   b e l o w   p r o p e r t y   ` u p d a t e E x i s t i n g N o t e s `   t o   ` t r u e ` .   I n   t h a t   c a s e ,   t h e s e   p r o p e r t i e s   c a n   b e   u p d a t e dY ]^] l     �s_`�s  _ x r     (if enabled below): name, note text, modification date, flagged status, rating, label, tags, custom metadata.   ` �aa �           ( i f   e n a b l e d   b e l o w ) :   n a m e ,   n o t e   t e x t ,   m o d i f i c a t i o n   d a t e ,   f l a g g e d   s t a t u s ,   r a t i n g ,   l a b e l ,   t a g s ,   c u s t o m   m e t a d a t a .^ bcb l     �rde�r  d ~ x     Note that if you change a PDF annotation's annotation type (say, from "Highlight" to "Underline"), this will always   e �ff �           N o t e   t h a t   i f   y o u   c h a n g e   a   P D F   a n n o t a t i o n ' s   a n n o t a t i o n   t y p e   ( s a y ,   f r o m   " H i g h l i g h t "   t o   " U n d e r l i n e " ) ,   t h i s   w i l l   a l w a y sc ghg l     �qij�q  i &       create a new Markdown note.   j �kk @           c r e a t e   a   n e w   M a r k d o w n   n o t e .h lml l     �p�o�n�p  �o  �n  m non l     �mpq�m  p w q -- If possible, the PDF annotation's source text will get added to the body text of the Markdown record. However   q �rr �   - -   I f   p o s s i b l e ,   t h e   P D F   a n n o t a t i o n ' s   s o u r c e   t e x t   w i l l   g e t   a d d e d   t o   t h e   b o d y   t e x t   o f   t h e   M a r k d o w n   r e c o r d .   H o w e v e ro sts l     �luv�l  u z t     note that, depending on the tool used for PDF annotation, this may fail or be inaccurate. In that case, you may   v �ww �           n o t e   t h a t ,   d e p e n d i n g   o n   t h e   t o o l   u s e d   f o r   P D F   a n n o t a t i o n ,   t h i s   m a y   f a i l   o r   b e   i n a c c u r a t e .   I n   t h a t   c a s e ,   y o u   m a yt xyx l     �kz{�k  z v p     improve text extraction success by tweaking the properties `lineWidthEnlargement` & `lineHeightEnlargement`   { �|| �           i m p r o v e   t e x t   e x t r a c t i o n   s u c c e s s   b y   t w e a k i n g   t h e   p r o p e r t i e s   ` l i n e W i d t h E n l a r g e m e n t `   &   ` l i n e H e i g h t E n l a r g e m e n t `y }~} l     �j��j         below.   � ���            b e l o w .~ ��� l     �i�h�g�i  �h  �g  � ��� l     �f���f  � w q -- Notes that have been added to a PDF annotation will also get added to the Markdown record's body text. Within   � ��� �   - -   N o t e s   t h a t   h a v e   b e e n   a d d e d   t o   a   P D F   a n n o t a t i o n   w i l l   a l s o   g e t   a d d e d   t o   t h e   M a r k d o w n   r e c o r d ' s   b o d y   t e x t .   W i t h i n� ��� l     �e���e  � { u     a PDF annotation note, you can use following (Keypoints-style) syntax to explicitly set the name of the Markdown   � ��� �           a   P D F   a n n o t a t i o n   n o t e ,   y o u   c a n   u s e   f o l l o w i n g   ( K e y p o i n t s - s t y l e )   s y n t a x   t o   e x p l i c i t l y   s e t   t h e   n a m e   o f   t h e   M a r k d o w n� ��� l     �d���d  � ( "     record and/or its properties:   � ��� D           r e c o r d   a n d / o r   i t s   p r o p e r t i e s :� ��� l     �c���c  � x r     - A line prefixed with `# ` (like a Markdown first-level heading) will be used as the Markdown record's name.   � ��� �           -   A   l i n e   p r e f i x e d   w i t h   ` #   `   ( l i k e   a   M a r k d o w n   f i r s t - l e v e l   h e a d i n g )   w i l l   b e   u s e d   a s   t h e   M a r k d o w n   r e c o r d ' s   n a m e .� ��� l     �b���b  � v p     - One or more line(s) prefixed with `< ` indicate a metadata line which will get stripped from the record's   � ��� �           -   O n e   o r   m o r e   l i n e ( s )   p r e f i x e d   w i t h   ` <   `   i n d i c a t e   a   m e t a d a t a   l i n e   w h i c h   w i l l   g e t   s t r i p p e d   f r o m   t h e   r e c o r d ' s� ��� l     �a���a  � E ?        body text but which will set record properties instead:   � ��� ~                 b o d y   t e x t   b u t   w h i c h   w i l l   s e t   r e c o r d   p r o p e r t i e s   i n s t e a d :� ��� l     �`���`  � { u        - In a metadata line, include 1 to 5 asterisks or `?` characters to set the record's star-rating, for example   � ��� �                 -   I n   a   m e t a d a t a   l i n e ,   i n c l u d e   1   t o   5   a s t e r i s k s   o r   `& `   c h a r a c t e r s   t o   s e t   t h e   r e c o r d ' s   s t a r - r a t i n g ,   f o r   e x a m p l e� ��� l     �_���_  � K E          `< ****` would set a 4-star rating for the Markdown record.   � ��� �                     ` <   * * * * `   w o u l d   s e t   a   4 - s t a r   r a t i n g   f o r   t h e   M a r k d o w n   r e c o r d .� ��� l     �^���^  � x r        - In a metadata line, add the special tag `@:flagged` to set the Markdown record's flagged status to true.   � ��� �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   t h e   s p e c i a l   t a g   ` @ : f l a g g e d `   t o   s e t   t h e   M a r k d o w n   r e c o r d ' s   f l a g g e d   s t a t u s   t o   t r u e .� ��� l     �]���]  � w q        - In a metadata line, add any tags like `@tag` or `@another tag` to set these as the tags of the Markdown   � ��� �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   t a g s   l i k e   ` @ t a g `   o r   ` @ a n o t h e r   t a g `   t o   s e t   t h e s e   a s   t h e   t a g s   o f   t h e   M a r k d o w n� ��� l     �\���\  �            record.   � ��� "                     r e c o r d .� ��� l     �[���[  � v p        - In a metadata line, add any custom key:value attributes like `@:key:Some value` to set these as custom   � ��� �                 -   I n   a   m e t a d a t a   l i n e ,   a d d   a n y   c u s t o m   k e y : v a l u e   a t t r i b u t e s   l i k e   ` @ : k e y : S o m e   v a l u e `   t o   s e t   t h e s e   a s   c u s t o m� ��� l     �Z���Z  � w q          metadata of the Markdown record. A custom attribute w/o a value (like `@:key`) will get a default value   � ��� �                     m e t a d a t a   o f   t h e   M a r k d o w n   r e c o r d .   A   c u s t o m   a t t r i b u t e   w / o   a   v a l u e   ( l i k e   ` @ : k e y ` )   w i l l   g e t   a   d e f a u l t   v a l u e� ��� l     �Y���Y  �            of `true`.   � ��� (                     o f   ` t r u e ` .� ��� l     �X���X  � p j        Note that you can also include any/all of these properties on a single metadata line, for example:   � ��� �                 N o t e   t h a t   y o u   c a n   a l s o   i n c l u d e   a n y / a l l   o f   t h e s e   p r o p e r t i e s   o n   a   s i n g l e   m e t a d a t a   l i n e ,   f o r   e x a m p l e :� ��� l     �W���W  � C =        `< **** @:flagged @tag @another tag @:key:Some value`   � ��� z                 ` <   * * * *   @ : f l a g g e d   @ t a g   @ a n o t h e r   t a g   @ : k e y : S o m e   v a l u e `� ��� l     �V�U�T�V  �U  �T  � ��� l     �S���S  � t n -- If your PDF annotation notes contain custom markup syntax, you can use the `preprocessAnnotationComment()`   � ��� �   - -   I f   y o u r   P D F   a n n o t a t i o n   n o t e s   c o n t a i n   c u s t o m   m a r k u p   s y n t a x ,   y o u   c a n   u s e   t h e   ` p r e p r o c e s s A n n o t a t i o n C o m m e n t ( ) `� ��� l     �R���R  � h b     method to preprocess & transform this syntax to the (Keypoints-style) format described above.   � ��� �           m e t h o d   t o   p r e p r o c e s s   &   t r a n s f o r m   t h i s   s y n t a x   t o   t h e   ( K e y p o i n t s - s t y l e )   f o r m a t   d e s c r i b e d   a b o v e .� ��� l     �Q�P�O�Q  �P  �O  � ��� l     �N���N  � { u -- For your PDF record, as well as for each of the created Markdown records, a link to the "... � Annotations" group   � ��� �   - -   F o r   y o u r   P D F   r e c o r d ,   a s   w e l l   a s   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s ,   a   l i n k   t o   t h e   " . . .      A n n o t a t i o n s "   g r o u p� ��� l     �M���M  � { u     folder will be copied to a custom metadata field (named `pdfannotations`). This allows you to easily get back to   � ��� �           f o l d e r   w i l l   b e   c o p i e d   t o   a   c u s t o m   m e t a d a t a   f i e l d   ( n a m e d   ` p d f a n n o t a t i o n s ` ) .   T h i s   a l l o w s   y o u   t o   e a s i l y   g e t   b a c k   t o� ��� l     �L���L  � / )     the PDF's group of annotation notes.   � ��� R           t h e   P D F ' s   g r o u p   o f   a n n o t a t i o n   n o t e s .� ��� l     �K�J�I�K  �J  �I  � ��� l     �H���H  � x r -- The URL field of each Markdown record will be set to a deep link that directly points to the corresponding PDF   � ��� �   - -   T h e   U R L   f i e l d   o f   e a c h   M a r k d o w n   r e c o r d   w i l l   b e   s e t   t o   a   d e e p   l i n k   t h a t   d i r e c t l y   p o i n t s   t o   t h e   c o r r e s p o n d i n g   P D F� ��� l     �G���G  � } w     annotation. I.e., clicking this deep link will open the associated PDF and scroll the corresponding PDF annotation   � ��� �           a n n o t a t i o n .   I . e . ,   c l i c k i n g   t h i s   d e e p   l i n k   w i l l   o p e n   t h e   a s s o c i a t e d   P D F   a n d   s c r o l l   t h e   c o r r e s p o n d i n g   P D F   a n n o t a t i o n� ��� l     �F� �F  � H B     into view. Note that this requires DEVONthink 3.9 or greater.     � �           i n t o   v i e w .   N o t e   t h a t   t h i s   r e q u i r e s   D E V O N t h i n k   3 . 9   o r   g r e a t e r .�  l     �E�D�C�E  �D  �C    l     �B�B    y -- For each Markdown record, the script will try to assign a color label that matches your annotation's highlight color.    � �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   t r y   t o   a s s i g n   a   c o l o r   l a b e l   t h a t   m a t c h e s   y o u r   a n n o t a t i o n ' s   h i g h l i g h t   c o l o r . 	
	 l     �A�A   x r     Note that, to suit your personal DEVONthink label setup, you'll need to adjust the mapping via the properties    � �           N o t e   t h a t ,   t o   s u i t   y o u r   p e r s o n a l   D E V O N t h i n k   l a b e l   s e t u p ,   y o u ' l l   n e e d   t o   a d j u s t   t h e   m a p p i n g   v i a   t h e   p r o p e r t i e s
  l     �@�@   ' !     `label1` ... `label7` below.    � B           ` l a b e l 1 `   . . .   ` l a b e l 7 `   b e l o w .  l     �?�>�=�?  �>  �=    l     �<�<   w q -- For each Markdown record, the script will also add an ID-like alias (like "039H-8GAB-1GPA") that's unique and    � �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   a l s o   a d d   a n   I D - l i k e   a l i a s   ( l i k e   " 0 3 9 H - 8 G A B - 1 G P A " )   t h a t ' s   u n i q u e   a n d  l     �;�;   y s     which optionally can be used to create a stable Wiki-link (like "[[039H-8GAB-1GPA]]") to this Markdown record.    � �           w h i c h   o p t i o n a l l y   c a n   b e   u s e d   t o   c r e a t e   a   s t a b l e   W i k i - l i n k   ( l i k e   " [ [ 0 3 9 H - 8 G A B - 1 G P A ] ] " )   t o   t h i s   M a r k d o w n   r e c o r d .   l     �:�9�8�:  �9  �8    !"! l     �7#$�7  # � | -- For each Markdown record, the script will also add a sort identifier string (like "2-1-125" which codifies with integers   $ �%% �   - -   F o r   e a c h   M a r k d o w n   r e c o r d ,   t h e   s c r i p t   w i l l   a l s o   a d d   a   s o r t   i d e n t i f i e r   s t r i n g   ( l i k e   " 2 - 1 - 1 2 5 "   w h i c h   c o d i f i e s   w i t h   i n t e g e r s" &'& l     �6()�6  ( { u     the annotation's page, column & position from top) to the `annotationorder` custom metadata field. This metadata   ) �** �           t h e   a n n o t a t i o n ' s   p a g e ,   c o l u m n   &   p o s i t i o n   f r o m   t o p )   t o   t h e   ` a n n o t a t i o n o r d e r `   c u s t o m   m e t a d a t a   f i e l d .   T h i s   m e t a d a t a' +,+ l     �5-.�5  - z t     field can be used in DEVONthink to sort annotations in the order they appear in the text of a page. By default,   . �// �           f i e l d   c a n   b e   u s e d   i n   D E V O N t h i n k   t o   s o r t   a n n o t a t i o n s   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   t e x t   o f   a   p a g e .   B y   d e f a u l t ,, 010 l     �423�4  2 � z     sort identifiers will be generated so that they try to respect a typical 2-column text layout. Note that this may not   3 �44 �           s o r t   i d e n t i f i e r s   w i l l   b e   g e n e r a t e d   s o   t h a t   t h e y   t r y   t o   r e s p e c t   a   t y p i c a l   2 - c o l u m n   t e x t   l a y o u t .   N o t e   t h a t   t h i s   m a y   n o t1 565 l     �378�3  7 ~ x     always be perfect. To further control sort identifier generation, see the properties `respectMultiColumnPDFLayouts`   8 �99 �           a l w a y s   b e   p e r f e c t .   T o   f u r t h e r   c o n t r o l   s o r t   i d e n t i f i e r   g e n e r a t i o n ,   s e e   t h e   p r o p e r t i e s   ` r e s p e c t M u l t i C o l u m n P D F L a y o u t s `6 :;: l     �2<=�2  < &       and `maxTextColumns` below.   = �>> @           a n d   ` m a x T e x t C o l u m n s `   b e l o w .; ?@? l     �1�0�/�1  �0  �/  @ ABA l     �.CD�.  C v p -- If the PDF metadata contain a DOI, this DOI will get written to the `doi` custom metadata field for your PDF   D �EE �   - -   I f   t h e   P D F   m e t a d a t a   c o n t a i n   a   D O I ,   t h i s   D O I   w i l l   g e t   w r i t t e n   t o   t h e   ` d o i `   c u s t o m   m e t a d a t a   f i e l d   f o r   y o u r   P D FB FGF l     �-HI�-  H _ Y     record, the "... � Annotations" group, and for each of the created Markdown records.   I �JJ �           r e c o r d ,   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .G KLK l     �,�+�*�,  �+  �*  L MNM l     �)OP�)  O  y -- Similarly, if the PDF record's custom metadata contain a citekey, this citekey will also get written to the `citekey`   P �QQ �   - -   S i m i l a r l y ,   i f   t h e   P D F   r e c o r d ' s   c u s t o m   m e t a d a t a   c o n t a i n   a   c i t e k e y ,   t h i s   c i t e k e y   w i l l   a l s o   g e t   w r i t t e n   t o   t h e   ` c i t e k e y `N RSR l     �(TU�(  T q k     custom metadata field for the "... � Annotations" group, and for each of the created Markdown records.   U �VV �           c u s t o m   m e t a d a t a   f i e l d   f o r   t h e   " . . .      A n n o t a t i o n s "   g r o u p ,   a n d   f o r   e a c h   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d s .S WXW l     �'�&�%�'  �&  �%  X YZY l     �$[\�$  [ } w -- If a DOI was found for the PDF, the script will also attempt to fetch its bibliographic metadata and set the custom   \ �]] �   - -   I f   a   D O I   w a s   f o u n d   f o r   t h e   P D F ,   t h e   s c r i p t   w i l l   a l s o   a t t e m p t   t o   f e t c h   i t s   b i b l i o g r a p h i c   m e t a d a t a   a n d   s e t   t h e   c u s t o mZ ^_^ l     �#`a�#  ` y s     metadata and/or the Finder comment of the "... � Annotations" group & its Markdown records accordingly. Please   a �bb �           m e t a d a t a   a n d / o r   t h e   F i n d e r   c o m m e n t   o f   t h e   " . . .      A n n o t a t i o n s "   g r o u p   &   i t s   M a r k d o w n   r e c o r d s   a c c o r d i n g l y .   P l e a s e_ cdc l     �"ef�"  e W Q     see the properties below for options to disable or fine-tune this behaviour.   f �gg �           s e e   t h e   p r o p e r t i e s   b e l o w   f o r   o p t i o n s   t o   d i s a b l e   o r   f i n e - t u n e   t h i s   b e h a v i o u r .d hih l     �!� ��!  �   �  i jkj l     ����  �  �  k lml l     �no�  n   Ideas for Improvement:   o �pp .   I d e a s   f o r   I m p r o v e m e n t :m qrq l     ����  �  �  r sts l     �uv�  u  y allow name & content of created Markdown records to be generated via a template (e.g., to allow for custom YAML headers)   v �ww �   a l l o w   n a m e   &   c o n t e n t   o f   c r e a t e d   M a r k d o w n   r e c o r d s   t o   b e   g e n e r a t e d   v i a   a   t e m p l a t e   ( e . g . ,   t o   a l l o w   f o r   c u s t o m   Y A M L   h e a d e r s )t xyx l     �z{�  z q k offer a configuration option to specify which metadata shall get exported into which custom metadata field   { �|| �   o f f e r   a   c o n f i g u r a t i o n   o p t i o n   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l dy }~} l     ���   f ` if just some DEVONthink groups were selected, allow to get all contained PDFs and process these   � ��� �   i f   j u s t   s o m e   D E V O N t h i n k   g r o u p s   w e r e   s e l e c t e d ,   a l l o w   t o   g e t   a l l   c o n t a i n e d   P D F s   a n d   p r o c e s s   t h e s e~ ��� l     ����  � � � allow to optionally look-up the PDF file in a reference manager like Bookends and auto-fetch citekey & citation info from there   � ���    a l l o w   t o   o p t i o n a l l y   l o o k - u p   t h e   P D F   f i l e   i n   a   r e f e r e n c e   m a n a g e r   l i k e   B o o k e n d s   a n d   a u t o - f e t c h   c i t e k e y   &   c i t a t i o n   i n f o   f r o m   t h e r e� ��� l     ����  � x r allow to (optionally) remove tags from Markdown records for PDF annotations whose corresponding tags were removed   � ��� �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   t a g s   f r o m   M a r k d o w n   r e c o r d s   f o r   P D F   a n n o t a t i o n s   w h o s e   c o r r e s p o n d i n g   t a g s   w e r e   r e m o v e d� ��� l     ����  � w q allow to (optionally) remove Markdown records from DEVONthink for PDF annotations that were deleted from the PDF   � ��� �   a l l o w   t o   ( o p t i o n a l l y )   r e m o v e   M a r k d o w n   r e c o r d s   f r o m   D E V O N t h i n k   f o r   P D F   a n n o t a t i o n s   t h a t   w e r e   d e l e t e d   f r o m   t h e   P D F� ��� l     ����  � u o support any annotation types other than "Highlight", "StrikeOut", "Underline", "Squiggly", "Text" & "FreeText"   � ��� �   s u p p o r t   a n y   a n n o t a t i o n   t y p e s   o t h e r   t h a n   " H i g h l i g h t " ,   " S t r i k e O u t " ,   " U n d e r l i n e " ,   " S q u i g g l y " ,   " T e x t "   &   " F r e e T e x t "� ��� l     ����  � 0 * (see also inline TODOs in the code below)   � ��� T   ( s e e   a l s o   i n l i n e   T O D O s   i n   t h e   c o d e   b e l o w )� ��� l     ����  �  �  � ��� l     ���
�  �  �
  � ��� l     �	���	  � W Q ------------- optionally adopt the property values below this line -------------   � ��� �   - - - - - - - - - - - - -   o p t i o n a l l y   a d o p t   t h e   p r o p e r t y   v a l u e s   b e l o w   t h i s   l i n e   - - - - - - - - - - - - -� ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � c ] Prefix prepended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.   � ��� �   P r e f i x   p r e p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .� ��� j     ��� ,0 notefoldernameprefix noteFolderNamePrefix� m     �� ���  � ��� l     � �����   ��  ��  � ��� l     ������  � b \ Suffix appended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.   � ��� �   S u f f i x   a p p e n d e d   t o   t h e   n a m e   o f   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   a   P D F   f i l e ' s   M a r k d o w n   n o t e s .� ��� j    ����� ,0 notefoldernamesuffix noteFolderNameSuffix� m    �� ���       A n n o t a t i o n s� ��� l     ��������  ��  ��  � ��� l     ������  � ` Z Maps DEVONthink label indexes to color names. Please set the `colorName` values according   � ��� �   M a p s   D E V O N t h i n k   l a b e l   i n d e x e s   t o   c o l o r   n a m e s .   P l e a s e   s e t   t h e   ` c o l o r N a m e `   v a l u e s   a c c o r d i n g� ��� l     ������  � d ^  to the label <-> color mapping that you've chosen in your DEVONthink Settings under "Color".   � ��� �     t o   t h e   l a b e l   < - >   c o l o r   m a p p i n g   t h a t   y o u ' v e   c h o s e n   i n   y o u r   D E V O N t h i n k   S e t t i n g s   u n d e r   " C o l o r " .� ��� l     ������  � ] W E.g., if your "Color" settings specify a yellowish color for the first label, then use   � ��� �   E . g . ,   i f   y o u r   " C o l o r "   s e t t i n g s   s p e c i f y   a   y e l l o w i s h   c o l o r   f o r   t h e   f i r s t   l a b e l ,   t h e n   u s e� ��� l     ������  � ` Z `{labelIndex:1, colorName:"yellow"}`. Note that each label must have a unique color name.   � ��� �   ` { l a b e l I n d e x : 1 ,   c o l o r N a m e : " y e l l o w " } ` .   N o t e   t h a t   e a c h   l a b e l   m u s t   h a v e   a   u n i q u e   c o l o r   n a m e .� ��� l     ������  � c ] Available color names: red, orange, yellow, green, cyan, light blue, dark blue, purple, pink   � ��� �   A v a i l a b l e   c o l o r   n a m e s :   r e d ,   o r a n g e ,   y e l l o w ,   g r e e n ,   c y a n ,   l i g h t   b l u e ,   d a r k   b l u e ,   p u r p l e ,   p i n k� ��� j    ����� 
0 label1  � K    �� ������ 0 
labelindex 
labelIndex� m    ���� � ������� 0 	colorname 	colorName� m   	 
�� ���  r e d��  � ��� j    ����� 
0 label2  � K    �� ������ 0 
labelindex 
labelIndex� m    ���� � ������� 0 	colorname 	colorName� m    �� ��� 
 g r e e n��  � ��� j    ����� 
0 label3  � K    �� ������ 0 
labelindex 
labelIndex� m    ���� � ������� 0 	colorname 	colorName� m    �� ���  l i g h t   b l u e��  � ��� j    %����� 
0 label4  � K    $�� ������ 0 
labelindex 
labelIndex� m     ���� � ������� 0 	colorname 	colorName� m   ! "�� ���  y e l l o w��  � ��� j   & /����� 
0 label5  � K   & .   ���� 0 
labelindex 
labelIndex m   ' (����  ������ 0 	colorname 	colorName m   ) , �  o r a n g e��  �  j   0 ;���� 
0 label6   K   0 :		 ��
�� 0 
labelindex 
labelIndex
 m   1 4����  ������ 0 	colorname 	colorName m   5 8 �  d a r k   b l u e��    j   < G���� 
0 label7   K   < F ���� 0 
labelindex 
labelIndex m   = @����  ������ 0 	colorname 	colorName m   A D �  p u r p l e��    l     ��������  ��  ��    l     ����   h b Set to `true` if you want this script to update Markdown records that already exist in DEVONthink    � �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   u p d a t e   M a r k d o w n   r e c o r d s   t h a t   a l r e a d y   e x i s t   i n   D E V O N t h i n k   l     ��!"��  ! j d for PDF annotations from your PDF file(s) and which were created on previous script runs. This will   " �## �   f o r   P D F   a n n o t a t i o n s   f r o m   y o u r   P D F   f i l e ( s )   a n d   w h i c h   w e r e   c r e a t e d   o n   p r e v i o u s   s c r i p t   r u n s .   T h i s   w i l l  $%$ l     ��&'��  & i c be only necessary if you've made changes to the PDF annotations (or their associated notes) within   ' �(( �   b e   o n l y   n e c e s s a r y   i f   y o u ' v e   m a d e   c h a n g e s   t o   t h e   P D F   a n n o t a t i o n s   ( o r   t h e i r   a s s o c i a t e d   n o t e s )   w i t h i n% )*) l     ��+,��  + 9 3 the PDF file after importing them into DEVONthink.   , �-- f   t h e   P D F   f i l e   a f t e r   i m p o r t i n g   t h e m   i n t o   D E V O N t h i n k .* ./. l     ��01��  0   Notes:   1 �22    N o t e s :/ 343 l     ��56��  5 e _ - @warning Note that updating of existing notes may override any additions/changes that you've   6 �77 �   -   @ w a r n i n g   N o t e   t h a t   u p d a t i n g   o f   e x i s t i n g   n o t e s   m a y   o v e r r i d e   a n y   a d d i t i o n s / c h a n g e s   t h a t   y o u ' v e4 898 l     ��:;��  : 7 1    made to these Markdown records in DEVONthink.   ; �<< b         m a d e   t o   t h e s e   M a r k d o w n   r e c o r d s   i n   D E V O N t h i n k .9 =>= l     ��?@��  ? j d - See below properties to specify which attributes shall get updated and which shall be left alone.   @ �AA �   -   S e e   b e l o w   p r o p e r t i e s   t o   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e .> BCB j   H J��D�� *0 updateexistingnotes updateExistingNotesD m   H I��
�� boovfalsC EFE l     ��������  ��  ��  F GHG l     ��IJ��  I c ] When updating existing Markdown records, specify which attributes shall get updated (`true`)   J �KK �   W h e n   u p d a t i n g   e x i s t i n g   M a r k d o w n   r e c o r d s ,   s p e c i f y   w h i c h   a t t r i b u t e s   s h a l l   g e t   u p d a t e d   ( ` t r u e ` )H LML l     ��NO��  N / ) and which shall be left alone (`false`).   O �PP R   a n d   w h i c h   s h a l l   b e   l e f t   a l o n e   ( ` f a l s e ` ) .M QRQ l     ��ST��  S   Notes:   T �UU    N o t e s :R VWV l     ��XY��  X m g - Tags will only be added to any existing list of record tags, so these won't get replaced as a whole.   Y �ZZ �   -   T a g s   w i l l   o n l y   b e   a d d e d   t o   a n y   e x i s t i n g   l i s t   o f   r e c o r d   t a g s ,   s o   t h e s e   w o n ' t   g e t   r e p l a c e d   a s   a   w h o l e .W [\[ l     ��]^��  ] M G    Also, tags won't get removed from the existing list of record tags.   ^ �__ �         A l s o ,   t a g s   w o n ' t   g e t   r e m o v e d   f r o m   t h e   e x i s t i n g   l i s t   o f   r e c o r d   t a g s .\ `a` l     ��bc��  b d ^ - Custom metadata fields will also get added to any existing record metadata, and only fields   c �dd �   -   C u s t o m   m e t a d a t a   f i e l d s   w i l l   a l s o   g e t   a d d e d   t o   a n y   e x i s t i n g   r e c o r d   m e t a d a t a ,   a n d   o n l y   f i e l d sa efe l     ��gh��  g , &    of the same name may get replaced.   h �ii L         o f   t h e   s a m e   n a m e   m a y   g e t   r e p l a c e d .f jkj j   K M��l�� 80 updatenameforexistingnotes updateNameForExistingNotesl m   K L��
�� boovfalsk mnm j   N P��o�� F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNoteso m   N O��
�� boovtruen pqp j   Q S��r�� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotesr m   Q R��
�� boovtrueq sts j   T V��u�� J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotesu m   T U��
�� boovtruet vwv j   W Y��x�� <0 updateratingforexistingnotes updateRatingForExistingNotesx m   W X��
�� boovtruew yzy j   Z \��{�� :0 updatelabelforexistingnotes updateLabelForExistingNotes{ m   Z [��
�� boovtruez |}| j   ] a��~�� 80 updatetagsforexistingnotes updateTagsForExistingNotes~ m   ] ^��
�� boovtrue} � j   b f����� L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes� m   b c��
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � f ` Specify if custom metadata of the DEVONthink groups that host a PDF file's Markdown notes shall   � ��� �   S p e c i f y   i f   c u s t o m   m e t a d a t a   o f   t h e   D E V O N t h i n k   g r o u p s   t h a t   h o s t   a   P D F   f i l e ' s   M a r k d o w n   n o t e s   s h a l l� ��� l     ������  � l f get updated (`true`) or not (`false`). If set to `true`, this script may populate the custom metadata   � ��� �   g e t   u p d a t e d   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   s e t   t o   ` t r u e ` ,   t h i s   s c r i p t   m a y   p o p u l a t e   t h e   c u s t o m   m e t a d a t a� ��� l     ������  � j d properties `sourcefile`, `citekey` & `doi`, as well as any bibliographic metadata that were fetched   � ��� �   p r o p e r t i e s   ` s o u r c e f i l e ` ,   ` c i t e k e y `   &   ` d o i ` ,   a s   w e l l   a s   a n y   b i b l i o g r a p h i c   m e t a d a t a   t h a t   w e r e   f e t c h e d� ��� l     ������  �   for a DOI (see below).   � ��� .   f o r   a   D O I   ( s e e   b e l o w ) .� ��� j   g k����� P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders� m   g h��
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � i c Set to `true` if you want this script to select all records that were actually created or updated.   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   s e l e c t   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   c r e a t e d   o r   u p d a t e d .� ��� j   l p����� ,0 selectupdatedrecords selectUpdatedRecords� m   l m��
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � j d Set to `true` if you want this script to fetch bibliographic metadata for a PDF's DOI via an online   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I   v i a   a n   o n l i n e� ��� l     ������  � V P request to OpenAlex.org (and possibly further requests to CrossRef, see below).   � ��� �   r e q u e s t   t o   O p e n A l e x . o r g   ( a n d   p o s s i b l y   f u r t h e r   r e q u e s t s   t o   C r o s s R e f ,   s e e   b e l o w ) .� ��� l     ������  � o i Note that setting this to `false` will disable all online requests, i.e. this will also prevent fetching   � ��� �   N o t e   t h a t   s e t t i n g   t h i s   t o   ` f a l s e `   w i l l   d i s a b l e   a l l   o n l i n e   r e q u e s t s ,   i . e .   t h i s   w i l l   a l s o   p r e v e n t   f e t c h i n g� ��� l     ������  � l f of BibTeX data & formatted citations even if the respective properties have been set to `true` below.   � ��� �   o f   B i b T e X   d a t a   &   f o r m a t t e d   c i t a t i o n s   e v e n   i f   t h e   r e s p e c t i v e   p r o p e r t i e s   h a v e   b e e n   s e t   t o   ` t r u e `   b e l o w .� ��� j   q u����� $0 fetchdoimetadata fetchDOIMetadata� m   q r��
�� boovtrue� ��� l     ��������  ��  ��  � ��� l     ������  � j d Set to `true` if you want this script to _always_ fetch bibliographic metadata for a PDF's DOI, and   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   _ a l w a y s _   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   a n d� ��� l     ������  � h b not only once for each PDF (when creating the DEVONthink group that hosts the PDF file's Markdown   � ��� �   n o t   o n l y   o n c e   f o r   e a c h   P D F   ( w h e n   c r e a t i n g   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n� ��� l     ������  � o i notes). Usually, you'd want the latter (i.e. `false`). But setting this property (temporarily) to `true`   � ��� �   n o t e s ) .   U s u a l l y ,   y o u ' d   w a n t   t h e   l a t t e r   ( i . e .   ` f a l s e ` ) .   B u t   s e t t i n g   t h i s   p r o p e r t y   ( t e m p o r a r i l y )   t o   ` t r u e `� ��� l     ������  � i c can be useful to add or update bibliographic metadata for existing notes folders & Markdown notes.   � ��� �   c a n   b e   u s e f u l   t o   a d d   o r   u p d a t e   b i b l i o g r a p h i c   m e t a d a t a   f o r   e x i s t i n g   n o t e s   f o l d e r s   &   M a r k d o w n   n o t e s .� ��� j   v z����� 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata� m   v w��
�� boovfals� ��� l     ��������  ��  ��  � ��� l     ������  � e _ When fetching bibliographic metadata for a PDF's DOI, this script can also fetch corresponding   � ��� �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   c o r r e s p o n d i n g� ��� l     ������  � ` Z BibTeX data (which will be copied to a custom ("bibtex") metadata field, and which can be   � ��� �   B i b T e X   d a t a   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " b i b t e x " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n   b e� ��� l     ������  � X R appended to the Finder comment of a created Markdown record as well (see below)).   � ��� �   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .� ��� l     ������  � h b Set to `true` if you also want to fetch BibTeX data for the given DOI from CrossRef.org, else set   � ��� �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   B i b T e X   d a t a   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,   e l s e   s e t� ��� l     ������  � c ] to `false`. Note that this will cause an extra online request which may take a second or so.   � ��� �   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   s e c o n d   o r   s o .� ��� j   { ����� 0 fetchbibtex fetchBibTeX� m   { |�
� boovfals� ��� l     �~�}�|�~  �}  �|  � ��� l     �{���{  � i c Set to `true` if you want this script to append the BibTeX data (that was fetched for a PDF's DOI)   � ��� �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   B i b T e X   d a t a   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s   D O I )� ��� l     �z���z  � < 6 to the Finder comment of the created Markdown record.   � �   l   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .�  j   � ��y�y :0 appendbibtextofindercomment appendBibTeXToFinderComment m   � ��x
�x boovfals  l     �w�v�u�w  �v  �u    l     �t	�t   g a When fetching bibliographic metadata for a PDF's DOI, this script can also fetch a corresponding   	 �

 �   W h e n   f e t c h i n g   b i b l i o g r a p h i c   m e t a d a t a   f o r   a   P D F ' s   D O I ,   t h i s   s c r i p t   c a n   a l s o   f e t c h   a   c o r r e s p o n d i n g  l     �s�s   g a formatted citation (which will be copied to a custom ("reference") metadata field, and which can    � �   f o r m a t t e d   c i t a t i o n   ( w h i c h   w i l l   b e   c o p i e d   t o   a   c u s t o m   ( " r e f e r e n c e " )   m e t a d a t a   f i e l d ,   a n d   w h i c h   c a n  l     �r�r   [ U be appended to the Finder comment of a created Markdown record as well (see below)).    � �   b e   a p p e n d e d   t o   t h e   F i n d e r   c o m m e n t   o f   a   c r e a t e d   M a r k d o w n   r e c o r d   a s   w e l l   ( s e e   b e l o w ) ) .  l     �q�q   h b Set to `true` if you also want to fetch a formatted citation for the given DOI from CrossRef.org,    � �   S e t   t o   ` t r u e `   i f   y o u   a l s o   w a n t   t o   f e t c h   a   f o r m a t t e d   c i t a t i o n   f o r   t h e   g i v e n   D O I   f r o m   C r o s s R e f . o r g ,  l     �p�p   k e else set to `false`. Note that this will cause an extra online request which may take a few seconds.    � �   e l s e   s e t   t o   ` f a l s e ` .   N o t e   t h a t   t h i s   w i l l   c a u s e   a n   e x t r a   o n l i n e   r e q u e s t   w h i c h   m a y   t a k e   a   f e w   s e c o n d s .   j   � ��o!�o 00 fetchformattedcitation fetchFormattedCitation! m   � ��n
�n boovtrue  "#" l     �m�l�k�m  �l  �k  # $%$ l     �j&'�j  & k e Set to `true` if you want this script to append the formatted citation (that was fetched for a PDF's   ' �(( �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a p p e n d   t h e   f o r m a t t e d   c i t a t i o n   ( t h a t   w a s   f e t c h e d   f o r   a   P D F ' s% )*) l     �i+,�i  + A ; DOI) to the Finder comment of the created Markdown record.   , �-- v   D O I )   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   c r e a t e d   M a r k d o w n   r e c o r d .* ./. j   � ��h0�h P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment0 m   � ��g
�g boovtrue/ 121 l     �f�e�d�f  �e  �d  2 343 l     �c56�c  5 f ` The name of the citation style file (as obtained from https://www.zotero.org/styles) to be used   6 �77 �   T h e   n a m e   o f   t h e   c i t a t i o n   s t y l e   f i l e   ( a s   o b t a i n e d   f r o m   h t t p s : / / w w w . z o t e r o . o r g / s t y l e s )   t o   b e   u s e d4 898 l     �b:;�b  : 2 , when generating a formatted citation, e.g.:   ; �<< X   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :9 =>= l     �a?@�a  ? i c apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,   @ �AA �   a p a   ( d e f a u l t ) ,   a p a - 6 t h - e d i t i o n ,   c h i c a g o - a u t h o r - d a t e ,   e l s e v i e r - h a r v a r d ,   s p r i n g e r - b a s i c - a u t h o r - d a t e ,> BCB l     �`DE�`  D 9 3 modern-language-association, vancouver-author-date   E �FF f   m o d e r n - l a n g u a g e - a s s o c i a t i o n ,   v a n c o u v e r - a u t h o r - d a t eC GHG j   � ��_I�_ &0 citationstylename citationStyleNameI m   � �JJ �KK  a p aH LML l     �^�]�\�^  �]  �\  M NON l     �[PQ�[  P i c The locale code that specifies which localization data (term translations, localized date formats,   Q �RR �   T h e   l o c a l e   c o d e   t h a t   s p e c i f i e s   w h i c h   l o c a l i z a t i o n   d a t a   ( t e r m   t r a n s l a t i o n s ,   l o c a l i z e d   d a t e   f o r m a t s ,O STS l     �ZUV�Z  U U O and grammar options) shall be used when generating a formatted citation, e.g.:   V �WW �   a n d   g r a m m a r   o p t i o n s )   s h a l l   b e   u s e d   w h e n   g e n e r a t i n g   a   f o r m a t t e d   c i t a t i o n ,   e . g . :T XYX l     �YZ[�Y  Z @ : en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN   [ �\\ t   e n - U S   ( d e f a u l t ) ,   e n - G B ,   f r - F R ,   e s - E S ,   d e - D E ,   r u - R U ,   z h - C NY ]^] j   � ��X_�X  0 citationlocale citationLocale_ m   � �`` �aa 
 e n - U S^ bcb l     �W�V�U�W  �V  �U  c ded l     �T�S�R�T  �S  �R  e fgf l     �Qhi�Q  h W Q ----------- usually, you don't need to edit anything below this line -----------   i �jj �   - - - - - - - - - - -   u s u a l l y ,   y o u   d o n ' t   n e e d   t o   e d i t   a n y t h i n g   b e l o w   t h i s   l i n e   - - - - - - - - - - -g klk l     �P�O�N�P  �O  �N  l mnm l     �M�L�K�M  �L  �K  n opo l     �Jqr�J  q Z T Decimal numbers that specify how much the bounding box encompassing an annotation's   r �ss �   D e c i m a l   n u m b e r s   t h a t   s p e c i f y   h o w   m u c h   t h e   b o u n d i n g   b o x   e n c o m p a s s i n g   a n   a n n o t a t i o n ' sp tut l     �Ivw�I  v c ] individual line shall be enlarged vertically & horizontally so that it fully covers all text   w �xx �   i n d i v i d u a l   l i n e   s h a l l   b e   e n l a r g e d   v e r t i c a l l y   &   h o r i z o n t a l l y   s o   t h a t   i t   f u l l y   c o v e r s   a l l   t e x tu yzy l     �H{|�H  {    highlighted on that line.   | �}} 4   h i g h l i g h t e d   o n   t h a t   l i n e .z ~~ l     �G���G  � e _ If you find that this script somehow fails to fully extract all of an annotation's text (or if   � ��� �   I f   y o u   f i n d   t h a t   t h i s   s c r i p t   s o m e h o w   f a i l s   t o   f u l l y   e x t r a c t   a l l   o f   a n   a n n o t a t i o n ' s   t e x t   ( o r   i f ��� l     �F���F  � [ U it extracts too much) then you may want to adjust these decimal numbers (e.g. by 0.1   � ��� �   i t   e x t r a c t s   t o o   m u c h )   t h e n   y o u   m a y   w a n t   t o   a d j u s t   t h e s e   d e c i m a l   n u m b e r s   ( e . g .   b y   0 . 1� ��� l     �E���E  �   increments).   � ���    i n c r e m e n t s ) .� ��� l     �D���D  � a [ However, note that larger values will increase the likeliness that adjacent characters not   � ��� �   H o w e v e r ,   n o t e   t h a t   l a r g e r   v a l u e s   w i l l   i n c r e a s e   t h e   l i k e l i n e s s   t h a t   a d j a c e n t   c h a r a c t e r s   n o t� ��� l     �C���C  � = 7 belonging to the annotation will get included as well.   � ��� n   b e l o n g i n g   t o   t h e   a n n o t a t i o n   w i l l   g e t   i n c l u d e d   a s   w e l l .� ��� j   � ��B��B ,0 linewidthenlargement lineWidthEnlargement� m   � ��� ?�ffffff� ��� j   � ��A��A .0 lineheightenlargement lineHeightEnlargement� m   � ��� ?�333333� ��� l     �@�?�>�@  �?  �>  � ��� l     �=���=  � c ] Defines lower and upper hue limits for common colors. Limit values are inclusive and must be   � ��� �   D e f i n e s   l o w e r   a n d   u p p e r   h u e   l i m i t s   f o r   c o m m o n   c o l o r s .   L i m i t   v a l u e s   a r e   i n c l u s i v e   a n d   m u s t   b e� ��� l     �<���<  � a [ given as degrees (0-359) of the hue in the HSB (hue, saturation, brightness) color scheme.   � ��� �   g i v e n   a s   d e g r e e s   ( 0 - 3 5 9 )   o f   t h e   h u e   i n   t h e   H S B   ( h u e ,   s a t u r a t i o n ,   b r i g h t n e s s )   c o l o r   s c h e m e .� ��� j   � ��;��; "0 redcolormapping redColorMapping� K   � ��� �:���: 0 	colorname 	colorName� m   � ��� ���  r e d� �9���9 0 lowerhuelimit lowerHueLimit� m   � ��8�8^� �7��6�7 0 upperhuelimit upperHueLimit� m   � ��5�5 �6  � ��� j   � ��4��4 (0 orangecolormapping orangeColorMapping� K   � ��� �3���3 0 	colorname 	colorName� m   � ��� ���  o r a n g e� �2���2 0 lowerhuelimit lowerHueLimit� m   � ��1�1 � �0��/�0 0 upperhuelimit upperHueLimit� m   � ��.�. ,�/  � ��� j   � ��-��- (0 yellowcolormapping yellowColorMapping� K   � ��� �,���, 0 	colorname 	colorName� m   � ��� ���  y e l l o w� �+���+ 0 lowerhuelimit lowerHueLimit� m   � ��*�* -� �)��(�) 0 upperhuelimit upperHueLimit� m   � ��'�' A�(  � ��� j   �
�&��& &0 greencolormapping greenColorMapping� K   ��� �%���% 0 	colorname 	colorName� m   � ��� ��� 
 g r e e n� �$���$ 0 lowerhuelimit lowerHueLimit� m   � ��#�# B� �"��!�" 0 upperhuelimit upperHueLimit� m   � �  ��!  � ��� j  "��� $0 cyancolormapping cyanColorMapping� K  �� ���� 0 	colorname 	colorName� m  �� ���  c y a n� ���� 0 lowerhuelimit lowerHueLimit� m  �� �� ���� 0 upperhuelimit upperHueLimit� m  �� ��  � ��� j  #:��� .0 lightbluecolormapping lightBlueColorMapping� K  #7�� ���� 0 	colorname 	colorName� m  $'�� ���  l i g h t   b l u e� ���� 0 lowerhuelimit lowerHueLimit� m  *-�� �� ���� 0 upperhuelimit upperHueLimit� m  03�� ��  � ��� j  ;R��� ,0 darkbluecolormapping darkBlueColorMapping� K  ;O�� ���� 0 	colorname 	colorName� m  <?�� ���  d a r k   b l u e� ���� 0 lowerhuelimit lowerHueLimit� m  BE�� �� ���� 0 upperhuelimit upperHueLimit� m  HK�� ��  � ��� j  Sj�
��
 (0 purplecolormapping purpleColorMapping� K  Sg�� �	���	 0 	colorname 	colorName� m  TW�� ���  p u r p l e� � � 0 lowerhuelimit lowerHueLimit  m  Z]�� � ��� 0 upperhuelimit upperHueLimit m  `c��D�  �  j  k��� $0 pinkcolormapping pinkColorMapping K  k �� 0 	colorname 	colorName m  lo		 �

  p i n k �� 0 lowerhuelimit lowerHueLimit m  ru� � E ������ 0 upperhuelimit upperHueLimit m  x{����]��    l     ��������  ��  ��    j  ������ 0 colormappings colorMappings J  ��  o  ������ "0 redcolormapping redColorMapping  o  ������ (0 orangecolormapping orangeColorMapping  o  ������ (0 yellowcolormapping yellowColorMapping  o  ������ &0 greencolormapping greenColorMapping  o  ������ $0 cyancolormapping cyanColorMapping  o  ������ .0 lightbluecolormapping lightBlueColorMapping  !  o  ������ ,0 darkbluecolormapping darkBlueColorMapping! "#" o  ������ (0 purplecolormapping purpleColorMapping# $��$ o  ������ $0 pinkcolormapping pinkColorMapping��   %&% l     ��������  ��  ��  & '(' j  ����)�� 0 labelmappings labelMappings) J  ��** +,+ o  ������ 
0 label1  , -.- o  ������ 
0 label2  . /0/ o  ������ 
0 label3  0 121 o  ������ 
0 label4  2 343 o  ������ 
0 label5  4 565 o  ������ 
0 label6  6 7��7 o  ������ 
0 label7  ��  ( 898 l     ��������  ��  ��  9 :;: l     ��<=��  < e _ Set to `true` if you want this script to associate annotations to text columns in multi-column   = �>> �   S e t   t o   ` t r u e `   i f   y o u   w a n t   t h i s   s c r i p t   t o   a s s o c i a t e   a n n o t a t i o n s   t o   t e x t   c o l u m n s   i n   m u l t i - c o l u m n; ?@? l     ��AB��  A 4 . PDF layouts when generating sort identifiers.   B �CC \   P D F   l a y o u t s   w h e n   g e n e r a t i n g   s o r t   i d e n t i f i e r s .@ DED l     ��FG��  F b \ Sort identifiers will be placed in an `annotationorder` metadata field which can be used in   G �HH �   S o r t   i d e n t i f i e r s   w i l l   b e   p l a c e d   i n   a n   ` a n n o t a t i o n o r d e r `   m e t a d a t a   f i e l d   w h i c h   c a n   b e   u s e d   i nE IJI l     ��KL��  K d ^ DEVONthink for sorting so that annotations can be listed in the order they appear in the text   L �MM �   D E V O N t h i n k   f o r   s o r t i n g   s o   t h a t   a n n o t a t i o n s   c a n   b e   l i s t e d   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   t e x tJ NON l     ��PQ��  P ? 9 of a page (optionally respecting a multi-column layout).   Q �RR r   o f   a   p a g e   ( o p t i o n a l l y   r e s p e c t i n g   a   m u l t i - c o l u m n   l a y o u t ) .O STS l     ��UV��  U V P Sort identifier format: `<PAGE>-<COLUMN>-<POSITION_FROM_TOP>` (e.g. "2-1-207").   V �WW �   S o r t   i d e n t i f i e r   f o r m a t :   ` < P A G E > - < C O L U M N > - < P O S I T I O N _ F R O M _ T O P > `   ( e . g .   " 2 - 1 - 2 0 7 " ) .T XYX l     ��Z[��  Z I C If this property is set to `false`, `<COLUMN>` will be always "1".   [ �\\ �   I f   t h i s   p r o p e r t y   i s   s e t   t o   ` f a l s e ` ,   ` < C O L U M N > `   w i l l   b e   a l w a y s   " 1 " .Y ]^] l     ��_`��  _ ^ X Note that, depending on the layout of the PDF page and the specific annotation's width,   ` �aa �   N o t e   t h a t ,   d e p e n d i n g   o n   t h e   l a y o u t   o f   t h e   P D F   p a g e   a n d   t h e   s p e c i f i c   a n n o t a t i o n ' s   w i d t h ,^ bcb l     ��de��  d F @ correctly guessing the annotation's text column may still fail.   e �ff �   c o r r e c t l y   g u e s s i n g   t h e   a n n o t a t i o n ' s   t e x t   c o l u m n   m a y   s t i l l   f a i l .c ghg j  ����i�� <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayoutsi m  ����
�� boovtrueh jkj l     ��������  ��  ��  k lml l     ��no��  n \ V The number of text columns supported by this script when generating sort identifiers.   o �pp �   T h e   n u m b e r   o f   t e x t   c o l u m n s   s u p p o r t e d   b y   t h i s   s c r i p t   w h e n   g e n e r a t i n g   s o r t   i d e n t i f i e r s .m qrq l     ��st��  s e _ If you're often dealing with PDF text layouts that have more than the specified number of text   t �uu �   I f   y o u ' r e   o f t e n   d e a l i n g   w i t h   P D F   t e x t   l a y o u t s   t h a t   h a v e   m o r e   t h a n   t h e   s p e c i f i e d   n u m b e r   o f   t e x tr vwv l     ��xy��  x ` Z columns then you may want to adjust this integer number. However, note that larger values   y �zz �   c o l u m n s   t h e n   y o u   m a y   w a n t   t o   a d j u s t   t h i s   i n t e g e r   n u m b e r .   H o w e v e r ,   n o t e   t h a t   l a r g e r   v a l u e sw {|{ l     ��}~��  } ] W will increase the likeliness that short annotations or annotations from document parts   ~ � �   w i l l   i n c r e a s e   t h e   l i k e l i n e s s   t h a t   s h o r t   a n n o t a t i o n s   o r   a n n o t a t i o n s   f r o m   d o c u m e n t   p a r t s| ��� l     ������  � J D spanning multiple columns (like the abstract) won't sort correctly.   � ��� �   s p a n n i n g   m u l t i p l e   c o l u m n s   ( l i k e   t h e   a b s t r a c t )   w o n ' t   s o r t   c o r r e c t l y .� ��� j  �������  0 maxtextcolumns maxTextColumns� m  ������ � ��� l     ��������  ��  ��  � ��� l     ������  � c ] Approximate average width of the (left or right) white space between text & page origin/end.   � ��� �   A p p r o x i m a t e   a v e r a g e   w i d t h   o f   t h e   ( l e f t   o r   r i g h t )   w h i t e   s p a c e   b e t w e e n   t e x t   &   p a g e   o r i g i n / e n d .� ��� l     ������  � g a Note that this is just a wild guess for the average margin of a PDF page as properly calculating   � ��� �   N o t e   t h a t   t h i s   i s   j u s t   a   w i l d   g u e s s   f o r   t h e   a v e r a g e   m a r g i n   o f   a   P D F   p a g e   a s   p r o p e r l y   c a l c u l a t i n g� ��� l     ������  � b \ margins isn't straightforward. However, specifying some value for an average margin usually   � ��� �   m a r g i n s   i s n ' t   s t r a i g h t f o r w a r d .   H o w e v e r ,   s p e c i f y i n g   s o m e   v a l u e   f o r   a n   a v e r a g e   m a r g i n   u s u a l l y� ��� l     ������  � ^ X helps when trying to associate annotations to text columns in multi-column PDF layouts.   � ��� �   h e l p s   w h e n   t r y i n g   t o   a s s o c i a t e   a n n o t a t i o n s   t o   t e x t   c o l u m n s   i n   m u l t i - c o l u m n   P D F   l a y o u t s .� ��� j  ������� 0 
pagemargin 
pageMargin� m  ������ � ��� l     ��������  ��  ��  � ��� j  ������� &0 creatednotescount createdNotesCount� m  ������  � ��� j  ������� &0 updatednotescount updatedNotesCount� m  ������  � ��� j  ������� 0 pdfcount pdfCount� m  ������  � ��� l     ��������  ��  ��  � ��� l     ������  � d ^ The "KeypointsScriptingLib.scptd" scripting library provides utility methods for this script.   � ��� �   T h e   " K e y p o i n t s S c r i p t i n g L i b . s c p t d "   s c r i p t i n g   l i b r a r y   p r o v i d e s   u t i l i t y   m e t h o d s   f o r   t h i s   s c r i p t .� ��� l     ������  � d ^ It can be made available to this script by copying it into a "Script Libraries" folder inside   � ��� �   I t   c a n   b e   m a d e   a v a i l a b l e   t o   t h i s   s c r i p t   b y   c o p y i n g   i t   i n t o   a   " S c r i p t   L i b r a r i e s "   f o l d e r   i n s i d e� ��� l     ������  � ; 5 the "Library" folder that's within your Home folder.   � ��� j   t h e   " L i b r a r y "   f o l d e r   t h a t ' s   w i t h i n   y o u r   H o m e   f o l d e r .� ��� l     ������  � i c see https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / e x t r a c t s / m a c - s c r i p t i n g / t r e e / m a s t e r / S c r i p t i n g L i b r a r i e s / K e y p o i n t s S c r i p t i n g L i b� ��� l     ���� x  ��������� 0 keypointslib KeypointsLib� 4  �����
�� 
scpt� m  ���� ��� * K e y p o i n t s S c r i p t i n g L i b��  �   v1.5 or greater required   � ��� 2   v 1 . 5   o r   g r e a t e r   r e q u i r e d� ��� l     ��������  ��  ��  � ��� l     ������  � d ^ NOTE: In order to allow this script to be executed by a DEVONthink smart rule (which requires   � ��� �   N O T E :   I n   o r d e r   t o   a l l o w   t h i s   s c r i p t   t o   b e   e x e c u t e d   b y   a   D E V O N t h i n k   s m a r t   r u l e   ( w h i c h   r e q u i r e s� ��� l     ������  � j d pure AppleScript code), all AppleScriptObjC code has to be run from the included scripting library,   � ��� �   p u r e   A p p l e S c r i p t   c o d e ) ,   a l l   A p p l e S c r i p t O b j C   c o d e   h a s   t o   b e   r u n   f r o m   t h e   i n c l u d e d   s c r i p t i n g   l i b r a r y ,� ��� l     ������  � a [ and use statements such as `use framework "Foundation"` and `use scripting additions` must   � ��� �   a n d   u s e   s t a t e m e n t s   s u c h   a s   ` u s e   f r a m e w o r k   " F o u n d a t i o n " `   a n d   ` u s e   s c r i p t i n g   a d d i t i o n s `   m u s t� ��� l     ������  � 2 , not be used. For a workaround to this, see:   � ��� X   n o t   b e   u s e d .   F o r   a   w o r k a r o u n d   t o   t h i s ,   s e e :� ��� l     ������  � � � https://discourse.devontechnologies.com/t/solution-to-the-problem-of-using-the-applescript-foundation-framework-in-smart-rules/78575   � ���
   h t t p s : / / d i s c o u r s e . d e v o n t e c h n o l o g i e s . c o m / t / s o l u t i o n - t o - t h e - p r o b l e m - o f - u s i n g - t h e - a p p l e s c r i p t - f o u n d a t i o n - f r a m e w o r k - i n - s m a r t - r u l e s / 7 8 5 7 5� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � Y S This method gets triggered when executing this script via a DEVONthink smart rule.   � ��� �   T h i s   m e t h o d   g e t s   t r i g g e r e d   w h e n   e x e c u t i n g   t h i s   s c r i p t   v i a   a   D E V O N t h i n k   s m a r t   r u l e .� ��� l     ������  � N H @param theRecords List of records as defined by the calling smart rule.   � ��� �   @ p a r a m   t h e R e c o r d s   L i s t   o f   r e c o r d s   a s   d e f i n e d   b y   t h e   c a l l i n g   s m a r t   r u l e .� ��� i  ����� I      ������� $0 performsmartrule performSmartRule� ���� o      ���� 0 
therecords 
theRecords��  ��  � k     G�� ��� r     ��� n       I    ������ L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations �� o    ���� 0 
therecords 
theRecords��  ��    f     � o      ���� 0 annotatedpdfs annotatedPDFs�  l  	 	��������  ��  ��    Z   	 	���� >  	 

 o   	 
���� 0 annotatedpdfs annotatedPDFs J   
 ����  	 r     n    I    ������ 0 processpdfs processPDFs �� o    ���� 0 annotatedpdfs annotatedPDFs��  ��    f     o      ����  0 updatedrecords updatedRecords��  ��    l   ��������  ��  ��    l   ����   ^ X display feedback (number of PDFs processed and notes created/updated) as a notification    � �   d i s p l a y   f e e d b a c k   ( n u m b e r   o f   P D F s   p r o c e s s e d   a n d   n o t e s   c r e a t e d / u p d a t e d )   a s   a   n o t i f i c a t i o n  r    : b    8 b    2  b    0!"! b    .#$# b    (%&% b    &'(' b    $)*) m    ++ �,,   P r o c e s s e d   P D F s :  * o    #���� 0 pdfcount pdfCount( 1   $ %��
�� 
lnfd& m   & '-- �..  C r e a t e d   n o t e s :  $ o   ( -���� &0 creatednotescount createdNotesCount" m   . /// �00 
     |      m   0 111 �22  U p d a t e d   n o t e s :   o   2 7���� &0 updatednotescount updatedNotesCount o      ���� &0 completiondetails completionDetails 3��3 n  ; G454 I   @ G�6�~� *0 displaynotification displayNotification6 787 o   @ A�}�} &0 completiondetails completionDetails8 9:9 m   A B;; �<< D F i n i s h e d   I m p o r t   o f   P D F   A n n o t a t i o n s: =�|= m   B C>> �??  �|  �~  5 o   ; @�{�{ 0 keypointslib KeypointsLib��  � @A@ l     �z�y�x�z  �y  �x  A BCB l     �w�v�u�w  �v  �u  C DED l     �tFG�t  F _ Y This method gets triggered when executing this script manually. It will process all PDFs   G �HH �   T h i s   m e t h o d   g e t s   t r i g g e r e d   w h e n   e x e c u t i n g   t h i s   s c r i p t   m a n u a l l y .   I t   w i l l   p r o c e s s   a l l   P D F sE IJI l     �sKL�s  K a [ that are currently selected in DEVONthink. If there's currently no selection in DEVONthink   L �MM �   t h a t   a r e   c u r r e n t l y   s e l e c t e d   i n   D E V O N t h i n k .   I f   t h e r e ' s   c u r r e n t l y   n o   s e l e c t i o n   i n   D E V O N t h i n kJ NON l     �rPQ�r  P ^ X (or if the selection contains no PDFs with PDF annotations) presents an error alert and   Q �RR �   ( o r   i f   t h e   s e l e c t i o n   c o n t a i n s   n o   P D F s   w i t h   P D F   a n n o t a t i o n s )   p r e s e n t s   a n   e r r o r   a l e r t   a n dO STS l     �qUV�q  U   aborts the script.   V �WW &   a b o r t s   t h e   s c r i p t .T XYX i  ��Z[Z I     �p�o�n
�p .aevtoappnull  �   � ****�o  �n  [ k     �\\ ]^] l     �m_`�m  _ 9 3 DEVONthink must be running for this script to work   ` �aa f   D E V O N t h i n k   m u s t   b e   r u n n i n g   f o r   t h i s   s c r i p t   t o   w o r k^ bcb Z    de�l�kd H     ff n    ghg I    �j�i�h�j $0 checkappsrunning checkAppsRunning�i  �h  h  f     e L   	 �g�g  �l  �k  c iji l   �f�e�d�f  �e  �d  j klk l   �cmn�c  m J D only deal with currently selected PDFs that contain PDF annotations   n �oo �   o n l y   d e a l   w i t h   c u r r e n t l y   s e l e c t e d   P D F s   t h a t   c o n t a i n   P D F   a n n o t a t i o n sl pqp O    Brsr k    Att uvu r    wxw l   y�b�ay c    z{z 1    �`
�` 
DTsl{ m    �_
�_ 
list�b  �a  x o      �^�^ 0 
selrecords 
selRecordsv |}| r     (~~ n    &��� I   ! &�]��\�] L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations� ��[� o   ! "�Z�Z 0 
selrecords 
selRecords�[  �\  �  f     ! o      �Y�Y 0 annotatedpdfs annotatedPDFs} ��� l  ) )�X�W�V�X  �W  �V  � ��U� Z  ) A���T�S� =  ) -��� o   ) *�R�R 0 annotatedpdfs annotatedPDFs� J   * ,�Q�Q  � n  0 =��� I   5 =�P��O�P 0 displayerror displayError� ��� m   5 6�� ��� P N o   P D F ( s )   w i t h   P D F   a n n o t a t i o n s   s e l e c t e d !� ��� m   6 7�� ��� � P l e a s e   o p e n   D E V O N t h i n k   a n d   s e l e c t   s o m e   P D F ( s )   w i t h   P D F   a n n o t a t i o n s .� ��� m   7 8�N�N � ��M� m   8 9�L
�L boovtrue�M  �O  � o   0 5�K�K 0 keypointslib KeypointsLib�T  �S  �U  s 5    �J��I
�J 
capp� m    �� ���  D N t p
�I kfrmID  q ��� l  C C�H�G�F�H  �G  �F  � ��� r   C K��� n  C I��� I   D I�E��D�E 0 processpdfs processPDFs� ��C� o   D E�B�B 0 annotatedpdfs annotatedPDFs�C  �D  �  f   C D� o      �A�A  0 updatedrecords updatedRecords� ��� l  L L�@�?�>�@  �?  �>  � ��� l  L L�=���=  � 2 , select records that were created or updated   � ��� X   s e l e c t   r e c o r d s   t h a t   w e r e   c r e a t e d   o r   u p d a t e d� ��� Z   L ����<�;� F   L ^��� =  L S��� o   L Q�:�: ,0 selectupdatedrecords selectUpdatedRecords� m   Q R�9
�9 boovtrue� >  V Z��� o   V W�8�8  0 updatedrecords updatedRecords� J   W Y�7�7  � O   a ~��� k   k }�� ��� r   k u��� 4   k q�6�
�6 
brws� m   o p�5�5 � o      �4�4 0 frontwindow frontWindow� ��3� r   v }��� o   v w�2�2  0 updatedrecords updatedRecords� n      ��� 1   z |�1
�1 
DTsl� o   w z�0�0 0 frontwindow frontWindow�3  � 5   a h�/��.
�/ 
capp� m   c f�� ���  D N t p
�. kfrmID  �<  �;  � ��� l  � ��-�,�+�-  �,  �+  � ��� l  � ��*���*  � Z T display a dialog with feedback (number of PDFs processed and notes created/updated)   � ��� �   d i s p l a y   a   d i a l o g   w i t h   f e e d b a c k   ( n u m b e r   o f   P D F s   p r o c e s s e d   a n d   n o t e s   c r e a t e d / u p d a t e d )� ��)� O   � ���� k   � ��� ��� I  � ��(�'�&
�( .miscactvnull��� ��� null�'  �&  � ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ���   P r o c e s s e d   P D F s :  � o   � ��%�% 0 pdfcount pdfCount� 1   � ��$
�$ 
lnfd� m   � ��� ���  C r e a t e d   n o t e s :  � o   � ��#�# &0 creatednotescount createdNotesCount� 1   � ��"
�" 
lnfd� m   � ��� ���  U p d a t e d   n o t e s :  � o   � ��!�! &0 updatednotescount updatedNotesCount� o      � �  &0 completiondetails completionDetails� ��� n  � ���� I   � �����  0 displaymessage displayMessage� ��� m   � ��� ��� D F i n i s h e d   I m p o r t   o f   P D F   A n n o t a t i o n s� ��� o   � ��� &0 completiondetails completionDetails� ��� m   � ��
� boovfals� ��� m   � ���  �  �  � o   � ��� 0 keypointslib KeypointsLib�  � 5   � ����
� 
capp� m   � ��� ���  D N t p
� kfrmID  �)  Y ��� l     ����  �  �  � ��� l     ����  �  �  �    l     ��   X R Main method which iterates over the given PDF records and processes any contained    � �   M a i n   m e t h o d   w h i c h   i t e r a t e s   o v e r   t h e   g i v e n   P D F   r e c o r d s   a n d   p r o c e s s e s   a n y   c o n t a i n e d  l     ��     PDF annotations.    �		 "   P D F   a n n o t a t i o n s . 

 l     ��   ` Z Returns a list with all records that were actually updated. I.e., if a PDF annotation did    � �   R e t u r n s   a   l i s t   w i t h   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   u p d a t e d .   I . e . ,   i f   a   P D F   a n n o t a t i o n   d i d  l     ��   V P already have a corresponding Markdown record in DEVONthink which wasn't updated    � �   a l r e a d y   h a v e   a   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d   i n   D E V O N t h i n k   w h i c h   w a s n ' t   u p d a t e d  l     ��   ^ X (since its text content & properties were already up-to-date), it won't get included in    � �   ( s i n c e   i t s   t e x t   c o n t e n t   &   p r o p e r t i e s   w e r e   a l r e a d y   u p - t o - d a t e ) ,   i t   w o n ' t   g e t   i n c l u d e d   i n  l     �
�
     the returned list.    � &   t h e   r e t u r n e d   l i s t .  l     �	 !�	    L F @param pdfRecords The DEVONthink PDF records that shall be processed.   ! �"" �   @ p a r a m   p d f R e c o r d s   T h e   D E V O N t h i n k   P D F   r e c o r d s   t h a t   s h a l l   b e   p r o c e s s e d . #$# i  � %&% I      �'�� 0 processpdfs processPDFs' (�( o      �� 0 
pdfrecords 
pdfRecords�  �  & k     �)) *+* n    
,-, I    
�.�� 0 setupprogress setupProgress. /�/ m    00 �11 V C r e a t i n g   M a r k d o w n   n o t e s   f o r   P D F   a n n o t a t i o n s�  �  - o     �� 0 keypointslib KeypointsLib+ 232 l   � �����   ��  ��  3 454 l   ��67��  6 $  initialize progress reporting   7 �88 <   i n i t i a l i z e   p r o g r e s s   r e p o r t i n g5 9:9 r    ;<; m    ����  < o      ���� &0 creatednotescount createdNotesCount: =>= r    ?@? m    ����  @ o      ���� &0 updatednotescount updatedNotesCount> ABA r    &CDC I    ��E��
�� .corecnte****       ****E o    ���� 0 
pdfrecords 
pdfRecords��  D o      ���� 0 pdfcount pdfCountB FGF n  ' 5HIH I   , 5��J���� 40 settotalstepsforprogress setTotalStepsForProgressJ K��K o   , 1���� 0 pdfcount pdfCount��  ��  I o   ' ,���� 0 keypointslib KeypointsLibG LML l  6 6��������  ��  ��  M NON l  6 6��PQ��  P + % process PDF annotations for each PDF   Q �RR J   p r o c e s s   P D F   a n n o t a t i o n s   f o r   e a c h   P D FO STS r   6 :UVU J   6 8����  V o      ���� &0 allupdatedrecords allUpdatedRecordsT WXW Y   ; �Y��Z[��Y k   I �\\ ]^] r   I O_`_ n   I Maba 4   J M��c
�� 
cobjc o   K L���� 0 i  b o   I J���� 0 
pdfrecords 
pdfRecords` o      ���� 0 	pdfrecord 	pdfRecord^ ded O  P ^fgf r   X ]hih n   X [jkj 1   Y [��
�� 
DTfnk o   X Y���� 0 	pdfrecord 	pdfRecordi o      ���� 0 pdffilename pdfFilenameg 5   P U��l��
�� 
cappl m   R Smm �nn  D N t p
�� kfrmID  e opo n  _ zqrq I   d z��s����  0 updateprogress updateProgresss tut o   d e���� 0 i  u v��v b   e vwxw b   e tyzy b   e r{|{ b   e p}~} b   e j� b   e h��� m   e f�� ���  P r o c e s s i n g   P D F  � o   f g���� 0 i  � m   h i�� ���    o f  ~ o   j o���� 0 pdfcount pdfCount| m   p q�� ���    ( "z o   r s���� 0 pdffilename pdfFilenamex m   t u�� ���  " ) .��  ��  r o   _ d���� 0 keypointslib KeypointsLibp ��� r   { ���� n  { ���� I   | �������� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF� ���� o   | }���� 0 	pdfrecord 	pdfRecord��  ��  �  f   { |� o      ����  0 updatedrecords updatedRecords� ���� Z  � �������� >  � ���� o   � �����  0 updatedrecords updatedRecords� J   � �����  � s   � ���� o   � �����  0 updatedrecords updatedRecords� n      ���  ;   � �� o   � ����� &0 allupdatedrecords allUpdatedRecords��  ��  ��  �� 0 i  Z m   > ?���� [ o   ? D���� 0 pdfcount pdfCount��  X ��� l  � ���������  ��  ��  � ���� L   � ��� n  � ���� I   � �������� 0 flattenlist flattenList� ���� o   � ����� &0 allupdatedrecords allUpdatedRecords��  ��  � o   � ����� 0 keypointslib KeypointsLib��  $ ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � + % Checks if DEVONthink Pro is running.   � ��� J   C h e c k s   i f   D E V O N t h i n k   P r o   i s   r u n n i n g .� ��� l     ������  � 6 0 Credits: modified after script code by Rob Trew   � ��� `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     ������  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i  ��� I      �������� $0 checkappsrunning checkAppsRunning��  ��  � k     5�� ��� O     2��� l   1���� Z    1������� A    ��� l   ������ I   �����
�� .corecnte****       ****� l   ������ 6  ��� 2   ��
�� 
prcs� =    ��� 1    ��
�� 
fcrt� m    �� ���  D N t p��  ��  ��  ��  ��  � m    ���� � k    -�� ��� n   *��� I   " *������� 0 displayerror displayError� ��� m   " #�� ��� 6 D E V O N t h i n k   P r o   n o t   r u n n i n g !� ��� m   # $�� ��� � P l e a s e   o p e n   D E V O N t h i n k   P r o   a n d   s e l e c t   s o m e   P D F ( s ) ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .� ��� m   $ %���� � ���� m   % &��
�� boovtrue��  ��  � o    "���� 0 keypointslib KeypointsLib� ���� L   + -�� m   + ,��
�� boovfals��  ��  ��  � "  application "System Events"   � ��� 8   a p p l i c a t i o n   " S y s t e m   E v e n t s "� 5     �����
�� 
capp� m    �� ���  s e v s
�� kfrmID  � ���� L   3 5�� m   3 4��
�� boovtrue��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � R L Returns all PDF records from the given DEVONthink records that contain some   � ��� �   R e t u r n s   a l l   P D F   r e c o r d s   f r o m   t h e   g i v e n   D E V O N t h i n k   r e c o r d s   t h a t   c o n t a i n   s o m e� ��� l     ������  �   PDF annotations.   � ��� "   P D F   a n n o t a t i o n s .� ��� l     ������  � H B @param theRecords The DEVONthink records that shall be processed.   � ��� �   @ p a r a m   t h e R e c o r d s   T h e   D E V O N t h i n k   r e c o r d s   t h a t   s h a l l   b e   p r o c e s s e d .� ��� i  ��� I      �� ���� L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations  �� o      ���� 0 
therecords 
theRecords��  ��  � k     @  r      J     ����   o      ���� 0 annotatedpdfs annotatedPDFs  l   ��������  ��  ��   	
	 O    = X    <�� Z    7���� F    , l   "���� =   " n      1     ��
�� 
DTty o    ���� 0 	therecord 	theRecord m     !��
�� OCRdpdf ��  ��   l  % *���� ?   % * n   % ( 1   & (��
�� 
DTna o   % &�� 0 	therecord 	theRecord m   ( )�~�~  ��  ��   s   / 3 o   / 0�}�} 0 	therecord 	theRecord n         ;   1 2  o   0 1�|�| 0 annotatedpdfs annotatedPDFs��  ��  �� 0 	therecord 	theRecord o    �{�{ 0 
therecords 
theRecords 5    
�z!�y
�z 
capp! m    "" �##  D N t p
�y kfrmID  
 $%$ l  > >�x�w�v�x  �w  �v  % &�u& L   > @'' o   > ?�t�t 0 annotatedpdfs annotatedPDFs�u  � ()( l     �s�r�q�s  �r  �q  ) *+* l     �p�o�n�p  �o  �n  + ,-, l     �m./�m  . W Q Iterates over the given PDF's contained PDF annotations and creates a DEVONthink   / �00 �   I t e r a t e s   o v e r   t h e   g i v e n   P D F ' s   c o n t a i n e d   P D F   a n n o t a t i o n s   a n d   c r e a t e s   a   D E V O N t h i n k- 121 l     �l34�l  3 V P record for each markup, text or free text annotation (if it doesn't exist yet).   4 �55 �   r e c o r d   f o r   e a c h   m a r k u p ,   t e x t   o r   f r e e   t e x t   a n n o t a t i o n   ( i f   i t   d o e s n ' t   e x i s t   y e t ) .2 676 l     �k89�k  8 ` Z Returns a list with all records that were actually updated. I.e., if a PDF annotation did   9 �:: �   R e t u r n s   a   l i s t   w i t h   a l l   r e c o r d s   t h a t   w e r e   a c t u a l l y   u p d a t e d .   I . e . ,   i f   a   P D F   a n n o t a t i o n   d i d7 ;<; l     �j=>�j  = V P already have a corresponding Markdown record in DEVONthink which wasn't updated   > �?? �   a l r e a d y   h a v e   a   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d   i n   D E V O N t h i n k   w h i c h   w a s n ' t   u p d a t e d< @A@ l     �iBC�i  B ^ X (since its text content & properties were already up-to-date), it won't get included in   C �DD �   ( s i n c e   i t s   t e x t   c o n t e n t   &   p r o p e r t i e s   w e r e   a l r e a d y   u p - t o - d a t e ) ,   i t   w o n ' t   g e t   i n c l u d e d   i nA EFE l     �hGH�h  G   the returned list.   H �II &   t h e   r e t u r n e d   l i s t .F JKJ l     �gLM�g  L T N @param pdfRecord The DEVONthink record representing the PDF whose annotations   M �NN �   @ p a r a m   p d f R e c o r d   T h e   D E V O N t h i n k   r e c o r d   r e p r e s e n t i n g   t h e   P D F   w h o s e   a n n o t a t i o n sK OPO l     �fQR�f  Q   shall be extracted.   R �SS (   s h a l l   b e   e x t r a c t e d .P TUT i  	VWV I      �eX�d�e :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDFX Y�cY o      �b�b 0 	pdfrecord 	pdfRecord�c  �d  W k    WZZ [\[ l     �a]^�a  ] U O assemble info for the PDF record and its (possibly to be created) notes folder   ^ �__ �   a s s e m b l e   i n f o   f o r   t h e   P D F   r e c o r d   a n d   i t s   ( p o s s i b l y   t o   b e   c r e a t e d )   n o t e s   f o l d e r\ `a` O     �bcb k    �dd efe r    ghg n    iji 1   	 �`
�` 
ppthj o    	�_�_ 0 	pdfrecord 	pdfRecordh o      �^�^ 0 pdfpath pdfPathf klk r    mnm n    opo 1    �]
�] 
rURLp o    �\�\ 0 	pdfrecord 	pdfRecordn o      �[�[ 
0 pdfurl  l qrq r    sts n    uvu 1    �Z
�Z 
DTlov o    �Y�Y 0 	pdfrecord 	pdfRecordt o      �X�X "0 pdflocationpath pdfLocationPathr wxw l   �W�V�U�W  �V  �U  x yzy r    {|{ n    }~} 1    �T
�T 
DTcm~ o    �S�S 0 	pdfrecord 	pdfRecord| o      �R�R 0 pdfmetadata pdfMetadataz � Q     =���� k   # 1�� ��� l  # #�Q���Q  � N H pdfMetadata may be undefined in which case this triggers the error case   � ��� �   p d f M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e� ��P� Z  # 1���O�N� =  # &��� o   # $�M�M 0 pdfmetadata pdfMetadata� m   $ %�L
�L 
msng� r   ) -��� J   ) +�K�K  � o      �J�J 0 pdfmetadata pdfMetadata�O  �N  �P  � R      �I�H�G
�I .ascrerr ****      � ****�H  �G  � r   9 =��� J   9 ;�F�F  � o      �E�E 0 pdfmetadata pdfMetadata� ��� l  > >�D�C�B�D  �C  �B  � ��� l  > >�A���A  � p j if necessary, create the notes folder, i.e. the DEVONthink group that hosts the PDF file's Markdown notes   � ��� �   i f   n e c e s s a r y ,   c r e a t e   t h e   n o t e s   f o l d e r ,   i . e .   t h e   D E V O N t h i n k   g r o u p   t h a t   h o s t s   t h e   P D F   f i l e ' s   M a r k d o w n   n o t e s� ��� r   > O��� b   > M��� b   > G��� o   > C�@�@ ,0 notefoldernameprefix noteFolderNamePrefix� n   C F��� 1   D F�?
�? 
pnam� o   C D�>�> 0 	pdfrecord 	pdfRecord� o   G L�=�= ,0 notefoldernamesuffix noteFolderNameSuffix� o      �<�<  0 notefoldername noteFolderName� ��� r   P W��� l  P U��;�:� b   P U��� b   P S��� o   P Q�9�9 "0 pdflocationpath pdfLocationPath� o   Q R�8�8  0 notefoldername noteFolderName� m   S T�� ���  /�;  �:  � o      �7�7 (0 folderlocationpath folderLocationPath� ��� r   X _��� I  X ]�6��5
�6 .DTpacd53bool       utxt� o   X Y�4�4 (0 folderlocationpath folderLocationPath�5  � o      �3�3  0 folderdidexist folderDidExist� ��� r   ` g��� I  ` e�2��1
�2 .DTpacd52DTrc       utxt� o   ` a�0�0 (0 folderlocationpath folderLocationPath�1  � o      �/�/  0 folderlocation folderLocation� ��� r   h m��� n   h k��� 1   i k�.
�. 
rURL� o   h i�-�-  0 folderlocation folderLocation� o      �,�, 0 	folderurl 	folderURL� ��� r   n u��� b   n q��� o   n o�+�+ 
0 pdfurl  � m   o p�� ���  ? p a g e = 0� n      ��� 1   r t�*
�* 
pURL� o   q r�)�)  0 folderlocation folderLocation� ��� l  v v�(�'�&�(  �'  �&  � ��� r   v {��� n   v y��� 1   w y�%
�% 
DTcm� o   v w�$�$  0 folderlocation folderLocation� o      �#�#  0 foldermetadata folderMetadata� ��"� Q   | ����� k    ��� ��� l   �!���!  � Q K folderMetadata may be undefined in which case this triggers the error case   � ��� �   f o l d e r M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e� �� � Z   ������ =   ���� o    ���  0 foldermetadata folderMetadata� m   � ��
� 
msng� r   � ���� J   � ���  � o      ��  0 foldermetadata folderMetadata�  �  �   � R      ���
� .ascrerr ****      � ****�  �  � r   � ���� J   � ���  � o      ��  0 foldermetadata folderMetadata�"  c 5     ���
� 
capp� m    �� ���  D N t p
� kfrmID  a ��� l  � �����  �  �  � ��� l  � �����  � E ? extract any DOI & citekey for the PDF from its custom metadata   � ��� ~   e x t r a c t   a n y   D O I   &   c i t e k e y   f o r   t h e   P D F   f r o m   i t s   c u s t o m   m e t a d a t a� ��� r   � ���� m   � ��� ���  � o      �� 0 	sourcedoi 	sourceDOI� ��� r   � ���� m   � ��� ���  � o      �� 0 sourcecitekey sourceCitekey� ��� Z   ������ >  � ���� o   � ��
�
 0 pdfmetadata pdfMetadata� J   � ��	�	  � k   �
	 	  			 r   � �			 l  � �	��	 n  � �			 I   � ��	�� .0 valueforkey_inrecord_ valueForKey_inRecord_	 			
		 m   � �		 �		 
 m d d o i	
 	�	 o   � ��� 0 pdfmetadata pdfMetadata�  �  	 o   � ��� 0 keypointslib KeypointsLib�  �  	 o      �� 0 metadatadoi metadataDOI	 			 Z   � �		� ��	 F   � �			 >  � �			 o   � ����� 0 metadatadoi metadataDOI	 m   � ���
�� 
msng	 >  � �			 o   � ����� 0 metadatadoi metadataDOI	 m   � �		 �		  	 r   � �			 n  � �			 I   � ���	���� 0 matchdoi matchDOI	 	��	 o   � ����� 0 metadatadoi metadataDOI��  ��  	 o   � ����� 0 keypointslib KeypointsLib	 o      ���� 0 	sourcedoi 	sourceDOI�   ��  	 	 	!	  r   � �	"	#	" l  � �	$����	$ n  � �	%	&	% I   � ���	'���� .0 valueforkey_inrecord_ valueForKey_inRecord_	' 	(	)	( m   � �	*	* �	+	+  m d c i t e k e y	) 	,��	, o   � ����� 0 pdfmetadata pdfMetadata��  ��  	& o   � ����� 0 keypointslib KeypointsLib��  ��  	# o      ���� "0 metadatacitekey metadataCitekey	! 	-��	- Z   �
	.	/����	. F   � 	0	1	0 >  � �	2	3	2 o   � ����� "0 metadatacitekey metadataCitekey	3 m   � ���
�� 
msng	1 >  � �	4	5	4 o   � ����� "0 metadatacitekey metadataCitekey	5 m   � �	6	6 �	7	7  	/ r  	8	9	8 o  ���� "0 metadatacitekey metadataCitekey	9 o      ���� 0 sourcecitekey sourceCitekey��  ��  ��  �  �  � 	:	;	: l ��������  ��  ��  	; 	<	=	< l ��	>	?��  	> Y S set KeypointsLib's properties which control some of its annotation-related methods   	? �	@	@ �   s e t   K e y p o i n t s L i b ' s   p r o p e r t i e s   w h i c h   c o n t r o l   s o m e   o f   i t s   a n n o t a t i o n - r e l a t e d   m e t h o d s	= 	A	B	A r  	C	D	C o  ���� ,0 linewidthenlargement lineWidthEnlargement	D n     	E	F	E o  ���� ,0 linewidthenlargement lineWidthEnlargement	F o  ���� 0 keypointslib KeypointsLib	B 	G	H	G r  .	I	J	I o  $���� .0 lineheightenlargement lineHeightEnlargement	J n     	K	L	K o  )-���� .0 lineheightenlargement lineHeightEnlargement	L o  $)���� 0 keypointslib KeypointsLib	H 	M	N	M l />	O	P	Q	O r  />	R	S	R o  /4���� "0 redcolormapping redColorMapping	S n     	T	U	T o  9=���� "0 redcolormapping redColorMapping	U o  49���� 0 keypointslib KeypointsLib	P U O KeypointsLib's other individual color mappings don't need to be set explicitly   	Q �	V	V �   K e y p o i n t s L i b ' s   o t h e r   i n d i v i d u a l   c o l o r   m a p p i n g s   d o n ' t   n e e d   t o   b e   s e t   e x p l i c i t l y	N 	W	X	W r  ?N	Y	Z	Y o  ?D���� 0 colormappings colorMappings	Z n     	[	\	[ o  IM���� 0 colormappings colorMappings	\ o  DI���� 0 keypointslib KeypointsLib	X 	]	^	] r  O^	_	`	_ o  OT���� <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts	` n     	a	b	a o  Y]���� <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts	b o  TY���� 0 keypointslib KeypointsLib	^ 	c	d	c r  _n	e	f	e o  _d����  0 maxtextcolumns maxTextColumns	f n     	g	h	g o  im����  0 maxtextcolumns maxTextColumns	h o  di���� 0 keypointslib KeypointsLib	d 	i	j	i r  o~	k	l	k o  ot���� 0 
pagemargin 
pageMargin	l n     	m	n	m o  y}���� 0 
pagemargin 
pageMargin	n o  ty���� 0 keypointslib KeypointsLib	j 	o	p	o l ��������  ��  ��  	p 	q	r	q l ��	s	t��  	s J D assemble info for all PDF annotations as a list of property records   	t �	u	u �   a s s e m b l e   i n f o   f o r   a l l   P D F   a n n o t a t i o n s   a s   a   l i s t   o f   p r o p e r t y   r e c o r d s	r 	v	w	v r  �	x	y	x n �	z	{	z I  ����	|���� &0 pdfannotationinfo pdfAnnotationInfo	| 	}	~	} o  ������ 0 pdfpath pdfPath	~ 		�	 o  ������ 
0 pdfurl  	� 	�	�	� o  ������ 0 	sourcedoi 	sourceDOI	� 	���	� o  ������ 0 sourcecitekey sourceCitekey��  ��  	{ o  ����� 0 keypointslib KeypointsLib	y J      	�	� 	�	�	� o      ���� (0 pdfannotationslist pdfAnnotationsList	� 	���	� o      ���� 0 	sourcedoi 	sourceDOI��  	w 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� n h sort all PDF annotations so that they are listed in the order they appear in the document & on the page   	� �	�	� �   s o r t   a l l   P D F   a n n o t a t i o n s   s o   t h a t   t h e y   a r e   l i s t e d   i n   t h e   o r d e r   t h e y   a p p e a r   i n   t h e   d o c u m e n t   &   o n   t h e   p a g e	� 	�	�	� l ����	�	���  	� W Q NOTE: by default, PDF annotations seem to be ordered by page & creation date (?)   	� �	�	� �   N O T E :   b y   d e f a u l t ,   P D F   a n n o t a t i o n s   s e e m   t o   b e   o r d e r e d   b y   p a g e   &   c r e a t i o n   d a t e   ( ? )	� 	�	�	� l ����	�	���  	� � �set pdfAnnotationsList to KeypointsLib's sortList:pdfAnnotationsList byKey:"sortString" inAscendingOrder:true usingSelector:"localizedStandardCompare:"   	� �	�	�. s e t   p d f A n n o t a t i o n s L i s t   t o   K e y p o i n t s L i b ' s   s o r t L i s t : p d f A n n o t a t i o n s L i s t   b y K e y : " s o r t S t r i n g "   i n A s c e n d i n g O r d e r : t r u e   u s i n g S e l e c t o r : " l o c a l i z e d S t a n d a r d C o m p a r e : "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� \ V set custom metadata fields for the PDF record: DOI & DT link back to the notes folder   	� �	�	� �   s e t   c u s t o m   m e t a d a t a   f i e l d s   f o r   t h e   P D F   r e c o r d :   D O I   &   D T   l i n k   b a c k   t o   t h e   n o t e s   f o l d e r	� 	�	�	� r  ��	�	�	� b  ��	�	�	� o  ������ 0 pdfmetadata pdfMetadata	� K  ��	�	� ��	�	��� 0 doi  	� o  ������ 0 	sourcedoi 	sourceDOI	� ��	����� 0 pdfannotations  	� o  ������ 0 	folderurl 	folderURL��  	� o      ���� 0 pdfmetadata pdfMetadata	� 	�	�	� n ��	�	�	� I  ����	����� 00 setmetadatafordtrecord setMetadataForDTRecord	� 	�	�	� o  ������ 0 	pdfrecord 	pdfRecord	� 	���	� o  ������ 0 pdfmetadata pdfMetadata��  ��  	�  f  ��	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� = 7 if the notes folder just got created, set its metadata   	� �	�	� n   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   s e t   i t s   m e t a d a t a	� 	�	�	� r  ��	�	�	� J  ������  	� o      ���� 0 bibmetadata bibMetadata	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  	� o      ���� &0 formattedcitation formattedCitation	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  	� o      ���� 0 
bibtexdata 
bibTeXData	� 	�	�	� Z  �s	�	�����	� G  ��	�	�	� = ��	�	�	� o  ������  0 folderdidexist folderDidExist	� m  ����
�� boovfals	� = ��	�	�	� o  ������ 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata	� m  ����
�� boovtrue	� k  �o	�	� 	�	�	� l ����	�	���  	� 5 / fetch bibliographic metadata for the PDF's DOI   	� �	�	� ^   f e t c h   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   P D F ' s   D O I	� 	�	�	� Z  �J	�	�����	� F  �	�	�	� F  ��	�	�	� = ��	�	�	� o  ������ $0 fetchdoimetadata fetchDOIMetadata	� m  ����
�� boovtrue	� > ��	�	�	� o  ������ 0 	sourcedoi 	sourceDOI	� m  ����
�� 
msng	� > ��	�	�	� o  ������ 0 	sourcedoi 	sourceDOI	� m  ��	�	� �	�	�  	� k  F	�	� 	�	�	� r  	�	�	� n 	�	�	� I  ��	����� &0 bibmetadatafordoi bibMetadataForDOI	� 	�	�	� o  ���� 0 	sourcedoi 	sourceDOI	� 	���	� o  	���� 0 sourcecitekey sourceCitekey��  ��  	�  f  	� o      ���� 0 bibmetadata bibMetadata	� 	���	� Z  F	�	�����	� > 	�	�	� o  ���� 0 bibmetadata bibMetadata	� J  ����  	� k  B	�	� 	�	�	� r  .	�	�	� l *	�����	� n *	�
 	� I   *��
���� .0 valueforkey_inrecord_ valueForKey_inRecord_
 


 m   #

 �

  r e f e r e n c e
 
��
 o  #&���� 0 bibmetadata bibMetadata��  ��  
  o   ���� 0 keypointslib KeypointsLib��  ��  	� o      �� &0 formattedcitation formattedCitation	� 
�~
 r  /B

	
 l />

�}�|

 n />


 I  4>�{
�z�{ .0 valueforkey_inrecord_ valueForKey_inRecord_
 


 m  47

 �

  b i b t e x
 
�y
 o  7:�x�x 0 bibmetadata bibMetadata�y  �z  
 o  /4�w�w 0 keypointslib KeypointsLib�}  �|  
	 o      �v�v 0 
bibtexdata 
bibTeXData�~  ��  ��  ��  ��  ��  	� 


 l KK�u�t�s�u  �t  �s  
 


 r  K_


 b  K]


 o  KL�r�r  0 foldermetadata folderMetadata
 K  L\

 �q

�q 0 
sourcefile 
sourceFile
 o  OP�p�p 0 pdfpath pdfPath
 �o

�o 0 citekey  
 o  ST�n�n 0 sourcecitekey sourceCitekey
 �m
 �l�m 0 doi  
  o  WX�k�k 0 	sourcedoi 	sourceDOI�l  
 o      �j�j  0 foldermetadata folderMetadata
 
!
"
! r  `g
#
$
# b  `e
%
&
% o  `a�i�i  0 foldermetadata folderMetadata
& o  ad�h�h 0 bibmetadata bibMetadata
$ o      �g�g  0 foldermetadata folderMetadata
" 
'
(
' l hh�f�e�d�f  �e  �d  
( 
)�c
) n ho
*
+
* I  io�b
,�a�b 00 setmetadatafordtfolder setMetadataForDTFolder
, 
-
.
- o  ij�`�`  0 folderlocation folderLocation
. 
/�_
/ o  jk�^�^  0 foldermetadata folderMetadata�_  �a  
+  f  hi�c  ��  ��  	� 
0
1
0 l tt�]�\�[�]  �\  �[  
1 
2
3
2 l tt�Z
4
5�Z  
4 s m if the notes folder just got created, append BibTeX data and/or the formatted citation to its Finder comment   
5 �
6
6 �   i f   t h e   n o t e s   f o l d e r   j u s t   g o t   c r e a t e d ,   a p p e n d   B i b T e X   d a t a   a n d / o r   t h e   f o r m a t t e d   c i t a t i o n   t o   i t s   F i n d e r   c o m m e n t
3 
7
8
7 Z  t�
9
:�Y�X
9 = tw
;
<
; o  tu�W�W  0 folderdidexist folderDidExist
< m  uv�V
�V boovfals
: k  z�
=
= 
>
?
> Z  z�
@
A�U�T
@ F  z�
B
C
B F  z�
D
E
D = z�
F
G
F o  z�S�S P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment
G m  ��R
�R boovtrue
E > ��
H
I
H o  ���Q�Q &0 formattedcitation formattedCitation
I m  ���P
�P 
msng
C > ��
J
K
J o  ���O�O &0 formattedcitation formattedCitation
K m  ��
L
L �
M
M  
A n ��
N
O
N I  ���N
P�M�N 60 appendtocommentofdtfolder appendToCommentOfDTFolder
P 
Q
R
Q o  ���L�L  0 folderlocation folderLocation
R 
S�K
S o  ���J�J &0 formattedcitation formattedCitation�K  �M  
O  f  ���U  �T  
? 
T�I
T Z  ��
U
V�H�G
U F  ��
W
X
W F  ��
Y
Z
Y = ��
[
\
[ o  ���F�F :0 appendbibtextofindercomment appendBibTeXToFinderComment
\ m  ���E
�E boovtrue
Z > ��
]
^
] o  ���D�D 0 
bibtexdata 
bibTeXData
^ m  ���C
�C 
msng
X > ��
_
`
_ o  ���B�B 0 
bibtexdata 
bibTeXData
` m  ��
a
a �
b
b  
V n ��
c
d
c I  ���A
e�@�A 60 appendtocommentofdtfolder appendToCommentOfDTFolder
e 
f
g
f o  ���?�?  0 folderlocation folderLocation
g 
h�>
h o  ���=�= 0 
bibtexdata 
bibTeXData�>  �@  
d  f  ���H  �G  �I  �Y  �X  
8 
i
j
i l ���<�;�:�<  �;  �:  
j 
k
l
k r  ��
m
n
m J  ���9�9  
n o      �8�8  0 updatedrecords updatedRecords
l 
o
p
o l ���7�6�5�7  �6  �5  
p 
q
r
q l ���4
s
t�4  
s y s loop over each markup, text or free text annotation in the PDF and create/update its corresponding Markdown record   
t �
u
u �   l o o p   o v e r   e a c h   m a r k u p ,   t e x t   o r   f r e e   t e x t   a n n o t a t i o n   i n   t h e   P D F   a n d   c r e a t e / u p d a t e   i t s   c o r r e s p o n d i n g   M a r k d o w n   r e c o r d
r 
v
w
v X  �R
x�3
y
x k  �M
z
z 
{
|
{ r  �
}
~
} l �
�2�1
 n �
�
�
� o   �0�0 0 comment  
� o  � �/�/ 0 pdfannotation pdfAnnotation�2  �1  
~ o      �.�. 0 acomment aComment
| 
�
�
� Z  	%
�
��-�,
� > 	
�
�
� o  	�+�+ 0 acomment aComment
� m  �*
�* 
msng
� r  !
�
�
� n 
�
�
� I  �)
��(�) :0 preprocessannotationcomment preprocessAnnotationComment
� 
��'
� c  
�
�
� o  �&�& 0 acomment aComment
� m  �%
�% 
TEXT�'  �(  
�  f  
� o      �$�$ 0 acomment aComment�-  �,  
� 
�
�
� l &&�#�"�!�#  �"  �!  
� 
�
�
� r  &1
�
�
� l &-
�� �
� n &-
�
�
� o  )-�� 0 	annottext 	annotText
� o  &)�� 0 pdfannotation pdfAnnotation�   �  
� o      �� 0 	annottext 	annotText
� 
�
�
� Z 2I
�
���
� > 27
�
�
� o  25�� 0 	annottext 	annotText
� m  56�
� 
msng
� r  :E
�
�
� c  :A
�
�
� o  :=�� 0 	annottext 	annotText
� m  =@�
� 
TEXT
� o      �� 0 	annottext 	annotText�  �  
� 
�
�
� l JJ����  �  �  
� 
�
�
� r  JU
�
�
� l JQ
���
� n JQ
�
�
� o  MQ�� 0 	pagelabel 	pageLabel
� o  JM�� 0 pdfannotation pdfAnnotation�  �  
� o      �� 0 
apagelabel 
aPageLabel
� 
�
�
� l VV���
�  �  �
  
� 
�
�
� l VV�	
�
��	  
� = 7 assemble record content from annotation text & comment   
� �
�
� n   a s s e m b l e   r e c o r d   c o n t e n t   f r o m   a n n o t a t i o n   t e x t   &   c o m m e n t
� 
�
�
� r  Ve
�
�
� n Va
�
�
� I  Wa�
��� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData
� 
�
�
� o  WZ�� 0 	annottext 	annotText
� 
��
� o  Z]�� 0 acomment aComment�  �  
�  f  VW
� o      ��  0 recordcontents recordContents
� 
�
�
� l ff��� �  �  �   
� 
�
�
� l ff��
�
���  
� F @ assemble record name from annotation text, comment & page label   
� �
�
� �   a s s e m b l e   r e c o r d   n a m e   f r o m   a n n o t a t i o n   t e x t ,   c o m m e n t   &   p a g e   l a b e l
� 
�
�
� r  fx
�
�
� n ft
�
�
� I  gt��
����� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData
� 
�
�
� o  gj���� 0 	annottext 	annotText
� 
�
�
� o  jm���� 0 acomment aComment
� 
���
� o  mp���� 0 
apagelabel 
aPageLabel��  ��  
�  f  fg
� o      ���� 0 
recordname 
recordName
� 
�
�
� l yy��������  ��  ��  
� 
�
�
� l yy��
�
���  
� q k to ensure stable Keypoints IDs, the last part of the annotation's sort identifier string (like "2-1-125"),   
� �
�
� �   t o   e n s u r e   s t a b l e   K e y p o i n t s   I D s ,   t h e   l a s t   p a r t   o f   t h e   a n n o t a t i o n ' s   s o r t   i d e n t i f i e r   s t r i n g   ( l i k e   " 2 - 1 - 1 2 5 " ) ,
� 
�
�
� l yy��
�
���  
� r l i.e. its position from top, will be used to form the fixed "milliseconds" part when creating a Keypoints ID   
� �
�
� �   i . e .   i t s   p o s i t i o n   f r o m   t o p ,   w i l l   b e   u s e d   t o   f o r m   t h e   f i x e d   " m i l l i s e c o n d s "   p a r t   w h e n   c r e a t i n g   a   K e y p o i n t s   I D
� 
�
�
� r  y�
�
�
� c  y�
�
�
� l y�
�����
� n y�
�
�
� o  |����� 0 
sortstring 
sortString
� o  y|���� 0 pdfannotation pdfAnnotation��  ��  
� m  ����
�� 
TEXT
� o      ���� "0 annotsortstring annotSortString
� 
�
�
� r  ��
�
�
� c  ��
�
�
� l ��
�����
� n ��
�
�
� o  ������ "0 positionfromtop positionFromTop
� o  ������ 0 pdfannotation pdfAnnotation��  ��  
� m  ����
�� 
TEXT
� o      ���� "0 positionfromtop positionFromTop
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 7 ����
�
�
�� 
ctxt
� m  ��������
� m  ��������
� l ��
�����
� b  ��
�
�
� m  ��
�
� �
�
�  0
� o  ������ "0 positionfromtop positionFromTop��  ��  
� o      ���� 0 centiseconds centiSeconds
� 
�
�
� l ����������  ��  ��  
� 
�
�
� l ����
� ��  
� * $ record modification & creation date     � H   r e c o r d   m o d i f i c a t i o n   &   c r e a t i o n   d a t e
�  r  �� c  �� l ������ n ��	
	 o  ������ 0 createddate createdDate
 o  ������ 0 pdfannotation pdfAnnotation��  ��   m  ����
�� 
ldt  o      ���� (0 recordcreationdate recordCreationDate  r  �� c  �� l ������ n �� o  ������ 0 modifieddate modifiedDate o  ������ 0 pdfannotation pdfAnnotation��  ��   m  ����
�� 
ldt  o      ���� 00 recordmodificationdate recordModificationDate  Z  ������ > �� o  ������ 00 recordmodificationdate recordModificationDate m  ����
�� 
msng r  �� n �� I  �������� (0 keypointsidfordate keypointsIDForDate   o  ������ (0 recordcreationdate recordCreationDate  !��! o  ������ 0 centiseconds centiSeconds��  ��   o  ������ 0 keypointslib KeypointsLib o      ���� 0 recordaliases recordAliases��  ��   "#" l ����������  ��  ��  # $%$ r  �&'& c  ��()( l ��*����* n ��+,+ o  ������ 0 deeplink deepLink, o  ������ 0 pdfannotation pdfAnnotation��  ��  ) m  ����
�� 
TEXT' o      ���� 0 	recordurl 	recordURL% -.- l ��������  ��  ��  . /0/ l ��12��  1   record metadata   2 �33     r e c o r d   m e t a d a t a0 454 r  676 c  898 l 
:����: n 
;<; o  
���� 0 	annottype 	annotType< o  ���� 0 pdfannotation pdfAnnotation��  ��  9 m  
��
�� 
TEXT7 o      ���� 0 	annottype 	annotType5 =>= r  /?@? b  +ABA o  ���� 0 bibmetadata bibMetadataB K  *CC ��DE�� 0 pdfannotations  D o  ���� 0 	folderurl 	folderURLE ��FG��  0 annotationtype annotationTypeF o   ���� 0 	annottype 	annotTypeG ��H���� "0 annotationorder annotationOrderH o  #&���� "0 annotsortstring annotSortString��  @ o      ����  0 recordmetadata recordMetadata> IJI l 00��������  ��  ��  J KLK r  0;MNM l 07O����O n 07PQP o  37���� 0 username userNameQ o  03���� 0 pdfannotation pdfAnnotation��  ��  N o      ���� 0 	ausername 	aUserNameL RSR Z <jTU����T F  <OVWV > <AXYX o  <?���� 0 	ausername 	aUserNameY m  ?@��
�� 
msngW > DKZ[Z o  DG���� 0 	ausername 	aUserName[ m  GJ\\ �]]  U r  Rf^_^ b  Rb`a` o  RU����  0 recordmetadata recordMetadataa K  Uabb ��c���� 0 	createdby 	createdByc l X_d����d c  X_efe o  X[���� 0 	ausername 	aUserNamef m  [^��
�� 
TEXT��  ��  ��  _ o      ����  0 recordmetadata recordMetadata��  ��  S ghg l kk��������  ��  ��  h iji Z k�kl����k F  k~mnm > kpopo o  kn���� 0 
apagelabel 
aPageLabelp m  no��
�� 
msngn > szqrq o  sv���� 0 
apagelabel 
aPageLabelr m  vyss �tt  l r  ��uvu b  ��wxw o  ������  0 recordmetadata recordMetadatax K  ��yy ��z���� 0 
sourcepage 
sourcePagez l ��{����{ c  ��|}| o  ������ 0 
apagelabel 
aPageLabel} m  ����
�� 
TEXT��  ��  ��  v o      ����  0 recordmetadata recordMetadata��  ��  j ~~ l ����������  ��  ��   ��� Z �������� > ����� o  ���~�~ 0 pdfpath pdfPath� m  ���}
�} 
msng� r  ����� b  ����� o  ���|�|  0 recordmetadata recordMetadata� K  ���� �{��z�{ 0 
sourcefile 
sourceFile� o  ���y�y 0 pdfpath pdfPath�z  � o      �x�x  0 recordmetadata recordMetadata��  �  � ��� l ���w�v�u�w  �v  �u  � ��� l ���t���t  � � � TODO: allow to extract (& prioritize) the citekey from the annotation comment (e.g. `< #Miller+Johns2024` or `< [#Miller+Johns2024]`)   � ���   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   c i t e k e y   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   # M i l l e r + J o h n s 2 0 2 4 `   o r   ` <   [ # M i l l e r + J o h n s 2 0 2 4 ] ` )� ��� r  ����� l ����s�r� n ����� o  ���q�q 0 citekey  � o  ���p�p 0 pdfannotation pdfAnnotation�s  �r  � o      �o�o 0 citekey  � ��� Z �����n�m� F  ����� > ����� o  ���l�l 0 citekey  � m  ���k
�k 
msng� > ����� o  ���j�j 0 citekey  � m  ���� ���  � r  ����� b  ����� o  ���i�i  0 recordmetadata recordMetadata� K  ���� �h��g�h 0 citekey  � o  ���f�f 0 citekey  �g  � o      �e�e  0 recordmetadata recordMetadata�n  �m  � ��� l ���d�c�b�d  �c  �b  � ��� Z ����a�`� F  ����� > ����� o  ���_�_ 0 	sourcedoi 	sourceDOI� m  ���^
�^ 
msng� > ����� o  ���]�] 0 	sourcedoi 	sourceDOI� m  ���� ���  � r  �
��� b  ���� o  ���\�\  0 recordmetadata recordMetadata� K  ��� �[��Z�[ 0 doi  � o  �Y�Y 0 	sourcedoi 	sourceDOI�Z  � o      �X�X  0 recordmetadata recordMetadata�a  �`  � ��� l �W�V�U�W  �V  �U  � ��� l �T���T  � j d extract tags (like `< @tag @another tag` or `< [@tag] [@another tag]`) as well as custom attributes   � ��� �   e x t r a c t   t a g s   ( l i k e   ` <   @ t a g   @ a n o t h e r   t a g `   o r   ` <   [ @ t a g ]   [ @ a n o t h e r   t a g ] ` )   a s   w e l l   a s   c u s t o m   a t t r i b u t e s� ��� l �S���S  � q k (i.e., special tags like `< @:key:value @:key` or `< [@:key:value] [@:key]`) within the annotation comment   � ��� �   ( i . e . ,   s p e c i a l   t a g s   l i k e   ` <   @ : k e y : v a l u e   @ : k e y `   o r   ` <   [ @ : k e y : v a l u e ]   [ @ : k e y ] ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t� ��� r  7��� n  ��� I   �R��Q�R T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote� ��� o  �P�P 0 acomment aComment� ��O� J  �� ��N� m  �� ���  f l a g g e d�N  �O  �Q  � o  �M�M 0 keypointslib KeypointsLib� J      �� ��� o      �L�L $0 customattributes customAttributes� ��K� o      �J�J 0 
recordtags 
recordTags�K  � ��� l 88�I�H�G�I  �H  �G  � ��� l 88�F���F  � G A set the extracted custom attributes as dedicated record metadata   � ��� �   s e t   t h e   e x t r a c t e d   c u s t o m   a t t r i b u t e s   a s   d e d i c a t e d   r e c o r d   m e t a d a t a� ��� X  8���E�� k  N��� ��� r  NY��� n NU��� o  QU�D�D 0 	attribkey 	attribKey� o  NQ�C�C "0 customattribute customAttribute� o      �B�B 0 akey aKey� ��� r  Ze��� n Za��� o  ]a�A�A 0 attribvalue attribValue� o  Z]�@�@ "0 customattribute customAttribute� o      �?�? 0 avalue aValue� ��� l ff�>�=�<�>  �=  �<  � ��� l ff�;���;  � z t allow multiple occurrences of the same custom key with different values (e.g. `@:key:Some value @:key:Other value`)   � ��� �   a l l o w   m u l t i p l e   o c c u r r e n c e s   o f   t h e   s a m e   c u s t o m   k e y   w i t h   d i f f e r e n t   v a l u e s   ( e . g .   ` @ : k e y : S o m e   v a l u e   @ : k e y : O t h e r   v a l u e ` )� ��� r  fy� � l fu�:�9 n fu I  ku�8�7�8 .0 valueforkey_inrecord_ valueForKey_inRecord_  o  kn�6�6 0 akey aKey �5 o  nq�4�4  0 recordmetadata recordMetadata�5  �7   o  fk�3�3 0 keypointslib KeypointsLib�:  �9    o      �2�2 0 existingvalue existingValue� �1 Z  z�	
�0	 > z o  z}�/�/ 0 existingvalue existingValue m  }~�.
�. 
msng
 r  �� l ���-�, n �� I  ���+�*�+ 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_  l ���)�( b  �� b  �� o  ���'�' 0 existingvalue existingValue m  �� �  ; o  ���&�& 0 avalue aValue�)  �(    o  ���%�% 0 akey aKey �$ o  ���#�#  0 recordmetadata recordMetadata�$  �*   o  ���"�" 0 keypointslib KeypointsLib�-  �,   o      �!�!  0 recordmetadata recordMetadata�0   r  �� !  b  ��"#" o  ��� �   0 recordmetadata recordMetadata# l ��$��$ n ��%&% I  ���'�� :0 recordfromlabels_andvalues_ recordFromLabels_andValues_' ()( J  ��** +�+ o  ���� 0 akey aKey�  ) ,�, J  ��-- .�. o  ���� 0 avalue aValue�  �  �  & o  ���� 0 keypointslib KeypointsLib�  �  ! o      ��  0 recordmetadata recordMetadata�1  �E "0 customattribute customAttribute� o  ;>�� $0 customattributes customAttributes� /0/ l ������  �  �  0 121 l ���34�  3 P J honor a flagged status (like `< @:flagged`) within the annotation comment   4 �55 �   h o n o r   a   f l a g g e d   s t a t u s   ( l i k e   ` <   @ : f l a g g e d ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n t2 676 r  ��898 n ��:;: I  ���<�� @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged< =�= o  ���� 0 acomment aComment�  �  ; o  ���� 0 keypointslib KeypointsLib9 o      �
�
 0 	isflagged 	isFlagged7 >?> l ���	���	  �  �  ? @A@ l ���BC�  B B < honor a rating (like `< ***`) within the annotation comment   C �DD x   h o n o r   a   r a t i n g   ( l i k e   ` <   * * * ` )   w i t h i n   t h e   a n n o t a t i o n   c o m m e n tA EFE r  ��GHG n ��IJI I  ���K�� 60 keypointsnoteratingnumber keypointsNoteRatingNumberK L�L o  ���� 0 acomment aComment�  �  J o  ���� 0 keypointslib KeypointsLibH o      � �  0 recordrating recordRatingF MNM l ����������  ��  ��  N OPO l ����QR��  Q H B attempt to map the annotation's color to a DEVONthink label index   R �SS �   a t t e m p t   t o   m a p   t h e   a n n o t a t i o n ' s   c o l o r   t o   a   D E V O N t h i n k   l a b e l   i n d e xP TUT l ����VW��  V  y TODO: allow to extract (& prioritize) the DEVONthink label from the annotation comment (e.g. `< (@Important)` or `< @1`)   W �XX �   T O D O :   a l l o w   t o   e x t r a c t   ( &   p r i o r i t i z e )   t h e   D E V O N t h i n k   l a b e l   f r o m   t h e   a n n o t a t i o n   c o m m e n t   ( e . g .   ` <   ( @ I m p o r t a n t ) `   o r   ` <   @ 1 ` )U YZY r  ��[\[ n ��]^] I  ����_���� 00 labelindexforcolorname labelIndexForColorName_ `��` n ��aba o  ������  0 annotcolorname annotColorNameb o  ������ 0 pdfannotation pdfAnnotation��  ��  ^  f  ��\ o      ���� $0 recordlabelindex recordLabelIndexZ cdc l ����������  ��  ��  d efe l ����gh��  g A ; create a Markdown record for this annotation in DEVONthink   h �ii v   c r e a t e   a   M a r k d o w n   r e c o r d   f o r   t h i s   a n n o t a t i o n   i n   D E V O N t h i n kf jkj r  �8lml n �!non I  �!��p����  0 createdtrecord createDTRecordp qrq o  ������  0 folderlocation folderLocationr sts o  ������  0 foldermetadata folderMetadatat uvu o  ������ 0 
recordname 
recordNamev wxw o  � ���� 0 recordaliases recordAliasesx yzy o   ���� 0 	recordurl 	recordURLz {|{ o  ���� 0 
recordtags 
recordTags| }~} o  	���� 0 	isflagged 	isFlagged~ � o  	����  0 recordcontents recordContents� ��� o  ���� (0 recordcreationdate recordCreationDate� ��� o  ���� 00 recordmodificationdate recordModificationDate� ��� o  ����  0 recordmetadata recordMetadata� ��� o  ���� 0 recordrating recordRating� ���� o  ���� $0 recordlabelindex recordLabelIndex��  ��  o  f  ��m J      �� ��� o      ���� 0 dtrecord dtRecord� ���� o      ���� $0 recordwasupdated recordWasUpdated��  k ��� l 99��������  ��  ��  � ���� Z  9M������� = 9>��� o  9<���� $0 recordwasupdated recordWasUpdated� m  <=��
�� boovtrue� s  AI��� o  AD���� 0 dtrecord dtRecord� n      ���  ;  GH� o  DG����  0 updatedrecords updatedRecords��  ��  ��  �3 0 pdfannotation pdfAnnotation
y o  ������ (0 pdfannotationslist pdfAnnotationsList
w ��� l SS��������  ��  ��  � ���� L  SW�� o  SV����  0 updatedrecords updatedRecords��  U ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � T N Assembles the content of a Markdown record from the given PDF annotation text   � ��� �   A s s e m b l e s   t h e   c o n t e n t   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t� ��� l     ������  �   and comment.   � ���    a n d   c o m m e n t .� ��� i  ��� I      ������� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� ��� o      ���� 0 	annottext 	annotText� ���� o      ���� 0 annotcomment annotComment��  ��  � k     ��� ��� r     ��� J     ����  � o      ���� (0 recordcontentparts recordContentParts� ��� Z    ������� F    ��� >   ��� o    ���� 0 	annottext 	annotText� m    ��
�� 
msng� >   ��� o    ���� 0 	annottext 	annotText� m    �� ���  � s    ��� b    ��� m    �� ���  >  � l   ������ c    ��� o    ���� 0 	annottext 	annotText� m    ��
�� 
TEXT��  ��  � n      ���  ;    � o    ���� (0 recordcontentparts recordContentParts��  ��  � ��� l     ��������  ��  ��  � ��� Z     �������� F     +��� >    #��� o     !���� 0 annotcomment annotComment� m   ! "��
�� 
msng� >  & )��� o   & '���� 0 annotcomment annotComment� m   ' (�� ���  � k   . ��� ��� r   . 1��� o   . /���� 0 annotcomment annotComment� o      ���� $0 processedcomment processedComment� ��� l  2 2��������  ��  ��  � ��� l  2 2������  � Y S ensure that a first-level heading at the top of the annotation comment stays there   � ��� �   e n s u r e   t h a t   a   f i r s t - l e v e l   h e a d i n g   a t   t h e   t o p   o f   t h e   a n n o t a t i o n   c o m m e n t   s t a y s   t h e r e� ��� l  2 2������  � ? 9 (even when annotation text gets inserted as a quotation)   � ��� r   ( e v e n   w h e n   a n n o t a t i o n   t e x t   g e t s   i n s e r t e d   a s   a   q u o t a t i o n )� ��� r   2 5��� m   2 3�� ��� 4 ^ ( ? : \ s * [ \ r \ n ] ) * ( # [   \ t ] + . + )� o      ���� 00 firstlevelheadingregex firstLevelHeadingRegex� ��� r   6 C��� n  6 A��� I   ; A������� 0 
regexmatch 
regexMatch� ��� o   ; <���� 0 annotcomment annotComment� ���� o   < =���� 00 firstlevelheadingregex firstLevelHeadingRegex��  ��  � o   6 ;���� 0 keypointslib KeypointsLib� o      ���� &0 firstlevelheading firstLevelHeading� ��� Z   D r ����  >  D G o   D E���� &0 firstlevelheading firstLevelHeading m   E F �   k   J n  r   J X	
	 n  J V I   O V������ 0 regexreplace regexReplace  o   O P���� &0 firstlevelheading firstLevelHeading  o   P Q���� 00 firstlevelheadingregex firstLevelHeadingRegex �� m   Q R �  $ 1��  ��   o   J O���� 0 keypointslib KeypointsLib
 o      ���� &0 firstlevelheading firstLevelHeading  s   Y ] o   Y Z���� &0 firstlevelheading firstLevelHeading n        :   [ \ o   Z [���� (0 recordcontentparts recordContentParts  l  ^ ^��������  ��  ��   �� r   ^ n n  ^ l !  I   c l��"���� 0 regexreplace regexReplace" #$# o   c d���� $0 processedcomment processedComment$ %&% b   d g'(' o   d e���� 00 firstlevelheadingregex firstLevelHeadingRegex( m   e f)) �** & [ \ r \ n ] ? ( \ s * [ \ r \ n ] ) *& +��+ m   g h,, �--  ��  ��  ! o   ^ c���� 0 keypointslib KeypointsLib o      ���� $0 processedcomment processedComment��  ��  ��  � ./. l  s s��������  ��  ��  / 010 l  s s��23��  2 r l for the record content, add the remaining annotation comment w/o any metadata lines (which start with "< ")   3 �44 �   f o r   t h e   r e c o r d   c o n t e n t ,   a d d   t h e   r e m a i n i n g   a n n o t a t i o n   c o m m e n t   w / o   a n y   m e t a d a t a   l i n e s   ( w h i c h   s t a r t   w i t h   " <   " )1 565 r   s �787 n  s ~9:9 I   x ~��;���� F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines; <=< o   x y���� $0 processedcomment processedComment= >�> m   y z�~
�~ boovfals�  ��  : o   s x�}�} 0 keypointslib KeypointsLib8 o      �|�| $0 processedcomment processedComment6 ?@? l  � ��{�z�y�{  �z  �y  @ A�xA s   � �BCB o   � ��w�w $0 processedcomment processedCommentC n      DED  ;   � �E o   � ��v�v (0 recordcontentparts recordContentParts�x  ��  ��  � FGF l  � ��u�t�s�u  �t  �s  G HIH Z   � �JK�rLJ >  � �MNM o   � ��q�q (0 recordcontentparts recordContentPartsN J   � ��p�p  K r   � �OPO n  � �QRQ I   � ��oS�n�o  0 mergetextitems mergeTextItemsS TUT o   � ��m�m (0 recordcontentparts recordContentPartsU V�lV b   � �WXW 1   � ��k
�k 
lnfdX 1   � ��j
�j 
lnfd�l  �n  R o   � ��i�i 0 keypointslib KeypointsLibP o      �h�h  0 recordcontents recordContents�r  L r   � �YZY m   � �[[ �\\  ( n o   c o n t e n t )Z o      �g�g  0 recordcontents recordContentsI ]^] l  � ��f�e�d�f  �e  �d  ^ _�c_ L   � �`` o   � ��b�b  0 recordcontents recordContents�c  � aba l     �a�`�_�a  �`  �_  b cdc l     �^�]�\�^  �]  �\  d efe l     �[gh�[  g R L Assembles the name of a Markdown record from the given PDF annotation text,   h �ii �   A s s e m b l e s   t h e   n a m e   o f   a   M a r k d o w n   r e c o r d   f r o m   t h e   g i v e n   P D F   a n n o t a t i o n   t e x t ,f jkj l     �Zlm�Z  l   comment and page label.   m �nn 0   c o m m e n t   a n d   p a g e   l a b e l .k opo i  qrq I      �Ys�X�Y B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationDatas tut o      �W�W 0 	annottext 	annotTextu vwv o      �V�V 0 annotcomment annotCommentw x�Ux o      �T�T 0 	pagelabel 	pageLabel�U  �X  r k     �yy z{z r     |}| J     �S�S  } o      �R�R "0 recordnameparts recordNameParts{ ~~ Z    ���Q�P� F    ��� >   ��� o    �O�O 0 	pagelabel 	pageLabel� m    �N
�N 
msng� >   ��� o    �M�M 0 	pagelabel 	pageLabel� m    �� ���  � s    ��� b    ��� m    �� ���  p� l   ��L�K� c    ��� o    �J�J 0 	pagelabel 	pageLabel� m    �I
�I 
TEXT�L  �K  � n      ���  ;    � o    �H�H "0 recordnameparts recordNameParts�Q  �P   ��� l     �G�F�E�G  �F  �E  � ��� r     #��� m     !�� ���  � o      �D�D  0 recordnamepart recordNamePart� ��� Z   $ }���C�B� F   $ /��� >  $ '��� o   $ %�A�A 0 annotcomment annotComment� m   % &�@
�@ 
msng� >  * -��� o   * +�?�? 0 annotcomment annotComment� m   + ,�� ���  � k   2 y�� ��� l  2 2�>���>  � f ` for the record's name, use any first-level heading (if there's one in the annotation's comment)   � ��� �   f o r   t h e   r e c o r d ' s   n a m e ,   u s e   a n y   f i r s t - l e v e l   h e a d i n g   ( i f   t h e r e ' s   o n e   i n   t h e   a n n o t a t i o n ' s   c o m m e n t )� ��� r   2 ?��� n  2 =��� I   7 =�=��<�= 40 markdownheadingsfromtext markdownHeadingsFromText� ��� o   7 8�;�; 0 annotcomment annotComment� ��:� m   8 9�� ���  #�:  �<  � o   2 7�9�9 0 keypointslib KeypointsLib� o      �8�8 $0 markdownheadings markdownHeadings� ��� Z   @ S���7�6� >  @ D��� o   @ A�5�5 $0 markdownheadings markdownHeadings� J   A C�4�4  � r   G O��� n   G M��� o   K M�3�3 0 heading  � n   G K��� 4  H K�2�
�2 
cobj� m   I J�1�1 � o   G H�0�0 $0 markdownheadings markdownHeadings� o      �/�/  0 recordnamepart recordNamePart�7  �6  � ��� l  T T�.�-�,�.  �-  �,  � ��� l  T T�+���+  � H B otherwise, use up to 12 words from the beginning of the "comment"   � ��� �   o t h e r w i s e ,   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " c o m m e n t "� ��*� Z   T y���)�(� =  T W��� o   T U�'�'  0 recordnamepart recordNamePart� m   U V�� ���  � k   Z u�� ��� r   Z g��� n  Z e��� I   _ e�&��%�& F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines� ��� o   _ `�$�$ 0 annotcomment annotComment� ��#� m   ` a�"
�" boovtrue�#  �%  � o   Z _�!�! 0 keypointslib KeypointsLib� o      � �  0 annotcomment annotComment� ��� r   h u��� n  h s��� I   m s���� (0 firstwordsfromtext firstWordsFromText� ��� o   m n�� 0 annotcomment annotComment� ��� m   n o�� �  �  � o   h m�� 0 keypointslib KeypointsLib� o      ��  0 recordnamepart recordNamePart�  �)  �(  �*  �C  �B  � ��� l  ~ ~����  �  �  � ��� l  ~ ~����  � E ? else use up to 12 words from the beginning of the "annotText"    � ��� ~   e l s e   u s e   u p   t o   1 2   w o r d s   f r o m   t h e   b e g i n n i n g   o f   t h e   " a n n o t T e x t "  � ��� Z   ~ ������ =  ~ ���� o   ~ ��  0 recordnamepart recordNamePart� m    ��� ���  � k   � ��� ��� r   � ���� n  � ���� I   � �� �� (0 firstwordsfromtext firstWordsFromText   o   � ��� 0 	annottext 	annotText � m   � ��� �  �  � o   � ��� 0 keypointslib KeypointsLib� o      �
�
  0 recordnamepart recordNamePart� �	 Z   � ��� >  � � o   � ���  0 recordnamepart recordNamePart m   � �		 �

   k   � �  l  � ���   e _ wrap the extracted text in quotes to indicate that it's quoted text (and not your own comment)    � �   w r a p   t h e   e x t r a c t e d   t e x t   i n   q u o t e s   t o   i n d i c a t e   t h a t   i t ' s   q u o t e d   t e x t   ( a n d   n o t   y o u r   o w n   c o m m e n t ) � r   � � b   � � b   � � m   � � �  " o   � ���  0 recordnamepart recordNamePart m   � � �  " o      ��  0 recordnamepart recordNamePart�  �  �  �	  �  �  �  l  � ��� ���  �   ��    Z  � � !����  =  � �"#" o   � �����  0 recordnamepart recordNamePart# m   � �$$ �%%  ! r   � �&'& m   � �(( �))  ( u n t i t l e d )' o      ����  0 recordnamepart recordNamePart��  ��   *+* s   � �,-, o   � �����  0 recordnamepart recordNamePart- n      ./.  ;   � �/ o   � ����� "0 recordnameparts recordNameParts+ 010 l  � ���������  ��  ��  1 232 Z   � �45��64 >  � �787 o   � ����� "0 recordnameparts recordNameParts8 J   � �����  5 r   � �9:9 n  � �;<; I   � ���=����  0 mergetextitems mergeTextItems= >?> o   � ����� "0 recordnameparts recordNameParts? @��@ m   � �AA �BB  :  ��  ��  < o   � ����� 0 keypointslib KeypointsLib: o      ���� 0 
recordname 
recordName��  6 r   � �CDC m   � �EE �FF  ( u n t i t l e d )D o      ���� 0 
recordname 
recordName3 GHG l  � ���������  ��  ��  H I��I L   � �JJ o   � ����� 0 
recordname 
recordName��  p KLK l     ��������  ��  ��  L MNM l     ��������  ��  ��  N OPO l     ��QR��  Q U O Creates a new (Markdown) record in DEVONthink with the given text & properties   R �SS �   C r e a t e s   a   n e w   ( M a r k d o w n )   r e c o r d   i n   D E V O N t h i n k   w i t h   t h e   g i v e n   t e x t   &   p r o p e r t i e sP TUT l     ��VW��  V [ U and returns it. If an existing record with the same URL exists at the same location,   W �XX �   a n d   r e t u r n s   i t .   I f   a n   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   e x i s t s   a t   t h e   s a m e   l o c a t i o n ,U YZY l     ��[\��  [ 9 3 this record will get updated and returned instead.   \ �]] f   t h i s   r e c o r d   w i l l   g e t   u p d a t e d   a n d   r e t u r n e d   i n s t e a d .Z ^_^ l     ��`a��  ` _ Y Note that the actual return value is a list with two items with the first item being the   a �bb �   N o t e   t h a t   t h e   a c t u a l   r e t u r n   v a l u e   i s   a   l i s t   w i t h   t w o   i t e m s   w i t h   t h e   f i r s t   i t e m   b e i n g   t h e_ cdc l     ��ef��  e Z T created/modified record and the second item being a boolean value indicating if the   f �gg �   c r e a t e d / m o d i f i e d   r e c o r d   a n d   t h e   s e c o n d   i t e m   b e i n g   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h ed hih l     ��jk��  j L F returned record actually has been modified ('true') or not (`false`):   k �ll �   r e t u r n e d   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) :i mnm l     ��op��  o "  `{dtRecord, didUpdateNote}`   p �qq 8   ` { d t R e c o r d ,   d i d U p d a t e N o t e } `n rsr l     ��tu��  t 6 0 Credits: modified after script code by Rob Trew   u �vv `   C r e d i t s :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e ws wxw l     ��yz��  y l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   z �{{ �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p tx |}| i  ~~ I      �������  0 createdtrecord createDTRecord� ��� o      ����  0 folderlocation folderLocation� ��� o      ����  0 foldermetadata folderMetadata� ��� o      ���� 0 
recordname 
recordName� ��� o      ���� 0 recordaliases recordAliases� ��� o      ���� 0 	recordurl 	recordURL� ��� o      ���� 0 
recordtags 
recordTags� ��� o      ���� 0 	isflagged 	isFlagged� ��� o      ���� 0 
recordtext 
recordText� ��� o      ���� (0 recordcreationdate recordCreationDate� ��� o      ���� 00 recordmodificationdate recordModificationDate� ��� o      ����  0 recordmetadata recordMetadata� ��� o      ���� 0 recordrating recordRating� ���� o      ���� $0 recordlabelindex recordLabelIndex��  ��   O    ��� k   �� ��� r    ��� K    �� ����
�� 
DTty� m   	 
��
�� Ctypmkdn� ����
�� 
DTcn� o    ���� 0 
recordtext 
recordText� �����
�� 
pnam� o    ���� 0 
recordname 
recordName��  � o      ���� 0 newrecorddata newRecordData� ��� l   ��������  ��  ��  � ��� Z    %������� >   ��� o    ���� (0 recordcreationdate recordCreationDate� m    ��
�� 
msng� r    !��� b    ��� o    ���� 0 newrecorddata newRecordData� K    �� �����
�� 
DTcr� o    ���� (0 recordcreationdate recordCreationDate��  � o      ���� 0 newrecorddata newRecordData��  ��  � ��� l  & &��������  ��  ��  � ��� Z   & 8������� >  & )��� o   & '���� 0 	recordurl 	recordURL� m   ' (�� ���  � r   , 4��� b   , 2��� o   , -���� 0 newrecorddata newRecordData� K   - 1�� �����
�� 
pURL� o   . /���� 0 	recordurl 	recordURL��  � o      ���� 0 newrecorddata newRecordData��  ��  � ��� l  9 9��������  ��  ��  � ��� Z   9 K������� >  9 <��� o   9 :���� 0 recordaliases recordAliases� m   : ;�� ���  � r   ? G��� b   ? E��� o   ? @���� 0 newrecorddata newRecordData� K   @ D�� �����
�� 
DTal� o   A B���� 0 recordaliases recordAliases��  � o      ���� 0 newrecorddata newRecordData��  ��  � ��� l  L L��������  ��  ��  � ��� r   L O��� m   L M��
�� 
msng� o      ���� 0 arecord aRecord� ��� r   P S��� m   P Q��
�� boovfals� o      ���� 0 didcreatenote didCreateNote� ��� r   T Y��� m   T U��
�� boovfals� o      ���� 0 didupdatenote didUpdateNote� ��� l  Z Z��������  ��  ��  � ��� l  Z Z������  � Q K use any existing record with the same URL that exists at the same location   � ��� �   u s e   a n y   e x i s t i n g   r e c o r d   w i t h   t h e   s a m e   U R L   t h a t   e x i s t s   a t   t h e   s a m e   l o c a t i o n� ��� r   Z _��� m   Z [��
�� boovfals� o      ���� $0 isexistingrecord isExistingRecord� ��� Z   ` �������� >  ` c��� o   ` a���� 0 	recordurl 	recordURL� m   a b�� ���  � k   f ��� ��� r   f o��� I  f k�����
�� .DTpacd49list       utxt� o   f g���� 0 	recordurl 	recordURL��  � o      ���� "0 existingrecords existingRecords� ���� Z   p �������� >  p v� � o   p s���� "0 existingrecords existingRecords  J   s u����  � k   y �  r   y � b   y � b   y �	 n   y ~

 1   z ~��
�� 
DTlo o   y z����  0 folderlocation folderLocation	 n   ~ � 1    ���
�� 
pnam o   ~ ��  0 folderlocation folderLocation m   � � �  / o      �~�~  0 targetlocation targetLocation �} X   � ��| Z   � ��{�z F   � � l  � ��y�x =  � � o   � ��w�w 0 arecord aRecord m   � ��v
�v 
msng�y  �x   l  � ��u�t =   � � n   � � 1   � ��s
�s 
DTlo o   � ��r�r  0 existingrecord existingRecord o   � ��q�q  0 targetlocation targetLocation�u  �t   k   � �  !  r   � �"#" o   � ��p�p  0 existingrecord existingRecord# o      �o�o 0 arecord aRecord! $�n$ r   � �%&% m   � ��m
�m boovtrue& o      �l�l $0 isexistingrecord isExistingRecord�n  �{  �z  �|  0 existingrecord existingRecord o   � ��k�k "0 existingrecords existingRecords�}  ��  ��  ��  ��  ��  � '(' l  � ��j�i�h�j  �i  �h  ( )*) Z   �+,�g�f+ =  � �-.- o   � ��e�e 0 arecord aRecord. m   � ��d
�d 
msng, k   �// 010 r   � �232 I  � ��c45
�c .DTpacd08DTrc       reco4 o   � ��b�b 0 newrecorddata newRecordData5 �a6�`
�a 
DTin6 o   � ��_�_  0 folderlocation folderLocation�`  3 o      �^�^ 0 arecord aRecord1 787 l  � ��]�\�[�]  �\  �[  8 9:9 l  � ��Z;<�Z  ; c ] newly created Markdown notes inherit their notes folder's existing metadata & Finder comment   < �== �   n e w l y   c r e a t e d   M a r k d o w n   n o t e s   i n h e r i t   t h e i r   n o t e s   f o l d e r ' s   e x i s t i n g   m e t a d a t a   &   F i n d e r   c o m m e n t: >?> r   � �@A@ b   � �BCB o   � ��Y�Y  0 recordmetadata recordMetadataC o   � ��X�X  0 foldermetadata folderMetadataA o      �W�W  0 recordmetadata recordMetadata? DED r   � �FGF n  � �HIH 1   � ��V
�V 
DTcoI o   � ��U�U  0 folderlocation folderLocationG n     JKJ 1   � ��T
�T 
DTcoK o   � ��S�S 0 arecord aRecordE LML l  � ��R�Q�P�R  �Q  �P  M NON r   � �PQP m   � ��O
�O boovtrueQ o      �N�N 0 didcreatenote didCreateNoteO R�MR r   �STS [   �UVU o   ��L�L &0 creatednotescount createdNotesCountV m  �K�K T o      �J�J &0 creatednotescount createdNotesCount�M  �g  �f  * WXW l �I�H�G�I  �H  �G  X YZY Z  [\�F�E[ G  #]^] = _`_ o  �D�D $0 isexistingrecord isExistingRecord` m  �C
�C boovfals^ = aba o  �B�B *0 updateexistingnotes updateExistingNotesb m  �A
�A boovtrue\ k  &cc ded Z  &Kfg�@�?f = &-hih o  &+�>�> 80 updatenameforexistingnotes updateNameForExistingNotesi m  +,�=
�= boovtrueg Z  0Gjk�<�;j >  05lml n  03non 1  13�:
�: 
pnamo o  01�9�9 0 arecord aRecordm o  34�8�8 0 
recordname 
recordNamek k  8Cpp qrq r  8=sts m  89�7
�7 boovtruet o      �6�6 0 didupdatenote didUpdateNoter u�5u r  >Cvwv o  >?�4�4 0 
recordname 
recordNamew n      xyx 1  @B�3
�3 
pnamy o  ?@�2�2 0 arecord aRecord�5  �<  �;  �@  �?  e z{z l LL�1�0�/�1  �0  �/  { |}| Z  Lu~�.�-~ = LS��� o  LQ�,�, F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes� m  QR�+
�+ boovtrue Z  Vq���*�)� >  V]��� n  V[��� 1  W[�(
�( 
DTpl� o  VW�'�' 0 arecord aRecord� o  [\�&�& 0 
recordtext 
recordText� k  `m�� ��� r  `e��� m  `a�%
�% boovtrue� o      �$�$ 0 didupdatenote didUpdateNote� ��#� r  fm��� o  fg�"�" 0 
recordtext 
recordText� n      ��� 1  hl�!
�! 
DTpl� o  gh� �  0 arecord aRecord�#  �*  �)  �.  �-  } ��� l vv����  �  �  � ��� Z  v������ F  v���� l v����� G  v���� = v{��� o  vy�� $0 isexistingrecord isExistingRecord� m  yz�
� boovfals� = ~���� o  ~��� P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes� m  ���
� boovtrue�  �  � > ����� o  ���� 00 recordmodificationdate recordModificationDate� m  ���
� 
msng� k  ���� ��� l ������  � j d TODO: should we force update recordModificationDate when an existing record's property got updated?   � ��� �   T O D O :   s h o u l d   w e   f o r c e   u p d a t e   r e c o r d M o d i f i c a t i o n D a t e   w h e n   a n   e x i s t i n g   r e c o r d ' s   p r o p e r t y   g o t   u p d a t e d ?� ��� Z  ������� >  ����� n  ����� 1  ���
� 
DTmo� o  ���� 0 arecord aRecord� o  ���� 00 recordmodificationdate recordModificationDate� k  ���� ��� r  ����� m  ���
� boovtrue� o      �
�
 0 didupdatenote didUpdateNote� ��	� r  ����� o  ���� 00 recordmodificationdate recordModificationDate� n      ��� 1  ���
� 
DTmo� o  ���� 0 arecord aRecord�	  �  �  �  �  �  � ��� l ������  �  �  � ��� Z  ������� G  ����� = ����� o  ��� �  $0 isexistingrecord isExistingRecord� m  ����
�� boovfals� = ����� o  ������ J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes� m  ����
�� boovtrue� Z  ��������� >  ����� n  ����� 1  ����
�� 
DTst� o  ������ 0 arecord aRecord� o  ������ 0 	isflagged 	isFlagged� k  ���� ��� r  ����� m  ����
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote� ���� r  ����� o  ������ 0 	isflagged 	isFlagged� n      ��� 1  ����
�� 
DTst� o  ������ 0 arecord aRecord��  ��  ��  �  �  � ��� l ����������  ��  ��  � ��� Z  �!������� G  ����� = ����� o  ������ $0 isexistingrecord isExistingRecord� m  ����
�� boovfals� = ����� o  ������ <0 updateratingforexistingnotes updateRatingForExistingNotes� m  ����
�� boovtrue� Z  ������� >  	��� n  ��� 1  ��
�� 
DTrt� o  ���� 0 arecord aRecord� o  ���� 0 recordrating recordRating� k  �� ��� r  ��� m  ��
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote� ���� r  ��� o  ���� 0 recordrating recordRating� n      ��� 1  ��
�� 
DTrt� o  ���� 0 arecord aRecord��  ��  ��  ��  ��  � ��� l ""��������  ��  ��  � ��� Z  "W������� G  "5��� = "'��� o  "%���� $0 isexistingrecord isExistingRecord� m  %&��
�� boovfals� = *1��� o  */���� :0 updatelabelforexistingnotes updateLabelForExistingNotes� m  /0��
�� boovtrue� Z  8S������� >  8?   n  8= 1  9=��
�� 
DTla o  89���� 0 arecord aRecord o  =>���� $0 recordlabelindex recordLabelIndex� k  BO  r  BG m  BC��
�� boovtrue o      ���� 0 didupdatenote didUpdateNote 	��	 r  HO

 o  HI���� $0 recordlabelindex recordLabelIndex n       1  JN��
�� 
DTla o  IJ���� 0 arecord aRecord��  ��  ��  ��  ��  �  l XX��������  ��  ��    Z  X����� F  Xv l Xk���� G  Xk = X] o  X[���� $0 isexistingrecord isExistingRecord m  [\��
�� boovfals = `g o  `e���� 80 updatetagsforexistingnotes updateTagsForExistingNotes m  ef��
�� boovtrue��  ��   > nr o  no���� 0 
recordtags 
recordTags J  oq����   k  y�  !  r  y�"#" n  y~$%$ 1  z~��
�� 
tags% o  yz���� 0 arecord aRecord# o      ���� (0 existingrecordtags existingRecordTags! &'& X  ��(��)( Z ��*+����* H  ��,, E ��-.- o  ������ (0 existingrecordtags existingRecordTags. o  ������ 0 atag aTag+ r  ��/0/ m  ����
�� boovtrue0 o      ���� 0 didupdatenote didUpdateNote��  ��  �� 0 atag aTag) o  ������ 0 
recordtags 
recordTags' 1��1 r  ��232 b  ��454 o  ������ (0 existingrecordtags existingRecordTags5 o  ������ 0 
recordtags 
recordTags3 n      676 1  ����
�� 
tags7 o  ������ 0 arecord aRecord��  ��  ��   898 l ����������  ��  ��  9 :;: Z  ��<=����< l ��>����> G  ��?@? = ��ABA o  ������ $0 isexistingrecord isExistingRecordB m  ����
�� boovfals@ = ��CDC o  ������ L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotesD m  ����
�� boovtrue��  ��  = Z  ��EF����E l ��G����G n ��HIH I  ����J���� 60 updatemetadatafordtrecord updateMetadataForDTRecordJ KLK o  ������ 0 arecord aRecordL M��M o  ������  0 recordmetadata recordMetadata��  ��  I  f  ����  ��  F r  ��NON m  ����
�� boovtrueO o      ���� 0 didupdatenote didUpdateNote��  ��  ��  ��  ; PQP l ����������  ��  ��  Q R��R Z  �ST����S F  ��UVU = ��WXW o  ������ 0 didupdatenote didUpdateNoteX m  ����
�� boovtrueV = ��YZY o  ������ 0 didcreatenote didCreateNoteZ m  ����
�� boovfalsT r  [\[ [  ]^] o  ���� &0 updatednotescount updatedNotesCount^ m  ���� \ o      ���� &0 updatednotescount updatedNotesCount��  ��  ��  �F  �E  Z _`_ l ��������  ��  ��  ` a��a L  bb J  cc ded o  ���� 0 arecord aRecorde f��f o  ���� 0 didupdatenote didUpdateNote��  ��  � 5     ��g��
�� 
cappg m    hh �ii  D N t p
�� kfrmID  } jkj l     ����~��  �  �~  k lml l     �}�|�{�}  �|  �{  m non l     �zpq�z  p > 8 Sets the custom metadata of the given DEVONthink group.   q �rr p   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .o sts l     �yuv�y  u U O @param folderLocation The DEVONthink group whose custom metadata shall be set.   v �ww �   @ p a r a m   f o l d e r L o c a t i o n   T h e   D E V O N t h i n k   g r o u p   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .t xyx l     �xz{�x  z M G @param folderMetadata The record of custom metadata that shall be set.   { �|| �   @ p a r a m   f o l d e r M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .y }~} i  � I      �w��v�w 00 setmetadatafordtfolder setMetadataForDTFolder� ��� o      �u�u  0 folderlocation folderLocation� ��t� o      �s�s  0 foldermetadata folderMetadata�t  �v  � Z     5���r�q� F      ��� F     ��� F     ��� =    ��� o     �p�p P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders� m    �o
�o boovtrue� >  
 ��� o   
 �n�n  0 folderlocation folderLocation� m    �m
�m 
msng� >   ��� o    �l�l  0 foldermetadata folderMetadata� m    �k
�k 
msng� >   ��� o    �j�j  0 foldermetadata folderMetadata� J    �i�i  � O  # 1��� r   + 0��� o   + ,�h�h  0 foldermetadata folderMetadata� n      ��� 1   - /�g
�g 
DTcm� o   , -�f�f  0 folderlocation folderLocation� 5   # (�e��d
�e 
capp� m   % &�� ���  D N t p
�d kfrmID  �r  �q  ~ ��� l     �c�b�a�c  �b  �a  � ��� l     �`�_�^�`  �_  �^  � ��� l     �]���]  � ? 9 Sets the custom metadata of the given DEVONthink record.   � ��� r   S e t s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .� ��� l     �\���\  � O I @param aRecord The DEVONthink record whose custom metadata shall be set.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   s e t .� ��� l     �[���[  � M G @param recordMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i   ��� I      �Z��Y�Z 00 setmetadatafordtrecord setMetadataForDTRecord� ��� o      �X�X 0 arecord aRecord� ��W� o      �V�V  0 recordmetadata recordMetadata�W  �Y  � Z     )���U�T� F     ��� F     ��� >    ��� o     �S�S 0 arecord aRecord� m    �R
�R 
msng� >   	��� o    �Q�Q  0 recordmetadata recordMetadata� m    �P
�P 
msng� >   ��� o    �O�O  0 recordmetadata recordMetadata� J    �N�N  � O   %��� r    $��� o     �M�M  0 recordmetadata recordMetadata� n      ��� 1   ! #�L
�L 
DTcm� o     !�K�K 0 arecord aRecord� 5    �J��I
�J 
capp� m    �� ���  D N t p
�I kfrmID  �U  �T  � ��� l     �H�G�F�H  �G  �F  � ��� l     �E�D�C�E  �D  �C  � ��� l     �B���B  � l f Updates the custom metadata of the given DEVONthink record. Returns a boolean value indicating if the   � ��� �   U p d a t e s   t h e   c u s t o m   m e t a d a t a   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d .   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   i f   t h e� ��� l     �A���A  � I C given record actually has been modified ('true') or not (`false`).   � ��� �   g i v e n   r e c o r d   a c t u a l l y   h a s   b e e n   m o d i f i e d   ( ' t r u e ' )   o r   n o t   ( ` f a l s e ` ) .� ��� l     �@���@  � S M @param aRecord The DEVONthink record whose custom metadata shall be updated.   � ��� �   @ p a r a m   a R e c o r d   T h e   D E V O N t h i n k   r e c o r d   w h o s e   c u s t o m   m e t a d a t a   s h a l l   b e   u p d a t e d .� ��� l     �?���?  � M G @param recordMetadata The record of custom metadata that shall be set.   � ��� �   @ p a r a m   r e c o r d M e t a d a t a   T h e   r e c o r d   o f   c u s t o m   m e t a d a t a   t h a t   s h a l l   b e   s e t .� ��� i  !$��� I      �>��=�> 60 updatemetadatafordtrecord updateMetadataForDTRecord� ��� o      �<�< 0 arecord aRecord� ��;� o      �:�:  0 recordmetadata recordMetadata�;  �=  � k     ��� ��� Z    ���9�8� G     ��� G     ��� =    ��� o     �7�7 0 arecord aRecord� m    �6
�6 
msng� =   	��� o    �5�5  0 recordmetadata recordMetadata� m    �4
�4 
msng� =   ��� o    �3�3  0 recordmetadata recordMetadata� J    �2�2  � L    �� m    �1
�1 boovfals�9  �8  � ��� l   �0�/�.�0  �/  �.  �    r    ! m    �-
�- boovfals o      �,�, 0 didupdatenote didUpdateNote  l  " "�+�*�)�+  �*  �)    O   " �	 k   * �

  r   * / n   * - 1   + -�(
�( 
DTcm o   * +�'�' 0 arecord aRecord o      �&�& 00 existingrecordmetadata existingRecordMetadata  Q   0 M k   3 A  l  3 3�%�%   Y S existingRecordMetadata may be undefined in which case this triggers the error case    � �   e x i s t i n g R e c o r d M e t a d a t a   m a y   b e   u n d e f i n e d   i n   w h i c h   c a s e   t h i s   t r i g g e r s   t h e   e r r o r   c a s e �$ Z  3 A�#�" =  3 6  o   3 4�!�! 00 existingrecordmetadata existingRecordMetadata  m   4 5� 
�  
msng r   9 =!"! J   9 ;��  " o      �� 00 existingrecordmetadata existingRecordMetadata�#  �"  �$   R      ���
� .ascrerr ****      � ****�  �   r   I M#$# J   I K��  $ o      �� 00 existingrecordmetadata existingRecordMetadata %&% l  N N����  �  �  & '(' Z   N �)*��) >  N R+,+ o   N O�� 00 existingrecordmetadata existingRecordMetadata, J   O Q��  * k   U �-- ./. r   U a010 n  U _232 I   Z _�4�� 0 keysofrecord_ keysOfRecord_4 5�5 o   Z [�� 00 existingrecordmetadata existingRecordMetadata�  �  3 o   U Z�� 0 keypointslib KeypointsLib1 o      �� 0 existingkeys existingKeys/ 676 r   b n898 n  b l:;: I   g l�<�
� 0 keysofrecord_ keysOfRecord_< =�	= o   g h��  0 recordmetadata recordMetadata�	  �
  ; o   b g�� 0 keypointslib KeypointsLib9 o      �� 0 thekeys theKeys7 >?> l  o o����  �  �  ? @A@ l  o o�BC�  B � � NOTE: updating non-empty values for existing keys doesn't seem to work unless we clear the key's value or remove the key entirely   C �DD   N O T E :   u p d a t i n g   n o n - e m p t y   v a l u e s   f o r   e x i s t i n g   k e y s   d o e s n ' t   s e e m   t o   w o r k   u n l e s s   w e   c l e a r   t h e   k e y ' s   v a l u e   o r   r e m o v e   t h e   k e y   e n t i r e l yA EFE X   o �G�HG k    �II JKJ r    �LML n   �NON I   � �� P���  F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForNameP Q��Q o   � ����� 0 thekey theKey��  ��  O  f    �M o      ���� 0 dtkey dtKeyK RSR l  � ���������  ��  ��  S T��T Z   � �UV��WU E  � �XYX o   � ����� 0 existingkeys existingKeysY o   � ����� 0 dtkey dtKeyV k   � �ZZ [\[ r   � �]^] l  � �_����_ n  � �`a` I   � ���b���� .0 valueforkey_inrecord_ valueForKey_inRecord_b cdc o   � ����� 0 thekey theKeyd e��e o   � �����  0 recordmetadata recordMetadata��  ��  a o   � ����� 0 keypointslib KeypointsLib��  ��  ^ o      ���� 0 thevalue theValue\ fgf r   � �hih l  � �j����j n  � �klk I   � ���m���� .0 valueforkey_inrecord_ valueForKey_inRecord_m non o   � ����� 0 dtkey dtKeyo p��p o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  l o   � ����� 0 keypointslib KeypointsLib��  ��  i o      ���� 0 existingvalue existingValueg qrq l  � ���������  ��  ��  r s��s Z   � �tu����t >   � �vwv o   � ����� 0 thevalue theValuew o   � ����� 0 existingvalue existingValueu k   � �xx yzy r   � �{|{ m   � ���
�� boovtrue| o      ���� 0 didupdatenote didUpdateNotez }��} r   � �~~ l  � ������� n  � ���� I   � �������� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_� ��� l  � ������� m   � ���
�� 
msng��  ��  � ��� o   � ����� 0 dtkey dtKey� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib��  ��   o      ���� 00 existingrecordmetadata existingRecordMetadata��  ��  ��  ��  ��  W r   � ���� m   � ���
�� boovtrue� o      ���� 0 didupdatenote didUpdateNote��  � 0 thekey theKeyH o   r s���� 0 thekeys theKeysF ��� l  � ���������  ��  ��  � ���� r   � ���� n  � ���� I   � �������� <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_� ��� o   � �����  0 recordmetadata recordMetadata� ���� o   � ����� 00 existingrecordmetadata existingRecordMetadata��  ��  � o   � ����� 0 keypointslib KeypointsLib� o      ����  0 recordmetadata recordMetadata��  �  �  ( ��� l  � ���������  ��  ��  � ���� r   � ���� o   � �����  0 recordmetadata recordMetadata� n      ��� 1   � ���
�� 
DTcm� o   � ����� 0 arecord aRecord��  	 5   " '�����
�� 
capp� m   $ %�� ���  D N t p
�� kfrmID   ��� l  � ���������  ��  ��  � ���� L   � ��� o   � ����� 0 didupdatenote didUpdateNote��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � [ U Returns the metadata identifier name that DEVONthink would use in scripting contexts   � ��� �   R e t u r n s   t h e   m e t a d a t a   i d e n t i f i e r   n a m e   t h a t   D E V O N t h i n k   w o u l d   u s e   i n   s c r i p t i n g   c o n t e x t s� ��� l     ������  �   for the given key name.   � ��� 0   f o r   t h e   g i v e n   k e y   n a m e .� ��� i  %(��� I      ������� F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName� ���� o      ���� 0 thekey theKey��  ��  � k      �� ��� r     ��� n    
��� I    
������� 0 lowercasetext lowercaseText� ���� o    ���� 0 thekey theKey��  ��  � o     ���� 0 keypointslib KeypointsLib� o      ���� 0 dtkey dtKey� ��� r    ��� n   ��� I    ������� 0 regexreplace regexReplace� ��� o    ���� 0 dtkey dtKey� ��� m    �� ���  \ s +� ���� m    �� ���  ��  ��  � o    ���� 0 keypointslib KeypointsLib� o      ���� 0 dtkey dtKey� ��� l   ��������  ��  ��  � ���� L     �� b    ��� m    �� ���  m d� o    ���� 0 dtkey dtKey��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � T N Appends the given string to the Finder comment of the given DEVONthink group.   � ��� �   A p p e n d s   t h e   g i v e n   s t r i n g   t o   t h e   F i n d e r   c o m m e n t   o f   t h e   g i v e n   D E V O N t h i n k   g r o u p .� ��� i  ),��� I      ������� 60 appendtocommentofdtfolder appendToCommentOfDTFolder� ��� o      ����  0 folderlocation folderLocation� ���� o      ���� 0 foldercomment folderComment��  ��  � Z     T������� F     ��� >    ��� o     ���� 0 foldercomment folderComment� m    ��
�� 
msng� >   
��� o    ���� 0 foldercomment folderComment� J    	����  � k    P�� ��� r    ��� J    ����  � o      �� 0 commentparts commentParts� ��~� O    P��� k    O�� ��� r    !��� l    �}�|  n     1    �{
�{ 
DTco o    �z�z  0 folderlocation folderLocation�}  �|  � o      �y�y .0 existingfoldercomment existingFolderComment�  Z  " 8�x�w F   " - >  " %	
	 o   " #�v�v .0 existingfoldercomment existingFolderComment
 m   # $�u
�u 
msng >  ( + o   ( )�t�t .0 existingfoldercomment existingFolderComment m   ) * �   s   0 4 o   0 1�s�s .0 existingfoldercomment existingFolderComment n        ;   2 3 o   1 2�r�r 0 commentparts commentParts�x  �w    s   9 = o   9 :�q�q 0 foldercomment folderComment n        ;   ; < o   : ;�p�p 0 commentparts commentParts  l  > >�o�n�m�o  �n  �m   �l r   > O n  > K I   C K�k �j�k  0 mergetextitems mergeTextItems  !"! o   C D�i�i 0 commentparts commentParts" #�h# b   D G$%$ 1   D E�g
�g 
lnfd% 1   E F�f
�f 
lnfd�h  �j   o   > C�e�e 0 keypointslib KeypointsLib n      &'& 1   L N�d
�d 
DTco' o   K L�c�c  0 folderlocation folderLocation�l  � 5    �b(�a
�b 
capp( m    )) �**  D N t p
�a kfrmID  �~  ��  ��  � +,+ l     �`�_�^�`  �_  �^  , -.- l     �]�\�[�]  �\  �[  . /0/ l     �Z12�Z  1 c ] Returns a record of bibliographic metadata for the given DOI (as fetched from OpenAlex.org),   2 �33 �   R e t u r n s   a   r e c o r d   o f   b i b l i o g r a p h i c   m e t a d a t a   f o r   t h e   g i v e n   D O I   ( a s   f e t c h e d   f r o m   O p e n A l e x . o r g ) ,0 454 l     �Y67�Y  6 9 3 ready to be used as custom metadata in DEVONthink.   7 �88 f   r e a d y   t o   b e   u s e d   a s   c u s t o m   m e t a d a t a   i n   D E V O N t h i n k .5 9:9 l     �X;<�X  ; L F @param doi The DOI for which bibliographic metadata shall be fetched.   < �== �   @ p a r a m   d o i   T h e   D O I   f o r   w h i c h   b i b l i o g r a p h i c   m e t a d a t a   s h a l l   b e   f e t c h e d .: >?> l     �W@A�W  @ ` Z @param citekey The citekey to be used with the fetched BibTeX data; may be empty in which   A �BB �   @ p a r a m   c i t e k e y   T h e   c i t e k e y   t o   b e   u s e d   w i t h   t h e   f e t c h e d   B i b T e X   d a t a ;   m a y   b e   e m p t y   i n   w h i c h? CDC l     �VEF�V  E + % case a default citekey will be used.   F �GG J   c a s e   a   d e f a u l t   c i t e k e y   w i l l   b e   u s e d .D HIH l     �UJK�U  J ` Z TODO: allow to specify which metadata shall get exported into which custom metadata field   K �LL �   T O D O :   a l l o w   t o   s p e c i f y   w h i c h   m e t a d a t a   s h a l l   g e t   e x p o r t e d   i n t o   w h i c h   c u s t o m   m e t a d a t a   f i e l dI MNM i  -0OPO I      �TQ�S�T &0 bibmetadatafordoi bibMetadataForDOIQ RSR o      �R�R 0 doi  S T�QT o      �P�P 0 citekey  �Q  �S  P k    UU VWV Z    XY�O�NX G     Z[Z =    \]\ o     �M�M 0 doi  ] m    �L
�L 
msng[ =   	^_^ o    �K�K 0 doi  _ m    `` �aa  Y L    bb J    �J�J  �O  �N  W cdc l   �I�H�G�I  �H  �G  d efe r    /ghg n   -iji I    -�Fk�E�F  0 metadatafordoi metadataForDOIk lml o    �D�D 0 doi  m non o    !�C�C 0 fetchbibtex fetchBibTeXo pqp o   ! &�B�B 00 fetchformattedcitation fetchFormattedCitationq rsr m   & 'tt �uu  a p as vwv m   ' (xx �yy 
 e n - G Bw z�Az o   ( )�@�@ 0 citekey  �A  �E  j o    �?�? 0 keypointslib KeypointsLibh o      �>�> "0 publicationdata publicationDataf {|{ Z  0 >}~�=�<} =  0 4� o   0 1�;�; "0 publicationdata publicationData� J   1 3�:�:  ~ L   7 :�� J   7 9�9�9  �=  �<  | ��� l  ? ?�8�7�6�8  �7  �6  � ��� r   ? C��� J   ? A�5�5  � o      �4�4 0 bibmetadata bibMetadata� ��� l  D D�3�2�1�3  �2  �1  � ��� l  D Q���� r   D Q��� n  D O��� I   I O�0��/�0 .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m   I J�� ���  a u t h o r s� ��.� o   J K�-�- "0 publicationdata publicationData�.  �/  � o   D I�,�, 0 keypointslib KeypointsLib� o      �+�+ 0 
pubauthors 
pubAuthors� 4 . single author: string, multiple authors: list   � ��� \   s i n g l e   a u t h o r :   s t r i n g ,   m u l t i p l e   a u t h o r s :   l i s t� ��� Z   R ����*�)� F   R f��� F   R ]��� >  R U��� o   R S�(�( 0 
pubauthors 
pubAuthors� m   S T�'
�' 
msng� >  X [��� o   X Y�&�& 0 
pubauthors 
pubAuthors� m   Y Z�� ���  � >  ` d��� o   ` a�%�% 0 
pubauthors 
pubAuthors� J   a c�$�$  � k   i ��� ��� r   i {��� b   i y��� o   i j�#�# 0 bibmetadata bibMetadata� K   j x�� �"��!�" 0 authors  � l  k v�� �� n  k v��� I   p v����  0 mergetextitems mergeTextItems� ��� o   p q�� 0 
pubauthors 
pubAuthors� ��� 1   q r�
� 
lnfd�  �  � o   k p�� 0 keypointslib KeypointsLib�   �  �!  � o      �� 0 bibmetadata bibMetadata� ��� l  | |����  �  �  � ��� r   | ���� I  | ����
� .corecnte****       ****� o   | }�� 0 
pubauthors 
pubAuthors�  � o      �� "0 pubauthorscount pubAuthorsCount� ��� Z   � ������ =  � ���� o   � ��� "0 pubauthorscount pubAuthorsCount� m   � ��� � r   � ���� b   � ���� o   � ��� 0 bibmetadata bibMetadata� K   � ��� ���� 
0 author  � n   � ���� 4  � ��
�
�
 
cobj� m   � ��	�	 � o   � ��� 0 
pubauthors 
pubAuthors�  � o      �� 0 bibmetadata bibMetadata� ��� =  � ���� o   � ��� "0 pubauthorscount pubAuthorsCount� m   � ��� � ��� r   � ���� b   � ���� o   � ��� 0 bibmetadata bibMetadata� K   � ��� ���� 
0 author  � b   � ���� b   � ���� n   � ���� 4  � �� �
�  
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors� m   � ��� ���    &  � n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors�  � o      ���� 0 bibmetadata bibMetadata�  � l  � ����� r   � ���� b   � ���� o   � ����� 0 bibmetadata bibMetadata� K   � ��� ������� 
0 author  � b   � ���� n   � ���� 4  � ����
�� 
cobj� m   � ����� � o   � ����� 0 
pubauthors 
pubAuthors� m   � ��� ���    e t   a l .��  � o      ���� 0 bibmetadata bibMetadata�  
 3 or more   � ���    3   o r   m o r e�  �*  �)  � ��� l  � ���������  ��  ��  � ��� r   � ���� n  � �� � I   � ������� .0 valueforkey_inrecord_ valueForKey_inRecord_  m   � � �  d a t e �� o   � ����� "0 publicationdata publicationData��  ��    o   � ����� 0 keypointslib KeypointsLib� o      ���� 0 pubdate pubDate�  Z  � �	
����	 >  � � o   � ����� 0 pubdate pubDate m   � ���
�� 
msng
 r   � � b   � � o   � ����� 0 bibmetadata bibMetadata K   � � ������ 0 date   c   � � o   � ����� 0 pubdate pubDate m   � ���
�� 
ldt ��   o      ���� 0 bibmetadata bibMetadata��  ��    l  � ���������  ��  ��    r   � n  � � I   � ������� .0 valueforkey_inrecord_ valueForKey_inRecord_  m   � �   �!!  p u b l i s h e r "��" o   � ����� "0 publicationdata publicationData��  ��   o   � ����� 0 keypointslib KeypointsLib o      ���� 0 pubpublisher pubPublisher #$# Z  %&����% F  '(' > )*) o  ���� 0 pubpublisher pubPublisher* m  ��
�� 
msng( > +,+ o  	���� 0 pubpublisher pubPublisher, m  	-- �..  & r  /0/ b  121 o  ���� 0 bibmetadata bibMetadata2 K  33 ��4���� 0 	publisher  4 o  ���� 0 pubpublisher pubPublisher��  0 o      ���� 0 bibmetadata bibMetadata��  ��  $ 565 l !!��������  ��  ��  6 787 r  !09:9 n !.;<; I  &.��=���� .0 valueforkey_inrecord_ valueForKey_inRecord_= >?> m  &)@@ �AA  i s s n? B��B o  )*���� "0 publicationdata publicationData��  ��  < o  !&���� 0 keypointslib KeypointsLib: o      ���� 0 pubissn pubISSN8 CDC Z 1OEF����E F  1>GHG > 14IJI o  12���� 0 pubissn pubISSNJ m  23��
�� 
msngH > 7<KLK o  78���� 0 pubissn pubISSNL m  8;MM �NN  F r  AKOPO b  AIQRQ o  AB���� 0 bibmetadata bibMetadataR K  BHSS ��T���� 0 is?n  T o  EF���� 0 pubissn pubISSN��  P o      ���� 0 bibmetadata bibMetadata��  ��  D UVU l PP��������  ��  ��  V WXW r  P_YZY n P][\[ I  U]��]���� .0 valueforkey_inrecord_ valueForKey_inRecord_] ^_^ m  UX`` �aa  j o u r n a l_ b��b o  XY���� "0 publicationdata publicationData��  ��  \ o  PU���� 0 keypointslib KeypointsLibZ o      ���� 0 
pubjournal 
pubJournalX cdc Z `~ef����e F  `mghg > `ciji o  `a���� 0 
pubjournal 
pubJournalj m  ab��
�� 
msngh > fkklk o  fg���� 0 
pubjournal 
pubJournall m  gjmm �nn  f r  pzopo b  pxqrq o  pq���� 0 bibmetadata bibMetadatar K  qwss ��t���� 0 journal  t o  tu���� 0 
pubjournal 
pubJournal��  p o      ���� 0 bibmetadata bibMetadata��  ��  d uvu l ��������  ��  ��  v wxw r  �yzy n �{|{ I  ����}���� .0 valueforkey_inrecord_ valueForKey_inRecord_} ~~ m  ���� ���  v o l u m e ���� o  ������ "0 publicationdata publicationData��  ��  | o  ����� 0 keypointslib KeypointsLibz o      ���� 0 	pubvolume 	pubVolumex ��� r  ����� n ����� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ��� 
 i s s u e� ���� o  ������ "0 publicationdata publicationData��  ��  � o  ������ 0 keypointslib KeypointsLib� o      ���� 0 pubissue pubIssue� ��� Z  ��������� F  ����� > ����� o  ������ 0 	pubvolume 	pubVolume� m  ����
�� 
msng� > ����� o  ������ 0 	pubvolume 	pubVolume� m  ���� ���  � k  ���� ��� Z ��������� F  ����� > ����� o  ������ 0 pubissue pubIssue� m  ����
�� 
msng� > ����� o  ������ 0 pubissue pubIssue� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ������ 0 	pubvolume 	pubVolume� m  ���� ���  (� o  ������ 0 pubissue pubIssue� m  ���� ���  )� o      ���� 0 	pubvolume 	pubVolume��  ��  � ���� r  ����� b  ����� o  ������ 0 bibmetadata bibMetadata� K  ���� ������� 
0 volume  � o  ������ 0 	pubvolume 	pubVolume��  � o      ���� 0 bibmetadata bibMetadata��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� n ����� I  ��������� .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  ���� ���  p a g e� ��� o  ���~�~ "0 publicationdata publicationData�  ��  � o  ���}�} 0 keypointslib KeypointsLib� o      �|�| 0 pubpages pubPages� ��� Z ����{�z� F  ����� > ����� o  ���y�y 0 pubpages pubPages� m  ���x
�x 
msng� > ����� o  ���w�w 0 pubpages pubPages� m  ���� ���  � r   
��� b   ��� o   �v�v 0 bibmetadata bibMetadata� K  �� �u��t�u 0 page  � o  �s�s 0 pubpages pubPages�t  � o      �r�r 0 bibmetadata bibMetadata�{  �z  � ��� l �q�p�o�q  �p  �o  � ��� r  ��� n ��� I  �n��m�n .0 valueforkey_inrecord_ valueForKey_inRecord_� ��� m  �� ���  c i t a t i o n� ��l� o  �k�k "0 publicationdata publicationData�l  �m  � o  �j�j 0 keypointslib KeypointsLib� o      �i�i 0 pubcitation pubCitation� ��� Z =���h�g� F  ,��� > "��� o   �f�f 0 pubcitation pubCitation� m   !�e
�e 
msng� > %*��� o  %&�d�d 0 pubcitation pubCitation� m  &)�� ���  � r  /9��� b  /7��� o  /0�c�c 0 bibmetadata bibMetadata� K  06�� �b��a�b 0 	reference  � o  34�`�` 0 pubcitation pubCitation�a  � o      �_�_ 0 bibmetadata bibMetadata�h  �g  � ��� l >>�^�]�\�^  �]  �\  � ��� r  >M� � n >K I  CK�[�Z�[ .0 valueforkey_inrecord_ valueForKey_inRecord_  m  CF �  b i b t e x �Y o  FG�X�X "0 publicationdata publicationData�Y  �Z   o  >C�W�W 0 keypointslib KeypointsLib  o      �V�V 0 	pubbibtex 	pubBibTeX� 	
	 Z Nl�U�T F  N[ > NQ o  NO�S�S 0 	pubbibtex 	pubBibTeX m  OP�R
�R 
msng > TY o  TU�Q�Q 0 	pubbibtex 	pubBibTeX m  UX �   r  ^h b  ^f o  ^_�P�P 0 bibmetadata bibMetadata K  _e �O�N�O 
0 bibtex   o  bc�M�M 0 	pubbibtex 	pubBibTeX�N   o      �L�L 0 bibmetadata bibMetadata�U  �T  
  l mm�K�J�I�K  �J  �I    r  m|  n mz!"! I  rz�H#�G�H .0 valueforkey_inrecord_ valueForKey_inRecord_# $%$ m  ru&& �''  u r l% (�F( o  uv�E�E "0 publicationdata publicationData�F  �G  " o  mr�D�D 0 keypointslib KeypointsLib  o      �C�C 0 publink pubLink )*) Z }�+,�B�A+ F  }�-.- > }�/0/ o  }~�@�@ 0 publink pubLink0 m  ~�?
�? 
msng. > ��121 o  ���>�> 0 publink pubLink2 m  ��33 �44  , r  ��565 b  ��787 o  ���=�= 0 bibmetadata bibMetadata8 K  ��99 �<:�;�< 0 link  : o  ���:�: 0 publink pubLink�;  6 o      �9�9 0 bibmetadata bibMetadata�B  �A  * ;<; l ���8�7�6�8  �7  �6  < =>= r  ��?@? n ��ABA I  ���5C�4�5 .0 valueforkey_inrecord_ valueForKey_inRecord_C DED m  ��FF �GG  p m i dE H�3H o  ���2�2 "0 publicationdata publicationData�3  �4  B o  ���1�1 0 keypointslib KeypointsLib@ o      �0�0 0 pubpmid pubPMID> IJI Z ��KL�/�.K F  ��MNM > ��OPO o  ���-�- 0 pubpmid pubPMIDP m  ���,
�, 
msngN > ��QRQ o  ���+�+ 0 pubpmid pubPMIDR m  ��SS �TT  L r  ��UVU b  ��WXW o  ���*�* 0 bibmetadata bibMetadataX K  ��YY �)Z�(�) 0 pmid  Z o  ���'�' 0 pubpmid pubPMID�(  V o      �&�& 0 bibmetadata bibMetadata�/  �.  J [\[ l ���%�$�#�%  �$  �#  \ ]^] r  ��_`_ n ��aba I  ���"c�!�" .0 valueforkey_inrecord_ valueForKey_inRecord_c ded m  ��ff �gg 
 p m c i de h� h o  ���� "0 publicationdata publicationData�   �!  b o  ���� 0 keypointslib KeypointsLib` o      �� 0 pubpmcid pubPMCID^ iji Z �	kl��k F  ��mnm > ��opo o  ���� 0 pubpmcid pubPMCIDp m  ���
� 
msngn > ��qrq o  ���� 0 pubpmcid pubPMCIDr m  ��ss �tt  l r  �uvu b  �wxw o  ���� 0 bibmetadata bibMetadatax K  �yy �z�� 	0 pmcid  z o  � �� 0 pubpmcid pubPMCID�  v o      �� 0 bibmetadata bibMetadata�  �  j {|{ l 

����  �  �  | }�} L  
~~ o  
�� 0 bibmetadata bibMetadata�  N � l     ����  �  �  � ��� l     �
�	��
  �	  �  � ��� l     ����  � L F Maps the given color name to a DEVONthink label index and returns it.   � ��� �   M a p s   t h e   g i v e n   c o l o r   n a m e   t o   a   D E V O N t h i n k   l a b e l   i n d e x   a n d   r e t u r n s   i t .� ��� i  14��� I      ���� 00 labelindexforcolorname labelIndexForColorName� ��� o      �� 0 	colorname 	colorName�  �  � k     >�� ��� Z    ����� G     ��� =    ��� o     � �  0 	colorname 	colorName� m    ��
�� 
msng� =   	��� o    ���� 0 	colorname 	colorName� m    �� ���  � L    �� m    ����  �  �  � ��� l   ��������  ��  ��  � ��� r    ��� m    ����  � o      ���� $0 recordlabelindex recordLabelIndex� ��� r    +��� l   )������ n   )��� I    )������� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_� ��� m    �� ���  c o l o r N a m e� ��� o     ���� 0 	colorname 	colorName� ���� o     %���� 0 labelmappings labelMappings��  ��  � o    ���� 0 keypointslib KeypointsLib��  ��  � o      ���� 0 labelmapping labelMapping� ��� Z   , ;������� >  , /��� o   , -���� 0 labelmapping labelMapping� m   - .��
�� 
msng� r   2 7��� n  2 5��� o   3 5���� 0 
labelindex 
labelIndex� o   2 3���� 0 labelmapping labelMapping� o      ���� $0 recordlabelindex recordLabelIndex��  ��  � ��� l  < <��������  ��  ��  � ���� L   < >�� o   < =���� $0 recordlabelindex recordLabelIndex��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � f ` This method serves as a hook which gets called for every annotation with an annotation comment.   � ��� �   T h i s   m e t h o d   s e r v e s   a s   a   h o o k   w h i c h   g e t s   c a l l e d   f o r   e v e r y   a n n o t a t i o n   w i t h   a n   a n n o t a t i o n   c o m m e n t .� ��� l     ������  � h b It can be used to transform the given annotation comment (which may contain custom markup syntax)   � ��� �   I t   c a n   b e   u s e d   t o   t r a n s f o r m   t h e   g i v e n   a n n o t a t i o n   c o m m e n t   ( w h i c h   m a y   c o n t a i n   c u s t o m   m a r k u p   s y n t a x )� ��� l     ������  � E ? into a Keypoints-style format that's supported by this script.   � ��� ~   i n t o   a   K e y p o i n t s - s t y l e   f o r m a t   t h a t ' s   s u p p o r t e d   b y   t h i s   s c r i p t .� ��� i  58��� I      ������� :0 preprocessannotationcomment preprocessAnnotationComment� ���� o      ���� 0 acomment aComment��  ��  � k     r�� ��� l    ���� L     �� o     ���� 0 acomment aComment� ] W comment out this line (i.e., prefix it with "--") if you want to use custom code below   � ��� �   c o m m e n t   o u t   t h i s   l i n e   ( i . e . ,   p r e f i x   i t   w i t h   " - - " )   i f   y o u   w a n t   t o   u s e   c u s t o m   c o d e   b e l o w� ��� l   ��������  ��  ��  � ��� l   ������  � b \ NOTE: below code is just an example that shows how you could transform the given annotation   � ��� �   N O T E :   b e l o w   c o d e   i s   j u s t   a n   e x a m p l e   t h a t   s h o w s   h o w   y o u   c o u l d   t r a n s f o r m   t h e   g i v e n   a n n o t a t i o n� ��� l   ������  � [ U           comment so that it matches the Keypoints-style format used by this script.   � ��� �                       c o m m e n t   s o   t h a t   i t   m a t c h e s   t h e   K e y p o i n t s - s t y l e   f o r m a t   u s e d   b y   t h i s   s c r i p t .� ��� l   ��������  ��  ��  � ��� l   ������  �   convert tags   � ���    c o n v e r t   t a g s� ��� l   ������  � e _ - input: an annotation comment containing a separate line that starts with �Tags:� followed by   � ��� �   -   i n p u t :   a n   a n n o t a t i o n   c o m m e n t   c o n t a i n i n g   a   s e p a r a t e   l i n e   t h a t   s t a r t s   w i t h    T a g s :    f o l l o w e d   b y� ��� l   ������  � l f             comma-separated values that represent the tags, e.g.: "Tags: some tag, another tag, test"   � ��� �                           c o m m a - s e p a r a t e d   v a l u e s   t h a t   r e p r e s e n t   t h e   t a g s ,   e . g . :   " T a g s :   s o m e   t a g ,   a n o t h e r   t a g ,   t e s t "� ��� l   ��� ��  � \ V - output: an annotation comment containing a Keypoints-style metadata line with tags,     � �   -   o u t p u t :   a n   a n n o t a t i o n   c o m m e n t   c o n t a i n i n g   a   K e y p o i n t s - s t y l e   m e t a d a t a   l i n e   w i t h   t a g s ,�  l   ����   9 3             e.g.: "< @some tag @another tag @test"    � f                           e . g . :   " <   @ s o m e   t a g   @ a n o t h e r   t a g   @ t e s t "  r    	
	 J    ����  
 o      ���� $0 transformedlines transformedLines  r     m    	 � * ( ? < = ^ | [ \ r \ n ] ) T a g s : \ s * o      ���� 0 tagslineregex tagsLineRegex  r     m     � 4 ( ? < = ^ < | [ \ r \ n ] < ) \ s + | \ s * , \ s * o      ���� &0 tagdelimiterregex tagDelimiterRegex  l   ��������  ��  ��    X    _�� k   " Z  Z   " S !����  >  " /"#" l  " -$����$ n  " -%&% I   ' -��'���� 0 
regexmatch 
regexMatch' ()( o   ' (���� 0 aline aLine) *��* o   ( )���� 0 tagslineregex tagsLineRegex��  ��  & o   " '���� 0 keypointslib KeypointsLib��  ��  # m   - .++ �,,  ! k   2 O-- ./. r   2 @010 n  2 >232 I   7 >��4���� 0 regexreplace regexReplace4 565 o   7 8���� 0 aline aLine6 787 o   8 9���� 0 tagslineregex tagsLineRegex8 9��9 m   9 ::: �;;  <  ��  ��  3 o   2 7���� 0 keypointslib KeypointsLib1 o      ���� 0 aline aLine/ <��< r   A O=>= n  A M?@? I   F M��A���� 0 regexreplace regexReplaceA BCB o   F G���� 0 aline aLineC DED o   G H���� &0 tagdelimiterregex tagDelimiterRegexE F��F m   H IGG �HH    @��  ��  @ o   A F���� 0 keypointslib KeypointsLib> o      ���� 0 aline aLine��  ��  ��   I��I s   T ZJKJ c   T WLML o   T U���� 0 aline aLineM m   U V��
�� 
ctxtK n      NON  ;   X YO o   W X���� $0 transformedlines transformedLines��  �� 0 aline aLine n    PQP 2   ��
�� 
cparQ o    ���� 0 acomment aComment RSR l  ` `��������  ��  ��  S TUT r   ` oVWV b   ` mXYX n  ` kZ[Z I   e k��\����  0 mergetextitems mergeTextItems\ ]^] o   e f���� $0 transformedlines transformedLines^ _��_ 1   f g��
�� 
lnfd��  ��  [ o   ` e���� 0 keypointslib KeypointsLibY 1   k l��
�� 
lnfdW o      ���� &0 transformedstring transformedStringU `a` l  p p��������  ��  ��  a b��b L   p rcc o   p q���� &0 transformedstring transformedString��  � d��d l     ����  �  �  ��       D�e��fghijkl��������������~�}�|�{J`��mnopqrstuvw�z�y�x�w�v�uxyz{|}~������������  e B�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�4�3�t ,0 notefoldernameprefix noteFolderNamePrefix�s ,0 notefoldernamesuffix noteFolderNameSuffix�r 
0 label1  �q 
0 label2  �p 
0 label3  �o 
0 label4  �n 
0 label5  �m 
0 label6  �l 
0 label7  �k *0 updateexistingnotes updateExistingNotes�j 80 updatenameforexistingnotes updateNameForExistingNotes�i F0 !updatetextcontentforexistingnotes !updateTextContentForExistingNotes�h P0 &updatemodificationdateforexistingnotes &updateModificationDateForExistingNotes�g J0 #updateflaggedstatusforexistingnotes #updateFlaggedStatusForExistingNotes�f <0 updateratingforexistingnotes updateRatingForExistingNotes�e :0 updatelabelforexistingnotes updateLabelForExistingNotes�d 80 updatetagsforexistingnotes updateTagsForExistingNotes�c L0 $updatecustommetadataforexistingnotes $updateCustomMetadataForExistingNotes�b P0 &updatecustommetadataforexistingfolders &updateCustomMetadataForExistingFolders�a ,0 selectupdatedrecords selectUpdatedRecords�` $0 fetchdoimetadata fetchDOIMetadata�_ 00 alwaysfetchdoimetadata alwaysFetchDOIMetadata�^ 0 fetchbibtex fetchBibTeX�] :0 appendbibtextofindercomment appendBibTeXToFinderComment�\ 00 fetchformattedcitation fetchFormattedCitation�[ P0 &appendformattedcitationtofindercomment &appendFormattedCitationToFinderComment�Z &0 citationstylename citationStyleName�Y  0 citationlocale citationLocale�X ,0 linewidthenlargement lineWidthEnlargement�W .0 lineheightenlargement lineHeightEnlargement�V "0 redcolormapping redColorMapping�U (0 orangecolormapping orangeColorMapping�T (0 yellowcolormapping yellowColorMapping�S &0 greencolormapping greenColorMapping�R $0 cyancolormapping cyanColorMapping�Q .0 lightbluecolormapping lightBlueColorMapping�P ,0 darkbluecolormapping darkBlueColorMapping�O (0 purplecolormapping purpleColorMapping�N $0 pinkcolormapping pinkColorMapping�M 0 colormappings colorMappings�L 0 labelmappings labelMappings�K <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts�J  0 maxtextcolumns maxTextColumns�I 0 
pagemargin 
pageMargin�H &0 creatednotescount createdNotesCount�G &0 updatednotescount updatedNotesCount�F 0 pdfcount pdfCount
�E 
pimr�D 0 keypointslib KeypointsLib�C $0 performsmartrule performSmartRule
�B .aevtoappnull  �   � ****�A 0 processpdfs processPDFs�@ $0 checkappsrunning checkAppsRunning�? L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations�> :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�= H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData�< B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�;  0 createdtrecord createDTRecord�: 00 setmetadatafordtfolder setMetadataForDTFolder�9 00 setmetadatafordtrecord setMetadataForDTRecord�8 60 updatemetadatafordtrecord updateMetadataForDTRecord�7 F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�6 60 appendtocommentofdtfolder appendToCommentOfDTFolder�5 &0 bibmetadatafordoi bibMetadataForDOI�4 00 labelindexforcolorname labelIndexForColorName�3 :0 preprocessannotationcomment preprocessAnnotationCommentf �2�1��2 0 
labelindex 
labelIndex�1 � �0��/�0 0 	colorname 	colorName�/  g �.�-��. 0 
labelindex 
labelIndex�- � �,��+�, 0 	colorname 	colorName�+  h �*�)��* 0 
labelindex 
labelIndex�) � �(��'�( 0 	colorname 	colorName�'  i �&�%��& 0 
labelindex 
labelIndex�% � �$��#�$ 0 	colorname 	colorName�#  j �"�!��" 0 
labelindex 
labelIndex�! � � ��  0 	colorname 	colorName�  k ���� 0 
labelindex 
labelIndex� � ��� 0 	colorname 	colorName�  l ���� 0 
labelindex 
labelIndex� � ��� 0 	colorname 	colorName�  
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
� boovtrue
� boovtrue
� boovfals
�~ boovfals
�} boovfals
�| boovtrue
�{ boovtruem ���� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit�^� ���� 0 upperhuelimit upperHueLimit� �  n ���� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit� � ���� 0 upperhuelimit upperHueLimit� ,�  o �
���
 0 	colorname 	colorName� �	���	 0 lowerhuelimit lowerHueLimit� -� ���� 0 upperhuelimit upperHueLimit� A�  p ���� 0 	colorname 	colorName� ���� 0 lowerhuelimit lowerHueLimit� B� �� ��� 0 upperhuelimit upperHueLimit�  ���  q ������ 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit�� ���  r ������ 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit�� ���  s ������ 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit�� ���  t ������ 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit�� �� �������� 0 upperhuelimit upperHueLimit��D��  u ��	��� 0 	colorname 	colorName� ������� 0 lowerhuelimit lowerHueLimit��E� �������� 0 upperhuelimit upperHueLimit��]��  v ����� 	� 	 mnopqrstuw ����� �  fghijkl
�z boovtrue�y �x �w  �v  �u  x ����� �  �� �����
�� 
cobj� ��   ���
�� 
scpt��  y ��   ���
�� 
scptz ������������� $0 performsmartrule performSmartRule�� ����� �  ���� 0 
therecords 
theRecords��  � ���������� 0 
therecords 
theRecords�� 0 annotatedpdfs annotatedPDFs��  0 updatedrecords updatedRecords�� &0 completiondetails completionDetails� 
����+��-/1;>���� L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations�� 0 processpdfs processPDFs
�� 
lnfd�� *0 displaynotification displayNotification�� H)�k+  E�O�jv )�k+ E�Y hO�b  .%�%�%b  ,%�%�%b  -%E�Ob  0���m+ 	{ ��[��������
�� .aevtoappnull  �   � ****��  ��  �  � ��������������������������������������� $0 checkappsrunning checkAppsRunning
�� 
capp
�� kfrmID  
�� 
DTsl
�� 
list�� 0 
selrecords 
selRecords�� L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations�� 0 annotatedpdfs annotatedPDFs� � � 0 displayerror displayError� 0 processpdfs processPDFs�  0 updatedrecords updatedRecords
� 
bool
� 
brws� 0 frontwindow frontWindow
� .miscactvnull��� ��� null
� 
lnfd� &0 completiondetails completionDetails�  0 displaymessage displayMessage�� �)j+   hY hO)���0 +*�,�&E�O)�k+ E�O�jv  b  0���e�+ Y hUO)�k+ E�Ob  e 	 
�jva & ")�a �0 *a k/E` O�_ �,FUY hO)�a �0 C*j Oa b  .%_ %a %b  ,%_ %a %b  -%E` Ob  0a _ fj�+ U| �&������ 0 processpdfs processPDFs� ��� �  �� 0 
pdfrecords 
pdfRecords�  � ������� 0 
pdfrecords 
pdfRecords� &0 allupdatedrecords allUpdatedRecords� 0 i  � 0 	pdfrecord 	pdfRecord� 0 pdffilename pdfFilename�  0 updatedrecords updatedRecords� 0�����m���������� 0 setupprogress setupProgress
� .corecnte****       ****� 40 settotalstepsforprogress setTotalStepsForProgress
� 
cobj
� 
capp
� kfrmID  
� 
DTfn�  0 updateprogress updateProgress� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF� 0 flattenlist flattenList� �b  0�k+ OjEc  ,OjEc  -O�j Ec  .Ob  0b  .k+ OjvE�O \kb  .kh ��/E�O)���0 ��,E�UOb  0��%�%b  .%�%�%�%l+ O)�k+ E�O�jv 	��6GY h[OY��Ob  0�k+ } �������� $0 checkappsrunning checkAppsRunning�  �  �  � �������������
� 
capp
� kfrmID  
� 
prcs�  
� 
fcrt
� .corecnte****       ****� � � 0 displayerror displayError� 6)���0 +*�-�[�,\Z�81j k b  0���e�+ OfY hUOe~ �������� L0 $onlydevonthinkpdfswithpdfannotations $onlyDEVONthinkPDFsWithPDFAnnotations� ��� �  �� 0 
therecords 
theRecords�  � ���� 0 
therecords 
theRecords� 0 annotatedpdfs annotatedPDFs� 0 	therecord 	theRecord� 
�"��������
� 
capp
� kfrmID  
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
bool� AjvE�O)���0 1 .�[��l kh ��,� 	 	��,j�& 	��6GY h[OY��UO� �W�~�}���|� :0 createdevonthinknotesforpdf createDEVONthinkNotesForPDF�~ �{��{ �  �z�z 0 	pdfrecord 	pdfRecord�}  � 0�y�x�w�v�u�t�s�r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�y 0 	pdfrecord 	pdfRecord�x 0 pdfpath pdfPath�w 
0 pdfurl  �v "0 pdflocationpath pdfLocationPath�u 0 pdfmetadata pdfMetadata�t  0 notefoldername noteFolderName�s (0 folderlocationpath folderLocationPath�r  0 folderdidexist folderDidExist�q  0 folderlocation folderLocation�p 0 	folderurl 	folderURL�o  0 foldermetadata folderMetadata�n 0 	sourcedoi 	sourceDOI�m 0 sourcecitekey sourceCitekey�l 0 metadatadoi metadataDOI�k "0 metadatacitekey metadataCitekey�j (0 pdfannotationslist pdfAnnotationsList�i 0 bibmetadata bibMetadata�h &0 formattedcitation formattedCitation�g 0 
bibtexdata 
bibTeXData�f  0 updatedrecords updatedRecords�e 0 pdfannotation pdfAnnotation�d 0 acomment aComment�c 0 	annottext 	annotText�b 0 
apagelabel 
aPageLabel�a  0 recordcontents recordContents�` 0 
recordname 
recordName�_ "0 annotsortstring annotSortString�^ "0 positionfromtop positionFromTop�] 0 centiseconds centiSeconds�\ (0 recordcreationdate recordCreationDate�[ 00 recordmodificationdate recordModificationDate�Z 0 recordaliases recordAliases�Y 0 	recordurl 	recordURL�X 0 	annottype 	annotType�W  0 recordmetadata recordMetadata�V 0 	ausername 	aUserName�U 0 citekey  �T $0 customattributes customAttributes�S 0 
recordtags 
recordTags�R "0 customattribute customAttribute�Q 0 akey aKey�P 0 avalue aValue�O 0 existingvalue existingValue�N 0 	isflagged 	isFlagged�M 0 recordrating recordRating�L $0 recordlabelindex recordLabelIndex�K 0 dtrecord dtRecord�J $0 recordwasupdated recordWasUpdated� ]�I��H�G�F�E�D�C�B�A�@��?�>��=��	�<	�;�:	*	6�9�8�7�6�5�4�3�2�1�0�/�.�-	�	�	��,

�+�*�)�(
L�'
a�&�%�$�#�"�!� ����
������������\�s���������
�	�����
�I 
capp
�H kfrmID  
�G 
ppth
�F 
rURL
�E 
DTlo
�D 
DTcm
�C 
msng�B  �A  
�@ 
pnam
�? .DTpacd53bool       utxt
�> .DTpacd52DTrc       utxt
�= 
pURL�< .0 valueforkey_inrecord_ valueForKey_inRecord_
�; 
bool�: 0 matchdoi matchDOI�9 ,0 linewidthenlargement lineWidthEnlargement�8 .0 lineheightenlargement lineHeightEnlargement�7 "0 redcolormapping redColorMapping�6 0 colormappings colorMappings�5 <0 respectmulticolumnpdflayouts respectMultiColumnPDFLayouts�4  0 maxtextcolumns maxTextColumns�3 0 
pagemargin 
pageMargin�2 �1 &0 pdfannotationinfo pdfAnnotationInfo
�0 
cobj�/ 0 doi  �. 0 pdfannotations  �- 00 setmetadatafordtrecord setMetadataForDTRecord�, &0 bibmetadatafordoi bibMetadataForDOI�+ 0 
sourcefile 
sourceFile�* 0 citekey  �) �( 00 setmetadatafordtfolder setMetadataForDTFolder�' 60 appendtocommentofdtfolder appendToCommentOfDTFolder
�& 
kocl
�% .corecnte****       ****�$ 0 comment  
�# 
TEXT�" :0 preprocessannotationcomment preprocessAnnotationComment�! 0 	annottext 	annotText�  0 	pagelabel 	pageLabel� H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData� 0 
sortstring 
sortString� "0 positionfromtop positionFromTop
� 
ctxt���� 0 createddate createdDate
� 
ldt � 0 modifieddate modifiedDate� (0 keypointsidfordate keypointsIDForDate� 0 deeplink deepLink� 0 	annottype 	annotType�  0 annotationtype annotationType� "0 annotationorder annotationOrder� 0 username userName� 0 	createdby 	createdBy� 0 
sourcepage 
sourcePage� T0 (customattributesandtagsfromkeypointsnote (customAttributesAndTagsFromKeypointsNote� 0 	attribkey 	attribKey� 0 attribvalue attribValue� 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_�
 :0 recordfromlabels_andvalues_ recordFromLabels_andValues_�	 @0 keypointsnoteismarkedasflagged keypointsNoteIsMarkedAsFlagged� 60 keypointsnoteratingnumber keypointsNoteRatingNumber�  0 annotcolorname annotColorName� 00 labelindexforcolorname labelIndexForColorName� �  0 createdtrecord createDTRecord�|X)���0 ���,E�O��,E�O��,E�O��,E�O ��  	jvE�Y hW X  	jvE�Ob   ��,%b  %E�O��%�%E�O�j E�O�j E�O��,E�O��%��,FO��,E�O ��  	jvE�Y hW X  	jvE�UOa E�Oa E�O�jv ab  0a �l+ E�O��	 �a a & b  0�k+ E�Y hOb  0a �l+ E�O��	 �a a & �E�Y hY hOb  b  0a ,FOb  b  0a ,FOb  b  0a ,FOb  'b  0a ,FOb  )b  0a ,FOb  *b  0a ,FOb  +b  0a ,FOb  0����a  + !E[a "k/E�Z[a "l/E�ZO�a #�a $�a  %E�O)��l+ %OjvE^ Oa &E^ Oa 'E^ O�f 
 b  e a & �b  e 	 	��a &	 �a (a & E)��l+ )E^ O] jv ,b  0a *] l+ E^ Ob  0a +] l+ E^ Y hY hO�a ,�a -�a #�a .%E�O�] %E�O)��l+ /Y hO�f  hb  e 	 ] �a &	 ] a 0a & )�] l+ 1Y hOb  e 	 ] �a &	 ] a 2a & )�] l+ 1Y hY hOjvE^ Oh�[a 3a "l 4kh ] a 5,E^ O] � )] a 6&k+ 7E^ Y hO] a 8,E^ O] � ] a 6&E^ Y hO] a 9,E^ O)] ] l+ :E^ O)] ] ] m+ ;E^ O] a <,a 6&E^ O] a =,a 6&E^ Oa >] %[a ?\[Za @\Zi2E^ O] a A,a B&E^ O] a C,a B&E^ O] � b  0] ] l+ DE^ Y hO] a E,a 6&E^  O] a F,a 6&E^ !O] a $�a G] !a H] a .%E^ "O] a I,E^ #O] #�	 ] #a Ja & ] "a K] #a 6&l%E^ "Y hO] �	 ] a La & ] "a M] a 6&l%E^ "Y hO�� ] "a ,�l%E^ "Y hO] a -,E^ $O] $�	 ] $a Na & ] "a -] $l%E^ "Y hO��	 �a Oa & ] "a #�l%E^ "Y hOb  0] a Pkvl+ QE[a "k/E^ %Z[a "l/E^ &ZO �] %[a 3a "l 4kh '] 'a R,E^ (O] 'a S,E^ )Ob  0] (] "l+ E^ *O] *� #b  0] *a T%] )%] (] "m+ UE^ "Y ] "b  0] (kv] )kvl+ V%E^ "[OY��Ob  0] k+ WE^ +Ob  0] k+ XE^ ,O)] a Y,k+ ZE^ -O)��] ] ]  ] &] +] ] ] ] "] ,] -a [+ \E[a "k/E^ .Z[a "l/E^ /ZO] /e  ] .] 6GY h[OY��O] � ������� � H0 "recordcontentfrompdfannotationdata "recordContentFromPDFAnnotationData� ����� �  ������ 0 	annottext 	annotText�� 0 annotcomment annotComment�  � ���������������� 0 	annottext 	annotText�� 0 annotcomment annotComment�� (0 recordcontentparts recordContentParts�� $0 processedcomment processedComment�� 00 firstlevelheadingregex firstLevelHeadingRegex�� &0 firstlevelheading firstLevelHeading��  0 recordcontents recordContents� ��������������),������[
�� 
msng
�� 
bool
�� 
TEXT�� 0 
regexmatch 
regexMatch�� 0 regexreplace regexReplace�� F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines
�� 
lnfd��  0 mergetextitems mergeTextItems�  �jvE�O��	 ���& ��&%�6GY hO��	 ���& \�E�O�E�Ob  0��l+ E�O�� )b  0���m+ 
E�O��5GOb  0���%�m+ 
E�Y hOb  0�fl+ E�O��6GY hO�jv b  0���%l+ E�Y a E�O�� ��r���������� B0 recordnamefrompdfannotationdata recordNameFromPDFAnnotationData�� ����� �  �������� 0 	annottext 	annotText�� 0 annotcomment annotComment�� 0 	pagelabel 	pageLabel��  � ���������������� 0 	annottext 	annotText�� 0 annotcomment annotComment�� 0 	pagelabel 	pageLabel�� "0 recordnameparts recordNameParts��  0 recordnamepart recordNamePart�� $0 markdownheadings markdownHeadings�� 0 
recordname 
recordName� �������������������������	$(A��E
�� 
msng
�� 
bool
�� 
TEXT�� 40 markdownheadingsfromtext markdownHeadingsFromText
�� 
cobj�� 0 heading  �� F0 !keypointsnotewithoutmetadatalines !keypointsNoteWithoutMetadataLines�� �� (0 firstwordsfromtext firstWordsFromText��  0 mergetextitems mergeTextItems�� �jvE�O��	 ���& ��&%�6GY hO�E�O��	 ���& Lb  0��l+ E�O�jv ��k/�,E�Y hO��   b  0�el+ E�Ob  0��l+ E�Y hY hO��  *b  0��l+ E�O�a  a �%a %E�Y hY hO�a   
a E�Y hO��6GO�jv b  0�a l+ E�Y a E�O�� ������������  0 createdtrecord createDTRecord�� ����� �  ����������������������������  0 folderlocation folderLocation��  0 foldermetadata folderMetadata�� 0 
recordname 
recordName�� 0 recordaliases recordAliases�� 0 	recordurl 	recordURL�� 0 
recordtags 
recordTags�� 0 	isflagged 	isFlagged�� 0 
recordtext 
recordText�� (0 recordcreationdate recordCreationDate�� 00 recordmodificationdate recordModificationDate��  0 recordmetadata recordMetadata�� 0 recordrating recordRating�� $0 recordlabelindex recordLabelIndex��  � ����������������������������  0 folderlocation folderLocation��  0 foldermetadata folderMetadata�� 0 
recordname 
recordName� 0 recordaliases recordAliases� 0 	recordurl 	recordURL� 0 
recordtags 
recordTags� 0 	isflagged 	isFlagged� 0 
recordtext 
recordText� (0 recordcreationdate recordCreationDate� 00 recordmodificationdate recordModificationDate�  0 recordmetadata recordMetadata� 0 recordrating recordRating� $0 recordlabelindex recordLabelIndex� 0 newrecorddata newRecordData� 0 arecord aRecord� 0 didcreatenote didCreateNote� 0 didupdatenote didUpdateNote� $0 isexistingrecord isExistingRecord� "0 existingrecords existingRecords�  0 targetlocation targetLocation�  0 existingrecord existingRecord� (0 existingrecordtags existingRecordTags� 0 atag aTag�  �h�����������������������������
� 
capp
� kfrmID  
� 
DTty
� Ctypmkdn
� 
DTcn
� 
pnam� 
� 
msng
� 
DTcr
� 
pURL
� 
DTal
� .DTpacd49list       utxt
� 
DTlo
� 
kocl
� 
cobj
� .corecnte****       ****
� 
bool
� 
DTin
� .DTpacd08DTrc       reco
� 
DTco
� 
DTpl
� 
DTmo
� 
DTst
� 
DTrt
� 
DTla
� 
tags� 60 updatemetadatafordtrecord updateMetadataForDTRecord�� )���0�����E�O�� ��l%E�Y hO�� ��l%E�Y hO�� ���l%E�Y hO�E�OfE�OfE^ OfE^ O�� p�j E^ O] jv Y�a ,��,%a %E^ O A] [a a l kh �� 	 ] a ,]  a & ] E�OeE^ Y h[OY��Y hY hO��  4�a �l E�O��%E�O�a ,�a ,FOeE�Ob  ,kEc  ,Y hO] f 
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
eE^ Y hY hO] e 	 	�f a & b  -kEc  -Y hY hO�] lvU� �������� 00 setmetadatafordtfolder setMetadataForDTFolder� ��� �  ���  0 folderlocation folderLocation�  0 foldermetadata folderMetadata�  � ���  0 folderlocation folderLocation�  0 foldermetadata folderMetadata� ������
� 
msng
� 
bool
� 
capp
� kfrmID  
� 
DTcm� 6b  e 	 ���&	 ���&	 �jv�& )���0 ���,FUY h� �������� 00 setmetadatafordtrecord setMetadataForDTRecord� �~��~ �  �}�|�} 0 arecord aRecord�|  0 recordmetadata recordMetadata�  � �{�z�{ 0 arecord aRecord�z  0 recordmetadata recordMetadata� �y�x�w��v�u
�y 
msng
�x 
bool
�w 
capp
�v kfrmID  
�u 
DTcm� *��	 ���&	 �jv�& )���0 ���,FUY h� �t��s�r���q�t 60 updatemetadatafordtrecord updateMetadataForDTRecord�s �p��p �  �o�n�o 0 arecord aRecord�n  0 recordmetadata recordMetadata�r  � 
�m�l�k�j�i�h�g�f�e�d�m 0 arecord aRecord�l  0 recordmetadata recordMetadata�k 0 didupdatenote didUpdateNote�j 00 existingrecordmetadata existingRecordMetadata�i 0 existingkeys existingKeys�h 0 thekeys theKeys�g 0 thekey theKey�f 0 dtkey dtKey�e 0 thevalue theValue�d 0 existingvalue existingValue� �c�b�a��`�_�^�]�\�[�Z�Y�X�W�V�U
�c 
msng
�b 
bool
�a 
capp
�` kfrmID  
�_ 
DTcm�^  �]  �\ 0 keysofrecord_ keysOfRecord_
�[ 
kocl
�Z 
cobj
�Y .corecnte****       ****�X F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�W .0 valueforkey_inrecord_ valueForKey_inRecord_�V 60 setvalue_forkey_inrecord_ setValue_forKey_inRecord_�U <0 additemsfromrecord_torecord_ addItemsFromRecord_toRecord_�q �� 
 �� �&
 �jv �& fY hOfE�O)���0 ���,E�O ��  	jvE�Y hW X  jvE�O�jv �b  0�k+ E�Ob  0�k+ E�O a�[��l kh )�k+ E�O�� =b  0��l+ E�Ob  0��l+ E�O�� eE�Ob  0ৣm+ E�Y hY eE�[OY��Ob  0��l+ E�Y hO���,FUO�� �T��S�R���Q�T F0 !dtcustommetadataidentifierforname !dtCustomMetadataIdentifierForName�S �P��P �  �O�O 0 thekey theKey�R  � �N�M�N 0 thekey theKey�M 0 dtkey dtKey� �L���K��L 0 lowercasetext lowercaseText�K 0 regexreplace regexReplace�Q !b  0�k+  E�Ob  0���m+ E�O�%� �J��I�H���G�J 60 appendtocommentofdtfolder appendToCommentOfDTFolder�I �F��F �  �E�D�E  0 folderlocation folderLocation�D 0 foldercomment folderComment�H  � �C�B�A�@�C  0 folderlocation folderLocation�B 0 foldercomment folderComment�A 0 commentparts commentParts�@ .0 existingfoldercomment existingFolderComment� 	�?�>�=)�<�;�:�9
�? 
msng
�> 
bool
�= 
capp
�< kfrmID  
�; 
DTco
�: 
lnfd�9  0 mergetextitems mergeTextItems�G U��	 �jv�& FjvE�O)���0 5��,E�O��	 ���& 	��6GY hO��6GOb  0���%l+ ��,FUY h� �8P�7�6���5�8 &0 bibmetadatafordoi bibMetadataForDOI�7 �4��4 �  �3�2�3 0 doi  �2 0 citekey  �6  � �1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� �1 0 doi  �0 0 citekey  �/ "0 publicationdata publicationData�. 0 bibmetadata bibMetadata�- 0 
pubauthors 
pubAuthors�, "0 pubauthorscount pubAuthorsCount�+ 0 pubdate pubDate�* 0 pubpublisher pubPublisher�) 0 pubissn pubISSN�( 0 
pubjournal 
pubJournal�' 0 	pubvolume 	pubVolume�& 0 pubissue pubIssue�% 0 pubpages pubPages�$ 0 pubcitation pubCitation�# 0 	pubbibtex 	pubBibTeX�" 0 publink pubLink�! 0 pubpmid pubPMID�  0 pubpmcid pubPMCID� 7�`�tx��������������� -�@M�`m���������������&3�FS�
fs�	
� 
msng
� 
bool� �  0 metadatafordoi metadataForDOI� .0 valueforkey_inrecord_ valueForKey_inRecord_� 0 authors  
� 
lnfd�  0 mergetextitems mergeTextItems
� .corecnte****       ****� 
0 author  
� 
cobj� 0 date  
� 
ldt � 0 	publisher  � 0 is?n  � 0 journal  � 
0 volume  � 0 page  � 0 	reference  � 
0 bibtex  � 0 link  �
 0 pmid  �	 	0 pmcid  �5�� 
 �� �& jvY hOb  0�b  b  ���+ E�O�jv  jvY hOjvE�Ob  0�l+ E�O��	 ���&	 �jv�& `��b  0��l+ l%E�O�j E�O�k  ���k/l%E�Y .�l  ���k/a %��l/%l%E�Y ���k/a %l%E�Y hOb  0a �l+ E�O�� �a �a &l%E�Y hOb  0a �l+ E�O��	 	�a �& �a �l%E�Y hOb  0a �l+ E�O��	 	�a �& �a �l%E�Y hOb  0a �l+ E�O��	 	�a �& �a �l%E�Y hOb  0a �l+ E�Ob  0a �l+ E�O��	 	�a  �& 1��	 	�a !�& �a "%�%a #%E�Y hO�a $�l%E�Y hOb  0a %�l+ E�O��	 	�a &�& �a '�l%E�Y hOb  0a (�l+ E�O��	 	�a )�& �a *�l%E�Y hOb  0a +�l+ E�O��	 	�a ,�& �a -�l%E�Y hOb  0a .�l+ E�O��	 	�a /�& �a 0�l%E�Y hOb  0a 1�l+ E^ O] �	 ] a 2�& �a 3] l%E�Y hOb  0a 4�l+ E^ O] �	 ] a 5�& �a 6] l%E�Y hO�� �������� 00 labelindexforcolorname labelIndexForColorName� ��� �  �� 0 	colorname 	colorName�  � ��� � 0 	colorname 	colorName� $0 recordlabelindex recordLabelIndex�  0 labelmapping labelMapping� ����������
�� 
msng
�� 
bool�� P0 &recordforkey_andvalue_inlistofrecords_ &recordForKey_andValue_inListOfRecords_�� 0 
labelindex 
labelIndex� ?�� 
 �� �& jY hOjE�Ob  0�b  (m+ E�O�� 
��,E�Y hO�� ������������� :0 preprocessannotationcomment preprocessAnnotationComment�� ����� �  ���� 0 acomment aComment��  � �������������� 0 acomment aComment�� $0 transformedlines transformedLines�� 0 tagslineregex tagsLineRegex�� &0 tagdelimiterregex tagDelimiterRegex�� 0 aline aLine�� &0 transformedstring transformedString� ����������+:��G������
�� 
cpar
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 0 
regexmatch 
regexMatch�� 0 regexreplace regexReplace
�� 
ctxt
�� 
lnfd��  0 mergetextitems mergeTextItems�� s�OjvE�O�E�O�E�O N��-[��l kh b  0��l+ � "b  0���m+ 	E�Ob  0���m+ 	E�Y hO��&�6G[OY��Ob  0��l+ �%E�O� ascr  ��ޭ