Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08154B646B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:33:58 +0100 (CET)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsLV-0002ip-P1
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsIr-000118-6I; Tue, 15 Feb 2022 02:31:16 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36365
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsIj-00065M-BL; Tue, 15 Feb 2022 02:31:08 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso1893288pjd.1; 
 Mon, 14 Feb 2022 23:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+6pjhLFst4N922YGRqo5Zl/8zkEiU09Mup9JV9C9byo=;
 b=Uu/jTECN0oYKYgzG1ATU3fKjBVSZJQrE+KIKs3lKC05M+PZFWrDZ2wlDHNRJf4nBWb
 8AqSeL14KCqyha2gx4uaUtqHRDoTyYRfFWmWEldVlJrw0UOlp8243NR0KyaqyYEQRDm4
 usYqTfCq9zHh/4O45OxaxnxrLwr8HjrvF/p2ZuyRw97pWmkjuWADPL93NER0fFW2zXnJ
 LkBPphd3eHiQyY+QW3rex/Xgx0ZycXGmcYIFkSXlQH4J/lNfRnGzZ8yelQhvBQ6wNds/
 YLMBMUNcipp/+5bEyStIxoO/r/XC6ouvDhj7OYSZGbTO6Q/O19wov4gPyZAVKFyii/YN
 JiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+6pjhLFst4N922YGRqo5Zl/8zkEiU09Mup9JV9C9byo=;
 b=m7pWyqgo+VQrRMwfrAm6Al8kEDXmNh5Q7hc+gvy8PXmlQrTIGN0ZrD337UKY3zwwQA
 2QD3J44Lewf3n1BXDxpj3r2tgwcMmYwe5s24/bQomAFb6pahbsYY4tCI+UOPbn1uKaz3
 pJF6leRkaO14xrstvdv2M5Zap6W+HzzLxW9f6PkcBLq0ggWaxf+HSOABomipHpsgEtaO
 7DTHO2uKaRRYIRJ6nA7hCCQyFUeEeDEMrBhUbggggIcFr13XlXgegvsMdANUSlYBH3pQ
 MmXuNqq7a2uIo28UgV3cF+eLfzX8QSpC70R2xVJaM2WiHsm4XtKm4UOLB23PczcGr6Gk
 ciIA==
X-Gm-Message-State: AOAM530s7KCeZ1B91+MlD+SOjR0xevxVZ+SXGJWHn3+i6lnYKQaZB67R
 p3yIyevvHxMS/I421VzfLVE=
X-Google-Smtp-Source: ABdhPJwERxi7B1HdGtqv8Y+BrSyrrid1AE01yYgFOtOolXruC6A6SL5PPBThxLmBhNKzaljUBuItCA==
X-Received: by 2002:a17:90b:4b41:b0:1b9:3a5a:f3c with SMTP id
 mi1-20020a17090b4b4100b001b93a5a0f3cmr2864451pjb.241.1644910256165; 
 Mon, 14 Feb 2022 23:30:56 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id b4sm39847624pfl.106.2022.02.14.23.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 23:30:55 -0800 (PST)
Message-ID: <5c290b69-4b15-0be6-4621-7dbf493d4c0a@amsat.org>
Date: Tue, 15 Feb 2022 08:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 10/16] audio/coreaudio: Remove a deprecation warning on
 macOS 12
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Will Cohen <wwcohen@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Zhang <lizhang@suse.de>,
 Roman Bolshakov <roman@roolebo.dev>
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-11-f4bug@amsat.org>
 <CAMVc7JUiFBcvMeFXrgM=6V51JGQZFvynX5hwnZRWaPzPp+5hWA@mail.gmail.com>
In-Reply-To: <CAMVc7JUiFBcvMeFXrgM=6V51JGQZFvynX5hwnZRWaPzPp+5hWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 15/2/22 07:53, Akihiko Odaki wrote:
> On Tue, Feb 15, 2022 at 3:57 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When building on macOS 12 we get:
>>
>>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster' is deprecated: first deprecated in macOS 12.0 [-Werror,-Wdeprecated-declarations]
>>        kAudioObjectPropertyElementMaster
>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>        kAudioObjectPropertyElementMain
>>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5: note: 'kAudioObjectPropertyElementMaster' has been explicitly marked deprecated here
>>        kAudioObjectPropertyElementMaster API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain", macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0)) = kAudioObjectPropertyElementMain
>>        ^
>>
>> Replace by kAudioObjectPropertyElementMain, redefining it to
>> kAudioObjectPropertyElementMaster if not available.
>>
>> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> Suggested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> Suggested-by: Roman Bolshakov <roman@roolebo.dev>
>> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   audio/coreaudio.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index d8a21d3e50..5b3aeaced0 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -44,10 +44,15 @@ typedef struct coreaudioVoiceOut {
>>       bool enabled;
>>   } coreaudioVoiceOut;
>>
>> +#if !defined(MAC_OS_VERSION_12_0) \
>> +    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
>> +#define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
>> +#endif
>> +
> 
> This still uses MAC_OS_X_VERSION_MAX_ALLOWED. Apparently the change to
> use MAC_OS_X_VERSION_MIN_REQUIRED went to "[PATCH v5 16/16] gitlab-ci:
> Support macOS 12 via cirrus-run".

Yet another failed rebase... Thanks for noticing it!


