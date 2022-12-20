Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD73651FD8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:41:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aso-0003TX-NS; Tue, 20 Dec 2022 06:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7asZ-0003Qr-Sw; Tue, 20 Dec 2022 06:33:53 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7asX-0007rq-7F; Tue, 20 Dec 2022 06:33:51 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r11so10273966oie.13;
 Tue, 20 Dec 2022 03:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+yL5Iir5drSnSOmB2Rq/rw6DBGGnbA2k28LGnohxm0=;
 b=bjFdpEL+BFPcZexucuaIEhlUKOwW18+logdd9NDRjhI6BjvTW3BhiaRJblEgrcuG1f
 Z0RKWI0JEx/cxgyygTFuH8+NyQPyh/g6vl+TC/MPvqCzbp3tbH8in74TFeCdfQGnj4Sh
 bJVJgZXsLHsg0Mfldr3xCjU0maMstU55+OEEYbGcgpcfs+yolN21J+U0CzevQtrmRReG
 RuujF6b3NiIr1BeVbl7TFChZblXaMyGb3n5OQ2ZV/QyJXQlOPyd+ItH7TtfqxTIhEH52
 MX7EJDj8PskmAZw1QDuqj+w2HWwYrPKxLl6F02YMV4XDQhIc3OYAsYB8X9rS49fzzyBa
 7NvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+yL5Iir5drSnSOmB2Rq/rw6DBGGnbA2k28LGnohxm0=;
 b=qft0EF1X4k4yCo5t7ewQs+mx9ecWyS/Q2xW4TUVONXFqwgY/wIGu/n+CDSHrSVDVDY
 ZFC3gJ/mYFQBMfn5w1G5eoPlLKejRwtswmr28U/76G8hZJXB428408L5u+ilh7zwToqn
 QfAic3BmRaxqSmVldonO8kTzkn5viqdottQIIeGbSd4JssRTLPX8eeqgR2IOczRGT8Nr
 wUAq1HHwN0BwaNyL+zM2HCZgo2TVxWbrQ4n/dINTSmKSfc38sM6znjwnPxENqYO29q80
 +y4vjMeAU3UkYYEgmAu2Cobv0uWRABfccTVksYygGHXo8f/H61ojOKw3ELFfprPk5lKt
 hgPA==
X-Gm-Message-State: ANoB5pkJV8fsgTcWD4VNnkeCngh5K3IuU3X3HIarcO0YaHGTEJdf089H
 WC3U+iwBDiDDYjJ7dcpenks=
X-Google-Smtp-Source: AA0mqf5cYdmq2GFgaaOannQM0XvQ2EWN7LC0X+oqqpvGC7fR2n53qiFBCHWkYI1McIFrdF8v0A2rqg==
X-Received: by 2002:aca:1b0d:0:b0:35e:cf1a:9cd0 with SMTP id
 b13-20020aca1b0d000000b0035ecf1a9cd0mr10140431oib.14.1671536027504; 
 Tue, 20 Dec 2022 03:33:47 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 l20-20020aca1914000000b0035173c2fddasm5324603oii.51.2022.12.20.03.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:33:47 -0800 (PST)
Message-ID: <47e7cb45-1f4b-aa70-1838-5cb7fd924c2b@gmail.com>
Date: Tue, 20 Dec 2022 08:33:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/2] target/ppc: Implement the DEXCR and HDEXCR
Content-Language: en-US
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, victor.colombo@eldorado.org.br
References: <20221220042330.2387944-1-nicholas@linux.ibm.com>
 <20221220042330.2387944-2-nicholas@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221220042330.2387944-2-nicholas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.161,
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



On 12/20/22 01:23, Nicholas Miehlbradt wrote:
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> v2: Clearing of upper 32 bits of DEXCR is now performed on read from
> problem state rather than on write in privileged state.
> v3: Fix typos
> ---
>   target/ppc/cpu.h        | 19 +++++++++++++++++++
>   target/ppc/cpu_init.c   | 25 +++++++++++++++++++++++++
>   target/ppc/spr_common.h |  1 +
>   target/ppc/translate.c  | 19 +++++++++++++++++++
>   4 files changed, 64 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 81d4263a07..3923f174f8 100644
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
> +DEXCR_ASPECT(IBRTPD, 1)
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
> index cbf0081374..6433f4fdfd 100644
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
> +            &spr_read_generic, &spr_write_generic,
> +            0);
> +
> +    spr_register(env, SPR_UDEXCR, "DEXCR",
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            0);
> +
> +    spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            SPR_NOACCESS, SPR_NOACCESS,
> +            &spr_read_generic, &spr_write_generic,
> +            0);
> +
> +    spr_register(env, SPR_UHDEXCR, "HDEXCR",
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
> +            &spr_read_dexcr_ureg, SPR_NOACCESS,
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
> index b5a5bc6895..8437eb0340 100644
> --- a/target/ppc/spr_common.h
> +++ b/target/ppc/spr_common.h
> @@ -195,6 +195,7 @@ void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
>   void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
>   void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn);
>   #endif
>   
>   void register_low_BATs(CPUPPCState *env);
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 19c1d17cb0..0e4cabcf54 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1249,6 +1249,25 @@ void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
>       gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
>       spr_write_prev_upper32(ctx, sprn, gprn);
>   }
> +
> +void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn)
> +{
> +    TCGv t0 = tcg_temp_new();
> +
> +    /*
> +     * Access to the (H)DEXCR in problem state is done using seperate
> +     * SPR indexes which are 16 below the SPR indexes which have full
> +     * access to the (H)DEXCR in privileged state. Problem state can
> +     * only read bits 32:63, bits 0:31 return 0.
> +     *
> +     * See section 9.3.1-9.3.2 of PowerISA v3.1B
> +     */
> +
> +    gen_load_spr(t0, sprn + 16);
> +    tcg_gen_ext32u_tl(cpu_gpr[gprn], t0);
> +
> +    tcg_temp_free(t0);
> +}
>   #endif
>   
>   #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \

