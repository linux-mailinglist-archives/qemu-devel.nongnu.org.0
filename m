Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24606A13B2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKvF-0005su-5Q; Thu, 23 Feb 2023 18:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKvC-0005pz-Oi
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:22:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKvB-0001in-68
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:22:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so12357631wrz.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E/xJrRnoUXx1uzQ46ynkvbQeUirojLWTA6seQ9JkCg4=;
 b=PaBLqkKVG86p975EP43vin6S1HvoH8Qi+3JOknaEEvOHHm7Noe1vv61rB7qxgjox9j
 WhgpHGov4XHh34TKN/hUlI/mUgegksFoA+rDE10Z1c872VBJChjA8dqtptH3Pyd67Ks8
 PrXGoRpEp4Kh3/eITd8xAquDb+JFTWnh+zkGPlVFv0vm1+f5VAksCXjWpapVhrNcrbxK
 p013uF0/N0O9hP6Oxssk+hkIx9jip5TgYOpphU9P/o0o41I6Tug4tD5L+zRtdVBuwXQr
 snCuYdNqZdT0Wg+gVSF3PlZYR0BmL8mZtZ+f8EgQVv3HxhNPXA/QJhee83tIcyM3f/tg
 N/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/xJrRnoUXx1uzQ46ynkvbQeUirojLWTA6seQ9JkCg4=;
 b=gM/b/heOfnDi/RHcZMbJjqC1OX6SHMg3whfkn7+dhZ8VJ36MLK/YP5nh3sDSHttFKn
 z+NK18tOQr49pLDpEMFU8zrtj3nQXHVVIIud+5LRF1pT1CEZsAIZ7aYjggQZOL5GTf1L
 lotQrTxnUNKA3XM5l2b3I3At7EHyXwXF7dejqmc23S5muI59ng+S4hNIRWwtPHFTzWyU
 GcwEMyx38WlyKvDHAOhN30dV0F+Hkj1erJBqwkGkTF6uA4YW6j0Mky/z82TsB77/Q6vj
 CkovxPzuKVkSmGb3lMXhXXnxjFHFYX2vtZXJMj9WzZeQg06ogOWqGqPAl9RNBoCcqmbC
 bBlg==
X-Gm-Message-State: AO0yUKUNh+X01eeu8YPQK3mywa7klIdbAMKLbmq5by9nbAnSU/3oYttk
 WEkK3kD1f9g8afOFISMr1lUpEQiE9gpEKOi5
X-Google-Smtp-Source: AK7set+BrNXWO/0dDy3xW88EIUt14ILGulppjfObJXlEfQNRIM5qnjJu1TDnhtArFfc5/z+GSHPFwA==
X-Received: by 2002:a05:6000:1b08:b0:2c6:e682:e55c with SMTP id
 f8-20020a0560001b0800b002c6e682e55cmr11567387wrz.63.1677194559558; 
 Thu, 23 Feb 2023 15:22:39 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b002c563b124basm11605955wrp.103.2023.02.23.15.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:22:39 -0800 (PST)
Message-ID: <d4a51f52-d207-4c71-aa39-1a795b50a9a9@linaro.org>
Date: Fri, 24 Feb 2023 00:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 7/7] dump: Rename x86-specific file as win_dump_x86.c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-8-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223231755.81633-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Oops, "win_dump-x86.c" in subject...

On 24/2/23 00:17, Philippe Mathieu-Daudé wrote:
> win_dump.c is x86 specific. Rename it as such in case
> someone is willing to add win_dump-aarch64 :)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/meson.build                    | 2 +-
>   dump/{win_dump.c => win_dump-x86.c} | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename dump/{win_dump.c => win_dump-x86.c} (99%)
> 
> diff --git a/dump/meson.build b/dump/meson.build
> index 6ae07e6fed..d899949a73 100644
> --- a/dump/meson.build
> +++ b/dump/meson.build
> @@ -2,5 +2,5 @@ softmmu_ss.add(files('dump-hmp-cmds.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'],
> -                if_true: files('win_dump.c'),
> +                if_true: files('win_dump-x86.c'),
>                   if_false: files('win_dump-stub.c'))
> diff --git a/dump/win_dump.c b/dump/win_dump-x86.c
> similarity index 99%
> rename from dump/win_dump.c
> rename to dump/win_dump-x86.c
> index ffeef4b738..5ee9a1d764 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump-x86.c
> @@ -1,5 +1,5 @@
>   /*
> - * Windows crashdump
> + * Windows crashdump for x86 targets
>    *
>    * Copyright (c) 2018 Virtuozzo International GmbH
>    *


