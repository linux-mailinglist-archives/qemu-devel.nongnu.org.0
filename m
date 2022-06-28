Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFAB55C035
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:32:42 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68WP-0007w0-LW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o68NL-0003v9-Sd; Tue, 28 Jun 2022 06:23:19 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o68NJ-0000W0-UR; Tue, 28 Jun 2022 06:23:19 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id o19so14883354ybg.2;
 Tue, 28 Jun 2022 03:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0sK9HP3vTaaTW2ZkxOnS09t/dBWQzF+56aSFPfVohXc=;
 b=G0cZvHlqE3JbGgzpcC/JOewEfhNuTn4ER6mx5DD0aQR7YukSF/qVTrhk0X+nD/KVfd
 nrCDcKJoCx0rdmbElpg9R4ahwmgL8j1ridJwzP4u/8tIac1eZWZZeVKmG0a2iRmUCSAM
 lX7PCS8Laj25oHA3+pX+b5xqncgwdhLoFybjkvGrJLxdAhMTw3cOWvcXWu5b/A4GCXNV
 wc3syM6YaTPB5O2eyPRYUl2/vXwRCAE1PPqFOqAm+D3+NoHyrD1om/gFdUTW1Xkrq+oh
 /6UaCgJ1EI694cexZ3VX9URXVTlU+tUqJyty5XL5r2P4Uc4zgeUBy4dGzx452pNbOZJQ
 yNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0sK9HP3vTaaTW2ZkxOnS09t/dBWQzF+56aSFPfVohXc=;
 b=5YPc167c7JAsMEYKdAK1xTk4edb+OrMvLE1SCSATlDg8mK26PHnlK1F03CjAoTvnGy
 tKLt9ZRI9tY4URf8voia/QzCMqO6c0JI3PsSs4QbzDHvZLm9cd+r/CeFPvhyAE6jhKg7
 ix+f8UPb1IZZogLTGKKKmRqyHnAcJMEzi5KPRdj54h8hLkr04nuiAkQ48dw+J25FEwLk
 I/92zNnHpvtey2cnc6LC9O8T/+9pxKVw8Inorn/QcAcVNWvUfxYtN/S0fzTRjiqd5Gm9
 CRYdnIAQYOgdPsyYKbYBYllo0jfUOzXnmQsgWvJL3ll/rylwzwF/cf6+BwI5HSvuW/5N
 +l6Q==
X-Gm-Message-State: AJIora9G7w17Axg9h8BVMGauJaLgcped4GxhtXKK+nUxMfW4XfqB4iax
 gRcEEXl6NfLVEWoJrgLO4TmhRV/DgydmfYAXO7Y=
X-Google-Smtp-Source: AGRyM1t96mzSR/FZGas/XqhYxEu3BzF8U5wGjvoscaHgYLSKLJrno9lDSfj4n/8S7SvCCTTEKvo/4vWD1vb9KUlRZF4=
X-Received: by 2002:a25:c013:0:b0:66d:4141:1c49 with SMTP id
 c19-20020a25c013000000b0066d41411c49mr683044ybf.122.1656411794428; Tue, 28
 Jun 2022 03:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
 <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
 <c74ebf91-1af0-8e29-28e0-9b4ee4580ae8@opensource.wdc.com>
