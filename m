Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F3A59DE9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 16:37:17 +0200 (CEST)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgs04-0000jm-UK
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 10:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hgrTz-0001sW-CB
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:04:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hgrTx-00037p-S8
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:04:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36358)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hgrTx-0002pk-Kw
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:04:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id p15so6394550qtl.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 07:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gz/8gJPOkKbBQfdh2Gl2gXhhKiVamOCaSwb+nZDxRHo=;
 b=gaEXcqDQoGiY9bFjeEKB9JY26XsgAiTuE3zosYOU5NmGlIuvmOM3+GgZwGpDftxKlO
 oKP7KfcK5Tx5JLMfXvXm6/DT5YzJ81YuJKrv6FbRLJM0YU5Oo0Ss+t2eomJlEuVH0Eol
 M9p2vJns8PCAw1M4IWEtPkK7YEh5lEOdicl/vD1areM8uyNHrsyG3AKsrgPoAseANuTy
 iV62Rpob9v4pDM6AnWomcPHi2pa3TcDdBPL52Y68XgleG8rv/h+5w7hhN3xp91J+dSE1
 PQotxydz23LogWqiiHBfMe3SwOIujkL/hPgmy/MauA17zaZ+yTKlKgYZ8ENvSoDQsSwq
 DIVA==
X-Gm-Message-State: APjAAAUwPUbnp4Y4LljvN4+uB+4BSY1CklipqYGciXG+sMkNFnO6b6P0
 K+FTZvOdbE3/C/yxdysLEPCcgw==
X-Google-Smtp-Source: APXvYqyCt9TtOndhn0IYi81JL/G08leilD+vD+vlQnwc6UeULZNxjOgh9fgKMKEqhIXFUUXQ2ok/lQ==
X-Received: by 2002:a0c:b159:: with SMTP id r25mr8024523qvc.219.1561730618852; 
 Fri, 28 Jun 2019 07:03:38 -0700 (PDT)
Received: from redhat.com ([37.26.146.159])
 by smtp.gmail.com with ESMTPSA id a54sm1052777qtk.85.2019.06.28.07.03.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 07:03:37 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:03:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <20190628100145-mutt-send-email-mst@kernel.org>
References: <20190628115349.60293-1-slp@redhat.com>
 <20190628115349.60293-3-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628115349.60293-3-slp@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.195
Subject: Re: [Qemu-devel] [PATCH 2/4] hw/virtio: Factorize virtio-mmio
 headers
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, ehabkost@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 28, 2019 at 01:53:47PM +0200, Sergio Lopez wrote:
> Put QOM and main struct definition in a separate header file, so it
> can be accesed from other components.
> 
> This is needed for the microvm machine type implementation.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>

If you are going to productise virtio-mmio, then 1.0 support is a must.
I am not sure we want a new machine with 0.X mmio devices.
Especially considering that virtio-mmio does not have support for
transitional devices.

> ---
>  hw/virtio/virtio-mmio.c | 35 +-----------------------
>  hw/virtio/virtio-mmio.h | 60 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 34 deletions(-)
>  create mode 100644 hw/virtio/virtio-mmio.h
> 
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 97b7f35496..87c7fe4d8d 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -26,44 +26,11 @@
>  #include "qemu/host-utils.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> -#include "hw/virtio/virtio-bus.h"
> +#include "virtio-mmio.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "trace.h"
>  
> -/* QOM macros */
> -/* virtio-mmio-bus */
> -#define TYPE_VIRTIO_MMIO_BUS "virtio-mmio-bus"
> -#define VIRTIO_MMIO_BUS(obj) \
> -        OBJECT_CHECK(VirtioBusState, (obj), TYPE_VIRTIO_MMIO_BUS)
> -#define VIRTIO_MMIO_BUS_GET_CLASS(obj) \
> -        OBJECT_GET_CLASS(VirtioBusClass, (obj), TYPE_VIRTIO_MMIO_BUS)
> -#define VIRTIO_MMIO_BUS_CLASS(klass) \
> -        OBJECT_CLASS_CHECK(VirtioBusClass, (klass), TYPE_VIRTIO_MMIO_BUS)
> -
> -/* virtio-mmio */
> -#define TYPE_VIRTIO_MMIO "virtio-mmio"
> -#define VIRTIO_MMIO(obj) \
> -        OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
> -
> -#define VIRT_MAGIC 0x74726976 /* 'virt' */
> -#define VIRT_VERSION 1
> -#define VIRT_VENDOR 0x554D4551 /* 'QEMU' */
> -
> -typedef struct {
> -    /* Generic */
> -    SysBusDevice parent_obj;
> -    MemoryRegion iomem;
> -    qemu_irq irq;
> -    /* Guest accessible state needing migration and reset */
> -    uint32_t host_features_sel;
> -    uint32_t guest_features_sel;
> -    uint32_t guest_page_shift;
> -    /* virtio-bus */
> -    VirtioBusState bus;
> -    bool format_transport_address;
> -} VirtIOMMIOProxy;
> -
>  static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
>  {
>      return kvm_eventfds_enabled();
> diff --git a/hw/virtio/virtio-mmio.h b/hw/virtio/virtio-mmio.h
> new file mode 100644
> index 0000000000..2f3973f8c7
> --- /dev/null
> +++ b/hw/virtio/virtio-mmio.h
> @@ -0,0 +1,60 @@
> +/*
> + * Virtio MMIO bindings
> + *
> + * Copyright (c) 2011 Linaro Limited
> + *
> + * Author:
> + *  Peter Maydell <peter.maydell@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef QEMU_VIRTIO_MMIO_H
> +#define QEMU_VIRTIO_MMIO_H
> +
> +#include "hw/virtio/virtio-bus.h"
> +
> +/* QOM macros */
> +/* virtio-mmio-bus */
> +#define TYPE_VIRTIO_MMIO_BUS "virtio-mmio-bus"
> +#define VIRTIO_MMIO_BUS(obj) \
> +        OBJECT_CHECK(VirtioBusState, (obj), TYPE_VIRTIO_MMIO_BUS)
> +#define VIRTIO_MMIO_BUS_GET_CLASS(obj) \
> +        OBJECT_GET_CLASS(VirtioBusClass, (obj), TYPE_VIRTIO_MMIO_BUS)
> +#define VIRTIO_MMIO_BUS_CLASS(klass) \
> +        OBJECT_CLASS_CHECK(VirtioBusClass, (klass), TYPE_VIRTIO_MMIO_BUS)
> +
> +/* virtio-mmio */
> +#define TYPE_VIRTIO_MMIO "virtio-mmio"
> +#define VIRTIO_MMIO(obj) \
> +        OBJECT_CHECK(VirtIOMMIOProxy, (obj), TYPE_VIRTIO_MMIO)
> +
> +#define VIRT_MAGIC 0x74726976 /* 'virt' */
> +#define VIRT_VERSION 1
> +#define VIRT_VENDOR 0x554D4551 /* 'QEMU' */
> +
> +typedef struct {
> +    /* Generic */
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +    /* Guest accessible state needing migration and reset */
> +    uint32_t host_features_sel;
> +    uint32_t guest_features_sel;
> +    uint32_t guest_page_shift;
> +    /* virtio-bus */
> +    VirtioBusState bus;
> +    bool format_transport_address;
> +} VirtIOMMIOProxy;
> +
> +#endif
> -- 
> 2.21.0

