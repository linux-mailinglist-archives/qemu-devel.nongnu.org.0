Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A15A7B22
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:14:58 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKkL-0002Kp-Eu
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKaG-0003MP-Hk; Wed, 31 Aug 2022 06:04:32 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKaD-00037z-HB; Wed, 31 Aug 2022 06:04:32 -0400
Received: by mail-ej1-x636.google.com with SMTP id h5so15744096ejb.3;
 Wed, 31 Aug 2022 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc;
 bh=CG8DkFmdjJ+sXBHlXVRu1V/JVQKirJlrvRphf/U0eM0=;
 b=lb+A2kBznrczqtwpUFCWPHzesloCt83+vKuQ+ED7KoaZmKD/yLblmUTymmDHjF90Ln
 osk01zg51NKjT1ASJurwq6H8+HrXmtwGAmf8GQDrAQA/A7tUPUFUvWUXYpemSXn7sbBf
 b+k1IuwQNMXuXdGax7LsLGrNS2jhuw7qyiuuFYdb6YX/NvFBr8Te5cwRijMh3bs22mio
 ZY0JSVu9FBPtKolv8GVSgOcwB/GzOOOl0HGl7bpSnwoz2l+WYI3bAvoMbvah4OjI+2X7
 q6KJUT4/z/vMLtmjeBl1b1VPFguhSpvuMNXAYUoCU/ct+Lnj2UI0Tvf/1MdGTroR7Wjp
 zrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=CG8DkFmdjJ+sXBHlXVRu1V/JVQKirJlrvRphf/U0eM0=;
 b=7xFiNse4OY6a0kYiH+MXPQamei7ELzxyFC+OZ3RTVLsh+yYmi0URBsWNTYzLIQrYKl
 VdIKXxz+27GkjhbH8FMQ64rttumA7Klqjy8t7/RuXbi42BpiZRA1pEW+yt3r8Zyao9O/
 hQlo5UyYonVPJ1Su7iHl+qmD8wK4+7cPxM/fxjisyqeyJak67sr+IkuNt9G19dvpxRPS
 opmLPeCAb9/JdJ01mJLQXb4MIlvIvzMZL8aVtvGj4T7fQ20N9kcGXrQG1cOpockacVQ8
 7hnW8G1pqrH05DytmV/LJlzv/sgpw33TyxsX0UPqrXspVlVL+iVpuTEcJuAQ95+e6Mzx
 P2wg==
X-Gm-Message-State: ACgBeo3JiXV0q9lQ14467dJOxKYDGj1LCWaUkxRMgFtPTxrzzYKWrptU
 DKLlBKof0wCt3aEV9UIO2/Q=
X-Google-Smtp-Source: AA6agR5eWd7kJRDUbulaIfMnxkzqHAtb2KT1/8tTeER84v8SnS6Tn2LgV89p6YcMttnh6eZi/DORJg==
X-Received: by 2002:a17:906:7e43:b0:738:6395:8d94 with SMTP id
 z3-20020a1709067e4300b0073863958d94mr20344675ejr.54.1661940267895; 
 Wed, 31 Aug 2022 03:04:27 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200a5066d0f8b32ea85.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:a506:6d0f:8b32:ea85])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906218100b0072af4af2f46sm6911624eju.74.2022.08.31.03.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 03:04:27 -0700 (PDT)
Date: Wed, 31 Aug 2022 12:04:23 +0200
From: BB <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_07/10=5D_hw/isa/vt82c686=3A_?=
 =?US-ASCII?Q?Instantiate_PM_function_in_host_device?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a41e60b2-7e36-fd5a-e440-1a5b20bf2543@eik.bme.hu>
References: <20220830190048.67448-1-shentey@gmail.com>
 <20220830190048.67448-8-shentey@gmail.com>
 <a41e60b2-7e36-fd5a-e440-1a5b20bf2543@eik.bme.hu>
Message-ID: <749FA66B-4740-458D-9E17-928950280797@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 31=2E August 2022 00:39:22 MESZ schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Tue, 30 Aug 2022, Bernhard Beschow wrote:
>> The PM controller has activity bits which monitor activity of other
>> built-in devices in the host device=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>> hw/isa/vt82c686=2Ec         | 12 ++++++++++++
>> hw/mips/fuloong2e=2Ec       |  2 +-
>> hw/ppc/pegasos2=2Ec         |  3 +--
>> include/hw/isa/vt82c686=2Eh |  2 --
>> 4 files changed, 14 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index 6aba7f29de=2E=2E4e66570655 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -40,6 +40,9 @@
>> #define TYPE_VIA_PM "via-pm"
>> OBJECT_DECLARE_SIMPLE_TYPE(ViaPMState, VIA_PM)
>>=20
>> +#define TYPE_VT82C686B_PM "vt82c686b-pm"
>> +#define TYPE_VT8231_PM "vt8231-pm"
>
>These defines should be further down before vt82c686b_pm_init_info and vt=
8231_pm_init_info respectively to keep object class definitions together=2E=
 Here the generic abstract superclass is defined, followed be the specific =
