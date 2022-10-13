Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A65FD3F6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 06:49:59 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiqAQ-0003ZU-8d
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 00:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oiq8K-0001sl-0m
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 00:47:48 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:47666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oiq8I-0005DT-4U
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 00:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665636466; x=1697172466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aAepVh+sFQd+yz6DuCltUbY3VpwpKo+aZbIRx5d3SeA=;
 b=TSZdTir5oujtJy6BSruHvL+ykP2UU1Djuc64q/08ZbTBNIK4oiRqJC+I
 WSRYAyaSBqs2BjyHNDyNnzMVD2kYd5gQLzfei3UHqwKjVr5bKpmoo9p/d
 qZk3VoUwwfFr7zQkW6gNJI36yhFUVYUolhM11bqVFfGAgYcE9TCUfEvL3
 BRYmjYwaxq9W/QpRZc98zGPFy7JZNovmO7BPvd1QmLkDeQECoFgAsZTrr
 513bBeILgzlhoNTTVS/zona3lA9rhfZCrDVbVYkPwNrc3HbrUWCw+egN3
 PytJXfACDVUmu2l3BRicJb4oFiTqjOUszeVar1z6A+H9gx3CufOuMuAM7 A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="213673651"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 12:47:41 +0800
IronPort-SDR: ZB1pWcitKl758dihGHsIufyzFCDZoYAZf6e1EstbSnZaZ1obKLQH96GRy8UQHALF0nPdTOVp0H
 2E1X5G9bNnJmqWT06NEEN0Wcy3KLcYq114vgSzuqXcYsokgJGmL0eMTCjgbdY+2f2Ctk2Tgc5t
 D72g6Y8tqXDBqZulo7yNRejTUlfX0j5lsin8jG+4kCOofG3p7TbeYDMjfaudkwdSNSPV7FJce7
 oy8Xo4lWA1W3NnAZCiRv1kPgl8ua2iXtLBSb67v3JhpO5A1P2K0BDtN3p6KYXlM6XaFewVlAL5
 lNbfIOkIx5vzHdAtutqXp++i
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 21:01:42 -0700
IronPort-SDR: DIOW5+stp7er9N02kPNf0EvIOAno70zRseZLJC+6Gya8ZZn8VIpe0Gqv5AedwzabV0t0NjGHgB
 rZjaik5jpki1Psgu6klJUHPhfUFzwUBvlHCbf43J2aPm+OKfgU1IpYHPg8IHcdi/SOeeKCQQgY
 v9E/KOr1jd2nG0iow1BTKpEGf6ZRXwIkVqvJW/ad0f+3Fi0mCBm9wQZwBeoYBhb50+RkfhLB/Z
 92GvE0/Ew1W6u87GA6QFaxT0ilKMTBq+vVB/u0wpsyBR0BWfctaAXN6z0FUVSkKOwwkZuxuT+a
 mIM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 21:47:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MnxpP0Zcsz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 21:47:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665636460; x=1668228461; bh=aAepVh+sFQd+yz6DuCltUbY3VpwpKo+aZbI
 Rx5d3SeA=; b=LYP+NSpYvqy8I2jbYcX0/HA9bHunk92+lO+gagADoGQncxAPLm7
 +yYMFqPsykp0LtsrvpfUSVKDJaR9yhnSngFxgq2EQdlcZZfob3hZgS4s2XvOV8ke
 baoZQM62DEy4vyvAPf/sCTpoyDisdSNAAd92PlMvR2MjGYHa+3xsrGGyg8PT9rt5
 eYXNFCIhjUflUkERGK0fpdg4WqxsWjawzbVQGsuxCfbXw7P2HPaNgiixjJOO09uD
 XzrwbAtPdoOaatYlkDWUBfbjjoLpzB2B02nwqVXJ55EfKxFAxCvVxmBAuEv4q691
 3DjvsJFUw442G5mJOBDcZtJoTEy0vXfGqKQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Fyh0Jv9w9o75 for <qemu-devel@nongnu.org>;
 Wed, 12 Oct 2022 21:47:40 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MnxpK5qK8z1RvLy;
 Wed, 12 Oct 2022 21:47:37 -0700 (PDT)
Message-ID: <8525ebed-2f6b-fb2b-797d-29b741a9f498@opensource.wdc.com>
Date: Thu, 13 Oct 2022 13:47:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 7/7] docs/zoned-storage: add zoned device documentation
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, hare@suse.de
References: <20221010022116.41942-1-faithilikerun@gmail.com>
 <20221010022116.41942-8-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20221010022116.41942-8-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2788b627a=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/10/22 11:21, Sam Li wrote:
> Add the documentation about the zoned device support to virtio-blk
> emulation.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/zoned-storage.rst           | 40 ++++++++++++++++++++++++++
>  docs/system/qemu-block-drivers.rst.inc |  6 ++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 docs/devel/zoned-storage.rst
> 
> diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
> new file mode 100644
> index 0000000000..deaa4ce99b
> --- /dev/null
> +++ b/docs/devel/zoned-storage.rst
> @@ -0,0 +1,40 @@
> +=============
> +zoned-storage
> +=============
> +
> +Zoned Block Devices (ZBDs) devide the LBA space into block regions called zones
> +that are larger than the LBA size. They can only allow sequential writes, which
> +can reduce write amplification in SSDs, and potentially lead to higher
> +throughput and increased capacity. More details about ZBDs can be found at:
> +
> +https://zonedstorage.io/docs/introduction/zoned-storage
> +
> +1. Block layer APIs for zoned storage
> +-------------------------------------
> +QEMU block layer has three zoned storage model:
> +- BLK_Z_HM: This model only allows sequential writes access. It supports a set

- BLK_Z_HM: The host-managed zoned model...

> +of ZBD-specific I/O request that used by the host to manage device zones.

...of ZBD-specific commands that can be used by a host to manage the
zones of a device.

> +- BLK_Z_HA: It deals with both sequential writes and random writes access.

- BLK_Z_HA: The host-aware zoned model allows random write operations in
zones, making it backward compatible with regular block devices.

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
> +For example, to test zone_report on a null_blk device using qemu-io is:
> +$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
> +-c "zrp offset nr_zones"
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

With the above nits fixed, feel free to add:

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research


