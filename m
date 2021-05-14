Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476E380A77
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:39:12 +0200 (CEST)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhY23-0003gz-9w
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhY0c-0002Vy-6Y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhY0Z-0004g3-8P
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620999458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DZWQOU4908+MlB7qVm5022fRPmywUmurzz18dC8InDE=;
 b=U3OLvq746l8PfvEp2dinx3tZCPaqOZU8MpU8HqsthcACLyalPJCV9mtBL9Ln6tRyI6oko5
 R0rlU7+PK8Qz6bjU9P5IY1Qt5Cmk8jYLu/7JOjCaa1RHQc2LpC3jriu/0QXkxe57fgbsjJ
 Nz4VmAl8JBZkklStlSwc5JPBwCgySyQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-KhkpCyIyPryF-d2Lm9Wjqg-1; Fri, 14 May 2021 09:37:36 -0400
X-MC-Unique: KhkpCyIyPryF-d2Lm9Wjqg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a05600c2c4ab029014b601975e1so1828169wmg.0
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 06:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DZWQOU4908+MlB7qVm5022fRPmywUmurzz18dC8InDE=;
 b=lEjxNZlJU2i8m45QZyIX7L0JRtw2FozsxAKWXN/82KYDte7jhLGDtuXVsvDsnfCRZ/
 J/mlx6ChQ4rwtC1hPjp3xzT9IXp3PLsyLOS544GkRGynmqNCEEDF+IQznokP9Kl9dBz5
 ZNGpzoSH5Au8uxkOWHeFGVWhu0CT7+yCRxVzZkAzDMPk6Pn4VVfCbNBdRrYx7RrDCLj3
 2KY5z+SSz6NQEHkityqONKq4NiT2jk3gF3m//LioVpJ7OhHzji9Ykwhb0gt+8KHF3nXW
 B6CNxOIs+6CbPFgI/mEOlJUR/hdF+Jutb7IYE8FN5trZQYPiWT2QYoERP8+zOCSzKxu2
 AirQ==
X-Gm-Message-State: AOAM533JobRJbBlbU6J7Is5FSXNj7mSVmK8GMP7rYkYejOKyBEQioMHR
 OqKzkbJdcE1AD/csznRLHKor0FshLX6DDsFSHo/PJriLjUbCFqBwghbQRvYvFHcvcYyHY/ENjLi
 Dv5J/w4gVXc29dkA=
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr8748209wmq.97.1620999455403; 
 Fri, 14 May 2021 06:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSYaFkoDtVo/V4ONkxbPCgrNfjtnwHliHLMCLBOiGMvBO4/qTbUoViI/S5UegxJCA3qdCZyQ==
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr8748188wmq.97.1620999455099; 
 Fri, 14 May 2021 06:37:35 -0700 (PDT)
Received: from redhat.com (bzq-79-181-160-222.red.bezeqint.net.
 [79.181.160.222])
 by smtp.gmail.com with ESMTPSA id l7sm2347730wmq.22.2021.05.14.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 06:37:34 -0700 (PDT)
Date: Fri, 14 May 2021 09:37:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/6] pci: introduce apci-index property for PCI device
Message-ID: <20210514093323-mutt-send-email-mst@kernel.org>
References: <20210315180102.3008391-1-imammedo@redhat.com>
 <20210315180102.3008391-3-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210315180102.3008391-3-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 02:00:58PM -0400, Igor Mammedov wrote:
> In x86/ACPI world, linux distros are using predictable
> network interface naming since systemd v197. Which on
> QEMU based VMs results into path based naming scheme,
> that names network interfaces based on PCI topology.
> 
> With itm on has to plug NIC in exactly the same bus/slot,
> which was used when disk image was first provisioned/configured
> or one risks to loose network configuration due to NIC being
> renamed to actually used topology.
> That also restricts freedom to reshape PCI configuration of
> VM without need to reconfigure used guest image.
> 
> systemd also offers "onboard" naming scheme which is
> preferred over PCI slot/topology one, provided that
> firmware implements:
>     "
>     PCI Firmware Specification 3.1
>     4.6.7.  DSM for Naming a PCI or PCI Express Device Under
>             Operating Systems
>     "
> that allows to assign user defined index to PCI device,
> which systemd will use to name NIC. For example, using
>   -device e1000,acpi-index=100
> guest will rename NIC to 'eno100', where 'eno' is default
> prefix for "onboard" naming scheme. This doesn't require
> any advance configuration on guest side to com in effect
> at 'onboard' scheme takes priority over path based naming.
> 
> Hope is that 'acpi-index' it will be easier to consume by
> management layer, compared to forcing specific PCI topology
> and/or having several disk image templates for different
> topologies and will help to simplify process of spawning
> VM from the same template without need to reconfigure
> guest NIC.
> 
> This patch adds, 'acpi-index'* property and wires up
> a 32bit register on top of pci hotplug register block
> to pass index value to AML code at runtime.
> Following patch will add corresponding _DSM code and
> wire it up to PCI devices described in ACPI.
> 
> *) name comes from linux kernel terminology
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

