Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6F5F9854
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 08:29:04 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmHf-0005zy-5T
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 02:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1ohm8R-0005p0-3G; Mon, 10 Oct 2022 02:19:31 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:51408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1ohm8O-0006dE-Pd; Mon, 10 Oct 2022 02:19:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05F4C218B5;
 Mon, 10 Oct 2022 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665382767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHSq3lnV1ntb+gBs+uDHec2XALzRAzjJrFF+tPmpPck=;
 b=BNadTHmaan/y7lGEfNQXxpbPqP9ltoZ+OOzoh3gm1pe3TEQsF90P9YwoYjGfsi7g/7wwls
 k54G5XrSQlhVh7xwPh6hZc5n2uRoJUkyJyMA+HWqZT2ZjMNOSUFeW/i7kcFo4e/6HRMSD5
 nmbDrZ91bTkIYVY1trIHhMIwAwBnNLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665382767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHSq3lnV1ntb+gBs+uDHec2XALzRAzjJrFF+tPmpPck=;
 b=YE7bg+NbLS2qSuHRY4Ij6LcBHUfcy3fU0GBg7cpJCYmdm5797kvvesYStROZP3FFpqvb8q
 EAJr+sTsrDd8wICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0214E13479;
 Mon, 10 Oct 2022 06:19:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SsE6OW25Q2N2OgAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 10 Oct 2022 06:19:25 +0000
Message-ID: <976d2b9d-1059-7256-5d5d-0a127293d88a@suse.de>
Date: Mon, 10 Oct 2022 08:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v11 7/7] docs/zoned-storage: add zoned device documentation
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com
References: <20221010022116.41942-1-faithilikerun@gmail.com>
 <20221010022116.41942-8-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20221010022116.41942-8-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.934,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/22 04:21, Sam Li wrote:
> Add the documentation about the zoned device support to virtio-blk
> emulation.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   docs/devel/zoned-storage.rst           | 40 ++++++++++++++++++++++++++
>   docs/system/qemu-block-drivers.rst.inc |  6 ++++
>   2 files changed, 46 insertions(+)
>   create mode 100644 docs/devel/zoned-storage.rst
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

divide

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
> +of ZBD-specific I/O request that used by the host to manage device zones.

Maybe:
This model only allow for sequential write access to zones. It supports 
ZBD-specific I/O requests to manage device zones.

> +- BLK_Z_HA: It deals with both sequential writes and random writes access.

Maybe better:
This model allows sequential and random writes to zones. It supports 
ZBD-specific I/O requests to manage device zones.

> +- BLK_Z_NONE: Regular block devices and drive-managed ZBDs are treated as
> +non-zoned devices.

Maybe:
This is the default model with no zones support; it includes both 
regular and drive-managed ZBD devices. ZBD-specific I/O requests are not 
supported.

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
>     you may corrupt your host data (use the ``-snapshot`` command
>     line option or modify the device permissions accordingly).
>   
> +Zoned block devices
> +  Zoned block devices can be passed through to the guest if the emulated storage
> +  controller supports zoned storage. Use ``--blockdev zoned_host_device,
> +  node-name=drive0,filename=/dev/nullb0`` to pass through ``/dev/nullb0``
> +  as ``drive0``.
> +
>   Windows
>   ^^^^^^^
>   

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman


