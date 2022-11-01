Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD9614FFB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:06:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprV9-0002rw-N6; Tue, 01 Nov 2022 09:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprV5-0002oW-Ft
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:40:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oprV3-0005ED-R9
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:40:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so12784173wms.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k7wvGKJ+NWT0JZQRfywf27Dh33krIV5ywCJQOcmSdD8=;
 b=pEu2Mh3EVFGlUKmJnYS2D7oHvKJFJSXe734TuH28TQldm/qZVYknquO/OYw5c51U+M
 1llzCLuaMtqWeluhifbZrv1sq009ZfE75+INQKBrO4VEQbjlxFVf0W9/nfjRdG8D46Su
 4Ang0OlKK9rStq6XRmZju++wcJkwnGZ4DdLL+DOpWI+0+sc5DRtj2aATEPyWF19kK5CC
 JxmLCspG2yQte31IedIAtJruoD5RjscRVoV1ReRZKyLnogHyDetzO7M2F2joQ3q11W++
 tY0houmyKnIbKLmlJW/9Zy+DekMsqHw12kvsnQaGx95HU5W/hF54FoIFfQIjkdIdatQf
 XP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k7wvGKJ+NWT0JZQRfywf27Dh33krIV5ywCJQOcmSdD8=;
 b=7hOLWlifK6xvmHCJGM07fgM57bbDMEnd1tVbj6iKu+S+ne8FAF0LIjDznRADTdnKGj
 rgz65l0QU5uDQP1ymKjrHH7lERImxUL+2r/gcSzd64RvdVFMLM9E698ShuWU5g8kTfuV
 zrLul5q3fHd9KJ5dLjYiIuX3pvOkNPstpy2XYkHIYTLENQh4OhNHfPDR2bgBm15TKXtF
 k+iVodjyT/i8V/HF9xbl0HxWG6d86qg1jqTobK4pS+r0RBqJkDiCCe15JEJdvvqlhaGg
 W1BuE2V0y+KeyoITHVV4h2Caf49JSID2NUnfcdyLyDWdDQftVmVRZAxd5zU880cZuMxX
 IY2w==
X-Gm-Message-State: ACrzQf3qF0qNU18f7hi7Qr+qmmPUDlXSOTriqFNso92/o455W6ClSebT
 lHJGTdMoNa/1q/KsFVQR1tgTrw==
X-Google-Smtp-Source: AMsMyM4FfWOB0Gi4HLRKV1urQesqd6oHTMerJgwo4UJZnEBap7h9NI68FmbbLRgXSpp7jylKcCU2lg==
X-Received: by 2002:a05:600c:35c8:b0:3c8:33dc:c262 with SMTP id
 r8-20020a05600c35c800b003c833dcc262mr11934230wmq.206.1667310016297; 
 Tue, 01 Nov 2022 06:40:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfdfc9000000b002366d1cc198sm10473094wrn.41.2022.11.01.06.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 06:40:15 -0700 (PDT)
Message-ID: <63320e56-1612-b828-2869-1bdb4a35ec6d@linaro.org>
Date: Tue, 1 Nov 2022 14:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019102015.2441622-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 19/10/22 12:20, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v4:
> - make the out of bounds access protection explicit
> 
> Changes in v3:
> - move the check of adding the same HANDLE twice to a separete patch
> 
> Changes in v2:
> - fix the logic in qemu_add_wait_object() to avoid adding
>    the same HANDLE twice
> 
>   util/main-loop.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..de38876064 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
>   /* Wait objects support */
>   typedef struct WaitObjects {
>       int num;
> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> +    int revents[MAXIMUM_WAIT_OBJECTS];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
>   } WaitObjects;
>   
>   static WaitObjects wait_objects = {0};
> @@ -395,7 +395,7 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
>           if (w->events[i] == handle) {
>               found = 1;
>           }
> -        if (found) {
> +        if (found && i < (MAXIMUM_WAIT_OBJECTS - 1)) {

Matter of style, I find this form easier to review (same logic than
what follows):

            if (found && i + 1 < MAXIMUM_WAIT_OBJECTS) {

>               w->events[i] = w->events[i + 1];
>               w->func[i] = w->func[i + 1];
>               w->opaque[i] = w->opaque[i + 1];

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