chips so it's too early to define these at this point=2E

Right=2E Fixed in v3=2E

Regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>> +
>> struct ViaPMState {
>>     PCIDevice dev;
>>     MemoryRegion io;
>> @@ -548,6 +551,7 @@ struct ViaISAState {
>>     ViaSuperIOState via_sio;
>>     PCIIDEState ide;
>>     UHCIState uhci[2];
>> +    ViaPMState pm;
>> };
>>=20
>> static const VMStateDescription vmstate_via =3D {
>> @@ -641,6 +645,12 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)
>>             return;
>>         }
>>     }
>> +
>> +    /* Function 4: Power Management */
>> +    qdev_prop_set_int32(DEVICE(&s->pm), "addr", d->devfn + 4);
>> +    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>> +        return;
>> +    }
>> }
>>=20
>> /* TYPE_VT82C686B_ISA */
>> @@ -683,6 +693,7 @@ static void vt82c686b_init(Object *obj)
>>     ViaISAState *s =3D VIA_ISA(obj);
>>=20
>>     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT82C686B_SUP=
ERIO);
>> +    object_initialize_child(obj, "pm", &s->pm, TYPE_VT82C686B_PM);
>> }
>>=20
>> static void vt82c686b_class_init(ObjectClass *klass, void *data)
>> @@ -746,6 +757,7 @@ static void vt8231_init(Object *obj)
>>     ViaISAState *s =3D VIA_ISA(obj);
>>=20
>>     object_initialize_child(obj, "sio", &s->via_sio, TYPE_VT8231_SUPERI=
O);
>> +    object_initialize_child(obj, "pm", &s->pm, TYPE_VT8231_PM);
>> }
>>=20
>> static void vt8231_class_init(ObjectClass *klass, void *data)
>> diff --git a/hw/mips/fuloong2e=2Ec b/hw/mips/fuloong2e=2Ec
>> index dc92223b76=2E=2E377108d313 100644
>> --- a/hw/mips/fuloong2e=2Ec
>> +++ b/hw/mips/fuloong2e=2Ec
>> @@ -208,7 +208,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_=
bus, int slot, qemu_irq intc,
>>     dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"=
));
>>     pci_ide_create_devs(dev);
>>=20
>> -    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(slot, 4), TYPE_VT82C6=
86B_PM);
>> +    dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"=
));
>>     *i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>>=20
>>     /* Audio support */
>> diff --git a/hw/ppc/pegasos2=2Ec b/hw/ppc/pegasos2=2Ec
>> index 85cca6f7a6=2E=2Ee32944ee2b 100644
>> --- a/hw/ppc/pegasos2=2Ec
>> +++ b/hw/ppc/pegasos2=2Ec
>> @@ -168,8 +168,7 @@ static void pegasos2_init(MachineState *machine)
>>     dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"=
));
>>     pci_ide_create_devs(dev);
>>=20
>> -    /* VT8231 function 4: Power Management Controller */
>> -    dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 4), TYPE_VT8231_P=
M);
>> +    dev =3D PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"=
));
>>     i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>>     spd_data =3D spd_data_generate(DDR, machine->ram_size);
>>     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
>> diff --git a/include/hw/isa/vt82c686=2Eh b/include/hw/isa/vt82c686=2Eh
>> index 56ac141be3=2E=2E559f7c8926 100644
>> --- a/include/hw/isa/vt82c686=2Eh
>> +++ b/include/hw/isa/vt82c686=2Eh
>> @@ -4,9 +4,7 @@
>> #include "hw/pci/pci=2Eh"
>>=20
>> #define TYPE_VT82C686B_ISA "vt82c686b-isa"
>> -#define TYPE_VT82C686B_PM "vt82c686b-pm"
>> #define TYPE_VT8231_ISA "vt8231-isa"
>> -#define TYPE_VT8231_PM "vt8231-pm"
>> #define TYPE_VIA_AC97 "via-ac97"
>> #define TYPE_VIA_MC97 "via-mc97"
>>=20
>>=20

