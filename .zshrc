# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chadstrong/.zshrc'
ZSH_THEME="/home/chadstrong/.oh-my-zsh/custom/themes/dracula.zsh-theme"
plugins=(gcloud, git, helm, kubectl, zsh-autosuggestions, zsh-syntax-highlighting)
autoload -Uz compinit
compinit
alias h="history 0"
alias history="history 0"
alias tf="gcloud compute ssh --zone "us-central1-f" "chad_strong@ops-terra"  --project "appspace-devops" --tunnel-through-iap"
alias os="gcloud compute ssh --zone "us-central1-f" "chad_strong@ops-services-a"  --project "appspace-devops" --tunnel-through-iap"
alias k="kubectl"
alias ns1="gcloud compute ssh --zone "us-central1-f" "chad_strong@ns1" --project "appspace-dns" --tunnel-through-iap"
alias ns2="gcloud compute ssh --zone "us-central1-b" "chad_strong@ns2" --project "appspace-dns" --tunnel-through-iap"
alias rab1="gcloud compute ssh --zone "us-central1-f" "chad_strong@cloud-rabbit-na1" --project "appspace-cloud" --tunnel-through-iap"
alias rab2="gcloud compute ssh --zone "us-central1-f" "chad_strong@cloud-rabbit-na2" --project "appspace-cloud" --tunnel-through-iap"
alias rab3="gcloud compute ssh --zone "us-central1-f" "chad_strong@cloud-rabbit-na3" --project "appspace-cloud" --tunnel-through-iap"
alias rab4="gcloud compute ssh --zone "us-central1-b" "chad_strong@cloud-rabbit-na4" --project "appspace-cloud" --tunnel-through-iap"
alias rab5="gcloud compute ssh --zone "us-central1-b" "chad_strong@cloud-rabbit-na5" --project "appspace-cloud" --tunnel-through-iap"


# End of lines added by compinstall
source /home/chadstrong/.oh-my-zsh/custom/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use Autosuggestions
source /home/chadstrong/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Use syntax highlighting
source /home/chadstrong/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)

# Add custom widget to complete partial if cursor is at end of buffer
autosuggest_partial_wordwise () {   
if (( $CURSOR == $#BUFFER )); then
# if cursor is at end of buffer invoke forward-word widget
    zle forward-word
else
# if cursor is not at end of buffer invoke forward-char widget
    zle forward-char
fi
}
zle -N autosuggest_partial_wordwise 
bindkey "${terminfo[kcuf1]}" autosuggest_partial_wordwise

# Add autosuggest_partial_wordwise to IGNORE
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(autosuggest_partial_wordwise)

#add directory to PATH
export PATH="/home/chadstrong/.local/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#autocomplete AZ
autoload -U +X bashcompinit && bashcompinit
source /etc/bash_completion.d/azure-cli

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
