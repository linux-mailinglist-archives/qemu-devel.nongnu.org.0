Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4355BAA24
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:10:59 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8JG-000508-Mb
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ8G8-0001V4-5t; Fri, 16 Sep 2022 06:07:44 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ8G6-0005RA-Ga; Fri, 16 Sep 2022 06:07:43 -0400
Received: by mail-qt1-x833.google.com with SMTP id g12so15156429qts.1;
 Fri, 16 Sep 2022 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zQnzfsKGhBlZOASNsiG0TpRPUKKuGvUXO5jfzSiE1Pk=;
 b=VtZClc10QzWXD2onWU65BvIx4B4j/qPFtZyTfCY5RrW1j0KQ1+trvZjS4r6JDVoH2i
 0PgnnELSbFy4FgAw+d3AFXzUG1FUnX3+4R3Ai8cUCRLR+g3gQKyIrNcIXK5HRANmHYKd
 PbEgJx1mui5MplniURVM3Xf9ZZx9J8nvR5hn1Gr0wJ97AZxwho4TF7zgewlZVDSFqMhc
 w5AQmMv98/6r1KOsFcGIRkP5Yc6HeWhlEW8DIbkLHAVErLfO+vHRfZHnZoQU3DCTcJ+a
 pjGUBjDastDU9pRdRxJ117B4Utxp12NFyzTJyTRG1HFUgE0jNqkGIY8MaYIAToeKdj9K
 zwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zQnzfsKGhBlZOASNsiG0TpRPUKKuGvUXO5jfzSiE1Pk=;
 b=XU6BopTgw2//kFwNMNN7jx6dFTeaicmwOlqSBkWI6pY+SEjWxa9MzA8Z9RkeP88b5f
 pPgSDQtdPxpt10dmH/bQpDhWSp3IVJ3NxLKMTXIQvh1zNtKtw9jNrGhHvL8HQ+HHP+li
 hq+NWQhwR+xb8ZScQgN5f4JcAiWaVXosPhOh3aluREfpwA4Im/6KoKFMt3idKIWHJzLU
 RDDHThXhc66j5JH09PowD91HB79EkjJbYbnVWTQMPyzwVS4QTptZ8F1e4dY8kW8c3ksn
 I3bjR9bdFwi6OeoQ17REkMXYVcmdnoScrHUj3gMddcVb9Ga/ndTI8oPOaqik1IH8f6Cb
 7PTg==
X-Gm-Message-State: ACrzQf3DTXlmYI4BPMm5ZHkCP+RkSGCXHr0D77ScQQI3OzZs28/JRttT
 izFr0cFIXDHGWmjBsNOXGxJfs4lpAGFI+3yH2ig=
X-Google-Smtp-Source: AMsMyM6AoPuORGhosmV7mAuR/vtJ4JgIPQnOcCxylAY6y1pZQwzZPJRfu/yqdlODkkDGYe2dkEmmZmiUC0mkgQarq4w=
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr3690209qtc.334.1663322860602; Fri, 16
 Sep 2022 03:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-10-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-10-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 18:07:28 +0800
