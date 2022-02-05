Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFE14AAD1F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:58:43 +0100 (CET)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUx0-0001mu-UQ
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUtW-00087Q-JW
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:55:06 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53085
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUtV-0006Oe-6k
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:55:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id v4so3367066pjh.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lKOeLYWrcQ8TcBuOZQq0PvgVHM2dWypXaP9eA84kue0=;
 b=S//Fj/dwh4y6GB85jZy1kABioExAHLvxr6WD4lAvTe7/QwCcys5a4OknjWuKwRyEgK
 ki8CXFzX9TlS7K8j0zKRKmVyAMJBnMJiyQGJ61bQkLu9vdW2WLrPIq8QXy5UtXYQRmK+
 5D690m+y1KiCMY68FT6zaExTv7eZ/UABL+pskaVzzhiz/SJmP7aBkd0R3UET2S9Ot2q9
 PuMORkO2Ahkq2D5vXiz9rga/FkfAUoi3eH5xbtjAyEkijp/WmbEOPuw3avTsQQXCk8Ok
 Pw6dO6OyJE4ePufnp5DDwKyi9tbxXC+SD238j4sAYY3eAjs9C67WmPpzPpo2tcP/u8iS
 J9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lKOeLYWrcQ8TcBuOZQq0PvgVHM2dWypXaP9eA84kue0=;
 b=jaauBS+IeZU/t0Dl7DycYXRIWXKnNNLSul0GZjk+dv7FkV84MEeXn6KyaORHuMN9wf
 Q9B97b1thZJl6hL5ZEb7Rd4o67rHBtQ4GlqlgsZOL1EsITDT2kkeB0iwvpogkkcvhy8r
 4zGvXjuK65rqS2x6sl4WtoSIG+/Y3ETp2n/w4BRP8XUtNWqzJimxqlgnc6gRO4MsXpPP
 u3adWbnv1HYABZTH6sDaruMhqDrfxjW4S9hQ86UBjMieU5mdW98WS0o+ejGixulThEy3
 9peZfiS/UjzPOksg4e7f9BglJ9hQu7LIeqfJnUsS1eWr2xVLYwjsT8lUrrpKYapKJ+1R
 /n1Q==
X-Gm-Message-State: AOAM531/eCFi8wRuEnkxRrvjDNE55ck5KZywn9+uKhPYtbGOXx5yVGoD
 MN5lCFtrgLIL8ybezAV75FJGaA==
X-Google-Smtp-Source: ABdhPJxA6zo3Eo+Z0Fnx5VJzreRWaIRnysJa1GMAKRbCEx1fjC/LMYepGRyB3HmF61l12WjpJZfQXQ==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr10843359pjb.130.1644105304036; 
 Sat, 05 Feb 2022 15:55:04 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id q9sm17011608pjm.20.2022.02.05.15.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:55:03 -0800 (PST)
Message-ID: <dc7edba5-40bf-87c7-8361-7ab79b68c36f@linaro.org>
Date: Sun, 6 Feb 2022 10:54:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/10] linux-user: Add missing "qemu/timer.h" include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-10-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:38, Philippe Mathieu-Daudé wrote:
> "qemu/timer.h" declares cpu_get_host_ticks().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/i386/cpu_loop.c | 1 +
>   linux-user/ppc/cpu_loop.c  | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

