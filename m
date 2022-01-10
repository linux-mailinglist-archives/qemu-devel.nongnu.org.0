Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0148988E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:26:38 +0100 (CET)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6tkz-0003NS-9R
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:26:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6tie-0002Tv-DL; Mon, 10 Jan 2022 07:24:12 -0500
Received: from [2a00:1450:4864:20::42a] (port=35472
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6tic-0007bH-Pw; Mon, 10 Jan 2022 07:24:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e9so24929256wra.2;
 Mon, 10 Jan 2022 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=zv9wlFF7mkDIbvAMWO2OCcoz8RL4kyTFTNNO7ahQmPU=;
 b=WLscuUBtRpe0U/Yk2d2f62xu08sUUZ8JVEBuOnuuoxppMZCeLHiCJ4bk8wnY9UHvMB
 1fMsyviL+gZPfqNOQEiH0rS0VteFbKkn0msODXmMOkca1G5hNImBD4yd5NYr3eVU+qv3
 DGrorvHM98vDRPW5R6H+JMgGnNgh8MEoPRHVvVocJlhFh9HwDNm5lwKfjAWftK6nxUgS
 Ne2In6Y4u/RsBqPfLdMnzCRrHoIBTuZGdfIa93WzE02u22uIA1fYpr3bNtCyKXMWP1CS
 Ha2STMa+q2rzbmZX0hhAco+NQSFC13fXitZiXxgBglPVOp8CPQIccwISEequ58xXLXq+
 TkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=zv9wlFF7mkDIbvAMWO2OCcoz8RL4kyTFTNNO7ahQmPU=;
 b=xzFMqNLAPNd7ThOhzJErThjbIpSpsvduDFPg364VI+CVmrgRenLZHWbheb+TOLRI6P
 m9/MjEgy6PTOF43k8rJGHik6CZZ4nia4ZfeKAAciLEmDNarxpxJcXnd7eLhF8x8SUZ3i
 SoTvPi4oJO4lHyzgGCRNwqbd8xDFS49sIVEBFc3+5vAbxBC9UTsYPRYi0yyQ1b+GjOzt
 b2EF4HZr3uTkXHaa/pRG7hlkTCLAAFvF4ml16mdkhWiOXUY9Wzqhu9++iqsBD3mB8gob
 vOb/r6VJiwa/HMNhr/qfNG+BCnjwXzLQqyD3+GxGB52jkVqmohgD5H6AHTpmKByg91IP
 kU1A==
X-Gm-Message-State: AOAM533bCKpeLOY4qK/omaaa+HlwoyvVxbIc+IgMVFl1FXoWzUgVfjw3
 cEmE0dGuUB1/jU5NoEOjmsg=
X-Google-Smtp-Source: ABdhPJzyq00pXSQtN/ImP1qBUq5nJg+y4QyIjQFi5mkGEZ6CRDUK//PXYKb7meDq7xyx+ER/5CVP8A==
X-Received: by 2002:adf:fec2:: with SMTP id q2mr4281078wrs.546.1641817449005; 
 Mon, 10 Jan 2022 04:24:09 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o5sm6363664wmc.39.2022.01.10.04.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 04:24:08 -0800 (PST)
Message-ID: <4993ab11-570b-2bd7-a9b9-c6ddc9af5802@amsat.org>
Date: Mon, 10 Jan 2022 13:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
References: <20220109170612.574104-1-f4bug@amsat.org>
 <20220109170612.574104-3-f4bug@amsat.org>
 <b5b9df3d-0213-0a62-12ab-4e48ec88c0d9@gmail.com>
 <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
In-Reply-To: <742a1bca-1150-c277-c498-3815ef956f58@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 09:44, Philippe Mathieu-Daudé wrote:
> On 1/10/22 09:17, Akihiko Odaki wrote:
>> On 2022/01/10 2:06, Philippe Mathieu-Daudé wrote:
>>> When building on macOS 12 we get:
>>>
>>>    audio/coreaudio.c:50:5: error: 'kAudioObjectPropertyElementMaster'
>>> is deprecated: first deprecated in macOS 12.0
>>> [-Werror,-Wdeprecated-declarations]
>>>        kAudioObjectPropertyElementMaster
>>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>        kAudioObjectPropertyElementMain
>>>   
>>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwareBase.h:208:5:
>>> note: 'kAudioObjectPropertyElementMaster' has been explicitly marked
>>> deprecated here
>>>        kAudioObjectPropertyElementMaster
>>> API_DEPRECATED_WITH_REPLACEMENT("kAudioObjectPropertyElementMain",
>>> macos(10.0, 12.0), ios(2.0, 15.0), watchos(1.0, 8.0), tvos(9.0, 15.0))
>>> = kAudioObjectPropertyElementMain
>>>        ^
>>>
>>> Use kAudioObjectPropertyElementMain (define it to
>>> kAudioObjectPropertyElementMaster on macOS < 12).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   audio/coreaudio.c | 16 ++++++++++------
>>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>>> index d8a21d3e507..c836bc9dd37 100644
>>> --- a/audio/coreaudio.c
>>> +++ b/audio/coreaudio.c
>>> @@ -44,10 +44,14 @@ typedef struct coreaudioVoiceOut {
>>>       bool enabled;
>>>   } coreaudioVoiceOut;
>>>   +#if !defined(MAC_OS_VERSION_12_0)
>>> +#define kAudioObjectPropertyElementMain
>>> kAudioObjectPropertyElementMaster
>>> +#endif
>>> +
>>
>> Semantically MAC_OS_VERSION_12_0 defines the numeric value of version
>> 12.0 and its existence does not mean that
>> kAudioObjectPropertyElementMain is defined. I suggest the following:
>> #if !__is_identifier(kAudioObjectPropertyElementMain)
>> #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
>> #endif

Apparently __is_identifier() is Clang specific. It might be acceptable
since this file is restricted to macOS. Similarly for the other
block/file-posix.c patch, the section is conditional to  __APPLE__
being defined.

