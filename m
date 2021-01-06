Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B22EBF4C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 15:09:20 +0100 (CET)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx9V1-0002bS-Dr
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 09:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx9TO-0001qj-PO
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx9TK-0007bb-ON
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609942053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Okjv9WQqSNyrIa21ExztnynhLifNVac34GIp1dK124U=;
 b=THULNcJI3gW01ADhLHwIcxgDgqVDJeOuB/KW1Urio/lLrnztT9Vi92VDU3O0CMFdn82nyR
 Dt4xU4/RjBXrqw28qaVegfSeQu5EoloTuLuNCDPgLMDe4kdGJdMOHbDgDNsH67V3dSES5s
 pBb5AGodHn2eP9SZc+k2qVw9trVQ7i4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-E3fYobC_NmuxvKprxONqyg-1; Wed, 06 Jan 2021 09:07:32 -0500
X-MC-Unique: E3fYobC_NmuxvKprxONqyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08E77107ACE3;
 Wed,  6 Jan 2021 14:07:31 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40523608DB;
 Wed,  6 Jan 2021 14:07:20 +0000 (UTC)
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201210172834.178052-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7cf4d5fc-651a-eac5-6678-1ce49b68f087@redhat.com>
Date: Wed, 6 Jan 2021 15:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210172834.178052-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 18.28, Philippe Mathieu-Daudé wrote:
> Replace I/O write error reported with error_report() by
> qemu_log_mask(GUEST_ERROR) which allow filtering.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/virtio/virtio-pci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index f863f69ede4..094c36aa3ea 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -27,6 +27,7 @@
>   #include "hw/qdev-properties.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
> +#include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "hw/pci/msi.h"
>   #include "hw/pci/msix.h"
> @@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>           virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>           break;
>       default:
> -        error_report("%s: unexpected address 0x%x value 0x%x",
> -                     __func__, addr, val);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: unexpected address 0x%x value 0x%x\n",
> +                      __func__, addr, val);
>           break;
>       }
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


