Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559050F705
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:14:16 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHGx-0003mN-DE
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1njH6c-0003i1-9F
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:03:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42100 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1njH6U-0002Cc-8e
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:03:28 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWs1ZtWdi3AwyAA--.23692S3; 
 Tue, 26 Apr 2022 17:03:21 +0800 (CST)
Subject: Re: [PATCH v2 25/43] target/loongarch: Add LoongArch CSR instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-26-yangxiaojuan@loongson.cn>
 <cc6c67a1-d1c7-49dd-b661-23afdc5a308d@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <b8354320-078d-3f4a-efb3-9af07e5fd7c5@loongson.cn>
Date: Tue, 26 Apr 2022 17:03:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cc6c67a1-d1c7-49dd-b661-23afdc5a308d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxWs1ZtWdi3AwyAA--.23692S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DZF43JFWxGw45tFyftFb_yoW8JF4kpr
 48XryUtrW8Kr1vg34UGr1qgry5tr4Ut3W5t3s7Xa1UJFn5JryqgrW5Zrn09r90kr4kXryY
 yF4avr48Za17XrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
 ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard

On 2022/4/26 上午6:55, Richard Henderson wrote:
> On 4/25/22 02:10, Xiaojuan Yang wrote:
>> +static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
>> +                         const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "r%d, %d # %s", a->rd, a->csr, 
>> csr_names[a->csr]);
>> +}
>> +
>> +static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
>> +                          const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "r%d, r%d, %d # %s",
>> +           a->rd, a->rj, a->csr, csr_names[a->csr]);
>
> Need to check for csr not in csr_names.
>
I will re-used  get_csr() to check csr,

like this:
if (get_csr() == NULL)
{
     printf("Undefined CSR.\n");
} else {
     printf(" %s\n",  csr_names[a->csr]);
}
>> +    CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),
>
> You've dropped the special case from the previous version.  Why?
>
Hmm,   I readly lost this special case,  I will correct it on v3.

like this:
CSR_OFF_FUNCS(CPUID, CSRFL_READONLY,  gen_helper_csrrd_cpuid, NULL),

target_ulong helper_csrrd_cpuid(CPULoongArchState *env)
{
     return (env_cpu(env))->cpu_index;
}

Thanks.
Xiaojuan


