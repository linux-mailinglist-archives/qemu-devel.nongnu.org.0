Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2E5342CE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:17:59 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntva3-0003s0-4V
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntvYQ-0002XP-5p
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:16:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntvYN-0001dy-MS
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:16:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id cv10so3746701pjb.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bjWbjO3HKVzxlxqZqmJchR117rxqRE9zzOdf7ceYj2Q=;
 b=hmLN9gZ3ZuySufoo5blwmvkve6gZ2Y/8X0KMH2AQYpv9zRdJRV+KaSIpWjVjQJXT07
 EP8lQuEYXVnOC1Kq9NBM7qr8v+Llesaj+Qd5vvV0rMrLc23v5PEzm4XaTNysFihVxi7F
 F8UGSOlbmmZOZO6UF7jd0zTT725Sxmds3009lGvzzkMk+t4eY9INJvzNA5324oGYM6Cw
 me24D7AdUSgntrJoi1v4rl0Ef8yjJd1z1r9MgF7vqPI0Vr2rhJCebgAFzhVb1VBeqoGz
 b6ifBmDzH411+csM9JwlXQYkY2jZjHUTj2VhQ6htcpMxMsbE0d1PSpPZCp0nLXJ3TquL
 F27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bjWbjO3HKVzxlxqZqmJchR117rxqRE9zzOdf7ceYj2Q=;
 b=pZlkVrFNEnDQpea70eol3/pmNgnyGRmx/aXY/3oczbYEMgNtAc2VPGCUo3WKDuje6a
 i8vW88QF5YS/MKIvKRVY1VLH3rd/lcd/S8iWt034zGm3OJYSZpe9RllVG+hMQRhyG8hv
 SzsZtw9rH8r/Phk5FPRfj3BJDoVjvhM+0dkkmNvHgR28he5duGZjPsCcXwNX+bbrGVsj
 QRk34Odt66abg34DbB8sjBxmt94oJEWHbw1KouZ06gsa/leSwfX9mmAfKLBCRnEkWJCJ
 rbBAxXVP6OIN5E7Y0g9D+QEFsu2Dc45QNZW3DPujpGfTfKV3wvLmu7UF0oLFYSqSd+5y
 9fQg==
X-Gm-Message-State: AOAM533Dz0zAodoyW/A9DjEVSJuJhpgMGE5Qh6l5piiauvsnTcRYLL7I
 vfHTTMkCxEnqcFY8m6HdtNcn+w==
X-Google-Smtp-Source: ABdhPJzDRqqMmeF+Av92qfgjegfvqZqifr9nm+BBRarvwJ4NQxw9GmJpkB+fMhXnzuBTO7WrVCa/VQ==
X-Received: by 2002:a17:902:70c1:b0:162:1fbb:33f7 with SMTP id
 l1-20020a17090270c100b001621fbb33f7mr16992450plt.9.1653502572538; 
 Wed, 25 May 2022 11:16:12 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170902aa4a00b00162451a825asm3910305plr.307.2022.05.25.11.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 11:16:12 -0700 (PDT)
Message-ID: <1d007c11-9bad-a776-4d2c-2822c1d0f44b@linaro.org>
Date: Wed, 25 May 2022 11:16:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/8] Linux user for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220525104057.543354-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/22 03:40, Laurent Vivier wrote:
> The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:
> 
>    Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request
> 
> for you to fetch changes up to 565a84c1e61acb6e2bce03e5ca88b5ce400231ca:
> 
>    linux-user/host/s390: Treat EX and EXRL as writes (2022-05-23 22:54:02 +0200)
> 
> ----------------------------------------------------------------
> Pull request linux-user 20220525
> 
> s390x fixes
> CPUArchState cleanup
> elfload cleanup
> fix for uclibc-ng and by musl

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Fabrice Fontaine (1):
>    linux-user/syscall.c: fix build without RLIMIT_RTTIME
> 
> Ilya Leoshkevich (3):
>    linux-user/s390x: Fix unwinding from signal handlers
>    tests/tcg/s390x: Test unwinding from signal handlers
>    linux-user/host/s390: Treat EX and EXRL as writes
> 
> Philippe Mathieu-Daudé (3):
>    linux-user/elfload: Remove pointless non-const CPUArchState cast
>    linux-user: Have do_syscall() use CPUArchState* instead of void*
>    linux-user: Remove pointless CPU{ARCH}State casts
> 
> Richard Henderson (1):
>    linux-user: Clean up arg_start/arg_end confusion
> 
>   linux-user/elfload.c                       |  12 +-
>   linux-user/include/host/s390/host-signal.h |   7 +
>   linux-user/linuxload.c                     |  12 +-
>   linux-user/main.c                          |   4 +-
>   linux-user/qemu.h                          |  12 +-
>   linux-user/s390x/signal.c                  |   5 +
>   linux-user/strace.c                        | 202 ++++++++++-----------
>   linux-user/strace.h                        |   4 +-
>   linux-user/syscall.c                       |  83 +++++----
>   linux-user/uname.c                         |   4 +-
>   linux-user/uname.h                         |   2 +-
>   linux-user/user-internals.h                |  18 +-
>   semihosting/arm-compat-semi.c              |   4 +-
>   tests/tcg/s390x/signals-s390x.c            |  69 +++++--
>   14 files changed, 252 insertions(+), 186 deletions(-)
> 


