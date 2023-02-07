Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2768D202
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJtz-0002gP-Ha; Tue, 07 Feb 2023 04:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJtw-0002eV-B7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:04:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJtq-0007sf-Uu
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:04:28 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o36so10520607wms.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wGmywMFJvjW/BA7ZpBCRvgl2EuBUSi8FR2be9TP5vkY=;
 b=hxORt4N5iKjPciFcDuEGe28BE5En41mleKdyBYfnNiKl+LAKU8KuwiER8mlj5BnS/Q
 WsUACrHk1WFxGMqBC+YOKc6pe0+yyb6hxo6I0WWPj89Nku5HNQpTGvxTOfGqXSH93tCN
 lYgxVf8ouXU5/LEddQKbBs6AYTU5D+pLtW1z2QBI7nbSaW4GXUgmj5NlWFOKvISTbycB
 Mp3qwChU4/uFUKBMySncNAUSf2QTQQsqzKof4+5yTYNX+Jsqh+1JfItGe8jdUs1Ri37G
 9UYM28aBVVvujPAqoVVLu3SJdxvbswUDv0uQrUTskDzuQA8Tat3ilC59MaSQr0zNRib0
 2JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wGmywMFJvjW/BA7ZpBCRvgl2EuBUSi8FR2be9TP5vkY=;
 b=j10Y8N7rWZXZRjspmYtTKnOyuTgyO3Y+SNVajY2VgYpHZ/9ZN+SFJe6xX6xPt/+RMT
 JUQOlU+GYdY0mxfvUiwyyq9noElKYJvfDiVGDO/mHwWVmyrSDJo/zkhZvkmDfc7N7jrH
 OcG3dAbuEmhd28+XS6oHuYb1TQYZwYHDEI7UvmfQBWPwhuVcW/P2UIvGVq//C079ayyZ
 /uuq4gaa/Ooiey/p1eSZ3jNIKuXL3tLG7amqDjwS378bii2wuNPnkkkENXdaOytKRFaL
 bmoCFT16OdLoNPPtWItOyBYRNaLJVXnaW2QrYtBRPzsVlHB9jPbnD2viDzovkFPP7JKp
 BbqA==
X-Gm-Message-State: AO0yUKXxPnBTWh+aWFjpdFT2pkF3a/U41/ry9ATSmGyxp2/7EkUrSV4x
 de2NzmqTvVTNY+TAot27MQQnCA==
X-Google-Smtp-Source: AK7set/ASH3H5kW5FiQxLY1e06msq3BoIus9ET5zd0mVzfuu6LJBqzy2EsiFWIn/N9sNG7TAa2+ijA==
X-Received: by 2002:a05:600c:3423:b0:3e0:185:e916 with SMTP id
 y35-20020a05600c342300b003e00185e916mr2435572wmp.13.1675760665622; 
 Tue, 07 Feb 2023 01:04:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003dc36981727sm20180585wmq.14.2023.02.07.01.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 01:04:25 -0800 (PST)
Message-ID: <42bf72a9-a8ed-538a-71b8-4e1abc86ee00@linaro.org>
Date: Tue, 7 Feb 2023 10:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] MAINTAINERS: add myself to ui/ and audio/
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: kraxel@redhat.com
References: <20230207085610.1033536-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207085610.1033536-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 7/2/23 09:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Helping out with patch review & queue handling.

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa10ecaeb9..337a7d8857 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2478,6 +2478,7 @@ Subsystems
>   ----------
>   Overall Audio backends
>   M: Gerd Hoffmann <kraxel@redhat.com>
> +M: Marc-André Lureau <marcandre.lureau@redhat.com>
>   S: Odd Fixes
>   F: audio/
>   X: audio/alsaaudio.c
> @@ -2772,6 +2773,7 @@ F: docs/spice-port-fqdn.txt
>   
>   Graphics
>   M: Gerd Hoffmann <kraxel@redhat.com>
> +M: Marc-André Lureau <marcandre.lureau@redhat.com>
>   S: Odd Fixes
>   F: ui/
>   F: include/ui/


