Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F414D6C01C0
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 13:51:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdsU7-0003qE-Kq; Sun, 19 Mar 2023 08:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pdsU5-0003pw-6b
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 08:50:01 -0400
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pdsU2-0006xI-E1
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 08:50:00 -0400
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout01.t-online.de (Postfix) with SMTP id 042FD1B0D0;
 Sun, 19 Mar 2023 13:49:22 +0100 (CET)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd83.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pdsTQ-0Zs3Yv0; Sun, 19 Mar 2023 13:49:21 +0100
Message-ID: <c9144021-696a-7895-9a26-a923e37cfe55@t-online.de>
Date: Sun, 19 Mar 2023 13:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Rene Engel <ReneEngel80@emailn.de>, qemu-devel@nongnu.org
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <8eb20cbf-f922-de5e-a36a-f4041d332774@t-online.de>
 <e85a87ae-dfe4-8fc0-85df-300be676225f@eik.bme.hu>
 <bd66788e-c9bf-d324-8a82-c2467276cfdf@t-online.de>
 <7de440c4-a11a-4805-0e6f-75850e4f0938@eik.bme.hu>
Content-Language: en-US
In-Reply-To: <7de440c4-a11a-4805-0e6f-75850e4f0938@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1679230161-432C3378-63E86C36/0/0 CLEAN NORMAL
X-TOI-MSGID: 7de1fe2b-23e1-494c-b0e3-cb5b463f5751
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

