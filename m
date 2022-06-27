Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2730755B86A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:03:26 +0200 (CEST)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jiP-0007pg-79
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5jQy-0001CM-8Z; Mon, 27 Jun 2022 03:45:24 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5jQv-0000qn-29; Mon, 27 Jun 2022 03:45:23 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3137316bb69so76724017b3.10; 
 Mon, 27 Jun 2022 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rQ7lQXQ925z1+AUfqD806f+osk+YMetITrFazGmSQ+c=;
 b=iDDbV/rlSzfLfGCQV1bOnO56sbWL7cgOBjeFANdyVEzr1eJaqHiHdDSReautIFDys6
 wUr/8QAu6/NY/WR24YICjBvDIrhBEsuYw6aIwi42cUdP1Qv5R8BAYFacOhuwbigpHQnb
 NUhAiJGqH3YLrN1lbUguZ1LOPNMFNxqB+VQOU8KlaMCkU9WxiItV5MTUaKqXkmPLiG72
 TcTdVNP0AA15eqWFMEQUtkG0uA3vjbuTKHwrNKAORZWxFVhmAchCnPUXiYe5sOpm3LMz
 9LMsgbvxFAqTIpc0883Hh422hz2njvwTzLhXS7pKDNmoiGuWDx7C0phpmo11HN5AMrTu
 e3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rQ7lQXQ925z1+AUfqD806f+osk+YMetITrFazGmSQ+c=;
 b=kPPESUgISPYSjhIpdeJtXX/UQHSDfCB1xWPyKSsTJMvzxjFxdFqrreydkrXdM4rao1
 2yGEREEekIGQFAAmYFAiG/RFz5yMHx+A3hKfLfTmZ4uzLHRMfc58q8mNNZYbAgxHzHC8
 +BqD67zWk4Pd8R+byK5YuC1uS93x7e5aFMDRSWO7b5xQaTfRjug3ehvehT2FjTwK8EcF
 YQfaGkkebxyW0xGoWu/OyXAKE2L5FgUCpPIt8awM2uX/UOOAXxci01mJgFIIF5xIxFBf
 0RIV/6OhaUJRmepCzMAXqT80zHGNExpakUk0Ul9Y05Tpok1zeQG0l5nvQF0fXWBR9vjN
 SN7A==
X-Gm-Message-State: AJIora/+rWyURgnqdFk2wzvRrKRH+NLB00410LcsV77y8jmjwYBARMI9
 POUyWNwF/bRPD7e64lsHhmngPmDcm9wcaJOu7vg=
X-Google-Smtp-Source: AGRyM1srDYsz+w6BcVMpkwb2hQArpEZCILzu1KwwibGnRnxENqX+j6KRTgZTKWG3DcNshFMNQFDeu7msBv/PGE+cVlM=
X-Received: by 2002:a81:1654:0:b0:317:8608:9f6b with SMTP id
 81-20020a811654000000b0031786089f6bmr13715263yww.267.1656315919343; Mon, 27
 Jun 2022 00:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <92651be0-a2d7-833d-0e9c-3b085427963b@suse.de>
In-Reply-To: <92651be0-a2d7-833d-0e9c-3b085427963b@suse.de>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 27 Jun 2022 15:45:19 +0800
Message-ID: <CAAAx-8+gXjg5zX_SprGnqVQumW1Ds6AdpgUCZ6+K_MVuEBo5kw@mail.gmail.com>
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
To: Hannes Reinecke <hare@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1131.google.com
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

Hi Hannes,

Hannes Reinecke <hare@suse.de> =E4=BA=8E2022=E5=B9=B46=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=B8=80 15:21=E5=86=99=E9=81=93=EF=BC=9A

