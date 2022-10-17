Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89720600616
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 07:00:01 +0200 (CEST)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okIEK-0007eB-3G
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 01:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okIBy-0006BA-Oi
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 00:57:34 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:8390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okIBv-00039N-Ci
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 00:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665982651; x=1697518651;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T/LkclhbgFrKNEXjtkWNiPhmDm0m87Q8dQpK79/4LRA=;
 b=GWIC91+lzQhrBtGn2s/G070v9L9xKr4C3D8ov5gup12TCyi2SOZ1Zaow
 P/baOVdPlkC6dRxcJarN1Mma6wMZ0YlhMFe4LxB2n5mgl3hGPPPKM1E1C
 X54/VrUs2PpoOouaa1CW6WkbCn4xgxiAajKmafPkpwj0EuSrq9xIRngj1
 fcnfV9EfeIOKJHEqPJkNJ6luOjDlmdKsYisXhyRnmw8X/outURnoxPDox
 Ik+IlZBK3yRB5T4U0gYV/9g0dke9NSU6unyXiMsiMmwK8LNRIJuPw8TX4
 LG8MaijDwOg1cAYizUmxMZYq41FHKCEVwxbbyfJ+blg2pDwFJnAJVoDBA Q==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="214372934"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 12:57:21 +0800
IronPort-SDR: dPC5CaEtqcLBSTQCHiO71dleKEKwFvRd9cUmEF1ge8sJrfbVbLi4t/PFa9AiZaOfVNQGIJP4RE
 csHgyWmkrgbt/gwNGNf/QnPV95HVfQTPgCyi1rwyk5fN5eqjfh3vhQ92ArL0E+g+bldwdDXI/x
 FNOv0wHI4FfnzYXCugxeXWpShRtcZo3hFlIrBIWyRW6ZbDT3qNJuplgxlzaOD/6IhUAeZLnmDJ
 ZBv0jrMopVIgpti6dz3YWxB4QRnhUEf028VgGxnomturSQ82BshD2i2uhbuNBm46Ggb6FmIjbM
 XUNgD3a04U/6nx1sfKdGeQNm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 21:11:16 -0700
IronPort-SDR: sK0vyjyC5wqbGStTdY38tjjFeaF7mOEQ1t0Ke5zx03IOZu7mvM0GWrAKtzJsgomDXdnwzBP+fv
 /OaO499V9OgHnLTqxoXmWT5RvE6BwJyHizyQkBxev2yeeQpV/Oo41A7yroK7S3z6oZxpAU1Js8
 0gWaNwpJE4Gyo01hT4WWHuMh8Z74jvdezsrekWYwqoA0Tx1a77Noe9zUAvnyqTD0Fpc0ahGEY5
 ys/Fmwkn64U1YIQZFCXCcsEYms1isWiPiBqo+JIFRx+lKEP4jh5jeBUrIbVzt3kQ9J56T1qtVd
 qgE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 21:57:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrPqj2DfVz1RwvL
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 21:57:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665982636; x=1668574637; bh=T/LkclhbgFrKNEXjtkWNiPhmDm0m87Q8dQp
 K79/4LRA=; b=kfuDECQDYgvtJCIjbQy0mQbEq+StDkPSLOoEJHzU3sPP80hvjBf
 N7iRHFCj2/nzr7X5ZjakIxFhy2XiAjD82gdj899E80Vvv9P+4I8DH0cNij62h8+H
 jl2TiPCSsuhaao8Dh6wVWSsl4gSKDbcobVMRVq6tOUNHPDtI8DvaICA/YwHlA/Tb
 PXSLxnc195D+pd6On2ApGrG8BAQJWWsPUzitpp84C+QPCdBA6VV+XCWsOhYFMC7u
 rzk+p3xvH1LEC0rsfsPG1WQ2NVxrUMDs+gLNv5+kbvnFHw6Fk+JiPUKRh8z33Ntq
 QB61lA/v3z3oAwIEbO44WfFIKHG6gUXFCRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qiaJoEFKQMm1 for <qemu-devel@nongnu.org>;
 Sun, 16 Oct 2022 21:57:16 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrPqZ28pWz1RvLy;
 Sun, 16 Oct 2022 21:57:14 -0700 (PDT)
