<?php
// php/mixtral_proxy.php

$token = getenv('HF_TOKEN');

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'), true);
$prompt = $data['prompt'] ?? '';

// Crée un prompt simple et clair
$fullPrompt = "Question : $prompt\nRéponse :";

$ch = curl_init('https://api-inference.huggingface.co/models/mistralai/Mixtral-8x7B-Instruct-v0.1');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Authorization: Bearer $token",
    "Content-Type: application/json"
]);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode([
    'inputs' => "Question : $prompt\nRéponse :",
    'parameters' => [
        'return_full_text' => false
    ]
]));

$response = curl_exec($ch);
curl_close($ch);

echo $response;
