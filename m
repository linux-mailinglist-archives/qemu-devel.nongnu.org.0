Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD529331892
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:29:33 +0100 (CET)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJMVQ-0001Vh-Ox
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lJMU3-0000xW-Lv; Mon, 08 Mar 2021 15:28:07 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:37118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lJMU1-00077D-No; Mon, 08 Mar 2021 15:28:07 -0500
Received: by mail-io1-xd2b.google.com with SMTP id p16so11440281ioj.4;
 Mon, 08 Mar 2021 12:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbzOIo4mZsywshKUpqSH4IKpc8WPw3tWkeMAsFLoUVo=;
 b=CEp9dS1RRyWsnHtZ5POzVJLSus+K7bPIa3CaPGFzf9mMvKQedKzQCLqzSJqnNK86bo
 glE6mPohOqHZGBUt4DV1STeVW1GAuh1qSEreAvfOv11POuJkVIgVLrxcFxhL8zP0E51o
 aDObDTRfrwmlRuEhoMsO4Jl9KhWTLdiuH1gn2/Gium0C7Me5qzr0e8822gPeyhVZcUEA
 63PHm2tayMX1xKrBVdvCQsBnpSLRozIsIEl+hxB3J7xZSmAY21Zx3/kjTmvMu1mV7FQ5
 +lhA9iQdt8vLe+x2KfDH83pYGWNZkYyPToDjz6HGQqfbGNwtwEf8Se+nCrQTfJqf1ILy
 ikxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbzOIo4mZsywshKUpqSH4IKpc8WPw3tWkeMAsFLoUVo=;
 b=D5d6ejns7kj+kxsKQgaVXBIudun8X27o51jL1/FaK+c3EV8CxUVVllTAFmcSOSDhRD
 eQlbdTC09Jt0G8EzwKpANC8w1Evt0psXOecxUqeMyHgVqnC4feM6jsv5fdFPwrxKcDEM
 7+z4PP75Bs5gblIJ1juef6s/O1cOBSJoYUYL7IYP2yEve97F0lmG8TpXWqx3mVS/YOFt
 bIOBQCFuyTXl7et0EQnFIU0bU6J0q4/ns92KzqdkkecdB8Tj5fEGhkdjF/ZpUBEGFXDN
 KjOLeecgdTWULFG/VhCnDwAsTnpPjlnclEX4GC87yCSX1uNbM39Gs2zU/mydAuMIiV6p
 HF8g==
X-Gm-Message-State: AOAM530XdAusl1pgAP9Rcpi43XlnjEH18d3twJU/5eexTlApPTtoWwH6
 RTU8/aF2/9skx7PeXpKpef4R7K1MEckYqGhOwSg=
X-Google-Smtp-Source: ABdhPJz/Ou/06iGOn2+SuOEDVU3XrR9D+4UENfY4zXuvk99fCgcq1gMCu5EtT96SpYI9oZ7LONZukGGNF6bDJTW0sIc=
X-Received: by 2002:a05:6602:2102:: with SMTP id
 x2mr21077380iox.83.1615235283443; 
 Mon, 08 Mar 2021 12:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-5-nieklinnenbank@gmail.com>
 <CAKJDGDawHKo0=q_psWrSOGVXvDf+QjjM20E29bdbogNfBTUsXg@mail.gmail.com>
 <0c4868bb-374e-ec77-a7cd-4ae901e1e684@redhat.com>
In-Reply-To: <0c4868bb-374e-ec77-a7cd-4ae901e1e684@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 8 Mar 2021 21:27:52 +0100
Message-ID: <CAPan3WoQZQGV6nB-FT=bTNTsM46eeQpCNNFU975a4to6ed0trw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] tests/acceptance: update sunxi kernel from armbian
 to 5.10.16
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004c629d05bd0c4523"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>, qemu-devel <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004c629d05bd0c4523
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe, Willian,

Thanks for reviewing!

