Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90256E57B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 05:07:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pobfN-0000Yt-Q7; Mon, 17 Apr 2023 23:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pobfK-0000X1-Nf; Mon, 17 Apr 2023 23:05:58 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pobfH-0005H1-BG; Mon, 17 Apr 2023 23:05:58 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowAD32YIGCT5k5hi4BQ--.38903S2;
 Tue, 18 Apr 2023 11:05:43 +0800 (CST)
Message-ID: <2cf1870a-b668-13e5-7452-32e20c3cd0c8@iscas.ac.cn>
Date: Tue, 18 Apr 2023 11:05:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 1/6] target/riscv: Update pmp_get_tlb_size()
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-2-liweiwei@iscas.ac.cn>
 <CAKmqyKO4zAf18FPAzkKF9j1CV+RBaLc6-e45ZpBkJoKf8Y-dvg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKO4zAf18FPAzkKF9j1CV+RBaLc6-e45ZpBkJoKf8Y-dvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD32YIGCT5k5hi4BQ--.38903S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrWUtFykAF17Kr4UCFW7Jwb_yoWrtryxpr
 W8CF18CFWktrZxX34ftF4DXF15Cw4fKr4UAan7GFZYyan8W3yrAr1qkw4akry8Ga98ur4F
 9FyqkF1DCr4UZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.284,
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


On 2023/4/18 10:53, Alistair Francis wrote:
> On Thu, Apr 13, 2023 at 7:04 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Not only the matched PMP entry, Any PMP entry that overlap with partial of
>> the tlb page may make the regions in that page have different permission
>> rights. So all of them should be taken into consideration.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_helper.c |  7 ++-----
>>   target/riscv/pmp.c        | 34 +++++++++++++++++++++-------------
>>   target/riscv/pmp.h        |  3 +--
>>   3 files changed, 24 insertions(+), 20 deletions(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 433ea529b0..075fc0538a 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -703,11 +703,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>>       }
>>
>>       *prot = pmp_priv_to_page_prot(pmp_priv);
>> -    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
>> -        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>> -        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>> -
>> -        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
>> +    if (tlb_size != NULL) {
>> +        *tlb_size = pmp_get_tlb_size(env, addr);
>>       }
>>
>>       return TRANSLATE_SUCCESS;
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 1f5aca42e8..4f9389e73c 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -601,28 +601,36 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>>   }
>>
>>   /*
>> - * Calculate the TLB size if the start address or the end address of
>> + * Calculate the TLB size if any start address or the end address of
>>    * PMP entry is presented in the TLB page.
>>    */
>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>> -                              target_ulong tlb_sa, target_ulong tlb_ea)
>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
>>   {
>> -    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
>> -    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
>> +    target_ulong pmp_sa;
>> +    target_ulong pmp_ea;
>> +    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>> +    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>> +    int i;
>> +
>> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
>> +        pmp_sa = env->pmp_state.addr[i].sa;
>> +        pmp_ea = env->pmp_state.addr[i].ea;
>>
>> -    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
>> -        return TARGET_PAGE_SIZE;
>> -    } else {
>>           /*
>> -         * At this point we have a tlb_size that is the smallest possible size
>> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> This comment points out that we should have the smallest region, so
> I'm not clear why we need this change. Can you update the commit
> description to be clear on why this change is needed and what it
> fixes?

This function return tlb_size to 1 to make the tlb uncached. However, In 
previous implementation,

only the matched PMP entry of current access address is taken into 
consideration. Then, if other PMP entry

that match other address in the same page, we  may also cannot cache the 
tlb, since different address

in that page may have different permission rights.

Regards,

Weiwei Li

> Alistair
>
>> -         *
>> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
>> +         * If any start address or the end address of PMP entry is presented
>> +         * in the TLB page and cannot override the whole TLB page we drop the
>> +         * size to 1.
>>            * This means the result isn't cached in the TLB and is only used for
>>            * a single translation.
>>            */
>> -        return 1;
>> +        if (((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||
>> +             (pmp_ea >= tlb_sa && pmp_ea <= tlb_ea)) &&
>> +            !(pmp_sa == tlb_sa && pmp_ea == tlb_ea)) {
>> +            return 1;
>> +        }
>>       }
>> +
>> +    return TARGET_PAGE_SIZE;
>>   }
>>
>>   /*
>> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>> index b296ea1fc6..0a7e24750b 100644
>> --- a/target/riscv/pmp.h
>> +++ b/target/riscv/pmp.h
>> @@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>>                          target_ulong size, pmp_priv_t privs,
>>                          pmp_priv_t *allowed_privs,
>>                          target_ulong mode);
>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>> -                              target_ulong tlb_sa, target_ulong tlb_ea);
>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
>>   void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>>   void pmp_update_rule_nums(CPURISCVState *env);
>>   uint32_t pmp_get_num_rules(CPURISCVState *env);
>> --
>> 2.25.1
>>
>>