Am 12.03.23 um 21:28 schrieb BALATON Zoltan:
> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>> Am 12.03.23 um 16:34 schrieb BALATON Zoltan:
>>> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>>>> Am 12.03.23 um 14:23 schrieb BALATON Zoltan:
>>>>> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>>>>>> Am 11.03.23 um 23:54 schrieb BALATON Zoltan:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I've noticed before that since commit a806f95904cdb audio plays 
>>>>>>> slower (like half speed) under AmigaOS on sam460ex with ES1370 
>>>>>>> but I did not have any other guests to reproduce it and verify 
>>>>>>> this with so I did not report that yet. Now that we can also 
>>>>>>> test with pegasos2 and via-ac97 it does not play slower on that 
>>>>>>> machine neither with ES1370 not via-ac97 but still can reproduce 
>>>>>>> it with sam460ex.
>>>>>>>
>>>>>>> But on another host it seems to play faster with pegasos2. Here 
>>>>>>> is a video taken by Rene demonstrating the problem: 
>>>>>>> https://youtu.be/Rg5buzDqGuk So there seems to be a problem with 
>>>>>>> playback speed here but I'm not sure if this is related to 
>>>>>>> AmigaOS or something else.
>>>>>>>
>>>>>>> At least we have some issue with AmigaOS on sam460ex and ES1370 
>>>>>>> playing too slow since commit a806f95904cdb on Linux with alsa 
>>>>>>> backend and may also have an issue with sound being too fast on 
>>>>>>> pegasos2 with coreaudio. However Rene said that recording it 
>>>>>>> with a screen recorder did not show the problem, only when 
>>>>>>> playing it normally, that's why the video is taken with a 
>>>>>>> camera. I can't understand how that's possible but maybe you 
>>>>>>> have some idea to at least how to test this further to find out 
>>>>>>> more what's happening here or if you can see anything that can 
>>>>>>> cause playback speed issues with these machines.
>>>>>>>
>>>>>>> So far I've reproduced obviously slow speed with AmigaOS on 
>>>>>>> sam460ex with ES1370 on Linux with alsa. The MorphOS and AmigaOS 
>>>>>>> on pegasos2 with via-ac97 or ES1370 (latter only works with 
>>>>>>> AmigaOS) seems to be OK to me on my machine but is playing too 
>>>>>>> fast in Rene's video.
>>>>>>>
>>>>>>> Could this be related to some differentce in host's sampling 
>>>>>>> rate or some other settings somewhere? I have 
>>>>>>> defaults.pcm.dmix.rate 44100 in /etc/asound.conf while Rene is 
>>>>>>> using whatever macOS does with coreaudio.
>>>>>>> Any ideas what to check further?
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> perhaps this issue is similar to the Linux guest driver issue 
>>>>>> with an AC97 device. The Linux driver tries to measure the AC97 
>>>>>> clock frequency. It starts playback with a certain amount of 
>>>>>> audio frames and measures the time needed for playback. Since 
>>>>>> QEMU is not a cycle exact simulation the result is always wrong. 
>>>>>> Before my latency reducing patches the result was always way off 
>>>>>> and the Linux driver rejected the measurement and used a clock 
>>>>>> frequency of 48000Hz. Now the driver sometimes believes the 
>>>>>> measurement is correct and adjusts the clock frequency.
>>>>>
>>>>> I don't think that's the case with the AmigaOS driver. I don't 
>>>>> know for sure what exactly does that driver do but it is probably 
>>>>> similiar to the AROS driver which is here (the via-ac97 is one 
>>>>> level up from that): 
>>>>> https://github.com/aros-development-team/AROS/tree/master/workbench/devs/AHI/Drivers/SB128 
>>>>> and I don's see anything like that in it. AROS doesn't run on 
>>>>> pegasos2 yet so I can't test with that. It should work with 
>>>>> sam460ex which I've tried but the SB128 driver used for ES1370 
>>>>> seems to have endianness problems and only works on pc machine, 
>>>>> not on big-endian PPC machines (a lot of AROS network drivers have 
>>>>> the same problem, these seem to be mostly tested on PC only). On 
>>>>> sam460ex it detects the card but doesn't make sound but works with 
>>>>> on the pc machine.
>>>>>
>>>>> But the question remains how commit a806f95904cdb could change 
>>>>> playback speed as the problem with sam460ex is bisectable to that 
>>>>> commit.
>>>>
>>>> To change the playback speed you have to remove or add audio frames 
>>>> from or to the audio stream. At the moment I don't see how this 
>>>> patch can change the playback speed. I also don't see how this 
>>>> patch could change the audio backend sample frequency. Do you think 
>>>> there is a way to reproduce this issue on my computer?
>>>
>>> The reproducer I know needs AmigaOS license for sam460ex. If you 
>>> don't have that maybe it can be also reproduced with Linux guest but 
>>> I don't know a good distro that supported sam460ex (current ones 
>>> probably don't as PPC32 is quite dead so maybe some older ones). The 
>>> manufacturer's site:
>>> https://www.acube-systems.biz/index.php?page=hardware&pid=5
>>> links to a site in downloads section with some Linux kernels but 
>>> these seem to be outdated and don't know which could work. AROS 
>>> should have a similar driver and I thought that could help but it 
>>> does not make sound likely due to endianness issues as I've wrote 
>>> before. So this is probably doesn't help much as the only easy way I 
>>> know needs a closed source OS.
>>
>> Debugging will be slow without a reproducer on my computer. I'll have 
>> a look at the link you provided.
>
> Problem with most of those may be that they need an ATI Radeon 
> graphics card but we don't emulate it enough in QEMU yet to work with 
> those so it may be difficult to get those running. Maybe booting the 
> kernel from command line with -kernel and -append to get output on 
> serial could work as the boot selector used on sam460ex also misses a 
> way to edit options of menu items.
>
> The only other image that seems to boot with the default SM502 
> graphics I've found is this one: 
> https://mirrors.ircam.fr/pub/crux-ppc/2.7/crux-ppc-2.7a.iso
>
> but this has no sound support in its kernel so you may need to compile 
> it to add an ES1370 driver if one was available back then. The sources 
> and configs are on the iso but this does not seem to be an easy way 
> either.
>
> There may be other PPC Linux images that work but I don't know about 
> them as I was mostly focusing on Amiga like OSes and make sure they 
> run on sam460ex so did not test sound with Linux. I was trying to find 
> an easier way but I could only come up with the above.
>
> It's probably not a big issue now that pegasos2 also has sound, maybe 
> more people want to use that instead as it's faster.

Hi,

