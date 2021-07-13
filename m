Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388C3C76E5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:18:00 +0200 (CEST)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Nuo-0004FN-GY
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m3NtX-0002wG-Po
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m3NtV-0006cI-1u
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 15:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626203795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hc/xgj1qJj39WE0FI6JQAgQCVC2UqTLGywjrbdynVAo=;
 b=PDDCoB6nvLJ/67CW+7TFXR9MhvmI3x//ojaGdNIQsHX4kCiAzuaMrhXISLGKQtR6v1S8dx
 8uDAVwSLtnYzIDFbYy+5MxIUEqlDeEbcL7xWQjuyfmK9E2tIyx0Q0Nhp5K17JjRBzrq7xT
 a/DElvr717AKFSSCj9Rz6XsFZ9x040k=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-X5T8R2NuOWSLZVvus0QzRg-1; Tue, 13 Jul 2021 15:16:34 -0400
X-MC-Unique: X5T8R2NuOWSLZVvus0QzRg-1
Received: by mail-ot1-f72.google.com with SMTP id
 e14-20020a0568301f2eb0290405cba3beedso16160371oth.13
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 12:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hc/xgj1qJj39WE0FI6JQAgQCVC2UqTLGywjrbdynVAo=;
 b=Vv3xSSzJAJBr6mlQMzkVHrgquBrjtPwEE4AdMAIrtgs0fQi1A/yTAlFT2t4dk704sQ
 rUdyc8dtLMJundUhu0vXT28d34zZ5ncYe8+WKgv8/t51E/hiQIHDe9a0JiSrsbG43WuH
 DyOGM6pmjtv32cCO7P2yKtmvJz/FUA9IN4JjhM/Lo++FVW7az2CBF+TwA0M2Ttf+gm+W
 uIzKUIirObnV2RNGTplqxRnbYiHsxARfNUqeCVjN6xBSAM2m7jNfwmY/7oC028prC2N7
 kGY8rjW8gc4g1iu1uyvOf82S8wEXWAJ85lSChjjtPWzx7XsZ51FfJIupl/RPAudoyHe1
 AhHA==
X-Gm-Message-State: AOAM533D8t+LEOIG+r7wgyjdWRg7vIwGUWazAkIChGsNVjS8ozZgAnIb
 hxzkhSt6I+JodLG7xxQh9rfZNEWiIszQehS+O3ftVvtf4I5GN0GS8fb/ImcjeoEgNtqxQKaIUJh
 d0qddH17sNJw7W8Jp13Pjb6zaRMt/DFE=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr4882092otj.226.1626203793858; 
 Tue, 13 Jul 2021 12:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLoeka/iGV+xRsvw40D9rn+X68+0MhrLC+Ql9mGPFpnbxZsuu9QpZ67Bd+eT0ARd2Yg9OIk9Yv3sLdZdVar2A=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr4882069otj.226.1626203793605; 
 Tue, 13 Jul 2021 12:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-4-eblake@redhat.com>
 <32217a0a-f9cf-dba6-1f07-0b540ae1ae6f@redhat.com>
 <20210713175255.papat2frmbxcdrs5@redhat.com>
In-Reply-To: <20210713175255.papat2frmbxcdrs5@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 13 Jul 2021 22:16:17 +0300
Message-ID: <CAMRbyyvG6dCU4sge3coJcgnb1FP38auR8umdm--iuVYs=YMXsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] qemu-img: Add --skip-broken-bitmaps for 'convert
 --bitmaps'
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 8:53 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Sat, Jul 10, 2021 at 09:37:35PM +0300, Nir Soffer wrote:
> > > We don't want to delete inconsistent bitmaps by default: although a
> > > corrupt bitmap is only a loss of optimization rather than a corruptio=
n
> > > of user-visible data, it is still nice to require the user to opt in
> > > to the fact that they are aware of the loss of the bitmap.  Still,
> > > requiring the user to check 'qemu-img info' to see whether bitmaps ar=
e
> > > consistent, then use 'qemu-img bitmap --remove' to remove offenders,
> > > all before using 'qemu-img convert', is a lot more work than just
> > > adding a knob 'qemu-img convert --bitmaps --skip-broken-bitmaps' whic=
h
> > > opts in to skipping the broken bitmaps.
> >
> > I think this is more than convenience. During live storage migration in
> > oVirt, we mirror the top layer to the destination using libvirt blockCo=
py,
> > and copy the rest of the chain using qemu-img convert with the --bitmap=
s
> > option.
>
> Still, this feels like enough of a feature that I'd really like R-b in
> time to prepare a pull request for inclusion in soft freeze; the
> justification for it being a bug fix is a tough sell.

