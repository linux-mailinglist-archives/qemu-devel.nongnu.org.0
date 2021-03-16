Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA533D599
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:18:45 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAWy-0006J4-Tm
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMAWF-0005nW-28; Tue, 16 Mar 2021 10:17:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMAWB-0006c4-2k; Tue, 16 Mar 2021 10:17:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 56EB8746353;
 Tue, 16 Mar 2021 15:17:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2B79D7462DB; Tue, 16 Mar 2021 15:17:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2A20A7456B4;
 Tue, 16 Mar 2021 15:17:50 +0100 (CET)
Date: Tue, 16 Mar 2021 15:17:50 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
In-Reply-To: <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
Message-ID: <90223625-d725-97c1-847-e9bfe8534063@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
 <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
 <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-471162801-1615897829=:85087"
Content-ID: <a352b859-5549-7c8b-6e53-b051534cfe@eik.bme.hu>
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-471162801-1615897829=:85087
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <f4f45234-572f-3710-48e8-89c2be60be62@eik.bme.hu>

On Tue, 16 Mar 2021, Philippe Mathieu-Daudé wrote:
> On 3/16/21 10:01 AM, Laurent Vivier wrote:
>> Le 15/03/2021 à 13:33, BALATON Zoltan a écrit :
>>> On Sat, 13 Mar 2021, BALATON Zoltan wrote:
>>>> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>>>>> Hello,
>>>>
>>>> I've started posting this series well in advance to get it into 6.0 and yet it seems like it may
>>>> be missing it due to organisational issues (no real complaints were found with patches but
>>>> Philippe seems to like more review that does not seem to happen as nobody is interested). Looks
>>>> like David is waiting for an ack from Philippe but will be away next week so if this is not
>>>> resolved now it may be too late on Monday. To avoid that:
>>>>
>>>> David, could you please send an ack before you leave for the last two patches so it could get
>>>> committed via some other tree while you're away?
>>>>
>>>> Philippe, if you can't ack the vt82c686 patches now are you OK with taking the whole series via
>>>> your tree before the freeze? That would give you some more days to review and it could always be
>>>> reverted during the freeze but if it's not merged now I'll have to wait until the summer to get it
>>>> in again which would be another long delay. I don't think this will get more reviews unless it's
>>>> in master and people can start using and testing it better.
>>>
>>> Hello,
>>>
>>> Since David seems to be away for this week before seeing my mail asking for an ack from him, now
>>> this can only get in by Philippe or Peter. (David said before he'd be OK with the series if Philippe
>>> acked it so I think that can count as an implicit ack and it could always be reverted before the
>>> releease.)
>>>
>>> Philippe, do you have anything against this to get merged now? If not please send a pull or ack it
>>> so it has a chance to be in 6.0 or tell if you still intend to do anything about it before the
>>> freeze. This series was on the list since January and the remaining parts you did not take are here
>>> since February 22nd and the version after your first review since two weeks so it would be nice to
>>> sort this out and not block it any further without a good reason.
>>
>> Pegasos looks like a New World PowerMac, so perhaps Mark can help?
>
> The PPC part is mostly reviewed. The problem is the first patch:
> "vt82c686: Implement control of serial port io ranges via config regs".
>
> I don't understand it. Zoltan said Paolo isn't acking it because
> he doesn't mind. I prefer to be cautious and think than Paolo is
> rather too busy.

Can you just send a pull request then and Paolo could nack it or comment 
on that. If he does not, then this should be OK as it does not touch 
anything else than vt82c686 so it also should not break anything else.

Basically what the patch does is have a via-superio class that inherits 
from TYPE_ISA_SUPERIO that creates the ISA devices, among others 
isa-serial ports. Then the device grabs the memory regions for these 
serial devices to be able to change their state and address on config 
register writes. It only does that for serial devices not for parallel and 
floppy because those have more than one memory region and would not be 
easy to handle so those are not configurable but left at their default 
address. We need configurability for serial port because on pegasos2 
there's only one serial port and it's set to a non-standard address by the 
firmware. Fuloong2e used to put these at default address and the firmware 
did not touch it, we now more properly emulate the chip and allow changing 
the address which the firmware leaves at the default but on pegasos that 
would not work.

The resulting model is not so bad as we only access memory region owned by 
child device (via-superio sets memory region of isa-serial that's created 
by its superclass isa superio and this is only needed because there's no 
other interface and one cannot be easily added without possibly breaking 
something due to other ISA devices that have multiple memory regions). So 
I think this is the simplest and least invasive solution that shoul be 
enough for now until ISA device emulation is QOM'ified which is a task I 
don't want to take up as it's way more work I'd put in and has a 
possibility to break stuff I don't have a way or time to test so unless 
somebody does that there's no other easy way to solve this problem.

Regards,
BALATON Zoltan
--3866299591-471162801-1615897829=:85087--

