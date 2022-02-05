Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E1A4AAD00
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:17:33 +0100 (CET)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUJA-0002sg-6B
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:17:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUHA-000226-PE
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:15:32 -0500
Received: from [2607:f8b0:4864:20::629] (port=38700
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUH8-0001HS-R5
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:15:28 -0500
Received: by mail-pl1-x629.google.com with SMTP id c3so8298185pls.5
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lrYnFBMMsUk6NSHQ/EXdJ/8/ThQYEeEiEmnh72uJmTw=;
 b=gSYMoLHsaxwBav16ZeVMDSL1mrAbwfF4lRWPwV2IZwlfG3rrWCAqwgtQy/odATcEES
 GbHdglIRmjvzpITGw68u0m7651f5o6f15Es6sQ4lHJ/XECh3cG2wiWUEWPldgJzwALfr
 DQ1ugxCbQFSJH3aUA08NqApll22rzjWy6RTj+894EXxxtcUuuDjT1JFyJeGPmHHcLm0O
 kECqyeh7CZ6HEyJG9qXjobXI8c9/W90i1vr1sano866fqojP1xyxz6k6+Y6alW+0A4q3
 CGVI2y2T3M3nt6Ko8279JZGQHu3+TUsxR479JBDGUSoyQiBfevljVYXvd55+XV8JBbfV
 Arhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lrYnFBMMsUk6NSHQ/EXdJ/8/ThQYEeEiEmnh72uJmTw=;
 b=Zzjb3wWxXWfz6RqBWd7WdTdoYU+OF5VsMups5vS+wKA5Hod9BwY3y866Xe3YfB8Bfd
 wwhq+kxqVh5p2EznF+jyrQ9Vi8+MuWI9ng2Hdk2ua0i5RW+bWQ0zXToLJj58X03CDf5p
 lp+HgCNKF2r2EcB73TQ5jwqqAdi5nUFjSiQjpwexyoUTYXRkKI5xhmW8jSUzdEe6XPjs
 CzhTiVHs9+pDv53+B0GEz9BioDlxaRvhI+O3NaIr54bp1z5rYEygN6770Do7XVhNExry
 fzlKcxPXVtBx7G86BYKOo3mJW+q4OzT/JW2Ajst5Dvi4dKfvncU/QzeFe4pwj5nNN8b3
 WAvA==
X-Gm-Message-State: AOAM533v7JSTMkv4bDnLaFeipw6otGgVOfcZ7OAI4V7W3mohgAeeEawS
 cMQWhZbfMzOeOFEX2DzVA59wow==
X-Google-Smtp-Source: ABdhPJwWqJMteyvnON7TSPdWR/OnCGoit7woXcSO+rCyzGpAQUJot+xRASDDzXDSH58j3jBwRtgkPQ==
X-Received: by 2002:a17:902:8698:: with SMTP id
 g24mr9734161plo.110.1644102925411; 
 Sat, 05 Feb 2022 15:15:25 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id q8sm7554469pfl.143.2022.02.05.15.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:15:25 -0800 (PST)
Message-ID: <7aaca0dd-b7ba-ee3e-601a-197469ed768e@linaro.org>
Date: Sun, 6 Feb 2022 10:15:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 08/21] accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-9-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> Mirror "sysemu/kvm.h" #ifdef'ry to define CONFIG_HAX_IS_POSSIBLE,
> expose hax_allowed to hax_enabled() macro.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/stubs/hax-stub.c    |  2 ++
>   include/sysemu/hax.h      | 18 ++++++++++++------
>   target/i386/hax/hax-all.c |  7 +------
>   3 files changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

