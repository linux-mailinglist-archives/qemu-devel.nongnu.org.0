Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4E1AA34
	for <lists+qemu-devel@lfdr.de>; Sun, 12 May 2019 06:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hPfnW-0007AQ-6C
	for lists+qemu-devel@lfdr.de; Sun, 12 May 2019 00:09:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hPfmY-0006qW-AV
	for qemu-devel@nongnu.org; Sun, 12 May 2019 00:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hPfmX-0004mK-B1
	for qemu-devel@nongnu.org; Sun, 12 May 2019 00:08:14 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43953)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hPfmX-0004lP-76
	for qemu-devel@nongnu.org; Sun, 12 May 2019 00:08:13 -0400
Received: by mail-qk1-f194.google.com with SMTP id z6so5288915qkl.10
	for <qemu-devel@nongnu.org>; Sat, 11 May 2019 21:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=ReYpWdW16EKWy93jkDwYJITPppZs5ymrGV9MlBnki+w=;
	b=k72s+4OjH4bUJZ8zeEfSOOxTuiH0hx9CnUqiVnEomjx6J4ja12DbKI1r7+/NMFsbpg
	+crFidsd/fzElWYuzf9CKM7AtookRKIxFS19BxCnYN1OKgnMBA95AVsEKBeyQHWi3/lN
	hqqXqV5oKEFX1RVJk3Id6Bb3QBhmvBy8CGL/vCssxW1EIPg0Y0LGrnP+3yOIdulU6jiF
	poMN0BgL/KoXT1uVh11vrI1MEC+IAvPGXL2cvwOVt6zTABRSVHe951CAzuIjRYFzfzJG
	+jmRTJK8YQvPbnKCk9cYoViB6rXRH9lUw9fb6PSVWkAvy9lDU3ObL6OdVmW3VkHJSQer
	504w==
X-Gm-Message-State: APjAAAWXLex7cusijnhcIRIp7Uh5jaqy8sAploxOcAibW5WD0Citg4oT
	zxxX6sKEjBD71zYjNatAuy1qfQ==
X-Google-Smtp-Source: APXvYqyEcuoHGklwgLcr9hq1jsXu6P/79xk2E7aimOhmR0KnA3ryoVL2cB/SJKCWzOH2hjTIFKJCXg==
X-Received: by 2002:a37:5ac4:: with SMTP id
	o187mr16697167qkb.356.1557634091091; 
	Sat, 11 May 2019 21:08:11 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	l127sm4580713qkc.81.2019.05.11.21.08.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 11 May 2019 21:08:09 -0700 (PDT)
Date: Sun, 12 May 2019 00:08:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20190512000756-mutt-send-email-mst@kernel.org>
References: <20190510105137.17481-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510105137.17481-1-kraxel@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.194
Subject: Re: [Qemu-devel] [PATCH v2 1/2] virtio-input-host-pci: cleanup types
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 10, 2019 at 12:51:36PM +0200, Gerd Hoffmann wrote:
> virtio input is virtio-1.0 only, so we don't need the -transitional and
> -non-transitional variants.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I assume you are merging this?

> ---
>  hw/virtio/virtio-input-host-pci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-input-host-pci.c b/hw/virtio/virtio-input-host-pci.c
> index 725a51ad30b4..124c4f344742 100644
> --- a/hw/virtio/virtio-input-host-pci.c
> +++ b/hw/virtio/virtio-input-host-pci.c
> @@ -13,7 +13,7 @@
>  
>  typedef struct VirtIOInputHostPCI VirtIOInputHostPCI;
>  
> -#define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci-base"
> +#define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci"
>  #define VIRTIO_INPUT_HOST_PCI(obj) \
>          OBJECT_CHECK(VirtIOInputHostPCI, (obj), TYPE_VIRTIO_INPUT_HOST_PCI)
>  
> @@ -31,10 +31,7 @@ static void virtio_host_initfn(Object *obj)
>  }
>  
>  static const VirtioPCIDeviceTypeInfo virtio_input_host_pci_info = {
> -    .base_name             = TYPE_VIRTIO_INPUT_HOST_PCI,
> -    .generic_name          = "virtio-input-host-pci",
> -    .transitional_name     = "virtio-input-host-pci-transitional",
> -    .non_transitional_name = "virtio-input-host-pci-non-transitional",
> +    .generic_name  = TYPE_VIRTIO_INPUT_HOST_PCI,
>      .parent        = TYPE_VIRTIO_INPUT_PCI,
>      .instance_size = sizeof(VirtIOInputHostPCI),
>      .instance_init = virtio_host_initfn,
> -- 
> 2.18.1

