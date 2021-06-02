Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C429398D56
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 16:44:17 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loS6S-00089W-BK
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 10:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1loS52-0007PX-U4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1loS4x-00025P-RP
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 10:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622644963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6oNWyqfo/U8TwIZJJ+kzVnAJ+SlvbQAXatMWLoC8Dok=;
 b=D/E7u18x9z0g3Qyl6Yrqm0lPgXHpsi402rsondJq/ys21gfn0h7EY7crYwjmkKFXLideNF
 AjpOvtG+fpnRrM6CEocVovg+J6qJTu96YpRdQLh0qoeqVYO9t4jjRf/Oog4R68Is2k3Dp9
 WQVvaUnrUTyAB/x8STLmej2lkj2uhKk=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-dISUmv1zM5CEJgT9NiQUhQ-1; Wed, 02 Jun 2021 10:42:40 -0400
X-MC-Unique: dISUmv1zM5CEJgT9NiQUhQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 78-20020a9f26540000b02902426fc5ddd3so1110451uag.16
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 07:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oNWyqfo/U8TwIZJJ+kzVnAJ+SlvbQAXatMWLoC8Dok=;
 b=N479lrEhVVqfOb4LERlsfsoLuGEBm2F7icsPUUsoS+LVa+9PsXUu0TIfL71xg4NpwP
 o5Bs7AtMfaVbMIJWLP0Pq3ChiYT+RSojvrFJCrBnGXOrqztLhiY3FRTTJyNghD5udIuY
 aMe17yLY1s8S6AG5x/vknpuaGppGToEiAk/R1w2Wx+odsSIilGJlFpPPyzA3DLuyE4uW
 KMNMPLV6n1c4KOIPimBT2xnEvWRo4YsNdEzZDJ4L8i3FLPpa3cgmjA35yGJEfdjF7Ac5
 J/eCWgsfshYpLCmC1Lcd8OlgRmFoZutGSjFrOx4St/ivjgQl9pMa4Ezl/Ru2QxW1lJnS
 VWpg==
X-Gm-Message-State: AOAM531AtgwB5t09JGMs/O2g1kD5+/1pgoT6x6i+5sMwxKTAYi3SN3xb
 Hs3sJ1oohzvmDjWulWGuQEFPl1TxaWxS6C0s3NTEgYnK/3tG+zZC99aeXSegVM2ZiNW8ElM+iy2
 mvL10Dc+Eu/6dSeG+H3sfA7xSH3W1C1w=
X-Received: by 2002:a67:8cc6:: with SMTP id o189mr9485586vsd.50.1622644959456; 
 Wed, 02 Jun 2021 07:42:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrlNrihKRH3kl2S21zgyE0ardGqwfA/+KCv72FOotTd823+5aVgqsszNCHOHPIy2TWBkyWnJmw0+Zf0PSvoTg=
X-Received: by 2002:a67:8cc6:: with SMTP id o189mr9485549vsd.50.1622644959214; 
 Wed, 02 Jun 2021 07:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210526205601.263444-1-willianr@redhat.com>
 <20210526205601.263444-2-willianr@redhat.com>
 <20210526234123.GA1727861@amachine.somewhere>
 <CAKJDGDbfD8dvDSRJHOs1H9gUnEeijAzWagbTMJzJcHj27ep_wQ@mail.gmail.com>
 <CA+bd_6KVZ+66sPWhiOvG6C+emgGUx25y5FJ8gO8o4X=h=jd6Bg@mail.gmail.com>
In-Reply-To: <CA+bd_6KVZ+66sPWhiOvG6C+emgGUx25y5FJ8gO8o4X=h=jd6Bg@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 2 Jun 2021 11:42:12 -0300
Message-ID: <CAKJDGDYePLgD8JVnUDn7dWJKtOs=S_pAdONTLxt2B543nDLvPQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/acceptance: change armbian archive to a faster
 host
