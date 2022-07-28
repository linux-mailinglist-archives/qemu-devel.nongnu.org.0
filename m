Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6858369E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 04:02:32 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGsr8-0006Ie-Pe
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 22:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2018c763a=damien.lemoal@opensource.wdc.com>)
 id 1oGsmo-0004Jk-VY
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:58:04 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:57773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2018c763a=damien.lemoal@opensource.wdc.com>)
 id 1oGsmj-0000Xw-UJ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658973477; x=1690509477;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EU48tXsxGCjHPU7HWepMe4ZxFBGfgBYJ1FcDZjm2hME=;
 b=TdI5G9A3WKCDpfO6JONPSoBdHq/g4xgkwfjJ3hXPQhmDVAYCDfDR5sL/
 hlSoXam4c3Hj9F7TziLExE3YNM+wZWk6lPtxTjKKQ9ld3498G4PtiMahn
 9nV0FCVANd9HVU/Hh0bUvo7ShqGL53RbmB4n0Q4ijKbxABqqt9mB4Cpk6
 D1LwEDI2Zx21Msa4iIDG7yUnOyczp0FQ9+mmkGbX6k0BZaEpMpteaBPBY
 uQ9NwtA8C5YpCfBTyqGFsd77mlxI6ttpd9Uan21qACqTWAG0nCCKunFTn
 Jbhjtsm2Tj3Hno9kO+kb7tH9k9ow2VSH9uXSnLdkuSbfgUCb6ULdtMqNO w==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654531200"; d="scan'208";a="207101304"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2022 09:57:46 +0800
IronPort-SDR: jHwSwb8Ett25oGz+YiVrFYaxBMKDATfp7HZN+lY6Dny/iKWfX1F7ulqIa5QOrFNJr/l44rk+5l
 a7XZk1BpdmaJhtKfCl4zpPy6g/eQ8pqh8mIT1XLgIQ5qnjBShVkGkjF1MndSBClPwgejCxXMCC
 el466C2mka0FIRAc52lwC6qk7tN/q45+HiI+/Cw2iYVfILxDMPxmcRfjFGbteHk2TXsM3bRSEI
 8MjBY5sRI/UCGWDuUuAXtUNztMb24e9G6wD2mItQAhN1BjT1Ttjz28C2Mp3gwPKhEIfdefgvRH
 NlyHiLHHS0ttgZK2jh1/HTkT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 18:18:59 -0700
IronPort-SDR: 2ssP+92YxuMwGvAkBW8lrEYD26NWgxo2/HVKRo2azZmtbRCUjSJPyFruyBx+PBCYbzh9VwFX6F
 0aH95OV/4q4umaa12vWA2yWnqKnNaRE8bpdAjatLc+BjYzdG267Kv4FoZm6Y38qTKe3OI4pn77
 okNp9/VsSygI1qr72/NRY7QKeln9GMhM8gxG+9ILOGvvn+nBnjwOyFVQ+Q66xjzGCoBrM+XwLa
 xAPatlXiYPZI8X+rKwSM/7Jd2elUZgDt1A9AjW8hiGRwWMayE3QsAKJmazC8NMyP7WBdWufBbH
 JRw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 18:57:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LtYgv2jKkz1Rwry
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 18:57:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1658973466; x=1661565467; bh=EU48tXsxGCjHPU7HWepMe4ZxFBGfgBYJ1Fc
 DZjm2hME=; b=LUt5j30STtEZhB98j868WHC/j9J/vTaCoD431tYPTaDXulMZAiN
 XrKvUqfUO6CKoQ08HIuuZCpPo3p6UXIeN+lCVrHSlRO8BeewWT72qyOoIM+x90ox
 qr1wvt5Pj9HuHyDkEwKBEjQ+0uzjLRb0M24p+1cXOlEmocZGc3oTIGY6QIOYTS20
 H7+cNds8HlrqTKHLj8NxkT0jfor4fwT6i6dzWiitlEFN++y24C/Ro2Yb2D7YGrSP
 PRw1az4qEn9yfupdS0RGG3HNzIm88hyaV/cMpy4tgE+k9vBbKzl5xTSIpiXhqbFy
 uqNC4mttfoU7AtQnv0pSP34BKy+R0av+JOg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Tcrg2hy87SJ6 for <qemu-devel@nongnu.org>;
 Wed, 27 Jul 2022 18:57:46 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LtYgr0CG8z1RtVk;
 Wed, 27 Jul 2022 18:57:43 -0700 (PDT)
Message-ID: <fa7de750-8def-c532-8c86-64c7505608e0@opensource.wdc.com>
Date: Thu, 28 Jul 2022 10:57:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 2/9] qemu-io: add zoned block device operations.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-3-faithilikerun@gmail.com>
 <CAJSP0QXpzgXjNuzdEAQ9hA4JU_gqO2mHAEVfesoZsjG6eDRz=g@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAJSP0QXpzgXjNuzdEAQ9hA4JU_gqO2mHAEVfesoZsjG6eDRz=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2018c763a=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

