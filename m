Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB7B4AE33F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:21:35 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYre-0006ip-IL
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYmr-0004Xi-54
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:16:37 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44778
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYme-0001cw-OE
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:16:31 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so364677pjh.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0rYiE8pl5pDG3cyvOYpyJ3AsLX/+G3VCshUpJvCLipU=;
 b=hYUDc3iqToIdXWzgB1ZDH7rWI0zKH+Y+yhnNCxwaUmnKctkaS/xw2znT3UcKSry2+a
 6f1MG/L7EWDaJhE4vQwUTKUKBI+lwIoReNPRwOH94Im7RFL0T0PqTHVwGLR9KLhZz0nE
 yw0nAwOcBF9a/MKi9QLa5YaI4p+7HeLTma6dVORKJwiEhbyyubO1KOP7JM0+pfuNJoQS
 9FQdNWYqUpidpSiZ7P6IF2xIWAOCGVr4Zvy7+7fkI4BXSds7XW+HWVW9QmKrpBBucNMY
 yTXuyF3MUf+hzmIxxg/46AwHzElRpPQVuVwG84UhJd9E0TlQnUT/wyaXOvvHZeVgv0ox
 ZG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0rYiE8pl5pDG3cyvOYpyJ3AsLX/+G3VCshUpJvCLipU=;
 b=pl2As3zTr9VdXVpd47P90CO1gKKpggx08q2rmo/fP7iQOF4lfG+KRRtzBISUaak/dT
 7tXjg8xfGiTeWo0HfR6gZc2GS9iJmht1GJxPewZIiP4UUbji1jTg5Ny1Y5ZFLqRLVrgp
 CG572hy9hdEZtdVmueNFsUWsZkIcypKNDBes1+KU3ludFS1uTcYt8TdW15Q/O4nTLuK5
 xpY8FPLOR2Q2nckB69nYE73jXfdu/j0xeO9eaOR3ewze4agmb/hyEDBAf+emzVONjFf6
 +FjJSnu0srVqGjtyQOcg9b/WBzzH5n0HN326XykYk7FCaDSV1nF6TA2w+x6DfpEqgC9b
 KSJA==
X-Gm-Message-State: AOAM533SiuMIIgeLzZh1ynl5wM6dvUlmh/lLlRSAADevyCblA3APPBrR
 mcgwbgEjAYybs1mf2ToihEgISw==
X-Google-Smtp-Source: ABdhPJyX/wEl1G85wHdtnEkxO2G3se73b5/cUnhtLA3H0iWt+th3HDxX2BdInpg4zSbcuZJSwrMbCg==
X-Received: by 2002:a17:902:d4ca:: with SMTP id
 o10mr6491627plg.29.1644358567215; 
 Tue, 08 Feb 2022 14:16:07 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id e20sm16267741pfn.4.2022.02.08.14.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:16:06 -0800 (PST)
Message-ID: <3f883522-063c-0adb-f0f2-05d0514cdf86@linaro.org>
Date: Wed, 9 Feb 2022 09:16:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/13] accel: Elide kvm_update_guest_debug by checking
 kvm_supports_guest_debug
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> -int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> -{
> -    return -ENOSYS;
> -}
> -
>   int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
>                             target_ulong len, int type)
>   {
> diff --git a/cpu.c b/cpu.c
> index 97d42b6b2a..834e2b4cdb 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -350,7 +350,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
>   {
>       if (cpu->singlestep_enabled != enabled) {
>           cpu->singlestep_enabled = enabled;
> -        if (kvm_enabled()) {
> +        if (kvm_enabled() && kvm_supports_guest_debug()) {
>               kvm_update_guest_debug(cpu, 0);

Why is this second hunk required?

I would think the stub would be removable on its own, since it is protected by 
kvm_enabled, which will expand to false exactly like kvm_supports_guest_debug expands to 
false.

As an aside, I wonder about the non-checking of the update return value...


r~

