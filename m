Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C720955BF6C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:27:59 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66Zi-00052Q-LS
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o66ED-00010R-3i; Tue, 28 Jun 2022 04:05:45 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o66E9-0000qn-Ls; Tue, 28 Jun 2022 04:05:43 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id p136so14684854ybg.4;
 Tue, 28 Jun 2022 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Br8hIFVieBmk5JLA35AqTj0zdcSEGxxrXX1InQKfHak=;
 b=V9fr/sb5rv0LgY3TDcDMXJwX890RTCFerAMxk7IV2dNfHfamnME6lkuR3Da2QTlosQ
 ZF0pAZvz/dKltJTxLK6Ov4w6zHIH0T8Q2O0dJcjjKVBGz3Qu1oKnAvDn7T2ffHU4o61u
 pKcmgwlI7+JA2+skBuFD4+aYRlDFX1EfhcRE2VPrHIKfU3ZoVBA1HvbuBJFREBK4DZ3q
 c9Y7p6Fig7Lt3ImWe0VCbZf/IVwerbqrOXI51nBhzfgwFxG+u6xO1yLPfdb45z3s946a
 2iyLCUkL/vJ9+GjZSGw15v1XQksJKpzA6HaPwQ3b4L3kR9IpU54fd+GS3toSpq7l15K1
 pUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Br8hIFVieBmk5JLA35AqTj0zdcSEGxxrXX1InQKfHak=;
 b=HEWjqrPNv7jIBvPJYL93rvDGCEL6He+Xc9fY88iCDcZG4uwbrjqp2D7jxXTBXgoNcU
 RQJKe7bQGT6TgpsHLI5OvQ5tZK9fKsWUqlc6t00w8lT+iDGXBf+Ceog3ond+CakslnQN
 40v58SgAMQHiy7YjnM5G1/NjrnD0FggiWB4CwqBTFjbBPUpCyqYcsvvBdYEX+DpU/dw9
 RnqgUCH3t6CK9iF0vhoOu9yRlWRBJ4Zv66OeHiH4Ph8BL9rVd65zw3ZqPXz0eFVfX8df
 Ul2cNe7rUQ7H/jkjz7cKFDLtGvhgI29fGOXMncOE3TxKZNaWI++Pry9f7PfPimTaUWRl
 zWGw==
X-Gm-Message-State: AJIora+9NRPAKRJ5Zz2m19wRrBm54WV8ilNuWwJ9NN44T3DolHL1SNry
 8stBgqmpBe0RxMFZU41lnUaIDHReuWgb+kqKxeg=
X-Google-Smtp-Source: AGRyM1u8A1kvTEQ6deOI52cMkUd7OvGkfnt0PrffGkz8E0vopZssvQVBVNpcB5mOIKV3ULXARuUFM+Jg4nADnZylD6w=
X-Received: by 2002:a25:bf82:0:b0:669:b394:33c with SMTP id
 l2-20020a25bf82000000b00669b394033cmr17556525ybk.102.1656403535524; Tue, 28
 Jun 2022 01:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
