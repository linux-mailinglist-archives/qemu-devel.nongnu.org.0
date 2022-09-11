Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0715B4C50
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 08:14:02 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXGED-0000a1-OR
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 02:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXG7G-0005Z4-Ml
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 02:06:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:52414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXG7D-0002H4-I2
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 02:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662876407; x=1694412407;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mnRPljXeNSeXNhnAt126mJUAldzaoFPN4gXSNCureDQ=;
 b=LBqVF/qLcxZfbwKJVnWTakewsNm1g1i4dU0HJgqI9onYTBhuboeve78a
 mMBRapWqtHUXTmVDASKk16NT/USksVIBnetdlmiLjASlZ3SzZqWI7N8Jq
 Hehawvzv09gZdcfM6S0SYVfgIJYu7A3rc2p18B6UNXEQMkPNa1ALdZ8tc
 5eKTEbDk8n0cCekc4EclGgu/0t7orMudT7e4DAKz81+pV7EHrMoRZub09
 bkSL4zJQgJNg7mSbjmarcWjPsakNvzN+Y73BPVFRJ1U3SF37T6Hp+ePiD
 UyLalgPs3ei4PyTCFubbgdmmfL8mlgR+9oEqxTkPNcKUqKqTL4r5qdh1k Q==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="211037463"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 14:06:38 +0800
IronPort-SDR: 5D67A3+aEttW85myri/aay3cSLspjNsh8kBUGrkSGnd+bxqYm6Lie0b+Skb1cOPt+3vnWo9Fsg
 0HU92f88PieroXwJ0vJDMz8BVh0uz/ANoNZAcA1JrRLbhN1HclkAG89lPg2UAhOJGFR+pP9xWa
 iJjhcUI8XoCQgWxYxG3B9Xcv3jWmOQSy/tth0LiToLryWUdcNzYxDRwECn/c0K0Iwj2Ook2quU
 e5ewqfLn3E6mANiExpRDef5T2BT0ntE3c3VBRmDpWgU50Q/QULm4QfhdodvsSXn/nRJWeajljo
 FXgpbeeyYoeNPCvACMpdHVRG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 22:26:56 -0700
IronPort-SDR: LbCWyudPz6gMKy2C1YLGlCQuDw9yDmp3vVWp6yisdrJdcCJLi+yuv03sId0C4WLx4ffPU4leTN
 fahmezFJwHgBnrrZf7kZh4O8mbXL/nFH4quuoTcw19hRqLcRBaKExmK2xNRU/M4a4mSAgf0fab
 t75IvLq6nN4u7fdwxf3pV3IAj0hY/39uAiBLI44r8g9uAHC99zTdy3i5Bs70wl/MPn0BrdK11f
 N/M+qlE07FOVoUERYzSA7Q8TQOaiwharBN6l+0hy89LIFMzYoQaZiVYoG324/zXHX/KvYnNoUc
 vk8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 23:06:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQK4H09QQz1RwtC
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 23:06:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662876395; x=1665468396; bh=mnRPljXeNSeXNhnAt126mJUAldzaoFPN4gX
 SNCureDQ=; b=VwwsbLrGYOtRWxe4GhVL/u/3WOwWjOvu+5ZHKDXAT52TQjyRcgX
 5WMm+L0oCcwm9065ISZQabJSq/bdz0VqiCIMUWkqjaRAHVECTB7CvlrnRRqRwGqo
 ALF3Iv1/s/UyuXA3pPv5ggY6eaI+iEhGHJlQvbnI0DwLrvbxyghgIMfxtA9ivWeX
 R121pp3B9Nb2hErdKVaSbh+E+MYJnv2WiZVHSlG45ttvyVJdvvbvQHbzBfBW41zV
 FLt+86XZR/iBC6hbIP76nt6XCOvbDBqMmWvR0HKcWUXCq4ggZlpth/rua+EywLA2
 mshL7bMkXiixsqzP6kS6weYHoSafYjtpdag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id d1gu5tRbGnoE for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 23:06:35 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQK493LlWz1RvLy;
 Sat, 10 Sep 2022 23:06:33 -0700 (PDT)
