Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBCA6ADC94
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZV0N-0005Al-PF; Tue, 07 Mar 2023 05:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZV0K-0005A8-Cv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:57:13 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZV0H-0000Vi-8e
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:57:10 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MvsyF-1qOaHt2LEV-00sryD; Tue, 07 Mar 2023 11:57:06 +0100
Message-ID: <47b76500-b4d5-75cf-327c-162dd4f5f738@vivier.eu>
Date: Tue, 7 Mar 2023 11:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: add support for xtensa FDPIC
Content-Language: fr
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20230205061230.544451-1-jcmvbkbc@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230205061230.544451-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xQBDI3rs/J2S+yd+0PqncGbQJrbrVOCi4fkX7I4yEjl2383EiAM
 6DWlKHmNcBn1tPhetEFpmm8zzd0EwbZC4s8gBe+sIImVXSYrZjTn0WFHl1eez/T1whBMyh/
 S0w6N6E4qptuI4ftH3fjRMvVH3B5oteiBJVM9b8Ro/09uxG2IKroUOAO0VkGFiZsULeB6p5
 BeevuI9HqVVXVFEviC/Ew==
UI-OutboundReport: notjunk:1;M01:P0:ZGtqByyg5FE=;1rU0SG/t/5xrwBxBdumibDV0Zxw
 e9OI1BhLvNPvhi1dNj591VHTBZ4vJ5oJigwMwbogEaSj9YdutbsxdlhFduFLK35hkhXb/ISuv
 PqhNPwMuZn+V1UwhNGXuU8GQl3BxhgVe0r9X+a327H5uDiq8xhiwH6B25TqXQUMOZcxW9n5vS
 NAH+m1NsMI2AgBPTZUSPB4+u7Ell91M1SE9bR0jQUgHFWddH8pVD/1fB1kbXDXDBMlk0hnpsh
 RJud06xx2D8mznuGIXMMZUpv1J1GCqD38AmAwhKardUacqN48nJ3D65kZ3i0S4UiTNXHsFe5U
 VG0MuVA5/DTkxCuo1H7QCQzQag+2zGpyBF2LagY5xscySUxahrIM1O8iNsvJV/qs2CRDHrHmC
 ctUVM8/0kBOYAONeE4We+RnE5tcuUI20U+nu9/8+cCHhMGw9ovm6Q4gLZuOwSkY5MOBYTSonm
 2LccKkNY0DzapmpCP7D5e0b22dF7kaR7NeB4tVTUbXHNQDtSCBvibqM9kJamCTIdoRRWfMKeY
 AmoxGTqyOunkdTEazQLgGdh4c9a3U/I0zf7ovv2MuevcSKa2/8nGJV3ir+og3kzlhYKMC7XmV
 SsXEFY5KxWI4agiQ90K+3wecEDwJGx7QUQRY+MOyQEGLmi9h2sWi8g2GExyWENcdGoBA1hYPV
 d7Tiql0hxZVY/KwnQ+A7ZHEDPc5c5UvxYb4gE7WXhQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 05/02/2023 à 07:12, Max Filippov a écrit :
> Define xtensa-specific info_is_fdpic and fill in FDPIC-specific
> registers in the xtensa version of init_thread.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>   include/elf.h        |  1 +
>   linux-user/elfload.c | 16 +++++++++++++++-
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/include/elf.h b/include/elf.h
> index 8bf1e72720d5..e8bfe38a9fbd 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -1619,6 +1619,7 @@ typedef struct elf64_shdr {
>   #define ELFOSABI_MODESTO        11      /* Novell Modesto.  */
>   #define ELFOSABI_OPENBSD        12      /* OpenBSD.  */
>   #define ELFOSABI_ARM_FDPIC      65      /* ARM FDPIC */
> +#define ELFOSABI_XTENSA_FDPIC   65      /* Xtensa FDPIC */
>   #define ELFOSABI_ARM            97      /* ARM */
>   #define ELFOSABI_STANDALONE     255     /* Standalone (embedded) application */
>   
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 5928c14dfc97..150d1d450396 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1748,6 +1748,15 @@ static inline void init_thread(struct target_pt_regs *regs,
>       regs->windowstart = 1;
>       regs->areg[1] = infop->start_stack;
>       regs->pc = infop->entry;
> +    if (info_is_fdpic(infop)) {
> +        regs->areg[4] = infop->loadmap_addr;
> +        regs->areg[5] = infop->interpreter_loadmap_addr;
> +        if (infop->interpreter_loadmap_addr) {
> +            regs->areg[6] = infop->interpreter_pt_dynamic_addr;
> +        } else {
> +            regs->areg[6] = infop->pt_dynamic_addr;
> +        }
> +    }
>   }
>   
>   /* See linux kernel: arch/xtensa/include/asm/elf.h.  */
> @@ -2207,11 +2216,16 @@ static void zero_bss(abi_ulong elf_bss, abi_ulong last_bss, int prot)
>       }
>   }
>   
> -#ifdef TARGET_ARM
> +#if defined(TARGET_ARM)
>   static int elf_is_fdpic(struct elfhdr *exec)
>   {
>       return exec->e_ident[EI_OSABI] == ELFOSABI_ARM_FDPIC;
>   }
> +#elif defined(TARGET_XTENSA)
> +static int elf_is_fdpic(struct elfhdr *exec)
> +{
> +    return exec->e_ident[EI_OSABI] == ELFOSABI_XTENSA_FDPIC;
> +}
>   #else
>   /* Default implementation, always false.  */
>   static int elf_is_fdpic(struct elfhdr *exec)

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


