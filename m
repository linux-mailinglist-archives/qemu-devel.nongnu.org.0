Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722A5961D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:03:46 +0200 (CEST)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0un-0000ia-Gm
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0Ts-00061f-Ii
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:35:56 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0Tn-0002fJ-G2
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660671352; x=1692207352;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=01Qck+d3f/C5+Mk2+fZRzh6u2yRofykqrRR1rsfxSvU=;
 b=P8qaqKciuZSKicsfWtbcb5NP1QLL4LSw6Z2JxTyddRpieYkGzgnOxXsj
 QlYorTyopLqFyOFFD70medtUvPUt+o+gjd/g8wgJZJyGRvMdNqnICOHr5
 eeNrlTgQcMbBociSWh2zOWwXx7HhZRoO/LPS0FCUJ7Z0dCtBENPLjh0RR
 eB9ZsPD+9NJToubtHpcUmszAoBkCcgeVwzkHePYSSxPvgN7hFd3ysBCtP
 sa7jnnAWxoPCtmK4vVu6j3lOLLymzI5y4eRQzqSby+DBvl7fH+qJQ+z2F
 8yOMEw9HLKc1l+LmkIap9EOMuGbCtX/nHfzdjeo8IpJd34/LO8tbWfQLx w==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654531200"; d="scan'208";a="320952990"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Aug 2022 01:35:36 +0800
IronPort-SDR: WWzvM575OGnv0RN7abt8Cu78l17iHC64bQkdrXL2FPO74RGOSWlGEQgb7tv4GiHeyzWXchN0va
 0TMY0tWjJMHzWEZb/hwlOj2reMCmE46JXKjBoEBGQ0vnas4acAndH9wyD3Q6pEQJ959/Lk5jLp
 a8QyuqRbV8u8QLEeqyJ9xia5lsWUpgiwf54gXCmwPAuwlz0ayehcQIr5q6pUSbjC29uP+50zzS
 nToRPI1nklSpuwx6FWWpcu2j5ft+C0c4dudlHxbPxcLIxtKJQGn6J/CcrV1lBt55psL7FXZgVM
 ZwYlRIwtL15Y7TjwzbAeObcq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 09:56:21 -0700
IronPort-SDR: RsTLFzC9A2F4sTRTumUvlgppEw5DeDTxeFYkJlKrulAnumM/aRC7VBVZHTXpthkw2t5miujuH0
 qceiMtrQ7tBwJhKQTOFcBqcaQ8sUnCI7rDobp0AyZW1de0UXWkROaBSWztamxrzxyLuZ7Gi1yK
 CfqNH+GlAqFN3+IklSZJfiJAA3OmSesz5TJtU+HCNb34vFN9ftgkhvJx0fHk2KocY91plvyofO
 G30jou7C7s5+HUW4LlUW5mUb5Kgu+mUJxOBUYIRAirf1N696kbJC8TV/f+ahd4q/VfWTSr+GMg
 /lM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 10:35:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M6db92LfFz1Rws7
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 10:35:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1660671332; x=1663263333; bh=01Qck+d3f/C5+Mk2+fZRzh6u2yRofykqrRR
 1rsfxSvU=; b=ND9NnNbNcjJZK0q4g8ZlJiI2e0ieBXytYxqyUQF3nCRLy8vt8Iq
 NO2L69lNHVVQGv7+2b4iTuO+G2VRuuJ8b+BHmoBzIvXaWDSh0sUaWssofEBptLOh
 j9vbtdjqI5TzYu8NPzsBi+TmWp7i4tJZiBnGgCn3vBnRv2Nk43gICg/tquHjsag6
 ha6QRuHf+1ZwdbTET4URqdvcQfIy7B9juEvqve8aGU5s6ZXeeSbura2JESzwNIGG
 YDBIEhf7EbZXYi5ky55y7y/FBquLg5uN/lq3RKAOHkk/btlwKoYGWRv4jr8Xrk1K
 Ma6RhV2v3yawhTDkbA6NmzRdgoW1V1nb3cA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2ofAzsTcbI4J for <qemu-devel@nongnu.org>;
 Tue, 16 Aug 2022 10:35:32 -0700 (PDT)
Received: from [10.111.64.29] (c02drav6md6t.sdcorp.global.sandisk.com
 [10.111.64.29])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M6db7608Lz1RtVk;
 Tue, 16 Aug 2022 10:35:31 -0700 (PDT)
Message-ID: <69f2b5bd-2312-a581-7ce1-065159eeaf5d@opensource.wdc.com>
Date: Tue, 16 Aug 2022 10:35:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v7 3/8] file-posix: introduce get_sysfs_long_val for the
 long sysfs attribute
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-4-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220816062522.85714-4-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=22053a6f0=damien.lemoal@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

On 2022/08/15 23:25, Sam Li wrote:
> Use sysfs attribute files to get the long value of zoned device
> information.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/file-posix.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index c07ac4c697..727389488c 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1258,6 +1258,33 @@ static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned) {
>      return 0;
>  }
>  
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.
> + */

The comment here needs to be more generic since this helper is used in patch 2
in hdev_get_max_segments(). So simply something like:

/*
 * Get a sysfs attribute value as a long integer.
 */

And since this helper is used in patch 2, this patch needs to go before patch 2
(reverse patch 2 and 3 order).

> +static long get_sysfs_long_val(struct stat *st, const char *attribute) {
> +#ifdef CONFIG_LINUX
> +    g_autofree char *str = NULL;
> +    const char *end;
> +    long val;
> +    int ret;
> +
> +    ret = get_sysfs_str_val(st, attribute, &str);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    /* The file is ended with '\n', pass 'end' to accept that. */
> +    ret = qemu_strtol(str, &end, 10, &val);
> +    if (ret == 0 && end && *end == '\n') {
> +        ret = val;
> +    }
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static int hdev_get_max_segments(int fd, struct stat *st) {
>      int ret;
>      if (S_ISCHR(st->st_mode)) {


-- 
Damien Le Moal
Western Digital Research