>
> On 6/27/22 02:19, Sam Li wrote:
> > By adding zone management operations in BlockDriver, storage
> > controller emulation can use the new block layer APIs including
> > zone_report and zone_mgmt(open, close, finish, reset).
> > ---
> >   block/block-backend.c            |  56 ++++++++
> >   block/coroutines.h               |   5 +
> >   block/file-posix.c               | 238 ++++++++++++++++++++++++++++++=
+
> >   include/block/block-common.h     |  43 +++++-
> >   include/block/block_int-common.h |  20 +++
> >   5 files changed, 361 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index e0e1aff4b1..786f964d02 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
> >       return ret;
> >   }
> >
> > +/*
> > + * Return zone_report from BlockDriver. Offset can be any number withi=
n
> > + * the zone size. No alignment for offset and len.
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
> > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len,
> > +                              nr_zones, zones);
> > +    bdrv_dec_in_flight(bs);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> > +/*
> > + * Return zone_mgmt from BlockDriver.
> > + * Offset is the start of a zone and len is aligned to zones.
> > + */
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    BlockDriverState *bs;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +    bs =3D blk_bs(blk);
> > +
> > +    ret =3D blk_check_byte_request(blk, offset, len);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    bdrv_inc_in_flight(bs);
> > +    ret =3D bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
> > +    bdrv_dec_in_flight(bs);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >   void blk_drain(BlockBackend *blk)
> >   {
> >       BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/coroutines.h b/block/coroutines.h
> > index 830ecaa733..a114d7bc30 100644
> > --- a/block/coroutines.h
> > +++ b/block/coroutines.h
> > @@ -80,6 +80,11 @@ int coroutine_fn
> >   blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> >
> >   int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    int64_t len, int64_t *nr_zones,
> > +                                    BlockZoneDescriptor *zones);
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +        int64_t offset, int64_t len);
> >
> >
> >   /*
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 48cd096624..1b8b0d351f 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -67,6 +67,7 @@
> >   #include <sys/param.h>
> >   #include <sys/syscall.h>
> >   #include <sys/vfs.h>
> > +#include <linux/blkzoned.h>
> >   #include <linux/cdrom.h>
> >   #include <linux/fd.h>
> >   #include <linux/fs.h>
> > @@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
> >               PreallocMode prealloc;
> >               Error **errp;
> >           } truncate;
> > +        struct {
> > +            int64_t *nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report;
> > +        zone_op op;
> >       };
> >   } RawPosixAIOData;
> >
> > @@ -1801,6 +1807,135 @@ static off_t copy_file_range(int in_fd, off_t *=
in_off, int out_fd,
> >   }
> >   #endif
> >
> > +/*
> > + * parse_zone - Fill a zone descriptor
> > + */
> > +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> > +                              struct blk_zone *blkz) {
> > +    zone->start =3D blkz->start;
> > +    zone->length =3D blkz->len;
> > +    zone->cap =3D blkz->capacity;
> > +    zone->wp =3D blkz->wp - blkz->start;
> > +    zone->type =3D blkz->type;
> > +    zone->cond =3D blkz->cond;
> > +}
> > +
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
> > +    }
> > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct =
blk_zone);
> > +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_zone_r=
eport, nrz);
> > +    offset =3D offset / 512; /* get the unit of the start sector: sect=
or size is 512 bytes. */
> > +    printf("start to report zone with offset: 0x%lx\n", offset);
> > +
> > +    blkz =3D (struct blk_zone *)(rep + 1);
> > +    while (n < nrz) {
> > +        memset(rep, 0, rep_size);
> > +        rep->sector =3D offset;
> > +        rep->nr_zones =3D nrz;
> > +
> > +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
> > +        if (ret !=3D 0) {
> > +            ret =3D -errno;
> > +            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
> > +                         fd, offset, errno);
> > +            return ret;
> > +        }
> > +
> > +        if (!rep->nr_zones) {
> > +            break;
> > +        }
> > +
> > +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> > +            parse_zone(&zones[n], &blkz[i]);
> > +            /* The next report should start after the last zone report=
ed */
> > +            offset =3D blkz[i].start + blkz[i].len;
> > +        }
>
> Where do you increase 'n' such that the loop can make forward progress?
> Wouldn't it be better to use a for() loop here?
>
'n' increases in this for loop as 'i' increases. I think the for()
loop can serve the same purpose with some modifications.

> > +    }
> > +
> > +    *nr_zones =3D n;
> > +    return 0;
> > +}
> > +
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
>
> Shouldn't we add a check here if 'fd' points to a zoned device?
> ioctl errors are not _that_ helpful here, as you might get a variety
> of errors and it's not quite obvious which of those errors indicate
> an unsupported feature.
>
Yes, I'll add it in the next patch.

