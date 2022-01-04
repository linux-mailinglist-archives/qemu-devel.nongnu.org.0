Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23FA4848AD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 20:36:25 +0100 (CET)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4pbc-0005cu-CE
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 14:36:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4pYX-0003hi-4P; Tue, 04 Jan 2022 14:33:13 -0500
Received: from [2607:f8b0:4864:20::730] (port=38782
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4pYV-0002S9-Gz; Tue, 04 Jan 2022 14:33:12 -0500
Received: by mail-qk1-x730.google.com with SMTP id i187so33810743qkf.5;
 Tue, 04 Jan 2022 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x6d5346VsGWdwD0ipoTG3h58PBcnNdNQunHwrbJTAXI=;
 b=jxra/O1jezhbTXSnCA+08KaQhS7Ojp8NzynMFY2z9oEB9EVd98P8UpEvJnHLfanplR
 c9vyunia6+M3EatizUrNGUisEIEMoc5m8SOnwgTc8z5A8M3PnnIoEmleSlF+X8I8i9gH
 aFLbbSTg8bJtzhHWdFeTiWhGh4jNksypnlqU2Dw4NZlXZWgFifKbANzv1RMsGVTNa/6v
 evWunXwmI1PNBqakCEa84AMKhsIJlWvfb3dBQrAX0j5203AyAH/BkXm81wM93deYCJT0
 GEnFd2EO8GZ95wCW9q8UFNu8xyoQRxmhKBjeJ81uAj9N8PHI7wmyClkLr1O6qHqrBSKY
 1ShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x6d5346VsGWdwD0ipoTG3h58PBcnNdNQunHwrbJTAXI=;
 b=TMr3SCOgG7BiElmgsZlZL/d1IEo34mdpr+XCxYrXKj0c3pACwbBWzGELpoyKHmqu4G
 nG1YgX2AYnR7wk5jQdw2/fCj2STe8kNNmMyiP7CBQvh4xUGaJKjwwTh+zEiDnX0Kn9Gd
 tyNickmWOuwJOoEnleYbeKxDarUr0Hs7p1uSMH0NVRXhUzm9xi7Hx+fhJy0bcP54aawI
 lzTD4Wom4Ja13t2+HyDWBxnmImxTBawl3c1mqGv2VTFsJQTo/16AzUqgFMV3LHOmNPIQ
 2qCPMI5hoqpfDudJ7ASjDcLANayBfYbXnrU/zu/n/1gSUw9bEiJYv9YM5RTNU1jhfhuT
 Xnlg==
X-Gm-Message-State: AOAM5303dvTyidqYvkLjyQWI6wlgQegOePB+VDq8RjavPaby2ZKjrVA5
 T7cMf3Lc97I6Ga6b3lI3AG0=
X-Google-Smtp-Source: ABdhPJwbMqfWLUnXPYVg/L5DHuNO0434rLekbeTOpfLr+fqjs6M8TaDlgjTDhi1haUAB5xeWwrUvaQ==
X-Received: by 2002:a05:620a:4107:: with SMTP id
 j7mr36645119qko.645.1641324789907; 
 Tue, 04 Jan 2022 11:33:09 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m1sm32879409qkn.115.2022.01.04.11.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 11:33:09 -0800 (PST)
Message-ID: <2dd76203-e22f-9142-b94a-df94e1f9b797@gmail.com>
Date: Tue, 4 Jan 2022 16:33:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 01/17] pnv_phb3.c: add unique chassis and slot for
 pnv_phb3_root_port
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-2-danielhb413@gmail.com>
 <2a8367ed-d23b-3716-77d0-911cba9ecb74@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <2a8367ed-d23b-3716-77d0-911cba9ecb74@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 05:24, Cédric Le Goater wrote:
> On 12/28/21 20:37, Daniel Henrique Barboza wrote:
>> When creating a pnv_phb3_root_port using the command line, the first
>> root port is created successfully, but the second fails with the
>> following error:
>>
>> qemu-system-ppc64: -device pnv-phb3-root-port,bus=phb3-root.0,id=pcie.3:
>> Can't add chassis slot, error -16
>>
>> This error comes from the realize() function of its parent type,
>> rp_realize() from TYPE_PCIE_ROOT_PORT. pcie_chassis_add_slot() fails
>> with -EBUSY if there's an existing PCIESlot that has the same
>> chassis/slot value, regardless of being in a different bus.
>>
>> One way to prevent this error is simply set chassis and slot values in
>> the command line. However, since phb3 root buses only supports a single
>> root port, we can just get an unique chassis/slot value by checking
>> which root bus the pnv_phb3_root_port is going to be attached, get the
>> equivalent phb3 device and use its chip-id and index values, which are
>> guaranteed to be unique.
> 
> I guess parent_realize() will fail if we add 2 root port devices under
> the same phb ?

If we change chassis/slot for each new pci root port the QEMU emulation will
allow it. The problem is with skiboot which, at least according to the commit
that introduced powernv9 support [1], does not support multiple PCIE devices in the
same PHB:

----
No default device layout is provided and PCI devices can be added on
any of the available PCIe Root Port (pcie.0 .. 2 of a Power9 chip)
with address 0x0 as the firwware (skiboot) only accepts a single
device per root port.
----

That said, I'm taking this information at face value. Perhaps this is a test
worth doing to at least document this restriction more explicitly in the
docs.


[1] https://github.com/qemu/qemu/commit/4f9924c4d4cf9c039e247c5cdbbf71bce4e573c3


Thanks,

Daniel

> 
> Thanks,
> 
> C.
> 
> 
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb3.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index 4e2d680d44..130d392b3e 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -1156,8 +1156,24 @@ static const TypeInfo pnv_phb3_root_bus_info = {
>>   static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>> +    PCIDevice *pci = PCI_DEVICE(dev);
>> +    PCIBus *bus = pci_get_bus(pci);
>> +    PnvPHB3 *phb = NULL;
>>       Error *local_err = NULL;
>> +    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> +                                          TYPE_PNV_PHB3);
>> +
>> +    if (!phb) {
>> +        error_setg(errp,
>> +"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
>> +        return;
>> +    }
>> +
>> +    /* Set unique chassis/slot values for the root port */
>> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
>> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
>> +
>>       rpc->parent_realize(dev, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
>>
> 

