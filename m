Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDF22F91
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 10:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSe86-00006H-J2
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 04:58:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hSe6z-000882-CI
	for qemu-devel@nongnu.org; Mon, 20 May 2019 04:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hSe6w-0000Oy-AM
	for qemu-devel@nongnu.org; Mon, 20 May 2019 04:57:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1hSe6w-0000Br-55; Mon, 20 May 2019 04:57:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25889149A2;
	Mon, 20 May 2019 08:57:15 +0000 (UTC)
Received: from work-vm (ovpn-116-127.ams2.redhat.com [10.36.116.127])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F93D60CA4;
	Mon, 20 May 2019 08:57:07 +0000 (UTC)
Date: Mon, 20 May 2019 09:57:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, lvivier@redhat.com
Message-ID: <20190520085704.GB2726@work-vm>
References: <20190520081805.15019-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520081805.15019-1-kraxel@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 20 May 2019 08:57:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] usb-tablet: fix serial compat property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> s/kbd/tablet/, fixes cut+paste bug.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 5d046a43e3d2..eb34f53a85b0 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -36,7 +36,7 @@ GlobalProperty hw_compat_3_1[] = {
>      { "tpm-tis", "ppi", "false" },
>      { "usb-kbd", "serial", "42" },
>      { "usb-mouse", "serial", "42" },
> -    { "usb-kbd", "serial", "42" },
> +    { "usb-tablet", "serial", "42" },
>      { "virtio-blk-device", "discard", "false" },
>      { "virtio-blk-device", "write-zeroes", "false" },
>  };
> -- 
> 2.18.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

