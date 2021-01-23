Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D13018A1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 23:10:03 +0100 (CET)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3R6Y-00024D-4E
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 17:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3R5T-0001bs-UE
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:08:56 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3R5Q-0008M4-Lt
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:08:55 -0500
Received: by mail-pf1-x430.google.com with SMTP id q131so6113209pfq.10
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kW8Jx9+KXzCJnGhhX0iucJFvE62uXwaJZfqWl2SqUVQ=;
 b=J/iuxva36h3v2k3q6o4BCK+FwqWEnfYn1xmWUZs5pvmXLWQW+eTOrARw0P+fh5Ws/V
 XwQD1kDAeW1L3J3cqGfroOm5Jainrymmcvjgqvfqbj/SZasXwgCB8O7UcvbbeqS2FCjB
 Km3YvqGNunpOISRXxPyVL87fUI8aEDYp8b1VLfbEA8XCCyt1J+LEOiElm97XXUFvY/Bs
 JDW1gDlmF6YXUNadP43yWjkAB0w+jroO4HZ0V3hQXfn4KWMGPMOCGcB0GpW1AS0XP/5/
 xBpSjCETvoQ7D7R+y4UjJF0jK2kFVmti/j8i5jhuyhE9Xt0kyniZsFtyaVyxJiaOB88x
 MymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kW8Jx9+KXzCJnGhhX0iucJFvE62uXwaJZfqWl2SqUVQ=;
 b=Alx2ip2oTrHPiry6dLvI9ZInPXnmmi+upJGv73Pr5Q/atX/Vd1apQfvuOvuIgwOlHY
 fj2+1LFDJkcQwEg/qAT4YQ+w57D6e7YSiWPl++ThNb16qCuKr5i6r+vBEL54b6AD3J0/
 abF6xdvzx13Mn99PF1+RD6hxqQZxl0aBD9z3iR/GmeVS571R350EKiI6ptgc9AnG37L9
 90OrsDdtZZemwoavRPGj128CfKy21MDlyGl2QgM1Y68wPWv5YU0vRE8JgDHrllSGxicb
 /JqJx9E3EZqzCHXaYjNz1ehuujEnrQKfJvWO0E3qkkxufhrC6aNrSQUT0YmJhUyz2Xkx
 fqEg==
X-Gm-Message-State: AOAM532rNSVlYWSNrXRMmCVKn7OC34GD8DuhvQv+a7nknukDC1jpZue9
 KKtlP3suIiVX9IMbKK3iyyvrVQ==
X-Google-Smtp-Source: ABdhPJzy/2gbG0ciMtYJyWKiscSacQYF6CfaWMqcMcoERUvZ1W3Mqca+apnr6Irwc5j2svDYsfwAig==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr10059357pgr.327.1611439729290; 
 Sat, 23 Jan 2021 14:08:49 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id n15sm12823583pgl.31.2021.01.23.14.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 14:08:48 -0800 (PST)
Subject: Re: [PULL 00/10] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
Message-ID: <7aca4886-894e-e921-cef8-738ccc7f59de@linaro.org>
Date: Sat, 23 Jan 2021 12:08:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 8:50 AM, Richard Henderson wrote:
> The following changes since commit 0e32462630687a18039464511bd0447ada5709c3:
> 
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-01-22 10:35:55 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210123
> 
> for you to fetch changes up to 2e34067e9959f149a904cf1255985d3b68b52566:
> 
>   tcg: Toggle page execution for Apple Silicon (2021-01-22 12:48:01 -1000)
> 
> ----------------------------------------------------------------
> Fix tcg constant segv.
> Optimize inline dup_const for MO_64.
> Update the cpu running flag in cpu_exec_step_atomic
> Some tidy up of tcg vs other accelerators

Please do not apply this pull.
The tcg constant fix isn't good enough.


r~


> 
> ----------------------------------------------------------------
> Douglas Crosher (1):
>       tcg: update the cpu running flag in cpu_exec_step_atomic
> 
> Philippe Mathieu-Daudé (4):
>       accel/tcg: Make cpu_gen_init() static
>       accel/tcg: Restrict tb_gen_code() from other accelerators
>       accel/tcg: Declare missing cpu_loop_exit*() stubs
>       accel/tcg: Restrict cpu_io_recompile() from other accelerators
> 
> Richard Henderson (4):
>       qemu/compiler: Split out qemu_build_not_reached_always
>       tcg: Optimize inline dup_const for MO_64
>       tcg: Increase the static number of temporaries
>       accel/tcg: Move tb_flush_jmp_cache() to cputlb.c
> 
> Roman Bolshakov (1):
>       tcg: Toggle page execution for Apple Silicon
> 
>  accel/tcg/internal.h      | 20 ++++++++++++++++++++
>  include/exec/exec-all.h   | 11 -----------
>  include/qemu/compiler.h   |  5 +++--
>  include/qemu/osdep.h      | 28 ++++++++++++++++++++++++++++
>  include/tcg/tcg.h         |  5 +++--
>  accel/stubs/tcg-stub.c    | 10 ++++++++++
>  accel/tcg/cpu-exec.c      |  7 +++++++
>  accel/tcg/cputlb.c        | 19 +++++++++++++++++++
>  accel/tcg/translate-all.c | 23 +++++------------------
>  tcg/tcg.c                 |  7 ++++---
>  10 files changed, 99 insertions(+), 36 deletions(-)
>  create mode 100644 accel/tcg/internal.h
> 


