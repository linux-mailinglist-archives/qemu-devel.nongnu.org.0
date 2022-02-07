Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D504AC863
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:17:57 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8aJ-0007DR-GT
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nH8Wz-0004Ad-7P; Mon, 07 Feb 2022 13:14:30 -0500
Received: from [2a00:1450:4864:20::634] (port=46957
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nH8Wq-0006bU-5C; Mon, 07 Feb 2022 13:14:28 -0500
Received: by mail-ej1-x634.google.com with SMTP id o12so44547201eju.13;
 Mon, 07 Feb 2022 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wb9dBraKpgrMXCbZr4lBlIjU73NZos0THJRDSbS4ev8=;
 b=joZBVSyqXxgJQ4NFv6gtwnNUsPgrIcy9jm0FL3FoBPUr43BJUMnS4Oxg3/Ew0jEHAV
 jZEiZxPMkpf6FNtOFWthqr7y20nOaVc+PkN1vNBIrDFBwNKNDM3rxEI7BLp/skYHrYsp
 4s16EzqAL6Xf9gF4/GyrQHNvuNxQUj9W44wbbyyyCgJuR1AkyucvlN+KhqPODh0xJ2Af
 v4CPpC7aeli3mMA/3If7miFM9aohylwo7Tq1sJtGxb5gHBjgjpa4i4gUzQlinJtLDfGc
 afq9SVey7zN2D9ZVF/l7TYlhYhcVrD+Ivxb6TWLNc+zR6/yR4sqSqLplPHLezgoPARbh
 qI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wb9dBraKpgrMXCbZr4lBlIjU73NZos0THJRDSbS4ev8=;
 b=Osr9fqXy0o+X5UCQqPFL2SsdNeouHIv1F2JcJl+W9wcWZ2lXw92X7III4BZHs2Hz9d
 SX7KUNUIfK8ubUsgW4aIo4Vi6YRjmL2rgg4XX9P99LbDmIn/FkTAwS8C4WrIMtnfQG5r
 iZlQ3P5bfOyoBWWrV2tUdEWzfFxAOxkuijdxCWsNF2gwOEkqiz8Tsavtx6YkbH+oneWa
 +Qy8LVOZat8ytspRfrEWVO9T56F8ayMgbQK6SThZeDtBn4uW56VGlnI+a/B4PlXcx7xr
 Sg90g3r3YTJnKzvQoku3E3gLc/OVUHoQZVJzaArRXZpG1EaS2A6DYZdwWcPF23hM5Ndf
 4nkA==
X-Gm-Message-State: AOAM531gJ0PQJIWPew1v4P3Gfw6ZNj0QKTg2FqaBBj6tp8AacSJWpGwQ
 d9mduKNyek6qqg97v+T12INzM6fZGsX4zG3G+Cg=
X-Google-Smtp-Source: ABdhPJxfvtdran0W+GAc1zz3WhH73AMa0PD5JJwFpmpsohYsYMPbGSeWpoLKoMEsqEQr+PIv0s/BbbgOxf1/kKf8zwU=
X-Received: by 2002:a17:907:1c9f:: with SMTP id
 nb31mr753976ejc.24.1644257643651; 
 Mon, 07 Feb 2022 10:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
 <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
 <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
 <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
 <0da64aa5-97b3-540b-0fc9-cb9bf670d487@csgraf.de>
In-Reply-To: <0da64aa5-97b3-540b-0fc9-cb9bf670d487@csgraf.de>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 7 Feb 2022 19:13:52 +0100
Message-ID: <CAJy5ezrEFifPUWUmSmEmqqUsSdeQpEG+KjyCDJFJROFSKGFDVA@mail.gmail.com>
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: Alexander Graf <agraf@csgraf.de>
Content-Type: multipart/alternative; boundary="000000000000c4e84e05d7719003"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>,
 Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c4e84e05d7719003
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 5:24 PM Alexander Graf <agraf@csgraf.de> wrote:

>
> On 07.02.22 17:06, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/2/22 16:59, Alexander Graf wrote:
> >>
> >> On 07.02.22 16:52, Edgar E. Iglesias wrote:
> >
> >>> Both Versal and ZynqMP require MicroBlaze firmware to run the
> >>> reference implementations of Trusted Firmware. We never supported
> >>> this in upstream QEMU but we do support it with our fork (by running
> >>> multiple QEMU instances co-simulating).
> >>>
> >>> Having said that, we do have tons of EL3 test-cases that we use to
> >>> validate QEMU that run with EL3 enabled in upstream.
> >>>
> >>> So there's two user flows:
> >>> 1. Direct boots using QEMUs builtin PSCI (Most users use this to run
> >>> Linux, Xen, U-boot, etc)
> >>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by
> >>> test-code)
> >>>
> >>> Number #2 is the one affected here and that by accident used to have
> >>> the builtin PSCI support enabled but now requires more power control
> >>> modelling to keep working.
> >>> Unless I'm missing something, the -kernel boots will continue to use
> >>> the builtin PSCI implementation.
> >>
> >>
> >> So nobody is using upstream QEMU to validate and prototype
> >> ATF/EL1s/EL0s code? That's a shame :). I suppose there is little
> >> value without the bitstream emulation and R cluster. Do you have
> >> plans to bring multi process emulation upstream some day to enable
> >> these there?
> >
> > The R cluster is already in mainstream, isn't it?
>
>
> In that case, wouldn't it make sense to build an emulation model of the
> PMU behavior so that normal ATF works out of the box?
>
>
> Thanks,
>
> Alex
>