This is not a bug in the current code, more like missing handling
of important use case. Without this we cannot copy images in
some cases, or we must require downtime to check and repair
images before copying disks.

> > > +.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-im=
age-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] =
[-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B =
BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LI=
MIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> >
> > I liked --skip-broken more, but Vladimir is right that this is not real=
ly a
> > sub-option.
>
> getopt_long() lets you abbreviate; '--sk' and '--skip-broken' are both
> unambiguous prefixes of '--skip-broken-bitmaps'.

Nice to learn that

> > > @@ -2117,7 +2118,7 @@ static int convert_check_bitmaps(BlockDriverSta=
te *src)
> > >               continue;
> > >           }
> > >           name =3D bdrv_dirty_bitmap_name(bm);
> > > -        if (bdrv_dirty_bitmap_inconsistent(bm)) {
> > > +        if (!skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
> > >               error_report("Cannot copy inconsistent bitmap '%s'", na=
me);
> >
> > We can add another hint:
> >
> >     Try --skip-brocken-bitmaps to skip this bitmap or "qemu-img bitmap
> >     --remove" to delete it from disk.
>
> Sure, I can see about adding that.
>
>
> >
> > >               return -1;
> > >           }
> > > @@ -2125,7 +2126,8 @@ static int convert_check_bitmaps(BlockDriverSta=
te *src)
> > >       return 0;
> > >   }
> > >
> > > -static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverSt=
ate *dst)
> > > +static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverSt=
ate *dst,
> > > +                                bool skip_broken)
> > >   {
> > >       BdrvDirtyBitmap *bm;
> > >       Error *err =3D NULL;
> > > @@ -2137,6 +2139,10 @@ static int convert_copy_bitmaps(BlockDriverSta=
te *src, BlockDriverState *dst)
> > >               continue;
> > >           }
> > >           name =3D bdrv_dirty_bitmap_name(bm);
> > > +        if (skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
> > > +            warn_report("Skipping inconsistent bitmap %s", name);
> >
> > In other logs we quote the bitmap name:'%s'
>
> Yes, will fix.
>
> > > +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> > > @@ -143,6 +143,16 @@ $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG"=
 "$TEST_IMG.copy" &&
> > >       echo "unexpected success"
> > >   TEST_IMG=3D$TEST_IMG.copy _img_info --format-specific \
> > >       | _filter_irrelevant_img_info
> >
> > A new title here will make the test output much more clear.
>
> Or even just a bare 'echo' to separate things with blank lines.  Will
> improve.
>
> > > +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> > > @@ -145,4 +145,35 @@ Format specific information:
> > >       corrupt: false
> > >   qemu-img: Cannot copy inconsistent bitmap 'b0'
> > >   qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open '=
TEST_DIR/t.IMGFMT.copy': No such file or directory
> >
> > Why to we get this error? I guess it is part of the first copy that sho=
uld
> > fail?
>
> Yes - proof that we no longer leave a broken file around, but instead
> failed fast (in fact, that's part of the previous patch).
>
> >
> > > +qemu-img: warning: Skipping inconsistent bitmap b0
> > > +qemu-img: warning: Skipping inconsistent bitmap b2
> >
> > Looks useful, I need to check that we log such warnings.
> >
>
> Anything else I should improve before sending a v2?

I think we covered everything, but Vladimir may want to comment.


