Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFD4924B1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:24:37 +0100 (CET)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mbM-0000jC-2I
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9mYb-0006NW-Dq; Tue, 18 Jan 2022 06:21:45 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:36814 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9mYY-0007mN-I3; Tue, 18 Jan 2022 06:21:45 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADn7Vm8ouZhhT22BQ--.20404S2;
 Tue, 18 Jan 2022 19:21:33 +0800 (CST)
Subject: Re: [PATCH v5 5/5] target/riscv: add support for svpbmt extension
To: Anup Patel <apatel@ventanamicro.com>
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-6-liweiwei@iscas.ac.cn>
 <CAAhSdy3bMG3htJSCMsT9HjrYXQP5XZk8y_8KN7pXjPoNPzc58w@mail.gmail.com>
 <a7a73309-8112-4590-efa6-bc3f0122a5f0@iscas.ac.cn>
 <CAK9=C2U22weKz6soWWAO9xDMpnY4D40ziBGK631ssQSf_eYpaA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <dd185724-7cf7-c91d-0083-6e412497d530@iscas.ac.cn>
Date: Tue, 18 Jan 2022 19:21:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK9=C2U22weKz6soWWAO9xDMpnY4D40ziBGK631ssQSf_eYpaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowADn7Vm8ouZhhT22BQ--.20404S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur43JrWfKF1fGw4xXF43Wrg_yoWrXrWkpr
 4UGa42kaykJFWakayIqw15trn7twsIkF1Fgw4kXr1xJws5t3yfGF1DKw47ua1rXF48Zr1Y
 9F1j9F1ayr4jqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUU3ku7UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
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
Cc: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/18 下午7:04, Anup Patel 写道:
> On Tue, Jan 18, 2022 at 2:40 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/1/18 上午11:35, Anup Patel 写道:
>>> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
>>>> - add PTE_PBMT bit check for inner PTE
>>>>
>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>> Cc: Heiko Stuebner <heiko@sntech.de>
>>>> Cc: Anup Patel <anup@brainfault.org>
>>>> ---
>>>>    target/riscv/cpu.c        | 1 +
>>>>    target/riscv/cpu.h        | 1 +
>>>>    target/riscv/cpu_bits.h   | 2 ++
>>>>    target/riscv/cpu_helper.c | 4 +++-
>>>>    4 files changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index 45ac98e06b..4f82bd00a3 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -670,6 +670,7 @@ static Property riscv_cpu_properties[] = {
>>>>
>>>>        DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>>>>        DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>>>> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>>>>
>>>>        DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>>>>        DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index c3d1845ca1..53f314c752 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -329,6 +329,7 @@ struct RISCVCPU {
>>>>            bool ext_icsr;
>>>>            bool ext_svinval;
>>>>            bool ext_svnapot;
>>>> +        bool ext_svpbmt;
>>>>            bool ext_zfh;
>>>>            bool ext_zfhmin;
>>>>
>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>> index 5501e9698b..24b7eb2b1f 100644
>>>> --- a/target/riscv/cpu_bits.h
>>>> +++ b/target/riscv/cpu_bits.h
>>>> @@ -486,7 +486,9 @@ typedef enum {
>>>>    #define PTE_A               0x040 /* Accessed */
>>>>    #define PTE_D               0x080 /* Dirty */
>>>>    #define PTE_SOFT            0x300 /* Reserved for Software */
>>>> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>>>>    #define PTE_N               0x8000000000000000 /* NAPOT translation */
>>>> +#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
>>>>
>>>>    /* Page table PPN shift amount */
>>>>    #define PTE_PPN_SHIFT       10
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index c276760c7f..9fffaccffb 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -625,9 +625,11 @@ restart:
>>>>            if (!(pte & PTE_V)) {
>>>>                /* Invalid PTE */
>>>>                return TRANSLATE_FAIL;
>>>> +        } else if (!cpu->cfg.ext_svpbmt && (pte & (target_ulong)PTE_PBMT)) {
>>> Rather than, type-casting defines here you can simply define
>>> ULL constants. E.g.
>>> #define PTE_PBMT            0x6000000000000000ULL
>> Sorry, I'm wonder why add ULL can replace the function of type-casting.
>>
>> The type-casting here is to compatible with RV32 for possible strict
>> type check warnings since pte is 32 bits and PTE_PBMT is 64 bits in RV32.
> If adding ULL does not help for RV32 target then no need to change.

OK. Thanks a lot.

Regards,

Weiwei Li

>> If I add ULL in PTE_PBMT, it seems have no change to PTE_PBMT. It's
>> still 64 bits in RV32.
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup
>
>> Regards,
>>
>> Weiwei Li
>>
>>>> +            return TRANSLATE_FAIL;
>>>>            } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>>>>                /* Inner PTE, continue walking */
>>>> -            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
>>>> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
>>>>                    return TRANSLATE_FAIL;
>>>>                }
>>>>                base = ppn << PGSHIFT;
>>>> --
>>>> 2.17.1
>>>>
>>> Regards,
>>> Anup
>>


