Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC4363762
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:43:20 +0200 (CEST)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDKB-00032B-3f
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDHa-0001fc-MJ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:40:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDHV-0001fm-AI
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:40:36 -0400
Received: by mail-pg1-x529.google.com with SMTP id t22so22789494pgu.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YuTv0Ke9KnVjQAVkpUTn1XY7S8m748FcQYlkSJIWBJQ=;
 b=tl6PqgxTik70q8qFx12pbPRg/R6yDYi/MJ4/n0wQQevaIKU3Su0AS/xepNA4dGrzRN
 SCvCkdOFucihuo4MuDnw88pI3MeQJKi5tWM5BPpyFzKls8OsCQiEXpU/Ff0Jks+9gyBi
 oHvfA/HFe9HUj/o6z1QrccTJolQBqUi/vCVV0vw52Zu4ZUwVRJT6tY4ZH04OT70jS7LY
 4ZYJwOkFKp19Fkas5mXdIRQeQG1qPqNd4DpJJIuOwZLp3CNQWbg+C12F1Pxr5i38qnxF
 1U5ur2xWIxA4X6nCJfmKn46qvqc+EE86maIdJul2V1ZW0DTi2xwaw5r2GNUn3KBcLwCV
 wAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YuTv0Ke9KnVjQAVkpUTn1XY7S8m748FcQYlkSJIWBJQ=;
 b=YwjJxlHxCiOC+axfCEuNmRX2fYYbIbZ+64C2/GN47U3P/tktz52rYv+9B8lBJV2XOo
 wfh+Uo74UEZE/27f+Nvkdxz0H7DF87el3MwSzgEmAWk6CUb65YXhdQk61Yohme/P4Y6F
 olJHE7GkAam5adVChyu0HQ5FXLpiN3LmJ1OS5gp6QXohSEeyJ7gm1PAwkTzgYCnvdy01
 Sq6LjPXwKmHte61K8BePEypAQNaYJ76KY0oT/q3RQTt9Rexnad9DX9e5kmpDAgTJj7UX
 pnWSNhiibW3s9e6a8lMafE2ZRmiVk+LWzuxiHa5b3q8Ayvp4ClM0kiGhMro3LKK9Bcn5
 AObA==
X-Gm-Message-State: AOAM530A4IG4+eRfcopnqE0ka+A2D0+vK/lSLESX9WVjW0PJjfN6BcXx
 1HNgWAFHVhc9zUsLuAKT8XO4Mg==
X-Google-Smtp-Source: ABdhPJzjKB53Zo8FQFPJkrBjwUnOm4NEnb4X2DtiKmxppMijvRF9/jtmD/qBzKYpP202iS+O4l6AbA==
X-Received: by 2002:a62:ed0b:0:b029:25c:9ea2:abea with SMTP id
 u11-20020a62ed0b0000b029025c9ea2abeamr6630642pfh.46.1618774831946; 
 Sun, 18 Apr 2021 12:40:31 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id d3sm12179042pju.11.2021.04.18.12.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:40:31 -0700 (PDT)
Subject: Re: [PATCH 16/26] target/mips: Move tlb_helper.c to tcg/sysemu/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fab3ffc1-4e0a-8c31-b657-beeff3d34393@linaro.org>
Date: Sun, 18 Apr 2021 12:40:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Move tlb_helper.c to the tcg/sysemu/ subdir, along with
> the following 3 declarations to tcg-internal.h:
> - cpu_mips_tlb_flush()
> - cpu_mips_translate_address()
> - r4k_invalidate_tlb()
> 
> Simplify tlb_helper.c #ifdef'ry because files in tcg/sysemu/
> are only build when sysemu mode is configured.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h                    | 5 -----
>   target/mips/tcg/tcg-internal.h            | 5 +++++
>   target/mips/{ => tcg/sysemu}/tlb_helper.c | 3 ---
>   target/mips/meson.build                   | 1 -
>   target/mips/tcg/sysemu/meson.build        | 1 +
>   5 files changed, 6 insertions(+), 9 deletions(-)
>   rename target/mips/{ => tcg/sysemu}/tlb_helper.c (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

