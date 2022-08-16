Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5759637F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:05:53 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO2ox-0006O9-GL
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO2jh-0004OA-Hw; Tue, 16 Aug 2022 16:00:29 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:33372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO2jd-0007sI-Uu; Tue, 16 Aug 2022 16:00:24 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id q15so11252281vsr.0;
 Tue, 16 Aug 2022 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=JR+qU9A5WYmQlShQl7RpNBkpUs7vcS4zRvafxz+XecI=;
 b=BMbxMIHPDflPvXJKvU6mDEzQ9qRwEO5wzAaUgxs3yj23c9qBPFQSSvRaVRSLs9qBUt
 +EDVgKKl/+HTY46dhaLI47jP1KKtcpD9uNWFzUk9vhHMkJRKQglL2JG1Zps3OnNzRMlx
 CXHDTGMklndOO31Kj2R40i/NkClJtVg18x0vcjnV/h+q8p0qZamYDBe32zVQRYTOhH4f
 BjdQGt0rf1DpulAhYGS45vuzJ753Bdg/yJbC8FIt8puXKbRpe1frwHGaCWLe/7dyyfbY
 4MH3xZ/PLP62pn8zuv+elYqPijCEgDyV1Z90sN8l9/IPhLj1WX8hJk+Yhx1EmGjQOLS/
 Jocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JR+qU9A5WYmQlShQl7RpNBkpUs7vcS4zRvafxz+XecI=;
 b=7UlgFAZsz+5qZTGNKHFGHXtOXUDPmaiQk8fHEr4TvTLl4yX6uv3iEBSRZS8XWRn8zy
 VpbRR1XtbmTMkCXp5KxZh50yU+Pn2rxukNmDm1IZDjmUY+LFrUnsWqHhS/ElytFy6Vxn
 rXMDQ51w4v6O2O7Kj25mXXQGYqE/i3BDwNZ1w+6N8yIxt1Mw53lw5dJK1NlOD8KjZdxp
 8CKdbYN4REOLiyYZ1czTnr0/JO7b94HDEulCNanQ74fFi+dQUWFF9O/bnvGPD2Camt2e
 4rfETxV8fWkh2JB06ek4vrsZDasmdtHrwK1x6k5CJU3g0bq9ymwOHnEvS22MFeo3DdR6
 2hcw==
X-Gm-Message-State: ACgBeo37AewlV0AMRXZmKota0lDANqxj512qJqq5uppOQ6MHzwHv+1ND
 AcBxaufZ7CnBUjd7c9kRze0=
X-Google-Smtp-Source: AA6agR4g1mnkcgaFYzbL0YYUDpkCAYx+qUfulTBC27ERHcWRag4jdTCggbCOzzCR4tOtjrmNbKqjEw==
X-Received: by 2002:a05:6102:34d:b0:386:e5ea:a931 with SMTP id
 e13-20020a056102034d00b00386e5eaa931mr8973369vsa.74.1660680020086; 
 Tue, 16 Aug 2022 13:00:20 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 m140-20020a1fa392000000b003776a46bd85sm9296767vke.56.2022.08.16.13.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 13:00:19 -0700 (PDT)
Message-ID: <9e505923-f5e9-7927-15e5-802aacdc1e63@gmail.com>
Date: Tue, 16 Aug 2022 17:00:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 11/11] ppc/pnv: fix QOM parenting of user
 creatable root ports
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-12-danielhb413@gmail.com>
 <8eda639d-b041-df07-f759-c65ec2d85312@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8eda639d-b041-df07-f759-c65ec2d85312@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
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



