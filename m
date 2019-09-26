Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED35BECE7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 09:55:37 +0200 (CEST)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDOch-0002Gi-TO
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 03:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iDOaI-0000NK-Ev
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:53:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iDOaA-0007uO-Is
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:53:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59860)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iDOaA-0007sS-7O; Thu, 26 Sep 2019 03:52:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 827E37FDCA;
 Thu, 26 Sep 2019 07:52:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-127.ams2.redhat.com [10.36.116.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 155E66012D;
 Thu, 26 Sep 2019 07:52:51 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] s390x/mmu: DAT table definition overhaul
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190925125236.4043-1-david@redhat.com>
 <20190925125236.4043-7-david@redhat.com>
 <5b625047-0c9c-b074-ccef-a0d8d96ef0f0@redhat.com>
 <dee25e68-43f2-f6b5-ce2f-f76112b33f5d@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <a23494c5-be2e-448d-e96c-864c7841ec29@redhat.com>
Date: Thu, 26 Sep 2019 09:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dee25e68-43f2-f6b5-ce2f-f76112b33f5d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 26 Sep 2019 07:52:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/09/2019 09.38, David Hildenbrand wrote:
> On 26.09.19 09:35, Thomas Huth wrote:
>> On 25/09/2019 14.52, David Hildenbrand wrote:
>>> Let's use consitent names for the region/section/page table entries and
>>> for the macros to extract relevant parts from virtual address. Make them
>>> match the definitions in the PoP - e.g., how the televant bits are actually
>>
>> s/televant/relevant/
>>
>>> called.
>>>
>>> Introduce defines for all bits declared in the PoP. This will come in
>>> handy in follow-up patches.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>  target/s390x/cpu.h        | 77 +++++++++++++++++++++++++++++----------
>>>  target/s390x/mem_helper.c | 12 +++---
>>>  target/s390x/mmu_helper.c | 37 ++++++++++---------
>>>  3 files changed, 83 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>> index 163dae13d7..e74a809257 100644
>>> --- a/target/s390x/cpu.h
>>> +++ b/target/s390x/cpu.h
>>> @@ -558,26 +558,63 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>>>  #define ASCE_TYPE_SEGMENT     0x00        /* segment table type               */
>>>  #define ASCE_TABLE_LENGTH     0x03        /* region table length              */
>>>  
>>> -#define REGION_ENTRY_ORIGIN   (~0xfffULL) /* region/segment table origin    */
>>> -#define REGION_ENTRY_RO       0x200       /* region/segment protection bit  */
>>> -#define REGION_ENTRY_TF       0xc0        /* region/segment table offset    */
>>> -#define REGION_ENTRY_INV      0x20        /* invalid region table entry     */
>>> -#define REGION_ENTRY_TYPE_MASK 0x0c       /* region/segment table type mask */
>>> -#define REGION_ENTRY_TYPE_R1  0x0c        /* region first table type        */
>>> -#define REGION_ENTRY_TYPE_R2  0x08        /* region second table type       */
>>> -#define REGION_ENTRY_TYPE_R3  0x04        /* region third table type        */
>>> -#define REGION_ENTRY_LENGTH   0x03        /* region third length            */
>>> -
>>> -#define SEGMENT_ENTRY_ORIGIN  (~0x7ffULL) /* segment table origin        */
>>> -#define SEGMENT_ENTRY_FC      0x400       /* format control              */
>>> -#define SEGMENT_ENTRY_RO      0x200       /* page protection bit         */
>>> -#define SEGMENT_ENTRY_INV     0x20        /* invalid segment table entry */
>>> -
>>> -#define VADDR_PX              0xff000     /* page index bits   */
>>> -
>>> -#define PAGE_RO               0x200       /* HW read-only bit  */
>>> -#define PAGE_INVALID          0x400       /* HW invalid bit    */
>>> -#define PAGE_RES0             0x800       /* bit must be zero  */
>>> +#define REGION_ENTRY_ORIGIN         0xfffffffffffff000ULL
>>> +#define REGION_ENTRY_P              0x0000000000000200ULL
>>> +#define REGION_ENTRY_TF             0x00000000000000c0ULL
>>> +#define REGION_ENTRY_I              0x0000000000000020ULL
>>> +#define REGION_ENTRY_TT             0x000000000000000cULL
>>> +#define REGION_ENTRY_TL             0x0000000000000003ULL
>>
>> Any chance that you could keep the comments after the definitions? I
>> think they are useful for people who are not 100% familiar with the DAT
>> on s390x.
> 
> I thought about that, but do we expect people that don't have a clue
> about s390x DAT and don't compare the code against the PoP to understand
> our DAT translation just by comments on defines?

I'm not sure that everybody is aware of the PoP ... maybe you could just
put a comment in front of the block a la:

/*
 * For details on the following definitions, see the "Dynamic Address
 * Translation" section in chapter 3 of the "z/Architecture Principles
 * of Operations - SA22-7832-11"
 */

?

 Thomas

