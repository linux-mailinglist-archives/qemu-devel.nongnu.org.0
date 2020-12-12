Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB9F2D8374
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:35:16 +0100 (CET)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knssU-0005pS-V5
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1knsk1-00028G-9l
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:26:29 -0500
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:35902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1knsjp-0000Ua-UN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:26:26 -0500
Received: by mail-ua1-x944.google.com with SMTP id p2so3452031uac.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8wwNEJ6uzZf/UOAO7bwbRIDrbL+RF4Y++SSGoQdTx0=;
 b=hRMLgABbyh81z2cj4dk9K0zdIYZyI1nWZcy4XPvODn1gSZC+E6VrCC2r2qjq9IlFUZ
 PwhyVmVo60rJpzuok+r+lR6sQ31p0dcSssHt3okztFv7G0aXHMvDo/VbDKxrUjXnLC06
 Bph4hJgEZc/2pNMrRa4I157lJ4BZXhatRfmpl2oS9EXkZ5F/jeyNZVzh/K4R/XODH8Mg
 H4trjVjbQerBLG8yoESjhNtMYzXwoPjQoZ3a6dGZ4GdvLcZfH7/IonxHl0b0jooA5r/E
 HKPC6P/48UGeH/O+1UQWHMVSzRbc/R3eJwZST34wlARUE/NSqoinaenRkBKYFHokKowo
 X/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8wwNEJ6uzZf/UOAO7bwbRIDrbL+RF4Y++SSGoQdTx0=;
 b=Vpg2dwtlm3BwH0WSP65Jg5Y6Psvu96x91Ux2O5lg0Fntu8/MndiJYSSMg7Pq0kYmJD
 fNvUWEhPETzeTTy9EemtpSoHlou1MQByLCluHSV8TcRy/IOyD/uImVMB+h8YBMrPszX+
 ohWrfU2uKItwta1M9A6T02FowxgJ964qh5jKOC/iAJMu11TSLN6SQ9Utgw3nn7UydMyD
 YMiDc89HO8jSE9Mntb+l8OJbWEgyWYNAn19V8D0RGsyWo2s2xqZ0i2qIPEmN/EUa2Rzn
 U+c3aYS7Q9fo+WiIsuyiZFlqd3IW8d4j8ysQMOSBgxNVAKOUHh7DRCO7/88izzUsT71d
 MzXQ==
X-Gm-Message-State: AOAM530CfxqoK80VKuy/LdFi0QgBimJeQIHS+05Xy0wKqL8NrAA75g24
 5ZnCk7oe8vHN5HoR/XPexTXoeRCFlxDguQojzDbwBQ==
X-Google-Smtp-Source: ABdhPJwWfy+42eXWixX03B3U/sxtZmCQ6RuRxFMflqXUB1pghA6o1HbGl9EncTBio8c6DwiEtphlk91tbcLGdn7cUDw=
X-Received: by 2002:ab0:63cf:: with SMTP id i15mr1436032uap.12.1607732774326; 
 Fri, 11 Dec 2020 16:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20201211015156.2053372-1-wuhaotsh@google.com>
 <20201211030435.GI11017@minyard.net>
 <CAGcCb12UyiPoU=cPd3W3Mwj+jZHbWWESEPY-dhaSWXDqGdhM0w@mail.gmail.com>
 <20201212001634.GK11017@minyard.net>
In-Reply-To: <20201212001634.GK11017@minyard.net>
Date: Fri, 11 Dec 2020 16:26:03 -0800
Message-ID: <CAFQmdRY9LLDHs9sFu=8bd3Os4v2N+LuYXeo0cH81q-6d+6F6TA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Additional NPCM7xx devices and IPMI BMC emulation
 support
