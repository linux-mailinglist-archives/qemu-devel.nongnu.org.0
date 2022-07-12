Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD057296D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:42:17 +0200 (CEST)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOa8-00061y-F3
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBO7N-0007pQ-GQ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:12:34 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:3427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBO7J-0001l3-PM
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657663949; x=1689199949;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ghbfC+UCocY30V/PSBvxhjdHMpCKdR5BXuQRGX86IXE=;
 b=JeeBd54s+J5fq6rJUVSBnZKChyc0xTwbnH58pXWoD4LGLHJqAlMPjL6/
 hMXZ62C2WCrpDba6An8jPeiQyK6ftQU0O+/ryXrUatA8pVc06uDOqkH5Q
 7hZwcbxy6ahaXrcb+jvCXnpkJozyXPK/0+ijn9P+PZmHn+FZ/+jVlWQ9z
 QxKCR4uLOfRCn79xAdjRg3T5ml15pbWBWMs7jQFV96UAvDFFUoXzi3d1o
 aarDKnpAVmnLXHDpF4NKuwaxYX09K6mRMa6TOx2SfTrUuLKRoQCFKmjy7
 WIvwhpvQ7S+UHH+qEgi/b8rSqYEuO7DIUMopu3wdWaWNRjBR9QEL9zAV2 w==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650902400"; d="scan'208";a="204179880"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2022 06:12:28 +0800
IronPort-SDR: NmcG8cW/nKhAisCfuujAgVsyj/qg6x0cRxPaxpyWPmPuP90sFrUPsf64RYVrIz0+zY53hDNGl0
 8rUEEYYxWet/0sv4RZXXRZm14YbXjvEQ8iftsD/N6V28BGUS17cDyJbpaym4EB2sRnxSRgQAla
 PO1rA4Mm054HYReIkunCtrBJuLVowgU13/tl35LJ28BeD/DFJYVrscXBZMHe4E1FnOWa7wYjpl
 RIkKv48Ij7h++GsEkIoN22lByhzWOl/WFF1tjFqqogrDYqvD1aYcu7IAxUL//M8qDxWK2rSGUP
 w1I9Ms6oVs67K8hGAiidCU6e
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 14:29:26 -0700
IronPort-SDR: yk8bXHJa8faus3+TsV6GFlRuCjhnc/LlsGsXquuXoOOwyFK09dEwyhbAFH0lgP5wRLrxeFokKA
 wZJ/PrYd6WPvXsn2JClgtOBe9+Pj0gar9SzR6q9ifo1NtW99F+DaZ4yM9KjCUOkvJU2yyMWDje
 nW+/qpX5tvGLh3BZDJtHNOIRvr8i3RNyw5G/3POGXUDm+scEFn8dKwLEw/MkbCm3+Eer1fqYiN
 GBXFkJIYJmFWPYpKcp3UMQGn7+q5ZrzHXqIyCyvhrfGc1hiHVVW/0fO6F7EUcYkA4QlBKmIbaF
 Qg4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 15:12:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LjFNr2Cqfz1Rwnx
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:12:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657663940; x=1660255941; bh=ghbfC+UCocY30V/PSBvxhjdHMpCKdR5BXuQ
 RGX86IXE=; b=QDaRMbt/q1daDl/F8LJY5jH2zEoC96JHHdiKr7UWm+rDIgb4wwh
 BlgSyNFBHUNYo0MDkC6V2YG+ZrtW+djQzIFYPkJXodzF9Xbf02TsG2gUQCmsCHTd
 ntyEyHKB6ZONUUt4aTcfrMRmE5ROx1j4+noVBGUKkw8aFmcPEYWaofv683tfxrkb
 rSCA5zILaJcMRyRJbQIVD5kuNK6SlC9idQrIDQ6NiakcXnP7dWiNZuToTf52HKkw
 hZPYy8ZfKtAUB8xb4Qv4+UnDValOpHWLZ4CfYol46jgdBi1eagGrNIby0zrZ/rpE
 coRZoTu3nWPccdMoBotHCExehCMeIlvRmag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YlQ5J6n8fZWM for <qemu-devel@nongnu.org>;
 Tue, 12 Jul 2022 15:12:20 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LjFNf2R70z1RtVk;
 Tue, 12 Jul 2022 15:12:18 -0700 (PDT)
