settings.tex = "xelatex";
usepackage("xeCJK");
texpreamble("\setCJKmainfont{AR PL UKai CN}");

size(100, 200);
real cnCharSize = 4;
real enCharSize = cnCharSize / 2;

currentpen = blue;
currentpen = currentpen + fontsize(cnCharSize);

struct RectWithBox{
    pair orig;
    real w;
    real h;
    string label;
    pair labelOrig;

    static RectWithBox RectWithBox(pair orig, real w, real h, string label, pair labelOrig)
    {
        RectWithBox r = new RectWithBox;
        r.orig = orig;
        r.w = w;
        r.h = h;
        r.label = label;
        r.labelOrig = labelOrig;
        return r;
    }

    void Draw()
    { 
        pair leftDown = this.orig;
        pair rightDown = (leftDown.x + this.w, leftDown.y);
        pair rightUp = (leftDown.x + this.w, leftDown.y + this.h);
        pair leftUp = (leftDown.x, leftDown.y + this.h); 
        
        path p = leftDown--rightDown--rightUp--leftUp--cycle;
        
        draw(p); 

        real l = length(this.label) / 3;
        pair labelCenterPos = (this.labelOrig.x + l / 2 * cnCharSize, this.labelOrig.y + cnCharSize / 2);
        labelCenterPos = (labelCenterPos.x + this.orig.x, labelCenterPos.y + this.orig.y);
        label(this.label, labelCenterPos);
    }
};

RectWithBox rHost = RectWithBox.RectWithBox((0, 0), 40, 100, "debian主机", (12, 94));

RectWithBox rCrossTools = RectWithBox.RectWithBox((2, 40), 36, 50, "交叉工具链", (8, 44));
RectWithBox rCrossGcc = RectWithBox.RectWithBox((4, 72), 32, 6, "交叉GCC", (10, 1));
RectWithBox rCrossGlibc = RectWithBox.RectWithBox((4, 59), 32, 6, "交叉Glibc", (9, 1));
RectWithBox rCrossBinutils = RectWithBox.RectWithBox((4, 46), 32, 6, "交叉Binutils", (6, 1));

RectWithBox rCrossAddition = RectWithBox.RectWithBox((4, 5), 32, 20, "交叉辅助工具", (4, 8));

RectWithBox rSrc = RectWithBox.RectWithBox((50, 60), 30, 20, "待编译源码", (4, 8));
RectWithBox rTargetHeader = RectWithBox.RectWithBox((50, 20), 30, 20, "目标头文件", (4, 8));

RectWithBox rTarget = RectWithBox.RectWithBox((100, 0), 40, 100, "PowerPC机", (12, 94));
RectWithBox rTargetObj = RectWithBox.RectWithBox((102, 25), 36, 50, "PowerPC目标", (10, 23));

rHost.Draw();
rCrossTools.Draw();
rCrossGcc.Draw();
rCrossGlibc.Draw();
rCrossBinutils.Draw();
rCrossAddition.Draw();

rSrc.Draw();
rTargetHeader.Draw();

rTarget.Draw();
rTargetObj.Draw();

