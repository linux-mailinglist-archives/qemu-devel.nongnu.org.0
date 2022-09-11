Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76D5B4CA9
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 10:39:14 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXIUj-00054W-2U
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 04:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXISY-0003VO-Ix
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 04:36:58 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:24861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXISU-0004QN-Ta
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 04:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662885414; x=1694421414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PcjWKGDAOJ1zZ1v6L4js75N+RAHZlT3YLD6OHToBhH4=;
 b=bvrePRhgbhW5LxE2Xx4L1ml2Vt8VN0LBySelMMps/IY2/VFuNSkjZBzd
 doXtViL5zdDie7wZCzxB5MHyvaQRHH5qBEaPeI0KZ4yezbmkOE7Ogda3U
 nlFj2Wu+McDBCkVEhwPAdsFBhGzQUGxwiNsvUQqjyhbm+PgScdWMB2Cbr
 2IHYvcLgusn40aS/eJd6fmNPuvSaE9uTxWHm9fEdXQnJNT5LkXmJmlmdr
 wEjJrKJA4YYu+CplgzWgUxWDJVoZx+o9KYUD4X+9ZfcbjdqfBy/QYl6+g
 Gb27uAlmtH9kxhFSLc0+Wwm6QhSj1IdeaOi/4HE1xmgowsnaRF9C1E0On w==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="216209564"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 16:36:50 +0800
IronPort-SDR: VHUVn5am3E/ZAfokgrtJKhp/36L4qE/rzuBe7/EE/4n8c3/kiDNpcraxR+KVsnRGMSEDvIezJ7
 AmSmdYC158MkLdtXWhbnSp+Z0kUXBbtqa7f/HM3GBoGuu5Kyz3ncIHVMDcII1aL3tqhlxNj3MA
 d3gWcZ95PeLFF4j7VBC0vETCtuayWGFBIuDwPpmk0PYSE0wmjKywlOxWY6yCyPYOxgQc85B6Ym
 JlbWEmR9RV0A9bSG5qM7kWtCMX0900bahXqHY50kpFxJm8WOnTnMmNs3I4d3bU+d97Q+orVgrO
 5uctM01GBWGCkZcuh/4UCbD4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2022 00:57:07 -0700
IronPort-SDR: eHhmonL5MZM5w5w/92waYj0+rG0LRXVG2lrm1hbs44LPTshsCljAJCnmn6MxxCV/mpdPwswTMb
 VPqufyj6sK7lk5mwgbHBV0xwTSSv7KuCMsEidgc9gjAOy0z8EvnzPGwsvmY0dvOznfWSfFztQ0
 9brG53E3/MxIQLzCSnyuD3HkLYQu9YezRDM5diV5cj+dtqEWd6YlBwuB1oUHTlf/7onRnehIuR
 ndlTQOCHW/K/0cgS9YrsonkbvTIZhM0dyuGuXNHzC4W/pFDDusDILGgTHr0lIT1huZHbiJ1rDx
 FEM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2022 01:36:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQNPZ2bhLz1Rwtl
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 01:36:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662885409; x=1665477410; bh=PcjWKGDAOJ1zZ1v6L4js75N+RAHZlT3YLD6
 OHToBhH4=; b=gaqd7iEP81vJUkVLXK6BcBh87+ybcPQzFbg8h6Ve88LSuU1mXBA
 2lkVKKEhhxrt/IijQrKKskyXYaBPkbvbEene9sscPh+OseNpR9Y3oOiQ1IKABvxa
 9wV3pIBBceDRd5MZhz3TVfDrVHmUzJlysmi6fC2fVdnIUa/Xo0GEs2F+ry646XSD
 p/qnsEHMRSe+qH4cXOR7DUhCuFfFeRPQuFy2tcm0tXH77XaEqj1J/WvyL3OtiHvF
 fPLiuj0QmkWidglTrhPAJPHYk+xz2Z36NmYBenbNPvujt5Pi42ALOmnVavIDmLFh
 L+hh/flvLAgGi9ZfSWwAa75RxEbwwZ7u8Xg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id z_r_mUcTxS7W for <qemu-devel@nongnu.org>;
 Sun, 11 Sep 2022 01:36:49 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQNPW0zV1z1RvLy;
 Sun, 11 Sep 2022 01:36:46 -0700 (PDT)
Message-ID: <a0d5fe49-8290-72ca-3999-fd8701f94d15@opensource.wdc.com>
Date: Sun, 11 Sep 2022 17:36:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH] block: introduce zone append write for zoned devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu block <qemu-block@nongnu.org>
References: <20220910063836.31295-1-faithilikerun@gmail.com>
 <9665c8b0-b291-7a42-8242-73a7c0967917@opensource.wdc.com>
 <CAAAx-8KUHoW4Apr1u9urRyVnKmp1Qo2kMKWP2+iRui4jtYj9LA@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8KUHoW4Apr1u9urRyVnKmp1Qo2kMKWP2+iRui4jtYj9LA@mail.gmail.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2022/09/11 17:00, Sam Li wrote:
