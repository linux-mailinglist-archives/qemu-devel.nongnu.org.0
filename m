Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AB317256
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 22:28:25 +0100 (CET)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9x28-0003XK-Am
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 16:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9x0p-0002xL-Jh
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:27:03 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:46320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l9x0W-0002Q6-SL
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 16:27:02 -0500
Received: by mail-lj1-x233.google.com with SMTP id b16so4785465lji.13
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh50T1QuedbGY4H8ZOzSyzN00UpGyabuAQfLOyx8PYM=;
 b=nPKD+OV253uEPNUAN13t6FPcHHEDKvgu0IWEAw3S0xQUOKOAm2F6l+tNoC9btIE6iO
 3gTNgRMpZFfcHI684c9S9vyo30LXR78MJGwG0YL40WgyR733UP4eCmLtQh24l/EmK5Gd
 jjyaqPY5yJH1EFtbZ+IOl89EiXBMys1RJ6GcpeYMdS+VO+waFQMvIoDj7uPrZw650v/E
 LKB2+C5d5+gMJc291tpa18FbcIBaEIyaTYkfvdtN3r8esRnW1nF0bWutVKtVGhGP41t5
 JF7CfgkFbyfvm5GjTe2PWIku/COLdp63MDd9nV74Gx7/di4WpycXseJVhPgf5C5oWzvc
 fmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh50T1QuedbGY4H8ZOzSyzN00UpGyabuAQfLOyx8PYM=;
 b=bff0qjIKbBA7cV+Xur54TL+nFG42k7NgmwVEG3nahpyNd3AMl9+RHk0rWnySaeberc
 eoa8eTNI7ZwIjRoQ6UJR5IkBeOcbjaKNbkeZZDTnNFRA6al8QEIP1QMYRAj/dkOxtbkJ
 FKTHIotTCiyLIWM6i6e7qsg7oh8qVNM5aNOqKQGyzbD7sjbmuIIST6GBTR4KiimGMK+O
 qtjeHjR2SMCcOmmWX6urvjwT9dy/GtJsNB2fK5MnXyNUAqdA0NdwJYeJaU7wf6Tknhn8
 EdFN53GvUs7qQz5r0wbFF2BXPtKEk2DIxYBjGmEIMv1a4l7RkJiINu2xPJ0xmDm+0Ouh
 9JGQ==
X-Gm-Message-State: AOAM533aFeMb48EixLDFrNC0YGaiRMqnq2S1JkWSuw1n8WVoUzPYaxZ+
 xTm+I/GAGf/v6LZ8IyTny3fJHFXT/i53WuwteF7WPg==
X-Google-Smtp-Source: ABdhPJySjZK5i8RmbIHiyr3C/lO0HkA29YM59O7apL80ziLWcoIVibYPzg752vHSRG/A64q9GVM55eg9kl0jdvRdkL0=
X-Received: by 2002:a2e:5805:: with SMTP id m5mr117060ljb.77.1612992402709;
 Wed, 10 Feb 2021 13:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <CAFEAcA-nx02EKVZLRxDYyY6uY4jyZ5ag3uk_Cak8zZqTuF32tg@mail.gmail.com>
In-Reply-To: <CAFEAcA-nx02EKVZLRxDYyY6uY4jyZ5ag3uk_Cak8zZqTuF32tg@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 10 Feb 2021 13:26:30 -0800
Message-ID: <CAGcCb101mQGaGw3h2e8t=+uYfb8fw+gUezSi55nnr1-8886=eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/i2c: Add NPCM7XX SMBus Device
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 Patrick Venture <venture@google.com>, Doug Evans <dje@google.com>, 
 Corey Minyard <cminyard@mvista.com>
Content-Type: multipart/alternative; boundary="00000000000030bf9005bb020f63"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000030bf9005bb020f63
Content-Type: text/plain; charset="UTF-8"

Thanks. I'll take patch 1 out of the next version.

