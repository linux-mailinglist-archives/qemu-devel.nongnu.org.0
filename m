Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD647B23A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:37:42 +0100 (CET)
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMbV-00072C-5x
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:37:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzL27-0008VU-QQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:57:03 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:47829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzL21-0006bf-RN
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:57:01 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mgf8s-1mXiuC2yVw-00h7Pq; Mon, 20 Dec 2021 16:56:40 +0100
Message-ID: <9dea7fe6-0eb5-604b-89e5-7f5b64b6ee27@vivier.eu>
Date: Mon, 20 Dec 2021 16:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/3] linux-user: target_syscall.h remove definition
 TARGET_MINSIGSTKSZ
Content-Language: fr
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
 <1637893388-10282-3-git-send-email-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1637893388-10282-3-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TxcOUnijfu1q3d9i2rEGXYsJtLYYpTy69ueGu4a6o7UrpTdf1dP
 98f6ZtUYSAspx5uXZiUXLKNmACYhJxpryuz16ktUE0MMcxxO0E3sFe9gnzLwLbTUbywtTpe
 bGSb6e4FQFucII3bBvDmWlnmHXfFbGOfxsbvYVjwVZiA+zkIWXFvkoColPkZG+4H5Y7go1n
 CKHd5/bgAx+Ibsvx9vwsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WuR4DWdBuLY=:gkpe1YNj2zEAZFRFxbZu8S
 o5oZv2gUb3akSz4R8/hxEOntQSdsIWPtJICN8Ymf4la7lC7KJS94GgwUgaSVk6Q2R4kvweaD8
 /xUZytyjvHiBrnTCqdUPov8wGNhkH4jtpJlWQ4tZMos6t7tnOAlqFb5Df/xS5YR+TEtpM5vQq
 JNQzN51Od/Go3SbyTwRHIFHRP9bYuqL7EXQmv25oCM44dlshiutgzcJiQNc9xCiWdbXltxGfp
 KVZo8v9z5IdaG4MX/gXhdpxl84u6MRUYNv/Mkht+AO+3//V1TDlovRjvEMyDxMe/geL53cy72
 9O3gjODvoQ1cfdsIQ07F3g5mj20XlQAiXRH1MoYVpdambBS5Cj+rpXJOlDIEQ4fass+7PAjo2
 VELTv+fC4+S2Z8SpOKNcQc0Sud7n1Cc2vl915g34aJJDJR2gdMWrahZmYyA9Xf9/MuM5M8lr2
 y9CjibhvAn3MS/RkULz3oimg/xsHVBD8pgXVFk6ZpC2BWyMnMEluvg0VIq31Q9ziP2CoTOV13
 ITIUV5nUdj4ywdwOLsVewoAb7auKBEy0gOiyHvYC/Ql5hM6yqqCfBE31VIVQnhfS97vV/mBv5
 eN6k+zLBDEJfIVGtnyXajd62HCsoMVbRxacrtQlkrCMx+WgVIF9yEDO0YDusailideP7p492e
 3NQzAn8J45gQ6JrvXM/QR0Os0WMqpvCvjmcQgj71I2pCSIjYBIWx/RZWMAvtTrO+VRNA=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
