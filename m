Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F21457913
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:48:42 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCgT-0006xH-TT
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:48:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbF-0006yo-So
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1moCbD-0002ld-Ah
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637361794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uL2ZTNm1dadnkYY6JlSDuZTIIqGNaw3QrrvoJ20Qed0=;
 b=R5QcWdk2Xnp+fgW9Igr7ugmTn3qU63/1IBesg1+vC1/m4y7h8ySWUF0Fk8wFNWykwzDe6r
 g6KAy/zTnuejmB+Eh3j0pJ/PZUDmyBD+Ch7z81V1OC9v/rIkW4ugSxCWiA3iZzoRv4oo9c
 j2g40FcAhZ9pnRszz/0nsj0Qvpeqf38=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-PTlvlkY5M4O7YeAp9xtqgg-1; Fri, 19 Nov 2021 17:43:12 -0500
X-MC-Unique: PTlvlkY5M4O7YeAp9xtqgg-1
Received: by mail-oo1-f72.google.com with SMTP id
 x19-20020a4a3f53000000b002c2a8c9a030so7002796ooe.15
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uL2ZTNm1dadnkYY6JlSDuZTIIqGNaw3QrrvoJ20Qed0=;
 b=SZmue0+1BHFsDOVJwQQemCo1Fuc2J3guXVGakmYbgrLsKBAoP5MhNhcSDhZb7NWRfJ
 9Fhht4/rMJiYYe5lxzxcj2x3rSPReTM76NoleUg5ox6G93vx35yomLceyyVJGdFKnGRu
 E7tzzn2XHZ8pI/GOEIVBCkYihWCmRxYke7YGQyQvRNUhAiKrbbVftL4vWZ/iox5IBxTd
 DQ38qpK2nX/CeVvkKQbGL7H9HL8qAALChfoi+ipPdSsa44sEo+PJYAC6w8sBQkL7Ex4R
 PJ1A9FkF/IVlxlOPzI6PNjbwuCbb5f7efy3Dt1IvHW6q03ybx0MEIL42aunWFopnESuA
 /FHg==
X-Gm-Message-State: AOAM532zLOlzv5VIBJbebxk6WGUzK+7BYjPrdAwI7z7JSVZ/xDYN8KbY
 oJZ3xzoSLFYgGc/out/1gByKp7fHHzuNDES6okPYZg3F/psPfR4QvaiH/b2cu05nQDZ5pJplAXf
 Ej8gXSaz1p13Q2Xs=
X-Received: by 2002:a05:6808:220f:: with SMTP id
 bd15mr3200010oib.73.1637361791900; 
 Fri, 19 Nov 2021 14:43:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPTNxalcI1MXkXWjXWu+LVYjL8vBjQvj1CytgcNLcPKM3B9YaZD1nTQOEZwsxxL6ppSflP4A==
X-Received: by 2002:a05:6808:220f:: with SMTP id
 bd15mr3199987oib.73.1637361791635; 
 Fri, 19 Nov 2021 14:43:11 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id g26sm239115ots.25.2021.11.19.14.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:43:11 -0800 (PST)
Date: Fri, 19 Nov 2021 15:42:16 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [RFC v3 02/19] vfio-user: add VFIO base abstract class
Message-ID: <20211119154216.0cb72af5.alex.williamson@redhat.com>
In-Reply-To: <c3c41abc74603d5d2cb56a20bb0a056b8c338b88.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <c3c41abc74603d5d2cb56a20bb0a056b8c338b88.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
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

On Mon,  8 Nov 2021 16:46:30 -0800
John Johnson <john.g.johnson@oracle.com> wrote:

