Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA94BED35
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:29:24 +0100 (CET)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHBL-0003hf-DU
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nMHAA-00028q-Im
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:28:10 -0500
Received: from [2001:41c9:1:41f::167] (port=41384
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nMHA8-0007Lt-Kz
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:28:10 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nMH9T-0006P5-9H; Mon, 21 Feb 2022 22:27:31 +0000
Message-ID: <81f530ad-df7a-6607-704f-8798dc419dcc@ilande.co.uk>
Date: Mon, 21 Feb 2022 22:27:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
 <YgJmz6neLsF2n2u3@redhat.com>
 <f2114228-2243-2b4f-1869-a50d78a5a8d7@ilande.co.uk>
 <YgJrx2ygQmiF4TYx@redhat.com>
 <21104b5a-c895-337c-619d-e880836d5895@ilande.co.uk>
 <de61912e-55d4-7302-c758-6f32af621134@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <de61912e-55d4-7302-c758-6f32af621134@gmail.com>
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/2022 12:20, Philippe Mathieu-Daudé wrote:

> +Thomas
> 
> On 20/2/22 18:18, Mark Cave-Ayland wrote:
>> On 08/02/2022 13:10, Daniel P. Berrangé wrote:
>>
>>> On Tue, Feb 08, 2022 at 01:06:59PM +0000, Mark Cave-Ayland wrote:
>>>> On 08/02/2022 12:49, Daniel P. Berrangé wrote:
>>>>
>>>>>> I was under the impression that monitor_register_hmp_info_hrt() does all the
>>>>>> magic here i.e. it declares the underlying QMP command with an x- prefix and
>>>>>> effectively encapsulates the text field in a way that says "this is an
>>>>>> unreliable text opaque for humans"?
>>>>>
>>>>> The monitor_register_hmp_info_hrt only does the HMP glue side, and
>>>>> that's only needed if you must dynamically register the HMP command.
>>>>> For statically registered commands set '.cmd_info_hrt' directly in
>>>>> the hml-commands-info.hx for the HMP side.
>>>>>
>>>>>> If a qapi/ schema is needed could you explain what it should look like for
>>>>>> this example and where it should go? Looking at the existing .json files I
>>>>>> can't immediately see one which is the right place for this to live.
>>>>>
>>>>> Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
>>>>> there. The QAPI bit is fairly simple.
>>>>>
>>>>> if you want to see an illustration of what's different from a previous
>>>>> pure HMP impl, look at:
>>>>>
>>>>>     commit dd98234c059e6bdb05a52998270df6d3d990332e
>>>>>     Author: Daniel P. Berrangé <berrange@redhat.com>
>>>>>     Date:   Wed Sep 8 10:35:43 2021 +0100
>>>>>
>>>>>       qapi: introduce x-query-roms QMP command
>>>>
>>>> I see, thanks for the reference. So qapi/machine.json would be the right
>>>> place to declare the QMP part even for a specific device?
>>>>
>>>> Even this approach still wouldn't work in its current form though, since as
>>>> mentioned in my previous email it seems that only the target CONFIG_*
>>>> defines and not the device CONFIG_* defines are present when processing
>>>> hmp-commands-info.hx.
>>>
>>> Yeah, that's where the pain comes in.  While QAPI schema can be made
>>> conditional on a few CONFIG_* parameters - basically those derived
>>> from global configure time options, it is impossible for this to be
>>> with with target specific options like the device CONFIG_* defines.
>>>
>>> This is why I suggested in my othuer reply that it would need to be
>>> done with a generic 'info dev-debug' / 'x-query-dev-debug' command
>>> that can be registered unconditionally, and then individual devices
>>> plug into it.
>>
>> After some more experiments this afternoon I still seem to be falling through the 
>> gaps on this one. This is based upon my understanding that all new HMP commands 
>> should use a QMP HumanReadableText implementation and the new command should be 
>> restricted according to target.
>>
>> Currently I am working with this change to hmp-commands-info.hx and 
>> qapi/misc-target.json:
>>
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 7e6bd30395..aac86d5473 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -880,15 +880,15 @@ SRST
>>       Show intel SGX information.
>>   ERST
>>
>> #if defined(TARGET_M68K) || defined(TARGET_PPC)
>>       {
>>           .name         = "via",
>>           .args_type    = "",
>>           .params       = "",
>>           .help         = "show guest mos6522 VIA devices",
>>           .cmd_info_hrt = qmp_x_query_via,
>>       },
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 4bc45d2474..72bf71888e 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -2,6 +2,8 @@
>>   # vim: filetype=python
>>   #
>>
>> +{ 'include': 'common.json' }
>> +
>>   ##
>>   # @RTC_CHANGE:
>>   #
>> @@ -424,3 +426,19 @@
>>   #
>>   ##
>>   { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
>> +
>> +##
>> +# @x-query-via:
>> +#
>> +# Query information on the registered mos6522 VIAs
>> +#
>> +# Features:
>> +# @unstable: This command is meant for debugging.
>> +#
>> +# Returns: internal mos6522 information
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'command': 'x-query-via',
>> +  'returns': 'HumanReadableText',
>> +  'features': [ 'unstable' ], 'if': { 'any': [ 'TARGET_M68K', 'TARGET_PPC' ] } }
>>
>>
>> The main problem with trying to restrict the new command to a target (or targets) 
>> is that the autogenerated qapi/qapi-commands-misc-target.h QAPI header cannot be 
>> included in a device header such as mos6522.h without getting poison errors like 
>> below (which does actually make sense):
>>
>>
>> In file included from ./qapi/qapi-commands-misc-target.h:17,
>>                   from /home/build/src/qemu/git/qemu/include/hw/misc/mos6522.h:35,
>>                   from ../hw/misc/mos6522.c:30:
>> ./qapi/qapi-types-misc-target.h:19:13: error: attempt to use poisoned "TARGET_ALPHA"
> 
> Can be kludged by making this device target-specific:
> 
> -- >8 --
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 6dcbe044f3..65837b1dfe 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -23 +23 @@ softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_ras.c'))
> -softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
> +specific_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
> ---
> 
> I'd rather keep devices generic, but sometime we can't. In this case
> VIA is only used on m68k so it could be acceptable.

That's not quite true though, it's also used for the Mac machines. From what I can 
see everyone agrees that there needs to be a better way to do this, but it requires 
someone with time and interest to implement the suggested changes.


ATB,

Mark.

