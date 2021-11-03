Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A6B4449A2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:37:17 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miN0W-0000p6-Bb
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miMyR-0007kZ-Hf
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:35:07 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miMyP-0002e8-CR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:35:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so5632926wme.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kRVDr58PLC8FVDEWOBJGR8XhtiqlVqtSkOhCPdHAYP8=;
 b=TTYDOTrx2LG4Njef1fljgfZ1zaTehgvWBPuVxKyfr4X/FQNadLN/fEDXgf/uPSO0hY
 l4cUaZ9Mtoa7YUfFdi+gxYRrhrTZxuNfp0cFEjKpwO8UlGm0VLwUs0fCbmyWX4/GxSqJ
 F9GodqiqM97fhSvWhrweFuia9riZKvXyAFNFQ/u/k5VT4XD3DS+bLL3A4rJ6lu/e0V9g
 pWaJJ6u8MYrlZ01k9KzophU7VBLUwMhYqQwMaPyViFJmTPL5TNV5AFH1CMeq0Pr4KMiO
 Q8Y631QVl7tGdfsFCNQp2V6Vb9+Be4gw26RvOaPXGNf6NSJNcTMemDhxNrjLTCsh7s6N
 on5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kRVDr58PLC8FVDEWOBJGR8XhtiqlVqtSkOhCPdHAYP8=;
 b=pKrCwGxf2Jvp59ZYAmm57kKZDDbzyS/WrfrgpFObiBM/el6ECjPioxesVfejPLboPx
 Syb3nqtaoRvQM0Mt6xnoawRV0+F2QIT6h7djUu6ucs7Gxz2hbAMTCFou8RVVGgk6Mg4O
 6xkhd99Y4f8LgYcPuM39jDsrOHrY8VbArSSAzz34NuFWk5MnJBcRdL6fNvGZN8SSc/Ax
 TrzPZggtLtALiMy/ELeTU8ZLUarYgy4eNsmP3wKlSklqgpszi/nOih24gS2pQAEdiAyW
 l1Z8IPtBAUMBV4E3flyTjK6GjNksJpwLtiFuY0MdGuq0jU07TGSeKQ/4qEG0J0lDBQtr
 WL1w==
X-Gm-Message-State: AOAM531JIqoDnwguK7UY3W4UmYYwwVi3qmo4UlPdK5q6wEeVf8q7sonA
 Rny9w4509nLjibrCsS2U1ZVBCvSahhs=
X-Google-Smtp-Source: ABdhPJwKLeNkxyBqgJRTbePXHKgBC7eHWhfIyCvElJZZ+Uo1QkrJ6OsE1Uk6fB6RsaYD/Be6gKAQ2A==
X-Received: by 2002:a05:600c:3510:: with SMTP id
 h16mr4398553wmq.144.1635971703503; 
 Wed, 03 Nov 2021 13:35:03 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w15sm2930070wrk.77.2021.11.03.13.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 13:35:03 -0700 (PDT)
Message-ID: <c06e224e-7451-d384-25ca-64c589000c6c@amsat.org>
Date: Wed, 3 Nov 2021 21:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211103203146.3630550-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211103203146.3630550-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Beh I meant "GPL-2.0-or-later" in the patch subject line.

