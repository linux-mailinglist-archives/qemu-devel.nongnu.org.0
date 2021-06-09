Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36913A0FF7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:09:23 +0200 (CEST)
Received: from localhost ([::1]:58912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv9G-0008E5-VM
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqv7I-0004Ha-W0
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:07:21 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqv7G-0008Hg-So
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:07:20 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g20so37624105ejt.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m4hFsjgAk4urm+4Wy0wVBygQIbqY7pBCxjHXxbkeY6o=;
 b=TXN0TYzXloYN35pwl2jal+sYChfwm5GVfdOC+ipdKrYygncf5lelib2+gDWdnC1h7u
 sSxrIzzGb9H40tGgFbQ8UMJzvUad60LGOUE3hhkeaS6L8GLbYzeX/2rzDqvSygr+RFm/
 caV3JDrIxw5EwWSNztjM3jZj5XR24N3n4jhD2woPWSlafEGBUU21gtnU0vlEqeEOE2Y2
 1LjvAIETPnNf6wPIqlNLMay9NOuvFcRQpQgC9IEca7LSUR7x9CFBxhxJ93+wdVm3zkj3
 KCIt0Xwibj8GN5kzmFjXc80Su36++B4vuwrW8GFPAK8HXwlFHb3BEInG5RcDXOz5P6hn
 HxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m4hFsjgAk4urm+4Wy0wVBygQIbqY7pBCxjHXxbkeY6o=;
 b=Pw4w7mQK7B3CqrpWEb+nXdSIGZc0YhFPh4ppfMbEe4dR25hEO/TvJCLw3x0nmYPNkI
 9aysV4X2m6kquXlxp74c6hSQb2EJ5gLXj4/rmcpcnpHwuCXs4Sb0RY+7e1pEbBUfQ+gf
 TWQryUIB8WsFmAvKBi93y15Ispdf+XdV7UvDrf8TEjQqSHxn3G+uQpXh/OVaHxFKG1oO
 BsxBgnDXB2uywMuwDgBkf8mZgJeS50WYCw1Y8+aLS5/5ES9FOOVnIKiFFjsv9OCufgAE
 zkI23djlH2YmbsI1frzACPzUUHo+OuBau1Pg6kwJT2yHU3yJFC02RwoNQE9ROJFHI+VA
 i+2g==
X-Gm-Message-State: AOAM5330aU/4sn7ueJ663MU8GdqILfjwpdT3MgQ61J3XBDBuDHEyRnFN
 qKgIl1Q76kXGDmyLeOMvirNlkTZsx1/fHZpcdMpjYg==
X-Google-Smtp-Source: ABdhPJxXp40m05lXA4YwegwCesnNyJSVTvWDZIeFUoxW8Sw5FML3b31quFYqdj/BLbTiAXRc1m+nm72l0s7LCtc+5Wk=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr28318006ejb.56.1623233237110; 
 Wed, 09 Jun 2021 03:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-21-peter.maydell@linaro.org>
 <31d446dd-d17e-e036-7e66-fd7291827d9e@linaro.org>
In-Reply-To: <31d446dd-d17e-e036-7e66-fd7291827d9e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jun 2021 11:06:43 +0100
Message-ID: <CAFEAcA_bVkpO2pqqN8vKdt+U22gmkaSmmaWTP9KHwXQ-kOwz=Q@mail.gmail.com>
Subject: Re: [PATCH 20/55] target/arm: Implement MVE VDUP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Wed, 9 Jun 2021 at 00:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > +#define DO_VDUP(OP, ESIZE, TYPE, H)                                     \
> > +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t val)     \
> > +    {                                                                   \
> > +        TYPE *d = vd;                                                   \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned e;                                                     \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> > +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
> > +            d[H(e)] &= ~bytemask;                                       \
> > +            d[H(e)] |= (val & bytemask);                                \
> > +        }                                                               \
> > +        mve_advance_vpt(env);                                           \
> > +    }
> > +
> > +DO_VDUP(vdupb, 1, uint8_t, H1)
> > +DO_VDUP(vduph, 2, uint16_t, H2)
> > +DO_VDUP(vdupw, 4, uint32_t, H4)
>
> Hmm.  I think the masking should be done at either uint32_t or uint64_t.  Doing
> it byte-by-byte is wasteful.

Mmm. I think some of this structure is holdover from an initial
misinterpretation
of the spec that all these ops looked at the predicate bit for the LS byte
of the element to see if the entire element was acted upon, in which case
you do need to work element-by-element with the right size. (This is actually
true for some operations, but mostly the predicate bits do bytewise masking
and can give you a partial chunk of a result element, as here.)

-- PMM

