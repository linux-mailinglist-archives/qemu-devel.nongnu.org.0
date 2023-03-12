Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DE6B67B5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 16:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbO13-0001bP-II; Sun, 12 Mar 2023 11:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbO10-0001au-8Y
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 11:53:42 -0400
Received: from mailout05.t-online.de ([194.25.134.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbO0x-0002v6-Ey
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 11:53:41 -0400
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout05.t-online.de (Postfix) with SMTP id A4A423399;
 Sun, 12 Mar 2023 16:53:34 +0100 (CET)
Received: from [192.168.211.200] ([79.208.22.72]) by fwd78.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pbO0r-1hyhdp0; Sun, 12 Mar 2023 16:53:33 +0100
Message-ID: <bd66788e-c9bf-d324-8a82-c2467276cfdf@t-online.de>
Date: Sun, 12 Mar 2023 16:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
Content-Language: en-US
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
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <e85a87ae-dfe4-8fc0-85df-300be676225f@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678636413-DCB4C4E4-18F94492/0/0 CLEAN NORMAL
X-TOI-MSGID: ab1a398b-522c-4381-80a5-f433491520d9
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 12.03.23 um 16:34 schrieb BALATON Zoltan:
> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>> Am 12.03.23 um 14:23 schrieb BALATON Zoltan:
>>> On Sun, 12 Mar 2023, Volker Rümelin wrote:
>>>> Am 11.03.23 um 23:54 schrieb BALATON Zoltan:
>>>>> Hello,
>>>>>
>>>>> I've noticed before that since commit a806f95904cdb audio plays 
>>>>> slower (like half speed) under AmigaOS on sam460ex with ES1370 but 
>>>>> I did not have any other guests to reproduce it and verify this 
>>>>> with so I did not report that yet. Now that we can also test with 
>>>>> pegasos2 and via-ac97 it does not play slower on that machine 
>>>>> neither with ES1370 not via-ac97 but still can reproduce it with 
>>>>> sam460ex.
>>>>>
>>>>> But on another host it seems to play faster with pegasos2. Here is 
>>>>> a video taken by Rene demonstrating the problem: 
>>>>> https://youtu.be/Rg5buzDqGuk So there seems to be a problem with 
>>>>> playback speed here but I'm not sure if this is related to AmigaOS 
>>>>> or something else.
>>>>>
>>>>> At least we have some issue with AmigaOS on sam460ex and ES1370 
>>>>> playing too slow since commit a806f95904cdb on Linux with alsa 
>>>>> backend and may also have an issue with sound being too fast on 
>>>>> pegasos2 with coreaudio. However Rene said that recording it with 
>>>>> a screen recorder did not show the problem, only when playing it 
>>>>> normally, that's why the video is taken with a camera. I can't 
>>>>> understand how that's possible but maybe you have some idea to at 
>>>>> least how to test this further to find out more what's happening 
>>>>> here or if you can see anything that can cause playback speed 
>>>>> issues with these machines.
>>>>>
>>>>> So far I've reproduced obviously slow speed with AmigaOS on 
>>>>> sam460ex with ES1370 on Linux with alsa. The MorphOS and AmigaOS 
>>>>> on pegasos2 with via-ac97 or ES1370 (latter only works with 
>>>>> AmigaOS) seems to be OK to me on my machine but is playing too 
>>>>> fast in Rene's video.
>>>>>
>>>>> Could this be related to some differentce in host's sampling rate 
>>>>> or some other settings somewhere? I have defaults.pcm.dmix.rate 
>>>>> 44100 in /etc/asound.conf while Rene is using whatever macOS does 
>>>>> with coreaudio.
>>>>> Any ideas what to check further?
>>>>
>>>> Hi,
>>>>
>>>> perhaps this issue is similar to the Linux guest driver issue with 
>>>> an AC97 device. The Linux driver tries to measure the AC97 clock 
>>>> frequency. It starts playback with a certain amount of audio frames 
>>>> and measures the time needed for playback. Since QEMU is not a 
>>>> cycle exact simulation the result is always wrong. Before my 
>>>> latency reducing patches the result was always way off and the 
>>>> Linux driver rejected the measurement and used a clock frequency of 
>>>> 48000Hz. Now the driver sometimes believes the measurement is 
>>>> correct and adjusts the clock frequency.
>>>
>>> I don't think that's the case with the AmigaOS driver. I don't know 
>>> for sure what exactly does that driver do but it is probably 
>>> similiar to the AROS driver which is here (the via-ac97 is one level 
>>> up from that): 
>>> https://github.com/aros-development-team/AROS/tree/master/workbench/devs/AHI/Drivers/SB128 
>>> and I don's see anything like that in it. AROS doesn't run on 
>>> pegasos2 yet so I can't test with that. It should work with sam460ex 
>>> which I've tried but the SB128 driver used for ES1370 seems to have 
>>> endianness problems and only works on pc machine, not on big-endian 
>>> PPC machines (a lot of AROS network drivers have the same problem, 
>>> these seem to be mostly tested on PC only). On sam460ex it detects 
>>> the card but doesn't make sound but works with on the pc machine.
>>>
>>> But the question remains how commit a806f95904cdb could change 
>>> playback speed as the problem with sam460ex is bisectable to that 
>>> commit.
>>
>> To change the playback speed you have to remove or add audio frames 
>> from or to the audio stream. At the moment I don't see how this patch 
>> can change the playback speed. I also don't see how this patch could 
>> change the audio backend sample frequency. Do you think there is a 
>> way to reproduce this issue on my computer?
>
> The reproducer I know needs AmigaOS license for sam460ex. If you don't 
> have that maybe it can be also reproduced with Linux guest but I don't 
> know a good distro that supported sam460ex (current ones probably 
> don't as PPC32 is quite dead so maybe some older ones). The 
> manufacturer's site:
> https://www.acube-systems.biz/index.php?page=hardware&pid=5
> links to a site in downloads section with some Linux kernels but these 
> seem to be outdated and don't know which could work. AROS should have 
> a similar driver and I thought that could help but it does not make 
> sound likely due to endianness issues as I've wrote before. So this is 
> probably doesn't help much as the only easy way I know needs a closed 
> source OS.

Debugging will be slow without a reproducer on my computer. I'll have a 
look at the link you provided.

>
>>>> This can be fixed with the kernel command-line argument 
>>>> snd_intel8x0.ac97_clock=48000.
>>>>
>>>> If AmigaOS also tries to measure the audio clock frequency, it may 
>>>> help to increase the playback latency to make the measurement 
>>>> worse. I would start with -audiodev 
>>>> coreaudio,id=audio0,out.buffer-count=12. The default buffer count 
>>>> is 4.
>>>
>>> Are these options documented somewhere? I don't even know they exist 
>>> and which one to tune for different results so if this knowledge is 
>>> only something you have now it would be a great contribution to put 
>>> it in some docs for reference. Or if this is already described 
>>> somewhere maybe it should be made more prominent as I don't even 
>>> know where to look for it. Maybe also some generic intro on how the 
>>> audio infrastructure in QEMU works would be helpful too so one can 
>>> understand what the options tweak.
>>
>> The QEMU documentation describes most of the options. But there is no 
>> detailed description of the function. I have read the code.
>
> Where are these in the docs? I could not find it even by searching 
> under qemu/docs.

https://www.qemu.org/docs/master/system/invocation.html

Please search for coreaudio or alsa.

>
> Regards,
> BALATON Zoltan


