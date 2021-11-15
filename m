Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630B451B96
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 01:01:39 +0100 (CET)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmlus-0000kQ-Ix
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 19:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmltL-0008GN-1d
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 19:00:03 -0500
Received: from [2607:f8b0:4864:20::d34] (port=45774
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmltJ-00049p-3R
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 19:00:02 -0500
Received: by mail-io1-xd34.google.com with SMTP id v23so23655289iom.12;
 Mon, 15 Nov 2021 16:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xBr4LLP5YvmmoiRCV+GMMyQzEMXr/4WpU4JknXEqcys=;
 b=BUXL1ChDbthQiPvb3h2I7LLQ8RuZUIwiebdgEnYS2y0q6egtxQbSEc5uWDqDa05LJc
 ODcrwtERCwfhXOw3knAimlqraaCPV5s42TnOWzlH80ymGpqMRuqJPxoN2PgDw8iIchbC
 LRVk2HGS9vv+Rib28XtB3g+4BqDL2mpG1s0pvpBgaRpSbKsbMIciVKJghGrB7oNGOAHL
 ql65AFB/8LChUJtgy+b3uNm9Bnxzj2qDA90/M3SHh7X+vQXTMLZDSQm4lPeVzOPMFcbD
 r75DNuEzs+cSptavI26aYEqJcn7OH9Ol5XE2x9TwSr/+PDheUzi3Ygh+t3rhhgbWy3Qx
 GMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xBr4LLP5YvmmoiRCV+GMMyQzEMXr/4WpU4JknXEqcys=;
 b=AIIiTZOBXH5fl0mg/78qfygOBpkDbBBlMEY/9GDqPEZl8kKEDpsVbq5UO3X+9jI0cL
 HN4cJl51BHjp7e5K429jdr40KK5p5l9n8xc8lIiDvXq0W1q/pwlBZ8SX5agDAarj7V3M
 PID2CTng2wKkZIxwIedin/sGamT4ZYxA7WkKN4p2kW345LspKPE2TBNn0K3dqwMLvRN6
 R4teJEAcjb7NdwWmDOtAaQt0bYmQwZtv8tHIPSGB++AUUegANhRrpirLpVftsVBjLzXs
 3+VSfPLWnNKz3f5rmoPHIFiWKkitRRYAsqryfXq1Hh5FS/IpnuE9+spN4TigtsaDkuNA
 9Stg==
X-Gm-Message-State: AOAM533DxvwzOAB8PGNPaFCHmoOWJEWFrT7g1TJxNS79bKq6wqP9vX9i
 HkBFzLVTM7RL8FONDw4zI+Wwfxbn1ttP2qpPG+8=
X-Google-Smtp-Source: ABdhPJx3D0MqLeddouIuGW2CA/iSHRPDLvab/UC3rFrr45BhwCkxtHYs+25nM8nxLpa0MUR/oY5wL8qmTIGY6gCtjCM=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr1970067jal.117.1637020799761; 
 Mon, 15 Nov 2021 15:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20211029085922.255197-1-frank.chang@sifive.com>
 <20211029085922.255197-74-frank.chang@sifive.com>
In-Reply-To: <20211029085922.255197-74-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 09:59:33 +1000
Message-ID: <CAKmqyKN+w+uu=c-Ms778jJVtkL30uj9Dga6bYExZDyG+KBaqQg@mail.gmail.com>
Subject: Re: [PATCH v9 73/76] target/riscv: rvv-1.0: add evl parameter to
 vext_ldst_us()
To: Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 8:11 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add supports of Vector unit-stride mask load/store instructions
> (vlm.v, vsm.v), which has:
>     evl (effective vector length) = ceil(env->vl / 8).
>
> The new instructions operate the same as unmasked byte loads and stores.
> Add evl parameter to reuse vext_ldst_us().
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 946dca53ffd..83373ca6fc6 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -279,15 +279,15 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
>  /* unmasked unit-stride load and store operation*/
>  static void
>  vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
> -             vext_ldst_elem_fn *ldst_elem,
> -             uint32_t esz, uintptr_t ra, MMUAccessType access_type)
> +             vext_ldst_elem_fn *ldst_elem, uint32_t esz, uint32_t evl,
> +             uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, esz);
>
>      /* load bytes from guest memory */
> -    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> +    for (i = env->vstart; i < evl; i++, env->vstart++) {
>          k = 0;
>          while (k < nf) {
>              target_ulong addr = base + ((i * nf + k) << esz);
> @@ -316,7 +316,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
>                    CPURISCVState *env, uint32_t desc)                    \
>  {                                                                       \
>      vext_ldst_us(vd, base, env, desc, LOAD_FN,                          \
> -                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_LOAD);          \
> +                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_LOAD); \
>  }
>
>  GEN_VEXT_LD_US(vle8_v,  int8_t,  lde_b)
> @@ -324,20 +324,20 @@ GEN_VEXT_LD_US(vle16_v, int16_t, lde_h)
>  GEN_VEXT_LD_US(vle32_v, int32_t, lde_w)
>  GEN_VEXT_LD_US(vle64_v, int64_t, lde_d)
>
> -#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                           \
> -void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,         \
> -                         CPURISCVState *env, uint32_t desc)             \
> -{                                                                       \
> -    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));             \
> -    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,  \
> -                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);     \
> -}                                                                       \
> -                                                                        \
> -void HELPER(NAME)(void *vd, void *v0, target_ulong base,                \
> -                  CPURISCVState *env, uint32_t desc)                    \
> -{                                                                       \
> -    vext_ldst_us(vd, base, env, desc, STORE_FN,                         \
> -                 ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);         \
> +#define GEN_VEXT_ST_US(NAME, ETYPE, STORE_FN)                            \
> +void HELPER(NAME##_mask)(void *vd, void *v0, target_ulong base,          \
> +                         CPURISCVState *env, uint32_t desc)              \
> +{                                                                        \
> +    uint32_t stride = vext_nf(desc) << ctzl(sizeof(ETYPE));              \
> +    vext_ldst_stride(vd, v0, base, stride, env, desc, false, STORE_FN,   \
> +                     ctzl(sizeof(ETYPE)), GETPC(), MMU_DATA_STORE);      \
> +}                                                                        \
> +                                                                         \
> +void HELPER(NAME)(void *vd, void *v0, target_ulong base,                 \
> +                  CPURISCVState *env, uint32_t desc)                     \
> +{                                                                        \
> +    vext_ldst_us(vd, base, env, desc, STORE_FN,                          \
> +                 ctzl(sizeof(ETYPE)), env->vl, GETPC(), MMU_DATA_STORE); \
>  }
>
>  GEN_VEXT_ST_US(vse8_v,  int8_t,  ste_b)
> --
> 2.25.1
>
>

