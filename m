Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5A17A54D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:32:08 +0100 (CET)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9pfb-0005Mt-8f
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j9pdp-0004l6-ME
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:30:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j9pdn-0007RJ-MP
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:30:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47483
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j9pdn-0007QV-HV
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583411414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=67yBQLe8Ficw7KTryGRlyGqOZSrP2L9U1Ac3/8TynFQ=;
 b=RP2XfI7KWe/X6qxcaV55jMhIuhkr62JSe2e9W+t9eN7AkFteolfWnjLef6hexUWsGcbj0i
 +vWfoGiWkU4J0/dKjyR4vJLkJqWGL8EfiArGk81iEmN2XDRTkXPDRDpUpFDa3oh//X+Rp/
 /PSZI1gmSyP6SgvNPUSgNHrXniU4itU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-6OJPtMxxMBqVXPlpGiWmNA-1; Thu, 05 Mar 2020 07:30:13 -0500
X-MC-Unique: 6OJPtMxxMBqVXPlpGiWmNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 068938010EE;
 Thu,  5 Mar 2020 12:30:12 +0000 (UTC)
Received: from [10.10.120.166] (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0E6E60C87;
 Thu,  5 Mar 2020 12:30:08 +0000 (UTC)
Subject: Re: [PATCH v6 02/18] s390x: protvirt: Add diag308 subcodes 8 - 10
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20200304114231.23493-1-frankja@linux.ibm.com>
 <20200304114231.23493-3-frankja@linux.ibm.com>
 <45db12aa-eccf-5a57-fee3-c963b279937c@redhat.com>
 <740407ab-8ab4-4136-7ee5-42c52407f5b9@linux.ibm.com>
 <a2f4e67f-8dea-5fb6-c8bb-c81d2b14b41d@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <e486577a-eb4d-cf76-cb6e-f9e074413b80@redhat.com>
Date: Thu, 5 Mar 2020 13:30:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a2f4e67f-8dea-5fb6-c8bb-c81d2b14b41d@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.03.20 13:24, Janosch Frank wrote:
> On 3/5/20 1:04 PM, Janosch Frank wrote:
>> On 3/4/20 6:04 PM, David Hildenbrand wrote:
>>> On 04.03.20 12:42, Janosch Frank wrote:
>>>> For diag308 subcodes 8 - 10 we have a new ipib of type 5. The ipib
>>>> holds the address and length of the secure execution header, as well
>>>> as a list of guest components.
>>>>
>>>> Each component is a block of memory, for example kernel or initrd,
>>>> which needs to be decrypted by the Ultravisor in order to run a
>>>> protected VM. The secure execution header instructs the Ultravisor on
>>>> how to handle the protected VM and its components.
>>>>
>>>> Subcodes 8 and 9 are similiar to 5 and 6 and subcode 10 will finally
>>>> start the protected guest.
>>>>
>>>> Subcodes 8-10 are not valid in protected mode, we have to do a subcode
>>>> 3 and then the 8 and 10 combination for a protected reboot.
>>>>
>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>> ---
>>>>  hw/s390x/ipl.c      | 47 ++++++++++++++++++++++++++++++++++++++++++---
>>>>  hw/s390x/ipl.h      | 32 ++++++++++++++++++++++++++++++
>>>>  target/s390x/diag.c | 26 ++++++++++++++++++++++---
>>>>  3 files changed, 99 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>>>> index 9c1ecd423c..80c6ab233a 100644
>>>> --- a/hw/s390x/ipl.c
>>>> +++ b/hw/s390x/ipl.c
>>>> @@ -538,15 +538,55 @@ static bool is_virtio_scsi_device(IplParameterBlock *iplb)
>>>>      return is_virtio_ccw_device_of_type(iplb, VIRTIO_ID_SCSI);
>>>>  }
>>>>  
>>>> +int s390_ipl_pv_check_components(IplParameterBlock *iplb)
>>>
>>> What about making this
>>>
>>> bool s390_ipl_pv_valid(IplParameterBlock *iplb)
>>>
>>> and return true/false?
>>
>> We already have iplb_valid_pv() and ipl->iplb_valid_pv.
>> Do you have any other more expressive name we could use?
> 
> I think it makes more sense to rip out these tiny functions and
> consolidate them like this:
> 
> +static inline bool iplb_valid(IplParameterBlock *iplb)
>  {
> -    return be32_to_cpu(iplb->len) >= S390_IPLB_MIN_FCP_LEN &&
> -           iplb->pbt == S390_IPL_TYPE_FCP;
> +    switch (iplb->pbt) {
> +        case S390_IPL_TYPE_FCP:
> +            return (be32_to_cpu(iplb->len) >= S390_IPLB_MIN_FCP_LEN &&
> +                    iplb->pbt == S390_IPL_TYPE_FCP);
> +        case S390_IPL_TYPE_CCW:
> +            return (be32_to_cpu(iplb->len) >= S390_IPLB_MIN_CCW_LEN &&
> +                    iplb->pbt == S390_IPL_TYPE_CCW);
> +        case S390_IPL_TYPE_PV:
> +            if(be32_to_cpu(iplb->len) < S390_IPLB_MIN_PV_LEN ||
> +               iplb->pbt != S390_IPL_TYPE_PV) {
> +                return false;
> +            }
> +            return s390_ipl_pv_check_components(iplb);

yeah, and maybe even inline s390_ipl_pv_check_components().

-- 
Thanks,

David / dhildenb


