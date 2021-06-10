Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB273A2BD0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:42:31 +0200 (CEST)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrK10-0008Qx-AD
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrJzI-0006YM-4L
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:40:44 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrJzE-0002Ji-Ua
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:40:43 -0400
Received: by mail-ej1-x634.google.com with SMTP id ci15so43950438ejc.10
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qXMh0eWSot/C6iO763Pkxri62CDVNRHyAFSOO/335uE=;
 b=u+5WB4MxTgXUGPNbm2MjimJwQ7z63NmuL4TwFUsAdCe0G/Ousho6T4MZtzUjjUaWK6
 tA0zF2lrgANY6BiT6QCRaQiZLUYvNONulVwh+JPBKxYm65+EiFf61JVr4eebozF1MhpK
 g+ufC5oe/c54tiPraHwwvlqcS3LXlMDH5q1S1s2t0tKIoukw6s+6emywOPqOhQvt4qpx
 BR4PwSV3KGTc5fhT2HtoiqQFl44Z4eUKe8lxhwyaiJhBZ5E/UEQBOICiBL3vkpXmSiZM
 7W3vROGBOXcilkPNVta+pDWhhhvO2euZs9UkrkEwyfcm4MvrhqqnwZy7wXiza6D7YMBt
 magw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXMh0eWSot/C6iO763Pkxri62CDVNRHyAFSOO/335uE=;
 b=uMgV9JEk6fSCPgT5vkdMsXLn4fACsHogP4DiLilVwQ3uFFEelPCb3rBm+zZDvNHqap
 ZnCsOdF9FHx+/wBn5+sejyKsMRdTfhNTXkPiR1alisXBfWiycJjdlTcm9hc1lyxKygo4
 RPOqPIW+EeNd6RZuIjxP7JHGqo1q7BMFIyyPmX6ItHwnVc3RtWcVFTzB+1nykgwUBW1K
 dL3+Mymz9l4FDM8+2nZS7sKNxVcZ45lwVe1cZ37z4qfqUhlxpQdMpTADOpwvGv7hLsX0
 E+TKHAdhs5peKJQS74ZjSTM4JhWLyecToLB3SB97Ms5UVUWc1MTYVF7V9PWglv5ebkkj
 N2aQ==
X-Gm-Message-State: AOAM533A1gG0SzdrvjFskaKuH1myqkM/9OtDJste21GVAloqjlNmBEHJ
 fggYa8SWicIxdOFT+T2rqp/9MR6xhL1FSiU/rHhWAsSXr6Y=
X-Google-Smtp-Source: ABdhPJx8G0s21BSnpV6Az2+Zq+/uq1Go+aatpx6Hwn8JQHLAr+WRFxyM6zxTtyEWW0jDM9QoZUSncowaegwfqGfEwSI=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr4226656ejz.382.1623328836068; 
 Thu, 10 Jun 2021 05:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-14-peter.maydell@linaro.org>
 <b04dd492-0394-5b1a-5747-bb21d772e621@linaro.org>
In-Reply-To: <b04dd492-0394-5b1a-5747-bb21d772e621@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 13:40:02 +0100
Message-ID: <CAFEAcA9Sa=mCMGGkmTm2HseanfkKa1PtDYOUiofO-k4eM_fYoA@mail.gmail.com>
Subject: Re: [PATCH 13/55] target/arm: Implement MVE VCLZ
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 8 Jun 2021 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > Implement the MVE VCLZ insn (and the necessary machinery
> > for MVE 1-input vector ops).
> >
> > Note that for non-load instructions predication is always performed
> > at a byte level granularity regardless of element size (R_ZLSJ),
> > and so the masking logic here differs from that used in the VLDR
> > and VSTR helpers.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> > +
> > +/*
> > + * Take the bottom bits of mask (which is 1 bit per lane) and
> > + * convert to a mask which has 1s in each byte which is predicated.
> > + */
> > +static uint8_t mask_to_bytemask1(uint16_t mask)
> > +{
> > +    return (mask & 1) ? 0xff : 0;
> > +}
> > +
> > +static uint16_t mask_to_bytemask2(uint16_t mask)
> > +{
> > +    static const uint16_t masks[] = { 0x0000, 0x00ff, 0xff00, 0xffff };
> > +    return masks[mask & 3];
> > +}
> > +
> > +static uint32_t mask_to_bytemask4(uint16_t mask)
> > +{
> > +    static const uint32_t masks[] = {
> > +        0x00000000, 0x000000ff, 0x0000ff00, 0x0000ffff,
> > +        0x00ff0000, 0x00ff00ff, 0x00ffff00, 0x00ffffff,
> > +        0xff000000, 0xff0000ff, 0xff00ff00, 0xff00ffff,
> > +        0xffff0000, 0xffff00ff, 0xffffff00, 0xffffffff,
> > +    };
>
> I'll note that
>
> (1) the values for the mask_to_bytemask2 array overlap the first 4 values of
> the mask_to_bytemask4 array, and
>
> (2) both of these overlap with the larger
>
> static inline uint64_t expand_pred_b(uint8_t byte)
>
> from SVE.  It'd be nice to share the storage, whatever the actual functional
> interface into the array.

Yeah, I guess so. I didn't really feel like trying to
abstract that out...

> > +#define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
> > +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
> > +    {                                                                   \
> > +        TYPE *d = vd, *m = vm;                                          \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned e;                                                     \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> > +            TYPE r = FN(m[H(e)]);                                       \
> > +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
>
> Why uint64_t and not TYPE?  Or uint32_t?

A later patch adds the mask_to_bytemask8(), so I wanted
a type that was definitely unsigned (so TYPE isn't any good)
and which was definitely big enough for 64 bits.

> > +    if (!mve_eci_check(s)) {
> > +        return true;
> > +    }
> > +
> > +    if (!vfp_access_check(s)) {
> > +        return true;
> > +    }
>
> Not the first instance, but is it worth saving 4 lines per and combining these
> into one IF?

Yes, I think so.

-- PMM

