Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338EA5FD425
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 07:16:40 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiqaE-00005m-TA
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 01:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oiqXc-0006ro-39
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:13:56 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oiqXZ-0000Yu-QE
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665638033; x=1697174033;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=On8OntGiN/1f5Fv3/LEvM4YIMdq3GL/ZMY3Gpy/Ne1Y=;
 b=nXZ3zpQ+YWv5q6mDvsqd0h8w8u46Qvvxye32blIi2AeoZC5FFC6ig5CM
 RCMvAnBKiQrpvFMKg+jXraN1BUIpUMCy3eM2BX4oQQ2SnvpcGEVk2DrTc
 /7d9KhO/Eaxl6257H0zVLFV2C0kUef/0oE31SAhzXrUEZHn0WCXQKVstu
 FgM1Fq/mdXEViY1BqWuGf0rXLNJEgRUTQNKuqR+b6a4if6U9dyHGsJrfF
 xwfwJVyfC2101YFGsnZQ5NNLiBedDRuTqJLSJ0OGx0+3u/3v4waXl0zfR
 2KmavFA/FzhH0pedg73WJxz3Er9+6vK2A9M5lhOyz2J/V9iL41NCKtlTf Q==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="212005094"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 13:13:45 +0800
IronPort-SDR: FYVtbF1kHWowKlwQ51CWv60gAKDl4udSaZHo4nQ41B1JiExBwRqzl7WNW6KV5z0Y6t7wsyDzM8
 Bwuog8SLQm4ZaVLru+O/eDrkBmAPOEeFsH9l8VCSy5p7KvLGTVSofxuv22M418XgItbI9IGg2d
 gpI6zd3JHj1MmnWGsPEOm5/6iBVpSM/JuP4h8bkzzc9KXqck7YyBO9QqJ4Qr7ViyYIr4Hvl5rJ
 GLvfrlpR+3RMDuIrxKZ5U92kgZ1o21Q2eUcce+i6Ym8qBp6JexwjDvW5J0lxeyGwRAHM9K0iaB
 f/4QB+FiApcmLuVRf9t7cdKh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 21:33:22 -0700
IronPort-SDR: SxEtfd1cLQZvaP1dd6FyAW5mR0vVhjV4KwC+0D3VU6FeHZu1L80jex7jz5m70ZjrJk9IVqYIyg
 MDaAh3Ihh8j5i6vogJe/zaBifzSCMM1t0c75j2HNug/Y9zM/dm1bCTeLIaoiQIDUGGjxPwszOC
 zk0qwJWr2Y/gkAk0mzNCznpEfnM/S6y6Wf6iv+sISS+FAqGZqz/jKmPzWXFXFhkhwRPcZamV4R
 e4E12DwxkRJjKtB2oZD2AGL05uoyp4G36owADrzBPDehcV8LR9oMikM+F6OvoTBDsFZ+1s810v
 sl8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 22:13:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MnyNS260Rz1Rwt8
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 22:13:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665638022; x=1668230023; bh=On8OntGiN/1f5Fv3/LEvM4YIMdq3GL/ZMY3
 Gpy/Ne1Y=; b=W3S07blEXkfml788sVXZF6Tl7etLtZ0oaHuIvkkPMtYsFPqacYF
 BPymjta5V4d9Et8LxmoP2ELqJs1IJ/7C+4CcqWpczrtbP15Te+lUZ+7MSVAX93G3
 PC7D6kj5Qgg7wEMHu2o5zuuxBofCS3EUEa5M78JKZGQZKyIYJHJFzWDOJUhWhfLQ
 4BNI5Zok3aM78bgT9EkHv8UHZUKSZPG2FGojZ/6fhP0M9QXvBQXVwe0sma7aoriW
 uOXHdurkXL6mcbN25APZ7ESJ0gqsufTKgEe0N1MoQ9NHRjACdFa3s2cmsEGMWp4c
 LFHTq+vgnDRTlCm4pnhxHZczajPEb2YUefQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yaaNO3CK4Og4 for <qemu-devel@nongnu.org>;
 Wed, 12 Oct 2022 22:13:42 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MnyNN59gbz1RvLy;
 Wed, 12 Oct 2022 22:13:40 -0700 (PDT)
Message-ID: <c9bfaecf-f97c-e7ad-da79-b2662137004b@opensource.wdc.com>
Date: Thu, 13 Oct 2022 14:13:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 1/3] file-posix:add the tracking of the zones write
 pointers
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org
References: <20221010023306.43610-1-faithilikerun@gmail.com>
 <20221010023306.43610-2-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221010023306.43610-2-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2788b627a=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
