Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23CE658CB4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 13:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAs4A-00017t-Ty; Thu, 29 Dec 2022 07:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAs43-00017X-5W
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 07:31:15 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAs41-0000QX-Gr
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 07:31:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id w1so5141579wrt.8
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 04:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjvJ8l1Xkgbkm1tfvTQY2T39JyefoiKwKNfJtfC9Eac=;
 b=FqhxIhc0cOZKzslxx48XUsKAn7yFYPI9/gVVkPZ9ouOeOQBKkC1JjK2SQRVozoVp1q
 JP6ygy/xnS9MlMMMIuWf07kTwPB0KL02+Pe+H69yL52Fpu3PlbeKSlQH5xjXsxQua8VQ
 RUL7rc7Cvz0Gt77AFuLhMhrtSRVGe2ptahSfIEpbfxBEbxqX1i6u7VtVyGkf8YQxH+pc
 SFEHFz0pT7XurgIw5hqEXlNa5NSiVOmBrpKJp55GHxHGKUMIgtYejdVMtNmEZqfUfHmD
 IlHpZJL9xSc7Z/9CAAo9DgCNeHrD5LNCH/QxZ2LZQSMvQc9ka1Y97QC2kICYb8EbZfgt
 ihRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjvJ8l1Xkgbkm1tfvTQY2T39JyefoiKwKNfJtfC9Eac=;
 b=PeuaZ0Ad8FPKqx8P0GMCu/cdndj8Za3XtBD/DEi7t+A3HdgiZZTxLVH75QXajVseBN
 PyqGqO4MVpWpShw7tR/IheTpPQP4t6u4PjnObT5lJNYCrxjG/AwI56IHNw7E57waCWIH
 hVB78lfJplYwx/PnSXrGH0nNAeZZc2AK/2MqK1ZxjZZ8MkNum4Odi/GE7HT+XknVZMBi
 d2+iOKTNjiC8OXsJ/nKZbZS0l3zKtagu8potiO87EONGH2Y1zlZTCpofXbBESaBt4y26
 F81zs/mkjE87pnWrwgjEKZzI9Sdgu53jTU6kzlZLzEjbkfBcAldg19quaMx2Y9AlvGwX
 Lrng==
X-Gm-Message-State: AFqh2ko+ExCTFiYZV/HEDngKYmvAugnDoH0w4z2eDFinK5KF6kYmqryK
 rD9SpdJUadRlCF3zh/9RyP0zQw==
X-Google-Smtp-Source: AMrXdXvwc35gy9Xdcj4hPxA4tm/+eufqwzVJM/nzsXp9NDWYqXy37U83c6Vg4FkprOaifapoOHkc9w==
X-Received: by 2002:adf:f38f:0:b0:242:102c:c571 with SMTP id
 m15-20020adff38f000000b00242102cc571mr16773714wro.19.1672317071435; 
 Thu, 29 Dec 2022 04:31:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a18-20020adfed12000000b0027cfd9463d7sm10993421wro.110.2022.12.29.04.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 04:31:10 -0800 (PST)
Message-ID: <50787eef-d8a2-2790-749c-407e90e1d46f@linaro.org>
Date: Thu, 29 Dec 2022 13:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] ui/cocoa: user friendly characters for release mouse
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 27/12/22 17:15, Christian Schoenebeck wrote:
> While mouse is grabbed, window title contains a hint for the user what
> keyboard keys to press to release the mouse. Make that hint text a bit
> more user friendly for a Mac user:
> 
>   - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
>     keys typically displayed for them on a Mac (encode those symbols by
>     using UTF-8 characters).
> 
>   - Drop " + " in between the keys, as that's not common on macOS for
>     documenting keyboard shortcuts.
> 
>   - Convert lower case "g" to upper case "G", as that's common on macOS.
> 
>   - Add one additional space at start and end of key stroke set, to
>     visually separate the key strokes from the rest of the text.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>   ui/cocoa.m | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index e915c344a8..289a2b193e 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -72,6 +72,9 @@
>   
>   #define cgrect(nsrect) (*(CGRect *)&(nsrect))
>   
> +#define UC_CTRL_KEY "\xe2\x8c\x83"
> +#define UC_ALT_KEY "\xe2\x8c\xa5"
> +
>   typedef struct {
>       int width;
>       int height;
> @@ -1135,9 +1138,9 @@ - (void) grabMouse
>   
>       if (!isFullscreen) {
>           if (qemu_name)
> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
> +            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)", qemu_name]];

I was a bit confused by the control symbol at first and tough
I had to press '^'; thus I'm not sure keeping 'ctrl' wouldn't
be clearer. The UC_ALT_KEY symbol certainly is. Anyhow,

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>           else
> -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
> +            [normalWindow setTitle:@"QEMU - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)"];
>       }
>       [self hideCursor];
>       CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);