On Mon, Feb 8, 2021 at 9:01 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > This patch set implements the System manager bus (SMBus) module in
> NPCM7XX
> > SoC. Basically, it emulates the data transactions of the module, not the
> > SDA/SCL levels. We have also added a QTest which contains read and write
> > operations for both single-byte and FIFO mode, and added basic I2C
> devices
> > for npcm750-evb and quanta-gsj boards.
> >
> > We also cleaned up the unimplemented GPIO devices in npcm7xx.c since they
> > are already implemented.
> >
> > Changes since v1:
> > - Fix errors for i2c device addresses for temperature sensors in GSJ
> machine
> > - Use at24c device to emulate GSJ EEPROM. It supports more than 256
> bytes.
> > - Fill in VMState in npcm7xx_smbus.c
> > - Change commit message in patch 3 and 4
> > - Fix order in npcm7xx.c IRQ list
> > - Add a few extra comments to make things clearer
> >
> > Hao Wu (6):
> >   hw/arm: Remove GPIO from unimplemented NPCM7XX
> >   hw/i2c: Implement NPCM7XX SMBus Module Single Mode
> >   hw/arm: Add I2C sensors for NPCM750 eval board
> >   hw/arm: Add I2C sensors and EEPROM for GSJ machine
> >   hw/i2c: Add a QTest for NPCM7XX SMBus Device
> >   hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
>
> Hi; I'm going to apply patch 1 to target-arm.next because it's not
> really related to the others in the series. For the rest, I left
> a couple of review comments but they're pretty minor.
>
> thanks
> -- PMM
>

--00000000000030bf9005bb020f63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. I&#39;ll take patch 1 out of the next version.</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Feb 8, 2021 at 9:01 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydel=
l@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Fri, 29 Jan 2021 at 01:04, Hao Wu =
&lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@googl=
e.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch set implements the System manager bus (SMBus) module in NPC=
M7XX<br>
&gt; SoC. Basically, it emulates the data transactions of the module, not t=
he<br>
&gt; SDA/SCL levels. We have also added a QTest which contains read and wri=
te<br>
&gt; operations for both single-byte and FIFO mode, and added basic I2C dev=
ices<br>
&gt; for npcm750-evb and quanta-gsj boards.<br>
&gt;<br>
&gt; We also cleaned up the unimplemented GPIO devices in npcm7xx.c since t=
hey<br>
&gt; are already implemented.<br>
&gt;<br>
&gt; Changes since v1:<br>
&gt; - Fix errors for i2c device addresses for temperature sensors in GSJ m=
achine<br>
&gt; - Use at24c device to emulate GSJ EEPROM. It supports more than 256 by=
tes.<br>
&gt; - Fill in VMState in npcm7xx_smbus.c<br>
&gt; - Change commit message in patch 3 and 4<br>
&gt; - Fix order in npcm7xx.c IRQ list<br>
&gt; - Add a few extra comments to make things clearer<br>
&gt;<br>
&gt; Hao Wu (6):<br>
&gt;=C2=A0 =C2=A0hw/arm: Remove GPIO from unimplemented NPCM7XX<br>
&gt;=C2=A0 =C2=A0hw/i2c: Implement NPCM7XX SMBus Module Single Mode<br>
&gt;=C2=A0 =C2=A0hw/arm: Add I2C sensors for NPCM750 eval board<br>
&gt;=C2=A0 =C2=A0hw/arm: Add I2C sensors and EEPROM for GSJ machine<br>
&gt;=C2=A0 =C2=A0hw/i2c: Add a QTest for NPCM7XX SMBus Device<br>
&gt;=C2=A0 =C2=A0hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode<br>
<br>
Hi; I&#39;m going to apply patch 1 to target-arm.next because it&#39;s not<=
br>
really related to the others in the series. For the rest, I left<br>
a couple of review comments but they&#39;re pretty minor.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000030bf9005bb020f63--

