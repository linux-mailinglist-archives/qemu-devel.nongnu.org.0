Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DEC43CF1A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:55:54 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmDR-0002oo-8I
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflgV-0001Hc-U6
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:21:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:17655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflgS-00041c-No
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:21:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 70B357463B7;
 Wed, 27 Oct 2021 18:21:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4911E746399; Wed, 27 Oct 2021 18:21:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 475C57462D3;
 Wed, 27 Oct 2021 18:21:47 +0200 (CEST)
Date: Wed, 27 Oct 2021 18:21:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 08/11] hw/intc/sh_intc: Use existing macro instead of
 local one
In-Reply-To: <b2078399-d80a-96ac-5dee-007ea1b70a68@amsat.org>
Message-ID: <508511d1-a38c-d3ec-b4d0-b92f8d503ef@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <d1a2e6c3e1e9bc7eb69b9ae2cc1c708db6b9b3e3.1635342377.git.balaton@eik.bme.hu>
 <b2078399-d80a-96ac-5dee-007ea1b70a68@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-449913622-1635351707=:34647"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-449913622-1635351707=:34647
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/27/21 15:46, BALATON Zoltan wrote:
>> The INTC_A7 local macro does the same as the A7ADDR from
>> include/sh/sh.h so use the latter and drop the local macro definiion.
>
> Typo "definition".
>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/intc/sh_intc.c | 12 +++++-------
>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
>> index c1058d97c0..0bd27aaf4f 100644
>> --- a/hw/intc/sh_intc.c
>> +++ b/hw/intc/sh_intc.c
>> @@ -16,8 +16,6 @@
>>  #include "hw/sh4/sh.h"
>>  #include "trace.h"
>>
>> -#define INTC_A7(x) ((x) & 0x1fffffff)
>> -
>>  void sh_intc_toggle_source(struct intc_source *source,
>>                             int enable_adj, int assert_adj)
>>  {
>> @@ -112,12 +110,12 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
>>  static unsigned int sh_intc_mode(unsigned long address,
>>                                   unsigned long set_reg, unsigned long clr_reg)
>>  {
>> -    if ((address != INTC_A7(set_reg)) &&
>> -        (address != INTC_A7(clr_reg)))
>> +    if ((address != A7ADDR(set_reg)) &&
>> +        (address != A7ADDR(clr_reg)))
>>          return INTC_MODE_NONE;
>>
>>      if (set_reg && clr_reg) {
>> -        if (address == INTC_A7(set_reg)) {
>> +        if (address == A7ADDR(set_reg)) {
>>              return INTC_MODE_DUAL_SET;
>>          } else {
>>              return INTC_MODE_DUAL_CLR;
>> @@ -297,11 +295,11 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
>>
>>  #define SH_INTC_IOMEM_FORMAT "interrupt-controller-%s-%s-%s"
>>      snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "p4");
>> -    memory_region_init_alias(iomem_p4, NULL, name, iomem, INTC_A7(address), 4);
>> +    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
>>      memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
>>
>>      snprintf(name, sizeof(name), SH_INTC_IOMEM_FORMAT, type, action, "a7");
>> -    memory_region_init_alias(iomem_a7, NULL, name, iomem, INTC_A7(address), 4);
>> +    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
>
> I wonder why the address is masked out... It looks there is a mismatch
> in the memory region mapping. Anyway this predates this cleanup, so:

This seems to be a peculiarity of the SH architecture. Like MIPS, it has 
some strange memory mapping conventions where same registers appear in 
different areas at predefined addresses. These macros just calculate that 
address.

Regards,
BALATON Zoltan

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
>
--3866299591-449913622-1635351707=:34647--

