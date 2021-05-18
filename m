Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169E387D0C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:03:06 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2BU-0007TG-S8
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj27I-0003qG-G4
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:58:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj27F-00070Q-58
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:58:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id n2so15371752ejy.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 08:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/hdlsVpjmzcWnU07XucMjZ5sAkI2JYQ9nis2tIoq4g=;
 b=uE23TwbTb8WL14zcSUDeDP/0PhNnR1Y7pXiSXZRPAK056yy/IX+hMnCWANsAoPE018
 ZGNZxYB4/h0MdJV8Ij5WRnmQvPXFNLO3o1uLIMYIf47OOo8OZsxfy+QI+lfuY10RGMjj
 aABIY66HWmax1eZGkNBmYwMsS0OimdQvzXBcygotdRqFzn9PentaC08AB/XQYXMiTvnY
 gVV54Cd8pPsU75iHwP6aqhXvq18H3UFz7FU8/k344Uq8vevooyhduZjy9rigGdgJSXSB
 Fj1k8LuNylXeNXY+CnuCGeYo/qHIJPHFUtjPAC4SUYrKcR971rr2ndCzoDusPA+r5PkH
 fL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/hdlsVpjmzcWnU07XucMjZ5sAkI2JYQ9nis2tIoq4g=;
 b=tfprS87AWpMlkiubaXrDYrutDpUQe7yRBAPkQcTrwfRy1q1pnPU6xnV3wV555m75IP
 vCbsf+K28G1dgQPw1kbwjmb3h/FgP0/87h7EJmisg9oGNB5tN0gMtRZEMJBYZqWYSXGO
 naQxguiJpgPsC40LmWQIDVNgJB/CgFyBvnqCmozVitqrYFQWLXAE96IBMutoQOxTvNOX
 9xL5cv3FhLE9EdykJFPFp6QTZdu7WIMJfyk3c5dD4I8iXwtj09s2LSZhI3XgoOlw44vI
 3vNPlpFcxI6EOORT8VLyS05sLlUfxZoXbotaJb6C2ZHwzYlzekR+9V5OtHRSjMQNGl/o
 Ermw==
X-Gm-Message-State: AOAM530K+C92sY+WtsDtcPL2KHdVag0CXsdluHF9+ZQslMeJIsgStFAy
 CWOICVmzaPvPTsOo+WlqCzQzJzQVJ0XD9TP6XxhWGw==
X-Google-Smtp-Source: ABdhPJxwy4LuAmwpMkCSES9USCr9Am8/+GpR9FrjdFh2wkWkd9M8BnMVTLv7Z74CG9hfLeGGyKVuJauQxuanAtrwYV0=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr6911730ejb.250.1621353519103; 
 Tue, 18 May 2021 08:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <20210429234201.125565-6-shashi.mallela@linaro.org>
In-Reply-To: <20210429234201.125565-6-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 16:58:22 +0100
Message-ID: <CAFEAcA8RRR04N4k0s1XEXDQVNa4r_n2T=Z4B00HHyJ5EPzD+tw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 00:42, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c         | 13 +++++++++++++
>  hw/intc/arm_gicv3_dist.c           | 21 +++++++++++++++++++--
>  hw/intc/arm_gicv3_redist.c         | 30 +++++++++++++++++++++++++-----
>  hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  5 files changed, 75 insertions(+), 7 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 58ef65f589..a55e91071a 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -381,6 +381,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>              (1 << 24) |
>              (i << 8) |
>              (last << 4);
> +
> +        if (s->lpi_enable) {
> +            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
> +
> +            if (!s->dma) {
> +                error_setg(errp,
> +                    "Redist-ITS: Guest 'sysmem' reference link not set");
> +                return;
> +            }
> +        }

Can you put the "if (s->lpi_enable && !s->dma)" error-exit further
up in the function with all the other error-checks, please? That way
we do all our error-handling before we start allocating memory and
doing other things.

