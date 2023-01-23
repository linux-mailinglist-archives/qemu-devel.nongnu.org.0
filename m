Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6F67759B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:30:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrHE-0006br-6H; Mon, 23 Jan 2023 02:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrHB-0006bE-KY
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:29:57 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrH9-0006lX-GX
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:29:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id g10so8253927wmo.1
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOUisgqUlNpSS6htmfq9yKyIBS8hQAph5eip8NaHiyY=;
 b=jVCtm2qgZH6MYn4A5rDH7sbZJu7wmlB7S2SMmuVIR87HgQ4FnxK0xIyCNlUq3VbDZr
 M+WsFO3+5Yyt5IDBiSzeV4BFZRqaqtgWI/WkZYFg3dnRKnK7EK/HKk1Wtuug73mez4WP
 xSo3Lw2D+d4uZdKUPcZrQDcFmYzXUH6KpAv8GJWKoD+u3Anzl7OSFZ9EsBKGlitrvP0O
 uW3uk52b8ueTEvj4vlG2XkzL5oCcDR5xRxNBNLoNE70EAJtRQ7znONy9hA7Q2kVAoMCz
 +xYZRpJYeoLBccRrPEaDdQU7DRIfS09NABaXwIQmFb6BR6dIouV0UrDzod4OVkXh9Bj7
 XIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOUisgqUlNpSS6htmfq9yKyIBS8hQAph5eip8NaHiyY=;
 b=z+kK3mAIhOUDJh93kCw4L7pPAbF3Zv1VILXMw4QGXO8upnJt6MU/YGfxSg6lkfog2j
 GKENzlXqLfcuZ4fPekZlcJ6o/1ILcOUl8MMx9nqg/iqGnnZfmM3Apg8OgoiCtoAfMkPh
 SskYHvtGs8PTM7AGeqDaMg3RxT9FrRNC4kVYlebvMgOeuzxaq9iijAAieMm+loYiHjQM
 YgX0HbVj0dOJ7TNgSt5eugRG0ZzBIJ/bWxoLfZovvAwqLk1rKQoJKKqcOuPllUGqc1fj
 rPGNBsP2QPwC9b2sK1kN42+vMevS+yno6mpxFIgGVUY+TjdDaS8hYlo54w2t1Mzesllt
 iYzQ==
X-Gm-Message-State: AFqh2koEcu2Y66fpfFYZqoWPxCbcvszPNROgGUMf30TkBX8t3w0Nk7yi
 sTEQ4aQ+UwkO7MGt1Pv8TVG6Fw==
X-Google-Smtp-Source: AMrXdXspPBRQ2/6RNZlYJAASRxm14ROfX2mY0rxuiTUQHrT9CM0szZax+ozWMaee/LbRE2Q3wzJSnw==
X-Received: by 2002:a05:600c:16c9:b0:3db:222:3e0c with SMTP id
 l9-20020a05600c16c900b003db02223e0cmr22765247wmn.33.1674458992795; 
 Sun, 22 Jan 2023 23:29:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm33996593wrw.29.2023.01.22.23.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:29:52 -0800 (PST)
Message-ID: <08362288-ac57-6d96-d9c8-aad708001e43@linaro.org>
Date: Mon, 23 Jan 2023 08:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/5] hw/char/pl011: refactor FIFO depth handling code
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120155447.31702-2-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/1/23 16:54, Evgeny Iakovlev wrote:
> PL011 can be in either of 2 modes depending guest config: FIFO and
> single register. The last mode could be viewed as a 1-element-deep FIFO.
> 
> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
> depth handling code to isolate calculating current FIFO depth.
> 
> One functional (albeit guest-invisible) side-effect of this change is
> that previously we would always increment s->read_pos in UARTDR read
> handler even if FIFO was disabled, now we are limiting read_pos to not
> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
> 
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>   hw/char/pl011.c         | 30 ++++++++++++++++++------------
>   include/hw/char/pl011.h |  5 ++++-
>   2 files changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



