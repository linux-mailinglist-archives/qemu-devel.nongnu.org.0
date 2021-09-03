Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B134840035B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:32:55 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMC7a-0002dI-Nr
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMC6B-0001jg-Av
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:31:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMC64-0004vP-VF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:31:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3272305wmh.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+Xq4il5jd5b595/8MACDNSYxD9s2ZibEjBKSZDccig=;
 b=VwDqrLKZm9vN1OHFJKqhmUpzJSRY/6fl19I7CtRByOYdkdiXNR9oDjpwpz3y4VyBYZ
 d4lK66SbHHlf4iSd++GgLduL9aWe3CPhk6usvSKS1sY84hbqmrelIdqutF1c0X5LCKLn
 xG+D4B1jtynQ8Mvle9DkhJ2TvmxamU2N3sf2xtRPSi/Uq27V2KIIo7tvckO6RZJdtDs0
 XCq9+9VsRoEHkO4l0xjSk1Eho+ROw261NOKqqCT/vFX4jSbBykBfONxMfsTOtUf/A7el
 8dgvL50dFh2gHN+T47pWEE2nmgisFBFUzLDqdO8j4BZVRtoVnsmHtxH3cj1X1kG4yp3h
 +j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+Xq4il5jd5b595/8MACDNSYxD9s2ZibEjBKSZDccig=;
 b=aAYFrzJPG88Gu6flJulsojtkq4qoWzhqi1IaKulbvYUBcxX/n8GvWK27xAWTpimdXj
 2CsJ+Z/hAkeyI/XD5WNuRzoz+7XS5KrJP/K3H7QukH7l4BWHe/3DfkFumWm7I9Z/Qaf9
 llHxDWvk5JzH7qWOzgVZjnlgZTNjfE2q3x4COnijEO8s5g/R1FuZd5f/xklDj0oxYNgu
 j3XUymaV+8p1u8KDT0WVjo7rV/wnuzlFlfMqsbwHDhHFSXr8CBB9HV+Q5onsENz36yDh
 Jp+5WU229+8xRY/RvRjDs35pWcaYzzWLSpGnMg93ec8Sfwdwa3gY4vQp+y4A6WJ5KKFD
 hppw==
X-Gm-Message-State: AOAM530+dnfGIwAAD/Tn1PiTwkjNrAtyh+s2w/g0yKHqnPXdvbIKaRWM
 1spma6CMfoGoOmsxMH1uF6ndJvlnlq8rDXVic5SFLQ==
X-Google-Smtp-Source: ABdhPJyeWwmdf9NmlDh2fIC2euI6Q7BsgYzYYDvcxLk6BjumkWtai7EbZoL4Wx5OnYP540WhrICM9faqgK0lO7tLWK8=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr9175396wmj.37.1630686678633;
 Fri, 03 Sep 2021 09:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
In-Reply-To: <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 17:30:29 +0100
Message-ID: <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

On Fri, 3 Sept 2021 at 16:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/3/21 4:17 PM, Peter Maydell wrote:
> > I don't really understand what you mean here. What's the difference
> > between ending the TB now and translating a few more insns in
> > this TB before we end it?
>
>    VCMP (pred now on or off)
>    B    label
>
> The code we emit for B uses goto_tb.
>
> When goto_tb is unlinked (e.g. first execute), we exit with a code that causes the current
> cpu state to be evaluated, the new TB created, and the link filled in.  This makes
> permanent the cpu state we evaluated, and thus the state change across goto_tb must be
> constant.  This is fine for B, since only the PC changes and to a known destination.
>
> So we have two choices: end the TB immediately after the VCMP, or set another flag to
> cause gen_goto_tb to fall back to goto_ptr.

Ah, I see, and when we end after the VCMP then we use UPDATE_NOCHAIN
which causes us to use lookup_and_goto_ptr instead of goto_tb.

I was wondering if this is also a problem for the flags like s->v7m_lspact,
which we currently handle in about this way -- set from a TB flag, but
then updated for the rest of the TB. Let me try to write out the rules:

 * if you do something that changes the TB flag, and you know for
   definite the new state, and this change happens and is the same
   for every exit from the TB, then you can just update the flag
   and keep going in this TB. (This is why lspact etc are OK)
 * if you don't know for definite the new state, because it might
   not have happened, eg a helper function condition changes
   something, then you must end the TB immediately (in a way that
   doesn't use goto_tb). This is true both for "I couldn't figure
   out the new state, it's too hard" and "the new state depends on
   some runtime data such that different executions of the same TB
   might end up with different values for the flag"
 * it's not good enough to say "well, I can pessimistically always
   assume mve_no_pred", because of the goto_tb issue. You have to
   be sure of the exact value that a TB flags calculation after
   the insn will get.

So I think that pretty much everywhere in my current patch that is setting
s->mve_no_pred = false needs instead to just end the TB. That seems mostly
straightforward, but there are some tricky cases:

 * WLSTP. The code generated for this insn has two exits. The change
   to ltpsize happens on only one of those, which is currently
   handled by gen_jmp_tb(). I think we are OK to just leave the
   code as it is, because the value we pass to LTPSIZE is
   constant (encoded in the instruction), and so the new value
   of MVE_NO_PRED is always the same on that exit from the TB
   for all executions
 * gen_update_fp_context() -- this function gets called for pretty
   much every FP/MVE insn (as part of vfp_access_check), and it
   can in rare cases update the FPSCR.LTPSIZE and the VPR. I guess
   this means we really do need to end the TB
   if (MVE && s->v7m_new_fp_ctxt_needed) (ie the comment in
   gen_update_fp_context "We don't need to arrange to end the TB,
   because [we don't cache FPSCR in TB flags]" is no longer true).
   That seems likely to be painful because some of the insns that
   do a vfp_access_check do complicated things with the TB exits
   (eg WLSTP, LETP) that are going to override a naive setting of
   is_jmp in gen_update_fp_context()...
 * gen_preserve_fp_state() is similar to gen_update_fp_context()

thanks
-- PMM

