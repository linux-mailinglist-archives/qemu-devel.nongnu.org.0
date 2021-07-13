Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E03C7692
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:40:55 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3NKw-0001Up-FC
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m3NJi-00005Y-Rc
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m3NJg-0005Ml-Vj
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626201575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YH5vtP7RabFFVbPIK03GrqGLx7TSitYoEoxD7fxdAn0=;
 b=K01qcutv1qslyQjUWsjbUj4fyD+0Hc4BNgQ3xgUAErtWkMaZtRRiH0exT0HPaE3E91oFI4
 wHbUR1oLuulnH/Jip/gxcqQBHL19qYZdyTiD9i7gjTETmDJRHReiU7r3CoREDw0ySTDZkd
 3bHOXHEtRJPp0xSHheIkxhMM7L91qoY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-cxgQvGcJP5GYKUId8vIeNA-1; Tue, 13 Jul 2021 14:39:34 -0400
X-MC-Unique: cxgQvGcJP5GYKUId8vIeNA-1
Received: by mail-oo1-f70.google.com with SMTP id
 c25-20020a4a8f990000b029024c6d57447aso10311545ooj.17
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH5vtP7RabFFVbPIK03GrqGLx7TSitYoEoxD7fxdAn0=;
 b=WEgz6s1hf8fEXgbk6YFO/9OwyEYn8y3o/KkQQeu2tE101f87xDUaUiFoWANbDxqxcu
 9rl3B/VD0FpbjmGxPvrB2s7zvez8bUmC9tFKY+gV2HnzqCwFLWPGE8uuq8MGBWxD/Vwa
 5moOzZUNeqPZnKdToPBaL5qbMrw2GHdX+Lw1AOc7+DDFSddA7IkydZ+jf3H94zrKBPE9
 bCBpgDAvdp8hPpB3sRnwEtTErgrFnGeBkD4Pi5B+H7OpUneogk1BJC5jfWyGlQzjH1kZ
 UGGXBnkvTk1IFzxgUSVlWt533A0aIiNaO77wF0zwiS84cRpIUoY5Wp4JjSIM1cVJ/Iyp
 xoeA==
X-Gm-Message-State: AOAM530i95zjJS/qHSduoDsu4AV2krktqrNQTR5I3X/8Yrt3RR7OQQst
 eQAgGfgn30olca1zsoGkgq/WMkCOl4dF3+OrRufXz+ONDnDsm6E4mqp0Cwo7uU0H3X4dH1TEc98
 T87VI6ztzRwwkHSKnFrctr2fCwQ4f2CU=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr4381362oib.118.1626201573573; 
 Tue, 13 Jul 2021 11:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqF1ZFMbUKsl+w5xFbKyClp7pAxgDcnP/SFaUXQc7wG++boZH4GsXLcwNyrK1Wx6zKgBdWc2yiNbrBhkhd7I0=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr4381345oib.118.1626201573345; 
 Tue, 13 Jul 2021 11:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-3-eblake@redhat.com>
 <a5a194b3-4d9c-c64a-ad62-be20e5a64b99@redhat.com>
 <20210713174834.zbnqmo2mfzcdsdcq@redhat.com>
In-Reply-To: <20210713174834.zbnqmo2mfzcdsdcq@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 13 Jul 2021 21:39:16 +0300
Message-ID: <CAMRbyysbLTfm78t3He=DOd=2hrx2CubGaovk+bNH-FMNp+-cVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] qemu-img: Fail fast on convert --bitmaps with
 inconsistent bitmap
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
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

