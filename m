Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F24C2BBC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:29:44 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDFf-0002M2-Kd
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:29:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNDCG-0006im-Jz
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:26:12 -0500
Received: from [2001:41c9:1:41f::167] (port=45586
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNDCE-0005Jg-D5
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:26:12 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNDBa-0003Ri-5V; Thu, 24 Feb 2022 12:25:34 +0000
Message-ID: <665eff07-9a99-1536-b416-fc20974ea697@ilande.co.uk>
Date: Thu, 24 Feb 2022 12:26:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
 <YgJmz6neLsF2n2u3@redhat.com>
 <f2114228-2243-2b4f-1869-a50d78a5a8d7@ilande.co.uk>
 <YgJrx2ygQmiF4TYx@redhat.com>
 <21104b5a-c895-337c-619d-e880836d5895@ilande.co.uk>
 <YhPH1BYRetB0Ks9C@redhat.com>
 <972e0e9d-1d4c-335b-139c-bb5230f2419f@ilande.co.uk>
 <YhT7K43xgXVS7YlL@work-vm>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YhT7K43xgXVS7YlL@work-vm>
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2022 15:03, Dr. David Alan Gilbert wrote:

> * Mark Cave-Ayland (mark.cave-ayland@ilande.co.uk) wrote:
>> On 21/02/2022 17:11, Daniel P. Berrangé wrote:
>>
>>> On Sun, Feb 20, 2022 at 05:18:33PM +0000, Mark Cave-Ayland wrote:
>>>> On 08/02/2022 13:10, Daniel P. Berrangé wrote:
>>>>
>>>>> On Tue, Feb 08, 2022 at 01:06:59PM +0000, Mark Cave-Ayland wrote:
>>>>>> On 08/02/2022 12:49, Daniel P. Berrangé wrote:
>>>>>>
>>>>>>>> I was under the impression that monitor_register_hmp_info_hrt() does all the
>>>>>>>> magic here i.e. it declares the underlying QMP command with an x- prefix and
>>>>>>>> effectively encapsulates the text field in a way that says "this is an
>>>>>>>> unreliable text opaque for humans"?
>>>>>>>
>>>>>>> The monitor_register_hmp_info_hrt only does the HMP glue side, and
>>>>>>> that's only needed if you must dynamically register the HMP command.
>>>>>>> For statically registered commands set '.cmd_info_hrt' directly in
>>>>>>> the hml-commands-info.hx for the HMP side.
>>>>>>>
>>>>>>>> If a qapi/ schema is needed could you explain what it should look like for
>>>>>>>> this example and where it should go? Looking at the existing .json files I
>>>>>>>> can't immediately see one which is the right place for this to live.
>>>>>>>
>>>>>>> Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
>>>>>>> there. The QAPI bit is fairly simple.
>>>>>>>
>>>>>>> if you want to see an illustration of what's different from a previous
>>>>>>> pure HMP impl, look at:
>>>>>>>
>>>>>>>       commit dd98234c059e6bdb05a52998270df6d3d990332e
>>>>>>>       Author: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>>       Date:   Wed Sep 8 10:35:43 2021 +0100
>>>>>>>
>>>>>>>         qapi: introduce x-query-roms QMP command
>>>>>>
>>>>>> I see, thanks for the reference. So qapi/machine.json would be the right
>>>>>> place to declare the QMP part even for a specific device?
>>>>>>
>>>>>> Even this approach still wouldn't work in its current form though, since as
>>>>>> mentioned in my previous email it seems that only the target CONFIG_*
>>>>>> defines and not the device CONFIG_* defines are present when processing
>>>>>> hmp-commands-info.hx.
>>>>>
>>>>> Yeah, that's where the pain comes in.  While QAPI schema can be made
>>>>> conditional on a few CONFIG_* parameters - basically those derived
>>>>> from global configure time options, it is impossible for this to be
>>>>> with with target specific options like the device CONFIG_* defines.
>>>>>
>>>>> This is why I suggested in my othuer reply that it would need to be
>>>>> done with a generic 'info dev-debug' / 'x-query-dev-debug' command
>>>>> that can be registered unconditionally, and then individual devices
>>>>> plug into it.
>>>>
>>>> After some more experiments this afternoon I still seem to be falling
>>>> through the gaps on this one. This is based upon my understanding that all
>>>> new HMP commands should use a QMP HumanReadableText implementation and the
>>>> new command should be restricted according to target.
>>>>
>>>> Currently I am working with this change to hmp-commands-info.hx and
>>>> qapi/misc-target.json:
>>>
>>> [snip]
>>>> i.e. qmp_marshal_output_HumanReadableText() isn't protected by the #if
>>>> TARGET guards and since HumanReadableText is only used by the new
>>>> qmp_x_query_via() functionality then the compiler complains and aborts the
>>>> compilation.
>>>>
>>>> Possibly this is an error in the QAPI generator for types hidden behind
>>>> commands using "if"? Otherwise I'm not sure what is the best way to proceed,
>>>> so I'd be grateful for some further pointers.
>>>
>>> Yes, this is pretty much what I expect and exactly what I hit with
>>> other target specific commands.
>>>
>>> That's why I suggested something like a general 'x-device-debug' command
>>> that is NOT conditionalized in QAPI, against which dev impls can register
>>> a callback to provide detailed reporting, instead of a device type specific
>>> command.
>>
>> Ah so this is a known issue with this approach then. David mentioned earlier
>> in the thread that he'd be okay with a HMP command if it was useful and
>> restricted to the required targets, so would it be okay to add "info via"
>> for now as just a (non-QMP wrapped) HMP info command if I can get that to
>> work?
> 
> I still am from an HMP point of view; it sounds like the right way in
> the future is to get the info devices or whatever;  I suggest you keep
> it as close to a QMP implementation as possible, still with the
> HumanReadableText stuff.
> (Others might still be nervous about an HMP special; but I don't see
> it's worth holding this trivial stuff up for it).

I've just posted a v2 and what I've done there is to manually add a hmp_info_via() 
wrapper (taken almost verbatim from 
https://www.qemu.org/docs/master/devel/writing-monitor-commands.html#id1) and added 
it to both include/monitor/hmp-target.h and include/hw/misc/mos6522.h which passes a 
Gitlab run.

I think it's worth having as an in-tree reference for when a more formal HMP/QMP 
per-device as opposed to per-target infrastructure arrives.


ATB,

Mark.

