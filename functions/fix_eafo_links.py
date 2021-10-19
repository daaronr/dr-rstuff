#hard-coded crappy version for now

import re

#FILENAME = 'ch_fix_pete.md'
FILENAME = 'ch.md'

URL = 'https://forum.effectivealtruism.org/posts/nb6tQ5MRRpXydJQFq/ea-survey-2020-series-donation-data'

with open(FILENAME, 'r') as f:
    text = f.read()

    # Remove ".unnumbered"
    text = re.sub('\.unnumbered', '', text)
    text = re.sub('{}', '', text)

    # Create Rmarkdown-id -> EA-Forum-id conversion table
    link_conversions = {}
    for line in text.split('\n'):
        match = re.match('#+ (.+) {#(.+)}', line)
        if not match:
            continue
        section_name = match.group(1)
        section_link = match.group(2)
        section_id = re.sub('[^\w]', '_', section_name)
        link_conversions[section_link] = URL + '#' + section_id

    for link_from, link_to in link_conversions.items():
        # Apply link conversion
        text = re.sub('\(#'+link_from+'\)', '(#'+link_to+')', text)
        # Remove link indicators in headers
        text = re.sub('{#'+link_from+'}', '', text)

with open("ch_lf.md", 'w') as f:
    f.write(text)