To: minyard@acm.org
Content-Type: multipart/alternative; boundary="000000000000e8bfb705b63974eb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::944;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x944.google.com
X-Spam_score_int: -96
X-Spam_score: -9.7
X-Spam_bar: ---------
X-Spam_report: (-9.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hao Wu <wuhaotsh@google.com>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>

--000000000000e8bfb705b63974eb
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 11, 2020 at 4:16 PM Corey Minyard <minyard@acm.org> wrote:

> On Fri, Dec 11, 2020 at 12:56:07PM -0800, Hao Wu wrote:
> > Tl,dr: We'll remove the IPMI changes from the current patch set and
> > refactor
> >           them in a separate patch set.
> >
> > Thank you for your review! On high level, we are trying to emulate the
> BMC
> > side of the IPMI protocol. So we cannot directly use the existing IPMI
> code.
> > However, they do have a lot in duplication as you pointed out. So we'll
> > refactor
> > the existing IPMI code and update in a way that we only add the required
> > functionality.
>
> Ah, I didn't figure that out from what you posted.  So the idea is you
> can create the BMC side of the system in one qemu session with your
> changes and then you connect it to a host system running qemu with the
> host side of the interface.
>
> The wire protocol is basically symmetric, but the command handling will
> need to be separate.  So you probably want to split out the base
> protocol from ipmi_bmc_extern into its own file and use that from your
> own file, to avoid the duplication.
>
> You need to do proper ATTN handling on the BMC side.  And you will also
> need ties into GPIOs and whatnot for doing the reset, NMI, etc.
>
> "ipmi_host" is probably not the best name.  At least to me that implied
> the host side of the interface.  I'm not coming up with something I
> really like, though.  Maybe "bmc_host"?  That's more descriptive, though
> I'm sure a better name exists.  Then you could have "bmc_host_extern"
> for the protocol.  If you come up with a better naming scheme, the
> existing files can be renamed, too.
>

The naming is my fault.

My thinking was that ipmi-host-extern is to the BMC what ipmi-bmc-extern is
to the host. That is, the former represents the host as seen by the BMC,
and the latter represents the BMC as seen by the host.

I sent some docs to the list earlier this year, but sadly, I never got
around to follow up. You can see the generated docs here:

https://hskinnemoen.github.io/qemu/specs/ipmi.html

Hao, perhaps you should include my documentation patches in your next IPMI
series? If we come up with a better naming scheme for both sides, I can
update the docs accordingly.

Havard


> Thanks,
>
> -corey
>
> >
> > As for the KCS module, the BMC side of the protocol is the opposite
> > direction
> > of the existing ipmi_kcs.c code which is on the host/CPU side. For
> example,
> > in READ_STATE the CPU would read data while the BMC would write data.
> > So we can't directly use the same implementation. (They're different
> files
> > in
> > Linux either.) However, we can refactor it to re-use some of the common
> > definitions.
> >
> > We would like to remove the IPMI and KCS stuff from the current patch
> set.
> > We'll send the refactored code in a separate patch set after addressing
> > your concerns.
> >
> > Thanks again for the review!
> >
> > On Thu, Dec 10, 2020 at 7:04 PM Corey Minyard <minyard@acm.org> wrote:
> >
> > > On Thu, Dec 10, 2020 at 05:51:49PM -0800, Hao Wu wrote:
> > > > This patch series include a few more NPCM7XX devices including
> > > >
> > > > - Analog Digital Converter (ADC)
> > > > - Pulse Width Modulation (PWM)
> > > > - Keyboard Style Controller (KSC)
> > > >
> > > > To utilize these modules we also add two extra functionalities:
> > > >
> > > > 1. We modified the CLK module to generate clock values using
> qdev_clock.
> > > >    These clocks are used to determine various clocks in NPCM7XX
> devices.
> > > > 2. We added support for emulating IPMI responder devices in BMC
> machines,
> > > >    similar to the existing IPMI device support for CPU emulation.
> This
> > > allows
> > > >    a qemu instance running BMC firmware to serve as an external BMC
> for
> > > a qemu
> > > >    instance running server software. It utilizes the KCS module we
> > > implemented.
> > >
> > > Looking at the IPMI changes, why didn't you just re-use the existing
> > > IPMI infrastructure?  ipmi_host.[ch] is basically a subset of
> ipmi.[ch],
> > > and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern with
> > > some names changed.  That kind of code duplication is not acceptable.
> > > Plus you copied my code and removed my copyrights, which is really
> > > not acceptable and illegal.
> > >
> > > I'm not exactly sure why you needed you own KCS interface, either.  It
> > > looks like the interface is somewhat different in some ways, but
> > > integrating it into the current KCS code is probably a better choice if
> > > that can be done.
> > >
> > > -corey
> > >
> > > >
> > > > Hao Wu (7):
> > > >   hw/misc: Add clock converter in NPCM7XX CLK module
> > > >   hw/timer: Refactor NPCM7XX Timer to use CLK clock
> > > >   hw/adc: Add an ADC module for NPCM7XX
> > > >   hw/misc: Add a PWM module for NPCM7XX
> > > >   hw/ipmi: Add an IPMI host interface
> > > >   hw/ipmi: Add a KCS Module for NPCM7XX
> > > >   hw/ipmi: Add an IPMI external host device
> > > >
> > > >  default-configs/devices/arm-softmmu.mak |   2 +
> > > >  docs/system/arm/nuvoton.rst             |   6 +-
> > > >  hw/adc/meson.build                      |   1 +
> > > >  hw/adc/npcm7xx_adc.c                    | 318 ++++++++++
> > > >  hw/arm/npcm7xx.c                        |  65 +-
> > > >  hw/ipmi/Kconfig                         |   5 +
> > > >  hw/ipmi/ipmi_host.c                     |  40 ++
> > > >  hw/ipmi/ipmi_host_extern.c              | 435 +++++++++++++
> > > >  hw/ipmi/meson.build                     |   3 +
> > > >  hw/ipmi/npcm7xx_kcs.c                   | 570 +++++++++++++++++
> > > >  hw/misc/meson.build                     |   1 +
> > > >  hw/misc/npcm7xx_clk.c                   | 795
> +++++++++++++++++++++++-
> > > >  hw/misc/npcm7xx_pwm.c                   | 535 ++++++++++++++++
> > > >  hw/timer/npcm7xx_timer.c                |  25 +-
> > > >  include/hw/adc/npcm7xx_adc.h            |  72 +++
> > > >  include/hw/arm/npcm7xx.h                |   6 +
> > > >  include/hw/ipmi/ipmi_host.h             |  56 ++
> > > >  include/hw/ipmi/ipmi_responder.h        |  66 ++
> > > >  include/hw/ipmi/npcm7xx_kcs.h           | 105 ++++
> > > >  include/hw/misc/npcm7xx_clk.h           | 146 ++++-
> > > >  include/hw/misc/npcm7xx_pwm.h           | 106 ++++
> > > >  include/hw/timer/npcm7xx_timer.h        |   1 +
> > > >  tests/qtest/meson.build                 |   4 +-
> > > >  tests/qtest/npcm7xx_adc-test.c          | 400 ++++++++++++
> > > >  tests/qtest/npcm7xx_pwm-test.c          | 490 +++++++++++++++
> > > >  25 files changed, 4221 insertions(+), 32 deletions(-)
> > > >  create mode 100644 hw/adc/npcm7xx_adc.c
> > > >  create mode 100644 hw/ipmi/ipmi_host.c
> > > >  create mode 100644 hw/ipmi/ipmi_host_extern.c
> > > >  create mode 100644 hw/ipmi/npcm7xx_kcs.c
> > > >  create mode 100644 hw/misc/npcm7xx_pwm.c
> > > >  create mode 100644 include/hw/adc/npcm7xx_adc.h
> > > >  create mode 100644 include/hw/ipmi/ipmi_host.h
> > > >  create mode 100644 include/hw/ipmi/ipmi_responder.h
> > > >  create mode 100644 include/hw/ipmi/npcm7xx_kcs.h
> > > >  create mode 100644 include/hw/misc/npcm7xx_pwm.h
> > > >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
> > > >  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
> > > >
> > > > --
> > > > 2.29.2.684.gfbc64c5ab5-goog
> > > >
> > >
>

