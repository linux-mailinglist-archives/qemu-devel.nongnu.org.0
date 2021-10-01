Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60341E619
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 04:49:16 +0200 (CEST)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW8br-0004st-5b
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 22:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mW8aG-0003eG-Mh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 22:47:36 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mW8aE-0000vU-Nt
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 22:47:36 -0400
Received: by mail-vs1-xe33.google.com with SMTP id i30so9676655vsj.13
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 19:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ha7ieIbhrMCVdX3tL+Cq0XoOjTTqdI8+ouzkL0jMKl0=;
 b=C0tvFuREekKa7InQMLa7Jv6QPSgIesuQQiKeNsQUnAH+Aasn+pwca+6My1+19vBz62
 1qVcAKnsUkYoLb1aPctJ5I2LnvSWACIjm5pvQjsxV6f1AF4Tq22qzKX/8GHW51OfaWxC
 5IzXQ+TI+2h5ey0XLxY3XsHyNCRkTLK8Gar4zdoqHUawSyJU1OhUOub2Y2bssfUDuUBN
 3HooGE48+QjBmH5IrBeDsRnzwWvdrHCZxtGab6mbXofOtAuWQhTSarCkWO/oTwI+//F4
 b8MJHHgCO14ECGgdNKFVDEF2uy1sIXZjM75GTdKOQnp8d/o6pCCoc1xsC7GfEslaJGiF
 JZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ha7ieIbhrMCVdX3tL+Cq0XoOjTTqdI8+ouzkL0jMKl0=;
 b=k/wmepJDFTqdsOVBw2Ut+OXsfAXB6nCF//NiUvuBOdcdIChtchmKl3d9eKS1719Nh8
 5cxq6ZVbHDxNDW5fZ2N1g4nkUnDpIh+JRQAm9lEksjm/W4L5PXk7NV5nveGPtEx9aEIJ
 5MbFszoz5pjcwqOOYr6vx6C/YQER4qSYpfxbBwNy9OFZfmkwstk2PZWfxGOU4cUagoOR
 M27d+cohcAg8BULRzm6tFgSD+yDr/MBb0+te14g/nlXOXg/KOrEXccQ1MDJP8MbYj2iO
 rCf2onluDpjmYTyrRlOJpauSSyjNH4sUlN5Ji9oJch90ZDcAdNcRqnQw+I+ZPnUBfw6P
 372A==
X-Gm-Message-State: AOAM531ByAdGy1zQIsj+ctw9dL0X2H1MN/Ldj5BfVvSQiX697L+YYSb2
 nlLB9u//I/7q2eEf7MOvQWI3Ku6x1WK2pmxtv0RDmJe20QC1CQ==
X-Google-Smtp-Source: ABdhPJw/6qPvfat9ASypqbunfr310uL4fsuHbHjPob2/AXqTe+q5noA1mDT/XM2Uce3e3sAXZ2X7jG03AQFZCRhcrVA=
X-Received: by 2002:a67:b304:: with SMTP id a4mr2304774vsm.49.1633056453468;
 Thu, 30 Sep 2021 19:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
 <87bl4a768t.fsf@linaro.org>
In-Reply-To: <87bl4a768t.fsf@linaro.org>
From: Matt <mborgerson@gmail.com>
Date: Thu, 30 Sep 2021 19:47:22 -0700
Message-ID: <CADc=-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.gmail.com>
Subject: Re: TCG Floating Point Support (Work in Progress)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=mborgerson@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you Alex, for your quick and thoughtful response.

> I've not reviewed the code as it is a rather large diff. For your proper
> submission could you please ensure that your patch series is broken up
> into discreet commits to aid review.

Of course.

> The phrase "if the user discovers some issues" is a bit of a red flag.
> We should always be striving for correct emulation of floating point.

I agree. This is an option that I added for use during feature
development. Ultimately I would like not to have such an option, and
for it to always *just work*.

> Indeed we have recently got the code base to the point we pass all of
> the Berkey softfloat test suite. This can be checked by running:
>
>   make check-softfloat
>
> However the test code links directly to the softfloat code so won't work
> with direct code execution.

I had planned to leverage the existing soft float test suite, and I
think this can be done with the right harnessing. It would be nice to
have a mechanism to test translation of individual TCG ops, e.g. be
able to run translated blocks from test code and evaluate their
output. I'm not sure if any such op level testing like that is being
done. There are also guest tests in tests/tcg, which could also be
expanded to include more FP tests.

> The existing 32/64 bit hardfloat
> optimisations work within the helpers. While generating direct code is
> appealing to avoid the cost of helper calls it's fairly well cached and
> predicted code. Experience with the initial hardfloat code showed the
> was still a performance win even with the cost of the helper call.

