Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F4421AA4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 01:28:25 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXXNg-0002CY-M7
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 19:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXXMV-0001VS-6L
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 19:27:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXXMT-0004rZ-FA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 19:27:10 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t11so975974plq.11
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 16:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hNGrQ+u+FdoAhgRlH9eRQEY4pDe8kf3SkbgmQ/xn6Ig=;
 b=HOFaeygTEagOdemE5EFTKYTIWvTlbvwc6sisWYb347oNAqdk91mKuXfhVLsG5NCuHJ
 Nexv0hGyaUZvCSnwrGu2pciwPV706lihOPylDNFg00UY0sQPCsvlJoOIlARYKpB/Wt+g
 +2hyoWei3DyrA9rWpuY+pRv4b4pAts+41bU7E/GVs5a9J0ZZsJCKWyaibVqDb64TzIsL
 vRp08LGdbtx7ttCuAnzrXEYDNP006epzJgfm8I+GTzbZF7b9aKsjdickeTEDofgeLkZN
 54opwRXMD0Z3GlCcpv/CPx7nhSNxbZX3ojG2nKylJcH0W9QaG01DIePYjA7/OvinPD8Q
 vqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hNGrQ+u+FdoAhgRlH9eRQEY4pDe8kf3SkbgmQ/xn6Ig=;
 b=OZW8HyD//f4ZShxXeuh38pl2VG/p7AE/0I8aJvAtrTUHh0U+j8ZPSGNea5CBjoCQHm
 TV8481u/fNSw4J1YuRdWup3x0jsTsgCGpXRS25CLnvJOnaN3kT7Nnu2Q1M7LK9MVkCWp
 Cnl9WByymEg6QsmQIBIzinKe+tps+FWQzI1xWg7IInXStAtwU8YcjzhqToIts056XAeb
 3cskTdnGqQZq0rigMmBozUVuiEd869GAAJq1RuJmyAvXtMx938uNMBXo8G26Lk/agsLJ
 FDmQRmItNIWpxsVqVPjES7X+Fsu9Dvjiuj85RJNsSBlXNGctdpcI0PVdkMfLz3JCppYy
 f64A==
X-Gm-Message-State: AOAM5300O8UP9rUyzdCF5pBa/Zy02vIaxz9Z0MjxZFVejP+aSbsK/cuh
 JkgsbiAqylPAo9ukWFFdTMDQnQcDQU2W7w==
X-Google-Smtp-Source: ABdhPJwzr98QcNFJirURKR6aw9IOgOLVYiWb1uqzEXWGmxQ7E+xk4jHNeWRZwHhWWFnGjYJMK+VExw==
X-Received: by 2002:a17:90a:428e:: with SMTP id
 p14mr40430636pjg.229.1633390027568; 
 Mon, 04 Oct 2021 16:27:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b14sm3336177pfo.127.2021.10.04.16.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 16:27:07 -0700 (PDT)
Subject: Re: [PULL 00/26] Linux user for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211004074421.3141222-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a014f058-d1ac-11df-cee3-53a1aedbc626@linaro.org>
Date: Mon, 4 Oct 2021 16:27:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 12:43 AM, Laurent Vivier wrote:
> The following changes since commit bb4aa8f59e18412cff0d69f14aee7abba153161a:
> 
>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210930' into staging (2021-09-30 21:16:54 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request
> 
> for you to fetch changes up to efee71c8ca181d4f5b2211736b38a74a2a223375:
> 
>    tests/tcg/multiarch: Re-enable signals test for most guests (2021-10-01 12:03:48 +0200)
> 
> ----------------------------------------------------------------
> Pull request linux-user 20211004
> 
> Move signal trampolines to new page
> 
> ----------------------------------------------------------------
> 
> Richard Henderson (26):
>    linux-user: Add infrastructure for a signal trampoline page
>    linux-user/aarch64: Implement setup_sigtramp
>    linux-user/arm: Drop v1 signal frames
>    linux-user/arm: Drop "_v2" from symbols in signal.c
>    linux-user/arm: Implement setup_sigtramp
>    linux-user/alpha: Implement setup_sigtramp
>    linux-user/cris: Implement setup_sigtramp
>    linux-user/hexagon: Implement setup_sigtramp
>    linux-user/hppa: Document non-use of setup_sigtramp
>    linux-user/i386: Implement setup_sigtramp
>    linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set
>    linux-user/m68k: Implement setup_sigtramp
>    linux-user/microblaze: Implement setup_sigtramp
>    linux-user/mips: Tidy install_sigtramp
>    linux-user/mips: Implement setup_sigtramp
>    linux-user/nios2: Document non-use of setup_sigtramp
>    linux-user/openrisc: Implement setup_sigtramp
>    linux-user/ppc: Simplify encode_trampoline
>    linux-user/ppc: Implement setup_sigtramp
>    linux-user/riscv: Implement setup_sigtramp
>    linux-user/s390x: Implement setup_sigtramp
>    linux-user/sh4: Implement setup_sigtramp
>    linux-user/sparc: Implement setup_sigtramp
>    linux-user/xtensa: Implement setup_sigtramp
>    linux-user: Remove default for TARGET_ARCH_HAS_SIGTRAMP_PAGE
>    tests/tcg/multiarch: Re-enable signals test for most guests

Applied, thanks.

r~

