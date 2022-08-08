Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA89058D07F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 01:31:55 +0200 (CEST)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLCDy-0007xt-AZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 19:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLCCq-0006TR-87; Mon, 08 Aug 2022 19:30:44 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:45730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLCCo-0000Ig-6v; Mon, 08 Aug 2022 19:30:44 -0400
Received: by mail-vk1-xa32.google.com with SMTP id l13so5110074vka.12;
 Mon, 08 Aug 2022 16:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=5aA8BI09gf1DCZkirT4M6F+BoTwQliHR/kxjP/1MT0Y=;
 b=njyY4f4/BCi8YjNv6qg3xtpSenK8088PvD3bNyu2vAvDm8dLvA+p2ZRpuPw+X51VYK
 auIf2TYgNhJqxE4e5ZZJ5PaAQ4KdobkaseExE6lqK+hN7OkUtcV0qpRgIv/XW84wwmgA
 utdLHMXYdGdKG9q5SKm46BZb3nP/iHJx8wX0feFiLdsXGl2KBxcP9nz1LE0Y1EHVLxIJ
 VmgzaMFylqfgky5mk6H0TuA/w7wcG8O4bKh8purajsu/NbyeM7HMVrxusDwC0Z0wUsmb
 v28z0UDTJjwov2u17A14y5ht3qBGekLST7/+4O3Od1Tpqa0Kp0oOM534UeHmKYt2++cZ
 uoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=5aA8BI09gf1DCZkirT4M6F+BoTwQliHR/kxjP/1MT0Y=;
 b=j6cAE6G5/pwxCBDxQtBVSWU30ye5hS7SRBX4mHpB2nFcasGw1hBpB2vjL9uON+YLWN
 +cIS48vTqNQuuC4IXaYy1rhxcAjCRWCfaBF9jLzhqi+L/RYJb9tR3fniYxlnXkxfZ9Hk
 j3IiK11xKZj0iOauuhhP3cc4XXrrhSoLoEDkbMhs149610TFcqhy8/8O4S7xeNJ00+23
 U4gVIuVKWyOk0gbopp28MeloDnjqevmVxoI6ZPdOTuJBxk66M9TcxTtTNU71MmFY3Fro
 8Up2rpUw5AEL+FdCFMwqmUBnuKN/pcBnoAex4FENs+ESJY6SwreJJo9JTaNX8CPrSElk
 QhaQ==
X-Gm-Message-State: ACgBeo0f+gMtGwzgT+WPKuUp2p0qdtGdSdBe8UTtJrUL1Mvbp/ftuXIN
 0cQDuLeoCvj6s51+WFWIryQ=
X-Google-Smtp-Source: AA6agR6E29Hh75Y0Y5A8tyjapi+vLay+LxAFjAGafFo1Di69B69MKKu46aW/Ok96TXyiGULOkvwPMA==
X-Received: by 2002:a1f:3206:0:b0:377:d5aa:620f with SMTP id
 y6-20020a1f3206000000b00377d5aa620fmr8699041vky.38.1660001440469; 
 Mon, 08 Aug 2022 16:30:40 -0700 (PDT)
Received: from [192.168.10.102] (201-68-49-100.dsl.telesp.net.br.
 [201.68.49.100]) by smtp.gmail.com with ESMTPSA id
 s17-20020a67f4d1000000b00373d697e3e2sm9246653vsn.19.2022.08.08.16.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 16:30:40 -0700 (PDT)
Message-ID: <85e18c90-a3e7-7e60-9362-4b526e1ac2e8@gmail.com>
Date: Mon, 8 Aug 2022 20:30:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 06/10] ppc/pnv: enable user created pnv-phb for
 powernv8
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-7-danielhb413@gmail.com>
 <5f3a7053-ebfe-ef3d-093a-d5a593ad88e5@linux.ibm.com>
 <42bfa67a-f679-0817-418b-24aad93450c7@gmail.com>
In-Reply-To: <42bfa67a-f679-0817-418b-24aad93450c7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
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