Yes, that makes sense and there are several ways to implement it. To fully
support the programmability of the PMU we'd need to model the MicroBlazes
together with the ARM cores.

But PMU support does not really conflict with this patch series, or is
there something I'm missing?

Cheers,
Edgar

--000000000000c4e84e05d7719003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 5:24 PM Alexander =
Graf &lt;<a href=3D"mailto:agraf@csgraf.de">agraf@csgraf.de</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 07.02.22 17:06, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 7/2/22 16:59, Alexander Graf wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 07.02.22 16:52, Edgar E. Iglesias wrote:<br>
&gt;<br>
&gt;&gt;&gt; Both Versal and ZynqMP require MicroBlaze firmware to run the =
<br>
&gt;&gt;&gt; reference implementations of Trusted Firmware. We never suppor=
ted <br>
&gt;&gt;&gt; this in upstream QEMU but we do support it with our fork (by r=
unning <br>
&gt;&gt;&gt; multiple QEMU instances co-simulating).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Having said that, we do have tons of EL3 test-cases that we us=
e to <br>
&gt;&gt;&gt; validate QEMU that run with EL3 enabled in upstream.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So there&#39;s two user flows:<br>
&gt;&gt;&gt; 1. Direct boots using QEMUs builtin PSCI (Most users use this =
to run <br>
&gt;&gt;&gt; Linux, Xen, U-boot, etc)<br>
&gt;&gt;&gt; 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly use=
d by <br>
&gt;&gt;&gt; test-code)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Number #2 is the one affected here and that by accident used t=
o have <br>
&gt;&gt;&gt; the builtin PSCI support enabled but now requires more power c=
ontrol <br>
&gt;&gt;&gt; modelling to keep working.<br>
&gt;&gt;&gt; Unless I&#39;m missing something, the -kernel boots will conti=
nue to use <br>
&gt;&gt;&gt; the builtin PSCI implementation.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; So nobody is using upstream QEMU to validate and prototype <br>
&gt;&gt; ATF/EL1s/EL0s code? That&#39;s a shame :). I suppose there is litt=
le <br>
&gt;&gt; value without the bitstream emulation and R cluster. Do you have <=
br>
&gt;&gt; plans to bring multi process emulation upstream some day to enable=
 <br>
&gt;&gt; these there?<br>
&gt;<br>
&gt; The R cluster is already in mainstream, isn&#39;t it?<br>
<br>
<br>
In that case, wouldn&#39;t it make sense to build an emulation model of the=
 <br>
PMU behavior so that normal ATF works out of the box?<br>
<br>
<br>
Thanks,<br>
<br>
Alex<br></blockquote><div><br></div><div>Yes, that makes sense and there ar=
e several ways to implement it. To fully support the programmability of the=
 PMU we&#39;d need to model the MicroBlazes together with the ARM cores.</d=
iv><div><br></div><div>But PMU support does not really conflict with this p=
atch series, or is there something I&#39;m missing?</div><div>=C2=A0</div><=
div>Cheers,</div><div>Edgar</div></div></div>

--000000000000c4e84e05d7719003--

