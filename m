Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B670636F945
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:27:10 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRIb-0000Dr-PJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lcQlg-0004yD-3h; Fri, 30 Apr 2021 06:53:11 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:44704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lcQlc-0002rI-N7; Fri, 30 Apr 2021 06:53:07 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a2so324082qkh.11;
 Fri, 30 Apr 2021 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B5i3Ba6uE6OXWhGILV3nTYxDUNjAvRCPoL1frKyPivE=;
 b=oVUzuUlbywPNnuseHNK8JPdkkKgZOSH9c+kXpUPNSwn0rqjI3sJhSS5vng8CdcxVWf
 RVJJOH08hhSOpqzzOXsSUKLYjoGwS7gOSx4j4GVdsqrOaJnUcK/y0Y0Qd7npb2HnqPy6
 0OcLmMH2NlKgkXfyzLKDIgwEu26YlpUwsoH5WZk+TQ2SvIj9K/Q/bAicf52V/Uzvb35W
 V+ML7DgmXu1fwvWNOHwN0tzcQu1S88Y1diGQ4cAR56IyB7cofngRMiTPw6MYTXSB6EcK
 /toF54yaj+U/unZmqS1+z7EOEa5xO4GAhcsFDi8fjqCf3dPZjDT3fq3gElSSu9jYHT9I
 RCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B5i3Ba6uE6OXWhGILV3nTYxDUNjAvRCPoL1frKyPivE=;
 b=f/NtGJGkCIttM9ptw6uXQSXLyw4RRyrp2B36u8JhYdb4mfIUoA1lFp8DNyTHBSzlBR
 gXdL91TiAeN0UYh+5cYb6nco5zkRiVGZ36I00wdVnJrq2Jyt0YNl9YiRph8GuNzY0PLl
 pgl7CtoX17K8Hd4E2LSSqdaGhbiZ+PMS2SyxHTHyv4L3fP/7PM78OQXdbA5u4LevrI0n
 kb5anHsGvZWeIGNJB3BCkoXr2SqeYX1lFlzBwEnDeJA5ylm8aQe9VZ85z9N4rQbMywmL
 bj0fljRNA64ml+xiIkUMBb7DlmTXH9yXCW4H8PD6VJRdszVH+vzB+0WEBZy8fqsnZpPC
 oDkA==
X-Gm-Message-State: AOAM533bsRPtWNJD6WxAgAxS4rfmBe3dDNXL9P8YIMkSYVzQfClpt0cW
 Yxs1QqejH1qT7p0cfRWXpxg=
X-Google-Smtp-Source: ABdhPJzKRk6WfUqtV05K8JIPlLABUH0Cs9KOcsQQRd+LPnxonphbhkeKFvi7OiwVs9vURaiP5HNhlA==
X-Received: by 2002:a37:e50e:: with SMTP id e14mr4505199qkg.117.1619779981917; 
 Fri, 30 Apr 2021 03:53:01 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:6de0:3db1:1b8e:b097:6036?
 ([2804:431:c7c7:6de0:3db1:1b8e:b097:6036])
 by smtp.gmail.com with ESMTPSA id l4sm1090431qkd.105.2021.04.30.03.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 03:53:01 -0700 (PDT)
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
To: mahesh@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
 <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
 <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <88cbb94c-33a1-642a-009a-133ffb51ea9d@gmail.com>
Date: Fri, 30 Apr 2021 07:52:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Qemu-ppc <qemu-ppc@nongnu.org>,
 Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/29/21 6:02 AM, Mahesh J Salgaonkar wrote:
> On 2021-04-28 22:33:45 Wed, Oliver O'Halloran wrote:
>> On Tue, Apr 27, 2021 at 9:56 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>>>
>>> With upstream kernel, especially after commit 98ba956f6a389
>>> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
>>> guest isn't able to enable EEH option for PCI pass-through devices anymore.
>>
>> How are you passing the devices through to the guest?
> 
> I am using libvirt with below xml section to add pass-through:
> 
>      <hostdev mode='subsystem' type='pci' managed='yes'>
>        <driver name='vfio'/>
>        <source>
>          <address domain='0x0033' bus='0x01' slot='0x00' function='0x0'/>
>        </source>
>        <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x0' multifunction='on'/>
>      </hostdev>
>      <hostdev mode='subsystem' type='pci' managed='yes'>
>        <driver name='vfio'/>
>        <source>
>          <address domain='0x0033' bus='0x01' slot='0x00' function='0x1'/>
>        </source>
>        <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x1' multifunction='on'/>
>      </hostdev>
> 
> Looks like libvirt does not allow pass through device in slot zero, and
> throws following error.

There's no such restriction in Libvirt, at least as far as I remember.

> 
> error: XML error: Invalid PCI address 0000:01:00.0. slot must be >= 1
> Failed. Try again? [y,n,i,f,?]:


This looks odd. The error message is complaining about 0000:01:00.0 but
your XML up there is declaring 0000:01:01.0.

