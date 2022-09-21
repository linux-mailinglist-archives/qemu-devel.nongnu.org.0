Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80325BF598
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 06:52:21 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaric-0000GA-6q
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 00:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=25666b47c=damien.lemoal@opensource.wdc.com>)
 id 1oarbr-00048i-AQ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 00:45:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=25666b47c=damien.lemoal@opensource.wdc.com>)
 id 1oarbp-0005Hs-7v
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 00:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663735516; x=1695271516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iYPyfembzrZ1UreKik23iawZyBNZR6vY64oRYBULmXA=;
 b=QjFmzGgEnSbnwyBePAxHcBNi+gcUVxnRt201LVUvZL3AxcIeX9rsHFls
 H0PgHyyyp6aeIng0VNzDjQZ3Tul2YCUOUF1dS4oACqBpkED3E1/9PXl9q
 SA1sgwd5fdBgsYsyR/pk1TKmbOr9e2shuOkncfnd7ETNivoN4OYY+aEVK
 C+xZLmNZ2rOvaZFEvxYJKlsmEkFkEfhzCbdafvHQH2CEGyxZPW53CR9hQ
 93XzM64UnDmMSaYoSLbbDjV8I4KNP5bB8cJdcP7kNpzYCGUNcYbuIAVLq
 HLqW8I0NWCeMB+V/AMrD+1aQw6pBMXSI0hc0jYxK7Hm6WxX4MNrHf36cd Q==;
X-IronPort-AV: E=Sophos;i="5.93,332,1654531200"; d="scan'208";a="211873592"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2022 12:45:06 +0800
IronPort-SDR: hMtirYE/1TKeaq5WGW/ZkBDRarmD+vFFMdfhNzwttlnyeymneoiPcCKI12kSGQhxd+1oW4zH7w
 ZO2wla52KT5/tlg+XozZkSSuurOhJoMVg/bosIMq9gJN+IOWU8Q1Mmxl21abVq2RudWv8Wx1XX
 ZRQ3gXmvhKpKuuhf0LFfrs7dIsKG+iDhi5L1fpig5vJf88LPSEPEbvGKFy1WPHxl1O3DRVZGnK
 BoRec3lWxzgHA4K1L5BGIyCoHfZ5ch8U211/Q4Yjr5n9RG/wvEclQEEViihpRsH4T7/CeKaKf+
 /61IgxIrohOPc0MZL3v6EMge
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2022 20:59:42 -0700
IronPort-SDR: PC8uRqoJwqSgGK+xxLNmoi7p54mM99l+jPXXBxNa8oo3HR8FKQ6Lhv5a3G7M368qDhdlYd7TrD
 KmsrXkzfYQ8g16uTYyvR5ZL0au/ABI0dlJpZ7XOCLfmlgmoOpxv7xa76yTaaVUG+kB008Ev64s
 kwu3GNWjl7Q0cZTNeI093vlwkC1qdgiYkA63CxSk1p0kNN5SL/0hsQ9oXXC3VfgZRbcZmVtG36
 Mp2Hl5d7LJI05Eagf2A6WGFFBiwEGccsVG2XoBslB/I1hRK3xJLemOiATY8zDsU06+BugOXlzw
 vN4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2022 21:45:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MXQnZ6QD5z1RvTp
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 21:45:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1663735506; x=1666327507; bh=iYPyfembzrZ1UreKik23iawZyBNZR6vY64o
 RYBULmXA=; b=B4ONAyV0edXok7pzlFA3lxkd9W2hoktJiaAe8gEVicDykPThLHe
 ZY/GwhIOLz0ZuotoPDw1xR69rSs3SRW277FjX+NNrzMAQ+aNHuxQ+ygOexizz8w7
 t2M8EQv+ihKLlA4sJz4qJ5swIYXevahOM/Ox5qOhMZk0Dze+nstDRvrDMOLEq+zJ
 bo9g6sC+W++6DTS35zHqANpPZBMuGZcK6yU8bVwEjgf0YexUqvwUbzhxdATipVQ/
 +4WP4YPAct2ZFXrAmv19f68yEcniNDfb27LADukC1uYv3JvTnyvjKIzqFkAW/94F
 BG9gl6bGPai/ig/vp34LM+SP1sA9xkQYHmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r8Jc8GQJ9SnU for <qemu-devel@nongnu.org>;
 Tue, 20 Sep 2022 21:45:06 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MXQnT3JN1z1RvLy;
 Tue, 20 Sep 2022 21:45:01 -0700 (PDT)
