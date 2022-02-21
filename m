Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58E4BE11A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:53:00 +0100 (CET)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCrr-0007cd-TL
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:52:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nMCmm-0002Mj-5v
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:47:44 -0500
Received: from [2a00:1450:4864:20::22f] (port=41545
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1nMCmj-0003Kk-Tf
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:47:43 -0500
Received: by mail-lj1-x22f.google.com with SMTP id t14so15748469ljh.8
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5QM+nSeKnZtzxLKv1nLff8w+wq2/D3bYi39vO7mfeEE=;
 b=U4g2s51hi3NqzY32mgv4bsc8lCg2WKZ+IuI7rwrbe7MV9sVoVNZt6V1aFwtgf9R14d
 nGE6yNpxgQnlv/vI9vbG4C5MeWhNM6EUVBQVQ9e7Hj8Sblsi+LoCJSJlED0y17KK7vLB
 47K5uXlNETkq0S/SSa9D7pJ1mjCvGRApkd4D5l7VqQbj7MvzsgK5StxdJ3ThMDTbafG3
 ic6/7K1fTt/Qwp1KLBYSALP1sl/sVD7/Zajq/71KGsAtdMD6AoQp/feaY/OCzSX6jmsL
 c3kH2Y31frX70NFL0AzqX1NK07tCDBizZ/ShhiqbAYCpBV3bgDpbc5/dwXSA64+L/0ku
 8ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5QM+nSeKnZtzxLKv1nLff8w+wq2/D3bYi39vO7mfeEE=;
 b=dWufPqDMM4/1P44G8Uwgsk37SPqmrOCap8wDUadQEcATQnVZondHaraeAbVN4cjaZj
 M4dkew/kTJYLFaow9i7W9tisM3Glgclgbs3Ilt/ThBB2ppI4uWWfrd4NbtWIFSocMnhU
 e06b2DKmLuY2mqIEprP0IFAdnPOmKXjepGnqxT9hyLrUbWJnm/uguGj42TfG9DKNKzGb
 M+boaPGEfnvXgyp3fUki7LB20TqcJEWcVWyRW2OPxtUXurlOODt4XMjKLoutkttODEKz
 yAUKTb1SoT0ILWv7nWfpOwa1IX6yDW//3xss4WQqaWDkhvqVZZQ6HTZ1kuIz/i43L7QV
 puZQ==
X-Gm-Message-State: AOAM5300MrqCvtWgj4k7DeuufVTkMLJWH2mI+Re9Ilxun8CeTHKz2JQS
 WJPxRM4f6J9DrVIMNIh2HwH5E88xbzQjcwbAVE67PA==
X-Google-Smtp-Source: ABdhPJyuvPYAFjnvGmuMX9nhMj4PG8ImHwAfMJiZNfwoZbmLcyCFb67IKhOj7IVObV+HqWBZKrGYmVpr/vHRsXa4b+U=
X-Received: by 2002:a2e:908f:0:b0:246:3e31:a80e with SMTP id
 l15-20020a2e908f000000b002463e31a80emr4773984ljg.23.1645465658763; Mon, 21
 Feb 2022 09:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
 <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
 <CAFEAcA_OfpMLzG=eUuzw0O_V_cgb57=XADciyfiF7U1mK0FzxQ@mail.gmail.com>
 <CAFtMCFUbBhXMxtc7RN+3OhDtckB+x-HXWbWcmh8AyncnriNFxQ@mail.gmail.com>
 <CAFEAcA9HckDH_7s5fpnHOBFQBi-fDfnhcrJ0Y9-=uDtj0bwuoQ@mail.gmail.com>
 <fff08204-2cd4-0f35-b23d-85a0eeb3ffd2@amsat.org>
In-Reply-To: <fff08204-2cd4-0f35-b23d-85a0eeb3ffd2@amsat.org>
From: Chris Rauer <crauer@google.com>
Date: Mon, 21 Feb 2022 09:47:27 -0800
Message-ID: <CAFtMCFWivLhcVD4nPJov=nQb=sOXTtxJ-WeWz91nhtLpJL8fUA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com, 
 Patrick Venture <venture@google.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, 
 qemu-arm@nongnu.org, ani@anisinha.ca, imammedo@redhat.com, 
 Enrico Weigelt <info@metux.net>
Content-Type: multipart/alternative; boundary="000000000000157c8205d88ad401"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=crauer@google.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000157c8205d88ad401
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phil,

> What about using virtio-gpio & bitbang I2C?
>
> - virtio-gpio
> https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@metux.net/
>
> - bitbang I2C already in: hw/i2c/bitbang_i2c.c
Sorry for the delay.

That looks like it might be doable with a bit more work creating the ACPI
entries for the bitbang I2C.  This definitely seems more appropriate on the
ARM_VIRT platform instead of putting a specific controller in.

For my uses, I will have to stick with the designware controller since it
matches the system I'm emulating a little more closely.  We can hold back
the designware stuff until another SoC platform is interested in using this
controller (since it seems like it is a common one).  Hopefully someone
will find another use for the controller patches someday.

Thanks again for looking at our patches.

-Chris


On Wed, Jan 26, 2022 at 3:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> +Enrico Weigelt
>
> On 26/1/22 19:03, Peter Maydell wrote:
> > On Wed, 26 Jan 2022 at 17:12, Chris Rauer <crauer@google.com> wrote:
> >>
> >>> I need to see a pretty strong justification for why we should be
> >>> adding new kinds of devices to the virt machine,
> >>
> >> The designware i2c controller is a very common controller on many
> >>   ARM SoCs.  It has device tree bindings and ACPI bindings which
> >> makes it ideal for this platform.
> >
> > No, I mean, why do we need an i2c controller on the virt
> > board at all ?
> >
> >>> Forgot to mention, but my prefered approach for providing
> >>> an i2c controller on the virt board would be to have a
> >>> PCI i2c controller: that way users who do need it can plug it
> >>> in with a -device command line option, and users who don't
> >>> need it never have to worry about it.
> >
> >>> (We seem to have an ICH9-SMB PCI device already; I have no idea if
> it's suitable.)
> >> I didn't find that device suitable because it is part of the Intel
> >> Southbridge, which may have some Intel platform quirks, and
> >> we don't need all the things in that IO hub.
> >
> > That's a pity. Is there a different PCI I2C controller we could model ?
>
> What about using virtio-gpio & bitbang I2C?
>
> - virtio-gpio
> https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@metux.net/
>
> - bitbang I2C already in: hw/i2c/bitbang_i2c.c
>
> Regards,
>
> Phil.
>

--000000000000157c8205d88ad401
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Phil,<div><br></div><div>&gt; What about using virtio-g=
pio &amp; bitbang I2C?<br>&gt;<br>&gt; - virtio-gpio<br>&gt;=C2=A0<a href=
=3D"https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@metux.net=
/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/qemu-devel/=
20201127182917.2387-5-info@metux.net/</a><br>&gt;<br>&gt; - bitbang I2C alr=
eady in: hw/i2c/bitbang_i2c.c<br></div><div>Sorry for the delay.</div><div>=
<br></div><div>That looks like it might be doable with a bit more work crea=
ting the ACPI entries for the bitbang I2C.=C2=A0 This definitely=C2=A0seems=
 more appropriate on the ARM_VIRT platform instead of putting a specific co=
ntroller in.</div><div><br></div><div>For my uses, I will have to stick wit=
h the designware controller since it matches the system I&#39;m emulating a=
 little more closely.=C2=A0 We can hold back the designware stuff until ano=
ther SoC platform is interested in using this controller (since it seems li=
ke it is a common one).=C2=A0 Hopefully someone will find another use for t=
he controller patches someday.</div><div><br></div><div>Thanks again for lo=
oking at our patches.</div><div><br></div><div>-Chris</div><div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jan 26, 2022 at 3:42 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"m=
ailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">+Enrico Weigelt<br>
<br>
On 26/1/22 19:03, Peter Maydell wrote:<br>
&gt; On Wed, 26 Jan 2022 at 17:12, Chris Rauer &lt;<a href=3D"mailto:crauer=
@google.com" target=3D"_blank">crauer@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; I need to see a pretty strong justification for why we should =
be<br>
&gt;&gt;&gt; adding new kinds of devices to the virt machine,<br>
&gt;&gt;<br>
&gt;&gt; The designware i2c controller is a very common controller on many<=
br>
&gt;&gt;=C2=A0 =C2=A0ARM SoCs.=C2=A0 It has device tree bindings and ACPI b=
indings which<br>
&gt;&gt; makes it ideal for this platform.<br>
&gt; <br>
&gt; No, I mean, why do we need an i2c controller on the virt<br>
&gt; board at all ?<br>
&gt; <br>
&gt;&gt;&gt; Forgot to mention, but my prefered approach for providing<br>
&gt;&gt;&gt; an i2c controller on the virt board would be to have a<br>
&gt;&gt;&gt; PCI i2c controller: that way users who do need it can plug it<=
br>
&gt;&gt;&gt; in with a -device command line option, and users who don&#39;t=
<br>
&gt;&gt;&gt; need it never have to worry about it.<br>
&gt; <br>
&gt;&gt;&gt; (We seem to have an ICH9-SMB PCI device already; I have no ide=
a if it&#39;s suitable.)<br>
&gt;&gt; I didn&#39;t find that device suitable because it is part of the I=
ntel<br>
&gt;&gt; Southbridge, which may have some Intel platform quirks, and<br>
&gt;&gt; we don&#39;t need all the things in that IO hub.<br>
&gt; <br>
&gt; That&#39;s a pity. Is there a different PCI I2C controller we could mo=
del ?<br>
<br>
What about using virtio-gpio &amp; bitbang I2C?<br>
<br>
- virtio-gpio<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20201127182917.2387-5-info@me=
tux.net/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/qemu=
-devel/20201127182917.2387-5-info@metux.net/</a><br>
<br>
- bitbang I2C already in: hw/i2c/bitbang_i2c.c<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div>

--000000000000157c8205d88ad401--

