Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C972E318E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:37:59 +0100 (CET)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXBG-00039b-W9
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktX9e-0002eT-Nx
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:36:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktX9d-0002Wt-1M
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:36:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id e25so7078803wme.0
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gg08WySgAHHAywAoiquvIyQGYQCGtfaErkuVElGFG4U=;
 b=bUIeCoT+Et/5OjNKYchuiTb7264b+09sUM0+nFCyFOQa6Pp25eBMxvxYQM3+I0Lw6U
 xtjjNh7eqykMaf/HAckT6XxUwdTfBmfbrHVr/SSGdA9jQqkzzuO/ScT+92eTIZEy0Dkl
 lGfSh/L2EWW+BHR5XeYWEdngcYzNxnNv9GUQfoZ7PyULi+Wu9p49sYdW40SfTeaaDd3l
 qZ/mQjviQDaj59qzHDDzo5GZ6N34yBB9BEpMitlc48thfhLd4QZP22IUbMTRhzy8UfNT
 TK80uLcpj9W0v2R+jPsasVa0oZrkvYlZF1VEPW0LD2RuqpKn2OwYeXjHQ8KVW5s5F041
 lrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gg08WySgAHHAywAoiquvIyQGYQCGtfaErkuVElGFG4U=;
 b=SJmLRyJAzgpvgfBuvmww1AT3rWpOoAqAVjfuLjODXUy353qWayHdV1xoAMZCY07kFp
 nfzQMpmMEcvHGl7mB7RffuRB+nPlWGiqbSjkl4OoisasWxphUMdAzGtad4jzocNac8N3
 97LyFPSKcQkWCKJAcrENStYrSab3FssffSaJdHE5n3FZImmxWajPkTS2VfEGp4x9iBbt
 KaTvfDOiqY7yMpPgLm4OnNfeWYk8DxmK0PbCmAq/u4A5cATOAage3Eg5LDxgyMTXOkhm
 skqLL7M/2bVJlj8VQWZ1ymjy0vqIHhzXrSEEa/abTsdXYtkVVfXbLAJRJOJwFFDd6Zrp
 cyvg==
X-Gm-Message-State: AOAM533/UIMQ3bx6JuhgUH4vwBaTrHFxrYxe1wAKZN7gXmtg6J+HhhS4
 6D5L2NOoN+c8isMveBRbmCMlH/9hGUY=
X-Google-Smtp-Source: ABdhPJyTNr89iCnYtsWY7N6JcLaPTxqhvV+F+TYJpyHbLzh4yjrXEnjVfxP1h6Y7oqpGahr8VgpiKw==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr16460161wmc.145.1609079775545; 
 Sun, 27 Dec 2020 06:36:15 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id d187sm16015136wmd.8.2020.12.27.06.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:36:14 -0800 (PST)
Subject: Re: [PATCH 07/12] vt82c686: Remove vt82c686b_isa_init() function
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <9258083b42c06413f79cbe9340731345948db5b5.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ba49ba3-c202-c498-0284-991e87f78fda@amsat.org>
Date: Sun, 27 Dec 2020 15:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9258083b42c06413f79cbe9340731345948db5b5.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> Also rename VT82C686B type to lower case to match other device names.

If possible do not split the commit description in 2 (one part in
subject and the other part here) as this is annoying to read.

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 9 ---------
>  hw/mips/fuloong2e.c       | 4 +++-
>  include/hw/isa/vt82c686.h | 3 +--
>  3 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 758c54172b..1c1239cade 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -49,7 +49,6 @@ struct VT82C686BState {
>      SuperIOConfig superio_conf;
>  };
>  
> -#define TYPE_VT82C686B "VT82C686B"
>  OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
>  
>  static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
> @@ -367,14 +366,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>                                  &vt82c->superio);
>  }
>  
> -ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
> -{
> -    PCIDevice *d;
> -
> -    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B);
> -    return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
> -}
> -
>  static void via_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 3b0489f781..60d2020033 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -240,7 +240,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>      ISABus *isa_bus;
>      PCIDevice *dev;
>  
> -    isa_bus = vt82c686b_isa_init(pci_bus, PCI_DEVFN(slot, 0));
> +    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
> +                                          TYPE_VT82C686B);

Good cleanup.

Preferably using TYPE_VT82C686B_ISA:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
>      assert(isa_bus);
>      *p_isa_bus = isa_bus;
>      /* Interrupt controller */
> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
> index ff80a926dc..89e205a1be 100644
> --- a/include/hw/isa/vt82c686.h
> +++ b/include/hw/isa/vt82c686.h
> @@ -1,13 +1,12 @@
>  #ifndef HW_VT82C686_H
>  #define HW_VT82C686_H
>  
> -
> +#define TYPE_VT82C686B "vt82c686b"
>  #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
>  #define TYPE_VIA_AC97 "via-ac97"
>  #define TYPE_VIA_MC97 "via-mc97"
>  
>  /* vt82c686.c */
> -ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
>  I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>                            qemu_irq sci_irq);
>  
> 

