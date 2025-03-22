<?php
$contacts = [];

function addcontact(array &$contacts , string $name , string $email , string $phone){
     $contacts[] = ['name'=> $name, 'email'=> $email, 'phone'=> $phone];

}

function displayContacts(array $contacts):void
{
    if(empty($contacts)){
        echo " No Contacts Available. \n";
    }else{
        foreach($contacts as $contact){
            echo "Name : {$contact['name']}, 
                  Email : {$contact['email']},
                  Phone : {$contact['phone']}\n,

                  ";

        }
    }
}


while(true){
    echo "\nContact managemenr App: \n";
    echo "1. Add Contact\n2. View Contact\n3. Exit";
    $choice = ( int)readline("Choice an option: ");

    if($choice  ===1){
        $name = readline("Enter Your name: ");
        $email = readline("Enter your email: ");
        $phone = readline("Enter Your phone: ");

        addcontact( $contacts , $name, $email, $phone);

        echo "$name added to contacts.\n";
        echo "$email added to contacts.\n";
        echo "$phone added to contacts.\n";
    }elseif($choice ===2){
        displayContacts($contacts);

    }elseif($choice ===3){
        echo "Exiting ...\n";
        break;
    }else{
        echo "Invalid choice . Please try again . \n";
    }
}
?>