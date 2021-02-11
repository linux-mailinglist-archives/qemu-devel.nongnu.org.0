Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC6318472
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 06:02:26 +0100 (CET)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA47T-0001Wx-7R
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 00:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lA44j-0000Ti-Ps
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:59:35 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lA44g-00055K-N3
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:59:33 -0500
Received: by mail-pj1-x1035.google.com with SMTP id z9so2727325pjl.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 20:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0DJEGujP//6t2G4coxk++ZQCpff4e2SG2Rvn/K9fLQs=;
 b=TA/3e+5WE9OExz5mTlt6vnd9qTUr+Eo5yIGcXyPwk8tNQIA8AjfuKJCzaT5aKVHHFU
 B3YxMql8S4STwAHLy+VBd5lxtufUzBXn8hoUvbw67G7bq7k/Kq50s91hGoqNdYGQ57dv
 ZlHqF78ayt5GVYPQuxJ5oSclNqAXexFTg7n2BOCr2LYlysWhrRilss0/auEqvA/NdkcR
 xFwnrv3pYZzqs8D1xNbuhunK6Hz3lf0MtV9C2GG6DKPM7kZw2Yf8iivo4D4ZdTtPYkT3
 HuyD8KMmUcPKMrEMSWN6BPG7Ym0gy826VHLDDN+VI7rfTFisHB/0e8BegXaO6bo+6O8k
 7GVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0DJEGujP//6t2G4coxk++ZQCpff4e2SG2Rvn/K9fLQs=;
 b=EiP0P9jNsmy15ohku2XGwxvrwFTVTHpeIXaBiOtwDaPWP2Ayq7Pmfiu984ZfvLEBJF
 TcOJdOWAoGA4BzvpJ3ilo/jnxWsJIl6rCE3PgPwlVdz8MzEzUFVTJ51T9X43XWPKppEM
 5VKfwYj9jspmpuiXrjwpclemWnk6tFh/e06/AYMn8gZCCwMz9ihPErh1ULgMER0XmXU6
 HKqTAebKfDwqI3cJ9dPtCH+Byx0IbpGB2shkwEAqRGcBmYPG/JjCRe5YmxfKk34TZf98
 q6EMlLpwDZk8xkrCo8Q+H11Fkah6aTiU40FPueFjXLr3p6CD/5Cs7hamLrNciasg+mKy
 dR3g==
X-Gm-Message-State: AOAM530UUqPMxMw+BuoUOn4c2Jrl99ZjqJm0e/fkrBOhA5nPF7Fp7l3s
 fNUEHp5My1P93ch/9uCq1R9PuyM7x+DiM2vOabc=
X-Google-Smtp-Source: ABdhPJx/EZxz9VPwsN3EZov0Nbhy0q14jC2aBdm0QW8VlT4/6/b2gQmOF6rT+S+F6lWs/fmv3d7n2k6HRVu5oFJEbVw=
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id
 o1-20020a1709026b01b02900dad2952582mr6236156plk.14.1613019568259; Wed, 10 Feb
 2021 20:59:28 -0800 (PST)
MIME-Version: 1.0
References: <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
 <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
In-Reply-To: <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 11 Feb 2021 10:29:17 +0530
Message-ID: <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000061c5b405bb08621b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000061c5b405bb08621b
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Jan 2021 at 23:04, Shreyansh Chouhan <
chouhan.shreyansh2702@gmail.com> wrote:

> I think I will give it a quick look :P
>
This certainly wasn't quick I admit.

> Thanks a lot!
> --
> Shreyansh
>
> Hey! I hope you people are doing fine. :)
So colleges reopened and I was a bit busy for the past 2 weeks. Although I
did get to work on this
on weekends.

So about the audiodev setup, I checked the source code on how it is setup,
and I found out I
did not really have to do a lot for that. QEMU already registers the
audiodev passed on command
line and later makes it to an audiostate, and adds it to the list of
audiostates. And when the device
option is parsed, all its properties are set via the visitors iirc. So all
I had to do was make a new device
type, define a QEMUSoundCard property and register it, and this should be
enough to set the audio state for the QEMUSoundCard in this
new device. Do correct me if I am wrong here. (audiostates in turn contain
the audiodev)

I have some code written, but it is a bit incomplete and I would like to
complete at least the initialization
part before sending in patches for review. I wanted to ask some questions
(again :P) regarding a few things.

I read the source code for the `gus` sound device. (gus.c) And set up the
audiosettings and SWVoiceOut
from there. Here is my first question, I feel as if SWVoiceOut should be
available per stream. So the
`VirtIOSound` device would have a list of `SWVoiceOut`?

Secondly I saw in the `ac97.c` source, (which is a PCI sound device,) a lot
of PCIDev related set up in
the realize function, but they were not present in the `virtio-net.c`
source. Do I need them? (`ac97.c` set
up PCI_COMMAND, PCI_STATUS, PCI_BASE_ADDRESS and similar things in PCIDev.
For now the pci
setup in `virtio-snd-pci.c` basically mimics `virtio-net-pci.c` which uses
a `VirtIOPCIProxy` obj.)

Thirdly, the properties are registered at two different places, once in the
`virtio-net.c` source and once
in the `virtio-net-pci.c` source. I understand the the ones in
`virito-net.c`/`virtio-snd.c` they are the device
properties, as in the configurations we can set for the device and other,
well, properties. But what
exactly are the properties defined in the `virtio-net-pci.c` source file? I
have a vague idea of
what they are, but I can't exactly put my finger on it. It's almost as if
`virtio-net` and `virito-net-pci`
are two different devices each with thier own properties, and the
virtio-net-pci helps communication
between virtio-net and QEMU guest. It registers using the same `type_init`
macro, and that macro
registers modules which can later be initialized by QEMU if I am not wrong.
Since I didn't get a lot
of time I was not able to really dig into the PCI code, and taking a look
at it might make things clearer,
but once I started writing this mail, I thought I could ask this too.

