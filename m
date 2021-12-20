Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C023047B235
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:33:41 +0100 (CET)
Received: from localhost ([::1]:47182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMXc-0001Bp-BO
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzL1s-0008MK-TW
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:56:50 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:56909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzL1o-0006UN-OJ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:56:46 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtwpW-1mBmCn3WtI-00uGca; Mon, 20 Dec 2021 16:56:30 +0100
Message-ID: <38022c2c-ff3b-76f9-f243-c008823409a9@vivier.eu>
Date: Mon, 20 Dec 2021 16:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/3] linux-user: Move target_signal.h generic
 definitions to generic/signal.h
Content-Language: fr
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
 <1637893388-10282-2-git-send-email-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1637893388-10282-2-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rf+ViDlYP+di62HvPVHmZ6872ZXVN1UrMlsFjPSVfMVZWNqo0gM
 EIExpFCHZBe8O/3CpWQ7ElXEwTNpocZkaYfRM0ijeKK1fkZ6NIJNJk3kumAMxH1IlwYGrul
 SlSskhe2JKavfokfpSETW5dw3QQ56c/OSlH3iwJnDBvg+lAhZXbA6wy/pTP1Dl1CSg4ANGG
 HRhK7oPzfaBhvAEZKb/Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GshfRuxhiYs=:TXLDDiEEcoLAwuSXlqmv/2
 4G3IapreLbXkf+YYSHNcakEe8iBsEg4OcqbtZ0Bf0YmZX1emwPis6vYOCmXfeSn/yK9Tx1SeY
 zvpU/LBiMxMTXn4thhdzeTtjP0+wKA2+62UDwxHuVaQPXVfpX+/UKfXfL/TC89fnG4ZoKYDwW
 HHuRdjjH0fPvLsjnd/p4Y5gp0bDEgv0xqYWFxufvu/x1vQjhoXRyw2UIsV6DVkfc5lKMCiycy
 A11y08ZJoMkq+O4Gymmb2d7oWq76vAPdHkdO7PEga0paaX250dV+6NDE5yUAKtoD18huS+j1v
 IejL7ztd64b+gDSb3xzpvAKD1W++9NuinfBSzpzVcnrLmsGqgCDF9K0X5ea7kt3i5r0UxeUvQ
 2/6R4lqTBbK7hhIbGo/ERggJBXHI30Q68zMLt+NGsOH1/2v+o32zX2pe223fuKGgNvctZw7Qs
 7wJiKfBHA3NSDLdCILSdBaJbRIQMyu6hs10Cy6l37cB4WGxHJNq6AMWaeEwtq5W2qeTcqspzl
 u/AXXruD6HPO4w/VUAj0xl96SJG4JMQfOVUBjYao9w81tjShsBKQl1PXa0iKlOMHQJmSa6EuO
 D0G0WcvHgMuorLKIPhfiz4dUsNMZtUzjRCn1RMNrebUEi2RRUbKi6GsDcFJkXDINOZI1F5I2X
 gTH3n640W1ztQqeal4EgSq62oPWpu++n4ZdliKd1amiYk3VpJEMP71ehAYgwbBPNMqi4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/11/2021 à 03:23, Song Gao a écrit :
