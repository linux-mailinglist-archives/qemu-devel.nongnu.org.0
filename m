Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC44BD0E4
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:23:00 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLrnO-0006RG-UT
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLrmK-0005dP-4t
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:21:52 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:23700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLrmH-0005eT-3a
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:21:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C1B4E745720;
 Sun, 20 Feb 2022 20:21:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8FD06745706; Sun, 20 Feb 2022 20:21:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8E098745712;
 Sun, 20 Feb 2022 20:21:44 +0100 (CET)
Date: Sun, 20 Feb 2022 20:21:44 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 01/11] mos6522: add defines for IFR bit flags
In-Reply-To: <f17e976b-07c3-f5ef-92ea-02adf7a80f44@ilande.co.uk>
Message-ID: <e9117a4b-a4f8-bc43-b850-ac86db5ab24@eik.bme.hu>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-2-mark.cave-ayland@ilande.co.uk>
 <9e5c4e86-8555-1a42-783f-dae53f114cd2@eik.bme.hu>
 <79a162bf-86f5-0ca4-5f14-822469606812@ilande.co.uk>
 <84db72ea-9aca-43f9-2876-28a5d6d840f4@amsat.org>
 <e6b2e9c-6082-cb63-a8ae-d96ab96e8c2e@eik.bme.hu>
 <f17e976b-07c3-f5ef-92ea-02adf7a80f44@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-47054109-1645384904=:86069"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-47054109-1645384904=:86069
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 20 Feb 2022, Mark Cave-Ayland wrote:
> On 05/02/2022 12:06, BALATON Zoltan wrote:
>> On Sat, 5 Feb 2022, Philippe Mathieu-Daudé wrote:
>>> On 5/2/22 11:51, Mark Cave-Ayland wrote:
>>>> On 27/01/2022 23:16, BALATON Zoltan wrote:
>>>> 
>>>>> On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
>>>>>> These are intended to make it easier to see how the physical control 
>>>>>> lines
>>>>>> are wired for each instance.
>>>>>> 
>>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>>> ---
>>>>>> include/hw/misc/mos6522.h | 22 +++++++++++++++-------
>>>>>> 1 file changed, 15 insertions(+), 7 deletions(-)
>>>>>> 
>>>>>> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
>>>>>> index fc95d22b0f..12abd8b8d2 100644
>>>>>> --- a/include/hw/misc/mos6522.h
>>>>>> +++ b/include/hw/misc/mos6522.h
>>>>>> @@ -41,13 +41,21 @@
>>>>>> #define IER_SET            0x80    /* set bits in IER */
>>>>>> #define IER_CLR            0       /* clear bits in IER */
>>>>>> 
>>>>>> -#define CA2_INT            0x01
>>>>>> -#define CA1_INT            0x02
>>>>>> -#define SR_INT             0x04    /* Shift register full/empty */
>>>>>> -#define CB2_INT            0x08
>>>>>> -#define CB1_INT            0x10
>>>>>> -#define T2_INT             0x20    /* Timer 2 interrupt */
>>>>>> -#define T1_INT             0x40    /* Timer 1 interrupt */
>>>>>> +#define CA2_INT_BIT        0
>>>>>> +#define CA1_INT_BIT        1
>>>>>> +#define SR_INT_BIT         2       /* Shift register full/empty */
>>>>>> +#define CB2_INT_BIT        3
>>>>>> +#define CB1_INT_BIT        4
>>>>>> +#define T2_INT_BIT         5       /* Timer 2 interrupt */
>>>>>> +#define T1_INT_BIT         6       /* Timer 1 interrupt */
>>>>>> +
>>>>>> +#define CA2_INT            (1 << CA2_INT_BIT)
>>>>>> +#define CA1_INT            (1 << CA1_INT_BIT)
>>>>>> +#define SR_INT             (1 << SR_INT_BIT)
>>>>>> +#define CB2_INT            (1 << CB2_INT_BIT)
>>>>>> +#define CB1_INT            (1 << CB1_INT_BIT)
>>>>>> +#define T2_INT             (1 << T2_INT_BIT)
>>>>>> +#define T1_INT             (1 << T1_INT_BIT)
>>>>> 
>>>>> Maybe you could leave the #defines called XX_INT and then use 
>>>>> BIT(XX_INT) instead of the second set of #defines which would provide 
>>>>> same readability but with less #defines needed.
>>>> 
>>>> I'm not so keen on removing the _INT defines since that would require 
>>>> updating all users to use BIT() everywhere which I don't think gains us 
>>>> much. I could certainly replace these definitions with BIT(FOO) instead 
>>>> of (1 << FOO) if that helps readability though.
>>> 
>>> Do you mean simply doing this?
>>> 
>>> -#define T1_INT             0x40    /* Timer 1 interrupt */
>>> +#define T1_INT             BIT(6)  /* Timer 1 interrupt */
>> 
>> I meant:
>> 
>> #define T1_INT 6
>> 
>> and then replace current usage of T1_INT with BIT(T1_INT) that way we don't 
>> need both T1_INT_BIT and T1_INT defines which seems redundant as 
>> BIT(T1_INT) is not much longer and still clear what it refers to. It's true 
>> that this needs more changes but the result is more readable IMO than 
>> introducing another set of defines that ome has to look up when encounters 
>> them as the meaning might not be clear. That's why I think one set of 
>> defines for bit numbers and using existing BIT(num) for values is better 
>> but it's just an idea, I don't care that much.
>
> I think the best solution here is to just use BIT() for the final shifted 
> values like this:
>
> #define CA2_INT_BIT        0
> ...
> ...
> #define CA2_INT            BIT(CA2_INT_BIT)

That does not really help much as the idea was to avoid having two set of 
defines and only have one set for the bit numbers then use the BIT() macro 
instead of the current values. Using the BIT() macro in the second set of 
defines does not help reduce the number of defines in code which the 
reader will have to look up in this header. IMO having defines only for 
bit numbers and always using BIT(whatever) for values is less confusing 
assuming one is familiar with what the BIT() macro does.

> Otherwise I can see there being confusion given that the BIT() macro is used 
> for defines without a _BIT suffix which are also being used elsewhere.

Maybe it's only confusing to you as you've named the bit numbers *_BIT and 
the values without BIT and my proposal was to name the bit numbers as the 
simple names and use BIT(name) for the value which looks kind of opposite 
naming but it's the simplest. I guess you could also have bit numbers 
named *_BIT and then use BIT(CA2_INT_BIT) instead of the second set of 
defines for the values but that looks a bit redundant and maybe more 
confusing than just using BIT(CA2_INT).

> I'll update this in v2 accordingly.

I don't have a strong opinion on this so if you prefer the way it is now 
or using the BIT() macro only for the separate defines then do that. I 
don't mind either way.

Regards,
BALATON Zoltan
--3866299591-47054109-1645384904=:86069--

