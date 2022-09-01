Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AFC5AA143
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:59:48 +0200 (CEST)
Received: from localhost ([::1]:55270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrHv-0004DB-0k
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrFY-0001hp-2d
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:57:20 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrFV-0001Ax-JC
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:57:19 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q63so190663pga.9
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=jPe4oHhV1eqVjUHSB5YWN1wVdJ4Yw+lJSo9gAtbeE7U=;
 b=MS1enk1JJQyw2F790+V9g+2a5GzOmvuCcOmuwR+RTOJTtUA/HR7en46V6SlBhg1Ck/
 u0yWIvRy9UQlIYzCr5t0v2WgK+CxW2ZCO3DRt3/RYHe1XBHsn1c3JmcRPLBz/kY6kVXq
 hKnGp+SYaRY+n+ku2v5sJdSX5CkFS1zc3THptFz9W+5jGO9G+5SH6IFf4GNNdk1u8CNo
 MPfJ0kJhRXbU8mXnDZ61NeT+xIiNBQYIu8jYuAHd2fByg9PcVtcrW2TdjbthQlNnOdlZ
 lsCZ3e4AiiRev1eSQ7X/J7+2njlT8ioC8pqg5ffWH+JV7di7RQpy1NDfCwaJCwPqPxr0
 sUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=jPe4oHhV1eqVjUHSB5YWN1wVdJ4Yw+lJSo9gAtbeE7U=;
 b=z39Ho+R67pjjkm/VH+XaH5SBR67dkJEM/DDsXqPRCFHGANVuIioZV77OL0tCNqPHyT
 d2NzyyBwuYSI7kbDRnd86bZZqkZU7i2Ifp5m3YXaekSX2wM6r77v80/qDL3BZ2gxCCoK
 wBt/iWvDy6AZC3eWfaSUlZ0uAbbK6iFfdb9GKhedlYHh6RLee7paeBl/xvqefSUPdz5C
 Y2JFiUcp5YQpeiZTOQJpuFZ+/PXACpZW3zDPV4DTkKnEY9tL8Alz+QIjHTXl7aFQfCCz
 Lq61CquDYhD4piSceFFamzWgkunC5+Lh5QYxcpTN5Oca7i7m9J++WgRJzCuAYcYhM1tQ
 8GJQ==
X-Gm-Message-State: ACgBeo1vID99ssBwhUyJl3tMWHsC6JLS4DfjcFv7jltIv2UnMlMOGwsd
 ffkLjTLwrYQM7986t1zENys=
X-Google-Smtp-Source: AA6agR4k0WO1TmMeJrckj/8p76OiDsdoCsAopLh2SFSJX1zx9crcIX6W2LEtIJE4hqGv6wgZD/vBJQ==
X-Received: by 2002:a63:ee45:0:b0:42b:f80:94bb with SMTP id
 n5-20020a63ee45000000b0042b0f8094bbmr27171456pgk.104.1662065835339; 
 Thu, 01 Sep 2022 13:57:15 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a626d02000000b0052d9d95bb2bsm19195pfc.180.2022.09.01.13.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 13:57:14 -0700 (PDT)
Message-ID: <9cc01873-b6dc-aa52-961a-b4b7893ac029@amsat.org>
Date: Thu, 1 Sep 2022 22:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 27/42] hw/isa/piix4: Allow board to provide PCI interrupt
 routes
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
 <20220901162613.6939-28-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-28-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
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
> PIIX3 initializes the PIRQx route control registers to the default
> values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
> April 1997 manual. PIIX4, however, initializes the routes according to
> the Malta™ User’s Manual, ch 6.6, which are IRQs 10 and 11. In order to
> allow the reset methods to be consolidated, allow board code to specify
> the routes.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c  | 14 ++++++++++----
>   hw/mips/malta.c |  4 ++++
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index ed9eca715f..763c98b565 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -57,6 +57,8 @@ struct PIIX4State {
>       MemoryRegion rcr_mem;
>       uint8_t rcr;
>   
> +    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
> +
>       bool has_acpi;
>       bool has_usb;
>       bool smm_enabled;
> @@ -122,10 +124,10 @@ static void piix4_isa_reset(DeviceState *dev)
>       pci_conf[0x4c] = 0x4d;
>       pci_conf[0x4e] = 0x03;
>       pci_conf[0x4f] = 0x00;
> -    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
> -    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
> -    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
> -    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
> +    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
> +    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
> +    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
> +    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
>       pci_conf[0x69] = 0x02;
>       pci_conf[0x70] = 0x80;
>       pci_conf[0x76] = 0x0c;
> @@ -299,6 +301,10 @@ static void piix4_init(Object *obj)
>   
>   static Property piix4_props[] = {
>       DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
> +    DEFINE_PROP_UINT8("pirqa", PIIX4State, pci_irq_reset_mappings[0], 0x80),
> +    DEFINE_PROP_UINT8("pirqb", PIIX4State, pci_irq_reset_mappings[1], 0x80),
> +    DEFINE_PROP_UINT8("pirqc", PIIX4State, pci_irq_reset_mappings[2], 0x80),
> +    DEFINE_PROP_UINT8("pirqd", PIIX4State, pci_irq_reset_mappings[3], 0x80),
>       DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
>       DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
>       DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 6339b0d66c..44b6b14f3d 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1403,6 +1403,10 @@ void mips_malta_init(MachineState *machine)
>       piix4 = pci_new_multifunction(PCI_DEVFN(10, 0), true,
>                                     TYPE_PIIX4_PCI_DEVICE);
>       qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
> +    qdev_prop_set_uint8(DEVICE(piix4), "pirqa", 10);
> +    qdev_prop_set_uint8(DEVICE(piix4), "pirqb", 10);
> +    qdev_prop_set_uint8(DEVICE(piix4), "pirqc", 11);
> +    qdev_prop_set_uint8(DEVICE(piix4), "pirqd", 11);
>       pci_realize_and_unref(piix4, pci_bus, &error_fatal);
>       isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
>   

Nice!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


