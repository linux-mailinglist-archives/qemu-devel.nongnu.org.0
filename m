Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919D5FD46B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 07:59:53 +0200 (CEST)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oirG4-0004BW-EL
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 01:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oirBY-0007TU-Ow
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:55:12 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:52644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oirBV-0006NI-UA
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665640509; x=1697176509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S/eOdN4xEC+0bFA47nHc/pl13WmbnbWND8h0rxOTtxA=;
 b=BUBVKmMW8syLCOWyLq40DWYVQ37pl8ehEb9mT9UDR33puVfPAQo39/4y
 oGBzygTNGncggKyq74Y282OkfpbGw5fOPT627SmgEVUWJVbE6DDD/2pyS
 zyOo60LL6g1K14JYaFjF5tL1QDazWSaqfEBfBZZ88TKWbfgfWiNJFKZ4+
 S1R0XcKikqtxYKDE953CbsQLZeq68AC62Oxsa4D80O9hixsprL98oqg/0
 SHDyvR0qS2UiB0alwnJcj/wlPOrr8Q64xUfz3BZT6rtZ3nutmdxjgK1a6
 wFTsyrFz7ZCP2JW36fMtgo1o6UAcCpGU7sALT8nes/wnDeyT+CThh/aaS g==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="218858425"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 13:55:04 +0800
IronPort-SDR: 4P+xK/0yZWMthADwzQ2H1B0NjKl0K2m2ES+ZPQ4mhZjPDhCekEi4HSVtG5h40AZcC2AyP78UcY
 Z7YQygAkZIWb8AL3A3G68xX6tzBfXVUTJ23WCtMNwB17s3ljnVFTldB1dAMkQvQyY1hM7C4TQH
 btkVcY8jNKyHYO+FAK+a1lHiBYEEu+OGeHcSGpyNafEaFTn6xq5AXbPxNqBPV17kHpBHBSSiKb
 kPupffvattWrlsK3bv2yhXh5GHJxxYnlKXT+K7YAFXhmP6s668aIbSyxD5hPF9p3DXrI3orGl3
 +One4RyXfHHPchBBMbm5p4eF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 22:14:42 -0700
IronPort-SDR: Xj/iZ3A1i5u4S49t/B9ApMWAz85+ce073yOvUXMXskaSFsNrRZtaoVTl/U9VLw1d1x7QrctKbB
 6woiH/CYOvvj5y0l9vNDvX9IS2MjtzXYnSis0OR6Atm0YOswHC8C9mLjvjmuHWybMgcM8foCFD
 cLv8XJTi/ymJFLI/PcqP3ZgbDl7n5bCtCBihgmcZC0uzG5af8tH+byWFdMHf9AGCzqI+veRqBk
 vFT/8To3F6zL0ZBc7qjlBSDrCZUkL16cfXVUAD2bbyYQ96upXb3ADFTRGAlNLi/5bfQryfRA5Q
 4y0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 22:55:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MnzJ75N92z1Rwtm
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 22:55:03 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665640501; x=1668232502; bh=S/eOdN4xEC+0bFA47nHc/pl13WmbnbWND8h
 0rxOTtxA=; b=emgWO5K5le5nCEDZbR00SI2BzXaPH4XPnJi7dEvElJMHcikAWmQ
 ZxR3BXVvdR9QdzKKBVjwDN9ydjO0DUl5M3/A4n3O7NqeqFguNK0G7juMwTdbFXjC
 lIB2R5CeWHDpSwIQQbMmLShnp7Dczk1Squh99GRMU//xD77NYs/OBQGDvvHkdMLs
 18FeAmsp3ZVeM+jtr4ZepZOgwNR6mzIrjs5EPm4x73KHQfg4Nn8s6JrItvQRkMod
 jzuL42gK1Zmp/fKYVsWdvjqiRbTLFiCP32UgdPXDJcBx0E5nE0uICPZyVNOC7qdi
 lrZ0GUfz3larsTqqKCiHTbQ6O7ZpyMeIoRw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OVa3lW027w7f for <qemu-devel@nongnu.org>;
 Wed, 12 Oct 2022 22:55:01 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MnzJ40pLZz1RvLy;
 Wed, 12 Oct 2022 22:54:59 -0700 (PDT)
Message-ID: <0e1aecaf-6957-2592-c541-444cf58394ba@opensource.wdc.com>
Date: Thu, 13 Oct 2022 14:54:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 2/3] block: introduce zone append write for zoned
 devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org
References: <20221010023306.43610-1-faithilikerun@gmail.com>
 <20221010023306.43610-3-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221010023306.43610-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2788b627a=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/10/22 11:33, Sam Li wrote:
> A zone append command is a write operation that specifies the first
> logical block of a zone as the write position. When writing to a zoned
> block device using zone append, the byte offset of writes is pointing
> to the write pointer of that zone. Upon completion the device will
> respond with the position the data has been written in the zone.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c             | 64 +++++++++++++++++++++++++++++++
>  block/file-posix.c                | 64 ++++++++++++++++++++++++++++---
>  block/io.c                        | 21 ++++++++++
>  block/raw-format.c                |  7 ++++
>  include/block/block-io.h          |  3 ++
>  include/block/block_int-common.h  |  3 ++
>  include/block/raw-aio.h           |  4 +-
>  include/sysemu/block-backend-io.h |  9 +++++
>  8 files changed, 168 insertions(+), 7 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index ddc569e3ac..bfdb719bc8 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
>          struct {
>              BlockZoneOp op;
>          } zone_mgmt;
> +        struct {
> +            int64_t *append_sector;

I would call this "sector", since it will always be referenced as
"->zone_append.sector", you get the "append" for free :)

