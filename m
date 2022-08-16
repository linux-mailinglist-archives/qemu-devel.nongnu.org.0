Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA519596145
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:37:41 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0VY-0008IK-9O
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0R3-0003jw-3E
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:33:01 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:58294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0R0-0002CU-Ub
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660671178; x=1692207178;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sBRKRcugFmvWesNpYOQ7oT3qepORYjDlo4zb4JLMOGk=;
 b=Cgf3dwov2jHiBx8BaZbypX/rKaJa5gC85g1lh+bDlyXkMMNOq2JD6M42
 sLiUAkXcBDFVi9wMFm8PNAcmQO0EvgiNAhUFh6XH4OCg/ZPvVaUt/HaCg
 TMTsxQfoELvFALEEG+dpPbMopnpjz5A0ylGgFmMI+JIMrZtzFTHNqj5Ra
 9cUWr1JIF14RR6gR3FSTFZqDi/2mgLIPlyBJM0rcEkKuhsWfvkbHG+dY6
 bgbCLM7B7uy3Ko3PaXgx33x92PcGJHmJFMooDoyAJM/CoweyjkbZSOJ9U
 RIeZIks2KleTncnaKaGtH6Q4OjW0S+gSeCGpHfkffg7H+aYqr497AYen/ w==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654531200"; d="scan'208";a="207335292"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Aug 2022 01:32:48 +0800
IronPort-SDR: tNIG4SvaXpHsLl++xjq8xTffiiloCLweBQxSVhkJaAWpCH54ic8d/ClnmublhneNcUlcraV7Xc
 KmZGMsSJhshILkVmDKsFUtIg1sMpQTHpSbgU4Cl8/o7087QTKiApOmTi6QIW/0a8Gau0+wARDm
 HklFm5avSmBGxA4UzDs49T+2O9kgdBZCOk9cAZu6fa3svBb7wtXODY+hXdqQ7hTOiN3xEuvq20
 P8FA8jTAxPfmD4Y3MoHrxtH+0lViAW01sD5k0vPSstEQSeEE90paTb5Cx9jLRIG/iDUzGgbVRY
 zchGkcT8mUv6B7r/DUdvkJcK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 09:48:16 -0700
IronPort-SDR: rO4nfas5doCOT3w10lyFg8ZhoJas3WIXXSg0g/6m6jYXosEi+FduMuNqlapyg8tvz/fCscl1A/
 yGrtWLemfvr1yHYvQvkT0guDtpFfd+CNaHdJFvrR4BmWVdq33JlOeQWvb/ZlPok2EvWkWQ0STf
 X+5SLS2A3QiS4LorSx+jDtFQj9T0WUAI9iqH60RejGP4Qf/2cJ8y/HrpcNUysqK8GuGKsiWQLG
 Dz9kSk0/hZd3kgyBL3rdewWvsM3wqVBYbV/+vnR2Oua+sFXVHaH9k59ZGZicRnS7QY9IzpyO+m
 CwY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 10:32:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M6dX02Dnxz1Rw4L
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 10:32:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1660671167; x=1663263168; bh=sBRKRcugFmvWesNpYOQ7oT3qepORYjDlo4z
 b4JLMOGk=; b=QVuab0+JN+zbaMjFlLr3m21RfNuGQO699PyHzsmdJ5GBJjYvD0k
 3LLpFn2WidB8WXNuxyPpNYIqCUORbUni54Xrnt+MR59ppm2aoj21vqKR6OQEcQNY
 cwi0q47V28DHYpCz0h1DxazGPpwpy5ZElpzmTC3zkupQrJvzZc05z2C54dF3JW4v
 94K/hO3/y5etPg1AjsWGENQ6VE9mBaU/HVDbApTmBypiTIiY7Yz6GmZiCCkz52eT
 4/x6lepf9YO0i8NNiGecOqVodQiY3LIS4Rp/V8I6IaZnUB4p1aSAM7xTQIG5JGgr
 bC2Rjpzv3MINWRzXmkqkTobwWiz7J1ZGTWg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qNvIaqjAp9Mj for <qemu-devel@nongnu.org>;
 Tue, 16 Aug 2022 10:32:47 -0700 (PDT)
Received: from [10.111.64.29] (c02drav6md6t.sdcorp.global.sandisk.com
 [10.111.64.29])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M6dWy3X7Qz1RtVk;
 Tue, 16 Aug 2022 10:32:46 -0700 (PDT)
