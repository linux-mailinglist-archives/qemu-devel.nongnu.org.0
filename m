Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646B31F9588
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 13:45:57 +0200 (CEST)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jknYq-0002dk-GB
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 07:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jknXi-0001mr-En
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 07:44:46 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:47267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jknXg-0002ND-I3
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 07:44:46 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MiJhQ-1jESru43F8-00fW6Q; Mon, 15 Jun 2020 13:44:41 +0200
Subject: Re: [PATCH v3 1/6] linux-user: Extend strace support to enable
 argument printing after syscall execution
To: Filip Bozuta <filip.bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200611155109.3648-1-filip.bozuta@syrmia.com>
 <20200611155109.3648-2-filip.bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <214b3da5-db76-a1ca-8ea2-5d10cc3370d8@vivier.eu>
Date: Mon, 15 Jun 2020 13:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611155109.3648-2-filip.bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bxNv7d7oNZotFQZ/NSA+iioHM/TmGgxhiLK+gkGV+HS2G+0Apc1
 8n3+OLvStfm4j59VnMdqWCVMheZ2Md8yHv+hmAtPtdeY1Wga7YqNnt7bAetWYlrNeDxcrGa
 0kUDYrIa4g6bLP70pYIB/9lA6s6bdrmX4QanLTFV8JmKLb9c6xTQMUvtT/RAG6hjZSUGKlV
 VTgahjR48e2dz4BtZr5og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B/nRJb/Fgpg=:Kz7+zTeShvfGTndkswoHUF
 xUqX+Ts4eTGl4+0o0Lm0gWj5AvZEWuoVScwrGm4zhcsATsNUHPBHUJuAphWDa+twXmdFr5uD8
 TC9QwGsrQHGWAf2e0OPbyiNLkAYJ4sbkOjGUO9HYRTisyhbXL0EJcdWIlQY7M9NrBSFUjD+G6
 JLkMQw3cHNmz1sz6iKxXuWvVCGJMCK6OxpHL47Bo3i4DCRMiY1x6weSF8L/VcxrMkzrIfip+n
 xcxvlDfY5RCxDlg+yqyiOS8+MDtZ0fhS2Ero7j6LqhTMiQW5lWXTonJlYOoqQMWXo4nCr5Dvc
 I/2HtUinGYXPYJveuzyP3zBYxjj5pNrFK5q5otjCv0nrY3o3DSv4E3gFaMot+sqTohk1Wl8nf
 eM52amVFKtWSQKHPe9BNcPR74VzSxw0TJOEPE6sV7lK8IfuGDw8Y0FsW8DD7pvXQ630ZNmtQP
 GawXFOWodp/j+DVBq0YNhW8e/EH+byosi0ZFATUHi9LLY+xb2CT/wrNfUuw+SuTCbFr96ZCSD
 GzhA0lAHkXw83pfvUPjvoXvxdjWwf5MTP64qxGcu5WWtOVQhQuvFo+Rf+o3UHWMHkqgFWnMTY
 qHUsLhqWGbtuZ64+3hOSzGfpl+Nl7Hgg/WyU9hIN8+8EOO8mUCSDNu8J8gMqvfGm2r1zgpcKm
 hEXgrB3waG2BlnNMA3Z45QfmZOk6uMc++OzZOUrIJpssRp4VUFz+iIIJiThWdmGauPqxVsiXJ
 fhXek5tRRUgRiwR+Eb+lOqPetpEhSTRXP/7htKSThZNhDCMewtYk1MRtNRmtyQjhydT82ducs
 YXNa0YWSAf2Icv6GNFf3bSToN8rWdOISPQMsQUzmgr6g1WvaTcwjwBzj/GU0vrk/aynjr9h
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 07:44:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/06/2020 à 17:51, Filip Bozuta a écrit :
> From: Filip Bozuta <Filip.Bozuta@syrmia.com>
> 
>     Structure "struct syscallname" in file "strace.c" is used for "-strace"
>     to print arguments and return values of syscalls. The last field of
>     this structure "result" represents the calling function that prints the
>     return values. This field was extended in this patch so that this functions
>     takes all syscalls arguments beside the return value. In this way, it enables
>     "-strace" to print arguments of syscalls that have changed after the syscall
>     execution. This extension will be useful as there are many syscalls that
>     return values inside their arguments (i.e. listxattr() that returns the list
>     of extended attributes inside the "list" argument).
> 
> Implementation notes:
> 
>     Since there are already three existing "print_syscall_ret*" functions inside
>     "strace.c" ("print_syscall_ret_addr()", "print_syscall_ret_adjtimex()",
>     "print_syscall_ret_newselect()"), they were changed to have all syscall arguments
>     beside the return value. This was done so that these functions don't cause build
>     errors (even though syscall arguments are not used in these functions).
>     There is code repetition in these functions for checking the return value
>     and printing the approppriate error message (this code is also located in
>     print_syscall_ret() at the end of "strace.c"). That is the reason why a generic
>     function SYSCALL_RET_ERR() was added for this code and put inside these
>     functions.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/qemu.h    |  4 ++-
>  linux-user/strace.c  | 71 ++++++++++++++++++++++++++------------------
>  linux-user/syscall.c |  2 +-
>  3 files changed, 46 insertions(+), 31 deletions(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index ce902f5132..8f938b8105 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -383,7 +383,9 @@ int host_to_target_waitstatus(int status);
>  void print_syscall(int num,
>                     abi_long arg1, abi_long arg2, abi_long arg3,
>                     abi_long arg4, abi_long arg5, abi_long arg6);
> -void print_syscall_ret(int num, abi_long arg1);
> +void print_syscall_ret(int num, abi_long ret,
> +                       abi_long arg1, abi_long arg2, abi_long arg3,
> +                       abi_long arg4, abi_long arg5, abi_long arg6);
>  /**
>   * print_taken_signal:
>   * @target_signum: target signal being taken
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 0d9095c674..8678a2aeac 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -19,7 +19,9 @@ struct syscallname {
>      void (*call)(const struct syscallname *,
>                   abi_long, abi_long, abi_long,
>                   abi_long, abi_long, abi_long);
> -    void (*result)(const struct syscallname *, abi_long);
> +    void (*result)(const struct syscallname *, abi_long,
> +                   abi_long, abi_long, abi_long,
> +                   abi_long, abi_long, abi_long);
>  };
>  
>  #ifdef __GNUC__
> @@ -735,18 +737,29 @@ print_ipc(const struct syscallname *name,
>   * Variants for the return value output function
>   */
>  
> +#define SYSCALL_RET_ERR(ret, errstr)            \
> +{                                               \
> +    qemu_log(" = ");                            \
> +    if (ret < 0) {                              \
> +        qemu_log("-1 errno=%d", errno);         \
> +        errstr = target_strerror(-ret);         \
> +        if (errstr) {                           \
> +            qemu_log(" (%s)", errstr);          \
> +        }                                       \
> +    }                                           \
> +}

You should move the declaration of errstr into this block, and then I
think it would be better to have function rather than a macro.

Thanks,
Laurent

