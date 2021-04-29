Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4136EF50
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 20:06:34 +0200 (CEST)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcB3Y-0007vb-N9
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 14:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lcB1L-00070n-UJ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 14:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lcB1F-00038E-BQ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 14:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619719448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kjDS+KrbfFoM5P37fRkEddgeJmivGpq36JSQRKXg1KY=;
 b=Q6AwjIBchi5AO6ZCizvJi0KnbprYsDnsLFHxOImgjKWLK8VLdjmXBhoW2NVy6EFrPJlytI
 6Ivx2PSXgqgyneYUOXh6WpOm4XsqpL1FNqH/8EO5qXNLUusLHyD8BqRWx7h8jqrc6tiy4U
 9jiJVSN+Y2UMK0D28W2QSZhsZ+VXKO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-oHloBzMCPbGMR4ypzMWYmQ-1; Thu, 29 Apr 2021 14:04:04 -0400
X-MC-Unique: oHloBzMCPbGMR4ypzMWYmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 334071006C87;
 Thu, 29 Apr 2021 18:04:03 +0000 (UTC)
Received: from localhost (ovpn-115-66.phx2.redhat.com [10.3.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86A4F5B6A2;
 Thu, 29 Apr 2021 18:03:53 +0000 (UTC)
Date: Thu, 29 Apr 2021 14:03:52 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
References: <20210429155221.1226561-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429155221.1226561-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 04:52:21PM +0100, Stefan Hajnoczi wrote:
> The scsi=on|off property was deprecated in QEMU 5.0 and can be removed
> completely at this point.
> 
> Drop the scsi=on|off option. It was only available on Legacy virtio-blk
> devices. Linux v5.6 already dropped support for it.
> 
> Remove the hw_compat_2_4[] property assignment since scsi=on|off no
> longer exists. Old guests with Legacy virtio-blk devices no longer see
> the SCSI host features bit.
> 

This means pc-2.4 will now break guest ABI if using virtio-blk
devices, correct?

This looks like a sign we should have deprecated pc-2.4 a long
time ago.

> Live migrating old guests from an old QEMU with the SCSI feature bit
> enabled will fail with "Features 0x... unsupported. Allowed features:
> 0x...". We've followed the QEMU deprecation policy so users have been
> warned...
> 

Were they really warned, though?  People running
"-machine pc-i440fx-2.4" might be completely unaware that it was
silently enabling a deprecated feature.

Can we have this documented in a more explicit way?  Maybe just a
comment at hw_compat_2_4 would be enough, to warn people doing
backports and rebases downstream.

Can we make QEMU refuse to start if using pc-2.4 + virtio-blk
together, just to be sure?

An alternative would be keeping the property (and the
hw_compat_2_4 entry) just to keep pc-2.4 working (until pc-2.4 is
deprecated and removed), but refusing to realize the device if
the feature is enabled.


> I have tested that libvirt still works when the property is absent. It
> no longer adds scsi=on|off to the command-line.
> 
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Peter Krempa <pkrempa@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
[...]
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 40def78183..286f18ec6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -194,8 +194,6 @@ GlobalProperty hw_compat_2_5[] = {
>  const size_t hw_compat_2_5_len = G_N_ELEMENTS(hw_compat_2_5);
>  
>  GlobalProperty hw_compat_2_4[] = {
> -    /* Optional because the 'scsi' property is Linux-only */
> -    { "virtio-blk-device", "scsi", "true", .optional = true },
>      { "e1000", "extra_mac_registers", "off" },
>      { "virtio-pci", "x-disable-pcie", "on" },
>      { "virtio-pci", "migrate-extra", "off" },


-- 
Eduardo


