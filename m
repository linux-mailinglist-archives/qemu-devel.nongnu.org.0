Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2044F401558
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 05:51:59 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN5fq-0003A7-85
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 23:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mN5e3-0002O4-Up
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 23:50:07 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:35386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mN5dx-00088N-RJ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 23:50:04 -0400
Received: by mail-vs1-xe35.google.com with SMTP id p14so4469561vsm.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 20:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLfC7O4zifC8GUSjvAltOz6a7vWqA2+arP5o4EJFG2Q=;
 b=dbYfRKGv7dSdqVxPBU0roLILbgjjWahEebPpRJf+leyExqEir7MjWxIk5330Z5yhAn
 qZTrbxFMGwBK5XP0U3HXBx8Kw+VvBt8wPbtZ2DxlpNOBdR1kWo5LS2hrL3/B9GcPz5uE
 H5eHw6uuAu/3YSWoP4Tb2ESTQ74LEI/Orms+6QB/mUo50NANXae5dkDFSVy5YRedlI2F
 P8NRpwkp+VuRHfKSwd8yWd/b89M9zbcuX/hxSR8J5h21o6iT53MgsCcqhI4DGG59QD+M
 yRsSQo0+uLwvCRSCH+5I3iyixkudYIAxhyxxEMoz6HuIsCCGi8NgN2p/B9VRYwABIr6X
 7NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLfC7O4zifC8GUSjvAltOz6a7vWqA2+arP5o4EJFG2Q=;
 b=GAuEZSmhhGnKj3Y5OPLHkpbFmaVYiUQVMHqSJBiNCRjXuv9XGl1uB+Enjc5ECUEAx0
 7QKl9T3mzRwEfN4tiIs3gX9/izG/XX+1jJ/sO2v1TIy9Q2ef7ket5Diuxfg58m3gXdmD
 FVahx/vsxRSSUnjAJi/fdLoOZwAZNX7FH6PRNQ6dYotkusEe+UkfwKeo3+NeBt9pcgor
 dKqxI9w68a8lJb3VTzxaBPop0+wgb6NrCXgfp+KV50zOuUS9Zegg3EUE1vzlocUkHWoZ
 Q9VHIspx4I30Q4Xy2hYKOTMzpHNz4QiPKs9GNHbogiXBIG7qKxtVOr+P4H3ZNnnPwaYr
 qLbA==
X-Gm-Message-State: AOAM5301MFuK91Cib6GAfk4xFN4xmV2QVCp06ckclOCOGpWx8Xd13+JH
 WIY0UBVtj33ikwhuwsBkyIvF8KMm1B0KH5GeqMphTw==
X-Google-Smtp-Source: ABdhPJyUf8MOB8jVmDsD+R6h54O/aY4mRl8K/HlRgWK2mROQgpAZfRy9ETquFfLfjkX+gCHpvLWsxJrw18M+0nkmHSY=
X-Received: by 2002:a05:6102:1175:: with SMTP id
 k21mr4634798vsg.42.1630900199939; 
 Sun, 05 Sep 2021 20:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <00d401d7a230$56842630$038c7290$@gmail.com>
 <CAFXwXrmt-u9iO_xY3y=ite1rPsvdm77w_s3Fw1G5C=fag0KP1w@mail.gmail.com>
 <2db9d592-8115-1206-68e4-71a9fd25b45d@gmx.de>
 <019301d7a2a6$b853a7c0$28faf740$@gmail.com>
In-Reply-To: <019301d7a2a6$b853a7c0$28faf740$@gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 21:49:51 -0600
Message-ID: <CANCZdfoVD+wfJinEXKaQ8qkVbojwBRZgmDawWuTDZqv=NL0B0g@mail.gmail.com>
Subject: Re: Virtualizing HP PA-RISC unix station other than B160L
To: thierry.briot@gmail.com
Content-Type: multipart/alternative; boundary="00000000000014f22a05cb4b8bf4"
Received-SPF: none client-ip=2607:f8b0:4864:20::e35;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_KAM_HTML_FONT_INVALID=0.01,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 linux-parisc <linux-parisc@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000014f22a05cb4b8bf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Thierry,

