Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77364ADBCA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:58:26 +0100 (CET)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRwn-0002Cc-Qx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:58:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPfT-0003ZV-TB
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:32:24 -0500
Received: from [2001:41c9:1:41f::167] (port=51676
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPfR-0003En-Tb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:32:23 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPel-000720-Cv; Tue, 08 Feb 2022 12:31:43 +0000
Message-ID: <2cad9b25-620d-66b9-d64f-7a0e3f806952@ilande.co.uk>
Date: Tue, 8 Feb 2022 12:32:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org> <YgJF9SDwb93k5/fg@work-vm>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YgJF9SDwb93k5/fg@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 10:29, Dr. David Alan Gilbert wrote:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> On 7/2/22 20:34, Peter Maydell wrote:
>>>> On Thu, 27 Jan 2022 at 21:03, Mark Cave-Ayland
>>>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>>>
>>>>> This displays detailed information about the device registers and timers to aid
>>>>> debugging problems with timers and interrupts.
>>>>>
>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>> ---
>>>>>    hmp-commands-info.hx | 12 ++++++
>>>>>    hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
>>>>>    2 files changed, 104 insertions(+)
>>>>
>>>> I'm not sure how keen we are on adding new device-specific
>>>> HMP info commands, but it's not my area of expertise. Markus ?
>>>
>>> HMP is David :)
>>
>> Yes.
> 
> So let me start with an:
> 
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> (If it's useful info for the author of the device, then I'm happy for
> HMP to have that), but then - (moving the reply around a bit):
> 
> 
>> Should this be conditional on the targets where we actually link the
>> device, like info skeys?
>>
> 
> Yes, I think so; it's a reasonably old/obscure device, there's no reason
> everyone having it built in.

Unfortunately that doesn't seem to work: whilst the target CONFIG_* defines are 
declared when processing hmp-commands-info.hx it seems the the device CONFIG_* 
defines are missing?

>>>                  IIRC it is OK as long as HMP is a QMP wrapper.
>>
>> That's "how to do it", and I'll get back to it in a jiffie, but Peter
>> was wondering about the "whether to do it".
>>
>> Most HMP commands are always there.
>>
>> We have a few specific to compile-time configurable features: TCG, VNC,
>> Spice, Slirp, Linux.  Does not apply here.
>>
>> We have a few specific to targets, such as dump-skeys and info skeys for
>> s390.  Target-specific is not quite the same as device-specific.
>>
>> We have no device-specific commands so far.  However, dump-skeys and
>> info skeys appear to be about the skeys *device*, not the s390 target.
>> Perhaps any s390 target has such a device?  I don't know.  My point is
>> we already have device-specific commands, they're just masquerading as
>> target-specific commands.
> 
> Yeh we've got info lapic/ioapic as well.

... which I suspect is a workaround for only the target CONFIG_* defines being declared.

>> The proposed device-specific command uses a mechanism originally made
>> for modules instead (more on that below).
>>
>> I think we should make up our minds which way we want device-specific
>> commands done, then do *all* of them that way.
> 
> I think device specific commands make sense, but I think it would
> probably be better if we had an 'info dev $name' and that a method on
> the device rather than registering each one separately.
> I'd assume that this would be a QMP level thing that got unwrapped at
> HMP.
> 
> But that's not a problem for this contribution; someone else can figure
> that out later.


ATB,

Mark.

