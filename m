Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121565BC031
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 23:49:41 +0200 (CEST)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa2AV-0004C0-ND
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 17:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa27L-0001k5-Py
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 17:46:23 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa27K-000829-3d
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 17:46:23 -0400
Received: by mail-ed1-x529.google.com with SMTP id x94so21446537ede.11
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=XNpSJeg/w9A3S8qY+Varx6n4lE8nHhEA+NNKLttnBg8=;
 b=PwbXovnaonnMIA/XoN/ccaMLuzc9mEHXmgUqOd6duSXi8PA0lVgCqZMmmGvAGYVFxP
 Q4UxGV4/WwRPc31pApYgLqrH5kZSWsVTVHPIo8nI0xMyPHBtC1yd3vUz31//i45UPkqH
 d9UXVWVnbMDn99dkIQxJ37TrKGwFiP9F4AkUOw1X1FofhTsX3QhC7QqJAeAyWwsVRJNF
 87Vnyw/ZMwSdtVJ8/aPJYP40FjI5buyOHlxFMGTqhjm2yrHYy20qiv4XNhkXzlxXqh+T
 Nd23EoeNMIqv0eRADzQpefLQ4bU4O4ucaH5oBlPm1Vn4M83q2FKKgGKP0LzVcgk2XGGG
 2YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XNpSJeg/w9A3S8qY+Varx6n4lE8nHhEA+NNKLttnBg8=;
 b=A8QwQQd4NEThFYyVe/eRp8VpDLeRePQTau1nV+CzrMTKDo8i2TgY46pU9to/FnhQT5
 whQOu8kstVOl3KEa86sWvfa1j+9wiugUmNnzZaeaCHA5vTNenkSB02x6rm2Qm0vgp+tA
 2O+sXGJHIoh135nUAKltJn5YkstaUhXvDYtoCr0s1ili0/bq36l/87BpHcYP5m0SUDrw
 20QxetdFUG5GOoDHdxC4FnBsKnDInF/LxRjnsEF2Tr2ZV17IAnQd5pEZ6E9hp1pP4Xpi
 lEgiflMAo5DbcgYGwDwF4UBEG1vjtRedKtJ183WeL4yaElvYKMhpHiMJupMRwaVJ4hHk
 yP2Q==
X-Gm-Message-State: ACrzQf3gsBmblyKMM5tMTgeyZ81mtJTz8N21DgtrU2uaklCaSv1GcXW/
 QLVSPTIKhoHY3pIVAefz7ho=
X-Google-Smtp-Source: AMsMyM4Yr0Zti9qfOn2hHMGPMiJ+sRJS/qQaDqh7QpCfkgaOyDLlnBVrGwoGnN0XAgx63R4DrXZKFA==
X-Received: by 2002:a05:6402:428a:b0:42e:8f7e:1638 with SMTP id
 g10-20020a056402428a00b0042e8f7e1638mr13163396edc.228.1663537580346; 
 Sun, 18 Sep 2022 14:46:20 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-124-024.78.54.pool.telefonica.de.
 [78.54.124.24]) by smtp.gmail.com with ESMTPSA id
 v17-20020aa7d9d1000000b0044f21c69608sm18866256eds.10.2022.09.18.14.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 14:46:20 -0700 (PDT)
Date: Sun, 18 Sep 2022 21:46:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 05/42] hw/isa/piix3: Create USB controller in host device
In-Reply-To: <803efdb8-e85a-7322-1f49-0f81c486275f@amsat.org>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-6-shentey@gmail.com>
 <803efdb8-e85a-7322-1f49-0f81c486275f@amsat.org>
