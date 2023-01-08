Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F2661635
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 16:36:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEXgM-0000lI-Ug; Sun, 08 Jan 2023 10:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEXgK-0000jz-Sw; Sun, 08 Jan 2023 10:33:56 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEXe3-0007q3-Bj; Sun, 08 Jan 2023 10:31:37 -0500
Received: by mail-ed1-x52b.google.com with SMTP id c34so9153465edf.0;
 Sun, 08 Jan 2023 07:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40jtERxKtD4zGQ1BZOKhKNqMQ079LGO76GMwuXDjlHo=;
 b=mt3HiBv5c7n32oIGH/CSQAhpf5Sbw0CkzyBqtWUE++SwTbSl9BhZxd2FjKohGd4mBw
 gezeM4HM7LEzZLfpLkb4l92QFJ4TdpxoR0SpkzkNvMB7SfjgV7Z+UX6vJF3dhbaJfuI3
 KGTYTPcQkl4UxYfXwuytUu3ZcKFSjTw5hz0LiOorfgZ597tib3W39B2L31VK61PIJ3ht
 TKu3HuY2crB0budsAQk5x4bHgj/Ijh4D5cnEBsn+ppWTtmSDratpdWFk0g3XV7bI1qo/
 h8Amo1uYUMND0ftdzOO1UJcY8TczwF/Rj2Nm/3RHvu/thYSnms3BLuQGE1Kb0gB5Dkr7
 k7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40jtERxKtD4zGQ1BZOKhKNqMQ079LGO76GMwuXDjlHo=;
 b=1Ao01gQYxYhXOcepkcEdwUN6BA79hv43ApZppyU2PYxuSNWnl85KPG00g8h3HVWN7d
 HCpA3zQO/yEqFVJFjUy9juti+PwCrxhuXsQABMqtFle0Lpj4WQPnGuyqL8CesZ/DNYzX
 WWZ8KXzl7QMIkhW97TBC141ypEx8C/19ScrcHpO98io3OMNz3DbVcYzIYSMsP3nH6pc1
 Xnp5KFJdyW+bWCLMIUXduuyXzWuG2tjln8awHMxzo9ZcT9Jumh6GWMs7SWc4WDuIPNRo
 DG9TK8wvqAlTiNsgQchjyYX8zug3IeL/TRZ+OaX2fkpGfBQ4BTEK91MP0yOqo5Ab6zw7
 xo8g==
X-Gm-Message-State: AFqh2kp/ec2LyK8OtFmNsQWAaY4stkhrhsK0eBDV7SidbVOLJ7d4XgSv
 7sS2Ix/N32GqPAPM23x6NBg=
X-Google-Smtp-Source: AMrXdXtWDXv9IfQUXos+u1CffmOC5jzfUReb13A1vPE4wzLsbYhBGtzJNdRUUswCXrc/6UISsdIaQA==
X-Received: by 2002:a50:fa85:0:b0:496:d2f7:77a2 with SMTP id
 w5-20020a50fa85000000b00496d2f777a2mr7859560edr.18.1673191887355; 
 Sun, 08 Jan 2023 07:31:27 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200b8984a967c4b65c7.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:b898:4a96:7c4b:65c7])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a50fc17000000b0047c6f3eccb2sm2641353edr.50.2023.01.08.07.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 07:31:26 -0800 (PST)
Date: Sun, 08 Jan 2023 15:31:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 24/31] hw/isa/piix4: Reuse struct PIIXState from PIIX3
In-Reply-To: <29745460-a3c2-b895-80ac-26fded5f7819@ilande.co.uk>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105143228.244965-25-shentey@gmail.com>
 <29745460-a3c2-b895-80ac-26fded5f7819@ilande.co.uk>
Message-ID: <4D010ECA-B2B3-43C2-B0CA-1D9DC19FCAB3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 7=2E Januar 2023 23:48:52 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 05/01/2023 14:32, Bernhard Beschow wrote:
>
>> Now that PIIX4 also uses the "proxy-pic", both implementations
>
>Should "proxy-pic" be replaced with "isa-pic" (or even TYPE_ISA_PIC) here=
?

Yes, indeed=2E

Best regards,
Bernhard

