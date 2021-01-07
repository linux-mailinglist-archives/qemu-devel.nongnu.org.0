Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AAD2ED3AD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:43:37 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXRm-0004GB-Uu
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXQW-0003IZ-U1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:42:16 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXQV-00084S-Aj
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:42:16 -0500
Received: by mail-ej1-x629.google.com with SMTP id d17so10248011ejy.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q1+BB7EAgsUKpRCVdjDUmj5z8BxSmmmAA8Vqd9CXW88=;
 b=Stv/xJyV/DbuHg5VjJUh8xPIgsTsIFKh9gcDtHpj63Nc19Z8N4Dj7GHmLZCNbgUf+z
 9Fu8ea3f256IRCx/dsricEqIWKd5jVxJYMtFhxgn7JJ18nTtqYu46gz6Ah6IBfhd019r
 /ImUuekYEAQrd/jTkFRrY+1JdFYpKkst6h4AUWpO8NvVse7zykdriuXdNND4iFa3RPVK
 7L19kBH1OLkFUEmC90+F0Yh8p4xc2lLiFWruXMnvPEJ8RKWNAXNKEBEU9nRTRmtNry0S
 Q7kJ/R2oKJCb7Bta3E/QVdCH5KehACRaB9c9FpIjPfdxPe7KaDSm86ATySWDubkZydDc
 T1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1+BB7EAgsUKpRCVdjDUmj5z8BxSmmmAA8Vqd9CXW88=;
 b=qECyHIuPpoLHr1pspcTtRbAWdadwBABDIhs4e07QIwkmwrHaQo+td2+gbYjQwgACYO
 ZTUlVAiojKXStktbLWQrdPWHh5QDxg9uBhiqNaqZc5dB5ywsiKTHLOX9hs3u0VyHPUso
 5JFynfupUr6ThU09+c+aC+4m60ECAQltmhlltgZa3fD5fx8LaW8o2VDP/RH8abI4N27e
 qFAeHZeB53EuFebnyuzFpNmn0qH/zSyEwFGeODAEA1obW99rAp8Mzz8lHnVInrrRgchH
 ee+9ohq4tGNXRGyG5flrkPAFgyVkb5krgtmivJNMItboWqZEcNcI2NlYqX73B4uuk186
 moWA==
X-Gm-Message-State: AOAM533zB07xIWT83LcwyGp3pJyDuSoASnUBqS1zsRmGtQmPFGEyhdxk
 FlTMDBsK8cIcMvXyxZOKjeDIsCceE9w5TmLnPWsDwA==
X-Google-Smtp-Source: ABdhPJyXjr7wp5N+iPTQnYX8QQTKLncbRliX5Ji6hyrv2qteFfXVrIPnO3kprqrFbFBoeeSgVSIF7vLDRd9NlPZEBYs=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr6495694ejb.382.1610034133227; 
 Thu, 07 Jan 2021 07:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-3-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 15:42:02 +0000
Message-ID: <CAFEAcA8C5hmyTWq1VYfLueaVbw99=D-AgW746eOuQAOMc_tk4A@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] target/arm: Add ALIGN_MEM to TBFLAG_ANY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this to signal when memory access alignment is required.
> This value comes from the CCR register for M-profile, and
> from the SCTLR register for A-profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       | 20 +++++++++++---------
>  target/arm/translate.h |  2 ++
>  target/arm/helper.c    | 19 +++++++++++++++++--
>  target/arm/translate.c |  7 +++----
>  4 files changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e5514c8286..e074055a94 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3220,15 +3220,15 @@ typedef ARMCPU ArchCPU;
>   * We put flags which are shared between 32 and 64 bit mode at the top
>   * of the word, and flags which apply to only one mode at the bottom.
>   *
> - *  31          20    18    14          9              0
> - * +--------------+-----+-----+----------+--------------+
> - * |              |     |   TBFLAG_A32   |              |
> - * |              |     +-----+----------+  TBFLAG_AM32 |
> - * |  TBFLAG_ANY  |           |TBFLAG_M32|              |
> - * |              +-----------+----------+--------------|
> - * |              |            TBFLAG_A64               |
> - * +--------------+-------------------------------------+
> - *  31          20                                     0
> + *  31          19  18    14          9              0
> + * +--------------+---+-----+----------+--------------+
> + * |              |   |   TBFLAG_A32   |              |
> + * |              |   +-----+----------+  TBFLAG_AM32 |
> + * |  TBFLAG_ANY  |         |TBFLAG_M32|              |
> + * |              +---------+----------+--------------|
> + * |              |          TBFLAG_A64               |
> + * +--------------+-----------------------------------+
> + *  31          19                                   0
>   *
>   * Unless otherwise noted, these bits are cached in env->hflags.
>   */
> @@ -3241,6 +3241,8 @@ FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
>  FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
>  /* For A-profile only, target EL for debug exceptions.  */
>  FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
> +/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
> +FIELD(TBFLAG_ANY, ALIGN_MEM, 19, 1)

This is trying to use the same bit as TBFLAG_A64 MTE0_ACTIVE...
We might have to finally start in on using bits in cs_base.

thanks
-- PMM

