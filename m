Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A966AEB3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 20:34:47 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnSHl-0000xb-Lg
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 14:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33175)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <walling@linux.ibm.com>) id 1hnSHY-0000XX-Cv
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 14:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <walling@linux.ibm.com>) id 1hnSHX-000201-9h
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 14:34:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12938
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <walling@linux.ibm.com>)
 id 1hnSHX-0001yB-4H; Tue, 16 Jul 2019 14:34:31 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GIWIca034865; Tue, 16 Jul 2019 14:34:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tsj79cv5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 14:34:27 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6GIWLmO035114;
 Tue, 16 Jul 2019 14:34:26 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tsj79cv59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 14:34:26 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6GITtBi030014;
 Tue, 16 Jul 2019 18:34:26 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2trtmr1g74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2019 18:34:25 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GIYOMu60227858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 18:34:24 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28EA0136053;
 Tue, 16 Jul 2019 18:34:24 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9017136055;
 Tue, 16 Jul 2019 18:34:22 +0000 (GMT)
Received: from [9.60.89.78] (unknown [9.60.89.78])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 18:34:22 +0000 (GMT)
To: Cornelia Huck <cohuck@redhat.com>
References: <20190708125433.16927-1-cohuck@redhat.com>
 <20190708125433.16927-2-cohuck@redhat.com>
 <58b28817-58e5-1cba-6f71-a35093be5cb6@de.ibm.com>
 <0dd71cfe-a9e9-7ac3-523e-065f05479a57@linux.ibm.com>
 <20190710102041.6be31940.cohuck@redhat.com>
 <20190716172002.77863317.cohuck@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
Message-ID: <f72fb90b-8383-a2f8-b768-b09be5845fb5@linux.ibm.com>
Date: Tue, 16 Jul 2019 14:34:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190716172002.77863317.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160227
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH for-4.1 1/2] s390x/pci: add
 some fallthrough annotations
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
Cc: David Hildenbrand <david@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/19 11:20 AM, Cornelia Huck wrote:
> On Wed, 10 Jul 2019 10:20:41 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
>> On Tue, 9 Jul 2019 18:55:34 -0400
>> Collin Walling <walling@linux.ibm.com> wrote:
>>
>>> On 7/8/19 9:23 AM, Christian Borntraeger wrote:
>>>>
>>>>
>>>> On 08.07.19 14:54, Cornelia Huck wrote:
>>>>> According to the comment, the bits are supposed to accumulate.
>>>>>
>>>>> Reported-by: Stefan Weil <sw@weilnetz.de>
>>>>> Fixes: 5d1abf234462 ("s390x/pci: enforce zPCI state checking")
>>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>>>
>>>> This patch does not change behaviour, so it is certainly not wrong.
>>>>
>>>> So lets have a look at if the bug report was actually a real bug or
>>>> just a missing annotation.
>>>>      
>>>>> ---
>>>>>    hw/s390x/s390-pci-inst.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>>>>> index 61f30b8e55d2..00235148bed7 100644
>>>>> --- a/hw/s390x/s390-pci-inst.c
>>>>> +++ b/hw/s390x/s390-pci-inst.c
>>>>> @@ -1209,8 +1209,10 @@ int stpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
>>>>>         * FH Enabled bit is set to one in states of ENABLED, BLOCKED or ERROR. */
>>>>>        case ZPCI_FS_ERROR:
>>>>>            fib.fc |= 0x20;
>>>>> +        /* fallthrough */
>>>>
>>>> This is correct, in case of an error we are also blocked.
>>>>      
>>>
>>> Agreed. This is definitely correct based on our architecture.
>>>    
>>>>>        case ZPCI_FS_BLOCKED:
>>>>>            fib.fc |= 0x40;
>>>>> +        /* fallthrough */
>>>>
>>>> I think this is also correct, but  it would be good if Collin could verify.
>>>>      
>>>
>>> I failed to find anything to support setting the function control
>>> enabled bit when the function state is in error / blocked. I'm
>>> assuming this might be some QEMU hack to get things working? I'll have
>>> to dive further to understand why this was done this way, as it doesn't
>>> align with how the s390x architecture is documented. It's confusing.
>>
>> Might this also be a real issue? Not matching the architecture is not a
>> good sign...
> 
> Friendly ping. If we still want to have this patch or a fix in 4.1, we
> need to find out soon...
> 

Let's take it for now.

Acked-by: Collin Walling <walling@linux.ibm.com>