Message-ID: <CAEUhbmWhTm=G5KjoRsNuReQazJ8U87vBbALDjcU=LUhcHmOLbA@mail.gmail.com>
Subject: Re: [PATCH 09/11] hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 11:42 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> The device model's functions start with "usdhc_", so rename the defines
> accordingly for consistency.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/sd/sdhci.c | 68 +++++++++++++++++++++++++--------------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 6da5e2c781..7a5996caad 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1577,24 +1577,24 @@ static const TypeInfo sdhci_bus_info = {
>
>  /* --- qdev i.MX eSDHC --- */
>
> -#define ESDHC_MIX_CTRL                  0x48
> +#define USDHC_MIX_CTRL                  0x48
>
> -#define ESDHC_VENDOR_SPEC               0xc0
> -#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
> +#define USDHC_VENDOR_SPEC               0xc0
> +#define USDHC_IMX_FRC_SDCLK_ON          (1 << 8)
>
> -#define ESDHC_DLL_CTRL                  0x60
> +#define USDHC_DLL_CTRL                  0x60
>
> -#define ESDHC_TUNING_CTRL               0xcc
> -#define ESDHC_TUNE_CTRL_STATUS          0x68
> -#define ESDHC_WTMK_LVL                  0x44
> +#define USDHC_TUNING_CTRL               0xcc
> +#define USDHC_TUNE_CTRL_STATUS          0x68
> +#define USDHC_WTMK_LVL                  0x44
>
>  /* Undocumented register used by guests working around erratum ERR004536 */
> -#define ESDHC_UNDOCUMENTED_REG27        0x6c
> +#define USDHC_UNDOCUMENTED_REG27        0x6c
>
> -#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
> -#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
> +#define USDHC_CTRL_4BITBUS              (0x1 << 1)
> +#define USDHC_CTRL_8BITBUS              (0x2 << 1)
>
> -#define ESDHC_PRNSTS_SDSTB              (1 << 3)
> +#define USDHC_PRNSTS_SDSTB              (1 << 3)
>
>  static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
>  {
> @@ -1615,11 +1615,11 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
>          hostctl1 = SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
>
>          if (s->hostctl1 & SDHC_CTRL_8BITBUS) {
> -            hostctl1 |= ESDHC_CTRL_8BITBUS;
> +            hostctl1 |= USDHC_CTRL_8BITBUS;
>          }
>
>          if (s->hostctl1 & SDHC_CTRL_4BITBUS) {
> -            hostctl1 |= ESDHC_CTRL_4BITBUS;
> +            hostctl1 |= USDHC_CTRL_4BITBUS;
>          }
>
>          ret  = hostctl1;
> @@ -1630,21 +1630,21 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
>
>      case SDHC_PRNSTS:
>          /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
> -        ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
> +        ret = sdhci_read(opaque, offset, size) & ~USDHC_PRNSTS_SDSTB;
>          if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
> -            ret |= ESDHC_PRNSTS_SDSTB;
> +            ret |= USDHC_PRNSTS_SDSTB;
>          }
>          break;
>
> -    case ESDHC_VENDOR_SPEC:
> +    case USDHC_VENDOR_SPEC:
>          ret = s->vendor_spec;
>          break;
> -    case ESDHC_DLL_CTRL:
> -    case ESDHC_TUNE_CTRL_STATUS:
> -    case ESDHC_UNDOCUMENTED_REG27:
> -    case ESDHC_TUNING_CTRL:
> -    case ESDHC_MIX_CTRL:
> -    case ESDHC_WTMK_LVL:
> +    case USDHC_DLL_CTRL:
> +    case USDHC_TUNE_CTRL_STATUS:
> +    case USDHC_UNDOCUMENTED_REG27:
> +    case USDHC_TUNING_CTRL:
> +    case USDHC_MIX_CTRL:
> +    case USDHC_WTMK_LVL:
>          ret = 0;
>          break;
>      }
> @@ -1660,18 +1660,18 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>      uint32_t value = (uint32_t)val;
>
>      switch (offset) {
> -    case ESDHC_DLL_CTRL:
> -    case ESDHC_TUNE_CTRL_STATUS:
> -    case ESDHC_UNDOCUMENTED_REG27:
> -    case ESDHC_TUNING_CTRL:
> -    case ESDHC_WTMK_LVL:
> +    case USDHC_DLL_CTRL:
> +    case USDHC_TUNE_CTRL_STATUS:
> +    case USDHC_UNDOCUMENTED_REG27:
> +    case USDHC_TUNING_CTRL:
> +    case USDHC_WTMK_LVL:
>          break;
>
> -    case ESDHC_VENDOR_SPEC:
> +    case USDHC_VENDOR_SPEC:
>          s->vendor_spec = value;
>          switch (s->vendor) {
>          case SDHCI_VENDOR_IMX:
> -            if (value & ESDHC_IMX_FRC_SDCLK_ON) {
> +            if (value & USDHC_IMX_FRC_SDCLK_ON) {
>                  s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
>              } else {
>                  s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
> @@ -1740,12 +1740,12 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>           * Second, split "Data Transfer Width" from bits 2 and 1 in to
>           * bits 5 and 1
>           */
> -        if (value & ESDHC_CTRL_8BITBUS) {
> +        if (value & USDHC_CTRL_8BITBUS) {
>              hostctl1 |= SDHC_CTRL_8BITBUS;
>          }
>
> -        if (value & ESDHC_CTRL_4BITBUS) {
> -            hostctl1 |= ESDHC_CTRL_4BITBUS;
> +        if (value & USDHC_CTRL_4BITBUS) {
> +            hostctl1 |= USDHC_CTRL_4BITBUS;
>          }
>
>          /*
> @@ -1768,11 +1768,11 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>          sdhci_write(opaque, offset, value, size);
>          break;
>
> -    case ESDHC_MIX_CTRL:
> +    case USDHC_MIX_CTRL:
>          /*
>           * So, when SD/MMC stack in Linux tries to write to "Transfer
>           * Mode Register", ESDHC i.MX quirk code will translate it

Here I assume ESDHC i.MX means the Linux eSDHC driver for i.MX, so no
need to replace ESDHC with USDHC?

> -         * into a write to ESDHC_MIX_CTRL, so we do the opposite in
> +         * into a write to USDHC_MIX_CTRL, so we do the opposite in
>           * order to get where we started
>           *
>           * Note that Auto CMD23 Enable bit is located in a wrong place
> --

Overall LGTM:
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

