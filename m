Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7055F9C4F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:57:35 +0200 (CEST)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpXQ-00064b-SA
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohpQP-0006sH-G7
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:50:20 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohpQ6-0006ru-4m
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:50:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so9893481pjl.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7wBnx/7XbkbpPPCqzJhWRiTMgNMS8W7VPenjjRkIyS8=;
 b=G0e6i19b4OtBthaxMyrG3R/1DR89Y7ANCQSShBY3+IwC0gr6Vm42AhYJ7wZIolQV6U
 buwAPO1d/B6Z0o5uj5x4GM3z2sY1cD28jJJycJrHM8ukXeHRAS2MxTb2tJEUxvsj4huJ
 WHu/iK0unWGMym48r4+kbfQw0IKZhJHI/Mwr1aQvWva6IJqdcJMlQtpMQg6K7QLNEMMv
 NdSmDRPvufwiAlL6ETeOcBs55DvwaOhpTAxsVoEazzYJq0ZFSMMJwrRktDZi0wqLh8Mf
 ao+Arn8aUnM6y6GfPDVuSAXWOqsB7u9sEK9CgaHxRXfZy0Y88++LbVezyn2W7NtPbrul
 j8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7wBnx/7XbkbpPPCqzJhWRiTMgNMS8W7VPenjjRkIyS8=;
 b=Re3PYSWWNAUohutg561cKr9Ww2qbWgk9DQODsadVfMwrq07qP7m4yLbwCGyNgjLZv9
 QzNgi9rhjZWvVPAPPM2ejsg3cNa1pfBeLuybHmtiY/SPmzPa/79t7htHVyaJza+3HSwV
 uVVpNvNkuQUFNf0h0qcm94DbUvZDYO798unnuh5Z519BjTFhCdS5Ju3USGI77SYqkJr9
 Pnfc2yKoDYulcBpszL3KxRAFV5hwJTRTNXUAyurhmSBk9A5Jq55szTgOIi5hQ8/w1xxD
 t6e79KCP/9uy76/q1naXLWQIfTQ71ibwuLSudFarrbfShDnriOHCCOaUE4lVdW50KEgW
 xJuQ==
X-Gm-Message-State: ACrzQf1HUywRuaNjK5x1NBzp/GESQnSYMDqjlaXEd8sCD+vF408gIHng
 VuSJNxVNj2o0XVRSyj8PpH2VA1nvsTwC5E9E2Gwpfw==
X-Google-Smtp-Source: AMsMyM55FjjBuWMvJIlx1tQrnQfsVImzGe9UVTkREPeZtX1Fwif3wpgMVcGDODHl+BPu8HIxo+aAMN+iTNePX8lXckA=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr16208734pjb.215.1665395396138; Mon, 10
 Oct 2022 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221008153646.1504760-1-richard.henderson@linaro.org>
In-Reply-To: <20221008153646.1504760-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 10:49:43 +0100
Message-ID: <CAFEAcA9WHx6KJF3yeiBvr-f0noco8OfR3zgdDKpTpYSaodzsvA@mail.gmail.com>
Subject: Re: [PATCH] include/qemu/atomic128: Support 16-byte atomic read/write
 for Intel AVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 8 Oct 2022 at 16:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Intel has now given guarantees about the atomicity of SSE read
> and write instructions on cpus supporting AVX.  We can use these
> instead of the much slower cmpxchg16b.
>
> Derived from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +    /*
> +     * The xgetbv instruction is not available to older versions of
> +     * the assembler, so we encode the instruction manually.
> +     */
> +    asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (0));

This would make the third place in the tree where we hand-code
this asm instruction (we already do it in the xgetbv() function
in target/i386/hvf/x86_cpuid.c and opencoded in tcg_target_init()):
can we abstract this out somehow, please?

(There is also a just-written-out "xgetbv" in init_cpuid_cache(),
but that one's guarded by ifdefs so presumably OK.)

thanks
-- PMM

