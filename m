Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F91602807
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:12:26 +0200 (CEST)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okie8-00073z-6k
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1okiGo-0007oG-Pe; Tue, 18 Oct 2022 04:48:25 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1okiGd-0005Jk-4b; Tue, 18 Oct 2022 04:48:14 -0400
Received: by mail-ua1-x929.google.com with SMTP id e22so5280961uar.5;
 Tue, 18 Oct 2022 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2m7GU2nAMXt+Bw97L9DsZjze9kaM9DLt4Oswcnlzmk=;
 b=mvwbhcHfv3dBhEDf274rg5/yvUvIvkL/ecGdNwna6E78WgSi113fZfJf5FIAA/AQzo
 ZTdqEVuPvPT6nKRnUAV2fNmyRR8fNbZrNDRyURWfKkPGEPiWH7qJgBxRz9l1hKIe6nZT
 4+6DXXOqVMQ7hZyAEyp4rt7ulVth74fiR3TsAtPvBY2FkhaYnd8tk7h8fk/nMO29r0X+
 3rrjsUE9kH8yOlvIJkIOJIo5WpYmyYCye1+8mfu5B/hVS5xyUuzZihfK03eve3jcUeAv
 RJblInM9C1/Su6TDmJlxeCXBjcIVccJJwN+VlaBxeIx9wRkrqLPvmIJ9ONbewoQOkEhN
 I8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2m7GU2nAMXt+Bw97L9DsZjze9kaM9DLt4Oswcnlzmk=;
 b=hj0jdbpKKPru73j5TaX4naSm4lzv+1NKQbPr3j/T+OREtohRXHWXlyzSiBj4Z/Du2g
 6kETYhtEuB/uPdjS2J90H1OodIELqEDHmFAOjDdfgN80gCLEhPM0DsaacjsQ4IE56grC
 w9w2W4d4p3M+adfmPDvJoclLIqnnVcK8QnSEt5ROjnwbEp8sP+aqqz90w5s1KP47DvXf
 S0GxP9tzRvF9ewrKU2srS6lRRWuLJcaMlytdWGPFxCsAgVufs0aEFhtPLIZAjZJrRwtP
 Gz2ilou8alg4EbfxAah5mL7O+lv0utMA46JxAk4wamk8Iu1EtPGpffMfV2gH6PDRI+3S
 hVfA==
X-Gm-Message-State: ACrzQf0zyifNFQmF7D2t2va30HQ7Sf4YYWg3gvlE9BpSGp41Os++rYWk
 xyCOwK9CQYxqybhgruHVjNzLrTyGpv0unW0+hSE=
X-Google-Smtp-Source: AMsMyM60BRXMTJOEetyX58xQRIJckVIHDej3ptpU1ajdgMkPm9S+EE1nuHQMb7yvBGmVGZ6rfZehGc4ncdHE/5KUDM8=
X-Received: by 2002:a05:6130:c92:b0:3d0:5b8d:f50e with SMTP id
 ch18-20020a0561300c9200b003d05b8df50emr918508uab.0.1666082885024; Tue, 18 Oct
 2022 01:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221016145626.171838-1-faithilikerun@gmail.com>
 <20221016145626.171838-3-faithilikerun@gmail.com>
 <e4856293-e387-fd65-d81e-1d590b03e0a8@opensource.wdc.com>
