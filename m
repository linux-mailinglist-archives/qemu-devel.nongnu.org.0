Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C6CDD29
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 10:23:00 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHOIF-0006kc-6j
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 04:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iHOHJ-0006Ic-1H
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iHOHG-0005Vx-1J
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:22:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13061)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iHOHF-0005VW-P1
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 04:21:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EBFE910C0929;
 Mon,  7 Oct 2019 08:21:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBFE60A35;
 Mon,  7 Oct 2019 08:21:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E458B1138648; Mon,  7 Oct 2019 10:21:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Subject: Re: [PATCH v4 15/24] audio: add mixing-engine option (documentation)
References: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
 <68c4b4bd438e9cb5c97aed32ee31e3dabd96cbf6.1568927990.git.DirtY.iCE.hu@gmail.com>
 <87sgonma7v.fsf@dusky.pond.sub.org>
 <4d24c95c-0e98-2646-0b1a-6c7b3afe0e90@gmail.com>
 <87wodwyabl.fsf@dusky.pond.sub.org>
 <cacb71d0-494f-e05d-dece-637579b0c6d9@gmail.com>
 <87d0fh6l2b.fsf@dusky.pond.sub.org>
 <1a31eb0a-2f07-ae33-e272-bec46d4593a5@gmail.com>
Date: Mon, 07 Oct 2019 10:21:47 +0200
In-Reply-To: <1a31eb0a-2f07-ae33-e272-bec46d4593a5@gmail.com>
 (=?utf-8?B?IlpvbHTDoW4JS8WRdsOhZ8OzIidz?= message of "Fri, 4 Oct 2019
 01:27:54 +0200")
Message-ID: <87tv8lhso4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 07 Oct 2019 08:21:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3" <dirty.ice.hu@gmail.com> writes:

> On 2019-10-01 08:23, Markus Armbruster wrote:
>> "Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3" <dirty.ice.hu@gmail.com> writes:
>>
>>> On 2019-09-25 11:49, Markus Armbruster wrote:
>>>> "Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3" <dirty.ice.hu@gmail.com> writes:
>>>>
>>>>> On 2019-09-23 15:08, Markus Armbruster wrote:
>>>>>> "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com> writes:
>>>>>>
>>>>>>> This will allow us to disable mixeng when we use a decent backend.
>>>>>>>
>>>>>>> Disabling mixeng have a few advantages:
>>>>>>> * we no longer convert the audio output from one format to another,=
 when
>>>>>>>      the underlying audio system would just convert it to a third f=
ormat.
>>>>>>>      We no longer convert, only the underlying system, when needed.
>>>>>>> * the underlying system probably has better resampling and sample f=
ormat
>>>>>>>      converting methods anyway...
>>>>>>> * we may support formats that the mixeng currently does not support=
 (S24
>>>>>>>      or float samples, more than two channels)
>>>>>>> * when using an audio server (like pulseaudio) different sound card
>>>>>>>      outputs will show up as separate streams, even if we use only =
one
>>>>>>>      backend
>>>>>>>
>>>>>>> Disadvantages:
>>>>>>> * audio capturing no longer works (wavcapture, and vnc audio extens=
ion)
>>>>>>> * some backends only support a single playback stream or very picky
>>>>>>>      about the audio format.  In this case we can't disable mixeng.
>>>>>>>
>>>>>>> However mixeng is not removed, only made optional, so this shouldn'=
t be
>>>>>>> a big concern.
>>>>>>>
>>>>>>> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gma=
il.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Notes:
>>>>>>>        Changes from v1:
>>>>>>>             * renamed mixeng to mixing-engine
>>>>>>>
>>>>>>>     qapi/audio.json | 5 +++++
>>>>>>>     qemu-options.hx | 6 ++++++
>>>>>>>     2 files changed, 11 insertions(+)
>>>>>>>
>>>>>>> diff --git a/qapi/audio.json b/qapi/audio.json
>>>>>>> index 9fefdf5186..0535eff794 100644
>>>>>>> --- a/qapi/audio.json
>>>>>>> +++ b/qapi/audio.json
>>>>>>> @@ -11,6 +11,10 @@
>>>>>>>     # General audio backend options that are used for both playback=
 and
>>>>>>>     # recording.
>>>>>>>     #
>>>>>>> +# @mixing-engine: use QEMU's mixing engine to mix all streams insi=
de QEMU. When
>>>>>>> +#                 set to off, fixed-settings must be also off. Not=
 every backend
>>>>>>> +#                 compatible with the off setting (default on, sin=
ce 4.2)
>>>>>>> +#
>>>>>>
>>>>>> Last sentence no verb.
>>>>>>
>>>>>> Which backends are compatible?
>>>>>
>>>>> Actually that's a simplification, it depends on a few things.  When
>>>>> mixeng is off, qemu will try to use the same format as the emulated
>>>>> sound card, and if the backend doesn't support that format, it won't
>>>>> work (no audio).  Also attaching multiple sound cards to the same
>>>>> audiodev might not work, if the backend doesn't support multiple
>>>>> playback streams.  If you use pulseaudio, it'll work without problems,
>>>>> if you use alsa, it depends on your device.  If you use a hw: device
>>>>> directly, you'll likely only be able to use one emulated sound card
>>>>> with a few selected audio formats.  If you use dmix: (and plug), alsa
>>>>> will handle the conversion and mixing, so it will work no matter what
>>>>> format the emulated sound card uses.  With OSS the situation is
>>>>> probably similar, it depends on the kernel/hw what works and what not.
>>>>> wav and spice certainly doesn't support multiple streams.  I'm not
>>>>> completely sure about the other backends right now, but I think dsound
>>>>> and coreaudio can handle the necessary sample format conversions and
>>>>> mixing.
>>>>>
>>>>>> What happens when you try the off setting with incompatible backends?
>>>>> See above.
>>>>
>>>> What happens *exactly*?
>>>>
>>>> I'm asking because I'm concerned about the user experience.  When a us=
er
>>>> asks for a combination of things QEMU can't provide, such as mixeng off
>>>> with an incompatible backend, QEMU should fail with a suitable error
>>>> message.  Does it?
>>>
>>> Error handling is not the best in the audio subsystem, if something
>>> fails it generally just prints a warning to the console and continues,
>>> and something will happen...  For example, this is what happens when I
>>> try to open one hw device twice. I ran qemu with:
>>>
>>> -audiodev
>>> alsa,id=3Dfoo,in.dev=3Dhw:1,,0,out.mixing-engine=3Doff,out.dev=3Dhw:1,,0
>>> -device piix4-usb-uhci -device usb-audio,audiodev=3Dfoo -device
>>> AC97,audiodev=3Dfoo
>>>
>>> When the guest tried to initialize the AC97 card, I got an error:
>>>
>>> alsa: Could not initialize DAC
>>> alsa: Failed to open `hw:1,0':
>>> alsa: Reason: Device or resource busy
>>>
>>> And it just continued. And the sound worked, but with wrong sample
>>> rate (AC97 wants 44100 Hz, but USB audio previously opened the alsa
>>> device with 48000 Hz).  I'll fix this bug in the next revision,
>>> audio_pcm_hw_add_* shouldn't fall back to other HWs without mixeng.
>>> But even with that, the result will be that one emulated sound card
>>> will work and the other won't.
>>>
>>> It's not ideal, but fixing it would require a lot of effort.  Right
>>> now, if you specify an invalid audiodev for alsa (even with mixeng),
>>> it'll just print an error to the console and continue without audio.
>>
>> Should we document this general error handling deficiency somehow?
>
> It could be useful to mention it, especially for people who write
> script and expect qemu to fail if they specify an invalid parameter.
> I'm not sure how in-depth this explanation should be however.

Common issue when writing documentation.

One way to tackle it: start unspecific, then add specifics until it
feels useful.

The other direction can also work: write up everything, then cut until
it feels useful.  Makes sense mostly when you need to write up
everything anyway, say for a developer audience, or even just for
yourself.  Nothing promotes clear thinking like writing does[*].

>>>> Sometimes rejecting non-working configurations is impractical.  Is it
>>>> here?
>>>
>>> I think it is.  It depends on the backend, its settings, the frontend
>>> (emulated sound card), and how the guest uses it.  We currently don't
>>> know what formats does a backend support, what formats can a frontend
>>> produce, and even if we would know that, just because a frontend can
>>> produce a format that the backend doesn't understand doesn't mean that
>>> it will actually do it.  For example, right now with this patch series
>>> applied, usb-audio can produce 7.1 audio.  If we want to be strict, it
>>> means we can only use it with backends that support at least 8
>>> channels, even if the user only wants to use stereo audio.
>>>
>>>> If yes, we should call out the problematic configurations in
>>>> documentation.
>>>
>>> I think we should rather list known working configurations, and leave
>>> the others as "try at your own risk" because there's too many things
>>> that can go wrong.  (pulseaudio will work, alsa with dmix too.  Need
>>> to check coreaudio, dsound and oss.  spice and wavcapture won't work.)
>>
>> Far from ideal, but better than nothing.
>>
>> Possibly naive idea: what about automatically falling back to mixeng on
>> when mixeng off doesn't work?  Requires detecting "doesn't work", which
>> I understand just isn't there.  Any other reasons why this couldn't be
>> done?  Way out of scope for this series, of course.
>
> There are two cases when mixeng can help: a) when the frontend
> requires a format not supported by the backend, and b) when multiple
> frontends wants to use the same backend, but the backend doesn't
> support multiple channels.  This fallback logic would help with a) but
> it would be much harder to solve b) (I'm not saying it's impossible,
> but it would require us to convert the already running stream back to
> mixeng).  However, since the goal of this setting is to get rid of
> limitations of mixeng, currently you only want to turn it off if when
> you want to use 5.1 or 7.1 audio, where falling back to mixeng is not
> an option.  (The other use case was when using pulseaudio, you wanted
> different pa streams per emulated sound card, but since you can have
> multiple -audiodevs now, it's no longer necessary to disable mixeng.)

"Currently you only want to turn it off if when you want to use 5.1 or
7.1 audio" is useful advice.  I figure it should be worked into
documentation if it's not already there.

Suggest to record the remainder of your answer for posterity by working
it into the commit message, along with this thought:

> The ideal solution is probably porting as much as possible to
> gstreamer, but this is even more out of scope:
> https://wiki.qemu.org/Internships/ProjectIdeas/AudioGStreamer

Thanks!


[*] "If you're thinking without writing, you only think you're
thinking." Leslie Lamport

