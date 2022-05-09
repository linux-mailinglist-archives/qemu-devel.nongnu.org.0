Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961551F66B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:11:48 +0200 (CEST)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnyUa-0004kq-IK
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nnyLU-0003jC-R0; Mon, 09 May 2022 04:02:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nnyLS-0005UN-RB; Mon, 09 May 2022 04:02:20 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so782335wms.5; 
 Mon, 09 May 2022 01:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mqtL2gCCHPlBEBtIXSoW8gskUPGT59zht12YCRBFAJg=;
 b=TnEceOlku5O2LhN349fYQZpDLct6g/bOMC3cK32D2a9yyHC/wR8kQ3c2Ti3DLbWnwI
 qFf1g2/juO84NhnFgiirKUCWy90RQErkKtT7JcHiUdjqxt51X2vAVRi0IrF84GWP0Efr
 JnUz2vvfiVEWAiTpacxPdR/w/IKHOmNyicKp9E+EBNxM7aW+WYdrtLpBxiTsL+Hi9A12
 6L6deeP+v1CmKRhvLcp/dCKxrE46CDd/h6bqsrCoOovl7dPvlLilas+AKZOjjxBqU7ef
 sBqrFdhdttyPwRlTq9tL4u9ajt5phOT1whpGoF1KCecFHMmpTzMMOrhSQGvCIcd7QLav
 /7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mqtL2gCCHPlBEBtIXSoW8gskUPGT59zht12YCRBFAJg=;
 b=IjGSVdkHRDvNJNSFpq82SGc+tfWE6jfyzO46CWliMTiV0PqVFCSO+3uTf+oDKKru6o
 1LCBYSWezRBoPTlM6Qg/tfbrhoX5FvYQxHXgZJH5eQktyPx0nEHQNEfbYsuKTkF34oIW
 ikx1Ej+wRJSMDiuvBSBauQN4iV7nqkvGqoy1coD9BayOrIPfYVCVJKHk3jgCFjBj1n5G
 HfwXLBjoVtZbbaK0WcA+OhskxgsSWU8yBwQ6Op/gdJjXvT0dFfG9LcVG34SM0vj9FvUg
 kxq28xp/2YJ7kSwYTGv2lEREdgxbZvIKUOxjipEXm3LgEjaG/THEmMExkzpxASOUDwu5
 Da2g==
X-Gm-Message-State: AOAM532QH3ZbiSY9BbP73VyHNQmnsY6lFjpWmYeiRTAtJUk78WHeUoBh
 7C1UK0OHRllzMUZugJdeR7s=
X-Google-Smtp-Source: ABdhPJxmKjHv2n8qTwpXp+fiZDf4jFcPCZM/5haHKnowSi0ZwuuvyGaWWMGogXOoBgnyRcTDBfcIIA==
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id
 v16-20020a1cf710000000b003941960e8a1mr14595010wmh.154.1652083335977; 
 Mon, 09 May 2022 01:02:15 -0700 (PDT)
Received: from [10.7.237.11] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1cf206000000b003942a244f3fsm16317179wmc.24.2022.05.09.01.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 01:02:15 -0700 (PDT)
Message-ID: <724c6af0-277b-a6d1-b773-89e1b03e0c53@gmail.com>
Date: Mon, 9 May 2022 09:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:IDE" <qemu-block@nongnu.org>
References: <20220508103432.14874-1-shentey@gmail.com>
 <20220508103432.14874-4-shentey@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220508103432.14874-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/05/2022 11:34, Bernhard Beschow wrote:
> This function was declared in a generic and public header, implemented
> in a device-specific source file but only used in xen_platform. Given its
> 'aux' parameter, this function is more xen-specific than piix-specific.
> Also, the hardcoded magic constants seem to be generic and related to
> PCIIDEState and IDEBus rather than piix.
> 
> Therefore, move this function to xen_platform, unexport it, and drop the
> "piix3" in the function name as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

... with one suggestion...

