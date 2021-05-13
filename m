Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D937FE46
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:37:06 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhH8r-0001ES-Qz
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH7p-0000Py-6v
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:36:01 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH7j-0005Db-PO
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:36:00 -0400
Received: by mail-ed1-x52e.google.com with SMTP id f1so10006379edt.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kiyOCwT9DsAkJCdxc1D1wTgaAbUmbvm8ZqvFXESkxV8=;
 b=EKbFepE60VEnyylpJPp82YVnSC62ZSWBEMThwvpEHIZlB28wa3XsD9nSvpqicPtEbO
 +4GCHnduXeuAWDWlJLO/r+PIbBx4EH8S/TcdpDl2w+3kEJz2kcQXEBMFMYSrRDE3hHaN
 AfB3VCYw18yIgFN8xUSwIHkvM/JyFKEk/zlDLdzMb6r+zJsuMNAFImmt78DFxM3UC1nL
 H5h4wegTqDkMASrJFrNefzKDETx4HFEJvan4R3g8CN6c5PGwhu1Vke9a+4DN/+8+j85x
 GcXbUjuw/NTLH08PA8AmrDkdA5t5G09Z24bEdPABniuqF+MEhd47uoJY2UD+Xaiv/4vR
 vBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kiyOCwT9DsAkJCdxc1D1wTgaAbUmbvm8ZqvFXESkxV8=;
 b=O/4mgQNSlwHHRRFMcqZULtxC/VWcNmnJWmyAh4RlQS+fcHnLZLl+vNLgnQzovZPmML
 VS8pOXgD9mtqUZ7+DszD11vmtnlmF+F0WXNvdwrDmu+Ml+Mie/WsMdT0NdGd8yjB+Fxt
 LlacfHFS22XZn5oDAahqBciF93tIyUn5K2ehJR9+4zFsWmWxw7OW5kOLVnQbA2mmUJLy
 3ivF7WErekDBMfzfd/HrH+YfwB309eSwe0pfjKkHE11+MicDAwFdGQIZzxYKMuKY5AM4
 IOLKrBaTxYt0oK9mfelGkUwcM8A4GsRsoGFZ/f3K4ik4BZNLSmbJvm8yc2hnhSXmARJa
 FHQw==
X-Gm-Message-State: AOAM5319j2Ism1iHb51zK+r32MX70BkMs26K13Wmf5UQ/Nl0JyvjY1QD
 jlZQbTxQy/Ekcv448bOGxXI4porOMA9m/VwDRFAm8A==
X-Google-Smtp-Source: ABdhPJyagyiUkmn6/ad165nEJmWVPB0ApU6Dt4fOZk8Rr+bM2x3IeRIYFTArN9i9DPLSw9Pckqkks8loK2t7HfyYqQM=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr51459036edd.251.1620934554333; 
 Thu, 13 May 2021 12:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-83-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-83-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:35:42 +0100
Message-ID: <CAFEAcA8Fic1AfAmsAavzHzsK7aXkNEC8DfTbsa3Krga66KtAdg@mail.gmail.com>
Subject: Re: [PATCH v6 82/82] target/arm: Enable SVE2 and related extensions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c   |  1 +
>  target/arm/cpu64.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 0dd623e590..30fd5d5ff7 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1464,6 +1464,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>
>          u = cpu->isar.id_isar6;
>          u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
>          cpu->isar.id_isar6 = u;
>
>          u = cpu->isar.mvfr0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9..379f90fab8 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
> +        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
>          cpu->isar.id_aa64isar1 = t;
>
>          t = cpu->isar.id_aa64pfr0;
> @@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
>          cpu->isar.id_aa64mmfr2 = t;
>
> +        t = cpu->isar.id_aa64zfr0;
> +        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
> +        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
> +        cpu->isar.id_aa64zfr0 = t;
> +
>          /* Replicate the same data to the 32-bit id registers.  */
>          u = cpu->isar.id_isar5;
>          u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
> @@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
>          u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SB, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
> +        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
>          cpu->isar.id_isar6 = u;
>
>          u = cpu->isar.id_pfr0;

Do we need to clear any of these in the "user set has_neon and/or
has_vfp to false" code in arm_cpu_realizefn() ?

thanks
-- PMM

