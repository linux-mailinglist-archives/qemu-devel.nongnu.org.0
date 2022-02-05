Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8554AA888
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:10:00 +0100 (CET)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGJt8-0005J9-Lp
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:09:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGJq1-0003Fb-VA
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:06:47 -0500
Received: from [2001:738:2001:2001::2001] (port=54909 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nGJpw-0008IG-AD
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:06:43 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A915D745712;
 Sat,  5 Feb 2022 13:06:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 861AE745708; Sat,  5 Feb 2022 13:06:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 83E467456E3;
 Sat,  5 Feb 2022 13:06:29 +0100 (CET)
Date: Sat, 5 Feb 2022 13:06:29 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/11] mos6522: add defines for IFR bit flags
In-Reply-To: <84db72ea-9aca-43f9-2876-28a5d6d840f4@amsat.org>
Message-ID: <e6b2e9c-6082-cb63-a8ae-d96ab96e8c2e@eik.bme.hu>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-2-mark.cave-ayland@ilande.co.uk>
 <9e5c4e86-8555-1a42-783f-dae53f114cd2@eik.bme.hu>
 <79a162bf-86f5-0ca4-5f14-822469606812@ilande.co.uk>
 <84db72ea-9aca-43f9-2876-28a5d6d840f4@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1207141466-1644062789=:31293"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1207141466-1644062789=:31293
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 5 Feb 2022, Philippe Mathieu-Daudé wrote:
> On 5/2/22 11:51, Mark Cave-Ayland wrote:
>> On 27/01/2022 23:16, BALATON Zoltan wrote:
>> 
>>> On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
>>>> These are intended to make it easier to see how the physical control 
>>>> lines
>>>> are wired for each instance.
>>>> 
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>> include/hw/misc/mos6522.h | 22 +++++++++++++++-------
>>>> 1 file changed, 15 insertions(+), 7 deletions(-)
>>>> 
>>>> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
>>>> index fc95d22b0f..12abd8b8d2 100644
>>>> --- a/include/hw/misc/mos6522.h
>>>> +++ b/include/hw/misc/mos6522.h
>>>> @@ -41,13 +41,21 @@
>>>> #define IER_SET            0x80    /* set bits in IER */
>>>> #define IER_CLR            0       /* clear bits in IER */
>>>> 
>>>> -#define CA2_INT            0x01
>>>> -#define CA1_INT            0x02
>>>> -#define SR_INT             0x04    /* Shift register full/empty */
>>>> -#define CB2_INT            0x08
>>>> -#define CB1_INT            0x10
>>>> -#define T2_INT             0x20    /* Timer 2 interrupt */
>>>> -#define T1_INT             0x40    /* Timer 1 interrupt */
>>>> +#define CA2_INT_BIT        0
>>>> +#define CA1_INT_BIT        1
>>>> +#define SR_INT_BIT         2       /* Shift register full/empty */
>>>> +#define CB2_INT_BIT        3
>>>> +#define CB1_INT_BIT        4
>>>> +#define T2_INT_BIT         5       /* Timer 2 interrupt */
>>>> +#define T1_INT_BIT         6       /* Timer 1 interrupt */
>>>> +
>>>> +#define CA2_INT            (1 << CA2_INT_BIT)
>>>> +#define CA1_INT            (1 << CA1_INT_BIT)
>>>> +#define SR_INT             (1 << SR_INT_BIT)
>>>> +#define CB2_INT            (1 << CB2_INT_BIT)
>>>> +#define CB1_INT            (1 << CB1_INT_BIT)
>>>> +#define T2_INT             (1 << T2_INT_BIT)
>>>> +#define T1_INT             (1 << T1_INT_BIT)
>>> 
>>> Maybe you could leave the #defines called XX_INT and then use BIT(XX_INT) 
>>> instead of the second set of #defines which would provide same readability 
>>> but with less #defines needed.
>> 
>> I'm not so keen on removing the _INT defines since that would require 
>> updating all users to use BIT() everywhere which I don't think gains us 
>> much. I could certainly replace these definitions with BIT(FOO) instead of 
>> (1 << FOO) if that helps readability though.
>
> Do you mean simply doing this?
>
> -#define T1_INT             0x40    /* Timer 1 interrupt */
> +#define T1_INT             BIT(6)  /* Timer 1 interrupt */

I meant:

#define T1_INT 6

and then replace current usage of T1_INT with BIT(T1_INT) that way we 
don't need both T1_INT_BIT and T1_INT defines which seems redundant as 
BIT(T1_INT) is not much longer and still clear what it refers to. It's 
true that this needs more changes but the result is more readable IMO than 
introducing another set of defines that ome has to look up when encounters 
them as the meaning might not be clear. That's why I think one set of 
defines for bit numbers and using existing BIT(num) for values is better 
but it's just an idea, I don't care that much.

Regards,
BALATON Zoltan
--3866299591-1207141466-1644062789=:31293--

