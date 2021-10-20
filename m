Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D8C434773
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:56:18 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md7OT-0000F5-EC
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1md7MV-0007KP-98
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:54:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56364 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1md7MR-00008e-GO
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:54:14 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx72op2W9hcS8dAA--.30298S3; 
 Wed, 20 Oct 2021 16:54:03 +0800 (CST)
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
Date: Wed, 20 Oct 2021 16:54:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx72op2W9hcS8dAA--.30298S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr45XFyfZF4fZr1xurykXwb_yoW5GFWxpr
 1kCFZ8trWUJrZ7Jw4ag3WUXr98Zr18G3ZrA3WSgFykArW7Xr92gw10gr4qgF1DJw48CF1j
 vryFvr9xuFn8J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
 62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6c
 x26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 yangxiaojuan@loongson.cn, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xuerui, Philippe.

On 10/19/2021 01:38 AM, Philippe Mathieu-Daudé wrote:
> On 10/18/21 18:06, WANG Xuerui wrote:
>> Hi Song,
>>
>> On 10/18/21 20:47, Song Gao wrote:
>>> This patch add target state header, target definitions
>>> and initialization routines.
>> "adds"; fix in other patches too.
>>>
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/loongarch/cpu-param.h |  19 +++
>>>   target/loongarch/cpu.c       | 285
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>   target/loongarch/cpu.h       | 151 +++++++++++++++++++++++
>>>   target/loongarch/internals.h |  23 ++++
>>>   4 files changed, 478 insertions(+)
>>>   create mode 100644 target/loongarch/cpu-param.h
>>>   create mode 100644 target/loongarch/cpu.c
>>>   create mode 100644 target/loongarch/cpu.h
>>>   create mode 100644 target/loongarch/internals.h
> 
> 
>>> +static void set_loongarch_cpucfg(CPULoongArchState *env)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < 49; i++) {
>>> +        env->cpucfg[i] = 0x0;
>>> +    }
>>> +    env->cpucfg[0] = 0x14c010;
>>> +    env->cpucfg[1] = 0x3f2f2fe;
>>> +    env->cpucfg[2] = 0x60c3cf;
>>> +    env->cpucfg[3] = 0xcff;
>>> +    env->cpucfg[4] = 0x5f5e100;
>>> +    env->cpucfg[5] = 0x10001;
>>> +    env->cpucfg[16] = 0x2c3d;
>>> +    env->cpucfg[17] = 0x6080003;
>>> +    env->cpucfg[18] = 0x6080003;
>>> +    env->cpucfg[19] = 0x60800f;
>>> +    env->cpucfg[20] = 0x60f000f;
>> I know these values are taken from a real 3A5000 chip, since I have such
>> a machine and I've done the experiment, but others likely wouldn't
>> notice so quickly. Maybe put some comment on top of this function to
>> illustrate this?
> 
> Simpler: ...
> 
On linux-user emulation. We don't care about the value of cpucfg[i]. 
I think we only need to set cpucfg[i] to 0. and set value on system emulations, is that better? 

>>> +}
>>> +
>>> +/* LoongArch CPU definitions */
>> Doc-string for such a function should be verb phrase; but in this case
>> would it be better to just drop the comment? The code is pretty concise
>> and self-documenting after all.
>>> +static void loongarch_3a5000_initfn(Object *obj)
>>> +{
>>> +    LoongArchCPU *cpu = LOONGARCH_CPU(obj);
>>> +    CPULoongArchState *env = &cpu->env;
>>> +
>>> +    set_loongarch_cpucfg(env);
> 
> ... directly inline here.
> OK.

Thanks
Song Gao
>>> +}