On 8/8/22 13:50, Daniel Henrique Barboza wrote:
> 
> 
> On 8/5/22 07:50, Frederic Barrat wrote:
>>
>>
>>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>>> index 077f391d59..953c384bf6 100644
>>> --- a/hw/pci-host/pnv_phb.c
>>> +++ b/hw/pci-host/pnv_phb.c
>>> @@ -17,6 +17,7 @@
>>>   #include "hw/ppc/pnv.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qom/object.h"
>>> +#include "sysemu/sysemu.h"
>>>   /*
>>> @@ -171,6 +172,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>>>       }
>>> +    if (phb->version == 3 && !defaults_enabled()) {
>>> +        return;
>>> +    }
>>> +
>>>       pnv_phb_attach_root_port(pci);
>>>   }
>>
>>
>> So we skip the call to pnv_phb_attach_root_port() for the user created PHBs.
>>
>> I seem to remember that when the user creates a PHB on the command line, they also need to create the root port and we can't just create one by default with the PHB. It seems heavy when just using the qemu CLI but that was a requirement from libvirt. Did I get that right?
> 
> libvirt requires all pci devices to be declared in the XML. If we create the
> root ports automatically by just adding PHBs I would need to reflect that
> in the domain XML by either automatically add root ports with each PHB, which
> is easier said than done, or tell the user to do so.
> 
> libvirt also allows for custom naming of the buses, e.g the PHB can be named
> 'phb-root0' and its root port 'my-rootport.1'. There's no way we can name
> root ports buses by adding them automatically with each PHB like we do
> for default PHBs.
> 
> 
>>
>> In any case, I can see a problem. pnv_phb_attach_root_port() creates the root port object, so if the above is correct, we want to skip that. But it also creates the PHB->root port relationship in QOM. That we don't do anywhere for the user-created case.
>>
>> Calling qemu with "-nodefaults -device pnv-phb -device pnv-phb-root-port", here is what I see in QOM, which shows the wrong parenting of the root port:
>>    /peripheral-anon (container)
>>      /device[1] (pnv-phb-root-port)
>>        /bus master container[0] (memory-region)
>>        /bus master[0] (memory-region)
>>        /pci_bridge_io[0] (memory-region)
>>        /pci_bridge_io[1] (memory-region)
>>        /pci_bridge_mem[0] (memory-region)
>>        /pci_bridge_pci[0] (memory-region)
>>        /pci_bridge_pref_mem[0] (memory-region)
>>        /pci_bridge_vga_io_hi[0] (memory-region)
>>        /pci_bridge_vga_io_lo[0] (memory-region)
>>        /pci_bridge_vga_mem[0] (memory-region)
>>        /pcie.0 (PCIE)
>>
>>
>> With the full series, same problem on P8/P9/P10
> 
> I forgot to mention it in the cover letter. This is intended. The reason
> is that we can't access the PHB from the root-port due to QOM best
> practices, i.e. we can't do qdev_get_parent_bus()->parent to parent
> the root port with the PHB. The reason why we're able to do that for
> default devices is because we have access to the PHB regardless of QOM
> when creating the root port.

This is not correct. The default phb is parented by the root-bus, not the
PHB. E.g:

         /pnv-phb4-root.9 (pnv-phb4-root)
           /pnv-phb-root-port[3] (pnv-phb-root-port)
             /bus master container[0] (memory-region)
             /bus master[0] (memory-region)
           (...)

Both default and user created cases have access to the phb-root-bus.

The reasoning behind the current QOM hierarchy is the existing design in place
for what it is called "dynamically created sysbus devices", which means all the
devices that are created via command line. If the device has an 'id' it'll be
inserted in a 'peripheral' container, if no 'id' is provided the device goes
into a 'peripheral-anon' container.

I managed to amend the root_port_realize() function to place the root-port
in the same place as the default root port appears. What I need to do now
before re-sending is verify whether I broke something else during the
process :)


Thanks,


Daniel


> 
> 
> If we want QOM consistency between user created devices and default
> devices, one alternative is to make the root-port a child of the
> root bus. That can be achievable in both cases.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
>>
>>    Fred
>>
>>
>>
>>
>>

