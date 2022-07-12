Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD595713A1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:56:23 +0200 (CEST)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAkn-0008Gr-RQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAZT-0000yC-5N
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:44:39 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:48488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAZD-0000IX-AJ
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657611862; x=1689147862;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/9izS6M/aBqPyrNEFYiNgcPC25uJmZDfGgi2XRkbFcs=;
 b=POgRessYhAjA6TCSt7Ou/ZYKrKxri8+sfXSjFiZIGXlM9hbBIvZOx2Dc
 Dk5mnR7gSIVU4dr5sl5YIl3Xyfi2i/ZUEq7lG1w48svntmOAVp+ZvfOlO
 yaHj6/cxTk9tfbj3hX8njBz/UNVLNF2ZcgE+jH3AtiYV84jXGsg1hF2a+
 TmsCptOc2LdWXukV87Flz8/TZrwAtRCu+gyIFdljXZ3yQgAz9eGatlz4Q
 f2njQ1hngZwD8WHV82MNm4IKGkbM7OiWMajHYOZMmQdXhDGaXEpMki9do
 c2/FeQtg4wT39yHUE/SeBJD08wx2S9VVFtXHlTEcUS6hkFMPfbjKga1bc Q==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650902400"; d="scan'208";a="205465658"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2022 15:44:17 +0800
IronPort-SDR: 9zO+CtiVCzib/klV44F+JosZDxXaNgAckJwNpVexTa5/qNmTuMWz/OTWYIMjCpupoJtTYFIMEj
 mJhTuP5+InLT6MaXhXuD04zMpyN7dghLeYNTlFWPgT7BEAUz8XHFuTYaJtOhovbDX9g8YkpneS
 oiY0YsQ8ZHQ3T7ivlFvtevZFEKrlgdfcfDAvfjMCMwedPe3w94JzGZzdyYK8tvjiP5GrNJsXIC
 JAdvBQtmicugA2YSvO5mBG6ifWjsneLFiQUgQ9kCjBbNKdcVojpf5k9JZuWvxDAgCLiKFLbN4d
 hG0R9M/zkhpRxirRPx6i1BWh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 00:05:54 -0700
IronPort-SDR: kCkXk/7pFsNGD0QlBd72REYrS1I0kAu77DQmgUr0CNI9zC/oD3T0msb/FusqPid4jpu50B5s5/
 C6rFtHOhmO423mu4DtHwcuGF+Xwlw01FQekh/g8zYUOmZPXG2Q2Hhw+oPkxpWpfk8GXon+Zie3
 S1Tu76VCSHfPIGHYZwGPVqS0dy8t24NetBtyv0uVhNNJDoIIxkKGtguoC56eo69KY/Znu0TgaC
 29BAXoKNscgm2+s5NIpCZLMejTkCvilnzlf6iYySJCdiekY1F1NEbrhPMzQ9wYX705jnpmHCQ2
 rqQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 00:44:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lht751n19z1RwqM
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:44:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657611855; x=1660203856; bh=/9izS6M/aBqPyrNEFYiNgcPC25uJmZDfGgi
 2XRkbFcs=; b=JMXJW0FCkemXJ6vdZGsm/2uuJ9Xkr65ikNHyrNNgwoQEU+fUhDW
 IWwMvnbpKqegYvOqTeINJYImsABtzKDwif5UESadHB/YgJlkigiihMyPpe/ids48
 cSm8cHKeq5v7PGIUgRRwxdLK2SRKRR4fYBncHao8vIDr0R0BEIGudW2JIsspkp5W
 szQKo8lFM1zIKbqdzeq7qaIFaTEyi1GSPj4hRFeWsj5WLKP1R/wSpzqYEXD+lA/v
 emtm22LSFYpYMkoF03drKS35CVfVnyMFE2iRpKh6uxmeQf6JiOW+pTDUwj0eurrG
 atLiaYZBcsEKBhcCs8QPwEbi0626I6HLJNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kDwTnHmqnCXa for <qemu-devel@nongnu.org>;
 Tue, 12 Jul 2022 00:44:15 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lht716Wwnz1RtVk;
 Tue, 12 Jul 2022 00:44:13 -0700 (PDT)
