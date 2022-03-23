Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140814E5A46
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 21:58:01 +0100 (CET)
Received: from localhost ([::1]:58138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX83L-0003zh-NT
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 16:57:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nX81x-0003J7-Fk
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 16:56:33 -0400
Received: from [2607:f8b0:4864:20::62b] (port=46782
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nX81v-0007YK-Or
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 16:56:33 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w4so2708886ply.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 13:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q/k3wcHXNikb5tqQBFm/3fxIKyfYwoD634rUB0dfwLo=;
 b=JwkOCg7Y3eEyjfhq+bbFz0gqUHclfkGfk2vjusc94jDzvwYBi7hDMD+0ZS8Jpgvt1i
 XP8XnVB0gRMDdCS9++h2N883Vy2sR4xD2j0jsdjAygRHc2kCHT8cAGBzXIMFsjUXz2D2
 0ZiYVb/AjaxIJbIkFJgist4Z6i2SUOcHfO+0Hty2VhU9s3Vz7RkcJcU3niqWa42FdsFi
 M64MIKKztKrVhXdsiUGzDvtCaPLj1UzGfGulfoBfJFQFlxmmAUiT41mNE9KPo4Swn8cd
 vjpeEWnoaoYGHNK/pNUGBDg3/ES/6EVvHlckfWsgKtUv4BLccbnbSsVz90jd+jtKl1Hw
 jpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q/k3wcHXNikb5tqQBFm/3fxIKyfYwoD634rUB0dfwLo=;
 b=Z1FfAKQ8Ujjv2vVaaSBdZ2tJ+cJRFT8dauionOP6USZwugvlCd9gNtvybPH1FoQSwN
 MfrQDAL/zcmCG2nz6T5o8FzRpGk5G9uytMZLTMcpDr6KOd2ly7aVUZKwCNtmKgGph0gi
 qtrCQB6JPj+lbUcO8KhGJMgJb9wsTDS2dtHVp1iyCpH23i3A4X+3j5F62ytRURDyD+uH
 XXbTmTV3fAnVL+o8feMGJ/16YOGzyYFvaRag3JcUAWXZEsYB1hqE6DXejcPjUP2T2krx
 qCLMaEkezIl3NaiTBcuJFUiBGJqaVXvDZpqhYM0th7o952w5UqWWAO78HftFZZUhkDBe
 cSJg==
X-Gm-Message-State: AOAM531m7azNGxWjLLcw5EDY/rjFJIULjtlZ+4gGmjwkUQNccY1GJ+vt
 O6aRmgxtzUj9hTF9lHp8Ow4=
X-Google-Smtp-Source: ABdhPJzmmISDUuwFVkHZfqp5BCdCnB9Z+j2DFwcOSb2LgrvNvCLPyzdzsiiOtUW6jHSWe24uAxpF9w==
X-Received: by 2002:a17:90b:1184:b0:1c7:2d83:6e03 with SMTP id
 gk4-20020a17090b118400b001c72d836e03mr1811727pjb.221.1648068984286; 
 Wed, 23 Mar 2022 13:56:24 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 c69-20020a633548000000b0038554192b91sm599447pga.38.2022.03.23.13.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:56:23 -0700 (PDT)
Message-ID: <93d39976-324e-de23-f4bb-12e8d6c98323@gmail.com>
Date: Thu, 24 Mar 2022 05:56:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 31/32] RFC: Simplify softmmu/main.c
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-32-marcandre.lureau@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220323155743.1585078-32-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/03/24 0:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Move qemu_main() declaration to a new header.
> 
> Simplify main.c since both cocoa & sdl cannot be enabled together.
> 
> (there might be some small conflict with the RFC patch "cocoa: run qemu_init
> in the main thread", but the two look like they could be used together
> to improve the code)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/qemu-common.h |  5 -----
>   include/qemu-main.h   |  6 ++++++
>   softmmu/main.c        | 25 +++++++++----------------
>   ui/cocoa.m            |  1 +
>   4 files changed, 16 insertions(+), 21 deletions(-)
>   create mode 100644 include/qemu-main.h
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 65483f70d4fe..0498acd16b78 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -19,9 +19,4 @@
>       "See <https://qemu.org/contribute/report-a-bug> for how to report bugs.\n" \
>       "More information on the QEMU project at <https://qemu.org>."
>   
> -/* main function, renamed */
> -#if defined(CONFIG_COCOA)
> -int qemu_main(int argc, char **argv, char **envp);
> -#endif
> -
>   #endif
> diff --git a/include/qemu-main.h b/include/qemu-main.h
> new file mode 100644
> index 000000000000..74d670bbf9a7
> --- /dev/null
> +++ b/include/qemu-main.h
> @@ -0,0 +1,6 @@
> +#ifndef QEMU_MAIN_H
> +#define QEMU_MAIN_H
> +
> +int qemu_main(int argc, char **argv, char **envp);
> +
> +#endif /* QEMU_MAIN_H */
> diff --git a/softmmu/main.c b/softmmu/main.c
> index 639c67ff4893..c00432ff098e 100644
> --- a/softmmu/main.c
> +++ b/softmmu/main.c
> @@ -23,28 +23,14 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu-main.h"
>   #include "sysemu/sysemu.h"
>   
>   #ifdef CONFIG_SDL
> -#if defined(__APPLE__) || defined(main)
>   #include <SDL.h>
> -static int qemu_main(int argc, char **argv, char **envp);
> -int main(int argc, char **argv)
> -{
> -    return qemu_main(argc, argv, NULL);
> -}
> -#undef main
> -#define main qemu_main
>   #endif
> -#endif /* CONFIG_SDL */
> -
> -#ifdef CONFIG_COCOA
> -#undef main
> -#define main qemu_main
> -#endif /* CONFIG_COCOA */
>   
> -int main(int argc, char **argv, char **envp)
> +int qemu_main(int argc, char **argv, char **envp)
>   {
>       qemu_init(argc, argv, envp);
>       qemu_main_loop();
> @@ -52,3 +38,10 @@ int main(int argc, char **argv, char **envp)
>   
>       return 0;
>   }
> +
> +#ifndef CONFIG_COCOA
> +int main(int argc, char **argv)
> +{
> +    return qemu_main(argc, argv, NULL);
> +}
> +#endif
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index cb6e7c41dc6f..e566372b8f73 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -28,6 +28,7 @@
>   #include <crt_externs.h>
>   
>   #include "qemu-common.h"
> +#include "qemu-main.h"
>   #include "ui/clipboard.h"
>   #include "ui/console.h"
>   #include "ui/input.h"