I'm answering the following as with my 'Unix history buff' hat on, not due
to direct knowledge of HP PA and porting to it.
I used an HP/Snake workstation for about 9 months back in the day is as
close as I got..

On Sun, Sep 5, 2021 at 6:57 PM <thierry.briot@gmail.com> wrote:

> Hi everyone,
>
>
>
> Thank you for your answers.
>
> First of all, I made a mistake : the HP-UX 10.20 kernel (vmunix) is in th=
e
> /stand (not /boot) filesystem.
>
> I tried replacing /stand of the physical machine iso image with the /stan=
d
> filesytem of the emulated B160L because I supposed that drivers are linke=
d
> with the vmunix kernel. Maybe it's false.
>
http://ibgwww.colorado.edu/~lessem/psyc5112/usail/man/hpux/hpux.1.html has
the boot loader manual in it for HP-UX 10.20.
http://www.datadisk.co.uk/html_docs/hp/hpux_cs.htm has a number of
interesting tid-bits that might be useful in reconfiguring.
IIRC, in the early days, you needed to rebuild / reconfigure kernels for
each different kind of system, so you may have
some issues there (though the model numbers are close enough you may not
need to)...

> Furthermore, the /dev tree is important for dealing with the drivers.
>
HP UX 11 introduced devfs, so 10.20 has the mknod entries in the filesystem=
.

> I will continue to search for which files are hardware related. Maybe
> someone has done this research before ?
>
I haven't done so for HP-UX, but I've done a lot unix history things. 10.20
was released in 1996 so it's late enough
to have things like devfs and loadable kernel modules. However, HP-UX
lagged the cutting edge by a number of
years, despite HP having had a good head start at all things Unix... So
there's some things that are decidedly
retro about it that will be quite unfamiliar unless you (a) lived "the good
old days" or (b) studied the good old
days...

Good luck with this...

Warner


>
>
> Best regards,
>
> Thierry
>
>
>
> -----Message d'origine-----
> De : Helge Deller <deller@gmx.de>
> Envoy=C3=A9 : dimanche 5 septembre 2021 22:32
> =C3=80 : Richard Henderson <richard.henderson@linaro.org>;
> thierry.briot@gmail.com
> Cc : qemu-devel@nongnu.org Developers <qemu-devel@nongnu.org>;
> linux-parisc <linux-parisc@vger.kernel.org>
> Objet : Re: Virtualizing HP PA-RISC unix station other than B160L
>
>
>
> Hi Thierry,
>
>
>
> On 9/5/21 3:24 PM, Richard Henderson wrote:
>
> > On Sun, 5 Sep 2021, 10:30 , <thierry.briot@gmail.com
> <mailto:thierry.briot@gmail.com>> wrote:
>
> > For my company (Nexter Systems, France), I am using qemu-system-hppa
>
> > for virtualizing HP PA-RISC workstations. That works well. You have
>
> > made a very good job !
>
>
>
> Thanks.
>
>
>
> > But my machines are other than B160L (for example B180L), and I have
>
> > to completely reinstall HP-UX on each emulated machine.
>
> > If I do an iso system disk image of my B180L, this iso isn't bootable
>
> > on qemu-system-hppa.
>
> >
>
> > Thus, my questions are :
>
> >
>
> > * Is it planned to emulate other HP unix workstations than B160L (for
>
> > example B180L) ?
>
>
>
> Maybe at some point a 64-bit capable system, e.g. C3000, and maybe an
> older 32-bit system, e.g. 715/64.
>
> For the 64bit system additions to the emulated firmware and additional
> 64-bit qemu support is necessary, and for the 715/64 we need an additiona=
l
> NCR710 SCSI driver.
>
> Both are lots of work.
>
>
>
> The B180L is exactly the same as the B160L, with just a faster CPU:
>
> https://www.openpa.net/systems/hp-visualize_b132l_b160l_b180l.html
>
>
>
> > * Or, what changes should I make to my iso image to do it usable ? If
>
> > I replace the /boot /stand filesystem of the B180L image with the B160L
> one,
>
> > I get a kernel panic at boot time.
>
>
>
> I don't know HP-UX so well. I could imagine that your physical machines
> have different SCSI controller cards which are used by HP-UX, and which
> aren't emulated in qemu yet. That's maybe why qemu can't boot your alread=
y
> installed images.
>
> If you post the output I maybe can give more info.
>
>
>
> > Helge is the one that did all the hw support, I just did the CPU.
>
> > There are no real plans to do another machine. I'm not familiar with
>
> > the specs between the HP machines to know how much work that would be.
>
>
>
> There is a very good overview of the various HP machines at openPA:
>
> https://www.openpa.net/systems/
>
>
>
> Helge
>