Message-ID: <10fa1e0b-032a-b82a-80e1-4232d1c6a965@opensource.wdc.com>
Date: Wed, 21 Sep 2022 13:44:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com> <Yyl/AC9X7uHyeTCu@apples>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Yyl/AC9X7uHyeTCu@apples>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=25666b47c=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.182,
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

On 9/20/22 17:51, Klaus Jensen wrote:
> On Sep 10 13:27, Sam Li wrote:
>> Add a new zoned_host_device BlockDriver. The zoned_host_device option
>> accepts only zoned host block devices. By adding zone management
>> operations in this new BlockDriver, users can use the new block
>> layer APIs including Report Zone and four zone management operations
>> (open, close, finish, reset).
>>
>> Qemu-io uses the new APIs to perform zoned storage commands of the device:
>> zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
>> zone_finish(zf).
>>
>> For example, to test zone_report, use following command:
>> $ ./build/qemu-io --image-opts -n driver=zoned_host_device, filename=/dev/nullb0
>> -c "zrp offset nr_zones"
>>
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>> ---
>>   block/block-backend.c             | 145 ++++++++++++++
>>   block/file-posix.c                | 323 +++++++++++++++++++++++++++++-
>>   block/io.c                        |  41 ++++
>>   include/block/block-io.h          |   7 +
>>   include/block/block_int-common.h  |  21 ++
>>   include/block/raw-aio.h           |   6 +-
>>   include/sysemu/block-backend-io.h |  17 ++
>>   meson.build                       |   1 +
>>   qapi/block-core.json              |   8 +-
>>   qemu-io-cmds.c                    | 143 +++++++++++++
>>   10 files changed, 708 insertions(+), 4 deletions(-)
>>
>> +/*
>> + * zone management operations - Execute an operation on a zone
>> + */
>> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>> +        int64_t offset, int64_t len) {
>> +#if defined(CONFIG_BLKZONED)
>> +    BDRVRawState *s = bs->opaque;
>> +    RawPosixAIOData acb;
>> +    int64_t zone_sector, zone_sector_mask;
>> +    const char *zone_op_name;
>> +    unsigned long zone_op;
>> +    bool is_all = false;
>> +
>> +    zone_sector = bs->bl.zone_sectors;
>> +    zone_sector_mask = zone_sector - 1;
>> +    if (offset & zone_sector_mask) {
>> +        error_report("sector offset %" PRId64 " is not aligned to zone size "
>> +                     "%" PRId64 "", offset, zone_sector);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (len & zone_sector_mask) {
>> +        error_report("number of sectors %" PRId64 " is not aligned to zone size"
>> +                      " %" PRId64 "", len, zone_sector);
>> +        return -EINVAL;
>> +    }
> 
> These checks impose a power-of-two constraint on the zone size. Can they
> be changed to divisions to lift that constraint? I don't see anything in
> this patch set that relies on power of two zone sizes.

Given that Linux will only expose zoned devices that have a zone size 
that is a power of 2 number of LBAs, this will work as is and avoid 
divisions in the IO path. But given that zone management operations are 
not performance critical, generalizing the code should be fine.

However, once we start adding the code for full zone emulation on top of 
a regular file or qcow image, sector-to-zone conversions requiring 
divisions will hurt. So I really would prefer the code be left as-is for 
now.


-- 
Damien Le Moal
Western Digital Research


