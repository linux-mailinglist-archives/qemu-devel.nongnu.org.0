Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA523A0FE1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:03:42 +0200 (CEST)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv3l-0003d6-2y
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqv29-0001Mf-NI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:02:02 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqv26-00052H-6Y
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:02:01 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g20so37599212ejt.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+UnsmS0MmBQceeJwfmEYcBjxgNeTuw/FQV8JQiYJcY=;
 b=pEyS091nlLoaUFjwwAF4D7NviO/UB1GXgeicPbc3oGrrc+9BTr6eQ67iaCDlhChkxs
 uQ3D5FGTwbl0W0etajCjEhd7mxNn8aoWz8fMPek7dmlazgXueJLhrTsVO1d+gVohPieL
 IPBpnV/+MItbRzFMqg9o1QB9SlpbLZwvjA00XqBwFtACguKH0ZT5wyYJSu5TUDiuBKup
 kVidfve8QaWXXpt6hRBZV/Rm8zUtUrW5Y9LJeylgCXAwjobTheS6a5zo16DRZlPs3A+7
 gVdjCrXAX7R94U5JFtyU/cLvHP4/jnGln/8u9Q2ViSjpBdNEuiVIK8zEQQAQK59o2jj5
 Eoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+UnsmS0MmBQceeJwfmEYcBjxgNeTuw/FQV8JQiYJcY=;
 b=Rv7+EU+SHbvjEMGK4CJau8URLJRjgggmKQ1oU2/YJzexqLQwJsPdhjixBsjpPqxYEe
 J76X+JRuFdXT8wJOwJlMNCjrji3hVd4AXvoXJYZNlFVlYRJhu5TfEnlbJ4r5/GIvECeP
 7JypjGJKhOugrKzuHTTiugfZtlyw14rPvVEMX3LfRyTjYshdSqtr1dhnYZUOcFFLBXak
 Vr3q1K2U05N5ZJPo1l8OckYj8opY4cmI+7uiVe9CmYxLt8xA1p3i643y27TBy4A0Oiau
 SNzEdtXLf9rINtQdoxnymv8d69zkfADNf3TUodV/ibQEXqL4xIHiIUbKIq2gCIsEHZO1
 gNmQ==
X-Gm-Message-State: AOAM53260PSUnmkrT5eGF605o30rgIHt+im56KJpWMzy0FhNMHOjbxqR
 C0mzxhFbJqsYigIXuxZInBaoCYkEHNpHf0Xg50TIEw==
X-Google-Smtp-Source: ABdhPJzBpbJjMy14tjHOKHjTihtlmDRUEI8JztcnOVxBY22SQ8AvPo37mZH60YEsxZXKPwjNR8edEWRZBZGGHjIdFH0=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr28478408ejk.250.1623232916419; 
 Wed, 09 Jun 2021 03:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
 <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
In-Reply-To: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jun 2021 11:01:22 +0100
Message-ID: <CAFEAcA_xEh2h8ZV4-mianY8wcz=TKdvdmFr+e4gikAUtW_THGQ@mail.gmail.com>
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
> > +static uint16_t mve_element_mask(CPUARMState *env)
> > +{
> > +    /*
> > +     * Return the mask of which elements in the MVE vector should be
> > +     * updated. This is a combination of multiple things:
> > +     *  (1) by default, we update every lane in the vector
> > +     *  (2) VPT predication stores its state in the VPR register;
> > +     *  (3) low-overhead-branch tail predication will mask out part
> > +     *      the vector on the final iteration of the loop
> > +     *  (4) if EPSR.ECI is set then we must execute only some beats
> > +     *      of the insn
> > +     * We combine all these into a 16-bit result with the same semantics
> > +     * as VPR.P0: 0 to mask the lane, 1 if it is active.
> > +     * 8-bit vector ops will look at all bits of the result;
> > +     * 16-bit ops will look at bits 0, 2, 4, ...;
> > +     * 32-bit ops will look at bits 0, 4, 8 and 12.
> > +     * Compare pseudocode GetCurInstrBeat(), though that only returns
> > +     * the 4-bit slice of the mask corresponding to a single beat.
> > +     */
> > +    uint16_t mask = extract32(env->v7m.vpr, R_V7M_VPR_P0_SHIFT,
> > +                              R_V7M_VPR_P0_LENGTH);
>
> Any reason you're not using FIELD_EX32 and and FIELD_DP32 so far in this file?

Just habit, really, I think.

> > +#define DO_VLDR(OP, ESIZE, LDTYPE, TYPE, H)                             \
> > +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> > +    {                                                                   \
> > +        TYPE *d = vd;                                                   \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned b, e;                                                  \
>
> esize is redundant with sizeof(type); perhaps just make it a local variable?
>
> > diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
> > index c54d5cb7305..e8bb2372ad9 100644
> > --- a/target/arm/translate-mve.c
> > +++ b/target/arm/translate-mve.c
> > @@ -1,6 +1,6 @@
> >   /*
> >    *  ARM translation: M-profile MVE instructions
> > -
> > + *
> >    *  Copyright (c) 2021 Linaro, Ltd.
>
> Is this just diff silliness?  I see that it has decided that helper-mve.h is a
> rename from translate-mve.c...

Not sure. I fixed at least one similar issue before sending, I guess
I missed this one.

> > +static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
> > +{
> > +    TCGv_i32 addr;
> > +    uint32_t offset;
> > +    TCGv_ptr qreg;
> > +
> > +    if (!dc_isar_feature(aa32_mve, s)) {
> > +        return false;
> > +    }
> > +
> > +    if (a->qd > 7 || !fn) {
> > +        return false;
> > +    }
>
> It's a funny old decode,
>
>    if D then UNDEFINED.
>    d = D:Qd,
>
> Is the spec forward looking to more than 7 Q registers?
> It's tempting to just drop the D:Qd from the decode...

I don't know, but looking at the decode it certainly seems
like the door is being left open to Q8..Q15. Other signs of
this include the existence of the VFPSmallRegisterBank()
function and the way that VLLDM and VLSTM have T2 encodings
whose only difference from the T1 encodings is that you can
specify registers up to D31. Decoding D:Qd and then doing the
range check seemed more in line with the spirit of this, though
of course leaving the D=1 UNDEF to decodetree works too.
(Some insns really do only use 3 bit register fields without
the extra D bit, so if we left all the fields 3 bit and later needed
to handle Q8..Q15 we'd have to go through everything to work out
which type of insn it was.)

> > +static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
> > +{
> > +    MVEGenLdStFn *ldfns[] = {
>
> static MVEGenLdStFn * const ldfns
>
> > +    MVEGenLdStFn *stfns[] = {
>
> Likewise, though...
>
> > +    return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);
>
> ... just put em together into a two-dimensional array, with a->l as the second
> index?

Yeah. (I was being a bit lazy because I can never remember which
way round the initializers go in a 2D array :-)

-- PMM

