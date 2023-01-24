Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B5167968B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 12:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKHPz-00052h-EX; Tue, 24 Jan 2023 06:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pKHPq-00052N-Na; Tue, 24 Jan 2023 06:24:39 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pKHPn-0004AL-Ek; Tue, 24 Jan 2023 06:24:38 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qx13so38015363ejb.13;
 Tue, 24 Jan 2023 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f6CvaLTf3jdT/IjwC8dbwLGjw+2L9UfFe+vO7rfI3G4=;
 b=BXTNHjiwcV5j/AcUrGcUTGqgRGe5IlIGKFPhKsg35SZLV96chyRs5hTw/6x4LXQatl
 ito2Vcru104EdJO4TUBYA1PPEbjpOHgsixeC7VCeaxH1Vj83GBFmO5CzWBnyQ7ZlkGea
 l+9uq1m1mugQcc7sawXBoEm3w5LkCksa7koBSel0e3BzirGpQt4+XfeL3MkgupDg1ly3
 vNkA3xhUMw1poMvS+hAdxj1mG/elJsy97jSuVjZLePB5V9wQkqvmJ24rwxZbYShRMjUM
 f2Fx5yLHuLOy0cJEpZvesjpLwm8mCPN5JqAoI+kzr4ZzIa/7u461kUesQV29mQLCMYyU
 nX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6CvaLTf3jdT/IjwC8dbwLGjw+2L9UfFe+vO7rfI3G4=;
 b=l79JXbQVrb4xEnBBxn5jIRiZnujKTAWC9oO6iVyi/AxFsLyfvK+1q5Fh66eY83N/uQ
 cY6lr2qVu0wM4E7rmN+DuJrrilRYRRgF0MCm2PRqGV+7LzdnwESMcmgA9WRAm2TK+BQQ
 /+czosRu3hHtTVgnrcldFRlnqkbQn20mbWKzs2iMFECPLnMlz5Cb34gd5pH40jNiQWo4
 Vd5KzhBhEymDW9MXr2tpY2xyHXpYbALlqVHlZxbuRm9xaWiq8zsnyz68cVNqk/hxompI
 qNrviKhlGIR2NO+Psyl2yp45pR+ozT7ld9/ighyEZERuOeozBES5nlCzhAlj2pyhSBU0
 LDew==
X-Gm-Message-State: AFqh2kq77e+D0OFl/91goUcMmwR6c+kW3hZikIjqYwX1isXH+3ZBlsMr
 Nf9rPGRoYYP2PWisPubEY+XTq8Yw+4I3xc8xbT0=
X-Google-Smtp-Source: AMrXdXuq2kTZPGOUu85txP2/qBqCluEdOH8r9CUeIeaaIWSTayew+78fKlp1MVimcbNm8Fu4UrKAn+p2UiFaPNHMAKw=
X-Received: by 2002:a17:906:c017:b0:84d:4dbb:ffcd with SMTP id
 e23-20020a170906c01700b0084d4dbbffcdmr2252872ejz.153.1674559472955; Tue, 24
 Jan 2023 03:24:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
 <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
 <CABLmASGc6fybw7mL5JHUCukwoB6KjGaaWHct5mi20A2vXZhtaA@mail.gmail.com>
 <8e6f46fb-5e1b-8016-c595-85e8e83ace47@eik.bme.hu>
In-Reply-To: <8e6f46fb-5e1b-8016-c595-85e8e83ace47@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Tue, 24 Jan 2023 12:24:19 +0100
Message-ID: <CABLmASEJ_MKr5gP=C7_AXg2UbYmJyDMHtm77AXoyQnsa+f2HHA@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008a758605f300c26d"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008a758605f300c26d
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 2:49 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 24 Jan 2023, Howard Spoelstra wrote:
> > From a Mac OS guest perspective, via=cuda is needed for Mac OS 9.0.4 due
> to
> > the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my guess would be
> > that these suffer the same usb issue)
> > The real powermac3,1 AGP has no adb.
>
> And do these OSes run on real PowerMac3,1? If so then we likely have a bug
> in USB emulation so maybe that could be fixed? In any case my patch does
> not change mac99 and this should continue to work.
>
> > via=cuda supports Mac OS 9.0.4 up to OS X 10.4. via=pmu is strictly only
> > needed for Mac OS X 10.5 guest (for which the speed reported was hacked
> to
> > 900Mhz to fool the installer), but should support all Mac OS/OS X that
> are
> > now supported.
>
> Since via=pmu is what should be a real machine does it run OS X >=10.2
> already?
>

