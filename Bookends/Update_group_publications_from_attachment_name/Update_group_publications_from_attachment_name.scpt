FasdUAS 1.101.10   ��   ��    k             l     ��  ��    5 / Update group publications from attachment name     � 	 	 ^   U p d a t e   g r o u p   p u b l i c a t i o n s   f r o m   a t t a c h m e n t   n a m e   
  
 l     ��  ��    2 , version 1.0, licensed under the MIT license     �   X   v e r s i o n   1 . 0 ,   l i c e n s e d   u n d e r   t h e   M I T   l i c e n s e      l     ��������  ��  ��        l     ��  ��    B < by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de     �   x   b y   M a t t h i a s   S t e f f e n s ,   k e y p o i n t s . a p p ,   m a t ( a t ) e x t r a c t s ( d o t ) d e      l     ��������  ��  ��        l     ��  ��    g a This sample script for Bookends 13.2 or greater shows how to extract information from attachment     �   �   T h i s   s a m p l e   s c r i p t   f o r   B o o k e n d s   1 3 . 2   o r   g r e a t e r   s h o w s   h o w   t o   e x t r a c t   i n f o r m a t i o n   f r o m   a t t a c h m e n t      l     ��   ��    < 6 file names, and set publication metadata accordingly:      � ! ! l   f i l e   n a m e s ,   a n d   s e t   p u b l i c a t i o n   m e t a d a t a   a c c o r d i n g l y :   " # " l     ��������  ��  ��   #  $ % $ l     �� & '��   & f ` For all publications contained in the group chosen from your frontmost Bookends library window,    ' � ( ( �   F o r   a l l   p u b l i c a t i o n s   c o n t a i n e d   i n   t h e   g r o u p   c h o s e n   f r o m   y o u r   f r o n t m o s t   B o o k e n d s   l i b r a r y   w i n d o w , %  ) * ) l     �� + ,��   + i c this script will take the first attachment of each publication, extract the part of the attachment    , � - - �   t h i s   s c r i p t   w i l l   t a k e   t h e   f i r s t   a t t a c h m e n t   o f   e a c h   p u b l i c a t i o n ,   e x t r a c t   t h e   p a r t   o f   t h e   a t t a c h m e n t *  . / . l     �� 0 1��   0 j d name that's enclosed with parentheses, and add all of its words as individual publication keywords.    1 � 2 2 �   n a m e   t h a t ' s   e n c l o s e d   w i t h   p a r e n t h e s e s ,   a n d   a d d   a l l   o f   i t s   w o r d s   a s   i n d i v i d u a l   p u b l i c a t i o n   k e y w o r d s . /  3 4 3 l     ��������  ��  ��   4  5 6 5 l     �� 7 8��   7 s m As an example, consider a PDF file name for an academic paper (e.g.: http://dx.doi.org/10.1038/npp.2015.181)    8 � 9 9 �   A s   a n   e x a m p l e ,   c o n s i d e r   a   P D F   f i l e   n a m e   f o r   a n   a c a d e m i c   p a p e r   ( e . g . :   h t t p : / / d x . d o i . o r g / 1 0 . 1 0 3 8 / n p p . 2 0 1 5 . 1 8 1 ) 6  : ; : l     �� < =��   < ` Z where the user has added his own keywords within parentheses to the file name, like this:    = � > > �   w h e r e   t h e   u s e r   h a s   a d d e d   h i s   o w n   k e y w o r d s   w i t h i n   p a r e n t h e s e s   t o   t h e   f i l e   n a m e ,   l i k e   t h i s : ;  ? @ ? l     �� A B��   A       B � C C    @  D E D l     �� F G��   F ; 5   Chen & Baram '16 (dev stress cognitive review).pdf    G � H H j       C h e n   &   B a r a m   ' 1 6   ( d e v   s t r e s s   c o g n i t i v e   r e v i e w ) . p d f E  I J I l     �� K L��   K       L � M M    J  N O N l     �� P Q��   P g a This script will extract those keywords ("dev", "stress", "cognitive", and "review") and set the    Q � R R �   T h i s   s c r i p t   w i l l   e x t r a c t   t h o s e   k e y w o r d s   ( " d e v " ,   " s t r e s s " ,   " c o g n i t i v e " ,   a n d   " r e v i e w " )   a n d   s e t   t h e O  S T S l     �� U V��   U 2 , publication's "Keywords" field accordingly.    V � W W X   p u b l i c a t i o n ' s   " K e y w o r d s "   f i e l d   a c c o r d i n g l y . T  X Y X l     ��������  ��  ��   Y  Z [ Z l     �� \ ]��   \ g a To adopt this script to your needs, you'd need to set the value of the `substringRegex` property    ] � ^ ^ �   T o   a d o p t   t h i s   s c r i p t   t o   y o u r   n e e d s ,   y o u ' d   n e e d   t o   s e t   t h e   v a l u e   o f   t h e   ` s u b s t r i n g R e g e x `   p r o p e r t y [  _ ` _ l     �� a b��   a d ^ to a search pattern that matches your data in the attachment file name. Also, you may need to    b � c c �   t o   a   s e a r c h   p a t t e r n   t h a t   m a t c h e s   y o u r   d a t a   i n   t h e   a t t a c h m e n t   f i l e   n a m e .   A l s o ,   y o u   m a y   n e e d   t o `  d e d l     �� f g��   f h b edit the value of the `delimiter` property. And in the main script handler (`on run`), instead of    g � h h �   e d i t   t h e   v a l u e   o f   t h e   ` d e l i m i t e r `   p r o p e r t y .   A n d   i n   t h e   m a i n   s c r i p t   h a n d l e r   ( ` o n   r u n ` ) ,   i n s t e a d   o f e  i j i l     �� k l��   k c ] calling `setKeywordsForPublication()`, perform your own action to handle the extracted data.    l � m m �   c a l l i n g   ` s e t K e y w o r d s F o r P u b l i c a t i o n ( ) ` ,   p e r f o r m   y o u r   o w n   a c t i o n   t o   h a n d l e   t h e   e x t r a c t e d   d a t a . j  n o n l     ��������  ��  ��   o  p q p l     �� r s��   r \ V This script requires macOS 10.10 (Yosemite) or greater, and Bookends 13.2 or greater.    s � t t �   T h i s   s c r i p t   r e q u i r e s   m a c O S   1 0 . 1 0   ( Y o s e m i t e )   o r   g r e a t e r ,   a n d   B o o k e n d s   1 3 . 2   o r   g r e a t e r . q  u v u l     ��������  ��  ��   v  w x w l     �� y z��   y "  TODO: display progress info    z � { { 8   T O D O :   d i s p l a y   p r o g r e s s   i n f o x  | } | l     ��������  ��  ��   }  ~  ~ l     �� � ���   � V P ----------- you may edit the values of the properties below -------------------    � � � � �   - - - - - - - - - - -   y o u   m a y   e d i t   t h e   v a l u e s   o f   t h e   p r o p e r t i e s   b e l o w   - - - - - - - - - - - - - - - - - - -   � � � l     ��������  ��  ��   �  � � � l     �� � ���   � X R The group name whose publications & attachments will be processed by this script.    � � � � �   T h e   g r o u p   n a m e   w h o s e   p u b l i c a t i o n s   &   a t t a c h m e n t s   w i l l   b e   p r o c e s s e d   b y   t h i s   s c r i p t . �  � � � l     �� � ���   � [ U Note that you don't need to specify a group name here, since the script will ask you    � � � � �   N o t e   t h a t   y o u   d o n ' t   n e e d   t o   s p e c i f y   a   g r o u p   n a m e   h e r e ,   s i n c e   t h e   s c r i p t   w i l l   a s k   y o u �  � � � l     �� � ���   � E ? to choose a group name from a list of all user-created groups.    � � � � ~   t o   c h o o s e   a   g r o u p   n a m e   f r o m   a   l i s t   o f   a l l   u s e r - c r e a t e d   g r o u p s . �  � � � j     �� ��� 0 	groupname 	groupName � m      � � � � �   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � _ Y The search pattern (as an ICU-compatible regular expression) which matches the substring    � � � � �   T h e   s e a r c h   p a t t e r n   ( a s   a n   I C U - c o m p a t i b l e   r e g u l a r   e x p r e s s i o n )   w h i c h   m a t c h e s   t h e   s u b s t r i n g �  � � � l     �� � ���   � : 4 that shall be extracted from attachment file names.    � � � � h   t h a t   s h a l l   b e   e x t r a c t e d   f r o m   a t t a c h m e n t   f i l e   n a m e s . �  � � � l     �� � ���   � R L The given pattern matches everything between the first pair of parentheses.    � � � � �   T h e   g i v e n   p a t t e r n   m a t c h e s   e v e r y t h i n g   b e t w e e n   t h e   f i r s t   p a i r   o f   p a r e n t h e s e s . �  � � � j    �� ���  0 substringregex substringRegex � m     � � � � �   ( ? < = \ ( ) . + ? ( ? = \ ) ) �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � f ` Specifies the delimiter that will be used to split the matched substring into individual items.    � � � � �   S p e c i f i e s   t h e   d e l i m i t e r   t h a t   w i l l   b e   u s e d   t o   s p l i t   t h e   m a t c h e d   s u b s t r i n g   i n t o   i n d i v i d u a l   i t e m s . �  � � � l     �� � ���   � 6 0 Specify an empty string to avoid any splitting.    � � � � `   S p e c i f y   a n   e m p t y   s t r i n g   t o   a v o i d   a n y   s p l i t t i n g . �  � � � j    �� ��� 0 	delimiter   � m     � � � � �    �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � f ` Specifies whether the extracted keywords will replace the current contents of the publication's    � � � � �   S p e c i f i e s   w h e t h e r   t h e   e x t r a c t e d   k e y w o r d s   w i l l   r e p l a c e   t h e   c u r r e n t   c o n t e n t s   o f   t h e   p u b l i c a t i o n ' s �  � � � l     �� � ���   � h b "Keywords" field (`true`), or if the extracted keywords will be appended to any existing keywords    � � � � �   " K e y w o r d s "   f i e l d   ( ` t r u e ` ) ,   o r   i f   t h e   e x t r a c t e d   k e y w o r d s   w i l l   b e   a p p e n d e d   t o   a n y   e x i s t i n g   k e y w o r d s �  � � � l     �� � ���   �   (`false`).    � � � �    ( ` f a l s e ` ) . �  � � � j   	 �� ��� 20 replaceexistingkeywords replaceExistingKeywords � m   	 
