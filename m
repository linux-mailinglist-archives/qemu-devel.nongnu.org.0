Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3653F5D2F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 13:37:09 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIUjr-000573-71
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 07:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIUiL-0004FN-Ot
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIUiJ-0002s0-7c
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 07:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629804928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkCZCTbIz+91RGjIo5GJ7JlH6s+EryEjmF0HgJNCLK8=;
 b=iz8Mq8tW3TwXbn9DS/8eqWb+SOBESmc7ZHaYw0mSk2B5Cbo0OREYzK+lgF/JNdieei/4vl
 +SrJmNBex+UHTegJbT73pq6NUbKrkexuoI6YdkMbmJheF926E4YXsxgdJ4sfpz0DzsK8/Q
 y9oZUogWteygMu/muUcvFiTXPGD5RYg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Zdk_BId4PyOfdYCNlH3Rhg-1; Tue, 24 Aug 2021 07:35:26 -0400
X-MC-Unique: Zdk_BId4PyOfdYCNlH3Rhg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso968808wma.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 04:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vkCZCTbIz+91RGjIo5GJ7JlH6s+EryEjmF0HgJNCLK8=;
 b=Re4wDyNOLij/HTHu1JmUO72JpC+dCvZoKjiB0opK5D7i1bo8oHO98snLJkzRjStOss
 LrFEk+Zsqqdm9zwYsuHh5IQrS1i5bADguOM7VJlb54oWRpeD+ZZZJCrCytH65uo1xcQI
 Hk0wJxBe8pL5Od470FQ0bCLUk/8P+caw4qHxO3VEoleZQdW9dOSZe/PXj+9Z9ejr1soR
 G8MEZyvFkwUVFgY6x5XC78ppubqmI847e3Dc0LFZK10n/dnC7V0qwzRpKMozp1PCAEWp
 +a/0+kbbcXjemc9xqNS6ypVfJ9WUoOpyRbflLjoHJDvjLR+E59Whs7IaeGqzYF+wQ0n7
 GiLw==
X-Gm-Message-State: AOAM530h+0wNYM3vLIY4mP5TbT8efUO3alPLYV792X8PICLVgElL5Fy5
 XjEOOr1BEkzhN9pmHnQRtItw5sF+TI5vchscD+krlicwdjmCWVryoUOGrlWGVJekn8jaDD9rWS4
 f/ez6wNRXBKnjwF9bQjXnXaPmijsejGCTxHojXsb5tCBoXW4p2CnfizIscAxK0cLi
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr3728629wmr.168.1629804924707; 
 Tue, 24 Aug 2021 04:35:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy07m39Dtl5IHtc+tEHLd+PEmhWPn5UM8gplBikNFPziETW9tbMyRgOBwTga+EDAJFUtexxA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr3728604wmr.168.1629804924403; 
 Tue, 24 Aug 2021 04:35:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k13sm1952532wms.33.2021.08.24.04.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 04:35:23 -0700 (PDT)
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
To: Ani Sinha <ani@anisinha.ca>
References: <20210821150535.763541-1-ani@anisinha.ca>
 <20210823190444-mutt-send-email-mst@kernel.org>
 <20210824105614.2762541f@redhat.com>
 <alpine.DEB.2.22.394.2108241603590.891355@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108241636100.892262@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e941472c-4dc0-d8ea-7c1b-540aefbbc70c@redhat.com>
Date: Tue, 24 Aug 2021 13:35:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108241636100.892262@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 1:06 PM, Ani Sinha wrote:
> On Tue, 24 Aug 2021, Ani Sinha wrote:
>> On Tue, 24 Aug 2021, Igor Mammedov wrote:
>>> On Mon, 23 Aug 2021 19:06:47 -0400
>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>
>>>> On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
>>>>> Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
>>>>> We need to validate the presence of this property before performing any hotplug
>>>>> related callback operations. Currently validation of the existence of this
>>>>> property was absent from acpi_pcihp_device_unplug_cb() function but is present
>>>>> in other hotplug/unplug callback functions. Hence, this change adds the missing
>>>>> check for the above function.
>>>>>
>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>
>>>> I queued this but I have a general question:
>>> I convinced myself that this patch is wrong, pls drop it.
>>>
>>>> are all these errors logged with LOG_GUEST_ERROR?
>>>> Because if not we have a security problem.
>>>> I also note that bsel is an internal property,
>>>> I am not sure we should be printing this to users,
>>>> it might just confuse them.
>>>>
>>>> Same question for all the other places validating bsel.
>>>
>>> Commit message misses reproducer/explanation about
>>> how it could be triggered?
>>>
>>> If it's actually reachable, from my point of view
>>> putting checks all through out call chain is not robust
>>> and it's easy to miss issues caused by invalid bsel.
>>> Instead of putting check all over the code, I'd
>>> check value on entry points (pci_read/pci_write)
>>> if code there is broken.
>>>
>>>>
>>>>> ---
>>>>>  hw/acpi/pcihp.c | 10 ++++++++--
>>>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>>>> index 0fd0c1d811..9982815a87 100644
>>>>> --- a/hw/acpi/pcihp.c
>>>>> +++ b/hw/acpi/pcihp.c
>>>>> @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
>>>>>                                   DeviceState *dev, Error **errp)
>>>>>  {
>>>>>      PCIDevice *pdev = PCI_DEVICE(dev);
>>>>> +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
>>>>> +
>>>>> +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
>>>>>
>>>>> -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
>>>>> -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
>>>>> +    if (bsel < 0) {
>>>>> +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
>>>>> +                   ACPI_PCIHP_PROP_BSEL "' set");
>>>>> +        return;
>>>>> +    }
>>>
>>> 1st:
>>>  Error here is useless. this path is triggered on guest
>>>  MMIO write and there is no consumer for error whatsoever.
>>>  If I recall correctly, in such cases we in PCIHP code we make
>>>  such access a silent NOP. And tracing is there for a us
>>>  to help figure out what's going on.
>>>
>>> 2nd:
>>>  if it got this far, it means a device on a bus with bsel
>>>  was found and we are completing cleanup. Error-ing out at
>>>  this point will leak acpi_index.
>>
>> The above two points seems to apply in this case as well and so should we
>> do this?
>>
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index 0fd0c1d811..c7692f5d5f 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -400,12 +400,6 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>
>>      trace_acpi_pci_unplug_request(bsel, slot);
>>
>> -    if (bsel < 0) {
>> -        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
>> -                   ACPI_PCIHP_PROP_BSEL "' set");
>> -        return;
>> -    }
>> -
>>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>>  }
> 
> or add g_assert() on both instead.

'git-blame' & read git history ('git-log -p hw/acpi/pcihp.c')
often helps to understand how the code evolved and why it is
not "symmetric". For example see:

commit ec266f408882fd38475f72c4e864ed576228643b
Author: David Hildenbrand <david@redhat.com>
Date:   Wed Dec 12 10:16:17 2018 +0100

    pci/pcihp: perform check for bus capability in pre_plug handler

    Perform the check in the pre_plug handler. In addition, we need
    the capability only if the device is actually hotplugged (and not
    created during machine initialization). This is a preparation for
    coldplugging pci devices via that hotplug handler.

From here try to figure out what happened, why this changed was
necessary, why there is no equivalent g_assert() as you noticed.

Then try to convince the reviewers why in your commit description :)

See:
https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/#how-to-write-good-commit-messages


