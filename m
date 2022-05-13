Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85950525F9C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:15:48 +0200 (CEST)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSKp-0002ZD-3H
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npSJQ-00016V-I1
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:14:20 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npSJO-0000nP-U9
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:14:20 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7d7e3b5bfso85181917b3.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0Je9y+M8dIuB/fuq3rxBKyiseRF3ljnPWVNnO9YjwY=;
 b=APaApJB6UqWraxTgECAl54MAmCOldMfux4QqMpt5u/hM/BvxU3XUrHcohh7QLPUebb
 A6ZvgbwEKHntCYNChvs9RN1fTmRSqXskG5w3YoAZrR84jE4Yr1llzrjjm8sxIo6u8Xs9
 fchU8H9oa5JvXvhZxa6ULiJmCVYbyCuRy/e47xSwNXwGYh5anjNK3Sb/mB7Gc9MZn4CS
 ECmVsBFyLUgvykRpA+dduR+ExivNsZcKPTs77OaiOHYptJ0z6fEivoBBbOcEgYjrnmdf
 swSDkDvG4Eq6VqityceUco8uDvEvwK5FVgrA/goyr89R6OGfdITzSQAGQkB+6Yvpflep
 osKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0Je9y+M8dIuB/fuq3rxBKyiseRF3ljnPWVNnO9YjwY=;
 b=aw7lwMCXuhXDrjLG1L+NsGy9JrG1Cx6HPpmbRfhpmcKb5Dqz6HZLtOz3jDfwOneMhE
 SY94bYHrkLGuzi2yOb6LSamjZGlU7zp5cPtGyiV0lpppUIW+0vtpV/E7prukgPJVgYEt
 6sbAimXeFZevKaqGcUU2uIIQIZNjXaaTvn9OlwK+37FVemPpb6AOfOg3a4mTiZ98JHxz
 EfggPusUKoOGnkGbJ00i1PhGRXyjsePFzo6VH9odJ7mCsvrEuasO27FHlzaonL436V98
 wgpxNaz6d8lIs/BStIB0q7DPRZZmYHUo4W4X2fgPvmc8F6WmikvubOuvvp4EqNmXs7WS
 Js6Q==
X-Gm-Message-State: AOAM533Yi3ueq/WTdljTLPpGnph1Id0wykh6jx/diZm+n7MHltpyaSol
 oEjIZdiWR9Wmzdq42H+mihF9eTwH9G9TbVPzmC1P3g==
X-Google-Smtp-Source: ABdhPJywyVOaE3bMbLKAYJcZiPq5TPnKosDx0Gca0SzeKmhWqwuYA89naUpkHz4f018aVE9UtKTEJW8B4e1EMXZoJbc=
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr4730925ywe.455.1652436857548; Fri, 13
 May 2022 03:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220510000426.45797-1-richard.henderson@linaro.org>
 <20220510000426.45797-3-richard.henderson@linaro.org>
In-Reply-To: <20220510000426.45797-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 11:14:06 +0100
Message-ID: <CAFEAcA8OGPEETKTt=A3j4W65Kh3QAC80W7hmt5xrpLu8TUJHDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Use FIELD definitions for CPACR, CPTR_ELx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 10 May 2022 at 01:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had a few CPTR_* bits defined, but missed quite a few.
> Complete all of the fields up to ARMv9.2.
> Use FIELD_EX64 instead of manual extract32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 44 +++++++++++++++++++++++++++++++-----
>  hw/arm/boot.c       |  2 +-
>  target/arm/cpu.c    | 11 ++++++---
>  target/arm/helper.c | 54 ++++++++++++++++++++++-----------------------
>  4 files changed, 75 insertions(+), 36 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b35b117fe7..c44acd8b84 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1259,11 +1259,45 @@ void pmu_init(ARMCPU *cpu);
>  #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
>  #define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
>
> -#define CPTR_TCPAC    (1U << 31)
> -#define CPTR_TTA      (1U << 20)
> -#define CPTR_TFP      (1U << 10)
> -#define CPTR_TZ       (1U << 8)   /* CPTR_EL2 */
> -#define CPTR_EZ       (1U << 8)   /* CPTR_EL3 */
> +/* Bit definitions for CPACR (AArch32 only) */
> +FIELD(CPACR, CP10, 20, 2)
> +FIELD(CPACR, CP11, 22, 2)
> +FIELD(CPACR, TRCDIS, 28, 1)    /* matches CPACR_EL1.TTA */
> +FIELD(CPACR, D32DIS, 31, 1)    /* up to v7; RAZ in v8 */
> +FIELD(CPACR, ASEDIS, 31, 1)

D32DIS is bit 30, not 31.

> +
> +/* Bit definitions for CPACR_EL1 (AArch64 only) */
> +FIELD(CPACR_EL1, ZEN, 16, 2)
> +FIELD(CPACR_EL1, FPEN, 20, 2)
> +FIELD(CPACR_EL1, SMEN, 24, 2)
> +FIELD(CPACR_EL1, TTA, 28, 1)   /* matches CPACR.TRCDIS */
> +
> +/* Bit definitions for HCPTR (AArch32 only) */
> +FIELD(HCPTR, TCP10, 10, 1)
> +FIELD(HCPTR, TCP11, 11, 1)
> +FIELD(HCPTR, TSAE, 15, 1)

This is TASE, not TSAE.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

