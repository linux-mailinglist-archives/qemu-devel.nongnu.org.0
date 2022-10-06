Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850D65F7186
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 01:07:08 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogZxL-0006Qw-2V
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 19:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27103be27=damien.lemoal@opensource.wdc.com>)
 id 1ogZuc-0003rF-4a
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 19:04:18 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:14204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27103be27=damien.lemoal@opensource.wdc.com>)
 id 1ogZuZ-0002nx-8Y
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 19:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665097455; x=1696633455;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kdBZbGzE5cFPPIhTOvnjoQChR79Y8FGDyRqjbODJ3KE=;
 b=Yl4nk+iS6ToFAReXv9JxIBuXh4GHlaWi8oSTa/ofwAF3rbU/l6DalswV
 OTHvXhw/AcQh1qvpyK6Qe1DxmAm33ZJNTuaXhLyG6gg9P7hoazuXoyiy/
 ydCyxGuEIIzMA8RwSQNCuNJhHvTjRERIEp0AgNPOi87zEJxj52qVj48Il
 UQyVix5eBwd51gP296fWKjvgtTw4BXsPYfKW/V9vTUzIgtDCgD0pBoioG
 zH5SI1DlwLP9DPsv2eoi1jePI9tY2yMgVyK53wS+4k7FZp6GEG8q2ZWWV
 Nl+G28DdY7LsNQwf1fXmizJl0Jt8MMbhgZxFoWrq67+VWrVIXy+8A5gzF g==;
X-IronPort-AV: E=Sophos;i="5.95,164,1661788800"; d="scan'208";a="325287241"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2022 07:04:00 +0800
IronPort-SDR: qD0BLviNfwWMjxUx4wU5c4GROv0aBUYAz5rB52I11dPygNPh9gLADFFSKHzZx7OJ6tkBrO243d
 1SGcAoszCpzTRVW0nuosHYgn1erkdV/IOgin92wdJdKSV1P3cXjzfjJDJhkuLkaJQBYU0IkAT6
 cYeLtO8Tfp1i/1bLZckOg3xZY31yoDHi8/Zf9tfafT4wCJGmVavOZ+QS3i0kVyQRXL20NO8Wv6
 uVGCI9IOH8jCOvUJ5xRKdfBH3CyAcunKxWJVd8+RKvtnsFxKt4Nqm4EGFUFhh979U3elV9HYHE
 ApfL/qyKGP/vX+jAJOvQ6ltr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2022 15:23:46 -0700
IronPort-SDR: Kpn7YinDWADwXIE7a2l3N87TpjwXHv7lGMHImtUTz8B0HP04Gb/Jn2zL0su3qt4bxh2ovqXT6D
 SIju9hIqLcONIjYAVGHxmWj6y+k5o3KHQR51yJPGKjqbmFBtJZAhmITmORg7Pli/Z7VnZUpBwZ
 6hxxAyELPwNK1cRuNGdvEgnumtSWLTcf4M3vfd/0b/QoVgPB01AoraZT2873uO5FrcFMts/T8P
 iw1IBq+KFh1M1czVE/udqVNirACkYWW86HW7vccBco5ocXk7a7clDtf87RsodyR8uX3dR5S49g
 HIA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2022 16:04:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mk6Sb73LJz1RwvL
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 16:03:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665097437; x=1667689438; bh=kdBZbGzE5cFPPIhTOvnjoQChR79Y8FGDyRq
 jbODJ3KE=; b=PJVZZIZxWQe/u5SBQL/zFdeKZQ5472PAmUZxgCi7QJyQCHFqit5
 zMVzdCnylN4GlEP52flOjloh4zqtPfmt5pdNemKvKEchktau6rYsbIJEdVjWdPXE
 kLYnh0UKLGdQfKKxXe4Mid1h7mvfZareStCgbLAJazUI1avWulJzGBTOeVC5RuRz
 ezcMZllnqlG/4ZPoLlR9hivRwPeKfmlxB1IVmhIIxD1qGPOtxiPj9xLIFM9i3yxx
 UW03E8SPZPkRZjbkTvZ4UNiEMqUOWXU89rEdq9P+MVJJk+hINSFdOASE6uuhWqgu
 lvYINrWAjAKwzuJOaEmot9vUbu/kJNcOZ4w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5KEZhhidgvUZ for <qemu-devel@nongnu.org>;
 Thu,  6 Oct 2022 16:03:57 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mk6SW4B2Pz1RvLy;
 Thu,  6 Oct 2022 16:03:55 -0700 (PDT)
