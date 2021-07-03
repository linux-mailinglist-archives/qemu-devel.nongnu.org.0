Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999FA3BA9FE
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 20:26:49 +0200 (CEST)
Received: from localhost ([::1]:53186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzkLo-00047o-6A
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 14:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lzkKT-0003PC-B9
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 14:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lzkKP-000892-In
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 14:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625336718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3i6ohzUYFm8wVrCQmlHBgWQMD2led3w3uYcGpUzpHc=;
 b=Ijdbm492XWF4BixbUy5QCpZYkA6u7nX4SfA4JgHZw80NKfshxHs5rN68NU8OY8ssLAuWkc
 dtqWpz8BxIrp51r7z5cJ5Ml7iHfI4MjszfJr6SBNFQrdUbZv0RPhyy+7S13Yq8DTM3/NPr
 bjOjV65jFJ9OQdcTC3pVjYdzj0/WAdg=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-AaP-cPKYM7ib1UOUY3PVrQ-1; Sat, 03 Jul 2021 14:25:15 -0400
X-MC-Unique: AaP-cPKYM7ib1UOUY3PVrQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 102-20020a9f236f0000b029029412e62bd2so4096345uae.11
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 11:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U3i6ohzUYFm8wVrCQmlHBgWQMD2led3w3uYcGpUzpHc=;
 b=CaAQbZGUPvQ0joKFVN5HAOLdlR5SI8L9/cAVLarKwmAsxGeIWyWzO9/PyW1wVaQOxG
 e4R9tTcJKceNlI9mRuD1JDSur+qZx2YEY7uRZCkXZ0fdKUyArbsYgZ54V8fS1QPrmlOH
 +V/uL5tFrWpLAxTu+ihi39GPgFiH2X/ruwqYbt5wcsBxV747YTnzgoNyKlBLZ+YPWkA8
 RwS7psm6qSWOkyYhFn32VC19xdgXF9zlZaFu1yt3jpB4NbSIGYBvq9PjvyEvBuDuZQjc
 XevVFI3JJD43qBAM3Z9Dgp6ESUcR0YH91jvTKYMKJod47L4x75OTf2f6aDa18v4aMJtm
 TzVw==
X-Gm-Message-State: AOAM5301n5k2fwpam+YKqsBbmjsogAOcBhXgOeOVzt+xBubalxAaHiuK
 YuAW8yeYo2eZPDkWd4pSEm4Nzwgmo8loLJ25wmLMuBQQJ5mn10CDmz3dHEVM6kMD3fvyrYOSCTh
 GtOSRc+OFeULLJAqyOWvowJD77qWtL1A=
X-Received: by 2002:a67:c09b:: with SMTP id x27mr4905594vsi.50.1625336714971; 
 Sat, 03 Jul 2021 11:25:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXk5mWMdWQXRVERgG3QQ7JX0dDQ4eeyY+g7v71e+sP1uQQ9BlzhJrkuMqLLcIEZIQp4rGNQZ21fUn1REwUz1s=
X-Received: by 2002:a67:c09b:: with SMTP id x27mr4905586vsi.50.1625336714469; 
 Sat, 03 Jul 2021 11:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
 <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
 <c753b71a-b0a4-a182-976d-00c36edc5e4a@amsat.org>
 <CAKJDGDYuw-A+63wMvDcp7gK8QowoDDN-TwMCFv3i6=kvOqjUdQ@mail.gmail.com>
 <41a3f762-1fbb-c9f8-73b5-6d1d6654d4c5@amsat.org>
 <225d9dd2-bb78-7399-e2b5-30a43d90a61d@amsat.org>
In-Reply-To: <225d9dd2-bb78-7399-e2b5-30a43d90a61d@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Sat, 3 Jul 2021 15:24:48 -0300
Message-ID: <CAKJDGDZV9Vb7WPS-f7ComGt7rh3QYd15X0W5HvXmJwW1r7mrPg@mail.gmail.com>
Subject: Re: Problem with Avocado and QEMU console
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

I spent some time trying to debug the problem with
tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810. Although I
could not reproduce it locally, with or without Avocado, I was able to
reproduce it without using Avocado on GitLab CI:

https://gitlab.com/willianrampazzo/qemu/-/pipelines/331342777

From 50 tries, 3 reproduced the problem.

So, answering your question, no, the problem happening with
tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810 is not
related to the problem reported in this thread or to Avocado.

Regards,

On Fri, Jul 2, 2021 at 11:48 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 6/1/21 5:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 5/3/21 4:46 PM, Willian Rampazzo wrote:
> >> On Mon, May 3, 2021 at 10:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>>
> >>> On 5/3/21 3:12 PM, Willian Rampazzo wrote:
> >>>> Hi Philippe,
> >>>>
> >>>> On Mon, May 3, 2021 at 9:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@am=
sat.org> wrote:
> >>>>>
> >>>>> Hi Cleber, Willian,
> >>>>>
> >>>>> Avocado marked the test_mips64el_fuloong2e as failed while
> >>>>> it succeeded:
> >>>>> https://gitlab.com/qemu-project/qemu/-/jobs/1231363571
> >>>>>
> >>>>> Apparently the first part of the console output is missing.
> >>>>> (Normal console output attached).
> >>>>>
> >>>>> Any idea what could be the cause?
> >>>>>
> >>>>
> >>>> The log shows the following:
> >>>>
> >>>> 12:00:37 ERROR| avocado.core.exceptions.TestFail: Failure message
> >>>> found in console: "Kernel panic - not syncing". Expected: "Kernel
> >>>> command line: printk.time=3D0 console=3DttyS0"
> >>>>
> >>>> Does your comment about "console output missing" means the expected
> >>>> message was supposed to be on this missing part?
> >>>
> >>> Yes, "the first part is missing" so Avocado didn't see the expected
> >>> message pass, but the messages emitted *after* it are logged.
> >>>
> >>
> >> Okay, got it.
> >>
> >> The reason for it to fail is here:
> >> https://gitlab.com/qemu-project/qemu/-/blob/master/tests/acceptance/bo=
ot_linux_console.py#L53.
> >> The way the `wait_for_console_pattern` method is defined tells the
> >> test to fail if that `failure_message` is found.
> >>
> >> I'm still checking why the test missed the first part.
> >
> > Could this be related to the recent failures in N8x0Machine.test_n810?
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/1280746618#L128
>
> Yet another one:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1390365314#L129
>


