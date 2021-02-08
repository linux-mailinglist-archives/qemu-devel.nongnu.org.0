Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05931439B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:19:14 +0100 (CET)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FoH-0002Mx-TJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CF0-0000uB-61
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:30:35 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9CEw-0008SH-6n
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:30:33 -0500
Received: by mail-ej1-x631.google.com with SMTP id a9so27018628ejr.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+KiN+YWS6GPFboOEgJ4QNgUktLhFzDNo66siJxFzg80=;
 b=AvJZiUlqrXj3Zk1tYvwGNFrmuNgMawnCUVv6txXufxpjg7SKDVloEeu62ceWdSBfbA
 ppassWz/JHs7XUVdJChMaTPeSffDdihxxyF7LzDIhYYY9HSjGpsVFIbrfJp3s/QTUSe7
 XCwS87SnD2MnDvcrc8NikL0KNOm/M4jDXmjmOj/9uHULajDilMT1xJ1JfDgZO1hDwVLG
 lyGCjE6k95zipyCqJaEIuvfxAJYX3Wx21F/HDzjPv9uL1Ha3mQjs/N+TsKg9sJikT+5n
 nvtNO9fgxLRwmUSu04EM4SjYLcO1m7ka5rBIEyc1zp4vmCP/Lkzq+1D4zNKjwyjGRSgb
 8ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+KiN+YWS6GPFboOEgJ4QNgUktLhFzDNo66siJxFzg80=;
 b=uXG5IB7n8hn/htlQ/jD8douK3Qjha0O8fV1US0avaZIcWYGjgieUYtVrh38h/o04LM
 p5l6UWk7OeuqS2xB3gcZ6BnsnGSKINp/KZDDJPPclcPwdCUhM+0s5s65QkgfvDKnw8V+
 g1zE8fDYdkDeesuvWBwCkw0GP5TrrELmYJnBuBVDi8zGcwIkZH1ZmnPWT9LRjCJN7HLE
 Bb3Zc3ffaBYZ9PhQd5444E3OkirVCbuxyUhlvUoCuqgvOqsAGixcyVyKPWhQn1Z1T0AQ
 Up4IwIaKPHKQG7kV4B7vZ+P281hFgf5NvaFaotAvbke+gdgMGwDgu+Y1s+ZB+BA6yfuK
 tDPQ==
X-Gm-Message-State: AOAM531zGxnkDL9+KivcNr0AanNv+ucPwusEHHAF4t+JeKfNZVZfrXDQ
 XGJABkgO/FJ+8pgn5N4AGLybEavYhPoYWKwUtGyB8w==
X-Google-Smtp-Source: ABdhPJzSRFg+bAHMlu6AhMjqzs6TQoY61cx0Q+Qp8S4anABlY/Nz2w9tR3u1+tGHLUZxgzO8AA5geVSS9v/twFjzGjU=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr18601605eji.407.1612812628480; 
 Mon, 08 Feb 2021 11:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-3-richard.henderson@linaro.org>
 <CAFEAcA9bfj0X1Pb6_Em2hX7OkgmobFf=SGWQe=cXHaCO8n5jCQ@mail.gmail.com>
 <CAFEAcA9C+DG33fu-=zNN+6M9qc_bh6Lc=jx0ttNLg-tQWQtrxA@mail.gmail.com>
 <8f830dcb-2769-ca7d-460f-6095a5a47c1b@linaro.org>
In-Reply-To: <8f830dcb-2769-ca7d-460f-6095a5a47c1b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 19:30:17 +0000
Message-ID: <CAFEAcA_iQnEFPxkNfUDm5fYTp+bKQ3-UM2nDjMod5SwUu6X=Sg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] tcg/arm: Add host vector framework
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 18:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/8/21 10:28 AM, Peter Maydell wrote:
> > On Mon, 8 Feb 2021 at 17:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> The AAPCS says that q4-q7 are preserved across calls.
> >
> > Speaking of which, doesn't that mean we also need to
> > save and restore q4-q7 in tcg_target_qemu_prologue()
> > if we might be generating neon insns? (It doesn't look like
> > aarch64's prologue does this, which seems like a bug.)
>
> I just put them on the reserved list so that they don't get used.
>
> >     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_V8);
> ...
> >     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_V15);

I'm confused. That's not the reserved list, it's the call-clobber
list, and it's not putting the registers on the list, it's taking
them off it. (The code looks correct for setting up the clobber
list: we start with "everything is clobbered" and then remove
the callee-saves regs. But the AArch64 PCS says that only the
bottom 64-bits of v8-v15 are saved, so in fact I don't think we
can mark them as not-call-clobbers unless we're forcing the vector
code to only use 64-bits of vector registers.)

The only things on the reserved_regs list for aarch64 are integer
regs as far as I can see (sp, fp, x18, x30, v31).

-- PMM