That said, shouldn't this be a byte value, so called "offset" ? Not
entirely sure...

> +        } zone_append;
>      };
>  } BlkRwCo;
>  
> @@ -1869,6 +1872,46 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>      return &acb->common;
>  }
>  
> +static void coroutine_fn blk_aio_zone_append_entry(void *opaque) {
> +    BlkAioEmAIOCB *acb = opaque;
> +    BlkRwCo *rwco = &acb->rwco;
> +
> +    rwco->ret = blk_co_zone_append(rwco->blk, rwco->zone_append.append_sector,
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

See above comment. So since this is a byte value, this needs to be
called "offset", no ?

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
> @@ -1921,6 +1964,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
> index 17c0b58158..08ab164df4 100755
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1657,7 +1657,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>      ssize_t len;
>  
>      do {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
>              len = qemu_pwritev(aiocb->aio_fildes,
>                                 aiocb->io.iov,
>                                 aiocb->io.niov,

Hu... You are issuing the io for a zone append without first changing
the aiocb offset to be equal to the zone write pointer ? And you are
calling this without the wps->lock held... Changing the aio offset to be
equal to the wp && issuing the io must be atomic.

> @@ -1687,7 +1687,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>      ssize_t len;
>  
>      while (offset < aiocb->aio_nbytes) {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              len = pwrite(aiocb->aio_fildes,
>                           (const char *)buf + offset,
>                           aiocb->aio_nbytes - offset,

Same comment here.

> @@ -1731,7 +1731,7 @@ static int handle_aiocb_rw(void *opaque)
>       * The offset of regular writes, append writes is the wp location
>       * of that zone.
>       */
> -    if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +    if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>          if (aiocb->bs->bl.zone_size > 0) {
>              BlockZoneWps *wps = aiocb->bs->bl.wps;
>              qemu_mutex_lock(&wps->lock);
> @@ -1794,7 +1794,7 @@ static int handle_aiocb_rw(void *opaque)
>      }
>  
>      nbytes = handle_aiocb_rw_linear(aiocb, buf);
> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
>          char *p = buf;
>          size_t count = aiocb->aio_nbytes, copy;
>          int i;
> @@ -1816,7 +1816,7 @@ static int handle_aiocb_rw(void *opaque)
>  out:
>      if (nbytes == aiocb->aio_nbytes) {
>  #if defined(CONFIG_BLKZONED)
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              BlockZoneWps *wps = aiocb->bs->bl.wps;
>              int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
>              if (wps) {
> @@ -1828,6 +1828,11 @@ out:
>                      if (wend_offset > wps->wp[index]){
>                          wps->wp[index] = wend_offset;
>                      }
> +
> +                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +                        *aiocb->io.append_sector =
> +                                wps->wp[index] >> BDRV_SECTOR_BITS;
> +                    }

Same comment as last time. You must do this BEFORE the previous hunk
that updates the wp. Otherwise, you are NOT returning the position of
the written data, but the position that follows the written data...

If you do a zone append to an empty zone, the append sector you return
must be the zone start sector. You can see here that this will never be
the case unless you reverse the 2 hunks above.

>                  }
>                  qemu_mutex_unlock(&wps->lock);
>              }
> @@ -1845,7 +1850,7 @@ out:
>      } else {
>          assert(nbytes < 0);
>  #if defined(CONFIG_BLKZONED)
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
>                              aiocb->bs->bl.nr_zones);
>          }
> @@ -3493,6 +3498,52 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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
> +       iov_len = qiov->iov[i].iov_len;
> +       if (iov_len & wg_mask) {
> +           error_report("len of IOVector[%d] %" PRId64 " is not aligned to block "
> +                        "size %" PRId64 "", i, iov_len, wg);
> +           return -EINVAL;
> +       }
> +       len += iov_len;
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
> +                .append_sector = offset,
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
> @@ -4268,6 +4319,7 @@ static BlockDriver bdrv_zoned_host_device = {
>      /* zone management operations */
>      .bdrv_co_zone_report = raw_co_zone_report,
>      .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +    .bdrv_co_zone_append = raw_co_zone_append,
>  };
>  #endif
>  
> diff --git a/block/io.c b/block/io.c
> index e5aaa64e17..935abf2ed4 100644
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
> index b885688434..f132880c85 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -325,6 +325,12 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>      return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
>  }
>  
> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs, int64_t *offset,
> +                                           QEMUIOVector *qiov,
> +                                           BdrvRequestFlags flags) {
> +    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
> +}
> +
>  static int64_t raw_getlength(BlockDriverState *bs)
>  {
>      int64_t len;
> @@ -628,6 +634,7 @@ BlockDriver bdrv_raw = {
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
> index 59c2d1316d..a7e7db5646 100644
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
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 3d26929cdd..f13cc1887b 100644
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
>           QEMU_AIO_TRUNCATE  | \
>           QEMU_AIO_ZONE_REPORT | \
> -         QEMU_AIO_ZONE_MGMT)
> +         QEMU_AIO_ZONE_MGMT | \
> +         QEMU_AIO_ZONE_APPEND)
>  
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 6835525582..33e35ae5d7 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -51,6 +51,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
>  BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>                                int64_t offset, int64_t len,
>                                BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
> +                                QEMUIOVector *qiov, BdrvRequestFlags flags,
> +                                BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
>                               BlockCompletionFunc *cb, void *opaque);
>  void blk_aio_cancel_async(BlockAIOCB *acb);
> @@ -172,6 +175,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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


