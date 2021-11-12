Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C644E031
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:16:41 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlM7L-0001uC-Pw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mlM5s-0000by-O9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:15:08 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41894 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mlM5p-0005lC-Iy
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:15:08 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxCdEZzo1hv2cCAA--.5741S3;
 Fri, 12 Nov 2021 10:14:49 +0800 (CST)
Subject: Re: [RFC PATCH v2 02/30] target/loongarch: Add CSR registers
 definition
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-3-git-send-email-yangxiaojuan@loongson.cn>
 <7bb438bb-e4ae-8f28-8f9e-7baecbccc1ac@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <bd00cd00-2dea-d6dc-f151-62ca3d90003d@loongson.cn>
Date: Fri, 12 Nov 2021 10:14:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7bb438bb-e4ae-8f28-8f9e-7baecbccc1ac@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9CxCdEZzo1hv2cCAA--.5741S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuFWDCr1Duw13Cr47uFy5XFb_yoWxAFWrpr
 yFkr9rKFy8tFsxKr1kX3W5Ga1UGr4fKw45Kw48trs2ya10k34kCrWqgr4akFy3Wrn8Jr45
 A3WDXayUu3W7WrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67
 AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS
 5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI4
 8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
 wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjx
 v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
 Y4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0db1UUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard,

On 11/11/2021 09:29 PM, Richard Henderson wrote:
> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>> +#define LOONGARCH_CSR_MISC           0x3 /* Misc config */
>> +
> 
> Missing bitfield definitions for misc.
> 

 At present, there is no read/write to each field of misc register so it is not defined.

>> +#define  EXCODE_IP                   64
> 
> What's this?
> 

The manual 6.1.3 says the exception number of an interrupt is the exception number plus an offset of 64.
This defines the offset, sorry, the name is bad, maybe change a name or just use 64 directly in the
exception handle is better.

>> +#define  EXCCODE_INT                 0
>> +#define  EXCCODE_PIL                 1
>> +#define  EXCCODE_PIS                 2
>> +#define  EXCCODE_PIF                 3
>> +#define  EXCCODE_PME                 4
>> +#define  EXCCODE_PNR                 5
>> +#define  EXCCODE_PNX                 6
>> +#define  EXCCODE_PPI                 7
>> +#define  EXCCODE_ADE                 8
> 
> ADEF vs ADEM?
> 
Yes, ADEF and ADEM have different esubcode, maybe I should add a description.

>> +#define  EXCCODE_ALE                 9
>> +#define  EXCCODE_BCE                 10
>> +#define  EXCCODE_SYS                 11
>> +#define  EXCCODE_BRK                 12
>> +#define  EXCCODE_INE                 13
>> +#define  EXCCODE_IPE                 14
>> +#define  EXCCODE_FPD                 15
>> +#define  EXCCODE_SXD                 16
>> +#define  EXCCODE_ASXD                17
>> +#define  EXCCODE_FPE                 18 /* Have different expsubcode */
>> +#define  EXCCODE_VFPE                18
>> +#define  EXCCODE_WPEF                19 /* Have different expsubcode */
>> +#define  EXCCODE_WPEM                19
>> +#define  EXCCODE_BTD                 20
>> +#define  EXCCODE_BTE                 21
> 
> Missing BSPR, HVC, GCSC, GCHC.
> 

 At present, these exceptions are not triggered, so they are not defined.
 They are used by kvm. 

>> +#define LOONGARCH_CSR_ERA            0x6 /* ERA */
> 
> Not really helpful to name the acronym with the acronym.
> "Exception return address".
> 

OK, I will use a more detailed description for all the registers.