Message-ID: <d266eb18-5bc2-75ae-5533-325fcafd4471@opensource.wdc.com>
Date: Fri, 7 Oct 2022 08:03:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de, Hanna Reitz
 <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, dmitry.fomichev@wdc.com
References: <20220929083631.61899-1-faithilikerun@gmail.com>
 <20220929083631.61899-4-faithilikerun@gmail.com> <YzsgP1ZLA9pjrIn8@fedora>
 <c44209ec-63d1-2870-9695-28696e8de5a8@opensource.wdc.com>
 <Yz7xc+pQp7gsav57@fedora>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Yz7xc+pQp7gsav57@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=27103be27=damien.lemoal@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
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

On 10/7/22 00:17, Stefan Hajnoczi wrote:
> On Tue, Oct 04, 2022 at 08:23:15AM +0900, Damien Le Moal wrote:
>> On 2022/10/04 2:47, Stefan Hajnoczi wrote:
>>> On Thu, Sep 29, 2022 at 04:36:27PM +0800, Sam Li wrote:
>>>> Add a new zoned_host_device BlockDriver. The zoned_host_device option
>>>> accepts only zoned host block devices. By adding zone management
>>>> operations in this new BlockDriver, users can use the new block
>>>> layer APIs including Report Zone and four zone management operations
>>>> (open, close, finish, reset).
>>>>
>>>> Qemu-io uses the new APIs to perform zoned storage commands of the device:
>>>> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
>>>> zone_finish(zf).
>>>>
>>>> For example, to test zone_report, use following command:
>>>> $ ./build/qemu-io --image-opts -n driver=zoned_host_device, filename=/dev/nullb0
>>>> -c "zrp offset nr_zones"
>>>>
>>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>>> ---
>>>>  block/block-backend.c             | 146 +++++++++++++
>>>>  block/file-posix.c                | 340 +++++++++++++++++++++++++++++-
>>>>  block/io.c                        |  41 ++++
>>>>  include/block/block-common.h      |   4 +
>>>>  include/block/block-io.h          |   7 +
>>>>  include/block/block_int-common.h  |  24 +++
>>>>  include/block/raw-aio.h           |   6 +-
>>>>  include/sysemu/block-backend-io.h |  17 ++
>>>>  meson.build                       |   4 +
>>>>  qapi/block-core.json              |   8 +-
>>>>  qemu-io-cmds.c                    | 148 +++++++++++++
>>>>  11 files changed, 741 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>>> index d4a5df2ac2..f7f7acd6f4 100644
>>>> --- a/block/block-backend.c
>>>> +++ b/block/block-backend.c
>>>> @@ -1431,6 +1431,15 @@ typedef struct BlkRwCo {
>>>>      void *iobuf;
>>>>      int ret;
>>>>      BdrvRequestFlags flags;
>>>> +    union {
>>>> +        struct {
>>>> +            unsigned int *nr_zones;
>>>> +            BlockZoneDescriptor *zones;
>>>> +        } zone_report;
>>>> +        struct {
>>>> +            BlockZoneOp op;
>>>> +        } zone_mgmt;
>>>> +    };
>>>>  } BlkRwCo;
>>>>  
>>>>  int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
>>>> @@ -1775,6 +1784,143 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
>>>>      return ret;
>>>>  }
>>>>  
>>>> +static void blk_aio_zone_report_entry(void *opaque) {
>>>
>>>
>>> The coroutine_fn annotation is missing:
>>>
>>>   static void coroutine_fn blk_aio_zone_report_entry(void *opaque) {
>>>
>>>> +    BlkAioEmAIOCB *acb = opaque;
>>>> +    BlkRwCo *rwco = &acb->rwco;
>>>> +
>>>> +    rwco->ret = blk_co_zone_report(rwco->blk, rwco->offset,
>>>> +                                   rwco->zone_report.nr_zones,
>>>> +                                   rwco->zone_report.zones);
>>>> +    blk_aio_complete(acb);
>>>> +}
>>>> +
>>>> +BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, int64_t offset,
>>>> +                                unsigned int *nr_zones,
>>>> +                                BlockZoneDescriptor  *zones,
>>>> +                                BlockCompletionFunc *cb, void *opaque)
>>>> +{
>>>> +    BlkAioEmAIOCB *acb;
>>>> +    Coroutine *co;
>>>> +    IO_CODE();
>>>> +
>>>> +    blk_inc_in_flight(blk);
>>>> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
>>>> +    acb->rwco = (BlkRwCo) {
>>>> +        .blk    = blk,
>>>> +        .offset = offset,
>>>> +        .ret    = NOT_DONE,
>>>> +        .zone_report = {
>>>> +            .zones = zones,
>>>> +            .nr_zones = nr_zones,
>>>> +        },
>>>> +    };
>>>> +    acb->has_returned = false;
>>>> +
>>>> +    co = qemu_coroutine_create(blk_aio_zone_report_entry, acb);
>>>> +    bdrv_coroutine_enter(blk_bs(blk), co);
>>>> +
>>>> +    acb->has_returned = true;
>>>> +    if (acb->rwco.ret != NOT_DONE) {
>>>> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
>>>> +                                         blk_aio_complete_bh, acb);
>>>> +    }
>>>> +
>>>> +    return &acb->common;
>>>> +}
>>>> +
>>>> +static void blk_aio_zone_mgmt_entry(void *opaque) {
>>>
>>> coroutine_fn is missing here.
>>>
>>>> +    BlkAioEmAIOCB *acb = opaque;
>>>> +    BlkRwCo *rwco = &acb->rwco;
>>>> +
>>>> +    rwco->ret = blk_co_zone_mgmt(rwco->blk, rwco->zone_mgmt.op,
>>>> +                                 rwco->offset, acb->bytes);
>>>> +    blk_aio_complete(acb);
>>>> +}
>>>> +
>>>> +BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>>>> +                              int64_t offset, int64_t len,
>>>> +                              BlockCompletionFunc *cb, void *opaque) {
>>>> +    BlkAioEmAIOCB *acb;
>>>> +    Coroutine *co;
>>>> +    IO_CODE();
>>>> +
>>>> +    blk_inc_in_flight(blk);
>>>> +    acb = blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
>>>> +    acb->rwco = (BlkRwCo) {
>>>> +        .blk    = blk,
>>>> +        .offset = offset,
>>>> +        .ret    = NOT_DONE,
>>>> +        .zone_mgmt = {
>>>> +            .op = op,
>>>> +        },
>>>> +    };
>>>> +    acb->bytes = len;
>>>> +    acb->has_returned = false;
>>>> +
>>>> +    co = qemu_coroutine_create(blk_aio_zone_mgmt_entry, acb);
>>>> +    bdrv_coroutine_enter(blk_bs(blk), co);
>>>> +
>>>> +    acb->has_returned = true;
>>>> +    if (acb->rwco.ret != NOT_DONE) {
>>>> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
>>>> +                                         blk_aio_complete_bh, acb);
>>>> +    }
>>>> +
>>>> +    return &acb->common;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Send a zone_report command.
>>>> + * offset is a byte offset from the start of the device. No alignment
>>>> + * required for offset.
>>>> + * nr_zones represents IN maximum and OUT actual.
>>>> + */
>>>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
>>>> +                                    unsigned int *nr_zones,
>>>> +                                    BlockZoneDescriptor *zones)
>>>> +{
>>>> +    int ret;
>>>> +    IO_CODE();
>>>> +
>>>> +    blk_inc_in_flight(blk); /* increase before waiting */
>>>> +    blk_wait_while_drained(blk);
>>>> +    if (!blk_is_available(blk)) {
>>>> +        blk_dec_in_flight(blk);
>>>> +        return -ENOMEDIUM;
>>>> +    }
>>>> +    ret = bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones);
>>>> +    blk_dec_in_flight(blk);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Send a zone_management command.
>>>> + * op is the zone operation;
>>>> + * offset is the byte offset from the start of the zoned device;
>>>> + * len is the maximum number of bytes the command should operate on. It
>>>> + * should be aligned with the device zone size.
>>>> + */
>>>> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>>>> +        int64_t offset, int64_t len)
>>>> +{
>>>> +    int ret;
>>>> +    IO_CODE();
>>>> +
>>>> +
>>>> +    blk_inc_in_flight(blk);
>>>> +    blk_wait_while_drained(blk);
>>>> +
>>>> +    ret = blk_check_byte_request(blk, offset, len);
>>>> +    if (ret < 0) {
>>>> +        blk_dec_in_flight(blk);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
>>>> +    blk_dec_in_flight(blk);
>>>> +    return ret;
>>>> +}
>>>> +
>>>>  void blk_drain(BlockBackend *blk)
>>>>  {
>>>>      BlockDriverState *bs = blk_bs(blk);
>>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>>> index 0a8b4b426e..0a6c781201 100644
>>>> --- a/block/file-posix.c
>>>> +++ b/block/file-posix.c
>>>> @@ -67,6 +67,9 @@
>>>>  #include <sys/param.h>
>>>>  #include <sys/syscall.h>
>>>>  #include <sys/vfs.h>
>>>> +#if defined(CONFIG_BLKZONED)
>>>> +#include <linux/blkzoned.h>
>>>> +#endif
>>>>  #include <linux/cdrom.h>
>>>>  #include <linux/fd.h>
>>>>  #include <linux/fs.h>
>>>> @@ -216,6 +219,15 @@ typedef struct RawPosixAIOData {
>>>>              PreallocMode prealloc;
>>>>              Error **errp;
>>>>          } truncate;
>>>> +        struct {
>>>> +            unsigned int *nr_zones;
>>>> +            BlockZoneDescriptor *zones;
>>>> +        } zone_report;
>>>> +        struct {
>>>> +            unsigned long zone_op;
>>>> +            const char *zone_op_name;
>>>> +            bool all;
>>>
>>> Please remove this field if it is unused.
>>>
>>>> +        } zone_mgmt;
>>>>      };
>>>>  } RawPosixAIOData;
>>>>  
>>>> @@ -1339,7 +1351,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>>>  #endif
>>>>  
>>>>      if (bs->sg || S_ISBLK(st.st_mode)) {
>>>> -        int ret = hdev_get_max_hw_transfer(s->fd, &st);
>>>> +        ret = hdev_get_max_hw_transfer(s->fd, &st);
>>>>  
>>>>          if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
>>>>              bs->bl.max_hw_transfer = ret;
>>>> @@ -1356,6 +1368,41 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>>>          zoned = BLK_Z_NONE;
>>>>      }
>>>>      bs->bl.zoned = zoned;
>>>> +    if (zoned != BLK_Z_NONE) {
>>>> +        ret = get_sysfs_long_val(&st, "chunk_sectors");
>>>> +        if (ret <= 0) {
>>>> +            error_report("Invalid zone size %" PRId32 " sectors ", ret);
>>>> +            bs->bl.zoned = BLK_Z_NONE;
>>>> +            return;
>>>> +        }
>>>> +        bs->bl.zone_size = ret * 512;
>>>> +
>>>> +        ret = get_sysfs_long_val(&st, "zone_append_max_bytes");
>>>> +        if (ret > 0) {
>>>> +            bs->bl.max_append_sectors = ret / 512;
>>>> +        }
>>>> +
>>>> +        ret = get_sysfs_long_val(&st, "max_open_zones");
>>>> +        if (ret >= 0) {
>>>> +            bs->bl.max_open_zones = ret;
>>>> +        }
>>>> +
>>>> +        ret = get_sysfs_long_val(&st, "max_active_zones");
>>>> +        if (ret >= 0) {
>>>> +            bs->bl.max_active_zones = ret;
>>>> +        }
>>>> +        
>>>> +        ret = get_sysfs_long_val(&st, "nr_zones");
>>>> +        if (ret >= 0) {
>>>> +            bs->bl.nr_zones = ret;
>>>> +        }
>>>> +
>>>> +        ret = ioctl(s->fd, BLKGETSIZE64, &bs->bl.capacity);
>>>> +        if (ret != 0) {
>>>> +            error_report("Invalid device capacity %" PRId64 " bytes ", bs->bl.capacity);
>>>> +            return;
>>>> +        }
>>>
>>> The QEMU block layer already knows the capacity of the device. Can
>>> bdrv_getlength() be used instead of introducing a new
>>> BlockLimits.capacity field?
>>>
>>>> +    }
>>>>  }
>>>>  
>>>>  static int check_for_dasd(int fd)
>>>> @@ -1850,6 +1897,147 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>>>>  }
>>>>  #endif
>>>>  
>>>> +/*
>>>> + * parse_zone - Fill a zone descriptor
>>>> + */
>>>> +#if defined(CONFIG_BLKZONED)
>>>> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
>>>> +                              const struct blk_zone *blkz,
>>>> +                              const struct blk_zone_report *rep) {
>>>> +    zone->start = blkz->start << BDRV_SECTOR_BITS;
>>>> +    zone->length = blkz->len << BDRV_SECTOR_BITS;
>>>> +    zone->wp = blkz->wp << BDRV_SECTOR_BITS;
>>>> +    
>>>> +    if (rep->flags & BLK_ZONE_REP_CAPACITY) {
>>>> +        zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
>>>
>>> #ifdef HAVE_BLK_ZONE_REP_CAPACITY is needed since the rep->flags and
>>> blkz->capacity fields are missing and would cause a compilation error
>>> when HAVE_BLK_ZONE_REP_CAPACITY is not defined:
>>>
>>>   zone->cap = blkz->len << BDRV_SECTOR_BITS;
>>>   #ifdef HAVE_BLK_ZONE_REP_CAPACITY
>>>   /* Replace with the dedicated field on newer kernels */
>>>   if (rep->flags & BLK_ZONE_REP_CAPACITY) {
>>>       zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
>>>   }
>>>   #endif
>>
>> It would be a lot cleaner to do something like this:
>>
>> in the block common header file, add:
>>
>> #ifdef HAVE_BLK_ZONE_REP_CAPACITY
>>
>> #define BLK_ZONE_REP_CAPACITY   (1 << 0)
>>
>> struct blk_zone_v2 {
>>         __u64   start;          /* Zone start sector */
>>         __u64   len;            /* Zone length in number of sectors */
>>         __u64   wp;             /* Zone write pointer position */
>>         __u8    type;           /* Zone type */
>>         __u8    cond;           /* Zone condition */
>>         __u8    non_seq;        /* Non-sequential write resources active */
>>         __u8    reset;          /* Reset write pointer recommended */
>>         __u8    resv[4];
>>         __u64   capacity;       /* Zone capacity in number of sectors */
>>         __u8    reserved[24];
>> };
>> #define blk_zone blk_zone_v2
>>
>> struct blk_zone_report_v2 {
>>         __u64   sector;
>>         __u32   nr_zones;
>>         __u32   flags;
>> 	struct blk_zone zones[0];
>> };
>> #define blk_zone_report blk_zone_report_v2
>>
>> #endif
>>
>> Then the above code becomes:
>>
>> if (rep->flags & BLK_ZONE_REP_CAPACITY) {
>>     zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
>> } else {
>>     zone->cap = blkz->len << BDRV_SECTOR_BITS;
>> }
>>
>> No #ifdef in the C code, only in the header and that compiles and works for all
>> host kernel versions.
> 
> The ->flags field doesn't exist in old versions of the header. How will
> "if (rep->flags ..." compile on old systems?

The "#define blk_zone_report blk_zone_report_v2" overloads the kernel API
defined struct that does not have the flag with the v2 struct definition
that has the flags field. So code compiled against older kernels can use
the flags and will always see that field as 0. This is how we have libzbd
coded and this compiles & works on all kernels.

> 
> Stefan

-- 
Damien Le Moal
Western Digital Research