[...]
>>> @@ -1604,6 +1629,12 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>>>                           (const char *)buf + offset,
>>>                           aiocb->aio_nbytes - offset,
>>>                           aiocb->aio_offset + offset);
>>> +        } else if (aiocb->aio_type == QEMU_AIO_ZONE_APPEND) {
>>> +            uint64_t wp = aiocb->aio_offset;
>>
>> This variable is not necessary.
>>
>>> +            len = pwrite(aiocb->aio_fildes,
>>> +                         (const char *)buf + offset,
>>> +                         aiocb->aio_nbytes - offset,
>>> +                         wp + offset);
>>>          } else {
>>>              len = pread(aiocb->aio_fildes,
>>>                          buf + offset,
>>> @@ -1638,7 +1669,6 @@ static int handle_aiocb_rw(void *opaque)
>>>      RawPosixAIOData *aiocb = opaque;
>>>      ssize_t nbytes;
>>>      char *buf;
>>> -
>>
>> whiteline change.
>>
>>>      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
>>>          /*
>>>           * If there is just a single buffer, and it is properly aligned
>>> @@ -1692,7 +1722,7 @@ static int handle_aiocb_rw(void *opaque)
>>>      }
>>>
>>>      nbytes = handle_aiocb_rw_linear(aiocb, buf);
>>> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
>>> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
>>>          char *p = buf;
>>>          size_t count = aiocb->aio_nbytes, copy;
>>>          int i;
>>> @@ -1713,6 +1743,25 @@ static int handle_aiocb_rw(void *opaque)
>>>
>>>  out:
>>>      if (nbytes == aiocb->aio_nbytes) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>>> +            BlockZoneDescriptor *zone = aiocb->io.zone;
>>> +            int64_t nr_sectors = aiocb->aio_nbytes / 512;
>>> +            if (zone) {
>>> +                qemu_mutex_init(&zone->lock);
>>> +                if (zone->type == BLK_ZT_SWR) {
>>> +                    qemu_mutex_lock(&zone->lock);
>>> +                    zone->wp += nr_sectors;
>>> +                    qemu_mutex_unlock(&zone->lock);
>>> +                }
>>> +                qemu_mutex_destroy(&zone->lock);
>>
>> This is weird. you init the mutex, lock/unlock it and destroy it. So it has
>> absolutely no meaning at all.
> 
> I was thinking that init every lock for all the zones or init the lock
> for the zone that needed it. The confusion I have here is the cost of
> initializing/destroying the lock.

A mutex needs to be initialized before it is used and should not be
re-initialized, ever, until it is not needed anymore. That is, in this case,
since the mutex protects a zone wp tracking entry, it should be initialized when
the array of zone wp is allocated & initialized with a zone report, and the
mutex destroyed when that same array is freed.

The cost of initializing & destroying a mutex is low. And since that is not done
in the hot IO path, you do not need to worry about it.

[...]
>>> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
>>> +                                           int64_t *offset,
>>> +                                           QEMUIOVector *qiov,
>>> +                                           BdrvRequestFlags flags) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +    BDRVRawState *s = bs->opaque;
>>> +    int64_t zone_sector = bs->bl.zone_sectors;
>>> +    int64_t zone_sector_mask = zone_sector - 1;
>>> +    int64_t iov_len = 0;
>>> +    int64_t len = 0;
>>> +    RawPosixAIOData acb;
>>> +
>>> +    if (*offset & zone_sector_mask) {
>>> +        error_report("offset %" PRId64 " is not aligned to zone size "
>>> +                     "%" PRId64 "", *offset, zone_sector);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    int64_t lbsz = bs->bl.logical_block_size;> +    int64_t lbsz_mask = lbsz - 1;
>>> +    for (int i = 0; i < qiov->niov; i++) {
>>> +       iov_len = qiov->iov[i].iov_len;
>>> +       if (iov_len & lbsz_mask) {
>>> +           error_report("len of IOVector[%d] %" PRId64 " is not aligned to block "
>>> +                        "size %" PRId64 "", i, iov_len, lbsz);
>>> +           return -EINVAL;
>>> +       }
>>
>> This alignment check should be against the device write granularity, not the
>> logical block size. The write granularity will always be equal to the device
>> physical block size, which may or may not be equal to the device logical block
>> size. E.g. a 512e SMR disk has a 512B logical block size but a 4096B physical
>> block size. And the ZBC & ZAC specifications mandate that all write be aligned
>> to the physical block size.
> 
> I see. I'll change it to physical block size.

I would use a filed called "write_granularity" since the virtio specs will
introduce that anyway. This zone granularity is going to be indeed equal to the
physical block size of the host device for now.

[...]
>>>      /* removable device specific */
>>>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>>> @@ -854,6 +857,12 @@ typedef struct BlockLimits {
>>>
>>>      /* maximum number of active zones */
>>>      int64_t max_active_zones;
>>> +
>>> +    /* array of zones in the zoned block device. Only tracks write pointer's
>>> +     * location of each zone as a helper for zone_append API */
>>> +    BlockZoneDescriptor *zones;
>>
>> This is a lot of memory for only tracking the wp... Why not reduce this to an
>> array of int64 values, for the wp only ? As you may need the zone type too
>> (conventional vs sequential), you can use the most significant bit (a zone wp
>> value will never use all 64 bits !).
>>
>> Or device another zone structure with zone type, zone wp and mutex only, so
>> smaller than the regular zone report structure.
> 
> I was just trying to reuse do_zone_report. It is better to only track
> the wp only. Then a new struct and smaller zone_report should be
> introduced for it.

Yes, this will use less memory, which is always good.

-- 
Damien Le Moal
Western Digital Research