Message-ID: <c716bf00-01bc-b34d-2137-7c18f2000be2@opensource.wdc.com>
Date: Tue, 12 Jul 2022 16:44:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 2/9] qemu-io: add zoned block device operations.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, hare@suse.de
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-3-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220712021345.8530-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=18524360e=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 7/12/22 11:13, Sam Li wrote:
> Add zoned storage commands of the device: zone_open(zo), zone_close(zc),
> zone_reset(zs), zone_report(zp), zone_finish(zf).
> 
> For example, it can be called by:
> ./build/qemu-io --image-opts driver=zoned_host_device, filename=/dev/nullb0
> -c "zone_report 0 0 1"

I would move this patch and also patch 5 last in the series, so that the
tests are added once all the code is in place.

> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/io.c               |  57 ++++++++++++++++
>  include/block/block-io.h |  13 ++++
>  qemu-io-cmds.c           | 143 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 213 insertions(+)
> 
> diff --git a/block/io.c b/block/io.c
> index 1e9bf09a49..a760be0131 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3243,6 +3243,63 @@ out:
>      return co.ret;
>  }
>  
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        int64_t *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_report)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_report) {
> +        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_mgmt) {
> +        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 053a27141a..a0ae140452 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>  /* Ensure contents are flushed to disk.  */
>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>  
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                     int64_t *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
> +                                   int64_t offset, int64_t len);
> +
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> @@ -289,6 +296,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>  int generated_co_wrapper
>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>  
> +int generated_co_wrapper
> +blk_zone_report(BlockBackend *blk, int64_t offset, int64_t *nr_zones,
> +                BlockZoneDescriptor *zones);
> +int generated_co_wrapper
> +blk_zone_mgmt(BlockBackend *blk, enum zone_op op, int64_t offset, int64_t len);
> +
>  /**
>   * bdrv_parent_drained_begin_single:
>   *
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 2f0d8ac25a..a88fa322d2 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1706,6 +1706,144 @@ static const cmdinfo_t flush_cmd = {
>      .oneline    = "flush all in-core file state to disk",
>  };
>  
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, nr_zones;
> +
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones = cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones = NULL;
> +    zones = g_new(BlockZoneDescriptor, nr_zones);
> +    ret = blk_zone_report(blk, offset, &nr_zones, zones);
> +    if (ret < 0) {
> +        printf("zone report failed: %s\n", strerror(-ret));
> +    } else {
> +        for (int i = 0; i < nr_zones; ++i) {
> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
> +                   "zcond:%u, [type: %u]\n",
> +                   zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
> +                   zones[i].cond, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +        .name = "zone_report",
> +        .altname = "zp",
> +        .cfunc = zone_report_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset number",
> +        .oneline = "report zone information",
> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, zone_open, offset, len);
> +    if (ret < 0) {
> +        printf("zone open failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_open_cmd = {
> +        .name = "zone_open",
> +        .altname = "zo",
> +        .cfunc = zone_open_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "explicit open a range of zones in zone block device",
> +};
> +
> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, zone_close, offset, len);
> +    if (ret < 0) {
> +        printf("zone close failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_close_cmd = {
> +        .name = "zone_close",
> +        .altname = "zc",
> +        .cfunc = zone_close_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "close a range of zones in zone block device",
> +};
> +
> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, zone_finish, offset, len);
> +    if (ret < 0) {
> +        printf("zone finish failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_finish_cmd = {
> +        .name = "zone_finish",
> +        .altname = "zf",
> +        .cfunc = zone_finish_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "finish a range of zones in zone block device",
> +};
> +
> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, zone_reset, offset, len);
> +    if (ret < 0) {
> +        printf("zone reset failed: %s\n", strerror(-ret));
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_reset_cmd = {
> +        .name = "zone_reset",
> +        .altname = "zrs",
> +        .cfunc = zone_reset_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset len",
> +        .oneline = "reset a zone write pointer in zone block device",
> +};
> +
> +
>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>  static const cmdinfo_t truncate_cmd = {
>      .name       = "truncate",
> @@ -2498,6 +2636,11 @@ static void __attribute((constructor)) init_qemuio_commands(void)
>      qemuio_add_command(&aio_write_cmd);
>      qemuio_add_command(&aio_flush_cmd);
>      qemuio_add_command(&flush_cmd);
> +    qemuio_add_command(&zone_report_cmd);
> +    qemuio_add_command(&zone_open_cmd);
> +    qemuio_add_command(&zone_close_cmd);
> +    qemuio_add_command(&zone_finish_cmd);
> +    qemuio_add_command(&zone_reset_cmd);
>      qemuio_add_command(&truncate_cmd);
>      qemuio_add_command(&length_cmd);
>      qemuio_add_command(&info_cmd);


-- 
Damien Le Moal
Western Digital Research