In-Reply-To: <e4856293-e387-fd65-d81e-1d590b03e0a8@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 18 Oct 2022 16:48:23 +0800
Message-ID: <CAAAx-8LEY6Ni+pa+-ccYyLF7Ar_jfqegc9w+=k7Se+MNxogcLg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] block: introduce zone append write for zoned
 devices
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, dmitry.fomichev@wdc.com, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=faithilikerun@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B410=
=E6=9C=8817=E6=97=A5=E5=91=A8=E4=B8=80 13:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/16/22 23:56, Sam Li wrote:
> > A zone append command is a write operation that specifies the first
> > logical block of a zone as the write position. When writing to a zoned
> > block device using zone append, the byte offset of writes is pointing
> > to the write pointer of that zone. Upon completion the device will
> > respond with the position the data has been written in the zone.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  block/block-backend.c             | 65 ++++++++++++++++++++++
> >  block/file-posix.c                | 89 +++++++++++++++++++++++++++++--
> >  block/io.c                        | 21 ++++++++
> >  block/raw-format.c                |  8 +++
> >  include/block/block-io.h          |  3 ++
> >  include/block/block_int-common.h  |  5 ++
> >  include/block/raw-aio.h           |  4 +-
> >  include/sysemu/block-backend-io.h |  9 ++++
> >  8 files changed, 198 insertions(+), 6 deletions(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 1c618e9c68..06931ddd24 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
> >          struct {
> >              unsigned long op;
> >          } zone_mgmt;
> > +        struct {
> > +            int64_t *append_sector;
>
> As mentioned previosuly, call this sector. "append" is already in the
> zone_append struct member name....

Right, missed it here. I'll use "offset" then since it's in block layer.

>
> > +        } zone_append;
> >      };
> >  } BlkRwCo;
> >
> > @@ -1871,6 +1874,47 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk,=
 BlockZoneOp op,
> >      return &acb->common;
> >  }
> >
> > +static void coroutine_fn blk_aio_zone_append_entry(void *opaque)
> > +{
> > +    BlkAioEmAIOCB *acb =3D opaque;
> > +    BlkRwCo *rwco =3D &acb->rwco;
> > +
> > +    rwco->ret =3D blk_co_zone_append(rwco->blk, rwco->zone_append.appe=
nd_sector,
>
> ...so you avoid awkward repetitions of "append" like here. You'll have:
> rwco->zone_append.sector, which is shorter and more natural.
>
> > +                                   rwco->iobuf, rwco->flags);
> > +    blk_aio_complete(acb);
> > +}
> > +
> > +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> > +                                QEMUIOVector *qiov, BdrvRequestFlags f=
lags,
> > +                                BlockCompletionFunc *cb, void *opaque)=
 {
> > +    BlkAioEmAIOCB *acb;
> > +    Coroutine *co;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> > +    acb->rwco =3D (BlkRwCo) {
> > +            .blk    =3D blk,
> > +            .ret    =3D NOT_DONE,
> > +            .flags  =3D flags,
> > +            .iobuf  =3D qiov,
> > +            .zone_append =3D {
> > +                    .append_sector =3D offset,
> > +            },
> > +    };
> > +    acb->has_returned =3D false;
> > +
> > +    co =3D qemu_coroutine_create(blk_aio_zone_append_entry, acb);
> > +    bdrv_coroutine_enter(blk_bs(blk), co);
> > +    acb->has_returned =3D true;
> > +    if (acb->rwco.ret !=3D NOT_DONE) {
> > +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> > +                                         blk_aio_complete_bh, acb);
> > +    }
> > +
> > +    return &acb->common;
> > +}
> > +
> >  /*
> >   * Send a zone_report command.
> >   * offset is a byte offset from the start of the device. No alignment
> > @@ -1923,6 +1967,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *=
blk, BlockZoneOp op,
> >      return ret;
> >  }
> >
> > +/*
> > + * Send a zone_append command.
> > + */
> > +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset=
,
> > +        QEMUIOVector *qiov, BdrvRequestFlags flags)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +    if (!blk_is_available(blk)) {
> > +        blk_dec_in_flight(blk);
> > +        return -ENOMEDIUM;
> > +    }
> > +
> > +    ret =3D bdrv_co_zone_append(blk_bs(blk), offset, qiov, flags);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >  void blk_drain(BlockBackend *blk)
> >  {
> >      BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 5ff5500301..3d0cc33d02 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -205,6 +205,7 @@ typedef struct RawPosixAIOData {
> >          struct {
> >              struct iovec *iov;
> >              int niov;
> > +            int64_t *offset;
> >          } io;
> >          struct {
> >              uint64_t cmd;
> > @@ -1475,6 +1476,11 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)
> >              bs->bl.max_active_zones =3D ret;
> >          }
> >
> > +        ret =3D get_sysfs_long_val(&st, "physical_block_size");
> > +        if (ret >=3D 0) {
> > +            bs->bl.write_granularity =3D ret;
> > +        }
> > +
> >          bs->bl.wps =3D g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t)=
 * ret);
