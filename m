Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5B6CC9FF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 20:27:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phE1e-0002fy-PD; Tue, 28 Mar 2023 14:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1phE1X-0002em-Cz
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:26:23 -0400
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1phE1T-0002Nq-BO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:26:21 -0400
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout12.t-online.de (Postfix) with SMTP id C21411D341;
 Tue, 28 Mar 2023 20:26:14 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1phE1O-0cUIPx0; Tue, 28 Mar 2023 20:26:14 +0200
Message-ID: <9521731e-359b-f9fe-b4a5-21bdce3e1984@t-online.de>
Date: Tue, 28 Mar 2023 20:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
Content-Language: en-US
To: Rene Engel <ReneEngel80@emailn.de>
Cc: balaton@eik.bme.hu, qemu-devel@nongnu.org
References: <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
 <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
 <b80d09c7-b9e6-debe-9678-f6ac3bbed388@eik.bme.hu>
 <f1ec050c-7315-aae5-b377-1f99b057045c@t-online.de>
 <981db26c-a96d-4e40-1f6f-577eaee9466e@t-online.de>
 <a53db76d-aa94-4a95-0fe1-c8a469cc9086@eik.bme.hu>
 <56ae723446530739cc496afbb63991c7@mail.emailn.de>
 <ed7b48a6-42e2-0381-074e-9d774ecfa26f@t-online.de>
 <146a76841a0fc58eec972fe3c1cc34b0@mail.emailn.de>
 <9f77ce1a-a02e-365e-0d5b-a35a023e53d8@t-online.de>
 <0c71ee37c6d16abb23a03693381113d3@mail.emailn.de>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <0c71ee37c6d16abb23a03693381113d3@mail.emailn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1680027974-E7FFCC37-8E5ED571/0/0 CLEAN NORMAL
X-TOI-MSGID: e6865215-7692-48b7-977a-8e8f5588f10d
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
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

Am 28.03.23 um 16:37 schrieb Rene Engel:
> Sorry I was on the wrong branch.
> I forget that every time, however that is trace test performed with ac97 under Pegasos 2 Emulation with AmigaOs4.1, startsound played and an mp3 with TuneNet.
>
> audio_open_out 0.000 pid=8358 card=b'via-ac97' name=b'via-ac97.out' freq=0xac44 fmt=b's8' ch=0x1
> audio_open_info_out 52921.000 pid=8358 end=b'sw' card=b'via-ac97' name=b'via-ac97.out' freq=0xac44 ch=0x1 bits=0x8 is_signed=0x1 is_float=0x0
> audio_open_info_out 0.000 pid=8358 end=b'hw' card=b'via-ac97' name=b'via-ac97.out' freq=0xac44 ch=0x2 bits=0x20 is_signed=0x1 is_float=0x1
> audio_open_out 1019.000 pid=8358 card=b'via-ac97' name=b'via-ac97.out' freq=0xac44 fmt=b's16' ch=0x2
> audio_open_info_out 2.000 pid=8358 end=b'sw' card=b'via-ac97' name=b'via-ac97.out' freq=0xac44 ch=0x2 bits=0x10 is_signed=0x1 is_float=0x0
> audio_open_info_out 0.000 pid=8358 end=b'hw' card=b'via-ac97' name=b'via-ac97.out' freq=0xac44 ch=0x2 bits=0x20 is_signed=0x1 is_float=0x1
> audio_fe_frames_out 130352.000 pid=8358 fe_free=0x800 fe_written=0x372
> audio_hw_frames_out 2.000 pid=8358 hw_free=0x800 hw_written=0x372
> audio_fe_frames_out 10265.000 pid=8358 fe_free=0x68e fe_written=0x372
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x68e hw_written=0x372
> audio_fe_frames_out 11159.000 pid=8358 fe_free=0x51c fe_written=0x372
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x51c hw_written=0x372
> audio_fe_frames_out 10211.000 pid=8358 fe_free=0x3aa fe_written=0x372
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x3aa hw_written=0x372
> audio_fe_frames_out 10522.000 pid=8358 fe_free=0x238 fe_written=0x238
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x238 hw_written=0x238
> audio_fe_frames_out 10122.000 pid=8358 fe_free=0x200 fe_written=0x13a
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x200 hw_written=0x13a
> audio_fe_frames_out 10541.000 pid=8358 fe_free=0x2c6 fe_written=0x2c6
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x2c6 hw_written=0x2c6
> audio_fe_frames_out 10366.000 pid=8358 fe_free=0x200 fe_written=0xac
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x200 hw_written=0xac
> audio_fe_frames_out 10582.000 pid=8358 fe_free=0x354 fe_written=0x354
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x354 hw_written=0x354
> audio_fe_frames_out 10111.000 pid=8358 fe_free=0x200 fe_written=0x1e
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x200 hw_written=0x1e
> audio_fe_frames_out 10367.000 pid=8358 fe_free=0x3e2 fe_written=0x372
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x3e2 hw_written=0x372
> audio_fe_frames_out 10129.000 pid=8358 fe_free=0x270 fe_written=0x270
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x270 hw_written=0x270
> audio_fe_frames_out 10204.000 pid=8358 fe_free=0x200 fe_written=0x102
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x200 hw_written=0x102
> audio_fe_frames_out 10656.000 pid=8358 fe_free=0x2fe fe_written=0x2fe
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x2fe hw_written=0x2fe
> audio_fe_frames_out 10363.000 pid=8358 fe_free=0x200 fe_written=0x74
> audio_hw_frames_out 1.000 pid=8358 hw_free=0x200 hw_written=0x74
> audio_fe_frames_out 10436.000 pid=8358 fe_free=0x38c fe_written=0x372
> audio_hw_frames_out 0.000 pid=8358 hw_free=0x38c hw_written=0x372

