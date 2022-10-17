Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625960062C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 07:14:53 +0200 (CEST)
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okISh-0004Op-KY
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 01:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okIQ5-0002ES-FB
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 01:12:09 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okIQ2-00052g-0U
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 01:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665983525; x=1697519525;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L3Zmwjb45XHMRK5IF/vH1IMwHy8Frc/gqcQrrDmoDM4=;
 b=fZsxgWiBMULU4hXc8ui16143dYcIL+CgJMMbZ9csqodLEY+gYgIJOXou
 +L1LwdHqmbNpp3iVK0VtS+kpUAi60planWx62Hrz1bcm6MtgjdqlvxT5o
 cefElcJTAIl8Knl9TBsJc9cj1DbYCAh9RrK4SEVEaT2yBxayy+OhsJzwe
 ZZ+Y/QyuKmrqcWIhfvA/RSXi8EZdpGe1XrGJj/mchOjqy69r48vYA9kUI
 al2ilYt+PfEr2c7RYxsCu0njSjJfwMXXyBPxQUjgJeYW0d88c7VXddQ+O
 b2Ua9CIq1GwAGKCrwKsuMmnzgwGKr8QRRfCMKDZH82uvFZcvXnEeML2DC A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="219143441"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 13:11:58 +0800
IronPort-SDR: /ZkoPOd7I9BAQgsnnhvN7xb9TH59K6ZjN1HGXIqutcrT9xtCe/vEPzC9j6odn/Y9ZI382hK63Q
 nUDnIDH/VWKe1Vj/ZZSqz1NkWXzCrW+gBzKRQyzyE7QlWcH5lR3qeTFKx96HsAzUi4kY6XE7WL
 b7PXFGhRcs81Gb2hRLOLkFVsevShK3e1ejdInyB1BjfgHEO4TR7MnoVZoCmNvhW5YVZZooql1b
 W0VkGUK4rWM8fT5KK60nkjN2hPeN68wm8NcAFkqKzLCd2bXLTApcRjlXgcqsIor0O5as0jaUCJ
 03HOWXA8AidiX5XArTTq8QjD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 21:31:31 -0700
IronPort-SDR: 6PnCh6UGj6f9xyw0fqJ0s4wARhbiM6ZAqJX/RtMZz0TRkTyIXCIk5H1+NaHUe8oNkYUpg98fmX
 p9O8WKv72QiWr74nmp4bVKRfL5kEg2IgxkHDI31g9FAQw2BHwmVl3bmbF1p3qFHvlWgj/EOc+I
 470l0wbJPahUOwCFjxOT/9M7Dz5LGHW5zr8M2DnfOxDdNZ0YXdRxDbnX/TBzECNpPb26YKfbGa
 BOhuem2PhfOncwNGqmXxnV9AI1CLig6h3q3HZ2dw7OgexIznA2PhJtRHKIJINlMnwiKYsIiMfK
 6rw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 22:11:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrQ8Y4m1vz1RwvL
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 22:11:57 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665983515; x=1668575516; bh=L3Zmwjb45XHMRK5IF/vH1IMwHy8Frc/gqcQ
 rrDmoDM4=; b=W3D7CB5gEqc3FaYy1ehG3LdrKzoSfEf4J6z/11YkQkCNjp7GEs1
 6x796UFXnpyf2zyrG2qb9dZvwfcORaE4fm+2yXwG4npJRwriKUQUa4Ae4rF/NYv0
 PgLp1gZqfUVHjAgJDAZJ4zdwq6LoPzbusysQruXcKW6cG8m5hL+OeQad3Izx1ogn
 tIC2EnoO7zyORifNFYeagLL1m/xlpkIukZp68AObEazVzok2ydpdtcIS9aD79KHa
 xbaLJBsoaUYkiSN/UjyxvUZ2MosE4T0vPl+R6rHN55+OM5OaKvWOsMe/fupls4P0
 jy1owLg7DmV+R6c4PDQMI9gXU6+4Nsn1Qbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EQXW33o2qazd for <qemu-devel@nongnu.org>;
 Sun, 16 Oct 2022 22:11:55 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrQ8V29Ypz1RvLy;
 Sun, 16 Oct 2022 22:11:54 -0700 (PDT)
Message-ID: <4e01e076-84c5-0fb4-b60f-9e42bb0b9f9a@opensource.wdc.com>
Date: Mon, 17 Oct 2022 14:11:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 1/3] file-posix: add the tracking of the zones write
 pointers
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, qemu-block@nongnu.org
References: <20221016145626.171838-1-faithilikerun@gmail.com>
 <20221016145626.171838-2-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221016145626.171838-2-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2824960c0=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

