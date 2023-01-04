Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5665D754
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 16:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD5nr-0000Ev-5A; Wed, 04 Jan 2023 10:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5np-0000EW-2d
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:35:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5nn-0007Vn-Bv
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:35:40 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s9so1362763wru.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qKfYp56DzEdln6bw+epRjXvgWK4+5r5Y+0Le7rGeP9o=;
 b=uUvu3TZZ6cU7XFsjBFeKFFSqBvz1X0ROcGMGdM4mLTlVoVeGwEz9o6k2bGbmQIg4om
 TzVOHY6Cc2lGZTwx1Jj931bRdVCLmTaRi4NoaiXpD5LbwGwC5p5EbIjsbQz/Fl5chbHt
 qwMRsbZtZebWs3sWytVS2FNwfYSGFEmenYR03MWPelgo93c5N9u/OtlHARpd+iCZPoxT
 HZ5YaVoZSL8s59ak8bCLBbh4Iq6DjtCsnsjdSBN7D015K8yzoJN7xivoNYasnE06Lgaj
 9nJr7AZ1SEXoTAuMxBDbxJyCxj8CTZoJKcaS2AoX+xRNQ3SuZqcYI8rj691I/weGzwsL
 /Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKfYp56DzEdln6bw+epRjXvgWK4+5r5Y+0Le7rGeP9o=;
 b=Rs+Bx9j9vgedD6ei7yToD2OnDkC6nlGeT+qU/1nA1t1X6VCw60UxNSQd0jhWwhmJ94
 2MdtKbJQQESKMLq0Vo5X3PNP5STwTIUn4zXAnvaqYESktvRyJuqnjZO1D19XAf8MLPSw
 /0YPsCMlVH0VLnDfynW2bzOxxWBZ6djeWJUxU2LKbINqVZfZKpPAQq/zdxf9gvu4bAOO
 YfElb8GRp2DEpfD1AWBCpsdabhY+YHeYwLSmpwiunH0CUWQXwXDfYNF3+QfBy0TdJrJx
 gJeIP7/cMnTbVtaYrqWg0mDi3UI+efMXO1nNn7W4wxXuSQ3PUv0Fr9StR1VV6lFaQFTp
 aK2A==
X-Gm-Message-State: AFqh2kruEAO6IBp5b/WZB8qBPxiR+YUcNdf14hY+6Wj44C8aNz8G9Lza
 0B8qKMPFLG2ysBKmebrwE+bquQ==
X-Google-Smtp-Source: AMrXdXtY6RzOZmuFEL1JagfUdSvbatncLArmeYUWzIWeXgc02Qt4gc26aWsY4X0BGqOTYR424X5PZQ==
X-Received: by 2002:adf:de8a:0:b0:266:3709:5ce3 with SMTP id
 w10-20020adfde8a000000b0026637095ce3mr28787116wrl.0.1672846536505; 
 Wed, 04 Jan 2023 07:35:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm9758428wrb.24.2023.01.04.07.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:35:36 -0800 (PST)
Message-ID: <1c2e0780-e5fb-1321-0d84-b0591db9fec7@linaro.org>
Date: Wed, 4 Jan 2023 16:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

+Markus/Thomas

On 4/1/23 15:44, Bernhard Beschow wrote:
> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
> TYPE_PIIX3_DEVICE. Remove this redundancy.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c             |  4 +---
>   hw/isa/piix.c                 | 20 --------------------
>   include/hw/southbridge/piix.h |  1 -
>   3 files changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 5738d9cdca..6b8de3d59d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>       if (pcmc->pci_enabled) {
>           DeviceState *dev;
>           PCIDevice *pci_dev;
> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> -                                         : TYPE_PIIX3_DEVICE;
>           int i;
>   
>           pci_bus = i440fx_init(pci_type,
> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>                                          : pci_slot_get_pirq);
>           pcms->bus = pci_bus;
>   
> -        pci_dev = pci_new_multifunction(-1, true, type);
> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>                                    machine_usb(machine), &error_abort);
>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
> index 98e9b12661..e4587352c9 100644
> --- a/hw/isa/piix.c
> +++ b/hw/isa/piix.c
> @@ -33,7 +33,6 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/ide/piix.h"
>   #include "hw/isa/isa.h"
> -#include "hw/xen/xen.h"
>   #include "sysemu/runstate.h"
>   #include "migration/vmstate.h"
>   #include "hw/acpi/acpi_aml_interface.h"
> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>       .class_init    = piix3_class_init,
>   };
>   
> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -
> -    k->realize = piix3_realize;
> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
> -    dc->vmsd = &vmstate_piix3;

IIUC, since this device is user-creatable, we can't simply remove it
without going thru the deprecation process. Alternatively we could
add a type alias:

-- >8 --
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4b0ef65780..d94f7ea369 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -64,6 +64,7 @@ typedef struct QDevAlias
                                QEMU_ARCH_LOONGARCH)
  #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
  #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
+#define QEMU_ARCH_XEN (QEMU_ARCH_ARM | QEMU_ARCH_I386)

  /* Please keep this table sorted by typename. */
  static const QDevAlias qdev_alias_table[] = {
@@ -111,6 +112,7 @@ static const QDevAlias qdev_alias_table[] = {
      { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
      { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
      { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
+    { "PIIX3", "PIIX3-xen", QEMU_ARCH_XEN },
      { }
  };
---

But I'm not sure due to this comment from commit ee46d8a503
(2011-12-22 15:24:20 -0600):

47) /*
48)  * Aliases were a bad idea from the start.  Let's keep them
49)  * from spreading further.
50)  */

Maybe using qdev_alias_table[] during device deprecation is
acceptable?

> -}
> -
> -static const TypeInfo piix3_xen_info = {
> -    .name          = TYPE_PIIX3_XEN_DEVICE,
> -    .parent        = TYPE_PIIX_PCI_DEVICE,
> -    .instance_init = piix3_init,
> -    .class_init    = piix3_xen_class_init,
> -};
> -
>   static void piix4_realize(PCIDevice *dev, Error **errp)
>   {
>       ERRP_GUARD();
> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>   {
>       type_register_static(&piix_pci_type_info);
>       type_register_static(&piix3_info);
> -    type_register_static(&piix3_xen_info);
>       type_register_static(&piix4_info);
>   }
>   
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 65ad8569da..b1fc94a742 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -77,7 +77,6 @@ struct PIIXState {
>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>   
>   #define TYPE_PIIX3_DEVICE "PIIX3"
> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>   
>   #endif