> Add an abstract base class both the kernel driver
> and user socket implementations can use to share code.
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/pci.h |  16 +++++++--
>  hw/vfio/pci.c | 112 +++++++++++++++++++++++++++++++++++-----------------------
>  2 files changed, 81 insertions(+), 47 deletions(-)
> 
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 6477751..bbc78aa 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -114,8 +114,13 @@ typedef struct VFIOMSIXInfo {
>      unsigned long *pending;
>  } VFIOMSIXInfo;
>  
> -#define TYPE_VFIO_PCI "vfio-pci"
> -OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
> +/*
> + * TYPE_VFIO_PCI_BASE is an abstract type used to share code
> + * between VFIO implementations that use a kernel driver
> + * with those that use user sockets.
> + */
> +#define TYPE_VFIO_PCI_BASE "vfio-pci-base"
> +OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_BASE)
>  
>  struct VFIOPCIDevice {
>      PCIDevice pdev;
> @@ -175,6 +180,13 @@ struct VFIOPCIDevice {
>      Notifier irqchip_change_notifier;
>  };
>  
> +#define TYPE_VFIO_PCI "vfio-pci"
> +OBJECT_DECLARE_SIMPLE_TYPE(VFIOKernPCIDevice, VFIO_PCI)
> +
> +struct VFIOKernPCIDevice {
> +    VFIOPCIDevice device;
> +};
> +
>  /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
>  static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
>  {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e1ea1d8..122edf8 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -231,7 +231,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
>  
>  static void vfio_intx_routing_notifier(PCIDevice *pdev)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      PCIINTxRoute route;
>  
>      if (vdev->interrupt != VFIO_INT_INTx) {
> @@ -457,7 +457,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
>  static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                                     MSIMessage *msg, IOHandler *handler)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      VFIOMSIVector *vector;
>      int ret;
>  
> @@ -542,7 +542,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
>  
>  static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      VFIOMSIVector *vector = &vdev->msi_vectors[nr];
>  
>      trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
> @@ -1063,7 +1063,7 @@ static const MemoryRegionOps vfio_vga_ops = {
>   */
>  static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      VFIORegion *region = &vdev->bars[bar].region;
>      MemoryRegion *mmap_mr, *region_mr, *base_mr;
>      PCIIORegion *r;
> @@ -1109,7 +1109,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>   */
>  uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
>  
>      memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
> @@ -1142,7 +1142,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>  void vfio_pci_write_config(PCIDevice *pdev,
>                             uint32_t addr, uint32_t val, int len)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      uint32_t val_le = cpu_to_le32(val);
>  
>      trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
> @@ -2782,7 +2782,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>  
>  static void vfio_realize(PCIDevice *pdev, Error **errp)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>      VFIODevice *vbasedev_iter;
>      VFIOGroup *group;
>      char *tmp, *subsys, group_path[PATH_MAX], *group_name;
> @@ -3105,7 +3105,7 @@ error:
>  
>  static void vfio_instance_finalize(Object *obj)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(obj);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>      VFIOGroup *group = vdev->vbasedev.group;
>  
>      vfio_display_finalize(vdev);
> @@ -3125,7 +3125,7 @@ static void vfio_instance_finalize(Object *obj)
>  
>  static void vfio_exitfn(PCIDevice *pdev)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>  
>      vfio_unregister_req_notifier(vdev);
>      vfio_unregister_err_notifier(vdev);
> @@ -3144,7 +3144,7 @@ static void vfio_exitfn(PCIDevice *pdev)
>  
>  static void vfio_pci_reset(DeviceState *dev)
>  {
> -    VFIOPCIDevice *vdev = VFIO_PCI(dev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
>  
>      trace_vfio_pci_reset(vdev->vbasedev.name);
>  
> @@ -3184,7 +3184,7 @@ post_reset:
>  static void vfio_instance_init(Object *obj)
>  {
>      PCIDevice *pci_dev = PCI_DEVICE(obj);
> -    VFIOPCIDevice *vdev = VFIO_PCI(obj);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>  
>      device_add_bootindex_property(obj, &vdev->bootindex,
>                                    "bootindex", NULL,
> @@ -3201,38 +3201,75 @@ static void vfio_instance_init(Object *obj)
>      pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
>  }
>  
> -static Property vfio_pci_dev_properties[] = {
> -    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
> -    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> +static Property vfio_pci_base_dev_properties[] = {
>      DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
>                              vbasedev.pre_copy_dirty_page_tracking,
>                              ON_OFF_AUTO_ON),
> +    DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
> +                       intx.mmap_timeout, 1100),
> +    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> +                     vbasedev.enable_migration, false),
> +    DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
> +    DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
> +    DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
> +    DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
> +    DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
> +                     false),
> +    DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
> +                     false),
> +    DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
> +                                OFF_AUTOPCIBAR_OFF),
> +    /*
> +     * TODO - support passed fds... is this necessary?
> +     * DEFINE_PROP_STRING("vfiofd", VFIOPCIDevice, vfiofd_name),
> +     * DEFINE_PROP_STRING("vfiogroupfd, VFIOPCIDevice, vfiogroupfd_name),
> +     */
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vfio_pci_base_dev_properties);
> +    dc->desc = "VFIO PCI base device";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    pdc->exit = vfio_exitfn;
> +    pdc->config_read = vfio_pci_read_config;
> +    pdc->config_write = vfio_pci_write_config;
> +}
> +
> +static const TypeInfo vfio_pci_base_dev_info = {
> +    .name = TYPE_VFIO_PCI_BASE,
> +    .parent = TYPE_PCI_DEVICE,
> +    .instance_size = 0,
> +    .abstract = true,
> +    .class_init = vfio_pci_base_dev_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_PCIE_DEVICE },
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { }
> +    },
> +};
> +
> +static Property vfio_pci_dev_properties[] = {
> +    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
> +    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
>      DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
>                              display, ON_OFF_AUTO_OFF),
>      DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
>      DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
> -    DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
> -                       intx.mmap_timeout, 1100),
>      DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
>                      VFIO_FEATURE_ENABLE_VGA_BIT, false),
>      DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
>                      VFIO_FEATURE_ENABLE_REQ_BIT, true),
>      DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>                      VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
> -    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
> -                     vbasedev.enable_migration, false),
> -    DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
>      DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>                       vbasedev.ram_block_discard_allowed, false),
> -    DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
> -    DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
> -    DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
>      DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
>                       no_geforce_quirks, false),
> -    DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
> -                     false),
> -    DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
> -                     false),
>      DEFINE_PROP_UINT32("x-pci-vendor-id", VFIOPCIDevice, vendor_id, PCI_ANY_ID),
>      DEFINE_PROP_UINT32("x-pci-device-id", VFIOPCIDevice, device_id, PCI_ANY_ID),
>      DEFINE_PROP_UINT32("x-pci-sub-vendor-id", VFIOPCIDevice,


Not sure I understand some of these choices.  The kernel interface
options like "host" and "sysfsdev" obviously belong here, and it makes
sense for quirks related to real hardware to be here, igd, nvidia, gpu
direct, etc.  But the rest I'm a bit lost.  Why would overriding the
PCI IDs, disabling ballooning, disabling the device request interrupt,
enabling exposing a VGA region, supporting a display, be unique to the
kernel interface?  Thanks,

Alex

> @@ -3243,13 +3280,6 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
>                                     nv_gpudirect_clique,
>                                     qdev_prop_nv_gpudirect_clique, uint8_t),
> -    DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
> -                                OFF_AUTOPCIBAR_OFF),
> -    /*
> -     * TODO - support passed fds... is this necessary?
> -     * DEFINE_PROP_STRING("vfiofd", VFIOPCIDevice, vfiofd_name),
> -     * DEFINE_PROP_STRING("vfiogroupfd, VFIOPCIDevice, vfiogroupfd_name),
> -     */
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -3261,25 +3291,16 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>      dc->reset = vfio_pci_reset;
>      device_class_set_props(dc, vfio_pci_dev_properties);
>      dc->desc = "VFIO-based PCI device assignment";
> -    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      pdc->realize = vfio_realize;
> -    pdc->exit = vfio_exitfn;
> -    pdc->config_read = vfio_pci_read_config;
> -    pdc->config_write = vfio_pci_write_config;
>  }
>  
>  static const TypeInfo vfio_pci_dev_info = {
>      .name = TYPE_VFIO_PCI,
> -    .parent = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(VFIOPCIDevice),
> +    .parent = TYPE_VFIO_PCI_BASE,
> +    .instance_size = sizeof(VFIOKernPCIDevice),
>      .class_init = vfio_pci_dev_class_init,
>      .instance_init = vfio_instance_init,
>      .instance_finalize = vfio_instance_finalize,
> -    .interfaces = (InterfaceInfo[]) {
> -        { INTERFACE_PCIE_DEVICE },
> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> -        { }
> -    },
>  };
>  
>  static Property vfio_pci_dev_nohotplug_properties[] = {
> @@ -3298,12 +3319,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
>  static const TypeInfo vfio_pci_nohotplug_dev_info = {
>      .name = TYPE_VFIO_PCI_NOHOTPLUG,
>      .parent = TYPE_VFIO_PCI,
> -    .instance_size = sizeof(VFIOPCIDevice),
> +    .instance_size = sizeof(VFIOKernPCIDevice),
>      .class_init = vfio_pci_nohotplug_dev_class_init,
>  };
>  
>  static void register_vfio_pci_dev_type(void)
>  {
> +    type_register_static(&vfio_pci_base_dev_info);
>      type_register_static(&vfio_pci_dev_info);
>      type_register_static(&vfio_pci_nohotplug_dev_info);
>  }


