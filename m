Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AC600D91
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:17:23 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO7W-0007mQ-E6
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okNta-0000t8-42
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:02:58 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okNtO-0000qw-JN
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:02:53 -0400
Received: by mail-io1-xd2e.google.com with SMTP id p16so8705595iod.6
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j8nh4oBxb7QW46qRlcezruYh83JGb9t1BRO10Gy5fmI=;
 b=WaFvItswtIfIiroN+3w72Ql8VaF/0ZGCnAO18QmbxKA3WMQkLhpv07Z+XCsTqGcZ39
 7D0gBo1iIsohnPws3EPyG6jnLu1xQJvdfCIlhQH5jVtwMFkW4zEIJdW33NtKHyDRY23q
 LnlkbAVja6Ug63C2tYiom4LALJ58/toFJihNrehhMns5aqu5At3NUPiVGVqPVlGtum7c
 dQE8L0HzZU9OHp2+1zK0ry1C++g3GFvalgzp/xWnqQU4LKsQ+01KsLJou6e+NIk+6t10
 DFbbQEWRNJtYlLV0gEFoTu8FIsPPcqvbhGvZqNfv4d5YONifFcHvSciuJcKX1m6IEvzG
 Yupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j8nh4oBxb7QW46qRlcezruYh83JGb9t1BRO10Gy5fmI=;
 b=uO2Yl+gG6XPFpyusXXjWrM7I0aGPiErwXCLWNHfHZ6tX2L8YuvF6yGjKD9IAKNI9eN
 L3T+wzBeLfornKtXT/7j2NC9fXeknKO35SE630gBDOqiB/77r9dIQjJt1gLt7o0aem9L
 eyJWaEGybI7E2jyhPBwpNdjyfeOK8G11pdFx6d03UFig9/R2Ldybq7jRAMBDrPEGD5qC
 gLwHmnk+c4jvwH81sKfxOUtGpIPrwJkntcxUXLb/wbmj1PlQuRAgKVbdkG2DJQbUK0no
 CmJkFw31LvDj6zY8SxsQl6/PBb2UNhDqJxyPplnwgHvRI7HVH1xxUI73q8N3ubZjzKzF
 jgTw==
X-Gm-Message-State: ACrzQf0M3ilL1KTLUPJFIuRr44vNkmP1xbs6jmuX7O3nXW+YXrzoMfwG
 VVXfEkwnsm8UhbmuF+DqFOMRcjwePukoq8mjd2ApcQ==
X-Google-Smtp-Source: AMsMyM7HJEvjiga0TNCRVHfb+rxYWC2OCBOcWPNY49HvFUWIdsIZVVXh9TczxdD3dAjw3yFlco8KFccKR3Qx9Rea9pY=
X-Received: by 2002:a02:cc55:0:b0:364:ef:c546 with SMTP id
 i21-20020a02cc55000000b0036400efc546mr4985548jaq.265.1666004562177; 
 Mon, 17 Oct 2022 04:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221017102146.2254096-1-imammedo@redhat.com>
 <20221017102146.2254096-2-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-2-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 17 Oct 2022 16:32:29 +0530
Message-ID: <CAARzgwwjnDu-fX2AZbukB-5rzhTkG8kYtSiS4dO-bW8m3YXu7Q@mail.gmail.com>
Subject: Re: [PATCH 01/11] acpi: pc: vga: use AcpiDevAmlIf interface to build
 VGA device descriptors
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 3:52 PM Igor Mammedov <imammedo@redhat.com> wrote:
>

