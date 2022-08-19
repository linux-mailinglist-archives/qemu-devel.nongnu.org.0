Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB8759985C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:19:49 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyAN-000154-MQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOy3n-0004xt-AA; Fri, 19 Aug 2022 05:12:59 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOy3l-00020W-Ix; Fri, 19 Aug 2022 05:12:59 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-11c5505dba2so4552133fac.13; 
 Fri, 19 Aug 2022 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=usMAE2f/5/0FsJJycYOfB0zVVTMiwnTfMXrg+mfoJzg=;
 b=dz2jJFD75FMqM4Vo/Qc3VLZ1JsOxW7bzwpq7r+iU3CN6iH967xjPnA6gcxzuvNW1Bg
 1VJjkfwza3Qm8wGAPbeb8zYokuaaohu4SstDB4fQnl4oPAvFuAAdMtVyRZub4vIorNK5
 3CdZPNjFiIgrA8T3dAaTKwF5oaRMXAn/1UJjr+X2ik5zdVmCyzHKpTqgQmV5tLA8QU3P
 xpu2OxQHLDgy5htc5XVzfpftPbnV5kkyMiHI4Vi4P3Gg0Tk+zlqOkDhxUzidQp1G/PZT
 okvxvhzAo8zvVMcU6xhehI3n9bJPMYpeKNkebqodkh+LmTkZDI5PIMRyAZFK4AYCuKjC
 iSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=usMAE2f/5/0FsJJycYOfB0zVVTMiwnTfMXrg+mfoJzg=;
 b=ikxvN9PHJaVQkRIhmYrEBrR2k3cXRzMusMW3u9iJPOhFuSfatlAIzb9ZPvCeoMMzL3
 paH2Y/ucJuxx45unrFuH22PMB+XgJ+CcHK9GzeqbU3Q3JPc8IbU3ujo7McjoFsWa+kQf
 ZDLIHmav42pcUqtOcrWxHsSaoHpBMP9QBSOIIAInBeWJsTDm9+aqjJIF7EmAZgK6sWza
 cuUiBwMPrxlYLAoew8zhtKge/nOF9iOQ6g0+LrlihntX6jzaxp1UnTF7CqKbd1+LzEWi
 3UUZ9m73y1RwFDTJ3OCErGtY4n6i+A4ADPzBOpPjyGzbprFhtDUU5QAOqUzF3GDH8cGd
 yyvg==
X-Gm-Message-State: ACgBeo3dIKGqwE0EyZgEy3yVuAx3uvTNyNRqbQDmXfKnsrkyekLKVBm2
 Mi4i53/IfT8CV5tPBGUMAC8TlfFrVyEw4g==
X-Google-Smtp-Source: AA6agR6HtJ6wDusgJrYArOXbQ7od5M2BRk2nb4fYj4wQVwf1oS4Y7bzYUX4Eo/q5NhFklhSjuoUJ+w==
X-Received: by 2002:a05:6870:51cb:b0:116:82f3:bda2 with SMTP id
 b11-20020a05687051cb00b0011682f3bda2mr6423778oaj.274.1660900375504; 
 Fri, 19 Aug 2022 02:12:55 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a4ad542000000b00448aff53822sm829609oos.40.2022.08.19.02.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 02:12:55 -0700 (PDT)
Message-ID: <c687a709-9910-73f2-ed00-eee575778e22@gmail.com>
Date: Fri, 19 Aug 2022 06:12:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 2/2] ppc/pnv: fix QOM parenting of user creatable
 root ports
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, fbarrat@linux.ibm.com
References: <20220818224511.373255-1-danielhb413@gmail.com>
 <20220818224511.373255-3-danielhb413@gmail.com>
 <125fdf68-a491-6098-9e19-2b334a1a25f9@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <125fdf68-a491-6098-9e19-2b334a1a25f9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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



On 8/19/22 04:19, Cédric Le Goater wrote:
> On 8/19/22 00:45, Daniel Henrique Barboza wrote:
>> User creatable root ports are being parented by the 'peripheral' or the
>> 'peripheral-anon' container. This happens because this is the regular
>> QOM schema for sysbus devices that are added via the command line.
>>
>> Let's make this QOM hierarchy similar to what we have with default root
>> ports, i.e. the root port must be parented by the pnv-root-bus. To do
>> that we change the qom and bus parent of the root port during
>> root_port_realize(). The realize() is shared by the default root port
>> code path, so we can remove the code inside pnv_phb_attach_root_port()
>> that was adding the root port as a child of the bus as well.
>>
>> While we're at it, change pnv_phb_attach_root_port() to receive a PCIBus
>> instead of a PCIHostState to make it clear that the function does not
>> make use of the PHB.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb.c | 38 +++++++++++++++++++-------------------
>>   1 file changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>> index 4ea33fb6ba..38ec8571b7 100644
>> --- a/hw/pci-host/pnv_phb.c
>> +++ b/hw/pci-host/pnv_phb.c
>> @@ -62,27 +62,11 @@ static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
>>       return true;
>>   }
>> -/*
>> - * Attach a root port device.
>> - *
>> - * 'index' will be used both as a PCIE slot value and to calculate
>> - * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>> - * root port.
>> - */
>> -static void pnv_phb_attach_root_port(PCIHostState *pci)
>> +static void pnv_phb_attach_root_port(PCIBus *bus)
> 
> Do we still need this pnv_phb_attach_root_port routine ?

Good point. We can just add these 2 lines in the 'defaults_enabled' case
in pnv_phb_realize().

I'll re-send. Thanks,


Daniel



> 
>>   {
>>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
>> -    const char *dev_id = DEVICE(root)->id;
>> -    g_autofree char *default_id = NULL;
>> -    int index;
>> -    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
>> -    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
>> -
>> -    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
>> -                              OBJECT(root));
>> -
>> -    pci_realize_and_unref(root, pci->bus, &error_fatal);
>> +    pci_realize_and_unref(root, bus, &error_fatal);
>>   }
>>   /*
>> @@ -184,7 +168,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>> -    pnv_phb_attach_root_port(pci);
>> +    pnv_phb_attach_root_port(pci->bus);
>>   }
>>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
>> @@ -259,6 +243,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>>       Error *local_err = NULL;
>>       int chip_id, index;
>> +    /*
>> +     * 'index' will be used both as a PCIE slot value and to calculate
>> +     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>> +     * root port.
>> +     */
>>       chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
>>       index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
>> @@ -266,6 +255,17 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>>       qdev_prop_set_uint8(dev, "chassis", chip_id);
>>       qdev_prop_set_uint16(dev, "slot", index);
>> +    /*
>> +     * User created root ports are QOM parented to one of
>> +     * the peripheral containers but it's already at the right
>> +     * parent bus. Change the QOM parent to be the same as the
>> +     * parent bus it's already assigned to.
>> +     */
>> +    if (!pnv_parent_fixup(OBJECT(bus), BUS(bus), OBJECT(dev),
>> +                          index, errp)) {
>> +        return;
>> +    }
>> +
>>       rpc->parent_realize(dev, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
> 

