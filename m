Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234044EE9B2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:24:06 +0200 (CEST)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCZh-0003ZD-7h
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:24:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1naCO0-0000r5-0l; Fri, 01 Apr 2022 04:12:01 -0400
Received: from [2a00:1450:4864:20::12a] (port=34774
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1naCNx-0005le-Vl; Fri, 01 Apr 2022 04:11:59 -0400
Received: by mail-lf1-x12a.google.com with SMTP id 5so3499390lfp.1;
 Fri, 01 Apr 2022 01:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AOcciOs5c0iC/nSZnZbeENRdQPZ6mdw6wuZ+kawOeNs=;
 b=q0wrvc81b7sUegEfGONxJgWXN7rGckF3kpEtfUyraUrxlr3RL+7kS0zaNxdQDxpm6h
 VIDORuTpDW4g4Svt8+wnysbcE2qaP44JY4saYTWXSRu63dnepClg+bObP5l35aGNBzu3
 TRwHqKIIrUoGj/IJuBuFpdQaaV8PEjb07oWuZIuX9ulZXgNNarQj1qILD2mT2BSJJVG9
 QMAxmlwTVjcdpm/r/RSERwWra2/o6VyEAcfjbf4OH2rrB97LlsxyfyajsQGtQtMu4z1L
 o2pvryZdkSwAuBbi6SYh6bhFXBrmYrc8rOSDt5l9JOnahjxxmq+sOETUpRAMFr89AbbW
 e9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AOcciOs5c0iC/nSZnZbeENRdQPZ6mdw6wuZ+kawOeNs=;
 b=ho1GCil6fuR7MTYcq7jX0blApIcKeMCsCt5hsROcA7F6EjWhRm0RgUdH3XHhyBP4/N
 iVIIVwiGJr/E2TxhBTTCylRtpw+z1jqRxHCeOweO3ljO5DwT7XPQbSuv92zfE6dNlEtm
 O/3ZW+vQkFHLjNOZg22cAiX1IbPBLdo7ob7zQdzXx67UXWgxsIYFSj1u8LrsELWeNTTf
 ynRqOXtsuUbpmaAvc5s19h92plSw01WRW+PidPJJrWtt+0JBLX3d3mxpIHVILS3KOO3X
 uoMblXIkYXUASrIXxHtiuxlaM31aSe0jrxSKp8vUdZO1TAEfsUSFij6gk3GdPVuQ2kk+
 r6oA==
X-Gm-Message-State: AOAM530OHOj0d1lJqgmQcb/i6vYls84LW2usmIutqaDxuKDcP7qrx2Fd
 97bLO+QX2PeMPI1vacpvhMo=
X-Google-Smtp-Source: ABdhPJyAlSHdRd+8Gf4Gh2MrcccHB5XIeOb/yh6q1R3b4IDpwRu71U3Ue00gXoOfN6zaDx34pEsVkA==
X-Received: by 2002:a05:6512:3f96:b0:445:a191:5d43 with SMTP id
 x22-20020a0565123f9600b00445a1915d43mr13171154lfa.603.1648800713498; 
 Fri, 01 Apr 2022 01:11:53 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a194f19000000b0044a2ad98dcasm166203lfb.167.2022.04.01.01.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 01:11:53 -0700 (PDT)
Date: Fri, 1 Apr 2022 10:11:51 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 1/2] timer: cadence_ttc: Break out header file to
 allow embedding
Message-ID: <20220401081151.GA18849@fralle-msi>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331222017.2914409-2-edgar.iglesias@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 alistair@alistair23.me, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Apr 01] Fri 00:20:16, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out header file to allow embedding of the the TTC.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/hw/timer/cadence_ttc.h | 54 ++++++++++++++++++++++++++++++++++
>  hw/timer/cadence_ttc.c         | 32 ++------------------
>  2 files changed, 56 insertions(+), 30 deletions(-)
>  create mode 100644 include/hw/timer/cadence_ttc.h
> 
> diff --git a/include/hw/timer/cadence_ttc.h b/include/hw/timer/cadence_ttc.h
> new file mode 100644
> index 0000000000..e1251383f2
> --- /dev/null
> +++ b/include/hw/timer/cadence_ttc.h
> @@ -0,0 +1,54 @@
> +/*
> + * Xilinx Zynq cadence TTC model
> + *
> + * Copyright (c) 2011 Xilinx Inc.
> + * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
> + * Copyright (c) 2012 PetaLogix Pty Ltd.
> + * Written By Haibing Ma
> + *            M. Habib
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef HW_TIMER_CADENCE_TTC_H
> +#define HW_TIMER_CADENCE_TTC_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +
> +typedef struct {
> +    QEMUTimer *timer;
> +    int freq;
> +
> +    uint32_t reg_clock;
> +    uint32_t reg_count;
> +    uint32_t reg_value;
> +    uint16_t reg_interval;
> +    uint16_t reg_match[3];
> +    uint32_t reg_intr;
> +    uint32_t reg_intr_en;
> +    uint32_t reg_event_ctrl;
> +    uint32_t reg_event;
> +
> +    uint64_t cpu_time;
> +    unsigned int cpu_time_valid;
> +
> +    qemu_irq irq;
> +} CadenceTimerState;
> +
> +#define TYPE_CADENCE_TTC "cadence_ttc"
> +OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
> +
> +struct CadenceTTCState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    CadenceTimerState timer[3];
> +};
> +
> +#endif
> diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
> index 64108241ba..e57a0f5f09 100644
> --- a/hw/timer/cadence_ttc.c
> +++ b/hw/timer/cadence_ttc.c
> @@ -24,6 +24,8 @@
>  #include "qemu/timer.h"
>  #include "qom/object.h"
>  
> +#include "hw/timer/cadence_ttc.h"
> +
>  #ifdef CADENCE_TTC_ERR_DEBUG
>  #define DB_PRINT(...) do { \
>      fprintf(stderr,  ": %s: ", __func__); \
> @@ -49,36 +51,6 @@
>  #define CLOCK_CTRL_PS_EN    0x00000001
>  #define CLOCK_CTRL_PS_V     0x0000001e
>  
> -typedef struct {
> -    QEMUTimer *timer;
> -    int freq;
> -
> -    uint32_t reg_clock;
> -    uint32_t reg_count;
> -    uint32_t reg_value;
> -    uint16_t reg_interval;
> -    uint16_t reg_match[3];
> -    uint32_t reg_intr;
> -    uint32_t reg_intr_en;
> -    uint32_t reg_event_ctrl;
> -    uint32_t reg_event;
> -
> -    uint64_t cpu_time;
> -    unsigned int cpu_time_valid;
> -
> -    qemu_irq irq;
> -} CadenceTimerState;
> -
> -#define TYPE_CADENCE_TTC "cadence_ttc"
> -OBJECT_DECLARE_SIMPLE_TYPE(CadenceTTCState, CADENCE_TTC)
> -
> -struct CadenceTTCState {
> -    SysBusDevice parent_obj;
> -
> -    MemoryRegion iomem;
> -    CadenceTimerState timer[3];
> -};
> -
>  static void cadence_timer_update(CadenceTimerState *s)
>  {
>      qemu_set_irq(s->irq, !!(s->reg_intr & s->reg_intr_en));
> -- 
> 2.25.1
> 