In-Reply-To: <c74ebf91-1af0-8e29-28e0-9b4ee4580ae8@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Jun 2022 18:23:03 +0800
Message-ID: <CAAAx-8+6q9zLGO2Xzi9JaNFgkpHn0-eQyB8GijGx53zbFtsDCQ@mail.gmail.com>
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2e.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 17:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/28/22 17:05, Sam Li wrote:
> > Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=882=
8=E6=97=A5=E5=91=A8=E4=BA=8C 14:52=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On Mon, Jun 27, 2022 at 08:19:13AM +0800, Sam Li wrote:
> >>> diff --git a/block/block-backend.c b/block/block-backend.c
> >>> index e0e1aff4b1..786f964d02 100644
> >>> --- a/block/block-backend.c
> >>> +++ b/block/block-backend.c
> >>> @@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
> >>>      return ret;
> >>>  }
> >>>
> >>> +/*
> >>> + * Return zone_report from BlockDriver. Offset can be any number wit=
hin
> >>> + * the zone size. No alignment for offset and len.
> >>
> >> What is the purpose of len? Is it the maximum number of zones to retur=
n
> >> in nr_zones[]?
> >
> > len is actually not used in bdrv_co_zone_report. It is needed by
> > blk_check_byte_request.
>
> There is no IO buffer being passed. Only an array of zone descriptors and
> an in-out number of zones. len is definitely not needed. Not sure what
> blk_check_byte_request() is intended to check though.

Can I just remove len argument and blk_check_byte_request() if it's not use=
d?

>
> >
> >> How does the caller know how many zones were returned?
> >
> > nr_zones represents IN maximum and OUT actual. The caller will know by
> > nr_zones which is changed in bdrv_co_zone_report. I'll add it in the
> > comments.
> >
> >>
> >>> + */
> >>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offse=
t,
> >>> +                       int64_t len, int64_t *nr_zones,
> >>> +                       BlockZoneDescriptor *zones)
> >>> +{
> >>> +    int ret;
> >>> +    BlockDriverState *bs;
> >>> +    IO_CODE();
> >>> +
> >>> +    blk_inc_in_flight(blk); /* increase before waiting */
> >>> +    blk_wait_while_drained(blk);
> >>> +    bs =3D blk_bs(blk);
> >>> +
> >>> +    ret =3D blk_check_byte_request(blk, offset, len);
> >>> +    if (ret < 0) {
> >>> +        return ret;
> >>> +    }
> >>> +
> >>> +    bdrv_inc_in_flight(bs);
> >>
> >> The bdrv_inc/dec_in_flight() call should be inside
> >> bdrv_co_zone_report(). See bdrv_co_ioctl() for an example.
> >>
> >>> +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len,
> >>> +                              nr_zones, zones);
> >>> +    bdrv_dec_in_flight(bs);
> >>> +    blk_dec_in_flight(blk);
> >>> +    return ret;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Return zone_mgmt from BlockDriver.
> >>
> >> Maybe this should be:
> >>
> >>   Send a zone management command.
> >
> > Yes, it's more accurate.
> >
> >>
> >>> @@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
> >>>              PreallocMode prealloc;
> >>>              Error **errp;
> >>>          } truncate;
> >>> +        struct {
> >>> +            int64_t *nr_zones;
> >>> +            BlockZoneDescriptor *zones;
> >>> +        } zone_report;
> >>> +        zone_op op;
> >>
> >> It's cleaner to put op inside a struct zone_mgmt so its purpose is
> >> self-explanatory:
> >>
> >>   struct {
> >>       zone_op op;
> >>   } zone_mgmt;
> >>
> >>> +static int handle_aiocb_zone_report(void *opaque) {
> >>> +    RawPosixAIOData *aiocb =3D opaque;
> >>> +    int fd =3D aiocb->aio_fildes;
> >>> +    int64_t *nr_zones =3D aiocb->zone_report.nr_zones;
> >>> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
> >>> +    int64_t offset =3D aiocb->aio_offset;
> >>> +    int64_t len =3D aiocb->aio_nbytes;
>
> Since you have the zone array and number of zones (size of that array) I
> really do not see why you need len.
>
> >>> +
> >>> +    struct blk_zone *blkz;
> >>> +    int64_t rep_size, nrz;
> >>> +    int ret, n =3D 0, i =3D 0;
> >>> +
> >>> +    nrz =3D *nr_zones;
> >>> +    if (len =3D=3D -1) {
> >>> +        return -errno;
> >>
> >> Where is errno set? Should this be an errno constant instead like
> >> -EINVAL?
> >
> > That's right! Noted.
> >
> >>
> >>> +    }
> >>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struc=
t blk_zone);
> >>> +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_zone=
_report, nrz);
> >>
> >> g_new() looks incorrect. There should be 1 struct blk_zone_report
> >> followed by nrz struct blk_zone structs. Please use g_malloc(rep_size)
> >> instead.
> >
> > Yes! However, it still has a memory leak error when using g_autofree
> > && g_malloc.
>
> That may be because you are changing the value of the rep pointer while
> parsing the report ?

