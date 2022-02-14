Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8245D4B51D0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:38:15 +0100 (CET)
Received: from localhost ([::1]:50774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbYU-0003ZB-C7
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:38:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJahx-0006Z0-Eq
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:43:57 -0500
Received: from [2a00:1450:4864:20::432] (port=34377
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJahu-0005Ry-Ib
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:43:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id s10so13101876wrb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rCzpf2ZtsKjdL9NTQrs1Ckit5P/wiQCLZbhPs75aapA=;
 b=RxJVLU8M9ooL+tE+/qrtONW/gyZk3GGHiLmTnpaA+ecy8VLGqGA6TQ2x+PybViqSeG
 /iVF14tMK28cyDL0pk/QLb37jek+fkMQifl2oYJjFZ4glC6PQ2PlkVwNHFoEes93u9+x
 UYKWAvnN2KAlTAyXyi1CIFTwo9uteuQEbjzDZ+9kKcU6VQAORxsP7Lv3fafW0wBp9Amv
 X/tHsgB6WPpnJ/G4NCmNwr0sJssJKqkXk/RKXaaKKvjug6ckBHPccpzcstLSk36DSijZ
 HP2pPc5xN2gQr0QXuEwkicuVNYwzDlQzBHGHA6Se/9FoDaBqc9nttmcT0aSWvCU/JPqy
 twKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rCzpf2ZtsKjdL9NTQrs1Ckit5P/wiQCLZbhPs75aapA=;
 b=C02HfrvTSdyIXPCsPMf0UM+mSnptqnRVEKRNKKWGeH91s2v+YudcFEKEouoDC+VmM/
 1nLPBQx4a0lSrDftdrGElQhcs6/qVHsZLdcr6FK4DQxzgXnoFNjwGBxDG7Z7y6eyZdiz
 zV9TwOIq68ZMMnj88XL1gVrdH7/kFyiIzTjn3e0ygZw4B73NPXGgeGDsknZYB2mZgTVF
 Tz07hFTxwBgczrJiC1Cy01ZInNPRemKgwyZxYUfXV43d2WzOdzgoHyJxigqdjAml/f36
 wOM7GpcWiNOhvlt2jjMP/v40B/DCASfs1yTnPctKIH8zEjmYe7BzcD0MOiWjLW8kylX9
 oEXw==
X-Gm-Message-State: AOAM530GXhiUTTGZ9TeG2UpYF1GzruNqaFxfs2ATRb+Gp4mAWlgVAJBB
 P6eZscd7A7m14ArV3kB6V9k=
X-Google-Smtp-Source: ABdhPJx9YoAc7UWm6RkKTNUBZfvMXPy/GjMz1AsBmHCQGomTv8/WSskfwam2esG8Y5Wse0TzHp8Tew==
X-Received: by 2002:adf:f582:: with SMTP id f2mr11106698wro.690.1644842632187; 
 Mon, 14 Feb 2022 04:43:52 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id z7sm8370634wml.40.2022.02.14.04.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:43:51 -0800 (PST)
Message-ID: <123ecb4b-f7ef-e396-3342-a5680576d903@amsat.org>
Date: Mon, 14 Feb 2022 13:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 10/13] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 Roman Bolshakov <roman@roolebo.dev>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-11-f4bug@amsat.org>
 <ef7e75a3-45af-28a0-8460-86013bf2164c@gmail.com>
In-Reply-To: <ef7e75a3-45af-28a0-8460-86013bf2164c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/2/22 16:23, Akihiko Odaki wrote:
> On 2022/02/12 1:34, Philippe Mathieu-Daudé via wrote:
>> When building on macOS 12 we get:
>>
>>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' 
>> is deprecated: first deprecated in macOS 12.0 
>> [-Werror,-Wdeprecated-declarations]
>>        kAudioObjectPropertyElementMaster
>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>        kAudioObjectPropertyElementMain
>>    
>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: 
>> note: 'kAudioObjectPropertyElementMaster' has been explicitly marked 
>> deprecated here
>>        kAudioObjectPropertyElementMaster 
>> API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", 
>> macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) 
>> = kAudioObjectPropertyElementMain
>>        ^
>>
>> Replace by kAudioObjectPropertyElementMain, redefining it to
>> kAudioObjectPropertyElementMaster if not available.
>>
>> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> Suggested-by: Roman Bolshakov <roman@roolebo.dev>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> ---
>>   audio/coreaudio.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index d8a21d3e50..5b3aeaced0 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
>>       bool enabled;
>>   } coreaudioVoiceOut;
>> +#if !defined(MAC_OS_VERSION_12_0) \
>> +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
>> +#define kAudioObjectPropertyElementMain 
>> kAudioObjectPropertyElementMaster
>> +#endif
>> +
> 
> Unless I have missed something, we have found 
> MAC_OS_X_VERSION_MIN_REQUIRED is better even for a constant in the 
> following thread:
> https://lore.kernel.org/all/524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.com/

I was reading the v3 comments and missed the v2 ones.

