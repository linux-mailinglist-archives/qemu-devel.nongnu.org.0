Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92616C04C1
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 21:20:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdzUg-0005pP-VB; Sun, 19 Mar 2023 16:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pdzUd-0005n1-RU
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 16:19:03 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pdzUb-0000Ro-He
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 16:19:03 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 172E8746392;
 Sun, 19 Mar 2023 21:18:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B4AB3745712; Sun, 19 Mar 2023 21:18:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B215B7456E3;
 Sun, 19 Mar 2023 21:18:22 +0100 (CET)
Date: Sun, 19 Mar 2023 21:18:22 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>
cc: Rene Engel <ReneEngel80@emailn.de>, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
In-Reply-To: <f1ec050c-7315-aae5-b377-1f99b057045c@t-online.de>
Message-ID: <db850619-ea3d-10e1-d32c-57f35cd17bec@eik.bme.hu>
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
 <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
 <b80d09c7-b9e6-debe-9678-f6ac3bbed388@eik.bme.hu>
 <f1ec050c-7315-aae5-b377-1f99b057045c@t-online.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-853592234-1679257102=:90307"
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

--3866299591-853592234-1679257102=:90307
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 19 Mar 2023, Volker Rümelin wrote:
> Am 19.03.23 um 18:49 schrieb BALATON Zoltan:
>> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>>> Am 12.03.23 um 15:09 schrieb Rene Engel:
>>>> Tested with -audiodev coreaudio,id=audio0,out.buffer-count=1 to 12
>>>> 
>>>> 1 is too slow the rest up to 12 has no effect
>>>> 
>>>> The sampling frequency of the via-ac97 driver is 48000 Hz under 
>>>> AmigaOs4.1
>>>> 
>>>> Any other ideas?
>>>> 
>>>> 
>>> 
>>> In audio/audio_template.h in the AUD_open_ functions there is one
>>> 
>>>     ldebug ("open %s, freq %d, nchannels %d, fmt %d\n",
>>>             name, as->freq, as->nchannels, as->fmt);
>>> 
>>> line. Please replace this line with
>>> 
>>>     fprintf(stderr, "open %s, freq %d, nchannels %d, fmt %d\n",
>>>             name, as->freq, as->nchannels, as->fmt);
>>> 
>>> compile and start AmigaOS. Use the default out.buffer-count. I would like 
>>> to know the via-ac97 drivers idea of the sampling frequency.
>> 
>> Not sure this helps but I get these with DEBUG enabled in qemu/audio on 
>> Linux host with alsa set to 44100 Hz dmix rate with default settings 
>> without any -audiodev options with AmigaOS guest.
>> With pegasos2:
>> 
>> audio: open via-ac97.out, freq 44100, nchannels 1, fmt 1##############] 100 
>> %
>> audio: open via-ac97.out, freq 44100, nchannels 2, fmt 3
>> alsa: enabling voice
>> alsa: disabling voice
>> alsa: alsa_fini
>> 
>> or pegasos2 with ES1370:
>> 
>> audio: open via-ac97.out, freq 44100, nchannels 2, fmt 3
>> alsa: enabling voice
>> alsa: disabling voice
>> alsa: alsa_fini
>> 
>> this does not play as slow as with sam460ex below but maybe a bit slow 
>> which seems to improve with try-poll=off so this may be because of the alsa 
>> backend issue. It's a bit faster with sdl backend, not sure if that's the 
>> right speed or too fast but at least the backend seems to influence 
>> playback speed.
>> 
>
> Hi,
>
> I still don't understand how the playback speed can slow down without 
> changing the pitch.

The pitch also changes when it's playing slow but sometimes the speed 
difference is not too big so pitch shift maybe not obvious.

> Is it possible that the guest can't provide the audio 
> frames fast enough and there are buffer underruns in the ALSA backend? But I 
> think you would hear buffer underruns.

I think we'll need your logging patch to verify this. Or are there some 
traces that I can enable to check this?

>> With sam460ex and ES1370:
>> 
>> audio: open es1370.dac2, freq 44100, nchannels 1, fmt 0
>> audio: open es1370.adc, freq 44100, nchannels 1, fmt 0
>> audio: open es1370.dac2, freq 48662, nchannels 1, fmt 0
>> audio: open es1370.adc, freq 48662, nchannels 1, fmt 0
>> audio: open es1370.dac2, freq 48662, nchannels 2, fmt 3
>> alsa: enabling voice
>> alsa: disabling voice
>> alsa: alsa_fini
>> 
>> this plays definitely slow and the freq also seems to be off. I may have 
>> different AmigaOS versions on pegasos2 and sam460ex but I they seem to use 
>> the same driver as there were no updates to that part. I'm not sure what 
>> the driver in AmigaOS looks like but it may be similar to the AROS AHI 
>> SB128 one. I don't know if higher level parts in AHI may try to measure 
>> something like you mentioned but at least the card driver does not seem to 
>> do that.
>
> I had a look at the AROS SB128 driver and the AHI Preferences code. There is 
> no code to measure the audio clock frequency. The frequency selection of 
> 48662Hz seems to be a AROS/AmigaOS bug. This log is from a AROS x86 guest. I 
> hear some faint static noise but the playback speed is correct.
>
> open pcspk, freq 32000, nchannels 1, fmt 0
> open es1370.dac2, freq 44100, nchannels 1, fmt 0
> open es1370.adc, freq 44100, nchannels 1, fmt 0
> open es1370.dac2, freq 48662, nchannels 1, fmt 0
> open es1370.adc, freq 48662, nchannels 1, fmt 0
> open es1370.dac2, freq 48662, nchannels 2, fmt 3
> open es1370.dac2, freq 44100, nchannels 2, fmt 3
> open es1370.adc, freq 44100, nchannels 1, fmt 0

Here you end up with the correct freq but for me it stays at 48662 on 
sam460ex so could that explain a speed difference? Also selecting 
different sound options in AHI Prefs the test sound sounds quite different 
which probably should not if only the resolution or freq is changed but 
I'm not sure what the options really set.

>> There seems to be two independent problems, one is the bug in alsa backend 
>> that you mentioned and something else only affecting sam460ex which causes 
>> the wrong freq to be selected but I have no idea why or what to check 
>> further to find out. 
>
> I'm not so sure if your analysis is correct. The ALSA error I mentioned can 
> significantly increase the processor load, sometimes to the point of stopping 
> the guest. But it can't directly change the playback speed.

What I meant is we likely have multiple issues (and the slow speed on 
sam460ex may even be a guest bug if that's because using 48662 instead of 
44100 Hz) but just changing the audiodev and it's options I hear different 
results on pegasos2 which does not play that slow as sam460ex so this may 
be some alsa backend issue.

I've looked at the alsa and sndio backends to see if I can find what the 
issue with poll may be but since I don't know how it works I can't fix it. 
What I've noticed is that the sndio backend seems to remove the poll 
calbacks while handling the previous poll results and reenable them 
afterwards. Would the alsa backend need some flag that is set after 
handling poll results so while this is set the poll callback would return 
instead of calling the handler again or it really needs to be removed and 
reinstalled every time? (Or maybe it's not even the issue you were hinting 
at.)

> I will write a patch with a few tracepoints for the audio system. With your 
> help it should be possible to find the cause of the problem. It might take me 
> a few days to write and test the patch.

Thanks for looking at it, let me know if I can test anything that could 
help.

Regards,
BALATON Zoltan
--3866299591-853592234-1679257102=:90307--

