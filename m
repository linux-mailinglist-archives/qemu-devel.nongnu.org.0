Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8967774E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 10:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJt0J-00082Q-2A; Mon, 23 Jan 2023 04:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJt0H-00082B-JG
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:20:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJt0C-0007B9-CC
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:20:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id l8so8443790wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I4eCAZZXG3PP6QllNZ47e2FAjlUTur3WMvIuV/YRHrU=;
 b=o8GQnK0DajwijZed5aLcqj5VxvzA/eisuxSRow4bMGY2i+VgAh3MSAi3AJyXP4fkT2
 E/Fn8DN0hr+yJwdwcZrwp3RQei12+qktaBR4P5wE85FOXLq2f8ddcOvslRkHXTq2BW2r
 DzTE5iuhQtyMjH+AM3OxsLtHAzqeI8S94oCDPiDq3iLjsCCbkxb3tUjNSXXnU5vGsQkQ
 IOOoNl1Goim35MxUzgeI0rbyqeao4lqBuPx4vEITytfXaBIQIRFEWn9Ht3j2aVdvgKB6
 KGQDVvu4sa7vS1T9P2v4dqG5fagFg143mvpMA5Iiq0G2GloyO5WuvwlywgMw0dgcV0lm
 jmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4eCAZZXG3PP6QllNZ47e2FAjlUTur3WMvIuV/YRHrU=;
 b=k1VtMHmmuXddObC26Y/ZoWvMKOSndNruR1fIVQZTiQDdtWte9RU2WLk1liBh9GJfJA
 62zp5BTDffASIEeIN9yM7T/QjzNT0DoxNAFxNupgIHTupKJMVcZVPu6GIdBvMdo1J7yE
 L+y4IcyliPIOdmRjcs8d1stSAOucmHkrvLFBl9VcbzMQn+wpUy7zY+T6U/2J0AvgD7rM
 j2LvKqgRFPn5vNmiRFXfjtrbL839nQ+alZI1LQwE6LHJoMFI3XCDvbXsh7AtXGgiwnLK
 drHdsYyGM1fDUvAGbkAVDq4heEf4V06hIUcJZfM14tiUqXkZi4f4k3eG0R2wxdmTjwUW
 /rpA==
X-Gm-Message-State: AFqh2krvXAdmO5fDW1vHhz8ee50gugdB0sGYy8zl9JEeIgZjkCKWSzYu
 HiX+mq1t5fee7t5YjCCCdp1rFA==
X-Google-Smtp-Source: AMrXdXvRjkPiibgRpAEE3weKyfICXvjL8RH1nhAox/8B7soYTUdWTbMAM+pMECYSELJbrO+WEB4Bow==
X-Received: by 2002:a05:600c:a11:b0:3db:f1f:bc31 with SMTP id
 z17-20020a05600c0a1100b003db0f1fbc31mr20000980wmp.16.1674465630677; 
 Mon, 23 Jan 2023 01:20:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m37-20020a05600c3b2500b003daf681d05dsm10878030wms.26.2023.01.23.01.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:20:30 -0800 (PST)
Message-ID: <47d18f28-73b1-af59-ab65-2366ed3da55a@linaro.org>
Date: Mon, 23 Jan 2023 10:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] qapi, audio: add query-audiodev command
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20230123083957.20349-1-thuth@redhat.com>
 <20230123083957.20349-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230123083957.20349-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 23/1/23 09:39, Thomas Huth wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Way back in QEMU 4.0, the -audiodev command line option was introduced
> for configuring audio backends. This CLI option does not use QemuOpts
> so it is not visible for introspection in 'query-command-line-options',
> instead using the QAPI Audiodev type.  Unfortunately there is also no
> QMP command that uses the Audiodev type, so it is not introspectable
> with 'query-qmp-schema' either.
> 
> This introduces a 'query-audiodev' command that simply reflects back
> the list of configured -audiodev command line options. This alone is
> maybe not very useful by itself, but it makes Audiodev introspectable
> via 'query-qmp-schema', so that libvirt (and other upper layer tools)
> can discover the available audiodevs.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> [thuth: Update for upcoming QEMU v8.0, and use QAPI_LIST_PREPEND]
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qapi/audio.json | 13 +++++++++++++
>   audio/audio.c   | 12 ++++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 1e0a24bdfc..c7aafa2763 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -443,3 +443,16 @@
>       'sndio':     'AudiodevSndioOptions',
>       'spice':     'AudiodevGenericOptions',
>       'wav':       'AudiodevWavOptions' } }
> +
> +##
> +# @query-audiodevs:
> +#
> +# Returns information about audiodev configuration

Maybe clearer as 'audio backends'?

So similarly, wouldn't be clearer to name this command
'query-audio-backends'? Otherwise we need to go read QEMU
source to understand what is 'audiodevs'.

> +#
> +# Returns: array of @Audiodev
> +#
> +# Since: 8.0
> +#
> +##
> +{ 'command': 'query-audiodevs',
> +  'returns': ['Audiodev'] }
> diff --git a/audio/audio.c b/audio/audio.c
> index d849a94a81..6f270c07b7 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -28,8 +28,10 @@
>   #include "monitor/monitor.h"
>   #include "qemu/timer.h"
>   #include "qapi/error.h"
> +#include "qapi/clone-visitor.h"
>   #include "qapi/qobject-input-visitor.h"
>   #include "qapi/qapi-visit-audio.h"
> +#include "qapi/qapi-commands-audio.h"
>   #include "qemu/cutils.h"
>   #include "qemu/module.h"
>   #include "qemu/help_option.h"
> @@ -2311,3 +2313,13 @@ size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
>   
>       return bytes;
>   }
> +
> +AudiodevList *qmp_query_audiodevs(Error **errp)
> +{
> +    AudiodevList *ret = NULL;
> +    AudiodevListEntry *e;
> +    QSIMPLEQ_FOREACH(e, &audiodevs, next) {

I am a bit confused here, isn't &audiodevs containing what the user 
provided from CLI? How is that useful to libvirt? Maybe the corner case
of a user hand-modifying the QEMU launch arguments from a XML config?

Wouldn't a list of linked in AudiodevDriver be more useful to libvirt
so it could pick the best available backend to start a VM?

> +        QAPI_LIST_PREPEND(ret, QAPI_CLONE(Audiodev, e->dev));
> +    }
> +    return ret;
> +}


