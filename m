Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87A4CD7FE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:36:26 +0100 (CET)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9yj-0002jN-Fy
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:36:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GI-0006AI-KN; Fri, 04 Mar 2022 09:50:31 -0500
Received: from [2a00:1450:4864:20::42d] (port=42536
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GH-0003be-6g; Fri, 04 Mar 2022 09:50:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u10so11414428wra.9;
 Fri, 04 Mar 2022 06:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MGS/+W8dyY3yTIUkXGZbMahiqpJQacXzsZHqUpyMwdw=;
 b=g2P9RluNi59yucJzrmUsJJyThxNEROrcqBJA0de5Ag8wTj8KFoDlQhrcu44pRhBC/4
 2z9sS/1NF0qLrWkthGt1mzXeWlgi4udXnKCLYcJvVNZsChiV0mC88tWvunkNDCymG8X4
 VIPaFV9+kg9U/EzVO7fBIKO7wtp6aFbP5jDJlNlUOHjX3PNHFIZ0mwTTuptWiUycD5iH
 acLCvO9DpTZnC7ANXPCrn6OC1K5p2bTaa2i4Xjc5MAjVCs/lForwSpf7GFE3Rx0vBkSO
 RoHXaZW0kryx0CVQnzy8B240cMzrOSasLF7mVb0gVQJzMuRDZH2PWreszT47lQ24j5E9
 OFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MGS/+W8dyY3yTIUkXGZbMahiqpJQacXzsZHqUpyMwdw=;
 b=JHYC5Mdl9IjGc+sMOD4ueFqrhuF8FmZzDa9ggHyoMtmqWCYZoqdeT3c8x9OrWA8Zyp
 7g5WXNJL5MVpj9UqZocCyZ4xj2zcdFnZ5ii7Q1p+ZCqFZpYlPzA4ckH5p6ZAyk5/zEXv
 71Dyo/9ajDuHnxgWJ8LTvoYpkUWEMeynHWX+4dMzorQ9Pto+in/hmNCtvJE2h3J69CMG
 /+f0JXU7IeS4pRuC56JLPjS8jy5OORGrtNvsKVaDjUGIwmEtCxX9dG3SiODD1XbyEDPx
 exyL+Gg1LbkzHwMXNmLMg6KxlgSRJfFYleuW9xRs2u0bIgz+WbIc/AWYyhM79HyquJ9K
 Hbmg==
X-Gm-Message-State: AOAM531bwqj5tB5xNQsejJxliZUbbzza++bGUYuSufwYloYme9j7yn/j
 rJwMTqC39gDO12NcvTlY36sIJbliQUQ=
X-Google-Smtp-Source: ABdhPJy3/5D01zZ6Zsmx1kqkDyFPm4nIIJGryfoJ1jhNhxjaadyzQ2tBeqpbOIM1FDCnxDFr1fb0zg==
X-Received: by 2002:a05:6000:8a:b0:1f0:2d53:8589 with SMTP id
 m10-20020a056000008a00b001f02d538589mr9632212wrx.431.1646405427538; 
 Fri, 04 Mar 2022 06:50:27 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az42-20020a05600c602a00b00389886f6b21sm972163wmb.38.2022.03.04.06.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:27 -0800 (PST)
Message-ID: <81a38f87-6db1-4e8f-0f09-90587ac2ba53@gmail.com>
Date: Fri, 4 Mar 2022 14:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 4/9] util: Return valid allocation for
 qemu_try_memalign() with zero size
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304112126.2261039-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:21, Peter Maydell wrote:
> Currently qemu_try_memalign()'s behaviour if asked to allocate
> 0 bytes is rather variable:
>   * on Windows, we will assert
>   * on POSIX platforms, we get the underlying behaviour of
>     the posix_memalign() or equivalent function, which may be
>     either "return a valid non-NULL pointer" or "return NULL"
> 
> Explictly check for 0 byte allocations, so we get consistent
> behaviour across platforms.  We handle them by incrementing the size
> so that we return a valid non-NULL pointer that can later be passed
> to qemu_vfree().  This is permitted behaviour for the
> posix_memalign() API and is the most usual way that underlying
> malloc() etc implementations handle a zero-sized allocation request,
> because it won't trip up calling code that assumes NULL means an
> error.  (This includes our own qemu_memalign(), which will abort on
> NULL.)
> 
> This change is a preparation for sharing the qemu_try_memalign() code
> between Windows and POSIX.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   util/oslib-posix.c | 3 +++
>   util/oslib-win32.c | 4 +++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 0278902ee79..f7e22f4ff9b 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -209,6 +209,9 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>           g_assert(is_power_of_2(alignment));
>       }
>   
> +    if (size == 0) {
> +        size++;
> +    }
>   #if defined(CONFIG_POSIX_MEMALIGN)
>       int ret;
>       ret = posix_memalign(&ptr, alignment, size);
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 05857414695..8c28d70904d 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -48,12 +48,14 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>   {
>       void *ptr;
>   
> -    g_assert(size != 0);

Better, X_try_Y() functions are not supposed to fail.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

