Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE491155F0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:57:43 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGvG-0002YQ-I5
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1idF7f-0001zf-AT
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:02:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1idF7d-00080L-Qb
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:02:23 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48522
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1idF7W-0007w8-Pr
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575644530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9TsgsXJAu3LuW6RtanietIRQSisTWXPhVzrGoLenwaA=;
 b=X4MS2l+XcqkCRTeHtyZl7A6t6RjX6Y7M/llM3VhGuqldm1IeIShOyTn470SASH8Li/Fkua
 ZIb0heJ5MSvEtAytY54e6lNbXu2WU7gbs0nmGnHGtcE5bypftq0RgTkwG74j4/kzOd8i3c
 nhmzmiKFbH+1g/M3bg6YYKDVwfCFD6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-SA8N-bQOPQG1oD3L9OMNvA-1; Fri, 06 Dec 2019 07:00:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D8980059C
 for <qemu-devel@nongnu.org>; Fri,  6 Dec 2019 12:00:39 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-235.ams2.redhat.com
 [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6ED55DA60;
 Fri,  6 Dec 2019 12:00:32 +0000 (UTC)
Subject: Re: [PATCH for-5.0 4/8] acpi: cpuhp: spec: fix 'Command data'
 description
To: Igor Mammedov <imammedo@redhat.com>
References: <1575479147-6641-1-git-send-email-imammedo@redhat.com>
 <1575479147-6641-5-git-send-email-imammedo@redhat.com>
 <680b7776-044b-59e8-2ee9-f9e1751c5577@redhat.com>
 <20191206120936.5d7ad8e8@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <47c9effe-0df2-c692-6db4-398edc2272ba@redhat.com>
Date: Fri, 6 Dec 2019 13:00:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191206120936.5d7ad8e8@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: SA8N-bQOPQG1oD3L9OMNvA-1
X-Mimecast-Spam-Score: 0
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
Cc: pbonzini@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/06/19 12:09, Igor Mammedov wrote:
> On Thu, 5 Dec 2019 13:17:22 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
> 
>> On 12/04/19 18:05, Igor Mammedov wrote:
>>> Correct returned value description in case 'Command field' == 0x0,
>>> it's in not PXM but CPU selector value with pending event  
>>
>> (1) s/in not/not/
>>
>>>
>>> In addition describe 0 blanket value in case of not supported
>>> 'Command field' value.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>>  docs/specs/acpi_cpu_hotplug.txt | 11 +++++------
>>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
>>> index 4e65286..19c508f 100644
>>> --- a/docs/specs/acpi_cpu_hotplug.txt
>>> +++ b/docs/specs/acpi_cpu_hotplug.txt
>>> @@ -56,9 +56,8 @@ read access:
>>>             3-7: reserved and should be ignored by OSPM
>>>      [0x5-0x7] reserved
>>>      [0x8] Command data: (DWORD access)
>>> -          in case of error or unsupported command reads is 0xFFFFFFFF
>>> -          current 'Command field' value:
>>> -              0: returns PXM value corresponding to device
>>> +          contains 0 unless last stored in 'Command field' value is one of:
>>> +              0: contains 'CPU selector' value of a CPU with pending event[s]  
>>
>> (2) I think we can improve the word order:
>>
>>   last stored in 'Command field' value
>> ->  
>>   value last stored in 'Command field'
>>
>>>  
>>>  write access:
>>>      offset:
>>> @@ -81,9 +80,9 @@ write access:
>>>            value:
>>>              0: selects a CPU device with inserting/removing events and
>>>                 following reads from 'Command data' register return
>>> -               selected CPU (CPU selector value). If no CPU with events
>>> -               found, the current CPU selector doesn't change and
>>> -               corresponding insert/remove event flags are not set.
>>> +               selected CPU ('CPU selector' value).
>>> +               If no CPU with events found, the current 'CPU selector' doesn't
>>> +               change and corresponding insert/remove event flags are not set.  
>>
>> (3) AFAICT this is only a -- useful! -- re-wrapping.
> Not sure what you are trying to say here ...

I meant that you re-wrapped the last sentence, by breaking it off to a
separate line. And that I found it useful.

Thanks
laszlo


> 
>> But, since we are
>> modifying this section anyway, can we replace "flags are not set" with
>> "flags are left unchanged" or "flags are not modified"?
> sure
> 
> 
>> "set" is ambiguous with bit fields: it can mean "rewritten", and it can
>> mean "set to 1".
>>
>>>              1: following writes to 'Command data' register set OST event
>>>                 register in QEMU
>>>              2: following writes to 'Command data' register set OST status
>>>   
>>
>> Anyway, these are all superficial comments. Pick up whatever you agree
>> with. Either way:
>>
>> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
>>
>> Thanks!
>> Laszlo
> 


