Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87873212B0D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:18:51 +0200 (CEST)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr2rK-0003SN-ID
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jr2ov-0000fG-2w
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:16:21 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jr2or-0002WT-5F
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 13:16:20 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJV9M-1jXK4l1PKK-00Jool; Thu, 02 Jul 2020 19:16:07 +0200
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200626213937.20333-1-Filip.Bozuta@syrmia.com>
 <20200626213937.20333-3-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH 2/3] linux-user: Add strace support for printing arguments
 of syscalls used to lock and unlock memory
Message-ID: <f43ce09a-0f88-e0d0-f798-22680d6fbd2c@vivier.eu>
Date: Thu, 2 Jul 2020 19:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626213937.20333-3-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B15IM4Df5PNwVAY7musHDOR+lQtU/Roik3kvbrHFTCdR5vzlvc7
 IiHz+5g//jzSor/cE0qvDqltCQaK2XhaBXQPP+3obfiB3SOscKEfziuAq9nHLYklASuevUW
 ZeUGxnq1SlLUDNy7zLWwMvzd1AuG34Xm5GO5+enZpl/0zoMqI6S9LnkjAVHUEJs0ZJU+fe8
 PnVwwfJ+acY7KvaSTDKnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fEo08Lk9R8E=:HBksmhFRRXzeRN2vsPdfci
 WghO0C7shTXXTes5GK0pC673+Ka7A8knXc6D4QI9GAzbal8AAcMwAFJFkqkBfNyyXoOUXsjSt
 KQ/7yKgmbWSwBRGmElSulFEeBj28grdXFVSuGkcH7GqTdrcxBlWARVVhibvXl1/b3jBKIVwcH
 mVjOMWZJY51Qza86vKvD1CowsVbjBj/FsYf8cEWEBXTnuwezU1pW2EwAPe6QOGGNt7Oaz34oi
 J6c2un9nQ2p/V4fx6Pd1kLXslVm9cqUCLglFS8tIZEiH7EURWuK00yBYl9Sw2kLcS+9bX9CeZ
 SbgjjH0MtURrygFPv8FzqCUuEIxFvDB7SQuv50P1rDMLIf2J066gqFg08QbersFZhZx+v/WdF
 R0HGK3apaTByR0zOEudk9+LEnvNiRY8UkkTSLblEiOKQNUBl61b2hM/YFGmsZA8yXdh7IvpE8
 P8F5GqQD1wWJ1M0UmnpB2CYIY/mPWj/1VXvTvQCIuG0DZIp+9F8BiXQSUISheLxPCWbbDXaR/
 28fshAPy1Vp8aRHls4fZnKBdR5raPyR5CM+VfauQ55jeFCEK3B4266+ee0ZpA2FYvdQnsjV5t
 +EWnm1sAsw6mUa1w4uDaulY1Zb3A944V95BSm48zUV1oFmScixYeRa8M7k9IdXzAqijnpbSou
 J/1ETqoUNeuVUQKnghZsa7Lvvb/9mFxSQmKjS3OyJWsdGF+nYu2oK2QxcSUpSCSJLl2h3ttVG
 Rh1i/u1Sekmzzba7nOSv4IWQWyrURm4DEfDeWwBGwiHHlGj6vXpWxhsyxIMtkp5MPPDLbwnZz
 Sf14kVy5uiTrMc0rw/7jfz0kLKzuaALMAbl+PCqkgA0bbsEDLDgho8KixB4cdK3lLhQkAcI
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 13:16:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: riku.voipio@iki.fi
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/06/2020 à 23:39, Filip Bozuta a écrit :
> This patch implements strace argument printing functionality for following syscalls:
> 
>     * mlock, munlock, mlockall, munlockall - lock and unlock memory
> 
>        int mlock(const void *addr, size_t len)
>        int munlock(const void *addr, size_t len)
>        int mlockall(int flags)
>        int munlockall(void)
>        man page: https://man7.org/linux/man-pages/man2/mlock.2.html
> 
> Implementation notes:
> 
>     Syscall mlockall() takes an argument that is composed of predefined values
>     which represent flags that determine the type of locking operation that is
>     to be performed. For that reason, a printing function "print_mlockall" was
>     stated in file "strace.list". This printing function uses an already existing
>     function "print_flags()" to print the "flags" argument.  These flags are stated
>     inside an array "mlockall_flags" that contains values of type "struct flags".
>     These values are instantiated using an existing macro "FLAG_GENERIC()".
>     The other syscalls have only primitive argument types, so the
>     rest of the implementation was handled by stating an appropriate
>     printing format in file "strace.list". Syscall mlock2() is not implemented in
>     "syscall.c" and thus it's argument printing is not implemented in this patch.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/strace.c    | 21 +++++++++++++++++++++
>  linux-user/strace.list |  8 ++++----
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index dccfbc46e9..1fc4404310 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1161,6 +1161,15 @@ UNUSED static struct flags falloc_flags[] = {
>  #endif
>  };
>  
> +UNUSED static struct flags mlockall_flags[] = {
> +    FLAG_GENERIC(MCL_CURRENT),

I think you should use FLAG_TARGET() rather than FLAG_GENERIC().
perhaps we should also rename them from TARGET_MLOCKALL_MCL_XXX to
TARGET_MCL_XXX?

> +    FLAG_GENERIC(MCL_FUTURE),
> +#ifdef MCL_ONFAULT
> +    FLAG_GENERIC(MCL_ONFAULT),
> +#endif

perhaps it is worth to update syscall.c target_to_host_mlockall_arg()
with this new flag?

> +    FLAG_END,
> +};
> +
>  /*
>   * print_xxx utility functions.  These are used to print syscall
>   * parameters in certain format.  All of these have parameter
> @@ -1939,6 +1948,18 @@ print_truncate(const struct syscallname *name,
>  #define print_truncate64     print_truncate
>  #endif
>  
> +#ifdef TARGET_NR_mlockall
> +static void
> +print_mlockall(const struct syscallname *name,
> +    abi_long arg0, abi_long arg1, abi_long arg2,
> +    abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    print_syscall_prologue(name);
> +    print_flags(mlockall_flags, arg0, 1);
> +    print_syscall_epilogue(name);
> +}
> +#endif
> +
>  #if defined(TARGET_NR_socket)
>  static void
>  print_socket(const struct syscallname *name,
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 3b77b22daf..822b6be49c 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -567,13 +567,13 @@
>  { TARGET_NR_mknodat, "mknodat" , NULL, print_mknodat, NULL },
>  #endif
>  #ifdef TARGET_NR_mlock
> -{ TARGET_NR_mlock, "mlock" , NULL, NULL, NULL },
> +{ TARGET_NR_mlock, "mlock" , "%s(%p," TARGET_FMT_lu ")", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_mlock2
>  { TARGET_NR_mlock2, "mlock2" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_mlockall
> -{ TARGET_NR_mlockall, "mlockall" , NULL, NULL, NULL },
> +{ TARGET_NR_mlockall, "mlockall" , NULL, print_mlockall, NULL },
>  #endif
>  #ifdef TARGET_NR_mmap
>  { TARGET_NR_mmap, "mmap" , NULL, print_mmap, print_syscall_ret_addr },
> @@ -636,10 +636,10 @@
>  { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_munlock
> -{ TARGET_NR_munlock, "munlock" , NULL, NULL, NULL },
> +{ TARGET_NR_munlock, "munlock" , "%s(%p," TARGET_FMT_lu ")", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_munlockall
> -{ TARGET_NR_munlockall, "munlockall" , NULL, NULL, NULL },
> +{ TARGET_NR_munlockall, "munlockall" , "%s()", NULL, NULL },
>  #endif
>  #ifdef TARGET_NR_munmap
>  { TARGET_NR_munmap, "munmap" , NULL, print_munmap, NULL },
> 

Thanks,
Laurent