--00000000000014f22a05cb4b8bf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Thierry,</div><div><br></div><div>I&#39;m answeri=
ng the following as with my &#39;Unix history buff&#39; hat on, not due to =
direct knowledge of HP PA and porting to it.</div><div>I used an HP/Snake w=
orkstation for about 9 months back in the day is as close as I got..<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sun, Sep 5, 2021 at 6:57 PM &lt;<a href=3D"mailto:thierry.briot@gmail.com">=
thierry.briot@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;" lang=3D"FR=
"><div class=3D"gmail-m_-1488266493327360694WordSection1"><p class=3D"gmail=
-m_-1488266493327360694MsoPlainText">Hi everyone,<u></u><u></u></p><p class=
=3D"gmail-m_-1488266493327360694MsoPlainText"><u></u>=C2=A0<u></u></p><p cl=
ass=3D"gmail-m_-1488266493327360694MsoPlainText">Thank you for your answers=
.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText">Fi=
rst of all, I made a mistake : the HP-UX 10.20 kernel (vmunix) is in the /s=
tand (not /boot) filesystem.<u></u><u></u></p><p class=3D"gmail-m_-14882664=
93327360694MsoPlainText">I tried replacing /stand of the physical machine i=
so image with the /stand filesytem of the emulated B160L because I supposed=
 that drivers are linked with the vmunix kernel. Maybe it&#39;s false. </p>=
</div></div></blockquote><div><a href=3D"http://ibgwww.colorado.edu/~lessem=
/psyc5112/usail/man/hpux/hpux.1.html">http://ibgwww.colorado.edu/~lessem/ps=
yc5112/usail/man/hpux/hpux.1.html</a> has the boot loader manual in it for =
HP-UX 10.20. <br></div><div><a href=3D"http://www.datadisk.co.uk/html_docs/=
hp/hpux_cs.htm">http://www.datadisk.co.uk/html_docs/hp/hpux_cs.htm</a> has =
a number of interesting tid-bits that might be useful in reconfiguring.</di=
v><div>IIRC, in the early days, you needed to rebuild / reconfigure kernels=
 for each different kind of system, so you may have</div><div>some issues t=
here (though the model numbers are close enough you may not need to)...<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overf=
low-wrap: break-word;" lang=3D"FR"><div class=3D"gmail-m_-14882664933273606=
94WordSection1"><p class=3D"gmail-m_-1488266493327360694MsoPlainText"></p><=
p class=3D"gmail-m_-1488266493327360694MsoPlainText"><span lang=3D"IT">Furt=
hermore, the /dev tree is important for dealing with the drivers.</span></p=
></div></div></blockquote><div>HP UX 11 introduced devfs, so 10.20 has the =
mknod entries in the filesystem.<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div style=3D"overflow-wrap: break-word;" lang=3D"FR"><div=
 class=3D"gmail-m_-1488266493327360694WordSection1"><p class=3D"gmail-m_-14=
