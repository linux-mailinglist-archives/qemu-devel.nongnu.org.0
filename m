Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E5442EA7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:59:46 +0100 (CET)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtOD-00056l-6L
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhtJm-0005di-J5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:55:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36684 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhtJj-0003mT-78
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:55:10 -0400
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxZeUUNYFh6zUkAA--.63410S3; 
 Tue, 02 Nov 2021 20:54:44 +0800 (CST)
Subject: Re: [PATCH v8 02/29] target/loongarch: Add core definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
 <1635760311-20015-3-git-send-email-gaosong@loongson.cn>
 <bdc9d879-dbe7-dc48-7bf5-4d150996174a@amsat.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <cf9478e4-4d5f-923a-d2fa-3668cd79d30b@loongson.cn>
Date: Tue, 2 Nov 2021 20:54:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bdc9d879-dbe7-dc48-7bf5-4d150996174a@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxZeUUNYFh6zUkAA--.63410S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw43ZFW5Jry8AF4xXw4Utwb_yoW7Xw43pr
 W7Ars0gasrtr1xAw43XFW2krn5Zr4xGw12ya1xJFWDZ3yqvFn7Xa97JFyxAry2vw13AF40
 9FW5AF93WFs8JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, i.qemu@xen0n.name,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, peterx@redhat.com,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/11/2 下午4:38, Philippe Mathieu-Daudé wrote:
> On 11/1/21 10:51, Song Gao wrote:
>> This patch adds target state header, target definitions
>> and initialization routines.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   target/loongarch/cpu-param.h |  19 +++
>>   target/loongarch/cpu.c       | 352 +++++++++++++++++++++++++++++++++++++++++++
>>   target/loongarch/cpu.h       | 254 +++++++++++++++++++++++++++++++
>>   target/loongarch/internals.h |  22 +++
>>   4 files changed, 647 insertions(+)
>>   create mode 100644 target/loongarch/cpu-param.h
>>   create mode 100644 target/loongarch/cpu.c
>>   create mode 100644 target/loongarch/cpu.h
>>   create mode 100644 target/loongarch/internals.h
>>
>> +static void set_loongarch_cpucfg(CPULoongArchState *env)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < 49; i++) {
>> +        env->cpucfg[i] = 0x0;
>> +    }
>> +
>> +    env->cpucfg[0] = 0x14c010;  /* PRID */
> Why do you insist in calling this generically and not
> loongarch_3a5000_initfn()?

This function is called in 2 places,  loongarch_3a5000_initfn() and 
loongarch_cpu_reset().  So I think we need this function,

But now I realize that the CPUCFG instruction is read-only the cpucfg[i] 
values,  We need't to call this function in loongarch_cpu_reset().  We 
should move this code in loongarch_3a5000_initfn().

> If you want a generic function,
> why not pass PRID and xtal freq as arguments?

Currently the cpucfg[i] values are fixed.   the cpucfg[i] values are 
from 3a5000 Hardware.

I didn't realize that the cpucfg[i] valuse might be different on 3a6000 
or  later.

I think we need a  variable features  on CPULoongArchState, like  arm.  
This is what you mentioned before.

>> +
>> +    uint32_t data = 0;
>> +    data = FIELD_DP32(data, CPUCFG1, ARCH, 2);
>> +    data = FIELD_DP32(data, CPUCFG1, PGMMU, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, IOCSR, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, PALEN, 0x2f);
>> +    data = FIELD_DP32(data, CPUCFG1, VALEN, 0x2f);
>> +    data = FIELD_DP32(data, CPUCFG1, UAL, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, RI, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, EP, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, RPLV, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, HP, 1);
>> +    data = FIELD_DP32(data, CPUCFG1, IOCSR_BRD, 1);
>> +    env->cpucfg[1] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG2, FP, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, FP_SP, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, FP_DP, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, FP_VER, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, LSX, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, LASX, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, COMPLEX, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, CRYPTO, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, LLFTP, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, LLFTP_VER, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, LSPW, 1);
>> +    data = FIELD_DP32(data, CPUCFG2, LAM, 1);
>> +    env->cpucfg[2] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG3, CCDMA, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, SFB, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, UCACC, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, LLEXC, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, SCDLY, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, LLDBAR, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, ITLBHMC, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, ICHMC, 1);
>> +    data = FIELD_DP32(data, CPUCFG3, SPW_LVL, 4);
>> +    data = FIELD_DP32(data, CPUCFG3, SPW_HP_HF, 1);
>> +    env->cpucfg[3] = data;
>> +
>> +    env->cpucfg[4] = 0x5f5e100; /* Crystal frequency */
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG5, CC_MUL, 1);
>> +    data = FIELD_DP32(data, CPUCFG5, CC_DIV, 1);
>> +    env->cpucfg[5] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG16, L1_IUPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L1_DPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L2_IUUNIFY, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L2_IUPRIV, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUPRE, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUUNIFY, 1);
>> +    data = FIELD_DP32(data, CPUCFG16, L3_IUINCL, 1);
>> +    env->cpucfg[16] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG17, L1IU_WAYS, 0x8003);
>> +    data = FIELD_DP32(data, CPUCFG17, L1IU_SETS, 0x60);
>> +    env->cpucfg[17] =  data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG18, L1D_WAYS, 0x8003);
>> +    data = FIELD_DP32(data, CPUCFG18, L1D_SETS, 0x60);
>> +    env->cpucfg[18] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG19, L2IU_WAYS, 0x800f);
>> +    data = FIELD_DP32(data, CPUCFG19, L2IU_SETS, 0x60);
>> +    env->cpucfg[19] = data;
>> +
>> +    data = 0;
>> +    data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 0xf00f);
>> +    data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 0x60);
>> +    env->cpucfg[20] = data;
>> +}
>> +
>> +static inline void loongarch_3a5000_initfn(Object *obj)
> 'inline' is not justified.

I misunderstood what you meant in V7 comments,  I'll correct it.

Thanks.

Song Gao


