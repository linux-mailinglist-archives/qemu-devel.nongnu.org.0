Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6722C158
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 10:30:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVXVS-0002na-MY
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 04:30:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hVXU1-0001w9-13
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hVXTz-0001ce-Do
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:29:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hVXTy-0001YE-Rk; Tue, 28 May 2019 04:29:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8A3185539;
	Tue, 28 May 2019 08:29:13 +0000 (UTC)
Received: from [10.36.118.92] (unknown [10.36.118.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB8B55D6A9;
	Tue, 28 May 2019 08:29:09 +0000 (UTC)
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <51df31ee-54a1-d7be-bef4-71ae003b8811@redhat.com>
	<3fab9e76-53ad-2de7-45df-eb69c8604709@redhat.com>
	<016edc53-278e-cc58-0061-d2c5de80afd2@de.ibm.com>
	<1ddf0d83-ce0c-f1c9-065d-ff88ddb9293b@redhat.com>
	<60d1bf3d-659c-d199-6592-d3659702d754@redhat.com>
	<d38b05af-effc-97a1-0b4a-a0d44a13f769@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <573cd34d-fc70-b26f-92f1-4eafd7126e87@redhat.com>
Date: Tue, 28 May 2019 10:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d38b05af-effc-97a1-0b4a-a0d44a13f769@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 28 May 2019 08:29:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] hw/s390x/ipl: Dubious use of qdev_reset_all_fn
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Halil Pasic <pasic@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.19 21:45, Christian Borntraeger wrote:
>=20
>=20
> On 24.05.19 21:00, David Hildenbrand wrote:
>> On 24.05.19 20:36, David Hildenbrand wrote:
>>> On 24.05.19 20:28, Christian Borntraeger wrote:
>>>>
>>>>
>>>> On 24.05.19 20:04, David Hildenbrand wrote:
>>>>> On 24.05.19 19:54, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> Hi Christian,
>>>>>>
>>>>>> I'm having hard time to understand why the S390_IPL object calls
>>>>>> qemu_register_reset(qdev_reset_all_fn) in its realize() method, wh=
ile
>>>>>> being QOM'ified (it has a reset method).
>>>>>>
>>>>>> It doesn't seem to have a qdev children added explicitly to it.
>>>>>> I see it is used as a singleton, what else am I missing?
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Phil.
>>>>>>
>>>>>
>>>>> Looks like I added it back then (~4 years ago) when converting it i=
nto a
>>>>> TYPE_DEVICE.
>>>>>
>>>>> I could imagine that - back then - this was needed because only
>>>>> TYPE_SYS_BUS_DEVICE would recursively get reset.
>>>>
>>>> Yes, back then singleton devices were not recursively resetted. Has =
that changed?
>>>
>>> Hacking that call out, I don't see it getting called anymore. So it i=
s
>>> still required. The question is if it can be reworked.
>>>
>>
>> Yes, as it is not a sysbus device, it won't get reset.
>> The owner (machine) has to take care of this. The following works:
>>
>>
>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>> index b93750c14e..91a31c2cd0 100644
>> --- a/hw/s390x/ipl.c
>> +++ b/hw/s390x/ipl.c
>> @@ -232,7 +232,6 @@ static void s390_ipl_realize(DeviceState *dev, Err=
or **errp)
>>       */
>>      ipl->compat_start_addr =3D ipl->start_addr;
>>      ipl->compat_bios_start_addr =3D ipl->bios_start_addr;
>> -    qemu_register_reset(qdev_reset_all_fn, dev);
>>  error:
>>      error_propagate(errp, err);
>>  }
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index bbc6e8fa0b..658ab529a1 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -338,6 +338,11 @@ static inline void s390_do_cpu_ipl(CPUState *cs, =
run_on_cpu_data arg)
>>      s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
>>  }
>> =20
>> +static void s390_ipl_reset(void)
>> +{
>> +    qdev_reset_all(DEVICE(object_resolve_path_type("", TYPE_S390_IPL,=
 NULL)));
>> +}
>> +
>>  static void s390_machine_reset(void)
>>  {
>>      enum s390_reset reset_type;
>> @@ -353,6 +358,7 @@ static void s390_machine_reset(void)
>>      case S390_RESET_EXTERNAL:
>>      case S390_RESET_REIPL:
>>          qemu_devices_reset();
>> +        s390_ipl_reset();
>>          s390_crypto_reset();
>> =20
>>          /* configure and start the ipl CPU only */
>>
>=20
> While this patch is certainly ok, I find it disturbing that qdev device=
s are being resetted,
> but qom devices not.
>=20

Shall I send that as a proper patch, or do we want to stick to the
existing approach until we have improved the general reset approach?

--=20

Thanks,

David / dhildenb