On 7/27/22 23:13, Stefan Hajnoczi wrote:
> On Mon, 11 Jul 2022 at 22:17, Sam Li <faithilikerun@gmail.com> wrote:
>> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
>> +                        int64_t *nr_zones,
>> +                        BlockZoneDescriptor *zones)
>> +{
>> +    BlockDriver *drv = bs->drv;
>> +    CoroutineIOCompletion co = {
>> +            .coroutine = qemu_coroutine_self(),
>> +    };
>> +    IO_CODE();
>> +
>> +    bdrv_inc_in_flight(bs);
>> +    if (!drv || (!drv->bdrv_co_zone_report)) {

You can drop the inner parenthesis for "(!drv->bdrv_co_zone_report)".

>> +        co.ret = -ENOTSUP;
>> +        goto out;
>> +    }
>> +
>> +    if (drv->bdrv_co_zone_report) {
> 
> At this point we know drv->bdrv_co_zone_report is non-NULL because it
> has been checked already. The if statement can be dropped.
> 
>> +        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
>> +    } else {
>> +        co.ret = -ENOTSUP;
> 
> This case is already handled by if (... ||
> (!drv->bdrv_co_zone_report)) above. The else body can be dropped.
> 
>> +        goto out;
>> +        qemu_coroutine_yield();
>> +    }
>> +
>> +out:
>> +    bdrv_dec_in_flight(bs);
>> +    return co.ret;
>> +}
>> +
>> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> 
> Please follow QEMU coding style and typedef BdrvZoneOp instead of
> writing out enum zone_op.
> 
>> +        int64_t offset, int64_t len)
>> +{
>> +    BlockDriver *drv = bs->drv;
>> +    CoroutineIOCompletion co = {
>> +            .coroutine = qemu_coroutine_self(),
>> +    };
>> +    IO_CODE();
>> +
>> +    bdrv_inc_in_flight(bs);
>> +    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
>> +        co.ret = -ENOTSUP;
>> +        goto out;
>> +    }
>> +
>> +    if (drv->bdrv_co_zone_mgmt) {
>> +        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
>> +    } else {
>> +        co.ret = -ENOTSUP;
>> +        goto out;
>> +        qemu_coroutine_yield();
>> +    }
> 
> Same comments here.
> 
>> +
>> +out:
>> +    bdrv_dec_in_flight(bs);
>> +    return co.ret;
>> +}
>> +
>>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>>  {
>>      IO_CODE();
>> diff --git a/include/block/block-io.h b/include/block/block-io.h
>> index 053a27141a..a0ae140452 100644
>> --- a/include/block/block-io.h
>> +++ b/include/block/block-io.h
>> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>>  /* Ensure contents are flushed to disk.  */
>>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>>
>> +/* Report zone information of zone block device. */
>> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
>> +                                     int64_t *nr_zones,
>> +                                     BlockZoneDescriptor *zones);
>> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
>> +                                   int64_t offset, int64_t len);
>> +
>>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
>> @@ -289,6 +296,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>>  int generated_co_wrapper
>>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>>
>> +int generated_co_wrapper
>> +blk_zone_report(BlockBackend *blk, int64_t offset, int64_t *nr_zones,
>> +                BlockZoneDescriptor *zones);
>> +int generated_co_wrapper
>> +blk_zone_mgmt(BlockBackend *blk, enum zone_op op, int64_t offset, int64_t len);
>> +
>>  /**
>>   * bdrv_parent_drained_begin_single:
>>   *
>> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
>> index 2f0d8ac25a..a88fa322d2 100644
>> --- a/qemu-io-cmds.c
>> +++ b/qemu-io-cmds.c
>> @@ -1706,6 +1706,144 @@ static const cmdinfo_t flush_cmd = {
>>      .oneline    = "flush all in-core file state to disk",
>>  };
>>
>> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
>> +{
>> +    int ret;
>> +    int64_t offset, nr_zones;
>> +
>> +    ++optind;
>> +    offset = cvtnum(argv[optind]);
>> +    ++optind;
>> +    nr_zones = cvtnum(argv[optind]);
>> +
>> +    g_autofree BlockZoneDescriptor *zones = NULL;
>> +    zones = g_new(BlockZoneDescriptor, nr_zones);
>> +    ret = blk_zone_report(blk, offset, &nr_zones, zones);
>> +    if (ret < 0) {
>> +        printf("zone report failed: %s\n", strerror(-ret));
>> +    } else {
>> +        for (int i = 0; i < nr_zones; ++i) {
>> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
>> +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
>> +                   "zcond:%u, [type: %u]\n",
>> +                   zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
>> +                   zones[i].cond, zones[i].type);
>> +        }
>> +    }
>> +    return ret;
>> +}
>> +
>> +static const cmdinfo_t zone_report_cmd = {
>> +        .name = "zone_report",
>> +        .altname = "zp",
>> +        .cfunc = zone_report_f,
>> +        .argmin = 2,
>> +        .argmax = 2,
>> +        .args = "offset number",
>> +        .oneline = "report zone information",
>> +};
>> +
>> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
>> +{
>> +    int ret;
>> +    int64_t offset, len;
>> +    ++optind;
>> +    offset = cvtnum(argv[optind]);
>> +    ++optind;
>> +    len = cvtnum(argv[optind]);
>> +    ret = blk_zone_mgmt(blk, zone_open, offset, len);
> 
> Please name enum constants in all caps: BDRV_ZONE_OPEN or BDRV_ZO_OPEN.


-- 
Damien Le Moal
Western Digital Research