Message-ID: <9665c8b0-b291-7a42-8242-73a7c0967917@opensource.wdc.com>
Date: Sun, 11 Sep 2022 15:06:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH] block: introduce zone append write for zoned devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
References: <20220910063836.31295-1-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220910063836.31295-1-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 2022/09/10 15:38, Sam Li wrote:
> A zone append command is a write operation that specifies the first
> logical block of a zone as the write position. When writing to a zoned
> block device using zone append, the byte offset of the write is pointing
> to the write pointer of that zone. Upon completion the device will
> respond with the position the data has been placed in the zone.

s/placed/written

You need to explain more about what this patch does:

Since Linux does not provide a user API to issue zone append operations to zoned
devices from user space, the file-posix driver is modified to add zone append
emulation using regular write operations. To do this, the file-posix driver
tracks the wp location of all zones of the device.... Blah.

> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/block-backend.c              |  65 +++++++++++
>  block/file-posix.c                 | 169 ++++++++++++++++++++++++++++-
>  block/io.c                         |  21 ++++
>  block/raw-format.c                 |   7 ++
>  include/block/block-common.h       |   2 +
>  include/block/block-io.h           |   3 +
>  include/block/block_int-common.h   |   9 ++
>  include/block/raw-aio.h            |   4 +-
>  include/sysemu/block-backend-io.h  |   9 ++
>  qemu-io-cmds.c                     |  62 +++++++++++
>  tests/qemu-iotests/tests/zoned.out |   7 ++
>  tests/qemu-iotests/tests/zoned.sh  |   9 ++
>  12 files changed, 360 insertions(+), 7 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index ebe8d7bdf3..b77a1cb24b 100644
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
> @@ -1920,6 +1964,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
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
> index 354de22860..65500e43f4 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -173,6 +173,7 @@ typedef struct BDRVRawState {
>      } stats;
>  
>      PRManager *pr_mgr;
> +    CoRwlock zones_lock;
>  } BDRVRawState;
>  
>  typedef struct BDRVRawReopenState {
> @@ -206,6 +207,8 @@ typedef struct RawPosixAIOData {
>          struct {
>              struct iovec *iov;
>              int niov;
> +            int64_t *append_sector;
> +            BlockZoneDescriptor *zone;
>          } io;
>          struct {
>              uint64_t cmd;
> @@ -1333,6 +1336,9 @@ static int hdev_get_max_segments(int fd, struct stat *st) {
>  #endif
>  }
>  
> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> +                              const struct blk_zone *blkz);
> +static int do_zone_report(int64_t offset, int fd, struct BlockZoneDescriptor *zones, unsigned int nrz);
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> @@ -1402,6 +1408,19 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>          if (ret >= 0) {
>              bs->bl.max_active_zones = ret;
>          }
> +
> +        ret = get_sysfs_long_val(&st, "logical_block_size");
> +        if (ret >= 0) {
> +            bs->bl.logical_block_size = ret;
> +        }
> +
> +        ret = get_sysfs_long_val(&st, "nr_zones");
> +        if (ret > 0) {
> +            bs->bl.nr_zones = ret;
> +            int64_t zones_size = ret * sizeof(BlockZoneDescriptor);
> +            bs->bl.zones = g_malloc(zones_size);
> +            do_zone_report(0, s->fd, bs->bl.zones, ret);

What happens if this fails ?

> +        }
>      }
>  }
>  
> @@ -1569,18 +1588,24 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>      ssize_t len;
>  
>      do {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>              len = qemu_pwritev(aiocb->aio_fildes,
>                                 aiocb->io.iov,
>                                 aiocb->io.niov,
>                                 aiocb->aio_offset);
> -         else
> +        } else if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +            uint64_t wp = aiocb->aio_offset;
> +            len = qemu_pwritev(aiocb->aio_fildes,
> +                               aiocb->io.iov,
> +                               aiocb->io.niov,
> +                               wp);

That wp variable is not necessary, which makes this "else if" also unnecessary.
What about simply:

           if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
               len = qemu_pwritev(aiocb->aio_fildes,
                                  aiocb->io.iov,
                                  aiocb->io.niov,
                                  aiocb->aio_offset);
           else
	       ...

>              len = qemu_preadv(aiocb->aio_fildes,
>                                aiocb->io.iov,
>                                aiocb->io.niov,
>                                aiocb->aio_offset);
> +        }
>      } while (len == -1 && errno == EINTR);
> -

whiteline change.

