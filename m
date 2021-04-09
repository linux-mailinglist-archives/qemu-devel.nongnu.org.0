Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F259B3595F1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:59:43 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUl7G-00007q-Tv
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl3C-0006y1-6e; Fri, 09 Apr 2021 02:55:30 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:42546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl3A-0003PW-FM; Fri, 09 Apr 2021 02:55:29 -0400
Received: by mail-qk1-x72b.google.com with SMTP id y5so4878018qkl.9;
 Thu, 08 Apr 2021 23:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SeuS5VEc+7eSn3Gpyc0iq4wxfVxM3Eyb34hKmKk61uM=;
 b=OSY1NE1uk7DLd9s21ItX8bAPsZEcpvLATgppOcrOo1s3aoVXgZmKYNt9pPnpRos7aH
 7pEEF9zF2bGsGWsM8JsM018HAJeXEtODIAXtEfVzYnKwCr8QgzmEte5V8Q0YX2TEWTWz
 uYYkhdGu/+0/4gL3UvKol40wFXYUuNeb/SV48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SeuS5VEc+7eSn3Gpyc0iq4wxfVxM3Eyb34hKmKk61uM=;
 b=Z31euujvGMhvSqqq+XA1XVplJeiU7Pa4o/BwqG7Mf29t7pZB4CbKf6tk/HIkVAc9lt
 D4x3BxIfmMPK/du9P1qdlTJ5icq2fPkV0dXU3FCIKcB+1jXwqV3096H27OiWHS3cGndX
 3c7MglThyoX9+h/Fiw5EWerJ6rb44Affr2iUbtBUN/2+WZgEwQiWZZwF/XQpVoML4Jfx
 PBmne7xk875f7VgiaG3CrUvHP0SkbqFuFb3Kq8MHLrLnWQQ5bbiH4xRCL4rB/I8G5Yzg
 JIstL8wKycwSF8MkW747Iu50GL3uDh04CDNSKUTA403x4KnIwo3CxKe43Q4XHYK4twrx
 n26w==
X-Gm-Message-State: AOAM530B9f7ydUF16Qvnpmw5TqIPhMBD/UaeMlWBPnvIdZz4N3ywTTw7
 BZtvfTuGNdZw0BfJxMwoU9K8wd5XZPkyt8mgFyE=
X-Google-Smtp-Source: ABdhPJxiXtdkGKXZxnK8+wHvnFMkPkEV4Liq1NOQuNpWtLzRYXf6QOL7V7OpNA/y/47ge2HGfmU8msBFnolAmAabVUQ=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12545938qki.487.1617951326923; 
 Thu, 08 Apr 2021 23:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-15-clg@kaod.org>
In-Reply-To: <20210407171637.777743-15-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:55:14 +0000
Message-ID: <CACPK8Xe759bbuEHybMnHyN2JsszAp41b=yq-cpnM8PnQU-N-uQ@mail.gmail.com>
Subject: Re: [PATCH 14/24] aspeed/smc: Add a 'features' attribute to the
 object class
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 17:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> It will simplify extensions of the SMC model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 44 +++++++++++++++++++++----------------
>  2 files changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 6ea2871cd899..07879fd1c4a7 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -47,7 +47,7 @@ typedef struct AspeedSMCController {
>      const AspeedSegments *segments;
>      hwaddr flash_window_base;
>      uint32_t flash_window_size;
> -    bool has_dma;
> +    uint32_t features;
>      hwaddr dma_flash_mask;
>      hwaddr dma_dram_mask;
>      uint32_t nregs;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 50ea907aef74..4521bbd4864e 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -257,6 +257,12 @@ static uint32_t aspeed_2600_smc_segment_to_reg(const=
 AspeedSMCState *s,
>                                                 const AspeedSegments *seg=
);
>  static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
>                                             uint32_t reg, AspeedSegments =
*seg);
> +#define ASPEED_SMC_FEATURE_DMA       0x1
> +
> +static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
> +{
> +    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA);
> +}
>
>  static const AspeedSMCController controllers[] =3D {
>      {
> @@ -271,7 +277,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_legacy,
>          .flash_window_base =3D ASPEED_SOC_SMC_FLASH_BASE,
>          .flash_window_size =3D 0x6000000,
> -        .has_dma           =3D false,
> +        .features          =3D 0x0,
>          .nregs             =3D ASPEED_SMC_R_SMC_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> @@ -287,7 +293,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_fmc,
>          .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .has_dma           =3D true,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x1FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
> @@ -305,7 +311,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_spi,
>          .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .has_dma           =3D false,
> +        .features          =3D 0x0,
>          .nregs             =3D ASPEED_SMC_R_SPI_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> @@ -321,7 +327,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_ast2500_fmc,
>          .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .has_dma           =3D true,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x3FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
> @@ -339,7 +345,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_ast2500_spi1,
>          .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
>          .flash_window_size =3D 0x8000000,
> -        .has_dma           =3D false,
> +        .features          =3D 0x0,
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> @@ -355,7 +361,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_ast2500_spi2,
>          .flash_window_base =3D ASPEED_SOC_SPI2_FLASH_BASE,
>          .flash_window_size =3D 0x8000000,
> -        .has_dma           =3D false,
> +        .features          =3D 0x0,
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> @@ -371,7 +377,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_ast2600_fmc,
>          .flash_window_base =3D ASPEED26_SOC_FMC_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .has_dma           =3D true,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x3FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
> @@ -389,7 +395,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_ast2600_spi1,
>          .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .has_dma           =3D true,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x3FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
> @@ -407,7 +413,7 @@ static const AspeedSMCController controllers[] =3D {
>          .segments          =3D aspeed_segments_ast2600_spi2,
>          .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .has_dma           =3D true,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x3FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
> @@ -997,11 +1003,11 @@ static uint64_t aspeed_smc_read(void *opaque, hwad=
dr addr, unsigned int size)
>          addr =3D=3D R_CE_CMD_CTRL ||
>          addr =3D=3D R_INTR_CTRL ||
>          addr =3D=3D R_DUMMY_DATA ||
> -        (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
> -        (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
> -        (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
> -        (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) ||
> -        (s->ctrl->has_dma && addr =3D=3D R_DMA_CHECKSUM) ||
> +        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) ||
> +        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) ||
> +        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) ||
> +        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) ||
> +        (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CHECKSUM) ||
>          (addr >=3D R_SEG_ADDR0 &&
>           addr < R_SEG_ADDR0 + s->ctrl->max_peripherals) ||
>          (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_periph=
erals)) {
> @@ -1290,13 +1296,13 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>          s->regs[addr] =3D value & 0xff;
>      } else if (addr =3D=3D R_INTR_CTRL) {
>          s->regs[addr] =3D value;
> -    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) {
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) {
>          aspeed_smc_dma_ctrl(s, value);
> -    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) {
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) {
>          s->regs[addr] =3D DMA_DRAM_ADDR(s, value);
> -    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) {
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) {
>          s->regs[addr] =3D DMA_FLASH_ADDR(s, value);
> -    } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_LEN) {
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) {
>          s->regs[addr] =3D DMA_LENGTH(value);
>      } else {
>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
> @@ -1412,7 +1418,7 @@ static void aspeed_smc_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      /* DMA support */
> -    if (s->ctrl->has_dma) {
> +    if (aspeed_smc_has_dma(s)) {
>          aspeed_smc_dma_setup(s, errp);
>      }
>  }
> --
> 2.26.3
>