--000000000000e8bfb705b63974eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Dec 11, 2020 at 4:16 PM Corey Min=
yard &lt;<a href=3D"mailto:minyard@acm.org">minyard@acm.org</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Dec 11, 2020 at 12:56:07PM -0800, Hao Wu wrote:<br>
&gt; Tl,dr: We&#39;ll remove the IPMI changes from the current patch set an=
d<br>
&gt; refactor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0them in a separate patch set.<=
br>
&gt; <br>
&gt; Thank you for your review! On high level, we are trying to emulate the=
 BMC<br>
&gt; side of the IPMI protocol. So we cannot directly use the existing IPMI=
 code.<br>
&gt; However, they do have a lot in duplication as you pointed out. So we&#=
39;ll<br>
&gt; refactor<br>
&gt; the existing IPMI code and update in a way that we only add the requir=
ed<br>
&gt; functionality.<br>
<br>
Ah, I didn&#39;t figure that out from what you posted.=C2=A0 So the idea is=
 you<br>
can create the BMC side of the system in one qemu session with your<br>
changes and then you connect it to a host system running qemu with the<br>
host side of the interface.<br>
<br>
The wire protocol is basically symmetric, but the command handling will<br>
need to be separate.=C2=A0 So you probably want to split out the base<br>
protocol from ipmi_bmc_extern into its own file and use that from your<br>
own file, to avoid the duplication.<br>
<br>
You need to do proper ATTN handling on the BMC side.=C2=A0 And you will als=
o<br>
need ties into GPIOs and whatnot for doing the reset, NMI, etc.<br>
<br>
&quot;ipmi_host&quot; is probably not the best name.=C2=A0 At least to me t=
hat implied<br>
the host side of the interface.=C2=A0 I&#39;m not coming up with something =
I<br>
really like, though.=C2=A0 Maybe &quot;bmc_host&quot;?=C2=A0 That&#39;s mor=
e descriptive, though<br>
I&#39;m sure a better name exists.=C2=A0 Then you could have &quot;bmc_host=
_extern&quot;<br>
for the protocol.=C2=A0 If you come up with a better naming scheme, the<br>
existing files can be renamed, too.<br></blockquote><div><br></div><div>The=
 naming is my fault.</div><div><br></div><div>My thinking was that ipmi-hos=
