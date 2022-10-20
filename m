Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FFD60651C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:54:26 +0200 (CEST)
Received: from localhost ([::1]:36360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXsG-0001sJ-95
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:54:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXrw-0006rm-OI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olX4d-0007z0-EX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:03:07 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olX4X-0001bS-Q5
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:03:06 -0400
Received: by mail-pf1-x433.google.com with SMTP id d10so20512211pfh.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WySh25WfIfYI3wdpNOY/uj2Zh/hPApmf0YgIHFCvAeg=;
 b=CPrNAjRBUra8dBuOCAVs13C/JWMECRZ7nVCzmTVK83ZIoGjENSW7eEGV5e+s+gcSMx
 M29zuvAkmMt6DEnse4F5K9KR7W8SV5R+GkNDhP55AOUvuHdWhlwQi8FdP4uoyu6pkO8e
 EftTWhj+4+/4VB9Vxbm5vXa7RxEkd4sxt/WGNsiD/W0m7dtv3I9uwVLGWN805HZzZewc
 eub5WLnl0eaMx6RDSjC9wesH56CNnv6rteaxLa1OXLPbN5GvQPd1Iomjl6KDOAj4pl8C
 BNQWCblr3eAncz9XQB9sRQjRZjW+R9SlxE6Ou7BanMOCobfB2tV1csg8Ehdxkzy23yQ3
 hkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WySh25WfIfYI3wdpNOY/uj2Zh/hPApmf0YgIHFCvAeg=;
 b=AtGgoxA1nytOTeDKrK6IuYy1wXlU8najoyIHRcz4rf6wZH7IyaFnWjtxIcVx3roXVf
 Z0GXW83USu1AcEbcvpAaR8QKpDEBBtlDOJ1ucpCuj0Du1OntyOe85NXptlYvawhOoXBT
 FLVB6vwPo8m1oaKGxuYaxMUUNZyiaO34MLTGv6C/sPiaMdyikX9PGa0RD5LxQHad0pPp
 vxmcw8al7o4sq/KVgbKOBMXVENzOeJsqHTt4qi4N7pWRDiUuz7b8vWStInhtMr1rmX5y
 +OlrNJQtFtTFD9nWF1l48RFjaHL8ul/Ej//TbGZkl8/xnZOz2fhkTMSu2biv5LslE8j7
 glkg==
X-Gm-Message-State: ACrzQf0OSbkDl2IIT0bFlyYl3KhvCJUFev61jERdbWgJ39PiqW5m7qkl
 bOn/D1J4zGFFSiSSl3zfNpQgXX+6osYFqHShwQWwQg==
X-Google-Smtp-Source: AMsMyM5fBaSxRWq2sxUmNl7bqTQoAnPtSy2FcFcqehNlviI5ijI9eS+GqU12vFaJT0Ap2p7YtGj8iZ3vVhTGGQnloC8=
X-Received: by 2002:a63:9043:0:b0:458:6003:30ee with SMTP id
 a64-20020a639043000000b00458600330eemr12468885pge.231.1666278179709; Thu, 20
 Oct 2022 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-8-tobias.roehmel@rwth-aachen.de>
 <CAFEAcA8o4GfuY0yB4A3FeADuyzbHdRYFL_402-RxkXBy5kh7-w@mail.gmail.com>
 <505cf0d1-e02c-c899-d551-ee2c451e6bcb@rwth-aachen.de>
In-Reply-To: <505cf0d1-e02c-c899-d551-ee2c451e6bcb@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 16:02:47 +0100
Message-ID: <CAFEAcA9yfJ2jULdVFkn5gn3kj6HjJkGPj4MQHcFXm1069W4zAA@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] target/arm: Add PMSAv8r registers
To: Tobias Roehmel <tobias.roehmel@rwth-aachen.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 15 Oct 2022 at 14:07, Tobias Roehmel
<tobias.roehmel@rwth-aachen.de> wrote:
>
> Thank you very much for the review!
>
> I have a few questions:
>
> On 27.09.22 15:50, Peter Maydell wrote:
> > On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
> >> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> >>
> >> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> >> ---
> >>   target/arm/cpu.h    |  10 +++
> >>   target/arm/helper.c | 171 ++++++++++++++++++++++++++++++++++++++++++=
++
> >>   2 files changed, 181 insertions(+)
> >>
> >> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> >> index 86e06116a9..632d0d13c6 100644
> >> --- a/target/arm/cpu.h
> >> +++ b/target/arm/cpu.h
> >> @@ -726,8 +726,18 @@ typedef struct CPUArchState {
> >>            */
> >>           uint32_t *rbar[M_REG_NUM_BANKS];
> >>           uint32_t *rlar[M_REG_NUM_BANKS];
> >> +        uint32_t prbarn[255];
> >> +        uint32_t prlarn[255];
> >> +        uint32_t hprbarn[255];
> >> +        uint32_t hprlarn[255];
> > Don't use magic constants, please. In fact, don't use
> > fixed size arrays at all here. The v8R PRBAR/PRLAR
> > register arrays are exactly the same format as the v8M
> > pmsav8.rbar[] and pmsav8.rlar[], so please use the same
> > state fields that does. (You'll need to add equivalent
> > new arrays to handle the HPRBAR/HPRLAR.)
>
> Is there a way to find out whether I'm in secure mode while accessing a
> co-processor register?
> The banks for rbar etc. are used to model the secure non-secure banks.
> The access mechanism
> here is via a device which allows the use of the mmu index to find out
> if we are in secure mode.
> I'm struggling to find a good solution in the co-processor register case.

Well, for 32-bit v8 R-profile you know you're always NonSecure.
But more generally, the right way depends on where you are.
Code in ptw.c now gets passed a bool to tell it whether it
needs to do the address translation for a secure or nonsecure
translation regime (this is a change from a recent refactoring).
Otherwise there is the arm_is_secure() function.

For the coprocessor register access functions, just do what
pmsav7 does' and hardcode that the array element you want is
the M_REG_NS one.

> >
> >>           uint32_t mair0[M_REG_NUM_BANKS];
> >>           uint32_t mair1[M_REG_NUM_BANKS];
> >> +        uint32_t prbar;
> >> +        uint32_t prlar;
> > You should not need separate prbar/prlar fields, as those
> > registers only indirectly access the state for thecurrently
> > selected region. Similarly hprbar, hprlar below.
> >
> >> +        uint32_t prselr;
> > PRSELR is just a renamed PMSAv7 RGNR, for which we already
> > have a state field, pmsav7.rnr[M_REG_NS] (and indeed a cpreg
> > struct).
> I changed it to use the rnr field, but I think I can't reuse the cpreg
> since it has a different encoding.

Oops, yes, I misread the opc2 value.

> >
> >> +        uint32_t hprbar;
> >> +        uint32_t hprlar;
> >> +        uint32_t hprselr;
> >>       } pmsav8;
> > Some of this new state must be handled for migration.
> > Where state is directly accessed via a coprocessor
> > register that will be migrated for you. However, where
> > there is state that is not directly accessible, i.e. for
> > the rbar/rlar arrays, you need to add code/vmstate structs
> > to target/arm/machine.c to migrate them. vmstate_pmsav8
> > already does this for rbar and rlar, but you'll need to
> > add something similar for the hyp versions. (Watch out that
> > you maintain migration compat for the existing CPUs -- you
> > can't just add new fields to existing VMStateDescription
> > structs. Ask if you need advice.)
> I need some help here. Do I need new subsections?

That's generally the easiest way, yes. You can make it
a subsection of vmstate_pmsav8. the way subsections work is
that they appear in a .subsections field of some other
vmstate. They need a .needed function which returns true when
the new fields in the subsection must be migrated, and false
otherwise (such that any already existing CPU returns false
for the .needed function). That way the migration code will
migrate the new CPU struct fields for the new CPU, but won't
expect or send them for an old one.

As an example, look at vmstate_m_mve, which migrates a couple
of fields which are used only by M-profile CPUs with the MVE
feature. The vmstate_m_mve struct is listed in the .subsections
list of the vmstate_m struct (this is the VMStateDescription that
handles general M-profile CPU stuff), and the mve_needed() function
returns true only for CPUs with MVE. Note that the .name of
the subsection has to match up with the .name of its parent
section, so if the parent section's name is "parent/name"
then the subsection has to be "parent/name/whatever".

thanks
-- PMM

