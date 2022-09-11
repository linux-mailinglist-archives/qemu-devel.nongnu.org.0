Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C85B4C43
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 07:58:04 +0200 (CEST)
Received: from localhost ([::1]:55714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXFyk-0008Ub-Uw
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 01:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFgQ-0000tl-1J
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:39:06 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXFgN-00074z-LU
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 01:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662874743; x=1694410743;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FhNP0zML3zfH5mySHKgnm8tLo+ZVGOBIphYfqU4Z8ZA=;
 b=Mgr3RnKHQh+MPAmWeuIVqAcvMzZb3G5Mp00fvpq0vdayX03kV2mqeUfi
 9LtZrOYwCFWNg22n63sAn1jtWGAkPpR39tWQAZiV9r1xCn5opwKUnhhpZ
 Ad3tI+GynmXKbG1ZA/Qe2UBRaOLOTYOJedizUeUqbLYSwV6BbsV9pZRGO
 mcy7NdJFpiWwdixK6w/IetzlouxL38/28ErpYwfS8t0u19eJXmqgNgHZW
 chvCXQE5Z5RAhpWRJiDd02mHjSgy3BoilZf36I31QQDvVj6R8fkcurraK
 kINsF2v2f0L7QecNNlRUB5cKDBg4mwgLZres05jlbe71Gr2t4mkrrgH6o A==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="211507505"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 13:38:56 +0800
IronPort-SDR: IdMXhOMhmGp9t8Ld7Ss1Tb+8xQE458nbysvf/dXV8xnrcy702m0cAN2UenNWHK1qWukHTX9rAe
 ZE85UWyl2PyTtHQLWckNpkTNIjVki9XU8+N0GHyZ9g4zyJaAZdlKxMoekYRZEqeB8x5eQUKSvt
 zhDNqnfvZtLIQ1t4ypI0gyuMZt5OZiBYr3OTEb21k/zSNS9ar557WoJQJd/JhDmsvOI05LVYX5
 LHgtvty/1tpARWTxquzJwEf8RakdWLQq7NX9X7D+mQflvMT8YNJSWzhCNnapnqT32IlbMLa/5X
 tO+eqiz+g6cmuJwY5kVbZTRs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 21:59:10 -0700
IronPort-SDR: 3ESWy8HjhGy0DRIOkYWq3ndUUa/W2h9Kt/NY7jc4E8rj0TgbPUuCDEHZ5+kVe5aWq3JU3IAOAN
 WMk/YIUmZyvej3qQJViDb2JBorwq9h5SUqBl/0k528tIaQCOAlyJxeHhzA/dxvvz0HD9NbQLs0
 iwI2bVzYn6+s2w/iRg0GM8DQVe78D6ysd5/ukqW0jIvalFqEAH8lDhxzruEJb16FCUKjFd5bqi
 y8bIaQWS/yKSGdw/GVlC+qWouDwREiMDTz25g2NzSx3z42x/mo9o0EX5z01sBTmMEFu3OWWFVw
 dT4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 22:38:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQJSF34ljz1RwvL
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 22:38:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662874732; x=1665466733; bh=FhNP0zML3zfH5mySHKgnm8tLo+ZVGOBIphY
 fqU4Z8ZA=; b=lnJ/AbxRDt2QByoL/fSx3pHXJoXUCwrqLGoJtn4OsWeQyV8wmRB
 6b6Zo+s70Uo6hbpon0iW/tSWTmFaN1W//Qtj/o6r9r+VG8mY3pxaCw+aRXoE+qs+
 5GMz/Gw03lgH4H+bbhO0jJ8zyT9NmraF/bni1bErKIw98aTy6CNsrKIXyAn2nOR8
 WmD6Jvzc8nwNwDtgnc94nn3e3EKuySew7+ci2Yi2v1MfmLDOeOBD0vRs8cNIb5ob
 9nch1QRDlQ6kPKM0ebslOJhg71YtohE/9oMDfuQXtdTwL5cVRKxee6lLzQrKTki6
 ciKVVMsoZnE0rAxPao0HPrkn7+W0LooCAJQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Oqvrcycj1RTK for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 22:38:52 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQJS94Pnyz1RvLy;
 Sat, 10 Sep 2022 22:38:49 -0700 (PDT)
Message-ID: <1058a61c-4b11-42c3-8f6c-a5296f8771d0@opensource.wdc.com>
Date: Sun, 11 Sep 2022 14:38:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 7/7] docs/zoned-storage: add zoned device documentation
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-8-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220910052759.27517-8-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
> Add the documentation about the zoned device support to virtio-blk
> emulation.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/zoned-storage.rst           | 41 ++++++++++++++++++++++++++
>  docs/system/qemu-block-drivers.rst.inc |  6 ++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 docs/devel/zoned-storage.rst
> 
> diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
> new file mode 100644
> index 0000000000..ead2d149cc
> --- /dev/null
> +++ b/docs/devel/zoned-storage.rst
> @@ -0,0 +1,41 @@
> +=============
> +zoned-storage
> +=============
> +
> +Zoned Block Devices (ZBDs) devide the LBA space into block regions called zones
> +that are larger than the LBA size. It can only allow sequential writes, which

s/It/They

> +reduces write amplification in SSDs, leading to higher throughput and increased
> +capacity. More details about ZBDs can be found at:

I would rephrase this like this, to be less assertive about the potential
benefits (as they depend on the vendor implementation):

..., which can reduce write amplification in SSDs, and potentially lead to
higher throughput and increased device capacity.

> +
> +https://zonedstorage.io/docs/introduction/zoned-storage
> +
> +1. Block layer APIs for zoned storage
> +-------------------------------------
> +QEMU block layer has three zoned storage model:
> +- BLK_Z_HM: This model only allows sequential writes access. It supports a set
> +of ZBD-specific I/O request that used by the host to manage device zones.
> +- BLK_Z_HA: It deals with both sequential writes and random writes access.
> +- BLK_Z_NONE: Regular block devices and drive-managed ZBDs are treated as
> +non-zoned devices.
> +
> +The block device information resides inside BlockDriverState. QEMU uses
> +BlockLimits struct(BlockDriverState::bl) that is continuously accessed by the
> +block layer while processing I/O requests. A BlockBackend has a root pointer to
> +a BlockDriverState graph(for example, raw format on top of file-posix). The
> +zoned storage information can be propagated from the leaf BlockDriverState all
> +the way up to the BlockBackend. If the zoned storage model in file-posix is
> +set to BLK_Z_HM, then block drivers will declare support for zoned host device.
> +
> +The block layer APIs support commands needed for zoned storage devices,
> +including report zones, four zone operations, and zone append.
> +
> +2. Emulating zoned storage controllers
> +--------------------------------------
> +When the BlockBackend's BlockLimits model reports a zoned storage device, users
> +like the virtio-blk emulation or the qemu-io-cmds.c utility can use block layer
> +APIs for zoned storage emulation or testing.
> +
> +For example, the command line for zone report testing a null_blk device of
> +qemu-io-cmds.c is:
> +$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c
> +"zrp offset nr_zones"
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index dfe5d2293d..0b97227fd9 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -430,6 +430,12 @@ Hard disks
>    you may corrupt your host data (use the ``-snapshot`` command
>    line option or modify the device permissions accordingly).
>  
> +Zoned block devices
> +  Zoned block devices can be passed through to the guest if the emulated storage
> +  controller supports zoned storage. Use ``--blockdev zoned_host_device,
> +  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
> +  as ``drive0``.
> +
>  Windows
>  ^^^^^^^
>  

-- 
Damien Le Moal
Western Digital Research


