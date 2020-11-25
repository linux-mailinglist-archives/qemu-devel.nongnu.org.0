Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792442C36F3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 03:56:51 +0100 (CET)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khkzC-0000W2-EK
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 21:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1khkut-00086R-Ku; Tue, 24 Nov 2020 21:52:23 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1khkur-0006BC-6t; Tue, 24 Nov 2020 21:52:23 -0500
Received: by mail-qk1-x742.google.com with SMTP id u4so1835176qkk.10;
 Tue, 24 Nov 2020 18:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8KCMB56xke4Fi4UqdZFRvzzs3NZ9qK79sJRBWmn5hNU=;
 b=E3FBNTUUqOrGIsxpWOTm1zsbg+mpw+k1q2kHiGXRxvtlziHqOVU3fuWJa6WRsUC0Fc
 SrLA3/cnHQJF2Jd3iyLqlx/0T5QxCCXzus3GR4OSzRWuKbQoFsHaJI+KueTyXbmkvTbM
 Fb3JpEeBiny5gfelEj1QTJmVCFUpnBKiZ97qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8KCMB56xke4Fi4UqdZFRvzzs3NZ9qK79sJRBWmn5hNU=;
 b=PturAXcrBWp/oijkFGC83CApz4N1LN2DDpF1enzP2ciwoiAvZcbJlBktGTpec3uNUr
 DPmcGfR6qt+OHletu4DCfvvhxTvy50v+lkIcbwY/ggl+Ah5MBL21Ypj96tRHEDJi8+MN
 TXkhdJAEuapIUWEi/dL0zdeuMYjY1IzNT8ILQQipueMSjWI/Vl85Ham65CN26qiIQW8x
 ibLqU9Uu5yPiaC+LWOlYSNuwRMzteTeEdF1WZ/8Q9Dd5kdmfevX4d91pzD7lqSXKIW/q
 IkReN8ES3wzQFVW2KaugaKZY6D8J5WiBAkyrZORxSB8cUF0Hv761y6iK4IMUeDY2KRZ9
 tuQw==
X-Gm-Message-State: AOAM532XHNtbWXsw8WxPMV/kEy/h2Fn0dFm8wkw9CwBK9CPkcARlXV3Q
 PZoBwJW/Gjz7Hs7KncRzNc4PTAVm2VIdM87/ATM=
X-Google-Smtp-Source: ABdhPJxRtVZxxWA3kBM/NPbUt8kXs2QG52aQ0fjIPHgG4EMdWisl576/KwaukPQKlkri1humuC4qT4PyJ2Ik5x217Uo=
X-Received: by 2002:a05:620a:7e8:: with SMTP id
 k8mr1374789qkk.273.1606272739709; 
 Tue, 24 Nov 2020 18:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20201120161547.740806-1-clg@kaod.org>
 <20201120161547.740806-2-clg@kaod.org>
In-Reply-To: <20201120161547.740806-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 Nov 2020 02:52:07 +0000
Message-ID: <CACPK8Xdx8HYw0ZL1Z2+KTZ6m5yerkoB+6j3uQrMSHWd0ZT4Ldg@mail.gmail.com>
Subject: Re: [PATCH for-6.0 1/2] aspeed/smc: Add support for address lane
 disablement
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x742.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Fri, 20 Nov 2020 at 16:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The controller can be configured to disable or enable address and data
> byte lanes when issuing commands. This is useful in read command mode
> to send SPI NOR commands that don't have an address space, such as
> RDID. It's a good way to have a unified read operation for registers
> and flash contents accesses.
>
> A new SPI driver proposed by Aspeed makes use of this feature. Add
> support for address lanes to start with. We will do the same for the
> data lanes if they are controlled one day.
>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 795784e5f364..e3d5e26058c0 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -71,6 +71,16 @@
>  #define   INTR_CTRL_CMD_ABORT_EN          (1 << 2)
>  #define   INTR_CTRL_WRITE_PROTECT_EN      (1 << 1)
>
> +/* Command Control Register */
> +#define R_CE_CMD_CTRL      (0x0C / 4)
> +#define   CTRL_ADDR_BYTE0_DISABLE_SHIFT       4
> +#define   CTRL_DATA_BYTE0_DISABLE_SHIFT       0
> +
> +#define aspeed_smc_addr_byte_enabled(s, i)                              =
 \
> +    (!((s)->regs[R_CE_CMD_CTRL] & (1 << (CTRL_ADDR_BYTE0_DISABLE_SHIFT +=
 (i)))))
> +#define aspeed_smc_data_byte_enabled(s, i)                              =
 \
> +    (!((s)->regs[R_CE_CMD_CTRL] & (1 << (CTRL_DATA_BYTE0_DISABLE_SHIFT +=
 (i)))))
> +
>  /* CEx Control Register */
>  #define R_CTRL0           (0x10 / 4)
>  #define   CTRL_IO_QPI              (1 << 31)
> @@ -702,19 +712,17 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *=
fl, uint32_t addr)
>  {
>      const AspeedSMCState *s =3D fl->controller;
>      uint8_t cmd =3D aspeed_smc_flash_cmd(fl);
> -    int i;
> +    int i =3D aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
>
>      /* Flash access can not exceed CS segment */
>      addr =3D aspeed_smc_check_segment_addr(fl, addr);
>
>      ssi_transfer(s->spi, cmd);
> -
> -    if (aspeed_smc_flash_is_4byte(fl)) {
> -        ssi_transfer(s->spi, (addr >> 24) & 0xff);
> +    while (i--) {
> +        if (aspeed_smc_addr_byte_enabled(s, i)) {
> +            ssi_transfer(s->spi, (addr >> (i * 8)) & 0xff);
> +        }
>      }
> -    ssi_transfer(s->spi, (addr >> 16) & 0xff);
> -    ssi_transfer(s->spi, (addr >> 8) & 0xff);
> -    ssi_transfer(s->spi, (addr & 0xff));
>
>      /*
>       * Use fake transfers to model dummy bytes. The value should
> @@ -988,6 +996,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
>          (addr >=3D s->r_timings &&
>           addr < s->r_timings + s->ctrl->nregs_timings) ||
>          addr =3D=3D s->r_ce_ctrl ||
> +        addr =3D=3D R_CE_CMD_CTRL ||
>          addr =3D=3D R_INTR_CTRL ||
>          addr =3D=3D R_DUMMY_DATA ||
>          (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
> @@ -1276,6 +1285,8 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
>          if (value !=3D s->regs[R_SEG_ADDR0 + cs]) {
>              aspeed_smc_flash_set_segment(s, cs, value);
>          }
> +    } else if (addr =3D=3D R_CE_CMD_CTRL) {
> +        s->regs[addr] =3D value & 0xff;
>      } else if (addr =3D=3D R_DUMMY_DATA) {
>          s->regs[addr] =3D value & 0xff;
>      } else if (addr =3D=3D R_INTR_CTRL) {
> --
> 2.26.2
>