Unfortunately, even with the existing hardfloat support, the overhead
of the helper calls is still too costly for my particular application.

> I don't think you'll see the same behaviour emulating an x87 on anything
> that isn't an x87 because the boundaries for things like inexact
> calculation will be different. Indeed if you look at the existing
> hardfloat code function can_use_fpu() you will see we only call the host
> processor function if the inexact bit is already set. Other wrappers
> have even more checks for normal numbers. Anything that needs NaN
> handling will fallback to the correct softfloat code.

Fair points. Bit-perfect x87 emulation with this approach may be
ultimately unachievable; and I'm still evaluating the cases when this
will not work. This has been a learning experience for me, and I
gladly welcome expert input in this matter.

Personally, I would accept minor accuracy differences in trade for
significant performance advantage in emulation of game code, but not
for scientific applications, which I understand may diminish upstream
appeal of this x87 translation work.

> I think there will be a wariness to merge anything that only works for a
> single frontend/backend combination. Running translated x86 on x86 is
> not the common case for TCG ;-)

Understood; initially this works on a single frontend/backend
combination, with eventual translation to other guests and hosts. It
will be a long road, but my plan next is to produce a translation for
AArch64 systems.

> These are the things that make correct handling of floating point hard.

Agreed!

> I'll happily review patches on the list that provide for an accelerated
> FPU experience as long as the correctness is maintained.

Thank you!

Matt

On Thu, Sep 30, 2021 at 2:38 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Matt <mborgerson@gmail.com> writes:
>
> > Hello--
> >
> > I'm excited to share that I have been developing support for TCG
> > floating point operations; specifically, to accelerate emulation of
> > x86 guest code which heavily exercises the x87 FPU for a game console
> > emulator project based on QEMU. So far, this work has shown great
> > promise, demonstrating some dramatic performance improvements in
> > emulation of x87 heavy code.
>
> I've not reviewed the code as it is a rather large diff. For your proper
> submission could you please ensure that your patch series is broken up
> into discreet commits to aid review. It also aids bisection if
> regressions are identified.
>
> > The feature works in concert with unaccelerated x87 FPU helpers, and
> > also allows total soft float helper fallback if the user discovers
> > some issue with the hard float implementation.
>
> The phrase "if the user discovers some issues" is a bit of a red flag.
> We should always be striving for correct emulation of floating point.
> Indeed we have recently got the code base to the point we pass all of
> the Berkey softfloat test suite. This can be checked by running:
>
>   make check-softfloat
>
> However the test code links directly to the softfloat code so won't work
> with direct code execution. The existing 32/64 bit hardfloat
> optimisations work within the helpers. While generating direct code is
> appealing to avoid the cost of helper calls it's fairly well cached and
> predicted code. Experience with the initial hardfloat code showed the
> was still a performance win even with the cost of the helper call.
>
> > For the TCG target,
> > I've opted to implement it for x86-64 hosts using SSE2, although this
> > could be extended to support full 80b double extended precision with
> > host x87 support. I'm also in early development of an implementation
> > for AArch64 hosts.
>
> I don't think you'll see the same behaviour emulating an x87 on anything
> that isn't an x87 because the boundaries for things like inexact
> calculation will be different. Indeed if you look at the existing
> hardfloat code function can_use_fpu() you will see we only call the host
> processor function if the inexact bit is already set. Other wrappers
> have even more checks for normal numbers. Anything that needs NaN
> handling will fallback to the correct softfloat code.
>
> I think there will be a wariness to merge anything that only works for a
> single frontend/backend combination. Running translated x86 on x86 is
> not the common case for TCG ;-)
>
> > There are still some significant tasks to be done, like proper
> > handling of exception flags, edge cases, and testing, to name a few.
>
> These are the things that make correct handling of floating point hard.
>
> > Once in a slightly more mature state, I do think this feature would
> > make a natural addition to upstream QEMU and plan to submit it for
> > consideration.
> >
> > I'm writing to the mailing list now to inform FPU maintainers and any
> > other interested parties that this work is happening, to solicit any
> > early feedback, and to extend an invitation to anyone interested in
> > collaborating to expedite its upstreaming.
>
> I'll happily review patches on the list that provide for an accelerated
> FPU experience as long as the correctness is maintained.
>
> > My initial TCG FP work can be found here:
> > https://github.com/mborgerson/xemu/pull/464/commits
> >
> > Thanks,
> > Matt
>
>
> --
> Alex Benn=C3=A9e