> > +    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
> > +    if (ret) {
> > +        return -1;
> > +    }
> > +
> > +    zone_size_mask =3D zone_size - 1;
> > +    if (offset & zone_size_mask) {
> > +        error_report("offset is not the start of a zone");
> > +        return -1;
> > +    }
> > +
> > +    if (len & zone_size_mask) {
> > +        error_report("len is not aligned to zones");
> > +        return -1;
> > +    }
> > +
> > +    switch (op) {
> > +    case zone_open:
> > +        ioctl_name =3D "BLKOPENZONE";
> > +        ioctl_op =3D BLKOPENZONE;
> > +        break;
> > +    case zone_close:
> > +        ioctl_name =3D "BLKCLOSEZONE";
> > +        ioctl_op =3D BLKCLOSEZONE;
> > +        break;
> > +    case zone_finish:
> > +        ioctl_name =3D "BLKFINISHZONE";
> > +        ioctl_op =3D BLKFINISHZONE;
> > +        break;
> > +    case zone_reset:
> > +        ioctl_name =3D "BLKRESETZONE";
> > +        ioctl_op =3D BLKRESETZONE;
> > +        break;
> > +    default:
> > +        error_report("Invalid zone operation 0x%x", op);
> > +        errno =3D -EINVAL;
> > +        return -1;
> > +    }
> > +
> > +    /* Execute the operation */
> > +    range.sector =3D offset;
> > +    range.nr_sectors =3D len;
> > +    ret =3D ioctl(fd, ioctl_op, &range);
> > +    if (ret !=3D 0) {
> > +        error_report("ioctl %s failed %d",
> > +                     ioctl_name, errno);
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static int handle_aiocb_copy_range(void *opaque)
> >   {
> >       RawPosixAIOData *aiocb =3D opaque;
> > @@ -2973,6 +3108,58 @@ static void raw_account_discard(BDRVRawState *s,=
 uint64_t nbytes, int ret)
> >       }
> >   }
> >
> > +/*
> > + * zone report - Get a zone block device's information in the form
> > + * of an array of zone descriptors.
> > + *
> > + * @param bs: passing zone block device file descriptor
> > + * @param zones: an array of zone descriptors to hold zone
> > + * information on reply
> > + * @param offset: offset can be any byte within the zone size.
> > + * @param len: (not sure yet.
> > + * @return 0 on success, -1 on failure
> > + */
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
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> > +}
> > +
> > +/*
> > + * zone management operations - Execute an operation on a zone
> > + */
> > +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, zone_op=
 op,
