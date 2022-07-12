Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31D5712A3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:59:48 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9s3-0004bc-93
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oB9Ud-0005zE-Ig
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:35:35 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:19961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oB9UZ-00024A-LD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 02:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657607731; x=1689143731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nM9touHSy1TLC/nffEVHepT2MEBxA2cn8qbWbysmhuo=;
 b=ERxjFyc3De1lOvuCssN9MgLpLbrhdCX0bPqehYHe4900yJDtvft2Mpez
 Hx73T6xjUdOs1YIphbDaVkvdGj6ncz1xhU/9yI3uwmcRYmIf+T2SiHFnt
 wPMleZGB63UGaOPqum0uz4Kw0HWLDmSEW7nvGIWbbLFUAGCCLqlj23EVk
 V3vjA27rh+Ucg5wZnV9xfWD8T8+4RDCyPbKfS2j+OAbtqDLirC8uvVmrQ
 oI815VfELQLpS7YgGUz/cOQZITWpru2GIoGzEs04klWyR6QjbUpXCquLC
 pJXaNyaOh4FT/hvdJeHefgYRuI8AvLbcKAoFt8n5DqaJws0O0SFGVy1TD A==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650902400"; d="scan'208";a="309790926"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2022 14:35:24 +0800
IronPort-SDR: w0uLwtCkWVRr915hF32OZj67okZzDWoU+etzVM8koSSWkpX0SlBpUz8DeEqrs8b9UvziipQvuf
 tOta6FflrkoRLVoyQ1T5T4Rx3xERGxkeK1AEJJv55Bvt8uPaQKA00FE+lvPJciU8TVVXx9H2uE
 /2tQZauGBdI1V1zRhDTe9SlAAHjMHp921NYRSlIYvmXhRxj5EAaPguyYw5nw6w5G5eTv3m8kaS
 /d+FgI3bc+V5MKBWkH3U1peN2qaotmH3C37amiA72+u3rg6dJy9sQqFKg9fawO4fJpMCiJInQc
 rwBf7syOM9SMgbUXH38VWuDU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 22:52:22 -0700
IronPort-SDR: FhFp0fX9JRCmD5iBFqJWSNKrg/BLoROtsOVO4ONJzh24uiroZ629cDVm+Cgr6Pdww+WIxAG7SG
 pkgB7sr0BN+CGq322IRVL84NYSdsNw+GeyXr5wEa/rhN0SE/takS4XdSzxrNWuwkh1aczRvTeA
 matqW3eZGapJptiefX+mjW3gc4ceQ8TzNYcsIuF5NsR9XPV95ubyaOOGq0bKV4jqoLqoLVKIXQ
 lz0ik9Jt3X6aIcRQYtgPanV/PQ4j7lWu+MKGjGRDwQDya8rzD/mOGTLEK+uU6u3ZmRgZlIJ03D
 EHY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 23:35:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lhrbb6Pdbz1Rws4
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 23:35:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657607723; x=1660199724; bh=nM9touHSy1TLC/nffEVHepT2MEBxA2cn8qb
 Wbysmhuo=; b=iCJu7kq1jN2d2xKqCtGQGdsG7bvoHK6NHqxB80roL9v9rSVKuYZ
 RhImqkic7l7ALTSeay2ckjPNOInkOErfg3PP2oE5BD9R8vydAFUzz0YiipAArGF3
 6n/5KH5UBtxBuvx9OoR5MNXuqLSfJCRnGgK+iqvWNiql4wmBJNI2WiPu60qCOy0S
 BKo4AZ9OfKOPii+ZLhrzFiq7POngMELYrhrhZIADl/QmJspvklte5EOnNdknvt0o
 fE+XzFr4bs7BLUhinMCSz+1ifIqlt9uA1qhPG+iKvMIr9qQ/x/cog4rRNEGWmtze
 IZc9oHSTMpZsneNTX1+6qIk8W4E5Pu1k4XQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oKf25pf73F5w for <qemu-devel@nongnu.org>;
 Mon, 11 Jul 2022 23:35:23 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LhrbY1QF4z1RtVk;
 Mon, 11 Jul 2022 23:35:21 -0700 (PDT)
