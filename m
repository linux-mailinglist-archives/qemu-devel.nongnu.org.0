Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878573CC696
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:15:18 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4saX-000516-Jz
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4sZG-00048b-Ae
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:13:54 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4sZE-000788-71
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:13:54 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h8so17828053eds.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIgarR9/qgxUq7R/uAEm5SVr7tfT2FDLaa/OH+bmkSc=;
 b=zfNo5j1GhwgNo9YDB2aj70kFswVc5IESMmnW0kM9jKLVGDqmRMCl7KM9XqVJbeh86q
 zm4hg6KSvoj5A4dnWDrkp+kLHSzUSPYvyC1QHDuDRgGWUwA1FHlA0+fnTR/6n8uLQ7Kz
 Y+ZNlMpviFVnPwxgUeEDRZ9EjL/yLjuh65n7uBqiZvNf33h4LIg0v1ZdVmqbuj+ZN9ZN
 4SDYWRaeKyVoMAihTgQYBCytYdALTlUxpoYlV4WhZjp9o72ftD/wejQjmHwkpbW5JFRv
 AZfWBRfuxhJz6cx2+kwrw1mu3tmgADcb/0LrqK+3K9FCln4bx+a8lOr2IarxXYf69kwZ
 4E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIgarR9/qgxUq7R/uAEm5SVr7tfT2FDLaa/OH+bmkSc=;
 b=JqIf1u9gYAVTiTzNkxTShZM5J9nDjQKW5ZZsbgrJpU+FgO/DrL8vYYPXH+jsWGoe42
 OqN7LoCsC0GPDTuBpU1LR45pvZaHS1LyteDyHtAaf59VS4wmTrwcuHjh4FQK+6Mhi4WW
 8lm5y5mKyzcIO3WYG3gSYqWzLkH349i9V1GoLVGonnlQbDGAlWuPKeNd5pIDCrCsoyHg
 BgZb7aBu3x2n3bhMnT/SO65lsIGGkIo4CpL0vO6QJo+xKNJDlwmjHylY6RHr08ksqNUl
 jUzgU2UJ1EfVCxbbCZP3irsOXStWFONp1mx6CwoP1b2KOZakVJdYIkExjeSlQDDzf51E
 i9Pg==
X-Gm-Message-State: AOAM5326vGxQOQkkL0blQ35YJ75s1eKa4xykKecX/u2e2rSvGKcUV37l
 UDHHo2eoJ6GYk1HsmGsgkcTSIo/u0atUOBoKHNEWew==
X-Google-Smtp-Source: ABdhPJyTGgweEnQ2t06rmMg8x56LmAwht2iSgBE/8KMf6LI3odfUQv35ndgSFoUp4b6DFW0MmEirfSQQLUJRhTCuo78=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr23950628eds.204.1626560030376; 
 Sat, 17 Jul 2021 15:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-22-peter.maydell@linaro.org>
 <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
In-Reply-To: <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 23:13:10 +0100
Message-ID: <CAFEAcA9DER=N8meJ_8oy6z3wN8n7Rot-ssmJ0dA-Z1Di-8Q4Rw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Sat, 17 Jul 2021 at 21:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > +#define DO_VABAV(OP, ESIZE, TYPE)                               \
> > +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
> > +                                    void *vm, uint32_t ra)      \
> > +    {                                                           \
> > +        uint16_t mask = mve_element_mask(env);                  \
> > +        unsigned e;                                             \
> > +        TYPE *m = vm, *n = vn;                                  \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> > +            if (mask & 1) {                                     \
> > +                int64_t n0 = n[H##ESIZE(e)];                    \
> > +                int64_t m0 = m[H##ESIZE(e)];                    \
> > +                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \
>
> Any particular reason you're not using TYPE for n0 and m0?

I wanted to definitely be doing the subtraction with a signed
type wider than the inputs, because that's the way the
pseudocode effectively deals with it, and I didn't feel like
thinking through whether using the smaller and possibly
unsigned types would DTRT :-)

-- PMM

