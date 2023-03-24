Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E66C810E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:20:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhCW-0007RN-8P; Fri, 24 Mar 2023 09:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhCU-0007R9-Kn; Fri, 24 Mar 2023 09:11:22 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfh8N-0006lN-Rn; Fri, 24 Mar 2023 09:11:21 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowACnrc09nR1kyGIZCQ--.52843S2;
 Fri, 24 Mar 2023 20:53:18 +0800 (CST)
Message-ID: <e8f5e279-38f1-85a3-f8ea-9ee791edeb38@iscas.ac.cn>
Date: Fri, 24 Mar 2023 20:53:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 2/4] target/riscv: Add a general status enum for extensions
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-3-zhiwei_liu@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230324055954.908-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrc09nR1kyGIZCQ--.52843S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF48XFW5WryDKrW5WF1kAFb_yoW7Jr4xpr
 4kCaySkrWrtFWDCa4Syw4DGr18Jr1YkFWDCws7W3y8tayrG3y5CFnrt3s7ZryDWF48Ww4j
 va1rur1vyr42yrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
 6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUou
 WlDUUUU
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 2023/3/24 13:59, LIU Zhiwei wrote:
> The pointer masking is the only extension that directly use status.
> The vector or float extension uses the status in an indirect way.
>
> Replace the pointer masking extension special status fields with
> the general status.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c      |  2 +-
>   target/riscv/cpu.h      |  9 +++++++++
>   target/riscv/cpu_bits.h |  6 ------
>   target/riscv/csr.c      | 14 +++++++-------
>   4 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..1135106b3e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -764,7 +764,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>           i++;
>       }
>       /* mmte is supposed to have pm.current hardwired to 1 */
> -    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> +    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
>   #endif
>       env->xl = riscv_cpu_mxl(env);
>       riscv_cpu_update_mask(env);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 12fe8d8546..5049e21518 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -99,6 +99,15 @@ enum {
>       TRANSLATE_G_STAGE_FAIL
>   };
>   
> +/* Extension Context Status */
> +enum {
> +    EXT_STATUS_DISABLED = 0,
> +    EXT_STATUS_INITIAL,
> +    EXT_STATUS_CLEAN,
> +    EXT_STATUS_DIRTY,
> +    EXT_STATUS_MASK,

I think the right value for EXT_STATUS_MASK  should be 3 here.

And it can replace the following  PM_XS_MASK.

Regards,

Weiwei Li

> +};
> +
>   #define MMU_USER_IDX 3
>   
>   #define MAX_RISCV_PMPS (16)
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..5280bd41c2 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -736,12 +736,6 @@ typedef enum RISCVException {
>   #define PM_INSN         0x00000004ULL
>   #define PM_XS_MASK      0x00000003ULL
>   
> -/* PointerMasking XS bits values */
> -#define PM_EXT_DISABLE  0x00000000ULL
> -#define PM_EXT_INITIAL  0x00000001ULL
> -#define PM_EXT_CLEAN    0x00000002ULL
> -#define PM_EXT_DIRTY    0x00000003ULL
> -
>   /* Execution enviornment configuration bits */
>   #define MENVCFG_FIOM                       BIT(0)
>   #define MENVCFG_CBIE                       (3UL << 4)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..abea7b749e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3513,7 +3513,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
>   
>       /* hardwiring pm.instruction bit to 0, since it's not supported yet */
>       wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
> -    env->mmte = wpri_val | PM_EXT_DIRTY;
> +    env->mmte = wpri_val | EXT_STATUS_DIRTY;
>       riscv_cpu_update_mask(env);
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
> @@ -3593,7 +3593,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3621,7 +3621,7 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3649,7 +3649,7 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
>           env->cur_pmmask = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3673,7 +3673,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3701,7 +3701,7 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;
> @@ -3729,7 +3729,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>       if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
>           env->cur_pmbase = val;
>       }
> -    env->mmte |= PM_EXT_DIRTY;
> +    env->mmte |= EXT_STATUS_DIRTY;
>   
>       /* Set XS and SD bits, since PM CSRs are dirty */
>       mstatus = env->mstatus | MSTATUS_XS;