On 8/12/22 13:13, Frederic Barrat wrote:
> 
> 
> On 11/08/2022 18:39, Daniel Henrique Barboza wrote:
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
>>   hw/pci-host/pnv_phb.c | 35 +++++++++++++++--------------------
>>   1 file changed, 15 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>> index 17d9960aa1..65ed1f9eb4 100644
>> --- a/hw/pci-host/pnv_phb.c
>> +++ b/hw/pci-host/pnv_phb.c
>> @@ -51,27 +51,11 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
>>       }
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
>>   {
>>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
>> -    const char *dev_id = DEVICE(root)->id;
>> -    g_autofree char *default_id = NULL;
>> -    int index;
>> -
>> -    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
>> -    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
>> -
>> -    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
>> -                              OBJECT(root));
>> -    pci_realize_and_unref(root, pci->bus, &error_fatal);
>> +    pci_realize_and_unref(root, bus, &error_fatal);
>>   }
>>   /*
>> @@ -171,7 +155,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>> -    pnv_phb_attach_root_port(pci);
>> +    pnv_phb_attach_root_port(pci->bus);
>>   }
>>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
>> @@ -240,12 +224,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
>> -    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
>> +    BusState *qbus = qdev_get_parent_bus(dev);
>> +    PCIBus *bus = PCI_BUS(qbus);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>>       uint16_t device_id = 0;
>>       Error *local_err = NULL;
>>       int chip_id, index;
>> +    /*
>> +     * 'index' will be used both as a PCIE slot value and to calculate
>> +     * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>> +     * root port.
>> +     */
>>       chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
>>       index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
>> @@ -253,6 +243,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>>       qdev_prop_set_uint8(dev, "chassis", chip_id);
>>       qdev_prop_set_uint16(dev, "slot", index);
>> +    pnv_parent_qom_fixup(OBJECT(bus), OBJECT(dev), index);
>> +    if (!qdev_set_parent_bus(dev, qbus, &error_fatal)) {
> 
> 
> That line looks surprising at first, because we got qbus from qdev_get_parent_bus() just above, so it looks like a noop. I talked to Daniel about it: the device<->bus relationship is correct when entering the function but the call to pnv_parent_qom_fixup() interferes with the bus relationship, so it needs to be re-established.

The more detailed version: when adding a child property
using object_property_add_child(), object_property_try_add_child() is called.
This function calls internally a object_property_try_add() function with lots
of parameters, including a release callback named 'object_finalize_child_property'.

This release callback is implemented like this:

static void object_finalize_child_property(Object *obj, const char *name,
                                            void *opaque)
{
     Object *child = opaque;

     if (child->class->unparent) {
         (child->class->unparent)(child);
     }
     child->parent = NULL;
     object_unref(child);
}

If you're adding a device as a child, which is our case here,
child->class->unparent is device_unparent(). Note that device_unparent()
removes the device from its parent_bus:

static void device_unparent(Object *obj)
{
     DeviceState *dev = DEVICE(obj);
     BusState *bus;

     if (dev->realized) {
         qdev_unrealize(dev);
     }
     while (dev->num_child_bus) {
         bus = QLIST_FIRST(&dev->child_bus);
         object_unparent(OBJECT(bus));
     }
     if (dev->parent_bus) {
         bus_remove_child(dev->parent_bus, dev);
         object_unref(OBJECT(dev->parent_bus));
         dev->parent_bus = NULL;
     }
}

So, back in our qom_fixup() helper, we're doing an object_unparent(). This
function calls object_property_del_child(), which in turn calls the
property release callback prop->release if it's defined. It is defined,
and in our case it's the object_finalize_child_property() from above that will
end up calling device_unparent(), which will remove the device from the bus.

This is why I'm having to do a qdev_set_parent_bus() to assign the root port
to the same parent bus it had before. We want to fixup it's QOM parent without
changing its parent bus.

Also, note that we're doing the same thing for the user created pnv-phbs in
pnv_phb_user_device_init():

     pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
     pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb));

The difference here is that the QOM parent is not the same as the parent bus,
so it's less apparent what we're doing here.

All that said, since we're always calling these 2 fixup helpers together, I think
it's a good idea to create a single helper that handles both the QOM parenting and
the parent bus. I can also add some comments about what I've said here to explain
why we need to set the parent bus after doing an object_unparent().

> Short of a better suggestion, it probably need a comment.

I don't think we have wiggle room since we're dealing with deep QOM and qdev internals
in this case. I'm all ears for suggestions though.


Thanks,


Daniel

> 
>    Fred
> 
> 
> 
>> +        return;
>> +    }
>> +
>>       rpc->parent_realize(dev, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);

