Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA474EBE5D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:07:33 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVEi-00045q-It
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZV8z-0000Uv-Ue
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:01:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47792 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZV8t-0005va-Ep
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:01:37 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxDxNwKkRihe4SAA--.20839S3; 
 Wed, 30 Mar 2022 18:01:20 +0800 (CST)
Subject: Re: [RFC PATCH v7 07/29] target/loongarch: Add LoongArch CSR
 instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-8-yangxiaojuan@loongson.cn>
 <aa21e33f-6729-d148-96e6-1f0617ddbc39@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <f3f98d53-5f6e-3971-e583-617858dbdf7d@loongson.cn>
Date: Wed, 30 Mar 2022 18:01:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aa21e33f-6729-d148-96e6-1f0617ddbc39@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------CDABBEC39DBADCDCEB10A687"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxDxNwKkRihe4SAA--.20839S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr43AFyUWFy7Zw47GFyfJFb_yoW8Cr1xpr
 18Grs8AryUJFn2gw17Jr1DuryUJw17J3y5Jw18XF1qyr1UXrn0qrWjgrnFgF1UGr48Xr47
 C3WUZw18ZF47JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv214x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjI
 I2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
 02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
 Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
 CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
 14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
 7VUb_gA7UUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------CDABBEC39DBADCDCEB10A687
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/3/29 上午2:34, Richard Henderson wrote:
>> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
>> +{
>> +    LoongArchCPU *cpu;
>> +    int64_t v;
>> +
>> +    switch (csr) {
>> +    case LOONGARCH_CSR_PGD:
>> +        if (env->CSR_TLBRERA & 0x1) {
>> +            v = env->CSR_TLBRBADV;
>> +        } else {
>> +            v = env->CSR_BADV;
>> +        }
>> +
>> +        if ((v >> 63) & 0x1) {
>> +            v = env->CSR_PGDH;
>> +        } else {
>> +            v = env->CSR_PGDL;
>> +        }
>> +        break;
>> +    case LOONGARCH_CSR_CPUID:
>> +        v = (env_cpu(env))->cpu_index;
>> +        break;
>> +    case LOONGARCH_CSR_TVAL:
>> +        cpu = LOONGARCH_CPU(env_cpu(env));
>> +        v = cpu_loongarch_get_constant_timer_ticks(cpu);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return v;
>> +}
>
> You should have seen a compiler warning for 'v' uninitialized here, 
> via the default path.
>
> The default path should not be reachable, because of code in 
> trans_csrrd, and so could be written as g_assert_not_reachable(). 
> However, I strongly suggest you split this function so that you do not 
> need a switch here at all.  With CPUID now handled via cpu_csr_offset, 
> there are only two helpers needed. 
trans_csrrd {
...
     switch(a->csr) {
     case LOONGARCH_CSR_PGD:
         gen_helper_csrrd_pgd();
         break;
     case LOONGARCH_CSR_TVAL:
         gen_helper_csrrd_tval();
         break;
     case LOONGARCH_CSR_CPUID:
         ...
     default:
         ...
     }
}
And the same in trans_csrwr, is this right?

Thanks.
Xiaojuan

--------------CDABBEC39DBADCDCEB10A687
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/3/29 上午2:34, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aa21e33f-6729-d148-96e6-1f0617ddbc39@linaro.org">
      <blockquote type="cite" style="color: #000000;">+target_ulong
        helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
        <br>
        +{
        <br>
        +    LoongArchCPU *cpu;
        <br>
        +    int64_t v;
        <br>
        +
        <br>
        +    switch (csr) {
        <br>
        +    case LOONGARCH_CSR_PGD:
        <br>
        +        if (env-&gt;CSR_TLBRERA &amp; 0x1) {
        <br>
        +            v = env-&gt;CSR_TLBRBADV;
        <br>
        +        } else {
        <br>
        +            v = env-&gt;CSR_BADV;
        <br>
        +        }
        <br>
        +
        <br>
        +        if ((v &gt;&gt; 63) &amp; 0x1) {
        <br>
        +            v = env-&gt;CSR_PGDH;
        <br>
        +        } else {
        <br>
        +            v = env-&gt;CSR_PGDL;
        <br>
        +        }
        <br>
        +        break;
        <br>
        +    case LOONGARCH_CSR_CPUID:
        <br>
        +        v = (env_cpu(env))-&gt;cpu_index;
        <br>
        +        break;
        <br>
        +    case LOONGARCH_CSR_TVAL:
        <br>
        +        cpu = LOONGARCH_CPU(env_cpu(env));
        <br>
        +        v = cpu_loongarch_get_constant_timer_ticks(cpu);
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        break;
        <br>
        +    }
        <br>
        +
        <br>
        +    return v;
        <br>
        +}
        <br>
      </blockquote>
      <br>
      You should have seen a compiler warning for 'v' uninitialized
      here, via the default path.
      <br>
      <br>
      The default path should not be reachable, because of code in
      trans_csrrd, and so could be written as g_assert_not_reachable(). 
      However, I strongly suggest you split this function so that you do
      not need a switch here at all.  With CPUID now handled via
      cpu_csr_offset, there are only two helpers needed.
    </blockquote>
    trans_csrrd {<br>
    ...<br>
        switch(a-&gt;csr) {<br>
        case LOONGARCH_CSR_PGD:<br>
            gen_helper_csrrd_pgd();<br>
            break;<br>
        case LOONGARCH_CSR_TVAL:<br>
            gen_helper_csrrd_tval();<br>
            break;<br>
        case LOONGARCH_CSR_CPUID:<br>
            ...<br>
        default:<br>
            ...<br>
        }<br>
    }<br>
    And the same in trans_csrwr, is this right?<br>
    <br>
    Thanks.<br>
    Xiaojuan<br>
  </body>
</html>

--------------CDABBEC39DBADCDCEB10A687--