��
�� boovfals �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � L F Specifies the help messages that are displayed when the script is run    � � � � �   S p e c i f i e s   t h e   h e l p   m e s s a g e s   t h a t   a r e   d i s p l a y e d   w h e n   t h e   s c r i p t   i s   r u n �  � � � j    �� ��� 0 helpmessage helpMessage � m     � � � � � F o r   a l l   p u b l i c a t i o n s   i n   a   g r o u p ,   t h i s   s c r i p t   w i l l   e x t r a c t   a l l   w o r d s   w i t h i n   t h e   f i r s t   p a i r   o f   p a r e n s   f r o m   t h e   f i r s t   a t t a c h m e n t   n a m e �  � � � l      � � � � j    �� ��� ,0 additionalinfoappend additionalInfoAppend � m     � � � � � T ,   a n d   a p p e n d   t h e m   t o   t h e   " K e y w o r d s "   f i e l d . � * $ if replaceExistingKeywords is false    � � � � H   i f   r e p l a c e E x i s t i n g K e y w o r d s   i s   f a l s e �  � � � l      � � � � j    �� ��� .0 additionalinforeplace additionalInfoReplace � m     � � � � � V ,   a n d   s e t   t h e   " K e y w o r d s "   f i e l d   a c c o r d i n g l y . � ) # if replaceExistingKeywords is true    � � � � F   i f   r e p l a c e E x i s t i n g K e y w o r d s   i s   t r u e �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � W Q ----------- usually, you don't need to edit anything below this line -----------    � � � � �   - - - - - - - - - - -   u s u a l l y ,   y o u   d o n ' t   n e e d   t o   e d i t   a n y t h i n g   b e l o w   t h i s   l i n e   - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � l      � � � � x    �� ��    1      ��
�� 
ascr ����
�� 
minv m       �  2 . 4��   �    Yosemite (10.10) or later    � � 4   Y o s e m i t e   ( 1 0 . 1 0 )   o r   l a t e r �  x    *������   2   #��
�� 
osax��   	
	 l     ��������  ��  ��  
  l     ����     main script handler    � (   m a i n   s c r i p t   h a n d l e r  i   * - I     ������
�� .aevtoappnull  �   � ****��  ��   k     �  r      n     I    �������� "0 choosegroupname chooseGroupName��  ��    f      o      ���� $0 chosengroupnames chosenGroupNames  l    Z    !����  =   "#" o    	���� $0 chosengroupnames chosenGroupNames# m   	 
��
�� boovfals! R    ����$
�� .ascrerr ****      � ****��  $ ��%��
�� 
errn% m    ��������  ��  ��   %  abort if user pressed "Cancel"    �&& >   a b o r t   i f   u s e r   p r e s s e d   " C a n c e l " '(' r    #)*) n    +,+ 4   ��-
�� 
cobj- m    ���� , o    ���� $0 chosengroupnames chosenGroupNames* o      ���� 0 	groupname 	groupName( ./. l  $ $��������  ��  ��  / 010 r   $ 0232 n  $ .454 I   % .��6���� 80 publicationsforgroupbyname publicationsForGroupByName6 7��7 o   % *���� 0 	groupname 	groupName��  ��  5  f   $ %3 o      ���� 0 	grouppubs 	groupPubs1 898 Z   1 ]:;��~: =  1 5<=< o   1 2�}�} 0 	grouppubs 	groupPubs= J   2 4�|�|  ; k   8 Y>> ?@? r   8 CABA b   8 ACDC b   8 ?EFE m   8 9GG �HH * T h e   s e l e c t e d   g r o u p   ( "F o   9 >�{�{ 0 	groupname 	groupNameD m   ? @II �JJ 8 " )   c o n t a i n s   n o   p u b l i c a t i o n s .B o      �z�z 0 
themessage 
theMessage@ KLK r   D GMNM m   D EOO �PP � P l e a s e   s e l e c t   a   g r o u p   c o n t a i n i n g   t h e   p u b l i c a t i o n s   y o u ' d   l i k e   t o   p r o c e s s ,   t h e n   r u n   t h i s   s c r i p t   a g a i n .N o      �y�y  0 additionalinfo additionalInfoL QRQ n  H SSTS I   I S�xU�w�x  0 displaymessage displayMessageU VWV m   I JXX �YY , N o   p u b l i c a t i o n s   f o u n d !W Z[Z o   J K�v�v 0 
themessage 
theMessage[ \]\ o   K L�u�u  0 additionalinfo additionalInfo] ^_^ m   L M`` �aa  T r y   a g a i n_ bcb m   M Ndd �ee 4 c o m . s o n n y s o f t w a r e . b o o k e n d sc f�tf m   N O�s�s �t  �w  T  f   H IR g�rg l  T Yhijh I  T Y�q�p�o
�q .aevtoappnull  �   � ****�p  �o  i $  run main script handler again   j �kk <   r u n   m a i n   s c r i p t   h a n d l e r   a g a i n�r  �  �~  9 lml l  ^ ^�n�m�l�n  �m  �l  m n�kn X   ^ �o�jpo k   p �qq rsr r   p ztut n  p vvwv I   q v�ix�h�i H0 "firstattachmentnamefrompublication "firstAttachmentNameFromPublicationx y�gy o   q r�f�f 0 apub aPub�g  �h  w  f   p qu o      �e�e  0 attachmentname attachmentNames z�dz Z   { �{|�c�b{ >  { �}~} o   { ~�a�a  0 attachmentname attachmentName~ m   ~ � ���  | k   � ��� ��� r   � ���� n  � ���� I   � ��`��_�` ,0 substringsfromstring substringsFromString� ��� o   � ��^�^  0 attachmentname attachmentName� ��� o   � ��]�]  0 substringregex substringRegex� ��\� o   � ��[�[ 0 	delimiter  �\  �_  �  f   � �� o      �Z�Z 0 keywordslist keywordsList� ��Y� Z   � ����X�W� >  � ���� o   � ��V�V 0 keywordslist keywordsList� J   � ��U�U  � r   � ���� n  � ���� I   � ��T��S�T 60 setkeywordsforpublication setKeywordsForPublication� ��� o   � ��R�R 0 apub aPub� ��Q� o   � ��P�P 0 keywordslist keywordsList�Q  �S  �  f   � �� o      �O�O 0 success  �X  �W  �Y  �c  �b  �d  �j 0 apub aPubp o   a b�N�N 0 	grouppubs 	groupPubs�k   ��� l     �M�L�K�M  �L  �K  � ��� l     �J���J  � [ U ------------------------------------------------------------------------------------   � ��� �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �I�H�G�I  �H  �G  � ��� l     �F���F  � W Q Presents a dialog with a list of user-created groups from the frontmost Bookends   � ��� �   P r e s e n t s   a   d i a l o g   w i t h   a   l i s t   o f   u s e r - c r e a t e d   g r o u p s   f r o m   t h e   f r o n t m o s t   B o o k e n d s� ��� l     �E���E  � W Q library window, and let's you choose one of them for further processing. Returns   � ��� �   l i b r a r y   w i n d o w ,   a n d   l e t ' s   y o u   c h o o s e   o n e   o f   t h e m   f o r   f u r t h e r   p r o c e s s i n g .   R e t u r n s� ��� l     �D���D  � V P the chosen group name as a list, or `false` if the "Cancel" button was pressed.   � ��� �   t h e   c h o s e n   g r o u p   n a m e   a s   a   l i s t ,   o r   ` f a l s e `   i f   t h e   " C a n c e l "   b u t t o n   w a s   p r e s s e d .� ��� i   . 1��� I      �C�B�A�C "0 choosegroupname chooseGroupName�B  �A  � O     a��� O    `��� k    _�� ��� r    ��� n    ��� 1    �@
�@ 
pnam� 2    �?
�? 
BGrp� o      �>�> 0 
usergroups 
userGroups� ��� l   �=�<�;�=  �<  �;  � ��� r    ��� o    �:�: ,0 additionalinfoappend additionalInfoAppend� o      �9�9  0 additionalinfo additionalInfo� ��� Z    .���8�7� o     �6�6 20 replaceexistingkeywords replaceExistingKeywords� r   # *��� o   # (�5�5 .0 additionalinforeplace additionalInfoReplace� o      �4�4  0 additionalinfo additionalInfo�8  �7  � ��� r   / >��� b   / <��� b   / :��� b   / 8��� b   / 6��� o   / 4�3�3 0 helpmessage helpMessage� o   4 5�2�2  0 additionalinfo additionalInfo� 1   6 7�1
�1 
lnfd� 1   8 9�0
�0 
lnfd� m   : ;�� ���  S e l e c t   g r o u p :� o      �/�/ 0 
themessage 
theMessage� ��� l  ? ?�.�-�,�.  �-  �,  � ��� r   ? \��� I  ? Z�+��
�+ .gtqpchltns    @   @ ns  � o   ? @�*�* 0 
usergroups 
userGroups� �)��
�) 
appr� m   A B�� ��� , P l e a s e   c h o o s e   a   g r o u p &� �(��
�( 
prmp� o   C D�'�' 0 
themessage 
theMessage� �&��
�& 
inSL� J   E L�� ��%� o   E J�$�$ 0 	groupname 	groupName�%  � �#��
�# 
okbt� m   M N�� ���  R u n� �"��
�" 
cnbt� m   O P�� ���  C a n c e l� �!��
�! 
mlsl� m   S T� 
�  boovfals� ���
� 
empL�  � o      �� $0 chosengroupnames chosenGroupNames� ��� L   ] _�� o   ] ^�� $0 chosengroupnames chosenGroupNames�  � 4   ��
� 
BLiW� m    �� � m     ���                                                                                      @ alis    ^  Glacier                    ͨ(H+  �l�Bookends.app                                                   �nؘX�        ����  	                20190224    ͨ       ؘJ�    (�l��
FZ[E~E~
�� '} 'z � &  �Glacier:Users: msteffens: Dev: Projects: Keypoints: Projects: Bookends-Scripting-Support: Bookends+AppleScript: Bookends-ScriptableTest: 20190224: Bookends.app     B o o k e n d s . a p p    G l a c i e r  �Users/msteffens/Dev/Projects/Keypoints/Projects/Bookends-Scripting-Support/Bookends+AppleScript/Bookends-ScriptableTest/20190224/Bookends.app   /    ��  � ��� l     ����  �  �  � ��� l     � �    ` Z Displays the given message & additional info in a dialog inside the application specified    � �   D i s p l a y s   t h e   g i v e n   m e s s a g e   &   a d d i t i o n a l   i n f o   i n   a   d i a l o g   i n s i d e   t h e   a p p l i c a t i o n   s p e c i f i e d�  l     ��   a [ by the given bundle identifier. If there's no application with that bundle identifier, the    � �   b y   t h e   g i v e n   b u n d l e   i d e n t i f i e r .   I f   t h e r e ' s   n o   a p p l i c a t i o n   w i t h   t h a t   b u n d l e   i d e n t i f i e r ,   t h e 	 l     �
�  
 @ : message will be displayed within the current application.    � t   m e s s a g e   w i l l   b e   d i s p l a y e d   w i t h i n   t h e   c u r r e n t   a p p l i c a t i o n .	  i   2 5 I      ���  0 displaymessage displayMessage  o      �� 0 thetitle theTitle  o      �� 0 
themessage 
theMessage  o      ��  0 additionalinfo additionalInfo  o      �� 0 
buttonname 
buttonName  o      �� 0 appbundleid appBundleID � o      �
�
 0 iconid iconID�  �   k     �  Z     !�	�  G     "#" =    $%$ o     �� 0 thetitle theTitle% m    �
� 
msng# =   	&'& o    �� 0 thetitle theTitle' m    (( �))  ! r    *+* m    ,, �-- " A b o u t   t h i s   s c r i p t+ o      �� 0 thetitle theTitle�	  �   ./. Z   #01��0 =   232 o    �� 0 
themessage 
theMessage3 m    � 
�  
msng1 r    454 m    66 �77  5 o      ���� 0 
themessage 
theMessage�  �  / 898 Z  $ 9:;����: G   $ /<=< =  $ '>?> o   $ %���� 0 
buttonname 
buttonName? m   % &��
�� 
msng= =  * -@A@ o   * +���� 0 
buttonname 
buttonNameA m   + ,BB �CC  ; r   2 5DED m   2 3FF �GG  O KE o      ���� 0 
buttonname 
buttonName��  ��  9 HIH l  : LJKLJ Z  : LMN����M H   : BOO E  : APQP J   : ?RR STS m   : ;����  T UVU m   ; <���� V W��W m   < =���� ��  Q o   ? @���� 0 iconid iconIDN r   E HXYX m   E F���� Y o      ���� 0 iconid iconID��  ��  K #  0: stop, 1: note, 2: caution   L �ZZ :   0 :   s t o p ,   1 :   n o t e ,   2 :   c a u t i o nI [\[ l  M M��������  ��  ��  \ ]^] Z   M z_`����_ F   M Xaba >  M Pcdc o   M N����  0 additionalinfo additionalInfod m   N O��
�� 
msngb >  S Vefe o   S T����  0 additionalinfo additionalInfof m   T Ugg �hh  ` k   [ vii jkj r   [ ^lml m   [ \nn �oo  m o      ���� 0 	separator  k pqp Z   _ nrs����r >  _ btut o   _ `���� 0 
themessage 
theMessageu m   ` avv �ww  s r   e jxyx b   e hz{z 1   e f��
�� 
lnfd{ 1   f g��
�� 
lnfdy o      ���� 0 	separator  ��  ��  q |��| r   o v}~} b   o t� b   o r��� o   o p���� 0 
themessage 
theMessage� o   p q���� 0 	separator  � o   r s����  0 additionalinfo additionalInfo~ o      ���� 0 
themessage 
theMessage��  ��  ��  ^ ��� l  { {��������  ��  ��  � ���� Q   { ����� O   ~ ���� I  � �����
�� .sysodlogaskr        TEXT� o   � ����� 0 
themessage 
theMessage� ����
�� 
appr� o   � ����� 0 thetitle theTitle� ����
�� 
disp� o   � ����� 0 iconid iconID� ����
�� 
btns� J   � ��� ���� o   � ����� 0 
buttonname 
buttonName��  � �����
�� 
dflt� o   � ����� 0 
buttonname 
buttonName��  � 5   ~ ������
�� 
capp� o   � ����� 0 appbundleid appBundleID
�� kfrmID  � R      ������
�� .ascrerr ****      � ****��  ��  � O   � ���� I  � �����
�� .sysodlogaskr        TEXT� o   � ����� 0 
themessage 
theMessage� ����
�� 
appr� o   � ����� 0 thetitle theTitle� ����
�� 
disp� o   � ����� 0 iconid iconID� ����
�� 
btns� J   � ��� ���� o   � ����� 0 
buttonname 
buttonName��  � �����
�� 
dflt� o   � ����� 0 
buttonname 
buttonName��  � m   � ���
�� misccura��   ��� l     ��������  ��  ��  � ��� l     ������  � T N For the frontmost library window opened in Bookends, returns all publications   � ��� �   F o r   t h e   f r o n t m o s t   l i b r a r y   w i n d o w   o p e n e d   i n   B o o k e n d s ,   r e t u r n s   a l l   p u b l i c a t i o n s� ��� l     ������  � T N contained in the group of the given name. Returns an empty list if there's no   � ��� �   c o n t a i n e d   i n   t h e   g r o u p   o f   t h e   g i v e n   n a m e .   R e t u r n s   a n   e m p t y   l i s t   i f   t h e r e ' s   n o� ��� l     ������  � A ; group with that name, or if the group has no publications.   � ��� v   g r o u p   w i t h   t h a t   n a m e ,   o r   i f   t h e   g r o u p   h a s   n o   p u b l i c a t i o n s .� ��� i   6 9��� I      ������� 80 publicationsforgroupbyname publicationsForGroupByName� ���� o      ���� 0 
agroupname 
aGroupName��  ��  � k     Q�� ��� Z    ������� G     ��� =    ��� o     ���� 0 
agroupname 
aGroupName� m    ��
�� 
msng� =   	��� o    ���� 0 
agroupname 
aGroupName� m    �� ���  � L    �� J    ����  ��  ��  � ��� l   ��������  ��  ��  � ���� O    Q��� O    P��� k   ! O�� ��� r   ! %��� J   ! #����  � o      ���� 0 	grouppubs 	groupPubs� ��� r   & 4��� 6  & 2��� 2   & )��
�� 
BGrp� =  * 1��� 1   + -��
�� 
pnam� o   . 0���� 0 
agroupname 
aGroupName� o      ����  0 matchinggroups matchingGroups� ��� Z   5 L������� >  5 9��� o   5 6����  0 matchinggroups matchingGroups� J   6 8����  � k   < H�� ��� r   < B��� n   < @��� 4  = @���
�� 
cobj� m   > ?���� � o   < =����  0 matchinggroups matchingGroups� o      ���� 0 agroup aGroup� ���� r   C H��� n   C F��� 2  D F��
�� 
BPub� o   C D���� 0 agroup aGroup� o      ���� 0 	grouppubs 	groupPubs��  ��  ��  � ���� L   M O�� o   M N���� 0 	grouppubs 	groupPubs��  � 4   ���
�� 
BLiW� m    ���� � m    ���                                                                                      @ alis    ^  Glacier                    ͨ(H+  �l�Bookends.app                                                   �nؘX�        ����  	                20190224    ͨ       ؘJ�    (�l��
FZ[E~E~
�� '} 'z � &  �Glacier:Users: msteffens: Dev: Projects: Keypoints: Projects: Bookends-Scripting-Support: Bookends+AppleScript: Bookends-ScriptableTest: 20190224: Bookends.app     B o o k e n d s . a p p    G l a c i e r  �Users/msteffens/Dev/Projects/Keypoints/Projects/Bookends-Scripting-Support/Bookends+AppleScript/Bookends-ScriptableTest/20190224/Bookends.app   /    ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � S M For the given Bookends publication, returns the name of its first attachment   � ��� �   F o r   t h e   g i v e n   B o o k e n d s   p u b l i c a t i o n ,   r e t u r n s   t h e   n a m e   o f   i t s   f i r s t   a t t a c h m e n t� ��� l     ������  � ; 5 (if there's any), otherwise returns an empty string.   � ��� j   ( i f   t h e r e ' s   a n y ) ,   o t h e r w i s e   r e t u r n s   a n   e m p t y   s t r i n g .�    i   : = I      ������ H0 "firstattachmentnamefrompublication "firstAttachmentNameFromPublication �� o      ���� 0 apublication aPublication��  ��   k     5  Z    	
����	 =     o     ���� 0 apublication aPublication m    ��
�� 
msng
 L     m     �  ��  ��    l   �������  ��  �   �~ O    5 k    4  r     n     2   �}
�} 
BAtt o    �|�| 0 apublication aPublication o      �{�{  0 pubattachments pubAttachments  Z   $�z�y =    !  o    �x�x  0 pubattachments pubAttachments! J    �w�w   L     "" m    ## �$$  �z  �y   %&% l  % %�v�u�t�v  �u  �t  & '(' r   % +)*) n   % )+,+ 4  & )�s-
�s 
cobj- m   ' (�r�r , o   % &�q�q  0 pubattachments pubAttachments* o      �p�p 0 anattachment anAttachment( ./. r   , 1010 n   , /232 1   - /�o
�o 
pnam3 o   , -�n�n 0 anattachment anAttachment1 o      �m�m  0 attachmentname attachmentName/ 4�l4 L   2 455 o   2 3�k�k  0 attachmentname attachmentName�l   m    66�                                                                                      @ alis    ^  Glacier                    ͨ(H+  �l�Bookends.app                                                   �nؘX�        ����  	                20190224    ͨ       ؘJ�    (�l��
FZ[E~E~
�� '} 'z � &  �Glacier:Users: msteffens: Dev: Projects: Keypoints: Projects: Bookends-Scripting-Support: Bookends+AppleScript: Bookends-ScriptableTest: 20190224: Bookends.app     B o o k e n d s . a p p    G l a c i e r  �Users/msteffens/Dev/Projects/Keypoints/Projects/Bookends-Scripting-Support/Bookends+AppleScript/Bookends-ScriptableTest/20190224/Bookends.app   /    ��  �~   787 l     �j�i�h�j  �i  �h  8 9:9 l     �g;<�g  ; O I Sets the "Keywords" field of the given Bookends publication to the given   < �== �   S e t s   t h e   " K e y w o r d s "   f i e l d   o f   t h e   g i v e n   B o o k e n d s   p u b l i c a t i o n   t o   t h e   g i v e n: >?> l     �f@A�f  @ P J list of keywords. Returns true if the keywords could be set successfully,   A �BB �   l i s t   o f   k e y w o r d s .   R e t u r n s   t r u e   i f   t h e   k e y w o r d s   c o u l d   b e   s e t   s u c c e s s f u l l y ,? CDC l     �eEF�e  E   otherwise returns false.   F �GG 2   o t h e r w i s e   r e t u r n s   f a l s e .D HIH i   > AJKJ I      �dL�c�d 60 setkeywordsforpublication setKeywordsForPublicationL MNM o      �b�b 0 apublication aPublicationN O�aO o      �`�` 0 keywordslist keywordsList�a  �c  K k     _PP QRQ Z    ST�_�^S =    UVU o     �]�] 0 apublication aPublicationV m    �\
�\ 
msngT L    WW m    �[
�[ boovfals�_  �^  R XYX Z   "Z[�Z�YZ G    \]\ =   ^_^ o    �X�X 0 keywordslist keywordsList_ m    �W
�W 
msng] =   `a` o    �V�V 0 keywordslist keywordsLista J    �U�U  [ L    bb m    �T
�T boovfals�Z  �Y  Y cdc l  # #�S�R�Q�S  �R  �Q  d efe r   # ,ghg n  # *iji I   $ *�Pk�O�P  0 mergetextitems mergeTextItemsk lml o   $ %�N�N 0 keywordslist keywordsListm n�Mn 1   % &�L
�L 
lnfd�M  �O  j  f   # $h o      �K�K  0 keywordsstring keywordsStringf opo O   - \qrq k   1 [ss tut Z   1 Uvw�J�Iv l  1 7x�H�Gx H   1 7yy o   1 6�F�F 20 replaceexistingkeywords replaceExistingKeywords�H  �G  w k   : Qzz {|{ r   : ?}~} n   : =� 1   ; =�E
�E 
bKeW� o   : ;�D�D 0 apublication aPublication~ o      �C�C $0 existingkeywords existingKeywords| ��B� Z   @ Q���A�@� >  @ C��� o   @ A�?�? $0 existingkeywords existingKeywords� m   A B�� ���  � r   F M��� b   F K��� b   F I��� o   F G�>�> $0 existingkeywords existingKeywords� 1   G H�=
�= 
lnfd� o   I J�<�<  0 keywordsstring keywordsString� o      �;�;  0 keywordsstring keywordsString�A  �@  �B  �J  �I  u ��:� r   V [��� o   V W�9�9  0 keywordsstring keywordsString� n      ��� 1   X Z�8
�8 
bKeW� o   W X�7�7 0 apublication aPublication�:  r m   - .���                                                                                      @ alis    ^  Glacier                    ͨ(H+  �l�Bookends.app                                                   �nؘX�        ����  	                20190224    ͨ       ؘJ�    (�l��
FZ[E~E~
�� '} 'z � &  �Glacier:Users: msteffens: Dev: Projects: Keypoints: Projects: Bookends-Scripting-Support: Bookends+AppleScript: Bookends-ScriptableTest: 20190224: Bookends.app     B o o k e n d s . a p p    G l a c i e r  �Users/msteffens/Dev/Projects/Keypoints/Projects/Bookends-Scripting-Support/Bookends+AppleScript/Bookends-ScriptableTest/20190224/Bookends.app   /    ��  p ��6� L   ] _�� m   ] ^�5
�5 boovtrue�6  I ��� l     �4�3�2�4  �3  �2  � ��� l     �1���1  � Q K Extracts the first substring matched by the Regex given in `searchPattern`   � ��� �   E x t r a c t s   t h e   f i r s t   s u b s t r i n g   m a t c h e d   b y   t h e   R e g e x   g i v e n   i n   ` s e a r c h P a t t e r n `� ��� l     �0���0  � Q K from `aString`. If `splitDelim` is empty, returns the matched substring as   � ��� �   f r o m   ` a S t r i n g ` .   I f   ` s p l i t D e l i m `   i s   e m p t y ,   r e t u r n s   t h e   m a t c h e d   s u b s t r i n g   a s� ��� l     �/���/  � R L a list. If `splitDelim` is non-empty, the matched substring will be further   � ��� �   a   l i s t .   I f   ` s p l i t D e l i m `   i s   n o n - e m p t y ,   t h e   m a t c h e d   s u b s t r i n g   w i l l   b e   f u r t h e r� ��� l     �.���.  � Q K split by this delimiter, and the resulting list of items will be returned.   � ��� �   s p l i t   b y   t h i s   d e l i m i t e r ,   a n d   t h e   r e s u l t i n g   l i s t   o f   i t e m s   w i l l   b e   r e t u r n e d .� ��� l     �-���-  � 4 . Returns an empty list if nothing was matched.   � ��� \   R e t u r n s   a n   e m p t y   l i s t   i f   n o t h i n g   w a s   m a t c h e d .� ��� i   B E��� I      �,��+�, ,0 substringsfromstring substringsFromString� ��� o      �*�* 0 astring aString� ��� o      �)�) 0 searchpattern searchPattern� ��(� o      �'�' 0 
splitdelim 
splitDelim�(  �+  � k     P�� ��� Z    ���&�%� G     ��� =    ��� o     �$�$ 0 astring aString� m    �#
�# 
msng� =   	��� o    �"�" 0 astring aString� m    �� ���  � L    �� J    �!�!  �&  �%  � ��� Z   +��� �� G    !��� =   ��� o    �� 0 searchpattern searchPattern� m    �
� 
msng� =   ��� o    �� 0 searchpattern searchPattern� m    �� ���  � L   $ '�� J   $ &��  �   �  � ��� l  , ,����  �  �  � ��� r   , 5��� n  , 3��� I   - 3���� 0 
regexmatch 
regexMatch� ��� o   - .�� 0 astring aString� ��� o   . /�� 0 searchpattern searchPattern�  �  �  f   , -� o      �� 0 	substring  � ��� Z   6 L����� >  6 9��� o   6 7�� 0 	substring  � m   7 8�� ���  � k   < H�� ��� r   < E��� n  < C��� I   = C���� 0 	splittext 	splitText� ��� o   = >�� 0 	substring  � ��� o   > ?�
�
 0 
splitdelim 
splitDelim�  �  �  f   < =� o      �	�	 0 
substrings  � ��� L   F H�� o   F G�� 0 
substrings  �  �  �  � ��� L   M P�� J   M O��  �  � ��� l     ����  �  �  � ��� l     ����  � L F Merges the given list of text items using the given separator string.   � ��� �   M e r g e s   t h e   g i v e n   l i s t   o f   t e x t   i t e m s   u s i n g   t h e   g i v e n   s e p a r a t o r   s t r i n g .�    i   F I I      � ���   0 mergetextitems mergeTextItems  o      ���� 0 textitemlist textItemList �� o      ���� 0 
aseparator 
aSeparator��  ��   k       	
	 P     �� k      r    
 n     1    ��
�� 
txdl 1    ��
�� 
ascr o      ���� 0 prevtids prevTIDs  r     o    ���� 0 
aseparator 
aSeparator n       1    ��
�� 
txdl 1    ��
�� 
ascr  r     c     o    ���� 0 textitemlist textItemList m    ��
�� 
ctxt o      ���� 0 
mergedtext 
mergedText  ��  r    !"! o    ���� 0 prevtids prevTIDs" n      #$# 1    ��
�� 
txdl$ 1    ��
�� 
ascr��   ����
�� conscase��  ��  
 %��% L     && o    ���� 0 
mergedtext 
mergedText��   '(' l     ��������  ��  ��  ( )*) l     ��+,��  + [ U ------------------------------------------------------------------------------------   , �-- �   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -* ./. l     ��������  ��  ��  / 010 l     ��23��  2 > 8 NOTE: the below handlers are written in AppleScriptObjC   3 �44 p   N O T E :   t h e   b e l o w   h a n d l e r s   a r e   w r i t t e n   i n   A p p l e S c r i p t O b j C1 565 l     ��78��  7 N H see https://latenightsw.com/adding-applescriptobjc-to-existing-scripts/   8 �99 �   s e e   h t t p s : / / l a t e n i g h t s w . c o m / a d d i n g - a p p l e s c r i p t o b j c - t o - e x i s t i n g - s c r i p t s /6 :;: l     <=>< x   J [��?����  ? 4   L T��@
�� 
frmk@ m   P SAA �BB  F o u n d a t i o n��  = 0 * required for the AppleScriptObjC handlers   > �CC T   r e q u i r e d   f o r   t h e   A p p l e S c r i p t O b j C   h a n d l e r s; DED l     ��������  ��  ��  E FGF l     ��HI��  H F @ NOTE: this works around an AppleScriptObjC bug in macOS 10.13.0   I �JJ �   N O T E :   t h i s   w o r k s   a r o u n d   a n   A p p l e S c r i p t O b j C   b u g   i n   m a c O S   1 0 . 1 3 . 0G KLK l     ��MN��  M C = see http://latenightsw.com/high-sierra-applescriptobjc-bugs/   N �OO z   s e e   h t t p : / / l a t e n i g h t s w . c o m / h i g h - s i e r r a - a p p l e s c r i p t o b j c - b u g s /L PQP j   [ f��R�� 0 
nsnotfound 
NSNotFoundR N   [ cSS [   [ bTUT m   [ ^VV C�������U m   ^ a�����Q WXW l     ��������  ��  ��  X YZY l     ��[\��  [ O I Searches the given input string using the given search pattern (which is   \ �]] �   S e a r c h e s   t h e   g i v e n   i n p u t   s t r i n g   u s i n g   t h e   g i v e n   s e a r c h   p a t t e r n   ( w h i c h   i sZ ^_^ l     ��`a��  ` K E treated as regular expression). Returns the substring matched by the   a �bb �   t r e a t e d   a s   r e g u l a r   e x p r e s s i o n ) .   R e t u r n s   t h e   s u b s t r i n g   m a t c h e d   b y   t h e_ cdc l     ��ef��  e O I entire search pattern, or an empty string (in case nothing was matched).   f �gg �   e n t i r e   s e a r c h   p a t t e r n ,   o r   a n   e m p t y   s t r i n g   ( i n   c a s e   n o t h i n g   w a s   m a t c h e d ) .d hih l     ��jk��  j N H @param someText The input string on which the search shall be performed   k �ll �   @ p a r a m   s o m e T e x t   T h e   i n p u t   s t r i n g   o n   w h i c h   t h e   s e a r c h   s h a l l   b e   p e r f o r m e di mnm l     ��op��  o U O @param searchPattern The search string as an ICU-compatible regular expression   p �qq �   @ p a r a m   s e a r c h P a t t e r n   T h e   s e a r c h   s t r i n g   a s   a n   I C U - c o m p a t i b l e   r e g u l a r   e x p r e s s i o nn rsr i   g jtut I      ��v���� 0 
regexmatch 
regexMatchv wxw o      ���� 0 sometext someTextx y��y o      ���� 0 searchpattern searchPattern��  ��  u k     Pzz {|{ Z    }~����} =    � o     ���� 0 sometext someText� m    ��
�� 
msng~ L    �� m    �� ���  ��  ��  | ��� Z   ������� =   ��� o    ���� 0 searchpattern searchPattern� m    ��
�� 
msng� L    �� m    �� ���  ��  ��  � ��� l   ��������  ��  ��  � ��� r    $��� n   "��� I    "������� &0 stringwithstring_ stringWithString_� ���� o    ���� 0 sometext someText��  ��  � n   ��� o    ���� 0 nsstring NSString� m    ��
�� misccura� o      ���� 0 	thestring 	theString� ��� r   % 0��� n  % .��� I   & .������� 00 rangeofstring_options_ rangeOfString_options_� ��� o   & '���� 0 searchpattern searchPattern� ���� l  ' *������ n  ' *��� o   ( *���� 60 nsregularexpressionsearch NSRegularExpressionSearch� m   ' (��
�� misccura��  ��  ��  ��  � o   % &���� 0 	thestring 	theString� o      ���� 0 therange theRange� ��� Z   1 K������ =   1 :��� n   1 4��� o   2 4���� 0 location  � o   1 2���� 0 therange theRange� o   4 9���� 0 
nsnotfound 
NSNotFound� r   = @��� m   = >�� ���  � o      ���� 0 foundstring foundString��  � r   C K��� n  C I��� I   D I������� *0 substringwithrange_ substringWithRange_� ���� o   D E���� 0 therange theRange��  ��  � o   C D���� 0 	thestring 	theString� o      ���� 0 foundstring foundString� ���� L   L P�� c   L O��� o   L M���� 0 foundstring foundString� m   M N��
�� 
ctxt��  s ��� l     ��������  ��  ��  � ��� l     ������  � R L Splits the given input string on the provided delimiter string. Returns the   � ��� �   S p l i t s   t h e   g i v e n   i n p u t   s t r i n g   o n   t h e   p r o v i d e d   d e l i m i t e r   s t r i n g .   R e t u r n s   t h e� ��� l     ������  � Z T input string as list in case the delimiter string wasn't found in the input string.   � ��� �   i n p u t   s t r i n g   a s   l i s t   i n   c a s e   t h e   d e l i m i t e r   s t r i n g   w a s n ' t   f o u n d   i n   t h e   i n p u t   s t r i n g .� ��� l     ������  � L F @param someText The input string which shall be split into substrings   � ��� �   @ p a r a m   s o m e T e x t   T h e   i n p u t   s t r i n g   w h i c h   s h a l l   b e   s p l i t   i n t o   s u b s t r i n g s� ��� l     ������  � L F @param splitDelim The delimiter string used to split the input string   � ��� �   @ p a r a m   s p l i t D e l i m   T h e   d e l i m i t e r   s t r i n g   u s e d   t o   s p l i t   t h e   i n p u t   s t r i n g� ��� i   k n��� I      ������� 0 	splittext 	splitText� ��� o      ���� 0 sometext someText� ���� o      ���� 0 
splitdelim 
splitDelim��  ��  � k     >�� ��� Z    ������� G     ��� =    ��� o     ���� 0 sometext someText� m    ��
�� 
msng� =   	��� o    ���� 0 sometext someText� m    �� ���  � L    �� c    ��� m    �� ���  � m    ��
�� 
list��  ��  � ��� Z   %������� =   ��� o    ���� 0 
splitdelim 
splitDelim� m    ��
�� 
msng� L    !�� c     ��� o    ���� 0 sometext someText� m    ��
�� 
list��  ��  � ��� l  & &��������  ��  ��  � ��� r   & 0��� n  & .��� I   ) .������� &0 stringwithstring_ stringWithString_� ���� o   ) *���� 0 sometext someText��  ��  � n  & )   o   ' )���� 0 nsstring NSString m   & '�
� misccura� o      �~�~ 0 	thestring 	theString�  r   1 9 n  1 7 I   2 7�}�|�} <0 componentsseparatedbystring_ componentsSeparatedByString_ 	�{	 o   2 3�z�z 0 
splitdelim 
splitDelim�{  �|   o   1 2�y�y 0 	thestring 	theString o      �x�x 0 thearray theArray 
�w
 L   : > c   : = o   : ;�v�v 0 thearray theArray m   ; <�u
�u 
list�w  � �t l     �s�r�q�s  �r  �q  �t       �p � � ��o � � ��p   �n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�n 0 	groupname 	groupName�m  0 substringregex substringRegex�l 0 	delimiter  �k 20 replaceexistingkeywords replaceExistingKeywords�j 0 helpmessage helpMessage�i ,0 additionalinfoappend additionalInfoAppend�h .0 additionalinforeplace additionalInfoReplace
�g 
pimr
�f .aevtoappnull  �   � ****�e "0 choosegroupname chooseGroupName�d  0 displaymessage displayMessage�c 80 publicationsforgroupbyname publicationsForGroupByName�b H0 "firstattachmentnamefrompublication "firstAttachmentNameFromPublication�a 60 setkeywordsforpublication setKeywordsForPublication�` ,0 substringsfromstring substringsFromString�_  0 mergetextitems mergeTextItems�^ 0 
nsnotfound 
NSNotFound�] 0 
regexmatch 
regexMatch�\ 0 	splittext 	splitText
�o boovfals �[�[    �Z�Y
�Z 
vers�Y   �X �W
�X 
cobj  !!   �V
�V 
osax�W   �U"�T
�U 
cobj" ##   �SA
�S 
frmk�T   �R�Q�P$%�O
�R .aevtoappnull  �   � ****�Q  �P  $ �N�N 0 apub aPub% �M�L�K�J�I�H�GGI�FO�EX`d�D�C�B�A�@�?�>�=�<�;�:�M "0 choosegroupname chooseGroupName�L $0 chosengroupnames chosenGroupNames
�K 
errn�J��
�I 
cobj�H 80 publicationsforgroupbyname publicationsForGroupByName�G 0 	grouppubs 	groupPubs�F 0 
themessage 
theMessage�E  0 additionalinfo additionalInfo�D �C  0 displaymessage displayMessage
�B .aevtoappnull  �   � ****
�A 
kocl
�@ .corecnte****       ****�? H0 "firstattachmentnamefrompublication "firstAttachmentNameFromPublication�>  0 attachmentname attachmentName�= ,0 substringsfromstring substringsFromString�< 0 keywordslist keywordsList�; 60 setkeywordsforpublication setKeywordsForPublication�: 0 success  �O �)j+  E�O�f  )��lhY hO��k/Ec   O)b   k+ E�O�jv  &�b   %�%E�O�E�O)�����l�+ O*j Y hO `�[a �l kh  )�k+ E` O_ a  6)_ b  b  m+ E` O_ jv )�_ l+ E` Y hY h[OY�� �9��8�7&'�6�9 "0 choosegroupname chooseGroupName�8  �7  & �5�4�3�2�5 0 
usergroups 
userGroups�4  0 additionalinfo additionalInfo�3 0 
themessage 
theMessage�2 $0 chosengroupnames chosenGroupNames' ��1�0�/�.��-��,�+�*��)��(�'�&�%
�1 
BLiW
�0 
BGrp
�/ 
pnam
�. 
lnfd
�- 
appr
�, 
prmp
�+ 
inSL
�* 
okbt
�) 
cnbt
�( 
mlsl
�' 
empL�& 
�% .gtqpchltns    @   @ ns  �6 b� ^*�k/ V*�-�,E�Ob  E�Ob   b  E�Y hOb  �%�%�%�%E�O�����b   kv�����f�fa  E�O�UU �$�#�"()�!�$  0 displaymessage displayMessage�# � *�  *  ������� 0 thetitle theTitle� 0 
themessage 
theMessage�  0 additionalinfo additionalInfo� 0 
buttonname 
buttonName� 0 appbundleid appBundleID� 0 iconid iconID�"  ( �������� 0 thetitle theTitle� 0 
themessage 
theMessage�  0 additionalinfo additionalInfo� 0 
buttonname 
buttonName� 0 appbundleid appBundleID� 0 iconid iconID� 0 	separator  ) �(�,6BFgnv�������
�	����
� 
msng
� 
bool
� 
lnfd
� 
capp
� kfrmID  
� 
appr
� 
disp
� 
btns
�
 
dflt�	 
� .sysodlogaskr        TEXT�  �  
� misccura�! ��� 
 �� �& �E�Y hO��  �E�Y hO�� 
 �� �& �E�Y hOjklmv� kE�Y hO��	 ���&  �E�O�� 
��%E�Y hO��%�%E�Y hO !*��0 �����kva �a  UW !X  a  �����kva �a  U ����+,�� 80 publicationsforgroupbyname publicationsForGroupByName� � -�  -  ���� 0 
agroupname 
aGroupName�  + ���������� 0 
agroupname 
aGroupName�� 0 	grouppubs 	groupPubs��  0 matchinggroups matchingGroups�� 0 agroup aGroup, 
����������.������
�� 
msng
�� 
bool
�� 
BLiW
�� 
BGrp.  
�� 
pnam
�� 
cobj
�� 
BPub� R�� 
 �� �& jvY hO� 8*�k/ 0jvE�O*�-�[�,\Z�81E�O�jv ��k/E�O��-E�Y hO�UU ������/0���� H0 "firstattachmentnamefrompublication "firstAttachmentNameFromPublication�� ��1�� 1  ���� 0 apublication aPublication��  / ���������� 0 apublication aPublication��  0 pubattachments pubAttachments�� 0 anattachment anAttachment��  0 attachmentname attachmentName0 ��6��#����
�� 
msng
�� 
BAtt
�� 
cobj
�� 
pnam�� 6��  �Y hO� %��-E�O�jv  �Y hO��k/E�O��,E�O�U ��K����23���� 60 setkeywordsforpublication setKeywordsForPublication�� ��4�� 4  ������ 0 apublication aPublication�� 0 keywordslist keywordsList��  2 ���������� 0 apublication aPublication�� 0 keywordslist keywordsList��  0 keywordsstring keywordsString�� $0 existingkeywords existingKeywords3 ������������
�� 
msng
�� 
bool
�� 
lnfd��  0 mergetextitems mergeTextItems
�� 
bKeW�� `��  fY hO�� 
 �jv �& fY hO)��l+ E�O� ,b   ��,E�O�� ��%�%E�Y hY hO���,FUOe �������56���� ,0 substringsfromstring substringsFromString�� ��7�� 7  �������� 0 astring aString�� 0 searchpattern searchPattern�� 0 
splitdelim 
splitDelim��  5 ������������ 0 astring aString�� 0 searchpattern searchPattern�� 0 
splitdelim 
splitDelim�� 0 	substring  �� 0 
substrings  6 �����������
�� 
msng
�� 
bool�� 0 
regexmatch 
regexMatch�� 0 	splittext 	splitText�� Q�� 
 �� �& jvY hO�� 
 �� �& jvY hO)��l+ E�O�� )��l+ E�O�Y hOjv ������89����  0 mergetextitems mergeTextItems�� ��:�� :  ������ 0 textitemlist textItemList�� 0 
aseparator 
aSeparator��  8 ���������� 0 textitemlist textItemList�� 0 
aseparator 
aSeparator�� 0 prevtids prevTIDs�� 0 
mergedtext 
mergedText9 ������
�� 
ascr
�� 
txdl
�� 
ctxt�� !�g ��,E�O���,FO��&E�O���,FVO� C�       ��u����;<���� 0 
regexmatch 
regexMatch�� ��=�� =  ������ 0 sometext someText�� 0 searchpattern searchPattern��  ; ������������ 0 sometext someText�� 0 searchpattern searchPattern�� 0 	thestring 	theString�� 0 therange theRange�� 0 foundstring foundString< ���������������������
�� 
msng
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 60 nsregularexpressionsearch NSRegularExpressionSearch�� 00 rangeofstring_options_ rangeOfString_options_�� 0 location  �� *0 substringwithrange_ substringWithRange_
�� 
ctxt�� Q��  �Y hO��  �Y hO��,�k+ E�O����,l+ E�O��,b    �E�Y 
��k+ 
E�O��& �������>?���� 0 	splittext 	splitText�� ��@�� @  ������ 0 sometext someText�� 0 
splitdelim 
splitDelim��  > ���������� 0 sometext someText�� 0 
splitdelim 
splitDelim�� 0 	thestring 	theString�� 0 thearray theArray? 	����������������
�� 
msng
�� 
bool
�� 
list
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� <0 componentsseparatedbystring_ componentsSeparatedByString_�� ?�� 
 �� �& 	��&Y hO��  	��&Y hO��,�k+ E�O��k+ E�O��&ascr  ��ޭ