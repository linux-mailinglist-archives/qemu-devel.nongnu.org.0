Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E24AAD1E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:57:16 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUvb-0007vr-H0
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:57:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUse-0006tX-0E
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:54:12 -0500
Received: from [2607:f8b0:4864:20::531] (port=38409
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUsc-0006At-6i
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:54:11 -0500
Received: by mail-pg1-x531.google.com with SMTP id 132so8326798pga.5
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8jbZMwadh2dsg3FFGHsC04EZ8g+xXcNYIpfjo2u/T1w=;
 b=EAvjgRGHh5ApQbK56WQWbo+KNT+DgN5YFsuytrjx3CF42kj2G7yD82e/cDBAz6GyB3
 g6HGxe/xsitXtDdyJLnNDSItNJhNtv+1mFFeLzcfPmEcJf/aPUwto+4vjvo3yPHgyJgR
 ELCeugYQHxkaN/R2oZxQ5FosUVRq4rAsGJZSD/C3Se5VoeZ9/S0B/Ak+vQyDpnbTL2YA
 fBs64AebZ5ZmvzlgJFhjUiuFzJatKh5dfFnFB0cNqCATO5K5mdW29us7To8x97MCaVe0
 FHHeJU7d5kgzHLe1DxrkMnmXdKonwDt7XvjlAKealhqrCqhm23/XiUDHBVPEcaB+Zauq
 6Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8jbZMwadh2dsg3FFGHsC04EZ8g+xXcNYIpfjo2u/T1w=;
 b=pBQaQWL9CuE+ImCDTGotg+ZAhbmm87+h1O+Yozx5rYWMMduGYepvYhG8zeDIxVp/98
 8me54UJIqGE5MBPu711e5PlAM7jOQk4u9bcoke32FkDn1x5fpj7lAS2JzhXu7cAGCtef
 Fx72m1LMXjVpwUtus78hqDLnuaGnYigIxFAjIAWchdh0fScMN/PdYKSIeH5IYy7pE1b5
 V8OI/Uxl6NDIOdHtpMh5v12wKQUTovVaORaaCdjZQGHM9aDN9zl20lN/sxC1yGSE755P
 Qj09Zp24p4aouNeR4D/zL9vLdynt9W1UZmR0Nc/ekyNeNzuOKDD0O6ngYxWqjL7L9VEo
 XNdw==
X-Gm-Message-State: AOAM532+VAn0LbQKr+vB2zcphJSgO83YQvZRe1ALwSaVkzRtXm/uLKJM
 o3uHbR3Tv8p3sHqjOCMmp6bqDj7mheh9jFs7
X-Google-Smtp-Source: ABdhPJzS52tK1kzhhl5i+d4qSYdrgAmDgMGsMswcTpWB6YQDG/3dCTpYXk7WfF7ZSv1tQfSxSi+3qQ==
X-Received: by 2002:a63:69c1:: with SMTP id e184mr4352479pgc.495.1644105248727; 
 Sat, 05 Feb 2022 15:54:08 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id a125sm6643225pfa.205.2022.02.05.15.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:54:08 -0800 (PST)
Message-ID: <08ef0bcb-f45d-c0a4-7d73-1c75a5622c5f@linaro.org>
Date: Sun, 6 Feb 2022 10:54:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/10] target: Add missing "qemu/timer.h" include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-9-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
> cpu_get_host_ticks() and NANOSECONDS_PER_SECOND are declared
> in "qemu/timer.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.c      | 1 +
>   target/arm/helper.c   | 1 +
>   target/hppa/cpu.c     | 1 +
>   target/riscv/csr.c    | 1 +
>   target/sparc/helper.c | 1 +
>   5 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

