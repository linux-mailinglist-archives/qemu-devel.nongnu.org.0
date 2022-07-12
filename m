Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45035713E2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:03:25 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBArc-00045e-PO
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAXM-0007cu-8W
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:42:30 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:48335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=18524360e=damien.lemoal@opensource.wdc.com>)
 id 1oBAXK-0008Sa-8H
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657611744; x=1689147744;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4ihLYLazm27miGg8Qd6/cYa6Rd23360rrL0wiDMc8hM=;
 b=jgSvHvUzwVCnyxPo3/FwBU8+Gy6RrT70pUXllNJVJS8vXTsMcUNCWQKj
 8WJokJ8iNuaaDcWl9JaR4InUSaS/Rz6p7GTbqhARjhI8RxeQsqoGXnOLG
 YCS3PZ2vpFg1hVSMjtNqxA5ec+qGEda3DR1+j7RTMoVOwVvJdu7fFe6xk
 /+8Rzo8qtj9Fis+2cRbE8NxVQYmLgdQ60FBK72z7+f4JMbs2Snil/N8lI
 HgctqZo8Znj908p2zWcCsOyysXuGGFT2O4h+juGHy7VjcBQ7lnOfMQCnY
 OE+q7q8+t41eKTNu6tmHQfb2ozdVD2Z23i8S2131rFWZWx/5iCRRk7ecv A==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650902400"; d="scan'208";a="205465509"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jul 2022 15:42:20 +0800
IronPort-SDR: UJ4HOuetPa3eUCthlZEkf1BcqVO6goa6ekT6xSImJWPFlMSB/vDwd4L//Q8fu8NkCQmNrKt8Oc
 IADoXTJCOXfwti5VuGzuQVPb+P/JJg8K4qBLsLSgVZxMyp9kJ7ISI4vGL8n4X7dnK5ukB9i3DB
 Ktxyyx83npCoPpoh5gK7GHFEh9DAB66hdBkg8EvBaYCRupfqt3FeoUw8LcMuI1y5EGvauWzHD/
 Mm4sDHGt0Ho2rqpSG8Gq73T/7Im8ZWf59+I3s+oRcIrEZIRm6Cszv1xcSXN5m30NwB6IYL5Tpv
 SfgofgfV2ntnUaguJJnJ3Qg4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2022 23:59:19 -0700
IronPort-SDR: 9SA6X/HKR5r08flDbn3xfE8UoJM4hY3HVWAKYTXqINWSucceOAC5vE/JMh1CX+9kPM0rmZ7COn
 CTcxu8HP5wbcJWNc/MTBlhWNtvcxfhqhf0VLAUZVZwjS6wHI6U9J99sCt4vb5l5o+5CL+BCBpg
 xyx4iVVCY4p36wziJuuIYHNh+c+7NMkfLU/80Ed2+TQzaOffbbiYVzxCNsdQI/Zm40ARrHMG/H
 4fqWfJlvN0OPUTbCQUvRHfzNUhrvWA5zKkejOByXRFRK/ZohWvJjQ9HvXD7ujjI2mS9xNj5eSj
 7w8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2022 00:42:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lht4s2Tydz1Rw4L
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:42:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657611740; x=1660203741; bh=4ihLYLazm27miGg8Qd6/cYa6Rd23360rrL0
 wiDMc8hM=; b=aeVAG4HQlqJocVUXfeF3hj70J3KdCqojMnVpXTre6Zpf6IVYgzE
 NADMhPpNVKWgtjVLXUOiCFnnkAB/U/DJGjbT3ndvZVsZufGmXziVLMmhOrvwoyuB
 xbd0lfWY+7qFfCP4gWT2GO9qbxjmDVUTTHxc9fsN3/ZJ1cybBTSEbPijyaYiwxaM
 4bnntow3rpnQnQMPc/c5HmbJ4eFRGdK/RsXazjviJHsR2M7hcgDBqQIqIPlf0sGE
 r3GpPIaysJEX+eZxrVtKw0wBvxiB/9rqG6++r7sq1iKLRp8eElhIfMwELJ3AKzci
 EdftSXedxmg749L3wMN+iHmIREpMoO8Wutg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WdJUlrVJOoa5 for <qemu-devel@nongnu.org>;
 Tue, 12 Jul 2022 00:42:20 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lht4p4HwVz1RtVk;
 Tue, 12 Jul 2022 00:42:18 -0700 (PDT)