I tested the ES1370 device with a x86_64 Linux guest. Playback is glitch 
free and the playback speed is correct. At the moment I fail to see why 
the ES1370 device with a PPC Linux should work differently than with a 
x86_64 Linux. The device emulation code is exactly identical and the 
Linux driver code for PPC should behave like Linux driver code for x86_64.

I also tested the ES1370 device with an x86 AROS guest. I can't get the 
audio playback to work without glitches. I think I will start here. 
Maybe it's the same problem as the AmigaOS problem.

>
>>>>>> This can be fixed with the kernel command-line argument 
>>>>>> snd_intel8x0.ac97_clock=48000.
>>>>>>
>>>>>> If AmigaOS also tries to measure the audio clock frequency, it 
>>>>>> may help to increase the playback latency to make the measurement 
>>>>>> worse. I would start with -audiodev 
>>>>>> coreaudio,id=audio0,out.buffer-count=12. The default buffer count 
>>>>>> is 4.
>>>>>
>>>>> Are these options documented somewhere? I don't even know they 
>>>>> exist and which one to tune for different results so if this 
>>>>> knowledge is only something you have now it would be a great 
>>>>> contribution to put it in some docs for reference. Or if this is 
>>>>> already described somewhere maybe it should be made more prominent 
>>>>> as I don't even know where to look for it. Maybe also some generic 
>>>>> intro on how the audio infrastructure in QEMU works would be 
>>>>> helpful too so one can understand what the options tweak.
>>>>
>>>> The QEMU documentation describes most of the options. But there is 
>>>> no detailed description of the function. I have read the code.
>>>
>>> Where are these in the docs? I could not find it even by searching 
>>> under qemu/docs.
>>
>> https://www.qemu.org/docs/master/system/invocation.html
>>
>> Please search for coreaudio or alsa.
>
> OK, that's basically the -help output, I've found it in 
> qemu-options.hx in the source. But these don't quite tell me what 
> those options are. E.g. for alsa:
>
> in|out.period-length=usecs
>     Sets the period length in microseconds.
>
> in|out.try-poll=on|off
>     Attempt to use poll mode with the device. Default is on.
>
> But what is period length or poll mode and when do I have to tweak 
> those and what are meaningful values? You've told me before that the 
> crackling I get with alsa is because of try-poll and better turn that 
> off. Why is the default on then? Can we set it to off by default? (I 
> could try to make a patch but I don't know if that would make sense at 
> all.) So maybe what's missing is some generic description on how all 
> this works and what the parameters control in the big picture. I'm not 
> saying you have to write that but if you are the only one who knows 
> now then maybe nobody else can write that doc. If there are somebody 
> else who knows these it would help to get some introduction somewhere 
> we can refer to.

A large default period-length was responsible for the crackling. The 
unknown guest side audio buffer size determines how often QEMU has to 
read from the guest audio buffer. In your case period-length + 
timer-period was larger than the guest buffer size.

try-poll=on tells the ALSA backend to try to use an event loop instead 
of the audio timer. This works most of the time. But the poll event 
handler in the ALSA backend has a bug. For example, if the guest can't 
provide enough audio frames in time, the ALSA buffer is only partly full 
and the event handler will be called again and again on every iteration 
of the main loop. This increases the processor load and the guest has 
less processor time to provide new audio frames in time. I have two 
examples where a guest can't recover from this situation and the guest 
seems to hang.

ALSA poll mode was added in 2009 and no one complained so far. I don't 
think it's necessary to change the default. Also instead of changing the 
default, it would be better to fix the bug. Btw., the author of the 
sndio backend got it right.

Better audio documentation would certainly be helpful for other 
developers. But I am not the only one who knows the audio code. The 
audio code is not difficult to understand either.

However, I am not so sure if a more detailed description of the audio 
options will really help QEMU users. It would be more helpful to have 
less audio options that need to be tuned to each other. In my opinion 
the options timer-period and latency would be sufficient in all cases to 
tune the audio system to the guest.

With best regards,
Volker

>
> Regards,
> BALATON Zoltan


