Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A8468684
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:27:30 +0100 (CET)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYor-0006fg-DR
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYnh-0005yW-Q5
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:26:17 -0500
Received: from [2a00:1450:4864:20::42e] (port=45927
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYnf-0003LX-PX
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:26:17 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o13so12751686wrs.12
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TRWSaDyUFdyyziDCCaZ6y6/Gjy1w+ngyBI2w6DjY2NU=;
 b=PLdZ13X32ChYSNrNb5ZtzNPhEemjJAwkw/jHMAAklTFgar5zic9a5PA+FNZn7jjXrb
 ITgB1MgPwX0pf2sEaE8lbm9uq8Jrd4vnhhg81MY+TxNaidXNM7yeoJX36DKswBoA28/S
 veTF1VgEo2yD4nuDvJmD+C6G7tcYeep7wj+xoPGJEBm0S+0w8Cwx9MdvLs2Gs6Jg2fMR
 lDJOf2EJw0LSGK50DjSzSp2kWdr2lJ7WHHaRtBPa9mmdH6/VbFqD0YlRL0TR0TFR0zwk
 pOzXLIa5eSW9tr+2NX1c/v3grEfdSfsilD8NmwT52Xrxe6WAGpJI0U6DyQMkjDHlnlUS
 CF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TRWSaDyUFdyyziDCCaZ6y6/Gjy1w+ngyBI2w6DjY2NU=;
 b=8A/1BWp5ThTC1RMoabG0waNfwCLRZCjXZKxuaRB6er6W6dFiv0QIAiQjySnfGm+cu9
 Gd5cxOMlu10XgtNQEdIVAwzKLQyrQKZnJPp3tfw7XyajVPZHMyE+f9zUUgEp65eo9lWk
 LwthMxo6K3zFtcRkv93ZBjHsLORevKOhi27ft0zdP7lAlcspLFWaqwfltJmVf/EWBgea
 Xc10Z8hBoeea9CeCZ2yCj8yuJtF315IzXMKVYQ6GNBUM7lmvZTSNLyU+Cwyf4WX4fUkb
 0NXPDB093qHft2/fbcPk/BKhBhut1BVsUUmnX9CWDDat4TGma2CF+R+qClXSzNeSPNxo
 U/sQ==
X-Gm-Message-State: AOAM53045xPs2ClNglvglq6qrcAJZ/H179zaBunVmPdhXoTqq9sboIUF
 BzyQkKCeNJU9DWyYEqR1Rc8=
X-Google-Smtp-Source: ABdhPJzl01JQfBVDpwKil5wGv4FaC3DHppYnw5Artog2e71aHvFgEALA7XjlVJUMq/fum0w2VA7HQA==
X-Received: by 2002:a5d:4889:: with SMTP id g9mr30684622wrq.455.1638638774634; 
 Sat, 04 Dec 2021 09:26:14 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id d8sm5861034wrm.76.2021.12.04.09.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:26:14 -0800 (PST)
Message-ID: <9700d154-7185-b71f-4ab3-9c89f3021f7c@amsat.org>
Date: Sat, 4 Dec 2021 18:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 02/26] target/loongarch: Add core definition
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-3-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-3-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> This patch adds target state header, target definitions
> and initialization routines.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/loongarch/cpu-param.h |  18 +++
>  target/loongarch/cpu.c       | 313 +++++++++++++++++++++++++++++++++++++++++++
>  target/loongarch/cpu.h       | 252 ++++++++++++++++++++++++++++++++++
>  target/loongarch/internals.h |  21 +++
>  4 files changed, 604 insertions(+)
>  create mode 100644 target/loongarch/cpu-param.h
>  create mode 100644 target/loongarch/cpu.c
>  create mode 100644 target/loongarch/cpu.h
>  create mode 100644 target/loongarch/internals.h

> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> new file mode 100644
> index 0000000..05ceb9c
> --- /dev/null
> +++ b/target/loongarch/cpu.c
> @@ -0,0 +1,313 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch CPU
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/qemu-print.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "sysemu/qtest.h"
> +#include "exec/exec-all.h"
> +#include "qapi/qapi-commands-machine-target.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "fpu/softfloat-helpers.h"
> +
> +const char * const regnames[] = {

[32]

> +    "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
> +    "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
> +    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> +    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
> +};
> +
> +const char * const fregnames[] = {

[32]

> +    "f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",
> +    "f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",
> +    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
> +    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
> +};
> +
> +static const char * const excp_names[EXCP_LAST + 1] = {
> +    [EXCP_SYSCALL] = "Syscall",
> +    [EXCP_BREAK] = "Break",
> +    [EXCP_INE] = "Instruction Non-existent",
> +    [EXCP_FPE] = "Floating Point Exception",
> +};
> +
> +const char *loongarch_exception_name(int32_t exception)
> +{

       assert(excp_names[exception]);

?

> +    return excp_names[exception];
> +}

> +static void loongarch_3a5000_initfn(Object *obj)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
> +    CPULoongArchState *env = &cpu->env;
> +    int i;

> +    env->cpucfg[4] = 0x5f5e100; /* Crystal frequency */

100 * 1000 * 1000

> +}

> +static void loongarch_cpu_reset(DeviceState *dev)
> +{
> +    CPUState *cs = CPU(dev);
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
> +    CPULoongArchState *env = &cpu->env;
> +
> +    lacc->parent_reset(dev);
> +
> +    env->fcsr0_mask = 0x1f1f031f;

Is this for all CPUs or only the 3A5000?

> +    env->fcsr0 = 0x0;
> +
> +    cs->exception_index = EXCP_NONE;
> +}

> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> new file mode 100644
> index 0000000..ab60322
> --- /dev/null
> +++ b/target/loongarch/cpu.h
> @@ -0,0 +1,252 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch CPU
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_CPU_H
> +#define LOONGARCH_CPU_H
> +
> +#include "exec/cpu-defs.h"
> +#include "fpu/softfloat-types.h"
> +#include "hw/registerfields.h"
> +
> +#define TCG_GUEST_DEFAULT_MO (0)
> +
> +#define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
> +#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
> +#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
> +#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */

> +extern const char * const regnames[];
> +extern const char * const fregnames[];

[32] to both.

