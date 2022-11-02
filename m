Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4855B616B1D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 18:43:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqHki-0000AJ-IJ; Wed, 02 Nov 2022 13:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oqHke-00009r-F7; Wed, 02 Nov 2022 13:42:08 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oqHkc-0005bb-OO; Wed, 02 Nov 2022 13:42:08 -0400
Received: by mail-ua1-x92a.google.com with SMTP id x20so7831220ual.6;
 Wed, 02 Nov 2022 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m7itadBa7zIaPoPv1ReEZwiQJs1N761MpCghc4PuyCU=;
 b=o8fOTsqS8c1zmysD887Tw5TvlYV2Ds46F/KhIUUSt5IAguRyL+mVaRpiXSLCVyn2W0
 2AdQIjTrr7hCd3LTY8KwyLsyMGXZM1Bbi/fzU6ONiDX+VWUn5aSv+sm1kMScmt/JZ4YM
 4IW3R3YCOgLUMP/Q2vqR3IODtg8m3D/XbiR50uql22FFfyODVVTbS8dHLpZRsv7VhQkT
 Nr88MdYAHXpXCcc2wRv0jYS400kiWI19/Q6jRW784Is5G7Q+2sC+dFKiYtWj9Cppzkgj
 xJujlwlkFBF8uKokmdzB1ArpEcapexvY34dqeMFARivFNBSSg9kd+0Gks6BZT0EZ+Rg8
 J6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7itadBa7zIaPoPv1ReEZwiQJs1N761MpCghc4PuyCU=;
 b=AASik/rwDfKFFyM7WvTy2XC9QWgsGk/mU1zRYlcyd0JZ8iIW0Wfw/UtAsE3VhGPn+l
 sdORgDC6PrGlbBFB280G53KvYcwPpwtxWPP4iNCfCoEOzI/CNDV73T9QklyrOBJuk4EN
 iLVZI8MVrziF6tqoSFftW50ibTEMRXJHJhyRf2e5KpOaTqX+GKllzL1G75MnHer4Et6g
 cUfZ6yVzwRMqRRGbptYMW8LsMqPTpM1MKd6EfzMooJ/RU8eznH74xHJ3qclbEezGJhJy
 WVDd+thT89FN2cGuxsiiC0whWfUg907qaiYsD/xCwkNSl20P6E7LDJz8Yz/ybzue9xwI
 BBQA==
X-Gm-Message-State: ACrzQf2vDhF/nPCU6mNIjYw3CT9CVlgEommO2UI3fVP1cm8cUsXisXv3
 S/EUzQH4XpzTKSz8+RuGRgCIDgKfcWx3Ak2A/XQ=
X-Google-Smtp-Source: AMsMyM6tKE9xu/oClFWFIfZvZNjz0PulCWzdsMPOKWCbP2kUgIHSuQK88dB37Mo45eWNgTiXa03tRJy+ySDX7je/9kc=
X-Received: by 2002:ab0:1432:0:b0:3da:99ef:3edd with SMTP id
 b47-20020ab01432000000b003da99ef3eddmr10597515uae.66.1667410915995; Wed, 02
 Nov 2022 10:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221101222934.52444-1-philmd@linaro.org>
In-Reply-To: <20221101222934.52444-1-philmd@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 2 Nov 2022 18:41:42 +0100
Message-ID: <CAG4p6K5D6K9kwCor2xBFLzfPPCh5z+SvHp4KvUPTQfaPhqG+tA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] ppc/e500: Add support for eSDHC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000057b3d205ec805b06"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=shentey@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000057b3d205ec805b06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2022 at 11:29 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
> as an 'UNIMP' region. See v4 cover here:
>
> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.=
com/
>
> Since v5:
> - Rebased (ppc-next merged)
> - Properly handle big-endian
>

Tested-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>


> Since v4:
> - Do not rename ESDHC_* definitions to USDHC_*
> - Do not modify SDHCIState structure
>
> Supersedes: <20221031115402.91912-1-philmd@linaro.org>
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
>   hw/sd/sdhci: Support big endian SD host controller interfaces
>   hw/ppc/e500: Add Freescale eSDHC to e500plat
>
>  docs/system/ppc/ppce500.rst | 13 ++++++++++
>  hw/ppc/Kconfig              |  2 ++
>  hw/ppc/e500.c               | 48 ++++++++++++++++++++++++++++++++++++-
>  hw/ppc/e500.h               |  1 +
>  hw/ppc/e500plat.c           |  1 +
>  hw/sd/sdhci-internal.h      |  1 +
>  hw/sd/sdhci.c               | 36 +++++++++++++++++++++++++---
>  include/hw/sd/sdhci.h       |  1 +
>  8 files changed, 99 insertions(+), 4 deletions(-)
>
> --
> 2.38.1
>
>

--00000000000057b3d205ec805b06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 1, 2022 at 11:29 PM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.o=
rg</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">This is a respin of Bernhard&#39;s v4 with Fre=
escale eSDHC implemented<br>
as an &#39;UNIMP&#39; region. See v4 cover here:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shent=
ey@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/qemu-devel/20221018210146.193159-1-shentey@gmail.com/</a><br>
<br>
Since v5:<br>
- Rebased (ppc-next merged)<br>
- Properly handle big-endian<br></blockquote><div><br></div>Tested-by: Bern=
hard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>=
&gt;</div><div class=3D"gmail_quote">Reviewed-by: Bernhard Beschow &lt;<a h=
ref=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&gt;</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Since v4:<br>
- Do not rename ESDHC_* definitions to USDHC_*<br>
- Do not modify SDHCIState structure<br>
<br>
Supersedes: &lt;<a href=3D"mailto:20221031115402.91912-1-philmd@linaro.org"=
 target=3D"_blank">20221031115402.91912-1-philmd@linaro.org</a>&gt;<br>
<br>
Philippe Mathieu-Daud=C3=A9 (3):<br>
=C2=A0 hw/sd/sdhci: MMIO region is implemented in 32-bit accesses<br>
=C2=A0 hw/sd/sdhci: Support big endian SD host controller interfaces<br>
=C2=A0 hw/ppc/e500: Add Freescale eSDHC to e500plat<br>
<br>
=C2=A0docs/system/ppc/ppce500.rst | 13 ++++++++++<br>
=C2=A0hw/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 ++<br>
=C2=A0hw/ppc/e500.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 48 ++++++++++++++++++++++++++++++++++++-<br>
=C2=A0hw/ppc/e500.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
=C2=A0hw/ppc/e500plat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +=
<br>
=C2=A0hw/sd/sdhci-internal.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0hw/sd/sdhci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 36 +++++++++++++++++++++++++---<br>
=C2=A0include/hw/sd/sdhci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A08 files changed, 99 insertions(+), 4 deletions(-)<br>
<br>
-- <br>
2.38.1<br>
<br>
</blockquote></div></div>

--00000000000057b3d205ec805b06--

