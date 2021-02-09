Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9677315469
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:53:49 +0100 (CET)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WGq-00018x-4M
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9WDW-0007o0-7O
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9WDU-00072m-7t
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612889418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rN9oijVzT8IZ/d5kgQHkocFMMkn7eeYFry4bcBZvw3M=;
 b=gqjRC3vIrT7XhTPHie8f4tMHQkMRdx78A9GhApHSG28U3bETcIWqShlnUTeMmTB7Guwsoi
 Kk2l12D0SWqVEua7GOpu7SnfAfmMhJBD5xPBUMO3ldC0SIAyAlBSmguS77ALafI9nwK8/Q
 uK/Zl+BqpuDrcnDItNIzbA29SGJ1Lpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-O1OkNVb1PHyyJ5EI-LG7Mw-1; Tue, 09 Feb 2021 11:50:14 -0500
X-MC-Unique: O1OkNVb1PHyyJ5EI-LG7Mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48E9E56AA6;
 Tue,  9 Feb 2021 16:50:13 +0000 (UTC)
Received: from [10.36.112.23] (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5435D60C04;
 Tue,  9 Feb 2021 16:50:01 +0000 (UTC)
Subject: Re: [PATCH 2/2] virtio-net: add missing object_unref()
To: qemu-devel@nongnu.org
References: <20210206123955.2196514-1-lvivier@redhat.com>
 <20210206123955.2196514-3-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <49622ba7-fdf4-8bbb-282e-747a7a13c34b@redhat.com>
Date: Tue, 9 Feb 2021 17:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210206123955.2196514-3-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, jfreimann@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Michael

On 06/02/2021 13:39, Laurent Vivier wrote:
> failover_add_primary() calls qdev_device_add() and doesn't unref
> the device. Because of that, when the device is unplugged a reference
> is remaining and prevents the cleanup of the object.
> 
> This prevents to be able to plugin back the failover primary device,
> with errors like:
> 
>   (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>   (qemu) device_del hostdev0
> 
> We can check with "info qtree" and "info pci" that the device has been removed, and then:
> 
>   (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
>   Error: vfio 0000:41:00.0: device is already attached
>   (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
>   qemu-kvm: Duplicate ID 'hostdev0' for device
> 
> Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
> Cc: quintela@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/net/virtio-net.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 5150f295e8c5..1c5af08dc556 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -862,6 +862,8 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
>          dev = qdev_device_add(opts, &err);
>          if (err) {
>              qemu_opts_del(opts);
> +        } else {
> +            object_unref(OBJECT(dev));
>          }
>      } else {
>          error_setg(errp, "Primary device not found");
> 