On Tue, Jul 13, 2021 at 8:48 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Sat, Jul 10, 2021 at 09:06:24PM +0300, Nir Soffer wrote:
> > On 7/9/21 6:39 PM, Eric Blake wrote:
> > > Waiting until the end of the convert operation (a potentially
> > > time-consuming task) to finally detect that we can't copy a bitmap is
> > > bad, comparing to failing fast up front.  Furthermore, this prevents
> > > us from leaving a file behind with a bitmap that is not marked as
> > > inconsistent even though it does not have sane contents.
> >
> > I don't think this is an issue since qemu-img terminate with non-zero
> > exit code, and we cannot ensure that image is complete if we fail in
> > the middle of the operation for all image formats and protocols.
> >
> > For files we could use a temporary file and rename after successful
> > conversion for for raw format on block device we don't have any way
> > to mark the contents as temporary.
>
> Atomic rename into place for files is nice, but as you point out, it
> doesn't help when targetting block devices.  So whatever we do to keep
> block devices robust even across temporary state changes is also
> sufficient for files, even if we can indeed improve the situation for
> files in a later patch.

I think management tools should handle this. In oVirt we keep metadata
and cluster locks for any kind of volume and we use them to mark volumes
being copied as temporary, so from our point of view proper cleanup in
failure flows is non-issue.

> > But failing fast is very important.
> >
> > > This fixes the problems exposed in the previous patch to the iotest.
> > >
> > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > ---
> > >   qemu-img.c                                    | 30 +++++++++++++++++--
> > >   tests/qemu-iotests/tests/qemu-img-bitmaps     |  2 --
> > >   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 20 ++-----------
> > >   3 files changed, 29 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/qemu-img.c b/qemu-img.c
> > > index 7956a8996512..e84b3c530155 100644
> > > --- a/qemu-img.c
> > > +++ b/qemu-img.c
> > > @@ -2101,6 +2101,30 @@ static int convert_do_copy(ImgConvertState *s)
> > >       return s->ret;
> > >   }
> > >
> > > +/* Check that bitmaps can be copied, or output an error */
> > > +static int convert_check_bitmaps(BlockDriverState *src)
> > > +{
> > > +    BdrvDirtyBitmap *bm;
> > > +
> > > +    if (!bdrv_supports_persistent_dirty_bitmap(src)) {
> > > +        error_report("Source lacks bitmap support");
> > > +        return -1;
> > > +    }
> > > +    FOR_EACH_DIRTY_BITMAP(src, bm) {
> > > +        const char *name;
> > > +
> > > +        if (!bdrv_dirty_bitmap_get_persistence(bm)) {
> > > +            continue;
> > > +        }
> > > +        name = bdrv_dirty_bitmap_name(bm);
> > > +        if (bdrv_dirty_bitmap_inconsistent(bm)) {
> > > +            error_report("Cannot copy inconsistent bitmap '%s'", name);
> >
> > We can add a useful hint:
> >
> >     Try "qemu-img bitmap --remove" to delete this bitmap from disk.
>
> Yeah, that might be worthwhile.
>
> >
> > > +            return -1;
> > > +        }
> > > +    }
> > > +    return 0;
> > > +}
> > > +
> > >   static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> > >   {
> > >       BdrvDirtyBitmap *bm;
> > > @@ -2127,6 +2151,7 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> > >                                 &err);
> > >           if (err) {
> > >               error_reportf_err(err, "Failed to populate bitmap %s: ", name);
> > > +            qmp_block_dirty_bitmap_remove(dst->node_name, name, NULL);
> >
> > This may fail for the same reason populate failed (e.g. storage became
> > inaccessibel in the middle of the copy). Since we fail the convert, I don't
> > think it worth to try to do this kind of cleanup.
> >
> > If we have a way to disable the bitmap before merge, and enable it after
> > successful merge it make more sense, since if the operation fails we are
> > left with disabled bitmap.
>
> If we got this far, the guest-visible data WAS copied successfully.
> 'qemu-img compare' will report success.  The only thing broken at this
> point is a bogus bitmap, and leaving a just-created (but empty) bitmap
> in place rather than erasing it (since we just created it a few lines
> above) is not nice.  I see no problem with keeping this cleanup path
> intact, even if it is seldom reached, and even though we still exit
> the overall qemu-img convert with an error.

Sure, no reason to delay this fix. With or without hint on errors,

Reviewed-by: Nir Soffer <nsoffer@redhat.com>


