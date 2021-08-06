Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095253E2B2E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 15:08:25 +0200 (CEST)
Received: from localhost ([::1]:40466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBzaJ-0008KV-Jf
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 09:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBzYL-00062v-JZ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:06:21 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBzYG-0004Ml-6l
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 09:06:21 -0400
Received: by mail-wm1-x32c.google.com with SMTP id m19so5610148wms.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=5xtAA/7/XLUWdcGZiqcflsoBm7VM5+FZMEhwRWamg8k=;
 b=CzmufQ3x4f+tO+IpHplyXLV3KCaG1RXHDoWAhOXWL5otnhrBQRNPSPhgSO9WbpHK36
 ofDhFZwUxb0o4vMcXdwamPR/61iv+JdEhAerx9t2y2qaKDRi1xKzC2wOYJb6ckyoYyt4
 /JU9jtWOS/RQ7BnCjFy/U04cblXHyvor2mbpF5uSL9LnUYvc9FIiWveV+fQ6Xqbz6FKu
 7tOnysBRdpbwkvJQfBad92XkhTeRrN+P74IH5qDQCei33ScMvfHkY9BYHbtS/jKH7Mwu
 1BYPzdqQcfC+xwl+/tFHSE2Kb+vYKRokUYJGomzGSiRgF6cKkoM4+FeK9R097rOcAIzh
 egug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=5xtAA/7/XLUWdcGZiqcflsoBm7VM5+FZMEhwRWamg8k=;
 b=Tm40IEJKVP3Rmi/X4pTqbuI4yyfnNFQezkALB5TGqmNocmg1uNmxuMn2jddRzui+Ym
 A6NbC/h8Rdxcoun6cXAdSJgGWY0yXh10bRnXGswPlXx3yqrMxlxAu92MBFc9TAUJvJPX
 x3p9NWVq9bVACDbe23+JtNK5aWFS8pFKYjmBft+FUPUWh5RtntrCMRn7cE7UgS9hcF54
 x+FMKvO7TG1vspHLB6rVGNeJSfGAD86SQ1lDj5L22N/biiBFqJFWlhVUr/z5xjHjEnOe
 l2Hvm9J3pWsbYBU9huW6cYP60daGRtTNoTNzwNb4FDaTyoHdx3zme3v6U8Vs3VwNmDC8
 Mddw==
X-Gm-Message-State: AOAM533qOjZv5VX+Gu1AgzVq2PMxLlN4FvfaUP/eZ8+yB4kijIoFSyfU
 ZuY4b2OS1zv2ImpfLYN0VDq0QpWU2c2dOn8J
X-Google-Smtp-Source: ABdhPJwUc4jF/8nf6x34zzkT1TEdZ7efgghelohtEh+Lqtsz6+ckSb5aZ53AXX2RMN20uf+b0YttVA==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr3221994wml.44.1628255170284; 
 Fri, 06 Aug 2021 06:06:10 -0700 (PDT)
Received: from smtpclient.apple (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id q17sm9406875wre.3.2021.08.06.06.06.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Aug 2021 06:06:10 -0700 (PDT)
From: Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: [RFC PATCH v4 4/4] Enable custom CSR logic for Andes AX25 and A25
Message-Id: <D5F8611E-0C85-4F59-A2A6-9B2EE01589C4@jrtc27.com>
Date: Fri, 6 Aug 2021 14:06:09 +0100
To: ruinland@andestech.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Ruinalnd ChuanTzu Tsai <ruinland@andestech.com>
>=20
> In this patch we enabled custom CSR logic for Andes AX25 and A25 =
logic.
> Hence csr_andes.inc.c and andes_cpu_bits.h is added.
>=20
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>  target/riscv/andes_cpu_bits.h  | 124 +++++++++++++++++++++++++
>  target/riscv/cpu.c             |  12 +++
>  target/riscv/csr.c             |   2 +-
>  target/riscv/csr_andes.inc.c   | 160 =
+++++++++++++++++++++++++++++++++
>  target/riscv/custom_cpu_bits.h |   6 +-
>  5 files changed, 302 insertions(+), 2 deletions(-)
>  create mode 100644 target/riscv/andes_cpu_bits.h
>  create mode 100644 target/riscv/csr_andes.inc.c
>=20
> diff --git a/target/riscv/andes_cpu_bits.h =
b/target/riscv/andes_cpu_bits.h
> new file mode 100644
> index 0000000..bd2b7d1
> --- /dev/null
> +++ b/target/riscv/andes_cpu_bits.h
> @@ -0,0 +1,124 @@
> +/*
> + * Andes custom CSRs bit definitions
> + *
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + */
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D Missing drafted/standard CSR =
definitions */
> +/* Although TINFO is in official debug sepc, it's not in cpu_bits.h =
yet. */
> +#define CSR_TINFO           0x7a4
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D AndeStar V5 machine mode CSRs =
=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> +/* Configuration Registers */
> +#define CSR_MICM_CFG            0xfc0
> +#define CSR_MDCM_CFG            0xfc1
> +#define CSR_MMSC_CFG            0xfc2
> +#define CSR_MMSC_CFG2           0xfc3
> +#define CSR_MVEC_CFG            0xfc7
> +
> +/* Crash Debug CSRs */
> +#define CSR_MCRASH_STATESAVE    0xfc8
> +#define CSR_MSTATUS_CRASHSAVE   0xfc9
> +
> +/* Memory CSRs */
> +#define CSR_MILMB               0x7c0
> +#define CSR_MDLMB               0x7c1
> +#define CSR_MECC_CODE           0x7C2
> +#define CSR_MNVEC               0x7c3
> +#define CSR_MCACHE_CTL          0x7ca
> +#define CSR_MCCTLBEGINADDR      0x7cb
> +#define CSR_MCCTLCOMMAND        0x7cc
> +#define CSR_MCCTLDATA           0x7cd
> +#define CSR_MPPIB               0x7f0
> +#define CSR_MFIOB               0x7f1
> +
> +/* Hardware Stack Protection &amp; Recording */
> +#define CSR_MHSP_CTL            0x7c6
> +#define CSR_MSP_BOUND           0x7c7
> +#define CSR_MSP_BASE            0x7c8
> +#define CSR_MXSTATUS            0x7c4
> +#define CSR_MDCAUSE             0x7c9
> +#define CSR_MSLIDELEG           0x7d5
> +#define CSR_MSAVESTATUS         0x7d6
> +#define CSR_MSAVEEPC1           0x7d7
> +#define CSR_MSAVECAUSE1         0x7d8
> +#define CSR_MSAVEEPC2           0x7d9
> +#define CSR_MSAVECAUSE2         0x7da
> +#define CSR_MSAVEDCAUSE1        0x7db
> +#define CSR_MSAVEDCAUSE2        0x7dc
> +
> +/* Control CSRs */
> +#define CSR_MPFT_CTL            0x7c5
> +#define CSR_MMISC_CTL           0x7d0
> +#define CSR_MCLK_CTL            0x7df
> +
> +/* Counter related CSRs */
> +#define CSR_MCOUNTERWEN         0x7ce
> +#define CSR_MCOUNTERINTEN       0x7cf
> +#define CSR_MCOUNTERMASK_M      0x7d1
> +#define CSR_MCOUNTERMASK_S      0x7d2
> +#define CSR_MCOUNTERMASK_U      0x7d3
> +#define CSR_MCOUNTEROVF         0x7d4
> +
> +/* Enhanced CLIC CSRs */
> +#define CSR_MIRQ_ENTRY          0x7ec
> +#define CSR_MINTSEL_JAL         0x7ed
> +#define CSR_PUSHMCAUSE          0x7ee
> +#define CSR_PUSHMEPC            0x7ef
> +#define CSR_PUSHMXSTATUS        0x7eb
> +
> +/* Andes Physical Memory Attribute(PMA) CSRs */
> +#define CSR_PMACFG0             0xbc0
> +#define CSR_PMACFG1             0xbc1
> +#define CSR_PMACFG2             0xbc2
> +#define CSR_PMACFG3             0xbc3
> +#define CSR_PMAADDR0            0xbd0
> +#define CSR_PMAADDR1            0xbd1
> +#define CSR_PMAADDR2            0xbd2
> +#define CSR_PMAADDR3            0xbd2
> +#define CSR_PMAADDR4            0xbd4
> +#define CSR_PMAADDR5            0xbd5
> +#define CSR_PMAADDR6            0xbd6
> +#define CSR_PMAADDR7            0xbd7
> +#define CSR_PMAADDR8            0xbd8
> +#define CSR_PMAADDR9            0xbd9
> +#define CSR_PMAADDR10           0xbda
> +#define CSR_PMAADDR11           0xbdb
> +#define CSR_PMAADDR12           0xbdc
> +#define CSR_PMAADDR13           0xbdd
> +#define CSR_PMAADDR14           0xbde
> +#define CSR_PMAADDR15           0xbdf
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D AndeStar V5 supervisor mode CSRs =
=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> +/* Supervisor trap registers */
> +#define CSR_SLIE                0x9c4
> +#define CSR_SLIP                0x9c5
> +#define CSR_SDCAUSE             0x9c9
> +
> +/* Supervisor counter registers */
> +#define CSR_SCOUNTERINTEN       0x9cf
> +#define CSR_SCOUNTERMASK_M      0x9d1
> +#define CSR_SCOUNTERMASK_S      0x9d2
> +#define CSR_SCOUNTERMASK_U      0x9d3
> +#define CSR_SCOUNTEROVF         0x9d4
> +#define CSR_SCOUNTINHIBIT       0x9e0
> +#define CSR_SHPMEVENT3          0x9e3
> +#define CSR_SHPMEVENT4          0x9e4
> +#define CSR_SHPMEVENT5          0x9e5
> +#define CSR_SHPMEVENT6          0x9e6
> +
> +/* Supervisor control registers */
> +#define CSR_SCCTLDATA           0x9cd
> +#define CSR_SMISC_CTL           0x9d0
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D=3D AndeStar V5 user mode CSRs =3D=3D=3D=3D=3D=
=3D=3D=3D=3D */
> +/* User mode control registers */
> +#define CSR_UITB                0x800
> +#define CSR_UCODE               0x801
> +#define CSR_UDCAUSE             0x809
> +#define CSR_UCCTLBEGINADDR      0x80b
> +#define CSR_UCCTLCOMMAND        0x80c
> +#define CSR_WFE                 0x810
> +#define CSR_SLEEPVALUE          0x811
> +#define CSR_TXEVT               0x812
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9eb1e3a..d1d4773 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -187,6 +187,12 @@ static void ax25_cpu_init(Object *obj)
>      CPURISCVState *env =3D &amp;RISCV_CPU(obj)->env;
>      set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | =
RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +
> +    #if defined(CONFIG_RISCV_CUSTOM)
> +    /* setup custom csr handler hash table */
> +    setup_custom_csr(env, andes_custom_csr_table);
> +    env->custom_csr_val =3D g_malloc(andes_custom_csr_size);
> +    #endif
>  }
> =20
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -248,6 +254,12 @@ static void a25_cpu_init(Object *obj)
>      CPURISCVState *env =3D &amp;RISCV_CPU(obj)->env;
>      set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | =
RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +
> +    #if defined(CONFIG_RISCV_CUSTOM)
> +    /* setup custom csr handler hash table */
> +    setup_custom_csr(env, andes_custom_csr_table);
> +    env->custom_csr_val =3D g_malloc(andes_custom_csr_size);
> +    #endif
>  }
>  #endif
> =20
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1c4dc94..9c16b88 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1421,7 +1421,7 @@ int riscv_csrrw_debug(CPURISCVState *env, int =
csrno,=20
> target_ulong *ret_value,
>  }
> =20
>  #if defined(CONFIG_RISCV_CUSTOM)
> -/* Include the custom CSR table here. */
> +#include "csr_andes.inc.c"
>  #endif
> =20
>  /* Control and Status Register function table */
> diff --git a/target/riscv/csr_andes.inc.c =
b/target/riscv/csr_andes.inc.c
> new file mode 100644
> index 0000000..da226b0
> --- /dev/null
> +++ b/target/riscv/csr_andes.inc.c
> @@ -0,0 +1,160 @@
> +/*
> + * Andes custom CSR table and handling functions
> + *
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + */
> +
> +static int write_uitb(CPURISCVState *env, int csrno, target_ulong =
val);
> +static int read_uitb(CPURISCVState *env, int csrno, target_ulong =
*val);
> +
> +struct andes_csr_val {
> +    target_long uitb;
> +};
> +
> +static int read_mmsc_cfg(CPURISCVState *env, int csrno, target_ulong =
*val)
> +{
> +    /* enable pma probe */
> +    *val =3D 0x40000000;
> +    return 0;
> +}
> +
> +static int write_uitb(CPURISCVState *env, int csrno, target_ulong =
val)
> +{
> +    struct andes_csr_val *andes_csr =3D env->custom_csr_val;
> +    andes_csr->uitb =3D val;
> +    return 0;
> +}
> +
> +static int read_uitb(CPURISCVState *env, int csrno, target_ulong =
*val)
> +{
> +    struct andes_csr_val *andes_csr =3D env->custom_csr_val;
> +    *val =3D andes_csr->uitb;
> +    return 0;
> +}
> +
> +
> +int andes_custom_csr_size =3D sizeof(struct andes_csr_val);
> +riscv_custom_csr_operations =
andes_custom_csr_table[MAX_CUSTOM_CSR_NUM] =3D {
> +    /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
AndeStar V5 machine mode CSRs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=20
> */
> +    /* Configuration Registers */
> +    {CSR_MICM_CFG,         { "micm_cfg",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_MDCM_CFG,         { "mdcm_cfg",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_MMSC_CFG,         { "mmsc_cfg",          any, read_mmsc_cfg,=20=

> write_stub} },
> +    {CSR_MMSC_CFG2,        { "mmsc_cfg2",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MVEC_CFG,         { "mvec_cfg",          any, read_zero, =
write_stub}=20
> },
> +
> +    /* Crash Debug CSRs */
> +    {CSR_MCRASH_STATESAVE,  { "mcrash_statesave",  any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSTATUS_CRASHSAVE, { "mstatus_crashsave", any, read_zero, =
write_stub}=20
> },
> +
> +    /* Memory CSRs */
> +    {CSR_MILMB,            { "milmb",             any, read_zero, =
write_stub}=20
> },
> +    {CSR_MDLMB,            { "mdlmb",             any, read_zero, =
write_stub}=20
> },
> +    {CSR_MECC_CODE,        { "mecc_code",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MNVEC,            { "mnvec",             any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCACHE_CTL,       { "mcache_ctl",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCCTLBEGINADDR,   { "mcctlbeginaddr",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCCTLCOMMAND,     { "mcctlcommand",      any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCCTLDATA,        { "mcctldata",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MPPIB,            { "mppib",             any, read_zero, =
write_stub}=20
> },
> +    {CSR_MFIOB,            { "mfiob",             any, read_zero, =
write_stub}=20
> },
> +
> +    /* Hardware Stack Protection &amp; Recording */
> +    {CSR_MHSP_CTL,         { "mhsp_ctl",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSP_BOUND,        { "msp_bound",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSP_BASE,         { "msp_base",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_MXSTATUS,         { "mxstatus",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_MDCAUSE,          { "mdcause",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSLIDELEG,        { "mslideleg",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVESTATUS,      { "msavestatus",       any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVEEPC1,        { "msaveepc1",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVECAUSE1,      { "msavecause1",       any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVEEPC2,        { "msaveepc2",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVECAUSE2,      { "msavecause2",       any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVEDCAUSE1,     { "msavedcause1",      any, read_zero, =
write_stub}=20
> },
> +    {CSR_MSAVEDCAUSE2,     { "msavedcause2",      any, read_zero, =
write_stub}=20
> },
> +
> +    /* Control CSRs */
> +    {CSR_MPFT_CTL,         { "mpft_ctl",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_MMISC_CTL,        { "mmisc_ctl",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCLK_CTL,         { "mclk_ctl",          any, read_zero, =
write_stub}=20
> },
> +
> +    /* Counter related CSRs */
> +    {CSR_MCOUNTERWEN,      { "mcounterwen",       any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCOUNTERINTEN,    { "mcounterinten",     any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCOUNTERMASK_M,   { "mcountermask_m",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCOUNTERMASK_S,   { "mcountermask_s",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCOUNTERMASK_U,   { "mcountermask_u",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_MCOUNTEROVF,      { "mcounterovf",       any, read_zero, =
write_stub}=20
> },
> +
> +    /* Enhanced CLIC CSRs */
> +    {CSR_MIRQ_ENTRY,       { "mirq_entry",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_MINTSEL_JAL,      { "mintsel_jal",       any, read_zero, =
write_stub}=20
> },
> +    {CSR_PUSHMCAUSE,       { "pushmcause",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_PUSHMEPC,         { "pushmepc",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PUSHMXSTATUS,     { "pushmxstatus",      any, read_zero, =
write_stub}=20
> },
> +
> +    /* Andes Physical Memory Attribute(PMA) CSRs */
> +    {CSR_PMACFG0,          { "pmacfg0",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMACFG1,          { "pmacfg1",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMACFG2,          { "pmacfg2",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMACFG3,          { "pmacfg3",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR0,         { "pmaaddr0",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR1,         { "pmaaddr1",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR2,         { "pmaaddr2",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR3,         { "pmaaddr3",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR4,         { "pmaaddr4",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR5,         { "pmaaddr5",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR6,         { "pmaaddr6",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR7,         { "pmaaddr7",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR8,         { "pmaaddr8",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR9,         { "pmaaddr9",          any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR10,        { "pmaaddr10",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR11,        { "pmaaddr11",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR12,        { "pmaaddr12",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR13,        { "pmaaddr13",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR14,        { "pmaaddr14",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_PMAADDR15,        { "pmaaddr15",         any, read_zero, =
write_stub}=20
> },
> +
> +    /* Debug/Trace Registers (shared with Debug Mode) */
> +    {CSR_TSELECT,          { "tselect",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_TDATA1,           { "tdata1",            any, read_zero, =
write_stub}=20
> },
> +    {CSR_TDATA2,           { "tdata2",            any, read_zero, =
write_stub}=20
> },
> +    {CSR_TDATA3,           { "tdata3",            any, read_zero, =
write_stub}=20
> },
> +    {CSR_TINFO,            { "tinfo",             any, read_zero, =
write_stub}=20
> },
> +
> +    /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
AndeStar V5 supervisor mode CSRs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=20
> */
> +    /* Supervisor trap registers */
> +    {CSR_SLIE,             { "slie",              any, read_zero, =
write_stub}=20
> },
> +    {CSR_SLIP,             { "slip",              any, read_zero, =
write_stub}=20
> },
> +    {CSR_SDCAUSE,          { "sdcause",           any, read_zero, =
write_stub}=20
> },
> +
> +    /* Supervisor counter registers */
> +    {CSR_SCOUNTERINTEN,    { "scounterinten",     any, read_zero, =
write_stub}=20
> },
> +    {CSR_SCOUNTERMASK_M,   { "scountermask_m",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_SCOUNTERMASK_S,   { "scountermask_s",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_SCOUNTERMASK_U,   { "scountermask_u",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_SCOUNTEROVF,      { "scounterovf",       any, read_zero, =
write_stub}=20
> },
> +    {CSR_SCOUNTINHIBIT,    { "scountinhibit",     any, read_zero, =
write_stub}=20
> },
> +    {CSR_SHPMEVENT3,       { "shpmevent3",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_SHPMEVENT4,       { "shpmevent4",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_SHPMEVENT5,       { "shpmevent5",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_SHPMEVENT6,       { "shpmevent6",        any, read_zero, =
write_stub}=20
> },
> +
> +    /* Supervisor control registers */
> +    {CSR_SCCTLDATA,        { "scctldata",         any, read_zero, =
write_stub}=20
> },
> +    {CSR_SMISC_CTL,        { "smisc_ctl",         any, read_zero, =
write_stub}=20
> },
> +
> +    /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
AndeStar V5 user mode CSRs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=20
> */
> +    /* User mode control registers */
> +    {CSR_UITB,             { "uitb",              any, read_uitb, =
write_uitb}=20
> },
> +    {CSR_UCODE,            { "ucode",             any, read_zero, =
write_stub}=20
> },
> +    {CSR_UDCAUSE,          { "udcause",           any, read_zero, =
write_stub}=20
> },
> +    {CSR_UCCTLBEGINADDR,   { "ucctlbeginaddr",    any, read_zero, =
write_stub}=20
> },
> +    {CSR_UCCTLCOMMAND,     { "ucctlcommand",      any, read_zero, =
write_stub}=20
> },
> +    {CSR_WFE,              { "wfe",               any, read_zero, =
write_stub}=20
> },
> +    {CSR_SLEEPVALUE,       { "sleepvalue",        any, read_zero, =
write_stub}=20
> },
> +    {CSR_TXEVT,            { "csr_txevt",         any, read_zero, =
write_stub}=20
> },
> +    {0, { "", NULL, NULL, NULL } },
> +    };

A couple of glaring problems:

1. You should not be using any for M-mode or S-mode CSRs otherwise
those are accessible by U-mode.

2. The S-mode, and U-mode in particular, CSRs must be inaccessible by
default even to the right privilege modes in order to avoid introducing
architectural covert channels for software that is unaware of their
existence (e.g. running an unmodified OS whose context switcher does
not save/restore the U-mode CSRs, i.e. everything except whatever OS
you have for this thing). I hope such enable bits exist in the real
architecture and you just have not implemented them here, like the
privilege checks above? If the architecture omits them and thus has
security issues I don=E2=80=99t know whether faithfully emulating that =
is a
good idea or not; I=E2=80=99d be inclined to say that should be a =
(run-time)
option that=E2=80=99s off by default the user has to explicitly enable.

Jess