Also, the 'multifunction' bool is usually used only in the function 0
passthrough, indicating that the guest will configure all other functions as
the the multifunction device. You can ignore this bool in the XML for
PCI passthrough if you don't care about the guest seeing this device as
multifunction (i.e. all functions in the same IOMMU group and so on).





Thanks,


DHB

> 
>>
>>> [root@atest-guest ~]# dmesg | grep EEH
>>> [    0.032337] EEH: pSeries platform initialized
>>> [    0.298207] EEH: No capable adapters found: recovery disabled.
>>> [root@atest-guest ~]#
>>>
>>> So far the linux kernel was assuming pe_config_addr equal to device's
>>> config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
>>> RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
>>> commit 98ba956f6a389 fixed this flow. With that fixed, linux now gets the
>>> PE config address first using the ibm,get-config-addr-info2 RTAS call, and
>>> then uses the found address as argument to ibm,set-eeh-option RTAS call to
>>> enable EEH on the PCI device.
>>
>> That's not really correct. EEH being enabled or disabled is a per-PE
>> setting rather than a per-device setting. The fact there's not a 1-1
>> correspondence between devices and PEs is a large part of why the
>> get-config-addr-info2 RTAS call exists in the first place.
>> Unfortunately, the initial implementation of EEH support in linux
>> conflated the two because in the past there was typically a single
>> device within a PE. However, that assumption was never really correct
>> and it has long outlived its usefulness.
>>
>>> This works on PowerVM lpar but fails in qemu
>>> KVM guests. This is because ibm,set-eeh-option RTAS call in qemu expects PE
>>> config address bits 16:20 be populated with device number (DEVNUM).
>>>
>>> The rtas call ibm,get-config-addr-info2 in qemu always returns the PE
>>> config address in form of "00BB0001" (i.e.  <00><BUS><DEVFN><REG>) where
>>> "BB" represents the bus number of PE's primary bus and with device number
>>> information always set to zero. However until commit 98ba956f6a389 this
>>> return value wasn't used to enable EEH on the PCI device.
>>>
>>> Now in qemu guest with recent kernel the ibm,set-eeh-option RTAS call fails
>>> with -3 return value indicating that there is no PCI device exist for the
>>> specified pe config address. The rtas_ibm_set_eeh_option call uses
>>> pci_find_device() to get the PC device that matches specific bus and devfn
>>> extracted from PE config address passed as argument. Since the DEVFN part
>>> of PE config always contains zero, pci_find_device() fails to find the
>>> specific PCI device and hence fails to enable the EEH capability.
>>>
>>> hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
>>>     case RTAS_EEH_ENABLE: {
>>>          PCIHostState *phb;
>>>          PCIDevice *pdev;
>>>
>>>          /*
>>>           * The EEH functionality is enabled on basis of PCI device,
>>>           * instead of PE. We need check the validity of the PCI
>>>           * device address.
>>>           */
>>>          phb = PCI_HOST_BRIDGE(sphb);
>>>          pdev = pci_find_device(phb->bus,
>>>                                 (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
>>>          if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
>>>              return RTAS_OUT_PARAM_ERROR;
>>>          }
>>>
>>> This patch fixes this issue by populating DEVNUM field (bits 16:20) of PE
>>> config address with device number.
>>
>> I don't think this is a good idea and I'm fairly sure you're
>> introducing some subtle breakage here. As an example, say that on the
>> host side you have two devices on the same bus:
>>
>> 0000:00:00.0 - card 1
>> 0000:00:01.0 - card 2
>>
>> On PowerNV (i.e. the hypervisor) these would be placed into the same
>> hardware PE since they're on the same bus. Now, if I take both devices
>> and pass them through to the guest on the same PHB and bus (use
>> 0005:ff) we'll have:
>>
>> 0005:ff:00.0 - card 1
>> 0005:ff:01.0 - card 2
> 
> It looks like libvirt does not support pass through device in slot zero.
> Hence these appears as below in guest:
> 
>   0005:ff:01.0 - card 1
>   0005:ff:02.0 - card 2
> 
> And with get-config-addr-info2 returning 00BB0001, ibm,set-eeh-option
> RTAS call tries to check if device is present on the bus of spapr_phb at
> bus->devices[devfn] where devfn is 0. And since qemu does not support
> pass through device on slot zero bus->devices[0] is always NULL. And
> hence it fails to enable EEH.
> 
>>
>> With this patch applied get-config-addr-info2 returns 00BBD001, so the
>> PE we get for each device will be:
>>
>> card 1 - 00ff0001
>> card 2 - 00ff1001
>>
>> Which implies the two are in different PEs. As a result, if the guest
>> requests a reset of card 1's PE then the guest will see an unexpected
>> reset of card 2 as well. From the hypervisor's point of view the two
>> are in the same PE so this is a legitimate thing to do, but due to
>> this patch the guest doesn't know that.
> 
> Agree. I realize my fix is not correctly handling this. The current code
> under ibm,set-eeh-option is checking for individual PCI device presence.
> Better fix should be to check if there is any PCI device (vfio-pci)
> present under specified bus and enable the EEH if found. And no change
> in return value of get-config-addr-info2. What do you say ?
> 

