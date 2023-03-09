Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B56B2B00
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJJJ-0005ZW-Fb; Thu, 09 Mar 2023 11:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJJF-0005ZJ-Gh
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:40:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJJD-0004nE-Nb
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:40:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id bx12so2487328wrb.11
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678380001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EttGygbuiv20IM7glOWqdT982D+gSt2/g+QYcBS+i5s=;
 b=fqXMBAh7LaD9kvrkLTSRGmnezs+df8sWYjMYinhJeXK54A8CZNX4xh+mvG1QCh33/p
 24xGcA/zjRV/p2PkQh8GwKOcRWuCEzo3Ae1CdIBOlSMQDowsgPoir0QnnXSs3Q5mHCO1
 1qSVe4QmVaQiHoUSrGwtHe4W/yIKsPIJcb5d/DSxu21vNv9O/clboHUkGCqytCiCMbmT
 Jyb5Ly4YdT7WhET5UpwZzhYl7+NIP3BuTF84ACpW2LW+dyoG+FQdNKu82c+NmxczU7jL
 yZGt5GZBZ4OQx3NvIRvwDqsPWI4jRI7xom1V+C7AycLfVrIBUK2n+htrRQHScpxwYKxY
 uY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678380001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EttGygbuiv20IM7glOWqdT982D+gSt2/g+QYcBS+i5s=;
 b=UaPISp7jRouuXnXlsAJxt9hYBe2EhhLdYMXkJyD5o8dPvxIgsb+iw3RqWFibh/w8LE
 AsuHZ4s463Ako6Zg+oq1hnvo8/hIxgYs24+ZAojVQV9PUHj0N25wsFAWkrg9Xhqm4uVa
 ZoOWcrjOqLYCF5kX5Vrn0L9GAIGZvGio3IhGTYhmMajikMKZVeO1RqavrWJuHcIrvjOG
 KdMxFTYNnYi5915FZ+IgZ5G7Yxv2pywfeUL0KVZUHCX3x5NZW++ArYZPyM2a5BvghbCz
 RSobGlas95eJ1HYQCoBttkGQc3zXc0hxZw329cizSclKQ8W9E0GOyUcuW0fxozO3bqeS
 LMWQ==
X-Gm-Message-State: AO0yUKVaovmU1RxysJnTOl7eXN8etY00nSWRnG3/3s9Offcpl5oc1HqZ
 ICfZsgZ0rxmuVvCMo/r+etAC/A==
X-Google-Smtp-Source: AK7set8EJ5jkYitSUiJ8bv3p4Ndi8z/+eXGwQApRKHFdqdXXExNnSg21N8sqywl4ADp8nUbYOTmguw==
X-Received: by 2002:adf:fe90:0:b0:2bf:b199:c7eb with SMTP id
 l16-20020adffe90000000b002bfb199c7ebmr13469529wrr.54.1678380001133; 
 Thu, 09 Mar 2023 08:40:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003eb20d4d4a8sm275667wmi.44.2023.03.09.08.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:40:00 -0800 (PST)
Message-ID: <7dee3544-2f80-3e44-c73d-1ddd507f00df@linaro.org>
Date: Thu, 9 Mar 2023 17:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/18] ui/sdl: add optional logging when _SDL_DEBUG is
 set
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-15-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307115637.2464377-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 12:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Apparently, there is no environment variable you can set for libsdl to
> enable logging.

Why not use getenv() in QEMU then?

> (similar to _VNC_DEBUG)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/ui/sdl2.h | 2 ++
>   ui/sdl2.c         | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
> index 8fb7e08262..6fea36db82 100644
> --- a/include/ui/sdl2.h
> +++ b/include/ui/sdl2.h
> @@ -6,6 +6,8 @@
>   
>   #include <SDL.h>
>   
> +/* #define _SDL_DEBUG 1 */
> +
>   /* with Alpine / muslc SDL headers pull in directfb headers
>    * which in turn trigger warning about redundant decls for
>    * direct_waitqueue_deinit.
> diff --git a/ui/sdl2.c b/ui/sdl2.c
> index f259e4c4d1..592eca3e1c 100644
> --- a/ui/sdl2.c
> +++ b/ui/sdl2.c
> @@ -841,6 +841,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
>       }
>   #endif
>   
> +#ifdef _SDL_DEBUG
> +    SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
> +#endif
> +
>       if (SDL_Init(SDL_INIT_VIDEO)) {
>           fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
>                   SDL_GetError());


