Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C304EE77D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 07:02:37 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na9Qh-0007lR-TC
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 01:02:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1na9Os-0006pw-Hv; Fri, 01 Apr 2022 01:00:42 -0400
Received: from [2607:f8b0:4864:20::135] (port=43674
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1na9Oq-00047h-O1; Fri, 01 Apr 2022 01:00:42 -0400
Received: by mail-il1-x135.google.com with SMTP id d3so1211364ilr.10;
 Thu, 31 Mar 2022 22:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nwXRZJe1RJqi3Q0x2tjON6lF/4/nUa9A5iMV0mvErk4=;
 b=G+gXtm0iL5dGgySx5VqXGFG44oUjS/zyfWDUmGXcMFHVlCQRTFrNS61yLj8VtpJTIv
 9OLOaoVUdomhbkS8/Kpq4Xr4+YbfouJDpmELsS0tS0pExLJmQphyMRFdJkZSwqljXqgC
 E37QoLbn3XRUCdJm7UIq3I6SvTuUCwZ44aGCeGmCWKespIK4jC8qMxGgQHhs80OzpSvd
 b7Ezz2zUBP9N0Maa1bqHLqhGtoebjPDbAx2e+9rW5amqd8QoHdQV0Qg2SDtg2VazvIFV
 gbWYOYECbHQeu3rWUbQAGZxmMbIbU5IHuMKmxeqPquKUyyC8QzwaadBb1AVeFuWIRLf5
 IJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nwXRZJe1RJqi3Q0x2tjON6lF/4/nUa9A5iMV0mvErk4=;
 b=k5U+DbxGi1eAkjBnnKanxNXa3IpZ/juIRmMnFar12zaASSmoa3MqEwdH6nPQ1bOTqO
 J4Qn7hpQaf7vS6KMsQmoxntiO6OVrCk4KmTxNA2BXxvl1klttLD+dfSqnnt2VJO0/wbM
 lei2rFZNIJWyVnYP/wgc4A4E5YzR+AT6lpa1SshBiQ95LIhw3uz9ysydqbgZgNfXURwS
 2uKeUA6nExr6gN2Vz1EIkWwVLlxrCgcpt3Ha/8ggxXS5In1Jn5OgQdo71Eq6Ma7PUFr7
 yS6kCK4xXy1aV6xNM1nvzdkvzuNIOlaxi6YG1+F4E5Cosmg7oD7yFSjwTjJt2/XA4Ila
 hdYg==
X-Gm-Message-State: AOAM531rLX2jJ/DOTJbdKJrZlUDy+YemKQMpfcIbcL7/CRrMTMLVm3jo
 OUV2Cf01jDV7dLfOYkPbO9Uvd8/Dqzkb1k7aBqQ=
X-Google-Smtp-Source: ABdhPJxOgZ07TKuZcSmNjjRYtjDmuQb9BzB8gBGTOH9dM/Ei6AiUZyYgcrZbH5KXP9bR4P4RaVtOVEpcxOZnNlmKqNI=
X-Received: by 2002:a92:d94d:0:b0:2c8:45a5:926b with SMTP id
 l13-20020a92d94d000000b002c845a5926bmr15476348ilq.310.1648789238658; Thu, 31
 Mar 2022 22:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-2-edgar.iglesias@gmail.com>
In-Reply-To: <20220331222017.2914409-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Apr 2022 15:00:12 +1000
Message-ID: <CAKmqyKP7fD9pHsD4Fc5ApY0TroEHyy2eRVnqb=rD1JBHBTZ-bw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] timer: cadence_ttc: Break out header file to allow
 embedding
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 8:24 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> Break out header file to allow embedding of the the TTC.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>

