Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA46CF681
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 00:41:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pheSG-00038U-BQ; Wed, 29 Mar 2023 18:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pheSC-000382-3A
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 18:39:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pheSA-0000j3-2W
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 18:39:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7762974633D;
 Thu, 30 Mar 2023 00:38:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3B5967462DB; Thu, 30 Mar 2023 00:38:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 39321745706;
 Thu, 30 Mar 2023 00:38:41 +0200 (CEST)
Date: Thu, 30 Mar 2023 00:38:41 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>
cc: Rene Engel <ReneEngel80@emailn.de>, qemu-devel@nongnu.org
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
In-Reply-To: <93346fe1-566b-10ca-5196-b8c8fda2ae1d@t-online.de>
Message-ID: <835496df-cb94-c223-aa23-a304a0bd2660@eik.bme.hu>
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
 <93346fe1-566b-10ca-5196-b8c8fda2ae1d@t-online.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-456445369-1680129521=:58764"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-456445369-1680129521=:58764
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 29 Mar 2023, Volker Rümelin wrote:
> Am 29.03.23 um 21:20 schrieb BALATON Zoltan:
>> On Tue, 28 Mar 2023, Volker Rümelin wrote:
>>> it seems your Mac uses a 48kHz sample rate, although QEMU requested a 
>>> 44.1kHz sample rate. Could you add -audiodev 
>>> coreaudio,id=audio0,out.frequency=48000 to your command line and test if 
>>> the playback speed and pitch is now correct?
>> 
>> I guess you could also set the sampling rate in the guest to match the host 
>> but if that results it to do resampling then it may use more CPU that way.
>
> With default settings QEMU resamples the selected guest rate to 
> out.frequency.
>
>> 
>>> The default for out.frequency is 44100.
>> 
>> I think ALSA and Pulseaudio may also default to 48kHz. I remember 
>> configuring ALSA to 44.1 kHz on my machine to avoid resampling in the more 
>> common case of playing music. So is this a general problem or something 
>> with the coreadio backend? Should this somehow detect the host sampling 
>> rate and do something about it?
>
> Querying the host sample rate and using the host sample rate instead of 
> out.frequency seems easy. It gets difficult when someone changes the host 
> sample rate when QEMU is running. Current QEMU code can't change the sample 
> rate for an established audio stream.

So what happens now if somebody changes that while QEMU is running? If it 
already does not work then using host rate would also not make it worse, 
if it resamples now why wouldn't it do the same when using host rate 
instead of constant 44.1kHz? I think this could only improve things even 
if it does not completely fix every case, also considering that changing 
host rate should be a rare event.

> I think the Google Android emulator 
> fork of QEMU uses the Core Audio API to resample the audio stream in this 
> case.

So there are even patches that could be upstreamed by somebody? Could this 
be a bite sized task or sponsored project?

Regards,
BALATON Zoltan
--3866299591-456445369-1680129521=:58764--

