Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43E89809
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 09:44:15 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx501-0003OJ-TJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 03:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hx4zQ-0002wC-Ew
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hx4zP-00076M-5M
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 03:43:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hx4zO-000760-T7; Mon, 12 Aug 2019 03:43:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0780A8E594;
 Mon, 12 Aug 2019 07:43:33 +0000 (UTC)
Received: from [10.36.117.110] (ovpn-117-110.ams2.redhat.com [10.36.117.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB2775D9C9;
 Mon, 12 Aug 2019 07:43:30 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190805152947.28536-1-david@redhat.com>
 <20190805152947.28536-4-david@redhat.com>
 <247d75d4-b717-7690-c448-60884a3e9545@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <00ceab0c-bf2c-c59c-d0bb-d8f4246edcad@redhat.com>
Date: Mon, 12 Aug 2019 09:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <247d75d4-b717-7690-c448-60884a3e9545@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 12 Aug 2019 07:43:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v1 3/9] s390x/mmu: DAT translation
 rewrite
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
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.08.19 09:20, Thomas Huth wrote:
> On 8/5/19 5:29 PM, David Hildenbrand wrote:
>> Let's rewrite the DAT translation in a non-recursive way, similar to
>> arch/s390/kvm/gaccess.c:guest_translate() in KVM. This makes the
>> code much easier to read, compare and maintain.
>>
>> Use better names for the region/section/page table entries and for the
>> macros to extract relevant parts from virtual address. Introduce defines
>> for all defined bits, this will come in handy soon.
>>
>> All access exceptions now directly go via trigger_access_exception(),
>> at a central point. DAT protection checks are performed at a central
>> place.
>>
>> Also, we now catch and indicate invalid addresses of page tables. All
>> table entries are accessed via read_table_entry().
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  target/s390x/cpu.h        |  77 +++++---
>>  target/s390x/mem_helper.c |  13 +-
>>  target/s390x/mmu_helper.c | 360 +++++++++++++++++---------------------
>>  3 files changed, 229 insertions(+), 221 deletions(-)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index c34992bb2e..1ff14250bd 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -554,26 +554,63 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>>  #define ASCE_TYPE_SEGMENT     0x00        /* segment table type               */
>>  #define ASCE_TABLE_LENGTH     0x03        /* region table length              */
>>  
>> -#define REGION_ENTRY_ORIGIN   (~0xfffULL) /* region/segment table origin    */
>> -#define REGION_ENTRY_RO       0x200       /* region/segment protection bit  */
>> -#define REGION_ENTRY_TF       0xc0        /* region/segment table offset    */
>> -#define REGION_ENTRY_INV      0x20        /* invalid region table entry     */
>> -#define REGION_ENTRY_TYPE_MASK 0x0c       /* region/segment table type mask */
>> -#define REGION_ENTRY_TYPE_R1  0x0c        /* region first table type        */
>> -#define REGION_ENTRY_TYPE_R2  0x08        /* region second table type       */
>> -#define REGION_ENTRY_TYPE_R3  0x04        /* region third table type        */
>> -#define REGION_ENTRY_LENGTH   0x03        /* region third length            */
>> -
>> -#define SEGMENT_ENTRY_ORIGIN  (~0x7ffULL) /* segment table origin        */
>> -#define SEGMENT_ENTRY_FC      0x400       /* format control              */
>> -#define SEGMENT_ENTRY_RO      0x200       /* page protection bit         */
>> -#define SEGMENT_ENTRY_INV     0x20        /* invalid segment table entry */
>> -
>> -#define VADDR_PX              0xff000     /* page index bits   */
>> -
>> -#define PAGE_RO               0x200       /* HW read-only bit  */
>> -#define PAGE_INVALID          0x400       /* HW invalid bit    */
>> -#define PAGE_RES0             0x800       /* bit must be zero  */
>> +#define REGION_ENTRY_ORIGIN         0xfffffffffffff000ULL
>> +#define REGION_ENTRY_P              0x0000000000000200ULL
>> +#define REGION_ENTRY_TF             0x00000000000000c0ULL
>> +#define REGION_ENTRY_I              0x0000000000000020ULL
>> +#define REGION_ENTRY_TT             0x000000000000000cULL
>> +#define REGION_ENTRY_TL             0x0000000000000003ULL
>> +
>> +#define REGION_ENTRY_TT_REGION1     0x000000000000000cULL
>> +#define REGION_ENTRY_TT_REGION2     0x0000000000000008ULL
>> +#define REGION_ENTRY_TT_REGION3     0x0000000000000004ULL
>> +
>> +#define REGION3_ENTRY_RFAA          0xffffffff80000000ULL
>> +#define REGION3_ENTRY_AV            0x0000000000010000ULL
>> +#define REGION3_ENTRY_ACC           0x000000000000f000ULL
>> +#define REGION3_ENTRY_F             0x0000000000000800ULL
>> +#define REGION3_ENTRY_FC            0x0000000000000400ULL
>> +#define REGION3_ENTRY_IEP           0x0000000000000100ULL
>> +#define REGION3_ENTRY_CR            0x0000000000000010ULL
>> +
>> +#define SEGMENT_ENTRY_ORIGIN        0xfffffffffffff800ULL
>> +#define SEGMENT_ENTRY_SFAA          0xfffffffffff80000ULL
>> +#define SEGMENT_ENTRY_AV            0x0000000000010000ULL
>> +#define SEGMENT_ENTRY_ACC           0x000000000000f000ULL
>> +#define SEGMENT_ENTRY_F             0x0000000000000800ULL
>> +#define SEGMENT_ENTRY_FC            0x0000000000000400ULL
>> +#define SEGMENT_ENTRY_P             0x0000000000000200ULL
>> +#define SEGMENT_ENTRY_IEP           0x0000000000000100ULL
>> +#define SEGMENT_ENTRY_I             0x0000000000000020ULL
>> +#define SEGMENT_ENTRY_CS            0x0000000000000010ULL
>> +#define SEGMENT_ENTRY_TT            0x000000000000000cULL
>> +
>> +#define SEGMENT_ENTRY_TT_REGION1    0x000000000000000cULL
>> +#define SEGMENT_ENTRY_TT_REGION2    0x0000000000000008ULL
>> +#define SEGMENT_ENTRY_TT_REGION3    0x0000000000000004ULL
>> +#define SEGMENT_ENTRY_TT_SEGMENT    0x0000000000000000ULL
>> +
>> +#define PAGE_ENTRY_0                0x0000000000000800ULL
>> +#define PAGE_ENTRY_I                0x0000000000000400ULL
>> +#define PAGE_ENTRY_P                0x0000000000000200ULL
>> +#define PAGE_ENTRY_IEP              0x0000000000000100ULL
>> +
>> +#define VADDR_REGION1_TX_MASK       0xffe0000000000000ULL
>> +#define VADDR_REGION2_TX_MASK       0x001ffc0000000000ULL
>> +#define VADDR_REGION3_TX_MASK       0x000003ff80000000ULL
>> +#define VADDR_SEGMENT_TX_MASK       0x000000007ff00000ULL
>> +#define VADDR_PAGE_TX_MASK          0x00000000000ff000ULL
>> +
>> +#define VADDR_REGION1_TX(vaddr)     (((vaddr) & VADDR_REGION1_TX_MASK) >> 53)
>> +#define VADDR_REGION2_TX(vaddr)     (((vaddr) & VADDR_REGION2_TX_MASK) >> 42)
>> +#define VADDR_REGION3_TX(vaddr)     (((vaddr) & VADDR_REGION3_TX_MASK) >> 31)
>> +#define VADDR_SEGMENT_TX(vaddr)     (((vaddr) & VADDR_SEGMENT_TX_MASK) >> 20)
>> +#define VADDR_PAGE_TX(vaddr)        (((vaddr) & VADDR_PAGE_TX_MASK) >> 12)
>> +
>> +#define VADDR_REGION1_TL(vaddr)     (((vaddr) & 0xc000000000000000ULL) >> 62)
>> +#define VADDR_REGION2_TL(vaddr)     (((vaddr) & 0x0018000000000000ULL) >> 51)
>> +#define VADDR_REGION3_TL(vaddr)     (((vaddr) & 0x0000030000000000ULL) >> 40)
>> +#define VADDR_SEGMENT_TL(vaddr)     (((vaddr) & 0x0000000060000000ULL) >> 29)
> 
> Ugh, this patch is quite big, and you're doing multiple things at once
> here, e.g. renaming macros from PAGE_INVALID to PAGE_ENTRY_I ... could

I could split out renaming the macros, however, besides a lot of work on
my side this won't really make a huge difference here.

> you maybe split this up in multiple patches instead? Also, is this
> complete rewrite really necessary, just to match your personal taste? I

I'm not gonna use lipstick on a pig ;) No honestly, the recursion is
just nasty and we can now easily compare the current code with
arch/s390/kvm/gaccess.c:guest_translate()

> think it would be easier to review if you'd just fix the current code
> instead if necessary...

No, won't do that.

Still thanks for having a look.


-- 

Thanks,

David / dhildenb

