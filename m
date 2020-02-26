Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B571706B0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 18:53:55 +0100 (CET)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j70sc-0003M6-R4
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 12:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j70rC-00021O-Re
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j70rA-0001bP-MP
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:52:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42106
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j70rA-0001Z6-Ck
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 12:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582739544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=tXyNXdKpnJvRWYen+zpmTe6e5KNa2jmF4WezBU+GdrM=;
 b=cHfc6LFhE/PhjXoKe+TbrFTNCMlua/juvL95KejdrKMgZ+r22Yg3tPCOyZTcosppP8K0GC
 DnyASx7rHvTTd66/Bnlt1eXbFXyZULwLNYhyTM7WmNP5LytnzEjTjnHwVgGiqVeOTKTdwe
 cMCj7RWnKJ+R6TDWxAWEVA9IaateSiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-imXBSSmzOueU2r0rePoghg-1; Wed, 26 Feb 2020 12:52:20 -0500
X-MC-Unique: imXBSSmzOueU2r0rePoghg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B359801E6C;
 Wed, 26 Feb 2020 17:52:19 +0000 (UTC)
Received: from [10.36.117.196] (ovpn-117-196.ams2.redhat.com [10.36.117.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDA935C54A;
 Wed, 26 Feb 2020 17:52:17 +0000 (UTC)
Subject: Re: [PATCH v5 01/18] s390x: Use constant for ESA PSW address
To: Cornelia Huck <cohuck@redhat.com>
References: <20200226122038.61481-1-frankja@linux.ibm.com>
 <20200226122038.61481-2-frankja@linux.ibm.com>
 <3d6f7f88-0a77-90f0-4e26-ee826593d55f@redhat.com>
 <20200226185118.316055d5.cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <871a69f2-071a-dd0b-1d3e-48fa2a67b92e@redhat.com>
Date: Wed, 26 Feb 2020 18:52:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226185118.316055d5.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.02.20 18:51, Cornelia Huck wrote:
> On Wed, 26 Feb 2020 15:27:52 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 26.02.20 13:20, Janosch Frank wrote:
>>> Lets make it a bit more clear that we're extracting the 31 bit address
> 
> s/Lets/Let's/ :)
> 
>>> from the short psw.
>>>
>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>> ---
>>>  hw/s390x/ipl.c     | 2 +-
>>>  target/s390x/cpu.c | 4 ++--
>>>  target/s390x/cpu.h | 1 +
>>>  3 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>>> index 7773499d7f..42e21e7a6a 100644
>>> --- a/hw/s390x/ipl.c
>>> +++ b/hw/s390x/ipl.c
>>> @@ -179,7 +179,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>>>                  /* if not Linux load the address of the (short) IPL PSW */
>>>                  ipl_psw = rom_ptr(4, 4);
>>>                  if (ipl_psw) {
>>> -                    pentry = be32_to_cpu(*ipl_psw) & 0x7fffffffUL;
>>> +                    pentry = be32_to_cpu(*ipl_psw) & PSW_MASK_ESA_ADDR;
>>>                  } else {
>>>                      error_setg(&err, "Could not get IPL PSW");
>>>                      goto error;
>>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>>> index 8da1905485..43360912a0 100644
>>> --- a/target/s390x/cpu.c
>>> +++ b/target/s390x/cpu.c
>>> @@ -78,13 +78,13 @@ static void s390_cpu_load_normal(CPUState *s)
>>>      S390CPU *cpu = S390_CPU(s);
>>>      uint64_t spsw = ldq_phys(s->as, 0);
>>>  
>>> -    cpu->env.psw.mask = spsw & 0xffffffff80000000ULL;
>>> +    cpu->env.psw.mask = spsw & PSW_MASK_ESA_MASK;
>>>      /*
>>>       * Invert short psw indication, so SIE will report a specification
>>>       * exception if it was not set.
>>>       */
>>>      cpu->env.psw.mask ^= PSW_MASK_SHORTPSW;
>>> -    cpu->env.psw.addr = spsw & 0x7fffffffULL;
>>> +    cpu->env.psw.addr = spsw & PSW_MASK_ESA_ADDR;
>>>  
>>>      s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
>>>  }
>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>> index 8a557fd8d1..74e66fe0c2 100644
>>> --- a/target/s390x/cpu.h
>>> +++ b/target/s390x/cpu.h
>>> @@ -277,6 +277,7 @@ extern const VMStateDescription vmstate_s390_cpu;
>>>  #define PSW_MASK_64             0x0000000100000000ULL
>>>  #define PSW_MASK_32             0x0000000080000000ULL
>>>  #define PSW_MASK_ESA_ADDR       0x000000007fffffffULL
>>> +#define PSW_MASK_ESA_MASK       0xffffffff80000000ULL  
>>
>> ..._MASK_..._MASK
>>
>> Isn't there a better name for all the bits in the PSW that are not an
>> address?
>>
>> PSW_MASK_ESA_BITS
>> PSW_MASK_ESA_FLAGS
>> ...
> 
> Hm, the PoP says that the PSW "includes the instruction address,
> condition code, and other control fields"; it also talks about the
> 'short' PSW as being distinct from the 'ESA' PSW (bit 31 may be 0 or 1
> in the short PSW). Maybe
> 
> PSW_MASK_SHORT_ADDR
> PSW_MASK_SHORT_CTRL

+1


-- 
Thanks,

David / dhildenb