t-extern is to the BMC what ipmi-bmc-extern is to the host. That is, the fo=
rmer represents the host as seen by the BMC, and the latter represents the =
BMC as seen by the host.</div><div><br></div><div>I sent some docs to the l=
ist earlier this year, but sadly, I never got around to follow up. You can =
see the generated docs here:</div><div><br></div><div><a href=3D"https://hs=
kinnemoen.github.io/qemu/specs/ipmi.html">https://hskinnemoen.github.io/qem=
u/specs/ipmi.html</a><br></div><div><br></div><div>Hao, perhaps you should =
include my documentation patches in your next IPMI series? If we come up wi=
th a better naming scheme for both sides, I can update the docs accordingly=
.</div><div><br></div><div>Havard</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Thanks,<br>
<br>
-corey<br>
<br>
&gt; <br>
&gt; As for the KCS module, the BMC side of the protocol is the opposite<br=
>
&gt; direction<br>
&gt; of the existing ipmi_kcs.c code which is on the host/CPU side. For exa=
mple,<br>
&gt; in READ_STATE the CPU would read data while the BMC would write data.<=
br>
&gt; So we can&#39;t directly use the same implementation. (They&#39;re dif=
ferent files<br>
&gt; in<br>
&gt; Linux either.) However, we can refactor it to re-use some of the commo=
n<br>
&gt; definitions.<br>
&gt; <br>
&gt; We would like to remove the IPMI and KCS stuff from the current patch =
set.<br>
&gt; We&#39;ll send the refactored code in a separate patch set after addre=
ssing<br>
&gt; your concerns.<br>
&gt; <br>
&gt; Thanks again for the review!<br>
&gt; <br>
&gt; On Thu, Dec 10, 2020 at 7:04 PM Corey Minyard &lt;<a href=3D"mailto:mi=
nyard@acm.org" target=3D"_blank" class=3D"cremed">minyard@acm.org</a>&gt; w=
rote:<br>
&gt; <br>
&gt; &gt; On Thu, Dec 10, 2020 at 05:51:49PM -0800, Hao Wu wrote:<br>
&gt; &gt; &gt; This patch series include a few more NPCM7XX devices includi=
ng<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - Analog Digital Converter (ADC)<br>
&gt; &gt; &gt; - Pulse Width Modulation (PWM)<br>
&gt; &gt; &gt; - Keyboard Style Controller (KSC)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; To utilize these modules we also add two extra functionaliti=
es:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 1. We modified the CLK module to generate clock values using=
 qdev_clock.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 These clocks are used to determine various cloc=
ks in NPCM7XX devices.<br>
&gt; &gt; &gt; 2. We added support for emulating IPMI responder devices in =
BMC machines,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 similar to the existing IPMI device support for=
 CPU emulation. This<br>
