Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E71C3A8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 09:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQRa7-0001Cy-Mw
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 03:10:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hQRZ3-0000t3-J2
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hQRZ2-0005jC-7P
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:09:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1hQRZ1-0005hg-Sl
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:09:28 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4E771Ii035620
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 03:09:26 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sfrs88r2c-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 03:09:26 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
	Tue, 14 May 2019 08:09:24 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 14 May 2019 08:09:21 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4E79K4x59637850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 14 May 2019 07:09:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 484C65204F;
	Tue, 14 May 2019 07:09:20 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.133])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id ED5D052050;
	Tue, 14 May 2019 07:09:19 +0000 (GMT)
To: Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>
References: <1556749903-19221-1-git-send-email-walling@linux.ibm.com>
	<a87c71be-5bf8-a115-5843-720c9ad10c7b@redhat.com>
	<bc2fd9bb-7b94-eac7-590b-f01d2063ef9c@redhat.com>
	<e948a030-bd30-180e-bbd6-76f4a2390bb9@de.ibm.com>
	<ea6df6b1-4062-c057-92ea-5be40d778fe9@redhat.com>
	<09293a1c-d000-83a8-46b8-b97ad4fa9774@de.ibm.com>
	<56e3ace1-6e48-0e20-47d5-b07ac6dfcf31@redhat.com>
	<e140a076-28a0-0db6-4c59-80e0f2ab44bb@de.ibm.com>
	<c690c4a8-c277-e3c6-3697-3f0a1924559b@redhat.com>
	<20190513134637.3d8bb275.cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
	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
	syiRa+UVlsKmx1hsEg==
Date: Tue, 14 May 2019 09:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513134637.3d8bb275.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051407-0008-0000-0000-000002E668F9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051407-0009-0000-0000-000022530135
Message-Id: <898144e3-615e-5074-fb68-bf9995c64609@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-14_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905140052
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [PATCH v4] s390: diagnose 318 info reset and
 migration support
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
Cc: Collin Walling <walling@linux.ibm.com>, mst@redhat.com,
	qemu-devel@nongnu.org, pasic@linux.ibm.com,
	qemu-s390x@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 13.05.19 13:46, Cornelia Huck wrote:
> On Mon, 13 May 2019 13:34:35 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 13.05.19 12:55, Christian Borntraeger wrote:
>>>
>>>
>>> On 13.05.19 11:57, David Hildenbrand wrote:  
>>>> On 13.05.19 11:51, Christian Borntraeger wrote:  
>>>>>
>>>>>
>>>>> On 13.05.19 11:40, David Hildenbrand wrote:  
>>>>>> On 13.05.19 11:34, Christian Borntraeger wrote:  
>>>>>>>
>>>>>>>
>>>>>>> On 13.05.19 10:03, David Hildenbrand wrote:  
>>>>>>>>>> +    if ((SCCB_SIZE - sizeof(ReadInfo)) / sizeof(CPUEntry) < S390_MAX_CPUS)
>>>>>>>>>> +        mc->max_cpus = S390_MAX_CPUS - 8;  
>>>>>>>>>
>>>>>>>>> This is too complicated, just set it always to 240.
>>>>>>>>>
>>>>>>>>> However, I am still not sure how to best handle this scenario. One
>>>>>>>>> solution is
>>>>>>>>>
>>>>>>>>> 1. Set it statically to 240 for machine > 4.1
>>>>>>>>> 2. Keep the old machines unmodifed
>>>>>>>>> 3. Don't indicate the CPU feature for machines <= 4.0
>>>>>>>>>
>>>>>>>>> #3 is the problematic part, as it mixes host CPU features and machines.
>>>>>>>>> Bad. The host CPU model should always look the same on all machines. I
>>>>>>>>> don't like this.
>>>>>>>>>  
>>>>>>>>
>>>>>>>> FWIW, #3 is only an issue when modeling it via the CPU model, like
>>>>>>>> Christian suggested.
>>>>>>>>
>>>>>>>> I suggest the following
>>>>>>>>
>>>>>>>> 1. Set the max #cpus for 4.1 to 240 (already done)
>>>>>>>> 2. Keep it for the other machines unmodified (as suggested by Thomas)
>>>>>>>> 3. Create the layout of the SCCB depending on the machine type (to be done)
>>>>>>>>
>>>>>>>> If we want to model diag318 via a CPU feature (which makes sense for
>>>>>>>> migration):
>>>>>>>>
>>>>>>>> 4. Disable diag318 with a warning if used with a machine < 4.1
>>>>>>>>  
>>>>>>>
>>>>>>> I think there is a simpler solution. It is perfectly fine to fail the startup
>>>>>>> if we cannot fulfil the cpu model. So lets just allow 248 and allow this feature 
>>>>>>> also for older machines. And if somebody chooses both at the same time,
>>>>>>> lets fails the startup.  
>>>>>>
>>>>>> To which knob do you want to glue the layout of the SCLP response? Like
>>>>>> I described?  Do you mean instead of warning and masking the feature off
>>>>>> as I suggested, simply failing?  
>>>>>
>>>>> The sclp response will depend on the dia318 cpu model flag. If its on, the sclp
>>>>> response will have it, otherwise not.
>>>>> - host-passthrough: not migration safe anyway
>>>>> - host-model: if the target has diag318 good, otherwise we reject migration   
>>>>>>
>>>>>> In that case, -machine ..-4.0 -cpu host will not work on new HW with new
>>>>>> KVM. Just noting.  
>>>>>
>>>>> Only if you have 248 CPUs (which is unlikely). My point was to do that for all
>>>>> machine levels.
>>>>>  
>>>>
>>>> The issue with this approach is that e.g. libvirt is not aware of this
>>>> restriction. It could query "max_cpus" and expand the host-cpu model,
>>>> but starting a guest with > 240 cpus would fail. Maybe this is acceptable.  
>>>
>>> As of today we do the cpu model check in the same way. libvirt actually tries
>>> to run QEMU and handles failures.
>>>
>>> For a failure, the user still has still to use >240 CPUs in its XML. The only downside
>>> is that libvirt will not reject this right away.
>>>
>>> During startup we would then print an error message like
>>>
>>> "The diag318 cpu feature is only supported for 240 and less CPUs."
>>>
>>> This is of similar quality as
>>> "Selected CPU GA level is too new. Maximum supported model in the configuration: \'%s\'",
>>>   
>>
>> But that can be tested using the runability information if I am not wrong.
> 
> You mean the cpu level information, right?
> 
>>
>>> and others that we have today.
>>>
>>> So yes, I think this would be acceptable.  
>>
>> I guess it is acceptable yes. I doubt anybody uses that many CPUs in
>> production either way. But you never know.
> 
> I think that using that many cpus is a more uncommon setup, but I still
> think that having to wait for actual failure

That can happen all the time today. You can easily say z14 in the xml when 
on a zEC12. Only at startup you get the error. The question is really:
do you want to error on definition of the xml or on startup. And I think
startup is the better place here. This allows to create definitions that will
be useful in the future (pre-planning), e.g. if you know that you will update
your machine or the code soon.

> is worse than being able
> to find out beforehand. Any way to make this discoverable?