Message-ID: <fb2ec4eb-e447-164e-8994-602c1908f48e@opensource.wdc.com>
Date: Mon, 17 Oct 2022 13:57:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, hare@suse.de,
 Eric Blake <eblake@redhat.com>, dmitry.fomichev@wdc.com
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-4-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221016145110.171262-4-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2824960c0=damien.lemoal@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/16/22 23:51, Sam Li wrote:
> Add a new zoned_host_device BlockDriver. The zoned_host_device option
> accepts only zoned host block devices. By adding zone management
> operations in this new BlockDriver, users can use the new block
> layer APIs including Report Zone and four zone management operations
> (open, close, finish, reset, reset_all).
> 
> Qemu-io uses the new APIs to perform zoned storage commands of the device:
> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> zone_finish(zf).
> 
> For example, to test zone_report, use following command:
> $ ./build/qemu-io --image-opts -n driver=zoned_host_device, filename=/dev/nullb0
> -c "zrp offset nr_zones"
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/block-backend.c             | 148 +++++++++++++
>  block/file-posix.c                | 335 ++++++++++++++++++++++++++++++
>  block/io.c                        |  41 ++++
>  include/block/block-io.h          |   7 +
>  include/block/block_int-common.h  |  24 +++
>  include/block/raw-aio.h           |   6 +-
>  include/sysemu/block-backend-io.h |  18 ++
>  meson.build                       |   4 +
>  qapi/block-core.json              |   8 +-
>  qemu-io-cmds.c                    | 149 +++++++++++++
>  10 files changed, 737 insertions(+), 3 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index aa4adf06ae..1c618e9c68 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1431,6 +1431,15 @@ typedef struct BlkRwCo {
>      void *iobuf;
>      int ret;
>      BdrvRequestFlags flags;
> +    union {
> +        struct {
> +            unsigned int *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        struct {
> +            unsigned long op;
> +        } zone_mgmt;
> +    };
>  } BlkRwCo;
>  
>  int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
> @@ -1775,6 +1784,145 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
>      return ret;
>  }
>  
> +static void coroutine_fn blk_aio_zone_report_entry(void *opaque)
> +{
> +    BlkAioEmAIOCB *acb = opaque;
> +    BlkRwCo *rwco = &acb->rwco;
> +
> +    rwco->ret = blk_co_zone_report(rwco->blk, rwco->offset,
> +                                   rwco->zone_report.nr_zones,
> +                                   rwco->zone_report.zones);
> +    blk_aio_complete(acb);
> +}
> +
> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> +                                unsigned int *nr_zones,
> +                                BlockZoneDescriptor  *zones,
> +                                BlockCompletionFunc *cb, void *opaque)
> +{
> +    BlkAioEmAIOCB *acb;
> +    Coroutine *co;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> +    acb->rwco = (BlkRwCo) {
> +        .blk    = blk,
> +        .offset = offset,
> +        .ret    = NOT_DONE,
> +        .zone_report = {
> +            .zones = zones,
> +            .nr_zones = nr_zones,
> +        },
> +    };
> +    acb->has_returned = false;
> +
> +    co = qemu_coroutine_create(blk_aio_zone_report_entry, acb);
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
> +static void coroutine_fn blk_aio_zone_mgmt_entry(void *opaque)
> +{
> +    BlkAioEmAIOCB *acb = opaque;
> +    BlkRwCo *rwco = &acb->rwco;
> +
> +    rwco->ret = blk_co_zone_mgmt(rwco->blk, rwco->zone_mgmt.op,
> +                                 rwco->offset, acb->bytes);
> +    blk_aio_complete(acb);
> +}
> +
> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                              int64_t offset, int64_t len,
> +                              BlockCompletionFunc *cb, void *opaque) {
> +    BlkAioEmAIOCB *acb;
> +    Coroutine *co;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
> +    acb->rwco = (BlkRwCo) {
> +        .blk    = blk,
> +        .offset = offset,
> +        .ret    = NOT_DONE,
> +        .zone_mgmt = {
> +            .op = op,
> +        },
> +    };
> +    acb->bytes = len;
> +    acb->has_returned = false;
> +
> +    co = qemu_coroutine_create(blk_aio_zone_mgmt_entry, acb);
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
> +/*
> + * Send a zone_report command.
> + * offset is a byte offset from the start of the device. No alignment
> + * required for offset.
> + * nr_zones represents IN maximum and OUT actual.
> + */
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +    blk_inc_in_flight(blk); /* increase before waiting */
> +    blk_wait_while_drained(blk);
> +    if (!blk_is_available(blk)) {
> +        blk_dec_in_flight(blk);
> +        return -ENOMEDIUM;
> +    }
> +    ret = bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
> +/*
> + * Send a zone_management command.
> + * op is the zone operation;
> + * offset is the byte offset from the start of the zoned device;
> + * len is the maximum number of bytes the command should operate on. It
> + * should be aligned with the device zone size.
> + */
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +

Nit: extra blank line here.

> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +
> +    ret = blk_check_byte_request(blk, offset, len);
> +    if (ret < 0) {
> +        blk_dec_in_flight(blk);
> +        return ret;
> +    }
> +
> +    ret = bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
> +    blk_dec_in_flight(blk);
> +    return ret;
> +}
> +
>  void blk_drain(BlockBackend *blk)
>  {
>      BlockDriverState *bs = blk_bs(blk);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 8cb07fdb8a..bd28e3eaea 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -67,6 +67,9 @@
>  #include <sys/param.h>
>  #include <sys/syscall.h>
>  #include <sys/vfs.h>
> +#if defined(CONFIG_BLKZONED)
> +#include <linux/blkzoned.h>
> +#endif
>  #include <linux/cdrom.h>
>  #include <linux/fd.h>
>  #include <linux/fs.h>
> @@ -215,6 +218,14 @@ typedef struct RawPosixAIOData {
>              PreallocMode prealloc;
>              Error **errp;
>          } truncate;
> +        struct {
> +            unsigned int *nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report;
> +        struct {
> +            unsigned long zone_op;
> +            const char *zone_op_name;

Nit: This could be simplified to "op" and "op_name". No big deal though.

> +        } zone_mgmt;
>      };
>  } RawPosixAIOData;
>  
> @@ -1350,6 +1361,48 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>          zoned = BLK_Z_NONE;
>      }
>      bs->bl.zoned = zoned;
> +    if (zoned != BLK_Z_NONE) {
> +        /*
> +         * The zoned device must at least have zone size and nr_zones fields.
> +         */
> +        ret = get_sysfs_long_val(&st, "chunk_sectors");
> +        if (ret <= 0) {
> +            error_report("Invalid zone size %" PRId32 " sectors ", ret);
> +            bs->bl.zoned = BLK_Z_NONE;
> +            return;
> +        }
> +        bs->bl.zone_size = ret << BDRV_SECTOR_BITS;
> +
> +        ret = get_sysfs_long_val(&st, "nr_zones");
> +        if (ret <= 0) {
> +            error_report("Invalid number of zones %" PRId32 "", ret);
> +            bs->bl.zoned = BLK_Z_NONE;
> +            return;
> +        }
> +        bs->bl.nr_zones = ret;
> +
> +        ret = ioctl(s->fd, BLKGETSIZE64, &bs->bl.capacity);
> +        if (ret != 0) {
> +            error_report("Failed to get device capacity %" PRId64 " bytes ",
> +                         bs->bl.capacity);
> +            return;
> +        }
> +
> +        ret = get_sysfs_long_val(&st, "zone_append_max_bytes");
> +        if (ret > 0) {
> +            bs->bl.max_append_sectors = ret >> BDRV_SECTOR_BITS;
> +        }
> +
> +        ret = get_sysfs_long_val(&st, "max_open_zones");
> +        if (ret >= 0) {
> +            bs->bl.max_open_zones = ret;
> +        }
> +
> +        ret = get_sysfs_long_val(&st, "max_active_zones");
> +        if (ret >= 0) {
> +            bs->bl.max_active_zones = ret;
> +        }
> +    }
>  }
>  
>  static int check_for_dasd(int fd)
> @@ -1844,6 +1897,144 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>  }
>  #endif
>  
> +/*
> + * parse_zone - Fill a zone descriptor
> + */
> +#if defined(CONFIG_BLKZONED)
> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> +                              const struct blk_zone *blkz) {
> +    zone->start = blkz->start << BDRV_SECTOR_BITS;
> +    zone->length = blkz->len << BDRV_SECTOR_BITS;
> +    zone->wp = blkz->wp << BDRV_SECTOR_BITS;
> +
> +#ifdef HAVE_BLK_ZONE_REP_CAPACITY
> +    zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
> +#else
> +    zone->cap = blkz->len << BDRV_SECTOR_BITS;
> +#endif
> +
> +    switch (blkz->type) {
> +    case BLK_ZONE_TYPE_SEQWRITE_REQ:
> +        zone->type = BLK_ZT_SWR;
> +        break;
> +    case BLK_ZONE_TYPE_SEQWRITE_PREF:
> +        zone->type = BLK_ZT_SWP;
> +        break;
> +    case BLK_ZONE_TYPE_CONVENTIONAL:
> +        zone->type = BLK_ZT_CONV;
> +        break;
> +    default:
> +        error_report("Invalid zone type: 0x%x", blkz->type);

The error message here should be: "Unsupported zone type...", as the value
may be perfectly valid for Linux but QEMU not know about it because e.g.
an old version is being used.

Also, I would rather have an error return here so that the caller is notified.

> +    }
> +
> +    switch (blkz->cond) {
> +    case BLK_ZONE_COND_NOT_WP:
> +        zone->cond = BLK_ZS_NOT_WP;
> +        break;
> +    case BLK_ZONE_COND_EMPTY:
> +        zone->cond = BLK_ZS_EMPTY;
> +        break;
> +    case BLK_ZONE_COND_IMP_OPEN:
> +        zone->cond = BLK_ZS_IOPEN;
> +        break;
> +    case BLK_ZONE_COND_EXP_OPEN:
> +        zone->cond = BLK_ZS_EOPEN;
> +        break;
> +    case BLK_ZONE_COND_CLOSED:
> +        zone->cond = BLK_ZS_CLOSED;
> +        break;
> +    case BLK_ZONE_COND_READONLY:
> +        zone->cond = BLK_ZS_RDONLY;
> +        break;
> +    case BLK_ZONE_COND_FULL:
> +        zone->cond = BLK_ZS_FULL;
> +        break;
> +    case BLK_ZONE_COND_OFFLINE:
> +        zone->cond = BLK_ZS_OFFLINE;
> +        break;
> +    default:
> +        error_report("Invalid zone state: 0x%x", blkz->cond);

Same comment here. And we need an error return.

> +    }
> +}
> +#endif
> +
> +#if defined(CONFIG_BLKZONED)
> +static int handle_aiocb_zone_report(void *opaque)
> +{
> +    RawPosixAIOData *aiocb = opaque;
> +    int fd = aiocb->aio_fildes;
> +    unsigned int *nr_zones = aiocb->zone_report.nr_zones;
> +    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
> +    /* zoned block devices use 512-byte sectors */
> +    int64_t sector = aiocb->aio_offset / 512;
> +
> +    struct blk_zone *blkz;
> +    int64_t rep_size;
> +    unsigned int nrz;
> +    int ret, n = 0, i = 0;
> +
> +    nrz = *nr_zones;
> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
> +    g_autofree struct blk_zone_report *rep = NULL;
> +    rep = g_malloc(rep_size);
> +
> +    blkz = (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector = sector;
> +        rep->nr_zones = nrz - n;
> +
> +        do {
> +            ret = ioctl(fd, BLKREPORTZONE, rep);
> +        } while (ret != 0 && errno == EINTR);
> +        if (ret != 0) {
> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed %d",
> +                         fd, sector, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i = 0; i < rep->nr_zones; i++, n++) {
> +            parse_zone(&zones[n], &blkz[i]);

Need to check for errors here, and if there is an error reported, fail
this aio so that unhandled/unsupported values are no propagated to the guest.

> +            /* The next report should start after the last zone reported */
> +            sector = blkz[i].start + blkz[i].len;
> +        }
> +    }
> +
> +    *nr_zones = n;
> +    return 0;
> +}
> +#endif
> +
> +#if defined(CONFIG_BLKZONED)
> +static int handle_aiocb_zone_mgmt(void *opaque)
> +{
> +    RawPosixAIOData *aiocb = opaque;
> +    int fd = aiocb->aio_fildes;
> +    int64_t sector = aiocb->aio_offset / 512;
> +    int64_t nr_sectors = aiocb->aio_nbytes / 512;
> +    struct blk_zone_range range;
> +    int ret;
> +
> +    /* Execute the operation */
> +    range.sector = sector;
> +    range.nr_sectors = nr_sectors;
> +    do {
> +        ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
> +    } while (ret != 0 && errno == EINTR);
> +    if (ret != 0) {
> +        ret = -errno;
> +        error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
> +                     ret);
> +        return ret;
> +    }
> +    return 0;
> +}
> +#endif
> +
>  static int handle_aiocb_copy_range(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> @@ -3038,6 +3229,99 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
>      }
>  }
>  
> +/*
> + * zone report - Get a zone block device's information in the form
> + * of an array of zone descriptors.
> + * zones is an array of zone descriptors to hold zone information on reply;
> + * offset can be any byte within the entire size of the device;
> + * nr_zones is the maxium number of sectors the command should operate on.
> + */
> +#if defined(CONFIG_BLKZONED)
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                           unsigned int *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb = (RawPosixAIOData) {
> +        .bs         = bs,
> +        .aio_fildes = s->fd,
> +        .aio_type   = QEMU_AIO_ZONE_REPORT,
> +        .aio_offset = offset,
> +        .zone_report    = {
> +            .nr_zones       = nr_zones,
> +            .zones          = zones,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> +}
> +#endif
> +
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +#if defined(CONFIG_BLKZONED)
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len) {
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +    int64_t zone_size, zone_size_mask;
> +    const char *zone_op_name;
> +    unsigned long zone_op;
> +
> +    zone_size = bs->bl.zone_size;
> +    zone_size_mask = zone_size - 1;
> +    if (offset & zone_size_mask) {
> +        error_report("sector offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId64 "", offset / 512, zone_size / 512);
> +        return -EINVAL;
> +    }
> +
> +    if (((offset + len) < bs->bl.capacity && len & zone_size_mask) ||
> +        offset + len > bs->bl.capacity) {
> +        error_report("number of sectors %" PRId64 " is not aligned to zone size"
> +                      " %" PRId64 "", len / 512, zone_size / 512);
> +        return -EINVAL;
> +    }
> +
> +    switch (op) {
> +    case BLK_ZO_OPEN:
> +        zone_op_name = "BLKOPENZONE";
> +        zone_op = BLKOPENZONE;
> +        break;
> +    case BLK_ZO_CLOSE:
> +        zone_op_name = "BLKCLOSEZONE";
> +        zone_op = BLKCLOSEZONE;
> +        break;
> +    case BLK_ZO_FINISH:
> +        zone_op_name = "BLKFINISHZONE";
> +        zone_op = BLKFINISHZONE;
> +        break;
> +    case BLK_ZO_RESET:
> +        zone_op_name = "BLKRESETZONE";
> +        zone_op = BLKRESETZONE;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    acb = (RawPosixAIOData) {
> +        .bs             = bs,
> +        .aio_fildes     = s->fd,
> +        .aio_type       = QEMU_AIO_ZONE_MGMT,
> +        .aio_offset     = offset,
> +        .aio_nbytes     = len,
> +        .zone_mgmt  = {
> +            .zone_op = zone_op,
> +            .zone_op_name = zone_op_name,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> +}
> +#endif
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -3768,6 +4052,54 @@ static BlockDriver bdrv_host_device = {
>  #endif
>  };
>  
> +#if defined(CONFIG_BLKZONED)
> +static BlockDriver bdrv_zoned_host_device = {
> +    .format_name = "zoned_host_device",
> +    .protocol_name = "zoned_host_device",
> +    .instance_size = sizeof(BDRVRawState),
> +    .bdrv_needs_filename = true,
> +    .bdrv_probe_device  = hdev_probe_device,
> +    .bdrv_file_open     = hdev_open,
> +    .bdrv_close         = raw_close,
> +    .bdrv_reopen_prepare = raw_reopen_prepare,
> +    .bdrv_reopen_commit  = raw_reopen_commit,
> +    .bdrv_reopen_abort   = raw_reopen_abort,
> +    .bdrv_co_create_opts = bdrv_co_create_opts_simple,
> +    .create_opts         = &bdrv_create_opts_simple,
> +    .mutable_opts        = mutable_opts,
> +    .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
> +    .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
> +
> +    .bdrv_co_preadv         = raw_co_preadv,
> +    .bdrv_co_pwritev        = raw_co_pwritev,
> +    .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
> +    .bdrv_co_pdiscard       = hdev_co_pdiscard,
> +    .bdrv_co_copy_range_from = raw_co_copy_range_from,
> +    .bdrv_co_copy_range_to  = raw_co_copy_range_to,
> +    .bdrv_refresh_limits = raw_refresh_limits,
> +    .bdrv_io_plug = raw_aio_plug,
> +    .bdrv_io_unplug = raw_aio_unplug,
> +    .bdrv_attach_aio_context = raw_aio_attach_aio_context,
> +
> +    .bdrv_co_truncate       = raw_co_truncate,
> +    .bdrv_getlength = raw_getlength,
> +    .bdrv_get_info = raw_get_info,
> +    .bdrv_get_allocated_file_size
> +                        = raw_get_allocated_file_size,
> +    .bdrv_get_specific_stats = hdev_get_specific_stats,
> +    .bdrv_check_perm = raw_check_perm,
> +    .bdrv_set_perm   = raw_set_perm,
> +    .bdrv_abort_perm_update = raw_abort_perm_update,
> +    .bdrv_probe_blocksizes = hdev_probe_blocksizes,
> +    .bdrv_probe_geometry = hdev_probe_geometry,
> +    .bdrv_co_ioctl = hdev_co_ioctl,
> +
> +    /* zone management operations */
> +    .bdrv_co_zone_report = raw_co_zone_report,
> +    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
> +};
> +#endif
> +
>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>  static void cdrom_parse_filename(const char *filename, QDict *options,
>                                   Error **errp)
> @@ -4028,6 +4360,9 @@ static void bdrv_file_init(void)
>      bdrv_register(&bdrv_file);
>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>      bdrv_register(&bdrv_host_device);
> +#if defined(CONFIG_BLKZONED)
> +    bdrv_register(&bdrv_zoned_host_device);
> +#endif
>  #ifdef __linux__
>      bdrv_register(&bdrv_host_cdrom);
>  #endif
> diff --git a/block/io.c b/block/io.c
> index d30073036e..88f707ea4d 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3189,6 +3189,47 @@ out:
>      return co.ret;
>  }
>  
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        unsigned int *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_report) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_mgmt) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +    co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 492f95fc05..f0cdf67d33 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>  /* Ensure contents are flushed to disk.  */
>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>  
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                     unsigned int *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +                                   int64_t offset, int64_t len);
> +
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 7f7863cc9e..cdc06e77a6 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -691,6 +691,12 @@ struct BlockDriver {
>                                            QEMUIOVector *qiov,
>                                            int64_t pos);
>  
> +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
> +            int64_t offset, unsigned int *nr_zones,
> +            BlockZoneDescriptor *zones);
> +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, BlockZoneOp op,
> +            int64_t offset, int64_t len);
> +
>      /* removable device specific */
>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
> @@ -828,6 +834,24 @@ typedef struct BlockLimits {
>  
>      /* device zone model */
>      BlockZoneModel zoned;
> +
> +    /* zone size expressed in bytes */
> +    uint32_t zone_size;
> +
> +    /* total number of zones */
> +    unsigned int nr_zones;
> +
> +    /* maximum sectors of a zone append write operation */
> +    int64_t max_append_sectors;
> +
> +    /* maximum number of open zones */
> +    int64_t max_open_zones;
> +
> +    /* maximum number of active zones */
> +    int64_t max_active_zones;
> +
> +    /* device capacity expressed in bytes */
> +    int64_t capacity;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 21fc10c4c9..877b2240b3 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -29,6 +29,8 @@
>  #define QEMU_AIO_WRITE_ZEROES 0x0020
>  #define QEMU_AIO_COPY_RANGE   0x0040
>  #define QEMU_AIO_TRUNCATE     0x0080
> +#define QEMU_AIO_ZONE_REPORT  0x0100
> +#define QEMU_AIO_ZONE_MGMT    0x0200
>  #define QEMU_AIO_TYPE_MASK \
>          (QEMU_AIO_READ | \
>           QEMU_AIO_WRITE | \
> @@ -37,7 +39,9 @@
>           QEMU_AIO_DISCARD | \
>           QEMU_AIO_WRITE_ZEROES | \
>           QEMU_AIO_COPY_RANGE | \
> -         QEMU_AIO_TRUNCATE)
> +         QEMU_AIO_TRUNCATE | \
> +         QEMU_AIO_ZONE_REPORT | \
> +         QEMU_AIO_ZONE_MGMT)
>  
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 50f5aa2e07..1b5fc7db6b 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -45,6 +45,13 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
>                              BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_flush(BlockBackend *blk,
>                            BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> +                                unsigned int *nr_zones,
> +                                BlockZoneDescriptor *zones,
> +                                BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                              int64_t offset, int64_t len,
> +                              BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
>                               BlockCompletionFunc *cb, void *opaque);
>  void blk_aio_cancel_async(BlockAIOCB *acb);
> @@ -156,6 +163,17 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>  int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes, BdrvRequestFlags flags);
>  
> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> +                                    unsigned int *nr_zones,
> +                                    BlockZoneDescriptor *zones);
> +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
> +                                         unsigned int *nr_zones,
> +                                         BlockZoneDescriptor *zones);
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                                  int64_t offset, int64_t len);
> +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                                       int64_t offset, int64_t len);
> +
>  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes);
>  int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
> diff --git a/meson.build b/meson.build
> index 44c1f92697..0aa99b64a0 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1928,6 +1928,7 @@ config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'))
>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> @@ -2021,6 +2022,9 @@ config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
>  config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
>                       cc.has_member('struct stat', 'st_atim',
>                                     prefix: '#include <sys/stat.h>'))
> +config_host_data.set('HAVE_BLK_ZONE_REP_CAPACITY',
> +                     cc.has_member('struct blk_zone', 'capacity',
> +                                   prefix: '#include <linux/blkzoned.h>'))
>  
>  # has_type
>  config_host_data.set('CONFIG_IOVEC',
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 882b266532..05a3b44731 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2942,6 +2942,7 @@
>  # @compress: Since 5.0
>  # @copy-before-write: Since 6.2
>  # @snapshot-access: Since 7.0
> +# @zoned_host_device: Since 7.2
>  #
>  # Since: 2.9
>  ##
> @@ -2955,7 +2956,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }
>  
>  ##
>  # @BlockdevOptionsFile:
> @@ -4329,7 +4331,9 @@
>        'vhdx':       'BlockdevOptionsGenericFormat',
>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>        'vpc':        'BlockdevOptionsGenericFormat',
> -      'vvfat':      'BlockdevOptionsVVFAT'
> +      'vvfat':      'BlockdevOptionsVVFAT',
> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> +                             'if': 'CONFIG_BLKZONED' }
>    } }
>  
>  ##
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 952dc940f1..c1b28ea108 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1712,6 +1712,150 @@ static const cmdinfo_t flush_cmd = {
>      .oneline    = "flush all in-core file state to disk",
>  };
>  
> +static inline int64_t tosector(int64_t bytes)
> +{
> +    return bytes >> BDRV_SECTOR_BITS;
> +}
> +
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset;
> +    unsigned int nr_zones;
> +
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones = cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones = NULL;
> +    zones = g_new(BlockZoneDescriptor, nr_zones);
> +    ret = blk_zone_report(blk, offset, &nr_zones, zones);
> +    if (ret < 0) {
> +        printf("zone report failed: %s\n", strerror(-ret));
> +    } else {
> +        for (int i = 0; i < nr_zones; ++i) {
> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> +                   "cap"" 0x%" PRIx64 ", wptr 0x%" PRIx64 ", "
> +                   "zcond:%u, [type: %u]\n",
> +                    tosector(zones[i].start), tosector(zones[i].length),
> +                    tosector(zones[i].cap), tosector(zones[i].wp),
> +                    zones[i].cond, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +    .name = "zone_report",
> +    .altname = "zrp",
> +    .cfunc = zone_report_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset number",
> +    .oneline = "report zone information",
> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
> +    if (ret < 0) {
> +        printf("zone open failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_open_cmd = {
> +    .name = "zone_open",
> +    .altname = "zo",
> +    .cfunc = zone_open_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "explicit open a range of zones in zone block device",
> +};
> +
> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
> +    if (ret < 0) {
> +        printf("zone close failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_close_cmd = {
> +    .name = "zone_close",
> +    .altname = "zc",
> +    .cfunc = zone_close_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "close a range of zones in zone block device",
> +};
> +
> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
> +    if (ret < 0) {
> +        printf("zone finish failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_finish_cmd = {
> +    .name = "zone_finish",
> +    .altname = "zf",
> +    .cfunc = zone_finish_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "finish a range of zones in zone block device",
> +};
> +
> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
> +    if (ret < 0) {
> +        printf("zone reset failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_reset_cmd = {
> +    .name = "zone_reset",
> +    .altname = "zrs",
> +    .cfunc = zone_reset_f,
> +    .argmin = 2,
> +    .argmax = 2,
> +    .args = "offset len",
> +    .oneline = "reset a zone write pointer in zone block device",
> +};
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd = {
>      .name       = "truncate",
> @@ -2504,6 +2648,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
>      qemuio_add_command(&aio_write_cmd);
>      qemuio_add_command(&aio_flush_cmd);
>      qemuio_add_command(&flush_cmd);
> +    qemuio_add_command(&zone_report_cmd);
> +    qemuio_add_command(&zone_open_cmd);
> +    qemuio_add_command(&zone_close_cmd);
> +    qemuio_add_command(&zone_finish_cmd);
> +    qemuio_add_command(&zone_reset_cmd);
>      qemuio_add_command(&truncate_cmd);
>      qemuio_add_command(&length_cmd);
>      qemuio_add_command(&info_cmd);

-- 
Damien Le Moal
Western Digital Research