>      }
>  }
>
> @@ -494,9 +504,12 @@ static Property arm_gicv3_common_properties[] = {
>      DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
>      DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
>      DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
> +    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
>      DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
>      DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
>                        redist_region_count, qdev_prop_uint32, uint32_t),
> +    DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index b65f56f903..43e0ea4367 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -366,12 +366,15 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          return MEMTX_OK;
>      case GICD_TYPER:
>      {
> +        bool lpi_supported = false;
>          /* For this implementation:
>           * No1N == 1 (1-of-N SPI interrupts not supported)
>           * A3V == 1 (non-zero values of Affinity level 3 supported)
>           * IDbits == 0xf (we support 16-bit interrupt identifiers)
>           * DVIS == 0 (Direct virtual LPI injection not supported)
> -         * LPIS == 0 (LPIs not supported)
> +         * LPIS == 1 (LPIs are supported if affinity routing is enabled)
> +         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
> +         *                      by GICD_TYPER.IDbits)
>           * MBIS == 0 (message-based SPIs not supported)
>           * SecurityExtn == 1 if security extns supported
>           * CPUNumber == 0 since for us ARE is always 1
> @@ -385,8 +388,22 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>           */
>          bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
>
> +        /*
> +         * With securityextn on, LPIs are supported when affinity routing
> +         * is enabled for non-secure state and if off LPIs are supported
> +         * when affinity routing is enabled.
> +         */
> +        if (s->lpi_enable) {
> +            if (sec_extn) {
> +                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE_NS);
> +            } else {
> +                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE);
> +            }
> +        }

For our implementation, affinity routing is always enabled, so you
don't need to make a distinction between s->lpi_enable and
lpi_supported.

> +
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
> -            (0xf << 19) | itlinesnumber;
> +            (lpi_supported << GICD_TYPER_LPIS_OFFSET) | (GICD_TYPER_IDBITS <<
> +            GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;

Don't break the line after << like this, please; it's much easier to read
if you break after '|' instead, because then the (...) bracketed
expression stays on one line rather than being split.

>          return MEMTX_OK;
>      }
>      case GICD_IIDR:
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 8645220d61..7604ccdc83 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -244,14 +244,22 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
> +    uint64_t data;
> +
>      switch (offset) {
>      case GICR_CTLR:
>          /* For our implementation, GICR_TYPER.DPGS is 0 and so all
>           * the DPG bits are RAZ/WI. We don't do anything asynchronously,
> -         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
> -         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
> -         * bits for us.
> +         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
> +         * implement LPIs) so Enable_LPIs is programmable.
>           */
> +        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> +            if (value & GICR_CTLR_ENABLE_LPIS) {
> +                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +            } else {
> +                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> +            }
> +        }
>          return MEMTX_OK;
>      case GICR_STATUSR:
>          /* RAZ/WI for our implementation */
> @@ -275,7 +283,12 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>          cs->gicr_waker = value;
>          return MEMTX_OK;
>      case GICR_PROPBASER:
> -        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
> +        data = value;
> +        if (FIELD_EX64(data, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
> +            data &= ~R_GICR_PROPBASER_IDBITS_MASK;
> +            data |= GICD_TYPER_IDBITS;
> +        }
> +        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, data);

This is still wrong. On v2 I said:

# This isn't what the spec says happens. It says that if the value the
guest writes
# in this field is larger than GICD_TYPER.IDbits, then the
GICD_TYPER.IDBits value
# applies. That doesn't mean the value reads back as GICD_TYPER.IDBits.
#
# How you want to handle this depends on what's going on, but it probably mostly
# looks like "code that cares about GICR_PROPBASER.IDBits will do
# MIN(field_value, GICD_TYPER_IDBITS) to find the effective value of the field".

>          return MEMTX_OK;
>      case GICR_PROPBASER + 4:
>          cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 32, 32, value);
> @@ -395,9 +408,16 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
>                                  uint64_t value, MemTxAttrs attrs)
>  {
> +    uint64_t data;
> +
>      switch (offset) {
>      case GICR_PROPBASER:
> -        cs->gicr_propbaser = value;
> +        data = value;
> +        if (FIELD_EX64(data, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
> +            data &= ~R_GICR_PROPBASER_IDBITS_MASK;
> +            data |= GICD_TYPER_IDBITS;
> +        }
> +        cs->gicr_propbaser = data;

Ditto.

thanks
-- PMM

