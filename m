Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6862FF512
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:50:42 +0100 (CET)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fyb-0004mq-GS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l2fqW-0005w4-FE
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:42:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l2fqT-0003se-9u
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611258136;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVFpfYbcvm97W+TXPipXEvI1f8ZrZ8vD2TdLTk/wxXk=;
 b=ON03F0OMeWe1N+Du1LCYpfdM9MIBaH0H8BCtvmxj4VrqcNx/9Skrab0b6I0yuAMudIMQCh
 TjLP7sQAwzlclKrtxrka3u7wDSUVb7pB+AOPkQMxxh56LktBVzbTsrAkLGE0Vg0JLqhwez
 JSw4iCj+HWBy/Adv51hZQvC5ufZrOsA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-JQl-kMc8NXuR0-guTnEd2w-1; Thu, 21 Jan 2021 14:42:13 -0500
X-MC-Unique: JQl-kMc8NXuR0-guTnEd2w-1
Received: by mail-wm1-f69.google.com with SMTP id f65so999617wmf.2
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=PVFpfYbcvm97W+TXPipXEvI1f8ZrZ8vD2TdLTk/wxXk=;
 b=eb8V3VulUm2uO3DqdzD9U5sXKUiDD0oGkvrJfGmhyrfuxNLLKS1ciSZdLMsf+rx8mv
 nRvCQEa6ChQZTNF7ht6KDnAq5pmG30al9SNQh9wdjn5HbiMen1sWMViVym+7vY5yU6HY
 c0mpsi/adp7LNUYPKvSXjBmol0/O735GzlN/zUAu/mocEJ2c/XswPvoU7W4nmMfXJ+my
 iuoUlyMO185sJGx2skeYvjcmJAXhwRWTM/3oO3yA5FD3WjW+Xp7Xswq9aXv2mgKbn1oh
 v9NAWHJtSKRAAEJ2eGnw9821hBelItSTR+RAoMLQn0aa8hGdYHXDUXzxZqpnPsxvHPBl
 P2Yw==
X-Gm-Message-State: AOAM532xKVYIc9CKpnKxb94zj9GQ8xVDGFRLaUh8ds8TzVYjLDpOMpF6
 QCuPTSx1UQInD2g/arSGv9kD5aIllEuBwtgd2UrKgCHpkwIQzrXngoqTvmVhKfkR18NUZAhyuU1
 Ia1gqK1o/5QrAPay4+IItfLurE/dWSF8=
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr839708wmf.17.1611258132160; 
 Thu, 21 Jan 2021 11:42:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEcmUJG/REJqiZdQ67gEStlcmam9kJehoo43hoOJQKHU3qFKJ1cgCybHHn1cTnksS7QIzj8aqwu4D6CsDXyGM=
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr839686wmf.17.1611258131947; 
 Thu, 21 Jan 2021 11:42:11 -0800 (PST)
MIME-Version: 1.0
References: <0A9D3682-CE03-4984-AC06-83DA0ABF7BDF@kamp.de>
In-Reply-To: <0A9D3682-CE03-4984-AC06-83DA0ABF7BDF@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 21 Jan 2021 14:42:00 -0500
Message-ID: <CA+aFP1BvV8YsLqmO7nefO4u3cdVGY4DJsD95WbGrgbYKmRnGoQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] block/rbd: change request alignment to 1 byte
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Jan 20, 2021 at 6:01 PM Peter Lieven <pl@kamp.de> wrote:
>
>
> > Am 19.01.2021 um 15:20 schrieb Jason Dillaman <jdillama@redhat.com>:
> >
> > =EF=BB=BFOn Tue, Jan 19, 2021 at 4:36 AM Peter Lieven <pl@kamp.de> wrot=
e:
> >>> Am 18.01.21 um 23:33 schrieb Jason Dillaman:
> >>> On Fri, Jan 15, 2021 at 10:39 AM Peter Lieven <pl@kamp.de> wrote:
> >>>> Am 15.01.21 um 16:27 schrieb Jason Dillaman:
> >>>>> On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
> >>>>>> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> >>>>>>> On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
> >>>>>>>> since we implement byte interfaces and librbd supports aio on by=
te granularity we can lift
> >>>>>>>> the 512 byte alignment.
> >>>>>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
> >>>>>>>> ---
> >>>>>>>> block/rbd.c | 2 --
> >>>>>>>> 1 file changed, 2 deletions(-)
> >>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
> >>>>>>>> index 27b4404adf..8673e8f553 100644
> >>>>>>>> --- a/block/rbd.c
> >>>>>>>> +++ b/block/rbd.c
> >>>>>>>> @@ -223,8 +223,6 @@ done:
> >>>>>>>> static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error =
**errp)
> >>>>>>>> {
> >>>>>>>>    BDRVRBDState *s =3D bs->opaque;
> >>>>>>>> -    /* XXX Does RBD support AIO on less than 512-byte alignment=
? */
> >>>>>>>> -    bs->bl.request_alignment =3D 512;
> >>>>>>> Just a suggestion, but perhaps improve discard alignment, max dis=
card,
> >>>>>>> optimal alignment (if that's something QEMU handles internally) i=
f not
> >>>>>>> overridden by the user.
> >>>>>> Qemu supports max_discard and discard_alignment. Is there a call t=
o get these limits
> >>>>>> from librbd?
> >>>>>> What do you mean by optimal_alignment? The object size?
> >>>>> krbd does a good job of initializing defaults [1] where optimal and
> >>>>> discard alignment is 64KiB (can actually be 4KiB now), max IO size =
for
> >>>>> writes, discards, and write-zeroes is the object size * the stripe
> >>>>> count.
> >>>> Okay, I will have a look at it. If qemu issues a write, discard, wri=
te_zero greater than
> >>>> obj_size  * stripe count will librbd split it internally or will the=
 request fail?
> >>> librbd will handle it as needed. My goal is really just to get the
> >>> hints down the guest OS.
> >>>> Regarding the alignment it seems that rbd_dev->opts->alloc_size is s=
omething that comes from the device
> >>>> configuration and not from rbd? I don't have that information inside=
 the Qemu RBD driver.
> >>> librbd doesn't really have the information either. The 64KiB guess
> >>> that krbd uses was a compromise since that was the default OSD
> >>> allocation size for HDDs since Luminous. Starting with Pacific that
> >>> default is going down to 4KiB.
> >> I will try to adjust these values as far as it is possible and makes s=
ense.
> >> Is there a way to check the minimum supported OSD release in the backe=
nd from librbd / librados?
> >
> > It's not a minimum -- RADOS will gladly access 1 byte writes as well.
> > It's really just the optimal (performance and space-wise). Sadly,
> > there is no realistic way to query this data from the backend.
>
> So you would suggest to advertise an optimal transfer length of 64k and m=
ax transfer length of obj size * stripe count to the guest unless we have a=
n API in the future to query these limits from the backend?

I'll open a Ceph tracker ticket to expose these via the API in a future rel=
ease.

> I would leave request alignment at 1 byte as otherwise Qemu will issue RM=
Ws for all write requests that do not align. Everything that comes from a g=
uest OS is very likely 4k aligned anyway.

My goal is definitely not to have QEMU do any extra work for splitting
or aligning IOs. I am really only trying to get hints passed down the
guest via the virtio drivers. If there isn't the plumbing in QEMU for
that yet, disregard.

> Peter
>
>


--=20
Jason


