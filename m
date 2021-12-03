Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970A4677C2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:59:10 +0100 (CET)
Received: from localhost ([::1]:49748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt89d-0004QX-3f
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mt888-0002cm-Ng; Fri, 03 Dec 2021 07:57:36 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=40464
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mt885-0004Dt-PV; Fri, 03 Dec 2021 07:57:36 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id b11so2613067qvm.7;
 Fri, 03 Dec 2021 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=94z6GILRhfHgt6hyN3RfpztqYIACSvKW2BH70tP2gSo=;
 b=DRyeTT3LOsHW0Flnjzo4YMfynwlGo8Gs21LonfF09heH628PRB+F3VTC6TSfpjykiu
 GdBi0xrS57+962rdHIH+4+6JiBRz/sZfjs/R74T97j5riSarV2RRHq+p3MZ0EWBzaT49
 866VzmuGS/5XiqjSoulIDV7ZNelIAylXAZFptkjGb9PoF9CKBeRSBduLgpfdZ8bgedNk
 ILdhfki0OVAGXYQqmcpHBmYtwODQfscNrBlmm2ET3GBSpgGtOQGZJSgZvAglZ/iPLFqu
 hVY5hW0rQyxsfVOO8KFvxizknk7dGoXaVOitXtRBkPhQctsifqnB1NmB8TCx6XIY0XQJ
 Qing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=94z6GILRhfHgt6hyN3RfpztqYIACSvKW2BH70tP2gSo=;
 b=bJ2JeLWZkvuNLLE2mY1Ov1jzPQRf9pVhMxrNF9lbrqF8IGU6r9bVBAXd85L9E+CEYm
 44cXAfQj6P9QOZzNv7NHQyLSueq38vz94tDItLlwG7E5H7jow8JxhkwuqS7D7bOzGa/A
 mOSoB9Heop1+jvThvq+vBfFWadP9LEnMnAUbQ+o+elVuGFRUWEv4R1h+FKvos+YTjS07
 CBUKHXKeXYjkR3E9TeK3X6OCjVEzbBeh0L7t4685wYwYojqWno2W8nQhnjWdEu3xamzv
 AU83XVRf+jdqq1+5CjcVZjfp4aFSZkkiRDTolLNc1m+jrsVdCyz+1IUhdEtaq2TemZfg
 x5Nw==
X-Gm-Message-State: AOAM533AuA77oPuV/5wP9GXX/O9ItzPvxPwPs+TgC0NQ9CxCjnj4ihq+
 6f3uLh1uL2Ckm8RK0oGRKXo=
X-Google-Smtp-Source: ABdhPJzRTMf01HDfZUtFMAq5pCdbbOMioEMZlddUr+aaYAD4N2qkiCIakl2koni+RgqawMlElg7cKQ==
X-Received: by 2002:a05:6214:e4b:: with SMTP id
 o11mr19672787qvc.110.1638536250959; 
 Fri, 03 Dec 2021 04:57:30 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id s4sm2022779qko.47.2021.12.03.04.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 04:57:30 -0800 (PST)
Message-ID: <8680001b-97bc-6c8e-123a-4158a492c3d3@gmail.com>
Date: Fri, 3 Dec 2021 09:57:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: remove 401/403 CPUs
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202191108.1291515-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202191108.1291515-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 16:11, Cédric Le Goater wrote:
> They have been there since 2007 without any board using them, most
> were protected by a TODO define. Drop support.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/cpu-models.h  |  19 --
>   target/ppc/cpu-qom.h     |   4 -
>   target/ppc/cpu-models.c  |  34 ---
>   target/ppc/cpu_init.c    | 512 ---------------------------------------
>   target/ppc/excp_helper.c |   1 -
>   target/ppc/mmu_common.c  |  41 +---
>   target/ppc/mmu_helper.c  |   1 -
>   7 files changed, 4 insertions(+), 608 deletions(-)
> 
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index 095259275941..bf1dc7e5ca3d 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -38,27 +38,8 @@ extern PowerPCCPUAlias ppc_cpu_aliases[];
>   /*****************************************************************************/
>   /* PVR definitions for most known PowerPC                                    */
>   enum {
> -    /* PowerPC 401 family */
> -    /* Generic PowerPC 401 */
> -#define CPU_POWERPC_401              CPU_POWERPC_401G2
> -    /* PowerPC 401 cores */
> -    CPU_POWERPC_401A1              = 0x00210000,
> -    CPU_POWERPC_401B2              = 0x00220000,
> -    CPU_POWERPC_401C2              = 0x00230000,
> -    CPU_POWERPC_401D2              = 0x00240000,
> -    CPU_POWERPC_401E2              = 0x00250000,
> -    CPU_POWERPC_401F2              = 0x00260000,
> -    CPU_POWERPC_401G2              = 0x00270000,
> -    /* PowerPC 401 microcontrolers */
> -#define CPU_POWERPC_IOP480           CPU_POWERPC_401B2
>       /* IBM Processor for Network Resources */
>       CPU_POWERPC_COBRA              = 0x10100000, /* XXX: 405 ? */
> -    /* PowerPC 403 family */
> -    /* PowerPC 403 microcontrollers */
> -    CPU_POWERPC_403GA              = 0x00200011,
> -    CPU_POWERPC_403GB              = 0x00200100,
> -    CPU_POWERPC_403GC              = 0x00200200,
> -    CPU_POWERPC_403GCX             = 0x00201400,
>       /* PowerPC 405 family */
>       /* PowerPC 405 cores */
>       CPU_POWERPC_405D2              = 0x20010000,
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index ef9e32447473..a39ace2b367f 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -53,8 +53,6 @@ enum powerpc_mmu_t {
>       POWERPC_MMU_SOFT_74xx  = 0x00000003,
>       /* PowerPC 4xx MMU with software TLB                       */
>       POWERPC_MMU_SOFT_4xx   = 0x00000004,
> -    /* PowerPC 4xx MMU with software TLB and zones protections */
> -    POWERPC_MMU_SOFT_4xx_Z = 0x00000005,
>       /* PowerPC MMU in real mode only                           */
>       POWERPC_MMU_REAL       = 0x00000006,
>       /* Freescale MPC8xx MMU model                              */
> @@ -151,8 +149,6 @@ enum powerpc_input_t {
>       PPC_FLAGS_INPUT_POWER7,
>       /* PowerPC POWER9 bus               */
>       PPC_FLAGS_INPUT_POWER9,
> -    /* PowerPC 401 bus                  */
> -    PPC_FLAGS_INPUT_401,
>       /* Freescale RCPU bus               */
>       PPC_FLAGS_INPUT_RCPU,
>   };
> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
> index 4baa111713b0..c9fcb6119f40 100644
> --- a/target/ppc/cpu-models.c
> +++ b/target/ppc/cpu-models.c
> @@ -67,40 +67,6 @@
>       POWERPC_DEF_SVR(_name, _desc, _pvr, POWERPC_SVR_NONE, _type)
>   
>       /* Embedded PowerPC                                                      */
> -    /* PowerPC 401 family                                                    */
> -    POWERPC_DEF("401",           CPU_POWERPC_401,                    401,
> -                "Generic PowerPC 401")
> -    /* PowerPC 401 cores                                                     */
> -    POWERPC_DEF("401a1",         CPU_POWERPC_401A1,                  401,
> -                "PowerPC 401A1")
> -    POWERPC_DEF("401b2",         CPU_POWERPC_401B2,                  401x2,
> -                "PowerPC 401B2")
> -    POWERPC_DEF("401c2",         CPU_POWERPC_401C2,                  401x2,
> -                "PowerPC 401C2")
> -    POWERPC_DEF("401d2",         CPU_POWERPC_401D2,                  401x2,
> -                "PowerPC 401D2")
> -    POWERPC_DEF("401e2",         CPU_POWERPC_401E2,                  401x2,
> -                "PowerPC 401E2")
> -    POWERPC_DEF("401f2",         CPU_POWERPC_401F2,                  401x2,
> -                "PowerPC 401F2")
> -    /* XXX: to be checked */
> -    POWERPC_DEF("401g2",         CPU_POWERPC_401G2,                  401x2,
> -                "PowerPC 401G2")
> -    /* PowerPC 401 microcontrollers                                          */
> -    POWERPC_DEF("iop480",        CPU_POWERPC_IOP480,                 IOP480,
> -                "IOP480 (401 microcontroller)")
> -    POWERPC_DEF("cobra",         CPU_POWERPC_COBRA,                  401,
> -                "IBM Processor for Network Resources")
> -    /* PowerPC 403 family                                                    */
> -    /* PowerPC 403 microcontrollers                                          */
> -    POWERPC_DEF("403ga",         CPU_POWERPC_403GA,                  403,
> -                "PowerPC 403 GA")
> -    POWERPC_DEF("403gb",         CPU_POWERPC_403GB,                  403,
> -                "PowerPC 403 GB")
> -    POWERPC_DEF("403gc",         CPU_POWERPC_403GC,                  403,
> -                "PowerPC 403 GC")
> -    POWERPC_DEF("403gcx",        CPU_POWERPC_403GCX,                 403GCX,
> -                "PowerPC 403 GCX")
>       /* PowerPC 405 family                                                    */
>       /* PowerPC 405 cores                                                     */
>       POWERPC_DEF("405d2",         CPU_POWERPC_405D2,                  405,
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ce40368427c2..ddd71dec778a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1554,169 +1554,6 @@ static void register_405_sprs(CPUPPCState *env)
>       register_usprgh_sprs(env);
>   }
>   
> -/* SPR shared between PowerPC 401 & 403 implementations */
> -static void register_401_403_sprs(CPUPPCState *env)
> -{
> -    /* Time base */
> -    spr_register(env, SPR_403_VTBL,  "TBL",
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 &spr_read_tbl, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_403_TBL,   "TBL",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 SPR_NOACCESS, &spr_write_tbl,
> -                 0x00000000);
> -    spr_register(env, SPR_403_VTBU,  "TBU",
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 &spr_read_tbu, SPR_NOACCESS,
> -                 0x00000000);
> -    spr_register(env, SPR_403_TBU,   "TBU",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 SPR_NOACCESS, &spr_write_tbu,
> -                 0x00000000);
> -    /* Debug */
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_403_CDBCR, "CDBCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC 401 implementation */
> -static void register_401_sprs(CPUPPCState *env)
> -{
> -    /* Debug interface */
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBCR0, "DBCR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_dbcr0,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBSR, "DBSR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_clear,
> -                 /* Last reset was system reset */
> -                 0x00000300);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DAC1, "DAC",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_IAC1, "IAC",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Storage control */
> -    /* XXX: TODO: not implemented */
> -    spr_register(env, SPR_405_SLER, "SLER",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_sler,
> -                 0x00000000);
> -    /* not emulated, as QEMU never does speculative access */
> -    spr_register(env, SPR_40x_SGR, "SGR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0xFFFFFFFF);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCWR, "DCWR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -static void register_401x2_sprs(CPUPPCState *env)
> -{
> -    register_401_sprs(env);
> -    spr_register(env, SPR_40x_PID, "PID",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_ZPR, "ZPR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC 403 implementation */
> -static void register_403_sprs(CPUPPCState *env)
> -{
> -    /* Debug interface */
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBCR0, "DBCR0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_40x_dbcr0,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DBSR, "DBSR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_clear,
> -                 /* Last reset was system reset */
> -                 0x00000300);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DAC1, "DAC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_DAC2, "DAC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_IAC1, "IAC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_40x_IAC2, "IAC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -static void register_403_real_sprs(CPUPPCState *env)
> -{
> -    spr_register(env, SPR_403_PBL1,  "PBL1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -    spr_register(env, SPR_403_PBU1,  "PBU1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -    spr_register(env, SPR_403_PBL2,  "PBL2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -    spr_register(env, SPR_403_PBU2,  "PBU2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_403_pbr, &spr_write_403_pbr,
> -                 0x00000000);
> -}
> -
> -static void register_403_mmu_sprs(CPUPPCState *env)
> -{
> -    /* MMU */
> -    spr_register(env, SPR_40x_PID, "PID",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    spr_register(env, SPR_40x_ZPR, "ZPR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
> -
> -/* SPR specific to PowerPC compression coprocessor extension */
> -static void register_compress_sprs(CPUPPCState *env)
> -{
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_401_SKR, "SKR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -}
>   
>   static void register_5xx_8xx_sprs(CPUPPCState *env)
>   {
> @@ -2104,26 +1941,6 @@ static void register_8xx_sprs(CPUPPCState *env)
>   
>   /*****************************************************************************/
>   /* Exception vectors models                                                  */
> -static void init_excp_4xx_real(CPUPPCState *env)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
> -    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
> -    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
> -    env->ivor_mask = 0x0000FFF0UL;
> -    env->ivpr_mask = 0xFFFF0000UL;
> -    /* Hardware reset vector */
> -    env->hreset_vector = 0xFFFFFFFCUL;
> -#endif
> -}
> -
>   static void init_excp_4xx_softmmu(CPUPPCState *env)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> @@ -2663,335 +2480,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
>                                                                               \
>       static void glue(glue(ppc_, _name), _cpu_family_class_init)
>   
> -static void init_proc_401(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401_sprs(env);
> -    init_excp_4xx_real(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(401)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 401";
> -    pcc->init_proc = init_proc_401;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_WRTEE | PPC_DCR |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_REAL;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_401x2(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401x2_sprs(env);
> -    register_compress_sprs(env);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb = 64;
> -    env->nb_ways = 1;
> -    env->id_tlbs = 0;
> -    env->tlb_type = TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(401x2)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 401x2";
> -    pcc->init_proc = init_proc_401x2;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << 20) |
> -                    (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_401x3(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401_sprs(env);
> -    register_401x2_sprs(env);
> -    register_compress_sprs(env);
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(401x3)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 401x3";
> -    pcc->init_proc = init_proc_401x3;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << 20) |
> -                    (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DWE) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_IOP480(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_401x2_sprs(env);
> -    register_compress_sprs(env);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb = 64;
> -    env->nb_ways = 1;
> -    env->id_tlbs = 0;
> -    env->tlb_type = TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(IOP480)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "IOP480";
> -    pcc->init_proc = init_proc_IOP480;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI |  PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << 20) |
> -                    (1ull << MSR_KEY) |
> -                    (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_403(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_403_sprs(env);
> -    register_403_real_sprs(env);
> -    init_excp_4xx_real(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(403)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 403";
> -    pcc->init_proc = init_proc_403;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_PE) |
> -                    (1ull << MSR_PX) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_REAL;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_PX |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
> -static void init_proc_403GCX(CPUPPCState *env)
> -{
> -    register_40x_sprs(env);
> -    register_401_403_sprs(env);
> -    register_403_sprs(env);
> -    register_403_real_sprs(env);
> -    register_403_mmu_sprs(env);
> -    /* Bus access control */
> -    /* not emulated, as QEMU never does speculative access */
> -    spr_register(env, SPR_40x_SGR, "SGR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0xFFFFFFFF);
> -    /* not emulated, as QEMU do not emulate caches */
> -    spr_register(env, SPR_40x_DCWR, "DCWR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb = 64;
> -    env->nb_ways = 1;
> -    env->id_tlbs = 0;
> -    env->tlb_type = TLB_EMB;
> -#endif
> -    init_excp_4xx_softmmu(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* Allocate hardware IRQ controller */
> -    ppc40x_irq_init(env_archcpu(env));
> -
> -    SET_FIT_PERIOD(8, 12, 16, 20);
> -    SET_WDT_PERIOD(16, 20, 24, 28);
> -}
> -
> -POWERPC_FAMILY(403GCX)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 403 GCX";
> -    pcc->init_proc = init_proc_403GCX;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
> -                       PPC_CACHE_DCBZ |
> -                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
> -                       PPC_4xx_COMMON | PPC_40x_EXCP;
> -    pcc->msr_mask = (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_ILE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_PE) |
> -                    (1ull << MSR_PX) |
> -                    (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_4xx_Z;
> -    pcc->excp_model = POWERPC_EXCP_40x;
> -    pcc->bus_model = PPC_FLAGS_INPUT_401;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_PX |
> -                 POWERPC_FLAG_BUS_CLK;
> -}
> -
>   static void init_proc_405(CPUPPCState *env)
>   {
>       /* Time base */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 121f2f958bc6..cfa2d256e44a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1528,7 +1528,6 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>   
>       switch (env->mmu_model) {
>       case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
>           env->spr[SPR_40x_DEAR] = vaddr;
>           break;
>       case POWERPC_MMU_BOOKE:
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 86795b281427..4e278365ca55 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -1173,11 +1173,9 @@ void dump_mmu(CPUPPCState *env)
>   static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
>                             MMUAccessType access_type)
>   {
> -    int in_plb, ret;
> -
>       ctx->raddr = eaddr;
>       ctx->prot = PAGE_READ | PAGE_EXEC;
> -    ret = 0;
> +
>       switch (env->mmu_model) {
>       case POWERPC_MMU_SOFT_6xx:
>       case POWERPC_MMU_SOFT_4xx:
> @@ -1186,39 +1184,12 @@ static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
>           ctx->prot |= PAGE_WRITE;
>           break;
>   
> -    case POWERPC_MMU_SOFT_4xx_Z:
> -        if (unlikely(msr_pe != 0)) {
> -            /*
> -             * 403 family add some particular protections, using
> -             * PBL/PBU registers for accesses with no translation.
> -             */
> -            in_plb =
> -                /* Check PLB validity */
> -                (env->pb[0] < env->pb[1] &&
> -                 /* and address in plb area */
> -                 eaddr >= env->pb[0] && eaddr < env->pb[1]) ||
> -                (env->pb[2] < env->pb[3] &&
> -                 eaddr >= env->pb[2] && eaddr < env->pb[3]) ? 1 : 0;
> -            if (in_plb ^ msr_px) {
> -                /* Access in protected area */
> -                if (access_type == MMU_DATA_STORE) {
> -                    /* Access is not allowed */
> -                    ret = -2;
> -                }
> -            } else {
> -                /* Read-write access is allowed */
> -                ctx->prot |= PAGE_WRITE;
> -            }
> -        }
> -        break;
> -
>       default:
>           /* Caller's checks mean we should never get here for other models */
> -        abort();
> -        return -1;
> +        g_assert_not_reached();
>       }
>   
> -    return ret;
> +    return 0;
>   }
>   
>   int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> @@ -1247,7 +1218,6 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
>           break;
>   
>       case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
>           if (real_mode) {
>               ret = check_physical(env, ctx, eaddr, access_type);
>           } else {
> @@ -1381,7 +1351,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                       env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
>                       goto tlb_miss;
>                   case POWERPC_MMU_SOFT_4xx:
> -                case POWERPC_MMU_SOFT_4xx_Z:
>                       cs->exception_index = POWERPC_EXCP_ITLB;
>                       env->error_code = 0;
>                       env->spr[SPR_40x_DEAR] = eaddr;
> @@ -1449,7 +1418,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                           get_pteg_offset32(cpu, ctx.hash[1]);
>                       break;
>                   case POWERPC_MMU_SOFT_4xx:
> -                case POWERPC_MMU_SOFT_4xx_Z:
>                       cs->exception_index = POWERPC_EXCP_DTLB;
>                       env->error_code = 0;
>                       env->spr[SPR_40x_DEAR] = eaddr;
> @@ -1482,8 +1450,7 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                   /* Access rights violation */
>                   cs->exception_index = POWERPC_EXCP_DSI;
>                   env->error_code = 0;
> -                if (env->mmu_model == POWERPC_MMU_SOFT_4xx
> -                    || env->mmu_model == POWERPC_MMU_SOFT_4xx_Z) {
> +                if (env->mmu_model == POWERPC_MMU_SOFT_4xx) {
>                       env->spr[SPR_40x_DEAR] = eaddr;
>                       if (access_type == MMU_DATA_STORE) {
>                           env->spr[SPR_40x_ESR] |= 0x00800000;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index f992131c1aa5..2ec3d203a081 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -388,7 +388,6 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>           ppc6xx_tlb_invalidate_all(env);
>           break;
>       case POWERPC_MMU_SOFT_4xx:
> -    case POWERPC_MMU_SOFT_4xx_Z:
>           ppc4xx_tlb_invalidate_all(env);
>           break;
>       case POWERPC_MMU_REAL:
> 

