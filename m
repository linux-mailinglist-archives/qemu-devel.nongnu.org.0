Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338932F7F94
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:30:56 +0100 (CET)
Received: from localhost ([::1]:46012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0R3u-00045r-T3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l0R0m-0001Oe-CT
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:27:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l0R0k-00081r-8R
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610724456;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0BBkIrVCmCGr54C/38VsHfh0GuaYb6CUiyFCfogHOeM=;
 b=J500oI7Y+zmQvyd+yJ1u+PUodczO3/YcpSVmHzpevOqNSwS11nY5UoIfx9lHLuyS42yWcu
 WZHpAzSaaQ5nH4Y2wWVlJsY9FzEprGj3Ioe1zxbV/uFTJC6MyyRcOk03+/aDfI895ZHaQH
 cEA0nUkvaL3/b7B3KX8kWZ/DQs2C2s8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-1tQTzvimOD-6qod-rwgyEQ-1; Fri, 15 Jan 2021 10:27:31 -0500
X-MC-Unique: 1tQTzvimOD-6qod-rwgyEQ-1
Received: by mail-wm1-f70.google.com with SMTP id 14so1405701wmo.8
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=0BBkIrVCmCGr54C/38VsHfh0GuaYb6CUiyFCfogHOeM=;
 b=Sbpncrfw9JOgdEmpo+cDxJlxDe2xiP+oFD1sO5IUFGjRPj2kd4x8Xjx0gwX29+OdDF
 9BmKAh9oJetrcPLy/eU2wlYMXl5PsSrlIBZyQ+Nk5aYNKMkjMdo5JXFxSiSnqGRuoIJl
 7zOdTxh8v9jasF2KdG+F0JR0ltS/w5ZVQufpG63DAG/FA+Ol7+ob98vQ83nAhyYmmttv
 gsvV3KNxlk1Avzw6aMw5vbHWwEu8+SmJvyHyLM/sQtfJ00o2JL3kT/Nr+DtWM2n7TZT6
 VLoqdCSdB5MJusIFqSK/8GBnZ1WCMLQjlh9pzs1kK9FwnhUGmwiBEPCYIUlfi8NoUhDh
 V3rw==
X-Gm-Message-State: AOAM533m3tSavzEJ3d/gMDyOj8RDIAzeXuJxuVvNtr8Kh5al3ylmr7SE
 eKQJLNNtvXkURfFtNKfHG3upPK1Muy2vvaCdazc38nTLgosIjCq5TJE0wztAG0exjxDGz2tozH8
 g5Te0aEipyvNiGnkNrjnAyzSD4XgUtKo=
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr8061774wme.154.1610724450275; 
 Fri, 15 Jan 2021 07:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQfb0aI2d1CCbkVuzLc9B2lAqSLy6zd+2iwGORt4D3VD4met6f6CbLxFYUketWSW61M2yhp8VFVEgN2OCXva0=
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr8061753wme.154.1610724450011; 
 Fri, 15 Jan 2021 07:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-8-pl@kamp.de>
 <CA+aFP1AJ1cMdMGr-Odq+qzgZo9FF89mVy1KzNcoKifjQFwDvJA@mail.gmail.com>
 <f7358dc9-6135-dfa7-fd50-f863d0c8890a@kamp.de>
In-Reply-To: <f7358dc9-6135-dfa7-fd50-f863d0c8890a@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Fri, 15 Jan 2021 10:27:19 -0500
Message-ID: <CA+aFP1Aayup5p482M8tsK3Zy62FLsfgUuQYnw_bSte-RuBrQXg@mail.gmail.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

On Thu, Jan 14, 2021 at 2:59 PM Peter Lieven <pl@kamp.de> wrote:
>
> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> > On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
> >> since we implement byte interfaces and librbd supports aio on byte granularity we can lift
> >> the 512 byte alignment.
> >>
> >> Signed-off-by: Peter Lieven <pl@kamp.de>
> >> ---
> >>  block/rbd.c | 2 --
> >>  1 file changed, 2 deletions(-)
> >>
> >> diff --git a/block/rbd.c b/block/rbd.c
> >> index 27b4404adf..8673e8f553 100644
> >> --- a/block/rbd.c
> >> +++ b/block/rbd.c
> >> @@ -223,8 +223,6 @@ done:
> >>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
> >>  {
> >>      BDRVRBDState *s = bs->opaque;
> >> -    /* XXX Does RBD support AIO on less than 512-byte alignment? */
> >> -    bs->bl.request_alignment = 512;
> > Just a suggestion, but perhaps improve discard alignment, max discard,
> > optimal alignment (if that's something QEMU handles internally) if not
> > overridden by the user.
>
>
> Qemu supports max_discard and discard_alignment. Is there a call to get these limits
>
> from librbd?
>
>
> What do you mean by optimal_alignment? The object size?

krbd does a good job of initializing defaults [1] where optimal and
discard alignment is 64KiB (can actually be 4KiB now), max IO size for
writes, discards, and write-zeroes is the object size * the stripe
count.

> Peter
>
>
>

[1] https://github.com/torvalds/linux/blob/master/drivers/block/rbd.c#L4981

-- 
Jason