In-Reply-To: <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Jun 2022 16:05:24 +0800
Message-ID: <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 14:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jun 27, 2022 at 08:19:13AM +0800, Sam Li wrote:
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index e0e1aff4b1..786f964d02 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
> >      return ret;
> >  }
> >
> > +/*
> > + * Return zone_report from BlockDriver. Offset can be any number withi=
n
> > + * the zone size. No alignment for offset and len.
>
> What is the purpose of len? Is it the maximum number of zones to return
> in nr_zones[]?

len is actually not used in bdrv_co_zone_report. It is needed by
blk_check_byte_request.

> How does the caller know how many zones were returned?

nr_zones represents IN maximum and OUT actual. The caller will know by
nr_zones which is changed in bdrv_co_zone_report. I'll add it in the
comments.

>
> > + */
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                       int64_t len, int64_t *nr_zones,
> > +                       BlockZoneDescriptor *zones)
> > +{
> > +    int ret;
> > +    BlockDriverState *bs;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk); /* increase before waiting */
> > +    blk_wait_while_drained(blk);
> > +    bs =3D blk_bs(blk);
> > +
> > +    ret =3D blk_check_byte_request(blk, offset, len);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    bdrv_inc_in_flight(bs);
>
> The bdrv_inc/dec_in_flight() call should be inside
> bdrv_co_zone_report(). See bdrv_co_ioctl() for an example.
>
> > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len,
> > +                              nr_zones, zones);
> > +    bdrv_dec_in_flight(bs);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> > +/*
> > + * Return zone_mgmt from BlockDriver.
>
> Maybe this should be:
>
>   Send a zone management command.

Yes, it's more accurate.

>
> > @@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
> >              PreallocMode prealloc;
> >              Error **errp;
> >          } truncate;
> > +        struct {
> > +            int64_t *nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report;
> > +        zone_op op;
>
> It's cleaner to put op inside a struct zone_mgmt so its purpose is
> self-explanatory:
>
>   struct {
>       zone_op op;
>   } zone_mgmt;
>
> > +static int handle_aiocb_zone_report(void *opaque) {
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    int64_t *nr_zones =3D aiocb->zone_report.nr_zones;
> > +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> > +    int64_t offset =3D aiocb->aio_offset;
> > +    int64_t len =3D aiocb->aio_nbytes;
> > +
> > +    struct blk_zone *blkz;
> > +    int64_t rep_size, nrz;
> > +    int ret, n =3D 0, i =3D 0;
> > +
> > +    nrz =3D *nr_zones;
> > +    if (len =3D=3D -1) {
> > +        return -errno;
>
> Where is errno set? Should this be an errno constant instead like
> -EINVAL?

That's right! Noted.

>
> > +    }
> > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct =
blk_zone);
> > +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_zone_r=
eport, nrz);
>
> g_new() looks incorrect. There should be 1 struct blk_zone_report
> followed by nrz struct blk_zone structs. Please use g_malloc(rep_size)
> instead.

Yes! However, it still has a memory leak error when using g_autofree
&& g_malloc.

>
> > +    offset =3D offset / 512; /* get the unit of the start sector: sect=
or size is 512 bytes. */
> > +    printf("start to report zone with offset: 0x%lx\n", offset);
> > +
> > +    blkz =3D (struct blk_zone *)(rep + 1);
> > +    while (n < nrz) {
> > +        memset(rep, 0, rep_size);
> > +        rep->sector =3D offset;
> > +        rep->nr_zones =3D nrz;
>
> What prevents zones[] overflowing? nrz isn't being reduced in the loop,
> so maybe the rep->nr_zones return value will eventually exceed the
> number of elements still available in zones[n..]?

I suppose the number of zones[] is restricted in the subsequent for
loop where zones[] copy one zone at a time as n increases. Even if
rep->zones exceeds the available room in zones[], the extra zone will
not be copied.

>
> > +static int handle_aiocb_zone_mgmt(void *opaque) {
> > +    RawPosixAIOData *aiocb =3D opaque;
> > +    int fd =3D aiocb->aio_fildes;
> > +    int64_t offset =3D aiocb->aio_offset;
> > +    int64_t len =3D aiocb->aio_nbytes;
> > +    zone_op op =3D aiocb->op;
> > +
> > +    struct blk_zone_range range;
> > +    const char *ioctl_name;
> > +    unsigned long ioctl_op;
> > +    int64_t zone_size;
> > +    int64_t zone_size_mask;
> > +    int ret;
> > +
> > +    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
>
> Can this value be stored in bs (maybe in BlockLimits) to avoid calling
> ioctl(BLKGETZONESZ) each time?

Yes, zone_size is in the zbd_dev field. I'll update BlockLimits after
I think through the configurations. In addition, it's a temporary
approach. It is substituted by get_sysfs_long_val now.

>
> > +    if (ret) {
> > +        return -1;
>
> The return value should be a negative errno. -1 is -EPERM but it's
> probably not that error code you wanted. This should be:
>
>   return -errno;
>
> > +    }
> > +
> > +    zone_size_mask =3D zone_size - 1;
> > +    if (offset & zone_size_mask) {
> > +        error_report("offset is not the start of a zone");
> > +        return -1;
>
> return -EINVAL;
>
> > +    }
> > +
> > +    if (len & zone_size_mask) {
> > +        error_report("len is not aligned to zones");
> > +        return -1;
>
> return -EINVAL;
>
> > +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64=
_t offset,
> > +        int64_t len, int64_t *nr_zones,
> > +        BlockZoneDescriptor *zones) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs         =3D bs,
> > +        .aio_fildes =3D s->fd,
> > +        .aio_type   =3D QEMU_AIO_IOCTL,
> > +        .aio_offset =3D offset,
> > +        .aio_nbytes =3D len,
> > +        .zone_report    =3D {
> > +                .nr_zones       =3D nr_zones,
> > +                .zones          =3D zones,
> > +                },
>
> Indentation is off here. Please use 4-space indentation.
Noted!

Thanks for reviewing!

Sam

