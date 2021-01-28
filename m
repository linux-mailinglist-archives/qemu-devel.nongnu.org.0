Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D3307A12
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:52:42 +0100 (CET)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59b7-0001TD-2T
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l59ZR-0000YJ-UF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:50:57 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l59ZP-0007Mg-Cb
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:50:57 -0500
Received: by mail-pl1-x636.google.com with SMTP id j21so3546935pls.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HKQX3kzv0mAjtnKKmE+hU7wGkXR4c1k2XKupeqcQ8k=;
 b=LiojoHEgBA6biRIbCzmhWOHQvoJed+ZOXga/9QcC1WhFdR5GgaY45hFlJyGIq7q/z4
 23H1o6xFrks4A6qblWooIpAjSL23iUzTmAuNCAm2ffLnczX0KukA5Y2uOA5ZuiS6lkRq
 X7UmQKqJOlJFlQgjkaAYB47moNeck0GUNEoj/gXbmQITVM4aHjr/FMlCYHbpUxejFLqH
 lwR5rpgwGc31LpF63g2uIfwi/MQMOXoZ7sk1qQZ3dP1bZ66PJJQ+UI1CeCapteY9/u7/
 eBz9C1vH4y/SHts7Q+hZ6iw/1QE36v8Bsjwm/lIglPp21i84QsA+mCQ2j0RETkVvR/tL
 4GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HKQX3kzv0mAjtnKKmE+hU7wGkXR4c1k2XKupeqcQ8k=;
 b=KAvSO/+AgUcvJebqTsJG86cTZsoFOwcRwh3jVqY5RUcDstXBcAWp/gtoxIqk55vBLJ
 s2jBJUG3dwiaqdaS5xhES9+S20Y/NHpKx/8KD6wPPUUc4JJoP3Jankg1IRWH7On18KYt
 8M/qtJ5ow+6QdHwdshvSccuyXmEQogdB6yz3VTnnvQ0F+vXQ/0zT6M9orSP7jH8NH4b6
 oAzedGRf/VHxGqvFhGpFeHwgQIef5XrwmSmybjNmUfKAdBjO85ATua3cvL3ivNM+oAOk
 hOsfEtvkZQvZSZ3jmkbo0tvKdRaLxQwkH3sKlPqLVKH3oqs2rJaIXitX2g8ipBEhEKQb
 gb5A==
X-Gm-Message-State: AOAM531qtlqZw1LSA+dc7v3LQL++uVJDUOv8Dap4btjgmgpX8ppP+mIb
 0Cn5lhPpyUIAGc+/ShFw0zvmCLXXaRKCXIoq8wE=
X-Google-Smtp-Source: ABdhPJx5IIKvX5saSUJCtsgALn7KJ/+K8dAHPFjHAOQ2PG4O8Ul5SvJYZGDtVjGuhNuUG7ENIwlvsgxbaAYn04qUPD4=
X-Received: by 2002:a17:90a:578a:: with SMTP id g10mr42168pji.74.1611849053873; 
 Thu, 28 Jan 2021 07:50:53 -0800 (PST)
MIME-Version: 1.0
References: <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
In-Reply-To: <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 28 Jan 2021 21:20:31 +0530
Message-ID: <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000049a8a905b9f7da32"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x636.google.com
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

--00000000000049a8a905b9f7da32
Content-Type: text/plain; charset="UTF-8"

(Gerd, I wasn't able to get gmail to quote your email, so I have just copy
pasted the relavant parts.)

> Yes.  net_conf is common config (backend, mac address, maybe more) for
> network devices.  For sound devices that would audiodev (link the device
> to a backend which then handles alsa/pulse/jack/oss/sdl/whatever).

Ah I see, so the net_conf corresponds to audiodev? I thought it would
correspond
to `virtio_snd_conf`. So as alex said, `virtio_snd_conf` is the front end
configuration.

> Configuration can be done either using device properties, or by having
> different devices.  Using device properties is probably the easier way
> to go.  An example for the latter are the qemu hda codecs.  We have
> three different devices:

>  (1) hda-output: playback-only, offering a virtual line-out.
>  (2) hda-duplex: record/playback, offering line-in and line-out.
>  (3) hda-micro:  record/playback, offering microphone and speaker.

> The difference between (2) and (3) is just the jack labeling, otherwise
> the behavior is 100% identical (and they share the emulation code of
> course).  But some windows VoIP apps didn't like the line-in and
> complained about a missing microphone, so we added that ...

>> The thing is I do not understand `net` devices all that well so I get a
bit
>> confused with
>> what is specific to a net device and what should I actually be worried
>> about :)

> The only thing really required is the audiodev property.  Everything
> else can be hard-coded initially, and once the basics are working
> refined (like adding properties for jack labels, ...).

So in the realize function I set up the audiodev, right? Also in that case
why the difference between the net and sound devices? In the net
device we set up the common config in net_conf. Does the net_conf
somehow later sets up NetDev too?

