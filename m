Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6263B346
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkoq-0007S3-SR; Mon, 28 Nov 2022 15:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ozkol-0007Rh-1c; Mon, 28 Nov 2022 15:33:31 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ozkoi-00039o-Pa; Mon, 28 Nov 2022 15:33:30 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso14476526fac.10; 
 Mon, 28 Nov 2022 12:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kMpmuKCCQ7ijCg/Mr3665XPohpNOqrF+AdiqRixOcMA=;
 b=o5EuKIXYwr7xcFOe6mI4U0RiuAXV69NSaocNivXrqS8UIDhaw84YAm6ck0y/Us23TX
 J4Te/NQE6XOyojufOZM3FvRgImD5zcixGZiMsMRh3hapy1572HCJiWz5ZzJKrf+3eQ04
 uivDLS1GUuRytvVbfTzngDXHCe1aaFHc1vJRniB2oY/qbAt6Oi69NxJl8QUIdLl2j15l
 PS4eSZDXUqicDJQj9IuWD/GGQ/NLluFr+VYa95u+Cw50Z3EF9pd/a8YCYXXl9oi9EMgI
 QsmgAA3h/B9kOQcrLTfJFiGMs0j+ZRQl6TetU6/1OHnVG17QxdxfQ10XNVHSSvnHO9ud
 mgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMpmuKCCQ7ijCg/Mr3665XPohpNOqrF+AdiqRixOcMA=;
 b=q6gzMRVYlljf6pUTS2/BspoPSItWGiRKjwa9wbsRyDdIapm5kSuCo/brdWMwKRWyZQ
 K89bXmfzxu5OAJ3S+NyeJBq63r29vKexmzPhRIYTRoPNKSHhAatwb5Kwltc5iThrwvc+
 +Dr80C2QLfy9KZ/My+P8EcGQzQ+TyVdvV5eAN01BN3kRg5XPRm+U+dR6+s9JsruZHymj
 X9Wj+vXgRwPYe8dwY6Aa9/pFhePUy6cnJ9elqSe5PVMGMinUXKe9QBiKhOqcKhQQgrIk
 rZEpBxgGjlpm/fayE2BLJUzZafCjYoc+YbYYESV9NFX+5M0EifUB655nSGo6DOdSkw4O
 ODFg==
X-Gm-Message-State: ANoB5pnNFbJLGMXPVaL5I+4EIpB8xYu7QJhiZlEl/SHIARb/1m+B1H3Q
 yHJIMf2o5ZrPAHPY3xBNbws=
X-Google-Smtp-Source: AA0mqf5D4JUEBM7W3mF2YSJ2WHgqIIazDrs1FmIhIIz+Ib+nUYS+yxBOM+f0RIYqxWbtK/Wy2Eyhrg==
X-Received: by 2002:a05:6870:b602:b0:13b:d693:2ee1 with SMTP id
 cm2-20020a056870b60200b0013bd6932ee1mr28961177oab.77.1669667606488; 
 Mon, 28 Nov 2022 12:33:26 -0800 (PST)
Received: from [192.168.10.102] (189-68-154-53.dsl.telesp.net.br.
 [189.68.154.53]) by smtp.gmail.com with ESMTPSA id
 r19-20020a056870581300b001438e8f097asm3566425oap.58.2022.11.28.12.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 12:33:26 -0800 (PST)
Message-ID: <176cd96b-03a6-dc2a-55d2-205f103fb905@gmail.com>
Date: Mon, 28 Nov 2022 17:33:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] target/ppc: Implement the DEXCR and HDEXCR
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, victor.colombo@eldorado.org.br
References: <20221124055143.752601-1-nicholas@linux.ibm.com>
 <20221124055143.752601-2-nicholas@linux.ibm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221124055143.752601-2-nicholas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 11/24/22 02:51, Nicholas Miehlbradt wrote:
