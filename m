Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD63221C1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 22:49:30 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJ57-0006M9-TP
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 16:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1lEJ43-0005lN-Gy
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 16:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1lEJ40-0008EW-9I
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 16:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614030497;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCh+EGc/Gc90s7Si9unR0YACYQd/5GitqxLpG/WOfB0=;
 b=iEzwU0kfCtKFbh1c+zyJDo+JzI2/GIlt0FGxR0YReof47RVpOTB9k2W1KeQ9DI4a42s10W
 1afV4UF2AqYvKMZaYMom23YZXPySlwAxv15A5xKk37R9G3bfPAeddwjZEpJtsK251+L3ob
 MB/qOs14nCedF/+nn3rdtUeGYMJtjkY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Z2iRrI7POp6FhxBAWEmeqQ-1; Mon, 22 Feb 2021 16:48:13 -0500
X-MC-Unique: Z2iRrI7POp6FhxBAWEmeqQ-1
Received: by mail-wr1-f72.google.com with SMTP id v18so4347754wrr.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 13:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=eCh+EGc/Gc90s7Si9unR0YACYQd/5GitqxLpG/WOfB0=;
 b=YEh7L2RkkfurSEL6RmHmCB0AN+Dz2el1ldzG3TGDOieHrvcUAySfccGk3jiJhZ6EGr
 btK9vPjF0dNxC9/LmJH1ybDvxcxlntx8mc1kIFtvE4U6LaUoMrUEQkm2tTRxiGB9D9G+
 WvhFCd9Oua57N2uOC/JL8xSQhFqPONeGwCQbiKiRTjVQ4rDQAtaLxZgm7+RyCt9xM+IO
 ls+kW+aUkFjhc09SWGCj+19W39H2lHJsv38jhcSDxcKKJBmlepcPemZKDK+NaiVNOg4l
 XtC2ERUVxu2GBbiR6KkWAs4iDdNFQ7FFSMrfC+FdplEGbPPSHMg4gT9T7iB0htUXOcDp
 4mDQ==
X-Gm-Message-State: AOAM530xY/L7IIhV2165uJECLhFC69Z34PFtXZUwUc/tTOYDOy0ta17C
 O0bglWdTuPs6MPXc8b3L0Tunhr6Kzl+Mj056GfcCZvSS77ypvju89lERxHpM7hnVVsKdpKax3TV
 YIJOzVDQ5/EY0zyhi7JyY1DTdVpwi6R8=
X-Received: by 2002:a5d:6807:: with SMTP id w7mr3484531wru.103.1614030492521; 
 Mon, 22 Feb 2021 13:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP3lqgV4QN3PlnF1s9QWtkmMi2b+gbL0OChJoNgJUfba/s3yZuJ8/wHRXJIhU0FjUkHUPoDk8aihYXgRcL7L0=
X-Received: by 2002:a5d:6807:: with SMTP id w7mr3484516wru.103.1614030492326; 
 Mon, 22 Feb 2021 13:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de>
 <20210215102401.GB1542881@redhat.com>
 <4b010479-bd8b-85e9-ef29-88524fef6495@kamp.de>
 <20210215114101.GD1542881@redhat.com>
 <5cc0ff5a-5360-5d81-2da9-724a2baf9f6d@kamp.de>
 <20210215121334.GJ7226@merkur.fritz.box>
 <6c52a0b5-ce02-fd62-25ef-7e303472fc5c@kamp.de>
In-Reply-To: <6c52a0b5-ce02-fd62-25ef-7e303472fc5c@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Mon, 22 Feb 2021 16:48:01 -0500
Message-ID: <CA+aFP1AXVcROzbybrGTkpo3H8j9DX7NTgwnX+EtTbDe6QcZonQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Christian Theune <ct@flyingcircus.io>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 8:29 AM Peter Lieven <pl@kamp.de> wrote:
>
> Am 15.02.21 um 13:13 schrieb Kevin Wolf:
> > Am 15.02.2021 um 12:45 hat Peter Lieven geschrieben:
> >> Am 15.02.21 um 12:41 schrieb Daniel P. Berrang=C3=A9:
> >>> On Mon, Feb 15, 2021 at 12:32:24PM +0100, Peter Lieven wrote:
> >>>> Am 15.02.21 um 11:24 schrieb Daniel P. Berrang=C3=A9:
> >>>>> On Tue, Jan 26, 2021 at 12:25:34PM +0100, Peter Lieven wrote:
> >>>>>> even luminous (version 12.2) is unmaintained for over 3 years now.
> >>>>>> Bump the requirement to get rid of the ifdef'ry in the code.
> >>>>> We have clear rules on when we bump minimum versions, determined by
> >>>>> the OS platforms we target:
> >>>>>
> >>>>>      https://qemu.readthedocs.io/en/latest/system/build-platforms.h=
tml
> >>>>>
> >>>>> At this time RHEL-7 is usually the oldest platform, and it
> >>>>> builds with RBD 10.2.5, so we can't bump the version to 12.2.
> >>>>>
> >>>>> I'm afraid this patch has to be dropped.
> >>>> I have asked exactly this question before I started work on this ser=
ies and got reply
> >>>>
> >>>> from Jason that he sees no problem in bumping to a release which is =
already unmaintained
> >>>>
> >>>> for 3 years.
> >>> I'm afraid Jason is wrong here.  It doesn't matter what the upstream
> >>> consider the support status to be. QEMU targets what the OS vendors
> >>> ship, and they still consider this to be a supported version.
> >>
> >> Okay, but the whole coroutine stuff would get a total mess with all
> >> the ifdef'ry.
> > Hm, but how are these ifdefs even related to the coroutine conversation=
?
> > It's a bit more code that you're moving around, but shouldn't it be
> > unchanged from the old code, just moving from an AIO callback to a
> > coroutine? Or am I missing some complications?
>
>
> No, the ifdef's only come back in for the write zeroes part.
>
>
> >
> >> Would it be an option to make a big ifdef in the rbd driver? One with
> >> old code for < 12.0.0 and one
> >>
> >> with new code for >=3D 12.0.0?
> > I don't think this is a good idea, this would be a huge mess to
> > maintain.
> >
> > The conversion is probably a good idea in general, simply because it's
> > more in line with the rest of the block layer, but I don't think it add=
s
> > anything per se, so it's hard to justify such duplication with the
> > benefits it brings.
>
>
> I would wait for Jasons comment on the rbd part of the series and then sp=
in a V3
>
> with a for-6.1 tag.

Sorry for the long delay -- I was delayed from being out-of-town. I've
reviewed and play-tested the patches and it looks good for me. I'll
wait for V3 before adding my official review.

>
>
> Peter
>


--=20
Jason


