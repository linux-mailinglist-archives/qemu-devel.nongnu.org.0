Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE515BFB2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 14:49:25 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Ers-0003i1-By
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 08:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2Eob-0008Do-SO
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2Eoa-0000jO-Nx
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:46:01 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22393
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2Eoa-0000ib-Ja
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581601557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otGcj6+gTd0lM/N+nMk+ulE/cCS4tpnsiTP5cBC4dQY=;
 b=X65LKHWpmcWJtaXHqr/V2ALGkAV9cXp1B1ShpfC+yPrK3Iqe9Bpz3BGdhfEXsqrh/np1ZV
 S909uHowI/AnmLxmzYv5skF+fHA78A/wpsA+cB6F8pJIIqrxqFdgI17QTwA4mcRA2BG1n4
 zw4ojePfYOZ6in80GXRAIo50ySfOFiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313--ql0KuwZNI6-eqcTRd5DpA-1; Thu, 13 Feb 2020 08:45:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9F4C1088380;
 Thu, 13 Feb 2020 13:45:51 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABED860499;
 Thu, 13 Feb 2020 13:45:42 +0000 (UTC)
Subject: Re: [PATCH v15 8/9] hw/arm/virt: Add the virtio-iommu device tree
 mappings
From: Auger Eric <eric.auger@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-9-eric.auger@redhat.com>
 <CAFEAcA-n97LKaQo9haLdEv+c7k8QkK=LegP_gORr9z4WrBU2Ww@mail.gmail.com>
 <5e4549f4-44c3-6a2c-a270-4923db8b455e@redhat.com>
Message-ID: <b39be61a-0562-c747-2f47-ba9f966277d7@redhat.com>
Date: Thu, 13 Feb 2020 14:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5e4549f4-44c3-6a2c-a270-4923db8b455e@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: -ql0KuwZNI6-eqcTRd5DpA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: jean-philippe@linaro.org, "Tian, Kevin" <kevin.tian@intel.com>,
 tnowicki@marvell.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, Michael,

On 2/11/20 6:31 PM, Auger Eric wrote:
> Hi Peter,
> 
> On 2/11/20 4:00 PM, Peter Maydell wrote:
>> On Sat, 8 Feb 2020 at 12:01, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>> Adds the "virtio,pci-iommu" node in the host bridge node and
>>> the RID mapping, excluding the IOMMU RID.
>>>
>>> This is done in the virtio-iommu-pci hotplug handler which
>>> gets called only if no firmware is loaded or if -no-acpi is
>>> passed on the command line. As non DT integration is
>>> not yet supported by the kernel we must make sure we
>>> are in DT mode. This limitation will be removed as soon
>>> as the topology description feature gets supported.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> +static void create_virtio_iommu(VirtMachineState *vms, Error **errp)
>>> +{
>>> +    const char compat[] = "virtio,pci-iommu";
>>> +    uint16_t bdf = vms->virtio_iommu_bdf;
>>> +    char *node;
>>> +
>>> +    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
>>> +
>>> +    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
>>> +    qemu_fdt_add_subnode(vms->fdt, node);
>>> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
>>> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
>>> +                                 1, bdf << 8, 1, 0, 1, 0,
>>> +                                 1, 0, 1, 0);
>>> +
>>> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
>>> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
>>> +    g_free(node);
>>> +
>>> +    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
>>> +                           0x0, vms->iommu_phandle, 0x0, bdf,
>>> +                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
>>> +}
>>
>> This function name implies that we're creating the IOMMU device
>> here (which would be a weird thing to do in a hotplug callback
>> for some other device), but it looks like we're only adding
>> device tree nodes ?
> yes the actual iommu device is created through the -device option. I can
> rename into create_iommu_dt_bindings
So I renamed it into create_virtio_iommu_dt_bindings()
>>
>> Given that we write the FDT blob into the guest RAM on bootup,
>> how does making changes to it here on hotplug (which I assume
>> to be 'after boot, whenever the user hot-plugs something') work?
> 
> the virtio-iommu is not supposed to be hotplugged but rather
> cold-plugged. I use this hotplug mechanism to detect its presence and
> add the related dt mappings. Maybe I can add a check to detect if the
> bootup is over?
I added in virtio-iommu-pci virtio_iommu_pci_class_init()
dc->hotpluggable = false;

As far as I understand this makes the virtio-iommu-pci device not
hotpluggable (same is used for intel-iommu):

(QEMU) device_add id=hot0 driver=virtio-iommu-pci bus=head.0 addr=4
{"error": {"class": "GenericError", "desc": "Parameter 'driver' expects
pluggable device type"}}

Is that OK?

Thanks

Eric

> 
> Thoughts?
> 
> Eric
>>
>> thanks
>> -- PMM
>>
> 
> 


