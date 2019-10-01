Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9512C2F5A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 10:56:38 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFDxV-0004NL-Dx
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 04:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iFDwB-0003rl-Hk
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 04:55:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iFDwA-0002pO-Ac
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 04:55:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iFDw9-0002nw-W5; Tue, 01 Oct 2019 04:55:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1922C4E919;
 Tue,  1 Oct 2019 08:55:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C095F5D9C9;
 Tue,  1 Oct 2019 08:55:05 +0000 (UTC)
Subject: Re: [PATCH v1 1/5] s390x/mmu: Add EDAT2 translation support
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190926101627.23376-1-david@redhat.com>
 <20190926101627.23376-2-david@redhat.com>
 <4921a826-d1dd-7e98-3749-33d32f01b251@redhat.com>
 <26665f90-e821-c103-0178-7c1ca51de647@redhat.com>
 <fc003b6e-a38c-ced7-0c84-a64ebc26e91b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <4fa882e3-04d5-5c73-2266-31b822f1ae3c@redhat.com>
Date: Tue, 1 Oct 2019 10:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fc003b6e-a38c-ced7-0c84-a64ebc26e91b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 01 Oct 2019 08:55:13 +0000 (UTC)
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

On 01/10/2019 10.51, David Hildenbrand wrote:
> On 01.10.19 10:41, Thomas Huth wrote:
>> On 26/09/2019 12.18, David Hildenbrand wrote:
>>> On 26.09.19 12:16, David Hildenbrand wrote:
>>>> This only adds basic support to the DAT translation, but no EDAT2 support
>>>> for TCG. E.g., the gdbstub under kvm uses this function, too, to
>>>> translate virtual addresses.
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>  target/s390x/mmu_helper.c | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
>>>> index 6b34c4c7b4..54f54137ec 100644
>>>> --- a/target/s390x/mmu_helper.c
>>>> +++ b/target/s390x/mmu_helper.c
>>>> @@ -120,6 +120,7 @@ static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
>>>>  {
>>>>      const bool edat1 = (env->cregs[0] & CR0_EDAT) &&
>>>>                         s390_has_feat(S390_FEAT_EDAT);
>>>> +    const bool edat2 = edat1 && s390_has_feat(S390_FEAT_EDAT_2);
>>>>      const int asce_tl = asce & ASCE_TABLE_LENGTH;
>>>>      const int asce_p = asce & ASCE_PRIVATE_SPACE;
>>>>      hwaddr gaddr = asce & ASCE_ORIGIN;
>>>> @@ -219,9 +220,17 @@ static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
>>>>          if ((entry & REGION_ENTRY_TT) != REGION_ENTRY_TT_REGION3) {
>>>>              return PGM_TRANS_SPEC;
>>>>          }
>>>> +        if (edat2 && (entry & REGION3_ENTRY_CR) && asce_p) {
>>>> +            return PGM_TRANS_SPEC;
>>>> +        }
>>>>          if (edat1 && (entry & REGION_ENTRY_P)) {
>>>>              *flags &= ~PAGE_WRITE;
>>>>          }
>>>> +        if (edat2 && (entry & REGION3_ENTRY_FC)) {
>>>> +            *raddr = (entry & REGION3_ENTRY_RFAA) |
>>>> +                     (vaddr & REGION3_ENTRY_RFAA);
>>>
>>> Messed up
>>>
>>> (vaddr & ~REGION3_ENTRY_RFAA)
>>>
>>> it is.
>>
>> With that fix:
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
> 
> BTW, this change explains the different order of checks you mentioned. I now have here:
> 
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index dc33c63b1d..dcbffb682f 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -120,6 +120,7 @@ static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
>  {
>      const bool edat1 = (env->cregs[0] & CR0_EDAT) &&
>                         s390_has_feat(S390_FEAT_EDAT);
> +    const bool edat2 = edat1 && s390_has_feat(S390_FEAT_EDAT_2);
>      const int asce_tl = asce & ASCE_TABLE_LENGTH;
>      const int asce_p = asce & ASCE_PRIVATE_SPACE;
>      hwaddr gaddr = asce & ASCE_ORIGIN;
> @@ -217,6 +218,17 @@ static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
>          if ((entry & REGION_ENTRY_TT) != REGION_ENTRY_TT_REGION3) {
>              return PGM_TRANS_SPEC;
>          }
> +        if (edat2 && (entry & REGION3_ENTRY_CR) && asce_p) {
> +            return PGM_TRANS_SPEC;
> +        }
> +        if (edat2 && (entry & REGION3_ENTRY_FC)) {
> +            if (entry & REGION_ENTRY_P) {
> +                *flags &= ~PAGE_WRITE;
> +            }
> +            *raddr = (entry & REGION3_ENTRY_RFAA) |
> +                     (vaddr & ~REGION3_ENTRY_RFAA);
> +            return 0;
> +        }
>          if (VADDR_SEGMENT_TL(vaddr) < (entry & REGION_ENTRY_TF) >> 6 ||
>              VADDR_SEGMENT_TL(vaddr) > (entry & REGION_ENTRY_TL)) {
>              return PGM_SEGMENT_TRANS;

Ah, ok, and the *flags have to be set first, of course. So better keep
it the original way round in your other patch.

 Thomas