A real powermac3,1 (G4 400Mhz/AGP) runs 8.6 up to10.4.11

qemu-system-ppc status:
8.6 will not boot from CD or HD.
9.0.4* with via=pmu only supports mouse, not kbd. Needs via=cuda due to 2
usb device problem
9.1 and 9.2 with via=pmu
10.0 and 10.1 with via=pmu: no mouse and kdb. Needs via=cuda. (so also with
an usb problem)
10.2 with via=pmu (but has serious graphics speed problem, also with
via=cuda)
10.3 and 10.4 with via=pmu
10.5 only with via=pmu (but needs the 900Mhz speed hack).

*9.0.4 will only run with Mac OS Rom version 5.2.1 and above.

It seems via=pmu provides usb mouse first, usb kbd second.
With Mac OS 9.0.4 the second device will not work.
With 10.0 / 10.1 both usb mouse and kbd do not work.

Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by default I
only see one bus: USB 0 into which both mouse and kdb are plugged.
On the real G4 the mouse and kbd are each plugged into another bus, so I
see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.

With -M mac99,via=cuda one USB bus is always created. It has id "usb-bus"
We can add a second USB bus with e.g. -device pci-ohci,id=usb1  (this is
the Apple USB controller).

Then add mouse and kbd to different buses with:
-device usb-mouse,bus=usb-bus.0    (attaches to first and default bus)
-device usb-kbd,bus=usb1.0 (attaches to second bus).

This then mimics what I see on real hardware. Should qemu-system-ppc by
default provide the same?



> > via=pmu-adb seems only needed to trick mac os server installations that
> > would later run on the g3beige.
> >
> > To my knowledge 32 bit Linux guests all require via=pmu
> > See here: https://wiki.qemu.org/Documentation/Platforms/PowerPC
>
> That doc might need some updating. It seems to be from before pegasos2 was
> added. Maybe we would be better off linking from this page to others that
> are more actively maintained such as:
> https://www.emaculation.com/doku.php/qemu
> and
> http://zero.eik.bme.hu/~balaton/qemu/amiga/
>
>
I "maintain" that page with only general information. I can link to the
specific sites you mention.


> or even better updating the main docs in
>
> https://www.qemu.org/docs/master/system/ppc/powermac.html
>
>
That would have to be taken up by someone else.

Best,
Howard

--0000000000008a758605f300c26d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 2:49 AM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balat=
on@eik.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 24 Jan 2023, Howard Spoelstra wrote:<br>
&gt; From a Mac OS guest perspective, via=3Dcuda is needed for Mac OS 9.0.4=
 due to<br>
&gt; the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my guess would=
 be<br>
&gt; that these suffer the same usb issue)<br>
&gt; The real powermac3,1 AGP has no adb.<br>
<br>
And do these OSes run on real PowerMac3,1? If so then we likely have a bug =
<br>
in USB emulation so maybe that could be fixed? In any case my patch does <b=
r>
not change mac99 and this should continue to work.<br>
<br>
&gt; via=3Dcuda supports Mac OS 9.0.4 up to OS X 10.4. via=3Dpmu is strictl=
y only<br>
&gt; needed for Mac OS X 10.5 guest (for which the speed reported was hacke=
d to<br>
&gt; 900Mhz to fool the installer), but should support all Mac OS/OS X that=
 are<br>