On 10/16/22 23:56, Sam Li wrote:
> Since Linux doesn't have a user API to issue zone append operations to
> zoned devices from user space, the file-posix driver is modified to add
> zone append emulation using regular writes. To do this, the file-posix
> driver tracks the wp location of all zones of the device. It uses an
> array of uint64_t. The most significant bit of each wp location indicates
> if the zone type is conventional zones.
> 
> The zones wp can be changed due to the following operations issued:
> - zone reset: change the wp to the start offset of that zone
> - zone finish: change to the end location of that zone
> - write to a zone
> - zone append
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c               | 144 +++++++++++++++++++++++++++++++
>  include/block/block-common.h     |  14 +++
>  include/block/block_int-common.h |   3 +
>  3 files changed, 161 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 7c5a330fc1..5ff5500301 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1324,6 +1324,66 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>  #endif
>  }
>  
> +#if defined(CONFIG_BLKZONED)
> +static int get_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                        unsigned int nrz) {
> +    struct blk_zone *blkz;
> +    int64_t rep_size;
> +    int64_t sector = offset >> BDRV_SECTOR_BITS;
> +    int ret, n = 0, i = 0;
> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
> +    g_autofree struct blk_zone_report *rep = NULL;
> +
> +    rep = g_malloc(rep_size);
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
> +                    fd, offset, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i = 0; i < rep->nr_zones; i++, n++) {
> +            /*
> +             * The wp tracking cares only about sequential writes required and
> +             * sequential write preferred zones so that the wp can advance to
> +             * the right location.
> +             * Use the most significant bit of the wp location to indicate the
> +             * zone type: 0 for SWR/SWP zones and 1 for conventional zones.
> +             */
> +            if (blkz[i].type == BLK_ZONE_TYPE_CONVENTIONAL) {
> +                wps->wp[i] = 1ULL << 63;
> +            } else {
> +                wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;

Nit: For full, read-only and offline zones, the wp of a zone is undefined,
that is, its value may be total garbage and should not be used. The kernel
will normally report a wp set to zone start + zone len for these cases,
but better do the same here too. So this single line should be something
like this:

switch (blkz[i].cond) {
case BLK_ZONE_COND_FULL:
case BLK_ZONE_COND_READONLY:
    /* Zone not writeable */
    wps->wp[i] = (blkz[i].start + blkz[i].len) << BDRV_SECTOR_BITS;
    break;
case BLK_ZONE_COND_OFFLINE:
    /* Zone not writable nor readable */
    wps->wp[i] = blkz[i].start << BDRV_SECTOR_BITS;
    break;
default:
    wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
    break;
}

> +            }
> +        }
> +        sector = blkz[i - 1].start + blkz[i - 1].len;
> +    }
> +
> +    return 0;
> +}
> +
> +static void update_zones_wp(int fd, BlockZoneWps *wps, int64_t offset,
> +                            unsigned int nrz) {
> +    qemu_mutex_lock(&wps->lock);
> +    if (get_zones_wp(fd, wps, offset, nrz) < 0) {
> +        error_report("update zone wp failed");
> +    }
> +    qemu_mutex_unlock(&wps->lock);
> +}
> +#endif
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> @@ -1414,6 +1474,14 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>          if (ret >= 0) {
>              bs->bl.max_active_zones = ret;
>          }
> +
> +        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
> +        if (get_zones_wp(s->fd, bs->bl.wps, 0, ret) < 0) {
> +            error_report("report wps failed");
> +            g_free(bs->bl.wps);
> +            return;
> +        }
> +        qemu_mutex_init(&bs->bl.wps->lock);
>      }
>  }
>  
> @@ -1725,6 +1793,25 @@ static int handle_aiocb_rw(void *opaque)
>  
>  out:
>      if (nbytes == aiocb->aio_nbytes) {
> +#if defined(CONFIG_BLKZONED)
> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +            BlockZoneWps *wps = aiocb->bs->bl.wps;
> +            int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
> +            if (wps) {
> +                qemu_mutex_lock(&wps->lock);
> +                if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> +                    uint64_t wend_offset =
> +                            aiocb->aio_offset + aiocb->aio_nbytes;
> +
> +                    /* Advance the wp if needed */
> +                    if (wend_offset > wps->wp[index]) {
> +                        wps->wp[index] = wend_offset;
> +                    }
> +                }
> +                qemu_mutex_unlock(&wps->lock);
> +            }
> +        }
> +#endif
>          return 0;
>      } else if (nbytes >= 0 && nbytes < aiocb->aio_nbytes) {
>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
> @@ -1736,6 +1823,11 @@ out:
>          }
>      } else {
>          assert(nbytes < 0);
> +#if defined(CONFIG_BLKZONED)
> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +            update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps, 0, 1);
> +        }
> +#endif
>          return nbytes;
>      }
>  }
> @@ -2022,14 +2114,29 @@ static int handle_aiocb_zone_report(void *opaque)
>  #endif
>  
>  #if defined(CONFIG_BLKZONED)
> +static bool zone_is_empty(BlockDriverState *bs, int64_t index)
> +{
> +    return bs->bl.wps->wp[index] == index * bs->bl.zone_size;
> +}
> +
>  static int handle_aiocb_zone_mgmt(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> +    BlockDriverState *bs = aiocb->bs;
>      int fd = aiocb->aio_fildes;
>      int64_t sector = aiocb->aio_offset / 512;
>      int64_t nr_sectors = aiocb->aio_nbytes / 512;
>      struct blk_zone_range range;
>      int ret;
> +    uint64_t wend_offset;
> +    BlockZoneWps *wps = bs->bl.wps;
> +    int index = aiocb->aio_offset / bs->bl.zone_size;
> +
> +    if (BDRV_ZT_IS_CONV(wps->wp[index]) &&
> +        aiocb->aio_nbytes != bs->bl.capacity) {
> +        error_report("zone mgmt operations not allowed for conventional zones");
> +        return -EIO;
> +    }
>  
>      /* Execute the operation */
>      range.sector = sector;
> @@ -2038,11 +2145,42 @@ static int handle_aiocb_zone_mgmt(void *opaque)
>          ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
>      } while (ret != 0 && errno == EINTR);
>      if (ret != 0) {
> +        update_zones_wp(aiocb->aio_fildes, aiocb->bs->bl.wps,
> +                        aiocb->aio_offset,
> +                        aiocb->aio_nbytes / bs->bl.zone_size);
>          ret = -errno;
>          error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
>                       ret);
>          return ret;
>      }
> +    qemu_mutex_lock(&wps->lock);

