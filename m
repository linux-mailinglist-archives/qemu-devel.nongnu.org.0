Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A393B5B4CAD
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 10:41:18 +0200 (CEST)
Received: from localhost ([::1]:35956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXIWj-0006e1-E0
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 04:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXIUP-0004vD-A2; Sun, 11 Sep 2022 04:38:53 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:37527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXIUN-0004VZ-6e; Sun, 11 Sep 2022 04:38:52 -0400
Received: by mail-vs1-xe29.google.com with SMTP id u189so6035415vsb.4;
 Sun, 11 Sep 2022 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=CHIY56wcSIvrys68deLPuk17Sm5nwHMv9CmJvNbwWR4=;
 b=fNr/4gekHsfmHAM7kvnscuMHh76tyWyMXjJGcuNPD11wMlDC+kt0yqQjIG6NHbxqqC
 Y2bFL5LA1bQCmliRDGzo2zlUCmT0OBV1HillS1fIl2no4OhOAT8wJwL0KU5PYv5g15Sg
 5ZqzyVqGAT6Y22qdiUC//fNWEcLhzInVAvfr6wI7eBOdHdiTrl/oOJGpribAtOaie/7P
 OBQsHzOGR8NjUuJHLFhZnd4AwlR5RAZduinTAIzvzlSQ3jzxmrYyLnrS6bhW/wzMcnPQ
 zdeTLqEHPh2juvCJdglZ0O7d75h4Ms7q5H50AzFbjsYEONOApyKAg6jjk3jNWnEcDw08
 zt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CHIY56wcSIvrys68deLPuk17Sm5nwHMv9CmJvNbwWR4=;
 b=Gm4KxO33p4UiFd+ZuTjoujuMuUXYxwGZXWO9cENVZwvx/rMAxZlzdp+y4N/pTd4j//
 7j323BrWNAb1Po+qgTV3soYsyOYHECqEqQAvGZpHUQ27tDVjiJBkBhuXqmKl1ZoEeZbA
 gzcA2B8m6yc+migAlB0To+CMGqsJOxIQLWpF/vl0T3VWdmJP6pOsecRKk3z8mW7iygHA
 OKjcXY8Rj7i8hcFqEYS3SfqTaUgCFWM8V3DFmUDPHOWcECP//UX5rTibP+48OdMeF0I7
 YIU6QxJAg5wCXqggkNcswTqTUv2xAjycm5/ihNzwnoGtqEQ6sM1xZhd19Istrdht8F1I
 MMXQ==
X-Gm-Message-State: ACgBeo3vIapl2kVoTDfbpukey94OMiDwycjSzUrZ/aoCrM6OMaChgm6Y
 T9vCpyLWKqUSD+Eqh/wkvTCnvI6Ag/YtQHz7ZYc=
X-Google-Smtp-Source: AA6agR6F1TUFtCAwgOzrL6V0yGHWnxoKNtvHqIJye7M7hDRg/4FGoHgoxFqiZ8K7JELNxwyEsuS2IQNQWvZmINeZ9+8=
X-Received: by 2002:a05:6102:3c9d:b0:398:7d74:157e with SMTP id
 c29-20020a0561023c9d00b003987d74157emr518503vsv.71.1662885529865; Sun, 11 Sep
 2022 01:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220910063836.31295-1-faithilikerun@gmail.com>
 <9665c8b0-b291-7a42-8242-73a7c0967917@opensource.wdc.com>
 <CAAAx-8KUHoW4Apr1u9urRyVnKmp1Qo2kMKWP2+iRui4jtYj9LA@mail.gmail.com>
 <a0d5fe49-8290-72ca-3999-fd8701f94d15@opensource.wdc.com>
In-Reply-To: <a0d5fe49-8290-72ca-3999-fd8701f94d15@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sun, 11 Sep 2022 16:39:02 +0800
Message-ID: <CAAAx-8L9TsxvUxE8dxLZg+be2P_AneW_KDUHCf2H-iu_Q27vUA@mail.gmail.com>
Subject: Re: [PATCH] block: introduce zone append write for zoned devices
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe29.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B49=
=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 16:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/09/11 17:00, Sam Li wrote:
> [...]
> >>> @@ -1604,6 +1629,12 @@ static ssize_t handle_aiocb_rw_linear(RawPosix=
AIOData *aiocb, char *buf)
> >>>                           (const char *)buf + offset,
> >>>                           aiocb->aio_nbytes - offset,
> >>>                           aiocb->aio_offset + offset);
> >>> +        } else if (aiocb->aio_type =3D=3D QEMU_AIO_ZONE_APPEND) {
> >>> +            uint64_t wp =3D aiocb->aio_offset;
> >>
> >> This variable is not necessary.
> >>
> >>> +            len =3D pwrite(aiocb->aio_fildes,
> >>> +                         (const char *)buf + offset,
> >>> +                         aiocb->aio_nbytes - offset,
> >>> +                         wp + offset);
> >>>          } else {
> >>>              len =3D pread(aiocb->aio_fildes,
> >>>                          buf + offset,
> >>> @@ -1638,7 +1669,6 @@ static int handle_aiocb_rw(void *opaque)
> >>>      RawPosixAIOData *aiocb =3D opaque;
> >>>      ssize_t nbytes;
> >>>      char *buf;
> >>> -
> >>
> >> whiteline change.
> >>
> >>>      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
> >>>          /*
> >>>           * If there is just a single buffer, and it is properly alig=
ned
> >>> @@ -1692,7 +1722,7 @@ static int handle_aiocb_rw(void *opaque)
> >>>      }
> >>>
> >>>      nbytes =3D handle_aiocb_rw_linear(aiocb, buf);
> >>> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> >>> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))=
) {
> >>>          char *p =3D buf;
> >>>          size_t count =3D aiocb->aio_nbytes, copy;
> >>>          int i;
> >>> @@ -1713,6 +1743,25 @@ static int handle_aiocb_rw(void *opaque)
> >>>
> >>>  out:
> >>>      if (nbytes =3D=3D aiocb->aio_nbytes) {
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND=
)) {
> >>> +            BlockZoneDescriptor *zone =3D aiocb->io.zone;
> >>> +            int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> >>> +            if (zone) {
> >>> +                qemu_mutex_init(&zone->lock);
> >>> +                if (zone->type =3D=3D BLK_ZT_SWR) {
> >>> +                    qemu_mutex_lock(&zone->lock);
> >>> +                    zone->wp +=3D nr_sectors;
> >>> +                    qemu_mutex_unlock(&zone->lock);
> >>> +                }
> >>> +                qemu_mutex_destroy(&zone->lock);
> >>
> >> This is weird. you init the mutex, lock/unlock it and destroy it. So i=
t has
> >> absolutely no meaning at all.
> >
> > I was thinking that init every lock for all the zones or init the lock
> > for the zone that needed it. The confusion I have here is the cost of
> > initializing/destroying the lock.
>
> A mutex needs to be initialized before it is used and should not be
> re-initialized, ever, until it is not needed anymore. That is, in this ca=
se,
> since the mutex protects a zone wp tracking entry, it should be initializ=
ed when
> the array of zone wp is allocated & initialized with a zone report, and t=
he
> mutex destroyed when that same array is freed.
>
> The cost of initializing & destroying a mutex is low. And since that is n=
ot done
> in the hot IO path, you do not need to worry about it.

I see, thanks!

>
> [...]
> >>> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> >>> +                                           int64_t *offset,
> >>> +                                           QEMUIOVector *qiov,
> >>> +                                           BdrvRequestFlags flags) {
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +    BDRVRawState *s =3D bs->opaque;
> >>> +    int64_t zone_sector =3D bs->bl.zone_sectors;
> >>> +    int64_t zone_sector_mask =3D zone_sector - 1;
> >>> +    int64_t iov_len =3D 0;
> >>> +    int64_t len =3D 0;
> >>> +    RawPosixAIOData acb;
> >>> +
> >>> +    if (*offset & zone_sector_mask) {
> >>> +        error_report("offset %" PRId64 " is not aligned to zone size=
 "
> >>> +                     "%" PRId64 "", *offset, zone_sector);
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    int64_t lbsz =3D bs->bl.logical_block_size;> +    int64_t lbsz_m=
ask =3D lbsz - 1;
> >>> +    for (int i =3D 0; i < qiov->niov; i++) {
> >>> +       iov_len =3D qiov->iov[i].iov_len;
> >>> +       if (iov_len & lbsz_mask) {
> >>> +           error_report("len of IOVector[%d] %" PRId64 " is not alig=
ned to block "
> >>> +                        "size %" PRId64 "", i, iov_len, lbsz);
> >>> +           return -EINVAL;
> >>> +       }
> >>
> >> This alignment check should be against the device write granularity, n=
ot the
> >> logical block size. The write granularity will always be equal to the =
device
> >> physical block size, which may or may not be equal to the device logic=
al block
> >> size. E.g. a 512e SMR disk has a 512B logical block size but a 4096B p=
hysical
> >> block size. And the ZBC & ZAC specifications mandate that all write be=
 aligned
> >> to the physical block size.
> >
> > I see. I'll change it to physical block size.
>
> I would use a filed called "write_granularity" since the virtio specs wil=
l
> introduce that anyway. This zone granularity is going to be indeed equal =
to the
> physical block size of the host device for now.
>
> [...]
> >>>      /* removable device specific */
> >>>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> >>> @@ -854,6 +857,12 @@ typedef struct BlockLimits {
> >>>
> >>>      /* maximum number of active zones */
> >>>      int64_t max_active_zones;
> >>> +
> >>> +    /* array of zones in the zoned block device. Only tracks write p=
ointer's
> >>> +     * location of each zone as a helper for zone_append API */
> >>> +    BlockZoneDescriptor *zones;
> >>
> >> This is a lot of memory for only tracking the wp... Why not reduce thi=
s to an
> >> array of int64 values, for the wp only ? As you may need the zone type=
 too
> >> (conventional vs sequential), you can use the most significant bit (a =
zone wp
> >> value will never use all 64 bits !).
> >>
> >> Or device another zone structure with zone type, zone wp and mutex onl=
y, so
> >> smaller than the regular zone report structure.
> >
> > I was just trying to reuse do_zone_report. It is better to only track
> > the wp only. Then a new struct and smaller zone_report should be
> > introduced for it.
>
> Yes, this will use less memory, which is always good.
>
> --
> Damien Le Moal
> Western Digital Research
>

