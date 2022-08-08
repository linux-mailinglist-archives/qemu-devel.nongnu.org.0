Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010258CC67
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 18:54:33 +0200 (CEST)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL61P-0002RZ-Tl
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 12:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oL5y1-00070x-Sf; Mon, 08 Aug 2022 12:51:01 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oL5y0-0000Nf-9B; Mon, 08 Aug 2022 12:51:01 -0400
Received: by mail-vs1-xe29.google.com with SMTP id v128so9399621vsb.10;
 Mon, 08 Aug 2022 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6SdlLpFC+03gESKveia8zhhWEI9SOeEn8hd4xrwCgSo=;
 b=p2HM7beD7neXxu7Xut7qTG4rbFS18/5HwjdYoRpZbZdgl4a4p2IkdLby4wQB/X4u4B
 Qk8qjln1Ew+VXSU3R17EjftB1IUj7UFjBkAHSWQi/Hwq09e5y+HT+qygH6Oykdy6/J6c
 TICfouwgDzECwIBTELf5+r3jvOrqwdlYdCSQVpmelzGG82cw1ilQ6RMKhXuacHQzrN6r
 1D5d3/3oAc2yjY2TgU4nqvNMxTtlQ3c7WVIEIIW0y/Bmdx0uYfuBhUXg6g6NHxrDERIl
 1NZRtdUzE3tx3DsHptj//9WsmKuNCFhQUT/sGoLEvodRSfpBb5IlNt/ZcQFKNP8pa/I8
 LZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6SdlLpFC+03gESKveia8zhhWEI9SOeEn8hd4xrwCgSo=;
 b=yRpPbMqJRlNR+L28UlS69FJ796DYnjpml6KtHEqiQ2wljZQstxBrLD6Bsl3v1jzFxi
 A7UG9nmAOaufiZnjrunBTHqMXIitEhrJXM/lTYVcmHowJgmKmXxKvgFF0WYVhLkSBI4w
 CJ7cIK8HNw1APbzSQQ17ZsxZk/zHiPFglOeQqx2akhRlIGUwD38cMwvOM4he0F8+bgOa
 LXUIKKv+NXlZQFmen3EgBpJPZQEHYiCSgPz4wjWtqoU4fMLFahTYQjFbOHNJFVrU2e5k
 ws91F8j8dACvRzQ6xQBBpilNh9vba/tkAkYqDYCd8dzvHfnQDUPYrjo5uvnBb3RHMqMN
 lo+Q==
X-Gm-Message-State: ACgBeo0RuELVv/99RasVxfiP+E3bf0YfGDFPk7QslRT3TD5kY1EvzwZU
 +ox21xhYq2gvs6Cai5u17+8=
X-Google-Smtp-Source: AA6agR4Y5a1/LFFt/Pnt7LTuw893HCpgQkGEKLS2OgGTbRaX2NcEoYXOLciWZC/zY+FI7iDOFlF0mw==
X-Received: by 2002:a67:e09d:0:b0:379:83a6:315c with SMTP id
 f29-20020a67e09d000000b0037983a6315cmr7563208vsl.4.1659977458396; 
 Mon, 08 Aug 2022 09:50:58 -0700 (PDT)
Received: from [192.168.10.102] (201-68-49-100.dsl.telesp.net.br.
 [201.68.49.100]) by smtp.gmail.com with ESMTPSA id
 u44-20020ab045af000000b00383c1958249sm10163416uau.24.2022.08.08.09.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 09:50:58 -0700 (PDT)
Message-ID: <42bfa67a-f679-0817-418b-24aad93450c7@gmail.com>
Date: Mon, 8 Aug 2022 13:50:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 06/10] ppc/pnv: enable user created pnv-phb for
 powernv8
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-7-danielhb413@gmail.com>
 <5f3a7053-ebfe-ef3d-093a-d5a593ad88e5@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5f3a7053-ebfe-ef3d-093a-d5a593ad88e5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/5/22 07:50, Frederic Barrat wrote:
> 
> 
>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>> index 077f391d59..953c384bf6 100644
>> --- a/hw/pci-host/pnv_phb.c
>> +++ b/hw/pci-host/pnv_phb.c
>> @@ -17,6 +17,7 @@
>>   #include "hw/ppc/pnv.h"
>>   #include "hw/qdev-properties.h"
>>   #include "qom/object.h"
>> +#include "sysemu/sysemu.h"
>>   /*
>> @@ -171,6 +172,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>>       }
>> +    if (phb->version == 3 && !defaults_enabled()) {
>> +        return;
>> +    }
>> +
>>       pnv_phb_attach_root_port(pci);
>>   }
> 
> 
> So we skip the call to pnv_phb_attach_root_port() for the user created PHBs.
> 
> I seem to remember that when the user creates a PHB on the command line, they also need to create the root port and we can't just create one by default with the PHB. It seems heavy when just using the qemu CLI but that was a requirement from libvirt. Did I get that right?

libvirt requires all pci devices to be declared in the XML. If we create the
root ports automatically by just adding PHBs I would need to reflect that
in the domain XML by either automatically add root ports with each PHB, which
is easier said than done, or tell the user to do so.

libvirt also allows for custom naming of the buses, e.g the PHB can be named
'phb-root0' and its root port 'my-rootport.1'. There's no way we can name
root ports buses by adding them automatically with each PHB like we do
for default PHBs.


> 
> In any case, I can see a problem. pnv_phb_attach_root_port() creates the root port object, so if the above is correct, we want to skip that. But it also creates the PHB->root port relationship in QOM. That we don't do anywhere for the user-created case.
> 
> Calling qemu with "-nodefaults -device pnv-phb -device pnv-phb-root-port", here is what I see in QOM, which shows the wrong parenting of the root port:
>    /peripheral-anon (container)
>      /device[1] (pnv-phb-root-port)
>        /bus master container[0] (memory-region)
>        /bus master[0] (memory-region)
>        /pci_bridge_io[0] (memory-region)
>        /pci_bridge_io[1] (memory-region)
>        /pci_bridge_mem[0] (memory-region)
>        /pci_bridge_pci[0] (memory-region)
>        /pci_bridge_pref_mem[0] (memory-region)
>        /pci_bridge_vga_io_hi[0] (memory-region)
>        /pci_bridge_vga_io_lo[0] (memory-region)
>        /pci_bridge_vga_mem[0] (memory-region)
>        /pcie.0 (PCIE)
> 
> 
> With the full series, same problem on P8/P9/P10

I forgot to mention it in the cover letter. This is intended. The reason
is that we can't access the PHB from the root-port due to QOM best
practices, i.e. we can't do qdev_get_parent_bus()->parent to parent
the root port with the PHB. The reason why we're able to do that for
default devices is because we have access to the PHB regardless of QOM
when creating the root port.


If we want QOM consistency between user created devices and default
devices, one alternative is to make the root-port a child of the
root bus. That can be achievable in both cases.


Thanks,


Daniel


> 
>    Fred
> 
> 
> 
> 
> 

