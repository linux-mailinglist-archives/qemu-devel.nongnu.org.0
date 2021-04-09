Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90803595EB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:58:50 +0200 (CEST)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUl6P-00088Y-2V
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl2o-0006m3-6G; Fri, 09 Apr 2021 02:55:06 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lUl2l-0002zi-Fb; Fri, 09 Apr 2021 02:55:05 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id h3so2151934qvr.10;
 Thu, 08 Apr 2021 23:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mJTILOVGAW0HKRUF0xv8Ao5flFmWwJv+zmlBgGiVp18=;
 b=bMZavmxYZRRbbC/Qnogq54IENwFtyWgqHu3G00zIZLeN3S4IPTj3LeN1tQKu3L1RYF
 PTupzEjBE1ETa7aSg/jqeueRBxuVxCgOQT9Bwy+S3tA6gOcH8+Pq6G6Ha8G1bKWC1tBG
 Ievp3yBflrQfn55BsYieKCiYQ9dCoqJ/08UFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mJTILOVGAW0HKRUF0xv8Ao5flFmWwJv+zmlBgGiVp18=;
 b=nxRAABKLLlSAFQiWwqnacgkSUBdni49xeYa9CcVqBcWQd6r/M1UiL9m1JfyhzO/xNv
 fOssx8pKicLufli41fYFYJSjdPzAJ75EYE8JS8Y9ReJt3OSgCqI5cT/DknmR8MFEb+Nh
 l0VZEOpPAwKdxEU2/ZCfo/6ihi9RLVmt+r9l92kWwsJRsQ5I7AGtaidfa+GOvYbVS7Yh
 fAtcGob9jnCIo3M3zbVEVdso4LcITM55L6GOSBh4E2w8dgC85mqchuUOb1vt+uZBE78V
 0AJAXqJhVfMvUm4AkW9mqDr5kfQON4uAuCIteJYef6p7IPCxUzg76AgBr3PNIL9Z2y+g
 L4DQ==
X-Gm-Message-State: AOAM5328W4JhhMpWu5zEpzs8sRmmoD7/7TVmvUVJR7wLP5XJZDiAa6OY
 IMibBUFnWwIoUzF75R6/v8U9JtNKtFluQH0H4hnca6ia+Ug=
X-Google-Smtp-Source: ABdhPJzObBpUYca0LoJcpCm8HUa6rvq9efqLVG4k9KFQhKw+lQlK7jeZb8Tu/T2CFOFgi3SlVoS3bq2IotqQMapSb6Q=
X-Received: by 2002:a0c:d7ca:: with SMTP id g10mr12319586qvj.16.1617951302059; 
 Thu, 08 Apr 2021 23:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-16-clg@kaod.org>
In-Reply-To: <20210407171637.777743-16-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:54:49 +0000
Message-ID: <CACPK8Xfk9dPXdtr=BZq+9yTrFSYg_pyTX+Gk8JbcomjwVpTmjw@mail.gmail.com>
Subject: Re: [PATCH 15/24] aspeed/smc: Add extra controls to request DMA
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2f.google.com
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
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 17:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The AST2600 SPI controllers have a set of bits to request/grant DMA
> access. Add a new SMC feature for these controllers and use it to
> check access to the DMA registers.

