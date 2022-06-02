Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090053B474
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:39:52 +0200 (CEST)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwfQt-00053l-3U
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwfMb-0002Ns-Lb
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 03:35:25 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:51751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwfMZ-0005dM-UX
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 03:35:25 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N6bwO-1niy1A3UNC-0183OB; Thu, 02 Jun 2022 09:35:18 +0200
Message-ID: <0d599003-e329-8406-cae0-7501da40f3f7@vivier.eu>
Date: Thu, 2 Jun 2022 09:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 00/17] target/m68k: Conditional traps + trap cleanup
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220602013401.303699-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:asU/JczfAGN3lB5+NMnat3mob6wEaisEAfABHtazVjc8Ampr4y+
 xtp17/u325+yv5rEG7+Ap7qG+QP61tn0JQOfAq2unyG8qK+JM/VvyzN22S6tFAAbLBT1/BL
 VReOHOZRK0bTOKP1x+mwWtIJG5XVndPE6q5XWbfPHvbCPZY+PCja4aeg0f6uuW5Ov68YokF
 dSRYYkpuQpZSEY4m85kaA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g6DtolQOMw4=:6L1LUxAoRWLBba2Jlmg66d
 FjFpcMIGpovF7g8iJ0UUQfbru+JNRsTVNxP5GxXuMiex6Lwx3N7I+UPJAkpgC88Lvloih5wfw
 Yp3+bnSRI+6zvniaHiZ3TjpUhAbjvqsYBb4jM8mCxzhKC4az6ALoEFvR3y/YyBcwQdpXMqfL2
 tG2qgFPSg/1ePmgkwtgrrzRN3w0iMh1eBSWmev9D3MoaJWPvTXlQ96xSLJ7OkkutwZuBpZlNN
 RMzk3hJu/QW6iTLbFt8OZwpnQ9KTfoaFbuQzE75BetF1ZwQET28eElJifsL8BmpW3f9W8PHSK
 2FipQPSgTqu+ZyOGZHMLJCh1JVC0/ie1FbPMwgSFzOWEvRrG7LYWHk8kSrNn3uHHSrVrhtTM9
 a+5MWolCu8VnmH+hZDlUZH6k73KyTwJNYk9PAzql74bT8Q7+Ay3DrU58uKZvtewCi9CrUpKLU
 BpPZDsxFi6Ji1+a5BYGXtPFZvC2f/p0njKOfQcu5nyguAdWPyyGSJA7p+slWC85czDSckjDOF
 P54hUrsPBQ9HirM2vOuubioDFId4ZgATDnsQR5Qao6sTZvMxKh5WZI90z7CHywjFfjXkFfenR
 hGUw/H805OBNNEpMQ8Wy/hnU5SSOTl0mS2Pd9TpSPZ2Qew4q+bRDtTXmAsa+STPd80I8UmGkk
 aLDSTsgJBnKXq1eX9nE4DKyii2kY6pcddeT8d7ECyrvFQUX1QL0ObbpsOBmYHVnCFN1F5AfK2
 EqTsXuNXOyd+n4apZE/xmVUq/2afzxLJVR88cw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/06/2022 à 03:33, Richard Henderson a écrit :
> Changes for v6:
>    * Use exact masks for registering trapcc and ftrapcc.
>      These insn overlap illegal scc and fscc operands,
>      so we need to be exact about the registration.
> 
> 
> r~
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
>    linux-user/strace: Use is_error in print_syscall_err
>    linux-user/strace: Adjust get_thread_area for m68k
>    target/m68k: Mark helper_raise_exception as noreturn
> 
>   target/m68k/cpu.h              |   8 ++
>   target/m68k/helper.h           |  14 +--
>   linux-user/m68k/cpu_loop.c     |  13 ++-
>   linux-user/strace.c            |   2 +-
>   target/m68k/cpu.c              |   1 +
>   target/m68k/op_helper.c        | 173 +++++++++++++++--------------
>   target/m68k/translate.c        | 191 ++++++++++++++++++++++++---------
>   tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
>   linux-user/strace.list         |   5 +
>   tests/tcg/m68k/Makefile.target |   3 +
>   10 files changed, 396 insertions(+), 143 deletions(-)
>   create mode 100644 tests/tcg/m68k/trap.c
> 

Applied to my m68k-for-7.1 branch

Thanks,
Laurent


