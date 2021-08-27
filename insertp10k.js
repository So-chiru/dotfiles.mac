const fs = require('fs')

const zshrcPath = require('os').homedir() + '/.zshrc'

const read = fs.readFileSync(zshrcPath).toString()

fs.writeFileSync(
  zshrcPath,
  `# sochiru powerlevel10k configuration, these lines should be on the top of .zshrc
if [[ -r "\${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh" ]]; then
source "\${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh"
fi\n
` +
    read.replace(
      /ZSH_THEME\=\"robbyrussell\"/g,
      `ZSH_THEME="powerlevel10k/powerlevel10k"`
    ) +
    `\n\n# sochiru powerlevel10k configuration, To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh\n
`
)
