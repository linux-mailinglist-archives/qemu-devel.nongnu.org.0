Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483C393064
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:04:13 +0200 (CEST)
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGcO-0001Cm-4C
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lmGLI-0001aU-LA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:46:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lmGL6-0006yu-3B
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622123174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FRwveNbZ52d2oi3/H1CIqSvt3gPzrn41W++IkN+heY8=;
 b=aIP3W86xicggwuUKgRzTbCFn/R13cSOT7a2XQhu5uY3nMkS22Pf77SSW4ma/4hmC3RACIq
 PJ5lD733iPWRj+UsfgdFu2BC+ciQWtr44X5to8cOvXYX7A2vp2oS8plAADl8fy0awSX8sH
 ugleSZSS3JFnk3U0RwygwvLCcPsqBrI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-_EYr2LssMYmJ2kXlihdcPQ-1; Thu, 27 May 2021 09:46:06 -0400
X-MC-Unique: _EYr2LssMYmJ2kXlihdcPQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 f15-20020a9f2bcf0000b02901f8fe91b89cso239405uaj.0
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRwveNbZ52d2oi3/H1CIqSvt3gPzrn41W++IkN+heY8=;
 b=oDptZOIh4bq2iECxr/4iwLqmHTjSvrqg+2yMMzpNMOhk5Rew1cuo/Zb3uvg7D5g/gS
 k8pBg6zIzQI3TPo7PTTBxzmYD7P70hasMDzSXp+1nIZA5OPa0ZV1uJeupuKWddv7o0KA
 5ge56yigc0xM5MaDK0CcUjP2Sd2fJzkemp2DGsIAmFkniWGV7gaGTUmn7wpnJHTFdIaZ
 mGhpsPcFPQD9C91KYMo4mFiVXdkkZVgYJUWDTx0s8HZ/ziyeUQqJZ3cDPTFF0Y19ZSEd
 jDOMJKprXyj9h8dcD6dmXx/5Atgj7OyENT8eJwJfLMM9kLeQj96y/scwAQ8pPvDarzeC
 eb6Q==
X-Gm-Message-State: AOAM532bTeFPkkvLDevectlpolEWzfG0h7DCIaPguoBHSVibzG6kmYRp
 T6s77VhFM4BAxthNRDOJ2U4bw3z6PMu5UXFNIKwUhfUNClZlHxML96Y8bHlWMd5b3Z3hBa0CzF/
 s2zDNp++UIrJK35mA5uHDOrhoQ2d6eaU=
X-Received: by 2002:a05:6102:14c:: with SMTP id
 a12mr2350346vsr.39.1622123165965; 
 Thu, 27 May 2021 06:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSzq2876/leZSGZILnxo2HHgkskGRY6McHxSKZn/DOvnSDbz03ZW1jz7Y+/hAPZRcNxJxghQQeIF7qvDODCKA=
X-Received: by 2002:a05:6102:14c:: with SMTP id
 a12mr2350315vsr.39.1622123165703; 
 Thu, 27 May 2021 06:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210526205601.263444-1-willianr@redhat.com>
 <20210526205601.263444-2-willianr@redhat.com>
 <20210526234123.GA1727861@amachine.somewhere>
In-Reply-To: <20210526234123.GA1727861@amachine.somewhere>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 27 May 2021 10:45:39 -0300
Message-ID: <CAKJDGDbfD8dvDSRJHOs1H9gUnEeijAzWagbTMJzJcHj27ep_wQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/acceptance: change armbian archive to a faster
 host
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 8:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> On Wed, May 26, 2021 at 05:56:01PM -0300, Willian Rampazzo wrote:
> > The current host for the image
> > Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> > (archive.armbian.com) is extremely slow in the last couple of weeks,
> > making the job running the test
> > tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
> > for the first time when the image is not yet on GitLab cache, time out
> > while the image is being downloaded.
> >
> > This changes the host to one faster, so new users with an empty cache
> > are not impacted.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  tests/acceptance/boot_linux_console.py | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> > index 276a53f146..51c23b822c 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):
> >          # to 1036 MiB, but the underlying filesystem is 1552 MiB...
> >          # As we expand it to 2 GiB we are safe.
> >
> > -        image_url = ('https://archive.armbian.com/orangepipc/archive/'
> > +        image_url = ('https://armbian.systemonachip.net/'
> > +                     'archive/orangepipc/archive/'
>
> Hi Willian,
>
> I was pretty annoyed by my pipeline failures, that I came up with:
>
>    https://gitlab.com/cleber.gnu/qemu/-/commit/917b3e376e682e9c35c6f7f597ffca110c719e13
>
> To prove that it was a GitLab <-> archive.arbian.com issue.

When I tried both links, the slow link, and this new link, on my
machine, I could see the slow link is also slow locally. Not as slow
as on GitLab, but 10 times slower than this new link. I was thinking
about open an issue on GitLab. In the worst case, they will say it is
not their fault, but a problem on the other end.

> But I wonder:
>
>  1. how susceptible to the same situation is this other mirror?

Unfortunately, having tests depending on external artifacts will bring
this kind of situation. Unless GitLab is doing traffic shaping, we
will never know how susceptible an external server is to any kind of
instability.

>  2. how trustworthy is this mirror, say, stability wise? Maybe
>     people in the armbian community would have some info?

This new link is the same link that
https://www.armbian.com/orange-pi-pc/ "Archived versions" is pointing,
so I consider it an official mirror from Armbian. That's why I have
not thought much about changing it.

Now, stability wise, we never know :) I don't think we have this
answer for any of the links related to external artifacts QEMU
acceptance tests use.

>
> Depending on the feedback we get about, this can be a very valid
> hotfix/workaround indeed.  But the core issues we need to look into
> are:
>
>  a. applying a timeout when fetching assets.  If the asset fails to be
>     fetched within the timeout, the test simply gets canceled.

But this is failing during the download before the test starts, or in
the pre-phase. The test suite was not created and Avocado don't have a
mapping asset <=> test yet.

>
>  b. evaluate the use of the multiple "locations" support that the
>     avocado.utils.asset library has (and improve it if necessary).
>

This may be an option with a timeout in the location. If the download
on one location times out, try another.

> Anyway, thanks for looking into this, and let's wait a bit for
> feedback.
>
> - Cleber.


