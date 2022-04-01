Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F14EE8E1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 09:14:33 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naBUN-000113-Q2
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 03:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1naBRh-0007Tw-Dr; Fri, 01 Apr 2022 03:11:45 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1naBRe-0005bE-PA; Fri, 01 Apr 2022 03:11:45 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 538A0C60912;
 Fri,  1 Apr 2022 09:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1648797096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bNY+yFfIwOSM7YjNmiig5uFX0wp/BEd4vzumv+cyIA=;
 b=JrQXDH5dgnhcoqhh1o5+UyeQHllQcz6MuJ+NlwcPzpMIH6XlBfeY4Xa2rVPfaG3a0JGwBe
 JNUQf2OU+oOBCif8Rqdx2IfuIaEtarJjhuBDN1M+lB74kJw5gDWMGM1A5AVi1+9NaFPDx+
 o9M4F2VH8dtnL14mXQ9uIZY1aMGA63gR12uFd0z3O8tYGODmtkdqCMvXRRe0TuUNwYoVrU
 E3GcsnxFpN0E4jmPGOyO0I8vrK+pp/FMPwQv0ZhfVfzoDrBoVH7sfj4JyJo+DL9Kvv+ZSa
 w2+tzlwsIms1AS7GnIgZc4DIaJxDzjHu5h8NCV0wWYh9VG2mjWAVQ0KJhkN1sQ==
Date: Fri, 1 Apr 2022 09:11:36 +0200
From: Luc Michel <luc@lmichel.fr>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 1/2] timer: cadence_ttc: Break out header file to
 allow embedding
Message-ID: <YkalqFmUFje2WQHM@sekoia-pc.home.lmichel.fr>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331222017.2914409-2-edgar.iglesias@gmail.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 00:20 Fri 01 Apr     , Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Break out header file to allow embedding of the the TTC.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

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

-- 