This lock MUST be done before the ioctl() operation. Otherwise, you can
get operation and wp update reversal resulting in a state inconsistent
with the device state.

Note that for the write operation you are not taking the lock before the
write operation execution, which is OK if you consider only write
requeuests thanks to the "if (wend_offset > wps->wp[index]) {" code.
But if you consider write requests and zone management operations
simultaneously executed by different qemu workers, you get to an
inconsistent state too. So you must take the lock before starting a write
operation too.

operation + wp update must be serialized against simultaneous operations
for the same zone.

> +    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> +        /*
> +         * The zoned device allows the last zone smaller that the zone size.
> +         */
> +        if (aiocb->aio_nbytes < bs->bl.zone_size) {
> +            wend_offset = aiocb->aio_offset + aiocb->aio_nbytes;
> +        } else {
> +            wend_offset = aiocb->aio_offset + bs->bl.zone_size;
> +        }
> +
> +        if (!zone_is_empty(bs, index) &&
> +            aiocb->zone_mgmt.zone_op == BLKRESETZONE) {
> +            if (aiocb->aio_nbytes == bs->bl.capacity) {
> +                for (int i = 0; i < bs->bl.nr_zones; ++i) {
> +                    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> +                        wps->wp[i] = i * bs->bl.zone_size;
> +                    }
> +                }
> +            } else {
> +                wps->wp[index] = aiocb->aio_offset;
> +            }
> +        } else if (aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {
> +            wps->wp[index] = wend_offset;
> +        }
> +    }
> +    qemu_mutex_unlock(&wps->lock);
> +
>      return 0;
>  }
>  #endif
> @@ -2483,6 +2621,12 @@ static void raw_close(BlockDriverState *bs)
>      BDRVRawState *s = bs->opaque;
>  
>      if (s->fd >= 0) {
> +#if defined(CONFIG_BLKZONED)
> +        if (bs->bl.wps) {
> +            qemu_mutex_destroy(&bs->bl.wps->lock);
> +            g_free(bs->bl.wps);
> +        }
> +#endif
>          qemu_close(s->fd);
>          s->fd = -1;
>      }
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 36bd0e480e..52372f8252 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -92,6 +92,14 @@ typedef struct BlockZoneDescriptor {
>      BlockZoneCondition cond;
>  } BlockZoneDescriptor;
>  
> +/*
> + * Track write pointers of a zone in bytes.
> + */
> +typedef struct BlockZoneWps {
> +    QemuMutex lock;
> +    uint64_t wp[];
> +} BlockZoneWps;
> +
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
>      int cluster_size;
> @@ -205,6 +213,12 @@ typedef enum {
>  #define BDRV_SECTOR_BITS   9
>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
>  
> +/*
> + * Get the first most significant bit of wp. If it is zero, then
> + * the zone type is SWR.
> + */
> +#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
> +
>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS, \
>                                             INT_MAX >> BDRV_SECTOR_BITS)
>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 37dddc603c..e3136146aa 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -857,6 +857,9 @@ typedef struct BlockLimits {
>  
>      /* device capacity expressed in bytes */
>      int64_t capacity;
> +
> +    /* array of write pointers' location of each zone in the zoned device. */
> +    BlockZoneWps *wps;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;

-- 
Damien Le Moal
Western Digital Research


