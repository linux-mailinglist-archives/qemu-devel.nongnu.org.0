Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C66E943C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:29:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTOM-0004ch-Nw; Thu, 20 Apr 2023 08:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ppTOG-0004aY-MU; Thu, 20 Apr 2023 08:27:56 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ppTO7-0001cr-9j; Thu, 20 Apr 2023 08:27:56 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowACnrnq0L0FkYOpxBw--.3846S2;
 Thu, 20 Apr 2023 20:27:33 +0800 (CST)
Message-ID: <9eb5c95d-6cdc-f3f7-ba27-c271be39afe6@iscas.ac.cn>
Date: Thu, 20 Apr 2023 20:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v3 1/7] target/riscv: Update pmp_get_tlb_size()
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-2-liweiwei@iscas.ac.cn>
 <eb169df2-84c5-30fe-4638-b01e736463a7@linux.alibaba.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <eb169df2-84c5-30fe-4638-b01e736463a7@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrnq0L0FkYOpxBw--.3846S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtrW5uF4ftFyUKr48Gr18AFb_yoWxAr4Dpr
 48JrWUGrWUGrykJw13JryUJFy5Ar17K3WUJr1xWFW5Aw43J34Y9r1DWrnFgr1UJrW8Wr1j
 yr1UArsruF1UXF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.669,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2023/4/20 19:58, LIU Zhiwei wrote:
>
> On 2023/4/19 11:27, Weiwei Li wrote:
>> PMP entries before the matched PMP entry(including the matched PMP 
>> entry)
>> may overlap partial of the tlb page, which may make different regions in
>> that page have different permission rights, such as for
>> PMP0(0x80000008~0x8000000F, R) and PMP1(0x80001000~0x80001FFF, RWX))
>> write access to 0x80000000 will match PMP1. However we cannot cache 
>> the tlb
>> for it since this will make the write access to 0x80000008 bypass the 
>> check
>> of PMP0. So we should check all of them and set the tlb size to 1 in 
>> this
>> case.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_helper.c |  7 ++-----
>>   target/riscv/pmp.c        | 39 ++++++++++++++++++++++++++-------------
>>   target/riscv/pmp.h        |  3 +--
>>   3 files changed, 29 insertions(+), 20 deletions(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 433ea529b0..075fc0538a 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -703,11 +703,8 @@ static int 
>> get_physical_address_pmp(CPURISCVState *env, int *prot,
>>       }
>>         *prot = pmp_priv_to_page_prot(pmp_priv);
>> -    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
>> -        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>> -        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>> -
>> -        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
>> +    if (tlb_size != NULL) {
>> +        *tlb_size = pmp_get_tlb_size(env, addr);
>>       }
>>         return TRANSLATE_SUCCESS;
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 1f5aca42e8..22f3b3f217 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -601,28 +601,41 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>>   }
>>     /*
>> - * Calculate the TLB size if the start address or the end address of
>> + * Calculate the TLB size if any start address or the end address of
>>    * PMP entry is presented in the TLB page.
>>    */
>
>  If we don't pass the start address or the end address parameter, we 
> can comment this function:
>
> Calculate the TLB size according to the PMP rule with the highest 
> priority.

This seems  also not accurate. It's the first(highest priority) PMP 
entry that overlap with the tlb page really matters.

Maybe we can modify it to:

"Calculate the TLB size. Return 1 if the first PMP entry that overlaps 
with the TLB page doesn't cover the whole page . Return TARGET_PAGE_SIZE 
otherwise."

>
>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>> -                              target_ulong tlb_sa, target_ulong tlb_ea)
>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
>>   {
>> -    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
>> -    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
>> +    target_ulong pmp_sa;
>> +    target_ulong pmp_ea;
>> +    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>> +    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>> +    int i;
>> +
>> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
>> +        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == 
>> PMP_AMATCH_OFF) {
>> +            continue;
>> +        }
>> +
>> +        pmp_sa = env->pmp_state.addr[i].sa;
>> +        pmp_ea = env->pmp_state.addr[i].ea;
>>   -    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
>> -        return TARGET_PAGE_SIZE;
>> -    } else {
>>           /*
>> -         * At this point we have a tlb_size that is the smallest 
>> possible size
>> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
>> -         *
>> -         * If the size is less then TARGET_PAGE_SIZE we drop the 
>> size to 1.
>> +         * If any start address or the end address of PMP entry is 
>> presented
>> +         * in the TLB page and cannot override the whole TLB page we 
>> drop the
>> +         * size to 1.
>>            * This means the result isn't cached in the TLB and is 
>> only used for
>>            * a single translation.
>>            */
>> -        return 1;
>> +        if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
>> +            return TARGET_PAGE_SIZE;
>> +        } else if ((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||
>> +                   (pmp_ea >= tlb_sa && pmp_ea <= tlb_ea)) {
>> +            return 1;
>> +        }
>>       }
>> +
>> +    return TARGET_PAGE_SIZE;
>
> This implicitly require a success return from the 
> get_physical_address_pmp call. If we want this function to be a 
> independent one, we should return 0 to indicate no tlb size can return.

Yeah. I think the default should be TARGET_PAGE_SIZE if no PMP entry 
overlap with the tlb page, since in this case, tlb_size should be 
TARGET_PAGE_SIZE if the translation(inlcuding PMP check) successes while 
tlb_size will be ignored if the translation fails.

Regards,

Weiwei Li

>
> Zhiwei
>
>>   }
>>     /*
>> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>> index b296ea1fc6..0a7e24750b 100644
>> --- a/target/riscv/pmp.h
>> +++ b/target/riscv/pmp.h
>> @@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>> target_ulong addr,
>>                          target_ulong size, pmp_priv_t privs,
>>                          pmp_priv_t *allowed_privs,
>>                          target_ulong mode);
>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>> -                              target_ulong tlb_sa, target_ulong 
>> tlb_ea);
>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
>>   void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>>   void pmp_update_rule_nums(CPURISCVState *env);
>>   uint32_t pmp_get_num_rules(CPURISCVState *env);


