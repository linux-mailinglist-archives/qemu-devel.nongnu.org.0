Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C34BDB6B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 11:51:17 +0200 (CEST)
Received: from localhost ([::1]:47623 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD3x5-0000YW-V1
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 05:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iD3vo-0007sP-Ae
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 05:49:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iD3vn-0007Il-4v
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 05:49:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iD3vm-0007HS-TH
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 05:49:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A05EC057F31;
 Wed, 25 Sep 2019 09:49:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C4FC608C0;
 Wed, 25 Sep 2019 09:49:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2194C113864E; Wed, 25 Sep 2019 11:49:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Subject: Re: [PATCH v4 15/24] audio: add mixing-engine option (documentation)
References: <cover.1568927990.git.DirtY.iCE.hu@gmail.com>
 <68c4b4bd438e9cb5c97aed32ee31e3dabd96cbf6.1568927990.git.DirtY.iCE.hu@gmail.com>
 <87sgonma7v.fsf@dusky.pond.sub.org>
 <4d24c95c-0e98-2646-0b1a-6c7b3afe0e90@gmail.com>
Date: Wed, 25 Sep 2019 11:49:50 +0200
In-Reply-To: <4d24c95c-0e98-2646-0b1a-6c7b3afe0e90@gmail.com>
 (=?utf-8?B?IlpvbHTDoW4JS8WRdsOhZ8OzIidz?= message of "Tue, 24 Sep 2019
 02:21:32 +0200")
Message-ID: <87wodwyabl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 25 Sep 2019 09:49:54 +0000 (UTC)
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

> On 2019-09-23 15:08, Markus Armbruster wrote:
>> "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com> writes:
>>
>>> This will allow us to disable mixeng when we use a decent backend.
>>>
>>> Disabling mixeng have a few advantages:
>>> * we no longer convert the audio output from one format to another, when
>>>    the underlying audio system would just convert it to a third format.
>>>    We no longer convert, only the underlying system, when needed.
>>> * the underlying system probably has better resampling and sample format
>>>    converting methods anyway...
>>> * we may support formats that the mixeng currently does not support (S24
>>>    or float samples, more than two channels)
>>> * when using an audio server (like pulseaudio) different sound card
>>>    outputs will show up as separate streams, even if we use only one
>>>    backend
>>>
>>> Disadvantages:
>>> * audio capturing no longer works (wavcapture, and vnc audio extension)
>>> * some backends only support a single playback stream or very picky
>>>    about the audio format.  In this case we can't disable mixeng.
>>>
>>> However mixeng is not removed, only made optional, so this shouldn't be
>>> a big concern.
>>>
>>> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.c=
om>
>>> ---
>>>
>>> Notes:
>>>      Changes from v1:
>>>           * renamed mixeng to mixing-engine
>>>
>>>   qapi/audio.json | 5 +++++
>>>   qemu-options.hx | 6 ++++++
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/qapi/audio.json b/qapi/audio.json
>>> index 9fefdf5186..0535eff794 100644
>>> --- a/qapi/audio.json
>>> +++ b/qapi/audio.json
>>> @@ -11,6 +11,10 @@
>>>   # General audio backend options that are used for both playback and
>>>   # recording.
>>>   #
>>> +# @mixing-engine: use QEMU's mixing engine to mix all streams inside Q=
EMU. When
>>> +#                 set to off, fixed-settings must be also off. Not eve=
ry backend
>>> +#                 compatible with the off setting (default on, since 4=
.2)
>>> +#
>>
>> Last sentence no verb.
>>
>> Which backends are compatible?
>
> Actually that's a simplification, it depends on a few things.  When
> mixeng is off, qemu will try to use the same format as the emulated
> sound card, and if the backend doesn't support that format, it won't
> work (no audio).  Also attaching multiple sound cards to the same
> audiodev might not work, if the backend doesn't support multiple
> playback streams.  If you use pulseaudio, it'll work without problems,
> if you use alsa, it depends on your device.  If you use a hw: device
> directly, you'll likely only be able to use one emulated sound card
> with a few selected audio formats.  If you use dmix: (and plug), alsa
> will handle the conversion and mixing, so it will work no matter what
> format the emulated sound card uses.  With OSS the situation is
> probably similar, it depends on the kernel/hw what works and what not.
> wav and spice certainly doesn't support multiple streams.  I'm not
> completely sure about the other backends right now, but I think dsound
> and coreaudio can handle the necessary sample format conversions and
> mixing.
>
>> What happens when you try the off setting with incompatible backends?
> See above.

What happens *exactly*?

I'm asking because I'm concerned about the user experience.  When a user
asks for a combination of things QEMU can't provide, such as mixeng off
with an incompatible backend, QEMU should fail with a suitable error
message.  Does it?

Sometimes rejecting non-working configurations is impractical.  Is it
here?

If yes, we should call out the problematic configurations in
documentation.

[...]