Message-ID: <0effd311-26e1-3c93-3bae-0de00945a86d@opensource.wdc.com>
Date: Wed, 13 Jul 2022 07:12:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 1/9] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, hare@suse.de
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-2-faithilikerun@gmail.com>
 <Ys2YF9iYeicGf8xr@stefanha-x1.localdomain>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Ys2YF9iYeicGf8xr@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=18524360e=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/22 00:49, Stefan Hajnoczi wrote:
> On Tue, Jul 12, 2022 at 10:13:37AM +0800, Sam Li wrote:
>> By adding zone management operations in BlockDriver, storage
>> controller emulation can use the new block layer APIs including
>> zone_report and zone_mgmt(open, close, finish, reset).
>>
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> ---
>>  block/block-backend.c            |  41 ++++++
>>  block/coroutines.h               |   5 +
>>  block/file-posix.c               | 236 +++++++++++++++++++++++++++++++
>>  include/block/block-common.h     |  43 +++++-
>>  include/block/block_int-common.h |  20 +++
>>  5 files changed, 344 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index f425b00793..0a05247ae4 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -1806,6 +1806,47 @@ int blk_flush(BlockBackend *blk)
>>      return ret;
>>  }
>>  
>> +/*
>> + * Send a zone_report command.
>> + * offset can be any number within the zone size. No alignment for offset.
> 
> I think offset is a byte offset from the start of the device and its
> range is [0, total_sectors * BDRV_SECTOR_SIZE)?
> 
> "any number within the zone size" gives the impression that the value
> must be [0, zone_size_in_bytes), which is not right.
> 
> I suggest changing the text to "offset can be any number of bytes from
> the start of the device" or similar.
> 
>> + * nr_zones represents IN maximum and OUT actual.
>> + */
>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
>> +                                    int64_t *nr_zones,
>> +                                    BlockZoneDescriptor *zones)
>> +{
>> +    int ret;
>> +    IO_CODE();
>> +
>> +    blk_inc_in_flight(blk); /* increase before waiting */
>> +    blk_wait_while_drained(blk);
>> +    ret = bdrv_co_zone_report(blk->root->bs, offset, nr_zones, zones);
> 
> The !blk_is_available(blk) case needs to return -ENOMEDIUM before we can
> safely dereference blk->root->bs (which can also be written as
> blk_bs(blk)).
> 
>> +    blk_dec_in_flight(blk);
>> +    return ret;
>> +}
>> +
>> +/*
>> + * Send a zone_management command.
>> + * Offset is the start of a zone and len is aligned to zones.
>> + */
>> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> 
> Please define typedef enum { ... } BlockZoneOp instead of enum { ... }
> zone_op and then use a BlockZoneOp op argument instead of enum zone_op.
> QEMU coding style uses typedefs instead of struct foo or enum foo when
> possible.
> 
>> +        int64_t offset, int64_t len)
>> +{
>> +    int ret;
>> +    IO_CODE();
>> +
>> +    blk_inc_in_flight(blk);
>> +    blk_wait_while_drained(blk);
>> +    ret = blk_check_byte_request(blk, offset, len);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    ret = bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
>> +    blk_dec_in_flight(blk);
>> +    return ret;
>> +}
>> +
>>  void blk_drain(BlockBackend *blk)
>>  {
>>      BlockDriverState *bs = blk_bs(blk);
>> diff --git a/block/coroutines.h b/block/coroutines.h
>> index 830ecaa733..19aa96cc56 100644
>> --- a/block/coroutines.h
>> +++ b/block/coroutines.h
>> @@ -80,6 +80,11 @@ int coroutine_fn
>>  blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
>>  
>>  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
>> +                                    int64_t *nr_zones,
>> +                                    BlockZoneDescriptor *zones);
>> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
>> +                                  int64_t offset, int64_t len);
>>  
>>  
>>  /*
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 48cd096624..e7523ae2ed 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -67,6 +67,7 @@
>>  #include <sys/param.h>
>>  #include <sys/syscall.h>
>>  #include <sys/vfs.h>
>> +#include <linux/blkzoned.h>
>>  #include <linux/cdrom.h>
>>  #include <linux/fd.h>
>>  #include <linux/fs.h>
>> @@ -216,6 +217,13 @@ typedef struct RawPosixAIOData {
>>              PreallocMode prealloc;
>>              Error **errp;
>>          } truncate;
>> +        struct {
>> +            int64_t *nr_zones;
>> +            BlockZoneDescriptor *zones;
>> +        } zone_report;
>> +        struct {
>> +            zone_op op;
>> +        } zone_mgmt;
>>      };
>>  } RawPosixAIOData;
>>  
>> @@ -1801,6 +1809,130 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>>  }
>>  #endif
>>  
> 
> Are the functions below within #ifdef __linux__?

We need more than that: linux AND blkzoned.h header present (meaning a
recent kernel). So the ifdef should be "#if defined(CONFIG_BLKZONED)" or
something like it, with CONFIG_BLKZONED defined for linux AND
/usr/include/linux/blkzoned.h present.

> 
>> +/*
>> + * parse_zone - Fill a zone descriptor
>> + */
>> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
>> +                              struct blk_zone *blkz) {
>> +    zone->start = blkz->start;
>> +    zone->length = blkz->len;
>> +    zone->cap = blkz->capacity;
>> +    zone->wp = blkz->wp - blkz->start;
>> +    zone->type = blkz->type;
>> +    zone->cond = blkz->cond;
>> +}
>> +
>> +static int handle_aiocb_zone_report(void *opaque) {
>> +    RawPosixAIOData *aiocb = opaque;
>> +    int fd = aiocb->aio_fildes;
>> +    int64_t *nr_zones = aiocb->zone_report.nr_zones;
>> +    BlockZoneDescriptor *zones = aiocb->zone_report.zones;
>> +    int64_t offset = aiocb->aio_offset;
> 
> The code is easier to read if it's clear this value is in sector units:
> 
>   int64_t sector = aiocb->aio_offset / 512; /* BLKREPORTZONE uses 512B sectors */
> 
> Then there's no confusion about whether 'offset' is bytes or sectors.
> 
>> +
>> +    struct blk_zone *blkz;
>> +    int64_t rep_size, nrz;
>> +    int ret, n = 0, i = 0;
>> +
>> +    nrz = *nr_zones;
>> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
>> +    g_autofree struct blk_zone_report *rep = NULL;
>> +    rep = g_malloc(rep_size);
>> +    offset = offset / 512; /* get the unit of the start sector: sector size is 512 bytes. */
>> +    printf("start to report zone with offset: 0x%lx\n", offset);
>> +
>> +    blkz = (struct blk_zone *)(rep + 1);
>> +    while (n < nrz) {
>> +        memset(rep, 0, rep_size);
>> +        rep->sector = offset;
>> +        rep->nr_zones = nrz;
> 
> After the first time around the while loop zones[] no longer has space
> for nrz elements. This must be taken into account to avoid overflowing
> zones[]:
> 
>   rep->nr_zones = nrz - n;
> 
>> +
>> +        ret = ioctl(fd, BLKREPORTZONE, rep);
>> +        if (ret != 0) {
> 
> Does this need to retry when ret != 0 && errno == EINTR is encountered?
> Damien/Hannes/Dmitry might know the answer. See handle_aiocb_rw_vector()
> for an example of retrying when EINTR is returned from a blocking
> syscall.
> 
>> +            ret = -errno;
>> +            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
>> +                         fd, offset, errno);
> 
> Please use "... at %" PRId64 " failed ..." instead of %ld for int64_t
> values. %ld is not portable because sizeof(long) varies on different
> machines.
> 
>> +            return ret;
>> +        }
>> +
>> +        if (!rep->nr_zones) {
>> +            break;
>> +        }
>> +
>> +        for (i = 0; i < rep->nr_zones; i++, n++) {
>> +            parse_zone(&zones[n], &blkz[i]);
>> +            /* The next report should start after the last zone reported */
>> +            offset = blkz[i].start + blkz[i].len;
>> +        }
>> +    }
>> +
>> +    *nr_zones = n;
>> +    return 0;
>> +}
>> +
>> +static int handle_aiocb_zone_mgmt(void *opaque) {
>> +    RawPosixAIOData *aiocb = opaque;
>> +    int fd = aiocb->aio_fildes;
>> +    int64_t offset = aiocb->aio_offset;
>> +    int64_t len = aiocb->aio_nbytes;
>> +    zone_op op = aiocb->zone_mgmt.op;
>> +
>> +    struct blk_zone_range range;
>> +    const char *ioctl_name;
>> +    unsigned long ioctl_op;
>> +    int64_t zone_size;
>> +    int64_t zone_size_mask;
>> +    int ret;
>> +
>> +    g_autofree struct stat *file = NULL;
>> +    file = g_new(struct stat, 1);
>> +    stat(s->filename, file);
> 
> Heap allocation is not needed. It's easier to put the struct stat
> variable on the stack:
> 
>   struct stat st;
>   if (fstat(fd, &st) < 0) {
>       return -errno;
>   }
> 
> fstat(2) is preferred over stat(2) when a file descriptor is available
> because stat(2) suffers from race conditions when file system paths have
> changed.
> 
>> +    zone_size = get_sysfs_long_val(fd, file, "chunk_sectors");
> 
> The name "zone_sectors" would be clearer since size doesn't indicate the
> units (bytes vs sectors).
> 
>> +    zone_size_mask = zone_size - 1;
>> +    if (offset & zone_size_mask) {
> 
> Bytes and sectors units are being mixed here:
> 
>   int64_t offset = aiocb->aio_offset; <-- bytes
> 
> I suggest changing it to:
> 
>   int64_t sector = aiocb->aio_offset / 512; /* BLK*ZONE ioctls use 512B sectors */
> 
>> +        error_report("offset is not the start of a zone");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (len & zone_size_mask) {
> 
> Bytes and sectors are mixed here too. I think len is in bytes:
> 
>   int64_t len = aiocb->aio_nbytes;
> 
> Maybe change it to:
> 
>   int64_t nr_sectors = aiocb->aio_nbytes / 512;
> 
>> +        error_report("len is not aligned to zones");
>> +        return -EINVAL;
>> +    }
>> +
>> +    switch (op) {
>> +    case zone_open:
>> +        ioctl_name = "BLKOPENZONE";
>> +        ioctl_op = BLKOPENZONE;
>> +        break;
>> +    case zone_close:
>> +        ioctl_name = "BLKCLOSEZONE";
>> +        ioctl_op = BLKCLOSEZONE;
>> +        break;
>> +    case zone_finish:
>> +        ioctl_name = "BLKFINISHZONE";
>> +        ioctl_op = BLKFINISHZONE;
>> +        break;
>> +    case zone_reset:
>> +        ioctl_name = "BLKRESETZONE";
>> +        ioctl_op = BLKRESETZONE;
>> +        break;
>> +    default:
>> +        error_report("Invalid zone operation 0x%x", op);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* Execute the operation */
>> +    range.sector = offset;
>> +    range.nr_sectors = len;
>> +    ret = ioctl(fd, ioctl_op, &range);
>> +    if (ret != 0) {
>> +        error_report("ioctl %s failed %d",
>> +                     ioctl_name, errno);
>> +        return -errno;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static int handle_aiocb_copy_range(void *opaque)
>>  {
>>      RawPosixAIOData *aiocb = opaque;
>> @@ -2973,6 +3105,59 @@ static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
>>      }
>>  }
>>  
>> +/*
>> + * zone report - Get a zone block device's information in the form
>> + * of an array of zone descriptors.
>> + *
>> + * @param bs: passing zone block device file descriptor
>> + * @param zones: an array of zone descriptors to hold zone
>> + * information on reply
>> + * @param offset: offset can be any byte within the zone size.
>> + * @param len: (not sure yet.
>> + * @return 0 on success, -1 on failure
>> + */
>> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
>> +                                           int64_t *nr_zones,
>> +                                           BlockZoneDescriptor *zones) {
>> +    BDRVRawState *s = bs->opaque;
>> +    RawPosixAIOData acb;
>> +
>> +    acb = (RawPosixAIOData) {
>> +        .bs         = bs,
>> +        .aio_fildes = s->fd,
>> +        .aio_type   = QEMU_AIO_IOCTL,
> 
> Please define QEMU_AIO_ZONE_REPORT, QEMU_AIO_ZONE_MGMT, etc values for
> these new operations instead of reusing QEMU_AIO_IOCTL, which is meant
> for generic passthrough ioctls.
> 
>> +        .aio_offset = offset,
>> +        .zone_report    = {
>> +                .nr_zones       = nr_zones,
>> +                .zones          = zones,
>> +        },
>> +    };
>> +
>> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb);
>> +}
>> +
>> +/*
>> + * zone management operations - Execute an operation on a zone
>> + */
>> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, zone_op op,
>> +        int64_t offset, int64_t len) {
>> +    BDRVRawState *s = bs->opaque;
>> +    RawPosixAIOData acb;
>> +
>> +    acb = (RawPosixAIOData) {
>> +        .bs             = bs,
>> +        .aio_fildes     = s->fd,
>> +        .aio_type       = QEMU_AIO_IOCTL,
>> +        .aio_offset     = offset,
>> +        .aio_nbytes     = len,
>> +        .zone_mgmt  = {
>> +                .op = op,
>> +        },
>> +    };
>> +
>> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
>> +}
>> +
>>  static coroutine_fn int
>>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>>                  bool blkdev)
>> @@ -3324,6 +3509,9 @@ BlockDriver bdrv_file = {
>>      .bdrv_abort_perm_update = raw_abort_perm_update,
>>      .create_opts = &raw_create_opts,
>>      .mutable_opts = mutable_opts,
>> +
>> +    .bdrv_co_zone_report = raw_co_zone_report,
>> +    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
>>  };
>>  
>>  /***********************************************/
>> @@ -3703,6 +3891,53 @@ static BlockDriver bdrv_host_device = {
>>  #endif
>>  };
>>  
> 
> #ifdef __linux__
> 
>> +static BlockDriver bdrv_zoned_host_device = {
>> +        .format_name = "zoned_host_device",
>> +        .protocol_name = "zoned_host_device",
>> +        .instance_size = sizeof(BDRVRawState),
>> +        .bdrv_needs_filename = true,
>> +        .bdrv_probe_device  = hdev_probe_device,
>> +        .bdrv_parse_filename = hdev_parse_filename,
> 
> This function hardcodes "host_device:". zoned_host_device needs a
> separate function that uses "zoned_host_device:".
> 
>> +        .bdrv_file_open     = hdev_open,
>> +        .bdrv_close         = raw_close,
>> +        .bdrv_reopen_prepare = raw_reopen_prepare,
>> +        .bdrv_reopen_commit  = raw_reopen_commit,
>> +        .bdrv_reopen_abort   = raw_reopen_abort,
>> +        .bdrv_co_create_opts = bdrv_co_create_opts_simple,
>> +        .create_opts         = &bdrv_create_opts_simple,
>> +        .mutable_opts        = mutable_opts,
>> +        .bdrv_co_invalidate_cache = raw_co_invalidate_cache,
>> +        .bdrv_co_pwrite_zeroes = hdev_co_pwrite_zeroes,
>> +
>> +        .bdrv_co_preadv         = raw_co_preadv,
>> +        .bdrv_co_pwritev        = raw_co_pwritev,
>> +        .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
>> +        .bdrv_co_pdiscard       = hdev_co_pdiscard,
>> +        .bdrv_co_copy_range_from = raw_co_copy_range_from,
>> +        .bdrv_co_copy_range_to  = raw_co_copy_range_to,
>> +        .bdrv_refresh_limits = raw_refresh_limits,
>> +        .bdrv_io_plug = raw_aio_plug,
>> +        .bdrv_io_unplug = raw_aio_unplug,
>> +        .bdrv_attach_aio_context = raw_aio_attach_aio_context,
>> +
>> +        .bdrv_co_truncate       = raw_co_truncate,
>> +        .bdrv_getlength = raw_getlength,
>> +        .bdrv_get_info = raw_get_info,
>> +        .bdrv_get_allocated_file_size
>> +                            = raw_get_allocated_file_size,
>> +        .bdrv_get_specific_stats = hdev_get_specific_stats,
>> +        .bdrv_check_perm = raw_check_perm,
>> +        .bdrv_set_perm   = raw_set_perm,
>> +        .bdrv_abort_perm_update = raw_abort_perm_update,
>> +        .bdrv_probe_blocksizes = hdev_probe_blocksizes,
>> +        .bdrv_probe_geometry = hdev_probe_geometry,
>> +        .bdrv_co_ioctl = hdev_co_ioctl,
>> +
>> +        /* zone management operations */
>> +        .bdrv_co_zone_report = raw_co_zone_report,
>> +        .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
>> +};
> 
> #endif /* __linux__ */
> 
>> +
>>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>>  static void cdrom_parse_filename(const char *filename, QDict *options,
>>                                   Error **errp)
>> @@ -3964,6 +4199,7 @@ static void bdrv_file_init(void)
>>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>>      bdrv_register(&bdrv_host_device);
>>  #ifdef __linux__
>> +    bdrv_register(&bdrv_zoned_host_device);
>>      bdrv_register(&bdrv_host_cdrom);
>>  #endif
>>  #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>> diff --git a/include/block/block-common.h b/include/block/block-common.h
>> index fdb7306e78..78cddeeda5 100644
>> --- a/include/block/block-common.h
>> +++ b/include/block/block-common.h
>> @@ -23,7 +23,6 @@
>>   */
>>  #ifndef BLOCK_COMMON_H
>>  #define BLOCK_COMMON_H
>> -
>>  #include "block/aio.h"
>>  #include "block/aio-wait.h"
>>  #include "qemu/iov.h"
> 
> Please avoid making whitespace changes that are unrelated to the patch.
> 
>> @@ -49,6 +48,48 @@ typedef struct BlockDriver BlockDriver;
>>  typedef struct BdrvChild BdrvChild;
>>  typedef struct BdrvChildClass BdrvChildClass;
>>  
>> +typedef enum zone_op {
>> +    zone_open,
>> +    zone_close,
>> +    zone_finish,
>> +    zone_reset,
>> +} zone_op;
> 
> QEMU coding style:
> 
>   typedef enum {
>       BLK_ZO_OPEN,
>       BLK_ZO_CLOSE,
>       BLK_ZO_FINISH,
>       BLK_ZO_RESET,
>   } BlockZoneOp;
> 
> Please also reformat the enums below.
> 
>> +
>> +typedef enum zone_model {
>> +    BLK_Z_HM,
>> +    BLK_Z_HA,
>> +} zone_model;
>> +
>> +typedef enum BlkZoneCondition {
>> +    BLK_ZS_NOT_WP = 0x0,
>> +    BLK_ZS_EMPTY = 0x1,
>> +    BLK_ZS_IOPEN = 0x2,
>> +    BLK_ZS_EOPEN = 0x3,
>> +    BLK_ZS_CLOSED = 0x4,
>> +    BLK_ZS_RDONLY = 0xD,
>> +    BLK_ZS_FULL = 0xE,
>> +    BLK_ZS_OFFLINE = 0xF,
>> +} BlkZoneCondition;
>> +
>> +typedef enum BlkZoneType {
>> +    BLK_ZT_CONV = 0x1,
>> +    BLK_ZT_SWR = 0x2,
>> +    BLK_ZT_SWP = 0x3,
>> +} BlkZoneType;
>> +
>> +/*
>> + * Zone descriptor data structure.
>> + * Provide information on a zone with all position and size values in bytes.
>> + */
>> +typedef struct BlockZoneDescriptor {
>> +    uint64_t start;
>> +    uint64_t length;
>> +    uint64_t cap;
>> +    uint64_t wp;
>> +    BlkZoneType type;
>> +    BlkZoneCondition cond;
>> +} BlockZoneDescriptor;
>> +
>>  typedef struct BlockDriverInfo {
>>      /* in bytes, 0 if irrelevant */
>>      int cluster_size;
>> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
>> index 8947abab76..6037871089 100644
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -94,6 +94,20 @@ typedef struct BdrvTrackedRequest {
>>      struct BdrvTrackedRequest *waiting_for;
>>  } BdrvTrackedRequest;
>>  
>> +/**
>> + * Zone device information data structure.
>> + * Provide information on a device.
>> + */
>> +typedef struct zbd_dev {
>> +    uint32_t zone_size;
>> +    zone_model model;
>> +    uint32_t block_size;
>> +    uint32_t write_granularity;
>> +    uint32_t nr_zones;
>> +    struct BlockZoneDescriptor *zones; /* array of zones */
>> +    uint32_t max_nr_open_zones; /* maximum number of explicitly open zones */
>> +    uint32_t max_nr_active_zones;
>> +} zbd_dev;
> 
> This struct isn't use by this patch. Please move this change into the
> patch that uses struct zbd_dev.
> 
> QEMU coding style naming would be BlockZoneDev instead of zbd_dev.
> 
> I think this struct contains the block limits fields that could be added
> to QEMU's BlockLimits? A new struct may not be necessary.
> 
>>  
>>  struct BlockDriver {
>>      /*
>> @@ -691,6 +705,12 @@ struct BlockDriver {
>>                                            QEMUIOVector *qiov,
>>                                            int64_t pos);
>>  
>> +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
>> +            int64_t offset, int64_t *nr_zones,
>> +            BlockZoneDescriptor *zones);
>> +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, enum zone_op op,
>> +            int64_t offset, int64_t len);
>> +
>>      /* removable device specific */
>>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>>      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
>> -- 
>> 2.36.1
>>


-- 
Damien Le Moal
Western Digital Research

