Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141A5B4C4B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 08:05:53 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXG6J-0004Rn-Vb
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 02:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFcL-0006jV-MC
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:34:53 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:49493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFcG-0006Rc-8h
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662874487; x=1694410487;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qrbggs0Lrsm2P+8kQ9wLzQzB3yzaP9Q3QV4Rh10KEr0=;
 b=esDhkaVsR6EeLqANR57Y/FU1ou4iJhDRPfcz8JsVvlTB8cdl34FMYdWA
 EaBBaHJC4jOnYVH99wgxGboAezBM/J//ZkGAZ+NoIXfXkk535VCBfUiIJ
 e0FZGSz17t5B5zlP7nd+ulC4LPwwBF5NG8o0at63S4shviIq4P8NsWVDZ
 Nk3p3SNF+kRjW46FvF6wKsViwuCPFHdXSTDl47aM4g78x0IG2CEcdLVF4
 v+bRz+5jmTl80ysBA+0gXW2bjutb4pI3G1NuuSxDKkijUGbeqvwM2hDhb
 lt/hqrNtaIWAGm9vWUq0YrIjhrz6obMhQKmq0dG+VR5Ofo3+j4Y8Dp2BV w==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="211036548"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 13:34:46 +0800
IronPort-SDR: tmjre0SpFuR5mSjRuucos0qzgCPNRfGwTwYipP+mMuUNJ9EwBWiPUA6mJytNEtKtQ3X417gMs4
 7IQNXwFtnokjapA3wYiG2Py3WnQPaOTz5f+7fZmRjCKQJHYy+gb1gzkNHf+kzlt/uuQZEF1RSt
 5BySAcDgDVFj1JTX4eKJnRr19aYYkj9WHciwhluDEreJG80MPhf+lQRDV/7RBY3dufnRRBC4i+
 M+Uwfn0F2sYmw2PlpynPJfT57/L9C5zmL5dwdiYwFiwLLNNemcBsedHPhoHsMtuBk+GRlA3qEz
 i2hoYbcd4Iijpeodr+D32tZ5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 21:55:03 -0700
IronPort-SDR: iETHTBPnIwqmpTiYdpf657z/CjUbm9KD5dr7MO2eFmtflcEZsZeGsuyQ8W1QPzXQoHxYFY6RdL
 2wCa0BWyHtodMhFN/zI9MNm9xoQmgAEnemt4Jg1/J383XYDNwKCsA4pYtIouyB3vYvDSvAqNOW
 3EMvIjaHdKP8JWJdC314L82odi1bksvS/UPBtGYCAjua53fE18O1GfISGFcJV9yH3BL39z+pYi
 tpLhrVNNc0SEZkFtU5o+qshAb5TfckJNSKO15TnQbdR8gXXofeNUYTcT3v5qb33OtY3IAQQzyQ
 Wr4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 22:34:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQJMT6wcDz1Rwtm
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 22:34:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662874485; x=1665466486; bh=Qrbggs0Lrsm2P+8kQ9wLzQzB3yzaP9Q3QV4
 Rh10KEr0=; b=tfAwxSmxs97JovxS5wsPA+fTGfR8Kt9zZcrxcTQAGJmxb5a4C6N
 CuZnQij0M2qCyUjF1FvYDKbQV22nOSA1mYkVDOBmahQxZOk25q6uHj0RFd9oM/Wf
 Sb0/0KrqcafsnDASJBeGctJBbYVCG5PWb9rXmz4O75niqKG/mOWJHSYNNGdEx5E3
 1cQUF+h07oLR3XXY+DUHQGJwFgbpKT0p3LnKQEQTYLHqXcfGF4vpILXoABycvCRC
 CujRDRvbfmsifoocp46qfWiMKyNw+TK/zymSc0wCoMm/bQIuJTYr0kdHmQE5JOWx
 9fIhYMr4SNZZz4sOXlMg9xIw4ti5EepgBKg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nEi7USKd-RE1 for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 22:34:45 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQJMQ4QbZz1RvLy;
 Sat, 10 Sep 2022 22:34:42 -0700 (PDT)
Message-ID: <99fd65d9-a44d-5ff6-f646-9121f1874480@opensource.wdc.com>
Date: Sun, 11 Sep 2022 14:34:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 5/7] config: add check to block layer
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-6-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220910052759.27517-6-faithilikerun@gmail.com>
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

On 2022/09/10 14:27, Sam Li wrote:
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block.c                          | 14 ++++++++++++++
>  block/file-posix.c               | 14 ++++++++++++++
>  block/raw-format.c               |  1 +
>  include/block/block_int-common.h |  5 +++++
>  4 files changed, 34 insertions(+)
> 
> diff --git a/block.c b/block.c
> index bc85f46eed..dad2ed3959 100644
> --- a/block.c
> +++ b/block.c
> @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
>          return;
>      }
>  
> +    /*
> +     * Non-zoned block drivers do not follow zoned storage constraints
> +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
> +     * drivers in a graph.
> +     */
> +    if (!parent_bs->drv->supports_zoned_children &&
> +        child_bs->bl.zoned == BLK_Z_HM) {

Shouldn't this be "child_bs->bl.zoned != BLK_Z_NONE" ?

> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->bl.zoned == BLK_Z_HM ? "zoned" : "non-zoned",
> +                   parent_bs->drv->supports_zoned_children ?
> +                   "support zoned children" : "not support zoned children");
> +        return;
> +    }
> +
>      if (!QLIST_EMPTY(&child_bs->parents)) {
>          error_setg(errp, "The node %s already has a parent",
>                     child_bs->node_name);
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 4edfa25d04..354de22860 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -779,6 +779,20 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>              goto fail;
>          }
>      }
> +#ifdef CONFIG_BLKZONED
> +    /*
> +     * The kernel page chache does not reliably work for writes to SWR zones
> +     * of zoned block device because it can not guarantee the order of writes.
> +     */
> +    if (strcmp(bs->drv->format_name, "zoned_host_device") == 0) {
> +        if (!(s->open_flags & O_DIRECT)) {
> +            error_setg(errp, "driver=zoned_host_device was specified, but it "
> +                             "requires cache.direct=on, which was not specified.");
> +            ret = -EINVAL;

This line is not needed. Simply "return -EINVAL;".

> +            return ret; /* No host kernel page cache */
> +        }
> +    }
> +#endif
>  
>      if (S_ISBLK(st.st_mode)) {
>  #ifdef BLKDISCARDZEROES
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 6b20bd22ef..9441536819 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
>  BlockDriver bdrv_raw = {
>      .format_name          = "raw",
>      .instance_size        = sizeof(BDRVRawState),
> +    .supports_zoned_children = true,
>      .bdrv_probe           = &raw_probe,
>      .bdrv_reopen_prepare  = &raw_reopen_prepare,
>      .bdrv_reopen_commit   = &raw_reopen_commit,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 078ddd7e67..043aa161a0 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -127,6 +127,11 @@ struct BlockDriver {
>       */
>      bool is_format;
>  
> +    /*
> +     * Set to true if the BlockDriver supports zoned children.
> +     */
> +    bool supports_zoned_children;
> +
>      /*
>       * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
>       * this field set to true, except ones that are defined only by their

-- 
Damien Le Moal
Western Digital Research


