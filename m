Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C666010523C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 13:24:02 +0100 (CET)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXlVB-0005Oo-T3
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 07:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iXlTh-0004Hb-Em
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:22:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iXlTg-0001zt-4r
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:22:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29940
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iXlTg-0001zS-0N
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 07:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574338947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z65bZhKVbfwcrdbnAZ9elTV9l/3g/bDNOkIcQi5ABng=;
 b=Xjgf63InHuDpR6p54lgk+HWAkDJ+VQGZhMfnHsK/taj66lyr0XIZDNdM004c06pSCwdFEJ
 ct4BNJ1g0jP1Ukp0q6p2S+eRHjua6+C1NO+d+BwwS52BAGS9lLH3jsufZtI26SjI3vloSX
 7SmqE/xk2oNPIT5+IV2+Fz1kL6+llUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-ai4jumIGMaOPViwEbKLsBg-1; Thu, 21 Nov 2019 07:22:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 398461007276;
 Thu, 21 Nov 2019 12:22:23 +0000 (UTC)
Received: from [10.36.116.214] (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 230395F93D;
 Thu, 21 Nov 2019 12:22:17 +0000 (UTC)
Subject: Re: [PATCH 11/15] RFC: s390x: Exit on vcpu reset error
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-12-frankja@linux.ibm.com>
 <09359386-a91b-d98c-08f5-5b375f0bd942@redhat.com>
 <f67cdf5e-837b-5596-89ee-136eee04943b@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <6f3dfa9a-bcb9-31f4-af79-9d6e109807dc@redhat.com>
Date: Thu, 21 Nov 2019 13:22:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f67cdf5e-837b-5596-89ee-136eee04943b@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ai4jumIGMaOPViwEbKLsBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.11.19 13:19, Janosch Frank wrote:
> On 11/21/19 1:14 PM, David Hildenbrand wrote:
>> On 20.11.19 12:43, Janosch Frank wrote:
>>> If a vcpu is not properly reset it might be better to just end the VM.
>>>
>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>> ---
>>>    target/s390x/kvm.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>>> index 190400df55..0210b54157 100644
>>> --- a/target/s390x/kvm.c
>>> +++ b/target/s390x/kvm.c
>>> @@ -418,11 +418,13 @@ static void kvm_s390_reset_vcpu(S390CPU *cpu, uns=
igned long type)
>>>            if (kvm_vcpu_ioctl(cs, KVM_S390_VCPU_RESET, type)) {
>>>                error_report("CPU reset type %ld failed on CPU %i",
>>>                             type, cs->cpu_index);
>>> +            exit(1);
>>>            }
>>>            return;
>>>        }
>>>        if (kvm_vcpu_ioctl(cs, KVM_S390_INITIAL_RESET, NULL)) {
>>>            error_report("Initial CPU reset failed on CPU %i", cs->cpu_i=
ndex);
>>> +        exit(1);
>>>        }
>>>    }
>>>   =20
>>>
>>
>> According to the comment in include/qapi/error.h
>>
>> "Please don't error_setg(&error_fatal, ...), use error_report() and
>> exit(), because that's more obvious."
>>
>> This is the right thing to do.
>>
>> ... and it's a fairly pathological thing to happen either way.
>>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>
>=20
> Do we want to have that separate or should I squash it into the reset
> changes?
>=20
>=20

I' keep it separated.

--=20

Thanks,

David / dhildenb


