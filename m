Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8E58245F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:32:12 +0200 (CEST)
Received: from localhost ([::1]:48224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGeKo-0001R0-Mw
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGeFp-0005jl-9h
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:27:01 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGeFn-0004S7-Ed
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:27:00 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i14so29544678yba.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAL4bqK3iHq2sAV+V0ZzAco7CFZjQpykl8LddoN2QRs=;
 b=J0YpAPXc1YI1mqKyT2X2tJ6XEUKsNak1we21Nxr4hOZVzuYEjqFLCElRVkFFaj+0Iy
 tucb6o0g7fpLASnA+EZb3Ui+XNGATfMefRAjhj575TS1gSY80pPj/+OrHnEom9yeXHjg
 xobhGNFz/6Y/J1OtCwye+J7VQiNHh/e4Zgm/Xe5YlIeVHMEFBlMEq59gBnrIDevvBHCd
 lBa66N2C3eq6lqBJwcQ4DtXJuFP/TSh2SPA1vzLcgYykYhzwegRtG49Aq3Y/2v2JxyZ2
 D3DSfsMSmyPLvQxxMsZVbzknjgJkCgE1MxpQcAudtD7Ft1fbhWK079Jj9BXW/i4vJlCJ
 xe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAL4bqK3iHq2sAV+V0ZzAco7CFZjQpykl8LddoN2QRs=;
 b=7k2hwHxhf7cG2JrHj7NFLmSh8FsoVgJ+Tr9rtuqq++ELC2OX4xUNKKaE5joBZdXvCI
 R5XwbOPWCn2JDkpEYNIz+1R0VczDChs9lIKxy9xySvq2mQAFZa1UjFEcKNamKnGdrPFV
 cVeedJrPBK4IJmSkIMXXIxez7RtS9eB4nuL6pY1pbnuYQ82MXNVq1IzwQIZyyND6H8oE
 21deEMwZs7/o6XFzyGJwqqa3EwnfL+TYk8ydI56kCk3xHzZP9NVMYshoRl6uATgXyqBo
 auppfmMpA25gAaWnoFj5Vj17KHRvRbD+OPkyjWnEYs8Xr/vhesAo5Me4zCihkEupvYaU
 G7MQ==
X-Gm-Message-State: AJIora84NkSWK4cFmfm1r3qvkctsGsVbI6JHlTiZrXe06UfcR8h2o99D
 HGMH71isUEogfX/vOMRHZvO8CbyA7vWoSjDY5K/3QQ==
X-Google-Smtp-Source: AGRyM1sIfwidSUteAXKVgUcYZNE0f/U+nnp9rdUFlTT8Vf7uOSszjBQLRBexgqouPtrgsXGjWea1stRexiYHexiXsLQ=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr7402265ybn.479.1658917615459; Wed, 27
 Jul 2022 03:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
 <20220726163206.1780707-3-peter.maydell@linaro.org>
 <219fb09f-c46a-4dda-9ab7-ebb0772c17f5@linaro.org>
In-Reply-To: <219fb09f-c46a-4dda-9ab7-ebb0772c17f5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2022 11:26:15 +0100
Message-ID: <CAFEAcA8GF8MLrp+9yqmPYJCfkVdUtc+-A7J+zn-gfvb06v-+Yw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pci: Sanity check mask argument to pci_set_*_by_mask()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 26 Jul 2022 at 23:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/26/22 09:32, Peter Maydell wrote:
> > Coverity complains that in functions like pci_set_word_by_mask()
> > we might end up shifting by more than 31 bits. This is true,
> > but only if the caller passes in a zero mask. Help Coverity out
> > by asserting that the mask argument is valid.
> >
> > Fixes: CID 1487168
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Note that only 1 of these 4 functions is used, and that only
> > in 2 places in the codebase. In both cases the mask argument
> > is a compile-time constant.
> > ---
> >   include/hw/pci/pci.h | 20 ++++++++++++++++----
> >   1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index c79144bc5ef..0392b947b8b 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -688,7 +688,10 @@ static inline void
> >   pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
> >   {
> >       uint8_t val = pci_get_byte(config);
> > -    uint8_t rval = reg << ctz32(mask);
> > +    uint8_t rval;
> > +
> > +    assert(mask & 0xff);
>
> Why the and, especially considering the uint8_t type?

Oops, yes. I think I was mixing up prototypes and thought the
mask was passed as a 32-bit value in both these functions.

-- PMM

