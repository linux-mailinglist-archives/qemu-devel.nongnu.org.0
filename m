Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E61E677A8A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvaH-0001Pa-H6; Mon, 23 Jan 2023 07:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJvaB-0001Oi-1K
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:05:51 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJva9-0001rw-5H
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:05:50 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so8368041wms.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BcDngAGaZVRQSgdU7ckMXu1kfzbLj10vrove+FLauy4=;
 b=CiZ33X0cYkCWs2+MwJyPXH5IBWkUdvx9OtioWEPllaB87kJFMSKvXHjhZiH3FVSCO3
 ljO/mo1YSS2zqgekSkC1WOxxts298vBhGKZpd/3sPf7iEiUcy6kXPuXWU7gu4cvpYpOQ
 +SKMfYwyCPiXoe5LdeQYQz/5UnzL9CqNw16PuhjugfY1gazZnlpqQSTnQnn/payQbvVI
 yLvsxomPSLAvhDK+bfDwtZl3yJyUKDNSLjTstDJEU/G/q930qMfMTpyqH3LUBk+9A6DM
 cW+g4FZ3lD8UtyX5WUbuFSAWzFdY/miAUZexnkf86ki9Gizfk3qSt2adUqENsf/eVgH4
 /nhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BcDngAGaZVRQSgdU7ckMXu1kfzbLj10vrove+FLauy4=;
 b=pZb/YlelK+WY9RMMPL3PEN8x2hnHbQ8k5SxSj3AxMrUIptZWeShwWHS9JGKkHV26va
 r82x4QbPwKsC0q1mou8BGJ61yxkV+lCbfZnMXavkTTniMN0fhutvmDpbFILX/IFMkBZU
 fpOh+0kgXcWXlgxEAJO0NOXyYVXAqjSyt7GqyKPIHJOnR2DWf9LTIllrqXiFonxgBU+C
 SvxNtZOicppA6R4KB+UBjzGQrZlveaqYvDlhTcqGPqtRng/ImyFWWaW9fArk8+hwbehV
 HjX9OEaMKOL5Yu7jnEFzouPPJxQoX9PL8xtm07J75TsL3RIbO0LrOXBJpMjLVNWXDlBp
 RAOw==
X-Gm-Message-State: AFqh2kraVsvISbKmXBF/ScjNFGc20kQd/e18oTz2WIhFJD20tIkIMqNV
 h0QAKg+XKZuL7EzRXpFfmRrluQ==
X-Google-Smtp-Source: AMrXdXuGXhTvcfVMNet84rfsc5nOspFQXQ6ZU2htxRxjXyDL1QccLrVRA9ErKa3nhtNvklx3N63ubA==
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id
 q29-20020a05600c331d00b003d3591abfdamr31579232wmp.27.1674475547425; 
 Mon, 23 Jan 2023 04:05:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b003d35acb0fd7sm10645535wmb.34.2023.01.23.04.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 04:05:47 -0800 (PST)
Message-ID: <c94b801d-3c19-24c7-505a-7ab0d98faa67@linaro.org>
Date: Mon, 23 Jan 2023 13:05:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] qapi, audio: add query-audiodev command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Volker_R=c3=bcmelin?=
 <vr_qemu@t-online.de>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20230123083957.20349-1-thuth@redhat.com>
 <20230123083957.20349-2-thuth@redhat.com>
 <47d18f28-73b1-af59-ab65-2366ed3da55a@linaro.org>
 <Y85rVoXhR5skLVOz@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y85rVoXhR5skLVOz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/1/23 12:11, Daniel P. Berrangé wrote:
