Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC126D4D9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 09:39:34 +0200 (CEST)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIoVx-00088t-Sq
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 03:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kIoUe-0006sy-0W; Thu, 17 Sep 2020 03:38:13 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kIoUa-0003YH-Sf; Thu, 17 Sep 2020 03:38:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3B1C95BF8044;
 Thu, 17 Sep 2020 09:38:04 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 17 Sep
 2020 09:38:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003e8a503bc-0fbd-4fb8-920c-88348699c472,
 FF1720B74B3888C93CA5040C1F5ACCC945AC33B8) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 2/2] qom: Use DECLARE_INTERFACE_CHECKER macro
To: Eduardo Habkost <ehabkost@redhat.com>, <qemu-devel@nongnu.org>
References: <20200917024947.707586-1-ehabkost@redhat.com>
 <20200917024947.707586-3-ehabkost@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e77ca535-4f70-98ce-c49f-f5f2fa4c6150@kaod.org>
Date: Thu, 17 Sep 2020 09:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200917024947.707586-3-ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 636d6a6e-7c85-47e1-a156-75ae3337ceb9
X-Ovh-Tracer-Id: 1322650918118591303
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtdefgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeetfeejteefhfeuveethfduffeftdelvdeghfelhfeljeehheeuieevudeggefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepvghhrggskhhoshhtsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:38:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.062,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel
 P. Berrange" <berrange@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/20 4:49 AM, Eduardo Habkost wrote:
> Mechanical search/replace to use the new
> DECLARE_INTERFACE_CHECKER macro instead of manually defining
> macros using INTERFACE_CHECK.
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This is an alternative to the patches submitted at
> https://lore.kernel.org/qemu-devel/20200916193101.511600-3-ehabkost@redhat.com/
> https://lore.kernel.org/qemu-devel/20200916193101.511600-4-ehabkost@redhat.com/
> ---
> Changes v1 -> v2:
> * Build fix: move declarations after typedef

Would it be possible to move the typedef in the DECLARE_INTERFACE_CHECKER 
macro ? 

C.

