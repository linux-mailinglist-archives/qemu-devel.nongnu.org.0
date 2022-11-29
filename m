Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E0663BAD3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 08:39:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvDD-0000tr-AM; Tue, 29 Nov 2022 02:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozvCx-0000qC-Oz
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:39:14 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozvCv-0001r7-TU
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:39:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n3so20668118wrp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 23:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=605fnWa8TYZTGeBlZjVmHTc6rzio4jXgb+tSBzhtPjE=;
 b=j6HEs85I7tn7fq/DaU/H95RuJcIkK6YZ7KI5WKn0khdXMYDY28OauK5ptmFqkR/HM7
 rymovKC4k+GWfNgB7/h/vUXsufeTKtTCyGG8FiL6yG4AtdvdWk0nbCk9cl1x4P2jS/pO
 RUxgGLieE644goqlHcBH/TinvIf+6j5/GPhSUveIoZd+NTcu184X9ffnvEyFivmWjZoL
 CXcOdG7U2z024VDp2rphkfw5Zh8VU18cd+juId9j/NYRUCGEC6xSYb3txCWE0uv4P+Kc
 KekcTz3aC9RESmxPjxFlEmmntrZkBtpzNlhNk2hkM0wvycd2dGhHbiJJNTAwSw4buwFG
 +K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=605fnWa8TYZTGeBlZjVmHTc6rzio4jXgb+tSBzhtPjE=;
 b=iEQNbIG8LgHjEL0nTwqg0lzk3m2Iojecj4By0N8DSGXosXWh5DWv/HLRVM6eaCUES7
 ElTU1EYBgkIhTBY1ygHFaCkVBZGgqRS1PhdK5vEi8IKf8D5e2DLltek82s+8HqtUxVK8
 bY8ro9b8BRIberedn2WM33zJSNxmPzo7qsENxSsqF9Ew4k2njSsq8xO05r/9anK/05Xb
 TzZvzb04erA2UPipVzCv165mPWZxeyNhmmvYciE8cGo2G+Qajyad0+kAX1Ybc+MgGyvU
 qGNJpdHFlutqjnASk3vR3MwHCx/RXu7Xq8tWLzT/WHXiPHCFRR29tf/sCobdbM8PDezn
 7URQ==
X-Gm-Message-State: ANoB5pk84+apak4ok1C2C5xPU4K2xdp43TYuOLBxBHXNvVnANXo2UdXs
 6e0ZM4RZoJN6Bidg4FeRKKPOMA==
X-Google-Smtp-Source: AA0mqf56ILmXpJMqTDM3mMf721kfJJi5LfAX0gJfmGG9ryiyctXUV5Rqocrm3UQ4Ij1a/L6/iPpk6g==
X-Received: by 2002:a5d:444d:0:b0:236:8dd7:1922 with SMTP id
 x13-20020a5d444d000000b002368dd71922mr32378755wrr.564.1669707547889; 
 Mon, 28 Nov 2022 23:39:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c468800b003cfaae07f68sm1089677wmo.17.2022.11.28.23.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 23:39:07 -0800 (PST)
Message-ID: <d7d533b1-14b1-3fa9-432e-18f7d8fd8053@linaro.org>
Date: Tue, 29 Nov 2022 08:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pavel.dovgaluk@ispras.ru, stefanha@gmail.com
References: <20221129010547.284051-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221129010547.284051-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 29/11/22 02:05, Richard Henderson wrote:
> Fixes the build with gcc 13:
> 
> replay/replay-time.c:34:6: error: conflicting types for  \
>    'replay_read_next_clock' due to enum/integer mismatch; \
>    have 'void(ReplayClockKind)' [-Werror=enum-int-mismatch]
>     34 | void replay_read_next_clock(ReplayClockKind kind)
>        |      ^~~~~~~~~~~~~~~~~~~~~~
> In file included from ../qemu/replay/replay-time.c:14:
> replay/replay-internal.h:139:6: note: previous declaration of \
>    'replay_read_next_clock' with type 'void(unsigned int)'
>    139 | void replay_read_next_clock(unsigned int kind);
>        |      ^~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 8eda206e090 ("replay: recording and replaying clock ticks")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   replay/replay-internal.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/replay/replay-internal.h b/replay/replay-internal.h
> index 89e377be90..b6836354ac 100644
> --- a/replay/replay-internal.h
> +++ b/replay/replay-internal.h
> @@ -136,7 +136,7 @@ bool replay_next_event_is(int event);
>   /*! Reads next clock value from the file.
>       If clock kind read from the file is different from the parameter,
>       the value is not used. */
> -void replay_read_next_clock(unsigned int kind);
> +void replay_read_next_clock(ReplayClockKind kind);

Preferably having this file including "sysemu/replay.h" in the same
patch:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


