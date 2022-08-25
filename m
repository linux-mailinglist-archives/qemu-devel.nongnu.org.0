Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE145A1051
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:23:32 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBtL-00030I-NJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRBpJ-0007Bz-Uz
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:19:14 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRBpI-0004cx-34
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:19:13 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-334dc616f86so535685947b3.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tzRfL0f1Taowe5mPhrap6gvy56KA/TamGBjGKt77Qx8=;
 b=OemZogQW4XZdQkikyTmovT/4gPPOsWegsL6y1gOlf5olkhRNUFjhQY477ytLaUAF2U
 8p29WXwfaKEELOIqtm7R0PTfeFGJMM7eoOpELZkpNJK3IgOiBJnoPBcrxwqJehrOBEPq
 l2dXo3WZ3ylaf/t5/ldTMKODtKbvWl8uh9z3cplCjHTUuvE3FRxUH2EJRkZw+HVBYLoA
 dwNuJz2cnYfUchIPozF7L0tbQVTcfFow7xOg5/oQXimqpMBZQF/0jdLnCydyl1z7jpcp
 D+ccWA/5e/bum1M6I8Me+/Bek6LG+z8kEf3pt3lcd1G2olUJciBmQKhvAB28K1qk0kW0
 oiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tzRfL0f1Taowe5mPhrap6gvy56KA/TamGBjGKt77Qx8=;
 b=z2WOHPuOWnH96brZvxRhi3owvbYFri13WN3tSXB2SeK+r6CjLnyBzY8cpzSgG1PM5w
 7h+wE830FkVz0pPYDVclHXUyczWP/w4uY81j4TOXp+tis0LA7/jO6Eo3gUyhIdLyQuHm
 BO1f4sRP8LcHfn7KgJYk+ZMX0wKOHw6/RMBpsFYs01AUJ1ld+Pi2uj82e6GO68Z5E7bn
 Aj1D9Hlit0tKZc5sFdoZrv5tG/L2V/gEpwFiJo8s0Rq08xd79JHZBj9bBXVTiW54OYmM
 3BAsDm10jP3HsPjHMLYcinl+jGtuMxBjjJFoZEZnYdrSWBw5s4LbZyMbICq29++Cq75B
 6s5Q==
X-Gm-Message-State: ACgBeo0zP3kjra1pBuAdVvLtO7yqqjnzRwlN+QCtlBw7Nwu5MqTfgQmm
 vwZgmnu90qn0Mmfq+OYGQU3M9YhcrSupYmVaZeJu4w==
X-Google-Smtp-Source: AA6agR728m3L0jX0krKaUTeIZTmhXnAS61RYd5aNv7YjPxEQierGkqV6nT5nOEJyP0043Qt0i5hw2t8Gf6zP2KJTG2g=
X-Received: by 2002:a81:9145:0:b0:33b:52b8:5335 with SMTP id
 i66-20020a819145000000b0033b52b85335mr3504230ywg.347.1661429950687; Thu, 25
 Aug 2022 05:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
 <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
 <CAFEAcA9OH4ih2pOUbsv6dTMW=3_9LTkzSRj4ogO4oxVS4fOASw@mail.gmail.com>
 <bd40c251-b670-3a9a-f29c-86268d06a5b7@redhat.com>
 <CAFEAcA85Ek=Uf-VfQmZKcyrBGU6zR-mrV3tA7mODorjr_52y2A@mail.gmail.com>
 <cc366956-adc7-7ca6-a056-0bad28fdca06@redhat.com>
In-Reply-To: <cc366956-adc7-7ca6-a056-0bad28fdca06@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Aug 2022 13:18:28 +0100
Message-ID: <CAFEAcA9X-ZcjtJRNZWa97_JS_oT+vm2XEehMPtri1asX72skWg@mail.gmail.com>
Subject: Re: Page alignment & memory regions expectations
To: David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qiaonuohan@cn.fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 25 Aug 2022 at 12:57, David Hildenbrand <david@redhat.com> wrote:
>
> On 25.08.22 13:47, Peter Maydell wrote:
> > On Thu, 25 Aug 2022 at 08:27, David Hildenbrand <david@redhat.com> wrote:
> >> On 24.08.22 21:55, Peter Maydell wrote:
> >>> Lumps of memory can be any size you like and anywhere in
> >>> memory you like. Sometimes we are modelling real hardware
> >>> that has done something like that. Sometimes it's just
> >>> a convenient way to model a device. Generic code in
> >>> QEMU does need to cope with this...
> >>
> >> But we are talking about system RAM here. And judging by the fact that
> >> this is the first time dump.c blows up like this, this doesn't seem to
> >> very common, no?
> >
> > What's your definition of "system RAM", though? The biggest
>
> I'd say any RAM memory region that lives in address_space_memory /
> get_system_memory(). That's what softmmu/memory_mapping.c cares about
> and where we bail out here.
>
>
> > bit of RAM in the system? Anything over X bytes? Whatever
> > the machine set up as MachineState::ram ? As currently
> > written, dump.c is operating on every RAM MemoryRegion
> > in the system, which includes a lot of things which aren't
> > "system RAM" (for instance, it includes framebuffers and
> > ROMs).
>
> Anything in address_space_memory / get_system_memory(), correct. And
> this seems to be the first time that we fail here, so it's either a case
> we should be handling in dump code (as you indicate) or some case we
> shouldn't have to worry about (as I questioned).

I suspect that most of the odd-alignment things are not going
to be ones you really care about having in a dump, but the
difficulty is going to be defining what counts as "a region
we don't care about", because we don't really have "purposes"
attached to MemoryRegions. So in practice the dump code is
going to have to either (a) be able to put odd-alignment
regions into the dump, and put them all in or (b) skip all of
them, regardless. Chances of anybody noticing a difference
between a and b in practice seem minimal :-)

-- PMM

