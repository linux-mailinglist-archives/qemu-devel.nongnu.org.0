Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CD06C02EB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 16:50:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdvHK-00045Z-V9; Sun, 19 Mar 2023 11:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pdvHI-00045R-Hs
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 11:49:00 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pdvHG-00028B-4s
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 11:49:00 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1692B7457E7;
 Sun, 19 Mar 2023 16:48:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 96AEE745706; Sun, 19 Mar 2023 16:48:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 94BF07456E3;
 Sun, 19 Mar 2023 16:48:17 +0100 (CET)
Date: Sun, 19 Mar 2023 16:48:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>
cc: Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Rene Engel <ReneEngel80@emailn.de>, qemu-devel@nongnu.org
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
In-Reply-To: <c9144021-696a-7895-9a26-a923e37cfe55@t-online.de>
Message-ID: <f946a3b7-35e2-a9f6-a05c-e53fea4e16c5@eik.bme.hu>
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <8eb20cbf-f922-de5e-a36a-f4041d332774@t-online.de>
 <e85a87ae-dfe4-8fc0-85df-300be676225f@eik.bme.hu>
 <bd66788e-c9bf-d324-8a82-c2467276cfdf@t-online.de>
 <7de440c4-a11a-4805-0e6f-75850e4f0938@eik.bme.hu>
 <c9144021-696a-7895-9a26-a923e37cfe55@t-online.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1212146240-1679240897=:19083"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1212146240-1679240897=:19083
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 19 Mar 2023, Volker Rümelin wrote:
>>>> Where are these in the docs? I could not find it even by searching under 
>>>> qemu/docs.
>>> 
>>> https://www.qemu.org/docs/master/system/invocation.html
>>> 
>>> Please search for coreaudio or alsa.
>> 
>> OK, that's basically the -help output, I've found it in qemu-options.hx in 
>> the source. But these don't quite tell me what those options are. E.g. for 
>> alsa:
>> 
>> in|out.period-length=usecs
>>     Sets the period length in microseconds.
>> 
>> in|out.try-poll=on|off
>>     Attempt to use poll mode with the device. Default is on.
>> 
>> But what is period length or poll mode and when do I have to tweak those 
>> and what are meaningful values? You've told me before that the crackling I 
>> get with alsa is because of try-poll and better turn that off. Why is the 
>> default on then? Can we set it to off by default? (I could try to make a 
>> patch but I don't know if that would make sense at all.) So maybe what's 
>> missing is some generic description on how all this works and what the 
>> parameters control in the big picture. I'm not saying you have to write 
>> that but if you are the only one who knows now then maybe nobody else can 
>> write that doc. If there are somebody else who knows these it would help to 
>> get some introduction somewhere we can refer to.
>
> A large default period-length was responsible for the crackling. The unknown 
> guest side audio buffer size determines how often QEMU has to read from the 
> guest audio buffer. In your case period-length + timer-period was larger than 
> the guest buffer size.

Without knowing how all this works in QEMU so a generic description on 
what callbacks are used for what and when are they called (what is the 
audio timer and is period length related to that or something else, etc.) 
I still don't understand all this. Such general intro doc is missing or I 
don't know where to look for it.

> try-poll=on tells the ALSA backend to try to use an event loop instead of the 
> audio timer. This works most of the time. But the poll event handler in the 
> ALSA backend has a bug. For example, if the guest can't provide enough audio 
> frames in time, the ALSA buffer is only partly full and the event handler 
> will be called again and again on every iteration of the main loop. This 
> increases the processor load and the guest has less processor time to provide 
> new audio frames in time. I have two examples where a guest can't recover 
> from this situation and the guest seems to hang.

Is this bug tracked somewhere or is it something that you know about from 
heresay? Maybe somebody would attempt to fix it if it were understood but 
for me at least it's not clear from the above what the actual bug is and 
what could be a fix I could try to implement.

> ALSA poll mode was added in 2009 and no one complained so far. I don't think

Most distros have pulseaudio so maybe people haven't noticed because of 
that. I've only noticed it because I got rid of pulsaudio as it seems to 
solve a problem I don't have so I only use plain alsa for simple things or 
for more complex things there's jack so no reason to use pulseaudio.

> it's necessary to change the default. Also instead of changing the default, 
> it would be better to fix the bug. Btw., the author of the sndio backend got 
> it right.

Sure it would be better to fix that bug but is there anybody besides you 
who knows about it and understands it so it can be fixed?

> Better audio documentation would certainly be helpful for other developers. 
> But I am not the only one who knows the audio code. The audio code is not 
> difficult to understand either.

Any code is not difficult if you spend enough time with it. But if you've 
spent that time already you could help save time for others by summarising 
the knowledge to help others get started without having to spend much time 
getting to know the audio part of QEMU when they would rather spend time 
with other parts instead. But it's not a demand just trying to say that 
somebody who knows this part and improving the docs might help others to 
understand audio part better and maybe even contribute to it but now even 
using it can be difficult without understanding how it all works.

> However, I am not so sure if a more detailed description of the audio options 
> will really help QEMU users. It would be more helpful to have less audio 
> options that need to be tuned to each other. In my opinion the options 
> timer-period and latency would be sufficient in all cases to tune the audio 
> system to the guest.

Of course best would be if it would just work but if it doesn't it still 
helps to understand what's going on and what are the options to tune that 
might fix it. If the problem is an unknown guest side buffer is there a 
way to find this out from the emulated hardware (sound card models) so 
those could tell it to the audio part or somehow measuring the amount of 
data the guest is sending so the period can be adjusted automatically? 
(I'm completely guessing here without knowing how this really works so 
can't tell if any of these could work but maybe discussing the problem 
could inspire somebody to try to make a patch eventually.)

Regards,
BALATON Zoltan
--3866299591-1212146240-1679240897=:19083--

