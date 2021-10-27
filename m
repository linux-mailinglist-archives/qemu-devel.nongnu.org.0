Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B209143CF04
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:50:15 +0200 (CEST)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfm7y-0001Ow-Ph
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflcz-0003rh-If
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:18:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:55771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mflcw-0002Or-CV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:18:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E9D777463B7;
 Wed, 27 Oct 2021 18:18:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BF0A0746353; Wed, 27 Oct 2021 18:18:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BDE247462D3;
 Wed, 27 Oct 2021 18:18:08 +0200 (CEST)
Date: Wed, 27 Oct 2021 18:18:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 09/11] hw/intc/sh_intc: Turn some defines into an enum
In-Reply-To: <73e32080-3ac8-b982-71e5-56a52af6cc14@amsat.org>
Message-ID: <27fdcc7b-bd97-f82-7bfd-8f4af8705b67@eik.bme.hu>
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <21f98d137754b1c58de3cec2c3e4a7df7cc936ce.1635342377.git.balaton@eik.bme.hu>
 <73e32080-3ac8-b982-71e5-56a52af6cc14@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-123519471-1635351488=:34647"
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

--3866299591-123519471-1635351488=:34647
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/27/21 15:46, BALATON Zoltan wrote:
>> Turn the INTC_MODE defines into an enum (except the one which is a
>> flag) and clean up the function returning these to make it clearer by
>> removing nested ifs and superfluous parenthesis.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/intc/sh_intc.c | 43 +++++++++++++++++++------------------------
>>  1 file changed, 19 insertions(+), 24 deletions(-)
>>
>> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
>> index 0bd27aaf4f..18461ff554 100644
>> --- a/hw/intc/sh_intc.c
>> +++ b/hw/intc/sh_intc.c
>> @@ -100,33 +100,27 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
>>      abort();
>>  }
>>
>> -#define INTC_MODE_NONE       0
>> -#define INTC_MODE_DUAL_SET   1
>> -#define INTC_MODE_DUAL_CLR   2
>> -#define INTC_MODE_ENABLE_REG 3
>> -#define INTC_MODE_MASK_REG   4
>> -#define INTC_MODE_IS_PRIO    8
>> -
>> -static unsigned int sh_intc_mode(unsigned long address,
>> -                                 unsigned long set_reg, unsigned long clr_reg)
>> +#define INTC_MODE_IS_PRIO 0x80
>
> Why change 8 -> 0x80 without updating the definition usage?

To better separate it from the enum values as these are OR-ed together 
later so just leave some spare bits inbetween. Should this be a separate 
one line patch or mention it in the commit message?

>> +typedef enum {
>> +    INTC_MODE_NONE,
>> +    INTC_MODE_DUAL_SET,
>> +    INTC_MODE_DUAL_CLR,
>> +    INTC_MODE_ENABLE_REG,
>> +    INTC_MODE_MASK_REG,
>
> If this is defined by the spec, better explicit the enum value,
> otherwise if someone add a misplaced field this would change the
> definitions.

I don't know. It didn't occur to me it could be part of the arch, looked 
more like an implementation detail but have to check the docs if anything 
similar is mentioned.

Regards,
BALATON Zoltan

>> +} SHIntCMode;
>> +
>> +
>> +static SHIntCMode sh_intc_mode(unsigned long address, unsigned long set_reg,
>> +                               unsigned long clr_reg)
>>  {
>> -    if ((address != A7ADDR(set_reg)) &&
>> -        (address != A7ADDR(clr_reg)))
>> +    if (address != A7ADDR(set_reg) && address != A7ADDR(clr_reg)) {
>>          return INTC_MODE_NONE;
>> -
>> -    if (set_reg && clr_reg) {
>> -        if (address == A7ADDR(set_reg)) {
>> -            return INTC_MODE_DUAL_SET;
>> -        } else {
>> -            return INTC_MODE_DUAL_CLR;
>> -        }
>>      }
>> -
>> -    if (set_reg) {
>> -        return INTC_MODE_ENABLE_REG;
>> -    } else {
>> -        return INTC_MODE_MASK_REG;
>> +    if (set_reg && clr_reg) {
>> +        return address == A7ADDR(set_reg) ?
>> +               INTC_MODE_DUAL_SET : INTC_MODE_DUAL_CLR;
>>      }
>> +    return set_reg ? INTC_MODE_ENABLE_REG : INTC_MODE_MASK_REG;
>>  }
>>
>>  static void sh_intc_locate(struct intc_desc *desc,
>> @@ -137,7 +131,8 @@ static void sh_intc_locate(struct intc_desc *desc,
>>                             unsigned int *width,
>>                             unsigned int *modep)
>>  {
>> -    unsigned int i, mode;
>> +    SHIntCMode mode;
>> +    unsigned int i;
>>
>>      /* this is slow but works for now */
>>
>>
>
>
--3866299591-123519471-1635351488=:34647--