I am not sure it is the case. Can you show me some way to find the problem?

Thanks for reviewing!


>
> >
> >>
> >>> +    offset =3D offset / 512; /* get the unit of the start sector: se=
ctor size is 512 bytes. */
> >>> +    printf("start to report zone with offset: 0x%lx\n", offset);
> >>> +
> >>> +    blkz =3D (struct blk_zone *)(rep + 1);
> >>> +    while (n < nrz) {
> >>> +        memset(rep, 0, rep_size);
> >>> +        rep->sector =3D offset;
> >>> +        rep->nr_zones =3D nrz;
> >>
> >> What prevents zones[] overflowing? nrz isn't being reduced in the loop=
,
> >> so maybe the rep->nr_zones return value will eventually exceed the
> >> number of elements still available in zones[n..]?
> >
> > I suppose the number of zones[] is restricted in the subsequent for
> > loop where zones[] copy one zone at a time as n increases. Even if
> > rep->zones exceeds the available room in zones[], the extra zone will
> > not be copied.
> >
> >>
> >>> +static int handle_aiocb_zone_mgmt(void *opaque) {
> >>> +    RawPosixAIOData *aiocb =3D opaque;
> >>> +    int fd =3D aiocb->aio_fildes;
> >>> +    int64_t offset =3D aiocb->aio_offset;
> >>> +    int64_t len =3D aiocb->aio_nbytes;
> >>> +    zone_op op =3D aiocb->op;
> >>> +
> >>> +    struct blk_zone_range range;
> >>> +    const char *ioctl_name;
> >>> +    unsigned long ioctl_op;
> >>> +    int64_t zone_size;
> >>> +    int64_t zone_size_mask;
> >>> +    int ret;
> >>> +
> >>> +    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
> >>
> >> Can this value be stored in bs (maybe in BlockLimits) to avoid calling
> >> ioctl(BLKGETZONESZ) each time?
> >
> > Yes, zone_size is in the zbd_dev field. I'll update BlockLimits after
> > I think through the configurations. In addition, it's a temporary
> > approach. It is substituted by get_sysfs_long_val now.
> >
> >>
> >>> +    if (ret) {
> >>> +        return -1;
> >>
> >> The return value should be a negative errno. -1 is -EPERM but it's
> >> probably not that error code you wanted. This should be:
> >>
> >>   return -errno;
> >>
> >>> +    }
> >>> +
> >>> +    zone_size_mask =3D zone_size - 1;
> >>> +    if (offset & zone_size_mask) {
> >>> +        error_report("offset is not the start of a zone");
> >>> +        return -1;
> >>
> >> return -EINVAL;
> >>
> >>> +    }
> >>> +
> >>> +    if (len & zone_size_mask) {
> >>> +        error_report("len is not aligned to zones");
> >>> +        return -1;
> >>
> >> return -EINVAL;
> >>
> >>> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int=
64_t offset,
> >>> +        int64_t len, int64_t *nr_zones,
> >>> +        BlockZoneDescriptor *zones) {
> >>> +    BDRVRawState *s =3D bs->opaque;
> >>> +    RawPosixAIOData acb;
> >>> +
> >>> +    acb =3D (RawPosixAIOData) {
> >>> +        .bs         =3D bs,
> >>> +        .aio_fildes =3D s->fd,
> >>> +        .aio_type   =3D QEMU_AIO_IOCTL,
> >>> +        .aio_offset =3D offset,
> >>> +        .aio_nbytes =3D len,
> >>> +        .zone_report    =3D {
> >>> +                .nr_zones       =3D nr_zones,
> >>> +                .zones          =3D zones,
> >>> +                },
> >>
> >> Indentation is off here. Please use 4-space indentation.
> > Noted!
> >
> > Thanks for reviewing!
> >
> > Sam
>
>
> --
> Damien Le Moal
> Western Digital Research

