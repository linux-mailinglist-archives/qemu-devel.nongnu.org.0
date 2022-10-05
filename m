Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957EE5F4DC0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 04:36:48 +0200 (CEST)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofuH9-0000BK-9i
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 22:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1ofuBG-0005Jx-Tm
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 22:30:42 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1ofuBC-00023P-If
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 22:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664937038; x=1696473038;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=nLUJ2PJMQ70w2/AkqV7Te4ZJILt6q3d2N60R8LdMXQU=;
 b=HqAJpGBFhaDo1MKGe3DsU1MqUBXGLkesEh5LMcs0gJiRCZC0kC4L0FB2
 kbv2EnuLLC6UqebQ3J9xVUGAHZRxhNZ7v1XCMPCyQij5hOZDVTi32ezX/
 Iqkja9BcoRdh/X90rNonnL3GP5CoeSQ+rCpZqx3qDCNhait4OpXsr6GU7
 JBB6++1A9C7DLurvES7gzbvX3O0VmlqQXWl1BwbQ5/HKDPNXYarlMPgwn
 ecQWtQ4tl4MJqMBKSM+8qz2FEooofWiqTt8QP3kqUy+XjI9EAOXfGvrZb
 gaodlpLpAMhnVcGZNqhjkMZrgzYchHkp69hway1UddfhREHOGMEWoCld0 g==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661788800"; d="scan'208";a="211356873"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2022 10:30:27 +0800
IronPort-SDR: 1/UqqMGm0WH43qFsH6fX1qKDm4eQKHeKA7Z/LvOz+i+Dec84jrxuI0wF9PLo1x5voeuD2Z2L4l
 TYPIlDwSG4KTAqlSnPP7FqGnHMzZFy+wAY2Qx1wr8Eqw31PUWUpHsoscnxUdGM7u8gNoCZLtd3
 eto3i9F9wMwsOfpba85/dHMVXyqfpgN1O5tN+wqhUpfRMiCeLTGFv08/FRB+lpy6KJw/WU6fc5
 EwCYyJ250iaQ7MOm1pibsQJSO3gwK26ZOk2tp6fJbKFH6qL4NYsymg4E/vRvufNswyfXOM0RwW
 +jl92h7TYeFldtwv1wgT5A8N
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 18:44:40 -0700
IronPort-SDR: cyjlAEYxTMEhFJENvlfdt322CEX/UfVjyn3u91VxGXgPuTI/GytFwSAxCDQ9rWEkdpevnX+DtT
 tCPArvPH53EBgom1SZ+rl0lPuFJ8RRrAhDsozrwv/tUuXnUmLpfnoAHvgH2q7RAvFf+O6BWjWG
 czLshQf6+XiTYv+brBG2cov7sTkgJhcrI+wlFhBlLCxEJEgk54+yqd3fW4gmz3yQ1ZxxQybu4t
 l4mno5sb7PRpsTLxVY9gDcwRWr/SOT7V4ci1Ah3aJjOo5lrxGGYolBxVL4dtpXSLV0ODzy4xt9
 T3M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 19:30:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mhz7k6mdwz1Rwrq
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 19:30:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:references:to:from:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1664937024; x=1667529025; bh=nLUJ2PJMQ70w2/AkqV7Te4ZJILt6q3d2N60
 R8LdMXQU=; b=ZUVBTU7dlpGcMubTXtP35xiZhEsJGbTmz6lnkxXB4gIYrD6G5Yf
 OqA7EyEPpmM8gODx41zWCER3H8qo/gijrHVgZvIbIGUSEFVYPS7QbklaS67+uym9
 nBtIzLzKX8udxufzNmlHCIjroZqDzevRyTqmwxCGYkRWvZ5SFydQp8h+477NBFgE
 TNryQcuvpFMOzT7GylDUazxY5fjR65hneGPK/y+qtJIqxcAB0rq9RrU84zZNIPDX
 dOPGg7aaPTG7FZrTDC8HtZTn8t5rqGNJtCMcge1PTb20RJLa1C8JtethizxramjS
 OYMXgOYhFKXfP2feKngaiF11B1tOC9xVCBA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id d2oRoPeW86fx for <qemu-devel@nongnu.org>;
 Tue,  4 Oct 2022 19:30:24 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mhz7f6dbgz1RvLy;
 Tue,  4 Oct 2022 19:30:22 -0700 (PDT)