>> can share the same struct=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> Message-Id: <20221022150508=2E26830-34-shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix4=2Ec | 51 +++++++++++++++--------------------------------=
---
>>   1 file changed, 15 insertions(+), 36 deletions(-)
>>=20
>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>> index eae4db0182=2E=2Ece88377630 100644
>> --- a/hw/isa/piix4=2Ec
>> +++ b/hw/isa/piix4=2Ec
>> @@ -42,32 +42,10 @@
>>   #include "sysemu/runstate=2Eh"
>>   #include "qom/object=2Eh"
>>   -struct PIIX4State {
>> -    PCIDevice dev;
>> -
>> -    ISAPICState pic;
>> -    RTCState rtc;
>> -    PCIIDEState ide;
>> -    UHCIState uhci;
>> -    PIIX4PMState pm;
>> -
>> -    uint32_t smb_io_base;
>> -
>> -    /* Reset Control Register */
>> -    MemoryRegion rcr_mem;
>> -    uint8_t rcr;
>> -
>> -    bool has_acpi;
>> -    bool has_usb;
>> -    bool smm_enabled;
>> -};
>> -
>> -OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
>> -
>>   static void piix4_set_irq(void *opaque, int irq_num, int level)
>>   {
>>       int i, pic_irq, pic_level;
>> -    PIIX4State *s =3D opaque;
>> +    PIIXState *s =3D opaque;
>>       PCIBus *bus =3D pci_get_bus(&s->dev);
>>         /* now we change the pic irq level according to the piix irq ma=
ppings */
>> @@ -87,7 +65,7 @@ static void piix4_set_irq(void *opaque, int irq_num, =
int level)
>>     static void piix4_isa_reset(DeviceState *dev)
>>   {
>> -    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
>> +    PIIXState *d =3D PIIX_PCI_DEVICE(dev);
>>       uint8_t *pci_conf =3D d->dev=2Econfig;
>>         pci_conf[0x04] =3D 0x07; // master, memory and I/O
>> @@ -122,12 +100,13 @@ static void piix4_isa_reset(DeviceState *dev)
>>       pci_conf[0xac] =3D 0x00;
>>       pci_conf[0xae] =3D 0x00;
>>   +    d->pic_levels =3D 0; /* not used in PIIX4 */
>>       d->rcr =3D 0;
>>   }
>>     static int piix4_post_load(void *opaque, int version_id)
>>   {
>> -    PIIX4State *s =3D opaque;
>> +    PIIXState *s =3D opaque;
>>         if (version_id =3D=3D 2) {
>>           s->rcr =3D 0;
>> @@ -142,8 +121,8 @@ static const VMStateDescription vmstate_piix4 =3D {
>>       =2Eminimum_version_id =3D 2,
>>       =2Epost_load =3D piix4_post_load,
>>       =2Efields =3D (VMStateField[]) {
>> -        VMSTATE_PCI_DEVICE(dev, PIIX4State),
>> -        VMSTATE_UINT8_V(rcr, PIIX4State, 3),
>> +        VMSTATE_PCI_DEVICE(dev, PIIXState),
>> +        VMSTATE_UINT8_V(rcr, PIIXState, 3),
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
>> @@ -151,7 +130,7 @@ static const VMStateDescription vmstate_piix4 =3D {
>>   static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
>>                               unsigned int len)
>>   {
>> -    PIIX4State *s =3D opaque;
>> +    PIIXState *s =3D opaque;
>>         if (val & 4) {
>>           qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> @@ -163,7 +142,7 @@ static void piix4_rcr_write(void *opaque, hwaddr ad=
dr, uint64_t val,
>>     static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned =
int len)
>>   {
>> -    PIIX4State *s =3D opaque;
>> +    PIIXState *s =3D opaque;
>>         return s->rcr;
>>   }
>> @@ -180,7 +159,7 @@ static const MemoryRegionOps piix4_rcr_ops =3D {
>>     static void piix4_realize(PCIDevice *dev, Error **errp)
>>   {
>> -    PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);
>> +    PIIXState *s =3D PIIX_PCI_DEVICE(dev);
>>       PCIBus *pci_bus =3D pci_get_bus(dev);
>>       ISABus *isa_bus;
>>   @@ -250,7 +229,7 @@ static void piix4_realize(PCIDevice *dev, Error *=
*errp)
>>     static void piix4_init(Object *obj)
>>   {
>> -    PIIX4State *s =3D PIIX4_PCI_DEVICE(obj);
>> +    PIIXState *s =3D PIIX_PCI_DEVICE(obj);
>>         object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
>>       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>> @@ -258,10 +237,10 @@ static void piix4_init(Object *obj)
>>   }
>>     static Property piix4_props[] =3D {
>> -    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
>> -    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
>> -    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
>> -    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
>> +    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
>> +    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
>> +    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
>> +    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   @@ -289,7 +268,7 @@ static void piix4_class_init(ObjectClass *klass, =
void *data)
>>   static const TypeInfo piix4_info =3D {
>>       =2Ename          =3D TYPE_PIIX4_PCI_DEVICE,
>>       =2Eparent        =3D TYPE_PCI_DEVICE,
>> -    =2Einstance_size =3D sizeof(PIIX4State),
>> +    =2Einstance_size =3D sizeof(PIIXState),
>>       =2Einstance_init =3D piix4_init,
>>       =2Eclass_init    =3D piix4_class_init,
>>       =2Einterfaces =3D (InterfaceInfo[]) {
>
>
>ATB,
>
>Mark=2E