&gt; now supported.<br>
<br>
Since via=3Dpmu is what should be a real machine does it run OS X &gt;=3D10=
.2 <br>
already?<br></blockquote><div><br></div><div>A real powermac3,1 (G4 400Mhz/=
AGP) runs 8.6 up to10.4.11</div><div><br></div><div>qemu-system-ppc status:=
</div><div>
8.6 will not boot from CD or HD.

</div><div>9.0.4* with via=3Dpmu only supports mouse, not kbd. Needs via=3D=
cuda due to 2 usb device problem <br></div><div>9.1 and 9.2 with via=3Dpmu<=
/div><div>10.0 and 10.1 with via=3Dpmu: no mouse and kdb. Needs via=3Dcuda.=
 (so also with an usb problem)<br></div><div>10.2 with via=3Dpmu (but has s=
erious graphics speed problem, also with via=3Dcuda)</div><div>10.3 and 10.=
4 with via=3Dpmu</div><div>10.5 only with via=3Dpmu (but needs the 900Mhz s=
peed hack).<br></div><div><br></div><div>
<div>
*9.0.4 will only run with Mac OS Rom version 5.2.1 and above.<br></div><div=
><br></div>

</div><div>It seems via=3Dpmu provides usb mouse first, usb kbd second. <br=
></div><div>With Mac OS 9.0.4 the second device will not work. <br></div><d=
iv>With 10.0 / 10.1 both usb mouse and kbd do not work.</div><div><br></div=
><div>Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by def=
ault I only see one bus: USB 0 into which both mouse and kdb are plugged.<b=
r><div>On
 the real G4 the mouse and kbd are each plugged into another bus, so I=20
see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.</div><br><div>With -=
M mac99,via=3Dcuda one USB bus is always created. It has id &quot;usb-bus&q=
uot;<br></div><div>We can add a second USB bus with e.g. -device pci-ohci,i=
d=3Dusb1=C2=A0 (this is the Apple USB controller).<br></div><div><br></div>=
<div>Then add mouse and kbd to different buses with:<br>-device usb-mouse,b=
us=3Dusb-bus.0 =C2=A0=C2=A0 (attaches to first and default bus)<br>-device =
usb-kbd,bus=3Dusb1.0 (attaches to second bus).<br></div><div><br></div><div=
>This then mimics what I see on real hardware. Should qemu-system-ppc by de=
fault provide the same?<br></div>

</div><br><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; via=3Dpmu-adb seems only needed to trick mac os server installations t=
hat<br>
&gt; would later run on the g3beige.<br>
&gt;<br>
&gt; To my knowledge 32 bit Linux guests all require via=3Dpmu<br>
&gt; See here: <a href=3D"https://wiki.qemu.org/Documentation/Platforms/Pow=
erPC" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Documentat=
ion/Platforms/PowerPC</a><br>
<br>
That doc might need some updating. It seems to be from before pegasos2 was =
<br>
added. Maybe we would be better off linking from this page to others that <=
br>
are more actively maintained such as: <br>
<a href=3D"https://www.emaculation.com/doku.php/qemu" rel=3D"noreferrer" ta=
rget=3D"_blank">https://www.emaculation.com/doku.php/qemu</a> <br>
and <br>
<a href=3D"http://zero.eik.bme.hu/~balaton/qemu/amiga/" rel=3D"noreferrer" =
target=3D"_blank">http://zero.eik.bme.hu/~balaton/qemu/amiga/</a><br>
<br></blockquote><div><br></div><div>I &quot;maintain&quot; that page with =
only general information. I can link to the specific sites you mention. <br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
or even better updating the main docs in<br>
<br>
<a href=3D"https://www.qemu.org/docs/master/system/ppc/powermac.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/system/p=
pc/powermac.html</a><br>
<br></blockquote><div><br></div><div>That would have to be taken up by some=
one else.</div><div><br></div><div>Best,</div><div>Howard<br></div></div></=
div>

--0000000000008a758605f300c26d--

