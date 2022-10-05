Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B735F4D90
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 03:57:19 +0200 (CEST)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oftew-0008UH-KU
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 21:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1oftcN-0006gQ-4R
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 21:54:39 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:8499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1oftcJ-000382-HM
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 21:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664934875; x=1696470875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zJU3nVpKaAKJtYWKdfWVmq61vJn+W2u2ks+EMyBDX0I=;
 b=IppHyIruqs3iDM3Nxd2PUZl68t397VOwV78E5Jy9O2h4reGycOdGLnlq
 podYCL+bXC8yEiLz22Kjzkhrx3vXA3X+HaEo2ycCQX/1UA1Zo4+8E0BAD
 JulcXYVbTZokDU+ama8d3B8JmOEgl3xVzus1dLUB6JeLAumjtwPVWl0nH
 VHMZVUZ/Y/VOtWze1mSdd1abZDMl54oMkehbcv/uni/YrXtnqlqGQ84iM
 2Bs++z2OKHdlLnfXGbsmtr9z2zwhf6t6WQwdk+tRpoqkLQ6E4Uaza4ZYg
 b+KObZtYT2Ioz8STDcbAhYOhLLnZ3IWt+Xk9zRd0wKiuR+mtyAV3SEz0F A==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661788800"; d="scan'208";a="213005706"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2022 09:54:30 +0800
IronPort-SDR: DtypYsj2YVvG9AwkTZPXfeCGXMw6YIAMJd3A854HRUGBS1esIc+cD+AbSj3zkiOxx1LqeE+E/s
 7KYoAL19cdi14SbKQ0pkPocr0ylGK+ffwpHJyIyfZEiziQgqT24qD88/CwChmxhOoC2lzXTK+5
 /LsGjtt6rZNMHEd6BORqGr7Qe3DYaBPFH8tXW28AAwe6YaUFOhigUxIg6kzxxH7Tt6/Tt+eWCK
 Pku/HJfQpu66Do0Tvz+7AftVFzABWR3AIsGl2D6wHf3Ah2vkd+iznotxfdhfB17AxpCb6GBtZ2
 GeI+XHD0+sz2NuJYhXliDTHs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 18:08:43 -0700
IronPort-SDR: 1mKx6HW9iWJgbnJ6+f5H6J/I9/quU/QckVDdiYeCbFhwvOqvQyZCAS5VZ26ik1GqIkHC5FV45x
 3Q/XyAI5xJpYYwUStIEmKZGSiK+Ua8qadEARuEciskQF5E7krfXRMadbT3q3r/4vPaVecuIRLl
 1S05r0bg/mOsGEhwrKRRnhH1u7XvzJ96aR/JssouMtumfn+PmO3iRBjCFFEiqAgXdBW1utc7qs
 CO86pLk9/Qzxev2J5RbohlOHs+OS1RY/lhPDDBX6mn16tYm5S4O6b1hszJrqQLsRYUGpHnjmxl
 Nl4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 18:54:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MhyLF2p2Lz1Rwtl
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 18:54:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1664934867; x=1667526868; bh=zJU3nVpKaAKJtYWKdfWVmq61vJn+W2u2ks+
 EMyBDX0I=; b=RZDa58oMdQoMbG3BuPytTkXq7EXOxWeZGN+h7BcJrVJRO9L0RcO
 T1OQaOp7zffEOs4iMvcvMMmBg5G9uESydBrmF7ggW8HSf1/AmenmIIWYb/Hfefqd
 DpheK4U8upZc9JXNQdaED3lnkMKPv57sz2LnpL7qQyGzl9jHsQL8ZYwZCR7gDkNS
 nblJ6kDdKqfKgQl204y3G97szpjfBC/aaqrePFaomGBe23qCXgtfEyZdAbnqIiWy
 dHijVAnk0MH00EGOm31/F1zyyRnbrj48VRD2NkIEbmOeC0eJVWK1+FYuvNHRjzmM
 g5GiZ5WZ1d4DtVy3CztctcoxWZYQN6wPyxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZV5uZ3iZn9Uh for <qemu-devel@nongnu.org>;
 Tue,  4 Oct 2022 18:54:27 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MhyL94KNwz1RvLy;
 Tue,  4 Oct 2022 18:54:25 -0700 (PDT)
