Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44C4536DC9
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 18:37:59 +0200 (CEST)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuzRu-00078A-Oh
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 12:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuzQb-0005ky-V6
 for qemu-devel@nongnu.org; Sat, 28 May 2022 12:36:37 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:56591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuzQa-0004nN-6O
 for qemu-devel@nongnu.org; Sat, 28 May 2022 12:36:37 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2m3G-1npa2Q1UMe-0137ZX; Sat, 28 May 2022 18:36:34 +0200
Message-ID: <87924780-8998-ec03-cb82-db129175ff8d@vivier.eu>
Date: Sat, 28 May 2022 18:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 00/17] target/m68k: Conditional traps + trap cleanup
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220527164807.135038-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:p49MFk2gpz3XKdb73i2uTIS0UnqnkEyJW5HeotBdddOLonau0EE
 jnsCj0yKh+lKh/xlyEykp/1m/ho7hEzKi3BIxFzsC9DfbIXYCXbr91MWloywfQ4xupmXnV+
 o7XoHPIA0ePBAnWDroZMnPjrUuhms1LZ4t3goRknCChUef9fIrBnnjmne43ho2oa8WNOSpb
 qhvYuyKR3GVdnvBEGDEEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k9bo7cU6TAw=:Nz7rQfLV9xdr/HrLrZ4pO9
 euGQxzsNR41g4VKQRRkIhINvvl/vCyuN5F66mFS+J6j3Mnp7uAEhu9usOsoLDoMlXRWLdLI6l
 /CU98HROW/Moe22yo9WgOF+ZXrSBH+7wg/UWELWfHHUhZCAWRzX1O/JNafwnMp2moo4gddfrY
 k74i8ebEHDuzr2ECLxAD8FqHb/GoT8f86Z8bKy9ws1DdW0omIcR/9aQjnJvjVWi1lIj/5TaLl
 er3gS1uifPGVgMMbm/rkDee58/PzqNGXWKENsfxJZCq4eHgZd96/z3Ir5MsXpp2pClKXf1GGA
 23weXOMUeC2fcPpUJRSRIcuP4DSVJnZKkVdugcy/E393UzQ8TDZOcybQcLgeuOPYTUvxbElAo
 330hgKc1jC2VXjAz5+OiX+WXWQEa9gfxUEvYHGkoSQB/vGncikLGGTXWS28/X+0TtdlXdiOqQ
 bWkmlVpj/GzIVRwvCtbAfgEEkTWcKDyAaF1gphfRtmOkmhqdBN6+QRbFHnr/B/do7JqkWYFdB
 6dkxrOY2m7ZsLcT4sMjCi37fI66PvPbwGiMFcYj9k9v/KJzWJUE0W6IH2D9M5GbzN3FDGppzR
 xNHAH1bF+pifChEcnAo5+zyt/IViDDS19ByNewUflv5yITLLau9hC+q5qF3kAf2MrVYcRLRF/
 CuO23Z2f60Nk81aIuliRBCy75n8tB/8pX+RIuo7On30rREhtDImVF4q8sR+6zlEfRocPSPuYW
 C/EDQXLQ+h9wc/VlSUsAa9hF11eB9OE7hN2Ohw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 27/05/2022 à 18:47, Richard Henderson a écrit :
> 
> Changes for v4:
>    - Use ILLTRP for TRAP1-TRAP14.
>    - Use is_error for print_syscall_err.
> 
> 
> r~
> 
> 
> v1: https://lore.kernel.org/qemu-devel/20211130103752.72099-1-richard.henderson@linaro.org/
> v2: https://lore.kernel.org/qemu-devel/20211202204900.50973-1-richard.henderson@linaro.org/
> v3: https://lore.kernel.org/qemu-devel/20220316055840.727571-1-richard.henderson@linaro.org/
> v4: https://lore.kernel.org/qemu-devel/20220430175342.370628-1-richard.henderson@linaro.org/
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
>   target/m68k/op_helper.c        | 173 ++++++++++++++++--------------
>   target/m68k/translate.c        | 190 ++++++++++++++++++++++++---------
>   tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
>   linux-user/strace.list         |   5 +
>   tests/tcg/m68k/Makefile.target |   3 +
>   10 files changed, 395 insertions(+), 143 deletions(-)
>   create mode 100644 tests/tcg/m68k/trap.c
> 

Series applied to my m68k-for-7.1 branch

Thanks,
Laurent


