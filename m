Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645AA5713F2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:08:08 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAwB-0005fY-63
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAd6-0002vs-4v
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:48:24 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAd2-0000za-3k
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657612100; x=1689148100;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6bqmCQluMqDa/hHDg7ltNhz4r7uaGGeB3I3Ozavuguc=;
 b=EHfbhZFEOzovzuIzpj6xoMrdgtOEBFabxiaU9VDlxFgqrHdvIZ0+7k/X
 x5ieq/kVUpBgLqRG/aN6MEf6T69+Co07CMmdlbok70DoTsRCVx89mLtBo
 j3Ve4V+LthdnAADsid3fcvt+CxOr7GH31XIWULjaZb2pmaM41gi20N62L
 ljJPzV3xMDEMm4QeWHEA5y6hd8Scym9sxXWSDbqHSCq8lQjnjDzZjSQAb
 mpKRm3uET7sRPDOznUH9mcr4XRLWg/JOvSCR1mUKHIVq++ysXg6mCDElw
 8JnbnXZkYxpm++OYjHS8ZnpNYSQDDRFdhNRuTaSGBv2jKcUzbtGpnUl6a g==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650902400"; d="scan'208";a="204108378"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2022 15:48:16 +0800
IronPort-SDR: qJfC2nfoHM8a8P/zmxvimdi1WKZeG36BlinQimTj5MTn7wDWHW1L5coFMWGOIj6P0D+HMWtFa1
 Bv96g2scntMxCNgqodBEpHn+WGxUkCJ9HVGYzcWKgEXEx5rBZE1Q3WVY9BRCKoqNNGfGw7LVG6
 BpshI3Spu7OW1OUALWxEXKtrKDGc8o3cd5R0/4qTh3CGAmZlKixpqIdCi49jpqN91HFJzsWfMa
 YMGsLO8BKyyELvPnQ3nkEBux0TFu4HTqniMNP7rvHLo+B+c57gZAypys43qRd/zVpY4R6FF3cQ
 w//rWU1/oMpdTpfP4C0a64/h
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 00:09:52 -0700
IronPort-SDR: LLYz5+G6bRNzej1nEjuIghSCYoEJ3jd7a7S4fJCLDAnJCztmPSxCW2fmeE6f1jadUPY8ET+eKy
 8I8g/6mDpC6Wm24dWoyIzflvkBfoPuxFZQGpDjaM+B4fODq9hlAFyWoLdkAA/n185/r0boXwza
 s9V6OZuZNF/DDP3Uvku8EZTegtrnK7d3SUtqqKlbzSQvqBvd9B/GAcNGCdOuRlAfQ+sArBE8Io
 cuxqvOwCqCMzy1L6jQv/CzZzI/s3VfJelzAfVlJoGuvL0bXktnZWVIff4BVgpayn4b82T1x0GU
 u7A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 00:48:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LhtCg5yhnz1Rwqy
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:48:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657612095; x=1660204096; bh=6bqmCQluMqDa/hHDg7ltNhz4r7uaGGeB3I3
 Ozavuguc=; b=Pc0dcmdeev9P6lOP7KIc0aeg4znn0fgKGul6Xuj89ahp4XyLeLg
 1LrrO4LkfR9BWQhlT3V/T3jQpVfmu1+4EwQ+OZarLji55q15WzMGrwVEmiq5/1Yh
 qHtXwzan8cIns3/1GtpSGGIKQ+M6OILxVSQB/idiYa15d/qBYKHFo5r2oV8V2aOi
 oG+FhZibp6IjiVTYQAiAXBYlD6knk456s7kbXTxAKh06HjPcsBD/2SIj07WGVOyk
 08R3udz+yxc0YjkyPLoUdTNrMs0yFtR8GJZHWTKuqGt970dW76KOssU8bCxf9pGf
 /JmW24aU2u8Z2SYnHTf4LvN6OxLIdGSY7aA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B4HIler7eioa for <qemu-devel@nongnu.org>;
 Tue, 12 Jul 2022 00:48:15 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LhtCd1NFDz1RtVk;
 Tue, 12 Jul 2022 00:48:12 -0700 (PDT)
Message-ID: <73248014-9944-9a1b-743f-a5e7a1dda2b3@opensource.wdc.com>
Date: Tue, 12 Jul 2022 16:48:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 9/9] qapi: add support for zoned host device
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, hare@suse.de
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-10-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220712021345.8530-10-faithilikerun@gmail.com>
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

On 7/12/22 11:13, Sam Li wrote:
> ---
>  block/file-posix.c   | 8 +++++++-
>  qapi/block-core.json | 7 +++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index e9ad1d8e1e..4e0aa02acf 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3737,6 +3737,12 @@ static void hdev_parse_filename(const char *filename, QDict *options,
>      bdrv_parse_filename_strip_prefix(filename, "host_device:", options);
>  }
>  
> +static void zoned_host_device_parse_filename(const char *filename, QDict *options,
> +                                Error **errp)
> +{
> +    bdrv_parse_filename_strip_prefix(filename, "zoned_host_device:", options);
> +}
> +
>  static bool hdev_is_sg(BlockDriverState *bs)
>  {
>  
> @@ -3975,7 +3981,7 @@ static BlockDriver bdrv_zoned_host_device = {
>          .is_zoned = true,
>          .bdrv_needs_filename = true,
>          .bdrv_probe_device  = hdev_probe_device,
> -        .bdrv_parse_filename = hdev_parse_filename,
> +        .bdrv_parse_filename = zoned_host_device_parse_filename,
>          .bdrv_file_open     = hdev_open,
>          .bdrv_close         = raw_close,
>          .bdrv_reopen_prepare = raw_reopen_prepare,
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2173e7734a..ab05c2ef99 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2955,7 +2955,8 @@
>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'parallels',
>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', 'rbd',
>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' ] }
> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
> +            { 'name': 'zoned_host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' } ] }

This needs to be something like:

{ 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } ] }

And we need to make sure CONFIG_BLKZONED is defined if and only if we also
have HAVE_HOST_BLOCK_DEVICE.

>  
>  ##
>  # @BlockdevOptionsFile:
> @@ -4329,7 +4330,9 @@
>        'vhdx':       'BlockdevOptionsGenericFormat',
>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>        'vpc':        'BlockdevOptionsGenericFormat',
> -      'vvfat':      'BlockdevOptionsVVFAT'
> +      'vvfat':      'BlockdevOptionsVVFAT',
> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
> +                             'if': 'HAVE_HOST_BLOCK_DEVICE' }

Same here I think.

>    } }
>  
>  ##


-- 
Damien Le Moal
Western Digital Research