>  block/file-posix.c               | 158 +++++++++++++++++++++++++++++++
>  include/block/block-common.h     |  14 +++
>  include/block/block_int-common.h |   5 +
>  3 files changed, 177 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index a9d347292e..17c0b58158 100755
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -206,6 +206,7 @@ typedef struct RawPosixAIOData {
>          struct {
>              struct iovec *iov;
>              int niov;
> +            int64_t *append_sector;

This should be added as part of patch 2. You do not need this to track
the wp of zones in this patch.

>          } io;
>          struct {
>              uint64_t cmd;
> @@ -226,6 +227,7 @@ typedef struct RawPosixAIOData {
>          struct {
>              unsigned long zone_op;
>              const char *zone_op_name;
> +            bool all;
>          } zone_mgmt;
>      };
>  } RawPosixAIOData;
> @@ -1331,6 +1333,67 @@ static int hdev_get_max_segments(int fd, struct stat *st) {
>  #endif
>  }
>  
> +#if defined(CONFIG_BLKZONED)
> +static int get_zones_wp(int64_t offset, int fd, BlockZoneWps *wps,

Nit: It would seem more natural to have the fd argument first...

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
> +            if (!(blkz[i].type != BLK_ZONE_TYPE_CONVENTIONAL)) {

Double negation... This can simply be:

if (blkz[i].type == BLK_ZONE_TYPE_CONVENTIONAL) {

> +                wps->wp[i] += 1ULL << 63;

No need for the += here. This can be "=".

> +            } else {
> +                wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
> +            }
> +        }
> +        sector = blkz[i-1].start + blkz[i-1].len;

spaces missing around the "-" in the "i-1" expressions.

> +    }
> +
> +    return 0;
> +}
> +
> +static void update_zones_wp(int64_t offset, int fd, BlockZoneWps *wps,

Same nit as above: fd being the first argument would be a little more
natural in my opinion.

> +                            unsigned int nrz) {
> +    qemu_mutex_lock(&wps->lock);
> +    if (get_zones_wp(offset, fd, wps, nrz) < 0) {
> +        error_report("report zone wp failed");
> +        return;

You are leacking the lock here. Remove the return. Also, given that
get_zones_wp() already prints a message if report fails, I do not think
the message here is useful.

Also, why is this function void typed ? How can the caller know if the
update succeeded or not ?

> +    }
> +    qemu_mutex_unlock(&wps->lock);
> +}
> +#endif
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> @@ -1414,6 +1477,19 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>              error_report("Invalid device capacity %" PRId64 " bytes ", bs->bl.capacity);
>              return;
>          }
> +
> +        ret = get_sysfs_long_val(&st, "physical_block_size");
> +        if (ret >= 0) {
> +            bs->bl.write_granularity = ret;
> +        }

Why is this change here ? Shouldn't this be part of the previous series
"Add support for zoned device" ?

> +
> +        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
> +        if (get_zones_wp(0, s->fd, bs->bl.wps, ret) < 0){
> +            error_report("report wps failed");
> +            g_free(bs->bl.wps);
> +            return;
> +        }
> +        qemu_mutex_init(&bs->bl.wps->lock);
>      }
>  }
>  
> @@ -1651,6 +1727,20 @@ static int handle_aiocb_rw(void *opaque)
>      ssize_t nbytes;
>      char *buf;
>  
> +    /*
> +     * The offset of regular writes, append writes is the wp location
> +     * of that zone.
> +     */
> +    if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->bs->bl.zone_size > 0) {
> +            BlockZoneWps *wps = aiocb->bs->bl.wps;
> +            qemu_mutex_lock(&wps->lock);
> +            aiocb->aio_offset = wps->wp[aiocb->aio_offset /
> +                                        aiocb->bs->bl.zone_size];
> +            qemu_mutex_unlock(&wps->lock);
> +        }

I do not understand this hunk at all. What is this trying to do ? zone
append support goes into patch 2. You are overwritting the user
specified aio offset using the tracked wp value. That could result in a
successfull write even if the user sent an unaligned write command. That
is bad.

Here you should only be tracking the write pointer, so increment
wps->wp[index], which you do below.

> +    }
> +
>      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
>          /*
>           * If there is just a single buffer, and it is properly aligned
> @@ -1725,6 +1815,24 @@ static int handle_aiocb_rw(void *opaque)
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
> +                    /* Advance the wp if needed */
> +                    if (wend_offset > wps->wp[index]){
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
> @@ -1736,6 +1844,12 @@ out:
>          }
>      } else {
>          assert(nbytes < 0);
> +#if defined(CONFIG_BLKZONED)
> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +            update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
> +                            aiocb->bs->bl.nr_zones);

You only need to update the target zone of the aio, not all zones.
Updating all zones is actually a bug as wp[] entries for other zones may
be larger than the device reported wp if there are other write aios in
flight. So the last argument must be "1" here.