>      if (len == -1) {
>          return -errno;
>      }
> @@ -1604,6 +1629,12 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>                           (const char *)buf + offset,
>                           aiocb->aio_nbytes - offset,
>                           aiocb->aio_offset + offset);
> +        } else if (aiocb->aio_type == QEMU_AIO_ZONE_APPEND) {
> +            uint64_t wp = aiocb->aio_offset;

This variable is not necessary.

> +            len = pwrite(aiocb->aio_fildes,
> +                         (const char *)buf + offset,
> +                         aiocb->aio_nbytes - offset,
> +                         wp + offset);
>          } else {
>              len = pread(aiocb->aio_fildes,
>                          buf + offset,
> @@ -1638,7 +1669,6 @@ static int handle_aiocb_rw(void *opaque)
>      RawPosixAIOData *aiocb = opaque;
>      ssize_t nbytes;
>      char *buf;
> -

whiteline change.

>      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
>          /*
>           * If there is just a single buffer, and it is properly aligned
> @@ -1692,7 +1722,7 @@ static int handle_aiocb_rw(void *opaque)
>      }
>  
>      nbytes = handle_aiocb_rw_linear(aiocb, buf);
> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
>          char *p = buf;
>          size_t count = aiocb->aio_nbytes, copy;
>          int i;
> @@ -1713,6 +1743,25 @@ static int handle_aiocb_rw(void *opaque)
>  
>  out:
>      if (nbytes == aiocb->aio_nbytes) {
> +#if defined(CONFIG_BLKZONED)
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
> +            BlockZoneDescriptor *zone = aiocb->io.zone;
> +            int64_t nr_sectors = aiocb->aio_nbytes / 512;
> +            if (zone) {
> +                qemu_mutex_init(&zone->lock);
> +                if (zone->type == BLK_ZT_SWR) {
> +                    qemu_mutex_lock(&zone->lock);
> +                    zone->wp += nr_sectors;
> +                    qemu_mutex_unlock(&zone->lock);
> +                }
> +                qemu_mutex_destroy(&zone->lock);

This is weird. you init the mutex, lock/unlock it and destroy it. So it has
absolutely no meaning at all.

> +
> +                if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +                    *aiocb->io.append_sector = zone->wp;

This needs to be done with the zone mutex locked. Otherwise, when reaching this
code, the zone wp may have changed already and so you would be returning the
wrong position.

> +                }
> +            }
> +        }
> +#endif
>          return 0;
>      } else if (nbytes >= 0 && nbytes < aiocb->aio_nbytes) {
>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
> @@ -1724,6 +1773,13 @@ out:
>          }
>      } else {
>          assert(nbytes < 0);
> +        if (aiocb->aio_type == QEMU_AIO_ZONE_APPEND) {
> +            BDRVRawState *s = aiocb->bs->opaque;
> +            qemu_co_rwlock_init(&s->zones_lock);
> +            qemu_co_rwlock_rdlock(&s->zones_lock);
> +            do_zone_report(0, aiocb->aio_fildes, aiocb->bs->bl.zones, aiocb->bs->bl.nr_zones);
> +            qemu_co_rwlock_unlock(&s->zones_lock);
> +        }
>          return nbytes;
>      }
>  }
> @@ -2012,17 +2068,23 @@ static int handle_aiocb_zone_report(void *opaque) {
>  static int handle_aiocb_zone_mgmt(void *opaque) {
>  #if defined(CONFIG_BLKZONED)
>      RawPosixAIOData *aiocb = opaque;
> +    BlockDriverState *bs = aiocb->bs;
>      int fd = aiocb->aio_fildes;
>      int64_t sector = aiocb->aio_offset / 512;
>      int64_t nr_sectors = aiocb->aio_nbytes / 512;
>      struct blk_zone_range range;
> +    unsigned long zone_op = aiocb->zone_mgmt.zone_op;
>      int ret;
>  
> +    BlockZoneDescriptor *zones;
> +    zones = bs->bl.zones;
> +    int index = sector / bs->bl.zone_sectors;
> +
>      /* Execute the operation */
>      range.sector = sector;
>      range.nr_sectors = nr_sectors;
>      do {
> -        ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
> +        ret = ioctl(fd, zone_op, &range);
>      } while (ret != 0 && errno == EINTR);
>  
>      if (ret != 0) {
> @@ -2030,6 +2092,28 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>                       errno);
>          return -errno;
>      }
> +    
> +    if (aiocb->zone_mgmt.all) {
> +        for (int i = 0; i < bs->bl.nr_zones; ++i) {
> +            qemu_mutex_init(&zones[i].lock);
> +            qemu_mutex_lock(&zones[i].lock);
> +            zones[i].wp = zones[i].start;
> +            qemu_mutex_unlock(&zones[i].lock);
> +            qemu_mutex_destroy(&zones[i].lock);

Same comment here. The mutex init/destroy calls should not be here. The zone
mutex should be initialized when the zone array is first allocated and destroyed
when the zone array is freed. In between these events, the zone mutex should
NEVER be reinitialized.

> +        }
> +    } else if (zone_op == BLKRESETZONE) {
> +        qemu_mutex_init(&zones[index].lock);
> +        qemu_mutex_lock(&zones[index].lock);
> +        zones[index].wp = zones[index].start;
> +        qemu_mutex_unlock(&zones[index].lock);
> +        qemu_mutex_destroy(&zones[index].lock);
> +    } else if (zone_op == BLKFINISHZONE) {
> +        qemu_mutex_init(&zones[index].lock);
> +        qemu_mutex_lock(&zones[index].lock);
> +        zones[index].wp = zones[index].start + zones[index].length;
> +        qemu_mutex_unlock(&zones[index].lock);
> +        qemu_mutex_destroy(&zones[index].lock);
> +    }
>      return ret;
>  #else
>      return -ENOTSUP;
> @@ -2340,6 +2424,17 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>          },
>      };
>  
> +    int64_t sector = offset / 512;
> +    struct stat st;
> +    if (fstat(s->fd, &st)) {
> +        return -1;
> +    }
> +    int64_t zone_sector = get_sysfs_long_val(&st, "chunk_sectors");
> +    if (zone_sector > 0) {
> +        int index = sector / bs->bl.zone_sectors;
> +        BlockZoneDescriptor *zone = &bs->bl.zones[index];
> +        acb.io.zone = zone;

The zone variable is not necessary. You may also want to add a small inline
helper function to get a zone pointer from a sector value.

> +    }
>      assert(qiov->size == bytes);
>      return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>  }
> @@ -2448,6 +2543,9 @@ static void raw_aio_attach_aio_context(BlockDriverState *bs,
>  static void raw_close(BlockDriverState *bs)
>  {
>      BDRVRawState *s = bs->opaque;
> +#if defined(CONFIG_BLKZONED)
> +    g_free(bs->bl.zones);
> +#endif
>  
>      if (s->fd >= 0) {
>          qemu_close(s->fd);
> @@ -3283,6 +3381,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>          zone_op_name = "BLKRESETZONE";
>          zone_op = BLKRESETZONE;
>          break;
> +    case BLK_ZO_RESET_ALL:
> +        zone_op_name = "BLKRESETZONE";
> +        zone_op = BLKRESETZONE;
> +        is_all = true;
> +        break;
>      default:
>          g_assert_not_reached();
>      }
> @@ -3306,6 +3409,59 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>  #endif
>  }
>  
> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
> +                                           int64_t *offset,
> +                                           QEMUIOVector *qiov,
> +                                           BdrvRequestFlags flags) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s = bs->opaque;
> +    int64_t zone_sector = bs->bl.zone_sectors;
> +    int64_t zone_sector_mask = zone_sector - 1;
> +    int64_t iov_len = 0;
> +    int64_t len = 0;
> +    RawPosixAIOData acb;
> +
> +    if (*offset & zone_sector_mask) {
> +        error_report("offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId64 "", *offset, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    int64_t lbsz = bs->bl.logical_block_size;> +    int64_t lbsz_mask = lbsz - 1;
> +    for (int i = 0; i < qiov->niov; i++) {
> +       iov_len = qiov->iov[i].iov_len;
> +       if (iov_len & lbsz_mask) {
> +           error_report("len of IOVector[%d] %" PRId64 " is not aligned to block "
> +                        "size %" PRId64 "", i, iov_len, lbsz);
> +           return -EINVAL;
> +       }

This alignment check should be against the device write granularity, not the
logical block size. The write granularity will always be equal to the device
physical block size, which may or may not be equal to the device logical block
size. E.g. a 512e SMR disk has a 512B logical block size but a 4096B physical
block size. And the ZBC & ZAC specifications mandate that all write be aligned
to the physical block size.

> +       len += iov_len;
> +    }
> +
> +    int64_t sector = *offset / 512; //??? did not multiply before
> +    BlockZoneDescriptor *zone = &bs->bl.zones[sector/zone_sector];
> +
> +    acb = (RawPosixAIOData) {
> +        .bs = bs,
> +        .aio_fildes = s->fd,
> +        .aio_type = QEMU_AIO_ZONE_APPEND,
> +        .aio_offset = zone->wp * 512,
> +        .aio_nbytes = len,
> +        .io = {
> +                .iov = qiov->iov,
> +                .niov = qiov->niov,
> +                .zone = zone,
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
> @@ -4081,6 +4237,7 @@ static BlockDriver bdrv_zoned_host_device = {
>      /* zone management operations */
>      .bdrv_co_zone_report = raw_co_zone_report,
>      .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +    .bdrv_co_zone_append = raw_co_zone_append,
>  };
>  #endif
>  
> diff --git a/block/io.c b/block/io.c
> index de9ec1d740..3ade9361e4 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3239,6 +3239,27 @@ out:
>      return co.ret;
>  }
>  
> +int bdrv_co_zone_append(BlockDriverState *bs, int64_t *offset,
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
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 36bd0e480e..a55e9b390e 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -54,6 +54,7 @@ typedef enum BlockZoneOp {
>      BLK_ZO_CLOSE,
>      BLK_ZO_FINISH,
>      BLK_ZO_RESET,
> +    BLK_ZO_RESET_ALL,
>  } BlockZoneOp;
>  
>  typedef enum BlockZoneModel {
> @@ -84,6 +85,7 @@ typedef enum BlockZoneType {
>   * Provides information on a zone with all position and size values in bytes.
>   */
>  typedef struct BlockZoneDescriptor {
> +    QemuMutex lock;
>      uint64_t start;
>      uint64_t length;
>      uint64_t cap;
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
> index 043aa161a0..ebda5953dc 100644
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
> @@ -854,6 +857,12 @@ typedef struct BlockLimits {
>  
>      /* maximum number of active zones */
>      int64_t max_active_zones;
> +
> +    /* array of zones in the zoned block device. Only tracks write pointer's
> +     * location of each zone as a helper for zone_append API */
> +    BlockZoneDescriptor *zones;

This is a lot of memory for only tracking the wp... Why not reduce this to an
array of int64 values, for the wp only ? As you may need the zone type too
(conventional vs sequential), you can use the most significant bit (a zone wp
value will never use all 64 bits !).

Or device another zone structure with zone type, zone wp and mutex only, so
smaller than the regular zone report structure.

> +
> +    int64_t logical_block_size;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
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
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 446a059603..8868c88290 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1850,6 +1850,67 @@ static const cmdinfo_t zone_reset_cmd = {
>          .oneline = "reset a zone write pointer in zone block device",
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
> +static int zone_append_f(BlockBackend *blk, int argc, char **argv) {
> +    int ret;
> +//    struct timespec t1, t2;
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
> +        .name = "zone_append",
> +        .altname = "zap",
> +        .cfunc = zone_append_f,
> +        .argmin = 3,
> +        .argmax = 3,
> +        .args = "offset len [len..]",
> +        .oneline = "append write a number of bytes at a specified offset",
> +};
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd = {
>      .name       = "truncate",
> @@ -2647,6 +2708,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
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
> index 871f47efed..b4dc89aaac 100755
> --- a/tests/qemu-iotests/tests/zoned.sh
> +++ b/tests/qemu-iotests/tests/zoned.sh
> @@ -79,6 +79,15 @@ echo "(5) resetting the second zone"
>  sudo $QEMU_IO $IMG -c "zrs 268435456 268435456"
>  echo "After resetting a zone:"
>  sudo $QEMU_IO $IMG -c "zrp 268435456 1"
> +echo
> +echo
> +echo "(6) append write" # assuming block size of device is 4096
> +sudo $QEMU_IO $IMG -c "zap 0 0x1000 0x2000"
> +echo "After appending the first zone:"
> +sudo $QEMU_IO $IMG -c "zrp 0 1"
> +sudo $QEMU_IO $IMG -c "zap 268435456 0x1000 0x2000"
> +echo "After appending the second zone:"
> +sudo $QEMU_IO $IMG -c "zrp 268435456 1"
>  # success, all done
>  echo "*** done"
>  rm -f $seq.full

-- 
Damien Le Moal
Western Digital Research


