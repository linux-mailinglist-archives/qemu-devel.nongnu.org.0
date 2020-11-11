Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE32AFA9A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:39:21 +0100 (CET)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcxpo-0007Cs-0S
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxnt-0005xY-8q
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:37:21 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxnq-0005ZM-Tz
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:37:20 -0500
Received: from [192.168.100.1] ([82.252.148.166]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M7JvQ-1ke2fV2XNM-007ivn; Wed, 11 Nov 2020 22:37:13 +0100
Subject: Re: [PATCH v2] linux-user: Correct definition of stack_t
To: LemonBoy <thatlemon@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <e9d47692-ee92-009f-6007-0abc3f502b97@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6e899211-b944-f492-94c2-0a21ed10f174@vivier.eu>
Date: Wed, 11 Nov 2020 22:37:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e9d47692-ee92-009f-6007-0abc3f502b97@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UI78/zPHqzrOrvzCPHRdR2SmOlY1YWRkPTsP3gpdH1HECFHPKt8
 zNzlKph2QA7r6s+Y8AR0Q5x4o5SPPGI3+z4/YXYnj0tpEFW2eXrm5bDnP6sz5G2p2jNe5Fr
 f7UImVAXKi+PbDO5GVSzfI2Q/B9+u53hApD8et5/fxuHVIF2tS0cZZzi7vcwErvjhknVNVM
 Q00acVsBDQjIBqVMv/bqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9zbnF90AEfQ=:kVryxgV+rUA3f/KviCacTX
 NozS2+wqKWfx63Ynu4GnXmzKv6IkAFPNR609WKvmpz9R8PCnoFRF4gEyrOVaHO+pT81tihxIU
 nzeeXrngZe61RAfHnGK1ds4OsZXXOeSoMNsaw1drFxJAmJfNfK5RmA5h1qJZn3qTpxwDLxL3s
 mmR1fvkANb6maMi5RwZTG4huuyLl1hf9Ql+olIBDlpP8+klsqpS1HMcIslRLRHsL+mqrZcbA/
 WrZBD+AAvroqQ8WjBY4qVFFMQSGA9t2cy0jObY1V1KxyGfqoA2ttKD8+TMJXd6GNcliZ/zInp
 X+Wk3PotXEZalWmPluS1g1GOjEx/ax9cDVTAXATaIv9oJDGrc29KD+5zBGyYHmaiL8M13SJSW
 G6f95zzlg1IOtgKqsKv3vOh3XmxgW8vPan7ZZb8Dz81K/NtpSqQ9BEEeSXJPD39terDegEYgC
 rjZvKiNxnw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 16:37:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2020 à 16:52, LemonBoy a écrit :
> Some platforms used the wrong definition of stack_t where the flags and
> size fields were swapped or where the flags field had type ulong instead
> of int.
> 
> Due to the presence of padding space in the structure and the prevalence
> of little-endian machines this problem went unnoticed for a long time.
> 
> The type definitions have been cross-checked with the ones defined in
> the Linux kernel v5.9, plus some older versions for a few architecture
> that have been removed and Xilinx's kernel fork for NiosII [1].
> 
> The bsd-user headers remain unchanged as I don't know if they are wrong
> or not.
> 
> [1] https://github.com/Xilinx/linux-xlnx/blob/master/arch/nios2/include/uapi/asm/signal.h
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/alpha/target_signal.h      | 3 +--
>  linux-user/arm/target_signal.h        | 6 +++---
>  linux-user/cris/target_signal.h       | 6 +++---
>  linux-user/hppa/target_signal.h       | 2 +-
>  linux-user/i386/target_signal.h       | 6 +++---
>  linux-user/m68k/target_signal.h       | 6 +++---
>  linux-user/microblaze/target_signal.h | 6 +++---
>  linux-user/mips/target_signal.h       | 6 +++---
>  linux-user/mips64/target_signal.h     | 7 +++----
>  linux-user/nios2/target_signal.h      | 5 +++--
>  linux-user/ppc/target_signal.h        | 6 +++---
>  linux-user/s390x/target_signal.h      | 2 +-
>  linux-user/sh4/target_signal.h        | 6 +++---
>  linux-user/sparc/target_signal.h      | 6 +++---
>  linux-user/x86_64/target_signal.h     | 6 +++---
>  15 files changed, 39 insertions(+), 40 deletions(-)
> 
> diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
> index cd63d59fde..b83797281c 100644
> --- a/linux-user/alpha/target_signal.h
> +++ b/linux-user/alpha/target_signal.h
> @@ -42,8 +42,7 @@
>  
>  typedef struct target_sigaltstack {
>      abi_ulong ss_sp;
> -    int32_t ss_flags;
> -    int32_t dummy;
> +    abi_int ss_flags;
>      abi_ulong ss_size;
>  } target_stack_t;
>  
> diff --git a/linux-user/arm/target_signal.h b/linux-user/arm/target_signal.h
> index ea123c40f3..0998dd6dfa 100644
> --- a/linux-user/arm/target_signal.h
> +++ b/linux-user/arm/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_long ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
> index 1cb5548f85..495a142896 100644
> --- a/linux-user/cris/target_signal.h
> +++ b/linux-user/cris/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_ulong ss_size;
> -	abi_long ss_flags;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
> index c2a0102ed7..c52a3ea579 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -44,7 +44,7 @@
>  
>  typedef struct target_sigaltstack {
>      abi_ulong ss_sp;
> -    int32_t ss_flags;
> +    abi_int ss_flags;
>      abi_ulong ss_size;
>  } target_stack_t;
>  
> diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
> index f55e78fd33..50361af874 100644
> --- a/linux-user/i386/target_signal.h
> +++ b/linux-user/i386/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_long ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
> index 314e808844..d096544ef8 100644
> --- a/linux-user/m68k/target_signal.h
> +++ b/linux-user/m68k/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_long ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
> index 08bcf24b9d..1c326296de 100644
> --- a/linux-user/microblaze/target_signal.h
> +++ b/linux-user/microblaze/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_ulong ss_size;
> -	abi_long ss_flags;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
> index 66e1ad44a6..fa4084a99d 100644
> --- a/linux-user/mips/target_signal.h
> +++ b/linux-user/mips/target_signal.h
> @@ -45,9 +45,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_long ss_sp;
> -	abi_ulong ss_size;
> -	abi_long ss_flags;
> +    abi_ulong ss_sp;
> +    abi_ulong ss_size;
> +    abi_int ss_flags;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
> index 753e91fbd6..799f7a668c 100644
> --- a/linux-user/mips64/target_signal.h
> +++ b/linux-user/mips64/target_signal.h
> @@ -45,12 +45,11 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_long ss_sp;
> -	abi_ulong ss_size;
> -	abi_int ss_flags;
> +    abi_ulong ss_sp;
> +    abi_ulong ss_size;
> +    abi_int ss_flags;
>  } target_stack_t;
>  
> -
>  /*
>   * sigaltstack controls
>   */
> diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
> index fe48721b3d..aebf749f12 100644
> --- a/linux-user/nios2/target_signal.h
> +++ b/linux-user/nios2/target_signal.h
> @@ -4,11 +4,12 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -    abi_long ss_sp;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
>      abi_ulong ss_size;
> -    abi_long ss_flags;
>  } target_stack_t;
>  
> +
>  /* sigaltstack controls  */
>  #define TARGET_SS_ONSTACK     1
>  #define TARGET_SS_DISABLE     2
> diff --git a/linux-user/ppc/target_signal.h b/linux-user/ppc/target_signal.h
> index 4453e2e7ef..72fcdd9bfa 100644
> --- a/linux-user/ppc/target_signal.h
> +++ b/linux-user/ppc/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	int ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
> index b58bc7c20f..bbfc464d44 100644
> --- a/linux-user/s390x/target_signal.h
> +++ b/linux-user/s390x/target_signal.h
> @@ -3,7 +3,7 @@
>  
>  typedef struct target_sigaltstack {
>      abi_ulong ss_sp;
> -    int ss_flags;
> +    abi_int ss_flags;
>      abi_ulong ss_size;
>  } target_stack_t;
>  
> diff --git a/linux-user/sh4/target_signal.h b/linux-user/sh4/target_signal.h
> index 434970a990..d7309b7136 100644
> --- a/linux-user/sh4/target_signal.h
> +++ b/linux-user/sh4/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_long ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
> index 5cc40327d2..1b10d1490f 100644
> --- a/linux-user/sparc/target_signal.h
> +++ b/linux-user/sparc/target_signal.h
> @@ -42,9 +42,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_long ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
> index 4c4380f7b9..4ea74f20dd 100644
> --- a/linux-user/x86_64/target_signal.h
> +++ b/linux-user/x86_64/target_signal.h
> @@ -4,9 +4,9 @@
>  /* this struct defines a stack used during syscall handling */
>  
>  typedef struct target_sigaltstack {
> -	abi_ulong ss_sp;
> -	abi_long ss_flags;
> -	abi_ulong ss_size;
> +    abi_ulong ss_sp;
> +    abi_int ss_flags;
> +    abi_ulong ss_size;
>  } target_stack_t;
>  
>  
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