> No code change
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/aarch64/target_signal.h    | 18 ------------------
>   linux-user/arm/target_signal.h        | 18 ------------------
>   linux-user/cris/target_signal.h       | 18 ------------------
>   linux-user/generic/signal.h           | 16 ++++++++++++++++
>   linux-user/hexagon/target_signal.h    | 11 -----------
>   linux-user/i386/target_signal.h       | 18 ------------------
>   linux-user/m68k/target_signal.h       | 18 ------------------
>   linux-user/microblaze/target_signal.h | 18 ------------------
>   linux-user/nios2/target_signal.h      | 16 ----------------
>   linux-user/openrisc/target_signal.h   | 23 -----------------------
>   linux-user/ppc/target_signal.h        | 18 ------------------
>   linux-user/riscv/target_signal.h      | 12 ------------
>   linux-user/s390x/target_signal.h      | 15 ---------------
>   linux-user/sh4/target_signal.h        | 18 ------------------
>   linux-user/x86_64/target_signal.h     | 18 ------------------
>   linux-user/xtensa/target_signal.h     | 17 -----------------
>   16 files changed, 16 insertions(+), 256 deletions(-)
> 
> diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
> index 7580d99..40e399d 100644
> --- a/linux-user/aarch64/target_signal.h
> +++ b/linux-user/aarch64/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef AARCH64_TARGET_SIGNAL_H
>   #define AARCH64_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK 1
> -#define TARGET_SS_DISABLE 2
> -
> -#define TARGET_MINSIGSTKSZ 2048
> -#define TARGET_SIGSTKSZ 8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
> diff --git a/linux-user/arm/target_signal.h b/linux-user/arm/target_signal.h
> index 1e7fb0c..0e6351d 100644
> --- a/linux-user/arm/target_signal.h
> +++ b/linux-user/arm/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef ARM_TARGET_SIGNAL_H
>   #define ARM_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK	1
> -#define TARGET_SS_DISABLE	2
> -
> -#define TARGET_MINSIGSTKSZ	2048
> -#define TARGET_SIGSTKSZ		8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
> index 83a5155..ab0653f 100644
> --- a/linux-user/cris/target_signal.h
> +++ b/linux-user/cris/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef CRIS_TARGET_SIGNAL_H
>   #define CRIS_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
> index 943bc1a..ceaf8a8 100644
> --- a/linux-user/generic/signal.h
> +++ b/linux-user/generic/signal.h
> @@ -55,6 +55,22 @@
>   #define TARGET_SIG_UNBLOCK        1    /* for unblocking signals */
>   #define TARGET_SIG_SETMASK        2    /* for setting the signal mask */
>   
> +/* this struct defines a stack used during syscall handling */
> +typedef struct target_sigaltstack {
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
> +} target_stack_t;
> +
> +/*
> + * sigaltstack controls
> + */
> +#define TARGET_SS_ONSTACK 1
> +#define TARGET_SS_DISABLE 2
> +
> +#define TARGET_MINSIGSTKSZ     2048
> +#define TARGET_SIGSTKSZ        8192
> +
>   /* bit-flags */
>   #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
>   /* mask for all SS_xxx flags */
> diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
> index 9e0223d..193abac 100644
> --- a/linux-user/hexagon/target_signal.h
> +++ b/linux-user/hexagon/target_signal.h
> @@ -18,17 +18,6 @@
>   #ifndef HEXAGON_TARGET_SIGNAL_H
>   #define HEXAGON_TARGET_SIGNAL_H
>   
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -#define TARGET_SS_ONSTACK 1
> -#define TARGET_SS_DISABLE 2
> -
> -#define TARGET_MINSIGSTKSZ 2048
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
> index 64d09f2..9315cba 100644
> --- a/linux-user/i386/target_signal.h
> +++ b/linux-user/i386/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef I386_TARGET_SIGNAL_H
>   #define I386_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK	1
> -#define TARGET_SS_DISABLE	2
> -
> -#define TARGET_MINSIGSTKSZ	2048
> -#define TARGET_SIGSTKSZ		8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
> index 94157bf..6e0f4b7 100644
> --- a/linux-user/m68k/target_signal.h
> +++ b/linux-user/m68k/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef M68K_TARGET_SIGNAL_H
>   #define M68K_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK	1
> -#define TARGET_SS_DISABLE	2
> -
> -#define TARGET_MINSIGSTKSZ	2048
> -#define TARGET_SIGSTKSZ	8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
> index e8b510f..7dc5c45 100644
> --- a/linux-user/microblaze/target_signal.h
> +++ b/linux-user/microblaze/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef MICROBLAZE_TARGET_SIGNAL_H
>   #define MICROBLAZE_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
> index fe266c4..46ca594 100644
> --- a/linux-user/nios2/target_signal.h
> +++ b/linux-user/nios2/target_signal.h
> @@ -1,22 +1,6 @@
>   #ifndef NIOS2_TARGET_SIGNAL_H
>   #define NIOS2_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/* sigaltstack controls  */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   /* Nios2 uses a fixed address on the kuser page for sigreturn. */
> diff --git a/linux-user/openrisc/target_signal.h b/linux-user/openrisc/target_signal.h
> index 077ec3d..5b9d409 100644
> --- a/linux-user/openrisc/target_signal.h
> +++ b/linux-user/openrisc/target_signal.h
> @@ -1,29 +1,6 @@
>   #ifndef OPENRISC_TARGET_SIGNAL_H
>   #define OPENRISC_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_long ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -/* sigaltstack controls  */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_SA_NOCLDSTOP    0x00000001
> -#define TARGET_SA_NOCLDWAIT    0x00000002
> -#define TARGET_SA_SIGINFO      0x00000004
> -#define TARGET_SA_ONSTACK      0x08000000
> -#define TARGET_SA_RESTART      0x10000000
> -#define TARGET_SA_NODEFER      0x40000000
> -#define TARGET_SA_RESETHAND    0x80000000
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
> index 82184ab..5be24e1 100644
> --- a/linux-user/ppc/target_signal.h
> +++ b/linux-user/ppc/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef PPC_TARGET_SIGNAL_H
>   #define PPC_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   #if !defined(TARGET_PPC64)
> diff --git a/linux-user/riscv/target_signal.h b/linux-user/riscv/target_signal.h
> index 3e36fdd..6c0470f 100644
> --- a/linux-user/riscv/target_signal.h
> +++ b/linux-user/riscv/target_signal.h
> @@ -1,18 +1,6 @@
>   #ifndef RISCV_TARGET_SIGNAL_H
>   #define RISCV_TARGET_SIGNAL_H
>   
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -#define TARGET_SS_ONSTACK 1
> -#define TARGET_SS_DISABLE 2
> -
> -#define TARGET_MINSIGSTKSZ 2048
> -#define TARGET_SIGSTKSZ 8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
> index 64f5f42..41e0e34 100644
> --- a/linux-user/s390x/target_signal.h
> +++ b/linux-user/s390x/target_signal.h
> @@ -1,21 +1,6 @@
>   #ifndef S390X_TARGET_SIGNAL_H
>   #define S390X_TARGET_SIGNAL_H
>   
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK      1
> -#define TARGET_SS_DISABLE      2
> -
> -#define TARGET_MINSIGSTKSZ     2048
> -#define TARGET_SIGSTKSZ        8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/sh4/target_signal.h b/linux-user/sh4/target_signal.h
> index 04069cb..eee6a1a 100644
> --- a/linux-user/sh4/target_signal.h
> +++ b/linux-user/sh4/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef SH4_TARGET_SIGNAL_H
>   #define SH4_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SETUP_FRAME
> diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
> index 4673c5a..9d97174 100644
> --- a/linux-user/x86_64/target_signal.h
> +++ b/linux-user/x86_64/target_signal.h
> @@ -1,24 +1,6 @@
>   #ifndef X86_64_TARGET_SIGNAL_H
>   #define X86_64_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK	1
> -#define TARGET_SS_DISABLE	2
> -
> -#define TARGET_MINSIGSTKSZ	2048
> -#define TARGET_SIGSTKSZ		8192
> -
>   #include "../generic/signal.h"
>   
>   /* For x86_64, use of SA_RESTORER is mandatory. */
> diff --git a/linux-user/xtensa/target_signal.h b/linux-user/xtensa/target_signal.h
> index 1c7ee73..e4b1bea 100644
> --- a/linux-user/xtensa/target_signal.h
> +++ b/linux-user/xtensa/target_signal.h
> @@ -1,23 +1,6 @@
>   #ifndef XTENSA_TARGET_SIGNAL_H
>   #define XTENSA_TARGET_SIGNAL_H
>   
> -/* this struct defines a stack used during syscall handling */
> -
> -typedef struct target_sigaltstack {
> -    abi_ulong ss_sp;
> -    abi_int ss_flags;
> -    abi_ulong ss_size;
> -} target_stack_t;
> -
> -/*
> - * sigaltstack controls
> - */
> -#define TARGET_SS_ONSTACK     1
> -#define TARGET_SS_DISABLE     2
> -
> -#define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
> -
>   #include "../generic/signal.h"
>   
>   #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