88266493327360694MsoPlainText">I will continue to search for which files ar=
e hardware related. Maybe someone has done this research before ?</p></div>=
</div></blockquote><div>I haven&#39;t done so for HP-UX, but I&#39;ve done =
a lot unix history things. 10.20 was released in 1996 so it&#39;s late enou=
gh</div><div>to have things like devfs and loadable kernel modules. However=
, HP-UX lagged the cutting edge by a number of</div><div>years, despite HP =
having had a good head start at all things Unix... So there&#39;s some thin=
gs that are decidedly</div><div>retro about it that will be quite unfamilia=
r unless you (a) lived &quot;the good old days&quot; or (b) studied the goo=
d old</div><div>days...</div><div><br></div><div>Good luck with this...<br>=
</div><div><br></div><div>Warner<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;"=
 lang=3D"FR"><div class=3D"gmail-m_-1488266493327360694WordSection1"><p cla=
ss=3D"gmail-m_-1488266493327360694MsoPlainText"><u></u>=C2=A0<u></u></p><p =
class=3D"gmail-m_-1488266493327360694MsoPlainText">Best regards,<u></u><u><=
/u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"><span lang=3D"=
IT">Thierry<u></u><u></u></span></p><p class=3D"gmail-m_-148826649332736069=
4MsoPlainText"><span lang=3D"IT"><u></u>=C2=A0<u></u></span></p><p class=3D=
"gmail-m_-1488266493327360694MsoPlainText"><span>-----Message d&#39;origine=
-----<br>De=C2=A0: Helge Deller &lt;<a href=3D"mailto:deller@gmx.de" target=
=3D"_blank">deller@gmx.de</a>&gt; <br>Envoy=C3=A9=C2=A0: dimanche 5 septemb=
re 2021 22:32<br>=C3=80=C2=A0: Richard Henderson &lt;<a href=3D"mailto:rich=
ard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a=
>&gt;; <a href=3D"mailto:thierry.briot@gmail.com" target=3D"_blank">thierry=
.briot@gmail.com</a><br>Cc=C2=A0: <a href=3D"mailto:qemu-devel@nongnu.org" =
target=3D"_blank">qemu-devel@nongnu.org</a> Developers &lt;<a href=3D"mailt=
o:qemu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>&gt;; l=
inux-parisc &lt;<a href=3D"mailto:linux-parisc@vger.kernel.org" target=3D"_=
blank">linux-parisc@vger.kernel.org</a>&gt;<br>Objet=C2=A0: Re: Virtualizin=
g HP PA-RISC unix station other than B160L</span></p><p class=3D"gmail-m_-1=
488266493327360694MsoPlainText"><u></u>=C2=A0<u></u></p><p class=3D"gmail-m=
_-1488266493327360694MsoPlainText">Hi Thierry,<u></u><u></u></p><p class=3D=
"gmail-m_-1488266493327360694MsoPlainText"><u></u>=C2=A0<u></u></p><p class=
=3D"gmail-m_-1488266493327360694MsoPlainText">On 9/5/21 3:24 PM, Richard He=
nderson wrote:<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694Mso=
PlainText">&gt; On Sun, 5 Sep 2021, 10:30 , &lt;<a href=3D"mailto:thierry.b=
riot@gmail.com%20%3cmailto:thierry.briot@gmail.com" target=3D"_blank"><span=
 style=3D"color:windowtext;text-decoration:none">thierry.briot@gmail.com &l=
t;mailto:thierry.briot@gmail.com</span></a>&gt;&gt; wrote:<u></u><u></u></p=
><p class=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; For my company =
(Nexter Systems, France), I am using qemu-system-hppa <u></u><u></u></p><p =
class=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; for virtualizing HP=
 PA-RISC workstations. That works well. You have <u></u><u></u></p><p class=