> TARGET_MINSIGSTKSZ has been defined in generic/signal.h
> or target_signal.h, We don't need to define it again.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/aarch64/target_syscall.h    | 1 -
>   linux-user/alpha/target_syscall.h      | 1 -
>   linux-user/arm/target_syscall.h        | 1 -
>   linux-user/cris/target_syscall.h       | 1 -
>   linux-user/hppa/target_syscall.h       | 1 -
>   linux-user/i386/target_syscall.h       | 1 -
>   linux-user/m68k/target_syscall.h       | 1 -
>   linux-user/microblaze/target_syscall.h | 1 -
>   linux-user/mips/target_syscall.h       | 1 -
>   linux-user/mips64/target_syscall.h     | 1 -
>   linux-user/nios2/target_syscall.h      | 1 -
>   linux-user/openrisc/target_syscall.h   | 1 -
>   linux-user/ppc/target_syscall.h        | 1 -
>   linux-user/riscv/target_syscall.h      | 1 -
>   linux-user/s390x/target_syscall.h      | 1 -
>   linux-user/sh4/target_syscall.h        | 1 -
>   linux-user/sparc/target_syscall.h      | 1 -
>   linux-user/x86_64/target_syscall.h     | 1 -
>   18 files changed, 18 deletions(-)
> 
> diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
> index 76f6c33..508219d 100644
> --- a/linux-user/aarch64/target_syscall.h
> +++ b/linux-user/aarch64/target_syscall.h
> @@ -15,7 +15,6 @@ struct target_pt_regs {
>   #endif
>   #define UNAME_MINIMUM_RELEASE "3.8.0"
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ       2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
> index 03091bf..fda3a49 100644
> --- a/linux-user/alpha/target_syscall.h
> +++ b/linux-user/alpha/target_syscall.h
> @@ -63,7 +63,6 @@ struct target_pt_regs {
>   #define TARGET_UAC_NOPRINT		1
>   #define TARGET_UAC_NOFIX		2
>   #define TARGET_UAC_SIGBUS		4
> -#define TARGET_MINSIGSTKSZ              4096
>   #define TARGET_MCL_CURRENT     0x2000
>   #define TARGET_MCL_FUTURE      0x4000
>   #define TARGET_MCL_ONFAULT     0x8000
> diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
> index e870ed7..f04f9c9 100644
> --- a/linux-user/arm/target_syscall.h
> +++ b/linux-user/arm/target_syscall.h
> @@ -27,7 +27,6 @@ struct target_pt_regs {
>   
>   #define TARGET_CLONE_BACKWARDS
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/cris/target_syscall.h b/linux-user/cris/target_syscall.h
> index 19e1281..0b5ebf1 100644
> --- a/linux-user/cris/target_syscall.h
> +++ b/linux-user/cris/target_syscall.h
> @@ -39,7 +39,6 @@ struct target_pt_regs {
>   };
>   
>   #define TARGET_CLONE_BACKWARDS2
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
> index 0018bcb..4b382c1 100644
> --- a/linux-user/hppa/target_syscall.h
> +++ b/linux-user/hppa/target_syscall.h
> @@ -22,7 +22,6 @@ struct target_pt_regs {
>   #define UNAME_MACHINE "parisc"
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ       2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/i386/target_syscall.h b/linux-user/i386/target_syscall.h
> index ed356b3..aaade06 100644
> --- a/linux-user/i386/target_syscall.h
> +++ b/linux-user/i386/target_syscall.h
> @@ -150,7 +150,6 @@ struct target_vm86plus_struct {
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/m68k/target_syscall.h b/linux-user/m68k/target_syscall.h
> index 23359a6..8d4ddbd 100644
> --- a/linux-user/m68k/target_syscall.h
> +++ b/linux-user/m68k/target_syscall.h
> @@ -20,7 +20,6 @@ struct target_pt_regs {
>   #define UNAME_MACHINE "m68k"
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/microblaze/target_syscall.h b/linux-user/microblaze/target_syscall.h
> index 7f653db..43362a1 100644
> --- a/linux-user/microblaze/target_syscall.h
> +++ b/linux-user/microblaze/target_syscall.h
> @@ -49,7 +49,6 @@ struct target_pt_regs {
>   };
>   
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ      2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
> index f590574..7a82661 100644
> --- a/linux-user/mips/target_syscall.h
> +++ b/linux-user/mips/target_syscall.h
> @@ -24,7 +24,6 @@ struct target_pt_regs {
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
> index cd1e1b4..2c7a881 100644
> --- a/linux-user/mips64/target_syscall.h
> +++ b/linux-user/mips64/target_syscall.h
> @@ -21,7 +21,6 @@ struct target_pt_regs {
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ      2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/nios2/target_syscall.h b/linux-user/nios2/target_syscall.h
> index 78006c2..561b28d 100644
> --- a/linux-user/nios2/target_syscall.h
> +++ b/linux-user/nios2/target_syscall.h
> @@ -30,7 +30,6 @@ struct target_pt_regs {
>       unsigned long  orig_r7;
>   };
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/openrisc/target_syscall.h b/linux-user/openrisc/target_syscall.h
> index ef0d89a..7fe5b73 100644
> --- a/linux-user/openrisc/target_syscall.h
> +++ b/linux-user/openrisc/target_syscall.h
> @@ -15,7 +15,6 @@ struct target_pt_regs {
>   #define UNAME_MACHINE "openrisc"
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
> index b9c4b81..8b36469 100644
> --- a/linux-user/ppc/target_syscall.h
> +++ b/linux-user/ppc/target_syscall.h
> @@ -71,7 +71,6 @@ struct target_revectored_struct {
>   
>   #define TARGET_CLONE_BACKWARDS
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 0x2000
>   #define TARGET_MCL_FUTURE  0x4000
>   #define TARGET_MCL_ONFAULT 0x8000
> diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
> index dc597c8..8d4b372 100644
> --- a/linux-user/riscv/target_syscall.h
> +++ b/linux-user/riscv/target_syscall.h
> @@ -50,7 +50,6 @@ struct target_pt_regs {
>   #endif
>   #define UNAME_MINIMUM_RELEASE "4.15.0"
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/s390x/target_syscall.h b/linux-user/s390x/target_syscall.h
> index 94f8417..4018988 100644
> --- a/linux-user/s390x/target_syscall.h
> +++ b/linux-user/s390x/target_syscall.h
> @@ -27,7 +27,6 @@ struct target_pt_regs {
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
>   #define TARGET_CLONE_BACKWARDS2
> -#define TARGET_MINSIGSTKSZ        2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/sh4/target_syscall.h b/linux-user/sh4/target_syscall.h
> index c1437ad..1483988 100644
> --- a/linux-user/sh4/target_syscall.h
> +++ b/linux-user/sh4/target_syscall.h
> @@ -15,7 +15,6 @@ struct target_pt_regs {
>   #define UNAME_MACHINE "sh4"
>   #define UNAME_MINIMUM_RELEASE "2.6.32"
>   
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4
> diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
> index 087b39d..be77e44 100644
> --- a/linux-user/sparc/target_syscall.h
> +++ b/linux-user/sparc/target_syscall.h
> @@ -34,7 +34,6 @@ struct target_pt_regs {
>    * and copy_thread().
>    */
>   #define TARGET_CLONE_BACKWARDS
> -#define TARGET_MINSIGSTKSZ      4096
>   #define TARGET_MCL_CURRENT 0x2000
>   #define TARGET_MCL_FUTURE  0x4000
>   #define TARGET_MCL_ONFAULT 0x8000
> diff --git a/linux-user/x86_64/target_syscall.h b/linux-user/x86_64/target_syscall.h
> index 3ecccb7..fb55834 100644
> --- a/linux-user/x86_64/target_syscall.h
> +++ b/linux-user/x86_64/target_syscall.h
> @@ -100,7 +100,6 @@ struct target_msqid64_ds {
>   #define TARGET_ARCH_SET_FS 0x1002
>   #define TARGET_ARCH_GET_FS 0x1003
>   #define TARGET_ARCH_GET_GS 0x1004
> -#define TARGET_MINSIGSTKSZ 2048
>   #define TARGET_MCL_CURRENT 1
>   #define TARGET_MCL_FUTURE  2
>   #define TARGET_MCL_ONFAULT 4

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


