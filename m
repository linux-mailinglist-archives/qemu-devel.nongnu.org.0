Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B172D8383
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:40:04 +0100 (CET)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsx9-00009R-Cz
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1knss1-0006fk-BK
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:34:45 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1knsrr-0002pg-3G
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:34:45 -0500
Received: by mail-lf1-x142.google.com with SMTP id o17so12924548lfg.4
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29wFNCgg7zBCThn7mDxPpLRT1zL2wltMDvVpEdjFNK0=;
 b=lQhAjyUjvl1FBokndXvIZ+7EYrvvceQTtmL0cSQYCZ2s/WlDGy8AjK37dimUznkxCZ
 RBvLFDqlzaj0/ToppHWMS8DxyDhHt3rC0rDTgqeDWUt3/B3zjoMHpINW3a/gXV/AwJ7F
 8b+tNOR0VhLueJQ3o+d9eEw9Y35Q8HUjRmYwBEHPD/TwpMVkZiCls2gyr9j+gHgrZHr0
 /sJEQDgfuxsZsFmDvQZw+sxkyuU7g/Pi50PbsdtTqIxAkD/HEuhdHn7wfZTdlXYfMzYr
 j8Me14TJsWzNwEIv8HGahfZd8xVBDCKRq26UwqsHA2B8PgQSI60X61ccvWLyd+wPFMYN
 UfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29wFNCgg7zBCThn7mDxPpLRT1zL2wltMDvVpEdjFNK0=;
 b=EcYrznlV6xxAR+7PpN882Cce6rCOkqvnS2zGSRB15D0LQtRsYr5IlbeJ8AHgjiRr1J
 XLfROmDwaoEi4FQR1qrK1EH3VvCa2mpssXH2EjiDelsNWP9FOuiuEajVDV/svCo1wcpB
 GIGVtVJCsInOCLKmSWXmC9QkpzVVWJImrMAzVUv85xjcvBngKHT3hPJpwNpmlNjYtyDq
 AEHJarL/Zp4I3uqevIMUbWsoY7NQwFeCriEZs5YR66e/vapDJ6KuXdMQH0s9oE07BDHp
 U+cTHum3B5sahX1Pq4Skhl/hBm3sTMiHOEp+/IePYH3fXnztVWLwCOn036+PWG9tUBBT
 1U/g==
X-Gm-Message-State: AOAM531hf1HWQNbxzi5c5mbyDXqTbazkAJcTe2byIKLrzVBn1dirze6P
 gXUdOYVGqjJmdP7TMFzE9ANuRdxWC2KV9xEjbcE8gw==
X-Google-Smtp-Source: ABdhPJzQyt1b1XOjtbtbMkqzSVM+eJxy3ifLi3IDSzRycD4lo3eh7153Evg2hbriQ9wGPH7KEkzAHi8yz6//Y0ck+KE=
X-Received: by 2002:a19:54c:: with SMTP id 73mr5512924lff.551.1607733271813;
 Fri, 11 Dec 2020 16:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20201211015156.2053372-1-wuhaotsh@google.com>
 <20201211030435.GI11017@minyard.net>
 <CAGcCb12UyiPoU=cPd3W3Mwj+jZHbWWESEPY-dhaSWXDqGdhM0w@mail.gmail.com>
 <20201212001634.GK11017@minyard.net>
 <CAFQmdRY9LLDHs9sFu=8bd3Os4v2N+LuYXeo0cH81q-6d+6F6TA@mail.gmail.com>
In-Reply-To: <CAFQmdRY9LLDHs9sFu=8bd3Os4v2N+LuYXeo0cH81q-6d+6F6TA@mail.gmail.com>
Date: Fri, 11 Dec 2020 16:34:20 -0800
Message-ID: <CAGcCb1089N4cmr5MpE1tFE40aSzHH35=41RSY4=YEVKFFLJPeg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Additional NPCM7xx devices and IPMI BMC emulation
 support
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: multipart/alternative; boundary="0000000000008fc09a05b6399245"
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x142.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, minyard@acm.org,
 Patrick Venture <venture@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--0000000000008fc09a05b6399245
Content-Type: text/plain; charset="UTF-8"

Thanks for the comments!

I've removed IPMI part from the patch sets. I'll send a separate patch sets
once the refactor is done. I'll also include Havard's documentation in it.

I haven't thought of a better name. We can update the name accordingly.

