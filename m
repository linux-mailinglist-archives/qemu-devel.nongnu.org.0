Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6186B67FB47
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 23:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLtGu-0007Hc-VH; Sat, 28 Jan 2023 17:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLtGr-0007Gv-9X
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 17:02:01 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLtGp-0007Fi-KR
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 17:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azVP/JV7+8zQcUFxdLYhEw7gZjug8OdSop1SYmvAowg=; b=CVyn/kZXv5CcTc6qiSpxKe6FIZ
 tJz3QP2VPJ4pGJ3aDPgSBPogShP08j8W4+3HxOjIIBJT1RAwkwN4wPHPdDkcqf/DDJRS4x8Ju5Q1z
 TNVBRwsIWpeHniCvFzHmSrb10TwzexuKqojuJ0RJPUUiaQMVGEUr5aozo10M8dS4LJuFFVqlm1kH9
 4RuIzyOugNkJpxDjXAJhu8YR35/ZTCdG2swJUGWK9Z3g5AWvvOOJDQYlJzhyV2kB1aBR530qNX6im
 R2TpTuC7TH3PgQj+FIcQYMQv9Vf+jtOYbwjzEnPuMhVrDgWH1FjHL+FYSY+EvXfhZBksnY7s0aERA
 WoUZHFOL3kn4SFmYDWbPBXkgjSfAK9ZEcylqQ0LFQgVSd/6/NuBGlgwJlPv4bKcaXQ3fHBSwqxFi4
 7C/Z2z8KOhlKunEXNA2360jSh48mKPLV8Xw8tO1flXx/dYdxp6rmg0mnoJOIvu8GefXNN1QeyZiVq
 QqANoIsDiPquc9JO+wRRoN+vxa5mwZxS1yZSOZfNmyRFascGFVZf+qTvga8YhbRyEugXFnp/FGqBd
 a8OtXFRhVny9YpQS+1GljPy3hSRsCZNegfyZUvlH5W2Pu7MkISdkfU+tYqN1MjNJBZa65NDdWB7v5
 nXshxfdhfmlaAIpmid49NPB9+dqCpADPV+2g7Q5bY=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pLtGM-0000ZP-BB; Sat, 28 Jan 2023 22:01:30 +0000
Message-ID: <d8349646-cc36-4cd7-7100-cb3b2324fbd3@ilande.co.uk>
Date: Sat, 28 Jan 2023 22:01:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <61bd351f-0683-7f58-b746-66c9578a7cdc@t-online.de>
 <a671751a-cbb7-22c2-8840-0476176d2533@t-online.de>
 <f7ce8516-fddd-543b-0f3c-b73a310b79a8@ilande.co.uk>
 <b08302bf-bd66-79c8-abcc-b511c99c7eb5@t-online.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <b08302bf-bd66-79c8-abcc-b511c99c7eb5@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/17] audio: improve callback interface for audio
 frontends
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 28/01/2023 09:03, Volker Rümelin wrote:

> Am 22.01.23 um 19:13 schrieb Mark Cave-Ayland:
>> On 15/01/2023 13:45, Volker Rümelin wrote:
>>
>>> Am 15.01.23 um 14:08 schrieb Volker Rümelin:
>>>
>>> Ccing a few more people who might be interested in this patch series.
>>>
>>> @Mark:
>>> After this patch series, the code in your out of tree ASC audio device (and a few 
>>> in tree audio devices) could be simplified. write_audio() and the loops calling 
>>> write_audio() could be removed.
>>
>> Hi Volker,
>>
>> I know we have discussed this in a separate thread off-list, but this is fantastic!
>>
>> Just out of interest, if the available bytes wraps the circular buffer will the 
>> audio core call the audio callback twice to maximise the ability of the guest to 
>> generate samples before the next audio timer? Or does that not make much difference 
>> in practice?
> 
> Hi Mark,
> 
> I guess with circular buffer you refer to the mixing engine buffer. The audio system 
> calls the callback once on every audio timer event. If the available bytes wrap the 
> mixing engine ringbuffer, the audio_pcm_sw_resample_out() function uses two writes to 
> write all available bytes. Compared to the unpatched version, nothing has changed in 
> this regard. Of course the audio frontend devices are still free to write 'avail' 
> bytes with multiple calls to AUD_write().
> 
> With best regards,
> Volker

Yes that makes sense, thanks for confirming this. I'm sorry that I'm not familiar 
enough with the audio side to do a proper review but obviously the A-B still stands 
and I would certainly be keen to see this merged.


ATB,

Mark.

