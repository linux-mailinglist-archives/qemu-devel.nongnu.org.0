Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD6449DF0B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:18:56 +0100 (CET)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1rj-0006Ns-Ls
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nD1au-0002hj-2h
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:01:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40038 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nD1ar-00040a-1A
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 05:01:31 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb+JsbfJh5+MEAA--.16304S3; 
 Thu, 27 Jan 2022 18:01:17 +0800 (CST)
Subject: Re: [RFC PATCH v4 03/30] target/loongarch: Add basic vmstate
 description of CPU.
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-4-yangxiaojuan@loongson.cn>
 <f1742996-1739-c8d5-6a86-023261853c49@ilande.co.uk>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <69ee53d4-afd5-da26-26db-91e4da336220@loongson.cn>
Date: Thu, 27 Jan 2022 18:01:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f1742996-1739-c8d5-6a86-023261853c49@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb+JsbfJh5+MEAA--.16304S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GF1DCw48tr4kCw4DGryUKFg_yoWxuw1rpr
 y3uF17KFsFvrWxZw48G3s8WrsxWr4a93WS9a1akr1kGr1kJr4kWw1093srWF1rAwn8K34I
 9rW0qa9rWanFy37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI
 0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8v
 x2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
 x2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0db1UUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Mark

在 2022年01月15日 20:52, Mark Cave-Ayland 写道:
> On 08/01/2022 09:13, Xiaojuan Yang wrote:
> 
>> This patch introduce vmstate_loongarch_cpu
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/loongarch/cpu.c       |  3 ++
>>   target/loongarch/internals.h |  4 ++
>>   target/loongarch/machine.c   | 84 ++++++++++++++++++++++++++++++++++++
>>   target/loongarch/meson.build |  6 +++
>>   4 files changed, 97 insertions(+)
>>   create mode 100644 target/loongarch/machine.c
>>
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index ed03ec2986..6e3dc5e6fa 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -320,6 +320,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>>       cc->has_work = loongarch_cpu_has_work;
>>       cc->dump_state = loongarch_cpu_dump_state;
>>       cc->set_pc = loongarch_cpu_set_pc;
>> +#ifndef CONFIG_USER_ONLY
>> +    dc->vmsd = &vmstate_loongarch_cpu;
>> +#endif
> 
> Do we need CONFIG_USER_ONLY guards around dc->vmsd? I'd expect this to simply be ignored in linux-user mode. Again it's a bit hard to see the full context without having the complete series available in git somewhere.

I have reorganized the patch and prepare to send the V5 patch.
Here we define the vmsd struct in the machine.c which only used by system mode. So we need the CONFIG_USER_ONLY.

You can get LoongArch qemu series code like this:
    git clone https://github.com/loongson/qemu.git
    git checkout branch tcg-dev

xiaojuan,
thanks 

> 
>>       cc->disas_set_info = loongarch_cpu_disas_set_info;
>>   #ifdef CONFIG_TCG
>>       cc->tcg_ops = &loongarch_tcg_ops;
>> diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
>> index 774a87ec80..c8e6f7012c 100644
>> --- a/target/loongarch/internals.h
>> +++ b/target/loongarch/internals.h
>> @@ -25,4 +25,8 @@ const char *loongarch_exception_name(int32_t exception);
>>     void restore_fp_status(CPULoongArchState *env);
>>   +#ifndef CONFIG_USER_ONLY
>> +extern const VMStateDescription vmstate_loongarch_cpu;
>> +#endif
>> +
>>   #endif
>> diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
>> new file mode 100644
>> index 0000000000..b9effe6db2
>> --- /dev/null
>> +++ b/target/loongarch/machine.c
>> @@ -0,0 +1,84 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * QEMU LoongArch machine State
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "migration/cpu.h"
>> +
>> +/* LoongArch CPU state */
>> +
>> +const VMStateDescription vmstate_loongarch_cpu = {
>> +    .name = "cpu",
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .fields = (VMStateField[]) {
>> +
>> +        VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
>> +        VMSTATE_UINTTL(env.pc, LoongArchCPU),
>> +        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
>> +        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
>> +
>> +        /* Remaining CSR registers */
>> +        VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PRMD, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_EUEN, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MISC, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_ECFG, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_ESTAT, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_ERA, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_BADV, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_BADI, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_EENTRY, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBIDX, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBEHI, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBELO0, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBELO1, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_ASID, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PGDL, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PGDH, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PGD, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PWCL, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PWCH, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_STLBPS, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_RVACFG, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_CPUID, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PRCFG1, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PRCFG2, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_PRCFG3, LoongArchCPU),
>> +        VMSTATE_UINT64_ARRAY(env.CSR_SAVE, LoongArchCPU, 16),
>> +        VMSTATE_UINT64(env.CSR_TID, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TCFG, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TVAL, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_CNTC, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TICLR, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_LLBCTL, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_IMPCTL1, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_IMPCTL2, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRENTRY, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRBADV, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRERA, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRSAVE, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRELO0, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRELO1, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBREHI, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_TLBRPRMD, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MERRCTL, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MERRINFO1, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MERRINFO2, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MERRENTRY, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MERRERA, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_MERRSAVE, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_CTAG, LoongArchCPU),
>> +        VMSTATE_UINT64_ARRAY(env.CSR_DMW, LoongArchCPU, 4),
>> +        /* debug */
>> +        VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
>> +        VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
>> +
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
>> index bcb076e55f..103f36ee15 100644
>> --- a/target/loongarch/meson.build
>> +++ b/target/loongarch/meson.build
>> @@ -14,6 +14,12 @@ loongarch_tcg_ss.add(files(
>>   ))
>>   loongarch_tcg_ss.add(zlib)
>>   +loongarch_softmmu_ss = ss.source_set()
>> +loongarch_softmmu_ss.add(files(
>> +  'machine.c',
>> +))
>> +
>>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
>>     target_arch += {'loongarch': loongarch_ss}
>> +target_softmmu_arch += {'loongarch': loongarch_softmmu_ss}
> 
> 
> ATB,
> 
> Mark.


