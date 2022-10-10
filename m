Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E95F9F4A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:20:06 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohshR-0003ZN-9h
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohseK-0001C2-HH
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:16:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohseH-0002Zi-As
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:16:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so13060170pjs.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lED7wXCFx4Hui3pum8s0vhphelI0KogCeA3QcupwxUY=;
 b=pNm8ON3CLlSIyaSqqVqMqAbNFUNsg98TH9l2WJdLvXNLwdave7VbXTjf8BibZJlMmz
 EUBjw8m7+J6EjnaXWsxq/i09UXnLxYqKH5ZbxVLEgrsfOeiAKE81TOSMlQvYjrmhJpNn
 CkR+I8ScPTv50WMX/5zQK7Oz8jQ1z4v1Q4VV/O++9GpzeJVvozgDf/JkDw0NJfuVFcDA
 SgpjAQc3vPhtqZJ3YXi9YcqZnfk3Y1j5/meh63YnF72b3jS3QouRY4jbmaqtQKcV3xLn
 2l6gvzmY7x/X5W8NTMkROTUJCP5PHAhtyin40QBO75EJxyHZ87lCScmpTa0cw2QWfpUK
 9O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lED7wXCFx4Hui3pum8s0vhphelI0KogCeA3QcupwxUY=;
 b=WZirtvjTWzcBt9D+akT05zi3yzdLjXqboorRabM1d8OrE0CjyqEDOxOFfycOQtqnXY
 8j/J9ln3oFvgtOmO35eJfVI7ax97YCflQA3ogUBl2d8VpPbTwb3mJakniioWYr+KLND+
 U5audHynJF3xpI3y91JhDBaaoiJIVvGlQ9KNAW5Ik5o4z7jR1P3zjwNO9rAzUAwQtP4+
 5tVMKe6GJxtrryxwuueUtIJ+rcnU/cYxvUs4MZZ3e3uDYc7m4Bsb2TIVWQ6fVY8J8sWq
 EUzBxxWyQWOn6BsNvWnkzW1tvr2ul5qV31UOkKmi7J9CwocnfcsW7R1PRHQafxy2OJPx
 lF+Q==
X-Gm-Message-State: ACrzQf2H8Bnx94ST5e/zLDFjaV9eY1sFZjYmZhVVhcyZcf75bpPS3De4
 j9QLTGBtqSPZkNFOSBzyRqZn8fAr3ic6PvCVPoLgEA==
X-Google-Smtp-Source: AMsMyM7KE8uPC907xOVnm4GwNWWH7vmy5QT9nThu5PH1Nrynztzg0oYPSVBoklmIXuLMm3xgK6K17BhPnqst94KBtQQ=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr30721926pjb.221.1665407807585; Mon, 10
 Oct 2022 06:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221003145641.1921467-1-jerome.forissier@linaro.org>
In-Reply-To: <20221003145641.1921467-1-jerome.forissier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 14:16:36 +0100
Message-ID: <CAFEAcA9bWzD5gKyHGOsz+8KCH1ykgU6sx2soDTVKiTHEa0D7KA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
To: Jerome Forissier <jerome.forissier@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 3 Oct 2022 at 15:57, Jerome Forissier
<jerome.forissier@linaro.org> wrote:
>
> According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
> SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
> is advertised. This has to be taken care of when QEMU boots directly
> into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").
>
> Cc: qemu-stable@nongnu.org
> Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
> Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321

Ooh, that detailed set of control bit requirements is new
since I last read that doc -- we should probably go through
and cross-check that we're setting them all correctly.

> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> ---
>  hw/arm/boot.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..ee3858b673 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
>                      if (cpu_isar_feature(aa64_sve, cpu)) {
>                          env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
>                      }
> +                    if (cpu_isar_feature(aa64_sme, cpu)) {
> +                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
> +                        env->cp15.scr_el3 |= SCR_ENTP2;
> +                    }

The doc also says that we (as fake EL3) should be setting
SMCR_EL3.LEN to the same value for all CPUs. Currently we do
do that, but it's always the reset value of 0. Richard: does
that have any odd effects (I have a feeling it clamps the
VL to the minimum supported value)? Should we be setting
SMCR_EL3.LEN to the max supported value here ?

thanks
-- PMM

