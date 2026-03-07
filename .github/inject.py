import os

content = open('index.html', encoding='utf-8').read()

replacements = {
    '__FIREBASE_API_KEY__':            os.getenv('FIREBASE_API_KEY', '').strip(),
    '__FIREBASE_AUTH_DOMAIN__':        os.getenv('FIREBASE_AUTH_DOMAIN', '').strip(),
    '__FIREBASE_PROJECT_ID__':         os.getenv('FIREBASE_PROJECT_ID', '').strip(),
    '__FIREBASE_STORAGE_BUCKET__':     os.getenv('FIREBASE_STORAGE_BUCKET', '').strip(),
    '__FIREBASE_MESSAGING_SENDER_ID__': os.getenv('FIREBASE_MESSAGING_SENDER_ID', '').strip(),
    '__FIREBASE_APP_ID__':             os.getenv('FIREBASE_APP_ID', '').strip(),
    '__SITE_URL__':                    os.getenv('SITE_URL', 'https://cagoooo.github.io/3D/').strip(),
}

for placeholder, value in replacements.items():
    content = content.replace(placeholder, value)

open('index.html', 'w', encoding='utf-8').write(content)
print('✅ Firebase 設定注入完成')
