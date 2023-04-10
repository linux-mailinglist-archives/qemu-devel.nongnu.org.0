Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562E6DC75D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:43:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrnA-0000xZ-UJ; Mon, 10 Apr 2023 09:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1plrn8-0000xC-Uo; Mon, 10 Apr 2023 09:42:42 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1plrn6-00020c-JF; Mon, 10 Apr 2023 09:42:42 -0400
Received: by mail-ej1-x630.google.com with SMTP id qb20so12128388ejc.6;
 Mon, 10 Apr 2023 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681134158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/iyzZ+TbTS/Zy7IvqloiOoWHq27HvO/a5swTV3C5TU=;
 b=YFOouRDqZFcYQ8fWu0aAeutixMXzlVzhSjio3PD3B3NsH4Of5rivH1vWZAvKgBp+/2
 IVszu/X+UQWdW981HK/Lh4bZuGMcmhTrcBl6vTbsGXplZ/lzOS3ku872NI6XgZM30FQm
 TGTaMQOWVv7pGOAClQbTRVSURNMh2CHYBQR8DJbDOgTkG3m+oI0itBv2bURBGV5PDFWr
 LEnsWsFQDIcyLLGIKsDLvLA3tY5vxVDzM+ElWW5utyhY8bjMhZ2HYsAuc1jqMXUKb3y9
 5l6IOxngPqt7Jl1WP8SLI+A+OlKtTNwD6D96TBgbFgjeIRztKjmpk0H/N+R+jETHDKXE
 ppxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681134158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/iyzZ+TbTS/Zy7IvqloiOoWHq27HvO/a5swTV3C5TU=;
 b=n3wjG6NFxABHQvGzr2/YU69MieOZQ/NXMwFpSVkHmz39nnFKE2BuN9UAa7LajJlWdp
 LxQw44LqTkcvxrDqe9n5ZV4kWZjx1SS+8ZScZH3dY8LPNuIj/msvZw2POqHpGwiPCQBf
 B5tJ+ObcKBULEyO1JMsT2GaSGEUlk8zU7/w9G94Udy2tGHKx4MECjM9XtPEdOVHIZN9K
 hmLwzdhJz4WjiYhJqCjw9xVsQgTxCj1qFjM2RtTSLmpvdu8O1j2gf7pMCvlK+unMawi4
 95OL81Z//Sj4Y5Dg9hN/zCKNdhF7mQucEeZYjNyXWGliWqjMG+yD2jJRjpknW5yVwChF
 puIQ==
X-Gm-Message-State: AAQBX9cJS8IXKOxH+n3U2pIXqhS1p5Dpaa1BT2iLZe7ytpqY69WOZbkf
 LEPxPRoQbl2MARJuAYeErAUAvHKOWD5fUChQTmA=
X-Google-Smtp-Source: AKy350Yt94QHgQ82Ykkqpe3YDeCqwjNpQhuX6eU9iyGIqC7sXDZ+CDEuxTIvT8G8lIMKddQpIbS9XKYmd73DROU+X1s=
X-Received: by 2002:a17:906:24d3:b0:94a:9be7:96d0 with SMTP id
 f19-20020a17090624d300b0094a9be796d0mr1098527ejb.7.1681134157875; Mon, 10 Apr
 2023 06:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230407081657.17947-1-faithilikerun@gmail.com>
 <20230407081657.17947-2-faithilikerun@gmail.com>
 <20230410130444.GB888305@fedora>
