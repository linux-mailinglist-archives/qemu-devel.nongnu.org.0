Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CCD5B4C3C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 07:47:43 +0200 (CEST)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXFok-00049F-DR
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 01:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFa1-0005RP-IG
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:32:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFZz-0006Es-H4
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662874347; x=1694410347;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AJNrVTv1QFnkPWD/LUHi3+f7W7ejKYDv1ldJfgmkuyw=;
 b=PRRk3f+Ofzp+DOanSX+rSvR5jBd2v2NFGBCIadqyaXLVixAe6tWlxD9F
 UoEBIWosMBMm7pCwZEmc5T4CkPuM74c6zPJVoOuF9FtseCot9UbXEoQgU
 H/NQqkLodW9TPXd6YEb3xIMCoLmeXh9cEcHshDzU36TtXR4QyzxCKVoCm
 YyS6V/Gyso3l5y/iTB5J/KeYnIEEfongnQ8bXp88pnYe/n4WnYNqVbFNX
 T/H+zF9QeMMxSN8XUYT8YAgauZ1YmkO9DHlKHTZ4Wo2fUs1IebHYYfSkN
 sDLt9RD0QSCbJuejeUfNk7+pviEPHAJ6dHWVpD8Dc1lJi/7Lq59+7HKYo g==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="211036470"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 13:32:21 +0800
IronPort-SDR: kBCarvG3ZvW7CEuS/H0YLub6SXVa1SYpXVED2OoxUD6YFtPuAje3aO8frMxwHUYyGd5HEkylqX
 n9V9sv2bdK4bQblc49oSj9FQK8NFnZWamORLMfzEn+oyRWoiaoig/sdQtAAnHYTl9HQ4O/VJUX
 ULqGW4ocrqhIviqR35qlmN5XEqRCM5ZzDlJg33YkSGmcMSH7maUe8MjP09Ct8o956mGQYY3odZ
 u5TeiprPP+am+KZyLQxZCNj97a3nBYQz6IizjtONwg+IT8dZKvvB7szjQeQc7jxqSJnpKfoN+2
 LGcxiJDnOgmmOK8DfbctLdBS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 21:47:12 -0700
IronPort-SDR: LoPIcXQxuhCKqzdQd7UUPjG5GlfETZ0i/dD2wHbnwefTtKaG82kyWInxw4MwKR3JFtzwNzyV8B
 cPulVEuqUxsnX6OqFiZXGw2BhLT6qgw+frOKKtLmIbrz/uv3Eewwnq3klhs1iNxzHm82G+nRrm
 1yCBpi+KFltNl8YtdsTfYpN8XbyDNNiyFEIBpj/iZiKTrUSa1MCHIUoCAizlMklE4NfcsRPx5o
 A/OPHWQBMvFHnH7LJHck0Airao9eM+NaiomeK5ge6zeRBkAFS/Nrwk3EJ2rlI2lxWftA21lFpA
 1/8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 22:32:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQJJj3mHzz1Rx15
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 22:32:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662874340; x=1665466341; bh=AJNrVTv1QFnkPWD/LUHi3+f7W7ejKYDv1ld
 Jfgmkuyw=; b=CFSdJ89adinBxyL2Ay4dAD3I9ci88P0BysoZYKwikIqgBBGEK9S
 /5P1YrwT7UVR6/HuhjscTUclNX2TYv0wENFlccVwnLc/yXFMUxi2ypi7WJoz8xR5
 67gyzv343pu01Yy2J24fDyNe+0Sij+VdTR4KO38j5Cb6pflTD339TiL8eQ7QaMWO
 Z3QoiT1WL+IoqfCqyo0EvbRdz+p2DBLfUqcr/qA6ed+2xT3sy1+ZSSJ3ke5IHqBl
 uqQgTeJB2PtKsHdQq/aCREb2O5Emi10u/mc4UJKCgAF0I+y+HH3wujpk7ZlC39O5
 tiIRKc9St7G3K3n+QL2lf5WCTlMs/NoTS3g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id q7EPcRYgITvl for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 22:32:20 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQJJf35lbz1RvLy;
 Sat, 10 Sep 2022 22:32:18 -0700 (PDT)
Message-ID: <4d1a7822-9e87-c79a-1c23-aa9f8a9f4c45@opensource.wdc.com>
Date: Sun, 11 Sep 2022 14:32:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 4/7] raw-format: add zone operations to pass through
 requests
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-5-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220910052759.27517-5-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
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

On 2022/09/10 14:27, Sam Li wrote:
> raw-format driver usually sits on top of file-posix driver. It needs to
> pass through requests of zone commands.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  block/raw-format.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 69fd650eaf..6b20bd22ef 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
>      return bdrv_co_pdiscard(bs->file, offset, bytes);
>  }
>  
> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                           unsigned int *nr_zones,
> +                                           BlockZoneDescriptor *zones) {
> +    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
> +}
> +
> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
> +                                         int64_t offset, int64_t len) {
> +    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
> +}
> +
>  static int64_t raw_getlength(BlockDriverState *bs)
>  {
>      int64_t len;
> @@ -614,6 +625,8 @@ BlockDriver bdrv_raw = {
>      .bdrv_co_pwritev      = &raw_co_pwritev,
>      .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
>      .bdrv_co_pdiscard     = &raw_co_pdiscard,
> +    .bdrv_co_zone_report  = &raw_co_zone_report,
> +    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
>      .bdrv_co_block_status = &raw_co_block_status,
>      .bdrv_co_copy_range_from = &raw_co_copy_range_from,
>      .bdrv_co_copy_range_to  = &raw_co_copy_range_to,

-- 
Damien Le Moal
Western Digital Research