On Fri, Dec 11, 2020 at 4:26 PM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> On Fri, Dec 11, 2020 at 4:16 PM Corey Minyard <minyard@acm.org> wrote:
>
>> On Fri, Dec 11, 2020 at 12:56:07PM -0800, Hao Wu wrote:
>> > Tl,dr: We'll remove the IPMI changes from the current patch set and
>> > refactor
>> >           them in a separate patch set.
>> >
>> > Thank you for your review! On high level, we are trying to emulate the
>> BMC
>> > side of the IPMI protocol. So we cannot directly use the existing IPMI
>> code.
>> > However, they do have a lot in duplication as you pointed out. So we'll
>> > refactor
>> > the existing IPMI code and update in a way that we only add the required
>> > functionality.
>>
>> Ah, I didn't figure that out from what you posted.  So the idea is you
>> can create the BMC side of the system in one qemu session with your
>> changes and then you connect it to a host system running qemu with the
>> host side of the interface.
>>
>> The wire protocol is basically symmetric, but the command handling will
>> need to be separate.  So you probably want to split out the base
>> protocol from ipmi_bmc_extern into its own file and use that from your
>> own file, to avoid the duplication.
>>
>> You need to do proper ATTN handling on the BMC side.  And you will also
>> need ties into GPIOs and whatnot for doing the reset, NMI, etc.
>>
>> "ipmi_host" is probably not the best name.  At least to me that implied
>> the host side of the interface.  I'm not coming up with something I
>> really like, though.  Maybe "bmc_host"?  That's more descriptive, though
>> I'm sure a better name exists.  Then you could have "bmc_host_extern"
>> for the protocol.  If you come up with a better naming scheme, the
>> existing files can be renamed, too.
>>
>
> The naming is my fault.
>
> My thinking was that ipmi-host-extern is to the BMC what ipmi-bmc-extern
> is to the host. That is, the former represents the host as seen by the BMC,
> and the latter represents the BMC as seen by the host.
>
> I sent some docs to the list earlier this year, but sadly, I never got
> around to follow up. You can see the generated docs here:
>
> https://hskinnemoen.github.io/qemu/specs/ipmi.html
>
> Hao, perhaps you should include my documentation patches in your next IPMI
> series? If we come up with a better naming scheme for both sides, I can
> update the docs accordingly.
>
> Havard
>
>
>> Thanks,
>>
>> -corey
>>
>> >
>> > As for the KCS module, the BMC side of the protocol is the opposite
>> > direction
>> > of the existing ipmi_kcs.c code which is on the host/CPU side. For
>> example,
>> > in READ_STATE the CPU would read data while the BMC would write data.
>> > So we can't directly use the same implementation. (They're different
>> files
>> > in
>> > Linux either.) However, we can refactor it to re-use some of the common
>> > definitions.
>> >
>> > We would like to remove the IPMI and KCS stuff from the current patch
>> set.
>> > We'll send the refactored code in a separate patch set after addressing
>> > your concerns.
>> >
>> > Thanks again for the review!
>> >
>> > On Thu, Dec 10, 2020 at 7:04 PM Corey Minyard <minyard@acm.org> wrote:
>> >
>> > > On Thu, Dec 10, 2020 at 05:51:49PM -0800, Hao Wu wrote:
>> > > > This patch series include a few more NPCM7XX devices including
>> > > >
>> > > > - Analog Digital Converter (ADC)
>> > > > - Pulse Width Modulation (PWM)
>> > > > - Keyboard Style Controller (KSC)
>> > > >
>> > > > To utilize these modules we also add two extra functionalities:
>> > > >
>> > > > 1. We modified the CLK module to generate clock values using
>> qdev_clock.
>> > > >    These clocks are used to determine various clocks in NPCM7XX
>> devices.
>> > > > 2. We added support for emulating IPMI responder devices in BMC
>> machines,
>> > > >    similar to the existing IPMI device support for CPU emulation.
>> This
>> > > allows
>> > > >    a qemu instance running BMC firmware to serve as an external BMC
>> for
>> > > a qemu
>> > > >    instance running server software. It utilizes the KCS module we
>> > > implemented.
>> > >
>> > > Looking at the IPMI changes, why didn't you just re-use the existing
>> > > IPMI infrastructure?  ipmi_host.[ch] is basically a subset of
>> ipmi.[ch],
>> > > and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern with
>> > > some names changed.  That kind of code duplication is not acceptable.
>> > > Plus you copied my code and removed my copyrights, which is really
>> > > not acceptable and illegal.
>> > >
>> > > I'm not exactly sure why you needed you own KCS interface, either.  It
>> > > looks like the interface is somewhat different in some ways, but
>> > > integrating it into the current KCS code is probably a better choice
>> if
>> > > that can be done.
>> > >
>> > > -corey
>> > >
>> > > >
>> > > > Hao Wu (7):
>> > > >   hw/misc: Add clock converter in NPCM7XX CLK module
>> > > >   hw/timer: Refactor NPCM7XX Timer to use CLK clock
>> > > >   hw/adc: Add an ADC module for NPCM7XX
>> > > >   hw/misc: Add a PWM module for NPCM7XX
>> > > >   hw/ipmi: Add an IPMI host interface
>> > > >   hw/ipmi: Add a KCS Module for NPCM7XX
>> > > >   hw/ipmi: Add an IPMI external host device
>> > > >
>> > > >  default-configs/devices/arm-softmmu.mak |   2 +
>> > > >  docs/system/arm/nuvoton.rst             |   6 +-
>> > > >  hw/adc/meson.build                      |   1 +
>> > > >  hw/adc/npcm7xx_adc.c                    | 318 ++++++++++
>> > > >  hw/arm/npcm7xx.c                        |  65 +-
>> > > >  hw/ipmi/Kconfig                         |   5 +
>> > > >  hw/ipmi/ipmi_host.c                     |  40 ++
>> > > >  hw/ipmi/ipmi_host_extern.c              | 435 +++++++++++++
>> > > >  hw/ipmi/meson.build                     |   3 +
>> > > >  hw/ipmi/npcm7xx_kcs.c                   | 570 +++++++++++++++++
>> > > >  hw/misc/meson.build                     |   1 +
>> > > >  hw/misc/npcm7xx_clk.c                   | 795
>> +++++++++++++++++++++++-
>> > > >  hw/misc/npcm7xx_pwm.c                   | 535 ++++++++++++++++
>> > > >  hw/timer/npcm7xx_timer.c                |  25 +-
>> > > >  include/hw/adc/npcm7xx_adc.h            |  72 +++
>> > > >  include/hw/arm/npcm7xx.h                |   6 +
>> > > >  include/hw/ipmi/ipmi_host.h             |  56 ++
>> > > >  include/hw/ipmi/ipmi_responder.h        |  66 ++
>> > > >  include/hw/ipmi/npcm7xx_kcs.h           | 105 ++++
>> > > >  include/hw/misc/npcm7xx_clk.h           | 146 ++++-
>> > > >  include/hw/misc/npcm7xx_pwm.h           | 106 ++++
>> > > >  include/hw/timer/npcm7xx_timer.h        |   1 +
>> > > >  tests/qtest/meson.build                 |   4 +-
>> > > >  tests/qtest/npcm7xx_adc-test.c          | 400 ++++++++++++
>> > > >  tests/qtest/npcm7xx_pwm-test.c          | 490 +++++++++++++++
>> > > >  25 files changed, 4221 insertions(+), 32 deletions(-)
>> > > >  create mode 100644 hw/adc/npcm7xx_adc.c
>> > > >  create mode 100644 hw/ipmi/ipmi_host.c
>> > > >  create mode 100644 hw/ipmi/ipmi_host_extern.c
>> > > >  create mode 100644 hw/ipmi/npcm7xx_kcs.c
>> > > >  create mode 100644 hw/misc/npcm7xx_pwm.c
>> > > >  create mode 100644 include/hw/adc/npcm7xx_adc.h
>> > > >  create mode 100644 include/hw/ipmi/ipmi_host.h
>> > > >  create mode 100644 include/hw/ipmi/ipmi_responder.h
>> > > >  create mode 100644 include/hw/ipmi/npcm7xx_kcs.h
>> > > >  create mode 100644 include/hw/misc/npcm7xx_pwm.h
>> > > >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>> > > >  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
>> > > >
>> > > > --
>> > > > 2.29.2.684.gfbc64c5ab5-goog
>> > > >
>> > >
>>
>

