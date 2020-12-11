Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F12D8052
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:00:49 +0100 (CET)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpWy-00060m-S9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1knpSi-0004Yx-Gl
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:56:24 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:41197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1knpSg-0000Sl-6s
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:56:24 -0500
Received: by mail-lf1-x144.google.com with SMTP id r24so15143076lfm.8
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 12:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YR4cLcbxQMTvwfBGnh9TSVXqjdIzc3mQ7vR9rR1oYWE=;
 b=gUQ7qcuHfHWssv55xAJGMad0J0KdWqGG/tkdtWxu8xo1M4e+nWLq17ph4LGMFDue6o
 8OyCQqxyr3c/30k/iFn5W6gbmXjQjxUN0+NwF/LrjVAvZvT42st0pWOC5PQ5RbqUK7Uq
 anSUuXSpM5vLc+B1bS28hBgBlK2xp1U10cD1vbkG7hpQc/6YFi4PeuSnpJhfOhqwuebH
 HI3V4Efk3U3KbeH2qrMsevszMbQYC4Zr5LHWzbe9ouEpsMdlmJE6Vo2AHbvfTvPktI4o
 dAiVb0wxWE9pXBxzVhh4MDM24kEdpQx7t+8SSWDjzjoWoRTtWqwRCb2qyKdSeDERcg7K
 ccEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YR4cLcbxQMTvwfBGnh9TSVXqjdIzc3mQ7vR9rR1oYWE=;
 b=Bq+srAwyz9MjRwt/7AJ8g+Z/6uNRYadJsWBcRO9yFgXC/NtG4mYiv9BbwX910RALSL
 vwh/Q3qolqxFV1vKtJytCrsXVX2OUJanKJBR/OlhHzvyyms6AeXT069mO28Feh6tuqzP
 uYFwGFWCow1TV+E+Bu0HK12Oz0tSFZ3VXRdlKIyNvfc4smTIwAvPfbVCrOLgUPApAyD6
 7ruMrLm55yaCFJc0Xg1ZaFtFRUYaCC4WI3XKQOY22ZxA5Hu0b5vsR/rIeJZ47e413RbV
 cLiD/t4QPWXJtNS/1jLGGbD868qYUdwrE68RJC8iWft6mV4SW1ss445vMbMyxRpoMTtB
 pTIA==
X-Gm-Message-State: AOAM533rTL1+DOkFcn9L1KQAeWuLholXvA0Mr/dS1uLikQLvkF4IRpS0
 kOaDCtxe8t7/Ap0BE+lZ1BDjCaZc2/N4KYjw0E7qKQ==
X-Google-Smtp-Source: ABdhPJwi3heD3aZmdffHHDBYdcb9/EFfmVvetc++WbW7ospZV+ox6Jh086GbtwmdjWwj3l4yUMBLLGvnIodPiSodFlA=
X-Received: by 2002:a19:3811:: with SMTP id f17mr5026362lfa.28.1607720178455; 
 Fri, 11 Dec 2020 12:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20201211015156.2053372-1-wuhaotsh@google.com>
 <20201211030435.GI11017@minyard.net>
In-Reply-To: <20201211030435.GI11017@minyard.net>
Date: Fri, 11 Dec 2020 12:56:07 -0800
Message-ID: <CAGcCb12UyiPoU=cPd3W3Mwj+jZHbWWESEPY-dhaSWXDqGdhM0w@mail.gmail.com>
Subject: Re: [PATCH 0/7] Additional NPCM7xx devices and IPMI BMC emulation
 support
To: minyard@acm.org
Content-Type: multipart/alternative; boundary="00000000000022fbbe05b636869d"
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x144.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm@nongnu.org, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--00000000000022fbbe05b636869d
Content-Type: text/plain; charset="UTF-8"

Tl,dr: We'll remove the IPMI changes from the current patch set and
refactor
          them in a separate patch set.

Thank you for your review! On high level, we are trying to emulate the BMC
side of the IPMI protocol. So we cannot directly use the existing IPMI code.
However, they do have a lot in duplication as you pointed out. So we'll
refactor
the existing IPMI code and update in a way that we only add the required
functionality.

