Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581D4FBA72
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 13:03:46 +0200 (CEST)
Received: from localhost ([::1]:53510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndrph-0004xk-B6
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 07:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrjc-0005Op-4z
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:57:28 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndrjX-0004Do-98
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:57:25 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ebdf6ebd29so89436407b3.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfCWCaizk9dfJOILFckcsPWNvFZDEkl+dcr6dlMzCoI=;
 b=e0OYl00MEZULSV78ZYPpU1sZT8ki1YgTQViMdFZT7fC3XpjjaQhKTYDaS1wRiWNoz4
 DA4/sLdRFPEOP6k0iT507KLSOIl/3qjZvYCmzkQDMTQeStXrnkVZT6B7qTUgZybE56fi
 mFZWQPh0NFh7+8N2hMkx/lZGPtEUf+DZfRyzDPUQ2JcHpCtiT6ehWAuRaAIjSI2kfCry
 nlrdlKB2RhwClzm5QSQ3WXvfk6Fqoh+DFHc+CGhi2oKLim8WN+S2zTOfMOkRT+X6rz3i
 uQ3aK5HDNM0UeNrZq48qLvXHA5wk+Qp3FAT7vm+fk+IwCvPC2AkhubrIJa+NUbUqhFom
 dm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfCWCaizk9dfJOILFckcsPWNvFZDEkl+dcr6dlMzCoI=;
 b=c3fKFiSDfBY6UiZ5VLyx5m8CLhBE/LWSS84qiHMutdGvD2MMTy6LrFBVic2rXYfK8w
 saukym6gToSiFOpIYkiL4AjBjiZP3FHmKI9J+doxgI0qw9XyaI1jgMkrHDXaTM+zqhzB
 RYeIcLuaA0dpz7iNiqjVtVzJ+3snpodTRyVU0NBWseYLG00ByLNs7NRTzsvNwqFg2edo
 btXEVKo8NJhAe9gboYAK2ttJQPxFbDNR2VONaBENf/cNYy3s23tSggbvYnn4pfL5Utj2
 jZ6kV51EYXAypT3kYjmAiF4NIFkk/zVfSCxjwLjsNEfnukgmn+Pfcg5IyNm/qkuXz4Kx
 sgTA==
X-Gm-Message-State: AOAM5337xp6O3j+ZVr5+BenscJgnThGXw8gzymkoaeKcTHfJUi5P10Yd
 pGH+qpcPueFfLoWRNgZwN43crdghcqZw7OFDDmwz8w==
X-Google-Smtp-Source: ABdhPJyq5Ug8yCUdKzalfXvfZYjytq5fUF3q9cDfubRE24rivGRQtvMt5CChgGyeDiev08BxfsT/u78yVXN6dvDX68w=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr25704244ywm.329.1649674642348; Mon, 11
 Apr 2022 03:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
 <20220406223440.2901032-3-wuhaotsh@google.com>
In-Reply-To: <20220406223440.2901032-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:57:11 +0100
Message-ID: <CAFEAcA-tqq=KiNw4XTZ1jD=SbPTrGdjMU1oTfSBbY+Cgh3Rkxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm: Use bit fields for NPCM7XX PWRON STRAPs
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 23:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch uses the defined fields to describe PWRON STRAPs for
> better readability.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 0678a56156..62d4092657 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -30,11 +30,25 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/block-backend.h"
>
> -#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
> -#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
> -#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
> -#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
> -#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
> +#define NPCM7XX_POWER_ON_STRAPS_DEFAULT (           \
> +        NPCM7XX_PWRON_STRAP_SPI0F18 |               \
> +        NPCM7XX_PWRON_STRAP_SFAB |                  \
> +        NPCM7XX_PWRON_STRAP_BSPA |                  \
> +        NPCM7XX_PWRON_STRAP_FUP(FUP_NORM_UART2) |   \
> +        NPCM7XX_PWRON_STRAP_SECEN |                 \
> +        NPCM7XX_PWRON_STRAP_HIZ |                   \
> +        NPCM7XX_PWRON_STRAP_ECC |                   \
> +        NPCM7XX_PWRON_STRAP_RESERVE1 |              \
> +        NPCM7XX_PWRON_STRAP_J2EN |                  \
> +        NPCM7XX_PWRON_STRAP_CKFRQ(CKFRQ_DEFAULT))   \

You don't want the trailing '\' on this last line.

> +
> +#define NPCM750_EVB_POWER_ON_STRAPS ( \
> +        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_RESERVE1)

This was 0x00001ff7, but the new macro definition makes it
0x1fef (since NPCM7XX_POWER_ON_STRAPS_DEFAULT sets all bits [12:0]
and we then clear bit 4).

> +#define QUANTA_GSJ_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
> +#define QUANTA_GBS_POWER_ON_STRAPS ( \
> +        NPCM7XX_POWER_ON_STRAPS_DEFAULT & ~NPCM7XX_PWRON_STRAP_SFAB)
> +#define KUDO_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
> +#define MORI_BMC_POWER_ON_STRAPS NPCM7XX_POWER_ON_STRAPS_DEFAULT
>
>  static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";

thanks
-- PMM

