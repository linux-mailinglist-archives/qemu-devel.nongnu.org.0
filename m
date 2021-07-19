Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBFE3CD693
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:27:23 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UEr-0002rn-TK
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5UDT-0001Tx-Qc
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:25:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5UDS-00076k-74
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:25:55 -0400
Received: by mail-ej1-x62c.google.com with SMTP id hd33so28985422ejc.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5pblmW0vmpsRvzxMBMyFDJE3s8IMFE9um6csAuFF9lg=;
 b=a2oQiUALlbmErbg+95/vy924OcsiiLEGrbYKEyr6kHelP3Stv+yHsGtsRd7P9m9mKi
 7fmhiQRUVaamhBlwvbyVE9BJeWc/WosVRlyhXMHz26NViy7tx2nO6oRbovKSAmEk8aBE
 4Q6XcdexsSMp+ZKOtUuZQIzvjyu02QKgTgttDHMRlV+fi3wHwdveblFZ9ljBwQ3szKxt
 wSJvS+HP84NjIXvJJlwZuKVlFUFyolqnVbemQkrSt5nl3O5nnn5dyJSZRikPYzk9nDMC
 I4t7MXCzLGQFLY6s4Ht0cT++ZwcB+xih0+k6FPjrzd3by/1oO38MLV3OAD9KvXJEPqzy
 cWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5pblmW0vmpsRvzxMBMyFDJE3s8IMFE9um6csAuFF9lg=;
 b=YUePXP/o9zKw9xe+wiG7BI/ZLpCkfe/cE/Ijj3us5BKTcbvoOOU54eOKq98DgfkmB/
 mgB3/t6QPJmjbZURid0yNMT7LXy+JfnnOLcMvBJ8JBRGJUiIgsnPvlhnseOngvUbBXVV
 rPP1qg4vq1Xhn+UhgVeTvDjDI/KWeGYQydD/+xAUriPWLOOBBnZUdGUJmrxCgHY40rXt
 8Ki+Km9fcXrBWs1LJw2dl0GzqzGosnDxpZB6HNVcjxiJqRCO4ws0og53ecZRs4/pF/fz
 nZflRqPXXclA0VwqES7wfU9xomCFclNC8KsFoQ03uYSQu3lNFFBpTLBehkFso3TumHfJ
 yOww==
X-Gm-Message-State: AOAM531TlnDbm+Fmz8nEG8r6gh5ATAKnzwu1zCkIwICn5ATiL5bGQRm9
 AuMs9rqqZGFYY9nlKgXuVM9Sz8FLQMFFrQrtKV4UmQ==
X-Google-Smtp-Source: ABdhPJwvuAJ5Ib7WF9Is3B7XxSQtDjqD3Kl2xVW8nn1ut4+tv8EFsj/aUDjOiBJam2GHXKboHkbVtqYlTW2rGmGwbvI=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr28042303ejd.250.1626704752189; 
 Mon, 19 Jul 2021 07:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-13-peter.maydell@linaro.org>
 <170925ed-040a-d117-9e16-fbee7604f820@linaro.org>
In-Reply-To: <170925ed-040a-d117-9e16-fbee7604f820@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 15:25:11 +0100
Message-ID: <CAFEAcA-mmARsqCBcc3KuAXgDyxvUBmg-YrpF12UX1DBS13EJVw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 12/34] target/arm: Implement MVE
 incrementing/decrementing dup insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Fri, 16 Jul 2021 at 20:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > +#define DO_VIDUP(OP, ESIZE, TYPE, FN)                           \
> > +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> > +                           uint32_t offset, uint32_t imm)       \
> > +    {                                                           \
> > +        TYPE *d = vd;                                           \
> > +        uint16_t mask = mve_element_mask(env);                  \
> > +        unsigned e;                                             \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> > +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> > +            offset = FN(offset, imm);                           \
> > +        }                                                       \
> > +        mve_advance_vpt(env);                                   \
> > +        return offset;                                          \
> > +    }
> > +
> > +#define DO_VIWDUP(OP, ESIZE, TYPE, FN)                          \
> > +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> > +                              uint32_t offset, uint32_t wrap,   \
> > +                              uint32_t imm)                     \
> > +    {                                                           \
> > +        TYPE *d = vd;                                           \
> > +        uint16_t mask = mve_element_mask(env);                  \
> > +        unsigned e;                                             \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> > +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> > +            offset = FN(offset, wrap, imm);                     \
> > +        }                                                       \
> > +        mve_advance_vpt(env);                                   \
> > +        return offset;                                          \
> > +    }
> > +
> > +#define DO_VIDUP_ALL(OP, FN)                    \
> > +    DO_VIDUP(OP##b, 1, int8_t, FN)              \
> > +    DO_VIDUP(OP##h, 2, int16_t, FN)             \
> > +    DO_VIDUP(OP##w, 4, int32_t, FN)
> > +
> > +#define DO_VIWDUP_ALL(OP, FN)                   \
> > +    DO_VIWDUP(OP##b, 1, int8_t, FN)             \
> > +    DO_VIWDUP(OP##h, 2, int16_t, FN)            \
> > +    DO_VIWDUP(OP##w, 4, int32_t, FN)
>
> Would it be useful to merge VIDUP and VIWDUP by passing wrap == 0?
> Or merging VIDUP and VDDUP by negating imm?

I think keeping the wrap-versions separate is clearer, but yes,
we might as well do the negate in the caller for VDDUP.
(VIWDUP and VDWDUP have different enough wrapping behaviour
that I'd prefer to not combine those).

thanks
-- PMM