As for the KCS module, the BMC side of the protocol is the opposite
direction
of the existing ipmi_kcs.c code which is on the host/CPU side. For example,
in READ_STATE the CPU would read data while the BMC would write data.
So we can't directly use the same implementation. (They're different files
in
Linux either.) However, we can refactor it to re-use some of the common
definitions.

We would like to remove the IPMI and KCS stuff from the current patch set.
We'll send the refactored code in a separate patch set after addressing
your concerns.

Thanks again for the review!

On Thu, Dec 10, 2020 at 7:04 PM Corey Minyard <minyard@acm.org> wrote:

> On Thu, Dec 10, 2020 at 05:51:49PM -0800, Hao Wu wrote:
> > This patch series include a few more NPCM7XX devices including
> >
> > - Analog Digital Converter (ADC)
> > - Pulse Width Modulation (PWM)
> > - Keyboard Style Controller (KSC)
> >
> > To utilize these modules we also add two extra functionalities:
> >
> > 1. We modified the CLK module to generate clock values using qdev_clock.
> >    These clocks are used to determine various clocks in NPCM7XX devices.
> > 2. We added support for emulating IPMI responder devices in BMC machines,
> >    similar to the existing IPMI device support for CPU emulation. This
> allows
> >    a qemu instance running BMC firmware to serve as an external BMC for
> a qemu
> >    instance running server software. It utilizes the KCS module we
> implemented.
>
> Looking at the IPMI changes, why didn't you just re-use the existing
> IPMI infrastructure?  ipmi_host.[ch] is basically a subset of ipmi.[ch],
> and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern with
> some names changed.  That kind of code duplication is not acceptable.
> Plus you copied my code and removed my copyrights, which is really
> not acceptable and illegal.
>
> I'm not exactly sure why you needed you own KCS interface, either.  It
> looks like the interface is somewhat different in some ways, but
> integrating it into the current KCS code is probably a better choice if
> that can be done.
>
> -corey
>
> >
> > Hao Wu (7):
> >   hw/misc: Add clock converter in NPCM7XX CLK module
> >   hw/timer: Refactor NPCM7XX Timer to use CLK clock
> >   hw/adc: Add an ADC module for NPCM7XX
> >   hw/misc: Add a PWM module for NPCM7XX
> >   hw/ipmi: Add an IPMI host interface
> >   hw/ipmi: Add a KCS Module for NPCM7XX
> >   hw/ipmi: Add an IPMI external host device
> >
> >  default-configs/devices/arm-softmmu.mak |   2 +
> >  docs/system/arm/nuvoton.rst             |   6 +-
> >  hw/adc/meson.build                      |   1 +
> >  hw/adc/npcm7xx_adc.c                    | 318 ++++++++++
> >  hw/arm/npcm7xx.c                        |  65 +-
> >  hw/ipmi/Kconfig                         |   5 +
> >  hw/ipmi/ipmi_host.c                     |  40 ++
> >  hw/ipmi/ipmi_host_extern.c              | 435 +++++++++++++
> >  hw/ipmi/meson.build                     |   3 +
> >  hw/ipmi/npcm7xx_kcs.c                   | 570 +++++++++++++++++
> >  hw/misc/meson.build                     |   1 +
> >  hw/misc/npcm7xx_clk.c                   | 795 +++++++++++++++++++++++-
> >  hw/misc/npcm7xx_pwm.c                   | 535 ++++++++++++++++
> >  hw/timer/npcm7xx_timer.c                |  25 +-
> >  include/hw/adc/npcm7xx_adc.h            |  72 +++
> >  include/hw/arm/npcm7xx.h                |   6 +
> >  include/hw/ipmi/ipmi_host.h             |  56 ++
> >  include/hw/ipmi/ipmi_responder.h        |  66 ++
> >  include/hw/ipmi/npcm7xx_kcs.h           | 105 ++++
> >  include/hw/misc/npcm7xx_clk.h           | 146 ++++-
> >  include/hw/misc/npcm7xx_pwm.h           | 106 ++++
> >  include/hw/timer/npcm7xx_timer.h        |   1 +
> >  tests/qtest/meson.build                 |   4 +-
> >  tests/qtest/npcm7xx_adc-test.c          | 400 ++++++++++++
> >  tests/qtest/npcm7xx_pwm-test.c          | 490 +++++++++++++++
> >  25 files changed, 4221 insertions(+), 32 deletions(-)
> >  create mode 100644 hw/adc/npcm7xx_adc.c
> >  create mode 100644 hw/ipmi/ipmi_host.c
> >  create mode 100644 hw/ipmi/ipmi_host_extern.c
> >  create mode 100644 hw/ipmi/npcm7xx_kcs.c
> >  create mode 100644 hw/misc/npcm7xx_pwm.c
> >  create mode 100644 include/hw/adc/npcm7xx_adc.h
> >  create mode 100644 include/hw/ipmi/ipmi_host.h
> >  create mode 100644 include/hw/ipmi/ipmi_responder.h
> >  create mode 100644 include/hw/ipmi/npcm7xx_kcs.h
> >  create mode 100644 include/hw/misc/npcm7xx_pwm.h
> >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
> >  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
> >
> > --
> > 2.29.2.684.gfbc64c5ab5-goog
> >
>

