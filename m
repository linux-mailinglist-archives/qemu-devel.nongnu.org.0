Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08784BCE0E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 11:56:09 +0100 (CET)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLjsu-0007Y0-EJ
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 05:56:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLjql-00068r-Sg
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 05:53:56 -0500
Received: from [2001:41c9:1:41f::167] (port=39718
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLjqj-0003L0-Pi
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 05:53:55 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nLjpv-00089r-Hf; Sun, 20 Feb 2022 10:53:07 +0000
Message-ID: <f17e976b-07c3-f5ef-92ea-02adf7a80f44@ilande.co.uk>
Date: Sun, 20 Feb 2022 10:53:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-2-mark.cave-ayland@ilande.co.uk>
 <9e5c4e86-8555-1a42-783f-dae53f114cd2@eik.bme.hu>
 <79a162bf-86f5-0ca4-5f14-822469606812@ilande.co.uk>
 <84db72ea-9aca-43f9-2876-28a5d6d840f4@amsat.org>
 <e6b2e9c-6082-cb63-a8ae-d96ab96e8c2e@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <e6b2e9c-6082-cb63-a8ae-d96ab96e8c2e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/11] mos6522: add defines for IFR bit flags
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/2022 12:06, BALATON Zoltan wrote:

> On Sat, 5 Feb 2022, Philippe Mathieu-Daudé wrote:
>> On 5/2/22 11:51, Mark Cave-Ayland wrote:
>>> On 27/01/2022 23:16, BALATON Zoltan wrote:
>>>
>>>> On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
>>>>> These are intended to make it easier to see how the physical control lines
>>>>> are wired for each instance.
>>>>>
>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>> ---
>>>>> include/hw/misc/mos6522.h | 22 +++++++++++++++-------
>>>>> 1 file changed, 15 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
>>>>> index fc95d22b0f..12abd8b8d2 100644
>>>>> --- a/include/hw/misc/mos6522.h
>>>>> +++ b/include/hw/misc/mos6522.h
>>>>> @@ -41,13 +41,21 @@
>>>>> #define IER_SET            0x80    /* set bits in IER */
>>>>> #define IER_CLR            0       /* clear bits in IER */
>>>>>
>>>>> -#define CA2_INT            0x01
>>>>> -#define CA1_INT            0x02
>>>>> -#define SR_INT             0x04    /* Shift register full/empty */
>>>>> -#define CB2_INT            0x08
>>>>> -#define CB1_INT            0x10
>>>>> -#define T2_INT             0x20    /* Timer 2 interrupt */
>>>>> -#define T1_INT             0x40    /* Timer 1 interrupt */
>>>>> +#define CA2_INT_BIT        0
>>>>> +#define CA1_INT_BIT        1
>>>>> +#define SR_INT_BIT         2       /* Shift register full/empty */
>>>>> +#define CB2_INT_BIT        3
>>>>> +#define CB1_INT_BIT        4
>>>>> +#define T2_INT_BIT         5       /* Timer 2 interrupt */
>>>>> +#define T1_INT_BIT         6       /* Timer 1 interrupt */
>>>>> +
>>>>> +#define CA2_INT            (1 << CA2_INT_BIT)
>>>>> +#define CA1_INT            (1 << CA1_INT_BIT)
>>>>> +#define SR_INT             (1 << SR_INT_BIT)
>>>>> +#define CB2_INT            (1 << CB2_INT_BIT)
>>>>> +#define CB1_INT            (1 << CB1_INT_BIT)
>>>>> +#define T2_INT             (1 << T2_INT_BIT)
>>>>> +#define T1_INT             (1 << T1_INT_BIT)
>>>>
>>>> Maybe you could leave the #defines called XX_INT and then use BIT(XX_INT) instead 
>>>> of the second set of #defines which would provide same readability but with less 
>>>> #defines needed.
>>>
>>> I'm not so keen on removing the _INT defines since that would require updating all 
>>> users to use BIT() everywhere which I don't think gains us much. I could certainly 
>>> replace these definitions with BIT(FOO) instead of (1 << FOO) if that helps 
>>> readability though.
>>
>> Do you mean simply doing this?
>>
>> -#define T1_INT             0x40    /* Timer 1 interrupt */
>> +#define T1_INT             BIT(6)  /* Timer 1 interrupt */
> 
> I meant:
> 
> #define T1_INT 6
> 
> and then replace current usage of T1_INT with BIT(T1_INT) that way we don't need both 
> T1_INT_BIT and T1_INT defines which seems redundant as BIT(T1_INT) is not much longer 
> and still clear what it refers to. It's true that this needs more changes but the 
> result is more readable IMO than introducing another set of defines that ome has to 
> look up when encounters them as the meaning might not be clear. That's why I think 
> one set of defines for bit numbers and using existing BIT(num) for values is better 
> but it's just an idea, I don't care that much.

I think the best solution here is to just use BIT() for the final shifted values like 
this:

#define CA2_INT_BIT        0
...
...
#define CA2_INT            BIT(CA2_INT_BIT)

Otherwise I can see there being confusion given that the BIT() macro is used for 
defines without a _BIT suffix which are also being used elsewhere. I'll update this 
in v2 accordingly.


ATB,

Mark.

