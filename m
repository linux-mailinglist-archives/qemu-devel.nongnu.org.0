Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A29A65D2B4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2ve-0000cQ-2M; Wed, 04 Jan 2023 07:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pD2vU-0000bp-Gm
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:31:26 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pD2vR-00065P-CO
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:31:24 -0500
Received: by mail-vs1-xe32.google.com with SMTP id x65so21145878vsb.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RLrIQtukzPxI2MwEV0yhZMlN2shNTdSkGFBxrGKBgTo=;
 b=UmQaV8cciGo053MROZ2IMu5255BDP2z1ozk9gqk48kxTwDWnsbGT2deudhoxM/0jDi
 OYyJmd/EjB/hpYCx70SzOh5zkkAKDFFix9V7MMkaIuVmbhA+NQ3q4A2wHl0F+WpSwppR
 CbcCWadrTL8KMloMgUBGqb2F8OkUerPDpe5k+/ujGJFmRDpgbPo9BUG1tRMamGl/AVbk
 BlFhrlHa6OJVLF37XcEuNyfV5abmAHanDMf0my2F3qg1XCYE8NHil8cn+nibtAOzbjpB
 T4vvpM7kVkKk6v1vWjcDFwBqMtZDsqX1CfoaV1dWvZVcNTDdLb/iGSgrsYHMDqBizOJt
 21fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RLrIQtukzPxI2MwEV0yhZMlN2shNTdSkGFBxrGKBgTo=;
 b=BDlMZO0qBiW9Q4DXQW/oIHytJZ7j+VIe0Xy/+TI3/NFjchkitChNmMwNKYJACOG6al
 /BsPzgeR6cci2vUFzuoA2tvEyo/SqW/SEL21BwYwPzrLS19P5zdrss6XXdOrVceEpgTT
 D6FDV9DlpM91Zjw3JjesEQVGT6UN+SpHW9QbjCJ7cVGxBnmZJhoO559wZwoMjQry7abO
 a46XdbjqTPG/HWqJrweri/lnSitBrCd8WtUna8RkjkRyvmiNr+G2GS2fapkFlo2OsE32
 7QmsEU4wdwdSN9j4yH5UPlI4TSayCPTuQA7xX8CsPzepN+o6/B520nnHwhp0UzMLxz8P
 n4uQ==
X-Gm-Message-State: AFqh2ko07qadGRbG2QeUrouEipYCGq2+weMhTrOBBcgJkVJh3FfGXqrT
 npVfQupYMW0ggBesTufR/fwyrXH9qXqtKLpq4nfwgKgOyc+fZg==
X-Google-Smtp-Source: AMrXdXv76femOoULSriQFuJWZ6lCW4kKNKGrffAJcqlgJI/N773qR1e6j6ac+mXzbTkWaZTiwdDHKtkbv1y2Q/e/E0U=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr3709032vsv.73.1672835479281; Wed, 04
 Jan 2023 04:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
 <20221221224022.425831-4-alistair.francis@opensource.wdc.com>
In-Reply-To: <20221221224022.425831-4-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Jan 2023 22:30:52 +1000
Message-ID: <CAKmqyKM-TArauueK=o7kLu9mM75RndarvK8e3nMLeRHidKLyBg@mail.gmail.com>
Subject: Re: [PULL v2 03/45] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 22, 2022 at 8:40 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> use the `FIELD32_1CLEAR` macro to implement register
> `rw1c` functionality to `ibex_spi`.
>
> This change was tested by running the `SPI_HOST` from TockOS.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20221017054950.317584-3-wilfred.mallawa@opensource.wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/ssi/ibex_spi_host.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 57df462e3c..0a456cd1ed 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -342,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>  {
>      IbexSPIHostState *s = opaque;
>      uint32_t val32 = val64;
> -    uint32_t shift_mask = 0xff, status = 0, data = 0;
> +    uint32_t shift_mask = 0xff, status = 0;
>      uint8_t txqd_len;
>
>      trace_ibex_spi_host_write(addr, size, val64);
> @@ -355,12 +355,11 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>      case IBEX_SPI_HOST_INTR_STATE:
>          /* rw1c status register */
>          if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
> -            data = FIELD_DP32(data, INTR_STATE, ERROR, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], INTR_STATE, ERROR);

It seems that this change doesn't build on Windows
(https://cirrus-ci.com/task/6444497832247296?logs=main#L2163)

Maybe ERROR is reserved? Either way I'll have to drop this commit.
Maybe just drop this change and keep the rest?

Alistair

>          }
>          if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
> -            data = FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], INTR_STATE, SPI_EVENT);
>          }
> -        s->regs[addr] = data;
>          break;
>      case IBEX_SPI_HOST_INTR_ENABLE:
>          s->regs[addr] = val32;
> @@ -505,27 +504,25 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>       *  When an error occurs, the corresponding bit must be cleared
>       *  here before issuing any further commands
>       */
> -        status = s->regs[addr];
>          /* rw1c status register */
>          if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, CMDBUSY, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, CMDBUSY);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, OVERFLOW, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, OVERFLOW);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, UNDERFLOW, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, UNDERFLOW);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, CMDINVAL, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, CMDINVAL);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, CSIDINVAL, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, CSIDINVAL);
>          }
>          if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
> -            status = FIELD_DP32(status, ERROR_STATUS, ACCESSINVAL, 0);
> +            s->regs[addr] = FIELD32_1CLEAR(s->regs[addr], ERROR_STATUS, ACCESSINVAL);
>          }
> -        s->regs[addr] = status;
>          break;
>      case IBEX_SPI_HOST_EVENT_ENABLE:
>      /* Controls which classes of SPI events raise an interrupt. */
> --
> 2.38.1
>

