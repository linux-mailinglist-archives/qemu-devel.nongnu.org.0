Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97ED6C9744
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 19:48:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgURk-00060r-SR; Sun, 26 Mar 2023 13:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pgURj-00060j-7l
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:46:23 -0400
Received: from mailout07.t-online.de ([194.25.134.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pgURg-0007KL-QQ
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:46:23 -0400
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout07.t-online.de (Postfix) with SMTP id C3C0066E0;
 Sun, 26 Mar 2023 19:46:15 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd82.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pgURX-21Tngf0; Sun, 26 Mar 2023 19:46:12 +0200
Message-ID: <981db26c-a96d-4e40-1f6f-577eaee9466e@t-online.de>
Date: Sun, 26 Mar 2023 19:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Rene Engel <ReneEngel80@emailn.de>, qemu-devel@nongnu.org
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
 <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
 <b80d09c7-b9e6-debe-9678-f6ac3bbed388@eik.bme.hu>
 <f1ec050c-7315-aae5-b377-1f99b057045c@t-online.de>
Content-Language: en-US
In-Reply-To: <f1ec050c-7315-aae5-b377-1f99b057045c@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1679852772-7A86BC36-FC0CCF37/0/0 CLEAN NORMAL
X-TOI-MSGID: b3682042-1a18-479a-ad30-d86a7df23193
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 19.03.23 um 21:03 schrieb Volker Rümelin:
> Am 19.03.23 um 18:49 schrieb BALATON Zoltan:
>>
>> Not sure this helps but I get these with DEBUG enabled in qemu/audio 
>> on Linux host with alsa set to 44100 Hz dmix rate with default 
>> settings without any -audiodev options with AmigaOS guest.
>> With pegasos2:
>>
>> audio: open via-ac97.out, freq 44100, nchannels 1, fmt 
>> 1##############] 100 %
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
>> this does not play as slow as with sam460ex below but maybe a bit 
>> slow which seems to improve with try-poll=off so this may be because 
>> of the alsa backend issue. It's a bit faster with sdl backend, not 
>> sure if that's the right speed or too fast but at least the backend 
>> seems to influence playback speed.
>>
>
> Hi,
>
> I still don't understand how the playback speed can slow down without 
> changing the pitch. Is it possible that the guest can't provide the 
> audio frames fast enough and there are buffer underruns in the ALSA 
> backend? But I think you would hear buffer underruns.
>
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
>> this plays definitely slow and the freq also seems to be off. I may 
>> have different AmigaOS versions on pegasos2 and sam460ex but I they 
>> seem to use the same driver as there were no updates to that part. 
>> I'm not sure what the driver in AmigaOS looks like but it may be 
>> similar to the AROS AHI SB128 one. I don't know if higher level parts 
>> in AHI may try to measure something like you mentioned but at least 
>> the card driver does not seem to do that.
>
> I had a look at the AROS SB128 driver and the AHI Preferences code. 
> There is no code to measure the audio clock frequency. The frequency 
> selection of 48662Hz seems to be a AROS/AmigaOS bug. This log is from 
> a AROS x86 guest. I hear some faint static noise but the playback 
> speed is correct.
>
> open pcspk, freq 32000, nchannels 1, fmt 0
> open es1370.dac2, freq 44100, nchannels 1, fmt 0
> open es1370.adc, freq 44100, nchannels 1, fmt 0
> open es1370.dac2, freq 48662, nchannels 1, fmt 0
> open es1370.adc, freq 48662, nchannels 1, fmt 0
> open es1370.dac2, freq 48662, nchannels 2, fmt 3
> open es1370.dac2, freq 44100, nchannels 2, fmt 3
> open es1370.adc, freq 44100, nchannels 1, fmt 0
>
>>
>> There seems to be two independent problems, one is the bug in alsa 
>> backend that you mentioned and something else only affecting sam460ex 
>> which causes the wrong freq to be selected but I have no idea why or 
>> what to check further to find out. 
>
> I'm not so sure if your analysis is correct. The ALSA error I 
> mentioned can significantly increase the processor load, sometimes to 
> the point of stopping the guest. But it can't directly change the 
> playback speed.
>
> I will write a patch with a few tracepoints for the audio system. With 
> your help it should be possible to find the cause of the problem. It 
> might take me a few days to write and test the patch.
>
> With best regards,
> Volker

Hi Zoltan,

I have written a few patches to add audio tracepoints. I pushed my 
audio-tracepoints branch to https://gitlab.com/volker.ruemelin/qemu.git.

For useful audio trace files QEMU has to be compiled with 
--enable-trace-backends=simple to enable the "simple" trace backend. The 
command line options  -trace "audio_open*_out" -trace 
"audio_*_frames_out" -trace file=/tmp/qemu-trace enable audio playback 
tracing. To view the trace start ./scripts/simpletrace.py 
trace/trace-events-all /tmp/qemu-trace | less in the QEMU build directory.

Here is an example of audio playback of a mp3 file with mplayer in a x86 
AROS guest. I used -device ES1370,audiodev=audio0 -audiodev 
alsa,id=audio0,out.try-poll=off,out.dev=hw:PCH,,0,in.try-poll=off,in.dev=hw:PCH,,0

audio_open_out 0.000 pid=8798 card=b'es1370' name=b'es1370.dac2' 
freq=0xac44 fmt=b'u8' ch=0x1
audio_open_info_out 249624.597 pid=8798 end=b'sw' card=b'es1370' 
name=b'es1370.dac2' freq=0xac44 ch=0x1 bits=0x8 is_signed=0x0 is_fl
oat=0x0
audio_open_info_out 0.853 pid=8798 end=b'hw' card=b'es1370' 
name=b'es1370.dac2' freq=0xac44 ch=0x2 bits=0x10 is_signed=0x1 is_float=
0x0
audio_open_out 52404.954 pid=8798 card=b'es1370' name=b'es1370.dac2' 
freq=0xac44 fmt=b's16' ch=0x2
audio_open_info_out 10.985 pid=8798 end=b'sw' card=b'es1370' 
name=b'es1370.dac2' freq=0xac44 ch=0x2 bits=0x10 is_signed=0x1 is_float
=0x0
audio_open_info_out 0.606 pid=8798 end=b'hw' card=b'es1370' 
name=b'es1370.dac2' freq=0xac44 ch=0x2 bits=0x10 is_signed=0x1 is_float=
0x0
audio_fe_frames_out 10145.216 pid=8798 fe_free=0x1000 fe_written=0x1
audio_hw_frames_out 21.720 pid=8798 hw_free=0x1000 hw_written=0x1
audio_fe_frames_out 10090.675 pid=8798 fe_free=0x1000 fe_written=0x372
audio_hw_frames_out 11.752 pid=8798 hw_free=0x1000 hw_written=0x372
audio_fe_frames_out 10051.461 pid=8798 fe_free=0xdae fe_written=0x371
audio_hw_frames_out 5.026 pid=8798 hw_free=0xdae hw_written=0x371
audio_fe_frames_out 10041.808 pid=8798 fe_free=0xc1e fe_written=0x1
audio_hw_frames_out 5.089 pid=8798 hw_free=0xc1e hw_written=0x1
audio_fe_frames_out 10065.035 pid=8798 fe_free=0xe2d fe_written=0x372
audio_hw_frames_out 5.797 pid=8798 hw_free=0xe2d hw_written=0x372
audio_fe_frames_out 10051.544 pid=8798 fe_free=0xbca fe_written=0x371

Could you create a trace with sam460ex and ES1370? Please use mplayer or 
another media player for the traces. The audio buffer from the AHI 
Preferences is very small. It may be impossible to make the test sound 
play correctly.

It's not necessary to send the whole trace file. I would like to see the 
audio_open_* lines and 40-50 audio_*_frames_out lines one or two seconds 
after playback started. The trace file time stamps are in microseconds.

With best regards,
Volker

