Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F26323F71
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:19:38 +0100 (CET)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvwv-0005yR-Rc
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEvZK-0006LK-EE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEvZH-0007EI-R7
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614178511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hv0d6qApcby5AU66AWw5uJi1UUuZiMgY2W9bjtDU2vM=;
 b=hX0GOLrQ0RyBimKDG4f3adJdjCENdleFN+Dh25OffKUJNiI/YAp/AsPTyMUPGhQcnCsKTb
 P6F96NUe2fcZG/2KOoxFndYb8bmh9zYJmtgNf/jVHkPwIcrs3mUAbxnSy7v8n9WFkOIzqV
 pPMlI9FK0ExjLlnnfGZVrgrNuRxQ1o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-DRIaHe2gNoOoXdRdtTcU4A-1; Wed, 24 Feb 2021 09:55:07 -0500
X-MC-Unique: DRIaHe2gNoOoXdRdtTcU4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 013E311404D6;
 Wed, 24 Feb 2021 14:20:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-142.ams2.redhat.com [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF4845D6A8;
 Wed, 24 Feb 2021 14:19:38 +0000 (UTC)
Subject: Re: [PATCH 09/14] hw/ide: remove 'ide-drive' device
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-10-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <93690d57-533c-4280-fdae-1421fde32740@redhat.com>
Date: Wed, 24 Feb 2021 15:19:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-10-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2021 14.11, Daniel P. Berrangé wrote:
> The 'ide-hd' and 'ide-cd' devices provide suitable alternatives.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/qdev-device-use.txt         |  2 +-
>   docs/system/deprecated.rst       |  6 -----
>   docs/system/removed-features.rst |  9 ++++++++
>   hw/i386/pc.c                     |  1 -
>   hw/ide/qdev.c                    | 38 --------------------------------
>   hw/ppc/mac_newworld.c            | 13 -----------
>   hw/ppc/mac_oldworld.c            | 13 -----------
>   hw/sparc64/sun4u.c               | 14 ------------
>   scripts/device-crash-test        |  1 -
>   softmmu/vl.c                     |  1 -
>   tests/qemu-iotests/051           |  2 --
>   tests/qemu-iotests/051.pc.out    | 10 ---------
>   12 files changed, 10 insertions(+), 100 deletions(-)
> 
> diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
> index 245cdf29c7..2408889334 100644
> --- a/docs/qdev-device-use.txt
> +++ b/docs/qdev-device-use.txt
> @@ -388,7 +388,7 @@ type.
>   some DEVNAMEs:
>   
>       default device      suppressing DEVNAMEs
> -    CD-ROM              ide-cd, ide-drive, ide-hd, scsi-cd, scsi-hd
> +    CD-ROM              ide-cd, ide-hd, scsi-cd, scsi-hd
>       floppy              floppy, isa-fdc
>       parallel            isa-parallel
>       serial              isa-serial
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index c69887dca8..f5c82a46dc 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -242,12 +242,6 @@ this CPU is also deprecated.
>   System emulator devices
>   -----------------------
>   
> -``ide-drive`` (since 4.2)
> -'''''''''''''''''''''''''
> -
> -The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
> -'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
> -
>   ``scsi-disk`` (since 4.2)
>   '''''''''''''''''''''''''
>   
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index 870a222062..8fd3fafb32 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -213,6 +213,15 @@ This machine has been renamed ``fuloong2e``.
>   These machine types were very old and likely could not be used for live
>   migration from old QEMU versions anymore. Use a newer machine type instead.
>   
> +System emulator devices
> +-----------------------
> +
> +``ide-drive`` (removed in 6.0)
> +''''''''''''''''''''''''''''''
> +
> +The 'ide-drive' device has been removed. Users should use 'ide-hd' or
> +'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
> +
>   Related binaries
>   ----------------
>   
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8aa85dec54..828122e21e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -342,7 +342,6 @@ GlobalProperty pc_compat_1_4[] = {
>       { "scsi-disk", "discard_granularity", "0" },
>       { "ide-hd", "discard_granularity", "0" },
>       { "ide-cd", "discard_granularity", "0" },
> -    { "ide-drive", "discard_granularity", "0" },
>       { "virtio-blk-pci", "discard_granularity", "0" },
>       /* DEV_NVECTORS_UNSPECIFIED as a uint32_t string: */
>       { "virtio-serial-pci", "vectors", "0xFFFFFFFF" },
> diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
> index 8cd19fa5e9..e70ebc83a0 100644
> --- a/hw/ide/qdev.c
> +++ b/hw/ide/qdev.c
> @@ -283,20 +283,6 @@ static void ide_cd_realize(IDEDevice *dev, Error **errp)
>       ide_dev_initfn(dev, IDE_CD, errp);
>   }
>   
> -static void ide_drive_realize(IDEDevice *dev, Error **errp)
> -{
> -    DriveInfo *dinfo = NULL;
> -
> -    warn_report("'ide-drive' is deprecated, "
> -                "please use 'ide-hd' or 'ide-cd' instead");
> -
> -    if (dev->conf.blk) {
> -        dinfo = blk_legacy_dinfo(dev->conf.blk);
> -    }
> -
> -    ide_dev_initfn(dev, dinfo && dinfo->media_cd ? IDE_CD : IDE_HD, errp);
> -}

I wonder whether we now could also make the "media" parameter of "-drive" as 
deprecated?

Anyway, for this patch:
Reviewed-by: Thomas Huth <thuth@redhat.com>


