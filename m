Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7B60064C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 07:29:46 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okIh7-0004kS-7W
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 01:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okIaC-000723-4H
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 01:22:37 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:64804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okIa8-0006Wd-Vd
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 01:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665984152; x=1697520152;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GO/hgrfpjers52CUdnR5lbiaYwmr0wM3LzsxQB5V/co=;
 b=gPGTR5wMZV4ldP6BJPLC07G1Yx7O+hJUcTZr9/DcbmKWt6kv1Nsu5foE
 IrT9ZU3BIOpitl5sYOEFvbmi3cI5B8xRcghQlS71bau0MSbLJoEycll8H
 JdsftobB1/+E1RgxHU+R6gUdQ8A2XeqkqkQqrYfn4KZunaEkfp5E3NVfk
 ybnTf6+zBntgaJkIanJ1adQ6EFw8qSq5AD3nRa4bebkG51DhGseamzaJR
 TWhe5UTwnS17P5z9Y1BPzGkOIIIEamv7RNxu6OMdax2KUV4sCg28Ex3aI
 D6nht5aBU/cnB2omI4CHQGynF6Z8li9bYuF8fFGMKWkawAQmBSFilYcd6 A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="326093918"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 13:22:29 +0800
IronPort-SDR: 5Yv3YbFUzYYIR7fP850M+7g/KPHBUHFm4+nFIOdBccgD8CA8rot9wzW50nWOEG87WCEZ1Efev9
 gk9S4MMbDfBXnn5RLLAcxSg8aKHS9r0NPSjA+MU9gH/cQdPMWOft+rfYg1DmKN66RRr+gjBcBY
 1iFqHMi+6xbZyKMBNJ5jFaBm+0SN8hPTX3iUxp90cDiJG05kd+fzdymzZOLofbBbEUclOX67RH
 5ESxhASr9oKsHCzEwTKiP9obxs+Tl9Jbnie7n3iMxlhsQW5pZw8SK9THXWQmEC2EHPDer5o8dt
 ARK9F6i85kLM6D0fPEiIzOtR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 21:42:02 -0700
IronPort-SDR: nhOzPWm61YV6sIZzIIenAOzeluab38XMjzN7yxNHF51psZlMQS6GulZ1+zFVtSdJ3GWXf1sMmk
 fZCrB7L/8HGej5QGEvxPNHE9DQtS99ooX+plzqnwnVxE1NoGpZZDavmtWCAluoVKzSdSiGzwSS
 5R+RQZoOLhjgaOqLjmYwLo5fYKvWOf/4wGi0QQTitd3cfe+7l9rWpK4RyfiFM++ZrGLIOvZ44a
 BV1ORNRrlnHewvsEAqD3SdvPClWD5AIkrYUMI8KJ5/pj5CVcUIF9tNulkl2Myu/GOCJVSKm1TD
 0jw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:22:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrQNh68Wbz1RwtC
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 22:22:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665984147; x=1668576148; bh=GO/hgrfpjers52CUdnR5lbiaYwmr0wM3Lzs
 xQB5V/co=; b=JJ5TfWJX8uOSJQcY0bfTh/RfP5hZcww3TykvH4eQR2KBThGWWzL
 rSiFUMssFdGAWH7IjncCTB6xJ1VVgU05l4hB7tNtu0SbN+MKxaYx636N7mLm/KHG
 dpWq8953IjxynFWF9sIf3V9R+y9LWPrUi8eKmzbPMDINpa7AcoO/4xJfcWwtxPx4
 Aw80Ey0CH2ntruJBvQaqOMWAkKJ+v0HuFxRdWtOy+lOZ0GNn0ATy48T/fKrnqGGk
 19jMipYzHInjXliAFuKVlWDdSP9StZNiI93buWWphtFWMStv/ZBWjl5CqH13Nh8s
 Cs8TXWjjDqp+iyK1xdp5XQIjYxzbAU2Hmtg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id J37-HKDC46WY for <qemu-devel@nongnu.org>;
 Sun, 16 Oct 2022 22:22:27 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrQNd09fWz1RvLy;
 Sun, 16 Oct 2022 22:22:24 -0700 (PDT)
Message-ID: <e4856293-e387-fd65-d81e-1d590b03e0a8@opensource.wdc.com>
Date: Mon, 17 Oct 2022 14:22:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 2/3] block: introduce zone append write for zoned
 devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, qemu-block@nongnu.org
References: <20221016145626.171838-1-faithilikerun@gmail.com>
 <20221016145626.171838-3-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221016145626.171838-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2824960c0=damien.lemoal@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/22 23:56, Sam Li wrote:
> A zone append command is a write operation that specifies the first
> logical block of a zone as the write position. When writing to a zoned
> block device using zone append, the byte offset of writes is pointing
> to the write pointer of that zone. Upon completion the device will
> respond with the position the data has been written in the zone.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c             | 65 ++++++++++++++++++++++
>  block/file-posix.c                | 89 +++++++++++++++++++++++++++++--
>  block/io.c                        | 21 ++++++++
>  block/raw-format.c                |  8 +++
>  include/block/block-io.h          |  3 ++
>  include/block/block_int-common.h  |  5 ++
>  include/block/raw-aio.h           |  4 +-
>  include/sysemu/block-backend-io.h |  9 ++++
>  8 files changed, 198 insertions(+), 6 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 1c618e9c68..06931ddd24 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
>          struct {
>              unsigned long op;
>          } zone_mgmt;
> +        struct {
> +            int64_t *append_sector;

As mentioned previosuly, call this sector. "append" is already in the
zone_append struct member name....

> +        } zone_append;
>      };
>  } BlkRwCo;
>  
> @@ -1871,6 +1874,47 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>      return &acb->common;
>  }
>  
> +static void coroutine_fn blk_aio_zone_append_entry(void *opaque)
> +{
> +    BlkAioEmAIOCB *acb = opaque;
> +    BlkRwCo *rwco = &acb->rwco;
> +
> +    rwco->ret = blk_co_zone_append(rwco->blk, rwco->zone_append.append_sector,

...so you avoid awkward repetitions of "append" like here. You'll have:
rwco->zone_append.sector, which is shorter and more natural.

> +                                   rwco->iobuf, rwco->flags);
> +    blk_aio_complete(acb);
> +}
> +
> +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> +                                QEMUIOVector *qiov, BdrvRequestFlags flags,
> +                                BlockCompletionFunc *cb, void *opaque) {
> +    BlkAioEmAIOCB *acb;
> +    Coroutine *co;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> +    acb->rwco = (BlkRwCo) {
> +            .blk    = blk,
> +            .ret    = NOT_DONE,
> +            .flags  = flags,
> +            .iobuf  = qiov,
> +            .zone_append = {
> +                    .append_sector = offset,
> +            },
> +    };
> +    acb->has_returned = false;
> +
> +    co = qemu_coroutine_create(blk_aio_zone_append_entry, acb);
> +    bdrv_coroutine_enter(blk_bs(blk), co);
> +    acb->has_returned = true;
> +    if (acb->rwco.ret != NOT_DONE) {
> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
> +                                         blk_aio_complete_bh, acb);
> +    }
> +
> +    return &acb->common;
> +}
> +
>  /*
>   * Send a zone_report command.
>   * offset is a byte offset from the start of the device. No alignment
> @@ -1923,6 +1967,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>      return ret;
>  }
>  
> +/*
> + * Send a zone_append command.
> + */
> +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
> +        QEMUIOVector *qiov, BdrvRequestFlags flags)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +    if (!blk_is_available(blk)) {
> +        blk_dec_in_flight(blk);
> +        return -ENOMEDIUM;
> +    }
> +
> +    ret = bdrv_co_zone_append(blk_bs(blk), offset, qiov, flags);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
>  void blk_drain(BlockBackend *blk)
>  {
>      BlockDriverState *bs = blk_bs(blk);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 5ff5500301..3d0cc33d02 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -205,6 +205,7 @@ typedef struct RawPosixAIOData {
>          struct {
>              struct iovec *iov;
>              int niov;
> +            int64_t *offset;
>          } io;
>          struct {
>              uint64_t cmd;
> @@ -1475,6 +1476,11 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>              bs->bl.max_active_zones = ret;
>          }
>  
> +        ret = get_sysfs_long_val(&st, "physical_block_size");
> +        if (ret >= 0) {
> +            bs->bl.write_granularity = ret;
> +        }
> +
>          bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
>          if (get_zones_wp(s->fd, bs->bl.wps, 0, ret) < 0) {
>              error_report("report wps failed");
> @@ -1647,9 +1653,18 @@ qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offset)
>  static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>  {
>      ssize_t len;
> +    BlockZoneWps *wps = aiocb->bs->bl.wps;
> +    int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
> +
> +    if (wps) {
> +        qemu_mutex_lock(&wps->lock);
> +        if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +            aiocb->aio_offset = wps->wp[index];
> +        }
> +    }
>  
>      do {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
>              len = qemu_pwritev(aiocb->aio_fildes,
>                                 aiocb->io.iov,
>                                 aiocb->io.niov,
> @@ -1660,6 +1675,9 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>                                aiocb->io.niov,
>                                aiocb->aio_offset);
>      } while (len == -1 && errno == EINTR);
> +    if (wps) {
> +        qemu_mutex_unlock(&wps->lock);

As commented in the previous patch, you cannot release the lock until you
update the wp array entry. So this means that you should be taking the wp
lock at the beginning of handle_aiocb_rw() and release it only after the
wp array is updated. That will also simplify the code and avoid spreading
lock/unlock of that array to many places.

> +    }
>  
>      if (len == -1) {
>          return -errno;
> @@ -1677,9 +1695,17 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>  {
>      ssize_t offset = 0;
>      ssize_t len;
> +    BlockZoneWps *wps = aiocb->bs->bl.wps;
> +    int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
>  
> +    if (wps) {
> +        qemu_mutex_lock(&wps->lock);
> +        if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +            aiocb->aio_offset = wps->wp[index];
> +        }
> +    }
>      while (offset < aiocb->aio_nbytes) {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              len = pwrite(aiocb->aio_fildes,
>                           (const char *)buf + offset,
>                           aiocb->aio_nbytes - offset,
> @@ -1709,6 +1735,9 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>          }
>          offset += len;
>      }
> +    if (wps) {
> +        qemu_mutex_unlock(&wps->lock);

Same comment as above.

> +    }
>  
>      return offset;
>  }
> @@ -1772,7 +1801,7 @@ static int handle_aiocb_rw(void *opaque)
>      }
>  
>      nbytes = handle_aiocb_rw_linear(aiocb, buf);
> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
>          char *p = buf;
>          size_t count = aiocb->aio_nbytes, copy;
>          int i;
> @@ -1794,7 +1823,7 @@ static int handle_aiocb_rw(void *opaque)
>  out:
>      if (nbytes == aiocb->aio_nbytes) {
>  #if defined(CONFIG_BLKZONED)
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              BlockZoneWps *wps = aiocb->bs->bl.wps;
>              int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
>              if (wps) {
> @@ -1802,6 +1831,9 @@ out:
>                  if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
>                      uint64_t wend_offset =
>                              aiocb->aio_offset + aiocb->aio_nbytes;
> +                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +                        *aiocb->io.offset = wps->wp[index];
> +                    }

The comment above will address the problem here, which is that you are
accessing the array without it being locked. You cannot do that.

>  
>                      /* Advance the wp if needed */
>                      if (wend_offset > wps->wp[index]) {
> @@ -1824,7 +1856,7 @@ out:
>      } else {
>          assert(nbytes < 0);
>  #if defined(CONFIG_BLKZONED)
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps, 0, 1);
>          }
>  #endif
> @@ -3478,6 +3510,52 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>  }
>  #endif
>  
> +#if defined(CONFIG_BLKZONED)
> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> +                                           int64_t *offset,
> +                                           QEMUIOVector *qiov,
> +                                           BdrvRequestFlags flags) {
> +    BDRVRawState *s = bs->opaque;
> +    int64_t zone_size_mask = bs->bl.zone_size - 1;
> +    int64_t iov_len = 0;
> +    int64_t len = 0;
> +    RawPosixAIOData acb;
> +
> +    if (*offset & zone_size_mask) {
> +        error_report("sector offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId32 "", *offset / 512, bs->bl.zone_size / 512);
> +        return -EINVAL;
> +    }
> +
> +    int64_t wg = bs->bl.write_granularity;
> +    int64_t wg_mask = wg - 1;
> +    for (int i = 0; i < qiov->niov; i++) {
> +        iov_len = qiov->iov[i].iov_len;
> +        if (iov_len & wg_mask) {
> +            error_report("len of IOVector[%d] %" PRId64 " is not aligned to "
> +                         "block size %" PRId64 "", i, iov_len, wg);
> +            return -EINVAL;
> +        }
> +        len += iov_len;
> +    }
> +
> +    acb = (RawPosixAIOData) {
> +        .bs = bs,
> +        .aio_fildes = s->fd,
> +        .aio_type = QEMU_AIO_ZONE_APPEND,
> +        .aio_offset = *offset,
> +        .aio_nbytes = len,
> +        .io = {
> +                .iov = qiov->iov,
> +                .niov = qiov->niov,
> +                .offset = offset,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +}
> +#endif
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -4253,6 +4331,7 @@ static BlockDriver bdrv_zoned_host_device = {
>      /* zone management operations */
>      .bdrv_co_zone_report = raw_co_zone_report,
>      .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +    .bdrv_co_zone_append = raw_co_zone_append,
>  };
>  #endif
>  
> diff --git a/block/io.c b/block/io.c
> index 88f707ea4d..03e1109056 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3230,6 +3230,27 @@ out:
>      return co.ret;
>  }
>  
> +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
> +                        QEMUIOVector *qiov,
> +                        BdrvRequestFlags flags)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_append) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret = drv->bdrv_co_zone_append(bs, offset, qiov, flags);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 18dc52a150..33bff8516e 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -325,6 +325,13 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>      return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
>  }
>  
> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> +                                           int64_t *offset,
> +                                           QEMUIOVector *qiov,
> +                                           BdrvRequestFlags flags) {
> +    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
> +}
> +
>  static int64_t raw_getlength(BlockDriverState *bs)
>  {
>      int64_t len;
> @@ -629,6 +636,7 @@ BlockDriver bdrv_raw = {
>      .bdrv_co_pdiscard     = &raw_co_pdiscard,
>      .bdrv_co_zone_report  = &raw_co_zone_report,
>      .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
> +    .bdrv_co_zone_append = &raw_co_zone_append,
>      .bdrv_co_block_status = &raw_co_block_status,
>      .bdrv_co_copy_range_from = &raw_co_copy_range_from,
>      .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index f0cdf67d33..6a54453578 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -94,6 +94,9 @@ int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
>                                       BlockZoneDescriptor *zones);
>  int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>                                     int64_t offset, int64_t len);
> +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
> +                                     QEMUIOVector *qiov,
> +                                     BdrvRequestFlags flags);
>  
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index e3136146aa..a7e7db5646 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -701,6 +701,9 @@ struct BlockDriver {
>              BlockZoneDescriptor *zones);
>      int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
>              int64_t offset, int64_t len);
> +    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
> +            int64_t *offset, QEMUIOVector *qiov,
> +            BdrvRequestFlags flags);
>  
>      /* removable device specific */
>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
> @@ -860,6 +863,8 @@ typedef struct BlockLimits {
>  
>      /* array of write pointers' location of each zone in the zoned device. */
>      BlockZoneWps *wps;
> +
> +    int64_t write_granularity;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 877b2240b3..53033a5ca7 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -31,6 +31,7 @@
>  #define QEMU_AIO_TRUNCATE     0x0080
>  #define QEMU_AIO_ZONE_REPORT  0x0100
>  #define QEMU_AIO_ZONE_MGMT    0x0200
> +#define QEMU_AIO_ZONE_APPEND  0x0400
>  #define QEMU_AIO_TYPE_MASK \
>          (QEMU_AIO_READ | \
>           QEMU_AIO_WRITE | \
> @@ -41,7 +42,8 @@
>           QEMU_AIO_COPY_RANGE | \
>           QEMU_AIO_TRUNCATE | \
>           QEMU_AIO_ZONE_REPORT | \
> -         QEMU_AIO_ZONE_MGMT)
> +         QEMU_AIO_ZONE_MGMT | \
> +         QEMU_AIO_ZONE_APPEND)
>  
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 1b5fc7db6b..ff9f777f52 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -52,6 +52,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
>  BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>                                int64_t offset, int64_t len,
>                                BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> +                                QEMUIOVector *qiov, BdrvRequestFlags flags,
> +                                BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
>                               BlockCompletionFunc *cb, void *opaque);
>  void blk_aio_cancel_async(BlockAIOCB *acb);
> @@ -173,6 +176,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>                                    int64_t offset, int64_t len);
>  int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>                                         int64_t offset, int64_t len);
> +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offset,
> +                                    QEMUIOVector *qiov,
> +                                    BdrvRequestFlags flags);
> +int generated_co_wrapper blk_zone_append(BlockBackend *blk, int64_t *offset,
> +                                         QEMUIOVector *qiov,
> +                                         BdrvRequestFlags flags);
>  
>  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes);

-- 
Damien Le Moal
Western Digital Research