In-Reply-To: <20230410130444.GB888305@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 10 Apr 2023 21:42:11 +0800
Message-ID: <CAAAx-8KmPFJXR19g+57a06+LggH2HPMJXe3tDVTaNAQvfeZJKg@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] file-posix: add tracking of the zone write pointers
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com, 
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Julia Suvorova <jusual@redhat.com>, damien.lemoal@opensource.wdc.com, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=faithilikerun@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=B8=80 21:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Apr 07, 2023 at 04:16:54PM +0800, Sam Li wrote:
> > Since Linux doesn't have a user API to issue zone append operations to
> > zoned devices from user space, the file-posix driver is modified to add
> > zone append emulation using regular writes. To do this, the file-posix
> > driver tracks the wp location of all zones of the device. It uses an
> > array of uint64_t. The most significant bit of each wp location indicat=
es
> > if the zone type is conventional zones.
> >
> > The zones wp can be changed due to the following operations issued:
> > - zone reset: change the wp to the start offset of that zone
> > - zone finish: change to the end location of that zone
> > - write to a zone
> > - zone append
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/file-posix.c               | 173 ++++++++++++++++++++++++++++++-
> >  include/block/block-common.h     |  14 +++
> >  include/block/block_int-common.h |   5 +
> >  3 files changed, 189 insertions(+), 3 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 65efe5147e..e7957f5559 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1324,6 +1324,90 @@ static int hdev_get_max_segments(int fd, struct =
stat *st)
> >  #endif
> >  }
> >
> > +#if defined(CONFIG_BLKZONED)
> > +/*
> > + * If the reset_all flag is true, then the wps of zone whose state is
> > + * not readonly or offline should be all reset to the start sector.
> > + * Else, take the real wp of the device.
> > + */
> > +static int get_zones_wp(BlockDriverState *bs, int fd, int64_t offset,
> > +                        unsigned int nrz, bool reset_all)
> > +{
> > +    struct blk_zone *blkz;
> > +    size_t rep_size;
> > +    uint64_t sector =3D offset >> BDRV_SECTOR_BITS;
> > +    BlockZoneWps *wps =3D bs->wps;
> > +    int j =3D offset / bs->bl.zone_size;
> > +    int ret, n =3D 0, i =3D 0;
>
> I would feel more comfortable if i, j, and n were unsigned int like nrz.
> That way we don't need to worry about negative array indices when int
> wraps to INT_MIN.
>
> In practice we'll probably hit scalability problems before nrz becomes
> greater than INT_MAX. Also, such devices probably don't exist. A 5 TB
> drive with 256 MB zones only has 20,480 zones.
>
> So for now I think you can keep the code the way it is.
>
> > +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct =
blk_zone);
> > +    g_autofree struct blk_zone_report *rep =3D NULL;
> > +
> > +    rep =3D g_malloc(rep_size);
> > +    blkz =3D (struct blk_zone *)(rep + 1);
> > +    while (n < nrz) {
> > +        memset(rep, 0, rep_size);
> > +        rep->sector =3D sector;
> > +        rep->nr_zones =3D nrz - n;
> > +
> > +        do {
> > +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
> > +        } while (ret !=3D 0 && errno =3D=3D EINTR);
> > +        if (ret !=3D 0) {
> > +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " faile=
d %d",
> > +                    fd, offset, errno);
> > +            return -errno;
> > +        }
> > +
> > +        if (!rep->nr_zones) {
> > +            break;
> > +        }
> > +
> > +        for (i =3D 0; i < rep->nr_zones; ++i, ++n, ++j) {
> > +            /*
> > +             * The wp tracking cares only about sequential writes requ=
ired and
> > +             * sequential write preferred zones so that the wp can adv=
ance to
> > +             * the right location.
> > +             * Use the most significant bit of the wp location to indi=
cate the
> > +             * zone type: 0 for SWR/SWP zones and 1 for conventional z=
ones.
> > +             */
> > +            if (blkz[i].type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
> > +                wps->wp[j] |=3D 1ULL << 63;
> > +            } else {
> > +                switch(blkz[i].cond) {
> > +                case BLK_ZONE_COND_FULL:
> > +                case BLK_ZONE_COND_READONLY:
> > +                    /* Zone not writable */
> > +                    wps->wp[j] =3D (blkz[i].start + blkz[i].len) << BD=
RV_SECTOR_BITS;
> > +                    break;
> > +                case BLK_ZONE_COND_OFFLINE:
> > +                    /* Zone not writable nor readable */
> > +                    wps->wp[j] =3D (blkz[i].start) << BDRV_SECTOR_BITS=
;
> > +                    break;
> > +                default:
> > +                    if (reset_all) {
> > +                        wps->wp[j] =3D blkz[i].start << BDRV_SECTOR_BI=
TS;
> > +                    } else {
> > +                        wps->wp[j] =3D blkz[i].wp << BDRV_SECTOR_BITS;
> > +                    }
> > +                    break;
> > +                }
> > +            }
> > +        }
> > +        sector =3D blkz[i - 1].start + blkz[i - 1].len;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void update_zones_wp(BlockDriverState *bs, int fd, int64_t offs=
et,
> > +                            unsigned int nrz)
> > +{
> > +    if (get_zones_wp(bs, fd, offset, nrz, 0) < 0) {
> > +        error_report("update zone wp failed");
> > +    }
> > +}
> > +#endif
> > +
> >  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> > @@ -1413,6 +1497,23 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)
> >          if (ret >=3D 0) {
> >              bs->bl.max_active_zones =3D ret;
> >          }
> > +
> > +        ret =3D get_sysfs_long_val(&st, "physical_block_size");
> > +        if (ret >=3D 0) {
> > +            bs->bl.write_granularity =3D ret;
> > +        }
> > +
> > +        /* The refresh_limits() function can be called multiple times.=
 */
