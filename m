Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C32315F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 12:33:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSfbQ-0007Us-Pc
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 06:33:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSfa4-0006ut-Sg
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSfa4-0001B1-1i
	for qemu-devel@nongnu.org; Mon, 20 May 2019 06:31:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hSfa3-0001Aj-SQ; Mon, 20 May 2019 06:31:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E26A0C13070F;
	Mon, 20 May 2019 10:31:33 +0000 (UTC)
Received: from [10.40.205.57] (unknown [10.40.205.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 239FE60BEC;
	Mon, 20 May 2019 10:31:25 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20190520081805.15019-1-kraxel@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <39fb4974-bd00-b2ff-65e4-89bb31e2973a@redhat.com>
Date: Mon, 20 May 2019 12:31:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190520081805.15019-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 20 May 2019 10:31:37 +0000 (UTC)
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
Cc: qemu-stable@nongnu.org, dgilbert@redhat.com,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/2019 10:18, Gerd Hoffmann wrote:
> s/kbd/tablet/, fixes cut+paste bug.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