To: Cleber Rosa Junior <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On Wed, Jun 2, 2021 at 11:08 AM Cleber Rosa Junior <crosa@redhat.com> wrote:
>
>
>
> On Thu, May 27, 2021 at 9:45 AM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>
>> On Wed, May 26, 2021 at 8:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>> >
>> > On Wed, May 26, 2021 at 05:56:01PM -0300, Willian Rampazzo wrote:
>> > > The current host for the image
>> > > Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>> > > (archive.armbian.com) is extremely slow in the last couple of weeks,
>> > > making the job running the test
>> > > tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
>> > > for the first time when the image is not yet on GitLab cache, time out
>> > > while the image is being downloaded.
>> > >
>> > > This changes the host to one faster, so new users with an empty cache
>> > > are not impacted.
>> > >
>> > > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>> > > ---
>> > >  tests/acceptance/boot_linux_console.py | 3 ++-
>> > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> > > index 276a53f146..51c23b822c 100644
>> > > --- a/tests/acceptance/boot_linux_console.py
>> > > +++ b/tests/acceptance/boot_linux_console.py
>> > > @@ -804,7 +804,8 @@ def test_arm_orangepi_bionic_20_08(self):
>> > >          # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>> > >          # As we expand it to 2 GiB we are safe.
>> > >
>> > > -        image_url = ('https://archive.armbian.com/orangepipc/archive/'
>> > > +        image_url = ('https://armbian.systemonachip.net/'
>> > > +                     'archive/orangepipc/archive/'
>> >
>> > Hi Willian,
>> >
>> > I was pretty annoyed by my pipeline failures, that I came up with:
>> >
>> >    https://gitlab.com/cleber.gnu/qemu/-/commit/917b3e376e682e9c35c6f7f597ffca110c719e13
>> >
>> > To prove that it was a GitLab <-> archive.arbian.com issue.
>>
>> When I tried both links, the slow link, and this new link, on my
>> machine, I could see the slow link is also slow locally. Not as slow
>> as on GitLab, but 10 times slower than this new link. I was thinking
>> about open an issue on GitLab. In the worst case, they will say it is
>> not their fault, but a problem on the other end.
>>
>> > But I wonder:
>> >
>> >  1. how susceptible to the same situation is this other mirror?
>>
>> Unfortunately, having tests depending on external artifacts will bring
>> this kind of situation. Unless GitLab is doing traffic shaping, we
>> will never know how susceptible an external server is to any kind of
>> instability.
>>
>> >  2. how trustworthy is this mirror, say, stability wise? Maybe
>> >     people in the armbian community would have some info?
>>
>> This new link is the same link that
>> https://www.armbian.com/orange-pi-pc/ "Archived versions" is pointing,
>> so I consider it an official mirror from Armbian. That's why I have
>> not thought much about changing it.
>>
>> Now, stability wise, we never know :) I don't think we have this
>> answer for any of the links related to external artifacts QEMU
>> acceptance tests use.
>>
>> >
>> > Depending on the feedback we get about, this can be a very valid
>> > hotfix/workaround indeed.  But the core issues we need to look into
>> > are:
>> >
>> >  a. applying a timeout when fetching assets.  If the asset fails to be
>> >     fetched within the timeout, the test simply gets canceled.
>>
>> But this is failing during the download before the test starts, or in
>> the pre-phase. The test suite was not created and Avocado don't have a
>> mapping asset <=> test yet.
>>
>
> Right. But my point is that if it times out, then this "best effort" attempt would fail (but not abort the job).  Then, during the test itself, considering `cancel_on_missing=True`, the test would also cancel when it fails to access the asset.
>
> A canceled test is what we want here, and not a stuck job.  That's why I still think the timeout may be a solution.
>

Okay, got it! I opened an issue to track this feature:
https://github.com/avocado-framework/avocado/issues/4643

Anyway, for now, I think changing the URL gives us some time until we
have the problem again :)

> Thanks,
> - Cleber.
>


