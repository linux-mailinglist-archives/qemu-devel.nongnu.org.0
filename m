Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430266504A0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 21:35:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p70Mh-0000lJ-BC; Sun, 18 Dec 2022 15:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p70Mf-0000l2-39
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:34:29 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p70Md-0003IV-IS
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:34:28 -0500
Received: by mail-ej1-x62b.google.com with SMTP id tz12so17285804ejc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 12:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qG1P/ECH2cILz92LrKsS2oVa2Y6+icBrJ7H9PCg74uU=;
 b=LuFc5f8esRWJvleerIZ3tVb/XDzqVay6kEjTOrpF7tM18dhxnzqkKpP4SCyrqkoqw7
 Zp7+qLzMlWM0yBR87HdSozYM9nqVo3+OQNegGUy89tpSVO2MAxqDm7P8YTQFjXKdIiKj
 jabZXSrBNalvNbKzYyLESKx03uEZxUGLsfbPcUldzRiCJi2bwO19MH42Ey+5aXcp9aDh
 5N4QMf8n62prkb07P1vZUhViJynm5geMK3HV/14VNcEYQ4U/FDEK9pE2v4pvWbc0VZ8z
 4DGgjtp2ZVwjJO0scJitMFBMLiym7KJbREUyOaq3IW3TEs2f4q/56AV5nSdqayyip6im
 IuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qG1P/ECH2cILz92LrKsS2oVa2Y6+icBrJ7H9PCg74uU=;
 b=Xm0ldJQ3EsS6A884dtg4ahbbE90abaegm0xeuMFpWL9vV7CibIpGwnhVMAidk2gjYs
 KGlxbmivmbmRBMGXWht15GgQr5MMJ85s7PAZrZeW9uYgNfa7VYixKGY3GiQNyHFRceMz
 NMeKo/IxA6pEWMO3Xew8fxnQtml85tCVgYmpmj+oWPJa+0RNAjo77tp+jZj+ioLVX82+
 POv3GTTJW8Nzw/G5MbJIFDIL1Lwi5lDWrNL0kPGJrlgzP5ytrGO2UOQaW6onWHjb6C7R
 3e3RMC9VCBRa2xa3lLK6g5o5rPylGoVuf/q4qk2SzFPMmm57g7ico0Z2JWLipQzPKpvA
 t2Sg==
X-Gm-Message-State: AFqh2koGi91Buv2OAKuTic6Om5Xckyw75sQ8xnie2QZbQBWverSDvlo1
 D1RZSSRrB4OixnDkAJhdq8BLrA==
X-Google-Smtp-Source: AMrXdXsqWY2bZaoGjcsD5onWNQn6IXQuoOrOmUkZScciU1+sKot/Gjr45Eb8VfYdruY10al5HStkeQ==
X-Received: by 2002:a17:907:8d01:b0:81a:c653:4a06 with SMTP id
 tc1-20020a1709078d0100b0081ac6534a06mr2413851ejc.66.1671395664537; 
 Sun, 18 Dec 2022 12:34:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fr33-20020a170906892100b007c09da0d773sm3518575ejc.100.2022.12.18.12.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 12:34:24 -0800 (PST)
Message-ID: <6312d928-f5ab-b7e7-3bb2-9b319917e6ed@linaro.org>
Date: Sun, 18 Dec 2022 21:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
 <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
 <2688636.InQPIc3kla@silver>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2688636.InQPIc3kla@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 18/12/22 21:05, Christian Schoenebeck wrote:
> On Sunday, December 18, 2022 6:39:00 PM CET Volker Rümelin wrote:
>> Am 18.12.22 um 18:26 schrieb Philippe Mathieu-Daudé:
>>> On 18/12/22 18:15, Volker Rümelin wrote:
>>>> Use g_malloc0() as a direct replacement for audio_calloc().
>>>>
>>>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>>>> ---
>>>>    audio/audio_template.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/audio/audio_template.h b/audio/audio_template.h
>>>> index d343a1dcb3..5f51ef26b2 100644
>>>> --- a/audio/audio_template.h
>>>> +++ b/audio/audio_template.h
>>>> @@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_,
>>>> TYPE)(AudioState *s,
>>>>            return NULL;
>>>>        }
>>>>    -    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
>>>> +    hw = g_malloc0(glue(drv->voice_size_, TYPE));
>>>>        if (!hw) {
>>>
>>> g_malloc0() can't fail. Either you want g_try_malloc0() or
>>> remove the error path.
>>>
>>
>> g_malloc0() returns NULL if drv->voice_size_(out|in) is 0. I think the
>> code is correct.
> 
> Correct, that's the only case these glib functions return NULL. And AFAICS
> this can be zero with CoreAudio or wav.

Oh I forgot the '0' case, my bad.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