Message-ID: <d8d57c71-0871-80c8-c205-4b98a801c9de@opensource.wdc.com>
Date: Tue, 12 Jul 2022 16:42:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 4/9] file-posix: introduce get_sysfs_str_val for device
 zoned model.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, dmitry.fomichev@wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, hare@suse.de
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-5-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220712021345.8530-5-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=18524360e=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

On 7/12/22 11:13, Sam Li wrote:
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c           | 60 ++++++++++++++++++++++++++++++++++++
>  include/block/block-common.h |  4 +--
>  2 files changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 3161d39ea4..42708012ff 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1279,6 +1279,65 @@ out:
>  #endif
>  }
>  
> +/*
> + * Convert the zoned attribute file in sysfs to internal value.
> + */
> +static zone_model get_sysfs_str_val(int fd, struct stat *st) {

This is not a generic definition of a helper function: as-is, this
function can only get the zoned attribute string. It would be better to do
the same as what you did for get_sysfs_long_val() and pass the attribute
name you want to look at and add another argument to return the string, e.g.:

static void get_sysfs_str_val(int fd, struct stat *st,
			      const char *attribute, char **val)

And if the attribute does not exist, or this is not linux, always return
"none" in str.

> +#ifdef CONFIG_LINUX
> +    char buf[32];
> +    char *sysfspath = NULL;
> +    int ret, offset;
> +    int sysfd = -1;
> +
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -ENOTSUP;
> +    }
> +
> +    if (!S_ISBLK(st->st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
> +    sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/zoned",
> +                                major(st->st_rdev), minor(st->st_rdev));
> +    sysfd = open(sysfspath, O_RDONLY);
> +    if (sysfd == -1) {
> +        ret = -errno;
> +        goto out;
> +    }
> +    offset = 0;
> +    do {
> +        ret = read(sysfd, buf + offset, sizeof(buf) - 1 + offset);
> +        if (ret > 0) {
> +            offset += ret;
> +        }
> +    } while (ret == -1);
> +    /* The file is ended with '\n' */
> +    if (buf[ret - 1] == '\n') {
> +        buf[ret - 1] = '\0';
> +    }
> +
> +    if (strcmp(buf, "host-managed") == 0) {
> +        return BLK_Z_HM;
> +    } else if (strcmp(buf, "host-aware") == 0) {
> +        return BLK_Z_HA;
> +    } else {
> +        return -ENOTSUP;
> +    }

Then all this code actually looking at the string value can go into a
different patch, or in patch 1 (same comment as for patch 3).

> +
> +out:
> +    if (sysfd != -1) {
> +        close(sysfd);
> +    }
> +    g_free(sysfspath);
> +    return ret;
> +#else
> +    return -ENOTSUP;
> +#endif
> +}
> +
>  static int hdev_get_max_segments(int fd, struct stat *st) {
>      return get_sysfs_long_val(fd, st, "max_segments");
>  }
> @@ -1885,6 +1944,7 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>      int64_t len = aiocb->aio_nbytes;
>      zone_op op = aiocb->zone_mgmt.op;
>  
> +    zone_model mod;
>      struct blk_zone_range range;
>      const char *ioctl_name;
>      unsigned long ioctl_op;
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 78cddeeda5..35e00afe8e 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -56,8 +56,8 @@ typedef enum zone_op {
>  } zone_op;
>  
>  typedef enum zone_model {
> -    BLK_Z_HM,
> -    BLK_Z_HA,
> +    BLK_Z_HM = 0x1,
> +    BLK_Z_HA = 0x2,
>  } zone_model;
>  
>  typedef enum BlkZoneCondition {


-- 
Damien Le Moal
Western Digital Research