Ah this is why you added the features mask. Makes sense.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h |  1 +
>  hw/ssi/aspeed_smc.c         | 74 +++++++++++++++++++++++++++++++++----
>  2 files changed, 68 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 07879fd1c4a7..cdaf165300b6 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -55,6 +55,7 @@ typedef struct AspeedSMCController {
>                                 const AspeedSegments *seg);
>      void (*reg_to_segment)(const struct AspeedSMCState *s, uint32_t reg,
>                             AspeedSegments *seg);
> +    void (*dma_ctrl)(struct AspeedSMCState *s, uint32_t value);
>  } AspeedSMCController;
>
>  typedef struct AspeedSMCFlash {
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 4521bbd4864e..189b35637c77 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -127,6 +127,8 @@
>
>  /* DMA Control/Status Register */
>  #define R_DMA_CTRL        (0x80 / 4)
> +#define   DMA_CTRL_REQUEST      (1 << 31)
> +#define   DMA_CTRL_GRANT        (1 << 30)
>  #define   DMA_CTRL_DELAY_MASK   0xf
>  #define   DMA_CTRL_DELAY_SHIFT  8
>  #define   DMA_CTRL_FREQ_MASK    0xf
> @@ -228,6 +230,7 @@ static uint32_t aspeed_smc_segment_to_reg(const Aspee=
dSMCState *s,
>                                            const AspeedSegments *seg);
>  static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t =
reg,
>                                        AspeedSegments *seg);
> +static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
>
>  /*
>   * AST2600 definitions
> @@ -257,7 +260,10 @@ static uint32_t aspeed_2600_smc_segment_to_reg(const=
 AspeedSMCState *s,
>                                                 const AspeedSegments *seg=
);
>  static void aspeed_2600_smc_reg_to_segment(const AspeedSMCState *s,
>                                             uint32_t reg, AspeedSegments =
*seg);
> +static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
> +
>  #define ASPEED_SMC_FEATURE_DMA       0x1
> +#define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
>
>  static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
>  {
> @@ -281,6 +287,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_SMC_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.fmc-ast2400",
>          .r_conf            =3D R_CONF,
> @@ -299,6 +306,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.spi1-ast2400",
>          .r_conf            =3D R_SPI_CONF,
> @@ -315,6 +323,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_SPI_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.fmc-ast2500",
>          .r_conf            =3D R_CONF,
> @@ -333,6 +342,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.spi1-ast2500",
>          .r_conf            =3D R_CONF,
> @@ -349,6 +359,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.spi2-ast2500",
>          .r_conf            =3D R_CONF,
> @@ -365,6 +376,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.fmc-ast2600",
>          .r_conf            =3D R_CONF,
> @@ -383,6 +395,7 @@ static const AspeedSMCController controllers[] =3D {
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_2600_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.spi1-ast2600",
>          .r_conf            =3D R_CONF,
> @@ -395,12 +408,14 @@ static const AspeedSMCController controllers[] =3D =
{
>          .segments          =3D aspeed_segments_ast2600_spi1,
>          .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .features          =3D ASPEED_SMC_FEATURE_DMA,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_DMA_GRANT,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x3FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_2600_smc_dma_ctrl,
>      }, {
>          .name              =3D "aspeed.spi2-ast2600",
>          .r_conf            =3D R_CONF,
> @@ -413,12 +428,14 @@ static const AspeedSMCController controllers[] =3D =
{
>          .segments          =3D aspeed_segments_ast2600_spi2,
>          .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
>          .flash_window_size =3D 0x10000000,
> -        .features          =3D ASPEED_SMC_FEATURE_DMA,
> +        .features          =3D ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_DMA_GRANT,
>          .dma_flash_mask    =3D 0x0FFFFFFC,
>          .dma_dram_mask     =3D 0x3FFFFFFC,
>          .nregs             =3D ASPEED_SMC_R_MAX,
>          .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
>          .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
> +        .dma_ctrl          =3D aspeed_2600_smc_dma_ctrl,
>      },
>  };
>
> @@ -1240,7 +1257,7 @@ static void aspeed_smc_dma_done(AspeedSMCState *s)
>      }
>  }
>
> -static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint64_t dma_ctrl)
> +static void aspeed_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctrl)
>  {
>      if (!(dma_ctrl & DMA_CTRL_ENABLE)) {
>          s->regs[R_DMA_CTRL] =3D dma_ctrl;
> @@ -1265,6 +1282,46 @@ static void aspeed_smc_dma_ctrl(AspeedSMCState *s,=
 uint64_t dma_ctrl)
>      aspeed_smc_dma_done(s);
>  }
>
> +static inline bool aspeed_smc_dma_granted(AspeedSMCState *s)
> +{
> +    if (!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA_GRANT)) {
> +        return true;
> +    }
> +
> +    if (!(s->regs[R_DMA_CTRL] & DMA_CTRL_GRANT)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func_=
_);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t dma_ctr=
l)
> +{
> +    /* Preserve DMA bits  */
> +    dma_ctrl |=3D s->regs[R_DMA_CTRL] & (DMA_CTRL_REQUEST | DMA_CTRL_GRA=
NT);
> +
> +    if (dma_ctrl =3D=3D 0xAEED0000) {
> +        /* automatically grant request */
> +        s->regs[R_DMA_CTRL] |=3D (DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
> +        return;
> +    }
> +
> +    /* clear request */
> +    if (dma_ctrl =3D=3D 0xDEEA0000) {
> +        s->regs[R_DMA_CTRL] &=3D ~(DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
> +        return;
> +    }
> +
> +    if (!aspeed_smc_dma_granted(s)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA not granted\n",  __func_=
_);
> +        return;
> +    }
> +
> +    aspeed_smc_dma_ctrl(s, dma_ctrl);
> +    s->regs[R_DMA_CTRL] &=3D ~(DMA_CTRL_REQUEST | DMA_CTRL_GRANT);
> +}
> +
>  static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>                               unsigned int size)
>  {
> @@ -1297,12 +1354,15 @@ static void aspeed_smc_write(void *opaque, hwaddr=
 addr, uint64_t data,
>      } else if (addr =3D=3D R_INTR_CTRL) {
>          s->regs[addr] =3D value;
>      } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_CTRL) {
> -        aspeed_smc_dma_ctrl(s, value);
> -    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR) {
> +        s->ctrl->dma_ctrl(s, value);
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_DRAM_ADDR &&
> +               aspeed_smc_dma_granted(s)) {
>          s->regs[addr] =3D DMA_DRAM_ADDR(s, value);
> -    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR) {
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_FLASH_ADDR &&
> +               aspeed_smc_dma_granted(s)) {
>          s->regs[addr] =3D DMA_FLASH_ADDR(s, value);
> -    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN) {
> +    } else if (aspeed_smc_has_dma(s) && addr =3D=3D R_DMA_LEN &&
> +               aspeed_smc_dma_granted(s)) {
>          s->regs[addr] =3D DMA_LENGTH(value);
>      } else {
>          qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx =
"\n",
> --
> 2.26.3
>

