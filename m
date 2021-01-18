Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879F72FAD58
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 23:34:56 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1d6t-0004Lh-1K
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 17:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l1d5n-0003hg-VM
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 17:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l1d5l-0001w7-5G
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 17:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611009224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6hk3ruznFDJOAPanNAtGcZvmcKW9rKsENEPUYgJSOWQ=;
 b=XJT5E4FGEnWMOD5KqzHa9GvUqXJdSI3kk7VK9bqPP9T28tdKweRJrta1vmL4bgb2o/uQY/
 9nvfUF65fQcCWALVaKbFqzgCcZAAGQitKtsNB9dKLMHzBnCrh7ozi+kGkammTLCWMRHXQv
 m1P8kiktyRv8oL7iBRZiDJiS34gCdes=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-UD-Myxy7PXmoGJdw3F0QqQ-1; Mon, 18 Jan 2021 17:33:40 -0500
X-MC-Unique: UD-Myxy7PXmoGJdw3F0QqQ-1
Received: by mail-wr1-f71.google.com with SMTP id r8so8939809wro.22
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 14:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=6hk3ruznFDJOAPanNAtGcZvmcKW9rKsENEPUYgJSOWQ=;
 b=qSVEMu04QOO53ZQX8HfZcmk9fa8vi1eFqIj2PLHbzCAwHUKFUyunXR4VkGq7r0+Ybh
 ZU24MW8FQXfLBkwejVrE2IvBI/oLM3x49W9I/dM44NBGc37xniIRXYZoNil3C4NopY5E
 84L4r0o0WCMAfwUpkebh0o1icE7LgShhwJjUs19JHU4m7qv394Kjyt4OzY5lGTtd5Hzt
 4uSZcq2D7g/eFMmf/EAXE+nHfgMpGRRdXTxNRURKE48c7lWs4kOpzGsLgjcZ9+rXQJux
 heL13ewUMH2CsdLDzWA0+mSOrq5bLvoblFSyFSd4aLtLePaK6LwB4qN69m/fJcU7KWAA
 r68w==
X-Gm-Message-State: AOAM531YFGSANcTGjGrpiRQKhD8f4aZjrqcdOVAP2vYgGFk/sLZdMNX2
 DZSvEhbo++l+nZcdri0EeElTbDA/MUZXwbbSFvqDvhl5sNlEINqPsUjbTsR5cpeVHj/VkFYtw7q
 KVp5a/EraE4JvNSUCXiBy73I1eoWfENo=
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr1303507wme.154.1611009218897; 
 Mon, 18 Jan 2021 14:33:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1eARsfvM6fhOTOsKm6BtT8445O5SWnnwnAFm6m2G8QpdsaGWo3+lvR6YrOKhKLCdtXhgvVZGKNmVcrZzgd/Q=
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr1303497wme.154.1611009218667; 
 Mon, 18 Jan 2021 14:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-8-pl@kamp.de>
 <CA+aFP1AJ1cMdMGr-Odq+qzgZo9FF89mVy1KzNcoKifjQFwDvJA@mail.gmail.com>
 <f7358dc9-6135-dfa7-fd50-f863d0c8890a@kamp.de>
 <CA+aFP1Aayup5p482M8tsK3Zy62FLsfgUuQYnw_bSte-RuBrQXg@mail.gmail.com>
 <75992ffb-3b6e-c31a-a9a0-956daa7752e6@kamp.de>
In-Reply-To: <75992ffb-3b6e-c31a-a9a0-956daa7752e6@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Mon, 18 Jan 2021 17:33:28 -0500
Message-ID: <CA+aFP1DMTdxvi=C2=8hXYrWBf3nXqQ9ZjHPCEbsCo5biiRnQrA@mail.gmail.com>
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 10:39 AM Peter Lieven <pl@kamp.de> wrote:
>
> Am 15.01.21 um 16:27 schrieb Jason Dillaman:
> > On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
> >> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> >>> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
> >>>> since we implement byte interfaces and librbd supports aio on byte granularity we can lift
> >>>> the 512 byte alignment.
> >>>>
> >>>> Signed-off-by: Peter Lieven <pl@kamp.de>
> >>>> ---
> >>>>  block/rbd.c | 2 --
> >>>>  1 file changed, 2 deletions(-)
> >>>>
> >>>> diff --git a/block/rbd.c b/block/rbd.c
> >>>> index 27b4404adf..8673e8f553 100644
> >>>> --- a/block/rbd.c
> >>>> +++ b/block/rbd.c
> >>>> @@ -223,8 +223,6 @@ done:
> >>>>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
> >>>>  {
> >>>>      BDRVRBDState *s = bs->opaque;
> >>>> -    /* XXX Does RBD support AIO on less than 512-byte alignment? */
> >>>> -    bs->bl.request_alignment = 512;
> >>> Just a suggestion, but perhaps improve discard alignment, max discard,
> >>> optimal alignment (if that's something QEMU handles internally) if not
> >>> overridden by the user.
> >>
> >> Qemu supports max_discard and discard_alignment. Is there a call to get these limits
> >>
> >> from librbd?
> >>
> >>
> >> What do you mean by optimal_alignment? The object size?
> > krbd does a good job of initializing defaults [1] where optimal and
> > discard alignment is 64KiB (can actually be 4KiB now), max IO size for
> > writes, discards, and write-zeroes is the object size * the stripe
> > count.
>
>
> Okay, I will have a look at it. If qemu issues a write, discard, write_zero greater than
>
> obj_size  * stripe count will librbd split it internally or will the request fail?

librbd will handle it as needed. My goal is really just to get the
hints down the guest OS.

> Regarding the alignment it seems that rbd_dev->opts->alloc_size is something that comes from the device
>
> configuration and not from rbd? I don't have that information inside the Qemu RBD driver.

librbd doesn't really have the information either. The 64KiB guess
that krbd uses was a compromise since that was the default OSD
allocation size for HDDs since Luminous. Starting with Pacific that
default is going down to 4KiB.

>
> Peter
>
>


-- 
Jason


