Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25762EF671
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:29:58 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvaH-0003eJ-Ou
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvTG-0005K0-RN
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:22:43 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvTB-0000sE-4Z
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:22:42 -0500
Received: by mail-ed1-x530.google.com with SMTP id g24so11904918edw.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HF4ple/5xnClgAKtApuD8Y+fJ7QJ8R+A0KPk+uOsra4=;
 b=pqQ2EwNLrRhDpu2CXcIejt1h6rOknYNW5m40LYBglp+UDHQTb08r1gV0CLIMFSHfv2
 8IwDDSCElbrp6NySHP82p6uTJjtSbl24WDNA7z3yitayTfpJa69bkdVlfqZhafdo5Lch
 z0DSqOmrtG1J3KIqU/p+w5KBan5PI2QK+pGHbWMA1fPnG4nAjufA7qDZa+2GbWULLALE
 ID7BJYKtEQ6YFBPbzy+Y+tIAumzLNlIwWFuj3FldF6ZlluM/LuSD8UqxxNChPqa3dDYA
 ZHjawLaCVKv6I99Ig/m+FPVMSKhxbZuLz3vp3SSqkOlUbHFKNN63T3xO0Oib4ZZa+Aey
 0oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HF4ple/5xnClgAKtApuD8Y+fJ7QJ8R+A0KPk+uOsra4=;
 b=WDbLQdw/rUPa58868CCVZ3oMgP8ls9d3u/XBfIcQ3GI+OBuYkctILLBEn9+6dHHvqV
 J2DluK1lMlmsPhdSZTJJo06ErBprPjvPPTQYcZ/3kyGDmLKCaViUiEhjVWeFHR17Mvw8
 N0GqsKkFI0bwtq3i7XNMtl+ygeGDaCcgtaSYoYqr2qg5YS4KvjTvpfKiZ+8yMGbczWiq
 oN6jI+Vu9EMOIeL3oPaoPJgNZXfkQCIQ8ZAlJoCQ40cOOaMgypUvzAZ/wlGIgZ40p5S+
 XGC6AILIuQ3UZH49wpBDAgb1dp+JMYv7lCbAsJa3rybDneFf7VlsQaELjTPBaAzoUx0R
 tnsg==
X-Gm-Message-State: AOAM530wJFJLQ1Dez+aZdGFIc6LzZT2FpOeHahiuZJfdoAZqjLSTeguP
 XQggw+vdi30Ebm9tOLWtWVxgb3/37zL51WI3QkP3aQ==
X-Google-Smtp-Source: ABdhPJyDldYlLTF/CLQLkdfkkYFoTRKyCCaQDlhe8ggAieXQT/H6BnX2kZh03oqudMncTR5DfADJPHyg+xUjF0XuAc0=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr5962574edq.36.1610126555306;
 Fri, 08 Jan 2021 09:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-25-richard.henderson@linaro.org>
 <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
 <6ff3c7b0-9254-2e36-89e0-e9eb59fd6e7f@linaro.org>
In-Reply-To: <6ff3c7b0-9254-2e36-89e0-e9eb59fd6e7f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 17:22:24 +0000
Message-ID: <CAFEAcA-50SFKWjppfzUOXiTyC_i458OnPuwv3bZQs4L1VE3O5w@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] target/arm: Enforce alignment for sve
 unpredicated LDR/STR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Thu, 7 Jan 2021 at 22:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/7/21 7:39 AM, Peter Maydell wrote:
> >> +        if (align > MO_ALIGN_8) {
> >> +            t0 = tcg_temp_new_i64();
> >> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
> >> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
> >> +            tcg_gen_addi_ptr(i, i, 8);
> >> +            tcg_gen_st_i64(t0, cpu_env, vofs);
> >> +            tcg_temp_free_i64(t0);
> >> +            align = 0;
> >> +        }
> >> +
> >
> > Why do we need to do this (and the similar thing in do_str()) ?
> > Most of the rest of the patch is fairly clear in that it is just
> > passing the alignment requirement through to the load/store fns,
> > but this is a bit more opaque to me...
>
> What follows this context is a single memory access within a tcg loop.
>
> When align is <= the size of the access, every access can use the same
> alignment mop.  But for MO_ALIGN_16, since we're emitting 8-byte accesses, the
> second access will not be 16-byte aligned.  So I peel off one loop iteration at
> the beginning to perform the alignment check.

OK. Could you add comments to that effect, please?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