> > +        g_free(bs->wps);
> > +        bs->wps =3D g_malloc(sizeof(BlockZoneWps) +
> > +                sizeof(int64_t) * bs->bl.nr_zones);
> > +        ret =3D get_zones_wp(bs, s->fd, 0, bs->bl.nr_zones, 0);
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret, "report wps failed");
> > +            bs->wps =3D NULL;
> > +            return;
> > +        }
> > +        qemu_co_mutex_init(&bs->wps->colock);
>
> I suggest moving qemu_co_mutex_init() to raw_open_common() in the future
> to eliminate the assumption that raw_refresh_limits() is called before
> other functions that use colock. But there is no need to resend the
> patch series.

Ok, I see. This can be done in the future. Thanks!

>
> >          return;
> >      }
> >  out:
> > @@ -2338,9 +2439,15 @@ static int coroutine_fn raw_co_prw(BlockDriverSt=
ate *bs, uint64_t offset,
> >  {
> >      BDRVRawState *s =3D bs->opaque;
> >      RawPosixAIOData acb;
> > +    int ret;
> >
> >      if (fd_open(bs) < 0)
> >          return -EIO;
> > +#if defined(CONFIG_BLKZONED)
> > +    if (type & QEMU_AIO_WRITE && bs->wps) {
> > +        qemu_co_mutex_lock(&bs->wps->colock);
> > +    }
> > +#endif
> >
> >      /*
> >       * When using O_DIRECT, the request must be aligned to be able to =
use
> > @@ -2354,14 +2461,16 @@ static int coroutine_fn raw_co_prw(BlockDriverS=
tate *bs, uint64_t offset,
> >      } else if (s->use_linux_io_uring) {
> >          LuringState *aio =3D aio_get_linux_io_uring(bdrv_get_aio_conte=
xt(bs));
> >          assert(qiov->size =3D=3D bytes);
> > -        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> > +        ret =3D luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> > +        goto out;
> >  #endif
> >  #ifdef CONFIG_LINUX_AIO
> >      } else if (s->use_linux_aio) {
> >          LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_context(=
bs));
> >          assert(qiov->size =3D=3D bytes);
> > -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> > +        ret =3D laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> >                                s->aio_max_batch);
> > +        goto out;
> >  #endif
> >      }
> >
> > @@ -2378,7 +2487,32 @@ static int coroutine_fn raw_co_prw(BlockDriverSt=
ate *bs, uint64_t offset,
> >      };
> >
> >      assert(qiov->size =3D=3D bytes);
> > -    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> > +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> > +
> > +out:
> > +#if defined(CONFIG_BLKZONED)
> > +    BlockZoneWps *wps =3D bs->wps;
> > +    if (ret =3D=3D 0) {
> > +        if (type & QEMU_AIO_WRITE && wps && bs->bl.zone_size) {
> > +            uint64_t *wp =3D &wps->wp[offset / bs->bl.zone_size];
> > +            if (!BDRV_ZT_IS_CONV(*wp)) {
> > +                /* Advance the wp if needed */
> > +                if (offset + bytes > *wp) {
> > +                    *wp =3D offset + bytes;
> > +                }
> > +            }
> > +        }
> > +    } else {
> > +        if (type & QEMU_AIO_WRITE) {
> > +            update_zones_wp(bs, s->fd, 0, 1);
> > +        }
> > +    }
> > +
> > +    if (type & QEMU_AIO_WRITE && wps) {
> > +        qemu_co_mutex_unlock(&wps->colock);
> > +    }
> > +#endif
> > +    return ret;
> >  }
> >
> >  static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t of=
fset,
> > @@ -2486,6 +2620,9 @@ static void raw_close(BlockDriverState *bs)
> >      BDRVRawState *s =3D bs->opaque;
> >
> >      if (s->fd >=3D 0) {
> > +#if defined(CONFIG_BLKZONED)
> > +        g_free(bs->wps);
> > +#endif
> >          qemu_close(s->fd);
> >          s->fd =3D -1;
> >      }
> > @@ -3283,6 +3420,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDri=
verState *bs, BlockZoneOp op,
> >      const char *op_name;
> >      unsigned long zo;
> >      int ret;
> > +    BlockZoneWps *wps =3D bs->wps;
> >      int64_t capacity =3D bs->total_sectors << BDRV_SECTOR_BITS;
> >
> >      zone_size =3D bs->bl.zone_size;
> > @@ -3300,6 +3438,15 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDr=
iverState *bs, BlockZoneOp op,
> >          return -EINVAL;
> >      }
> >
> > +    QEMU_LOCK_GUARD(&wps->colock);
> > +    uint32_t i =3D offset / bs->bl.zone_size;
> > +    uint32_t nrz =3D len / bs->bl.zone_size;
> > +    uint64_t *wp =3D &wps->wp[i];
> > +    if (BDRV_ZT_IS_CONV(*wp) && len !=3D capacity) {
> > +        error_report("zone mgmt operations are not allowed for convent=
ional zones");
> > +        return -EIO;
> > +    }
> > +
> >      switch (op) {
> >      case BLK_ZO_OPEN:
> >          op_name =3D "BLKOPENZONE";
> > @@ -3337,8 +3484,28 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDr=
iverState *bs, BlockZoneOp op,
> >                          len >> BDRV_SECTOR_BITS);
> >      ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> >      if (ret !=3D 0) {
> > +        update_zones_wp(bs, s->fd, offset, i);
> >          ret =3D -errno;
> >          error_report("ioctl %s failed %d", op_name, ret);
> > +        return ret;
> > +    }
> > +
> > +    if (zo =3D=3D BLKRESETZONE && len =3D=3D capacity) {
> > +        ret =3D get_zones_wp(bs, s->fd, 0, bs->bl.nr_zones, 1);
> > +        if (ret < 0) {
> > +            error_report("reporting single wp failed");
> > +            return ret;
> > +        }
> > +    } else if (zo =3D=3D BLKRESETZONE) {
> > +        for (int j =3D 0; j < nrz; ++j) {
> > +            wp[j] =3D offset + j * zone_size;
> > +        }
> > +    } else if (zo =3D=3D BLKFINISHZONE) {
> > +        for (int j =3D 0; j < nrz; ++j) {
> > +            /* The zoned device allows the last zone smaller that the
> > +             * zone size. */
> > +            wp[j] =3D MIN(offset + (j + 1) * zone_size, offset + len);
> > +        }
> >      }
> >
> >      return ret;
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index 1576fcf2ed..93196229ac 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -118,6 +118,14 @@ typedef struct BlockZoneDescriptor {
> >      BlockZoneState state;
> >  } BlockZoneDescriptor;
> >
> > +/*
> > + * Track write pointers of a zone in bytes.
> > + */
> > +typedef struct BlockZoneWps {
> > +    CoMutex colock;
> > +    uint64_t wp[];
> > +} BlockZoneWps;
> > +
> >  typedef struct BlockDriverInfo {
> >      /* in bytes, 0 if irrelevant */
> >      int cluster_size;
> > @@ -240,6 +248,12 @@ typedef enum {
> >  #define BDRV_SECTOR_BITS   9
> >  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
> >
> > +/*
> > + * Get the first most significant bit of wp. If it is zero, then
> > + * the zone type is SWR.
> > + */
> > +#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
> > +
> >  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BIT=
S, \
> >                                             INT_MAX >> BDRV_SECTOR_BITS=
)
> >  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTO=
R_BITS)
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 1bd2aef4d5..b34a7f175d 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -884,6 +884,8 @@ typedef struct BlockLimits {
> >
> >      /* maximum number of active zones */
> >      int64_t max_active_zones;
> > +
> > +    int64_t write_granularity;
> >  } BlockLimits;
> >
> >  typedef struct BdrvOpBlocker BdrvOpBlocker;
> > @@ -1245,6 +1247,9 @@ struct BlockDriverState {
> >      CoMutex bsc_modify_lock;
> >      /* Always non-NULL, but must only be dereferenced under an RCU rea=
d guard */
> >      BdrvBlockStatusCache *block_status_cache;
> > +
> > +    /* array of write pointers' location of each zone in the zoned dev=
ice. */
> > +    BlockZoneWps *wps;
> >  };
> >
> >  struct BlockBackendRootState {
> > --
> > 2.39.2
> >

