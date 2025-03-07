<?php
// Sample data: an array of users
$users = [
    [
        'id' => 1,
        'name' => 'John Doe',
        'email' => 'john.doe@example.com'
    ],
    [
        'id' => 2,
        'name' => 'Jane Doe',
        'email' => 'jane.doe@example.com'
    ],
    // Add more users as needed
];

// Get the sort column and order from the query parameters; default is sort by 'id' in ascending order.
$sortColumn = isset($_GET['sort']) ? $_GET['sort'] : 'id';
$order = isset($_GET['order']) ? $_GET['order'] : 'asc';

// Only allow sorting by these columns
$allowedColumns = ['id', 'name', 'email'];
if (!in_array($sortColumn, $allowedColumns)) {
    $sortColumn = 'id';
}

// Function to toggle sorting order
function toggleOrder($currentOrder) {
    return $currentOrder === 'asc' ? 'desc' : 'asc';
}

// Sort the users array using a custom comparison function
usort($users, function ($a, $b) use ($sortColumn, $order) {
    if ($a[$sortColumn] == $b[$sortColumn]) {
        return 0;
    }
    if ($order === 'asc') {
        return ($a[$sortColumn] < $b[$sortColumn]) ? -1 : 1;
    } else {
        return ($a[$sortColumn] > $b[$sortColumn]) ? -1 : 1;
    }
});
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Table</title>
    <style>
        table, th, td {
            border: 1px solid #333;
            border-collapse: collapse;
            padding: 8px;
        }
        th a {
            text-decoration: none;
            color: inherit;
        }
        th {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>User Information</h1>
    <table>
        <thead>
            <tr>
                <th>
                    <a href="?sort=id&order=<?php echo ($sortColumn === 'id' ? toggleOrder($order) : 'asc'); ?>">ID</a>
                </th>
                <th>
                    <a href="?sort=name&order=<?php echo ($sortColumn === 'name' ? toggleOrder($order) : 'asc'); ?>">Name</a>
                </th>
                <th>
                    <a href="?sort=email&order=<?php echo ($sortColumn === 'email' ? toggleOrder($order) : 'asc'); ?>">Email</a>
                </th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($users as $user): ?>
            <tr>
                <td><?php echo htmlspecialchars($user['id']); ?></td>
                <td><?php echo htmlspecialchars($user['name']); ?></td>
                <td><?php echo htmlspecialchars($user['email']); ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
