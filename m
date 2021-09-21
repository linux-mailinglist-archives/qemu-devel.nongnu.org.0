Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E974130CD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:39:27 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScFK-0007Mk-4K
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mScBQ-0005Jr-B1
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:35:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mScBJ-0005no-0H
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:35:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u15so37214417wru.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J1rw1d3wVW2Y313FMOFVR1mLyHjPTBeQuYGLZBr2gTc=;
 b=OQQudEcfsaooammxSSeMbuB0hA6jt6HQLgZKaGcB093pFV2hALra1M/SGJFtboViSs
 HrVQhX6I44rLT72FVsZxp65Xo3QgqhLmmuKLMVLmYJEs2YRh+CHWvvqMMNi5F0cFBN9q
 DkxLfneScTG+d8WgE8IaciVYlCEkAXEi+mnLTnbA8Wzoju8tOCuKhIrn07WQEKSxfn9O
 i0n1eb39nyGERiMdQJgXBIWWyy8e2myz7Sq3yN8RwIkw9/vy11TMWAEHZY3bGXFSXCdd
 9o7a/nlRSe0v2BMyTL3A+rqZOI7Tcb3iv8I18o0Kd6pOhjXEjOkKbJzliHJcFIzR4OI/
 Ov0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J1rw1d3wVW2Y313FMOFVR1mLyHjPTBeQuYGLZBr2gTc=;
 b=qglCInxMBDH3pFPueMzXs6yEryMyOMOd4Qgd8qjPfCTP/kDwXxCmnajEripfZ4HEPu
 u3Bdpt5vC9d4LJCg1XGePTs3jnWHSFGeJ91JTdAwOIZ2JBu/tccGMbQ8HfGOBV/DI8Ih
 Qed5reSp/mZou6X5aWSCd0mHsHiCSR8+Cr5HD1lTKaY7w/+DgaZeNkMmt/nfFzUF7nDd
 /+T8GMDHYmSz3PJDZi9jMOi1TeNi4xThZdisMDrbFhqiWEuexWHFQDvSZ/grKxHl0wQB
 zDwJNDEKd1PO0v94enNQW2DqcOJ7+NiQhPZFoDe3/+6aFtgPWQ8BiYoYTszBQKIx68cP
 wsdA==
X-Gm-Message-State: AOAM533PfME5EH1gCiS54XVIAiRN4QJZfQ/7VMVND0cICwcp/1o9AjFG
 obdgcfw4TXd5f2qWixB0fjXPuhUP5gRca8r/WsoPAw==
X-Google-Smtp-Source: ABdhPJzPNfI0N5I71mVlMaopkyNyk9ark//UfOq/uirVILR5wJuEeSjoQ8XR5fAO/LI0aMuN9qYEZ0XF8BS5UoaQg2g=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr3500454wmm.133.1632216913922; 
 Tue, 21 Sep 2021 02:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-2-f4bug@amsat.org>
In-Reply-To: <20210920214447.2998623-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 10:34:21 +0100
Message-ID: <CAFEAcA_UfuKjXamxH-Y-4rs2mu+JM=7p8tGc2QixzPzDqZxcWg@mail.gmail.com>
Subject: Re: [PATCH v5 01/31] target/arm: Implement arm_v7m_cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 22:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Implement SysemuCPUOps::has_work() handler for the ARM v7M CPU.
>
> See the comments added in commit 7ecdaa4a963 ("armv7m: Fix
> condition check for taking exceptions") which eventually
> forgot to implement this has_work() handler:

Huh? M-profile and A-profile share the same arm_cpu_has_work()
function. Some of the checks the code there does are perhaps
unnecessary for M-profile, but they're harmless.

>   * ARMv7-M interrupt masking works differently than -A or -R.
>   * There is no FIQ/IRQ distinction.
>
> The NVIC signal any pending interrupt by raising ARM_CPU_IRQ
> (see commit 56b7c66f498: "armv7m: QOMify the armv7m container")
> which ends setting the CPU_INTERRUPT_HARD bit in interrupt_request.
>
> Thus arm_v7m_cpu_has_work() implementation is thus quite trivial,
> we simply need to check for this bit.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael Davidsaver <mdavidsaver@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/cpu_tcg.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 0d5adccf1a7..da348938407 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -23,6 +23,11 @@
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>
>  #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
> +static bool arm_v7m_cpu_has_work(CPUState *cs)
> +{
> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
> +}

This seems to be missing at least the check on
cpu->power_state and the CPU_INTERRUPT_EXITTB test.

Is there any reason why we shouldn't just continue to
share the same function between A and M profile, and avoid
the extra function and the ifdefs ?

-- PMM