&gt; &gt; allows<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 a qemu instance running BMC firmware to serve a=
s an external BMC for<br>
&gt; &gt; a qemu<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 instance running server software. It utilizes t=
he KCS module we<br>
&gt; &gt; implemented.<br>
&gt; &gt;<br>
&gt; &gt; Looking at the IPMI changes, why didn&#39;t you just re-use the e=
xisting<br>
&gt; &gt; IPMI infrastructure?=C2=A0 ipmi_host.[ch] is basically a subset o=
f ipmi.[ch],<br>
&gt; &gt; and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern =
with<br>
&gt; &gt; some names changed.=C2=A0 That kind of code duplication is not ac=
ceptable.<br>
&gt; &gt; Plus you copied my code and removed my copyrights, which is reall=
y<br>
&gt; &gt; not acceptable and illegal.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not exactly sure why you needed you own KCS interface, ei=
ther.=C2=A0 It<br>
&gt; &gt; looks like the interface is somewhat different in some ways, but<=
br>
&gt; &gt; integrating it into the current KCS code is probably a better cho=
ice if<br>
&gt; &gt; that can be done.<br>
&gt; &gt;<br>
&gt; &gt; -corey<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hao Wu (7):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/misc: Add clock converter in NPCM7XX CLK modu=
le<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/timer: Refactor NPCM7XX Timer to use CLK cloc=
k<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/adc: Add an ADC module for NPCM7XX<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/misc: Add a PWM module for NPCM7XX<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/ipmi: Add an IPMI host interface<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/ipmi: Add a KCS Module for NPCM7XX<br>
&gt; &gt; &gt;=C2=A0 =C2=A0hw/ipmi: Add an IPMI external host device<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 default-configs/devices/arm-softmmu.mak |=C2=A0 =C2=A0=
2 +<br>
&gt; &gt; &gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt; &gt; &gt;=C2=A0 hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 318 ++++++++++<br>
&gt; &gt; &gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 +-<br>
&gt; &gt; &gt;=C2=A0 hw/ipmi/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt; &gt; &gt;=C2=A0 hw/ipmi/ipmi_host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++<br>
&gt; &gt; &gt;=C2=A0 hw/ipmi/ipmi_host_extern.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 435 +++++++++++++<br>
&gt; &gt; &gt;=C2=A0 hw/ipmi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt; &gt; &gt;=C2=A0 hw/ipmi/npcm7xx_kcs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 570 +++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 795 +++++++++++++++++++++++-<br>
&gt; &gt; &gt;=C2=A0 hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 535 ++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +-<br>
&gt; &gt; &gt;=C2=A0 include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 72 +++<br>
&gt; &gt; &gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt; &gt; &gt;=C2=A0 include/hw/ipmi/ipmi_host.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 56 ++<br>
&gt; &gt; &gt;=C2=A0 include/hw/ipmi/ipmi_responder.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 66 ++<br>
&gt; &gt; &gt;=C2=A0 include/hw/ipmi/npcm7xx_kcs.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 105 ++++<br>
&gt; &gt; &gt;=C2=A0 include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 146 ++++-<br>
&gt; &gt; &gt;=C2=A0 include/hw/misc/npcm7xx_pwm.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 106 ++++<br>
&gt; &gt; &gt;=C2=A0 include/hw/timer/npcm7xx_timer.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt; &gt; &gt;=C2=A0 tests/qtest/npcm7xx_adc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 400 ++++++++++++<br>
&gt; &gt; &gt;=C2=A0 tests/qtest/npcm7xx_pwm-test.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 490 +++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 25 files changed, 4221 insertions(+), 32 deletions(-)<=
br>
&gt; &gt; &gt;=C2=A0 create mode 100644 hw/adc/npcm7xx_adc.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 hw/ipmi/ipmi_host.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 hw/ipmi/ipmi_host_extern.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 hw/ipmi/npcm7xx_kcs.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 hw/misc/npcm7xx_pwm.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 include/hw/ipmi/ipmi_host.h<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 include/hw/ipmi/ipmi_responder.h<br=
>
&gt; &gt; &gt;=C2=A0 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 include/hw/misc/npcm7xx_pwm.h<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_pwm-test.c<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.29.2.684.gfbc64c5ab5-goog<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000e8bfb705b63974eb--