Message-ID: <9807B008-53A1-443B-80AC-BAD060AB8D7E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E September 2022 19:13:22 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
f4bug@amsat=2Eorg>:
>On 1/9/22 18:25, Bernhard Beschow wrote:
>> The USB controller is an integral part of PIIX3 (function 2)=2E So crea=
te
>> it as part of the south bridge=2E
>>=20
>> Note that the USB function is optional in QEMU=2E This is why it gets
>> object_initialize_child()'ed in realize rather than in instance_init=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/i386/pc_piix=2Ec             |  6 ++----
>>   hw/isa/Kconfig                |  1 +
>>   hw/isa/piix3=2Ec                | 17 +++++++++++++++++
>>   include/hw/southbridge/piix=2Eh |  4 ++++
>>   4 files changed, 24 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index b08d946992=2E=2E76ac8b2035 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -219,6 +219,8 @@ static void pc_init1(MachineState *machine,
>>           pcms->bus =3D pci_bus;
>>             pci_dev =3D pci_new_multifunction(-1, true, type);
>> +        object_property_set_bool(OBJECT(pci_dev), "has-usb",
>> +                                 machine_usb(machine), &error_abort);
>>           pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
>>           piix3 =3D PIIX3_PCI_DEVICE(pci_dev);
>>           piix3->pic =3D x86ms->gsi;
>> @@ -297,10 +299,6 @@ static void pc_init1(MachineState *machine,
>>       }
>>   #endif
>>   -    if (pcmc->pci_enabled && machine_usb(machine)) {
>> -        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
>> -    }
>> -
>>       if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(=
pcms))) {
>>           PCIDevice *piix4_pm;
>>   diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index 6e8f9cac54=2E=2Ef02eca3c3e 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -36,6 +36,7 @@ config PIIX3
>>       select I8257
>>       select ISA_BUS
>>       select MC146818RTC
>> +    select USB_UHCI
>>     config PIIX4
>>       bool
>> diff --git a/hw/isa/piix3=2Ec b/hw/isa/piix3=2Ec
>> index 96ab7107e2=2E=2E27052a5546 100644
>> --- a/hw/isa/piix3=2Ec
>> +++ b/hw/isa/piix3=2Ec
>> @@ -297,6 +297,7 @@ static const MemoryRegionOps rcr_ops =3D {
>>   static void pci_piix3_realize(PCIDevice *dev, Error **errp)
>>   {
>>       PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);
>> +    PCIBus *pci_bus =3D pci_get_bus(dev);
>>       ISABus *isa_bus;
>>         isa_bus =3D isa_bus_new(DEVICE(d), get_system_memory(),
>> @@ -319,6 +320,16 @@ static void pci_piix3_realize(PCIDevice *dev, Erro=
r **errp)
>>       if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
>>           return;
>>       }
>> +
>> +    /* USB */
>> +    if (d->has_usb) {
>> +        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
>> +                                "piix3-usb-uhci");
>> +        qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
>> +        if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
>> +            return;
>> +        }
>> +    }
>>   }
>>     static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
>> @@ -341,6 +352,11 @@ static void pci_piix3_init(Object *obj)
>>       object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
>>   }
>>   +static Property pci_piix3_props[] =3D {
>> +    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
>
>Maybe s/has-usb/usb-enabled/?

I consisered that=2E I chose has-foo for now since I took inspiration from=
 the board=2E Also, "enabled" may refer to a device being present but its e=
nable bit is cleared in PCI configuration space, c=2Ef=2E vt82c686=2E Let m=
e know if you still suggest a change here, in which case I'll consult you f=
or naming suggestions once I consolidate piix and vt82c686 ;)

Best regards,
Bernhard
>
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>>   static void pci_piix3_class_init(ObjectClass *klass, void *data)
>>   {
>>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>> @@ -359,6 +375,7 @@ static void pci_piix3_class_init(ObjectClass *klass=
, void *data)
>>        * pc_piix=2Ec's pc_init1()
>>        */
>>       dc->user_creatable =3D false;
>> +    device_class_set_props(dc, pci_piix3_props);
>>       adevc->build_dev_aml =3D build_pci_isa_aml;
>>   }
>>   diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge=
/piix=2Eh
>> index b1fa08dd2b=2E=2E5367917182 100644
>> --- a/include/hw/southbridge/piix=2Eh
>> +++ b/include/hw/southbridge/piix=2Eh
>> @@ -15,6 +15,7 @@
>>   #include "hw/pci/pci=2Eh"
>>   #include "qom/object=2Eh"
>>   #include "hw/rtc/mc146818rtc=2Eh"
>> +#include "hw/usb/hcd-uhci=2Eh"
>>     /* PIRQRC[A:D]: PIRQx Route Control Registers */
>>   #define PIIX_PIRQCA 0x60
>> @@ -54,12 +55,15 @@ struct PIIXState {
>>       int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>>         RTCState rtc;
>> +    UHCIState uhci;
>>         /* Reset Control Register contents */
>>       uint8_t rcr;
>>         /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT=
) */
>>       MemoryRegion rcr_mem;
>> +
>> +    bool has_usb;
>>   };
>>   typedef struct PIIXState PIIX3State;
>>  =20
>