On Mon, Mar 8, 2021 at 8:50 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> On 3/5/21 4:04 PM, Willian Rampazzo wrote:
> > On Thu, Mar 4, 2021 at 5:45 PM Niek Linnenbank <nieklinnenbank@gmail.co=
m>
> wrote:
> >>
> >> The linux kernel 4.20.7 binary for sunxi has been removed from
> apt.armbian.com:
> >>
> >>   $ ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes
> avocado --show=3Dapp,console run -t machine:orangepi-pc
> tests/acceptance/boot_linux_console.py
> >>   Fetching asset from
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
> >>   ...
> >>   (1/6)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi=
:
> >>     CANCEL: Missing asset
> https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-su=
nxi_5.75_armhf.deb
> (0.55 s)
> >>
> >> This commit updates the sunxi kernel to 5.10.16 for the acceptance
> >> tests of the orangepi-pc and cubieboard machines.
> >>
> >> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> >> ---
> >>  tests/acceptance/boot_linux_console.py | 40 +++++++++++++------------=
-
> >>  tests/acceptance/replay_kernel.py      |  8 +++---
> >>  2 files changed, 24 insertions(+), 24 deletions(-)
> >>
> >
> > I think some devs will not like it,
> Maybe you refer to my previous NACKs regarding similar changes in
> integration tests. Niek is the author of the test and the maintainer
> of the machine, so if he is OK to stop testing the 4.20.7 kernels
> and test the 5.10.16 from now on, I won't object.
>

For me the 4.20.7 kernel would have been OK if it was still available. With
that version removed,
I looked at what is now available on https://apt.armbian.com/pool/main/l/.
There are quite a lot of packaged kernels there
and 5.10.16 seemed to me a good balance of running newer kernel code with a
version that will hopefully stay around for a while.


>
> > but, for me, it is fine as we
> > don't have the old kernel available anymore:
> >
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> >
>
> Thanks, will add your reviewed-by tag.

Regards,
Niek

--=20
Niek Linnenbank

--0000000000004c629d05bd0c4523
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe, Willian,<br></div><div><br><=
/div><div>Thanks for reviewing!<br></div><div><br></div><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 8:50 A=
M Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">phil=
md@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 3/5/21 4:04 PM, Willian Rampazzo wrote:<br>
&gt; On Thu, Mar 4, 2021 at 5:45 PM Niek Linnenbank &lt;<a href=3D"mailto:n=
ieklinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; The linux kernel 4.20.7 binary for sunxi has been removed from <a =
href=3D"http://apt.armbian.com" rel=3D"noreferrer" target=3D"_blank">apt.ar=
mbian.com</a>:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0$ ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_S=
TORAGE=3Dyes avocado --show=3Dapp,console run -t machine:orangepi-pc tests/=
acceptance/boot_linux_console.py<br>
&gt;&gt;=C2=A0 =C2=A0Fetching asset from tests/acceptance/boot_linux_consol=
e.py:BootLinuxConsole.test_arm_orangepi<br>
&gt;&gt;=C2=A0 =C2=A0...<br>
&gt;&gt;=C2=A0 =C2=A0(1/6) tests/acceptance/boot_linux_console.py:BootLinux=
Console.test_arm_orangepi:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0CANCEL: Missing asset <a href=3D"https://apt.ar=
mbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.d=
eb" rel=3D"noreferrer" target=3D"_blank">https://apt.armbian.com/pool/main/=
l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb</a> (0.55 s)<br>
&gt;&gt;<br>
&gt;&gt; This commit updates the sunxi kernel to 5.10.16 for the acceptance=
<br>
&gt;&gt; tests of the orangepi-pc and cubieboard machines.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenban=
k@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 40 +++++++++++++---=
----------<br>
&gt;&gt;=C2=A0 tests/acceptance/replay_kernel.py=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 8 +++---<br>
&gt;&gt;=C2=A0 2 files changed, 24 insertions(+), 24 deletions(-)<br>
&gt;&gt;<br>
&gt; <br>
&gt; I think some devs will not like it,<br>
Maybe you refer to my previous NACKs regarding similar changes in<br>
integration tests. Niek is the author of the test and the maintainer<br>
of the machine, so if he is OK to stop testing the 4.20.7 kernels<br>
and test the 5.10.16 from now on, I won&#39;t object.<br></blockquote><div>=
<br></div><div>For me the 4.20.7 kernel would have been OK if it was still =
available. With that version removed,</div><div>I looked at what is now ava=
ilable on <a href=3D"https://apt.armbian.com/pool/main/l/">https://apt.armb=
ian.com/pool/main/l/</a>. There are quite a lot of packaged kernels there</=
div><div>and 5.10.16 seemed to me a good balance of running newer kernel co=
de with a version that will hopefully stay around for a while.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; but, for me, it is fine as we<br>
&gt; don&#39;t have the old kernel available anymore:<br>
&gt; <br>
&gt; Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@redhat.co=
m" target=3D"_blank">willianr@redhat.com</a>&gt;<br>
&gt; <br>
<br>
</blockquote></div><div>Thanks, will add your reviewed-by tag.</div><div><b=
r></div><div>Regards,</div><div>Niek<br></div><div><br>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br>=
</div></div></div></div></div>

--0000000000004c629d05bd0c4523--

