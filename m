Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D113D9939
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 01:06:56 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8sda-0000Iw-Sp
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 19:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8scS-0007xA-Il
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 19:05:44 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8scQ-0000eX-R4
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 19:05:44 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so12511668pja.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ScdFKxcofDbibNvttYMB37cY5RVuUP1k8WsqbPnMuQ=;
 b=wMIvyVKNWSGCA8KuNQf/2ZB3VtkuXIplWzAKrc+OzxWxYjb8FVyc62ijClFm/0Fiv4
 KuB8EOpeLGHhaaXLCHuUyUqvI96ZwAydHtxJAeqbguEejszadZuMf2daN3mWDfjHu+Ya
 t2e1riy6cAEuJAQzGy1LXJ6vkn9rP8lKIkLCzRyqmZUgqB4RviuOaq2doEIIXUYoeTNO
 Uq5Mu+yrHM0wYd4mLRWwsH97O396bVklzCfzXhUPp+Y5cl7mWrvs1MMi582lYGcpcYmL
 48ezgv9SHI1HmCoNzkbuxCSKUtV6re9j76SdftH1Rd7aB4j0PX8DZG3NIR5nao+83kSG
 pq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ScdFKxcofDbibNvttYMB37cY5RVuUP1k8WsqbPnMuQ=;
 b=DARwEFtyq8cl0z/gntMErcnrwM4/PR80RwAHDvEykhFHP7Ray+9bx9+Jb+uS1S0rov
 oQibySYBHKhjiZrAe9rCFCihsiRVMi7RNNQ30fdW6inGxMqk5B8zCIQy5vWADwCvvHpo
 A4GPjqHEIz5UV1tAeNbdn3fNOcopgMbnJQckU8cLwkdp+ejNOC1ZdBdDiKAmLQR+sgCt
 6XxoQ8Qj2zf4PFOBf9L3htGZ1xRKWIvXTdJ2CVgWZBed35ATvK+ZDiNdq3qJjxyyyOfm
 FOjfI8776WEOzU5yR4N19lpUNyvXaUPWyc4CHXTLqlIWGGPBLrIoL8o4Og7YkxSh9c9b
 gvBA==
X-Gm-Message-State: AOAM530fcTtRHKcU7C3cUBiu2Ixf3YwRYWrizhz2ty9GaA28aU3Zlbmf
 tQEdyfJ+OFCA735asi7mmJjaDA==
X-Google-Smtp-Source: ABdhPJz9HmyZskALpJ+x7iN4/twlNH7NniDkaHRKNF+WFLNW3duGOVRDt3fB1d8AsIrsJKAd78BNRw==
X-Received: by 2002:a17:90a:d58f:: with SMTP id
 v15mr11714336pju.117.1627513541036; 
 Wed, 28 Jul 2021 16:05:41 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604?
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id kz18sm799135pjb.49.2021.07.28.16.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 16:05:40 -0700 (PDT)
Subject: Re: [PATCH] tests: Fix migration-test build failure for sparc
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728214128.206198-1-peterx@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a112589-5c89-b686-4dd2-c7255adb40e9@linaro.org>
Date: Wed, 28 Jul 2021 13:05:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728214128.206198-1-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 11:41 AM, Peter Xu wrote:
> Even if <linux/kvm.h> seems to exist for all archs on linux, however including
> it with __linux__ defined seems to be not working yet as it'll try to include
> asm/kvm.h and that can be missing for archs that do not support kvm.
> 
> To fix this (instead of any attempt to fix linux headers..), we can mark the
> header to be x86_64 only, because it's so far only service for adding the kvm
> dirty ring test.
> 
> No need to have "Fixes" as the issue is just introduced very recently.

What an odd thing to say.  How do I know that without the link?
Fixes: 1f546b709d61

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> Reported-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   tests/qtest/migration-test.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 1e8b7784ef..cc5e83d98a 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -27,7 +27,8 @@
>   #include "migration-helpers.h"
>   #include "tests/migration/migration-test.h"
>   
> -#if defined(__linux__)
> +/* For dirty ring test; so far only x86_64 is supported */
> +#if defined(__linux__) && defined(HOST_X86_64)
>   #include "linux/kvm.h"
>   #endif
>   
> @@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
>   
>   static bool kvm_dirty_ring_supported(void)
>   {
> -#if defined(__linux__)
> +#if defined(__linux__) && defined(HOST_X86_64)
>       int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
>   
>       if (kvm_fd < 0) {
> 