So something to note here is that it's more or less linux centric even
though it's from the spec:

Assignment of specific device names to multi-function devices installed in expansion
slots, and/or PCI or PCI Express devices that are hot-added to expansion slots in operating system-
environment would be handled in operating system-specific manner, and is not specified via this
specification.

So I think commit log should note that point about hot add:
that even though spec excludes it, it seems to work
because the Linux guest re-evaluate the method each time
device is added.


Also, should not we exclude multi-function devices with this property?
Or at least document that it won't work ...




> ---
> v1:
>  *  fix build failure of mips target
>  *  move out handling acpi-index into separate MMIO register,
>     instead of abusing unused PCI hotplug registers (mst)
>  *  default acpi-index property value to 0
>  *  set and check for max acpi-index value (systemd limitation)
> ---
>  include/hw/acpi/pcihp.h |  9 +++++--
>  include/hw/pci/pci.h    |  1 +
>  hw/acpi/pci.c           |  1 -
>  hw/acpi/pcihp.c         | 58 +++++++++++++++++++++++++++++++++++++++--
>  hw/acpi/piix4.c         |  3 ++-
>  hw/acpi/trace-events    |  2 ++
>  hw/i386/acpi-build.c    | 13 ++++++++-
>  hw/pci/pci.c            |  1 +
>  8 files changed, 81 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index dfd375820f..2dd90aea30 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -46,6 +46,7 @@ typedef struct AcpiPciHpPciStatus {
>  typedef struct AcpiPciHpState {
>      AcpiPciHpPciStatus acpi_pcihp_pci_status[ACPI_PCIHP_MAX_HOTPLUG_BUS];
>      uint32_t hotplug_select;
> +    uint32_t acpi_index;
>      PCIBus *root;
>      MemoryRegion io;
>      bool legacy_piix;
> @@ -71,13 +72,17 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
>  
>  extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
>  
> -#define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp) \
> +bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
> +
> +#define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
>          VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
>                              test_pcihp), \
>          VMSTATE_STRUCT_ARRAY_TEST(pcihp.acpi_pcihp_pci_status, state, \
>                                    ACPI_PCIHP_MAX_HOTPLUG_BUS, \
>                                    test_pcihp, 1, \
>                                    vmstate_acpi_pcihp_pci_status, \
> -                                  AcpiPciHpPciStatus)
> +                                  AcpiPciHpPciStatus), \
> +        VMSTATE_UINT32_TEST(pcihp.acpi_index, state, \
> +                            test_acpi_index)
>  
>  #endif
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 1bc231480f..6be4e0c460 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -359,6 +359,7 @@ struct PCIDevice {
>  
>      /* ID of standby device in net_failover pair */
>      char *failover_pair_id;
> +    uint32_t acpi_index;
>  };
>  
>  void pci_register_bar(PCIDevice *pci_dev, int region_num,
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index ec455c3b25..75b1103ec4 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -59,4 +59,3 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
>                   "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
>  }
> -
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 9dc4d3e2db..ceab287bd3 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -39,12 +39,13 @@
>  #include "trace.h"
>  
>  #define ACPI_PCIHP_ADDR 0xae00
> -#define ACPI_PCIHP_SIZE 0x0014
> +#define ACPI_PCIHP_SIZE 0x0018
>  #define PCI_UP_BASE 0x0000
>  #define PCI_DOWN_BASE 0x0004
>  #define PCI_EJ_BASE 0x0008
>  #define PCI_RMV_BASE 0x000c
>  #define PCI_SEL_BASE 0x0010
> +#define PCI_AIDX_BASE 0x0014
>  
>  typedef struct AcpiPciHpFind {
>      int bsel;
> @@ -251,9 +252,13 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
>      acpi_pcihp_update(s);
>  }
>  
> +#define ONBOARD_INDEX_MAX (16 * 1024 - 1)
> +
>  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                     DeviceState *dev, Error **errp)
>  {
> +    PCIDevice *pdev = PCI_DEVICE(dev);
> +
>      /* Only hotplugged devices need the hotplug capability. */
>      if (dev->hotplugged &&
>          acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))) < 0) {
> @@ -261,6 +266,17 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                     ACPI_PCIHP_PROP_BSEL "' set");
>          return;
>      }
> +
> +    /*
> +     * capped by systemd (see: udev-builtin-net_id.c)
> +     * as it's the only known user honor it to avoid users
> +     * misconfigure QEMU and then wonder why acpi-index doesn't work
> +     */
> +    if (pdev->acpi_index > ONBOARD_INDEX_MAX) {
> +        error_setg(errp, "acpi-index should be less or equal to %u",
> +                   ONBOARD_INDEX_MAX);
> +        return;
> +    }
>  }
>  
>  void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> @@ -347,7 +363,6 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
>          trace_acpi_pci_down_read(val);
>          break;
>      case PCI_EJ_BASE:
> -        /* No feature defined yet */
>          trace_acpi_pci_features_read(val);
>          break;
>      case PCI_RMV_BASE:
> @@ -357,6 +372,12 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
>      case PCI_SEL_BASE:
>          val = s->hotplug_select;
>          trace_acpi_pci_sel_read(val);
> +        break;
> +    case PCI_AIDX_BASE:
> +        val = s->acpi_index;
> +        s->acpi_index = 0;
> +        trace_acpi_pci_acpi_index_read(val);
> +        break;
>      default:
>          break;
>      }
> @@ -367,8 +388,35 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
>  static void pci_write(void *opaque, hwaddr addr, uint64_t data,
>                        unsigned int size)
>  {
> +    int slot;
> +    PCIBus *bus;
> +    BusChild *kid, *next;
>      AcpiPciHpState *s = opaque;
> +
> +    s->acpi_index = 0;
>      switch (addr) {
> +    case PCI_AIDX_BASE:
> +        /*
> +         * fetch acpi-index for specified slot so that follow up read from
> +         * PCI_AIDX_BASE can return it to guest
> +         */
> +        slot = ctz32(data);
> +
> +        if (s->hotplug_select >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
> +            break;
> +        }
> +
> +        bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
> +        QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
> +            Object *o = OBJECT(kid->child);
> +            PCIDevice *dev = PCI_DEVICE(o);
> +            if (PCI_SLOT(dev->devfn) == slot) {
> +                s->acpi_index = object_property_get_uint(o, "acpi-index", NULL);
> +                break;
> +            }
> +        }
> +        trace_acpi_pci_acpi_index_write(s->hotplug_select, slot, s->acpi_index);
> +        break;
>      case PCI_EJ_BASE:
>          if (s->hotplug_select >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
>              break;
> @@ -413,6 +461,12 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
>                                     OBJ_PROP_FLAG_READ);
>  }
>  
> +bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
> +{
> +     AcpiPciHpState *s = opaque;
> +     return s->acpi_index;
> +}
> +
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 1efc0ded9f..6056d51667 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -297,7 +297,8 @@ static const VMStateDescription vmstate_acpi = {
>              2, vmstate_pci_status,
>              struct AcpiPciHpPciStatus),
>          VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
> -                            vmstate_test_use_acpi_hotplug_bridge),
> +                            vmstate_test_use_acpi_hotplug_bridge,
> +                            vmstate_acpi_pcihp_use_acpi_index),
>          VMSTATE_END_OF_LIST()
>      },
>      .subsections = (const VMStateDescription*[]) {
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index f91ced477d..dcc1438f3a 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -41,6 +41,8 @@ acpi_pci_unplug_request(int bsel, int slot) "bsel: %d slot: %d"
>  acpi_pci_up_read(uint32_t val) "%" PRIu32
>  acpi_pci_down_read(uint32_t val) "%" PRIu32
>  acpi_pci_features_read(uint32_t val) "%" PRIu32
> +acpi_pci_acpi_index_read(uint32_t val) "%" PRIu32
> +acpi_pci_acpi_index_write(unsigned bsel, unsigned slot, uint32_t aidx) "bsel: %u slot: %u aidx: %" PRIu32
>  acpi_pci_rmv_read(uint32_t val) "%" PRIu32
>  acpi_pci_sel_read(uint32_t val) "%" PRIu32
>  acpi_pci_ej_write(uint64_t addr, uint64_t data) "0x%" PRIx64 " <== %" PRIu64
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 442b4629a9..e49fae2bfd 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1168,9 +1168,10 @@ static void build_piix4_pci_hotplug(Aml *table)
>      aml_append(scope, field);
>  
>      aml_append(scope,
> -        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x04));
> +        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x08));
>      field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
>      aml_append(field, aml_named_field("BNUM", 32));
> +    aml_append(field, aml_named_field("PIDX", 32));
>      aml_append(scope, field);
>  
>      aml_append(scope, aml_mutex("BLCK", 0));
> @@ -1184,6 +1185,16 @@ static void build_piix4_pci_hotplug(Aml *table)
>      aml_append(method, aml_return(aml_int(0)));
>      aml_append(scope, method);
>  
> +    method = aml_method("AIDX", 2, AML_NOTSERIALIZED);
> +    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
> +    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
> +    aml_append(method,
> +        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("PIDX")));
> +    aml_append(method, aml_store(aml_name("PIDX"), aml_local(0)));
> +    aml_append(method, aml_release(aml_name("BLCK")));
> +    aml_append(method, aml_return(aml_local(0)));
> +    aml_append(scope, method);
> +
>      aml_append(table, scope);
>  }
>  
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 0eadcdbc9e..ac9a24889c 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -79,6 +79,7 @@ static Property pci_props[] = {
>                      QEMU_PCIE_EXTCAP_INIT_BITNR, true),
>      DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
>                         failover_pair_id),
> +    DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, 0),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -- 
> 2.27.0


