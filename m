Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698AD14886
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 12:48:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNbAX-0004n3-Lt
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 06:48:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hNb9A-0004Je-FH
	for qemu-devel@nongnu.org; Mon, 06 May 2019 06:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hNb98-0005jn-C0
	for qemu-devel@nongnu.org; Mon, 06 May 2019 06:47:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45722
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1hNb98-0005jf-1v
	for qemu-devel@nongnu.org; Mon, 06 May 2019 06:46:58 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x46AhdqV143363
	for <qemu-devel@nongnu.org>; Mon, 6 May 2019 06:46:57 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sak4p0s00-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 06:46:57 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
	Mon, 6 May 2019 11:46:55 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Mon, 6 May 2019 11:46:52 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x46AkoeD48693356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 6 May 2019 10:46:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CA6352054;
	Mon,  6 May 2019 10:46:50 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.177])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2579952052;
	Mon,  6 May 2019 10:46:50 +0000 (GMT)
To: Cornelia Huck <cohuck@redhat.com>
References: <1556543381-12671-1-git-send-email-jjherne@linux.ibm.com>
	<daad75f0-c8bb-1c9f-5b43-afa828601c42@redhat.com>
	<df6bde4f-9c83-5009-3ca8-32d7a5e088d3@redhat.com>
	<55907be5-61a5-f251-4609-b0336818de17@redhat.com>
	<98a268ee-17fb-079e-01d1-5dc554a24efd@de.ibm.com>
	<20190506123414.5b33b6f8.cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
	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
	syiRa+UVlsKmx1hsEg==
Date: Mon, 6 May 2019 12:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506123414.5b33b6f8.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050610-4275-0000-0000-00000331DB9B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050610-4276-0000-0000-00003841423B
Message-Id: <9493076a-6bbe-21eb-4df3-2b54dc6376b9@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905060094
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [qemu-s390x] [PATCH] s390-bios: Skip bootmap
 signature entries
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
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>, alifm@linux.ibm.com,
	qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 06.05.19 12:34, Cornelia Huck wrote:
> On Mon, 6 May 2019 12:18:42 +0200
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> On 06.05.19 12:16, Thomas Huth wrote:
>>> On 06/05/2019 12.10, David Hildenbrand wrote:  
>>>> On 06.05.19 12:01, David Hildenbrand wrote:  
>>>>> On 29.04.19 15:09, Jason J. Herne wrote:  
>>>>>> Newer versions of zipl have the ability to write signature entries to the boot
>>>>>> script for secure boot. We don't yet support secure boot, but we need to skip
>>>>>> over signature entries while reading the boot script in order to maintain our
>>>>>> ability to boot guest operating systems that have a secure bootloader.
>>>>>>
>>>>>> Signed-off-by: Jason J. Herne <jjherne@linux.ibm.com>
>>>>>> Reviewed-by: Farhan Ali <alifm@linux.ibm.com>
>>>>>> ---
>>>>>>  pc-bios/s390-ccw/bootmap.c | 19 +++++++++++++++++--
>>>>>>  pc-bios/s390-ccw/bootmap.h | 10 ++++++----
>>>>>>  2 files changed, 23 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
>>>>>> index 7aef65a..d13b7cb 100644
>>>>>> --- a/pc-bios/s390-ccw/bootmap.c
>>>>>> +++ b/pc-bios/s390-ccw/bootmap.c
>>>>>> @@ -254,7 +254,14 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
>>>>>>      memset(sec, FREE_SPACE_FILLER, sizeof(sec));
>>>>>>      read_block(block_nr, sec, "Cannot read Boot Map Script");
>>>>>>  
>>>>>> -    for (i = 0; bms->entry[i].type == BOOT_SCRIPT_LOAD; i++) {
>>>>>> +    for (i = 0; bms->entry[i].type == BOOT_SCRIPT_LOAD ||
>>>>>> +                bms->entry[i].type == BOOT_SCRIPT_SIGNATURE; i++) {
>>>>>> +
>>>>>> +        /* We don't support secure boot yet, so we skip signature entries */
>>>>>> +        if (bms->entry[i].type == BOOT_SCRIPT_SIGNATURE) {
>>>>>> +            continue;
>>>>>> +        }
>>>>>> +
>>>>>>          address = bms->entry[i].address.load_address;
>>>>>>          block_nr = eckd_block_num(&bms->entry[i].blkptr.xeckd.bptr.chs);
>>>>>>  
>>>>>> @@ -489,7 +496,15 @@ static void zipl_run(ScsiBlockPtr *pte)
>>>>>>  
>>>>>>      /* Load image(s) into RAM */
>>>>>>      entry = (ComponentEntry *)(&header[1]);
>>>>>> -    while (entry->component_type == ZIPL_COMP_ENTRY_LOAD) {
>>>>>> +    while (entry->component_type == ZIPL_COMP_ENTRY_LOAD ||
>>>>>> +           entry->component_type == ZIPL_COMP_ENTRY_SIGNATURE) {
>>>>>> +
>>>>>> +        /* We don't support secure boot yet, so we skip signature entries */
>>>>>> +        if (entry->component_type == ZIPL_COMP_ENTRY_SIGNATURE) {
>>>>>> +            entry++;
>>>>>> +            continue;
>>>>>> +        }
>>>>>> +
>>>>>>          zipl_load_segment(entry);
>>>>>>  
>>>>>>          entry++;
>>>>>> diff --git a/pc-bios/s390-ccw/bootmap.h b/pc-bios/s390-ccw/bootmap.h
>>>>>> index a085212..94f53a5 100644
>>>>>> --- a/pc-bios/s390-ccw/bootmap.h
>>>>>> +++ b/pc-bios/s390-ccw/bootmap.h
>>>>>> @@ -98,8 +98,9 @@ typedef struct ScsiMbr {
>>>>>>  #define ZIPL_COMP_HEADER_IPL    0x00
>>>>>>  #define ZIPL_COMP_HEADER_DUMP   0x01
>>>>>>  
>>>>>> -#define ZIPL_COMP_ENTRY_LOAD    0x02
>>>>>> -#define ZIPL_COMP_ENTRY_EXEC    0x01
>>>>>> +#define ZIPL_COMP_ENTRY_EXEC      0x01
>>>>>> +#define ZIPL_COMP_ENTRY_LOAD      0x02
>>>>>> +#define ZIPL_COMP_ENTRY_SIGNATURE 0x03
>>>>>>  
>>>>>>  typedef struct XEckdMbr {
>>>>>>      uint8_t magic[4];   /* == "xIPL"        */
>>>>>> @@ -117,8 +118,9 @@ typedef struct BootMapScriptEntry {
>>>>>>      BootMapPointer blkptr;
>>>>>>      uint8_t pad[7];
>>>>>>      uint8_t type;   /* == BOOT_SCRIPT_* */
>>>>>> -#define BOOT_SCRIPT_EXEC 0x01
>>>>>> -#define BOOT_SCRIPT_LOAD 0x02
>>>>>> +#define BOOT_SCRIPT_EXEC      0x01
>>>>>> +#define BOOT_SCRIPT_LOAD      0x02
>>>>>> +#define BOOT_SCRIPT_SIGNATURE 0x03
>>>>>>      union {
>>>>>>          uint64_t load_address;
>>>>>>          uint64_t load_psw;
>>>>>>  
>>>>>
>>>>> Naive question from me:
>>>>>
>>>>> Can't we place the signatures somewhere else, and instead associate them
>>>>> with entries? This avoids breaking backwards compatibility for the sake
>>>>> of signatures we want unmodified zipl loaders to ignore.
>>>>>  
>>>>
>>>>
>>>> ... but I guess this is already documented somewhere internally and
>>>> other components have been adjusted. IOW, cannot be changed anymore.
>>>>
>>>> Guess our implementation should have tolerated other entries than
>>>> "BOOT_SCRIPT_LOAD" right from the beginning.  
>>>
>>> Hmm, now we only tolerate the _LOAD and _SIGNATURE entries, but still
>>> nothing else... would it make sense to rewrite the code a little bit to
>>> tolerate all other kind of entries, but just act on the well-known _LOAD
>>> entries, so that we do not step into this trap in the future anymore?  
>>
>> I think we should not. Those entries might have sematic elements that the guest
>> wants to enforce. I do not think that this will come, but imagine a boot entry
>> that mandates some security wishes (e.g. do only run on non-shared cores).
> 
> Can we split the namespace for BOOT_SCRIPT into 'ignore if you don't
> know what that is' and 'fail if you don't know what that is'? I'm
> completely confused how 'optional' those entries are supposed to be...

Since we do not know if and what future entries will come the current default
of failing seems the best approach. We can then add things to pc-bios when
necessary.


