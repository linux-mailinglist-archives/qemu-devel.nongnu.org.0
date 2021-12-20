Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C677147B239
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:36:39 +0100 (CET)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMaU-00062l-Jh
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:36:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzL2A-00006u-B4
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:57:07 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzL27-0006ej-Dd
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:57:06 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2mS2-1mKXco24rM-013AOz; Mon, 20 Dec 2021 16:56:54 +0100
Message-ID: <fec03d2e-61d1-a20d-8aea-9538e1eaf690@vivier.eu>
Date: Mon, 20 Dec 2021 16:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/3] linux-user: Remove TARGET_SIGSTKSZ
Content-Language: fr
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
 <1637893388-10282-4-git-send-email-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1637893388-10282-4-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qgCyDsuoYRK0ssGxasHTgrKmjry+cjZH7grrXB4v9VhQ8NWTOUH
 u26EOOVGqDnHAbzYFMPZ/ozR5EdvLSN5PVKTiCClVhQNfYWt+7yGFKItGYxXsL3DnTqI3sh
 vJ6GzpRs3Z0fdwz5nWtig0kUQLBF2xDBJOKtTZUKk1vC5R1zAr2eynKlTrB3UA5EKH4VNJN
 1cwbqoJz16XPIBU7tWV8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eb95tMiOLLI=:kEl/vM9N7iQqSNp6RQ4SMk
 aK7QOGcZLyh/krE03h2jc41dHcWuJXoUAaffc3jusy+rZVy6Voh1wNbufGDpGXqcmv+m9qjdY
 Yfjomydb4dcxgUxFSJqdTgvazKTbqzmp2pa+QFtpcsgp4iJ0nqtL6QWxF2sszqFF8Apto8f+T
 ulLssVIZwXe4PC+pKiIZ+fHxMglMuOp7NQSVUzkAZ4DBGdwh8EAJ5nllMkGPo+OyRHSvKAVku
 Y8I8rpooZDDbTIbJqqvV/DcLfdwT+nUfKvd7c8SrzxsW6ms21az2AKamcA9Bl6fXxWttZbcy3
 6y65KKgCta6VsSciqFcDk0/cpdeKkLbuRxRVIERe/MftWqvmqXRI9AMKlESCYFl8j1MIfn/+z
 XVpf4ZJoH3ASphhukE0HecUdFp7rOCe8Vu5Qvo1IYQABUxm+y+S9SvtVLKdfxHb+qUP+zRuSQ
 jzvIKQ+mBN8UI42xipi7f16DIDSjU+R/W99tPddWLnZOnBTPdL7Dc9esRKE9rWCE4vM2RQqfi
 rOP5vETXib5j9ZZiFjjPu2EDegFC6wrs1T64m+By9sWJCNfCxIY69jEOKJl/cbLf4WsBqedxY
 /YXudKtwUfRgFy1uwTHcCDJboE3CtA56pP/YmIBUibXsD+J8D/sb8Nq0SKfF+qLYVZZ4GnUWU
 +qh8/ei5AjicOa99UDCs0yNqUmwiQ26abNxUP/3WFM+9k0/ddPw1csZ/m96rM+4/jlBU=
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
> TARGET_SIGSTKSZ is not used, we should remove it.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   linux-user/alpha/target_signal.h  | 1 -
>   linux-user/generic/signal.h       | 1 -
>   linux-user/hppa/target_signal.h   | 1 -
>   linux-user/mips/target_signal.h   | 1 -
>   linux-user/mips64/target_signal.h | 1 -
>   linux-user/sparc/target_signal.h  | 1 -
>   6 files changed, 6 deletions(-)
> 
> diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
> index 0b6a39d..bbb06e5 100644
> --- a/linux-user/alpha/target_signal.h
> +++ b/linux-user/alpha/target_signal.h
> @@ -62,7 +62,6 @@ typedef struct target_sigaltstack {
>   #define TARGET_SA_SIGINFO       0x00000040
>   
>   #define TARGET_MINSIGSTKSZ	4096
> -#define TARGET_SIGSTKSZ		16384
>   
>   /* From <asm/gentrap.h>.  */
>   #define TARGET_GEN_INTOVF      -1      /* integer overflow */
> diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
> index ceaf8a8..6fd05b7 100644
> --- a/linux-user/generic/signal.h
> +++ b/linux-user/generic/signal.h
> @@ -69,7 +69,6 @@ typedef struct target_sigaltstack {
>   #define TARGET_SS_DISABLE 2
>   
>   #define TARGET_MINSIGSTKSZ     2048
> -#define TARGET_SIGSTKSZ        8192
>   
>   /* bit-flags */
>   #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
> index d558119..af6c2fc 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -64,7 +64,6 @@ typedef struct target_sigaltstack {
>   #define TARGET_SA_NOCLDWAIT     0x00000080
>   
>   #define TARGET_MINSIGSTKSZ	2048
> -#define TARGET_SIGSTKSZ		8192
>   
>   /* bit-flags */
>   #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
> index 780a4dd..fa542c1 100644
> --- a/linux-user/mips/target_signal.h
> +++ b/linux-user/mips/target_signal.h
> @@ -67,7 +67,6 @@ typedef struct target_sigaltstack {
>   #define TARGET_SA_RESTORER      0x04000000      /* Only for O32 */
>   
>   #define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
>   
>   #if defined(TARGET_ABI_MIPSO32)
>   /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
> diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
> index 275e9b7..b05098f 100644
> --- a/linux-user/mips64/target_signal.h
> +++ b/linux-user/mips64/target_signal.h
> @@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
>   #define TARGET_SA_RESETHAND     0x80000000
>   
>   #define TARGET_MINSIGSTKSZ    2048
> -#define TARGET_SIGSTKSZ       8192
>   
>   /* bit-flags */
>   #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
> index e661ddd..87757f0 100644
> --- a/linux-user/sparc/target_signal.h
> +++ b/linux-user/sparc/target_signal.h
> @@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
>   #define TARGET_ARCH_HAS_KA_RESTORER 1
>   
>   #define TARGET_MINSIGSTKSZ	4096
> -#define TARGET_SIGSTKSZ		16384
>   
>   #ifdef TARGET_ABI32
>   #define TARGET_ARCH_HAS_SETUP_FRAME

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


