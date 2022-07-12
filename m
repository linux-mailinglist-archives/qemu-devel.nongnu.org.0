Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9153E57137C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:52:36 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAh9-0005GW-Ml
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBASV-0004EB-5d
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:37:28 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:33804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAST-0006A5-9r
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657611445; x=1689147445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pGDPaRVA80NnjDZHdVGRmYlpCLyfYLfiNz/OhpF3WTU=;
 b=GNnjfNtJaw6gQReLhXcMhewexkTwNBNU953/RJfUEv/h+RxILzmJJMuD
 IZls8OEZaOlc0eNcnulez/K7/uWBpcjqv1Wkhj8RkapnvqVSLaCCOJ61N
 IM+dOW2CEuGRUaBn/nfG6dmBF6NG1Ctcg+zXaa+GbAzPV4FA/rw8+XOS/
 rbvbwyt7ArwoOvgchC3LhyG+B9QP2EFeLQRQ4fpwNxqXxu6hcAlBCNtJT
 rSVUrAlAS/DXFWVStbET1ZWZPTLLb0bs6S7I71eqLLXH9BSOANZlkL652
 AsKsmMs0BrJBgx2nMRCGeudQvz4w0FKYNJ7CL9pIUACO+ekMIRUvxbD1o Q==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650902400"; d="scan'208";a="309795573"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2022 15:37:23 +0800
IronPort-SDR: HXrGOUahjxToIJdK4ZJu59twuDu6Lp+F6mCRqnHexhtSywnOoa2zSdjF37od7e/H+VwDVTGsaN
 e3RwWfnnzvJ5YDFjBgvIBrtKCVN+a6c2Qn/2Xt2LcrSuucqlZo5e/3U8b5Fc0lYSxRwjgsjjny
 NV8EoUFqjl3gcabXWXOwwmE/wU4K43NONCkfASbjEEDnjSghM3krJchR6Lx6FVaNOw8VN1Gwyw
 TcBf1LgMnaHjoZDTzbk2qnbO+H6sI0iTxzZzbxPtM56WoA8QEH+BWpJyqNslDcqiNCynywLWJy
 GPpZGEkVvi8MizYZKgf3heMh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 23:54:21 -0700
IronPort-SDR: T49XhjYpQvHFd6rZff/Ed1Cste70b4Ym2H5X7x4QNJAECM8BpK1Gf2IDBx8ON4unz59NqWz/tx
 SGDzVboTHeViqSLXq4zBZLQZgSm16E+QMukkq4fimPix1Q3XWfHl7tyCLoQLS7r0X8gCLYwNV+
 q9We4JCxGJrCc4xN0QftpkWF+Kww2hEExYTbFkpoZZqWD2zt0yp70zeFrWg7jom+SSZ3X41dZB
 Drjxr57Lgs1PDE+8WlZywq2Rim8JgNcuyi9DRgMp27CKKJfDYSIAx1gQJ0rB6lbbXT3KrV2H7O
 3Kw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 00:37:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lhsz66zXrz1Rwry
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:37:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657611442; x=1660203443; bh=pGDPaRVA80NnjDZHdVGRmYlpCLyfYLfiNz/
 OhpF3WTU=; b=a0OVzquoZUhvTvrA4SAf2dFZBCglurcarvO0liGZ1pTCihg5JUi
 sUQVfmDrt238ULTGAqC1hzepHRTSNFnK74WezRzijlIo35Cht0Pey0tX5+5n6c4y
 ER+653nJ3BxM2ODXnmb7xE00Gj/6NcgCkWOcZr3VbQtndkfJDe5BOQklVFn5/CU4
 rxxrSf+Frky6D+ymPINFpAixKGnZBKbyTrTQ2dmMyW/2Yn7UV0nX2Afb5+pD/zlb
 0o9iAXFkAkSmRhxkvh5Br3LkOQDKJ1N0qi736tAxQ1jzQCTVcfruJPxKhoJ10VId
 8p5cxfRT018hClis8bkUOAvsTxMznQWLWTA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TiIwHBSW45D2 for <qemu-devel@nongnu.org>;
 Tue, 12 Jul 2022 00:37:22 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lhsz41wwTz1RtVk;
 Tue, 12 Jul 2022 00:37:20 -0700 (PDT)
Message-ID: <f4232d7f-0f01-aadc-8473-d6f6d848354d@opensource.wdc.com>
Date: Tue, 12 Jul 2022 16:37:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 3/9] file-posix: introduce get_sysfs_long_val for a block
 queue of sysfs attribute
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, hare@suse.de
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-4-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220712021345.8530-4-faithilikerun@gmail.com>
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

On 7/12/22 11:13, Sam Li wrote:
> Use sysfs attribute files to get the zoned device information in case
> that ioctl() commands of zone management interface won't work.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index e7523ae2ed..3161d39ea4 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1218,15 +1218,19 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>  #endif
>  }
>  
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Get zoned device information (chunk_sectors, zoned_append_max_bytes,
> + * max_open_zones, max_active_zones) through sysfs attribute files.
> + */
> +static long get_sysfs_long_val(int fd, struct stat *st,
> +                               const char *attribute) {
>  #ifdef CONFIG_LINUX
>      char buf[32];
>      const char *end;
>      char *sysfspath = NULL;
>      int ret;
>      int sysfd = -1;
> -    long max_segments;
> +    long val;
>  
>      if (S_ISCHR(st->st_mode)) {
>          if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> @@ -1239,8 +1243,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>          return -ENOTSUP;
>      }
>  
> -    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st->st_rdev), minor(st->st_rdev));
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
>      sysfd = open(sysfspath, O_RDONLY);
>      if (sysfd == -1) {
>          ret = -errno;
> @@ -1258,9 +1263,9 @@ static int hdev_get_max_segments(int fd, struct stat *st)
>      }
>      buf[ret] = 0;
>      /* The file is ended with '\n', pass 'end' to accept that. */
> -    ret = qemu_strtol(buf, &end, 10, &max_segments);
> +    ret = qemu_strtol(buf, &end, 10, &val);
>      if (ret == 0 && end && *end == '\n') {
> -        ret = max_segments;
> +        ret = val;
>      }
>  
>  out:
> @@ -1274,6 +1279,10 @@ out:
>  #endif
>  }
>  
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    return get_sysfs_long_val(fd, st, "max_segments");
> +}
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> @@ -1883,10 +1892,17 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>      int64_t zone_size_mask;
>      int ret;
>  
> -    g_autofree struct stat *file = NULL;
> -    file = g_new(struct stat, 1);
> -    stat(s->filename, file);
> -    zone_size = get_sysfs_long_val(fd, file, "chunk_sectors");
> +    struct stat file;
> +    if (fstat(fd, &file) < 0) {
> +        return -errno;
> +    }
> +    mod = get_sysfs_str_val(fd, &file);
> +    if (mod != BLK_Z_HM) {
> +        ret = -ENOTSUP;
> +        return ret;
> +    }
> +
> +    zone_size = get_sysfs_long_val(fd, &file, "chunk_sectors");
>      zone_size_mask = zone_size - 1;
>      if (offset & zone_size_mask) {
>          error_report("offset is not the start of a zone");

This hunk that modifies raw_refresh_limits() should go into another patch.
Likely, you want that as part of patch 1, so this patch to introduce the
get_sysfs_long_val() helper function should come before patch 1.


-- 
Damien Le Moal
Western Digital Research

