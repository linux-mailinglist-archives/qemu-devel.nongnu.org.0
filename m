Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06061E157
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 10:39:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orc68-0001fK-B9; Sun, 06 Nov 2022 04:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1orc66-0001fC-On
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 04:37:46 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1orc64-0000Ic-3w
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 04:37:46 -0500
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout06.t-online.de (Postfix) with SMTP id 3659716CF3;
 Sun,  6 Nov 2022 10:37:38 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1orc5x-1tRG1B0; Sun, 6 Nov 2022 10:37:37 +0100
Message-ID: <423c57bb-ed25-0e32-e14c-e490b754fd02@t-online.de>
Date: Sun, 6 Nov 2022 10:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
To: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221022160052.1132-1-vr_qemu@t-online.de>
 <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
 <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
 <CAJ+F1C+HmS7Y8Wu88uwr5DVcspstGS+MMFAH_QB5Cd3LiVxoNA@mail.gmail.com>
 <9f4b112e-c687-2846-3cee-2f130847dd51@t-online.de>
 <8ff8d033-9394-d114-6145-e36707dc9056@redhat.com>
Content-Language: en-US
In-Reply-To: <8ff8d033-9394-d114-6145-e36707dc9056@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1667727457-C9488B6F-2E13D73D/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a26b08c-101c-4697-a78b-241b48018a87
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.11.22 um 18:33 schrieb Thomas Huth:
> On 26/10/2022 21.34, Volker Rümelin wrote:
>> Am 25.10.22 um 09:44 schrieb Marc-André Lureau:
>>> Hi
>>>
>>> On Tue, Oct 25, 2022 at 12:31 AM Volker Rümelin<vr_qemu@t-online.de> 
>>> wrote:
>>>> Am 24.10.22 um 10:13 schrieb Marc-André Lureau:
>>>>> Hi
>>>>>
>>>>> On Mon, Oct 24, 2022 at 9:28 AM Volker Rümelin<vr_qemu@t-online.de>
>>>>> wrote:
>>>>>
>>>>>      Test if the audio subsystem can handle extreme up- and down-
>>>>>      sampling ratios like 44100/1 and 1/44100. For some time these
>>>>>      used to trigger QEMU aborts. The test was taken from
>>>>> https://gitlab.com/qemu-project/qemu/-/issues/71 where it was
>>>>>      used to demonstrate a very different issue.
>>>>>
>>>>>      Suggested-by: Marc-André Lureau<marcandre.lureau@redhat.com>
>>>>>      Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>>>>>
>>>>>
>>>>> Thanks for working on this
>>>>>
>>>>> It seems to show something different though:
>>>>> "
>>>>> A bug was just triggered in audio_calloc
>>>>> Save all your work and restart without audio
>>>>> I am sorry
>>>>> "
>>>>>
>>>>> AUD_open_out() is called with audsettings: {freq = 1, nchannels = 2,
>>>>> fmt = AUDIO_FORMAT_S16, endianness = 0}
>>>>>
>>>>> And that's it. Any idea?
>>>> Hi,
>>>>
>>>> the scary message is expected and doesn't mean this qos-test failed.
>>>> This is the currently not so silent 'the audio subsystem should (...)
>>>> silently give up' case.
>>> Ok, but it's not silent. According to the AC97 spec, "if the value
>>> written to the register is supported that value will be echoed back
>>> when read, otherwise the closest (higher in case of a tie) sample rate
>>> supported is returned". We should probably pick a low sample rate,
>>> like 8000 (see Table 32 in spec 2.1) for anything below it.
>>
>> Hi,
>>
>> I don't think we should limit the lowest sample rate to 8000 Hz. The 
>> sample rates in AC97 revision 2.1 Table 32 are sample rates the codec 
>> should support at minimum. We are free to support the whole 1-65535 
>> Hz sample rate range.
>
> FWIW, a minimum sample rate of 1 Hz also does not make much sense. You 
> cannot hear that frequency anymore... so it does not really make that 
> much sense to support such low frequencies here. Just my 0.02 €.

Hi,

sample rates below a minimum sample rate are currently not supported. 
The audio device gets disabled. This is why you see the confusing 
audio_bug() message. The minimum sample rate depends on the selected 
audio backend and can be changed indirectly with -audiodev arguments. If 
we change the AC97 minimum sample rate to 8000 Hz, it's much more 
difficult to test this code path.

>
>> This is a convenient way to test edge cases. If you think the 
>> audio_bug message is an issue, I'll improve the error handling in 
>> AUD_open_* first and then resend this qos test.
>
> I agree with Marc-André - the error message looks confusing when 
> running the test. Maybe you could simply fence it with qtest_enable() 
> at least?

I have written two patches for the audio subsystem to address this 
issue. This was two days before QEMU 7.2 soft freeze. I'll send the 
patches to the mailing list after the release of QEMU 7.2.

>
>>>> The noaudio backend uses a mixing-engine buffer size of 1024 audio
>>>> frames and AUD_open_* tries to allocate memory for 1024/44100 = 0.0232
>>>> audio frames for the resample buffer in 
>>>> audio_pcm_sw_alloc_resources_*.
>>>> This allocation fails and produces the scary message. The error is
>>>> handled correctly and AUD_open_* returns NULL. AUD_read and AUD_write
>>>> return early if this pointer is NULL and the audio frontend callback
>>>> functions will also not be called because the audio_frontend_frames_*
>>>> functions return 0 in this case.
>>> Thanks, it'd be nice to have such a description in the commit message.
>>
>> I'll improve the commit message of patch version 2.
>
> A v2 would be appreciated!

I won't forget it.

With best regards,
Volker

>
>  Thanks,
>   Thomas
>


