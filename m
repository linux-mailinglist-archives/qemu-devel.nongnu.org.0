Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D284B857B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:27:49 +0100 (CET)
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHXE-0008TZ-P7
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nKHUO-0006L7-L1
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:24:48 -0500
Received: from [2a00:1450:4864:20::42a] (port=41744
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nKHUL-0004rl-FY
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:24:48 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k1so2628934wrd.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hZeb99V8/WjFFZUOv/7QfQCLPEl8t1vJ77oILzuyFQw=;
 b=mjncLQv3X3prziZTOMl5/WGBOuHsb3IMeWzjTssIaY0b99BqpdP2TuNH+FRUKHaUhk
 2FfN6h5g9nf2rBI1eR8EwQ930IgQpGB3MG8cJMEnhTasaM5h/iaeSN2/K3RSU4EedZc0
 qHSRqQnLyKXE2v2hqA7c3mKmZBDeOo7Nbd+srK113AUy2UtdIg1BlNqrrwr4qAqHBYME
 6/lNz2kyzGTz41nI1zDnXY6eceHqDCFpByb6oeMtKKb9mnqhNk0n5BYPCjkpIbmZZAdg
 mxjum42o6xRXLsyCFF2tcLTOpAx5YoBzHTdYQZUu1b9yhSiZebqB+OSGIKPhCRyY/KAK
 /2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hZeb99V8/WjFFZUOv/7QfQCLPEl8t1vJ77oILzuyFQw=;
 b=lhYPgDUSEdqker9JfIJhq1ufyMC6gcB8D0GxsSybCeji42n/K6LN8Sa8obvpRqK6i9
 6MdTinNUuhTDJYy3BwhuYa4Er5lQlww1nPHF+zYavBvuCiTEDQzt1K0ArnJEZQPxE6nA
 P3JHNNQSre2txGdH/BqJhT+y4gtosWaxwBBTiv5K5gpVGpYwmIln9JMQ4Gp39BO9DRYz
 jK1lGDaWHFt7ehdsOAxrTBWfS8g+sKYdYAqcK0r25IEYq/S22yVtLCKbDFCVOqKV+ebb
 46fBhcS0zd9lejG3+A0RQbsXRUkmKz30sV1c/LCVH7pg1pf13QyPU0vwXYik10X/G+xB
 MZ7A==
X-Gm-Message-State: AOAM530BYVhXmcNcLXbfgyydGZaN13JhsXUWhsQyoJIRgOY6rFbdgxT8
 zCBfWj8zXIXE5+DyTx6CIPrMUexfog3H6VzNix4o3w==
X-Google-Smtp-Source: ABdhPJxnd9DGN3a5H8hNsuCW+27mXW9vhrqH3wB3pgv7wN8OVm5I/VzOTUq5lh1tEJQGhQ5Ym1zubxzGKNT09cGNtEA=
X-Received: by 2002:adf:f2cb:0:b0:1e4:bd07:ed68 with SMTP id
 d11-20020adff2cb000000b001e4bd07ed68mr1744914wrp.306.1645007074406; Wed, 16
 Feb 2022 02:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
 <20220216062912.319738-8-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220216062912.319738-8-alistair.francis@opensource.wdc.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 16 Feb 2022 11:24:23 +0100
Message-ID: <CAAeLtUA7KCTPCkutpTn2GgpWi2nU_Zidsh1yKf6bFKEQ4CWdpA@mail.gmail.com>
Subject: Re: [PULL v2 07/35] target/riscv: access cfg structure through
 DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alistair,

This PULL seems not to include the fixup (which you had intended to
squash into it) for the regression introduced (i.e. the condition
being inverted):
  https://patchwork.kernel.org/project/qemu-devel/patch/20220203153946.2676353-1-philipp.tomsich@vrull.eu/
Without that change this will introduce a regression in Zb[abcs]
(i.e., it will be enabled when it shouldn't be, and will be disabled
when it should be on).

Please ignore, if I missed a later stand-alone patch (I just looked at
the series in Patchworks).

Thanks,
Philipp.


On Wed, 16 Feb 2022 at 07:29, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> The Zb[abcs] support code still uses the RISCV_CPU macros to access
> the configuration information (i.e., check whether an extension is
> available/enabled).  Now that we provide this information directly
> from DisasContext, we can access this directly via the cfg_ptr field.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220202005249.3566542-5-philipp.tomsich@vrull.eu>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 810431a1d6..f9bd3b7ec4 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -19,25 +19,25 @@
>   */
>
>  #define REQUIRE_ZBA(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
> +    if (ctx->cfg_ptr->ext_zba) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBB(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
> +    if (ctx->cfg_ptr->ext_zbb) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBC(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
> +    if (ctx->cfg_ptr->ext_zbc) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBS(ctx) do {                    \
> -    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
> +    if (ctx->cfg_ptr->ext_zbs) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
> --
> 2.34.1
>