Since there can be more than on streams and more than one jacks, we need to
have a list of configurations
for them, and since they should be index adressable, should I use an array
for them? When I was reading the
source I did not come across a QEMU list structure with indexed adressing.
If there is one please let me know.

Finally, I do understand what the pcm streams are, and I have been able to
set them up with hardcoded
initial configs (modulo the hda part). But I do not understand what exactly
are `jacks` and what should I do to set them up.
Which source file should I look at for this? I came across a few jack
related structs, but didn't see
a device using them. (I did not search for it as vigorously, I only tried
grepping in `hw/audio` and the
only results were from `intel-hda-defs`. They were comments on enums. Again
since I was writing
this mail I thought I should ask it here too.)

Regards,
Shreyansh Chouhan

--00000000000061c5b405bb08621b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 28 Jan 2021 at 23:04, Shreyan=
sh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com" target=3D=
"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div>I think I will give it a quick look :P <br></div></div></div>=
</blockquote><div>This certainly wasn&#39;t quick I admit.<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div></div><div>Thanks a lot!</div><div>--</div><div>Shreyansh<=
br></div><div> <br></div></div></div></blockquote><div>Hey! I hope you peop=
le are doing fine. :)</div><div>So colleges reopened and I was a bit busy f=
or the past 2 weeks. Although I did get to work on this</div><div>on weeken=
ds.</div><div><br></div><div>So about the audiodev setup, I checked the sou=
rce code on how it is setup, and I found out I</div><div>did not really hav=
e to do a lot for that. QEMU already registers the audiodev passed on comma=
nd</div><div>line and later makes it to an audiostate, and adds it to the l=
ist of audiostates. And when the device</div><div>option is parsed, all its=
 properties are set via the visitors iirc. So all I had to do was make a ne=
w device</div><div>type, define a QEMUSoundCard property and register it, a=
nd this should be enough to set the audio state for the QEMUSoundCard in th=
is</div><div>new device. Do correct me if I am wrong here. (audiostates in =
turn contain the audiodev)<br></div><div><br></div><div>I have some code wr=
itten, but it is a bit incomplete and I would like to complete at least the=
 initialization</div><div>part before sending in patches for review. I want=
ed to ask some questions (again :P) regarding a few things.</div><div><br><=
/div><div>I read the source code for the `gus` sound device. (gus.c) And se=
t up the audiosettings and SWVoiceOut</div><div>from there. Here is my firs=
t question, I feel as if SWVoiceOut should be available per stream. So the<=
/div><div>`VirtIOSound` device would have a list of `SWVoiceOut`?</div><div=
><br></div><div>Secondly I saw in the `ac97.c` source, (which is a PCI soun=
d device,) a lot of PCIDev related set up in</div><div>the realize function=
, but they were not present in the `virtio-net.c` source. Do I need them? (=
`ac97.c` set</div><div>up PCI_COMMAND, PCI_STATUS, PCI_BASE_ADDRESS and sim=
ilar things in PCIDev. For now the pci</div><div>setup in `virtio-snd-pci.c=
` basically mimics `virtio-net-pci.c` which uses a `VirtIOPCIProxy` obj.)</=
div><div><br></div><div>Thirdly, the properties are registered at two diffe=
rent places, once in the `virtio-net.c` source and once</div><div>in the `v=
irtio-net-pci.c` source. I understand the the ones in `virito-net.c`/`virti=
o-snd.c` they are the device</div><div>properties, as in the configurations=
 we can set for the device and other, well, properties. But what</div><div>=
exactly are the properties defined in the `virtio-net-pci.c` source file? I=
 have a vague idea of</div><div>what they are, but I can&#39;t exactly put =
my finger on it. It&#39;s almost as if `virtio-net` and `virito-net-pci`</d=
iv><div>are two different devices each with thier own properties, and the v=
irtio-net-pci helps communication</div><div>between virtio-net and QEMU gue=
st. It registers using the same `type_init` macro, and that macro</div><div=
>registers modules which can later be initialized by QEMU if I am not wrong=
. Since I didn&#39;t get a lot</div><div>of time I was not able to really d=
ig into the PCI code, and taking a look at it might make things clearer,</d=
iv><div>but once I started writing this mail, I thought I could ask this to=
o.</div><div><br></div><div>Since there can be more than on streams and mor=
e than one jacks, we need to have a list of configurations</div><div>for th=
em, and since they should be index adressable, should I use an array for th=
em? When I was reading the</div><div>source I did not come across a QEMU li=
st structure with indexed adressing. If there is one please let me know.</d=
iv><div><br></div><div>Finally, I do understand what the pcm streams are, a=
nd I have been able to set them up with hardcoded</div><div>initial configs=
 (modulo the hda part). But I do not understand what exactly are `jacks` an=
d what should I do to set them up.</div><div>Which source file should I loo=
k at for this? I came across a few jack related structs, but didn&#39;t see=
</div><div>a device using them. (I did not search for it as vigorously, I o=
nly tried grepping in `hw/audio` and the</div><div>only results were from `=
intel-hda-defs`. They were comments on enums. Again since I was writing</di=
v><div>this mail I thought I should ask it here too.)<br></div><div><br></d=
iv><div>Regards,</div><div>Shreyansh Chouhan<br></div></div>
</div>

--00000000000061c5b405bb08621b--