Message-ID: <20a63061-93b9-4127-64e7-55599dad9aad@opensource.wdc.com>
Date: Wed, 5 Oct 2022 10:54:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] block: introduce zone append write for zoned
 devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, dmitry.fomichev@wdc.com, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220929093134.73974-1-faithilikerun@gmail.com>
 <20220929093134.73974-3-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220929093134.73974-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=27087a391=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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

On 9/29/22 18:31, Sam Li wrote:
> A zone append command is a write operation that specifies the first
> logical block of a zone as the write position. When writing to a zoned
> block device using zone append, the byte offset of the write is pointing
> to the write pointer of that zone. Upon completion the device will
> respond with the position the data has been written in the zone.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c              | 65 ++++++++++++++++++++++++++++++
>  block/file-posix.c                 | 51 +++++++++++++++++++++++
>  block/io.c                         | 21 ++++++++++
>  block/raw-format.c                 |  7 ++++
>  include/block/block-io.h           |  3 ++
>  include/block/block_int-common.h   |  3 ++
>  include/sysemu/block-backend-io.h  |  9 +++++
>  qemu-io-cmds.c                     | 62 ++++++++++++++++++++++++++++
>  tests/qemu-iotests/tests/zoned.out |  7 ++++
>  tests/qemu-iotests/tests/zoned.sh  |  9 +++++
>  10 files changed, 237 insertions(+)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index f7f7acd6f4..07a8632af1 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
>          struct {
>              BlockZoneOp op;
>          } zone_mgmt;
> +        struct {
> +            int64_t *append_sector;
> +        } zone_append;
>      };
>  } BlkRwCo;
>  
> @@ -1869,6 +1872,47 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>      return &acb->common;
>  }
>  
> +static void blk_aio_zone_append_entry(void *opaque) {
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
> +        .blk    = blk,
> +        .ret    = NOT_DONE,
> +        .flags  = flags,
> +        .iobuf  = qiov,
> +        .zone_append = {
> +                .append_sector = offset,
> +        },
> +    };
> +    acb->has_returned = false;
> +
> +    co = qemu_coroutine_create(blk_aio_zone_append_entry, acb);
> +    bdrv_coroutine_enter(blk_bs(blk), co);
> +
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
> @@ -1921,6 +1965,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
> index 33e81ac112..24b70f1afe 100755
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3454,6 +3454,56 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>  #endif
>  }
>  
> +

whiteline change.

> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> +                                           int64_t *offset,
> +                                           QEMUIOVector *qiov,
> +                                           BdrvRequestFlags flags) {
> +#if defined(CONFIG_BLKZONED)
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
> +        .aio_offset = bs->bl.wps->wp[*offset / bs->bl.zone_size],

You cannot read the wps array without holding wps->lock, and the lock MUST
be held until the aio is issued. Otherwise, if another aio is issued after
the above line, the 2 AIOs may end up being issued in reverse order,
causing an unaligned write error.

Given this, I would change this to issue this aio without changing the
offset and let the lowest level function in file-posix doing the
conversion from zone append to regular write, incrementing the wp and
issue the write, all with wps lock held.

> +        .aio_nbytes = len,
> +        .io = {
> +                .iov = qiov->iov,
> +                .niov = qiov->niov,
> +                .wps = bs->bl.wps,
> +                .append_sector = offset,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -4229,6 +4279,7 @@ static BlockDriver bdrv_zoned_host_device = {
>      /* zone management operations */
>      .bdrv_co_zone_report = raw_co_zone_report,
>      .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +    .bdrv_co_zone_append = raw_co_zone_append,
>  };
>  #endif
>  
> diff --git a/block/io.c b/block/io.c
> index 5ab2d169c8..b9dfdf0709 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3239,6 +3239,27 @@ out:
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
> index 9441536819..df8cc33467 100644
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
> index 65463b88d9..a792164018 100644
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
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c

Hmmm... may be move the test stuff to a 3rd patch to facilitate review
(and make each patch smaller) ?

> index e56c8d1c30..6cb86de35b 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1855,6 +1855,67 @@ static const cmdinfo_t zone_reset_cmd = {
>      .oneline = "reset a zone write pointer in zone block device",
>  };
>  
> +static int do_aio_zone_append(BlockBackend *blk, QEMUIOVector *qiov,
> +                              int64_t *offset, int flags, int *total)
> +{
> +    int async_ret = NOT_DONE;
> +
> +    blk_aio_zone_append(blk, offset, qiov, flags, aio_rw_done, &async_ret);
> +    while (async_ret == NOT_DONE) {
> +        main_loop_wait(false);
> +    }
> +
> +    *total = qiov->size;
> +    return async_ret < 0 ? async_ret : 1;
> +}
> +
> +static int zone_append_f(BlockBackend *blk, int argc, char **argv) {
> +    int ret;
> +    int flags = 0;
> +    int total = 0;
> +    int64_t offset;
> +    char *buf;
> +    int nr_iov;
> +    int pattern = 0xcd;
> +    QEMUIOVector qiov;
> +
> +    if (optind > argc - 2) {
> +        return -EINVAL;
> +    }
> +    optind++;
> +    offset = cvtnum(argv[optind]);
> +    if (offset < 0) {
> +        print_cvtnum_err(offset, argv[optind]);
> +        return offset;
> +    }
> +    optind++;
> +    nr_iov = argc - optind;
> +    buf = create_iovec(blk, &qiov, &argv[optind], nr_iov, pattern);
> +    if (buf == NULL) {
> +        return -EINVAL;
> +    }
> +    ret = do_aio_zone_append(blk, &qiov, &offset, flags, &total);
> +    if (ret < 0) {
> +        printf("zone append failed: %s\n", strerror(-ret));
> +        goto out;
> +    }
> +
> +    out:
> +    qemu_iovec_destroy(&qiov);
> +    qemu_io_free(buf);
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_append_cmd = {
> +    .name = "zone_append",
> +    .altname = "zap",
> +    .cfunc = zone_append_f,
> +    .argmin = 3,
> +    .argmax = 3,
> +    .args = "offset len [len..]",
> +    .oneline = "append write a number of bytes at a specified offset",
> +};
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd = {
>      .name       = "truncate",
> @@ -2652,6 +2713,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
>      qemuio_add_command(&zone_close_cmd);
>      qemuio_add_command(&zone_finish_cmd);
>      qemuio_add_command(&zone_reset_cmd);
> +    qemuio_add_command(&zone_append_cmd);
>      qemuio_add_command(&truncate_cmd);
>      qemuio_add_command(&length_cmd);
>      qemuio_add_command(&info_cmd);
> diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/tests/zoned.out
> index 0c8f96deb9..b3b139b4ec 100644
> --- a/tests/qemu-iotests/tests/zoned.out
> +++ b/tests/qemu-iotests/tests/zoned.out
> @@ -50,4 +50,11 @@ start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type: 2]
>  (5) resetting the second zone
>  After resetting a zone:
>  start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: 2]
> +
> +
> +(6) append write
> +After appending the first zone:
> +start: 0x0, len 0x80000, cap 0x80000, wptr 0x18, zcond:2, [type: 2]
> +After appending the second zone:
> +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80018, zcond:2, [type: 2]
>  *** done
> diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
> index fced0194c5..888711eef2 100755
> --- a/tests/qemu-iotests/tests/zoned.sh
> +++ b/tests/qemu-iotests/tests/zoned.sh
> @@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
>  sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
>  echo "After resetting a zone:"
>  sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> +echo
> +echo
> +echo "(6) append write" # physical block size of the device is 4096
> +sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
> +echo "After appending the first zone:"
> +sudo $QEMU_IO $IMG -c "zrp 0 1"
> +sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
> +echo "After appending the second zone:"
> +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
>  
>  # success, all done
>  echo "*** done"

-- 
Damien Le Moal
Western Digital Research


