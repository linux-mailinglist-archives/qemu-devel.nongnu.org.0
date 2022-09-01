Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8F5AA028
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:37:15 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTq01-0008Ij-TA
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTpd7-0004nV-7j
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 15:13:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTpd5-0004WH-AM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 15:13:32 -0400
Received: by mail-pj1-x1029.google.com with SMTP id t5so18105422pjs.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=EU488FriKZtED1hiPNLsi5UBZ9W07oagN/0mz2bozFc=;
 b=IMGfJMo+EMezPRjYxFEoRCw2RKKuexCsduDPO1gsmRziYgLlDBbtInvvcfTM4xrWSy
 YNAbAJ7/LMUgDJnjV4ZhPMJG4tGsF7WXbOsrzwEVqEyqQsTfFV1QKmEfLC+JFIEVfl0E
 PbNrQNCWP3ARf2ymH6ovr9mfhdmoOkfxpgD9cwcctFwUNmS/YWCZhy5S1PY90BshCHuV
 LINdoloXTICt3lQNI4sHIOQ1N61OzgRznSESWrPraoxL95CMewpHaFNCS/fKYJSimdtp
 SfBFOl+Qm5St2QyJwz2UWrtopuem4LWFXmPHLWXe7jYtSs1L4AYfxPU8MHdxzYKHd95W
 9zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=EU488FriKZtED1hiPNLsi5UBZ9W07oagN/0mz2bozFc=;
 b=jAId4LSyjoMtXIvIMxvUg32r5WA3gx6knHJHEj1RnsSnX+VasKeHGPkUoEKHnvpUeo
 A6MviBWcBXEO/G+ftj5t/8tBonTn90VlFBx4/pREufNnp9oafS+UsE4F6g+6F9DE+G29
 kTscT8GVqVNDI+TfVIr24CqMlaTKMgIH7utnEiNbPyjaaiGTf1dRprrdu01lSesADYZk
 okDFFJyBdQo3XgWokopkr8W3md5kBQD6FrnYYhyNhocc0ugi346nuMP/rvGUQ9weMxSK
 maVFOzQzoQzUZOTmwe+tCYOxHe8yQH6khJPGMfg3UIA3B55jheKXz0K8F3Dvf1cSivNe
 +wig==
X-Gm-Message-State: ACgBeo12kILHuef8mW01GDtBRcCnNBYjPUfJ3bKXAwvfvsJ5G0XmBuUh
 6oEx2DtRX/uDmyxc6McKJLs=
X-Google-Smtp-Source: AA6agR5jN0YghlcmX2VGG54WiBPKkbjeFcb7Z0P6/jIxyO4fv4rESy2Y8dFg0/HZX3cgQ3VrFsCXQg==
X-Received: by 2002:a17:90b:240d:b0:1fe:3491:4e36 with SMTP id
 nr13-20020a17090b240d00b001fe34914e36mr699583pjb.2.1662059609752; 
 Thu, 01 Sep 2022 12:13:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170902f60400b001637529493esm14301110plg.66.2022.09.01.12.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 12:13:29 -0700 (PDT)
Message-ID: <803efdb8-e85a-7322-1f49-0f81c486275f@amsat.org>
Date: Thu, 1 Sep 2022 21:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 05/42] hw/isa/piix3: Create USB controller in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-6-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/9/22 18:25, Bernhard Beschow wrote:
> The USB controller is an integral part of PIIX3 (function 2). So create
> it as part of the south bridge.
> 
> Note that the USB function is optional in QEMU. This is why it gets
> object_initialize_child()'ed in realize rather than in instance_init.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c             |  6 ++----
>   hw/isa/Kconfig                |  1 +
>   hw/isa/piix3.c                | 17 +++++++++++++++++
>   include/hw/southbridge/piix.h |  4 ++++
>   4 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b08d946992..76ac8b2035 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -219,6 +219,8 @@ static void pc_init1(MachineState *machine,
>           pcms->bus = pci_bus;
>   
>           pci_dev = pci_new_multifunction(-1, true, type);
> +        object_property_set_bool(OBJECT(pci_dev), "has-usb",
> +                                 machine_usb(machine), &error_abort);
>           pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
>           piix3 = PIIX3_PCI_DEVICE(pci_dev);
>           piix3->pic = x86ms->gsi;
> @@ -297,10 +299,6 @@ static void pc_init1(MachineState *machine,
>       }
>   #endif
>   
> -    if (pcmc->pci_enabled && machine_usb(machine)) {
> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
> -    }
> -
>       if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
>           PCIDevice *piix4_pm;
>   
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 6e8f9cac54..f02eca3c3e 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -36,6 +36,7 @@ config PIIX3
>       select I8257
>       select ISA_BUS
>       select MC146818RTC
> +    select USB_UHCI
>   
>   config PIIX4
>       bool
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 96ab7107e2..27052a5546 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -297,6 +297,7 @@ static const MemoryRegionOps rcr_ops = {
>   static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>   {
>       PIIX3State *d = PIIX3_PCI_DEVICE(dev);
> +    PCIBus *pci_bus = pci_get_bus(dev);
>       ISABus *isa_bus;
>   
>       isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
> @@ -319,6 +320,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>       if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
>           return;
>       }
> +
> +    /* USB */
> +    if (d->has_usb) {
> +        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
> +                                "piix3-usb-uhci");
> +        qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
> +        if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
> +            return;
> +        }
> +    }
>   }
>   
>   static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
> @@ -341,6 +352,11 @@ static void pci_piix3_init(Object *obj)
>       object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
>   }
>   
> +static Property pci_piix3_props[] = {
> +    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),

Maybe s/has-usb/usb-enabled/?

> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void pci_piix3_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -359,6 +375,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
>        * pc_piix.c's pc_init1()
>        */
>       dc->user_creatable = false;
> +    device_class_set_props(dc, pci_piix3_props);
>       adevc->build_dev_aml = build_pci_isa_aml;
>   }
>   
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index b1fa08dd2b..5367917182 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -15,6 +15,7 @@
>   #include "hw/pci/pci.h"
>   #include "qom/object.h"
>   #include "hw/rtc/mc146818rtc.h"
> +#include "hw/usb/hcd-uhci.h"
>   
>   /* PIRQRC[A:D]: PIRQx Route Control Registers */
>   #define PIIX_PIRQCA 0x60
> @@ -54,12 +55,15 @@ struct PIIXState {
>       int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>   
>       RTCState rtc;
> +    UHCIState uhci;
>   
>       /* Reset Control Register contents */
>       uint8_t rcr;
>   
>       /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
>       MemoryRegion rcr_mem;
> +
> +    bool has_usb;
>   };
>   typedef struct PIIXState PIIX3State;
>   


