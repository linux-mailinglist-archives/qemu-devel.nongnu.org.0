Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944A6147DA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 11:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opoij-0008LL-Uj; Tue, 01 Nov 2022 06:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opoii-0008L0-Eg; Tue, 01 Nov 2022 06:42:12 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1opoig-0002gn-Kp; Tue, 01 Nov 2022 06:42:12 -0400
Received: by mail-vk1-xa36.google.com with SMTP id g4so3418429vkk.6;
 Tue, 01 Nov 2022 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bOwWOB9imqIaxuK6PqPgd8kIOoY7THz4cU0LDvzl0gw=;
 b=dw3WvsNWYxIUVM3ZAhEyHUdRAppU8U+01WvIh5zg9gdTrdOwl6Uf7XKBfq2R7HEoIJ
 75BKaw76XjApNn/adaIDQXAzO+d1xWEEupXaiMJes60XXLU5sDIBcjLJAEAx1aWL0fTy
 AlS+e7rbBBFT0Rs3CftHtZ5XSazG7KGIEYWlFJc4tZxwZl4jajGnUZPQwaoJCpeoy0J+
 bhOQe5lAd2YmPt03w56jr9snc7wdma0V4XDZWzYQxLSgzFHYSBxSYcbw8DvLhKbwOw1i
 14ps8r3TkxXtI6m6FlEXwQ4RKjvIC0YC33cXqJqDFXg0m7dzb2ROx8zQIerdCpmF0Fkk
 UsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bOwWOB9imqIaxuK6PqPgd8kIOoY7THz4cU0LDvzl0gw=;
 b=hPSFbc8UTyu7TyQgPes/4/Ht9J40JzbqrqxrRDpovA8LZJ4GydmT1XiLtAJMwPO7GQ
 7yMr7AiikFf9gjro6sbhjTkht9yfYrXj3bsWZUvMiQuI8jznjWQGZ32XaLcrtZGQMKqU
 Zn94uIp3yRoDVVv12EFMoPmJwIEcGREPx+x2STdchQikIvYqiGctQN930TcNvgPfiEsx
 XgNY+bS23qoha6FHWC6jlUcDATQjbsTjHaeDGoYVKPnUd09kTV5RI16/BnMx7A8nXkbi
 UDmE6NDkF76djLbJWf/19IkxACTQD8ZcOlwShxyiZaO2kqYGFVJABwwXih/KaAGEX7R3
 hpLg==
X-Gm-Message-State: ACrzQf3jYoWxwJu2i+Vqxwzeo530VmnlIsTbFV2T79NHYXj0GAwyWy9a
 h/hGtbBzGZ7Wt/AakjaEPM3o2gqtngIV45l1Tuo=
X-Google-Smtp-Source: AMsMyM4k0y5xBDCgPuDRd0dAFl27ilHLlWBcdXxu1bM07cPB7e9cbFSuhapT2E8E4d3KAtMn87Kay338d1vXP+189Ig=
X-Received: by 2002:a1f:a0d8:0:b0:3a3:e1a1:3682 with SMTP id
 j207-20020a1fa0d8000000b003a3e1a13682mr7059585vke.20.1667299327006; Tue, 01
 Nov 2022 03:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221031115402.91912-1-philmd@linaro.org>
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 1 Nov 2022 11:41:51 +0100
Message-ID: <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] ppc/e500: Add support for two types of flash,
 cleanup
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001edacf05ec666051"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa36.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000001edacf05ec666051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 12:54 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org>
wrote:

> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
> as an 'UNIMP' region. See v4 cover here:
>
> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.=
com/
>
> Only tested with the ppce500 machine (no further regression testing).
>
> Since v4:
> - Do not rename ESDHC_* definitions to USDHC_*
> - Do not modify SDHCIState structure
>

Works beautifully, both for the buildroot load and for my proprietary load.
So:
Tested-by: Bernhard Beschow<shentey@gmail.com>

>
> Bernhard Beschow (4):
>   hw/block/pflash_cfi0{1, 2}: Error out if device length isn't a power
>     of two
>   docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>   hw/ppc/e500: Implement pflash handling
>   hw/ppc/e500: Add Freescale eSDHC to e500plat
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
>   hw/sd/sdhci: Map host controller interface in host endianess
>
>  docs/system/ppc/ppce500.rst |  38 +++++++++--
>  hw/block/pflash_cfi01.c     |   8 ++-
>  hw/block/pflash_cfi02.c     |   5 ++
>  hw/ppc/Kconfig              |   3 +
>  hw/ppc/e500.c               | 127 +++++++++++++++++++++++++++++++++++-
>  hw/ppc/e500.h               |   1 +
>  hw/ppc/e500plat.c           |   1 +
>  hw/sd/sdhci.c               |   6 +-
>  8 files changed, 180 insertions(+), 9 deletions(-)
>
> --
> 2.37.3
>
>

--0000000000001edacf05ec666051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 31, 2022 at 12:54 PM Philippe=
 Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.=
org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">This is a respin of Bernhard&#39;s v4 with Fr=
eescale eSDHC implemented<br>
as an &#39;UNIMP&#39; region. See v4 cover here:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shent=
ey@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/qemu-devel/20221018210146.193159-1-shentey@gmail.com/</a><br>
<br>
Only tested with the ppce500 machine (no further regression testing).<br>
<br>
Since v4:<br>
- Do not rename ESDHC_* definitions to USDHC_*<br>
- Do not modify SDHCIState structure<br></blockquote><div><br></div><div>Wo=
rks beautifully, both for the buildroot load and for my proprietary load. S=
o:</div><div>Tested-by: Bernhard Beschow&lt;<a href=3D"mailto:shentey@gmail=
.com">shentey@gmail.com</a>&gt;</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Bernhard Beschow (4):<br>
=C2=A0 hw/block/pflash_cfi0{1, 2}: Error out if device length isn&#39;t a p=
ower<br>
=C2=A0 =C2=A0 of two<br>
=C2=A0 docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)<b=
r>
=C2=A0 hw/ppc/e500: Implement pflash handling<br>
=C2=A0 hw/ppc/e500: Add Freescale eSDHC to e500plat<br>
<br>
Philippe Mathieu-Daud=C3=A9 (2):<br>
=C2=A0 hw/sd/sdhci: MMIO region is implemented in 32-bit accesses<br>
=C2=A0 hw/sd/sdhci: Map host controller interface in host endianess<br>
<br>
=C2=A0docs/system/ppc/ppce500.rst |=C2=A0 38 +++++++++--<br>
=C2=A0hw/block/pflash_cfi01.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 ++-<br>
=C2=A0hw/block/pflash_cfi02.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 ++<br>
=C2=A0hw/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +<br>
=C2=A0hw/ppc/e500.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 127 +++++++++++++++++++++++++++++++++++-<br>
=C2=A0hw/ppc/e500.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/ppc/e500plat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0hw/sd/sdhci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 +-<br>
=C2=A08 files changed, 180 insertions(+), 9 deletions(-)<br>
<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div></div>

--0000000000001edacf05ec666051--

