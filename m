Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B152D19C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:38:06 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nreTb-0005IX-MP
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreRy-0003HA-7W
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:36:14 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:34537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreRw-0003Za-DM
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:36:13 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id o80so8565440ybg.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wITwYHXpB40U77MD2w2HBo2qi2Lnz9Ej7GevTKq/v2k=;
 b=Naiv2gj1V60id/LH0NJrQAV3pzK4Wzpe1VTTgP6iumQQndB7Fmnz81IU70t7//2vYH
 YwMMDLN4Y50cozwQc/SThuaLfAfrfGl67HSa/EE2QXjyrL63aIQbIFKbm5nzFWWK8IBL
 f9rolTaZpl2HMgfqBw7sWS9nwV1r8csKsnttzoXs8JeKK3XBVWt6bo5U21RMAqHbn7/D
 FvpOQ7ZlvYKZ2sU32VzCmorp08q4N8TAsa9ZAkpA/hko+NVbvkJC0zhMBRGcZkXgDOK1
 kMVhYdjl3yvJQO2g++Mo8CdXFnivPjJ471UIrxWN0cQ7WgW7psn3lG2JUGtpyUv+Ortq
 i9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wITwYHXpB40U77MD2w2HBo2qi2Lnz9Ej7GevTKq/v2k=;
 b=5USLYzekl7PhEScjsxje7Xj17KdiaIQIQHOpR1f97p186v90TST4PMjd7Kyam5Ysdm
 ZFUzaIsoGNf4ESAI2nYWJHCYyrvVF9NNq21/VXwZRuedugQfORP1yZBSWYWh6/LWWfrJ
 4kQYZoULfSgpmc51YmZiuvCfPB7nf+8X4Az6ksFHw3w4V4mA6J4E+48Z090Oadhd11tB
 EBdFM+HGOEKX4XPxiqQ8nREFfIS1yoIXDZBDdjUD/O7ULBwtoLUxYpdMTbYXg2+lXiXB
 jDWeGIO/6YkW5xPiiZeFGmOwYuUPcTUqT9z9+dFzkqn8Wr2Izy80q2fkWcm5ts2eDE+7
 Wj8g==
X-Gm-Message-State: AOAM531iwvpvASHmEiQ+EiyYprYivux72IUd8kSSO6YmtBrGbzLrqux/
 7rdUH4zg8VPvEOB2kODLpi2jf6qdNdKrszJfa5W98w==
X-Google-Smtp-Source: ABdhPJyTm8yo7jGc8Hj4229SRrDLK82nyzEry0v1oraxClewXQOm/t4OsyXaoncOYQ1/q6o9km/L2haZ4B2hwkC8n8o=
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr1457254ybt.288.1652960171292; Thu, 19
 May 2022 04:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-7-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 12:36:00 +0100
Message-ID: <CAFEAcA_oX3RRc4mLtBZc8SH9pjAM_cDQzqgzoqxH+8+Rct68mA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/arm: Remove fp checks from sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Tue, 17 May 2022 at 07:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of checking these bits in fp_exception_el and
> also in sve_exception_el, document that we must compare
> the results.  The only place where we have not already
> checked that FP EL is zero is in rebuild_hflags_a64.

aarch64_cpu_dump_state() calls sve_exception_el() and doesn't
check against the FP exception EL.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 52 ++++++++++++++-------------------------------
>  1 file changed, 16 insertions(+), 36 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index edeab4e473..05baa73986 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6136,10 +6136,12 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
>  };
>
> -/* Return the exception level to which exceptions should be taken
> - * via SVEAccessTrap.  If an exception should be routed through
> - * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
> - * take care of raising that exception.
> +/*
> + * Return the exception level to which exceptions should be taken
> + * via SVEAccessTrap.  This excludes the check for whether the exception
> + * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
> + * be found by testing 0 < fp_exception_el <= sve_exception_el.
> + *
>   * C.f. the ARM pseudocode function CheckSVEEnabled.

We should probably note that the pseudocode does *not* separate
out the FP trap checks, but has them all in the same function.

>   */

>          /*
> -         * If SVE is disabled, but FP is enabled,
> -         * then the effective len is 0.
> +         * If either FP or SVE are disabled, translator does not need len.
> +         * If SVE EL >= FP EL, FP exception has precedence, and translator
> +         * does not need SVE EL.  Save potential re-translations by forcing
> +         * the unneeded data to zero.
>           */

These comments say that if SVE EL == FP EL then the FP exception
has precedence, but looking at the pseudocode CheckNormalSVEEnabled()
it seems to be the other way around:  eg if CPACR_EL1 has
"disabled at EL0" for both the .ZEN bits and the .FPEN bits
then the SVEAccessTrap() is handled first.

thanks
-- PMM

