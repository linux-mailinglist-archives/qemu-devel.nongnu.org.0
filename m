Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E35B4C1E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 06:59:29 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXF44-0000m9-5u
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 00:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXF1g-0007hi-Ig
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 00:57:00 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXF1e-00027g-JF
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 00:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662872218; x=1694408218;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6mpMoWejVtOxPfMHqR77FOjg5mNjMZaKwqiqNWPwebQ=;
 b=FA/ji81s0VMzAZJ2Bal0Dn16n709+P0YO/s4NTgeavynR7o//nb01Tlu
 6Aowe5JjB5pEosWuT9CjjBcO2HZ/bwT8dYzmnrd7avLkAZzVpfWnZMEt9
 OQXq2DhduK01ozfPQ4mE3rjMAFsFB4IrvENtrpS/1e5PfrEv4WXxpai4i
 iUgApGRlsOgcxEwHoB4m8e/GLRpXDoYqzx4J4BIYHpG9L5f8JzK3X4AR7
 tAGnZcpLSOd6VMIYNNN8iCjRcDm1gq6b8W/10kE+srfEt3gsMA1GQb1W3
 3WIbsFPbS3IEIFpJpDinJ7hwx5BDcrwVxw+0GrD7bh0vG3Z/DJBifp/6r A==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="323146124"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 12:56:48 +0800
IronPort-SDR: sfJO/ZDqmWIkQsdBOmsM0y53Xbz0b4fSbztGJcm6b8XDe9dwGUDcQUco40AbkafJUDSmney+0L
 vok2MnVxQiMvDT23Q0w5xGQEtM581ivr+p12vVvYmAogLjtJO2ycgA4RKxVSCkIUTc+ZbS/IN+
 WVzB+s4qJ4n9t4W1ctSdDVxrXdXXlZG+8nK3hYgl3ocLL5sbYdyVdKAEWzNwA97UwU1Z+Is79O
 eY3EW+ID2eC9rr4hSTz1w7JMlxsH/7tEv1OpPAWVE4Aod4mZ/UYl84n/hAoFOhvzvVFPmSslGM
 i1M/vvabemEjeQAsKmyM4zCt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 21:11:39 -0700
IronPort-SDR: BFPCXu9q64VQ6j4K1iiL7dBqGbeKaT6NqjfyufRJQNGVtjJt127IpWNxR3dB/FBOcdvRdld0u2
 dLMdGg8eAAzc4aTEkO8YkQhHosP9JbAbUa/TmRqLpedKE0pyhPp0oiJmwqxyIUFcGbuUJ5zfrl
 tzuQUBqjxOCB1tSW5X25Hig/uARi86KN0f9MoLsdr6SHjsoSUlQrfcT2bTqopUynGq1jAe0+z9
 LA0s4S7MvuHX0dUix9lsh6/svvZlhoEbuhQEjsuZtvCjeBVHkaJRxXl6hw8p8u2479JRyxHT0z
 lQ0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 21:56:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQHWg66Ytz1RwvL
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 21:56:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:content-language:references:to
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662872206; x=1665464207; bh=6mpMoWejVtOxPfMHqR77FOjg5mNjMZaKwqi
 qNWPwebQ=; b=swAX4Wh+wycJVOXCvW1C/0S1gf/1mw3iuPcXtpORIsw6w6mKf+H
 OjllOOvZzv6ZsuuKcJvBleWZswcLEkc/9F1YnKvsXf832bHl+FVEjLN+bsU39WrD
 bO2sZ6vbv36GGUnMME38DFrouFsIQeM6BfG6x02/I09GMhA7HOssQjP85P3FeJZS
 xmC2VBYafJQmtwez3G5VwD4oWRkBew721O7w7pXN7Mmz8Sfrvq53Iju7nFxXi9+h
 azEzil6O1wo88NqK0dMM6dOh93X5cQheN+gfRqL7lWjf9LFYBTYZrjZyahSUS8bS
 NvNeXxZ5DII0F5WQ4FAvESypLHg4adTAedQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id K_OZQXsHyuE8 for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 21:56:46 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQHWb6Y9Wz1RvLy;
 Sat, 10 Sep 2022 21:56:43 -0700 (PDT)
Message-ID: <82f79c1f-c5fc-7283-095a-7b2c0a4cb81e@opensource.wdc.com>
Date: Sun, 11 Sep 2022 13:56:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 2/7] file-posix: introduce helper functions for sysfs
 attributes
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-3-faithilikerun@gmail.com>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220910052759.27517-3-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
> Use get_sysfs_str_val() to get the string value of device
> zoned model. Then get_sysfs_zoned_model() can convert it to
> BlockZoneModel type of QEMU.
> 
> Use get_sysfs_long_val() to get the long value of zoned device
> information.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  block/file-posix.c               | 121 ++++++++++++++++++++++---------
>  include/block/block_int-common.h |   3 +
>  2 files changed, 88 insertions(+), 36 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 48cd096624..0a8b4b426e 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1210,66 +1210,109 @@ static int hdev_get_max_hw_transfer(int fd, struct stat *st)
>  #endif
>  }
>  
> -static int hdev_get_max_segments(int fd, struct stat *st)
> -{
> +/*
> + * Get a sysfs attribute value as character string.
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
> +    size_t len;
>  
> -    if (S_ISCHR(st->st_mode)) {
> -        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> -            return ret;
> -        }
> +    if (!S_ISBLK(st->st_mode)) {
>          return -ENOTSUP;
>      }
>  
> -    if (!S_ISBLK(st->st_mode)) {
> -        return -ENOTSUP;
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/%s",
> +                                major(st->st_rdev), minor(st->st_rdev),
> +                                attribute);
> +    ret = g_file_get_contents(sysfspath, val, &len, NULL);
> +    if (ret == -1) {
> +        return -ENOENT;
>      }
>  
> -    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st->st_rdev), minor(st->st_rdev));
> -    sysfd = open(sysfspath, O_RDONLY);
> -    if (sysfd == -1) {
> -        ret = -errno;
> -        goto out;
> +    /* The file is ended with '\n' */
> +    char *p;
> +    p = *val;
> +    if (*(p + len - 1) == '\n') {
> +        *(p + len - 1) = '\0';
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
> +/*
> + * Get a sysfs attribute value as a long integer.
> + */
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
> +    if (ret == 0 && end && *end == '\0') {
> +        ret = val;
>      }
> -    g_free(sysfspath);
>      return ret;
>  #else
>      return -ENOTSUP;
>  #endif
>  }
>  
> +static int hdev_get_max_segments(int fd, struct stat *st) {
> +#ifdef CONFIG_LINUX
> +    int ret;
> +
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
> +    }
> +    return get_sysfs_long_val(st, "max_segments");
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
>      struct stat st;
> +    int ret;
> +    BlockZoneModel zoned;
>  
>      s->needs_alignment = raw_needs_alignment(bs);
>      raw_probe_alignment(bs, s->fd, errp);
> @@ -1307,6 +1350,12 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>              bs->bl.max_hw_iov = ret;
>          }
>      }
> +
> +    ret = get_sysfs_zoned_model(&st, &zoned);
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