> > +        int64_t offset, int64_t len) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs             =3D bs,
> > +        .aio_fildes     =3D s->fd,
> > +        .aio_type       =3D QEMU_AIO_IOCTL,
> > +        .aio_offset     =3D offset,
> > +        .aio_nbytes     =3D len,
> > +        .op             =3D op,
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> > +}
> > +
> >   static coroutine_fn int
> >   raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >                   bool blkdev)
> > @@ -3324,6 +3511,9 @@ BlockDriver bdrv_file =3D {
> >       .bdrv_abort_perm_update =3D raw_abort_perm_update,
> >       .create_opts =3D &raw_create_opts,
> >       .mutable_opts =3D mutable_opts,
> > +
> > +    .bdrv_co_zone_report =3D raw_co_zone_report,
> > +    .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> >   };
> >
> >   /***********************************************/
> > @@ -3703,6 +3893,53 @@ static BlockDriver bdrv_host_device =3D {
> >   #endif
> >   };
> >
> > +static BlockDriver bdrv_zoned_host_device =3D {
> > +        .format_name =3D "zoned_host_device",
> > +        .protocol_name =3D "zoned_host_device",
> > +        .instance_size =3D sizeof(BDRVRawState),
> > +        .bdrv_needs_filename =3D true,
> > +        .bdrv_probe_device  =3D hdev_probe_device,
> > +        .bdrv_parse_filename =3D hdev_parse_filename,
> > +        .bdrv_file_open     =3D hdev_open,
> > +        .bdrv_close         =3D raw_close,
> > +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
> > +        .bdrv_reopen_commit  =3D raw_reopen_commit,
> > +        .bdrv_reopen_abort   =3D raw_reopen_abort,
> > +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
> > +        .create_opts         =3D &bdrv_create_opts_simple,
> > +        .mutable_opts        =3D mutable_opts,
> > +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
> > +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
> > +
> > +        .bdrv_co_preadv         =3D raw_co_preadv,
> > +        .bdrv_co_pwritev        =3D raw_co_pwritev,
> > +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> > +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
> > +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> > +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> > +        .bdrv_refresh_limits =3D raw_refresh_limits,
> > +        .bdrv_io_plug =3D raw_aio_plug,
> > +        .bdrv_io_unplug =3D raw_aio_unplug,
> > +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > +
> > +        .bdrv_co_truncate       =3D raw_co_truncate,
> > +        .bdrv_getlength =3D raw_getlength,
> > +        .bdrv_get_info =3D raw_get_info,
> > +        .bdrv_get_allocated_file_size
> > +                            =3D raw_get_allocated_file_size,
> > +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
> > +        .bdrv_check_perm =3D raw_check_perm,
> > +        .bdrv_set_perm   =3D raw_set_perm,
> > +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
> > +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
> > +        .bdrv_probe_geometry =3D hdev_probe_geometry,
> > +        .bdrv_co_ioctl =3D hdev_co_ioctl,
> > +
> > +        /* zone management operations */
> > +        .bdrv_co_zone_report =3D raw_co_zone_report,
> > +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +};
> > +
> >   #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_k=
ernel__)
> >   static void cdrom_parse_filename(const char *filename, QDict *options=
,
> >                                    Error **errp)
> > @@ -3964,6 +4201,7 @@ static void bdrv_file_init(void)
> >   #if defined(HAVE_HOST_BLOCK_DEVICE)
> >       bdrv_register(&bdrv_host_device);
> >   #ifdef __linux__
> > +    bdrv_register(&bdrv_zoned_host_device);
> >       bdrv_register(&bdrv_host_cdrom);
> >   #endif
> >   #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index fdb7306e78..78cddeeda5 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -23,7 +23,6 @@
> >    */
> >   #ifndef BLOCK_COMMON_H
> >   #define BLOCK_COMMON_H
> > -
> >   #include "block/aio.h"
> >   #include "block/aio-wait.h"
> >   #include "qemu/iov.h"
> > @@ -49,6 +48,48 @@ typedef struct BlockDriver BlockDriver;
> >   typedef struct BdrvChild BdrvChild;
> >   typedef struct BdrvChildClass BdrvChildClass;
> >
> > +typedef enum zone_op {
> > +    zone_open,
> > +    zone_close,
> > +    zone_finish,
> > +    zone_reset,
> > +} zone_op;
> > +
> > +typedef enum zone_model {
> > +    BLK_Z_HM,
> > +    BLK_Z_HA,
> > +} zone_model;
> > +
> > +typedef enum BlkZoneCondition {
> > +    BLK_ZS_NOT_WP =3D 0x0,
> > +    BLK_ZS_EMPTY =3D 0x1,
> > +    BLK_ZS_IOPEN =3D 0x2,
> > +    BLK_ZS_EOPEN =3D 0x3,
> > +    BLK_ZS_CLOSED =3D 0x4,
> > +    BLK_ZS_RDONLY =3D 0xD,
> > +    BLK_ZS_FULL =3D 0xE,
> > +    BLK_ZS_OFFLINE =3D 0xF,
> > +} BlkZoneCondition;
> > +
> > +typedef enum BlkZoneType {
> > +    BLK_ZT_CONV =3D 0x1,
> > +    BLK_ZT_SWR =3D 0x2,
> > +    BLK_ZT_SWP =3D 0x3,
> > +} BlkZoneType;
> > +
> > +/*
> > + * Zone descriptor data structure.
> > + * Provide information on a zone with all position and size values in =
bytes.
> > + */
> > +typedef struct BlockZoneDescriptor {
> > +    uint64_t start;
> > +    uint64_t length;
> > +    uint64_t cap;
> > +    uint64_t wp;
> > +    BlkZoneType type;
> > +    BlkZoneCondition cond;
> > +} BlockZoneDescriptor;
> > +
> >   typedef struct BlockDriverInfo {
> >       /* in bytes, 0 if irrelevant */
> >       int cluster_size;
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 8947abab76..b9ea9db6dc 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -94,6 +94,20 @@ typedef struct BdrvTrackedRequest {
> >       struct BdrvTrackedRequest *waiting_for;
> >   } BdrvTrackedRequest;
> >
> > +/**
> > + * Zone device information data structure.
> > + * Provide information on a device.
> > + */
> > +typedef struct zbd_dev {
> > +    uint32_t zone_size;
> > +    zone_model model;
> > +    uint32_t block_size;
> > +    uint32_t write_granularity;
> > +    uint32_t nr_zones;
> > +    struct BlockZoneDescriptor *zones; /* array of zones */
> > +    uint32_t max_nr_open_zones; /* maximum number of explicitly open z=
ones */
> > +    uint32_t max_nr_active_zones;
> > +} zbd_dev;
> >
> >   struct BlockDriver {
> >       /*
> > @@ -691,6 +705,12 @@ struct BlockDriver {
> >                                             QEMUIOVector *qiov,
> >                                             int64_t pos);
> >
> > +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> > +            int64_t offset, int64_t len, int64_t *nr_zones,
> > +            BlockZoneDescriptor *zones);
> > +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum z=
one_op op,
> > +            int64_t offset, int64_t len);
> > +
> >       /* removable device specific */
> >       bool (*bdrv_is_inserted)(BlockDriverState *bs);
> >       void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
>
> Other than that: Well done!
>
Thanks for reviewing!

Have a good day!
Sam
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                        Kernel Storage Architect
> hare@suse.de                                      +49 911 74053 688
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: Felix Imend=C3=B6rffer

