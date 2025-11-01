{ depot, ... }:

depot.tools.emacs-pkgs.buildEmacsPackage {
  pname = "vterm-mgt";
  version = "1.0.0";
  src = ./vterm-mgt.el;
  externalRequires =
    epkgs: with epkgs;
    [
      vterm
    ];
  internalRequires =
    (with depot.users.wpcarro.emacs.pkgs; [
      cycle
    ]);
  meta.ci.extraSteps.github = depot.tools.releases.filteredGitPush {
    filter = ":/users/wpcarro/emacs/pkgs/vterm-mgt";
    remote = "git@github.com:wpcarro/vterm-mgt.el.git";
    ref = "refs/heads/canon";
  };
}