I would add a comment that we do not expect any functional change in
any ACPI tables with this change. It's only a refactoring.

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Other than the comment above,
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/display/vga_int.h       |  2 ++
>  hw/display/acpi-vga-stub.c |  7 +++++++
>  hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
>  hw/display/meson.build     | 17 +++++++++++++++++
>  hw/display/vga-pci.c       |  4 ++++
>  hw/i386/acpi-build.c       | 26 +-------------------------
>  6 files changed, 57 insertions(+), 25 deletions(-)
>  create mode 100644 hw/display/acpi-vga-stub.c
>  create mode 100644 hw/display/acpi-vga.c
>
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 305e700014..330406ad9c 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -30,6 +30,7 @@
>  #include "ui/console.h"
>
>  #include "hw/display/bochs-vbe.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>
>  #define ST01_V_RETRACE      0x08
>  #define ST01_DISP_ENABLE    0x01
> @@ -195,4 +196,5 @@ void pci_std_vga_mmio_region_init(VGACommonState *s,
>                                    MemoryRegion *subs,
>                                    bool qext, bool edid);
>
> +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope);
>  #endif
> diff --git a/hw/display/acpi-vga-stub.c b/hw/display/acpi-vga-stub.c
> new file mode 100644
> index 0000000000..a9b0ecf76d
> --- /dev/null
> +++ b/hw/display/acpi-vga-stub.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi_aml_interface.h"
> +#include "vga_int.h"
> +
> +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +}
> diff --git a/hw/display/acpi-vga.c b/hw/display/acpi-vga.c
> new file mode 100644
> index 0000000000..f0e9ef1fcf
> --- /dev/null
> +++ b/hw/display/acpi-vga.c
> @@ -0,0 +1,26 @@
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi_aml_interface.h"
> +#include "hw/pci/pci.h"
> +#include "vga_int.h"
> +
> +void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +    int s3d = 0;
> +    Aml *method;
> +
> +    if (object_dynamic_cast(OBJECT(adev), "qxl-vga")) {
> +        s3d = 3;
> +    }
> +
> +    method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0)));
> +    aml_append(scope, method);
> +
> +    method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(0)));
> +    aml_append(scope, method);
> +
> +    method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
> +    aml_append(method, aml_return(aml_int(s3d)));
> +    aml_append(scope, method);
> +}
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index adc53dd8b6..7a725ed80e 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
>
>  specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
>
> +if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> +    config_all_devices.has_key('CONFIG_VGA_PCI') or
> +    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
> +    config_all_devices.has_key('CONFIG_ATI_VGA')
> +   )
> +  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                      if_false: files('acpi-vga-stub.c'))
> +endif
> +
>  if config_all_devices.has_key('CONFIG_QXL')
>    qxl_ss = ss.source_set()
>    qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
>                                             pixman, spice])
> +  qxl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                  if_false: files('acpi-vga-stub.c'))
>    hw_display_modules += {'qxl': qxl_ss}
>  endif
>
> @@ -52,6 +63,7 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
>
>  softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
>
> +
>  if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
>    virtio_gpu_ss = ss.source_set()
>    virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
> @@ -87,14 +99,19 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
>                      if_true: [files('virtio-vga.c'), pixman])
>    virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
>                      if_true: files('vhost-user-vga.c'))
> +  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                         if_false: files('acpi-vga-stub.c'))
>    hw_display_modules += {'virtio-vga': virtio_vga_ss}
>
>    virtio_vga_gl_ss = ss.source_set()
>    virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
>                         if_true: [files('virtio-vga-gl.c'), pixman])
> +  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
> +                                            if_false: files('acpi-vga-stub.c'))
>    hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
>  endif
>
>  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
>
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
>  modules += { 'hw-display': hw_display_modules }
> diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
> index 3e5bc259f7..9a91de7ed1 100644
> --- a/hw/display/vga-pci.c
> +++ b/hw/display/vga-pci.c
> @@ -35,6 +35,7 @@
>  #include "hw/loader.h"
>  #include "hw/display/edid.h"
>  #include "qom/object.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>
>  enum vga_pci_flags {
>      PCI_VGA_FLAG_ENABLE_MMIO = 1,
> @@ -354,11 +355,13 @@ static void vga_pci_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
>
>      k->vendor_id = PCI_VENDOR_ID_QEMU;
>      k->device_id = PCI_DEVICE_ID_QEMU_VGA;
>      dc->vmsd = &vmstate_vga_pci;
>      set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    adevc->build_dev_aml = build_vga_aml;
>  }
>
>  static const TypeInfo vga_pci_type_info = {
> @@ -369,6 +372,7 @@ static const TypeInfo vga_pci_type_info = {
>      .class_init = vga_pci_class_init,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { TYPE_ACPI_DEV_AML_IF },
>          { },
>      },
>  };
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4f54b61904..26932b4e2c 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -430,7 +430,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          bool hotpluggbale_slot = false;
>          bool bridge_in_acpi = false;
>          bool cold_plugged_bridge = false;
> -        bool is_vga = false;
>
>          if (pdev) {
>              pc = PCI_DEVICE_GET_CLASS(pdev);
> @@ -440,8 +439,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>                  continue;
>              }
>
> -            is_vga = pc->class_id == PCI_CLASS_DISPLAY_VGA;
> -
>              /*
>               * Cold plugged bridges aren't themselves hot-pluggable.
>               * Hotplugged bridges *are* hot-pluggable.
> @@ -489,28 +486,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>              aml_append(dev, aml_pci_device_dsm());
>          }
>
> -        if (is_vga) {
> -            /* add VGA specific AML methods */
> -            int s3d;
> -
> -            if (object_dynamic_cast(OBJECT(pdev), "qxl-vga")) {
> -                s3d = 3;
> -            } else {
> -                s3d = 0;
> -            }
> -
> -            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
> -            aml_append(method, aml_return(aml_int(0)));
> -            aml_append(dev, method);
> -
> -            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
> -            aml_append(method, aml_return(aml_int(0)));
> -            aml_append(dev, method);
> -
> -            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
> -            aml_append(method, aml_return(aml_int(s3d)));
> -            aml_append(dev, method);
> -        }
> +        call_dev_aml_func(DEVICE(pdev), dev);
>
>          bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
>          if (bridge_in_acpi) {
> --
> 2.31.1
>

