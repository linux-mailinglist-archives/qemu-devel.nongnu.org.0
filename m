Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D7741F94F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 04:09:16 +0200 (CEST)
Received: from localhost ([::1]:60706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWUSh-0004sS-0s
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 22:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mWUR9-0003x7-Fd
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 22:07:39 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:42616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mWUR7-0000Bf-1q
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 22:07:39 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id p9so7979375vst.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 19:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tW0bdwO0AHvFSP42xkF15KPQ/RygPlJOHAHT/glO1ws=;
 b=QxsuJZePuvGsUNJ16QDvwtdTEIs1UrRvXWn2jpZDb23PKM2HE9eFnTdd+nNNZUlGGh
 qB/QN2KB7dPIQjekxlGqf3SsMn/RyI2T3WKG4hgqoXSG8h0wX5bBU4eACANz//AYNO6t
 NF73AM3NLBqXLqiTqvIlp0gTkvuMtI9fXlRBVDL+HuC5oHJEuZC+OhuOVXmQvvC8b23y
 hH05BPs5nF+bzJHg3ok2CnVf2+bZrm251tgkuLbanAJP3SD2A8wK9RQdCaVA01EXo2Qs
 dLVFhldY+EEapkVLasGhtwzT/uxVIJHXZ2lFoO8PfcOs1rmpI6xqs1NC2qsivhm499Pw
 ylgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tW0bdwO0AHvFSP42xkF15KPQ/RygPlJOHAHT/glO1ws=;
 b=KQKGGlhIBtYgxCfSgwcl8W8hSKUMstoLj0VJXNhaeQlEeZl+zNGZpkn/JlKhwWNBg2
 K8/X3BwgDLxMOU3trSfOZQ6BbM+nrH5ItEC0I7V4hfPzWr+ukdGY8UeFreeSXViS+Lbc
 47cDypvHBPx/pgEkWoA5sEsdNfSpK0MoL6hgm7Oa1/j2RA6us0lJIujgbT+BCFT5VtKw
 kr9l5ZpMlxBl4AnsSzsWH3qhSFaF0ApIAgSTdcOofV2mdrq4hugaY3g21VL6RzAPmdZ1
 5upffa8DR0Add1V5lfil9+0CLK6Rx59ZprAZ5JVjA3Ei1cXl1fzvVG06ALsGii7wVMMj
 gH5w==
X-Gm-Message-State: AOAM5329Uq5tUlIdcemq1jXli8affuaAbrIDf355Q8KqU+UVNEQJmmy/
 5Yd7zQbjHRTAVcLo0hRy6nCAK6JNOJSO8ZPCObQ+9g/q8gw=
X-Google-Smtp-Source: ABdhPJw3k3O0Q+SN5NhUPbsg4PT0FPG3mAHx76vAInBrEfyoLQIE39spjCxKiVnbBZyAiLqXFVQl1a0k4/GC42OPY04=
X-Received: by 2002:a67:b304:: with SMTP id a4mr7124496vsm.49.1633140455145;
 Fri, 01 Oct 2021 19:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
 <87bl4a768t.fsf@linaro.org>
 <CADc=-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.gmail.com>
 <87y27d5ezt.fsf@linaro.org>
In-Reply-To: <87y27d5ezt.fsf@linaro.org>
From: Matt <mborgerson@gmail.com>
Date: Fri, 1 Oct 2021 19:07:23 -0700
Message-ID: <CADc=-s4SAibNMeN9imMz9bOrNugdmuOAmKRgUWt1x12SQivEHQ@mail.gmail.com>
Subject: Re: TCG Floating Point Support (Work in Progress)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=mborgerson@gmail.com; helo=mail-vs1-xe2e.google.com
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

> Not at the moment but it would certainly be a useful addition for the
> unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
> how much test harness would be needed to exercise that though.

On a related note, in addition to testing TCG->Host translation, it
would be nice to also have a way to make sure TCG->TCG optimization
passes are working as expected. Is there existing work in this area?


> We have a number of multiarch tcg tests for fused multiply-add and the
> various fconv operations. There is also quite an exhaustive set of i386
> specific tests (test-i386-fprem) but it doesn't get run by default as
> the "reference" output is too big to include in the tree and has to be
> generated in-situ. You get it by adding SPEED=3Dslow to your make
> invocation. [...]
> You can run tests/fp/fp-bench -t host under translation to exercise that.

Thanks for the info! This will be useful.


> I know the classic Doom and Quake benchmarks showed a performance
> regression when we switched to softfloat:
>
>   https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b

That post was an interesting read, thanks for sharing!


> Out of interest what game code still uses x87? [...]
> however I kinda assumed more modern games would be taking advantaged of
> SSE and later features. There is however some missing gaps in the x86
> emulation that might mean code falls back to the x87. Maybe that would
> be another area to look at.

This project is an emulator of the original Xbox game console, which
is now...twenty years old (time flies). The Xbox CPU (P3) does feature
SSE (not SSE2+), however most of the games I've tested for this
generation still make heavy use of x87.

I have seen at least one game make noticeable use of MMX/SSE features
though, which I also need to look at accelerating. Profiler indicates
they are also very costly. I have seen the TCG vector ops, which are a
very cool addition.

Matt


On Fri, Oct 1, 2021 at 1:24 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Matt <mborgerson@gmail.com> writes:
>
> > Thank you Alex, for your quick and thoughtful response.
> >
> >> I've not reviewed the code as it is a rather large diff. For your prop=
er
> >> submission could you please ensure that your patch series is broken up
> >> into discreet commits to aid review.
> >
> > Of course.
> >
> >> The phrase "if the user discovers some issues" is a bit of a red flag.
> >> We should always be striving for correct emulation of floating point.
> >
> > I agree. This is an option that I added for use during feature
> > development. Ultimately I would like not to have such an option, and
> > for it to always *just work*.
>
> The closest I can think of is the --accel thread=3Dsingle|multi option
> which allowed for verifying if an issue was related to MTTCG. However
> the default would always do the right thing.
>
> >
> >> Indeed we have recently got the code base to the point we pass all of
> >> the Berkey softfloat test suite. This can be checked by running:
> >>
> >>   make check-softfloat
> >>
> >> However the test code links directly to the softfloat code so won't wo=
rk
> >> with direct code execution.
> >
> > I had planned to leverage the existing soft float test suite, and I
> > think this can be done with the right harnessing. It would be nice to
> > have a mechanism to test translation of individual TCG ops, e.g. be
> > able to run translated blocks from test code and evaluate their
> > output. I'm not sure if any such op level testing like that is being
> > done.
>
> Not at the moment but it would certainly be a useful addition for the
> unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
> how much test harness would be needed to exercise that though.
>
> > There are also guest tests in tests/tcg, which could also be
> > expanded to include more FP tests.
>
> We have a number of multiarch tcg tests for fused multiply-add and the
> various fconv operations. There is also quite an exhaustive set of i386
> specific tests (test-i386-fprem) but it doesn't get run by default as
> the "reference" output is too big to include in the tree and has to be
> generated in-situ. You get it by adding SPEED=3Dslow to your make
> invocation.
>
> >> The existing 32/64 bit hardfloat
> >> optimisations work within the helpers. While generating direct code is
> >> appealing to avoid the cost of helper calls it's fairly well cached an=
d
> >> predicted code. Experience with the initial hardfloat code showed the
> >> was still a performance win even with the cost of the helper call.
> >
> > Unfortunately, even with the existing hardfloat support, the overhead
> > of the helper calls is still too costly for my particular application.
>
> Once you start dealing with flag generation you might find that equation
> changes somewhat if you have to mess around with bit masking and checks
> using TCG ops. However providing benchmark results with your patch would
> be required to argue the point. You can run tests/fp/fp-bench -t host
> under translation to exercise that.
>
> >
> >> I don't think you'll see the same behaviour emulating an x87 on anythi=
ng
> >> that isn't an x87 because the boundaries for things like inexact
> >> calculation will be different. Indeed if you look at the existing
> >> hardfloat code function can_use_fpu() you will see we only call the ho=
st
> >> processor function if the inexact bit is already set. Other wrappers
> >> have even more checks for normal numbers. Anything that needs NaN
> >> handling will fallback to the correct softfloat code.
> >
> > Fair points. Bit-perfect x87 emulation with this approach may be
> > ultimately unachievable; and I'm still evaluating the cases when this
> > will not work. This has been a learning experience for me, and I
> > gladly welcome expert input in this matter.
> >
> > Personally, I would accept minor accuracy differences in trade for
> > significant performance advantage in emulation of game code, but not
> > for scientific applications, which I understand may diminish upstream
> > appeal of this x87 translation work.
>
> Out of interest what game code still uses x87? I know the classic Doom
> and Quake benchmarks showed a performance regression when we switched to
> softfloat:
>
>   https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b
>
> however I kinda assumed more modern games would be taking advantaged of
> SSE and later features. There is however some missing gaps in the x86
> emulation that might mean code falls back to the x87. Maybe that would
> be another area to look at.
>
> >> I think there will be a wariness to merge anything that only works for=
 a
> >> single frontend/backend combination. Running translated x86 on x86 is
> >> not the common case for TCG ;-)
> >
> > Understood; initially this works on a single frontend/backend
> > combination, with eventual translation to other guests and hosts. It
> > will be a long road, but my plan next is to produce a translation for
> > AArch64 systems.
> >
> >> These are the things that make correct handling of floating point hard=
.
> >
> > Agreed!
> >
> >> I'll happily review patches on the list that provide for an accelerate=
d
> >> FPU experience as long as the correctness is maintained.
> >
> > Thank you!
> >
> > Matt
> >
> > On Thu, Sep 30, 2021 at 2:38 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >>
> >>
> >> Matt <mborgerson@gmail.com> writes:
> >>
> >> > Hello--
> >> >
> >> > I'm excited to share that I have been developing support for TCG
> >> > floating point operations; specifically, to accelerate emulation of
> >> > x86 guest code which heavily exercises the x87 FPU for a game consol=
e
> >> > emulator project based on QEMU. So far, this work has shown great
> >> > promise, demonstrating some dramatic performance improvements in
> >> > emulation of x87 heavy code.
> >>
> >> I've not reviewed the code as it is a rather large diff. For your prop=
er
> >> submission could you please ensure that your patch series is broken up
> >> into discreet commits to aid review. It also aids bisection if
> >> regressions are identified.
> >>
> >> > The feature works in concert with unaccelerated x87 FPU helpers, and
> >> > also allows total soft float helper fallback if the user discovers
> >> > some issue with the hard float implementation.
> >>
> >> The phrase "if the user discovers some issues" is a bit of a red flag.
> >> We should always be striving for correct emulation of floating point.
> >> Indeed we have recently got the code base to the point we pass all of
> >> the Berkey softfloat test suite. This can be checked by running:
> >>
> >>   make check-softfloat
> >>
> >> However the test code links directly to the softfloat code so won't wo=
rk
> >> with direct code execution. The existing 32/64 bit hardfloat
> >> optimisations work within the helpers. While generating direct code is
> >> appealing to avoid the cost of helper calls it's fairly well cached an=
d
> >> predicted code. Experience with the initial hardfloat code showed the
> >> was still a performance win even with the cost of the helper call.
> >>
> >> > For the TCG target,
> >> > I've opted to implement it for x86-64 hosts using SSE2, although thi=
s
> >> > could be extended to support full 80b double extended precision with
> >> > host x87 support. I'm also in early development of an implementation
> >> > for AArch64 hosts.
> >>
> >> I don't think you'll see the same behaviour emulating an x87 on anythi=
ng
> >> that isn't an x87 because the boundaries for things like inexact
> >> calculation will be different. Indeed if you look at the existing
> >> hardfloat code function can_use_fpu() you will see we only call the ho=
st
> >> processor function if the inexact bit is already set. Other wrappers
> >> have even more checks for normal numbers. Anything that needs NaN
> >> handling will fallback to the correct softfloat code.
> >>
> >> I think there will be a wariness to merge anything that only works for=
 a
> >> single frontend/backend combination. Running translated x86 on x86 is
> >> not the common case for TCG ;-)
> >>
> >> > There are still some significant tasks to be done, like proper
> >> > handling of exception flags, edge cases, and testing, to name a few.
> >>
> >> These are the things that make correct handling of floating point hard=
.
> >>
> >> > Once in a slightly more mature state, I do think this feature would
> >> > make a natural addition to upstream QEMU and plan to submit it for
> >> > consideration.
> >> >
> >> > I'm writing to the mailing list now to inform FPU maintainers and an=
y
> >> > other interested parties that this work is happening, to solicit any
> >> > early feedback, and to extend an invitation to anyone interested in
> >> > collaborating to expedite its upstreaming.
> >>
> >> I'll happily review patches on the list that provide for an accelerate=
d
> >> FPU experience as long as the correctness is maintained.
> >>
> >> > My initial TCG FP work can be found here:
> >> > https://github.com/mborgerson/xemu/pull/464/commits
> >> >
> >> > Thanks,
> >> > Matt
> >>
> >>
> >> --
> >> Alex Benn=C3=A9e
>
>
> --
> Alex Benn=C3=A9e