=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; made a very good job !<u=
></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"><u></=
u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText">Th=
anks.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText=
"><u></u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainT=
ext">&gt; But my machines are other than B160L (for example B180L), and I h=
ave <u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"=
>&gt; to completely reinstall HP-UX on each emulated machine.<u></u><u></u>=
</p><p class=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; If I do an i=
so system disk image of my B180L, this iso isn&#39;t bootable <u></u><u></u=
></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; on qemu-sys=
tem-hppa.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlain=
Text">&gt;<u></u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694M=
soPlainText">&gt; Thus, my questions are :<u></u><u></u></p><p class=3D"gma=
il-m_-1488266493327360694MsoPlainText">&gt;<u></u>=C2=A0<u></u></p><p class=
=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; * Is it planned to emula=
te other HP unix workstations than B160L (for <u></u><u></u></p><p class=3D=
"gmail-m_-1488266493327360694MsoPlainText">&gt; example B180L) ?<u></u><u><=
/u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"><u></u>=C2=A0<=
u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText">Maybe at so=
me point a 64-bit capable system, e.g. C3000, and maybe an older 32-bit sys=
tem, e.g. 715/64.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694=
MsoPlainText">For the 64bit system additions to the emulated firmware and a=
dditional 64-bit qemu support is necessary, and for the 715/64 we need an a=
dditional NCR710 SCSI driver.<u></u><u></u></p><p class=3D"gmail-m_-1488266=
493327360694MsoPlainText">Both are lots of work.<u></u><u></u></p><p class=
=3D"gmail-m_-1488266493327360694MsoPlainText"><u></u>=C2=A0<u></u></p><p cl=
ass=3D"gmail-m_-1488266493327360694MsoPlainText">The B180L is exactly the s=
ame as the B160L, with just a faster CPU:<u></u><u></u></p><p class=3D"gmai=
l-m_-1488266493327360694MsoPlainText"><a href=3D"https://www.openpa.net/sys=
tems/hp-visualize_b132l_b160l_b180l.html" target=3D"_blank"><span style=3D"=
color:windowtext;text-decoration:none">https://www.openpa.net/systems/hp-vi=
sualize_b132l_b160l_b180l.html</span></a><u></u><u></u></p><p class=3D"gmai=
l-m_-1488266493327360694MsoPlainText"><u></u>=C2=A0<u></u></p><p class=3D"g=
mail-m_-1488266493327360694MsoPlainText">&gt; * Or, what changes should I m=
ake to my iso image to do it usable ? If <u></u><u></u></p><p class=3D"gmai=
l-m_-1488266493327360694MsoPlainText">&gt; I replace the <s>/boot</s> /stan=
d filesystem of the B180L image with the B160L one, <u></u><u></u></p><p cl=
ass=3D"gmail-m_-1488266493327360694MsoPlainText">&gt; I get a kernel panic =
at boot time.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoP=
lainText"><u></u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694M=
soPlainText">I don&#39;t know HP-UX so well. I could imagine that your phys=
ical machines have different SCSI controller cards which are used by HP-UX,=
 and which aren&#39;t emulated in qemu yet. That&#39;s maybe why qemu can&#=
39;t boot your already installed images.<u></u><u></u></p><p class=3D"gmail=
-m_-1488266493327360694MsoPlainText">If you post the output I maybe can giv=
e more info.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPl=
ainText"><u></u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694Ms=
oPlainText">&gt; Helge is the one that did all the hw support, I just did t=
he CPU.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainTe=
xt">&gt; There are no real plans to do another machine. I&#39;m not familia=
r with <u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainTe=
xt">&gt; the specs between the HP machines to know how much work that would=
 be.<u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"=
><u></u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainTe=
xt">There is a very good overview of the various HP machines at openPA:<u><=
/u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"><a href=
=3D"https://www.openpa.net/systems/" target=3D"_blank"><span style=3D"color=
:windowtext;text-decoration:none">https://www.openpa.net/systems/</span></a=
><u></u><u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"><u=
></u>=C2=A0<u></u></p><p class=3D"gmail-m_-1488266493327360694MsoPlainText"=
>Helge<u></u><u></u></p></div></div></blockquote></div></div>

--00000000000014f22a05cb4b8bf4--

