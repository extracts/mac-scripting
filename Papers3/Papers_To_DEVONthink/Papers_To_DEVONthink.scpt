FasdUAS 1.101.10   ��   ��    k             l     ��  ��      Papers to DEVONthink     � 	 	 *   P a p e r s   t o   D E V O N t h i n k   
  
 l     ��  ��    2 , version 1.0, licensed under the MIT license     �   X   v e r s i o n   1 . 0 ,   l i c e n s e d   u n d e r   t h e   M I T   l i c e n s e      l     ��������  ��  ��        l     ��  ��    E ? by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de     �   ~   b y   M a t t h i a s   S t e f f e n s ,   k e y p o i n t s a p p . n e t ,   m a t ( a t ) e x t r a c t s ( d o t ) d e      l     ��������  ��  ��        l     ��  ��    U O Exports all notes & highlight annotations of all publications selected in your     �   �   E x p o r t s   a l l   n o t e s   &   h i g h l i g h t   a n n o t a t i o n s   o f   a l l   p u b l i c a t i o n s   s e l e c t e d   i n   y o u r      l     ��   ��    * $ Papers 3 library to DEVONthink Pro.      � ! ! H   P a p e r s   3   l i b r a r y   t o   D E V O N t h i n k   P r o .   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & T N If not disabled within the script, the publication's primary PDF will be also    ' � ( ( �   I f   n o t   d i s a b l e d   w i t h i n   t h e   s c r i p t ,   t h e   p u b l i c a t i o n ' s   p r i m a r y   P D F   w i l l   b e   a l s o %  ) * ) l     �� + ,��   + !  indexed in DEVONthink Pro.    , � - - 6   i n d e x e d   i n   D E V O N t h i n k   P r o . *  . / . l     ��������  ��  ��   /  0 1 0 l     �� 2 3��   2 ` Z This script requires macOS 10.10 (Yosemite) or greater, the KeypointsScriptingLib v1.2 or    3 � 4 4 �   T h i s   s c r i p t   r e q u i r e s   m a c O S   1 0 . 1 0   ( Y o s e m i t e )   o r   g r e a t e r ,   t h e   K e y p o i n t s S c r i p t i n g L i b   v 1 . 2   o r 1  5 6 5 l     �� 7 8��   7 O I greater, Papers 3.4.2 or greater, and DEVONthink Pro 12.9.16 or greater.    8 � 9 9 �   g r e a t e r ,   P a p e r s   3 . 4 . 2   o r   g r e a t e r ,   a n d   D E V O N t h i n k   P r o   1 2 . 9 . 1 6   o r   g r e a t e r . 6  : ; : l     ��������  ��  ��   ;  < = < l     �� > ?��   > L F This export script will transfer the following annotation properties:    ? � @ @ �   T h i s   e x p o r t   s c r i p t   w i l l   t r a n s f e r   t h e   f o l l o w i n g   a n n o t a t i o n   p r o p e r t i e s : =  A B A l     �� C D��   C   * logical page number    D � E E ,   *   l o g i c a l   p a g e   n u m b e r B  F G F l     �� H I��   H   * quoted text    I � J J    *   q u o t e d   t e x t G  K L K l     �� M N��   M   * annotation type    N � O O $   *   a n n o t a t i o n   t y p e L  P Q P l     �� R S��   R   * creation date    S � T T     *   c r e a t i o n   d a t e Q  U V U l     �� W X��   W   * annotation color    X � Y Y &   *   a n n o t a t i o n   c o l o r V  Z [ Z l     ��������  ��  ��   [  \ ] \ l     �� ^ _��   ^ F @ In addition, these publication properties are also transferred:    _ � ` ` �   I n   a d d i t i o n ,   t h e s e   p u b l i c a t i o n   p r o p e r t i e s   a r e   a l s o   t r a n s f e r r e d : ]  a b a l     �� c d��   c   * formatted reference    d � e e ,   *   f o r m a t t e d   r e f e r e n c e b  f g f l     �� h i��   h   * cite key    i � j j    *   c i t e   k e y g  k l k l     �� m n��   m   * keywords    n � o o    *   k e y w o r d s l  p q p l     �� r s��   r   * color label    s � t t    *   c o l o r   l a b e l q  u v u l     �� w x��   w   * flagged status    x � y y "   *   f l a g g e d   s t a t u s v  z { z l     �� | }��   |   * "papers://�" link    } � ~ ~ (   *   " p a p e r s : / / & "   l i n k {   �  l     �� � ���   �   * BibTeX metadata    � � � � $   *   B i b T e X   m e t a d a t a �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � l f The export of some of these properties can be disabled below. Example note as created by this script:    � � � � �   T h e   e x p o r t   o f   s o m e   o f   t h e s e   p r o p e r t i e s   c a n   b e   d i s a b l e d   b e l o w .   E x a m p l e   n o t e   a s   c r e a t e d   b y   t h i s   s c r i p t : �  � � � l     ��������  ��  ��   �  � � � l      �� � ���   ���
Krell, A. et al., 2003. The biology and chemistry of land fast ice in the White Sea, Russia�A comparison
of winter and spring conditions. Polar Biology, 26(11), pp.707�719.

{Krell++2003WhiteSea}

p.707: Sea ice therefore probably plays a major role in structuring the White Sea ecosystem, since it
strongly alters the exchange of energy and material between water and atmosphere. -- Highlighted 26.11.2017
    � � � �0 
 K r e l l ,   A .   e t   a l . ,   2 0 0 3 .   T h e   b i o l o g y   a n d   c h e m i s t r y   o f   l a n d   f a s t   i c e   i n   t h e   W h i t e   S e a ,   R u s s i a  A   c o m p a r i s o n 
 o f   w i n t e r   a n d   s p r i n g   c o n d i t i o n s .   P o l a r   B i o l o g y ,   2 6 ( 1 1 ) ,   p p . 7 0 7  7 1 9 . 
 
 { K r e l l + + 2 0 0 3 W h i t e S e a } 
 
 p . 7 0 7 :   S e a   i c e   t h e r e f o r e   p r o b a b l y   p l a y s   a   m a j o r   r o l e   i n   s t r u c t u r i n g   t h e   W h i t e   S e a   e c o s y s t e m ,   s i n c e   i t 
 s t r o n g l y   a l t e r s   t h e   e x c h a n g e   o f   e n e r g y   a n d   m a t e r i a l   b e t w e e n   w a t e r   a n d   a t m o s p h e r e .   - -   H i g h l i g h t e d   2 6 . 1 1 . 2 0 1 7 
 �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � f ` NOTE: Before executing the app, make sure that your Papers and DEVONthink Pro apps are running,    � � � � �   N O T E :   B e f o r e   e x e c u t i n g   t h e   a p p ,   m a k e   s u r e   t h a t   y o u r   P a p e r s   a n d   D E V O N t h i n k   P r o   a p p s   a r e   r u n n i n g , �  � � � l     �� � ���   � d ^ and that you've selected all publications in your Papers library that you'd like to export to    � � � � �   a n d   t h a t   y o u ' v e   s e l e c t e d   a l l   p u b l i c a t i o n s   i n   y o u r   P a p e r s   l i b r a r y   t h a t   y o u ' d   l i k e   t o   e x p o r t   t o �  � � � l     �� � ���   � h b DEVONthink Pro. Then run the script to start the export process. For each publication with a PDF,    � � � � �   D E V O N t h i n k   P r o .   T h e n   r u n   t h e   s c r i p t   t o   s t a r t   t h e   e x p o r t   p r o c e s s .   F o r   e a c h   p u b l i c a t i o n   w i t h   a   P D F , �  � � � l     �� � ���   � e _ the script will create a group within the database or group you've selected in DEVONthink Pro,    � � � � �   t h e   s c r i p t   w i l l   c r e a t e   a   g r o u p   w i t h i n   t h e   d a t a b a s e   o r   g r o u p   y o u ' v e   s e l e c t e d   i n   D E V O N t h i n k   P r o , �  � � � l     �� � ���   � U O and populate it with RTF notes for each of your note or highlight annotations.    � � � � �   a n d   p o p u l a t e   i t   w i t h   R T F   n o t e s   f o r   e a c h   o f   y o u r   n o t e   o r   h i g h l i g h t   a n n o t a t i o n s . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � h b NOTE: Upon completion, DEVONthink Pro will display a modal dialog reporting how many publications    � � � � �   N O T E :   U p o n   c o m p l e t i o n ,   D E V O N t h i n k   P r o   w i l l   d i s p l a y   a   m o d a l   d i a l o g   r e p o r t i n g   h o w   m a n y   p u b l i c a t i o n s �  � � � l     �� � ���   � ' ! (and annotations) were imported.    � � � � B   ( a n d   a n n o t a t i o n s )   w e r e   i m p o r t e d . �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � ^ X NOTE: If you again select the same database or group in DEVONthink Pro, you can run the    � � � � �   N O T E :   I f   y o u   a g a i n   s e l e c t   t h e   s a m e   d a t a b a s e   o r   g r o u p   i n   D E V O N t h i n k   P r o ,   y o u   c a n   r u n   t h e �  � � � l     �� � ���   � b \ script multiple times for the same PDF without creating duplicate notes. This may be useful    � � � � �   s c r i p t   m u l t i p l e   t i m e s   f o r   t h e   s a m e   P D F   w i t h o u t   c r e a t i n g   d u p l i c a t e   n o t e s .   T h i s   m a y   b e   u s e f u l �  � � � l     �� � ���   � ^ X if you want to add newly added annotations or update the label color for existing ones.    � � � � �   i f   y o u   w a n t   t o   a d d   n e w l y   a d d e d   a n n o t a t i o n s   o r   u p d a t e   t h e   l a b e l   c o l o r   f o r   e x i s t i n g   o n e s . �  � � � l     �� � ���   � c ] However, if a note was modified in DEVONthink Pro, the script will leave it as is and create    � � � � �   H o w e v e r ,   i f   a   n o t e   w a s   m o d i f i e d   i n   D E V O N t h i n k   P r o ,   t h e   s c r i p t   w i l l   l e a v e   i t   a s   i s   a n d   c r e a t e �  � � � l     �� � ���   � 8 2 a duplicate note with the original note contents.    � � � � d   a   d u p l i c a t e   n o t e   w i t h   t h e   o r i g i n a l   n o t e   c o n t e n t s . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � U O ----------- you may edit the values of the properties below ------------------    � � � � �   - - - - - - - - - - -   y o u   m a y   e d i t   t h e   v a l u e s   o f   t h e   p r o p e r t i e s   b e l o w   - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � b \ Specifies whether the publication's primary PDF shall be indexed in DEVONthink Pro (`true`)    � � � � �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   p r i m a r y   P D F   s h a l l   b e   i n d e x e d   i n   D E V O N t h i n k   P r o   ( ` t r u e ` ) �  � � � l     �� � ���   � h b or not (`false`). If `true`, this script will create an index entry for the publication's primary    � � � � �   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   t h i s   s c r i p t   w i l l   c r e a t e   a n   i n d e x   e n t r y   f o r   t h e   p u b l i c a t i o n ' s   p r i m a r y �  � � � l     �� � ���   � M G PDF next to any notes & highlight annotations exported by this script.    � � � � �   P D F   n e x t   t o   a n y   n o t e s   &   h i g h l i g h t   a n n o t a t i o n s   e x p o r t e d   b y   t h i s   s c r i p t . �  � � � j     �� ��� &0 transferpaperspdf transferPapersPDF � m     ��
�� boovtrue �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � f ` Specifies whether the publication's flagged status shall be exported to DEVONthink Pro (`true`)    � � � � �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   f l a g g e d   s t a t u s   s h a l l   b e   e x p o r t e d   t o   D E V O N t h i n k   P r o   ( ` t r u e ` ) �  � � � l     �� � ���   � j d or not (`false`). If `true`, and if the publication was flagged in your Papers library, this script    � � � � �   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   a n d   i f   t h e   p u b l i c a t i o n   w a s   f l a g g e d   i n   y o u r   P a p e r s   l i b r a r y ,   t h i s   s c r i p t �  � � � l     �� � ��   � f ` will mark the corresponding index entry for the publication's primary PDF as flagged. Note that     � �   w i l l   m a r k   t h e   c o r r e s p o n d i n g   i n d e x   e n t r y   f o r   t h e   p u b l i c a t i o n ' s   p r i m a r y   P D F   a s   f l a g g e d .   N o t e   t h a t �  l     ����   g a this script won't flag the publication's group folder since this would flag all contained items.    � �   t h i s   s c r i p t   w o n ' t   f l a g   t h e   p u b l i c a t i o n ' s   g r o u p   f o l d e r   s i n c e   t h i s   w o u l d   f l a g   a l l   c o n t a i n e d   i t e m s .  j    ��	�� (0 transferpapersflag transferPapersFlag	 m    ��
�� boovtrue 

 l     ��������  ��  ��    l     ����   c ] Specifies whether the publication's keywords shall be transferred to DEVONthink Pro (`true`)    � �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   k e y w o r d s   s h a l l   b e   t r a n s f e r r e d   t o   D E V O N t h i n k   P r o   ( ` t r u e ` )  l     ����   j d or not (`false`). If `true`, this script will use the publication's keywords to set the tags of the    � �   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   t h i s   s c r i p t   w i l l   u s e   t h e   p u b l i c a t i o n ' s   k e y w o r d s   t o   s e t   t h e   t a g s   o f   t h e  l     ����   V P group & PDF index entry that are created in DEVONthink Pro for the publication.    � �   g r o u p   &   P D F   i n d e x   e n t r y   t h a t   a r e   c r e a t e d   i n   D E V O N t h i n k   P r o   f o r   t h e   p u b l i c a t i o n .  j    ���� 00 transferpaperskeywords transferPapersKeywords m    ��
�� boovtrue  l     ��������  ��  ��    !  l     ��"#��  " a [ Specifies whether the publication's BibTeX metadata shall be transferred to DEVONthink Pro   # �$$ �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   B i b T e X   m e t a d a t a   s h a l l   b e   t r a n s f e r r e d   t o   D E V O N t h i n k   P r o! %&% l     ��'(��  ' j d (`true`) or not (`false`). If `true`, this script will add the publication's BibTeX metadata to the   ( �)) �   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   t h i s   s c r i p t   w i l l   a d d   t h e   p u b l i c a t i o n ' s   B i b T e X   m e t a d a t a   t o   t h e& *+* l     ��,-��  , f ` Spotlight comment field of the group that's created in DEVONthink Pro for the publication. Note   - �.. �   S p o t l i g h t   c o m m e n t   f i e l d   o f   t h e   g r o u p   t h a t ' s   c r e a t e d   i n   D E V O N t h i n k   P r o   f o r   t h e   p u b l i c a t i o n .   N o t e+ /0/ l     ��12��  1 k e that this script won't set the Spotlight comment field of the PDF index entry since this would cause   2 �33 �   t h a t   t h i s   s c r i p t   w o n ' t   s e t   t h e   S p o t l i g h t   c o m m e n t   f i e l d   o f   t h e   P D F   i n d e x   e n t r y   s i n c e   t h i s   w o u l d   c a u s e0 454 l     ��67��  6 g a DEVONthink Pro to also set the Spotlight comment of the target PDF file accordingly (which would   7 �88 �   D E V O N t h i n k   P r o   t o   a l s o   s e t   t h e   S p o t l i g h t   c o m m e n t   o f   t h e   t a r g e t   P D F   f i l e   a c c o r d i n g l y   ( w h i c h   w o u l d5 9:9 l     ��;<��  ; ( " overwrite any existing comments).   < �== D   o v e r w r i t e   a n y   e x i s t i n g   c o m m e n t s ) .: >?> j   	 ��@�� ,0 transferpapersbibtex transferPapersBibTeX@ m   	 
��
�� boovtrue? ABA l     ��������  ��  ��  B CDC l     ��EF��  E i c Specifies whether the publication's or annotation's color label shall be transferred to DEVONthink   F �GG �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   o r   a n n o t a t i o n ' s   c o l o r   l a b e l   s h a l l   b e   t r a n s f e r r e d   t o   D E V O N t h i n kD HIH l     ��JK��  J h b Pro (`true`) or not (`false`). If `true`, this script will mark the records created in DEVONthink   K �LL �   P r o   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   t h i s   s c r i p t   w i l l   m a r k   t h e   r e c o r d s   c r e a t e d   i n   D E V O N t h i n kI MNM l     ��OP��  O + % Pro with an appropriate color label.   P �QQ J   P r o   w i t h   a n   a p p r o p r i a t e   c o l o r   l a b e l .N RSR j    ��T�� *0 transferpaperslabel transferPapersLabelT m    ��
�� boovtrueS UVU l     ��������  ��  ��  V WXW l     ��YZ��  Y i c Specifies whether the publication's "papers://�" link shall be exported to DEVONthink Pro (`true`)   Z �[[ �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   " p a p e r s : / / & "   l i n k   s h a l l   b e   e x p o r t e d   t o   D E V O N t h i n k   P r o   ( ` t r u e ` )X \]\ l     ��^_��  ^ k e or not (`false`). If `true`, the "papers://�" link will be written to the "URL" field of all records   _ �`` �   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   t h e   " p a p e r s : / / & "   l i n k   w i l l   b e   w r i t t e n   t o   t h e   " U R L "   f i e l d   o f   a l l   r e c o r d s] aba l     ��cd��  c !  created in DEVONthink Pro.   d �ee 6   c r e a t e d   i n   D E V O N t h i n k   P r o .b fgf j    �h� (0 transferpaperslink transferPapersLinkh m    �~
�~ boovtrueg iji l     �}�|�{�}  �|  �{  j klk l     �zmn�z  m h b Specifies whether the publication's or annotation's creation date shall be exported to DEVONthink   n �oo �   S p e c i f i e s   w h e t h e r   t h e   p u b l i c a t i o n ' s   o r   a n n o t a t i o n ' s   c r e a t i o n   d a t e   s h a l l   b e   e x p o r t e d   t o   D E V O N t h i n kl pqp l     �yrs�y  r i c Pro (`true`) or not (`false`). If `true`, the creation date will be written to the "creation date"   s �tt �   P r o   ( ` t r u e ` )   o r   n o t   ( ` f a l s e ` ) .   I f   ` t r u e ` ,   t h e   c r e a t i o n   d a t e   w i l l   b e   w r i t t e n   t o   t h e   " c r e a t i o n   d a t e "q uvu l     �xwx�x  w e _ field of all groups and notes created in DEVONthink Pro. Note that this script won't touch the   x �yy �   f i e l d   o f   a l l   g r o u p s   a n d   n o t e s   c r e a t e d   i n   D E V O N t h i n k   P r o .   N o t e   t h a t   t h i s   s c r i p t   w o n ' t   t o u c h   t h ev z{z l     �w|}�w  | m g creation date of the created PDF index entry (for which DEVONthink displays the file's creation date).   } �~~ �   c r e a t i o n   d a t e   o f   t h e   c r e a t e d   P D F   i n d e x   e n t r y   ( f o r   w h i c h   D E V O N t h i n k   d i s p l a y s   t h e   f i l e ' s   c r e a t i o n   d a t e ) .{ � j    �v��v 80 transferpaperscreationdate transferPapersCreationDate� m    �u
�u boovtrue� ��� l     �t�s�r�t  �s  �r  � ��� l     �q���q  � W Q ----------- usually, you don't need to edit anything below this line -----------   � ��� �   - - - - - - - - - - -   u s u a l l y ,   y o u   d o n ' t   n e e d   t o   e d i t   a n y t h i n g   b e l o w   t h i s   l i n e   - - - - - - - - - - -� ��� l     �p�o�n�p  �o  �n  � ��� j    �m��m 40 exportedannotationscount exportedAnnotationsCount� m    �l�l  � ��� l     �k�j�i�k  �j  �i  � ��� x    )�h��g�h 0 keypointslib KeypointsLib� 4   # '�f�
�f 
scpt� m   % &�� ��� * K e y p o i n t s S c r i p t i n g L i b�g  � ��� x   * 6�e��d�e  � 2  , /�c
�c 
osax�d  � ��� l     �b�a�`�b  �a  �`  � ��� l     �_���_  � ; 5 TODO: optionally transfer manual collections as tags   � ��� j   T O D O :   o p t i o n a l l y   t r a n s f e r   m a n u a l   c o l l e c t i o n s   a s   t a g s� ��� l     �^���^  � k e TODO: offer an option to put the publication's formatted reference in the Spotlight comments instead   � ��� �   T O D O :   o f f e r   a n   o p t i o n   t o   p u t   t h e   p u b l i c a t i o n ' s   f o r m a t t e d   r e f e r e n c e   i n   t h e   S p o t l i g h t   c o m m e n t s   i n s t e a d� ��� l     �]�\�[�]  �\  �[  � ��� l     �Z�Y�X�Z  �Y  �X  � ��� l     �W���W  � &   adopt this routine to customize   � ��� @   a d o p t   t h i s   r o u t i n e   t o   c u s t o m i z e� ��� i   6 9��� I     �V�U�T
�V .aevtoappnull  �   � ****�U  �T  � k    Q�� ��� l     �S���S  � D > DEVONthink and Papers must be running for this script to work   � ��� |   D E V O N t h i n k   a n d   P a p e r s   m u s t   b e   r u n n i n g   f o r   t h i s   s c r i p t   t o   w o r k� ��� Z    ���R�Q� H     �� n    ��� I    �P�O�N�P $0 checkappsrunning checkAppsRunning�O  �N  �  f     � L   	 �M�M  �R  �Q  � ��� l   �L�K�J�L  �K  �J  � ��� n   ��� I    �I��H�I 0 setupprogress setupProgress� ��G� m    �� ��� r E x p o r t i n g   s e l e c t e d   P a p e r s   p u b l i c a t i o n s   t o   D E V O N t h i n k   P r o &�G  �H  � o    �F�F 0 keypointslib KeypointsLib� ��� l   �E�D�C�E  �D  �C  � ��� O   ��� k   #�� ��� l  # #�B���B  � 6 0 export the currently selected publications only   � ��� `   e x p o r t   t h e   c u r r e n t l y   s e l e c t e d   p u b l i c a t i o n s   o n l y� ��� r   # +��� n   # )��� 1   ' )�A
�A 
pSeP� 4  # '�@�
�@ 
PLiW� m   % &�?�? � o      �>�> 0 selectedpubs selectedPubs� ��� l  , ,�=�<�;�=  �<  �;  � ��� l  , ,�:���:  � T N filter the selection so that it only contains publications with a primary PDF   � ��� �   f i l t e r   t h e   s e l e c t i o n   s o   t h a t   i t   o n l y   c o n t a i n s   p u b l i c a t i o n s   w i t h   a   p r i m a r y   P D F� ��� r   , 4��� n  , 2��� I   - 2�9��8�9 0 pubswithpdf pubsWithPDF� ��7� o   - .�6�6 0 selectedpubs selectedPubs�7  �8  �  f   , -� o      �5�5 0 pdfpubs pdfPubs� ��� r   5 <��� I  5 :�4��3
�4 .corecnte****       ****� o   5 6�2�2 0 pdfpubs pdfPubs�3  � o      �1�1 0 pubcount pubCount� ��� l  = =�0�/�.�0  �/  �.  � ��� l  = =�-���-  � L F get current group/window in DEVONthink which should receive the notes   � ��� �   g e t   c u r r e n t   g r o u p / w i n d o w   i n   D E V O N t h i n k   w h i c h   s h o u l d   r e c e i v e   t h e   n o t e s� ��� r   = S��� n  = B��� I   > B�,�+�*�, .0 getdttargetcontainers getDTTargetContainers�+  �*  �  f   = >� J      �� ��� o      �)�) 0 dtcontainer dtContainer�  �(  o      �'�' 0 dtwin dtWin�(  �  l  T T�&�%�$�&  �%  �$    n  T ^ I   Y ^�#�"�# 40 settotalstepsforprogress setTotalStepsForProgress �! o   Y Z� �  0 pubcount pubCount�!  �"   o   T Y�� 0 keypointslib KeypointsLib 	
	 r   _ f m   _ `��   o      �� 40 exportedannotationscount exportedAnnotationsCount
  l  g g����  �  �   � Y   g�� k   q  r   q y n   q u 4   r u�
� 
cobj o   s t�� 0 i   o   q r�� 0 pdfpubs pdfPubs o      �� 0 apub aPub  l  z z����  �  �    l  z z� �   ' ! gather info for this publication     �!! B   g a t h e r   i n f o   f o r   t h i s   p u b l i c a t i o n "#" r   z �$%$ n   z �&'& J   } �(( )*) 1   ~ ��
� 
pRef* +,+ 1   � ��
� 
pCiK, -.- 1   � ��
� 
pTit. /0/ 1   � ��
� 
pItU0 1�
1 1   � ��	
�	 
pCrD�
  ' o   z }�� 0 apub aPub% J      22 343 o      �� 0 pubref pubRef4 565 o      �� 0 pubkey pubKey6 787 o      �� 0 pubtitle pubTitle8 9:9 o      �� 0 publink pubLink: ;�; o      �� "0 pubcreationdate pubCreationDate�  # <=< r   � �>?> n   � �@A@ 1   � ��
� 
pnamA n   � �BCB 2   � �� 
�  
PKeyC o   � ����� 0 apub aPub? o      ���� 0 pubkeywords pubKeywords= DED l  � ���������  ��  ��  E FGF n  �HIH I   ���J����  0 updateprogress updateProgressJ KLK o   � ����� 0 i  L M��M b   � NON b   � �PQP b   � �RSR b   � �TUT b   � �VWV b   � �XYX m   � �ZZ �[[ , E x p o r t i n g   p u b l i c a t i o n  Y o   � ����� 0 i  W m   � �\\ �]]    o f  U o   � ����� 0 pubcount pubCountS m   � �^^ �__    ( "Q o   � ����� 0 pubtitle pubTitleO m   � �`` �aa  " ) .��  ��  I o   � ����� 0 keypointslib KeypointsLibG bcb l ��������  ��  ��  c ded l ��fg��  f A ; get all notes & highlight annotations for this publication   g �hh v   g e t   a l l   n o t e s   &   h i g h l i g h t   a n n o t a t i o n s   f o r   t h i s   p u b l i c a t i o ne iji r  klk n  mnm 2  ��
�� 
PAnnn n  opo m  ��
�� 
PPrFp o  ���� 0 apub aPubl o      ����  0 pubannotations pubAnnotationsj qrq l ��������  ��  ��  r s��s Z  tu����t G  'vwv o  ���� &0 transferpaperspdf transferPapersPDFw > #xyx o   ����  0 pubannotations pubAnnotationsy J   "����  u k  *zz {|{ l **��}~��  } J D create a subfolder in DEVONthink (named like "<CITEKEY> - <TITLE>")   ~ � �   c r e a t e   a   s u b f o l d e r   i n   D E V O N t h i n k   ( n a m e d   l i k e   " < C I T E K E Y >   -   < T I T L E > " )| ��� r  *9��� b  *5��� b  *1��� o  *-���� 0 pubkey pubKey� m  -0�� ���    -  � o  14���� 0 pubtitle pubTitle� o      ���� 0 
foldername 
folderName� ��� r  :E��� n  :A��� 1  =A��
�� 
pBib� o  :=���� 0 apub aPub� o      ���� 0 	pubbibtex 	pubBibTeX� ��� r  Fa��� n F]��� I  G]�������  0 createdtfolder createDTFolder� ��� o  GH���� 0 dtcontainer dtContainer� ��� o  HK���� 0 
foldername 
folderName� ��� o  KN���� 0 publink pubLink� ��� o  NQ���� "0 pubcreationdate pubCreationDate� ��� o  QT���� 0 pubkeywords pubKeywords� ���� o  TW���� 0 	pubbibtex 	pubBibTeX��  ��  �  f  FG� o      ����  0 folderlocation folderLocation� ��� n bm��� I  cm������� @0 transferpaperspublicationcolor transferPapersPublicationColor� ��� o  cf����  0 folderlocation folderLocation� ���� o  fi���� 0 apub aPub��  ��  �  f  bc� ��� l nn��������  ��  ��  � ���� Z  n������ > nu��� o  nq����  0 folderlocation folderLocation� m  qt��
�� 
msng� k  x��� ��� l xx������  �   index PDF file   � ���    i n d e x   P D F   f i l e� ��� Z  x�������� o  x}���� &0 transferpaperspdf transferPapersPDF� k  ���� ��� r  ����� n  ����� m  ����
�� 
PPrF� o  ������ 0 apub aPub� o      ���� 0 pdffile pdfFile� ��� r  ����� n  ����� 1  ����
�� 
pFPa� o  ������ 0 pdffile pdfFile� o      ���� 0 pdfpath pdfPath� ��� r  ����� n  ����� 1  ����
�� 
pFlg� o  ������ 0 apub aPub� o      ���� 0 	isflagged 	isFlagged� ��� r  ����� n ����� I  ��������� *0 createdtindexrecord createDTIndexRecord� ��� o  ������  0 folderlocation folderLocation� ��� o  ������ 0 pdfpath pdfPath� ��� o  ������ 0 
foldername 
folderName� ��� o  ������ 0 publink pubLink� ��� o  ������ 0 pubkeywords pubKeywords� ���� o  ������ 0 	isflagged 	isFlagged��  ��  �  f  ��� o      ���� 0 indexrecord indexRecord� ���� n ����� I  ��������� @0 transferpaperspublicationcolor transferPapersPublicationColor� ��� o  ������ 0 indexrecord indexRecord� ���� o  ������ 0 apub aPub��  ��  �  f  ����  ��  ��  � ��� l ����������  ��  ��  � ��� l ��������  �   export annotations   � ��� &   e x p o r t   a n n o t a t i o n s� ���� n ����� I  ��������� >0 exportannotationstodevonthink exportAnnotationsToDEVONthink� ��� o  ������  0 folderlocation folderLocation� ��� o  ������  0 pubannotations pubAnnotations� ��� o  ������ 0 pubref pubRef� ��� o  ������ 0 pubkey pubKey� ���� o  ������ 0 publink pubLink��  ��  �  f  ����  ��  � n ���� I  �������� (0 logtosystemconsole logToSystemConsole� � � n  �� 1  ����
�� 
pnam  f  ��  �� b  �  b  �� m  �� �		 : C o u l d n ' t   e x p o r t   p u b l i c a t i o n   " o  ������ 0 pubtitle pubTitle m  ��

 � x "   s i n c e   i t s   g r o u p   f o l d e r   c o u l d   n o t   b e   c r e a t e d   i n   D E V O N t h i n k .��  ��  � o  ������ 0 keypointslib KeypointsLib��  ��  ��  ��  � 0 i   m   j k����  o   k l���� 0 pubcount pubCount�  �  � 5     ����
�� 
capp m     � * c o m . m e k e n t o s j . p a p e r s 3
�� kfrmID  �  l ��������  ��  ��   �� O  Q k  P  I ������
�� .miscactvnull��� ��� null��  ��   �� I P��
�� .sysodlogaskr        TEXT b  2 b  , b  ( b  $ !  m  """ �## . I m p o r t e d   p u b l i c a t i o n s :  ! o  "#���� 0 pubcount pubCount 1  $'��
�� 
lnfd m  (+$$ �%% , I m p o r t e d   a n n o t a t i o n s :   l 
,1&����& o  ,1���� 40 exportedannotationscount exportedAnnotationsCount��  ��   ��'(
�� 
appr' m  58)) �** 6 F i n i s h e d   I m p o r t   F r o m   P a p e r s( ��+,
�� 
disp+ m  ;<���� , �-.
� 
btns- J  ?D// 0�~0 m  ?B11 �22  O K�~  . �}3�|
�} 
dflt3 m  GJ44 �55  O K�|  ��   5  �{6�z
�{ 
capp6 m  77 �88  D N t p
�z kfrmID  ��  � 9:9 l     �y�x�w�y  �x  �w  : ;<; l     �v�u�t�v  �u  �t  < =>= l     �s?@�s  ? e _ Returns all publications from the given list of publications that have a primary PDF attached.   @ �AA �   R e t u r n s   a l l   p u b l i c a t i o n s   f r o m   t h e   g i v e n   l i s t   o f   p u b l i c a t i o n s   t h a t   h a v e   a   p r i m a r y   P D F   a t t a c h e d .> BCB i   : =DED I      �rF�q�r 0 pubswithpdf pubsWithPDFF G�pG o      �o�o 0 publist pubList�p  �q  E O     <HIH k    ;JJ KLK r    MNM J    
�n�n  N o      �m�m  0 allpubswithpdf allPubsWithPDFL OPO X    8Q�lRQ k    3SS TUT r    "VWV n     XYX m     �k
�k 
PPrFY o    �j�j 0 apub aPubW o      �i�i 0 pdffile pdfFileU Z�hZ Z   # 3[\�g�f[ >  # &]^] o   # $�e�e 0 pdffile pdfFile^ m   $ %�d
�d 
msng\ s   ) /_`_ n   ) ,aba 1   * ,�c
�c 
pcntb o   ) *�b�b 0 apub aPub` n      cdc  ;   - .d o   , -�a�a  0 allpubswithpdf allPubsWithPDF�g  �f  �h  �l 0 apub aPubR o    �`�` 0 publist pubListP e�_e L   9 ;ff o   9 :�^�^  0 allpubswithpdf allPubsWithPDF�_  I 5     �]g�\
�] 
cappg m    hh �ii * c o m . m e k e n t o s j . p a p e r s 3
�\ kfrmID  C jkj l     �[�Z�Y�[  �Z  �Y  k lml l     �X�W�V�X  �W  �V  m non l     �Upq�U  p q k Creates a new (rich text) record in DEVONthink for each of the given Papers note or highlight annotations.   q �rr �   C r e a t e s   a   n e w   ( r i c h   t e x t )   r e c o r d   i n   D E V O N t h i n k   f o r   e a c h   o f   t h e   g i v e n   P a p e r s   n o t e   o r   h i g h l i g h t   a n n o t a t i o n s .o sts i   > Auvu I      �Tw�S�T >0 exportannotationstodevonthink exportAnnotationsToDEVONthinkw xyx o      �R�R  0 folderlocation folderLocationy z{z o      �Q�Q  0 pubannotations pubAnnotations{ |}| o      �P�P 0 pubref pubRef} ~~ o      �O�O 0 pubkey pubKey ��N� o      �M�M 0 publink pubLink�N  �S  v k     ��� ��� Z    ���L�K� G     ��� =    ��� o     �J�J  0 folderlocation folderLocation� m    �I
�I 
msng� =   	��� o    �H�H  0 pubannotations pubAnnotations� m    �G
�G 
msng� L    �F�F  �L  �K  � ��� l   �E�D�C�E  �D  �C  � ��B� O    ���� X    ���A�� Z   - ����@�?� >  - 2��� n   - 0��� 1   . 0�>
�> 
pTyp� o   - .�=�= 0 anannotation anAnnotation� m   0 1�� ���  I n k� l  5 ����� k   5 ��� ��� r   5 :��� n   5 8��� 1   6 8�<
�< 
pCrD� o   5 6�;�; 0 anannotation anAnnotation� o      �:�: (0 recordcreationdate recordCreationDate� ��� l  ; ;�9�8�7�9  �8  �7  � ��� l  ; ;�6���6  � G A individual records have titles like "<CITEKEY> - <NOTE SUMMARY>"   � ��� �   i n d i v i d u a l   r e c o r d s   h a v e   t i t l e s   l i k e   " < C I T E K E Y >   -   < N O T E   S U M M A R Y > "� ��� r   ; @��� n   ; >��� 1   < >�5
�5 
pCoS� o   ; <�4�4 0 anannotation anAnnotation� o      �3�3 &0 annotationsummary annotationSummary� ��� r   A H��� b   A F��� b   A D��� o   A B�2�2 0 pubkey pubKey� m   B C�� ���    -  � o   D E�1�1 &0 annotationsummary annotationSummary� o      �0�0 0 
recordname 
recordName� ��� l  I I�/�.�-�/  �.  �-  � ��� l  I I�,���,  � , & assemble formatted text for this note   � ��� L   a s s e m b l e   f o r m a t t e d   t e x t   f o r   t h i s   n o t e� ��� l  I I�+���+  � 9 3 TODO: use a template mechanism for note formatting   � ��� f   T O D O :   u s e   a   t e m p l a t e   m e c h a n i s m   f o r   n o t e   f o r m a t t i n g� ��� r   I `��� b   I ^��� b   I \��� b   I Z��� b   I X��� b   I V��� b   I T��� b   I R��� b   I P��� b   I N��� b   I L��� o   I J�*�* 0 pubref pubRef� 1   J K�)
�) 
lnfd� l 
 L M��(�'� 1   L M�&
�& 
lnfd�(  �'  � m   N O�� ���  {� o   P Q�%�% 0 pubkey pubKey� m   R S�� ���  }� 1   T U�$
�$ 
lnfd� l 
 V W��#�"� 1   V W�!
�! 
lnfd�#  �"  � o   X Y� �  &0 annotationsummary annotationSummary� 1   Z [�
� 
lnfd� 1   \ ]�
� 
lnfd� o      ��  0 recordcontents recordContents� ��� l  a a����  �  �  � ��� l  a a����  � 2 , create a record for this note in DEVONthink   � ��� X   c r e a t e   a   r e c o r d   f o r   t h i s   n o t e   i n   D E V O N t h i n k� ��� r   a o��� n  a m��� I   b m����  0 createdtrecord createDTRecord� ��� o   b c��  0 folderlocation folderLocation� ��� o   c d�� 0 
recordname 
recordName� ��� o   d e�� 0 publink pubLink� ��� o   e f��  0 recordcontents recordContents� ��� o   f g�� (0 recordcreationdate recordCreationDate�  �  �  f   a b� o      �� 0 dtrecord dtRecord� ��� Z  p �� ��� >  p s o   p q�� 0 dtrecord dtRecord m   q r�
� 
msng  r   v � [   v } o   v {�� 40 exportedannotationscount exportedAnnotationsCount m   { |�
�
  o      �	�	 40 exportedannotationscount exportedAnnotationsCount�  �  �  l  � �����  �  �   	
	 l  � ���   + % set color label of DEVONthink record    � J   s e t   c o l o r   l a b e l   o f   D E V O N t h i n k   r e c o r d
 � n  � � I   � ���� >0 transferpapersannotationcolor transferPapersAnnotationColor  o   � ��� 0 dtrecord dtRecord �  o   � ����� 0 anannotation anAnnotation�   �    f   � ��  � 6 0 ink annotations aren't supported by this script   � � `   i n k   a n n o t a t i o n s   a r e n ' t   s u p p o r t e d   b y   t h i s   s c r i p t�@  �?  �A 0 anannotation anAnnotation� o     !����  0 pubannotations pubAnnotations� 5    ����
�� 
capp m     � * c o m . m e k e n t o s j . p a p e r s 3
�� kfrmID  �B  t  l     ��������  ��  ��    l     ��������  ��  ��    l     �� ��   Y S Sets the color label of the given DEVONthink record to the publication color label     �!! �   S e t s   t h e   c o l o r   l a b e l   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d   t o   t h e   p u b l i c a t i o n   c o l o r   l a b e l "#" l     ��$%��  $ &   of the given Papers publication   % �&& @   o f   t h e   g i v e n   P a p e r s   p u b l i c a t i o n# '(' i   B E)*) I      ��+���� @0 transferpaperspublicationcolor transferPapersPublicationColor+ ,-, o      ���� 0 dtrecord dtRecord- .��. o      ���� &0 paperspublication papersPublication��  ��  * k     o// 010 Z    23����2 G     454 =    676 o     ���� 0 dtrecord dtRecord7 m    ��
�� 
msng5 =   	898 o    ���� &0 paperspublication papersPublication9 m    ��
�� 
msng3 L    ����  ��  ��  1 :;: l   ��������  ��  ��  ; <=< r    >?> n   @A@ I    ��B���� 20 jsonstringforpapersitem jsonStringForPapersItemB C��C o    ���� &0 paperspublication papersPublication��  ��  A  f    ? o      ���� 0 pubjson pubJSON= DED l   ��������  ��  ��  E F��F Z    oGH����G F    +IJI o    #���� *0 transferpaperslabel transferPapersLabelJ >  & )KLK o   & '���� 0 pubjson pubJSONL m   ' (��
�� 
msngH l  . kMNOM k   . kPP QRQ r   . ?STS n  . =UVU I   3 =��W���� 0 
regexmatch 
regexMatchW XYX o   3 4���� 0 pubjson pubJSONY Z��Z b   4 9[\[ b   4 7]^] m   4 5__ �``  ( ? < =^ 1   5 6��
�� 
lnfd\ m   7 8aa �bb &     " l a b e l " :   ) . + ( ? = , )��  ��  V o   . 3���� 0 keypointslib KeypointsLibT o      ���� $0 paperscolorindex papersColorIndexR c��c Z   @ kde����d ?   @ Cfgf o   @ A���� $0 paperscolorindex papersColorIndexg m   A B����  e k   F ghh iji r   F Nklk n  F Lmnm I   G L��o���� D0  dtlabelforpaperspublicationcolor  dtLabelForPapersPublicationColoro p��p o   G H���� $0 paperscolorindex papersColorIndex��  ��  n  f   F Gl o      ���� 0 dtlabel dtLabelj q��q Z   O grs����r ?   O Rtut o   O P���� 0 dtlabel dtLabelu m   P Q����  s O  U cvwv r   ] bxyx o   ] ^���� 0 dtlabel dtLabely n      z{z 1   _ a��
�� 
DTla{ o   ^ _���� 0 dtrecord dtRecordw 5   U Z��|��
�� 
capp| m   W X}} �~~  D N t p
�� kfrmID  ��  ��  ��  ��  ��  ��  N   set color label   O �     s e t   c o l o r   l a b e l��  ��  ��  ( ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � R L Sets the color label of the given DEVONthink record to the annotation color   � ��� �   S e t s   t h e   c o l o r   l a b e l   o f   t h e   g i v e n   D E V O N t h i n k   r e c o r d   t o   t h e   a n n o t a t i o n   c o l o r� ��� l     ������  � 7 1 of the given Papers note or highlight annotation   � ��� b   o f   t h e   g i v e n   P a p e r s   n o t e   o r   h i g h l i g h t   a n n o t a t i o n� ��� i   F I��� I      ������� >0 transferpapersannotationcolor transferPapersAnnotationColor� ��� o      ���� 0 dtrecord dtRecord� ���� o      ���� $0 papersannotation papersAnnotation��  ��  � k     o�� ��� Z    ������� G     ��� =    ��� o     ���� 0 dtrecord dtRecord� m    ��
�� 
msng� =   	��� o    ���� $0 papersannotation papersAnnotation� m    ��
�� 
msng� L    ����  ��  ��  � ��� l   ��������  ��  ��  � ��� r    ��� n   ��� I    ������� 20 jsonstringforpapersitem jsonStringForPapersItem� ���� o    ���� $0 papersannotation papersAnnotation��  ��  �  f    � o      ���� 0 notejson noteJSON� ��� l   ��������  ��  ��  � ���� Z    o������� F    +��� o    #���� *0 transferpaperslabel transferPapersLabel� >  & )��� o   & '���� 0 notejson noteJSON� m   ' (��
�� 
msng� l  . k���� k   . k�� ��� r   . ?��� n  . =��� I   3 =������� 0 
regexmatch 
regexMatch� ��� o   3 4���� 0 notejson noteJSON� ���� b   4 9��� b   4 7��� m   4 5�� ���  ( ? < =� 1   5 6��
�� 
lnfd� m   7 8�� ��� &     " c o l o r " :   ) . + ( ? = , )��  ��  � o   . 3���� 0 keypointslib KeypointsLib� o      ���� $0 paperscolorindex papersColorIndex� ���� Z   @ k������� ?   @ C��� o   @ A���� $0 paperscolorindex papersColorIndex� m   A B����  � k   F g�� ��� r   F N��� n  F L��� I   G L������� B0 dtlabelforpapersannotationcolor dtLabelForPapersAnnotationColor� ���� o   G H���� $0 paperscolorindex papersColorIndex��  ��  �  f   F G� o      ���� 0 dtlabel dtLabel� ���� Z   O g������� ?   O R��� o   O P���� 0 dtlabel dtLabel� m   P Q����  � O  U c��� r   ] b��� o   ] ^���� 0 dtlabel dtLabel� n      ��� 1   _ a�
� 
DTla� o   ^ _�~�~ 0 dtrecord dtRecord� 5   U Z�}��|
�} 
capp� m   W X�� ���  D N t p
�| kfrmID  ��  ��  ��  ��  ��  ��  �   set color label   � ���     s e t   c o l o r   l a b e l��  ��  ��  � ��� l     �{�z�y�{  �z  �y  � ��� l     �x�w�v�x  �w  �v  � ��� l     �u���u  � T N Returns the contents of the `json string` property for the given Papers item.   � ��� �   R e t u r n s   t h e   c o n t e n t s   o f   t h e   ` j s o n   s t r i n g `   p r o p e r t y   f o r   t h e   g i v e n   P a p e r s   i t e m .� ��� i   J M��� I      �t��s�t 20 jsonstringforpapersitem jsonStringForPapersItem� ��r� o      �q�q 0 
papersitem 
papersItem�r  �s  � k     I�� ��� r     ��� m     �p
�p 
msng� o      �o�o 0 
jsonstring 
jsonString� ��� Q    F���� l      O    r     n     1    �n
�n 
pJSN o    �m�m 0 
papersitem 
papersItem o      �l�l 0 
jsonstring 
jsonString 5    �k	�j
�k 
capp	 m   	 


 � * c o m . m e k e n t o s j . p a p e r s 3
�j kfrmID   7 1 getting the json string may cause a -10000 error    � b   g e t t i n g   t h e   j s o n   s t r i n g   m a y   c a u s e   a   - 1 0 0 0 0   e r r o r� R      �i
�i .ascrerr ****      � **** o      �h�h 0 	errortext 	errorText �g�f
�g 
errn o      �e�e 0 errornumber errorNumber�f  � Z    F�d�c >     o    �b�b 0 errornumber errorNumber m    �a�a�� n  # B I   ( B�`�_�` (0 logtosystemconsole logToSystemConsole  n   ( + 1   ) +�^
�^ 
pnam  f   ( ) �] b   + > b   + < b   + : !  b   + 8"#" b   + 6$%$ b   + 4&'& b   + 2()( b   + 0*+* m   + ,,, �-- ~ C o u l d n ' t   f e t c h   ' j s o n   s t r i n g '   p r o p e r t y   f o r   p a p e r s   i t e m   o f   t y p e   "+ l  , /.�\�[. n   , //0/ m   - /�Z
�Z 
pcls0 o   , -�Y�Y 0 
papersitem 
papersItem�\  �[  ) m   0 111 �22  " .' 1   2 3�X
�X 
lnfd% m   4 533 �44  E r r o r :  # o   6 7�W�W 0 	errortext 	errorText! m   8 955 �66    ( o   : ;�V�V 0 errornumber errorNumber m   < =77 �88  )�]  �_   o   # (�U�U 0 keypointslib KeypointsLib�d  �c  � 9�T9 L   G I:: o   G H�S�S 0 
jsonstring 
jsonString�T  � ;<; l     �R�Q�P�R  �Q  �P  < =>= l     �O�N�M�O  �N  �M  > ?@? l     �LAB�L  A q k Returns the index of the DEVONthink color label corresponding to the given Papers publication color index.   B �CC �   R e t u r n s   t h e   i n d e x   o f   t h e   D E V O N t h i n k   c o l o r   l a b e l   c o r r e s p o n d i n g   t o   t h e   g i v e n   P a p e r s   p u b l i c a t i o n   c o l o r   i n d e x .@ DED i   N QFGF I      �KH�J�K D0  dtlabelforpaperspublicationcolor  dtLabelForPapersPublicationColorH I�II o      �H�H $0 paperscolorindex papersColorIndex�I  �J  G k     %JJ KLK l     �GMN�G  M M G Papers publication color index (name) -> DEVONthink label index (name)   N �OO �   P a p e r s   p u b l i c a t i o n   c o l o r   i n d e x   ( n a m e )   - >   D E V O N t h i n k   l a b e l   i n d e x   ( n a m e )L PQP l     �FRS�F  R   0 (none)		-> 0 (none)   S �TT ,   0   ( n o n e ) 	 	 - >   0   ( n o n e )Q UVU l     �EWX�E  W   1 (red)		-> 1 (red)   X �YY (   1   ( r e d ) 	 	 - >   1   ( r e d )V Z[Z l     �D\]�D  \    2 (orange)		-> 5 (orange)   ] �^^ 4   2   ( o r a n g e ) 	 	 - >   5   ( o r a n g e )[ _`_ l     �Cab�C  a    3 (yellow)		-> 4 (yellow)   b �cc 4   3   ( y e l l o w ) 	 	 - >   4   ( y e l l o w )` ded l     �Bfg�B  f   4 (green)		-> 2 (green)   g �hh 0   4   ( g r e e n ) 	 	 - >   2   ( g r e e n )e iji l     �Akl�A  k   5 (blue)		-> 3 (blue)   l �mm ,   5   ( b l u e ) 	 	 - >   3   ( b l u e )j non l     �@pq�@  p V P 6 (purple)		-> 7 (pink) // the "purple" Papers color label looks more like pink   q �rr �   6   ( p u r p l e ) 	 	 - >   7   ( p i n k )   / /   t h e   " p u r p l e "   P a p e r s   c o l o r   l a b e l   l o o k s   m o r e   l i k e   p i n ko sts l     �?uv�?  u 9 3 7 (light gray)		-> 6 (purple) // improper mapping!   v �ww f   7   ( l i g h t   g r a y ) 	 	 - >   6   ( p u r p l e )   / /   i m p r o p e r   m a p p i n g !t xyx r     z{z J     	|| }~} m     �>�> ~ � m    �=�= � ��� m    �<�< � ��� m    �;�; � ��� m    �:�: � ��� m    �9�9 � ��8� m    �7�7 �8  { o      �6�6 0 dtlabels dtLabelsy ��� l   �5�4�3�5  �4  �3  � ��2� Z    %���1�� F    ��� @    ��� o    �0�0 $0 paperscolorindex papersColorIndex� m    �/�/ � B    ��� o    �.�. $0 paperscolorindex papersColorIndex� m    �-�- � L     �� n    ��� 4    �,�
�, 
cobj� o    �+�+ $0 paperscolorindex papersColorIndex� o    �*�* 0 dtlabels dtLabels�1  � L   # %�� m   # $�)�)  �2  E ��� l     �(�'�&�(  �'  �&  � ��� l     �%�$�#�%  �$  �#  � ��� l     �"���"  � p j Returns the index of the DEVONthink color label corresponding to the given Papers annotation color index.   � ��� �   R e t u r n s   t h e   i n d e x   o f   t h e   D E V O N t h i n k   c o l o r   l a b e l   c o r r e s p o n d i n g   t o   t h e   g i v e n   P a p e r s   a n n o t a t i o n   c o l o r   i n d e x .� ��� i   R U��� I      �!�� �! B0 dtlabelforpapersannotationcolor dtLabelForPapersAnnotationColor� ��� o      �� $0 paperscolorindex papersColorIndex�  �   � k     '�� ��� l     ����  � L F Papers annotation color index (name) -> DEVONthink label index (name)   � ��� �   P a p e r s   a n n o t a t i o n   c o l o r   i n d e x   ( n a m e )   - >   D E V O N t h i n k   l a b e l   i n d e x   ( n a m e )� ��� l     ����  � &   used for highlight annotations:   � ��� @   u s e d   f o r   h i g h l i g h t   a n n o t a t i o n s :� ��� l     ����  �   0 (none)		-> 0 (none)   � ��� ,   0   ( n o n e ) 	 	 - >   0   ( n o n e )� ��� l     ����  �    1 (yellow)		-> 4 (yellow)   � ��� 4   1   ( y e l l o w ) 	 	 - >   4   ( y e l l o w )� ��� l     ����  �   2 (blue)		-> 3 (blue)   � ��� ,   2   ( b l u e ) 	 	 - >   3   ( b l u e )� ��� l     ����  �   3 (green)		-> 2 (green)   � ��� 0   3   ( g r e e n ) 	 	 - >   2   ( g r e e n )� ��� l     ����  �   4 (pink)		-> 7 (pink)   � ��� ,   4   ( p i n k ) 	 	 - >   7   ( p i n k )� ��� l     ����  �    5 (purple)		-> 6 (purple)   � ��� 4   5   ( p u r p l e ) 	 	 - >   6   ( p u r p l e )� ��� l     ����  � 8 2 6 (light gray)	-> 5 (orange) // improper mapping!   � ��� d   6   ( l i g h t   g r a y ) 	 - >   5   ( o r a n g e )   / /   i m p r o p e r   m a p p i n g !� ��� l     ����  �  �  � ��� l     ����  � %  only used for ink annotations:   � ��� >   o n l y   u s e d   f o r   i n k   a n n o t a t i o n s :� ��� l     ����  �   7 (orange)	-> 5 (orange)   � ��� 2   7   ( o r a n g e ) 	 - >   5   ( o r a n g e )� ��� l     ����  �   8 (red)		-> 1 (red)   � ��� (   8   ( r e d ) 	 	 - >   1   ( r e d )� ��� l     ����  �   9 (black)		-> 0 (none)   � ��� .   9   ( b l a c k ) 	 	 - >   0   ( n o n e )� ��� r     ��� J     �� ��� m     �� � ��� m    �� � ��� m    �� � ��� m    �
�
 � ��� m    �	�	 � ��� m    �� � � � m    ��    m    ��  � m    	��  �  � o      �� 0 dtlabels dtLabels�  l   ��� �  �  �    �� Z    '��	 F    

 @     o    ���� $0 paperscolorindex papersColorIndex m    ����  B     o    ���� $0 paperscolorindex papersColorIndex m    ���� 	 L    " n    ! 4     ��
�� 
cobj o    ���� $0 paperscolorindex papersColorIndex o    ���� 0 dtlabels dtLabels��  	 L   % ' m   % &����  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ����   [ U Finds the DEVONthink folder for this publication, or creates it if it doesn't exist.    � �   F i n d s   t h e   D E V O N t h i n k   f o l d e r   f o r   t h i s   p u b l i c a t i o n ,   o r   c r e a t e s   i t   i f   i t   d o e s n ' t   e x i s t .  l     �� !��    5 / Credit: modified after script code by Rob Trew   ! �"" ^   C r e d i t :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w #$# l     ��%&��  % l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   & �'' �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t$ ()( i   V Y*+* I      ��,����  0 createdtfolder createDTFolder, -.- o      ���� 0 dtcontainer dtContainer. /0/ o      ���� 0 
foldername 
folderName0 121 o      ���� 0 	folderurl 	folderURL2 343 o      ���� (0 foldercreationdate folderCreationDate4 565 o      ���� 0 
foldertags 
folderTags6 7��7 o      ���� 0 foldercomment folderComment��  ��  + O     �898 k    �:: ;<; Z    9=>��?= =   @A@ l   B����B I   ��C��
�� .corecnte****       ****C n    DED 2  	 ��
�� 
DTprE o    	���� 0 dtcontainer dtContainer��  ��  ��  A m    ����  > r    FGF l   H����H I   ��IJ
�� .DTpacd52DTrc       utxtI o    ���� 0 
foldername 
folderNameJ ��K��
�� 
DTinK n    LML m    ��
�� 
DTkbM o    ���� 0 dtcontainer dtContainer��  ��  ��  G o      ���� 0 
dtlocation 
dtLocation��  ? r   " 9NON l  " 7P����P I  " 7��QR
�� .DTpacd52DTrc       utxtQ l  " /S����S b   " /TUT b   " -VWV b   " +XYX b   " 'Z[Z n   " %\]\ 1   # %��
�� 
DTlo] o   " #���� 0 dtcontainer dtContainer[ m   % &^^ �__  /Y n   ' *`a` 1   ( *��
�� 
pnama o   ' (���� 0 dtcontainer dtContainerW m   + ,bb �cc  /U o   - .���� 0 
foldername 
folderName��  ��  R ��d��
�� 
DTind n   0 3efe m   1 3��
�� 
DTkbf o   0 1���� 0 dtcontainer dtContainer��  ��  ��  O o      ���� 0 
dtlocation 
dtLocation< ghg l  : :��������  ��  ��  h iji Z   : Skl����k F   : Gmnm o   : ?���� (0 transferpaperslink transferPapersLinkn >  B Eopo o   B C���� 0 	folderurl 	folderURLp m   C Dqq �rr  l r   J Osts o   J K���� 0 	folderurl 	folderURLt n      uvu 1   L N��
�� 
pURLv o   K L���� 0 
dtlocation 
dtLocation��  ��  j wxw l  T T��������  ��  ��  x yzy Z   T o{|����{ F   T a}~} o   T Y���� 80 transferpaperscreationdate transferPapersCreationDate~ >  \ _� o   \ ]���� (0 foldercreationdate folderCreationDate� m   ] ^��
�� 
msng| r   d k��� o   d e���� (0 foldercreationdate folderCreationDate� n      ��� 1   f j��
�� 
DTcr� o   e f���� 0 
dtlocation 
dtLocation��  ��  z ��� l  p p��������  ��  ��  � ��� Z   p �������� F   p ~��� o   p u���� 00 transferpaperskeywords transferPapersKeywords� >  x |��� o   x y���� 0 
foldertags 
folderTags� J   y {����  � l  � ����� r   � ���� b   � ���� l  � ������� n   � ���� 1   � ���
�� 
tags� o   � ����� 0 
dtlocation 
dtLocation��  ��  � o   � ����� 0 
foldertags 
folderTags� n      ��� 1   � ���
�� 
tags� o   � ����� 0 
dtlocation 
dtLocation� ( " in case the folder already exists   � ��� D   i n   c a s e   t h e   f o l d e r   a l r e a d y   e x i s t s��  ��  � ��� l  � ���������  ��  ��  � ��� Z   � �������� F   � ���� F   � ���� o   � ����� ,0 transferpapersbibtex transferPapersBibTeX� >  � ���� o   � ����� 0 foldercomment folderComment� m   � ��� ���  � >  � ���� o   � ����� 0 foldercomment folderComment� m   � ���
�� 
msng� r   � ���� o   � ����� 0 foldercomment folderComment� n      ��� 1   � ���
�� 
DTco� o   � ����� 0 
dtlocation 
dtLocation��  ��  � ��� l  � ���������  ��  ��  � ���� L   � ��� o   � ����� 0 
dtlocation 
dtLocation��  9 5     �����
�� 
capp� m    �� ���  D N t p
�� kfrmID  ) ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � Y S Creates a new (rich text) record in DEVONthink with the given text and returns it.   � ��� �   C r e a t e s   a   n e w   ( r i c h   t e x t )   r e c o r d   i n   D E V O N t h i n k   w i t h   t h e   g i v e n   t e x t   a n d   r e t u r n s   i t .� ��� l     ������  � 5 / Credit: modified after script code by Rob Trew   � ��� ^   C r e d i t :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     ������  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i   Z ]��� I      �������  0 createdtrecord createDTRecord� ��� o      ����  0 folderlocation folderLocation� ��� o      ���� 0 
recordname 
recordName� ��� o      �� 0 	recordurl 	recordURL� ��� o      �~�~ 0 
recordtext 
recordText� ��}� o      �|�| (0 recordcreationdate recordCreationDate�}  ��  � O     c��� k    b�� ��� r    ��� K    �� �{��
�{ 
DTty� m   	 
�z
�z Dtyprtf � �y��
�y 
DTri� o    �x�x 0 
recordtext 
recordText� �w��v
�w 
pnam� o    �u�u 0 
recordname 
recordName�v  � o      �t�t 0 newrecorddata newRecordData� ��� l   �s�r�q�s  �r  �q  � ��� Z    /���p�o� F     ��� o    �n�n (0 transferpaperslink transferPapersLink� >   ��� o    �m�m 0 	recordurl 	recordURL� m    �� ���  � r   # +��� b   # )��� o   # $�l�l 0 newrecorddata newRecordData� K   $ (�� �k��j
�k 
pURL� o   % &�i�i 0 	recordurl 	recordURL�j  � o      �h�h 0 newrecorddata newRecordData�p  �o  � ��� l  0 0�g�f�e�g  �f  �e  � ��� Z   0 L���d�c� F   0 =��� o   0 5�b�b 80 transferpaperscreationdate transferPapersCreationDate� >  8 ;� � o   8 9�a�a (0 recordcreationdate recordCreationDate  m   9 :�`
�` 
msng� r   @ H b   @ F o   @ A�_�_ 0 newrecorddata newRecordData K   A E �^�]
�^ 
DTcr o   B C�\�\ (0 recordcreationdate recordCreationDate�]   o      �[�[ 0 newrecorddata newRecordData�d  �c  �  l  M M�Z�Y�X�Z  �Y  �X   	
	 r   M V I  M T�W
�W .DTpacd08DTrc       reco o   M N�V�V 0 newrecorddata newRecordData �U�T
�U 
DTin o   O P�S�S  0 folderlocation folderLocation�T   o      �R�R 0 	newrecord 	newRecord
  r   W _ n  W ] I   X ]�Q�P�Q ,0 deduplicateddtrecord deduplicatedDTRecord �O o   X Y�N�N 0 	newrecord 	newRecord�O  �P    f   W X o      �M�M 0 arecord aRecord �L L   ` b o   ` a�K�K 0 arecord aRecord�L  � 5     �J�I
�J 
capp m     �  D N t p
�I kfrmID  �  l     �H�G�F�H  �G  �F     l     �E�D�C�E  �D  �C    !"! l     �B#$�B  # G A Creates an indexed object for the given file path in DEVONthink.   $ �%% �   C r e a t e s   a n   i n d e x e d   o b j e c t   f o r   t h e   g i v e n   f i l e   p a t h   i n   D E V O N t h i n k ." &'& i   ^ a()( I      �A*�@�A *0 createdtindexrecord createDTIndexRecord* +,+ o      �?�?  0 folderlocation folderLocation, -.- o      �>�> 0 filepath filePath. /0/ o      �=�= 0 
recordname 
recordName0 121 o      �<�< 0 	recordurl 	recordURL2 343 o      �;�; 0 
recordtags 
recordTags4 5�:5 o      �9�9 0 	isflagged 	isFlagged�:  �@  ) O     u676 k    t88 9:9 r    ;<; I   �8=>
�8 .DTpacd45DTrc       utxt= o    	�7�7 0 filepath filePath> �6?�5
�6 
DTto? o   
 �4�4  0 folderlocation folderLocation�5  < o      �3�3 0 indexrecord indexRecord: @A@ l   �2�1�0�2  �1  �0  A BCB r    DED o    �/�/ 0 
recordname 
recordNameE n      FGF 1    �.
�. 
DTalG o    �-�- 0 indexrecord indexRecordC HIH l   �,�+�*�,  �+  �*  I JKJ Z    /LM�)�(L F    #NON o    �'�' (0 transferpapersflag transferPapersFlagO o     !�&�& 0 	isflagged 	isFlaggedM r   & +PQP o   & '�%�% 0 	isflagged 	isFlaggedQ n      RSR 1   ( *�$
�$ 
DTstS o   ' (�#�# 0 indexrecord indexRecord�)  �(  K TUT l  0 0�"�!� �"  �!  �   U VWV Z   0 IXY��X F   0 =Z[Z o   0 5�� (0 transferpaperslink transferPapersLink[ >  8 ;\]\ o   8 9�� 0 	recordurl 	recordURL] m   9 :^^ �__  Y r   @ E`a` o   @ A�� 0 	recordurl 	recordURLa n      bcb 1   B D�
� 
pURLc o   A B�� 0 indexrecord indexRecord�  �  W ded l  J J����  �  �  e fgf Z   J hhi��h F   J Xjkj o   J O�� 00 transferpaperskeywords transferPapersKeywordsk >  R Vlml o   R S�� 0 
recordtags 
recordTagsm J   S U��  i r   [ dnon b   [ `pqp l  [ ^r��r n   [ ^sts 1   \ ^�
� 
tagst o   [ \�� 0 indexrecord indexRecord�  �  q o   ^ _�� 0 
recordtags 
recordTagso n      uvu 1   a c�
� 
tagsv o   ` a�
�
 0 indexrecord indexRecord�  �  g wxw l  i i�	���	  �  �  x yzy r   i q{|{ n  i o}~} I   j o��� ,0 deduplicateddtrecord deduplicatedDTRecord ��� o   j k�� 0 indexrecord indexRecord�  �  ~  f   i j| o      �� 0 arecord aRecordz ��� L   r t�� o   r s� �  0 arecord aRecord�  7 5     �����
�� 
capp� m    �� ���  D N t p
�� kfrmID  ' ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � Y S If the given record duplicates another in its group, discards the given record and   � ��� �   I f   t h e   g i v e n   r e c o r d   d u p l i c a t e s   a n o t h e r   i n   i t s   g r o u p ,   d i s c a r d s   t h e   g i v e n   r e c o r d   a n d� ��� l     ������  � X R returns the existing "duplicate" record, otherwise just returns the given record.   � ��� �   r e t u r n s   t h e   e x i s t i n g   " d u p l i c a t e "   r e c o r d ,   o t h e r w i s e   j u s t   r e t u r n s   t h e   g i v e n   r e c o r d .� ��� i   b e��� I      ������� ,0 deduplicateddtrecord deduplicatedDTRecord� ���� o      ���� 0 arecord aRecord��  ��  � O     N��� k    M�� ��� r    ��� n    ��� 1   	 ��
�� 
DTdu� o    	���� 0 arecord aRecord� o      ���� $0 recordduplicates recordDuplicates� ��� Z    J������� >   ��� o    ���� $0 recordduplicates recordDuplicates� J    ����  � k    F�� ��� r    ��� n    ��� 1    ��
�� 
DTlo� o    ���� 0 arecord aRecord� o      ����  0 recordlocation recordLocation� ���� X    F����� Z   + A������� =   + 0��� n   + .��� 1   , .��
�� 
DTlo� o   + ,���� $0 aduplicaterecord aDuplicateRecord� o   . /����  0 recordlocation recordLocation� k   3 =�� ��� I  3 :�����
�� .coredeloobj        obj ��  � �����
�� 
DTrc� o   5 6���� 0 arecord aRecord��  � ���� L   ; =�� o   ; <���� $0 aduplicaterecord aDuplicateRecord��  ��  ��  �� $0 aduplicaterecord aDuplicateRecord� o    ���� $0 recordduplicates recordDuplicates��  ��  ��  � ���� L   K M�� o   K L���� 0 arecord aRecord��  � 5     �����
�� 
capp� m    �� ���  D N t p
�� kfrmID  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � 7 1 Checks if DEVONthink Pro and Papers are running.   � ��� b   C h e c k s   i f   D E V O N t h i n k   P r o   a n d   P a p e r s   a r e   r u n n i n g .� ��� l     ������  � 5 / Credit: modified after script code by Rob Trew   � ��� ^   C r e d i t :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w� ��� l     ������  � l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   � ��� �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t� ��� i   f i��� I      �������� $0 checkappsrunning checkAppsRunning��  ��  � k     a�� ��� O     ^��� l   ]���� k    ]�� ��� Z    1������� A    ��� l   ������ I   �����
�� .corecnte****       ****� l   ������ 6  ��� 2   ��
�� 
prcs� =    ��� 1    ��
�� 
fcrt� m    �� ���  D N t p��  ��  ��  ��  ��  � m    ���� � k    -�� ��� n   *��� I   " *������� 0 displayerror displayError� ��� m   " #�� ��� 6 D E V O N t h i n k   P r o   n o t   r u n n i n g !� ��� m   # $   � � P l e a s e   o p e n   D E V O N t h i n k   P r o   a n d   s e l e c t   a   t a r g e t   d a t a b a s e   o r   g r o u p ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .�  m   $ %����  �� m   % &��
�� boovtrue��  ��  � o    "���� 0 keypointslib KeypointsLib� �� L   + - m   + ,��
�� boovfals��  ��  ��  � �� Z   2 ]	���� A   2 D

 l  2 B���� I  2 B����
�� .corecnte****       **** l  2 >���� 6 2 > 2  2 5��
�� 
prcs C   6 = 1   7 9��
�� 
bnid m   : < � * c o m . m e k e n t o s j . p a p e r s 3��  ��  ��  ��  ��   m   B C���� 	 k   G Y  n  G V I   L V������ 0 displayerror displayError  m   L M � * P a p e r s   3   n o t   r u n n i n g !   m   M P!! �"" � P l e a s e   o p e n   P a p e r s   3   a n d   s e l e c t   s o m e   p u b l i c a t i o n ( s ) ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .  #$# m   P Q���� $ %��% m   Q R��
�� boovtrue��  ��   o   G L���� 0 keypointslib KeypointsLib &��& L   W Y'' m   W X��
�� boovfals��  ��  ��  ��  � "  application "System Events"   � �(( 8   a p p l i c a t i o n   " S y s t e m   E v e n t s "� 5     ��)��
�� 
capp) m    ** �++  s e v s
�� kfrmID  � ,��, L   _ a-- m   _ `��
�� boovtrue��  � ./. l     ��������  ��  ��  / 010 l     ��������  ��  ��  1 232 l     ��45��  4 X R Gets the target window as well as the group currently selected in DEVONthink Pro.   5 �66 �   G e t s   t h e   t a r g e t   w i n d o w   a s   w e l l   a s   t h e   g r o u p   c u r r e n t l y   s e l e c t e d   i n   D E V O N t h i n k   P r o .3 787 l     ��9:��  9 5 / Credit: modified after script code by Rob Trew   : �;; ^   C r e d i t :   m o d i f i e d   a f t e r   s c r i p t   c o d e   b y   R o b   T r e w8 <=< l     ��>?��  > l f see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript   ? �@@ �   s e e   h t t p s : / / g i t h u b . c o m / R o b T r e w / t r e e - t o o l s / b l o b / m a s t e r / D e v o n T h i n k % 2 0 s c r i p t s / S e n t e 6 T o D e v n 7 3 . a p p l e s c r i p t= ABA i   j mCDC I      �������� .0 getdttargetcontainers getDTTargetContainers��  ��  D O     �EFE k    �GG HIH l   ��JK��  J - ' get the current group, if there is one   K �LL N   g e t   t h e   c u r r e n t   g r o u p ,   i f   t h e r e   i s   o n eI MNM r    OPO m    	��
�� 
msngP o      ���� 0 dtgroup dtGroupN QRQ t     STS Q    UV��U r    WXW 1    ��
�� 
DTcgX o      ���� 0 dtgroup dtGroupV R      ������
�� .ascrerr ****      � ****��  ��  ��  T m    ���� R YZY l  ! !��������  ��  ��  Z [\[ l  ! !��]^��  ] 6 0 else, get the current database, if there is one   ^ �__ `   e l s e ,   g e t   t h e   c u r r e n t   d a t a b a s e ,   i f   t h e r e   i s   o n e\ `a` Q   ! Fbcdb o   $ %���� 0 dtgroup dtGroupc R      ������
�� .ascrerr ****      � ****��  ��  d k   - Fee fgf r   - 6hih l  - 4j��~j n   - 4klk 1   2 4�}
�} 
DTrol 5   - 2�|m�{
�| 
DTkbm m   / 0�z�z 
�{ kfrmID  �  �~  i o      �y�y 0 dtgroup dtGroupg non r   7 @pqp I  7 >�x�wr
�x .DTpacd75thwi    ��� null�w  r �vs�u
�v 
DTrcs o   9 :�t�t 0 dtgroup dtGroup�u  q o      �s�s 0 dtwin dtWino t�rt L   A Fuu J   A Evv wxw o   A B�q�q 0 dtgroup dtGroupx y�py o   B C�o�o 0 dtwin dtWin�p  �r  a z{z l  G G�n�m�l�n  �m  �l  { |}| Z   G j~�k�j~ =  G J��� o   G H�i�i 0 dtgroup dtGroup� m   H I�h
�h 
msng k   M f�� ��� r   M V��� l  M T��g�f� n   M T��� 1   R T�e
�e 
DTro� 5   M R�d��c
�d 
DTkb� m   O P�b�b 
�c kfrmID  �g  �f  � o      �a�a 0 dtgroup dtGroup� ��� r   W `��� I  W ^�`�_�
�` .DTpacd75thwi    ��� null�_  � �^��]
�^ 
DTrc� o   Y Z�\�\ 0 dtgroup dtGroup�]  � o      �[�[ 0 dtwin dtWin� ��Z� L   a f�� J   a e�� ��� o   a b�Y�Y 0 dtgroup dtGroup� ��X� o   b c�W�W 0 dtwin dtWin�X  �Z  �k  �j  } ��� l  k k�V�U�T�V  �U  �T  � ��� l  k k�S���S  � 2 , ensure that a window is open for this group   � ��� X   e n s u r e   t h a t   a   w i n d o w   i s   o p e n   f o r   t h i s   g r o u p� ��� r   k ���� n   k w��� J   l w�� ��� m   m o�R
�R 
DTkb� ��Q� 1   q s�P
�P 
ID  �Q  � o   k l�O�O 0 dtgroup dtGroup� J      �� ��� o      �N�N 0 
dtdatabase 
dtDatabase� ��M� o      �L�L 0 	dtgroupid 	dtGroupID�M  � ��� r   � ���� 6 � ���� 2  � ��K
�K 
brws� F   � ���� =  � ���� n   � ���� 1   � ��J
�J 
ID  � n  � ���� 1   � ��I
�I 
DTro�  g   � �� o   � ��H�H 0 	dtgroupid 	dtGroupID� =  � ���� n   � ���� 1   � ��G
�G 
pnam� n  � ���� 1   � ��F
�F 
DTro�  g   � �� n   � ���� 1   � ��E
�E 
pnam� o   � ��D�D 0 
dtdatabase 
dtDatabase� o      �C�C 0 	dtwindows 	dtWindows� ��� Z   � ����B�� A   � ���� n   � ���� 1   � ��A
�A 
leng� o   � ��@�@ 0 	dtwindows 	dtWindows� m   � ��?�? � r   � ���� I  � ��>�=�
�> .DTpacd75thwi    ��� null�=  � �<��;
�< 
DTrc� o   � ��:�: 0 dtgroup dtGroup�;  � o      �9�9 0 dtwin dtWin�B  � r   � ���� n   � ���� 4  � ��8�
�8 
cobj� m   � ��7�7 � o   � ��6�6 0 	dtwindows 	dtWindows� o      �5�5 0 dtwin dtWin� ��� l  � ��4�3�2�4  �3  �2  � ��1� L   � ��� J   � ��� ��� o   � ��0�0 0 dtgroup dtGroup� ��/� o   � ��.�. 0 dtwin dtWin�/  �1  F 5     �-��,
�- 
capp� m    �� ���  D N t p
�, kfrmID  B ��+� l     �*�)�(�*  �)  �(  �+       �'��&�%�$�#�"�!� ������������������'  � ���������������������
�	��� &0 transferpaperspdf transferPapersPDF� (0 transferpapersflag transferPapersFlag� 00 transferpaperskeywords transferPapersKeywords� ,0 transferpapersbibtex transferPapersBibTeX� *0 transferpaperslabel transferPapersLabel� (0 transferpaperslink transferPapersLink� 80 transferpaperscreationdate transferPapersCreationDate� 40 exportedannotationscount exportedAnnotationsCount
� 
pimr� 0 keypointslib KeypointsLib
� .aevtoappnull  �   � ****� 0 pubswithpdf pubsWithPDF� >0 exportannotationstodevonthink exportAnnotationsToDEVONthink� @0 transferpaperspublicationcolor transferPapersPublicationColor� >0 transferpapersannotationcolor transferPapersAnnotationColor� 20 jsonstringforpapersitem jsonStringForPapersItem� D0  dtlabelforpaperspublicationcolor  dtLabelForPapersPublicationColor� B0 dtlabelforpapersannotationcolor dtLabelForPapersAnnotationColor�  0 createdtfolder createDTFolder�  0 createdtrecord createDTRecord�
 *0 createdtindexrecord createDTIndexRecord�	 ,0 deduplicateddtrecord deduplicatedDTRecord� $0 checkappsrunning checkAppsRunning� .0 getdttargetcontainers getDTTargetContainers
�& boovtrue
�% boovtrue
�$ boovtrue
�# boovtrue
�" boovtrue
�! boovtrue
�  boovtrue�  � ��� �  ��� ���
� 
cobj� �� ���� �  ��  � ��� �������������������������������  
�  boovtrue
�� boovtrue
�� boovtrue
�� boovtrue
�� boovtrue
�� boovtrue
�� boovtrue��  � �� ����
�� 
scpt� �����������
�� .aevtoappnull  �   � ****��  ��  � ���� 0 i  � M�����������������������������������������������������������������Z\^`�������������������������������������������
��7��"��$��)����1��4������ $0 checkappsrunning checkAppsRunning�� 0 setupprogress setupProgress
�� 
capp
�� kfrmID  
�� 
PLiW
�� 
pSeP�� 0 selectedpubs selectedPubs�� 0 pubswithpdf pubsWithPDF�� 0 pdfpubs pdfPubs
�� .corecnte****       ****�� 0 pubcount pubCount�� .0 getdttargetcontainers getDTTargetContainers
�� 
cobj�� 0 dtcontainer dtContainer�� 0 dtwin dtWin�� 40 settotalstepsforprogress setTotalStepsForProgress�� 0 apub aPub
�� 
pRef
�� 
pCiK
�� 
pTit
�� 
pItU
�� 
pCrD�� �� 0 pubref pubRef�� 0 pubkey pubKey�� 0 pubtitle pubTitle�� �� 0 publink pubLink�� "0 pubcreationdate pubCreationDate
�� 
PKey
�� 
pnam�� 0 pubkeywords pubKeywords��  0 updateprogress updateProgress
�� 
PPrF
�� 
PAnn��  0 pubannotations pubAnnotations
�� 
bool�� 0 
foldername 
folderName
�� 
pBib�� 0 	pubbibtex 	pubBibTeX�� ��  0 createdtfolder createDTFolder��  0 folderlocation folderLocation�� @0 transferpaperspublicationcolor transferPapersPublicationColor
�� 
msng�� 0 pdffile pdfFile
�� 
pFPa�� 0 pdfpath pdfPath
�� 
pFlg�� 0 	isflagged 	isFlagged�� *0 createdtindexrecord createDTIndexRecord�� 0 indexrecord indexRecord�� >0 exportannotationstodevonthink exportAnnotationsToDEVONthink�� (0 logtosystemconsole logToSystemConsole
�� .miscactvnull��� ��� null
�� 
lnfd
�� 
appr
�� 
disp
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT��R)j+   hY hOb  	�k+ O)���0�*�k/�,E�O)�k+ 	E�O�j E�O)j+ E[�k/E�Z[�l/E` ZOb  	�k+ OjEc  O�k�kh  ��/E` O_ [a ,\[a ,\[a ,\[a ,\[a ,\Za vE[�k/E` Z[�l/E` Z[�m/E` Z[�a /E` Z[�a /E` ZO_ a -a  ,E` !Ob  	�a "�%a #%�%a $%_ %a %%l+ &O_ a ',a (-E` )Ob   
 _ )jva *& �_ a +%_ %E` ,O_ a -,E` .O)�_ ,_ _ _ !_ .a /+ 0E` 1O)_ 1_ l+ 2O_ 1a 3 ub    R_ a ',E` 4O_ 4a 5,E` 6O_ a 7,E` 8O)_ 1_ 6_ ,_ _ !_ 8a /+ 9E` :O)_ :_ l+ 2Y hO)_ 1_ )_ _ _ a + ;Y b  	)a  ,a <_ %a =%l+ >Y h[OY�cUO)�a ?�0 9*j @Oa A�%_ B%a C%b  %a Da Ea Fla Ga Hkva Ia Ja K LU� ��E���������� 0 pubswithpdf pubsWithPDF�� ����� �  ���� 0 publist pubList��  � ���������� 0 publist pubList��  0 allpubswithpdf allPubsWithPDF�� 0 apub aPub�� 0 pdffile pdfFile� 	��h��������������
�� 
capp
�� kfrmID  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
PPrF
�� 
msng
�� 
pcnt�� =)���0 5jvE�O *�[��l kh ��,E�O�� ��,�6GY h[OY��O�U� ��v���������� >0 exportannotationstodevonthink exportAnnotationsToDEVONthink�� ��	 �� 	   ������������  0 folderlocation folderLocation��  0 pubannotations pubAnnotations�� 0 pubref pubRef�� 0 pubkey pubKey�� 0 publink pubLink��  � ������������������������  0 folderlocation folderLocation��  0 pubannotations pubAnnotations�� 0 pubref pubRef�� 0 pubkey pubKey�� 0 publink pubLink�� 0 anannotation anAnnotation�� (0 recordcreationdate recordCreationDate�� &0 annotationsummary annotationSummary�� 0 
recordname 
recordName��  0 recordcontents recordContents�� 0 dtrecord dtRecord� ��������������������������������
�� 
msng
�� 
bool
�� 
capp
�� kfrmID  
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pTyp
�� 
pCrD
�� 
pCoS
�� 
lnfd�� ��  0 createdtrecord createDTRecord�� >0 transferpapersannotationcolor transferPapersAnnotationColor�� ��� 
 �� �& hY hO)���0 } z�[��l kh ��,� _��,E�O��,E�O��%�%E�O��%�%�%�%�%�%�%�%�%�%E�O)�����a + E�O�� b  kEc  Y hO)��l+ Y h[OY��U� �*�~�}		�|� @0 transferpaperspublicationcolor transferPapersPublicationColor�~ �{	�{ 	  �z�y�z 0 dtrecord dtRecord�y &0 paperspublication papersPublication�}  	 �x�w�v�u�t�x 0 dtrecord dtRecord�w &0 paperspublication papersPublication�v 0 pubjson pubJSON�u $0 paperscolorindex papersColorIndex�t 0 dtlabel dtLabel	 �s�r�q_�pa�o�n�m}�l�k
�s 
msng
�r 
bool�q 20 jsonstringforpapersitem jsonStringForPapersItem
�p 
lnfd�o 0 
regexmatch 
regexMatch�n D0  dtlabelforpaperspublicationcolor  dtLabelForPapersPublicationColor
�m 
capp
�l kfrmID  
�k 
DTla�| p�� 
 �� �& hY hO)�k+ E�Ob  	 ���& Bb  	���%�%l+ E�O�j &)�k+ E�O�j )���0 ���,FUY hY hY h� �j��i�h		�g�j >0 transferpapersannotationcolor transferPapersAnnotationColor�i �f	�f 	  �e�d�e 0 dtrecord dtRecord�d $0 papersannotation papersAnnotation�h  	 �c�b�a�`�_�c 0 dtrecord dtRecord�b $0 papersannotation papersAnnotation�a 0 notejson noteJSON�` $0 paperscolorindex papersColorIndex�_ 0 dtlabel dtLabel	 �^�]�\��[��Z�Y�X��W�V
�^ 
msng
�] 
bool�\ 20 jsonstringforpapersitem jsonStringForPapersItem
�[ 
lnfd�Z 0 
regexmatch 
regexMatch�Y B0 dtlabelforpapersannotationcolor dtLabelForPapersAnnotationColor
�X 
capp
�W kfrmID  
�V 
DTla�g p�� 
 �� �& hY hO)�k+ E�Ob  	 ���& Bb  	���%�%l+ E�O�j &)�k+ E�O�j )���0 ���,FUY hY hY h� �U��T�S		�R�U 20 jsonstringforpapersitem jsonStringForPapersItem�T �Q		�Q 		  �P�P 0 
papersitem 
papersItem�S  	 �O�N�M�L�O 0 
papersitem 
papersItem�N 0 
jsonstring 
jsonString�M 0 	errortext 	errorText�L 0 errornumber errorNumber	 �K�J
�I�H�G	
�F�E,�D1�C357�B
�K 
msng
�J 
capp
�I kfrmID  
�H 
pJSN�G 0 	errortext 	errorText	
 �A�@�?
�A 
errn�@ 0 errornumber errorNumber�?  �F��
�E 
pnam
�D 
pcls
�C 
lnfd�B (0 logtosystemconsole logToSystemConsole�R J�E�O )���0 ��,E�UW 0X  �� $b  	)�,��,%�%�%�%�%�%�%�%l+ Y hO�� �>G�=�<		�;�> D0  dtlabelforpaperspublicationcolor  dtLabelForPapersPublicationColor�= �:	�: 	  �9�9 $0 paperscolorindex papersColorIndex�<  	 �8�7�8 $0 paperscolorindex papersColorIndex�7 0 dtlabels dtLabels	 �6�5�4�3�2�1�6 �5 �4 �3 
�2 
bool
�1 
cobj�; &k��lm���vE�O�k	 ���& ��/EY j� �0��/�.		�-�0 B0 dtlabelforpapersannotationcolor dtLabelForPapersAnnotationColor�/ �,	�, 	  �+�+ $0 paperscolorindex papersColorIndex�.  	 �*�)�* $0 paperscolorindex papersColorIndex�) 0 dtlabels dtLabels	 �(�'�&�%�$�#�"�( �' �& �% �$ 	
�# 
bool
�" 
cobj�- (�ml����kj�vE�O�k	 ���& ��/EY j� �!+� �		��!  0 createdtfolder createDTFolder�  �	� 	  ������� 0 dtcontainer dtContainer� 0 
foldername 
folderName� 0 	folderurl 	folderURL� (0 foldercreationdate folderCreationDate� 0 
foldertags 
folderTags� 0 foldercomment folderComment�  	 �������� 0 dtcontainer dtContainer� 0 
foldername 
folderName� 0 	folderurl 	folderURL� (0 foldercreationdate folderCreationDate� 0 
foldertags 
folderTags� 0 foldercomment folderComment� 0 
dtlocation 
dtLocation	 �������
�	�^�bq�������
� 
capp
� kfrmID  
� 
DTpr
� .corecnte****       ****
� 
DTin
�
 
DTkb
�	 .DTpacd52DTrc       utxt
� 
DTlo
� 
pnam
� 
bool
� 
pURL
� 
msng
� 
DTcr
� 
tags
� 
DTco� �)���0 ���-j j  ���,l E�Y ��,�%��,%�%�%��,l E�Ob  	 ���& 
���,FY hOb  	 ���& ��a ,FY hOb  	 �jv�& �a ,�%�a ,FY hOb  	 	�a �&	 ���& ��a ,FY hO�U� � �����		���   0 createdtrecord createDTRecord�� ��	�� 	  ������������  0 folderlocation folderLocation�� 0 
recordname 
recordName�� 0 	recordurl 	recordURL�� 0 
recordtext 
recordText�� (0 recordcreationdate recordCreationDate��  	 ������������������  0 folderlocation folderLocation�� 0 
recordname 
recordName�� 0 	recordurl 	recordURL�� 0 
recordtext 
recordText�� (0 recordcreationdate recordCreationDate�� 0 newrecorddata newRecordData�� 0 	newrecord 	newRecord�� 0 arecord aRecord	 �����������������������������
�� 
capp
�� kfrmID  
�� 
DTty
�� Dtyprtf 
�� 
DTri
�� 
pnam�� 
�� 
bool
�� 
pURL
�� 
msng
�� 
DTcr
�� 
DTin
�� .DTpacd08DTrc       reco�� ,0 deduplicateddtrecord deduplicatedDTRecord�� d)���0 \�����E�Ob  	 ���& ��l%E�Y hOb  	 ���& ��l%E�Y hO���l E�O)�k+ E�O�U� ��)����		���� *0 createdtindexrecord createDTIndexRecord�� ��	�� 	  ��������������  0 folderlocation folderLocation�� 0 filepath filePath�� 0 
recordname 
recordName�� 0 	recordurl 	recordURL�� 0 
recordtags 
recordTags�� 0 	isflagged 	isFlagged��  	 ������������������  0 folderlocation folderLocation�� 0 filepath filePath�� 0 
recordname 
recordName�� 0 	recordurl 	recordURL�� 0 
recordtags 
recordTags�� 0 	isflagged 	isFlagged�� 0 indexrecord indexRecord�� 0 arecord aRecord	 ���������������^������
�� 
capp
�� kfrmID  
�� 
DTto
�� .DTpacd45DTrc       utxt
�� 
DTal
�� 
bool
�� 
DTst
�� 
pURL
�� 
tags�� ,0 deduplicateddtrecord deduplicatedDTRecord�� v)���0 n��l E�O���,FOb  	 ��& 
���,FY hOb  	 ���& 
���,FY hOb  	 �jv�& ��,�%��,FY hO)�k+ E�O�U� �������		���� ,0 deduplicateddtrecord deduplicatedDTRecord�� ��	�� 	  ���� 0 arecord aRecord��  	 ���������� 0 arecord aRecord�� $0 recordduplicates recordDuplicates��  0 recordlocation recordLocation�� $0 aduplicaterecord aDuplicateRecord	 
�������������������
�� 
capp
�� kfrmID  
�� 
DTdu
�� 
DTlo
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
DTrc
�� .coredeloobj        obj �� O)���0 G��,E�O�jv 6��,E�O *�[��l kh ��,�  *�l 	O�Y h[OY��Y hO�U� �������		���� $0 checkappsrunning checkAppsRunning��  ��  	  	 ��*����	������ ��������!
�� 
capp
�� kfrmID  
�� 
prcs	  
�� 
fcrt
�� .corecnte****       ****�� �� �� 0 displayerror displayError
�� 
bnid�� b)���0 W*�-�[�,\Z�81j k b  	���e�+ OfY hO*�-�[�,\Z�>1j k b  	�a �e�+ OfY hUOe� ��D����	 	!���� .0 getdttargetcontainers getDTTargetContainers��  ��  	  ������������ 0 dtgroup dtGroup�� 0 dtwin dtWin�� 0 
dtdatabase 
dtDatabase�� 0 	dtgroupid 	dtGroupID�� 0 	dtwindows 	dtWindows	! ���������������������������	����
�� 
capp
�� kfrmID  
�� 
msng
�� 
DTcg��  ��  
�� 
DTkb
�� 
DTro
�� 
DTrc
�� .DTpacd75thwi    ��� null
�� 
ID  
�� 
cobj
�� 
brws
�� 
pnam
�� 
leng�� �)���0 ��E�Okn 
*�,E�W X  hoO �W  X  *�k�0�,E�O*�l 
E�O��lvO��  *�k�0�,E�O*�l 
E�O��lvY hO�[�,\[�,\ZlvE[�k/E�Z[�l/E�ZO*�-�[[�,�,\Z�8\[�,�,\Z��,8A1E�O�a ,k *�l 
E�Y ��k/E�O��lvU
� 
scpt�  � ��	"��
�� 
cobj	" 	#	# ���
�� 
osax��  ascr  ��ޭ