> >          if (get_zones_wp(s->fd, bs->bl.wps, 0, ret) < 0) {
> >              error_report("report wps failed");
> > @@ -1647,9 +1653,18 @@ qemu_pwritev(int fd, const struct iovec *iov, in=
t nr_iov, off_t offset)
> >  static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
> >  {
> >      ssize_t len;
> > +    BlockZoneWps *wps =3D aiocb->bs->bl.wps;
> > +    int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_size;
> > +
> > +    if (wps) {
> > +        qemu_mutex_lock(&wps->lock);
> > +        if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> > +            aiocb->aio_offset =3D wps->wp[index];
> > +        }
> > +    }
> >
> >      do {
> > -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> > +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
> >              len =3D qemu_pwritev(aiocb->aio_fildes,
> >                                 aiocb->io.iov,
> >                                 aiocb->io.niov,
> > @@ -1660,6 +1675,9 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIO=
Data *aiocb)
> >                                aiocb->io.niov,
> >                                aiocb->aio_offset);
> >      } while (len =3D=3D -1 && errno =3D=3D EINTR);
> > +    if (wps) {
> > +        qemu_mutex_unlock(&wps->lock);
>
> As commented in the previous patch, you cannot release the lock until you
> update the wp array entry. So this means that you should be taking the wp
> lock at the beginning of handle_aiocb_rw() and release it only after the
> wp array is updated. That will also simplify the code and avoid spreading
> lock/unlock of that array to many places.
>
> > +    }
> >
> >      if (len =3D=3D -1) {
> >          return -errno;
> > @@ -1677,9 +1695,17 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAI=
OData *aiocb, char *buf)
> >  {
> >      ssize_t offset =3D 0;
> >      ssize_t len;
> > +    BlockZoneWps *wps =3D aiocb->bs->bl.wps;
> > +    int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_size;
> >
> > +    if (wps) {
> > +        qemu_mutex_lock(&wps->lock);
> > +        if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> > +            aiocb->aio_offset =3D wps->wp[index];
> > +        }
> > +    }
> >      while (offset < aiocb->aio_nbytes) {
> > -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> > +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))=
 {
> >              len =3D pwrite(aiocb->aio_fildes,
> >                           (const char *)buf + offset,
> >                           aiocb->aio_nbytes - offset,
> > @@ -1709,6 +1735,9 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIO=
Data *aiocb, char *buf)
> >          }
> >          offset +=3D len;
> >      }
> > +    if (wps) {
> > +        qemu_mutex_unlock(&wps->lock);
>
> Same comment as above.
>
> > +    }
> >
> >      return offset;
> >  }
> > @@ -1772,7 +1801,7 @@ static int handle_aiocb_rw(void *opaque)
> >      }
> >
> >      nbytes =3D handle_aiocb_rw_linear(aiocb, buf);
> > -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> > +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) =
{
> >          char *p =3D buf;
> >          size_t count =3D aiocb->aio_nbytes, copy;
> >          int i;
> > @@ -1794,7 +1823,7 @@ static int handle_aiocb_rw(void *opaque)
> >  out:
> >      if (nbytes =3D=3D aiocb->aio_nbytes) {
> >  #if defined(CONFIG_BLKZONED)
> > -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> > +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))=
 {
> >              BlockZoneWps *wps =3D aiocb->bs->bl.wps;
> >              int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_size;
> >              if (wps) {
> > @@ -1802,6 +1831,9 @@ out:
> >                  if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> >                      uint64_t wend_offset =3D
> >                              aiocb->aio_offset + aiocb->aio_nbytes;
> > +                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> > +                        *aiocb->io.offset =3D wps->wp[index];
> > +                    }
>
> The comment above will address the problem here, which is that you are
> accessing the array without it being locked. You cannot do that.
>
> >
> >                      /* Advance the wp if needed */
> >                      if (wend_offset > wps->wp[index]) {
> > @@ -1824,7 +1856,7 @@ out:
> >      } else {
> >          assert(nbytes < 0);
> >  #if defined(CONFIG_BLKZONED)
> > -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> > +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))=
 {
> >              update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps, 0, 1=
);
> >          }
> >  #endif
> > @@ -3478,6 +3510,52 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDr=
iverState *bs, BlockZoneOp op,
> >  }
> >  #endif
> >
> > +#if defined(CONFIG_BLKZONED)
> > +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> > +                                           int64_t *offset,
> > +                                           QEMUIOVector *qiov,
> > +                                           BdrvRequestFlags flags) {
> > +    BDRVRawState *s =3D bs->opaque;
> > +    int64_t zone_size_mask =3D bs->bl.zone_size - 1;
> > +    int64_t iov_len =3D 0;
> > +    int64_t len =3D 0;
> > +    RawPosixAIOData acb;
> > +
> > +    if (*offset & zone_size_mask) {
> > +        error_report("sector offset %" PRId64 " is not aligned to zone=
 size "
> > +                     "%" PRId32 "", *offset / 512, bs->bl.zone_size / =
512);
> > +        return -EINVAL;
> > +    }
> > +
> > +    int64_t wg =3D bs->bl.write_granularity;
> > +    int64_t wg_mask =3D wg - 1;
> > +    for (int i =3D 0; i < qiov->niov; i++) {
> > +        iov_len =3D qiov->iov[i].iov_len;
> > +        if (iov_len & wg_mask) {
> > +            error_report("len of IOVector[%d] %" PRId64 " is not align=
ed to "
> > +                         "block size %" PRId64 "", i, iov_len, wg);
> > +            return -EINVAL;
> > +        }
> > +        len +=3D iov_len;
> > +    }
> > +
> > +    acb =3D (RawPosixAIOData) {
> > +        .bs =3D bs,
> > +        .aio_fildes =3D s->fd,
> > +        .aio_type =3D QEMU_AIO_ZONE_APPEND,
> > +        .aio_offset =3D *offset,
> > +        .aio_nbytes =3D len,
> > +        .io =3D {
> > +                .iov =3D qiov->iov,
> > +                .niov =3D qiov->niov,
> > +                .offset =3D offset,
> > +        },
> > +    };
> > +
> > +    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> > +}
> > +#endif
> > +
> >  static coroutine_fn int
> >  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
> >                  bool blkdev)
> > @@ -4253,6 +4331,7 @@ static BlockDriver bdrv_zoned_host_device =3D {
> >      /* zone management operations */
> >      .bdrv_co_zone_report =3D raw_co_zone_report,
> >      .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
> > +    .bdrv_co_zone_append =3D raw_co_zone_append,
> >  };
> >  #endif
> >
> > diff --git a/block/io.c b/block/io.c
> > index 88f707ea4d..03e1109056 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3230,6 +3230,27 @@ out:
> >      return co.ret;
> >  }
> >
> > +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *of=
fset,
> > +                        QEMUIOVector *qiov,
> > +                        BdrvRequestFlags flags)
> > +{
> > +    BlockDriver *drv =3D bs->drv;
> > +    CoroutineIOCompletion co =3D {
> > +            .coroutine =3D qemu_coroutine_self(),
> > +    };
> > +    IO_CODE();
> > +
> > +    bdrv_inc_in_flight(bs);
> > +    if (!drv || !drv->bdrv_co_zone_append) {
> > +        co.ret =3D -ENOTSUP;
> > +        goto out;
> > +    }
> > +    co.ret =3D drv->bdrv_co_zone_append(bs, offset, qiov, flags);
> > +out:
> > +    bdrv_dec_in_flight(bs);
> > +    return co.ret;
> > +}
> > +
> >  void *qemu_blockalign(BlockDriverState *bs, size_t size)
> >  {
> >      IO_CODE();
> > diff --git a/block/raw-format.c b/block/raw-format.c
> > index 18dc52a150..33bff8516e 100644
> > --- a/block/raw-format.c
> > +++ b/block/raw-format.c
> > @@ -325,6 +325,13 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriv=
erState *bs, BlockZoneOp op,
> >      return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
> >  }
> >
> > +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> > +                                           int64_t *offset,
> > +                                           QEMUIOVector *qiov,
> > +                                           BdrvRequestFlags flags) {
> > +    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
> > +}
> > +
> >  static int64_t raw_getlength(BlockDriverState *bs)
> >  {
> >      int64_t len;
> > @@ -629,6 +636,7 @@ BlockDriver bdrv_raw =3D {
> >      .bdrv_co_pdiscard     =3D &raw_co_pdiscard,
> >      .bdrv_co_zone_report  =3D &raw_co_zone_report,
> >      .bdrv_co_zone_mgmt  =3D &raw_co_zone_mgmt,
> > +    .bdrv_co_zone_append =3D &raw_co_zone_append,
> >      .bdrv_co_block_status =3D &raw_co_block_status,
> >      .bdrv_co_copy_range_from =3D &raw_co_copy_range_from,
> >      .bdrv_co_copy_range_to  =3D &raw_co_copy_range_to,
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index f0cdf67d33..6a54453578 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -94,6 +94,9 @@ int coroutine_fn bdrv_co_zone_report(BlockDriverState=
 *bs, int64_t offset,
> >                                       BlockZoneDescriptor *zones);
> >  int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp o=
p,
> >                                     int64_t offset, int64_t len);
> > +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *of=
fset,
> > +                                     QEMUIOVector *qiov,
> > +                                     BdrvRequestFlags flags);
> >
> >  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
> >  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index e3136146aa..a7e7db5646 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -701,6 +701,9 @@ struct BlockDriver {
> >              BlockZoneDescriptor *zones);
> >      int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZ=
oneOp op,
> >              int64_t offset, int64_t len);
> > +    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
> > +            int64_t *offset, QEMUIOVector *qiov,
> > +            BdrvRequestFlags flags);
> >
> >      /* removable device specific */
> >      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> > @@ -860,6 +863,8 @@ typedef struct BlockLimits {
> >
> >      /* array of write pointers' location of each zone in the zoned dev=
ice. */
> >      BlockZoneWps *wps;
> > +
> > +    int64_t write_granularity;
> >  } BlockLimits;
> >
> >  typedef struct BdrvOpBlocker BdrvOpBlocker;
> > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > index 877b2240b3..53033a5ca7 100644
> > --- a/include/block/raw-aio.h
> > +++ b/include/block/raw-aio.h
> > @@ -31,6 +31,7 @@
> >  #define QEMU_AIO_TRUNCATE     0x0080
> >  #define QEMU_AIO_ZONE_REPORT  0x0100
> >  #define QEMU_AIO_ZONE_MGMT    0x0200
> > +#define QEMU_AIO_ZONE_APPEND  0x0400
> >  #define QEMU_AIO_TYPE_MASK \
> >          (QEMU_AIO_READ | \
> >           QEMU_AIO_WRITE | \
> > @@ -41,7 +42,8 @@
> >           QEMU_AIO_COPY_RANGE | \
> >           QEMU_AIO_TRUNCATE | \
> >           QEMU_AIO_ZONE_REPORT | \
> > -         QEMU_AIO_ZONE_MGMT)
> > +         QEMU_AIO_ZONE_MGMT | \
> > +         QEMU_AIO_ZONE_APPEND)
> >
> >  /* AIO flags */
> >  #define QEMU_AIO_MISALIGNED   0x1000
> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-b=
ackend-io.h
> > index 1b5fc7db6b..ff9f777f52 100644
> > --- a/include/sysemu/block-backend-io.h
> > +++ b/include/sysemu/block-backend-io.h
> > @@ -52,6 +52,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, in=
t64_t offset,
> >  BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> >                                int64_t offset, int64_t len,
> >                                BlockCompletionFunc *cb, void *opaque);
> > +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> > +                                QEMUIOVector *qiov, BdrvRequestFlags f=
lags,
> > +                                BlockCompletionFunc *cb, void *opaque)=
;
> >  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_=
t bytes,
> >                               BlockCompletionFunc *cb, void *opaque);
> >  void blk_aio_cancel_async(BlockAIOCB *acb);
> > @@ -173,6 +176,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *bl=
k, BlockZoneOp op,
> >                                    int64_t offset, int64_t len);
> >  int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp =
op,
> >                                         int64_t offset, int64_t len);
> > +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset=
,
> > +                                    QEMUIOVector *qiov,
> > +                                    BdrvRequestFlags flags);
> > +int generated_co_wrapper blk_zone_append(BlockBackend *blk, int64_t *o=
ffset,
> > +                                         QEMUIOVector *qiov,
> > +                                         BdrvRequestFlags flags);
> >
> >  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offse=
t,
> >                                        int64_t bytes);
>
> --
> Damien Le Moal
> Western Digital Research
>