--00000000000022fbbe05b636869d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Tl,dr: We&#39;ll remove the IPMI changes =
from the current patch set and refactor=C2=A0</div><div dir=3D"ltr">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 them in a separate patch set.</div><div dir=3D"=
ltr"><br></div><div>Thank you for your review! On high level, we are trying=
 to emulate the BMC</div><div>side of the IPMI protocol. So we cannot direc=
tly use the existing IPMI code.</div><div>However, they do have a lot in du=
plication as you pointed out. So we&#39;ll refactor</div><div>the existing =
IPMI code and update in a way that we only add the required</div><div>funct=
ionality.</div><div><br></div><div>As for the KCS module, the BMC side of t=
he protocol is the opposite direction</div><div>of the existing ipmi_kcs.c =
code which is on the host/CPU side. For example,</div><div>in READ_STATE th=
e CPU would read data while the BMC would write data.</div><div>So we can&#=
39;t directly use the same implementation. (They&#39;re different files in<=
/div><div>Linux either.) However, we can refactor it to re-use some of the =
common definitions.</div><div><br></div><div>We would like to remove the IP=
MI and KCS stuff from the current patch set.</div><div>We&#39;ll send the r=
efactored code in a separate=C2=A0patch set after addressing</div><div>your=
 concerns.</div><div><br></div><div>Thanks again for the review!</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec=
 10, 2020 at 7:04 PM Corey Minyard &lt;<a href=3D"mailto:minyard@acm.org" t=