On 11/3/21 21:31, Philippe Mathieu-Daudé wrote:
> Use Qualcomm License Identifier tool [*] to classify linux-user/
> files per license type, filtering those matching at least 60% the
> "GPLv2 or later" type, and manually add the GPL-2.0-or-later SPDX
> comment.
> 
>   $ license-identifier --output_format easy_read \
>       --threshold 0.6 --input_path linux-user \
>     | egrep '(Name of the input file|Matched license type is|The found license text has the score of)'
>     | fgrep -1 GPL-2.0+
>   Name of the input file: linux-user/cpu_loop-common.h
>   Matched license type is GPL-2.0+
>   The found license text has the score of 0.69
>   --
>   Name of the input file: linux-user/exit.c
>   Matched license type is GPL-2.0+
>   The found license text has the score of 0.685
>   --
>   Name of the input file: linux-user/fd-trans.c
>   Matched license type is GPL-2.0+
>   The found license text has the score of 0.715
>   --
>   Name of the input file: linux-user/fd-trans.h
>   Matched license type is GPL-2.0+
>   The found license text has the score of 0.715
>   --
>   Name of the input file: linux-user/flatload.c
>   Matched license type is GPL-2.0+
>   The found license text has the score of 0.715
>   --
>   ...
> 
> [*] Qualcomm Open Source Technology Group License Identifier tool
>     https://www.codeaurora.org/projects/qualcomm-ostg-lid
>     https://github.com/quic/lid#usage
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/aarch64/target_elf.h      | 2 ++
>  linux-user/aarch64/target_fcntl.h    | 2 ++
>  linux-user/alpha/target_elf.h        | 2 ++
>  linux-user/alpha/target_fcntl.h      | 2 ++
>  linux-user/arm/target_elf.h          | 2 ++
>  linux-user/arm/target_fcntl.h        | 2 ++
>  linux-user/cpu_loop-common.h         | 2 ++
>  linux-user/cris/target_elf.h         | 2 ++
>  linux-user/cris/target_fcntl.h       | 2 ++
>  linux-user/fd-trans.h                | 2 ++
>  linux-user/hexagon/sockbits.h        | 2 ++
>  linux-user/hexagon/target_cpu.h      | 2 ++
>  linux-user/hexagon/target_elf.h      | 2 ++
>  linux-user/hexagon/target_fcntl.h    | 2 ++
>  linux-user/hexagon/target_signal.h   | 2 ++
>  linux-user/hexagon/target_structs.h  | 2 ++
>  linux-user/hexagon/target_syscall.h  | 2 ++
>  linux-user/hexagon/termbits.h        | 2 ++
>  linux-user/hppa/target_elf.h         | 2 ++
>  linux-user/hppa/target_fcntl.h       | 2 ++
>  linux-user/i386/target_elf.h         | 2 ++
>  linux-user/i386/target_fcntl.h       | 2 ++
>  linux-user/loader.h                  | 2 ++
>  linux-user/m68k/target_elf.h         | 2 ++
>  linux-user/m68k/target_fcntl.h       | 2 ++
>  linux-user/microblaze/target_elf.h   | 2 ++
>  linux-user/microblaze/target_fcntl.h | 2 ++
>  linux-user/mips/target_fcntl.h       | 2 ++
>  linux-user/mips64/target_elf.h       | 2 ++
>  linux-user/nios2/target_elf.h        | 2 ++
>  linux-user/nios2/target_fcntl.h      | 2 ++
>  linux-user/openrisc/target_elf.h     | 2 ++
>  linux-user/openrisc/target_fcntl.h   | 2 ++
>  linux-user/ppc/target_elf.h          | 2 ++
>  linux-user/ppc/target_fcntl.h        | 2 ++
>  linux-user/riscv/target_elf.h        | 2 ++
>  linux-user/riscv/target_fcntl.h      | 2 ++
>  linux-user/s390x/target_cpu.h        | 2 ++
>  linux-user/s390x/target_elf.h        | 2 ++
>  linux-user/s390x/target_fcntl.h      | 2 ++
>  linux-user/safe-syscall.h            | 2 ++
>  linux-user/sh4/target_elf.h          | 2 ++
>  linux-user/sh4/target_fcntl.h        | 2 ++
>  linux-user/signal-common.h           | 2 ++
>  linux-user/sparc/target_elf.h        | 2 ++
>  linux-user/sparc/target_fcntl.h      | 2 ++
>  linux-user/strace.h                  | 2 ++
>  linux-user/user-internals.h          | 2 ++
>  linux-user/user-mmap.h               | 2 ++
>  linux-user/x86_64/target_elf.h       | 2 ++
>  linux-user/x86_64/target_fcntl.h     | 2 ++
>  linux-user/xtensa/target_elf.h       | 2 ++
>  linux-user/xtensa/target_fcntl.h     | 2 ++
>  linux-user/aarch64/cpu_loop.c        | 2 ++
>  linux-user/aarch64/signal.c          | 2 ++
>  linux-user/alpha/cpu_loop.c          | 2 ++
>  linux-user/alpha/signal.c            | 2 ++
>  linux-user/arm/cpu_loop.c            | 2 ++
>  linux-user/arm/signal.c              | 2 ++
>  linux-user/cris/cpu_loop.c           | 2 ++
>  linux-user/cris/signal.c             | 2 ++
>  linux-user/exit.c                    | 2 ++
>  linux-user/fd-trans.c                | 2 ++
>  linux-user/flatload.c                | 2 ++
>  linux-user/hexagon/cpu_loop.c        | 2 ++
>  linux-user/hexagon/signal.c          | 2 ++
>  linux-user/hppa/cpu_loop.c           | 2 ++
>  linux-user/hppa/signal.c             | 2 ++
>  linux-user/i386/cpu_loop.c           | 2 ++
>  linux-user/i386/signal.c             | 2 ++
>  linux-user/m68k/cpu_loop.c           | 2 ++
>  linux-user/m68k/signal.c             | 2 ++
>  linux-user/main.c                    | 2 ++
>  linux-user/microblaze/cpu_loop.c     | 2 ++
>  linux-user/microblaze/signal.c       | 2 ++
>  linux-user/mips/cpu_loop.c           | 2 ++
>  linux-user/mips/signal.c             | 2 ++
>  linux-user/mips64/cpu_loop.c         | 2 ++
>  linux-user/mips64/signal.c           | 2 ++
>  linux-user/mmap.c                    | 2 ++
>  linux-user/nios2/cpu_loop.c          | 2 ++
>  linux-user/nios2/signal.c            | 2 ++
>  linux-user/openrisc/cpu_loop.c       | 2 ++
>  linux-user/openrisc/signal.c         | 2 ++
>  linux-user/ppc/cpu_loop.c            | 2 ++
>  linux-user/ppc/signal.c              | 2 ++
>  linux-user/riscv/cpu_loop.c          | 2 ++
>  linux-user/riscv/signal.c            | 2 ++
>  linux-user/s390x/cpu_loop.c          | 2 ++
>  linux-user/s390x/signal.c            | 2 ++
>  linux-user/sh4/cpu_loop.c            | 2 ++
>  linux-user/sh4/signal.c              | 2 ++
>  linux-user/signal.c                  | 2 ++
>  linux-user/sparc/cpu_loop.c          | 2 ++
>  linux-user/sparc/signal.c            | 2 ++
>  linux-user/syscall.c                 | 2 ++
>  linux-user/uname.c                   | 2 ++
>  linux-user/vm86.c                    | 2 ++
>  linux-user/x86_64/cpu_loop.c         | 2 ++
>  linux-user/x86_64/signal.c           | 2 ++
>  linux-user/xtensa/cpu_loop.c         | 2 ++
>  linux-user/xtensa/signal.c           | 2 ++
>  linux-user/errnos.c.inc              | 2 ++
>  103 files changed, 206 insertions(+)