> Define the DEXCR and HDEXCR as special purpose registers.
> 
> Each register occupies two SPR indicies, one which can be read in an
> unprivileged state and one which can be modified in the appropriate
> priviliged state, however both indicies refer to the same underlying
> value.
> 
> Note that the ISA uses the abbreviation UDEXCR in two different
> contexts: the userspace DEXCR, the SPR index which can be read from
> userspace (implemented in this patch), and the ultravisor DEXCR, the
> equivalent register for the ultravisor state (not implemented).
> 
> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> ---
>   target/ppc/cpu.h        | 19 +++++++++++++++++++
>   target/ppc/cpu_init.c   | 25 +++++++++++++++++++++++++
>   target/ppc/spr_common.h |  1 +
>   target/ppc/translate.c  |  9 +++++++++
>   4 files changed, 54 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 81d4263a07..0ed9f2ae35 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1068,6 +1068,21 @@ struct ppc_radix_page_info {
>       uint32_t entries[PPC_PAGE_SIZES_MAX_SZ];
>   };
>   
> +/*****************************************************************************/
> +/* Dynamic Execution Control Register */
> +
> +#define DEXCR_ASPECT(name, num)                    \
> +FIELD(DEXCR, PNH_##name, PPC_BIT_NR(num), 1)       \
> +FIELD(DEXCR, PRO_##name, PPC_BIT_NR(num + 32), 1)  \
> +FIELD(HDEXCR, HNU_##name, PPC_BIT_NR(num), 1)      \
> +FIELD(HDEXCR, ENF_##name, PPC_BIT_NR(num + 32), 1) \
> +
> +DEXCR_ASPECT(SBHE, 0)
> +DEXCR_ASPECT(IDRTPB, 1)
> +DEXCR_ASPECT(SRAPD, 4)
> +DEXCR_ASPECT(NPHIE, 5)
> +DEXCR_ASPECT(PHIE, 6)
> +
>   /*****************************************************************************/
>   /* The whole PowerPC CPU context */
>   
> @@ -1674,9 +1689,11 @@ void ppc_compat_add_property(Object *obj, const char *name,
>   #define SPR_BOOKE_GIVOR13     (0x1BC)
>   #define SPR_BOOKE_GIVOR14     (0x1BD)
>   #define SPR_TIR               (0x1BE)
> +#define SPR_UHDEXCR           (0x1C7)
>   #define SPR_PTCR              (0x1D0)
>   #define SPR_HASHKEYR          (0x1D4)
>   #define SPR_HASHPKEYR         (0x1D5)
> +#define SPR_HDEXCR            (0x1D7)
>   #define SPR_BOOKE_SPEFSCR     (0x200)
>   #define SPR_Exxx_BBEAR        (0x201)
>   #define SPR_Exxx_BBTAR        (0x202)
> @@ -1865,8 +1882,10 @@ void ppc_compat_add_property(Object *obj, const char *name,
>   #define SPR_RCPU_L2U_RA2      (0x32A)
>   #define SPR_MPC_MD_DBRAM1     (0x32A)
>   #define SPR_RCPU_L2U_RA3      (0x32B)
> +#define SPR_UDEXCR            (0x32C)
>   #define SPR_TAR               (0x32F)
>   #define SPR_ASDR              (0x330)
> +#define SPR_DEXCR             (0x33C)
>   #define SPR_IC                (0x350)
>   #define SPR_VTB               (0x351)
>   #define SPR_MMCRC             (0x353)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index cbf0081374..d6b950feb6 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5727,6 +5727,30 @@ static void register_power10_hash_sprs(CPUPPCState *env)
>               hashpkeyr_initial_value);
>   }
>   
> +static void register_power10_dexcr_sprs(CPUPPCState *env)
> +{
> +    spr_register(env, SPR_DEXCR, "DEXCR",
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            &spr_read_generic, &spr_write_dexcr,
> +            0);
> +
> +    spr_register(env, SPR_UDEXCR, "DEXCR",
> +            &spr_read_generic, SPR_NOACCESS,
> +            &spr_read_generic, SPR_NOACCESS,
> +            0);
> +
> +    spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            &spr_read_generic, &spr_write_dexcr,
> +            0);
> +
> +    spr_register(env, SPR_UHDEXCR, "HDEXCR",
> +            &spr_read_generic, SPR_NOACCESS,
> +            &spr_read_generic, SPR_NOACCESS,
> +            0);
> +}
> +
>   /*
>    * Initialize PMU counter overflow timers for Power8 and
>    * newer Power chips when using TCG.
> @@ -6402,6 +6426,7 @@ static void init_proc_POWER10(CPUPPCState *env)
>       register_power8_rpr_sprs(env);
>       register_power9_mmu_sprs(env);
>       register_power10_hash_sprs(env);
> +    register_power10_dexcr_sprs(env);
>   
>       /* FIXME: Filter fields properly based on privilege level */
>       spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
> diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
> index b5a5bc6895..3cfa500250 100644
> --- a/target/ppc/spr_common.h
> +++ b/target/ppc/spr_common.h
> @@ -195,6 +195,7 @@ void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
>   void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dexcr(DisasContext *ctx, int sprn, int gprn);
>   #endif
>   
>   void register_low_BATs(CPUPPCState *env);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 19c1d17cb0..24e9e2fece 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1249,6 +1249,15 @@ void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
>       gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
>       spr_write_prev_upper32(ctx, sprn, gprn);
>   }
> +
> +void spr_write_dexcr(DisasContext *ctx, int sprn, int gprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +    spr_write_generic(ctx, sprn, gprn);
> +    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
> +    gen_store_spr(sprn - 16, t0);
> +    tcg_temp_free(t0);
> +}

IIUC you're writing sprn as is, then zeroing bits 0-31 and writing it to
sprn - 16, because of this comment in PowerISA:

-------------
This register can be read and written in privileged state
using SPR 828. Bits 32:63 of the register can only be
read in problem state using SPR 812; mfspr 812
returns 0s for bits 0:31.
-------------

I am no longer familiar with Power10 internals and can't say whether
sprn 812/455 is writable in problem state. You didn't create a write
function for it, so I'll assume that problem state can't write sprn
812/455 and can read only the higher bits.

I'll note that there's another way of doing it: instead of doing two
writes and clearing 32 bits every time sprn 828/471 is written, you can
also just do a regular write and, instead, implement spr_read_dexcr_ureg
that would clear bits 0-31 when problem state reads it. Depending on
how frequent problem state reads the reg versus priv state writes it,
we'll spare a few cycles in the emulation. I did something similar in
spr_read_MMCR0_ureg if you want to take a look.


All that said, what is being done here also works. I'll just ask you to
put a comment in spr_write_dexcr() explaining why you're clearing bits
and writing another sprn-16 in it.


Thanks,

Daniel


>   #endif
>   
>   #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \

