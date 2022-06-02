Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D518953BB52
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:02:44 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmLT-0006Gm-FH
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmJV-0005Ud-Ke
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:00:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmJP-0007NK-I6
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:00:41 -0400
Received: by mail-pj1-x1033.google.com with SMTP id cx11so5170557pjb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=r4aoXX8fKIFUUqVoKUtbBr22FW52fPc3U6DHURJh6Oo=;
 b=Sfy0A1dFjq//+U8YvNKJmkTBV650u9lg08Mw9CRut9AfWpR7miheGhlCtzlDvIjHX+
 geQ6XNA9Oz8csdJdoAZi1/ZJ9DnadUcAQcNgy10i56qcJCkFiB2xoXsuTVNqeJyUFdza
 tH60mHuP67c18O1RmFvF97xXFkvZXrHDYKB8Bx2Fhkys0I35ZlU+KyMxHCnoLIqQlcNa
 b+FJZWYHCQDoZduaI7FRdEZvavv9sMukKo9JFyJcKMASrEs0Hq9hi2YFNV2VqXmgE4cM
 4Vbn5uH6/3Z+AgZxSAMn8GcuwyVlwfZjM0XFANPEjjiuPhQ4xtsh3rAYc/02wqDdfTP1
 DH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r4aoXX8fKIFUUqVoKUtbBr22FW52fPc3U6DHURJh6Oo=;
 b=UJUbjPPW8y4Q5PK333AjaXwx2sgHHjbzdzDNcJZeIXiu7RiBvncn/S5uGCUYCgdFsm
 GxxBNAKHqgFGtHnzVpyQIrnmhXPfoW5X/vW/F3zTFtzarxG5L18vhO5xj+qLknN7b1jm
 4+E7TSSMoq6SvzXSZ3WUwa01UTnTVyKD4dRQtd5f06MBoetXOOagwcR3UP6KGI8EG1Kk
 7sqMAt89lINYon/OA2M/DOEVtC9GVrDcrWoBvBlqZf/fdwxL9opcs3EdLAXWDBIMvSRy
 NdCqmrsNyddv8SguJz16EGeRyEXvELms8ylKf8uc3zQl4EC2XwiUJ8iC54XxmNWl564P
 OpKg==
X-Gm-Message-State: AOAM533+48D8ndbJhZdKCpDl6S+8PTjjxKCY3SH9z23GrzvXw6Z7feMp
 Qk1HIOtFS8HcHpmDMhzMMgSsLA==
X-Google-Smtp-Source: ABdhPJxVy8J0o0FK+9rJernXO8kwnQGVfVb0VLH4YSmUVi3iCtBKm7YMCq+k3t4gSDAa7012lS9BAg==
X-Received: by 2002:a17:902:6505:b0:163:b040:829b with SMTP id
 b5-20020a170902650500b00163b040829bmr5245838plk.173.1654182033725; 
 Thu, 02 Jun 2022 08:00:33 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a170902684500b0015e8d4eb26csm3659016pln.182.2022.06.02.08.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:00:33 -0700 (PDT)
Message-ID: <44be4084-c16e-256c-764d-dd59090c5a3d@linaro.org>
Date: Thu, 2 Jun 2022 08:00:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/19] M68k for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220602115837.2013918-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 6/2/22 04:58, Laurent Vivier wrote:
> The following changes since commit 2417cbd5916d043e0c56408221fbe9935d0bc8da:
> 
>    Merge tag 'ak-pull-request' of https://gitlab.com/berrange/qemu into staging (2022-05-26 07:00:04 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.1-pull-request
> 
> for you to fetch changes up to 36a0ab595f4e24b987e67faa52d4b174f67144b6:
> 
>    target/m68k: Mark helper_raise_exception as noreturn (2022-06-02 09:35:03 +0200)
> 
> ----------------------------------------------------------------
> m68k pull request 20220602
> 
> - Fixes and cleanup
> - Implement TRAP opcodes
> - Enable halt on 68060

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Richard Henderson (19):
>    target/m68k: Clear mach in m68k_cpu_disas_set_info
>    target/m68k: Enable halt insn for 68060
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
>    linux-user/strace: Use is_error in print_syscall_err
>    linux-user/strace: Adjust get_thread_area for m68k
>    target/m68k: Mark helper_raise_exception as noreturn
> 
>   target/m68k/cpu.h              |   8 ++
>   target/m68k/helper.h           |  14 +--
>   linux-user/m68k/cpu_loop.c     |  13 ++-
>   linux-user/strace.c            |   2 +-
>   target/m68k/cpu.c              |   7 +-
>   target/m68k/op_helper.c        | 173 +++++++++++++++--------------
>   target/m68k/translate.c        | 192 ++++++++++++++++++++++++---------
>   tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
>   linux-user/strace.list         |   5 +
>   tests/tcg/m68k/Makefile.target |   3 +
>   10 files changed, 398 insertions(+), 148 deletions(-)
>   create mode 100644 tests/tcg/m68k/trap.c
> 


