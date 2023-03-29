Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBCE6CF51F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 23:21:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phdCT-0008Jd-Mk; Wed, 29 Mar 2023 17:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1phdCR-0008JU-6D
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 17:19:19 -0400
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1phdCP-0003Uj-FB
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 17:19:18 -0400
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout01.t-online.de (Postfix) with SMTP id CE50C1372C;
 Wed, 29 Mar 2023 23:19:14 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd88.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1phdCM-1hcymH0; Wed, 29 Mar 2023 23:19:14 +0200
Message-ID: <93346fe1-566b-10ca-5196-b8c8fda2ae1d@t-online.de>
Date: Wed, 29 Mar 2023 23:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Rene Engel <ReneEngel80@emailn.de>, qemu-devel@nongnu.org
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
 <9521731e-359b-f9fe-b4a5-21bdce3e1984@t-online.de>
 <22eab6e4-ac94-55c9-585c-330d93c68620@eik.bme.hu>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <22eab6e4-ac94-55c9-585c-330d93c68620@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1680124754-0AFFAC01-0764FA07/0/0 CLEAN NORMAL
X-TOI-MSGID: 37625560-6265-4b27-86cc-1f4808e921de
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

Am 29.03.23 um 21:20 schrieb BALATON Zoltan:
> On Tue, 28 Mar 2023, Volker Rümelin wrote:
>> it seems your Mac uses a 48kHz sample rate, although QEMU requested a 
>> 44.1kHz sample rate. Could you add -audiodev 
>> coreaudio,id=audio0,out.frequency=48000 to your command line and test 
>> if the playback speed and pitch is now correct?
>
> I guess you could also set the sampling rate in the guest to match the 
> host but if that results it to do resampling then it may use more CPU 
> that way.

With default settings QEMU resamples the selected guest rate to 
out.frequency.

>
>> The default for out.frequency is 44100.
>
> I think ALSA and Pulseaudio may also default to 48kHz. I remember 
> configuring ALSA to 44.1 kHz on my machine to avoid resampling in the 
> more common case of playing music. So is this a general problem or 
> something with the coreadio backend? Should this somehow detect the 
> host sampling rate and do something about it?

Querying the host sample rate and using the host sample rate instead of 
out.frequency seems easy. It gets difficult when someone changes the 
host sample rate when QEMU is running. Current QEMU code can't change 
the sample rate for an established audio stream. I think the Google 
Android emulator fork of QEMU uses the Core Audio API to resample the 
audio stream in this case.

>
> Regards,
> BALATON Zoltan


