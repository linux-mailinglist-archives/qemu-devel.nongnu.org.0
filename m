Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3AA621A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 09:00:23 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i52ne-0003Id-Jd
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 03:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <borntraeger@de.ibm.com>) id 1i52lD-0001sl-Mx
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 02:57:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <borntraeger@de.ibm.com>) id 1i52lB-00077L-Tr
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 02:57:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
 id 1i52lB-00074l-KB
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 02:57:49 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x836rGiq055714
 for <qemu-devel@nongnu.org>; Tue, 3 Sep 2019 02:57:46 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usgmfmjvk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 02:57:45 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
 Tue, 3 Sep 2019 07:57:43 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 07:57:39 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x836vcHP38535264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 06:57:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98E69A4040;
 Tue,  3 Sep 2019 06:57:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 501C9A404D;
 Tue,  3 Sep 2019 06:57:38 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.122])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 06:57:38 +0000 (GMT)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190806094834.7691-2-imammedo@redhat.com>
 <20190807153241.24050-1-imammedo@redhat.com>
 <20190820180727.32cf4891.cohuck@redhat.com>
 <20190827145629.62c5839e@redhat.com>
 <0abe612b-5a00-4ebc-9874-6b794d411f51@de.ibm.com>
 <20190829140402.3a547a76@redhat.com>
 <6afa8d99-c958-6f60-69f4-f84151358479@de.ibm.com>
 <20190829143125.17a44fa5@redhat.com>
 <ff7b7534-e954-84f2-34a9-bfa0ac37c8fe@de.ibm.com>
 <20190830114105.312cf69f@redhat.com>
 <4f816851-9435-51e0-81e9-0dc2ac47ff78@de.ibm.com>
 <20190902154929.16f32591@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 syiRa+UVlsKmx1hsEg==
Date: Tue, 3 Sep 2019 08:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902154929.16f32591@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19090306-0016-0000-0000-000002A5F9EE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090306-0017-0000-0000-000033065F29
Message-Id: <09480baa-c736-6726-4852-777f99fd54c6@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030076
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH for-4.2 v5 1/2] kvm: s390:
 split too big memory section on several memslots
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
Cc: thuth@redhat.com, david@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02.09.19 15:49, Igor Mammedov wrote:
> On Fri, 30 Aug 2019 18:19:29 +0200
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> On 30.08.19 11:41, Igor Mammedov wrote:
>>> On Thu, 29 Aug 2019 14:41:13 +0200
>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>   
>>>> On 29.08.19 14:31, Igor Mammedov wrote:  
>>>>> On Thu, 29 Aug 2019 14:07:44 +0200
>>>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>>>     
>>>>>> On 29.08.19 14:04, Igor Mammedov wrote:    
>>>>>>> On Thu, 29 Aug 2019 08:47:49 +0200
>>>>>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>>>>>       
>>>>>>>> On 27.08.19 14:56, Igor Mammedov wrote:      
>>>>>>>>> On Tue, 20 Aug 2019 18:07:27 +0200
>>>>>>>>> Cornelia Huck <cohuck@redhat.com> wrote:
>>>>>>>>>         
>>>>>>>>>> On Wed,  7 Aug 2019 11:32:41 -0400
>>>>>>>>>> Igor Mammedov <imammedo@redhat.com> wrote:
>>>>>>>>>>        
>>>>>>>>>>> Max memslot size supported by kvm on s390 is 8Tb,
>>>>>>>>>>> move logic of splitting RAM in chunks upto 8T to KVM code.
>>>>>>>>>>>
>>>>>>>>>>> This way it will hide KVM specific restrictions in KVM code
>>>>>>>>>>> and won't affect baord level design decisions. Which would allow
>>>>>>>>>>> us to avoid misusing memory_region_allocate_system_memory() API
>>>>>>>>>>> and eventually use a single hostmem backend for guest RAM.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>>>>>>>>>> ---
>>>>>>>>>>> v5:
>>>>>>>>>>>   * move computation 'size -= slot_size' inside of loop body
>>>>>>>>>>>           (David Hildenbrand <david@redhat.com>)
>>>>>>>>>>> v4:
>>>>>>>>>>>   * fix compilation issue
>>>>>>>>>>>           (Christian Borntraeger <borntraeger@de.ibm.com>)
>>>>>>>>>>>   * advance HVA along with GPA in kvm_set_phys_mem()
>>>>>>>>>>>           (Christian Borntraeger <borntraeger@de.ibm.com>)
>>>>>>>>>>>
>>>>>>>>>>> patch prepares only KVM side for switching to single RAM memory region
>>>>>>>>>>> another patch will take care of  dropping manual RAM partitioning in
>>>>>>>>>>> s390 code.          
>>>>>>>>>>
>>>>>>>>>> I may have lost track a bit -- what is the status of this patch (and
>>>>>>>>>> the series)?        
>>>>>>>>>
>>>>>>>>> Christian,
>>>>>>>>>
>>>>>>>>> could you test it on a host that have sufficient amount of RAM?        
>>>>>>>>
>>>>>>>>
>>>>>>>> This version looks good. I was able to start a 9TB guest.
>>>>>>>> [pid 215723] ioctl(10, KVM_SET_USER_MEMORY_REGION, {slot=0, flags=0, guest_phys_addr=0, memory_size=8796091973632, userspace_addr=0x3ffee700000}) = 0
>>>>>>>> [pid 215723] ioctl(10, KVM_SET_USER_MEMORY_REGION, {slot=1, flags=0, guest_phys_addr=0x7fffff00000, memory_size=1099512676352, userspace_addr=0xbffee600000}) = 0    
>>>>>>    
>>>>>>>> The only question is if we want to fix the weird alignment (0x7fffff00000) when
>>>>>>>> we already add a migration barrier for uber-large guests.
>>>>>>>> Maybe we could split at 4TB to avoid future problem with larger page sizes?      
>>>>>>> That probably should be a separate patch on top.      
>>>>>>
>>>>>> Right. The split in KVM code is transparent to migration and other parts of QEMU, correct?    
>>>>>
>>>>> it should not affect other QEMU parts and migration (to my limited understanding of it),
>>>>> we are passing to KVM memory slots upto KVM_SLOT_MAX_BYTES as we were doing before by
>>>>> creating several memory regions instead of one as described in [2/2] commit message.
>>>>>
>>>>> Also could you also test migration of +9Tb guest, to check that nothing where broken by
>>>>> accident in QEMU migration code?    
>>>>
>>>> I only have one server that is large enough :-/  
>>> Could you test offline migration on it (to a file and restore from it)?  
>>
>> I tested migration with a hacked QEMU (basically split in KVM code at 1GB instead of 8TB) and
>> the restore from file failed with data corruption in the guest. The current code
>> does work when I use small memslots. No idea yet what is wrong.
> 
> I've tested 2Gb (max, I can test) guest (also hacked up version)
> and it worked for me.
> How do you test it and detect corruption so I could try to reproduce it locally?
> (given it worked before, there is no much hope but I could try)

I basically started a guest with just kernel and ramdisk on the command line and
then in the monitor I did 
migrate "exec: cat > savefile"
and then I restarted the guest with
-incoming "exec: cat savefile"

the guest then very quickly crashed with random kernel oopses. 

Using libvirts managedsave should work as well. 