> On Mon, Jan 23, 2023 at 10:20:29AM +0100, Philippe Mathieu-Daudé wrote:
>> On 23/1/23 09:39, Thomas Huth wrote:
>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> Way back in QEMU 4.0, the -audiodev command line option was introduced
>>> for configuring audio backends. This CLI option does not use QemuOpts
>>> so it is not visible for introspection in 'query-command-line-options',
>>> instead using the QAPI Audiodev type.  Unfortunately there is also no
>>> QMP command that uses the Audiodev type, so it is not introspectable
>>> with 'query-qmp-schema' either.
>>>
>>> This introduces a 'query-audiodev' command that simply reflects back
>>> the list of configured -audiodev command line options. This alone is
>>> maybe not very useful by itself, but it makes Audiodev introspectable
>>> via 'query-qmp-schema', so that libvirt (and other upper layer tools)
>>> can discover the available audiodevs.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> [thuth: Update for upcoming QEMU v8.0, and use QAPI_LIST_PREPEND]
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    qapi/audio.json | 13 +++++++++++++
>>>    audio/audio.c   | 12 ++++++++++++
>>>    2 files changed, 25 insertions(+)
>>>
>>> diff --git a/qapi/audio.json b/qapi/audio.json
>>> index 1e0a24bdfc..c7aafa2763 100644
>>> --- a/qapi/audio.json
>>> +++ b/qapi/audio.json
>>> @@ -443,3 +443,16 @@
>>>        'sndio':     'AudiodevSndioOptions',
>>>        'spice':     'AudiodevGenericOptions',
>>>        'wav':       'AudiodevWavOptions' } }
>>> +
>>> +##
>>> +# @query-audiodevs:
>>> +#
>>> +# Returns information about audiodev configuration
>>
>> Maybe clearer as 'audio backends'?
>>
>> So similarly, wouldn't be clearer to name this command
>> 'query-audio-backends'? Otherwise we need to go read QEMU
>> source to understand what is 'audiodevs'.
> 
> The command line parameter is called '-audiodev' and this
> query-audiodevs command reports the same data, so that
> looks easy enough to understand IMHO.
> 
>>> +#
>>> +# Returns: array of @Audiodev
>>> +#
>>> +# Since: 8.0
>>> +#
>>> +##
>>> +{ 'command': 'query-audiodevs',
>>> +  'returns': ['Audiodev'] }
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index d849a94a81..6f270c07b7 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -28,8 +28,10 @@
>>>    #include "monitor/monitor.h"
>>>    #include "qemu/timer.h"
>>>    #include "qapi/error.h"
>>> +#include "qapi/clone-visitor.h"
>>>    #include "qapi/qobject-input-visitor.h"
>>>    #include "qapi/qapi-visit-audio.h"
>>> +#include "qapi/qapi-commands-audio.h"
>>>    #include "qemu/cutils.h"
>>>    #include "qemu/module.h"
>>>    #include "qemu/help_option.h"
>>> @@ -2311,3 +2313,13 @@ size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
>>>        return bytes;
>>>    }
>>> +
>>> +AudiodevList *qmp_query_audiodevs(Error **errp)
>>> +{
>>> +    AudiodevList *ret = NULL;
>>> +    AudiodevListEntry *e;
>>> +    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
>>
>> I am a bit confused here, isn't &audiodevs containing what the user provided
>> from CLI? How is that useful to libvirt? Maybe the corner case
>> of a user hand-modifying the QEMU launch arguments from a XML config?
>>
>> Wouldn't a list of linked in AudiodevDriver be more useful to libvirt
>> so it could pick the best available backend to start a VM?
> 
> On the libvirt side we're never going to need to actually call the
> query-audiodevs commands. The mere existance of the command, means
> that the QMP schema now exposes information about what audio backends
> have been compiled into the binary. This is the same trick we've used
> for other aspects of QMP. IOW we don't need a separate command just
> for the purpose of listing AudiodevDrivers.

I understand having "what audio backends have been compiled into the
binary" is useful, but I am missing how you get that from &audiodevs.

AFAICT &audiodevs is for the CLI parsed backends, not all the backends
linked within a binary. I probably need sugar / coffee and will revisit
after lunch.

> The idea of a query-audiodevs command is useful in general. When we
> later gain support for hotplug/unplug of audio, the set of audiodevs
> will no longer be guaranteed to match the original CLI args.
> 
> With regards,
> Daniel


