Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAF3CC265
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:09:56 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hGd-0006uD-Q8
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hE7-00045A-Ao
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:07:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m4hE4-0005dK-RY
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:07:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id i94so14972192wri.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j9isP/986cshj2AoF3s0U3Fpn0Nf+99LEC+yQooYGJg=;
 b=QlMXuxjZcz5FuscxhNtzyMhFDVTOCHEBv7uizzz9w0l8GKoE8jHosYD/m0uCmasDPo
 WDuuSDWJYwLnXtJ2h2RK64EUH5wH8o1XDcV7K03v+qy6WE8A/CnOnrV+F/pxq7RHNfuA
 A9OPZbO0eYge/6/6m2/n2Qt9gGlvVsHr4jwKS2WCs7x8lkHVEFG7FzxVngAHbMXdSrNR
 UCkyURIhd+pITizCUKeozaEKdL9WdKZptdd/uaEDOfboNs75aA4zin6ODHPrJA5TUiSh
 LYATFn5O49RRow5n1hpT/vpawxgB75jJbZ0N8yps7unQ0fpGtccWHvBD71lPA+3E4fy4
 9DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j9isP/986cshj2AoF3s0U3Fpn0Nf+99LEC+yQooYGJg=;
 b=C3fV8RL3TtTssVzHM48OO0SLfyFZxbajW9tKVam17jwShsa7jEXxcJ19KwEI3y6NfF
 wbxUVa6SvbnaLB6RqlXHb3BEzH09v4I9O60LeAnaUDV/r+IAenpk7e9AVHQGlKgZ+3Qq
 HHI5Y2ZT6O9s+q3cG6Nxh05oTw0HJqn3vyKqszMTN3MSQKaUzqxgUrOIQhJg0aVDNO13
 nNe3rBLTbkUABoRqyHp0/mdvRMvm/ZOSitd+wSZz47amkiaJ1w8qZIcTwzsm11I2gDKS
 eLc9E7bcpFxnA2oVnsjFNbrxFvt9sMjU1n+TEQWFWtL+TA+EvbfZGyNIO9TQIAbTItKT
 6/0Q==
X-Gm-Message-State: AOAM532/bPn+s7Wo7q9CGWp4yPHBXjFgHOAhbkFcjLbI1zN1WdcTfrqQ
 V7P0LdeLzCIyRdykv8EMlWM=
X-Google-Smtp-Source: ABdhPJxL2N6TrmoXRbgrp3IeRvkM0kGg0ujVr3b1sxKwA7iTuJXliE2jl0a01BFd6zAQzK0IuF6N3Q==
X-Received: by 2002:adf:f149:: with SMTP id y9mr17507831wro.85.1626516434929; 
 Sat, 17 Jul 2021 03:07:14 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id l23sm729610wme.22.2021.07.17.03.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 03:07:14 -0700 (PDT)
Subject: Re: [PATCH v2 04/11] qemu/atomic: Add aligned_{int64,uint64}_t types
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
 <20210717014121.1784956-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a029ec9a-d684-1279-4344-a4bf884ef4a8@amsat.org>
Date: Sat, 17 Jul 2021 12:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717014121.1784956-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 3:41 AM, Richard Henderson wrote:
> Use it to avoid some clang-12 -Watomic-alignment errors,
> forcing some structures to be aligned and as a pointer when
> we have ensured that the address is aligned.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h |  4 ++--
>  include/qemu/atomic.h       | 14 +++++++++++++-
>  include/qemu/stats64.h      |  2 +-
>  softmmu/timers-state.h      |  2 +-
>  linux-user/hppa/cpu_loop.c  |  2 +-
>  util/qsp.c                  |  4 ++--
>  6 files changed, 20 insertions(+), 8 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