Hi Rene,

it seems your Mac uses a 48kHz sample rate, although QEMU requested a 
44.1kHz sample rate. Could you add -audiodev 
coreaudio,id=audio0,out.frequency=48000 to your command line and test if 
the playback speed and pitch is now correct?

The default for out.frequency is 44100.

With best regards,
Volker

> --- Ursprüngliche Nachricht ---
> Von: Volker Rümelin <vr_qemu@t-online.de>
> Datum: 27.03.2023 21:12:42
> An: Rene Engel <ReneEngel80@emailn.de>
> Betreff: Re: Audio playback speed issue on sam460ex and pegasos2
>
>> Am 27.03.23 um 16:21 schrieb Rene Engel:
>>> I compiled the build from their git branch and enabled the audio trace,
>> but with this option the AmigaOs4.1 workbench does not start anymore and
>> stops with a load sign. Tested with ac97 it almost looks like the ac97 part
>> that used to stop AmigaOs4.1 is not included in your build.
>>> This is the command line I used:
>>>
>>> reneengel@Mac-Studio build % cd /Users/reneengel/qemuVolkerAudioPatch/build
>>> reneengel@Mac-Studio build % qemu-system-ppc -L pc-bios -M pegasos2
>> -bios /Volumes/BackUP/PegasosQemuDatein/pegasos2.rom -vga none -device sm501
>> -drive if=none,id=cd -m 1024 -device ide-cd,drive=cd,bus=ide.1 -drive if=none,id=hd,file=/Volumes/EXTREME\
>> SSD/hd1.img,format=raw -device ide-hd,drive=hd,bus=ide.0 -device rtl8139,netdev=network00
>> -netdev user,id=network00 -rtc base=localtime -display cocoa -serial stdio
>> -smp cores=1 -trace "audio_open*_out" -trace "audio_*_frames_out"
>> -trace file=/tmp/qemu-trace
>>
>> Is the current directory included in the macOS search path? On my Linux
>> system qemu-system-ppc starts the installed QEMU executable. I have to
>> use ./qemu-system-ppc to start the program from the build directory.
>>
>>


