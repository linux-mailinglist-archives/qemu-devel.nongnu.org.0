Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE495B4C30
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 07:37:39 +0200 (CEST)
Received: from localhost ([::1]:34110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXFez-0008Iz-P7
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 01:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFZV-00058T-2C
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:31:58 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFZR-0006Dc-GZ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662874311; x=1694410311;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NrSgFgvjaSKlik9sBFvDy1qJbpg0EbD/7doPHwnGp3o=;
 b=rIuYXaXIeCs/5b2Myt8K58g4ivBjZtplyFFiR1sxxoR+wj7hTQ561cv2
 WlY+pQH3lcC143YshzcGeWZPxk13M2dPfYdFaeVHPA4YQ3+6DCMuUSQBf
 ARUWc1BBKswtIBPE7xJ8LEU9YmXitcVgYX0bLru+m56t3fMkZuSlc7mNX
 feEGfYxWEPstQ8cHMSVB7kmwKag7A8ZlPt5I0gpy9hSrshOWCu3P73HYZ
 hPF7mUu/akbv3mehHdOINT2irFbeQYjVKPNmBau11tK7XUXnawKDvVU/B
 54m+fRr9s9Wezbu3H1mldyyIRi550pMPTw6FNDHhm+mHPVWc29FZpW0wS Q==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="216204225"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 13:31:38 +0800
IronPort-SDR: RPnjM9+qpT6dG+Qnfq+buB0w3hRFA4GWmHEx8U6ZxwttJOLr1DJhb3bRzhhzVc5WT1HQsXa5oF
 ma0IVcbhQU6KcfeBm4JGp8/Uq7m1aJSXC0Xiw+RIOukUfLtRC1R1eC9CXg+m/UVHGau73ze5mP
 0EbNSK8MPkRK0x6aHjhVNGV4NL2nXstWUd2QBt4RnIrNK2WjHd4DWwYr1WC85C+jnVKmzS/cGz
 7MzUX9HrFRku3aYuEiMnpNOggXubPkLapYe4QNdrtfgsxl+Pz1FHo3KvrXlNqplM4HByJww8CE
 ZMOzvdg7DVq/OWfh2U1arwRX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 21:51:54 -0700
IronPort-SDR: beyRGwyDUcZDyPWZ9TG8+Nt9Hz6L7GKWwIVQo23u17CnvjPHlzqs3SkYmufl+f7e2EGed5yotf
 BGh5173ubHOFi+COovJ2kr56t7GyNvFBJ3CBQdtWazdghge1AgAj6kQw+XpIlUMSAYe9TxyiGg
 NfAGgCHri14jEMBiuSvBy7FBY/zKbzaDUIu1izhnoSz1ToiNkkDNaC3NMg7y7/NxLPmI0TVdN8
 fvxPukpaYW8g/P2zPFGjlg9KdXpeaxgn5PrpL4vByUcSe9AGpgu5Zrb1YQf1Aby2GQsob38sh/
 GgQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 22:31:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQJHs6GxRz1RwvL
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 22:31:37 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662874293; x=1665466294; bh=NrSgFgvjaSKlik9sBFvDy1qJbpg0EbD/7do
 PHwnGp3o=; b=IF/ZTw8ltTLeGwQ3zuO7rVhnta8bHQ/8xxhx1ao5LxlRyK8mbsI
 LgW/qUm+lkW2UU3slI7yns7VK4WsCLQ5+3XFMsCjWrGpIg5JubhS17Bt+X0lUCKu
 TRrjThtZvJLjXgtSLGDwn6b5cq7Tq2bJGh7h7ojxelSzISomZDyp/aTTitpqRvNq
 vFxC9ALapaYqAu/119/SAJvZGM/ATSvjkiNqw5Zafn/REg1ayzTlnaQQciiE/+2K
 YYKiTtUPXWshXZyvJLKL+9iAipuZDJvwCsL/BXwh3KM59nzGnIAXBhVTluMyPhja
 rcR0p55izp04lTKupyGZ8HLteQYLyDGptLg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DTpIPpxP3QJr for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 22:31:33 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQJHk49HGz1RvLy;
 Sat, 10 Sep 2022 22:31:30 -0700 (PDT)
Message-ID: <1b6b36ef-0a2b-957e-843b-3c3bb2edc320@opensource.wdc.com>
Date: Sun, 11 Sep 2022 14:31:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220910052759.27517-4-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

On 2022/09/10 14:27, Sam Li wrote:
[...]
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
> + * should be aligned with the zone sector size.

This should read:

* offset is the byte offset of the start of the first zone to operate on;
* len is the maximum number of bytes the command should operate on. It
* should be aligned with the device zone size.

No ?

> + */
> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +        int64_t offset, int64_t len)
> +{
> +    int ret;
> +    IO_CODE();
> +
> +
> +    blk_inc_in_flight(blk);
> +    blk_wait_while_drained(blk);
> +
> +    ret = blk_check_byte_request(blk, offset, len);
> +    if (ret < 0) {
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
> index 0a8b4b426e..4edfa25d04 100644
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
> @@ -216,6 +219,15 @@ typedef struct RawPosixAIOData {
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
> +            bool all;
> +        } zone_mgmt;
>      };
>  } RawPosixAIOData;
>  
> @@ -1339,7 +1351,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  #endif
>  
>      if (bs->sg || S_ISBLK(st.st_mode)) {
> -        int ret = hdev_get_max_hw_transfer(s->fd, &st);
> +        ret = hdev_get_max_hw_transfer(s->fd, &st);
>  
>          if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
>              bs->bl.max_hw_transfer = ret;
> @@ -1356,6 +1368,27 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>          zoned = BLK_Z_NONE;
>      }
>      bs->bl.zoned = zoned;
> +    if (zoned != BLK_Z_NONE) {
> +        ret = get_sysfs_long_val(&st, "chunk_sectors");
> +        if (ret > 0) {
> +            bs->bl.zone_sectors = ret;
> +        }

It may be good to check that we are getting a valid zone size here. So may be
change the check to something like this ?

	if (ret <= 0) {
	    *** print some error message mentioning the invalid zone size ***
	    bs->bl.zoned = BLK_Z_NONE;
	    return;
	}
	bs->bl.zone_sectors = ret;

> +
> +        ret = get_sysfs_long_val(&st, "zone_append_max_bytes");
> +        if (ret > 0) {
> +            bs->bl.max_append_sectors = ret / 512;
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
> @@ -1850,6 +1883,145 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>  }
>  #endif
>  
> +/*
> + * parse_zone - Fill a zone descriptor
> + */
> +#if defined(CONFIG_BLKZONED)
> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
> +                              const struct blk_zone *blkz) {
> +    zone->start = blkz->start;
> +    zone->length = blkz->len;
> +    zone->cap = blkz->capacity;
> +    zone->wp = blkz->wp;
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
> +        g_assert_not_reached();
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
> +        zone->cond =BLK_ZS_IOPEN;

Missing a space after the "=".

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
> +        g_assert_not_reached();
> +    }
> +}
> +#endif
> +
> +#if defined(CONFIG_BLKZONED)
> +static int do_zone_report(int64_t sector, int fd,
> +                          struct BlockZoneDescriptor *zones,
> +                          unsigned int nrz) {
> +    struct blk_zone *blkz;
> +    int ret, n = 0, i = 0;
> +
> +    int64_t rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
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
> +                    fd, sector, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i = 0; i < rep->nr_zones; i++, n++) {
> +            parse_zone(&zones[n], &blkz[i]);
> +            /* The next report should start after the last zone reported */
> +            sector = blkz[i].start + blkz[i].len;
> +        }
> +    }
> +    return n;
> +}
> +#endif
> +
> +static int handle_aiocb_zone_report(void *opaque) {
> +#if defined(CONFIG_BLKZONED)
> +    RawPosixAIOData *aiocb = opaque;
> +    int fd = aiocb->aio_fildes;
> +    unsigned int *nr_zones = aiocb->zone_report.nr_zones;
> +    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
> +    /* zoned block devices use 512-byte sectors */
> +    int64_t sector = aiocb->aio_offset / 512;

This variable is not really necessary I think.

> +
> +    *nr_zones = do_zone_report(sector, fd, zones, *nr_zones);
> +    return 0;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +static int handle_aiocb_zone_mgmt(void *opaque) {
> +#if defined(CONFIG_BLKZONED)
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
> +
> +    if (ret != 0) {
> +        error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
> +                     errno);
> +        return -errno;
> +    }
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static int handle_aiocb_copy_range(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> @@ -3022,6 +3194,104 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
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
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                           unsigned int *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +
> +    acb = (RawPosixAIOData) {
> +        .bs         = bs,
> +        .aio_fildes = s->fd,
> +        .aio_type   = QEMU_AIO_ZONE_REPORT,
> +        .aio_offset = offset,
> +        .zone_report    = {
> +                .nr_zones       = nr_zones,
> +                .zones          = zones,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +/*
> + * zone management operations - Execute an operation on a zone
> + */
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +        int64_t offset, int64_t len) {
> +#if defined(CONFIG_BLKZONED)
> +    BDRVRawState *s = bs->opaque;
> +    RawPosixAIOData acb;
> +    int64_t zone_sector, zone_sector_mask;
> +    const char *zone_op_name;
> +    unsigned long zone_op;
> +    bool is_all = false;
> +
> +    zone_sector = bs->bl.zone_sectors;
> +    zone_sector_mask = zone_sector - 1;
> +    if (offset & zone_sector_mask) {
> +        error_report("sector offset %" PRId64 " is not aligned to zone size "
> +                     "%" PRId64 "", offset, zone_sector);
> +        return -EINVAL;
> +    }
> +
> +    if (len & zone_sector_mask) {

Linux allows SMR drives to have a smaller last zone. So this needs to be
accounted for here. Otherwise, a zone operation that includes the last smaller
zone would always fail. Something like this would work:

	if (((offset + len) < capacity &&
	    len & zone_sector_mask) ||
	    offset + len > capacity) {

> +        error_report("number of sectors %" PRId64 " is not aligned to zone size"
> +                      " %" PRId64 "", len, zone_sector);
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
> +                .zone_op = zone_op,
> +                .zone_op_name = zone_op_name,
> +                .all = is_all,
> +        },
> +    };
> +
> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static coroutine_fn int
>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>                  bool blkdev)
> @@ -3752,6 +4022,54 @@ static BlockDriver bdrv_host_device = {
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
> @@ -4012,6 +4330,9 @@ static void bdrv_file_init(void)
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
> index 0a8cbefe86..de9ec1d740 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3198,6 +3198,47 @@ out:
>      return co.ret;
>  }
>  
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
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
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
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
> index fd25ffa9be..65463b88d9 100644
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
> index 7f7863cc9e..078ddd7e67 100644
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
> @@ -828,6 +834,21 @@ typedef struct BlockLimits {
>  
>      /* device zone model */
>      BlockZoneModel zoned;
> +
> +    /* zone size expressed in 512-byte sectors */
> +    uint32_t zone_sectors;
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
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 21fc10c4c9..3d26929cdd 100644
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
> +         QEMU_AIO_TRUNCATE  | \
> +         QEMU_AIO_ZONE_REPORT | \
> +         QEMU_AIO_ZONE_MGMT)
>  
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 50f5aa2e07..6835525582 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -45,6 +45,12 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
>                              BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_flush(BlockBackend *blk,
>                            BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
> +                                unsigned int *nr_zones, BlockZoneDescriptor *zones,
> +                                BlockCompletionFunc *cb, void *opaque);
> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
> +                              int64_t offset, int64_t len,
> +                              BlockCompletionFunc *cb, void *opaque);
>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes,
>                               BlockCompletionFunc *cb, void *opaque);
>  void blk_aio_cancel_async(BlockAIOCB *acb);
> @@ -156,6 +162,17 @@ int generated_co_wrapper blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
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
> index 20fddbd707..2f436bb355 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1883,6 +1883,7 @@ config_host_data.set('CONFIG_REPLICATION', get_option('live_block_migration').al
>  # has_header
>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzoned.h'))
>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/valgrind.h'))
>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2173e7734a..c6bbb7a037 100644
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
> index 952dc940f1..446a059603 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1712,6 +1712,144 @@ static const cmdinfo_t flush_cmd = {
>      .oneline    = "flush all in-core file state to disk",
>  };
>  
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
> +                   zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
> +                   zones[i].cond, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +        .name = "zone_report",
> +        .altname = "zrp",
> +        .cfunc = zone_report_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset number",
> +        .oneline = "report zone information",
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
> +        .name = "zone_open",
> +        .altname = "zo",
> +        .cfunc = zone_open_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "explicit open a range of zones in zone block device",
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
> +        .name = "zone_close",
> +        .altname = "zc",
> +        .cfunc = zone_close_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "close a range of zones in zone block device",
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
> +        .name = "zone_finish",
> +        .altname = "zf",
> +        .cfunc = zone_finish_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "finish a range of zones in zone block device",
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
> +        .name = "zone_reset",
> +        .altname = "zrs",
> +        .cfunc = zone_reset_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "reset a zone write pointer in zone block device",
> +};
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd = {
>      .name       = "truncate",
> @@ -2504,6 +2642,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
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


