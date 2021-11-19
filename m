Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899624578F9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:45:41 +0100 (CET)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCdY-00018v-LL
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb9-0006jU-VT
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCb7-0002jH-SR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWefMg647tFbLNi1aAwVUcB9jLlUxbDtAWlfUpWOHoA=;
 b=fJnJzZ2mxy6oKZqJi62DDChcWKePkm4srWzf+snn1cWHp1oHgXRdiYhe2z+zhkBEWMjzx9
 Br8yPCBwBtn9iQdbkL7aHdKx1eIRKmwiwTi51BuxIZvgChZvQqEZy4rUIPZ1FyrJH2ayFk
 ARHtfW1Qo2nYI0BOIo1VyHn5ZQ/r1vc=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-GvqB3i1LN8GCqXWEhEvxGw-1; Fri, 19 Nov 2021 17:43:08 -0500
X-MC-Unique: GvqB3i1LN8GCqXWEhEvxGw-1
Received: by mail-oi1-f200.google.com with SMTP id
 i82-20020acab855000000b002bcea082cf7so3798627oif.22
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lWefMg647tFbLNi1aAwVUcB9jLlUxbDtAWlfUpWOHoA=;
 b=ioGKUq67YE5TYZA/g7losOh4yZhydlDjRRmQoBQjBcwAkMq0+z7ZvAnCKaBkMlxq/5
 Vq8caFsRwwc/XpZ4qL6qHfJlBCfc6QQ6W5jVkkxMMlOhaiL0eDUKr564sS7miq3cFDM6
 aDJdMYbB1pV+HkeOtxFlDlPE0THDi6kwvSbn5lkWGf29gWakLAQMdilmILZ3PJCYedAO
 2Omk87CxN+/oCHo0OYpdrQuBwc3Y3YyGxjiaIhfZSKiS0HScPZF3TRXyC8G3XL8dmQIs
 obUT1DKKEt2I/LETrrI6d5Dtks2Y60ekCxdQx0zOjlFCc5AggdyNOBd/WqWRIL7qKnIu
 mZwQ==
X-Gm-Message-State: AOAM532ZecfZIEKYHuabj5Vhl5uesSyttm0DCFtSnSXMQaZ0s/G67lLq
 NX7HCf9TueEGiiQtSR1hwhJFo25XIQeD9sBCv6x7htX1qzxYAC9zzKLGkUrGhQFlww+UNOymgPp
 W0FAdNsjD7qPBHjQ=
X-Received: by 2002:a05:6830:1db9:: with SMTP id
 z25mr7623704oti.29.1637361787434; 
 Fri, 19 Nov 2021 14:43:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw76sWDnerRzYoxcxkNZhm12CtX/j8fyF04VWf+MSwMaakXYqEd34VZzpHGzY0BL2fHvLUE2A==
X-Received: by 2002:a05:6830:1db9:: with SMTP id
 z25mr7623690oti.29.1637361787207; 
 Fri, 19 Nov 2021 14:43:07 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:07 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:22 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 06/19] vfio-user: Define type vfio_user_pci_dev_info
