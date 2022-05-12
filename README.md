# Form Registration Sample

The purpose of this single view app is to show how we can use Combine to update our views from the events generated by some texfields. In this case, we verify that the text within those textfilds follow some rules to be considered valid. This is got by creating a observable object which variables are set to listen all the modification from the textfield input event.

The verfied parameters are the following:
- User name length is equal or greater than 4
- Password lenghth is equal or greater than 8 and it contains a uppercase letter.
- Password and password confirmation are the same.
- All the enumerated rules above are true at the same time

<img src="mainScreen.png width="250">
                                    
<img src="mainScreenNotFilled.png width="250">
<img src="mainScreenFilled.png width="250">
