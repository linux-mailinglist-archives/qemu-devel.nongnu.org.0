Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F265042E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xRI-0001it-Ei; Sun, 18 Dec 2022 12:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xRG-0001ik-QW
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:27:02 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xRF-0004gu-2x
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:27:02 -0500
Received: by mail-ed1-x530.google.com with SMTP id b69so10045975edf.6
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4KGnufapNqBiMWtnkdF4G9SPZ0eWsbVjA+XoQwdq7/M=;
 b=IyEarvc25GYMNYaE6NMK8owwtAVt5idW7Tz7u1cq3UKf1P3eEE77ifz4qSarmPHfmR
 f3bSmKJEl19Vwkgh+B/qmiWS6DVv9KeLTGBCYRKpDrzsvGuU7BWwHQJZNuUiR803431g
 EXCIkhhbixvGs3RfqVKJj/zB7HX+hSFij2qqqQrB9L713pPZyYyac5GdSxXcFdYFQXEr
 0zdm+VOUa91/dLEwnNlM09npvaHhl+vRVpkNe7cpICpOf795L/+Wv9AwZ1ewensdbi7U
 py3rcOWbTSY0QVc01jUmktNCaRxtzb2XGQ6izc6uofyXDwDkNWpewqKG96CbaGqsjZ1m
 EXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4KGnufapNqBiMWtnkdF4G9SPZ0eWsbVjA+XoQwdq7/M=;
 b=hByykHnzDVATNhPuoCI9pnDiyEyB53+8AmzXqTuJUOZpO20B8hWX/OggLZtzpxDQnN
 0mLEX96mjfGzw4R6140jpFJ1ZBMimLaqrhqRBzjiXSqDCM8CqYNhgMMwzN76uvUtVJQ6
 uqLa80tjS0OT4LLzDLwWppLxBzbhs8WWbgXdRce7X1SqTKEPqGd34lRJ0xHzev6eazvg
 h7SPP5MblJMa8WuYBzzDDImTy/YwRwFDkUK/sXkTgi1/n4sxBgpMWvD2J3M9r+Hj7XrP
 vZixRAWmDLUoS7s9Xt4iCTarNQpO1fVAwQT2KwiAvmzzPHLvkisye4wpqlbjmCG4ibqJ
 yCTA==
X-Gm-Message-State: ANoB5pmPOl62FFQTAQygK4PzfIQsYGjdZKgoBp0sC2CTXv5mdEFSc9lY
 +RqbjMQ/c1L5+hHevD5jAXUnlA==
X-Google-Smtp-Source: AA0mqf7NwiwFPlmrYbS2xEd5EsDvNqxFp0iai6LkwNJC1H+sEzFDGtnHoCcrytNsNQsRUDJwyhjsvg==
X-Received: by 2002:a05:6402:3445:b0:46b:14d8:af9b with SMTP id
 l5-20020a056402344500b0046b14d8af9bmr33412921edc.38.1671384419436; 
 Sun, 18 Dec 2022 09:26:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a056402015300b0045bd14e241csm3364492edu.76.2022.12.18.09.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:26:59 -0800 (PST)
Message-ID: <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
Date: Sun, 18 Dec 2022 18:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-7-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218171539.11193-7-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 18:15, Volker Rümelin wrote:
> Use g_malloc0() as a direct replacement for audio_calloc().
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_template.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index d343a1dcb3..5f51ef26b2 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
>           return NULL;
>       }
>   
> -    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
> +    hw = g_malloc0(glue(drv->voice_size_, TYPE));
>       if (!hw) {

g_malloc0() can't fail. Either you want g_try_malloc0() or
remove the error path.

>           dolog ("Can not allocate voice `%s' size %d\n",
>                  drv->name, glue (drv->voice_size_, TYPE));


