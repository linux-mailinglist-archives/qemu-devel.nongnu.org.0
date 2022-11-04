Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEC619F59
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0vc-0005Hd-7D; Fri, 04 Nov 2022 13:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0vZ-0005DR-VE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:56:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0vY-0006fF-5H
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:56:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n39-20020a05600c3ba700b003cf71011cddso5604014wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B3vP94HoT6f3MA7OqbRtgxsHGi+3ej+63uwEOy+fE+4=;
 b=qyOOYnakN6QnjUvEo+GjcKV5dPBoKvZqoHnAqdPAS46JFQyccNLq4xJ4uNfzMCYlOT
 7Bkb1fdYpnDJC4CrEmGRTHyH77p4UfpGfT+H9VetXyaXSfxWtjoGhqr7/rgCWGHF/aUg
 OisHNHwOTTbf4mqO5kZhKmxWYc3bFaNURrx725AG8GpNaDgedOnyy7fUxWlKT4gn+9VU
 9DCEe00TahCiBeCgj58SX7IN5BHu/dDQGPmGyusnGqCo231YktDWGQmRN3nYEq1/s4E7
 300LHrqRsrFfYKhqdxrb3D7rho97jSiUVDD2W+5ezrJMkNw7kRioY3cftLPgm7TxBqQZ
 pkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B3vP94HoT6f3MA7OqbRtgxsHGi+3ej+63uwEOy+fE+4=;
 b=Nem4WAhMUfYBJCMdjgR2Yd1dGfdFchk6wfPoe9JTRtofvaUsv5JSMSWrK4Tv/1Qei7
 IMswqIkB96tMgSn2B0Jdwt5CsS5QLF/nEDKyttPTHUEF6QEYpMLI+zbksfPg7xyJfApl
 OmHQUsFKVK/3cN2kJIqsCMNCBA4rVXc19cun5Ukt9DSTwDrx/1qFDS6W8sUSu2ejOC5L
 dt7GLaAEXDmeUUK1YXr3GPSVNig0jQ02laOlMIA+CMxv66SQdi9c6MtySyoNxT6CZguG
 4PifV70+Q02UFvpp6/f0f/wvJXsNJcAe/HiYWHjDro2Q6R7xfFGB6R1TnmBhLSWL4xl8
 QOZQ==
X-Gm-Message-State: ACrzQf37QQntewCS58xakQVsOxtqfjMPaf+r264uCePQvaoN8Nejx6z3
 XmjeW8BZtNKHYuIjvum9nMx23w==
X-Google-Smtp-Source: AMsMyM6jiPe/rd+qpiuadYXLDlbPd0MDTySBrR920Tj56SNWFDV5arMiqROlvK8ZPZtNBkpzkwEZww==
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id
 n64-20020a1c2743000000b003b34066fa61mr35308186wmn.79.1667584581354; 
 Fri, 04 Nov 2022 10:56:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a5d4d86000000b002364c77bcacsm3802397wru.38.2022.11.04.10.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:56:20 -0700 (PDT)
Message-ID: <f8e296e2-8be6-cb62-49c2-bc1b636cf8c6@linaro.org>
Date: Fri, 4 Nov 2022 18:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221022160052.1132-1-vr_qemu@t-online.de>
 <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
 <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
 <CAJ+F1C+HmS7Y8Wu88uwr5DVcspstGS+MMFAH_QB5Cd3LiVxoNA@mail.gmail.com>
 <9f4b112e-c687-2846-3cee-2f130847dd51@t-online.de>
 <8ff8d033-9394-d114-6145-e36707dc9056@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8ff8d033-9394-d114-6145-e36707dc9056@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 18:33, Thomas Huth wrote:
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
>>>>>      https://gitlab.com/qemu-project/qemu/-/issues/71  where it was
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
>> should support at minimum. We are free to support the whole 1-65535 Hz 
>> sample rate range.
> 
> FWIW, a minimum sample rate of 1 Hz also does not make much sense. You 
> cannot hear that frequency anymore... so it does not really make that 
> much sense to support such low frequencies here. Just my 0.02 €.

Still useful when using a sound card as signal generator, i.e.:
https://www.allaboutcircuits.com/technical-articles/how-to-use-your-computer-as-an-arbitrary-waveform-generator/


