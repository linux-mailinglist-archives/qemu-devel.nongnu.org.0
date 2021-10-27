Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B93743D000
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:47:12 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfn15-0002o9-BN
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfmoB-0001Op-9T
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:33:52 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfmo7-0006Yd-5D
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 13:33:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4996F756036;
 Wed, 27 Oct 2021 19:33:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 21633748F58; Wed, 27 Oct 2021 19:33:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1F5A2746399;
 Wed, 27 Oct 2021 19:33:44 +0200 (CEST)
Date: Wed, 27 Oct 2021 19:33:44 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 08/11] hw/intc/sh_intc: Use existing macro instead of
 local one
In-Reply-To: <508511d1-a38c-d3ec-b4d0-b92f8d503ef@eik.bme.hu>
Message-ID: <cf8f092-15e2-40df-de11-42e07a28b32d@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <d1a2e6c3e1e9bc7eb69b9ae2cc1c708db6b9b3e3.1635342377.git.balaton@eik.bme.hu>
 <b2078399-d80a-96ac-5dee-007ea1b70a68@amsat.org>
 <508511d1-a38c-d3ec-b4d0-b92f8d503ef@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1464161963-1635356024=:34647"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1464161963-1635356024=:34647
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, BALATON Zoltan wrote:
> On Wed, 27 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/27/21 15:46, BALATON Zoltan wrote:
>>> The INTC_A7 local macro does the same as the A7ADDR from
>>> include/sh/sh.h so use the latter and drop the local macro definiion.
>> 
>> Typo "definition".
>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/intc/sh_intc.c | 12 +++++-------
>>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>> 
>>> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
>>> index c1058d97c0..0bd27aaf4f 100644
>>> --- a/hw/intc/sh_intc.c
>>> +++ b/hw/intc/sh_intc.c
>>> @@ -16,8 +16,6 @@
>>>  #include "hw/sh4/sh.h"
>>>  #include "trace.h"
>>> 
>>> -#define INTC_A7(x) ((x) & 0x1fffffff)
>>> -
>>>  void sh_intc_toggle_source(struct intc_source *source,
>>>                             int enable_adj, int assert_adj)
>>>  {
>>> @@ -112,12 +110,12 @@ int sh_intc_get_pending_vector(struct intc_desc 
>>> *desc, int imask)
>>>  static unsigned int sh_intc_mode(unsigned long address,
>>>                                   unsigned long set_reg, unsigned long 
>>> clr_reg)
>>>  {
>>> -    if ((address != INTC_A7(set_reg)) &&
>>> -        (address != INTC_A7(clr_reg)))
>>> +    if ((address != A7ADDR(set_reg)) &&
>>> +        (address != A7ADDR(clr_reg)))
>>>          return INTC_MODE_NONE;
>>>
>>>      if (set_reg && clr_reg) {
>>> -        if (address == INTC_A7(set_reg)) {
>>> +        if (address == A7ADDR(set_reg)) {
>>>              return INTC_MODE_DUAL_SET;
>>>          } else {
>>>              return INTC_MODE_DUAL_CLR;
>>> @@ -297,11 +295,11 @@ static unsigned int sh_intc_register(MemoryRegion 
>>> *sysmem,
>>>
>>>  #define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
>>>      snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, 
>>> "p4");
>>> -    memory_region_init_alias(iomem_p4, NULL, name, iomem, 
>>> INTC_A7(address), 4);
>>> +    memory_region_init_alias(iomem_p4, NULL, name, iomem, 
>>> A7ADDR(address), 4);
>>>      memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
>>>
>>>      snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, 
>>> "a7");
>>> -    memory_region_init_alias(iomem_a7, NULL, name, iomem, 
>>> INTC_A7(address), 4);
>>> +    memory_region_init_alias(iomem_a7, NULL, name, iomem, 
>>> A7ADDR(address), 4);
>> 
>> I wonder why the address is masked out... It looks there is a mismatch
>> in the memory region mapping. Anyway this predates this cleanup, so:
>
> This seems to be a peculiarity of the SH architecture. Like MIPS, it has some 
> strange memory mapping conventions where same registers appear in different 
> areas at predefined addresses. These macros just calculate that address.

Hmm, on second look it creates alias at A7ADDR into the original region so 
maybe reducing the size from 4GB could break that. I'll have to check 
again what this is doing.

Regards,
BALATON Zoltan
--3866299591-1464161963-1635356024=:34647--

