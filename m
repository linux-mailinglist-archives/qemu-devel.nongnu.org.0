Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CE52F8E3
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 07:24:25 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsHbE-0000SJ-Ex
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 01:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsHZx-0008AW-0m
 for qemu-devel@nongnu.org; Sat, 21 May 2022 01:23:05 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsHZv-0003Xp-3T
 for qemu-devel@nongnu.org; Sat, 21 May 2022 01:23:04 -0400
Received: by mail-pl1-x634.google.com with SMTP id i1so8888128plg.7
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=DFA4MncQ6sBNd7XZxTWdCsbKjguT2fcTWJKM2w6rmpc=;
 b=rAifXUyWhLTQEZvPm5GqcjCUy5TMq3DMz8GNRrHYbdb5t/EQUmV0VBiFz+lQpuAcAy
 GjunlQsoQ5841g+Z08XpSp+Y5MkPE4l3Dx5OF0uu72oRaVieCSJd8CiZCH6rmaeCu1dd
 +t2bcijDvHWsP389WHr9nSRAg0LGEz1YbtQy5LSNdPzsRwvpb7hvreOsXuebQ+w/UE8z
 stqxWy5R/KU8ucQg96MP0pbLomLIDQi7waBaLG6dRpCYS1WUt7pR2IFOBxws14fGwbIT
 MkpST1d4LAayzjPqY8BRmQ++UQM69bPQ92GRgNnSdr4javD/goge//2Ulxxi5jhOCvx/
 f4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=DFA4MncQ6sBNd7XZxTWdCsbKjguT2fcTWJKM2w6rmpc=;
 b=XHj4rzDLXWlwMr3kWUHo2FRvsKzb/WNdE97bziabhXPPz2b8Z7sO7Fkq8uKnFNFDDH
 4vaeBGkG+RydojNXnG5jCcNQEChKhtX1iLo8k6O8YhIaB+6nl8pjRd9Cxxo5TgJkgrSu
 nTOhq3j2yxGjuQ5GtBQ5JAmhKlgNtesqTGJLIqwN++vK9GdGT3+5JdT7Nx7103lnO6L2
 Gv70CKGj07eiXvT40HPRJrkWj0ZIxKXqcwsjLvE/eqiVDQkk8tzyayeE1K19PHB/Hpuh
 7TMvT6aO7/0Vwjw8Zvh1RDy4g7HB8GWj97AMozfe2H7ekSZ25vVcHfHsUr3yAgT/rGdd
 0TLA==
X-Gm-Message-State: AOAM532dgw7te6YSLMASFXIHdkT56KGrZjPqq27VeJV5XM5M5Zx2v93t
 tMX7v9JjUW1/5oFF5djYc1wQP1xq4HIscA==
X-Google-Smtp-Source: ABdhPJzdfq2NuauTNa8qUXkBPPaZfAxlIZr1b89OtXmsZGpKPd1TzmTwZBTOss74tF4zh3ElDG3YvQ==
X-Received: by 2002:a17:90b:3b81:b0:1dc:32ac:a66b with SMTP id
 pc1-20020a17090b3b8100b001dc32aca66bmr14665782pjb.49.1653110581674; 
 Fri, 20 May 2022 22:23:01 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 jf11-20020a170903268b00b0015e8d4eb225sm631881plb.111.2022.05.20.22.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 22:23:01 -0700 (PDT)
Message-ID: <835251e9-0cff-b9fa-89b2-bc377cd00928@linaro.org>
Date: Fri, 20 May 2022 22:22:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 00/17] target/m68k: Conditional traps + trap cleanup
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220430175342.370628-1-richard.henderson@linaro.org>
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Ping.

r~

On 4/30/22 10:53, Richard Henderson wrote:
> Changes for v4:
>    - Rebase, which requires QEMU_NORETURN -> G_NORETURN.
>    - Cast -4096 to abi_ulong for print_syscall_err.
> 
> 
> r~
> 
> 
> v1: https://lore.kernel.org/qemu-devel/20211130103752.72099-1-richard.henderson@linaro.org/
> v2: https://lore.kernel.org/qemu-devel/20211202204900.50973-1-richard.henderson@linaro.org/
> v3: https://lore.kernel.org/qemu-devel/20220316055840.727571-1-richard.henderson@linaro.org/
> 
> 
> Richard Henderson (17):
>    target/m68k: Raise the TRAPn exception with the correct pc
>    target/m68k: Switch over exception type in m68k_interrupt_all
>    target/m68k: Fix coding style in m68k_interrupt_all
>    linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
>    target/m68k: Remove retaddr in m68k_interrupt_all
>    target/m68k: Fix address argument for EXCP_CHK
>    target/m68k: Fix pc, c flag, and address argument for EXCP_DIV0
>    target/m68k: Fix address argument for EXCP_TRACE
>    target/m68k: Fix stack frame for EXCP_ILLEGAL
>    target/m68k: Implement TRAPcc
>    target/m68k: Implement TPF in terms of TRAPcc
>    target/m68k: Implement TRAPV
>    target/m68k: Implement FTRAPcc
>    tests/tcg/m68k: Add trap.c
>    linux-user/strace: Fix print_syscall_err
>    linux-user/strace: Adjust get_thread_area for m68k
>    target/m68k: Mark helper_raise_exception as noreturn
> 
>   target/m68k/cpu.h              |   8 ++
>   target/m68k/helper.h           |  14 +--
>   linux-user/m68k/cpu_loop.c     |  11 +-
>   linux-user/strace.c            |   4 +-
>   target/m68k/cpu.c              |   1 +
>   target/m68k/op_helper.c        | 173 ++++++++++++++++--------------
>   target/m68k/translate.c        | 190 ++++++++++++++++++++++++---------
>   tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
>   linux-user/strace.list         |   5 +
>   tests/tcg/m68k/Makefile.target |   3 +
>   10 files changed, 394 insertions(+), 144 deletions(-)
>   create mode 100644 tests/tcg/m68k/trap.c
> 