Message-ID: <20211119154222.525dfb71.alex.williamson@redhat.com>
In-Reply-To: <28d95a317e70c418dc054a59db307d9c49411ca6.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <28d95a317e70c418dc054a59db307d9c49411ca6.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Nov 2021 16:46:34 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> New class for vfio-user with its class and instance
> constructors and destructors, and its pci ops.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.h   |  9 ++++++
>  hw/vfio/pci.c   | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/Kconfig | 10 ++++++
>  3 files changed, 116 insertions(+)
> 
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index bbc78aa..08ac647 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -187,6 +187,15 @@ struct VFIOKernPCIDevice {
>      VFIOPCIDevice device;
>  };
>  
> +#define TYPE_VFIO_USER_PCI "vfio-user-pci"
> +OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
> +
> +struct VFIOUserPCIDevice {
> +    VFIOPCIDevice device;
> +    char *sock_name;
> +    bool secure_dma; /* disable shared mem for DMA */
> +};
> +
>  /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
>  static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
>  {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 6e2ce35..fa3e028 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -19,6 +19,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include CONFIG_DEVICES
>  #include <linux/vfio.h>
>  #include <sys/ioctl.h>
>  
> @@ -3438,3 +3439,99 @@ struct VFIOValidOps vfio_pci_valid_ops = {
>      .validate_get_region_info = vfio_pci_valid_region_info,
>      .validate_get_irq_info = vfio_pci_valid_irq_info,
>  };
> +
> +
> +#ifdef CONFIG_VFIO_USER_PCI
> +
> +/*
> + * vfio-user routines.
> + */
> +
> +/*
> + * Emulated devices don't use host hot reset
> + */
> +static int vfio_user_pci_no_reset(VFIODevice *vbasedev)
> +{
> +    error_printf("vfio-user - no hot reset\n");
> +    return 0;
> +}
> +
> +static void vfio_user_pci_not_needed(VFIODevice *vbasedev)
> +{
> +    vbasedev->needs_reset = false;
> +}

Seems like we should make some of these optional rather than stubbing
dummy functions.

> +
> +static VFIODeviceOps vfio_user_pci_ops = {
> +    .vfio_compute_needs_reset = vfio_user_pci_not_needed,
> +    .vfio_hot_reset_multi = vfio_user_pci_no_reset,
> +    .vfio_eoi = vfio_intx_eoi,
> +    .vfio_get_object = vfio_pci_get_object,
> +    .vfio_save_config = vfio_pci_save_config,
> +    .vfio_load_config = vfio_pci_load_config,
> +};
> +
> +static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +
> +    /*
> +     * TODO: make option parser understand SocketAddress
> +     * and use that instead of having scalar options
> +     * for each socket type.
> +     */
> +    if (!udev->sock_name) {
> +        error_setg(errp, "No socket specified");
> +        error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
> +        return;
> +    }
> +
> +    vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
> +    vbasedev->dev = DEVICE(vdev);
> +    vbasedev->fd = -1;
> +    vbasedev->type = VFIO_DEVICE_TYPE_PCI;
> +    vbasedev->no_mmap = false;

Why hard coded rather than a property?  This is a useful debugging
feature to be able to trap all device accesses.  The device should work
either way.

> +    vbasedev->ops = &vfio_user_pci_ops;
> +    vbasedev->valid_ops = &vfio_pci_valid_ops;
> +
> +}
> +
> +static void vfio_user_instance_finalize(Object *obj)
> +{
> +}
> +
> +static Property vfio_user_pci_dev_properties[] = {
> +    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
> +    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),

Add this when it means something.  Thanks,

Alex

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vfio_user_pci_dev_properties);
> +    dc->desc = "VFIO over socket PCI device assignment";
> +    pdc->realize = vfio_user_pci_realize;
> +}
> +
> +static const TypeInfo vfio_user_pci_dev_info = {
> +    .name = TYPE_VFIO_USER_PCI,
> +    .parent = TYPE_VFIO_PCI_BASE,
> +    .instance_size = sizeof(VFIOUserPCIDevice),
> +    .class_init = vfio_user_pci_dev_class_init,
> +    .instance_init = vfio_instance_init,
> +    .instance_finalize = vfio_user_instance_finalize,
> +};
> +
> +static void register_vfio_user_dev_type(void)
> +{
> +    type_register_static(&vfio_user_pci_dev_info);
> +}
> +
> +type_init(register_vfio_user_dev_type)
> +
> +#endif /* VFIO_USER_PCI */
> diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
> index 7cdba05..301894e 100644
> --- a/hw/vfio/Kconfig
> +++ b/hw/vfio/Kconfig
> @@ -2,6 +2,10 @@ config VFIO
>      bool
>      depends on LINUX
>  
> +config VFIO_USER
> +    bool
> +    depends on VFIO
> +
>  config VFIO_PCI
>      bool
>      default y
> @@ -9,6 +13,12 @@ config VFIO_PCI
>      select EDID
>      depends on LINUX && PCI
>  
> +config VFIO_USER_PCI
> +    bool
> +    default y
> +    select VFIO_USER
> +    depends on VFIO_PCI
> +
>  config VFIO_CCW
>      bool
>      default y


