Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FE33B291
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:25:38 +0100 (CET)
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmHx-0000n9-BA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLmEN-0007lJ-6g
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLmEI-0000CJ-Fd
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615810908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfzfLcNzfyAOX7f3UvVAPyMNnB0W916HNhhRnbFCry4=;
 b=i4/NgvaWFWhpREICc+oodvxI82xAVnGheQlKK+I9LWS5eqiltz9AH3w7qpZbUw9pLC3+yg
 hpM+kN4xXeEgxjpvGqTs49rQwHZ8LsQAYOooTKH+DAoo3oMdy5I06RICb6CR0Mr+heUUv5
 fvjPIlOwjcwCjE5DdlHE1/I1+OPSSxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-WrVLc67tOU-ob5sxhMEwlA-1; Mon, 15 Mar 2021 08:21:47 -0400
X-MC-Unique: WrVLc67tOU-ob5sxhMEwlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65C3519067E0;
 Mon, 15 Mar 2021 12:21:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4345C8AA;
 Mon, 15 Mar 2021 12:21:24 +0000 (UTC)
Subject: Re: [PATCH 10/14] hw/scsi: remove 'scsi-disk' device
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-11-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <73ae7d63-c10b-2638-00c1-9aa4e055d3d0@redhat.com>
Date: Mon, 15 Mar 2021 13:21:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-11-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
> The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/system/deprecated.rst       |  9 -----
>   docs/system/removed-features.rst |  6 ++++
>   hw/i386/pc.c                     |  1 -
>   hw/scsi/scsi-disk.c              | 62 --------------------------------
>   hw/sparc64/sun4u.c               |  1 -
>   scripts/device-crash-test        |  1 -
>   tests/qemu-iotests/051           |  2 --
>   tests/qemu-iotests/051.pc.out    | 10 ------
>   8 files changed, 6 insertions(+), 86 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index f5c82a46dc..cb88fea94f 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -239,15 +239,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>   this CPU is also deprecated.
>   
> -System emulator devices
> ------------------------
> -
> -``scsi-disk`` (since 4.2)
> -'''''''''''''''''''''''''
> -
> -The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
> -'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
> -
>   System emulator machines
>   ------------------------
>   
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index 8fd3fafb32..bb6bc8dfc8 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -222,6 +222,12 @@ System emulator devices
>   The 'ide-drive' device has been removed. Users should use 'ide-hd' or
>   'ide-cd' as appropriate to get an IDE hard disk or CD-ROM as needed.
>   
> +``scsi-disk`` (removed in 6.0)
> +''''''''''''''''''''''''''''''
> +
> +The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
> +'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.

s/is deprecated/has been removed/

> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index d7c27144ba..cda7df36e3 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -749,7 +749,6 @@ static char *sun4u_fw_dev_path(FWPathProvider *p, BusState *bus,
>                                  DeviceState *dev)
>   {
>       PCIDevice *pci;
> -    int bus_id;
>   
>       if (!strcmp(object_get_typename(OBJECT(dev)), "pbm-bridge")) {
>           pci = PCI_DEVICE(dev);

Please squash this hunk into the 'ide-drive' patch instead.

With the two nits fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


