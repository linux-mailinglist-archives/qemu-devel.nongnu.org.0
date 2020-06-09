Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E031F3FB7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 17:44:31 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jigQQ-0006JG-Ng
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 11:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jigPZ-0005hf-J5
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 11:43:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57730
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jigPY-000849-BF
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 11:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591717414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRmjfmkMxGqT4672IGd0grKjqidHW3uJy3oHFVP8n2M=;
 b=Y3wbkWHsD9/4H54NQhdOXyeuyehkNlBuk0uouA+qlmLfyBAwVLFGKiVAax3NXcPG6z5rFK
 HDO8hKzu0MJHBGniU7/c9aHq7aIaFgQRenw1GM6jmvhQWCNpOfGHFIuHDWH/P6VE4zpw/q
 ZEiM0yVQMsRJdEOWYsAFrcv6jMzmoKE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-3H8O4SjRMGadqKEG3F1mng-1; Tue, 09 Jun 2020 11:43:33 -0400
X-MC-Unique: 3H8O4SjRMGadqKEG3F1mng-1
Received: by mail-wr1-f72.google.com with SMTP id p10so8787932wrn.19
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 08:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uRmjfmkMxGqT4672IGd0grKjqidHW3uJy3oHFVP8n2M=;
 b=BGYUwHZdzv30hGmnYXDO35YH+EbipXbCBg3NB0TnR3P6a7/4pe0DnBe9FwcM7lhOCn
 54FRQVJ1B0kiH1eWeLgpgDp0+t/EyLoI7N8GeeILt/8fi5jwB5d+jBEw8ZeNj1f15krM
 e4TiH8NWUrARyeDLf/PMymUX4QdnIepZXh2aZ3rlwrzsaYQdPHwEulQFkMosihywBore
 9HJIf5sQj8TOk2QI0UaCW68/p0b5YPJl+MEjjIqW9GZCgLKexzq9jCSqfmB2KGo5/ttJ
 VDml0M6oTfVjMdvyaDRUqK2T6SB/ahLhwtbbjO47WxGcUKiPmcNiCoR8fCGZx9AQEumt
 x3zw==
X-Gm-Message-State: AOAM5325FSmczg3W4SblcxHMdRInkFxTDaKrJI94CZ54w0BnzkuLvZlL
 y9PZWBAxOHmkJNDp2W8K1tXvog7OYSICwbj2hM2+b2CK0V43q0kL28SGs8c4MBwZCkFH8vCW2lp
 ljKfFixQd7QrdHCU=
X-Received: by 2002:a7b:c44a:: with SMTP id l10mr4871631wmi.92.1591717409330; 
 Tue, 09 Jun 2020 08:43:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3bif87tiPPldD7otiYWuTNt4YS0ZLINxNlyFd1VqQe1ZkWpWKIUFRwDfvuYMhbhYu0pjacg==
X-Received: by 2002:a7b:c44a:: with SMTP id l10mr4871615wmi.92.1591717409133; 
 Tue, 09 Jun 2020 08:43:29 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id w15sm3298543wmk.30.2020.06.09.08.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 08:43:28 -0700 (PDT)
Date: Tue, 9 Jun 2020 11:43:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-pci: fix queue_enable write
Message-ID: <20200609114213-mutt-send-email-mst@kernel.org>
References: <20200529030728.7687-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529030728.7687-1-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 23:42:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 29, 2020 at 11:07:28AM +0800, Jason Wang wrote:
> Spec said: The driver uses this to selectively prevent the device from
> executing requests from this virtqueue. 1 - enabled; 0 - disabled.
> 
> Though write 0 to queue_enable is forbidden by the sepc, we should not

spec?

> assume that the value is 1.
> 
> Fix this by ignoring the write value other than 1.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>


Do we want to call virtio_error here so we can figure out something's wrong?



> ---
>  hw/virtio/virtio-pci.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index d028c17c24..b3558eeaee 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1273,16 +1273,18 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>          virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>          break;
>      case VIRTIO_PCI_COMMON_Q_ENABLE:
> -        virtio_queue_set_num(vdev, vdev->queue_sel,
> -                             proxy->vqs[vdev->queue_sel].num);
> -        virtio_queue_set_rings(vdev, vdev->queue_sel,
> +        if (val == 1) {
> +            virtio_queue_set_num(vdev, vdev->queue_sel,
> +                                 proxy->vqs[vdev->queue_sel].num);
> +            virtio_queue_set_rings(vdev, vdev->queue_sel,
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].desc[1]) << 32 |
>                         proxy->vqs[vdev->queue_sel].desc[0],
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].avail[1]) << 32 |
>                         proxy->vqs[vdev->queue_sel].avail[0],
>                         ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                         proxy->vqs[vdev->queue_sel].used[0]);
> -        proxy->vqs[vdev->queue_sel].enabled = 1;
> +            proxy->vqs[vdev->queue_sel].enabled = 1;
> +        }
>          break;
>      case VIRTIO_PCI_COMMON_Q_DESCLO:
>          proxy->vqs[vdev->queue_sel].desc[0] = val;
> -- 
> 2.20.1


