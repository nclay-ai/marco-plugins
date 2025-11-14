const fs = require('fs');
const path = require('path');

const localesDir = path.join(__dirname, 'locales');
const files = fs.readdirSync(localesDir)
    .filter(f => f.startsWith('obx-multitool.') && f.endsWith('.json'));

files.forEach(file => {
    const filePath = path.join(localesDir, file);

    // Read with BOM handling
    let content = fs.readFileSync(filePath, 'utf8');
    // Remove BOM if present
    if (content.charCodeAt(0) === 0xFEFF) {
        content = content.slice(1);
    }

    const data = JSON.parse(content);

    // Update metadata
    data.meta.avatar = '📖';
    data.meta.title = 'Salesforce Read-Only';
    data.meta.description = 'RESTRICTED: Read-only Salesforce data access. Query contacts, accounts, leads, opportunities. NO write operations. NO other platforms.';
    data.meta.tags = ['salesforce', 'read-only', 'query', 'crm', 'data-retrieval', 'sfdc'];

    // Write back (without BOM)
    fs.writeFileSync(filePath, JSON.stringify(data), 'utf8');
    console.log('Updated:', file);
});

console.log(`Done! Updated ${files.length} locale files.`);
