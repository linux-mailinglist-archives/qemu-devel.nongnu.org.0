Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E35066D6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:22:38 +0200 (CEST)
Received: from localhost ([::1]:36166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngj88-0007Wn-Fa
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ngiMN-0002Js-35
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:33:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41858 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ngiMI-0001Wl-Po
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 03:33:14 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7xCxZV5iBbcoAA--.22291S3; 
 Tue, 19 Apr 2022 15:33:06 +0800 (CST)
Subject: Re: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
 <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <8193af0c-4ba3-3154-45a5-de8fefa0ddad@loongson.cn>
Date: Tue, 19 Apr 2022 15:33:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3409287c-ac98-2087-3d00-1bd23c1a00da@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dx7xCxZV5iBbcoAA--.22291S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4rWw45tr1DCrykKF1xZrb_yoW8GFW3pr
 s5Jr4DJry8trn5Ww1UXr1jyFy5Aw48J3Z8Jw4kXF1qyF4xJryvgrWUurnFgFy5Jr4fXr1j
 yw4jvrs7Zr47Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUbWCJPUUUUU==
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


On 2022/4/16 上午9:04, Richard Henderson wrote:
> On 4/15/22 02:40, Xiaojuan Yang wrote:
...
>> +void  helper_csr_update(CPULoongArchState *env, target_ulong new_val,
>> +                        target_ulong csr_offset)
>> +{
>> +    uint64_t *csr = (void *)env + csr_offset;
>> +
>> +    *csr = new_val;
>> +}
> This function should not exist
...
>> +    switch (a->csr) {
>> +    case LOONGARCH_CSR_ESTAT:
>> +        gen_helper_csrwr_estat(dest, cpu_env, new_val);
>> +        break;
>> +    case LOONGARCH_CSR_ASID:
>> +        gen_helper_csrwr_asid(dest, cpu_env, new_val);
>> +        break;
>> +    case LOONGARCH_CSR_TCFG:
>> +        gen_helper_csrwr_tcfg(dest, cpu_env, new_val);
>> +        break;
>> +    case LOONGARCH_CSR_TICLR:
>> +        gen_helper_csrwr_ticlr(dest, cpu_env, new_val);
>> +        break;
>> +    default:
>> +        tcg_gen_mov_tl(dest, old_val);
>> +    }
>> +
>> +    gen_helper_csr_update(cpu_env, new_val, 
>> tcg_constant_tl(csr_offset));
>
> Note that helper_csr_update is nothing more than the store to csr_offset.
On trans_csrxchg() , I am don't know how to use a TCGv value 'new_val 
'to update an uint64_t value "CSR_XXX",  So I use helper_csr_update(),

Thanks.
Xiaojuan
> r~


