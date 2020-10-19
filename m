Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC952929A0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 16:40:22 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUWKj-0000TO-Pe
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 10:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUWJ8-0007su-Qg; Mon, 19 Oct 2020 10:38:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34118
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUWJ6-0006QT-FT; Mon, 19 Oct 2020 10:38:42 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUWJ1-00007L-Bo; Mon, 19 Oct 2020 15:38:41 +0100
To: Markus Armbruster <armbru@redhat.com>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
References: <20201011190332.3189611-1-f4bug@amsat.org>
 <20201011223446.GA4787@yekko.fritz.box>
 <369509c1-2e90-13cf-8845-892e754516d1@amsat.org>
 <20201012065436.GB71119@yekko.fritz.box>
 <9f7e4847-801d-dcd3-b876-bf2d276251@eik.bme.hu>
 <6e587154-4bc5-c44c-0c85-b46e0dddd3aa@amsat.org>
 <87k0vm1wny.fsf@dusky.pond.sub.org>
 <24bcd4-fde2-22a2-d3f4-cd42d9ee13c6@eik.bme.hu>
 <87d01e48pa.fsf@dusky.pond.sub.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <9968e60e-99fd-3777-62ca-57decb716886@ilande.co.uk>
Date: Mon, 19 Oct 2020 15:38:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87d01e48pa.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/pci-host/grackle: Verify PIC link is properly set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/2020 15:00, Markus Armbruster wrote:

> BALATON Zoltan via <qemu-devel@nongnu.org> writes:
> 
>> On Mon, 19 Oct 2020, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>> On 10/12/20 1:50 PM, BALATON Zoltan via wrote:
>>>>> On Mon, 12 Oct 2020, David Gibson wrote:
>>>>>> On Mon, Oct 12, 2020 at 08:21:41AM +0200, Philippe
>>>>>> Mathieu-DaudÃƒÆ’Ã‚Â© wrote:
>>>>>>> On 10/12/20 12:34 AM, David Gibson wrote:
>>>>>>>> On Sun, Oct 11, 2020 at 09:03:32PM +0200, Philippe
>>>>>>>> Mathieu-DaudÃƒÆ’Ã‚Â© wrote:
>>>>>>>>> The Grackle PCI host model expects the interrupt controller
>>>>>>>>> being set, but does not verify it is present. Add a check to
>>>>>>>>> help developers using this model.
>>>>>>>>
>>>>>>>> I don't think thaqt's very likely, but, sure, applied to ppc-for-5.2
>>>>>>>
>>>>>>> Do you want I correct the description as:
>>>>>>> "The Grackle PCI host model expects the interrupt controller
>>>>>>> being set, but does not verify it is present.
>>>>>>> A developer basing its implementation on the Grackle model
>>>>>>> might hit this problem. Add a check to help future developers
>>>>>>> using this model as reference."?
>>>>>>
>>>>>> No, it's fine.Â  All I was saying is that the chances of anyone using
>>>>>> Grackle in future seem very low to me.
>>>>> So maybe an assert instead of a user visible error would be enough?
>>>>
>>>> My understanding is realize() shouldn't abort()
>>>> (the caller might choose to by using &error_abort).
>>>
>>> assert() is for checking invariants.  A violated invariant is a
>>> programming error: developers screwed up, safe recovery is impossible.
>>>
>>> Abusing assert() to catch errors that are not programming errors is
>>> wrong.
>>>
>>> You may check invariants with assert() anywhere in the code.
>>>
>>> You should not misuse assert() anywhere in the code.
>>>
>>> Sometimes, an error condition that is *not* a programming error in the
>>> function where it is detected *is* a programming error for certain
>>> calls.  Having these calls pass &error_abort is a common solution for
>>> this problem.
>>>
>>> Hope this helps.
>>
>> Helps just a bit but after reading this I'm still confused if this
>> particular case should be assert or ser error.
>>
>> I was suggesting assert and I think it's a programming error to use
>> the grackle model without setting PIC link but not sure if users can
>> also create this instance via command line (even if it does not make
>> much sense) in which case it's probably better to return error.
> 
> They can't: "info qdm" shows
> 
>      name "grackle-pcihost", bus System, no-user
>                                          ~~~~~~~
> 
>>                                                                  Having
>> all devices user creatable via -device without a way to describe their
>> dependencies is a nice way to make all sorts of errors possible. But
>> maybe aborting with assert during creation of the machine is still
>> OK. If people device_add a model later and that crashes then it's
>> their problem. Unless we want to avoid that being used as DoS in
>> enterprise setting. So maybe we should never abort then if there's a
>> way to fail with an error instead.
>>
>> I can look at this problem from different angles and all seem to be
>> plausible resulting in different solutions.
> 
> As long as the device is no-user, asserting that properties have sane
> values feels reasonable enough to me.
> 
> Setting an error instead is not wrong, of course.

One thing I have thought about is being able to mark a link property as mandatory so 
if a value hasn't been set before realize then you receive a fatal error. This would 
be for cases like this where 2 internal devices are connected together without any 
formal interface, i.e. in cases where -device wouldn't work anyway.

I should also add that this patch has been dropped, and its replacement is now in git 
master - the wiring of the PIC has been moved from the grackle PCI host bridge up to 
the machine level where it really belongs.


ATB,

Mark.

