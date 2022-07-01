Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F330D5633F4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:04:24 +0200 (CEST)
Received: from localhost ([::1]:36072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7GJr-0006mW-IP
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GH0-0005gL-4n
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:01:26 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7GGu-00028v-LM
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:01:25 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3176b6ed923so22605897b3.11
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7WEKrK3Ve94fVsMiu4QZqG4VcezjiZgfiDKVAFq/62U=;
 b=IEkpk1Gac/6s1yzy5e5xQHVPZOnV7+c8YfwhBXkTM279V6RwbdXFudluSuiejA0txr
 mlo5DVNOQf8PaX3HD/dINQATYB6Vxx4aSA4Az5lWikUhQWhXYZdP1fMLtxejEVr9yeuq
 41reaK7S42rtg/bpQGPbji0u+UjbOztHBGCmjPYNgXyMIkQGzrSWeja6NSuCHYEVML8c
 Z/StL5tQjFMOi4aCbOno2VZ9bZFiALzUAfLR5MvWYvUgJIC9PcjAXNw4Z0sGNqYqn2CL
 js4uiGlERYMK4/ImBLtOu9iVSAgDDAgK5lyw2whfoTyXVtRCVSzCf6BNkP26OFDAIhCo
 1gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7WEKrK3Ve94fVsMiu4QZqG4VcezjiZgfiDKVAFq/62U=;
 b=RTIBuvKiS64J8qgGew3WGMab+qYYMO1j1oVmjB2qDGQD62ne5EKLYDbPtvmJuHjbIB
 y7UhvnNNUae5mK7lcqxrAwluNQ0/kH5P6Hi/8ym7xPDzCwW4mkkWQdqUCPsqAqYNtUAT
 K6X0ai1AF46yMdwjU52ZmnnjmrsNp4hTL/gwmyYaE1Ly30vrYF3GVZ4pRCsouhDI2ElN
 2VR+8UivK2xVrDEc+fdlSRHUIi7t6t0kK8xIAjeJX7PSJuJb08+QpupD60+bnmDTWnf8
 MCXC1buJqRPZYOgjoPsjwRQBms4/PUDFeKNO7LZGedpspnm7hbRvSU55urDGd30cQTvL
 4ShA==
X-Gm-Message-State: AJIora91KZQXH+hsX3CmN/+LiE0/MTZHefIrMD00/zrnwptTJ3EexL9p
 L3lx+0tm9veSrVfddSUL83Xn2Ul81H8NMUkSJMVH6g==
X-Google-Smtp-Source: AGRyM1t543lsdu4xaAf2Y5N//JuOImQV7Ky/GztMj250nh8pJlC32vCaSgnSVvYegTlRgPr2Iaet9o4HxoT5udh7FeQ=
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr17146411ywd.347.1656680478212; Fri, 01
 Jul 2022 06:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-15-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 14:00:39 +0100
Message-ID: <CAFEAcA931o2eATDzkU1cDFuRmHPfvhVgF+b8wq=f_ZCwDj5UTw@mail.gmail.com>
Subject: Re: [PATCH v4 14/45] target/arm: Mark LD1RO as non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jun 2022 at 05:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sme-fa64.decode | 3 ---
>  target/arm/translate-sve.c | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
> index 7a0b05cf2c..33bbd13bcb 100644
> --- a/target/arm/sme-fa64.decode
> +++ b/target/arm/sme-fa64.decode
> @@ -57,6 +57,3 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
>  #       --11 1100 --0- ---- ---- ---- ---- ----   # Load/store FP register (unscaled imm)
>  #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
>  #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
> -
> -FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
> -FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 11874a8e77..e5e9e1e0ca 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -5062,6 +5062,7 @@ static bool trans_LD1RO_zprr(DisasContext *s, arg_rprr_load *a)
>      if (a->rm == 31) {
>          return false;
>      }
> +    s->is_nonstreaming = true;
>      if (sve_access_check(s)) {
>          TCGv_i64 addr = new_tmp_a64(s);
>          tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
> @@ -5076,6 +5077,7 @@ static bool trans_LD1RO_zpri(DisasContext *s, arg_rpri_load *a)
>      if (!dc_isar_feature(aa64_sve_f64mm, s)) {
>          return false;
>      }
> +    s->is_nonstreaming = true;
>      if (sve_access_check(s)) {
>          TCGv_i64 addr = new_tmp_a64(s);
>          tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 32);

The sve.decode lines for these two trans functions:
LD1RO_zprr      1010010 .. 01 ..... 000 ... ..... ..... \
                @rprr_load_msz nreg=0
LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
                @rpri_load_msz nreg=0

don't match up with the FAIL line.

The FAIL lines correspond to unallocated encodings in the decode
tables in the main Arm ARM so we can assume this is an error in the SME
supplement.

We should use the right encoding lines in the original commit of
sme-fa64.decode and mention that in its commit message. They should
I believe be:

 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load &
replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load &
replicate 32 bytes (scalar+imm)

(differences only in bits [22:21]).

For this patch,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