> 
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: "Hervé Poussineau" <hpoussin@reactos.org>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  include/hw/acpi/acpi_dev_interface.h |  7 +++----
>  include/hw/arm/linux-boot-if.h       |  6 +++---
>  include/hw/fw-path-provider.h        |  6 +++---
>  include/hw/hotplug.h                 |  6 +++---
>  include/hw/intc/intc.h               |  7 +++----
>  include/hw/ipmi/ipmi.h               |  6 +++---
>  include/hw/isa/isa.h                 |  4 ++--
>  include/hw/mem/memory-device.h       |  6 +++---
>  include/hw/nmi.h                     |  6 +++---
>  include/hw/ppc/pnv_xscom.h           |  4 ++--
>  include/hw/ppc/spapr_irq.h           |  4 ++--
>  include/hw/ppc/xics.h                |  4 ++--
>  include/hw/ppc/xive.h                | 12 ++++++------
>  include/hw/rdma/rdma.h               |  7 +++----
>  include/hw/rtc/m48t59.h              |  6 +++---
>  include/hw/stream.h                  |  6 +++---
>  include/hw/vmstate-if.h              |  6 +++---
>  include/qom/object_interfaces.h      |  7 +++----
>  include/sysemu/tpm.h                 |  6 +++---
>  target/arm/idau.h                    |  6 +++---
>  tests/check-qom-interface.c          |  6 +++---
>  21 files changed, 62 insertions(+), 66 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> index 9adf1e4706..58bf64052d 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -21,11 +21,10 @@ typedef enum {
>  typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
>  DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
>                         TYPE_ACPI_DEVICE_IF)
> -#define ACPI_DEVICE_IF(obj) \
> -     INTERFACE_CHECK(AcpiDeviceIf, (obj), \
> -                     TYPE_ACPI_DEVICE_IF)
> -
>  typedef struct AcpiDeviceIf AcpiDeviceIf;
> +DECLARE_INTERFACE_CHECKER(AcpiDeviceIf, ACPI_DEVICE_IF,
> +                          TYPE_ACPI_DEVICE_IF)
> +
>  
>  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
>  
> diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-if.h
> index c85f33b2c5..17b8083f95 100644
> --- a/include/hw/arm/linux-boot-if.h
> +++ b/include/hw/arm/linux-boot-if.h
> @@ -12,10 +12,10 @@
>  typedef struct ARMLinuxBootIfClass ARMLinuxBootIfClass;
>  DECLARE_CLASS_CHECKERS(ARMLinuxBootIfClass, ARM_LINUX_BOOT_IF,
>                         TYPE_ARM_LINUX_BOOT_IF)
> -#define ARM_LINUX_BOOT_IF(obj) \
> -    INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
> -
>  typedef struct ARMLinuxBootIf ARMLinuxBootIf;
> +DECLARE_INTERFACE_CHECKER(ARMLinuxBootIf, ARM_LINUX_BOOT_IF,
> +                          TYPE_ARM_LINUX_BOOT_IF)
> +
>  
>  struct ARMLinuxBootIfClass {
>      /*< private >*/
> diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.h
> index 8e1d45651c..639fe9d821 100644
> --- a/include/hw/fw-path-provider.h
> +++ b/include/hw/fw-path-provider.h
> @@ -25,10 +25,10 @@
>  typedef struct FWPathProviderClass FWPathProviderClass;
>  DECLARE_CLASS_CHECKERS(FWPathProviderClass, FW_PATH_PROVIDER,
>                         TYPE_FW_PATH_PROVIDER)
> -#define FW_PATH_PROVIDER(obj) \
> -     INTERFACE_CHECK(FWPathProvider, (obj), TYPE_FW_PATH_PROVIDER)
> -
>  typedef struct FWPathProvider FWPathProvider;
> +DECLARE_INTERFACE_CHECKER(FWPathProvider, FW_PATH_PROVIDER,
> +                          TYPE_FW_PATH_PROVIDER)
> +
>  
>  struct FWPathProviderClass {
>      InterfaceClass parent_class;
> diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
> index e15f59c8b3..5dc7435a4c 100644
> --- a/include/hw/hotplug.h
> +++ b/include/hw/hotplug.h
> @@ -19,10 +19,10 @@
>  typedef struct HotplugHandlerClass HotplugHandlerClass;
>  DECLARE_CLASS_CHECKERS(HotplugHandlerClass, HOTPLUG_HANDLER,
>                         TYPE_HOTPLUG_HANDLER)
> -#define HOTPLUG_HANDLER(obj) \
> -     INTERFACE_CHECK(HotplugHandler, (obj), TYPE_HOTPLUG_HANDLER)
> -
>  typedef struct HotplugHandler HotplugHandler;
> +DECLARE_INTERFACE_CHECKER(HotplugHandler, HOTPLUG_HANDLER,
> +                          TYPE_HOTPLUG_HANDLER)
> +
>  
>  /**
>   * hotplug_fn:
> diff --git a/include/hw/intc/intc.h b/include/hw/intc/intc.h
> index 7018f608ca..a31b5341ac 100644
> --- a/include/hw/intc/intc.h
> +++ b/include/hw/intc/intc.h
> @@ -8,11 +8,10 @@
>  typedef struct InterruptStatsProviderClass InterruptStatsProviderClass;
>  DECLARE_CLASS_CHECKERS(InterruptStatsProviderClass, INTERRUPT_STATS_PROVIDER,
>                         TYPE_INTERRUPT_STATS_PROVIDER)
> -#define INTERRUPT_STATS_PROVIDER(obj) \
> -    INTERFACE_CHECK(InterruptStatsProvider, (obj), \
> -                    TYPE_INTERRUPT_STATS_PROVIDER)
> -
>  typedef struct InterruptStatsProvider InterruptStatsProvider;
> +DECLARE_INTERFACE_CHECKER(InterruptStatsProvider, INTERRUPT_STATS_PROVIDER,
> +                          TYPE_INTERRUPT_STATS_PROVIDER)
> +
>  
>  struct InterruptStatsProviderClass {
>      InterfaceClass parent;
> diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
> index 3fa5a4abd0..df2cce7b73 100644
> --- a/include/hw/ipmi/ipmi.h
> +++ b/include/hw/ipmi/ipmi.h
> @@ -109,13 +109,13 @@ uint32_t ipmi_next_uuid(void);
>   * and the BMC.
>   */
>  #define TYPE_IPMI_INTERFACE "ipmi-interface"
> -#define IPMI_INTERFACE(obj) \
> -     INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
> +typedef struct IPMIInterface IPMIInterface;
> +DECLARE_INTERFACE_CHECKER(IPMIInterface, IPMI_INTERFACE,
> +                          TYPE_IPMI_INTERFACE)
>  typedef struct IPMIInterfaceClass IPMIInterfaceClass;
>  DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
>                         TYPE_IPMI_INTERFACE)
>  
> -typedef struct IPMIInterface IPMIInterface;
>  
>  struct IPMIInterfaceClass {
>      InterfaceClass parent;
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index ddb6a2d168..9e3e8aaaaa 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -38,8 +38,8 @@ static inline uint16_t applesmc_port(void)
>  typedef struct IsaDmaClass IsaDmaClass;
>  DECLARE_CLASS_CHECKERS(IsaDmaClass, ISADMA,
>                         TYPE_ISADMA)
> -#define ISADMA(obj) \
> -    INTERFACE_CHECK(IsaDma, (obj), TYPE_ISADMA)
> +DECLARE_INTERFACE_CHECKER(IsaDma, ISADMA,
> +                          TYPE_ISADMA)
>  
>  typedef enum {
>      ISADMA_TRANSFER_VERIFY,
> diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
> index cde52e83c9..87874a98b6 100644
> --- a/include/hw/mem/memory-device.h
> +++ b/include/hw/mem/memory-device.h
> @@ -22,10 +22,10 @@
>  typedef struct MemoryDeviceClass MemoryDeviceClass;
>  DECLARE_CLASS_CHECKERS(MemoryDeviceClass, MEMORY_DEVICE,
>                         TYPE_MEMORY_DEVICE)
> -#define MEMORY_DEVICE(obj) \
> -     INTERFACE_CHECK(MemoryDeviceState, (obj), TYPE_MEMORY_DEVICE)
> -
>  typedef struct MemoryDeviceState MemoryDeviceState;
> +DECLARE_INTERFACE_CHECKER(MemoryDeviceState, MEMORY_DEVICE,
> +                          TYPE_MEMORY_DEVICE)
> +
>  
>  /**
>   * MemoryDeviceClass:
> diff --git a/include/hw/nmi.h b/include/hw/nmi.h
> index fff41bebc6..5e08730833 100644
> --- a/include/hw/nmi.h
> +++ b/include/hw/nmi.h
> @@ -29,10 +29,10 @@
>  typedef struct NMIClass NMIClass;
>  DECLARE_CLASS_CHECKERS(NMIClass, NMI,
>                         TYPE_NMI)
> -#define NMI(obj) \
> -     INTERFACE_CHECK(NMIState, (obj), TYPE_NMI)
> -
>  typedef struct NMIState NMIState;
> +DECLARE_INTERFACE_CHECKER(NMIState, NMI,
> +                          TYPE_NMI)
> +
>  
>  struct NMIClass {
>      InterfaceClass parent_class;
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 7e3b189c07..0d24a75827 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -25,8 +25,8 @@
>  typedef struct PnvXScomInterface PnvXScomInterface;
>  
>  #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
> -#define PNV_XSCOM_INTERFACE(obj) \
> -    INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
> +DECLARE_INTERFACE_CHECKER(PnvXScomInterface, PNV_XSCOM_INTERFACE,
> +                          TYPE_PNV_XSCOM_INTERFACE)
>  typedef struct PnvXScomInterfaceClass PnvXScomInterfaceClass;
>  DECLARE_CLASS_CHECKERS(PnvXScomInterfaceClass, PNV_XSCOM_INTERFACE,
>                         TYPE_PNV_XSCOM_INTERFACE)
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index c22a72c9e2..105e1fb4e7 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -34,8 +34,8 @@ struct SpaprMachineState;
>  typedef struct SpaprInterruptController SpaprInterruptController;
>  
>  #define TYPE_SPAPR_INTC "spapr-interrupt-controller"
> -#define SPAPR_INTC(obj)                                     \
> -    INTERFACE_CHECK(SpaprInterruptController, (obj), TYPE_SPAPR_INTC)
> +DECLARE_INTERFACE_CHECKER(SpaprInterruptController, SPAPR_INTC,
> +                          TYPE_SPAPR_INTC)
>  typedef struct SpaprInterruptControllerClass SpaprInterruptControllerClass;
>  DECLARE_CLASS_CHECKERS(SpaprInterruptControllerClass, SPAPR_INTC,
>                         TYPE_SPAPR_INTC)
> diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> index c5a3cdcadc..eea6701371 100644
> --- a/include/hw/ppc/xics.h
> +++ b/include/hw/ppc/xics.h
> @@ -137,8 +137,8 @@ struct ICSIRQState {
>  };
>  
>  #define TYPE_XICS_FABRIC "xics-fabric"
> -#define XICS_FABRIC(obj)                                     \
> -    INTERFACE_CHECK(XICSFabric, (obj), TYPE_XICS_FABRIC)
> +DECLARE_INTERFACE_CHECKER(XICSFabric, XICS_FABRIC,
> +                          TYPE_XICS_FABRIC)
>  typedef struct XICSFabricClass XICSFabricClass;
>  DECLARE_CLASS_CHECKERS(XICSFabricClass, XICS_FABRIC,
>                         TYPE_XICS_FABRIC)
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 482fafccfd..3db9b4e5fd 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -152,8 +152,8 @@
>  typedef struct XiveNotifier XiveNotifier;
>  
>  #define TYPE_XIVE_NOTIFIER "xive-notifier"
> -#define XIVE_NOTIFIER(obj)                                     \
> -    INTERFACE_CHECK(XiveNotifier, (obj), TYPE_XIVE_NOTIFIER)
> +DECLARE_INTERFACE_CHECKER(XiveNotifier, XIVE_NOTIFIER,
> +                          TYPE_XIVE_NOTIFIER)
>  typedef struct XiveNotifierClass XiveNotifierClass;
>  DECLARE_CLASS_CHECKERS(XiveNotifierClass, XIVE_NOTIFIER,
>                         TYPE_XIVE_NOTIFIER)
> @@ -389,8 +389,8 @@ typedef struct XiveTCTXMatch {
>  } XiveTCTXMatch;
>  
>  #define TYPE_XIVE_PRESENTER "xive-presenter"
> -#define XIVE_PRESENTER(obj)                                     \
> -    INTERFACE_CHECK(XivePresenter, (obj), TYPE_XIVE_PRESENTER)
> +DECLARE_INTERFACE_CHECKER(XivePresenter, XIVE_PRESENTER,
> +                          TYPE_XIVE_PRESENTER)
>  typedef struct XivePresenterClass XivePresenterClass;
>  DECLARE_CLASS_CHECKERS(XivePresenterClass, XIVE_PRESENTER,
>                         TYPE_XIVE_PRESENTER)
> @@ -414,8 +414,8 @@ int xive_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
>   */
>  
>  #define TYPE_XIVE_FABRIC "xive-fabric"
> -#define XIVE_FABRIC(obj)                                     \
> -    INTERFACE_CHECK(XiveFabric, (obj), TYPE_XIVE_FABRIC)
> +DECLARE_INTERFACE_CHECKER(XiveFabric, XIVE_FABRIC,
> +                          TYPE_XIVE_FABRIC)
>  typedef struct XiveFabricClass XiveFabricClass;
>  DECLARE_CLASS_CHECKERS(XiveFabricClass, XIVE_FABRIC,
>                         TYPE_XIVE_FABRIC)
> diff --git a/include/hw/rdma/rdma.h b/include/hw/rdma/rdma.h
> index e77e43a170..b8ebe5767d 100644
> --- a/include/hw/rdma/rdma.h
> +++ b/include/hw/rdma/rdma.h
> @@ -22,11 +22,10 @@
>  typedef struct RdmaProviderClass RdmaProviderClass;
>  DECLARE_CLASS_CHECKERS(RdmaProviderClass, RDMA_PROVIDER,
>                         INTERFACE_RDMA_PROVIDER)
> -#define RDMA_PROVIDER(obj) \
> -    INTERFACE_CHECK(RdmaProvider, (obj), \
> -                    INTERFACE_RDMA_PROVIDER)
> -
>  typedef struct RdmaProvider RdmaProvider;
> +DECLARE_INTERFACE_CHECKER(RdmaProvider, RDMA_PROVIDER,
> +                          INTERFACE_RDMA_PROVIDER)
> +
>  
>  struct RdmaProviderClass {
>      InterfaceClass parent;
> diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
> index 04abedf3b2..42de87461b 100644
> --- a/include/hw/rtc/m48t59.h
> +++ b/include/hw/rtc/m48t59.h
> @@ -34,10 +34,10 @@
>  typedef struct NvramClass NvramClass;
>  DECLARE_CLASS_CHECKERS(NvramClass, NVRAM,
>                         TYPE_NVRAM)
> -#define NVRAM(obj) \
> -    INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
> -
>  typedef struct Nvram Nvram;
> +DECLARE_INTERFACE_CHECKER(Nvram, NVRAM,
> +                          TYPE_NVRAM)
> +
>  
>  struct NvramClass {
>      InterfaceClass parent;
> diff --git a/include/hw/stream.h b/include/hw/stream.h
> index e39d5a5b55..fbd8f3c810 100644
> --- a/include/hw/stream.h
> +++ b/include/hw/stream.h
> @@ -9,10 +9,10 @@
>  typedef struct StreamSlaveClass StreamSlaveClass;
>  DECLARE_CLASS_CHECKERS(StreamSlaveClass, STREAM_SLAVE,
>                         TYPE_STREAM_SLAVE)
> -#define STREAM_SLAVE(obj) \
> -     INTERFACE_CHECK(StreamSlave, (obj), TYPE_STREAM_SLAVE)
> -
>  typedef struct StreamSlave StreamSlave;
> +DECLARE_INTERFACE_CHECKER(StreamSlave, STREAM_SLAVE,
> +                          TYPE_STREAM_SLAVE)
> +
>  
>  typedef void (*StreamCanPushNotifyFn)(void *opaque);
>  
> diff --git a/include/hw/vmstate-if.h b/include/hw/vmstate-if.h
> index 52df571d17..a869e52134 100644
> --- a/include/hw/vmstate-if.h
> +++ b/include/hw/vmstate-if.h
> @@ -16,10 +16,10 @@
>  typedef struct VMStateIfClass VMStateIfClass;
>  DECLARE_CLASS_CHECKERS(VMStateIfClass, VMSTATE_IF,
>                         TYPE_VMSTATE_IF)
> -#define VMSTATE_IF(obj)                             \
> -    INTERFACE_CHECK(VMStateIf, (obj), TYPE_VMSTATE_IF)
> -
>  typedef struct VMStateIf VMStateIf;
> +DECLARE_INTERFACE_CHECKER(VMStateIf, VMSTATE_IF,
> +                          TYPE_VMSTATE_IF)
> +
>  
>  struct VMStateIfClass {
>      InterfaceClass parent_class;
> diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
> index f118fb516b..f2e1eeb898 100644
> --- a/include/qom/object_interfaces.h
> +++ b/include/qom/object_interfaces.h
> @@ -9,11 +9,10 @@
>  typedef struct UserCreatableClass UserCreatableClass;
>  DECLARE_CLASS_CHECKERS(UserCreatableClass, USER_CREATABLE,
>                         TYPE_USER_CREATABLE)
> -#define USER_CREATABLE(obj) \
> -     INTERFACE_CHECK(UserCreatable, (obj), \
> -                     TYPE_USER_CREATABLE)
> -
>  typedef struct UserCreatable UserCreatable;
> +DECLARE_INTERFACE_CHECKER(UserCreatable, USER_CREATABLE,
> +                          TYPE_USER_CREATABLE)
> +
>  
>  /**
>   * UserCreatableClass:
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index 1a85564e47..f50a4c4e97 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -29,10 +29,10 @@ typedef enum TPMVersion {
>  typedef struct TPMIfClass TPMIfClass;
>  DECLARE_CLASS_CHECKERS(TPMIfClass, TPM_IF,
>                         TYPE_TPM_IF)
> -#define TPM_IF(obj)                             \
> -    INTERFACE_CHECK(TPMIf, (obj), TYPE_TPM_IF)
> -
>  typedef struct TPMIf TPMIf;
> +DECLARE_INTERFACE_CHECKER(TPMIf, TPM_IF,
> +                          TYPE_TPM_IF)
> +
>  
>  struct TPMIfClass {
>      InterfaceClass parent_class;
> diff --git a/target/arm/idau.h b/target/arm/idau.h
> index 0ef5251971..95a1893494 100644
> --- a/target/arm/idau.h
> +++ b/target/arm/idau.h
> @@ -31,13 +31,13 @@
>  #include "qom/object.h"
>  
>  #define TYPE_IDAU_INTERFACE "idau-interface"
> -#define IDAU_INTERFACE(obj) \
> -    INTERFACE_CHECK(IDAUInterface, (obj), TYPE_IDAU_INTERFACE)
> +typedef struct IDAUInterface IDAUInterface;
> +DECLARE_INTERFACE_CHECKER(IDAUInterface, IDAU_INTERFACE,
> +                          TYPE_IDAU_INTERFACE)
>  typedef struct IDAUInterfaceClass IDAUInterfaceClass;
>  DECLARE_CLASS_CHECKERS(IDAUInterfaceClass, IDAU_INTERFACE,
>                         TYPE_IDAU_INTERFACE)
>  
> -typedef struct IDAUInterface IDAUInterface;
>  
>  #define IREGION_NOTVALID -1
>  
> diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
> index c99be97ed8..bacfd00b05 100644
> --- a/tests/check-qom-interface.c
> +++ b/tests/check-qom-interface.c
> @@ -19,10 +19,10 @@
>  typedef struct TestIfClass TestIfClass;
>  DECLARE_CLASS_CHECKERS(TestIfClass, TEST_IF,
>                         TYPE_TEST_IF)
> -#define TEST_IF(obj) \
> -     INTERFACE_CHECK(TestIf, (obj), TYPE_TEST_IF)
> -
>  typedef struct TestIf TestIf;
> +DECLARE_INTERFACE_CHECKER(TestIf, TEST_IF,
> +                          TYPE_TEST_IF)
> +
>  
>  struct TestIfClass {
>      InterfaceClass parent_class;
> 


