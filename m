Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9435BBFB9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:12:08 +0200 (CEST)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0e7-0006rZ-4K
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0d3-0005Qa-9Z
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:11:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0cy-0002Xf-KK
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2aqLmNVZJrLeo7IKuKlGsY5Xo4tYDfkdVbz2cM1saE=; b=uSIxVKIequ96kLJwBu5EX8+2Ue
 YkIHN/Flj4M9QhM198lne6Eef6svr5Mer4/xGt7D1hSpNQW+r1rO9/FzUfl/v7jI6nY+5Qg1kLQ0P
 2BC1O9ZcchSjiKMA5SH1QsGBH2OhIDVbZyzEyAUbXzbwiUlMuNTwTFD3l1myCubol5yiyuQgMFe6m
 5mdOcmb+Yybg3e+DxIrG2hEa2wpzVW8cDjFojmdzWZGn032eQwA6Fjbpwz3/O++lxRXUXeWgnpg+M
 jAs85e/vf4f3LYHwHIWI6dFFdWVAIh2HufYTi/6vzaBnhspDu0KRrnuT1q+2Au1nPAmZ2gJFSi0TO
 xhQrD4tU/poNzFb70vIzfzdyi8vuEJfR09wNS2uXHALYK7Bi5SSnEsRfkHG3TEfS+oVuaq3MWYBQZ
 ddlLhHaiX+oAJWlo+D/f6mWnryeWceawzFdoH7LfKfkpqapbkns/hufCvlxbS5AXb9GXmx+RTm4dJ
 RCDxRRR+EWFDdQHC/FIMpR65EPOQNpY/PSVQQdMIn8tH/6S7nmlld8PQnzS+a/Knps2qsgbydvnDV
 QIZaDx9AVe4KM8te1H7NI4TTA0zPL9TrS9jIjhVeReZDFeRPTdmJKxjo4d6wDdwwMWhbgYfC4LeFZ
 pmG8zD5s9cJjO0rqtLQ8mSSIjXThOLpBimEs1jQqM=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oa0bI-0007XB-Nj; Sun, 18 Sep 2022 21:09:13 +0100
Message-ID: <7c73d39c-815b-4159-ea90-530460cabc76@ilande.co.uk>
Date: Sun, 18 Sep 2022 21:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-27-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220901162613.6939-27-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 26/42] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 01/09/2022 17:25, Bernhard Beschow wrote:

> This aligns PIIX4 with PIIX3.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c  | 44 ++++++++++++++++++++++++++++++++------------
>   hw/mips/malta.c |  6 ++++--
>   2 files changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 67881e3a75..ed9eca715f 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -50,9 +50,16 @@ struct PIIX4State {
>       PCIIDEState ide;
>       UHCIState uhci;
>       PIIX4PMState pm;
> +
> +    uint32_t smb_io_base;
> +
>       /* Reset Control Register */
>       MemoryRegion rcr_mem;
>       uint8_t rcr;
> +
> +    bool has_acpi;
> +    bool has_usb;
> +    bool smm_enabled;
>   };
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
> @@ -258,17 +265,26 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>       }
>   
>       /* USB */
> -    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
> -    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
> -        return;
> +    if (s->has_usb) {
> +        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
> +                                "piix4-usb-uhci");

Can you use the relevant TYPE_ macro here for the USB-UHCI device?

> +        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
> +        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
> +            return;
> +        }
>       }
>   
>       /* ACPI controller */
> -    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
> -    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> -        return;
> +    if (s->has_acpi) {
> +        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
> +        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
> +        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
> +        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
> +        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> +            return;
> +        }
> +        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
>       }
> -    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
>   
>       pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>   }
> @@ -279,13 +295,16 @@ static void piix4_init(Object *obj)
>   
>       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>       object_initialize_child(obj, "ide", &s->ide, "piix4-ide");

... and same here for IDE?

> -    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
> -
> -    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
> -    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
> -    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
>   }
>   
> +static Property piix4_props[] = {
> +    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
> +    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
> +    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
> +    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void piix4_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -304,6 +323,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
>        */
>       dc->user_creatable = false;
>       dc->hotpluggable = false;
> +    device_class_set_props(dc, piix4_props);
>   }
>   
>   static const TypeInfo piix4_info = {
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index a4b866a2cf..6339b0d66c 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1400,8 +1400,10 @@ void mips_malta_init(MachineState *machine)
>       empty_slot_init("GT64120", 0, 0x20000000);
>   
>       /* Southbridge */
> -    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
> -                                            TYPE_PIIX4_PCI_DEVICE);
> +    piix4 = pci_new_multifunction(PCI_DEVFN(10, 0), true,
> +                                  TYPE_PIIX4_PCI_DEVICE);
> +    qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
> +    pci_realize_and_unref(piix4, pci_bus, &error_fatal);
>       isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
>   
>       dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));


ATB,

Mark.

