Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7734DCE3C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:57:04 +0100 (CET)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvJ1-0001wy-IS
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:57:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUuwh-0005EM-5p
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:33:59 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=43661
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUuwf-0007QV-Eu
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:33:58 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id v35so11785682ybi.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SA9kxODt9QCSdig0Z6wc7hUw9aME+bzBRdwa5OKgTUE=;
 b=XX+Qg2MEhBCyslKkufEr7Dis/zK8xhW2oxH+1nz1n6wBYXaVsCyal4TEG+uAewpWne
 GRlu33/o0fIFNDKf4VA1tOrKS0N3OaHMitXaNb/v5CmLXQ/UDMfQ5GVYgrPU5ymHeTg5
 loNv2ExPiHGdVnQodFYUzN/o5FjcN4DKF63q9O/Oft45+7E4qNgC7j48KS+U1ty0/7kK
 eYL9rlpGFOD/oY6aRp7n4M9Q9AUEkK/6SNfdfPFlvglydpXML64cacAdkoRJyb5CY9a6
 tUH2j0Gz4w+B5sxRJzDX+HQhcbhVdcH8zD7VmxPLsqtvpQwKdz/PKJDlCt4ee4a8MK+h
 m1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SA9kxODt9QCSdig0Z6wc7hUw9aME+bzBRdwa5OKgTUE=;
 b=dy2QGgXCWCn8zT9c1MDhbMci0LcWJtgDkMVz9jKxDZc24P2i9a7KB/Z1v4WJjQxU9b
 UBSslID681bMGI7olOwWv0k6MJbPjkjTnLto3gwqDkRoo3O7a3P/alrBq3mCj8lMo7gL
 wqi06aJ6Aqm16u/+t5EE2RYFiYm79t0E8WsUeAzZFnA5XgSiFWR+nOUKwZugO7hCi2ce
 4CT5VgAu8rfZkBDgn9P9CYfXqKZRRlLA4JoeB3ehzLpkg9hP62lCSFWpYFQqwsKcQIkO
 Dip6QohjvyXnSmE082+CsKUJwQ68G3x/NZYQ4snSTGHlvIKgUkeXs562IAfHC++5q3ZT
 KxkQ==
X-Gm-Message-State: AOAM531IXCRSjTutHbEcnfSkTLMsID2OGA93l5urlq7R2J4vbuntbjRD
 gtTn6tt3jLw6qi68MyCO7+FRgjl/3anq3wIiKpSAhw==
X-Google-Smtp-Source: ABdhPJwnaWE2f7JwSr/pyrF+zX8zr0PzhU5a3ZpaJBn5+63R2ZpwLpDUEtdj04KYBib/UKToJYSpmbAU8CZlgzvYHNU=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr6455057ybk.85.1647542036229; Thu, 17
 Mar 2022 11:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-42-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 18:33:44 +0000
Message-ID: <CAFEAcA9y-hOK4TjmbjM_=foLQgeJAgBwqWLKNG1o1ogNgqu4aQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 41/51] target/nios2: Introduce shadow register
 sets
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not actually enable them so far, but add all of the
> plumbing to address them.  Do not enable them for user-only.
>
> Add an env->regs pointer that handles the indirection to
> the current register set.  The naming of the pointer hides
> the difference between old and new, user-only and sysemu.
>
> From the notes on wrprs, which states that r0 must be initialized
> before use in shadow register sets, infer that R_ZERO is *not*
> hardwired to zero in shadow register sets.  Adjust load_gpr and
> dest_gpr to reflect this.  At the same time we might as well
> special case crs == 0 to avoid the indirection through env->regs
> during translation as well.  Given that this is intended to be
> the most common case for non-interrupt handlers.

>  static TCGv load_gpr(DisasContext *dc, unsigned reg)
>  {
>      assert(reg < NUM_GP_REGS);
> -    if (unlikely(reg == R_ZERO)) {
> -        return tcg_constant_tl(0);
> +    if (dc->crs0) {
> +        if (unlikely(reg == R_ZERO)) {
> +            return tcg_constant_tl(0);
> +        }
> +        return cpu_R[reg];
>      }
> -    return cpu_R[reg];
> +#ifdef CONFIG_USER_ONLY
> +    g_assert_not_reached();
> +#else
> +    return cpu_crs_R[reg];
> +#endif
>  }
>
>  static TCGv dest_gpr(DisasContext *dc, unsigned reg)
>  {
>      assert(reg < NUM_GP_REGS);
> -    if (unlikely(reg == R_ZERO)) {
> -        if (dc->sink == NULL) {
> -            dc->sink = tcg_temp_new();
> +    if (dc->crs0) {
> +        if (unlikely(reg == R_ZERO)) {
> +            if (dc->sink == NULL) {
> +                dc->sink = tcg_temp_new();
> +            }
> +            return dc->sink;
>          }
> -        return dc->sink;
> +        return cpu_R[reg];
>      }
> -    return cpu_R[reg];
> +#ifdef CONFIG_USER_ONLY
> +    g_assert_not_reached();
> +#else
> +    return cpu_crs_R[reg];
> +#endif
>  }

The behaviour of r0 in the shadow register sets is definitely
underspecified, but I really don't believe that r0 is a normal
writeable register for everything except the crs=0 set, which
is what you've implemented here. My best guess is:
 * registers are implemented as a pile of RAM, including r0
 * on reset the set-0 r0 is reset to 0, but nothing else is
   (this bit's actually in the spec)
 * writes to r0 are always discarded, except for the special
   case of wrprs

I'm tempted to suggest we should make our tbflags bit
"we know r0 is zero" -- the guest doesn't have many ways
to switch register set, basically I think just eret and taking
an external interrupt, and those either happen outside the
TB or are going to end the TB anyway. Can we make
cpu_get_tb_cpu_state() simply set the TB flag if
 env->shadow_regs[crs][0] == 0
or have I missed something that means that won't work?

(I actually wouldn't care to bet much money on wrprs being
unable to write to register-set-0 r0. It would be interesting
to test that on the real hardware.)

thanks
-- PMM

