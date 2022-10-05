<!-- Entête => ./Views/templates/header.php -->
<!DOCTYPE html>
<html lang="fr-FR">
    <head>
        <meta charset="UTF-8">
        <title><?= esc($title); ?></title>
        <link href="/inc/style.css" type="text/css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <table>
                <tr>
                    <td><img src="/img/processor.png" alt="CPU"></td>
                    <td><h1><?= esc($title); ?></h1></td>
                </tr>
            </table>
        </header>
        <div class="page">
            <div class="contenu">
                <!-- ici sera inséré le contenu dynamique -->