> +        }
> +#endif
>          return nbytes;
>      }
>  }
> @@ -2022,12 +2136,17 @@ static int handle_aiocb_zone_report(void *opaque) {
>  #if defined(CONFIG_BLKZONED)
>  static int handle_aiocb_zone_mgmt(void *opaque) {
>      RawPosixAIOData *aiocb = opaque;
> +    BlockDriverState *bs = aiocb->bs;
>      int fd = aiocb->aio_fildes;
>      int64_t sector = aiocb->aio_offset / 512;
>      int64_t nr_sectors = aiocb->aio_nbytes / 512;
> +    uint64_t wend_offset;
>      struct blk_zone_range range;
>      int ret;
>  

Why the blank line here ?

> +    BlockZoneWps *wps = bs->bl.wps;
> +    int index = aiocb->aio_offset / bs->bl.zone_size;
> +
>      /* Execute the operation */
>      range.sector = sector;
>      range.nr_sectors = nr_sectors;
> @@ -2035,11 +2154,41 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>          ret = ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
>      } while (ret != 0 && errno == EINTR);
>      if (ret != 0) {
> +        update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
> +                        aiocb->bs->bl.nr_zones);

You need only to update the range of zones that was specified for the
management option, not all zones. So you must specify the zone
management aio offset and size/zone_size here.

>          ret = -errno;
>          error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_name,
>                       ret);
>          return ret;
>      }
> +
> +    qemu_mutex_lock(&wps->lock);
> +    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> +         /*
> +         * The zoned device allows the last zone smaller that the zone size.
> +         */

comment indentation is off.

> +        if (aiocb->aio_nbytes < bs->bl.zone_size) {
> +            wend_offset = aiocb->aio_offset + aiocb->aio_nbytes;
> +        } else {
> +            wend_offset = aiocb->aio_offset + bs->bl.zone_size;
> +        }
> +
> +        if (aiocb->aio_offset != wps->wp[index] &&
> +            aiocb->zone_mgmt.zone_op == BLKRESETZONE) {

I do not understand the condition here. Why do you have
"aiocb->aio_offset != wps->wp[index]" ?

> +            if (aiocb->zone_mgmt.all) {

This is the only place where you use this all boolean field. For
simplicity, I would drop this field completely and test that
aiocb->aio_offset == 0 && aiocb->aio_nbytes == bs->bl.capacity to detect
a reset all zones operation.

> +                for (int i = 0; i < bs->bl.nr_zones; ++i) {
> +                    wps->wp[i] = i * bs->bl.zone_size;

You are not handling conventional zones here. For conventional zones,
you should not change the value. Otherwise, BDRV_ZT_IS_CONV() will
always return false after this.

> +                }
> +            } else {
> +                wps->wp[index] = aiocb->aio_offset;
> +            }
> +        } else if (aiocb->aio_offset != wps->wp[index] &&
> +            aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {

Same comment here. Why do you have "aiocb->aio_offset != wps->wp[index]" ?

> +            wps->wp[index] = wend_offset;
> +        }
> +    }
> +    qemu_mutex_unlock(&wps->lock);
> +
>      return ret;
>  }
>  #endif
> @@ -2480,6 +2629,12 @@ static void raw_close(BlockDriverState *bs)
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
> @@ -3278,6 +3433,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>      int64_t zone_size, zone_size_mask;
>      const char *zone_op_name;
>      unsigned long zone_op;
> +    bool is_all = false;
>  
>      zone_size = bs->bl.zone_size;
>      zone_size_mask = zone_size - 1;
> @@ -3314,6 +3470,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>      case BLK_ZO_RESET_ALL:
>          zone_op_name = "BLKRESETZONE";
>          zone_op = BLKRESETZONE;
> +        is_all = true;
>          break;
>      default:
>          g_assert_not_reached();
> @@ -3328,6 +3485,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>          .zone_mgmt  = {
>              .zone_op = zone_op,
>              .zone_op_name = zone_op_name,
> +            .all = is_all,
>          },
>      };
>  
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 882de6825e..b8b2dba64a 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -93,6 +93,14 @@ typedef struct BlockZoneDescriptor {
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
> @@ -206,6 +214,12 @@ typedef enum {
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
> index 37dddc603c..59c2d1316d 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -857,6 +857,11 @@ typedef struct BlockLimits {
>  
>      /* device capacity expressed in bytes */
>      int64_t capacity;
> +
> +    /* array of write pointers' location of each zone in the zoned device. */
> +    BlockZoneWps *wps;
> +
> +    int64_t write_granularity;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;

-- 
Damien Le Moal
Western Digital Research