>> +#define LOONGARCH_CSR_TLBELO0        0x12 /* TLB EntryLo0 */
>> +FIELD(CSR_TLBELO0, V, 0, 1)
>> +FIELD(CSR_TLBELO0, D, 1, 1)
>> +FIELD(CSR_TLBELO0, PLV, 2, 2)
>> +FIELD(CSR_TLBELO0, MAT, 4, 2)
>> +FIELD(CSR_TLBELO0, G, 6, 1)
>> +FIELD(CSR_TLBELO0, PPN, 12, 36)
>> +FIELD(CSR_TLBELO0, NR, 61, 1)
>> +FIELD(CSR_TLBELO0, NX, 62, 1)
>> +FIELD(CSR_TLBELO0, RPLV, 63, 1)
>> +
>> +#define LOONGARCH_CSR_TLBELO1        0x13 /* 64 TLB EntryLo1 */
>> +FIELD(CSR_TLBELO1, V, 0, 1)
>> +FIELD(CSR_TLBELO1, D, 1, 1)
>> +FIELD(CSR_TLBELO1, PLV, 2, 2)
>> +FIELD(CSR_TLBELO1, MAT, 4, 2)
>> +FIELD(CSR_TLBELO1, G, 6, 1)
>> +FIELD(CSR_TLBELO1, PPN, 12, 36)
>> +FIELD(CSR_TLBELO1, NR, 61, 1)
>> +FIELD(CSR_TLBELO1, NX, 62, 1)
>> +FIELD(CSR_TLBELO1, RPLV, 63, 1)
> 
> Better to define the fields once, dropping the 0/1 from the name.
OK, I will modify.
> 
>> +#define LOONGARCH_CSR_PWCL           0x1c /* PWCl */
> 
> "Page walk controller, low addr"
> 
>> +#define LOONGARCH_CSR_PWCH           0x1d /* PWCh */
> 
> "Page walk controller, high addr"
> 
>> +#define LOONGARCH_CSR_STLBPS     0x1e /* 64 */
> 
> 64?  "STLB Page size".
> 
>> +#define LOONGARCH_CSR_RVACFG         0x1f
> 
> "Reduced virtual address config"
> 
>> +/* Save registers */
>> +#define LOONGARCH_CSR_SAVE0            0x30
>> +#define LOONGARCH_CSR_SAVE1            0x31
>> +#define LOONGARCH_CSR_SAVE2            0x32
>> +#define LOONGARCH_CSR_SAVE3            0x33
>> +#define LOONGARCH_CSR_SAVE4            0x34
>> +#define LOONGARCH_CSR_SAVE5            0x35
>> +#define LOONGARCH_CSR_SAVE6            0x36
>> +#define LOONGARCH_CSR_SAVE7            0x37
> 
> Might as well must define SAVE0, and comment that the count is in PRCFG1.SAVE_NUM.
> 
>> +#define  CSR_DMW_BASE_SH             48
> 
> What's this?  It looks like you should be using TARGET_VIRT_ADDR_SPACE_BITS anyway.
Yes, TARGET_VIRT_ADDR_SPACE_BITS is better.
> 
>> +#define dmwin_va2pa(va) \
>> +    (va & (((unsigned long)1 << CSR_DMW_BASE_SH) - 1))
> 
> Using unsigned long is wrong, breaking 32-bit hosts.
> You want
> 
>     ((va) & MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS))
> 
>> +/* Performance Counter registers */
>> +#define LOONGARCH_CSR_PERFCTRL0      0x200 /* 32 perf event 0 config */
>> +#define LOONGARCH_CSR_PERFCNTR0      0x201 /* 64 perf event 0 count value */
>> +#define LOONGARCH_CSR_PERFCTRL1      0x202 /* 32 perf event 1 config */
>> +#define LOONGARCH_CSR_PERFCNTR1      0x203 /* 64 perf event 1 count value */
>> +#define LOONGARCH_CSR_PERFCTRL2      0x204 /* 32 perf event 2 config */
>> +#define LOONGARCH_CSR_PERFCNTR2      0x205 /* 64 perf event 2 count value */
>> +#define LOONGARCH_CSR_PERFCTRL3      0x206 /* 32 perf event 3 config */
>> +#define LOONGARCH_CSR_PERFCNTR3      0x207 /* 64 perf event 3 count value */
> 
> Perhaps better to define
> 
> #define LOONGARCH_CSR_PERFCTRL(N)  (0x200 + 2 * N)
> 
> etc.
> 
>> +#define LOONGARCH_CSR_DB0ADDR        0x310 /* data breakpoint 0 address */
>> +#define LOONGARCH_CSR_DB0MASK        0x311 /* data breakpoint 0 mask */
>> +#define LOONGARCH_CSR_DB0CTL         0x312 /* data breakpoint 0 control */
>> +#define LOONGARCH_CSR_DB0ASID        0x313 /* data breakpoint 0 asid */
> 
> Likewise.
> 
>> +    uint64_t CSR_SAVE0;
>> +    uint64_t CSR_SAVE1;
>> +    uint64_t CSR_SAVE2;
>> +    uint64_t CSR_SAVE3;
>> +    uint64_t CSR_SAVE4;
>> +    uint64_t CSR_SAVE5;
>> +    uint64_t CSR_SAVE6;
>> +    uint64_t CSR_SAVE7;
> 
> Better as an array.
> 
>> +    uint64_t CSR_PERFCTRL0;
>> +    uint64_t CSR_PERFCNTR0;
>> +    uint64_t CSR_PERFCTRL1;
>> +    uint64_t CSR_PERFCNTR1;
>> +    uint64_t CSR_PERFCTRL2;
>> +    uint64_t CSR_PERFCNTR2;
>> +    uint64_t CSR_PERFCTRL3;
>> +    uint64_t CSR_PERFCNTR3;
> 
> Likewise.
> 
>> +    uint64_t CSR_DB0ADDR;
>> +    uint64_t CSR_DB0MASK;
>> +    uint64_t CSR_DB0CTL;
>> +    uint64_t CSR_DB0ASID;
>> +    uint64_t CSR_DB1ADDR;
>> +    uint64_t CSR_DB1MASK;
>> +    uint64_t CSR_DB1CTL;
>> +    uint64_t CSR_DB1ASID;
>> +    uint64_t CSR_DB2ADDR;
>> +    uint64_t CSR_DB2MASK;
>> +    uint64_t CSR_DB2CTL;
>> +    uint64_t CSR_DB2ASID;
>> +    uint64_t CSR_DB3ADDR;
>> +    uint64_t CSR_DB3MASK;
>> +    uint64_t CSR_DB3CTL;
>> +    uint64_t CSR_DB3ASID;
> 
> Likewise.
> 
>> +    uint64_t CSR_IB0ADDR;
>> +    uint64_t CSR_IB0MASK;
>> +    uint64_t CSR_IB0CTL;
>> +    uint64_t CSR_IB0ASID;
>> +    uint64_t CSR_IB1ADDR;
>> +    uint64_t CSR_IB1MASK;
>> +    uint64_t CSR_IB1CTL;
>> +    uint64_t CSR_IB1ASID;
>> +    uint64_t CSR_IB2ADDR;
>> +    uint64_t CSR_IB2MASK;
>> +    uint64_t CSR_IB2CTL;
>> +    uint64_t CSR_IB2ASID;
>> +    uint64_t CSR_IB3ADDR;
>> +    uint64_t CSR_IB3MASK;
>> +    uint64_t CSR_IB3CTL;
>> +    uint64_t CSR_IB3ASID;
>> +    uint64_t CSR_IB4ADDR;
>> +    uint64_t CSR_IB4MASK;
>> +    uint64_t CSR_IB4CTL;
>> +    uint64_t CSR_IB4ASID;
>> +    uint64_t CSR_IB5ADDR;
>> +    uint64_t CSR_IB5MASK;
>> +    uint64_t CSR_IB5CTL;
>> +    uint64_t CSR_IB5ASID;
>> +    uint64_t CSR_IB6ADDR;
>> +    uint64_t CSR_IB6MASK;
>> +    uint64_t CSR_IB6CTL;
>> +    uint64_t CSR_IB6ASID;
>> +    uint64_t CSR_IB7ADDR;
>> +    uint64_t CSR_IB7MASK;
>> +    uint64_t CSR_IB7CTL;
>> +    uint64_t CSR_IB7ASID;
> 
> Likewise.
> 
> 
  I will modify the define. Thanks
> r~