Message-ID: <ef497b4f-165a-217c-5123-fdcd9762237a@opensource.wdc.com>
Date: Tue, 16 Aug 2022 10:32:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v7 2/8] file-posix: introduce get_sysfs_str_val for device
 zoned model
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-3-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220816062522.85714-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=22053a6f0=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
> Use sysfs attribute files to get the string value of device
> zoned model. Then get_sysfs_zoned_model can convert it to
> BlockZoneModel type in QEMU.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/file-posix.c               | 93 ++++++++++++++++++--------------
>  include/block/block_int-common.h |  3 ++
>  2 files changed, 55 insertions(+), 41 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..c07ac4c697 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1210,66 +1210,71 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>  #endif
>  }
>  
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Convert the zoned attribute file in sysfs to internal value.

This function does not convert anything. So this comment should be changed to
something like:

/*
 * Get a sysfs attribute value as a character string.
 */

> + */
> +static int get_sysfs_str_val(struct stat *st, const char *attribute,
> +                             char **val) {
>  #ifdef CONFIG_LINUX
> -    char buf[32];
> -    const char *end;
> -    char *sysfspath = NULL;
> +    g_autofree char *sysfspath = NULL;
>      int ret;
> -    int sysfd = -1;
> -    long max_segments;
> -
> -    if (S_ISCHR(st->st_mode)) {
> -        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> -            return ret;
> -        }
> -        return -ENOTSUP;
> -    }
> +    size_t len;
>  
>      if (!S_ISBLK(st->st_mode)) {
>          return -ENOTSUP;
>      }
>  
> -    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st->st_rdev), minor(st->st_rdev));
> -    sysfd = open(sysfspath, O_RDONLY);
> -    if (sysfd == -1) {
> -        ret = -errno;
> -        goto out;
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
> +    ret = g_file_get_contents(sysfspath, val, &len, NULL);
> +    if (ret == -1) {
> +        return -ENOENT;
>      }
> -    do {
> -        ret = read(sysfd, buf, sizeof(buf) - 1);
> -    } while (ret == -1 && errno == EINTR);
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
> +static int get_sysfs_zoned_model(struct stat *st, BlockZoneModel *zoned) {
> +    g_autofree char *val = NULL;
> +    int ret;
> +
> +    ret = get_sysfs_str_val(st, "zoned", &val);
>      if (ret < 0) {
> -        ret = -errno;
> -        goto out;
> -    } else if (ret == 0) {
> -        ret = -EIO;
> -        goto out;
> +        return ret;
>      }
> -    buf[ret] = 0;
> -    /* The file is ended with '\n', pass 'end' to accept that. */
> -    ret = qemu_strtol(buf, &end, 10, &max_segments);
> -    if (ret == 0 && end && *end == '\n') {
> -        ret = max_segments;
> +
> +    if (strcmp(val, "host-managed") == 0) {
> +        *zoned = BLK_Z_HM;
> +    } else if (strcmp(val, "host-aware") == 0) {
> +        *zoned = BLK_Z_HA;
> +    } else if (strcmp(val, "none") == 0) {
> +        *zoned = BLK_Z_NONE;
> +    } else {
> +        return -ENOTSUP;
>      }
> +    return 0;
> +}
>  
> -out:
> -    if (sysfd != -1) {
> -        close(sysfd);
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +    int ret;

Add a blank line here ? Not sure about the qemu code style convention. But a
blank line after a variable declaration is always nice to clearly separate
declarations and code.

> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
>      }
> -    g_free(sysfspath);
> -    return ret;
> -#else
> -    return -ENOTSUP;
> -#endif
> +    return get_sysfs_long_val(st, "max_segments");
>  }
>  
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
>      struct stat st;
> +    int ret;
> +    BlockZoneModel zoned;
>  
>      s->needs_alignment = raw_needs_alignment(bs);
>      raw_probe_alignment(bs, s->fd, errp);
> @@ -1307,6 +1312,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>              bs->bl.max_hw_iov = ret;
>          }
>      }
> +
> +    ret = get_sysfs_zoned_model(s->fd, &st, &zoned);
> +    if (ret < 0) {
> +        zoned = BLK_Z_NONE;
> +    }
> +    bs->bl.zoned = zoned;
>  }
>  
>  static int check_for_dasd(int fd)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..7f7863cc9e 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -825,6 +825,9 @@ typedef struct BlockLimits {
>  
>      /* maximum number of iovec elements */
>      int max_iov;
> +
> +    /* device zone model */
> +    BlockZoneModel zoned;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;


-- 
Damien Le Moal
Western Digital Research

