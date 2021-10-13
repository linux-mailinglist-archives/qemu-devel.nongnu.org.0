Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E7542C2AB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:16:16 +0200 (CEST)
Received: from localhost ([::1]:43590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maf3H-0001Ly-Ea
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maf1S-0000ch-7b
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:14:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maf1Q-0007Aw-Hz
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 10:14:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t2so8899510wrb.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jo1WUQ+qKLT7Qp1/WDp8mEVzXNHMXZ/HcgHr+H1EX0k=;
 b=f65QIttX+MaDkJjZ0TGz1XTpU+eHyYH+vvDsH4L3oiKGwUh2IAq4vPvBHjVphm5AWw
 g+B6NWFwFLA3yHeKx9ktZ7zwqGwQenmkGwzkDkMzJQi1Y6t9nPMVQZAEqWch5nLbvOZv
 v2Fqe9MQgyQ7pjetzxuqJ+SANUml8zGxQZhp8VaiKZmWSndfFVxvL/m+jc7Kynb/9yX8
 rjvqv+W2DpaWxM4SuGnyWVjdUbxTKefv2ogl1S+yXcxpI4LKgGpDLE7pnwuDbVNWeouY
 sc2DVjBwr+UYf2vQOZWep7RuXjvmHEXLT+x2Qi0lPhH/P6Un9sOVnF/FR/VmFuJ0uScQ
 6aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jo1WUQ+qKLT7Qp1/WDp8mEVzXNHMXZ/HcgHr+H1EX0k=;
 b=UyoJd5rxZzOQxOVOSpvWuV5h83wRJ4kuCpGEu00HN2RHl6V8JEOgJ4OVdRJM7FaKhr
 acXHmvZV15qtqAljqbYLBzZxUEckj8d4A6ZPi50TB+sQEIvE61Pv62PJa24C6ybZc9+8
 itYhtcecwXRVK4dY296iaH2XEnbN8S36pyJBIbEdBy6WjXNsr89Zxhdks6RdHF+YTjYF
 NBrP2hayjC5nBzT7WOMSVOcFYXa/k1+foTLiMMfsEmn/gKx2OpfUV95BpucyB7rCmEiy
 e5TRAe1BEzakoX9Nr70v22di7TYtANN8jPEh5rIIGHKidi6BSIHGyzGqwjHy3MsebjBV
 6ozQ==
X-Gm-Message-State: AOAM5302BKXx1uzzrILOvCFvz2lQ88XGvPva+Lw7PdcXKdDsoazD1oI7
 fF99gaHY2UFo0sSYZ/J800w=
X-Google-Smtp-Source: ABdhPJw+/8Pddp77SyxfnFzp200n/WEA3GZNy71gj3WAzmKfQ/RHscsCiBEYIHO89/9mFn33wsUOSg==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr12566006wmp.73.1634134459044; 
 Wed, 13 Oct 2021 07:14:19 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k17sm13240368wrc.93.2021.10.13.07.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 07:14:18 -0700 (PDT)
Message-ID: <189eeccd-36fd-d033-7900-30e89fc662df@amsat.org>
Date: Wed, 13 Oct 2021 16:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211013121929.9E835746333@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211013121929.9E835746333@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 14:13, BALATON Zoltan wrote:
> This device is part of a superio/ISA bridge chip and IRQs from it are
> routed to an ISA interrupt set by the Interrupt Line PCI config
> register. Change uhci_update_irq() to allow this and implement it in
> vt82c686-uhci-pci.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v3: Do it more differently using qemu_irq instead as suggested by Gerd
> v2: Do it differently to confine isa reference to vt82c686-uhci-pci as
> hcd-uhci is also used on machines that don't have isa. Left Jiaxun's
> R-b there as he checked it's the same for VT82C686B and gave R-b for
> the 82c686b case which still holds but speak up if you tink otherwise.
> 
>  hw/usb/hcd-uhci.c          | 11 +++++------
>  hw/usb/hcd-uhci.h          |  2 +-
>  hw/usb/vt82c686-uhci-pci.c | 12 ++++++++++++
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 0cb02a6432..7201cd0ae7 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -31,6 +31,7 @@
>  #include "hw/usb/uhci-regs.h"
>  #include "migration/vmstate.h"
>  #include "hw/pci/pci.h"
> +#include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu/timer.h"
> @@ -290,7 +291,7 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
>  
>  static void uhci_update_irq(UHCIState *s)
>  {
> -    int level;
> +    int level = 0;
>      if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
>          ((s->status2 & 2) && (s->intr & (1 << 3))) ||
>          ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
> @@ -298,10 +299,8 @@ static void uhci_update_irq(UHCIState *s)
>          (s->status & UHCI_STS_HSERR) ||
>          (s->status & UHCI_STS_HCPERR)) {
>          level = 1;
> -    } else {
> -        level = 0;
>      }
> -    pci_set_irq(&s->dev, level);
> +    qemu_set_irq(s->irq, level);
>  }

^ OK.

>  static void uhci_reset(DeviceState *dev)
> @@ -1170,9 +1169,9 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
>  
>      pci_conf[PCI_CLASS_PROG] = 0x00;
>      /* TODO: reset value should be 0. */
> -    pci_conf[USB_SBRN] = USB_RELEASE_1; // release number
> -
> +    pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
>      pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
> +    s->irq = pci_allocate_irq(dev);
>  
>      if (s->masterbus) {
>          USBPort *ports[NB_PORTS];

usb_uhci_common_realize() should be refactored making it PCI-agnostic.

> diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
> index e61d8fcb19..1f8ee04186 100644
> --- a/hw/usb/hcd-uhci.h
> +++ b/hw/usb/hcd-uhci.h
> @@ -60,7 +60,7 @@ typedef struct UHCIState {
>      uint32_t frame_bandwidth;
>      bool completions_only;
>      UHCIPort ports[NB_PORTS];
> -
> +    qemu_irq irq;
>      /* Interrupts that should be raised at the end of the current frame.  */
>      uint32_t pending_int_mask;

OK.

> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> index b109c21603..e70e739409 100644
> --- a/hw/usb/vt82c686-uhci-pci.c
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -1,6 +1,16 @@
>  #include "qemu/osdep.h"
> +#include "hw/irq.h"
>  #include "hcd-uhci.h"
>  
> +static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
> +{
> +    UHCIState *s = opaque;
> +    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
> +    if (irq > 0 && irq < 15) {
> +        qemu_set_irq(isa_get_irq(NULL, irq), level);
> +    }
> +}

OK.

>  static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>  {
>      UHCIState *s = UHCI(dev);
> @@ -14,6 +24,8 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>      pci_set_long(pci_conf + 0xc0, 0x00002000);
>  
>      usb_uhci_common_realize(dev, errp);
> +    object_unref(s->irq);
> +    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);

This can be avoided by refactoring usb_uhci_common_realize(),
uhci_pci_type_info and uhci_data_class_init().

Current TYPE_UHCI becomes TYPE_PCI_UHCI.

Not sure why UHCI has been implemented that way, we already
have USB_OHCI_PCI / USB_EHCI_PCI / USB_XHCI_PCI.

Maybe look at how TYPE_SYSBUS_OHCI is implemented VS TYPE_PCI_OHCI
to be able to implement the similar TYPE_SYSBUS_UHCI?