--0000000000008fc09a05b6399245
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the comments!<div><br></div><div>I&#39;ve remov=
ed IPMI part from the patch sets. I&#39;ll send a separate patch sets once =
the refactor is done. I&#39;ll also include Havard&#39;s documentation in i=
t.</div><div><br></div><div>I haven&#39;t thought of a better name. We can =
update the name accordingly.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 11, 2020 at 4:26 PM Havard Sk=
innemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@google.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr">On Fri, Dec 11, 2020 at 4:16 PM Corey M=
inyard &lt;<a href=3D"mailto:minyard@acm.org" target=3D"_blank">minyard@acm=
.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Fri, Dec 11, 2020 at 12:56:07PM -0800, =
Hao Wu wrote:<br>
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
kinnemoen.github.io/qemu/specs/ipmi.html" target=3D"_blank">https://hskinne=
moen.github.io/qemu/specs/ipmi.html</a><br></div><div><br></div><div>Hao, p=
erhaps you should include my documentation patches in your next IPMI series=
? If we come up with a better naming scheme for both sides, I can update th=
e docs accordingly.</div><div><br></div><div>Havard</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
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
nyard@acm.org" target=3D"_blank">minyard@acm.org</a>&gt; wrote:<br>
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
</blockquote></div>

--0000000000008fc09a05b6399245--

