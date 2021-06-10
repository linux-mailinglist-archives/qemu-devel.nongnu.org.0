Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972273A2DAA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:03:50 +0200 (CEST)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLHh-0006pe-6D
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrLG5-0005Gq-9v
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:02:09 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrLG3-0005mc-5b
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:02:09 -0400
Received: by mail-ej1-x635.google.com with SMTP id ce15so44331145ejb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyjeXn5TiV+zxz7pjj2dvqQKHz3uoHaAU8gkJ6NjSnk=;
 b=AFjc7lZ1q1E6GI9VQHWhqoRQTG2hhwPsFJGdtMobi6zHP5Q5rzcm94y1EUaeUGZDU/
 sz2db7/nWssyUvOP17n+gYOJYGXX3lVuRcV0fTXLm2NppliCRYswYokcY9EXOdjb2hyP
 IuGUoXVTx4BdneE0xjG+ChCR7HRP6IVzf4IZ3XNqJkebifGhNJRGajmKkfwPKZPsQjab
 xWDW2Qfen75H4RvqjcIr6mbynyzV8ZWO719eLVyhGZwZHzfD5PZ9JeOQene9Ea27p0+u
 dHiNKSr6DjIGCG3W6Y3w8awf/e+zt/jAvMGwQ5NNUzwFS9RBp342fzewPL329aHHSA1P
 B//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyjeXn5TiV+zxz7pjj2dvqQKHz3uoHaAU8gkJ6NjSnk=;
 b=kl9Rklh9zfSTzVgdVQvYzOPj98WypZU9ixcqz7OHepuvqCynCQNVsf3Rfvyypo/IYr
 3T0/8hJ4u+NrfdIkacBrCvhtcPRGbytiRFGXdOgwkg1kvf0EHB9yXdwQA9cJ4GAaNCvq
 6Gdm95vBb8ronYTBbqQXl+h4FTjU80oW0f1gtrm6ZMa7ImAPnyUudlvFgMsP4ahx0fAh
 6ufa5jZaG2OMKPF6FqXBGc5tIE+QzZI/CXohByTIK0yP43poTBic6haWLC2Eob9bc/PN
 ZTJOePELCQoeEGXWf5qYapKcwiQrP7eTPwBD72Z83WH7aUAWFcrvL2ebI8InwYVnM1on
 KN5Q==
X-Gm-Message-State: AOAM5331F2ONZtyweUvU+4OiOzfytjvmufmtJFKYiApMtKC+JKSeQZ7j
 m3BzVqO5KE3c5WW+O4AjKKwIEB8lzuC8TACy0sX1Ew==
X-Google-Smtp-Source: ABdhPJyrh6wA8Bn4yLq0CKi/3Z9PtwutyXiZfLPw+5NASzCDol1KzXQNWsbyzFm+y26BL9I0oTd8kg/vdJG4q2virrQ=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr4685084ejb.482.1623333723332; 
 Thu, 10 Jun 2021 07:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
In-Reply-To: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 15:01:29 +0100
Message-ID: <CAFEAcA_7HQEwxeFcROrcGva5hYXswhp6ZVs6zXohpZ6pWmL=hQ@mail.gmail.com>
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 22:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > +#define DO_VLDR(OP, ESIZE, LDTYPE, TYPE, H)                             \
> > +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> > +    {                                                                   \
> > +        TYPE *d = vd;                                                   \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned b, e;                                                  \
>
> esize is redundant with sizeof(type); perhaps just make it a local variable?

That's OK here, but not for most of the other macros, where we need
ESIZE as a macro argument so we can do mask_to_bytemask##ESIZE.

-- PMM

