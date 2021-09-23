Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F74159F0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 10:16:21 +0200 (CEST)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTJtz-0008OR-JY
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 04:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mTJsL-0007gs-4D
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mTJsG-0007EE-3s
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632384869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0PpjiE7aew2A+W/g1wQ5hIPAdrQJnVgesl5jvNncC4=;
 b=cD1XaxLr87dLar12T+j1v7xu+3j2RkRsSDsxjmZzW9F3+rtj4zz9CRU+7f74CpKG2rrAUR
 HjjByvG+eGNNX55QN0nq23Gir2CGNI8mhidhd06SsiVxmiqECvj+nvAH9h17sU91CKal3h
 fyW6pNRcau2qc7WLmnJv2TnS4d5HSIc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-EqPap-XzP8GivU2oMPW7jA-1; Thu, 23 Sep 2021 04:14:28 -0400
X-MC-Unique: EqPap-XzP8GivU2oMPW7jA-1
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so4422939wru.15
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 01:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=b0PpjiE7aew2A+W/g1wQ5hIPAdrQJnVgesl5jvNncC4=;
 b=FZtbs7D58ID2Pl5PB3LKnvGd/kUkVt4FddqeJsTr40bZxKbvB+hZnYUpnO0zlrRj3U
 3b9srs45YmLxQrcmh28pH0mKBMWtx8C/Z4N4+iXjMX0kzBhcr9WpHz6K6I24V66b9Hmx
 Ak8IpkisYpYuqWyVPDpKXU35EOGFgggjtNRcnaK+M3a4ZHG/9yzi3zyAdJxsrXu8LY99
 4ZlbPoP3uL3rXDeNe13rSrPjKjiFIJDbzGYViRwxN7a0+umI+1BluJa0RaUGhqea30SZ
 O3mbes3WXxANZ1eIh5v7pmzY2fBEKbNPjQnQL19Ns/10KdIcR+ar5xDKciE45DZh4JOz
 9s5A==
X-Gm-Message-State: AOAM531p+XZcnWDqOzD/8fg+VXJc4wrYT6MlotpX3kP3GWAJ7ZmYo2py
 SGxhMNyqnDov+WxhhjI9mmB6eUl1kUukvDl9RRmCkmYNamlHG4sg6kckmIBbjCmJDqE2TF4gfsH
 VkKhbpDQ/ahx/dxA=
X-Received: by 2002:a7b:c392:: with SMTP id s18mr2952550wmj.184.1632384867462; 
 Thu, 23 Sep 2021 01:14:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQTA6r25l9jNLVoquoQ3AiLoXxVRobBBTrvX9Ed9fgfbVsKqNz+d8Lcs1tjJHnRmLRtEHOPg==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr2952525wmj.184.1632384867280; 
 Thu, 23 Sep 2021 01:14:27 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23e5d.dip0.t-ipconnect.de. [79.242.62.93])
 by smtp.gmail.com with ESMTPSA id
 j4sm4782378wrt.67.2021.09.23.01.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 01:14:26 -0700 (PDT)
Subject: Re: [PATCH v2] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
To: Markus Armbruster <armbru@redhat.com>
References: <20210922125734.79712-1-david@redhat.com>
 <87k0j7hhj0.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a18dc84c-51c3-f661-da54-14889222d97b@redhat.com>
Date: Thu, 23 Sep 2021 10:14:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87k0j7hhj0.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.09.21 09:34, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> We want to rate-limit MEMORY_DEVICE_SIZE_CHANGE events per device,
>> otherwise we can lose some events for devices. As we might not always have
>> a device id, add the qom-path to the event and use that to rate-limit
>> per device.
> 
> There are actually two reasons for adding qom-path.  One, you need it to
> fix the rate limiting.  But adding to an external interface just to fix
> an internal issue would be questionable.  Fortunately, there's also two:
> make the event useful regardless of whether the user gave it an ID.  If
> you have to respin, consider working two into the commit message.
> 
> I'd split this patch into "add qom-path" and "fix rate limiting".
> Suggestion, not demand.

Sure, makes sense.

> 
>> This was noticed by starting a VM with two virtio-mem devices that each
>> have a requested size > 0. The Linux guest will initialize both devices
>> in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
>> one of the devices.
>>
>> Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Michal Privoznik <mprivozn@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> Follow up of:
>>      https://lkml.kernel.org/r/20210921102434.24273-1-david@redhat.com
>>
>> v1 -> v2:
>> - Add the qom-path and use that identifier to rate-limit per device
>> - Rephrase subject/description
>>
>> ---
>>   hw/virtio/virtio-mem-pci.c | 3 ++-
>>   monitor/monitor.c          | 9 +++++++++
>>   qapi/machine.json          | 5 ++++-
>>   3 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
>> index fa5395cd88..dd5085497f 100644
>> --- a/hw/virtio/virtio-mem-pci.c
>> +++ b/hw/virtio/virtio-mem-pci.c
>> @@ -87,6 +87,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>>       VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
>>                                            size_change_notifier);
>>       DeviceState *dev = DEVICE(pci_mem);
>> +    const char * qom_path = object_get_canonical_path(OBJECT(dev));
> 
> No space after this *, please.

Whoops :)

> 
>>       const uint64_t * const size_p = data;
>>       const char *id = NULL;
>>   
>> @@ -94,7 +95,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>>           id = g_strdup(dev->id);
>>       }
>>   
>> -    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
>> +    qapi_event_send_memory_device_size_change(!!id, id, *size_p, qom_path);
> 
> Doesn't this leak @qom_path?
> 

I was asking myself the same question, but ended up essentially copying 
what hw/core/machine.c:machine_query_hotpluggable_cpus() does.

object_get_canonical_path() will end up doing a g_strdup(), just like we 
do with id here. I assume qapi code will end up freeing both strings, right?

[...]

>>   
>>   ##
> 
> With the two code remarks addressed:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

Thanks, I'll respin!

-- 
Thanks,

David / dhildenb


