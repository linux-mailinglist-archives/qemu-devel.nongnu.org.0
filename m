Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C85EC00F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:46:34 +0200 (CEST)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od86j-0004yC-7K
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od81R-0004gq-36
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:41:05 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:44229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od81O-0007xd-3t
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:41:04 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJmbB-1ox8oC27c9-00K7uk; Tue, 27 Sep 2022 12:40:57 +0200
Message-ID: <b20778a7-8f5e-f1b0-b34b-e92d878e53ef@vivier.eu>
Date: Tue, 27 Sep 2022 12:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/2] linux-user: Add close_range() syscall
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220927093538.8954-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220927093538.8954-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TYJbRYIbYTM1md+rmERh43tJNfs4hZ1gWXWHAJhILg1aDPfrLaL
 OlBvZrsxVUgrjAsTAUCst7i4q4kknE0lHKhTWL3DLg7zUIi/zPwtD8EsxveyDl5PErVersM
 BkIAcogTGw+g+kNE8vYZRXwWlIcRMTwWjCjYcEbGySkXlb+3PQib2437kczBJ4wupW2p8XQ
 bCAdxzAJUoA5fx2uFAOiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mTbLxIb2P9I=:RxKvSGfM6XcivO99HEIkd/
 FfpvwqcaIYTDGz9GCCv/WHDyugpsV0RzOasTdwlmKAn7H4k6HYDy8m3VD6hOAdmKZwLMRemJb
 +nhoppdVJZMt6i9iE4miuVIjSCMGz14+xkN6WzeCRuFdE8eZ6sz17iSv/OXn8VitSXgxl0MKw
 4Oh8hMu+zZS8Wi9oG/MsMcba3zqktpJlYzwufA3hYjqOl7Uvkupb6Dr/2OlYwY31KlJlXRAaO
 UxTKp9Cchmizt2WSycfq4xjg8/Jlpwus4XjnqTlXnSTvdzeualt/d+uP9mp1FTFf9wAqDan67
 dBBM0GnxieEk9cJb+JMBI8gZNvljqIMPeYp6xTxjaPPoMgyJrcPR/8oB3lj8JBZy7pr7ERSI9
 hMNw3RDdnkghsIU+OuLyQ85md7dWPllZ26EVI+ZBGA9lp3BFoGACYbBEpCM3ajI9ItfqjxAIP
 fQnU6duvtYp7k3mzSSAosgkOwHDuAacwHm2N2L7fBucIH5imrNdM5/SXI67AcYW9xao7EEcZR
 D+U6NbVpLlS/EcZIOFyb3K5eOYPrn4DLA/izP6MR46M44CCcd0PZ81H8VBAQnmaF2+lwsdiWm
 D9nqkI+/cT+R3wiJIN8BVbvgFchwYCqxWsIER+PZCQZsOh2fWmk1Ek519O9CvhmhptdugZxsj
 4V4UtZ9KFJuqg5Sp0CTQKzc5dI5mq0Q8QjYc1jJCKN5B2z18IgOXlqgoFzVkHqluIhsGrdADD
 zczO3niqz6GSIB4uEhZzui1deuk8j0H675YcemmoZF65QhaYJfQHcF6rPlTAUo3PMwViWdAV8
 oCjJm6X
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/09/2022 à 11:35, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list |  3 +++
>   linux-user/syscall.c   | 19 +++++++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 2fa74b7203..31a2ccd76d 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -103,6 +103,9 @@
>   #ifdef TARGET_NR_close
>   { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
>   #endif
> +#ifdef TARGET_NR_close_range
> +{ TARGET_NR_close_range, "close_range" , "%s(%u,%u,%u)", NULL, NULL },
> +#endif
>   #ifdef TARGET_NR_connect
>   { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 6219ef36c9..8e0bdd7a30 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -339,6 +339,13 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
>   #ifdef __NR_exit_group
>   _syscall1(int,exit_group,int,error_code)
>   #endif
> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +#define __NR_sys_close_range __NR_close_range
> +_syscall3(int,sys_close_range,int,first,int,last,int,flags)
> +#ifndef CLOSE_RANGE_CLOEXEC
> +#define CLOSE_RANGE_CLOEXEC     (1U << 2)
> +#endif
> +#endif
>   #if defined(__NR_futex)
>   _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
>             const struct timespec *,timeout,int *,uaddr2,int,val3)
> @@ -8756,6 +8763,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_close:
>           fd_trans_unregister(arg1);
>           return get_errno(close(arg1));
> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +    case TARGET_NR_close_range:
> +        if (!(arg3 & CLOSE_RANGE_CLOEXEC)) {
> +            abi_long fd;
> +            abi_long maxfd = (arg2 == (abi_long)-1) ? target_fd_max : arg2;
> +
> +            for (fd = arg1; fd <= maxfd; fd++) {
> +                fd_trans_unregister(fd);
> +            }
> +        }
> +        return get_errno(sys_close_range(arg1, arg2, arg3));

fd_trans_unregister() must called only if close_range() doesn't fail.

Thanks,
Laurent

> +#endif
> 
>       case TARGET_NR_brk:
>           return do_brk(arg1);
> --
> 2.37.3
> 
> 


