Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8D537CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:41:32 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfeF-0001cJ-Ft
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfWT-0000xi-0k; Mon, 30 May 2022 09:33:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfWQ-0005Vk-4D; Mon, 30 May 2022 09:33:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id cx11so2673787pjb.1;
 Mon, 30 May 2022 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ub/n57LTS0/Euv5GAMhnrrjujC3bEgjICEvfebAJ8Aw=;
 b=TKrpkb8/0ltZpukGIs6gZ5NiA+cHDZHX29oWOkJMorJ9y6f/AZ2iVEJQlslx/2OzhJ
 HDt1faNAuB1WOfxRZQF75zw1Z/OCXtkerzZq3eAI4Ohc2olbk9aCDKluo8e4EIXCn12S
 JuaxCJ+xo1Dj9o/aueQASMIS9lH0BwQqJKmEiEo3tSeyO5MHBI0Rv7AqYkgZGgF4Bour
 MXRI+7M7/+uDXVb7sgzIaX+mQOumy5y9m6v5o1VbgT/KZHPQx5NnKLT70zvLVyZO6hj5
 A1OchXHzETnwXlJM2A6kgGy+zJPTLb8l7dKbtXxux61Oswe1+Lmnb7aapbFtP3TFrdwd
 fJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ub/n57LTS0/Euv5GAMhnrrjujC3bEgjICEvfebAJ8Aw=;
 b=AObmeRG/8rVVrV3boggcNx9pv7L1TWf3scrKkDbX2v+G6xAD79EPqkQNeWZFqQdobe
 nH51YNv3oCTTQ8aCTbDaN1HOBX2+VmTzCNEyVS2DxGLbcxOGOra8rzSXIIyVxNhT7Te/
 JSUJtGkNcRMqfsVskeUll6d0VbgEYOWk3kFLCSb6CvUHuQbTD4sZ29iOMBAsf4vCggMe
 6MgFEV4LVFXoqJOxw3e8ScfUHkm4ES1CUaDZDIXHwbVIq9hsG3iLgt4qe3kE9MuZhPvd
 MTLpmtvpKxuvN1BfiaGE45uzqG7OwF++UcAAsUpJP0OekhW2Ps2cdD0RzKPdzx0khSGe
 dBEQ==
X-Gm-Message-State: AOAM530E4PKkPGqhq/HHi21u3ACxK3OB3Rb2IfXKSGSPKNEPDbxHNNHJ
 zrw70k1TS6qXGQpYGXtHSRE=
X-Google-Smtp-Source: ABdhPJxY+pyV8HDP2geQaKZwiisBTyHT5THpongkp7JRU7JX38YBzXSmUd6Bq5RpxtdbN0NKozvLIA==
X-Received: by 2002:a17:90b:4b12:b0:1dc:dfdb:446 with SMTP id
 lx18-20020a17090b4b1200b001dcdfdb0446mr23098702pjb.150.1653917603939; 
 Mon, 30 May 2022 06:33:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d13-20020aa7814d000000b0050dc762818dsm8822718pfn.103.2022.05.30.06.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:33:23 -0700 (PDT)
Message-ID: <d80d1bbe-982c-90d8-4a54-ebab6dd36e4a@amsat.org>
Date: Mon, 30 May 2022 15:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Content-Language: en-US
To: Lev Kujawski <lkujaw@member.fsf.org>, qemu-trival@nongnu.org
Cc: John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220528204702.167912-1-lkujaw@member.fsf.org>
 <20220528204702.167912-4-lkujaw@member.fsf.org>
In-Reply-To: <20220528204702.167912-4-lkujaw@member.fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 28/5/22 22:47, Lev Kujawski wrote:
> One method to enable PCI bus mastering for IDE controllers, often used
> by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> the command register would be left in an unspecified state without
> this patch.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> ---
>   hw/ide/piix.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 76ea8fd9f6..f1d1168ecd 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -25,6 +25,8 @@
>    * References:
>    *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
>    *      290550-002, Intel Corporation, April 1997.
> + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> + *      Intel Corporation, April 1997.
>    */
>   
>   #include "qemu/osdep.h"
> @@ -32,6 +34,7 @@
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/range.h"
>   #include "sysemu/block-backend.h"
>   #include "sysemu/blockdev.h"
>   #include "sysemu/dma.h"
> @@ -220,6 +223,26 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>       }
>   }
>   
> +static void piix_pci_config_write(PCIDevice *d, uint32_t addr,
> +                                  uint32_t val, int l)
> +{
> +    /*
> +     * Mask all IDE PCI command register bits except for Bus Master
> +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> +     *
> +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> +     * Value: 0000h), and the PIIX4 datasheet [2].
> +     */
> +    if (range_covers_byte(addr, l, PCI_COMMAND)) {
> +        val &= ~(0xfffa << ((PCI_COMMAND - addr) << 3));

Watch out, len can be 1/2/4.

> +    }
> +
> +    pci_default_write_config(d, addr, val, l);
> +}
> +
>   /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>   static void piix3_ide_class_init(ObjectClass *klass, void *data)
>   {
> @@ -232,6 +255,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>       k->vendor_id = PCI_VENDOR_ID_INTEL;
>       k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
>       k->class_id = PCI_CLASS_STORAGE_IDE;
> +    k->config_write = piix_pci_config_write;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
>   }
> @@ -260,6 +284,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>       k->vendor_id = PCI_VENDOR_ID_INTEL;
>       k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
>       k->class_id = PCI_CLASS_STORAGE_IDE;
> +    k->config_write = piix_pci_config_write;
>       set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>       dc->hotpluggable = false;
>   }


