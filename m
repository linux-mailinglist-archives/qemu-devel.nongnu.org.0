Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF255158B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:14:04 +0200 (CEST)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EPz-0003QI-Pz
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1631aaa33=damien.lemoal@opensource.wdc.com>)
 id 1o3ENw-0002a3-0K
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:11:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:58725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1631aaa33=damien.lemoal@opensource.wdc.com>)
 id 1o3ENr-0006fU-QO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655719911; x=1687255911;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Sdwv1mHf4jkuPJ4X9FiqUaGlqlY3tEowdgtfLo7W/AU=;
 b=mnodbeqDsj+gBMNQiFg4/9SPbJyZp8EwjPEPEI4BFqM9454TmI95umd9
 LGZH4lXuPZzc6ZjXeWK0jbd/sPxsj+9IJKInZRYRlKELsGV3Nig+ZQBxm
 eBD5jjgfMwe2XbZLr61pSyrf/6QJnXSVq5Y5aMBmXut0G+0W//6akV0B/
 8oSEI3gZ1xNXc8SFzcEx7XNLxU+Qsru6X8Yi5SJdDaYat4wnUU5ZlxAv+
 DPTw2RgzZHlIP2wVjTg2NH+DHrEAVTxzMPQVngOT8mD+tdMATSJ/j2vhs
 FFRCeZu1VcftuyFolgifbSzYOMoARfjgEUtrrf9qSTB5HU3Z1ayn7m+h/ w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; d="scan'208";a="307931642"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 18:11:46 +0800
IronPort-SDR: 2OjXFMfCDIfTNw/UXX/CjlCGG3vIN2HfQtmS4RCOSZAyChh7GTJ6k4K3erAVSc7FcUE/bkSz/m
 dPYaTui9Bh7klmVyzxT232KbZQr65ldb9jOvktkKjxM25LBkBXzmc9mKBnNS9UwB85gdHAK3zH
 pP8vwC5f2MteXzqonbIzMqQhiaei3QKioEJnvs0aXx5iSQE9TByUoL8HUt1S7YDK33b4vNpYVt
 hRYA9RckCR8kHecIrzpQ5A9Ss0E2B5UXyvXdfXIpIpKng2960AZdO69yRpApGuIpWdvHMrdYuq
 VUDitZWc69i9Om8TTMeJYXUZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 02:34:18 -0700
IronPort-SDR: 99xs8Dy7Xcs8TKLvj9bEGFE7e5iAqqAydBjKrJrr7qBeB7FjZUbopqWG6d+FZEnNr8LuI7b/C3
 e7Ovlz6jKfm+tOcWNXO1nTY6SA8tRPO98ACugs9MZvZipnQSL774QG4mrY66RVc2Op88BZdH6w
 jieTM1vfK9AE5RH6PWV4/2FL4WktCxvctiK3RDpKtDfKBaF7wksEaxocfhSWQE3vQyqZm44vOB
 VlaDg2WIEbTx7AHagA1iIn3Thuj5TefN8KwHLWoY295Gtcu7tlDksM2pgsHkJpFfM+idMmMr4F
 cpo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 03:11:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRQRQ4vBZz1SVp1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 03:11:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655719904; x=1658311905; bh=Sdwv1mHf4jkuPJ4X9FiqUaGlqlY3tEowdgt
 fLo7W/AU=; b=DQ2EGL9v74t5651eqdzdJp4FjUwih7HKhUa+CjhWWTnwb6hL2yX
 aQG7pgKWOc8eIGaoElGFiqRNjRbfVV6e0i6MaH0TtwtLwMSw/oIp/g+d0QVBSAkY
 L1ulBIW+7ybut8tSjVh+vTwXbe7tX9gIF81E9TicXK811TbGc7LQiufDHOHGHXsl
 JAtz0O2wC0/evdtvx8hKl6PdvuRBgivkmIp7UZ7NQ77vMNYoNpTsDhOLstIbUdFF
 ov1V2hAmH59SLtdjSxxon+L80apv3N+VfwrM4ixltggeGIwpe4INMwdYg8eaAWmy
 al3rCO59ismhkAv3YAEbMl77wKYbztuGlPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id koM3hXqCoH9g for <qemu-devel@nongnu.org>;
 Mon, 20 Jun 2022 03:11:44 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRQRL2wXSz1Rvlc;
 Mon, 20 Jun 2022 03:11:42 -0700 (PDT)