Message-ID: <c6da7858-993f-dec3-a46a-8580346427aa@opensource.wdc.com>
Date: Wed, 5 Oct 2022 11:30:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] file-posix: add the tracking of the zones wp
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, dmitry.fomichev@wdc.com, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220929093134.73974-1-faithilikerun@gmail.com>
 <20220929093134.73974-2-faithilikerun@gmail.com>
 <a91dc1d7-1d1f-9137-8ad0-bac01fad3ee7@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a91dc1d7-1d1f-9137-8ad0-bac01fad3ee7@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=27087a391=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

On 10/5/22 10:44, Damien Le Moal wrote:
> On 9/29/22 18:31, Sam Li wrote:
>> Since Linux doesn't have a user API to issue zone append operations to
>> zoned devices from user space, the file-posix driver is modified to add
>> zone append emulation using regular writes. To do this, the file-posix
>> driver tracks the wp location of all zones of the device. It uses an
>> array of uint64_t. The most significant bit of each wp location indicates
>> if the zone type is sequential write required.
>>
>> The zones wp can be changed due to the following operations issued:
>> - zone reset: change the wp to the start offset of that zone
>> - zone finish: change to the end location of that zone
>> - write to a zone
>> - zone append
>>
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> ---
>>  block/file-posix.c               | 138 ++++++++++++++++++++++++++++++-
>>  include/block/block-common.h     |  16 ++++
>>  include/block/block_int-common.h |   5 ++
>>  include/block/raw-aio.h          |   4 +-
>>  4 files changed, 159 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 73656d87f2..33e81ac112 100755
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -206,6 +206,8 @@ typedef struct RawPosixAIOData {
>>          struct {
>>              struct iovec *iov;
>>              int niov;
>> +            int64_t *append_sector;
>> +            BlockZoneWps *wps;
>>          } io;
>>          struct {
>>              uint64_t cmd;
>> @@ -1332,6 +1334,59 @@ static int hdev_get_max_segments(int fd, struct stat *st) {
>>  #endif
>>  }
>>  
>> +#if defined(CONFIG_BLKZONED)
>> +static int report_zone_wp(int64_t offset, int fd, BlockZoneWps *wps,
>> +                          unsigned int nrz) {
> 
> Maybe rename this to get_zones_wp() ?
> 
>> +    struct blk_zone *blkz;
>> +    int64_t rep_size;
>> +    int64_t sector = offset >> BDRV_SECTOR_BITS;
>> +    int ret, n = 0, i = 0;
>> +
>> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
>> +    g_autofree struct blk_zone_report *rep = NULL;
> 
> To be cleaner, move this declaration above with the others ?
> 
>> +    rep = g_malloc(rep_size);
>> +
>> +    blkz = (struct blk_zone *)(rep + 1);
>> +    while (n < nrz) {
>> +        memset(rep, 0, rep_size);
>> +        rep->sector = sector;
>> +        rep->nr_zones = nrz - n;
>> +
>> +        do {
>> +            ret = ioctl(fd, BLKREPORTZONE, rep);
>> +        } while (ret != 0 && errno == EINTR);
>> +        if (ret != 0) {
>> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed %d",
>> +                    fd, offset, errno);
>> +            return -errno;
>> +        }
>> +
>> +        if (!rep->nr_zones) {
>> +            break;
>> +        }
>> +
>> +        for (i = 0; i < rep->nr_zones; i++, n++) {
>> +            wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
>> +            sector = blkz[i].start + blkz[i].len;
>> +
>> +            /*
>> +             * In the wp tracking, it only cares if the zone type is sequential
>> +             * writes required so that the wp can advance to the right location.
> 
> Or sequential write preferred (host aware case)
> 
>> +             * Instead of the type of zone_type which is an 8-bit unsigned
>> +             * integer, use the first most significant bits of the wp location
>> +             * to indicate the zone type: 0 for SWR zones and 1 for the
>> +             * others.
>> +             */
>> +            if (!(blkz[i].type & BLK_ZONE_TYPE_SEQWRITE_REQ)) {
> 
> This should be:
> 
> 		if (blkz[i].type != BLK_ZONE_TYPE_CONVENTIONAL) {
> 
> Note that the type field is not a bit-field. So you must compare values
> instead of doing bit operations.
> 
>> +                wps->wp[i] += (uint64_t)1 << 63;
> 
> You can simplify this:
> 
> 		   wps->wp[i] |= 1ULL << 63;
> 
> Overall, I would rewrite this like this:
> 
> for (i = 0; i < rep->nr_zones; i++, n++) {
>     /*
>      * The wp tracking cares only about sequential write required
>      * and sequential write preferred zones so that the wp can
>      * advance to the right location.
>      * Use the most significant bit of the wp location
>      * to indicate the zone type: 0 for SWR zones and 1 for
>      * conventional zones.
>      */
>     if (blkz[i].type == BLK_ZONE_TYPE_CONVENTIONAL) {
>         wps->wp[i] = 1ULL << 63;
>     else
>         wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
> }
> sector = blkz[i - 1].start + blkz[i - 1].len;
> 
> Which I think is a lot simpler.
> 
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +#endif
>> +
>>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>  {
>>      BDRVRawState *s = bs->opaque;
>> @@ -1415,6 +1470,20 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>              error_report("Invalid device capacity %" PRId64 " bytes ", bs->bl.capacity);
>>              return;
>>          }
>> +
>> +        ret = get_sysfs_long_val(&st, "physical_block_size");
>> +        if (ret >= 0) {
>> +            bs->bl.write_granularity = ret;
>> +        }
> 
> This change seems unrelated to the wp tracking. Should this be moved to a
> different patch ?
> 
>> +
>> +        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
>> +        qemu_mutex_init(&bs->bl.wps->lock);
> 
> Move this initialization after the if block. Doing so, you do not need to
> call mutex destroy in case of error.
> 
>> +        if (report_zone_wp(0, s->fd, bs->bl.wps, ret) < 0 ) {
>> +            error_report("report wps failed");
>> +            qemu_mutex_destroy(&bs->bl.wps->lock);
>> +            g_free(bs->bl.wps);
>> +            return;
>> +        }
>>      }
>>  }
>>  
>> @@ -1582,7 +1651,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>>      ssize_t len;
>>  
>>      do {
>> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
>>              len = qemu_pwritev(aiocb->aio_fildes,
>>                                 aiocb->io.iov,
>>                                 aiocb->io.niov,
>> @@ -1612,7 +1681,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>>      ssize_t len;
>>  
>>      while (offset < aiocb->aio_nbytes) {
>> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>>              len = pwrite(aiocb->aio_fildes,
>>                           (const char *)buf + offset,
>>                           aiocb->aio_nbytes - offset,
>> @@ -1705,7 +1774,7 @@ static int handle_aiocb_rw(void *opaque)
>>      }
>>  
>>      nbytes = handle_aiocb_rw_linear(aiocb, buf);
>> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
>> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
>>          char *p = buf;
>>          size_t count = aiocb->aio_nbytes, copy;
>>          int i;
>> @@ -1726,6 +1795,23 @@ static int handle_aiocb_rw(void *opaque)
>>  
>>  out:
>>      if (nbytes == aiocb->aio_nbytes) {
>> +#if defined(CONFIG_BLKZONED)
>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>> +            BlockZoneWps *wps = aiocb->io.wps;
> 
> Why adding this pointer to the aiocb struct ? You can get the array from
> aiocb->bs->bl.wps, no ?
> 
>> +            int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
>> +            if (wps) {
>> +               if (BDRV_ZT_IS_SWR(wps->wp[index])) {
>> +                    qemu_mutex_lock(&wps->lock);
>> +                    wps->wp[index] += aiocb->aio_nbytes;
>> +                    qemu_mutex_unlock(&wps->lock);
>> +                }
>> +
>> +                if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>> +                    *aiocb->io.append_sector = wps->wp[index] >> BDRV_SECTOR_BITS;
> 
> Bug: the append sector must be the first sector written, not the wp
> (sector following the last written sector). So this must be done *before*
> advancing the wp.
> 
> You need to have wps->lock held here too since you are reading
> wps->wp[index]. So the mutex lock/unlock needs to be around the 2 hunks
> under "if (wps) {". Also, given that there cannot be any zone append
> issued to conventional zones (they will fail), you can simplify:
> 
>             if (wps) {
>                 qemu_mutex_lock(&wps->lock);
>                 if (BDRV_ZT_IS_SWR(wps->wp[index])) {
>                     if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>                         *aiocb->io.append_sector =
>                            wps->wp[index] >> BDRV_SECTOR_BITS;
>                     }
>                     wps->wp[index] += aiocb->aio_nbytes;
>                 }
>                 qemu_mutex_unlock(&wps->lock);
>             }
> 
> Now the last problem with this code is sequential write preferred zones.
> For these, the write may actually be overwriting sectors that have already
> been written, meaning that the wp may not necessarilly need to be
> advanced. You can handle that case together with SWR case simply like this:
> 
>             if (wps) {
>                 qemu_mutex_lock(&wps->lock);
>                 if (BDRV_ZT_IS_SWR(wps->wp[index])) {
>                     uint64_t wend_offset =
>                          aiocb->aio_offset + aiocb->aio_nbytes;
> 
>                     if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>                         *aiocb->io.append_sector =
>                            wps->wp[index] >> BDRV_SECTOR_BITS;
>                     }
> 
>                     /* Advance the wp if needed */
>                     if (wend_offset > wps->wp[index])
>                         wps->wp[index] = wend_offset;
>                 }
>                 qemu_mutex_unlock(&wps->lock);
>             }
> 
>> +                }
>> +            }
>> +        }
>> +#endif
>>          return 0;
>>      } else if (nbytes >= 0 && nbytes < aiocb->aio_nbytes) {
>>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
>> @@ -1737,6 +1823,19 @@ out:
>>          }
>>      } else {
>>          assert(nbytes < 0);
>> +#if defined(CONFIG_BLKZONED)
>> +        if (aiocb->aio_type == QEMU_AIO_ZONE_APPEND) {
> 
> Why do this only for zone append ? Regular write error also need a refresh
> of the zone wp.
> 
>> +            qemu_mutex_lock(&aiocb->bs->bl.wps->lock);
>> +            if (report_zone_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
>> +                           aiocb->bs->bl.nr_zones) < 0) {
>> +                error_report("report zone wp failed");
>> +                qemu_mutex_destroy(&aiocb->bs->bl.wps->lock);
>> +                g_free(aiocb->bs->bl.wps);
>> +                return -EINVAL;
>> +            }
>> +            qemu_mutex_unlock(&aiocb->bs->bl.wps->lock);
> 
> This really needs to be a helper function, e.g. update_zone_wp() or
> something like this. Aslo, why nuke the entire zone array if the refresh
> for this zone fails ? You could simply leave it as is. The next write may
> again fail and another attempt at refreshing it done.

Another note on this: you must update the wp ONLY for the zone that you
attempted to write here, and only that zone. If you update the wp for all
zones, you will introduce problems for the zones that are being written
(write in flight) since for these, wps->wp[i] is larger than the device
current wp (they become eual only after all writes are completed).

> 
>> +        }
>> +#endif
>>          return nbytes;
>>      }
>>  }
>> @@ -2027,12 +2126,16 @@ static int handle_aiocb_zone_report(void *opaque) {
>>  static int handle_aiocb_zone_mgmt(void *opaque) {
>>  #if defined(CONFIG_BLKZONED)
>>      RawPosixAIOData *aiocb = opaque;
>> +    BlockDriverState *bs = aiocb->bs;
>>      int fd = aiocb->aio_fildes;
>>      int64_t sector = aiocb->aio_offset / 512;
>>      int64_t nr_sectors = aiocb->aio_nbytes / 512;
>>      struct blk_zone_range range;
>>      int ret;
>>  
>> +    BlockZoneWps *wps = bs->bl.wps;
>> +    int index = aiocb->aio_offset / bs->bl.zone_size;
>> +
>>      /* Execute the operation */
>>      range.sector = sector;
>>      range.nr_sectors = nr_sectors;
>> @@ -2045,6 +2148,22 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>>                       errno);
>>          return -errno;
>>      }
>> +    
>> +    if (aiocb->zone_mgmt.all) {
>> +        for (int i = 0; i < bs->bl.nr_zones; ++i) {
>> +            qemu_mutex_lock(&wps->lock);
>> +            wps->wp[i] = i * bs->bl.zone_size;
>> +            qemu_mutex_unlock(&wps->lock);
>> +        }
>> +    } else if (aiocb->zone_mgmt.zone_op == BLKRESETZONE) {
>> +        qemu_mutex_lock(&wps->lock);
>> +        wps->wp[index] = aiocb->aio_offset;
>> +        qemu_mutex_unlock(&wps->lock);
>> +    } else if (aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {
>> +        qemu_mutex_lock(&wps->lock);
>> +        wps->wp[index] = aiocb->aio_offset + bs->bl.zone_size;
> 
> This may be the last zone of the device, which may be smaller. So you need
> to check that here. Same for the first case for reset all: you need to
> handle the smaller last zone if there is one.
> 
>> +        qemu_mutex_unlock(&wps->lock);
>> +    }
> 
> Instead of the lock/unlock for each case here, take the mutex lock before
> the if () and unlock it after it. Less lines :)
> 
> Also, if the zone management command fails, you need to do a report zones
> and refresh the wps array.
> 
>>      return ret;
>>  #else
>>      return -ENOTSUP;
>> @@ -2355,6 +2474,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>>          },
>>      };
>>  
>> +    BlockZoneWps *wps = bs->bl.wps;
>> +    acb.io.wps = wps;
> 
> You do not need the pws variable. Simply do:
> 
>        acb.io.wps = bs->bl.wps;
> 
>>      assert(qiov->size == bytes);
>>      return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>>  }
>> @@ -2465,6 +2586,12 @@ static void raw_close(BlockDriverState *bs)
>>      BDRVRawState *s = bs->opaque;
>>  
>>      if (s->fd >= 0) {
>> +#if defined(CONFIG_BLKZONED)
>> +        if (bs->bl.wps) {
>> +            qemu_mutex_destroy(&bs->bl.wps->lock);
>> +            g_free(bs->bl.wps);
>> +        }
>> +#endif
>>          qemu_close(s->fd);
>>          s->fd = -1;
>>      }
>> @@ -3299,6 +3426,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>>          zone_op_name = "BLKRESETZONE";
>>          zone_op = BLKRESETZONE;
>>          break;
>> +    case BLK_ZO_RESET_ALL:
>> +        zone_op_name = "BLKRESETZONE";
>> +        zone_op = BLKRESETZONE;
>> +        is_all = true;
>> +        break;
> 
> This change seems unrelated to the wp tracking. Different patch ?
> 
>>      default:
>>          g_assert_not_reached();
>>      }
>> diff --git a/include/block/block-common.h b/include/block/block-common.h
>> index 8efb6b0c43..43bfc484eb 100644
>> --- a/include/block/block-common.h
>> +++ b/include/block/block-common.h
>> @@ -58,6 +58,7 @@ typedef enum BlockZoneOp {
>>      BLK_ZO_CLOSE,
>>      BLK_ZO_FINISH,
>>      BLK_ZO_RESET,
>> +    BLK_ZO_RESET_ALL,
> 
> same here. Adding reset all support should be a different patch.
>>  } BlockZoneOp;
>>  
>>  typedef enum BlockZoneModel {
>> @@ -96,6 +97,14 @@ typedef struct BlockZoneDescriptor {
>>      BlockZoneCondition cond;
>>  } BlockZoneDescriptor;
>>  
>> +/*
>> + * Track write pointers of a zone in bytes.
>> + */
>> +typedef struct BlockZoneWps {
>> +    QemuMutex lock;
>> +    uint64_t wp[];
>> +} BlockZoneWps;
>> +
>>  typedef struct BlockDriverInfo {
>>      /* in bytes, 0 if irrelevant */
>>      int cluster_size;
>> @@ -209,6 +218,13 @@ typedef enum {
>>  #define BDRV_SECTOR_BITS   9
>>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
>>  
>> +/*
>> + * Get the first most significant bit of WP. If it is zero, then
>> + * the zone type is SWR.
>> + */
>> +#define BDRV_ZT_IS_SWR(WP)    ((WP & 0x8000000000000000) == 0) ? (true) : \
>> +                              (false)
> 
> Simplify:
> 
> #define BDRV_ZT_IS_SWR(wp)	(!((wp) & (1ULL << 63))
> 
> But since this must be used for both SWR and SWP zones, I would reverse
> this into:
> 
> #define BDRV_ZONE_IS_CONV(wp)	((wp) & (1ULL << 63))
> 
> Which is a lot simpler.
> 
>> +
>>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS, \
>>                                             INT_MAX >> BDRV_SECTOR_BITS)
>>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
>> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
>> index 37dddc603c..59c2d1316d 100644
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -857,6 +857,11 @@ typedef struct BlockLimits {
>>  
>>      /* device capacity expressed in bytes */
>>      int64_t capacity;
>> +
>> +    /* array of write pointers' location of each zone in the zoned device. */
>> +    BlockZoneWps *wps;
>> +
>> +    int64_t write_granularity;
>>  } BlockLimits;
>>  
>>  typedef struct BdrvOpBlocker BdrvOpBlocker;
>> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
>> index 3d26929cdd..f13cc1887b 100644
>> --- a/include/block/raw-aio.h
>> +++ b/include/block/raw-aio.h
>> @@ -31,6 +31,7 @@
>>  #define QEMU_AIO_TRUNCATE     0x0080
>>  #define QEMU_AIO_ZONE_REPORT  0x0100
>>  #define QEMU_AIO_ZONE_MGMT    0x0200
>> +#define QEMU_AIO_ZONE_APPEND  0x0400
>>  #define QEMU_AIO_TYPE_MASK \
>>          (QEMU_AIO_READ | \
>>           QEMU_AIO_WRITE | \
>> @@ -41,7 +42,8 @@
>>           QEMU_AIO_COPY_RANGE | \
>>           QEMU_AIO_TRUNCATE  | \
>>           QEMU_AIO_ZONE_REPORT | \
>> -         QEMU_AIO_ZONE_MGMT)
>> +         QEMU_AIO_ZONE_MGMT | \
>> +         QEMU_AIO_ZONE_APPEND)
> 
> This should be introduced in patch 2. This patch should be only about zone
> wp tracking with regular writes and zone management ops. The second patch
> can implement zone append emulation thanks to this patch. So separate.
> 
>>  
>>  /* AIO flags */
>>  #define QEMU_AIO_MISALIGNED   0x1000
> 

-- 
Damien Le Moal
Western Digital Research


