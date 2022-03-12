
# Table of Contents

1.  [Emacs 配置](#org498bde2)
    1.  [org-mode](#orge05ae0c)
        1.  [org-roam](#orgf134985)
    2.  [python](#org1183d64)
        1.  [Python layer](#org880f22f)
        2.  [pyenv 和 pyvenv 的使用](#orgf58b118)
    3.  [colors](#org76bf978)


<a id="org498bde2"></a>

# Emacs 配置


<a id="orge05ae0c"></a>

## org-mode


<a id="orgf134985"></a>

### org-roam

1.  网页抓取


<a id="org1183d64"></a>

## python


<a id="org880f22f"></a>

### Python layer

[Python layer (Created: 2022-02-22 Tue 16:44)](https://develop.spacemacs.org/layers/+lang/python/README.html)


<a id="orgf58b118"></a>

### pyenv 和 pyvenv 的使用

1.  pyenv

    用来对 Python 版本的控制

2.  pyvenv

    用来对 Python 虚拟环境的控制，应用在 major mode Inferior Python 中用来切换 python 版本。但是，需要先通过快捷键“SPC m v w”更换 Python 版本或虚拟环境；然后再通过快捷键“SPC m r”来重新启动 Python。


<a id="org76bf978"></a>

## colors

Nyan Cat 彩虹猫，用于显示文件进度。在 dotspacemacs-configuration-layers 里面新增所需 layer。

    (colors :variables
            colors-enable-nyan-cat-progress-bar t)