> ---
>   hw/i386/xen/xen_platform.c | 49 +++++++++++++++++++++++++++++++++++++-
>   hw/ide/piix.c              | 46 -----------------------------------
>   include/hw/ide.h           |  3 ---
>   3 files changed, 48 insertions(+), 50 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 72028449ba..124ffeae35 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -26,6 +26,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "hw/ide.h"
> +#include "hw/ide/pci.h"
>   #include "hw/pci/pci.h"
>   #include "hw/xen/xen_common.h"
>   #include "migration/vmstate.h"
> @@ -134,6 +135,52 @@ static void pci_unplug_nics(PCIBus *bus)
>       pci_for_each_device(bus, 0, unplug_nic, NULL);
>   }
>   
> +/*
> + * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
> + * request unplug of 'aux' disks (which is stated to mean all IDE disks,
> + * except the primary master).
> + *
> + * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
> + *       is simultaneously requested is not clear. The implementation assumes
> + *       that an 'all' request overrides an 'aux' request.
> + *
> + * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
> + */
> +static int pci_xen_ide_unplug(DeviceState *dev, bool aux)
> +{
> +    PCIIDEState *pci_ide;
> +    int i;
> +    IDEDevice *idedev;
> +    IDEBus *idebus;
> +    BlockBackend *blk;
> +
> +    pci_ide = PCI_IDE(dev);
> +
> +    for (i = aux ? 1 : 0; i < 4; i++) {
> +        idebus = &pci_ide->bus[i / 2];
> +        blk = idebus->ifs[i % 2].blk;
> +
> +        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
> +            if (!(i % 2)) {
> +                idedev = idebus->master;
> +            } else {
> +                idedev = idebus->slave;
> +            }
> +
> +            blk_drain(blk);
> +            blk_flush(blk);
> +
> +            blk_detach_dev(blk, DEVICE(idedev));
> +            idebus->ifs[i % 2].blk = NULL;
> +            idedev->conf.blk = NULL;
> +            monitor_remove_blk(blk);
> +            blk_unref(blk);
> +        }
> +    }
> +    qdev_reset_all(dev);
> +    return 0;

The return value is ignored so you may as well make this a static void 
function.

   Paul

> +}
> +
>   static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
>   {
>       uint32_t flags = *(uint32_t *)opaque;
> @@ -147,7 +194,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
>   
>       switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
>       case PCI_CLASS_STORAGE_IDE:
> -        pci_piix3_xen_ide_unplug(DEVICE(d), aux);
> +        pci_xen_ide_unplug(DEVICE(d), aux);
>           break;
>   
>       case PCI_CLASS_STORAGE_SCSI:
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index bc1b37512a..9a9b28078e 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -173,52 +173,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>       }
>   }
>   
> -/*
> - * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
> - * request unplug of 'aux' disks (which is stated to mean all IDE disks,
> - * except the primary master).
> - *
> - * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
> - *       is simultaneously requested is not clear. The implementation assumes
> - *       that an 'all' request overrides an 'aux' request.
> - *
> - * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
> - */
> -int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
> -{
> -    PCIIDEState *pci_ide;
> -    int i;
> -    IDEDevice *idedev;
> -    IDEBus *idebus;
> -    BlockBackend *blk;
> -
> -    pci_ide = PCI_IDE(dev);
> -
> -    for (i = aux ? 1 : 0; i < 4; i++) {
> -        idebus = &pci_ide->bus[i / 2];
> -        blk = idebus->ifs[i % 2].blk;
> -
> -        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
> -            if (!(i % 2)) {
> -                idedev = idebus->master;
> -            } else {
> -                idedev = idebus->slave;
> -            }
> -
> -            blk_drain(blk);
> -            blk_flush(blk);
> -
> -            blk_detach_dev(blk, DEVICE(idedev));
> -            idebus->ifs[i % 2].blk = NULL;
> -            idedev->conf.blk = NULL;
> -            monitor_remove_blk(blk);
> -            blk_unref(blk);
> -        }
> -    }
> -    qdev_reset_all(dev);
> -    return 0;
> -}
> -
>   static void pci_piix_ide_exitfn(PCIDevice *dev)
>   {
>       PCIIDEState *d = PCI_IDE(dev);
> diff --git a/include/hw/ide.h b/include/hw/ide.h
> index c5ce5da4f4..60f1f4f714 100644
> --- a/include/hw/ide.h
> +++ b/include/hw/ide.h
> @@ -8,9 +8,6 @@
>   ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
>                           DriveInfo *hd0, DriveInfo *hd1);
>   
> -/* ide-pci.c */
> -int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
> -
>   /* ide-mmio.c */
>   void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
>   