arget=3D"_blank">minyard@acm.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Dec 10, 2020 at 05:51:49PM -0800, =
Hao Wu wrote:<br>
&gt; This patch series include a few more NPCM7XX devices including<br>
&gt; <br>
&gt; - Analog Digital Converter (ADC)<br>
&gt; - Pulse Width Modulation (PWM)<br>
&gt; - Keyboard Style Controller (KSC)<br>
&gt; <br>
&gt; To utilize these modules we also add two extra functionalities:<br>
&gt; <br>
&gt; 1. We modified the CLK module to generate clock values using qdev_cloc=
k.<br>
&gt;=C2=A0 =C2=A0 These clocks are used to determine various clocks in NPCM=
7XX devices.<br>
&gt; 2. We added support for emulating IPMI responder devices in BMC machin=
es,<br>
&gt;=C2=A0 =C2=A0 similar to the existing IPMI device support for CPU emula=
tion. This allows<br>
&gt;=C2=A0 =C2=A0 a qemu instance running BMC firmware to serve as an exter=
nal BMC for a qemu<br>
&gt;=C2=A0 =C2=A0 instance running server software. It utilizes the KCS mod=
ule we implemented.<br>
<br>
Looking at the IPMI changes, why didn&#39;t you just re-use the existing<br=
>
IPMI infrastructure?=C2=A0 ipmi_host.[ch] is basically a subset of ipmi.[ch=
],<br>
and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern with<br>
some names changed.=C2=A0 That kind of code duplication is not acceptable.<=
br>
Plus you copied my code and removed my copyrights, which is really<br>
not acceptable and illegal.<br>
<br>
I&#39;m not exactly sure why you needed you own KCS interface, either.=C2=
=A0 It<br>
looks like the interface is somewhat different in some ways, but<br>
integrating it into the current KCS code is probably a better choice if<br>
that can be done.<br>
<br>
-corey<br>
<br>
&gt; <br>
&gt; Hao Wu (7):<br>
&gt;=C2=A0 =C2=A0hw/misc: Add clock converter in NPCM7XX CLK module<br>
&gt;=C2=A0 =C2=A0hw/timer: Refactor NPCM7XX Timer to use CLK clock<br>
&gt;=C2=A0 =C2=A0hw/adc: Add an ADC module for NPCM7XX<br>
&gt;=C2=A0 =C2=A0hw/misc: Add a PWM module for NPCM7XX<br>
&gt;=C2=A0 =C2=A0hw/ipmi: Add an IPMI host interface<br>
&gt;=C2=A0 =C2=A0hw/ipmi: Add a KCS Module for NPCM7XX<br>
&gt;=C2=A0 =C2=A0hw/ipmi: Add an IPMI external host device<br>
&gt; <br>
&gt;=C2=A0 default-configs/devices/arm-softmmu.mak |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 318 ++++++++++<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 +-<br>
&gt;=C2=A0 hw/ipmi/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 hw/ipmi/ipmi_host.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++<br>
&gt;=C2=A0 hw/ipmi/ipmi_host_extern.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 435 +++++++++++++<br>
&gt;=C2=A0 hw/ipmi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 hw/ipmi/npcm7xx_kcs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 570 +++++++++++++++++<br>
&gt;=C2=A0 hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 795 +++++++++++++++++++++++-<br>
&gt;=C2=A0 hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 535 ++++++++++++++++<br>
&gt;=C2=A0 hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 25 +-<br>
&gt;=C2=A0 include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 72 +++<br>
&gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 include/hw/ipmi/ipmi_host.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 56 ++<br>
&gt;=C2=A0 include/hw/ipmi/ipmi_responder.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 66 ++<br>
&gt;=C2=A0 include/hw/ipmi/npcm7xx_kcs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 105 ++++<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 146 ++++-<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_pwm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 106 ++++<br>
&gt;=C2=A0 include/hw/timer/npcm7xx_timer.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 tests/qtest/npcm7xx_adc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 400 ++++++++++++<br>
&gt;=C2=A0 tests/qtest/npcm7xx_pwm-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 490 +++++++++++++++<br>
&gt;=C2=A0 25 files changed, 4221 insertions(+), 32 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/adc/npcm7xx_adc.c<br>
&gt;=C2=A0 create mode 100644 hw/ipmi/ipmi_host.c<br>
&gt;=C2=A0 create mode 100644 hw/ipmi/ipmi_host_extern.c<br>
&gt;=C2=A0 create mode 100644 hw/ipmi/npcm7xx_kcs.c<br>
&gt;=C2=A0 create mode 100644 hw/misc/npcm7xx_pwm.c<br>
&gt;=C2=A0 create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
&gt;=C2=A0 create mode 100644 include/hw/ipmi/ipmi_host.h<br>
&gt;=C2=A0 create mode 100644 include/hw/ipmi/ipmi_responder.h<br>
&gt;=C2=A0 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h<br>
&gt;=C2=A0 create mode 100644 include/hw/misc/npcm7xx_pwm.h<br>
&gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
&gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_pwm-test.c<br>
&gt; <br>
&gt; -- <br>
&gt; 2.29.2.684.gfbc64c5ab5-goog<br>
&gt; <br>
</blockquote></div></div>

--00000000000022fbbe05b636869d--

