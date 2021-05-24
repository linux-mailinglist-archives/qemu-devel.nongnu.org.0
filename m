Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B206C38E74D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:21:20 +0200 (CEST)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAWF-0007EQ-QA
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llAUp-0006FJ-9n
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:19:52 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llAUg-0001GX-T0
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:19:51 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t3so31895852edc.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SjIBBKkuWPYasnQ6RB/6atdlHjoqSPx/ywigwWPUo0=;
 b=BnFPyMmV0f7MIkeVO64Px5EH14s11mcKTlterzPPLEKHHCWm0zFb7qxFH4Ek0s1oSy
 L/AqjFljIOrMQxw/2yTz/0vU/B63ej00o3U3u+5rRTZ6g4+RHiofXbd8hGRRN/Z9L804
 A9Y2Xgr1EpndS6nO/fJ8bPe1PabhNhKVyD9GfLiJdMAj1Om7eKiDtbTW/rNUaYRAuFdg
 KxzT1kWJFJlfxnETn7klmYvaSaSsI9km5jK5sKYeRS7NbT8Otl3+4ETD/xNS3bG0TNFP
 sr0LZLUD+X7kiY3VGLVLrQ/B7XvH+MVzkVq/k8XPv5UNsI8V64QX7XHm7XgVfBDmIEcU
 jHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SjIBBKkuWPYasnQ6RB/6atdlHjoqSPx/ywigwWPUo0=;
 b=ZBJubFBpcmOxDhMxxLQvdeIEOnJscJj6SzLCNQbbq2cAxM0826pyOhM22htwabcDoe
 CUfgO5TQ5JWE0Y7yfgQx/UAX1B2rBPI0sSSTKiWCCIsk3lCp6Bt/s1FRsk0zDWO5YRvk
 Dwxclm24xXyGH+y89dvO+h43qxeUPDmAcIibz6PqjiKvuO/yZp0bAlc8ngm31sghvhXO
 qq4rPMgL//ZQb1XbO2ABKTqMcJhgMt+EsEP8mNravn5O3nMNl0TbE63UnnpKum8BjQqJ
 s8Zh+sUAHMhgwPZAWCoUZbvGnfOkMD6DqgbdZfCaoxnCoQYgP+isovnQghNNaUtqugfY
 N11Q==
X-Gm-Message-State: AOAM533osjz7qVycCko0FXjnCc8P5MKkTsRGiHFg9vPTLCCGtJCuUDuw
 aOnMmXKUdj5UG0VqxjHBkv6eDhdQOJRoSVQhqz7ANQ==
X-Google-Smtp-Source: ABdhPJx/u739ygk4bssf3K9bZ29JMhwQkAykPuqyz3u5q6Oe/mg4yBFOJaRcHI+l0EWJx8Xz7enkyv3HLz4XHNDQuBA=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr25440324edu.52.1621862380715; 
 Mon, 24 May 2021 06:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210524084201.1665973-1-jamie@nuviainc.com>
 <CAFEAcA_AZGK6yKy6FN=YfVC=OMdpQnDBz=nndKaibDLRXk2aDw@mail.gmail.com>
 <YKudsW/Drzqcxnoa@hazel>
In-Reply-To: <YKudsW/Drzqcxnoa@hazel>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 14:19:17 +0100
Message-ID: <CAFEAcA8dPOvZpeZgRbq-W=y+tE_hqxkN_ZRiF9uSWHV=91EhoA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix missing exception class
To: Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 at 13:36, Jamie Iles <jamie@nuviainc.com> wrote:
> On Mon, May 24, 2021 at 10:41:58AM +0100, Peter Maydell wrote:
> > raise_exception() and raise_exception_ra() are supposed to have
> > the same semantics apart from one of them being passed a return
> > address. So perhaps we should look at trying to fix this by
> > making raise_exception_ra() not first carefully set and then
> > very opaquely unconditionally trash env->exception.syndrome...
>
> The simplest fix for this would be the patch below and that is
> consistent with the TLB fault handling code where we first restore state
> then raise the exception, is this the sort of thing you were thinking
> of?
>
> Thanks,
>
> Jamie
>
> diff --git i/target/arm/op_helper.c w/target/arm/op_helper.c
> index efcb60099277..0b85403cb9f4 100644
> --- i/target/arm/op_helper.c
> +++ w/target/arm/op_helper.c
> @@ -63,8 +63,11 @@ void raise_exception(CPUARMState *env, uint32_t excp,
>  void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
>                          uint32_t target_el, uintptr_t ra)
>  {
> -    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
> -    cpu_loop_exit_restore(cs, ra);
> +    CPUState *cs = env_cpu(env);
> +
> +    cpu_restore_state(cs, ra, true);
> +    do_raise_exception(env, excp, syndrome, target_el);
> +    cpu_loop_exit(cs);
>  }
>

Broadly speaking, yes. I think it could be done slightly more neatly by
making raise_exception_ra() be:

    CPUState *cs = env_cpu(env);
    /*
     * restore_state_to_opc() will set env->exception.syndrome, so
     * we must restore CPU state here before setting the syndrome
     * the caller passed us, and cannot use cpu_loop_exit_restore().
     */
    cpu_restore_state(cs, ra, true);
    raise_exception(env, excp, syndrome, target_el);

Then there are some follow-up cleanup patches:
 * fold do_raise_exception() into raise_exception(), since that
   is now its only caller
 * mte_check_fail() currently does cpu_restore_state() and then
   raise_exception() with a comment about this being to avoid
   restore_state_to_opc trashing the syndrome; it can now be
   rewritten to just call raise_exception_ra()
 * the v7m_msr helper in m_helper.c does a cpu_restore_state/
   raise_exception sequence than can be rewritten to just call
   raise_exception_ra()

thanks
-- PMM

