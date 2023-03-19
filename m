Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6C6C04A9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 21:04:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdzFM-0002Iu-3q; Sun, 19 Mar 2023 16:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pdzFJ-0002IU-Ro
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 16:03:13 -0400
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pdzFH-0002xb-Mg
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 16:03:13 -0400
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout01.t-online.de (Postfix) with SMTP id CE4BB16572;
 Sun, 19 Mar 2023 21:03:07 +0100 (CET)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pdzFC-2OMi370; Sun, 19 Mar 2023 21:03:06 +0100
Message-ID: <f1ec050c-7315-aae5-b377-1f99b057045c@t-online.de>
Date: Sun, 19 Mar 2023 21:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Rene Engel <ReneEngel80@emailn.de>, kraxel@redhat.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
 <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
 <b80d09c7-b9e6-debe-9678-f6ac3bbed388@eik.bme.hu>
Content-Language: en-US
In-Reply-To: <b80d09c7-b9e6-debe-9678-f6ac3bbed388@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1679256186-437ECC4D-6D9B0E81/0/0 CLEAN NORMAL
X-TOI-MSGID: 02888a3d-1ddf-45b9-83f6-8fbe1e7b9b77
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
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

Am 19.03.23 um 18:49 schrieb BALATON Zoltan:
> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>> Am 12.03.23 um 15:09 schrieb Rene Engel:
>>> Tested with -audiodev coreaudio,id=audio0,out.buffer-count=1 to 12
>>>
>>> 1 is too slow the rest up to 12 has no effect
>>>
>>> The sampling frequency of the via-ac97 driver is 48000 Hz under 
>>> AmigaOs4.1
>>>
>>> Any other ideas?
>>>
>>>
>>
>> In audio/audio_template.h in the AUD_open_ functions there is one
>>
>>     ldebug ("open %s, freq %d, nchannels %d, fmt %d\n",
>>             name, as->freq, as->nchannels, as->fmt);
>>
>> line. Please replace this line with
>>
>>     fprintf(stderr, "open %s, freq %d, nchannels %d, fmt %d\n",
>>             name, as->freq, as->nchannels, as->fmt);
>>
>> compile and start AmigaOS. Use the default out.buffer-count. I would 
>> like to know the via-ac97 drivers idea of the sampling frequency.
>
> Not sure this helps but I get these with DEBUG enabled in qemu/audio 
> on Linux host with alsa set to 44100 Hz dmix rate with default 
> settings without any -audiodev options with AmigaOS guest.
> With pegasos2:
>
> audio: open via-ac97.out, freq 44100, nchannels 1, fmt 
> 1##############] 100 %
> audio: open via-ac97.out, freq 44100, nchannels 2, fmt 3
> alsa: enabling voice
> alsa: disabling voice
> alsa: alsa_fini
>
> or pegasos2 with ES1370:
>
> audio: open via-ac97.out, freq 44100, nchannels 2, fmt 3
> alsa: enabling voice
> alsa: disabling voice
> alsa: alsa_fini
>
> this does not play as slow as with sam460ex below but maybe a bit slow 
> which seems to improve with try-poll=off so this may be because of the 
> alsa backend issue. It's a bit faster with sdl backend, not sure if 
> that's the right speed or too fast but at least the backend seems to 
> influence playback speed.
>

Hi,

I still don't understand how the playback speed can slow down without 
changing the pitch. Is it possible that the guest can't provide the 
audio frames fast enough and there are buffer underruns in the ALSA 
backend? But I think you would hear buffer underruns.

> With sam460ex and ES1370:
>
> audio: open es1370.dac2, freq 44100, nchannels 1, fmt 0
> audio: open es1370.adc, freq 44100, nchannels 1, fmt 0
> audio: open es1370.dac2, freq 48662, nchannels 1, fmt 0
> audio: open es1370.adc, freq 48662, nchannels 1, fmt 0
> audio: open es1370.dac2, freq 48662, nchannels 2, fmt 3
> alsa: enabling voice
> alsa: disabling voice
> alsa: alsa_fini
>
> this plays definitely slow and the freq also seems to be off. I may 
> have different AmigaOS versions on pegasos2 and sam460ex but I they 
> seem to use the same driver as there were no updates to that part. I'm 
> not sure what the driver in AmigaOS looks like but it may be similar 
> to the AROS AHI SB128 one. I don't know if higher level parts in AHI 
> may try to measure something like you mentioned but at least the card 
> driver does not seem to do that.

I had a look at the AROS SB128 driver and the AHI Preferences code. 
There is no code to measure the audio clock frequency. The frequency 
selection of 48662Hz seems to be a AROS/AmigaOS bug. This log is from a 
AROS x86 guest. I hear some faint static noise but the playback speed is 
correct.

open pcspk, freq 32000, nchannels 1, fmt 0
open es1370.dac2, freq 44100, nchannels 1, fmt 0
open es1370.adc, freq 44100, nchannels 1, fmt 0
open es1370.dac2, freq 48662, nchannels 1, fmt 0
open es1370.adc, freq 48662, nchannels 1, fmt 0
open es1370.dac2, freq 48662, nchannels 2, fmt 3
open es1370.dac2, freq 44100, nchannels 2, fmt 3
open es1370.adc, freq 44100, nchannels 1, fmt 0

>
> There seems to be two independent problems, one is the bug in alsa 
> backend that you mentioned and something else only affecting sam460ex 
> which causes the wrong freq to be selected but I have no idea why or 
> what to check further to find out. 

I'm not so sure if your analysis is correct. The ALSA error I mentioned 
can significantly increase the processor load, sometimes to the point of 
stopping the guest. But it can't directly change the playback speed.

I will write a patch with a few tracepoints for the audio system. With 
your help it should be possible to find the cause of the problem. It 
might take me a few days to write and test the patch.

With best regards,
Volker

>
>
> Regards,
> BALATON Zoltan


