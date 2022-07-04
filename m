Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF0564FD0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:36:04 +0200 (CEST)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HYp-0002LK-Ep
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8HWi-0001JC-S5
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:33:54 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8HWe-0004TX-4H
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:33:52 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-317a66d62dfso74988207b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sqBX9KnvPqZtB1YMDIS37EODqcPLiSRn7eh9oZpIje4=;
 b=eHgFFj0qCDpfuGlwOblodi9eY5rU+MtxTb2/hLnHiQ9dAFGHHEoHetiVs5LulshENZ
 +9uJ5Y4ekd3cJwZPEdz/zGkyFCxmDbomMqES8F6VT6I5EM8KXpBJwOMrjpAviRAwrwNL
 i0fH+cOOItyfzdi+dhC5SfLGwEGcThT8Vdl9kqrg+uBbGti/GtBJv1hmQpSb/zde+8qi
 ik3R9cJQQcb2KqcJpVN9e7IRhJknaF0OQ8L335IpuJjo/td0NJC8h/uplgJNWpfXo8zr
 o3ia19rY3manLHag4BwoHTo9dt8PoqPiCVcZQ2gEfF3GQMIwJA/UjSAI1hKNObxMl3g/
 D01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sqBX9KnvPqZtB1YMDIS37EODqcPLiSRn7eh9oZpIje4=;
 b=eqqVpqN2IY7fI40uZmwHFcC4EzXndx1b5qLgbmxPmkqcF+XyUMidDCELb8zn1nFBxI
 AV16p71xg7LEDHp9E9alIVvHyGp7aSK3XQer8nWujClYFOluxyK+fRfmMhbTU76tcW7q
 Lb26KuDG3m1gWp04uyi57hD/NDgCeaZvsmS5qFfA1lyiAL/uEjJyWCfaLzGYLptiOd98
 cJHxXw5zD5se4VURjGy0MbYnHBqLpmMSg0QYrDH438MIICCJu1skpTR4prc4bRFgMDrN
 +JBUwbTbot1wmwSWMwSDVjEhUnbWy1poRMQzp/ltlfxfZF0fI4al6Ne0uulVH/mRwQfm
 nP5w==
X-Gm-Message-State: AJIora/Oq/leBV6JGirg+wh1icxLWykEA6fGwyrOUcXBmBalVWSlG5iV
 NW8i+/sdkGMPmreq/6mOouYE371l2e/vflXw2sUXdQ==
X-Google-Smtp-Source: AGRyM1vZeK7y7cx+QoAZG94KYiemliS0U89DXwLmCtH2nxKb6L/sDS/JMrWAUggS/gtg99zW3t5uDE9fYgNg+eoTsR0=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr9890991ywc.64.1656923626843; Mon, 04
 Jul 2022 01:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-4-richard.henderson@linaro.org>
 <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
 <bea0892e-ab42-a61d-418e-37ea49cb5a25@linaro.org>
In-Reply-To: <bea0892e-ab42-a61d-418e-37ea49cb5a25@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 09:33:08 +0100
Message-ID: <CAFEAcA-eK2Hm8oY2eytDDkKfFrrBKZ=mys6XEcxJzNMPmdVfCw@mail.gmail.com>
Subject: Re: [PATCH v4 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 4 Jul 2022 at 09:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 16:36, Peter Maydell wrote:
> >> +    /*
> >> +     * The SME exception we are testing for is raised via
> >> +     * AArch64.CheckFPAdvSIMDEnabled(), and for AArch32 this is called
> >> +     * when EL1 is using A64 or EL2 using A64 and !TGE.
> >> +     * See AArch32.CheckAdvSIMDOrFPEnabled().
> >> +     */
> >> +    if (el == 0
> >> +        && FIELD_EX64(env->svcr, SVCR, SM)
> >> +        && (!arm_is_el2_enabled(env)
> >> +            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
> >> +        && arm_el_is_aa64(env, 1)
> >> +        && !sme_fa64(env, el)) {
> >
> > I can't get any of:
> >   * the logic in the comment
> >   * the logic in the C code
> >   * the logic in the the pseudocode AArch32.CheckAdvSIMDOrFPEnabled()
> >     which causes it to call AArch64.CheckFPEnabled()
> > to line up with each other.
> >
> > The comment has:
> >   * (EL1 A64) OR (EL2 A64 && !TGE)
> > The pseudocode has:
> >   * (!TGE && EL1 A64) OR (TGE && EL2 A64 && EL1 A64)
> >     [seems odd that it is checking the width of EL1 in the TGE case
> >      but I haven't followed the logic through to find out why]
> > The C code here has:
> >   * (!TGE && EL2 A64 && EL1 A64)
> >
> > What am I missing ?
>
> I'm looking at 0487H.a... are you looking at a different version?
> Because the pseudocode I see isn't what you list above:
>
> > if PSTATE.EL == EL0 && (!EL2Enabled() || (!ELUsingAArch32(EL2) && HCR_EL2.TGE == '0')) &&
>
> > !ELUsingAArch32(EL1) then
> So
>    (!EL2 || (EL2 A64 && !TGE)) && EL1 A64
>
> which is, as far as I can see, what the C code has.

Yeah, I misread the pseudocode (it only calls AArch64.CheckFPAdvSIMDEnabled
in the first branch of the if..elsif..., and it's there that the SME check
happens, not in AArch64.CheckFPEnabled(), which is called in both branches).

thanks
-- PMM