And what is a NetClientState? Is the NetClient the emulated guest? This
confuses me a lot. I can't understand what will be the parellel audio device
property.

Also I can't seem to find where we parse the command line options passed to
qemu.
The code structure is a bit different from what I had expected. In
virtio_net_device_realize
we set duplex to half or full depending on the value of the
net_conf.duplex_str. But I
couldn't find where we actually set it.

cc Alex

--
Shreyansh

--00000000000049a8a905b9f7da32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(Gerd, I wasn&#39;t able to get gmail to quote your e=
mail, so I have just copy pasted the relavant parts.)</div><div><br></div><=
div>&gt; Yes.=C2=A0 net_conf is common config (backend, mac address, maybe =
more) for<br>
&gt; network devices.=C2=A0 For sound devices that would audiodev (link the=
 device<br>
&gt; to a backend which then handles alsa/pulse/jack/oss/sdl/whatever).</di=
v><div><br></div><div>Ah I see, so the net_conf corresponds to audiodev? I =
thought it would correspond</div><div>to `virtio_snd_conf`. So as alex said=
, `virtio_snd_conf` is the front end configuration.<br></div><div><br>
&gt; Configuration can be done either using device properties, or by having=
<br>
&gt; different devices.=C2=A0 Using device properties is probably the easie=
r way<br>
&gt; to go.=C2=A0 An example for the latter are the qemu hda codecs.=C2=A0 =
We have<br>
&gt; three different devices:<br>
<br>
&gt;=C2=A0 (1) hda-output: playback-only, offering a virtual line-out.<br>
&gt;=C2=A0 (2) hda-duplex: record/playback, offering line-in and line-out.<=
br>
&gt;=C2=A0 (3) hda-micro:=C2=A0 record/playback, offering microphone and sp=
eaker.<br>
<br>
&gt; The difference between (2) and (3) is just the jack labeling, otherwis=
e<br>
&gt; the behavior is 100% identical (and they share the emulation code of<b=
r>
&gt; course).=C2=A0 But some windows VoIP apps didn&#39;t like the line-in =
and<br>
&gt; complained about a missing microphone, so we added that ...<span class=
=3D"gmail-im"></span></div><div><span class=3D"gmail-im"><br></span></div><=
div><span class=3D"gmail-im"><span class=3D"gmail-im">&gt;&gt; The thing is=
 I do not understand `net` devices all that well so I get a bit<br>
&gt;&gt; confused with<br>
&gt;&gt; what is specific to a net device and what should I actually be wor=
ried<br>
&gt;&gt; about :)<br>
<br></span>
&gt; The only thing really required is the audiodev property.=C2=A0 Everyth=
ing<br>
&gt; else can be hard-coded initially, and once the basics are working<br>
&gt; refined (like adding properties for jack labels, ...).</span></div><di=
v><span class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-im">S=
o in the realize function I set up the audiodev, right? Also in that case</=
span></div><div><span class=3D"gmail-im">why the difference between the net=
 and sound devices? In the net</span></div><div><span class=3D"gmail-im">de=
vice we set up the common config in net_conf. Does the net_conf</span></div=
><div><span class=3D"gmail-im">somehow later sets up NetDev too? <br></span=
></div><div><span class=3D"gmail-im"><br></span></div><div><span class=3D"g=
mail-im">And what is a NetClientState? Is the NetClient the emulated guest?=
 This</span></div><div><span class=3D"gmail-im">confuses me a lot. I can&#3=
9;t understand what will be the parellel audio device</span></div><div><spa=
n class=3D"gmail-im">property.<br></span></div><div><span class=3D"gmail-im=
"><span class=3D"gmail-im"></span></span></div><div><span class=3D"gmail-im=
"><span class=3D"gmail-im"><br></span></span></div><div><span class=3D"gmai=
l-im"><span class=3D"gmail-im">Also I can&#39;t seem to find where we parse=
 the command line options passed to qemu.</span></span></div><div><span cla=
ss=3D"gmail-im"><span class=3D"gmail-im">The code structure is a bit differ=
ent from what I had expected. In virtio_net_device_realize</span></span></d=
iv><div><span class=3D"gmail-im"><span class=3D"gmail-im">we set duplex to =
half or full depending on the value of the net_conf.duplex_str. But I</span=
></span></div><div><span class=3D"gmail-im"><span class=3D"gmail-im">couldn=
&#39;t find where we actually set it.<br></span></span></div><div><span cla=
ss=3D"gmail-im"><span class=3D"gmail-im"><br></span></span></div><div><span=
 class=3D"gmail-im"><span class=3D"gmail-im">cc Alex</span></span></div><di=
v><span class=3D"gmail-im"><span class=3D"gmail-im"><br></span></span></div=
><div><span class=3D"gmail-im"><span class=3D"gmail-im">--</span></span></d=
iv><div><span class=3D"gmail-im"><span class=3D"gmail-im">Shreyansh<br></sp=
an></span></div><div></div></div>

--00000000000049a8a905b9f7da32--