Message-ID: <d08f73a1-4d6e-e1bb-21c9-321449e12fd5@opensource.wdc.com>
Date: Tue, 12 Jul 2022 15:35:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 4/9] file-posix: introduce get_sysfs_str_val for device
 zoned model.
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Sam Li <faithilikerun@gmail.com>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-5-faithilikerun@gmail.com>
 <1854c78a-a8eb-622e-da62-f074b0f08fee@suse.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1854c78a-a8eb-622e-da62-f074b0f08fee@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=18524360e=damien.lemoal@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/12/22 15:17, Hannes Reinecke wrote:
> On 7/12/22 04:13, Sam Li wrote:
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> ---
>>   block/file-posix.c           | 60 ++++++++++++++++++++++++++++++++++++
>>   include/block/block-common.h |  4 +--
>>   2 files changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 3161d39ea4..42708012ff 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -1279,6 +1279,65 @@ out:
>>   #endif
>>   }
>>   
>> +/*
>> + * Convert the zoned attribute file in sysfs to internal value.
>> + */
>> +static zone_model get_sysfs_str_val(int fd, struct stat *st) {
>> +#ifdef CONFIG_LINUX
>> +    char buf[32];
>> +    char *sysfspath = NULL;
>> +    int ret, offset;
>> +    int sysfd = -1;
>> +
>> +    if (S_ISCHR(st->st_mode)) {
>> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
>> +            return ret;
>> +        }
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    if (!S_ISBLK(st->st_mode)) {
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/zoned",
>> +                                major(st->st_rdev), minor(st->st_rdev));
>> +    sysfd = open(sysfspath, O_RDONLY);
>> +    if (sysfd == -1) {
>> +        ret = -errno;
>> +        goto out;
>> +    }
>> +    offset = 0;
>> +    do {
>> +        ret = read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
>> +        if (ret > 0) {
>> +            offset += ret;
>> +        }
>> +    } while (ret == -1);
>> +    /* The file is ended with '\n' */
>> +    if (buf[ret - 1] == '\n') {
>> +        buf[ret - 1] = '\0';
>> +    }
>> +
>> +    if (strcmp(buf, "host-managed") == 0) {
>> +        return BLK_Z_HM;
>> +    } else if (strcmp(buf, "host-aware") == 0) {
>> +        return BLK_Z_HA;
>> +    } else {
>> +        return -ENOTSUP;
>> +    }
>> +
>> +out:
>> +    if (sysfd != -1) {
>> +        close(sysfd);
>> +    }
>> +    g_free(sysfspath);
>> +    return ret;
>> +#else
>> +    return -ENOTSUP;
>> +#endif
>> +}
>> +
>>   static int hdev_get_max_segments(int fd, struct stat *st) {
>>       return get_sysfs_long_val(fd, st, "max_segments");
>>   }
>> @@ -1885,6 +1944,7 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>>       int64_t len = aiocb->aio_nbytes;
>>       zone_op op = aiocb->zone_mgmt.op;
>>   
>> +    zone_model mod;
>>       struct blk_zone_range range;
>>       const char *ioctl_name;
>>       unsigned long ioctl_op;
>> diff --git a/include/block/block-common.h b/include/block/block-common.h
>> index 78cddeeda5..35e00afe8e 100644
>> --- a/include/block/block-common.h
>> +++ b/include/block/block-common.h
>> @@ -56,8 +56,8 @@ typedef enum zone_op {
>>   } zone_op;
>>   
>>   typedef enum zone_model {
>> -    BLK_Z_HM,
>> -    BLK_Z_HA,
>> +    BLK_Z_HM = 0x1,
>> +    BLK_Z_HA = 0x2,
>>   } zone_model;
>>   
>>   typedef enum BlkZoneCondition {
> 
> This hunk is unrelated, please move it into a different patch.

This actually belong to patch 1 where this enum is introduced. No need for
a different patch.

> 
> Cheers,
> 
> Hannes


-- 
Damien Le Moal
Western Digital Research