Message-ID: <61cbccee-c865-1765-bf62-b74da130d62f@opensource.wdc.com>
Date: Mon, 20 Jun 2022 19:11:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux ZoneBlockDevice
 ioctls.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>, hare@suse.de
References: <20220620033611.82166-1-faithilikerun@gmail.com>
 <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1631aaa33=damien.lemoal@opensource.wdc.com;
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

On 6/20/22 16:55, Stefan Hajnoczi wrote:
> On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:
> 
> Hi Sam,
> Is this version 2 of "[RFC v1] Add support for zoned device"? Please
> keep the email subject line the same (except for "v2", "v3", etc) so
> that it's clear which patch series this new version replaces.
> 
>> Fix some mistakes before. It can report a range of zones now.
> 
> This looks like the description of what changed compared to v1. Please
> put the changelog below "---" in the future. When patch emails are
> merged by git-am(1) it keeps the text above "---" and discards the text
> below "---". The changelog is usually no longer useful once the patches
> are merged, so it should be located below the "---" line.
> 
> The text above the "---" is the commit description (an explanation of
> why this commit is necessary). In this case the commit description
> should explain that this patch adds .bdrv_co_zone_report() and
> .bdrv_co_zone_mgmt() to BlockDriver so that zoned block devices can be
> supported.
> 
>>
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> ---
>>  block/block-backend.c             |  22 ++++
>>  block/coroutines.h                |   5 +
>>  block/file-posix.c                | 182 ++++++++++++++++++++++++++++++
>>  block/io.c                        |  23 ++++
>>  include/block/block-common.h      |  43 ++++++-
>>  include/block/block-io.h          |  13 +++
>>  include/block/block_int-common.h  |  20 ++++
>>  qemu-io-cmds.c                    | 118 +++++++++++++++++++
>>  tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
>>  9 files changed, 477 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/qemu-iotests/tests/zoned.sh
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index e0e1aff4b1..20248e4a35 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
>>      int ret;
>>  } BlockBackendAIOCB;
>>  
>> +
>> +
> 
> Please avoid whitespace changes in code that is otherwise untouched by
> your patch. Code changes can cause merge conflicts and they make it
> harder to use git-annotate(1), so only changes that are necessary should
> be included in a patch.
> 
>>  static const AIOCBInfo block_backend_aiocb_info = {
>>      .get_aio_context = blk_aiocb_get_aio_context,
>>      .aiocb_size = sizeof(BlockBackendAIOCB),
>> @@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
>>      return ret;
>>  }
>>  
> 
> Please add a documentation comment for blk_co_zone_report() that
> explains how to use the functions and the purpose of the arguments. For
> example, does offset have to be the first byte in a zone or can it be
> any byte offset? What are the alignment requirements of offset and len?
> Why is nr_zones a pointer?
> 
>> +int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t len,
> 
> Functions that run in coroutine context must be labeled with
> coroutine_fn:
> 
>     int coroutine_fn blk_co_zone_report(...)
> 
> This tells humans and tools that the function can only be called from a
> coroutine. There is a blog post about coroutines in QEMU here:
> https://blog.vmsplice.net/2014/01/coroutines-in-qemu-basics.html
> 
>> +                       int64_t *nr_zones,
>> +                       struct BlockZoneDescriptor *zones)
> 
> QEMU coding style uses typedefs when defining structs, so "struct
> BlockZoneDescriptor *zones" should be written as "BlockZoneDescriptor
> *zones".
> 
>> +{
>> +    int ret;
> 
> This function is called from the I/O code path, please mark it with:
> 
>   IO_CODE();
> 
> From include/block/block-io.h:
> 
>   * I/O API functions. These functions are thread-safe, and therefore
>   * can run in any thread as long as the thread has called
>   * aio_context_acquire/release().
>   *
>   * These functions can only call functions from I/O and Common categories,
>   * but can be invoked by GS, "I/O or GS" and I/O APIs.
>   *
>   * All functions in this category must use the macro
>   * IO_CODE();
>   * to catch when they are accidentally called by the wrong API.
> 
>> +    ret = bdrv_co_zone_report(blk->root->bs, offset, len, nr_zones, zones);
> 
> Please add blk_inc_in_flight(blk) and blk_dec_in_flight(blk) around this
> function call to ensure that zone report requests finish before I/O is
> drained (see bdrv_drained_begin()). This is necessary so that it's
> possible to wait for I/O requests, including zone report, to complete.
> 
> Similar to blk_co_do_preadv() we need blk_wait_while_drained(blk),
> blk_check_byte_request(), and bdrv_inc_in_flight(bs) before calling
> bdrv_co_zone_report(). bdrv_dec_in_flight(bs) needs to be called after
> bdrv_co_zone_report() returns.
> 
>> +    return ret;
>> +}
>> +
>> +int blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
>> +        int64_t offset, int64_t len)
>> +{
>> +    int ret;
>> +    ret = bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
>> +
>> +    return ret;
>> +}
> 
> The same applies to this function.
> 
>> +
>> +
>>  void blk_drain(BlockBackend *blk)
>>  {
>>      BlockDriverState *bs = blk_bs(blk);
>> @@ -2634,3 +2655,4 @@ int blk_make_empty(BlockBackend *blk, Error **errp)
>>  
>>      return bdrv_make_empty(blk->root, errp);
>>  }
>> +
> 
> Unrelated whitespace change.
> 
>> diff --git a/block/coroutines.h b/block/coroutines.h
>> index 830ecaa733..247326255f 100644
>> --- a/block/coroutines.h
>> +++ b/block/coroutines.h
>> @@ -80,6 +80,11 @@ int coroutine_fn
>>  blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
>>  
>>  int coroutine_fn blk_co_do_flush(BlockBackend *blk);
>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
>> +                                    int64_t len, int64_t *nr_zones,
>> +                                    struct BlockZoneDescriptor *zones);
>> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
>> +        int64_t offset, int64_t len);
>>  
>>  
>>  /*
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 48cd096624..71fd21f8ba 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -178,6 +178,137 @@ typedef struct BDRVRawReopenState {
>>      bool check_cache_dropped;
>>  } BDRVRawReopenState;
>>  
>> +/*
>> + * parse_zone - Fill a zone descriptor
>> + */
>> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
>> +        struct blk_zone *blkz) {
>> +    zone->start = blkz->start << BDRV_SECTOR_BITS;
>> +    zone->length = blkz->len << BDRV_SECTOR_BITS;
>> +    zone->cap = blkz->capacity << BDRV_SECTOR_BITS;
>> +    zone->wp = blkz->wp << BDRV_SECTOR_BITS;
>> +    zone->type = blkz->type;
>> +    zone->cond = blkz->type;
> 
> Should this be "zone->cond = blkz->cond"?
> 
>> +}
>> +
>> +/**
>> + * zone report - Get a zone block device's information in the
>> + * form of an array of zone descriptors.
>> + *
>> + * @param bs: passing zone block device file descriptor
>> + * @param zones: Space to hold zone information on reply
>> + * @param offset: the location in the zone block device
>> + * @return 0 on success, -1 on failure
>> + */
>> +static int raw_co_zone_report(BlockDriverState *bs, int64_t offset, int64_t len,
> 
> coroutine_fn
> 
>> +                              int64_t *nr_zones,
>> +                              struct BlockZoneDescriptor *zones) {
>> +    BDRVRawState *s = bs->opaque;
>> +    struct blk_zone_report *rep;
>> +    struct BlockZoneDescriptor bzd;
>> +    struct blk_zone *blkz;
>> +    int64_t zone_size_mask, end, rep_size, nrz;
>> +    int ret, n = 0, i = 0;
>> +
>> +    printf("%s\n", "start to report zone");
> 
> This looks like debug output. QEMU has a tracing system that you can
> use. See docs/devel/tracing.rst.
> 
>> +    nrz = *nr_zones;
>> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
>> +    rep = (struct blk_zone_report *)malloc(rep_size);
> 
> Please use g_autofree and g_new(). QEMU avoids direct use of malloc(3)/free(3).
> 
>> +    if (!rep) {
>> +        return -1;
>> +    }
>> +
>> +    zone_size_mask = zone_start_sector - 1;
>> +    /* align up */
>> +    end = ((offset + len + zone_size_mask) & (~zone_size_mask))
>> +            >> BDRV_SECTOR_BITS;
> 
> More readable:
> 
>   end = DIV_ROUND_UP(offset + len, BDRV_SECTOR_SIZE);
> 
>> +
>> +    blkz = (struct blk_zone *)(rep + 1);
>> +    while (offset < end) {
>> +        memset(rep, 0, rep_size);
>> +        rep->sector = offset;
>> +        rep->nr_zones = nrz;
>> +
>> +        ret = ioctl(s->fd, BLKREPORTZONE, rep);
> 
> Can this ioctl() block? It seems likely. If yes, then the call needs to
> be made from the thread pool to avoid blocking the current thread. See
> raw_thread_pool_submit().
> 
>> +        if (ret != 0) {
>> +            ret = -errno;
>> +            error_report("%d: ioctl BLKREPORTZONE at %ld failed %d",
>> +                         s->fd, offset, errno);
>> +            free(rep);
>> +            return ret;
>> +        }
>> +
>> +        if (!rep->nr_zones) {
>> +            break;
>> +        }
>> +
>> +        for (i = 0; i < rep->nr_zones; i++) {
>> +            parse_zone(&bzd, &blkz[i]);
>> +            if (zones) {
>> +                memcpy(&zones[n], &bzd, sizeof(bzd));
> 
> n is never incremented so this always overwrites the first element.
> 
>> +            }
>> +        }
>> +
>> +        offset = blkz[i].start + blkz[i].len;
>> +    }
>> +
> 
> Does this function need to update *nr_zones = n before returning? How does
> the caller know how many zones were returned?
> 
>> +    return ret;
>> +}
>> +
>> +/**
>> + * zone management operations - Execute an operation on a zone
>> + */
>> +static int raw_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
>> +        int64_t offset, int64_t len) {
>> +    BDRVRawState *s = bs->opaque;
>> +    struct blk_zone_range range;
>> +    const char *ioctl_name;
>> +    uint64_t ioctl_op;
> 
> ioctl()'s second argument is unsigned long request. Please use unsigned
> long to keep the types consistent.
> 
>> +    int64_t zone_size_mask, end;
>> +    int ret;
>> +
>> +    zone_size_mask = zone_start_sector - 1;
>> +    /* align up */
>> +    end = ((offset + len + zone_size_mask) & (~zone_size_mask))
>> +            >> BDRV_SECTOR_BITS;
>> +    offset = (offset & (~zone_size_mask)) >> BDRV_SECTOR_BITS; /* align down */
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
>> +        errno = -EINVAL;
>> +        return -1;
>> +    }
>> +
>> +    /* Execute the operation */
>> +    range.sector = offset;
>> +    range.nr_sectors = end - offset;
>> +    ret = ioctl(s->fd, ioctl_op, &range);
>> +    if (ret != 0) {
>> +        error_report("ioctl %s failed %d",
>> +                         ioctl_name, errno);
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static int fd_open(BlockDriverState *bs)
>>  {
>>      BDRVRawState *s = bs->opaque;
>> @@ -3324,6 +3455,9 @@ BlockDriver bdrv_file = {
>>      .bdrv_abort_perm_update = raw_abort_perm_update,
>>      .create_opts = &raw_create_opts,
>>      .mutable_opts = mutable_opts,
>> +
>> +    .bdrv_co_zone_report = raw_co_zone_report,
>> +    .bdrv_co_zone_mgmt = raw_co_zone_mgmt,
>>  };
>>  
>>  /***********************************************/
>> @@ -3703,6 +3837,53 @@ static BlockDriver bdrv_host_device = {
>>  #endif
>>  };
>>  
>> +static BlockDriver bdrv_zoned_host_device = {
>> +        .format_name = "zoned_host_device",
>> +        .protocol_name = "zoned_host_device",
>> +        .instance_size = sizeof(BDRVRawState),
>> +        .bdrv_needs_filename = true,
>> +        .bdrv_probe_device  = hdev_probe_device,
>> +        .bdrv_parse_filename = hdev_parse_filename,
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
>> +
>>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>>  static void cdrom_parse_filename(const char *filename, QDict *options,
>>                                   Error **errp)
>> @@ -3964,6 +4145,7 @@ static void bdrv_file_init(void)
>>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>>      bdrv_register(&bdrv_host_device);
>>  #ifdef __linux__
>> +    bdrv_register(&bdrv_zoned_host_device);
>>      bdrv_register(&bdrv_host_cdrom);
>>  #endif
>>  #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
>> diff --git a/block/io.c b/block/io.c
>> index 789e6373d5..3e8bb83cc3 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -3258,6 +3258,29 @@ out:
>>      return co.ret;
>>  }
>>  
>> +int bdrv_co_zone_report(BlockDriverState *bs,
>> +                        int64_t offset, int64_t len, int64_t *nr_zones,
>> +                        struct BlockZoneDescriptor *zones)
>> +{
>> +    int ret = 0;
>> +    if (!bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones)) {
>> +        return -ENOTSUP;
>> +    }
> 
> This returns -ENOTSUP any time ->bdrv_co_zone_report() returns 0. Should
> this be:
> 
>   if (!bs->drv->bdrv_co_zone_report) {
>       return -ENOTSUP;
>   }
> 
>   return bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zones);
> 
> ?
> 
>> +
>> +    return ret;
>> +}
>> +
>> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
>> +        int64_t offset, int64_t len)
>> +{
>> +    int ret = 0;
>> +    if (!bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len)) {
>> +        return -ENOTSUP;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>>  {
>>      IO_CODE();
>> diff --git a/include/block/block-common.h b/include/block/block-common.h
>> index fdb7306e78..24c468d8ad 100644
>> --- a/include/block/block-common.h
>> +++ b/include/block/block-common.h
>> @@ -23,7 +23,7 @@
>>   */
>>  #ifndef BLOCK_COMMON_H
>>  #define BLOCK_COMMON_H
>> -
>> +#include <linux/blkzoned.h>
> 
> Linux-specific code must be #ifdef __linux__ to avoid compilation errors
> on non-Linux hosts.

This include should not be here anyway. It should be in block/file-posix.c
I think, and...

> 
>>  #include "block/aio.h"
>>  #include "block/aio-wait.h"
>>  #include "qemu/iov.h"
>> @@ -48,6 +48,47 @@
>>  typedef struct BlockDriver BlockDriver;
>>  typedef struct BdrvChild BdrvChild;
>>  typedef struct BdrvChildClass BdrvChildClass;
>> +enum zone_type {
> 
> Please use "typedef enum { ... } BdrvZoneType" so that enums follow
> QEMU's coding style.
> 
>> +    BLK_ZT_CONV = BLK_ZONE_TYPE_CONVENTIONAL,
>> +    BLK_ZT_SWR = BLK_ZONE_TYPE_SEQWRITE_REQ,
>> +    BLK_ZT_SWP = BLK_ZONE_TYPE_SEQWRITE_PREF,

These should use hard values instead of the macro defined in
linux/blkzoned.h so that the interface is truly independent of linux
kernel API.

>> +};
>> +
>> +enum zone_cond {
>> +    BLK_ZS_NOT_WP = BLK_ZONE_COND_NOT_WP,
>> +    BLK_ZS_EMPTY = BLK_ZONE_COND_EMPTY,
>> +    BLK_ZS_IOPEN = BLK_ZONE_COND_IMP_OPEN,
>> +    BLK_ZS_EOPEN = BLK_ZONE_COND_EXP_OPEN,
>> +    BLK_ZS_CLOSED = BLK_ZONE_COND_CLOSED,
>> +    BLK_ZS_RDONLY = BLK_ZONE_COND_READONLY,
>> +    BLK_ZS_FULL = BLK_ZONE_COND_FULL,
>> +    BLK_ZS_OFFLINE = BLK_ZONE_COND_OFFLINE,
>> +};
> 
> This 1:1 correspondence with Linux constants could make the code a
> little harder to port.
> 
> Maybe QEMU's block layer should define its own numeric constants so the
> code doesn't rely on operating system-specific headers.
> block/file-posix.c #ifdef __linux__ code can be responsible for
> converting Linux-specific constants to QEMU constants (and the 1:1
> mapping can be used there).

Yes !

> 
>> +
>> +enum zone_op {
>> +    zone_open,
>> +    zone_close,
>> +    zone_finish,
>> +    zone_reset,
>> +};
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
>> +    enum zone_type type;
>> +    enum zone_cond cond;
>> +} BlockZoneDescriptor;
>> +
>> +enum zone_model {
>> +    BLK_Z_HM,
>> +    BLK_Z_HA,
>> +};
>>  
>>  typedef struct BlockDriverInfo {
>>      /* in bytes, 0 if irrelevant */
>> diff --git a/include/block/block-io.h b/include/block/block-io.h
>> index 62c84f0519..deb8902684 100644
>> --- a/include/block/block-io.h
>> +++ b/include/block/block-io.h
>> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>>  /* Ensure contents are flushed to disk.  */
>>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>>  
>> +/* Report zone information of zone block device. */
>> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
>> +                                     int64_t len, int64_t *nr_zones,
>> +                                     struct BlockZoneDescriptor *zones);
>> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
>> +        int64_t offset, int64_t len);
>> +
>>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
>> @@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>>  int generated_co_wrapper
>>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>>  
>> +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t offset,
>> +                                         int64_t len, int64_t *nr_zones,
>> +                                         struct BlockZoneDescriptor *zones);
>> +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op op,
>> +        int64_t offset, int64_t len);
>> +
>>  /**
>>   * bdrv_parent_drained_begin_single:
>>   *
>> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
>> index 8947abab76..4d0180a7da 100644
>> --- a/include/block/block_int-common.h
>> +++ b/include/block/block_int-common.h
>> @@ -63,6 +63,7 @@
>>  #define BLOCK_OPT_EXTL2             "extended_l2"
>>  
>>  #define BLOCK_PROBE_BUF_SIZE        512
>> +#define zone_start_sector           512
>>  
>>  enum BdrvTrackedRequestType {
>>      BDRV_TRACKED_READ,
>> @@ -94,6 +95,19 @@ typedef struct BdrvTrackedRequest {
>>      struct BdrvTrackedRequest *waiting_for;
>>  } BdrvTrackedRequest;
>>  
>> +/**
>> + * Zone device information data structure.
>> + * Provide information on a device.
>> + */
>> +typedef struct zbd_dev {
>> +    enum zone_model model;
>> +    uint32_t block_size;
> 
> How does this relate to QEMU's BlockLimits?
> 
>> +    uint32_t write_granularity;
> 
> Same. Maybe this belongs in BlockLimits?
> 
>> +    uint32_t nr_zones;
> 
> Should this really be limited to 32-bit? For example, take 256 MB zones,
> then the max nr_zones * 256 MB is much smaller than a uint64_t capacity
> value. It seems safer to make this 64-bit, but maybe Dmitry, Hannes, or
> Damien can tell us what to do here.

u32 is fine. We are nowhere near 4G zones :)
The max out there today is 20TB SMR drive with 128MB zones. About 150,000
zones. Nowhere near 4G limit. Linux kernel also uses unsigned int for
number of zones everywhere.

> 
>> +    struct BlockZoneDescriptor *zones; /* array of zones */
> 
> When is this used?

This will be needed when zone append implementation comes. But not there
yet :) A simpler form of the zone descriptor will likely be better anyway
to save memory.


-- 
Damien Le Moal
Western Digital Research

