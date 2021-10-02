Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3241FC82
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:27:21 +0200 (CEST)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfyy-0005P9-CO
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfvu-0002Fv-O9
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:24:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfvt-00013o-CA
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:24:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so13685573wmi.5
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cGhIesK0yIYE6GfZ2zQlMjfHIjPAvzAV5GGchIml2jw=;
 b=KGevUmIOx5Ai46nWDA2l0o0ImaDxz3GA/mGsCn7L0UpRrFTP7/1wyHP9bpGjRvifFH
 iGsolgzdxNIKujllOz1RJirfVG46ibDcxN9YrF9fpW5hzLmJ7aLDkXnogO9Pf4cGG9Qm
 eHiO8qO+UnVAbmvXEbuUwMbKLrL1giPRFgvbxaYsCqot+4a0pPZlGa+MW+mkPC+9xC5R
 ZU3hmHO92kEItJyrVsrc3LyHigNpipln5c+OvLRT95tO3weQyKTQtuulTZEeN+kv2qpA
 dKcPMmXkFhk6dHUJFyqgYULOzmckQoX2yZIGuCO9aMSReaKL0HyzcdAwAuzaJO7GRIH4
 Q5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cGhIesK0yIYE6GfZ2zQlMjfHIjPAvzAV5GGchIml2jw=;
 b=nHEJRheiUYJjWKm2YBHiRbm9OodX7R4tSGN+e/DmwYZ8WVWhjRcvqu+HMYYSrzG7n3
 jycKjO31og2U8vDmYJZtG9oBjLBHo7UPLx5idutt6RPjUWGXje3AyhzdQ6ROta3dirNb
 CJmituMum+QRYEVHE9Y44hKvrdVAWanOnqwcv1agLpYEMDi9+46FUI67b8rmBZ6kEoEU
 x7xPYivEyAgmjbwjAHTn+1iiRx7zLJMTXSgF2sNs1zfESCQnzny19lW12XOQfkIcUV5x
 FkIyhO7lIYdiZghZ1gh3R0JaCnFS6tcGCeMAcF59dwd2gs7UWnrcqoLUWWACYTwyzp/5
 NuzQ==
X-Gm-Message-State: AOAM5312mGqjLLzERqMgaQP6UBs3bTf6ygGwoMZTY4kQp8uO+4uhCQgR
 Fj7fYJ3XhrxgB91OnbEiAW0=
X-Google-Smtp-Source: ABdhPJz/wqIgSkeBygQr2fK0WMyauYUrRviqHbRJ7+GuUj+3JKPUgAuONJWg2xbxUBnT4B8ghiywbg==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr9882196wmh.48.1633184647554; 
 Sat, 02 Oct 2021 07:24:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z8sm10050948wrm.63.2021.10.02.07.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:24:06 -0700 (PDT)
Message-ID: <a84d711a-348b-6c32-0cc6-0a5352c1a7b2@amsat.org>
Date: Sat, 2 Oct 2021 16:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 31/41] target/nios2: Implement nios2_cpu_record_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> Because the linux-user kuser page handling is currently implemented
> by detecting magic addresses in the unnamed 0xaa trap, we cannot
> simply remove nios2_cpu_tlb_fill and rely on the fallback code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h    | 6 ++++++
>  target/nios2/cpu.c    | 6 ++++--
>  target/nios2/helper.c | 7 ++++---
>  3 files changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



