Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5A4854BC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:37:54 +0100 (CET)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57QH-0001QO-KI
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n56tl-0001vS-Bp; Wed, 05 Jan 2022 09:04:17 -0500
Received: from [2607:f8b0:4864:20::72d] (port=34321
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n56ti-0000Ls-J0; Wed, 05 Jan 2022 09:04:17 -0500
Received: by mail-qk1-x72d.google.com with SMTP id b85so38321357qkc.1;
 Wed, 05 Jan 2022 06:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SwPMisbbRE6lQyW1ITWW08nkQr3rZExqz5iJp9r1dPw=;
 b=ONjtnzko4G4oB/AtoM41s0WCj4m+0eUQBJuQUH40AgG0IJImJctisGqvs8hDbVSjTz
 YfB/geCRcBh/1yo5j9SpYF+75W5pBUY4M1q6zD3mKdZxyzR6y/C8NA7n9ZLyyKyCBUzQ
 luQIrXaAlyc1l1LlHdzXfFO6dy4QHc/crr6RTWkf//Ijb6wqy6JCvTUyE06mGoZxtSK/
 zxamS3pyOZ+qpE8Y1UXM8rEQCq4W2nD4tCDQT+kAkOB9SLZt5/BA23shYrzpeHd0QSS4
 aA2zlDGrFbWY32Cyrzx29wkTSr16hexoCqdhiwCisiUGak7RKFr4plpet5NFZn8hazRV
 WP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SwPMisbbRE6lQyW1ITWW08nkQr3rZExqz5iJp9r1dPw=;
 b=mctxe7EY46WbYDt+tKPNvONVEWfyzvfJKFRBvoEFMz6BxPY4H8+huinUHAZvNUI9hH
 +JBv/zhNxjupi0t6S0RYLIMpDKaVa+AYs666sFA65/+6E9V6QN31kJb3carOIa3f/ZUB
 M8MzPKhxArLIQUsrJGmP8Bv+9rD0uCeEo5+XXE/toMuYpmucf3WHAwjsWW+iuDUZP/Q3
 mQDJgybWIc+NmMDE4m0WLn24cF6SZZ6m/nSCBsJ7UAEUx06yJYQTtz9BvCsUBMZgeQjb
 0vbTj27H3wEZhAc8ADe996nArpUavV2ZWpIpDSXiJagDCLz+/mao5rBOiP2roLcOnrmL
 b79w==
X-Gm-Message-State: AOAM533oDk04xPhvl0ZHbZBdi6pqBiavFDG2IBaA8nH6VQekN+xmuulK
 pcP1hir/nDuJ5R3HumK4vvSkarVAT6Q=
X-Google-Smtp-Source: ABdhPJzxYqBOtGU1xrmbqO5YmOkZkiB4QAIRp8TxJgXIpnezF6xnLJHzbV7x8OgqQjrOnvSnj5rsug==
X-Received: by 2002:a05:620a:4551:: with SMTP id
 u17mr38930989qkp.351.1641391453020; 
 Wed, 05 Jan 2022 06:04:13 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id h4sm1749680qkp.54.2022.01.05.06.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 06:04:12 -0800 (PST)
Message-ID: <99d05104-3156-5485-2f5e-bf25155d62a0@gmail.com>
Date: Wed, 5 Jan 2022 11:04:09 -0300
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Yes. It will fail with an error similar to the one that happens with phb4 root
ports:


qemu-system-ppc64: -device pnv-phb4-root-port,bus=pnv-phb4-root-bus.0,slot=8: Bus 'pnv-phb4-root-bus.0' is full

This happens because we're setting max_dev = 1 in the root bus class, in both cases:


static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
{
     BusClass *k = BUS_CLASS(klass);

     /*
      * PHB4 has only a single root complex. Enforce the limit on the
      * parent bus
      */
     k->max_dev = 1;
}


I also did a quick experiment with both. I set their root bus class max_dev to 2, then changed
the code to allow adding a second root port in the PHB. The machine boots, which is good, but the
OS doesn't see the extra root port in the output of 'lspci'. Same result for both.


I can't see if this has to do with skiboot lacking support for it or something that we need
to do in QEMU. For PHB4s, seeing how we've tied together the stack->phb->root port relationship
throughout the code I can't say I'm surprised. Even if skiboot starts to allow multiple pci devices
attached directly in the root complex we'll have to do some rework in the QEMU side to allow it.


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

