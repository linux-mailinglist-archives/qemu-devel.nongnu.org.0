Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1462415588C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 14:37:57 +0100 (CET)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j03pU-0004vA-4o
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 08:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j03oJ-0003dp-TE
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 08:36:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j03oI-0000vf-F5
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 08:36:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36345
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j03oI-0000sf-95
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 08:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581082598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r78P+OeZ8mXzhWTNlUJukDEI2NiuxbJT3nuVnClgWVw=;
 b=iT44yD8r9kAC82vhP1QoARH5s93Cra15yqmYHduWXz50oSeuDbsMDPUHxwKBoyGykJC4Qv
 C1UO9NVpGEcUZpesW8MnpxyT0pXFCr12xmMKK4jcXP+717Ogv6wcGrBwzke+alhQhNh7VT
 +NDXWEGK1Bfw3+Dl7zOj1GnDxBlnjqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-XXoDksGIOoqYsLqsDsWuiw-1; Fri, 07 Feb 2020 08:36:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4CBDB65;
 Fri,  7 Feb 2020 13:36:33 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1881D60BEC;
 Fri,  7 Feb 2020 13:36:22 +0000 (UTC)
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207052214-mutt-send-email-mst@kernel.org>
 <25d39300-46b9-571c-6fa6-44c5f8d0be99@redhat.com>
 <20200207111538.GB1999431@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ee50af9c-398d-6fdf-d012-cf3430a78580@redhat.com>
Date: Fri, 7 Feb 2020 14:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200207111538.GB1999431@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XXoDksGIOoqYsLqsDsWuiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 "Michael S. Tsirkin" <mst@redhat.com>, quintela@redhat.com,
 dgilbert@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 2/7/20 12:15 PM, Jean-Philippe Brucker wrote:
> On Fri, Feb 07, 2020 at 11:51:55AM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 2/7/20 11:23 AM, Michael S. Tsirkin wrote:
>>> On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
>>>> At the moment, the kernel only supports device tree
>>>> integration of the virtio-iommu. DT bindings between the
>>>> PCI root complex and the IOMMU must be created by the machine
>>>> in conformance to:
>>>>
>>>> Documentation/devicetree/bindings/virtio/iommu.txt.
>>>>
>>>> To make sure the end-user is aware of this, force him to use the
>>>> temporary device option "x-dt-binding" and also double check the
>>>> machine has a hotplug handler for the virtio-iommu-pci device.
>>>> This hotplug handler is in charge of creating those DT bindings.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> how about setting it by default from machine class?
>> Do you mean in ARM virt machine class? But this wouldn't prevent a user
>> from launching an ACPI booted guest. I thought you wanted the end-user
>> to know what he does.
>>
>> I don't figure out a way to know if the guest is booted in dt or acpi
>> mode. I can get access to those info:
>> - whether acpi is enabled
> 
> That's the default on virt machine right?
I think that's the default for qemu. you can siwtch it off on the cmd
line using "-no-acpi"


  Then if there is a FW it can
> choose either ACPI or DT?
yes that's why I can't actually know which one is going to be used.
> 
>> - whether a FW is loaded
In case there is no FW I am sure this is dt mode. So I would be inclined
to only support that mode atm.
>>
>> But a FW can be loaded, acpi enabled and eventually the guest is DT
>> booted with acpi=off in kernel opts.
>>
>> Maybe at this point I could only support the case where no FW is loaded.
>> In machvirt I would not register the virtio-iommu-pci hotplug handler in
>> case a FW is loaded. Then I could get rid of the new x-dt-binding prop.
>>
>> Thoughts?
> 
> Yes, I'm hoping we can get the topology description into next version of
> Linux, and it would be nicer not to introduce backward-compatible baggage
> for something that should be solved within a few month

I agree. So I am inclined to remove the x-dt-binding prop then I just
expose allow the virtio-iommu-pci to be instantiated if no FW is loaded.
The constraint will be removed when we get topology description support
in kernel.

Thanks

Eric
If we have to
> warn the user then checking the FW seems like a good compromise, and easy
> to remove later.
> 
> Thanks,
> Jean
> 
>>
>> Eric
>>> See
>>> [PATCH 1/2] spapr: Disable legacy virtio devices for pseries-5.0 and later
>>> [PATCH 2/2] spapr: Enable virtio iommu_platform=on by default
>>> which does it for spapr.
>>
>>>
>>>> ---
>>>>
>>>> May be squashed with previous patch
>>>> ---
>>>>  hw/virtio/virtio-iommu-pci.c | 18 ++++++++++++++++++
>>>>  1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
>>>> index d539fcce75..3d06e14000 100644
>>>> --- a/hw/virtio/virtio-iommu-pci.c
>>>> +++ b/hw/virtio/virtio-iommu-pci.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include "virtio-pci.h"
>>>>  #include "hw/virtio/virtio-iommu.h"
>>>>  #include "hw/qdev-properties.h"
>>>> +#include "qapi/error.h"
>>>>  
>>>>  typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
>>>>  
>>>> @@ -27,10 +28,12 @@ typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
>>>>  struct VirtIOIOMMUPCI {
>>>>      VirtIOPCIProxy parent_obj;
>>>>      VirtIOIOMMU vdev;
>>>> +    bool dt_binding;
>>>>  };
>>>>  
>>>>  static Property virtio_iommu_pci_properties[] = {
>>>>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
>>>> +    DEFINE_PROP_BOOL("x-dt-binding", VirtIOIOMMUPCI, dt_binding, false),
>>>>      DEFINE_PROP_END_OF_LIST(),
>>>>  };
>>>>  
>>>> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>>>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>>>>      DeviceState *vdev = DEVICE(&dev->vdev);
>>>>  
>>>> +    if (!dev->dt_binding) {
>>>> +        error_setg(errp,
>>>> +                   "Instantiation currently only is possible if the machine "
>>>> +                   "creates device tree iommu-map bindings, ie. ACPI is not "
>>>> +                   "yet supported");
>>>> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
>>>> +        error_setg(errp,
>>>> +                   "The machine does not implement a virtio-iommu-pci hotplug "
>>>> +                   " handler that creates the device tree iommu-map bindings");
>>>> +       return;
>>>> +    }
>>>>      qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
>>>>      object_property_set_link(OBJECT(dev),
>>>>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
>>>> -- 
>>>> 2.20.1
>>>
>>
> 


