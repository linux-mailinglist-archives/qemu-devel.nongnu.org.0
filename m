Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D052492F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:37:31 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5GE-00056z-W2
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1np4uS-0002Nd-5d
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:15:00 -0400
Received: from mail-yw1-f171.google.com ([209.85.128.171]:39186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1np4uQ-0004ir-Du
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:14:59 -0400
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2f83983782fso48830447b3.6
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 02:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+TvV2i/FmQ3EOL5/Xv4zHihvoJqVLYInNUhgxS+enjE=;
 b=vWCW9WgHJbbgWybaWnMDT/2uL4Qq8TuaSwXJDalQw/W7+f6DcsS5ZmiU22sc4imSRQ
 jdpqW4vW8nOGhhbwVfP9EtVn83BuuzuLdprDqkpRnKIy0hA7zb6EhbiOR704b5vUdaTN
 MeRjcC4Uoky7eJGvR5ZtCIFt2cO9xTwgsI4KbxPutLuw8Z1f5PW1J8ZoEo6KaWjN3zF2
 M/YCf3jcAOTPlMOI9NiIGtd8QgrB83+JaB15xgW3bJG4VVwIMTYC86h7D3s8ae9dGLeu
 y/Tlh9ROuHuywY4QJwMMjjIUGQ9sPij9/nzUS7I5T7+AF0C/mBksmyHod612hhCmz8yz
 gWPA==
X-Gm-Message-State: AOAM532b/+Z3qTg+NxSZrZazBckYYyrFqrZY3IHCTOMjB6Er9jMxbQLq
 0IZ6Vmc2p7nggcyG/UNANf6F2AdHqRvAy1bK/J4=
X-Google-Smtp-Source: ABdhPJymzlQsU4AfLPRMblsGUvVGRvgxkosee0N4X100ECgTnexwFrJCUsXhqu27/rQ38Zx7VOMYJ5cDXl4fSn7Pgp0=
X-Received: by 2002:a0d:ddce:0:b0:2f8:c9f7:8f7c with SMTP id
 g197-20020a0dddce000000b002f8c9f78f7cmr30387095ywe.301.1652346897199; Thu, 12
 May 2022 02:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
 <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
 <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
 <c0fb8289-1b56-6e7f-e053-b19dffcfc87b@redhat.com>
In-Reply-To: <c0fb8289-1b56-6e7f-e053-b19dffcfc87b@redhat.com>
Date: Thu, 12 May 2022 11:14:45 +0200
Message-ID: <CAAdtpL5JxRgJ75eqQT6MZPvd7DvgN2ND44O+MKd1Fr_SzEwmAA@mail.gmail.com>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
To: Thomas Huth <thuth@redhat.com>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.171;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yw1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Wed, May 11, 2022 at 1:15 PM Thomas Huth <thuth@redhat.com> wrote:
> On 11/05/2022 13.13, Philippe Mathieu-Daud=C3=A9 wrote:
> > On Wed, May 11, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:
> >> On 11/05/2022 12.46, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>    On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrang=C3=A9
> >>> <berrange@redhat.com> wrote:
> >>>> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> >>>>> According to our "Supported build platforms" policy, we now do not =
support
> >>>>> Ubuntu 18.04 anymore. Remove the related files and entries from our=
 CI.
> >>>>>
> >>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >>>>> ---
> >>>>>    Seems like nobody touched the 18.04-based tests/vm/ubuntu* files=
 in a
> >>>>>    very long time, so I assume these are not used anymore and can c=
ompletely
> >>>>>    be removed now.
> >>>>
> >>>> Or it could mean that they are working fine and so haven't needed
> >>>> changes...
> >>>
> >>> Yes :)
> >>
> >> At least for me "make vm-build-ubuntu.aarch64" is only failing with ss=
h
> >> timeouts (on my x86 laptop) ... is this really supposed to work with T=
CG, or
> >> is this KVM (on arm hosts) only?
> >
> > Yes this timeout code is not working. I suppose it is tied to the TCG h=
ost perf.
> > I suggested a pair of patches to increase it but back then Fam didn't a=
ccepted
> > them because IIRC these VMs were used by patchew (previous to Gitlab).
> > Today we have better framework for testing, so I wouldn't use this scri=
pt on
> > CI, but it is still valuable for manual testing.
> >
> > Robert's email doesn't work anymore. Since I don't have x86 workstation
> > anymore, I'll probably use these tests/vm for testing. So let me add a
> > "upgrade tests/vm/ubuntu to 22.04" to my TODO list. If I fail and nobod=
y
> > miss them, then I won't object to remove them.

So, 18.04 is the latest LTS release for 32-bit x86 (i386).

IIRC we used this 32-bit VM to reproduce bugs only triggered on 32-bit host=
s
(while it seems obvious, what is not obvious is that very few developers ru=
n
on 32-bit hosts, so I'm not sure how long we are interested in avoiding bug=
s
there). See i.e.:
https://lore.kernel.org/qemu-devel/07a865e0-d535-9a19-cf29-f90984bcd510@ams=
at.org/

> All right, I'll respin my patch with the VMs excluded (and containers mov=
ed
> to a separate patch).
>
>   Thomas
>
>

