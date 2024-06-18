/*
* Curso de Engenharia de Software - UniEVANGÉLICA 
* Disciplina de Programação Web 
* Dev: Heustógio Silva Santos
* DATA: 18/06/2024
*/ 
<?php

interface IUserRepository {
    public function save(User $user);
    public function getAllUsers();
}

interface IEmailService {
    public function sendWelcomeEmail($email);
}

class User {
    private $id;
    private $name;
    private $email;
    private $password;

    public function __construct($id, $name, $email, $password) {
        $this->id = $id;
        $this->name = $name;
        $this->email = $email;
        $this->password = $password;
    }

    public function getId() {
        return $this->id;
    }

    public function getName() {
        return $this->name;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getPassword() {
        return $this->password;
    }
}

class UserRepository implements IUserRepository {
    public function save(User $user) {
        // Save user to database
        // DB::table('users')->insert(...);
    }

    public function getAllUsers() {
        // Get all users from database
        // return DB::table('users')->get();
    }
}

class EmailService implements IEmailService {
    public function sendWelcomeEmail($email) {
        // send welcome email
        // mail($email, "Welcome", "Thank you for registering!");
    }
}

class CSVExporter {
    public function exportToCSV(IUserRepository $userRepository) {
        $users = $userRepository->getAllUsers();
        $csv = "id,name,email\n";
        foreach ($users as $user) {
            $csv .= "{$user->getId()},{$user->getName()},{$user->getEmail()}\n";
        }
        file_put_contents('users.csv', $csv);
    }
}

// Usage
$user = new User(1, 'John Doe', 'John@example.com', 'secret');
$userRepository = new UserRepository();
$emailService = new EmailService();
$csvExporter = new CSVExporter();

$userRepository->save($user);
$emailService->sendWelcomeEmail($user->getEmail());
$csvExporter->exportToCSV($userRepository);

?>
