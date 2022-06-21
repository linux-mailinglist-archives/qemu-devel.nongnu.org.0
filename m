Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3C553996
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:36:31 +0200 (CEST)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ijm-0001sO-UV
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3igw-0008A2-HN
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:33:34 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3igt-0003pG-PP
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:33:34 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MofPt-1nJyjI1w3V-00p2Fd; Tue, 21 Jun 2022 20:33:29 +0200
Message-ID: <3a7fc7a8-38c4-ebf5-a2dc-3dfb9637f6aa@vivier.eu>
Date: Tue, 21 Jun 2022 20:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] linux-user: Adjust child_tidptr on set_tid_address()
 syscall
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <YpH+2sw1PCRqx/te@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YpH+2sw1PCRqx/te@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UFapuZLl1EPg92tvxCHn94b53Nf9gq1ussLf/r/fiiSBkP204Xc
 pPClLBEvuHqs7UBuccVTZlO8THn/8utZb3YXJGFi72yixLk8VYilVHlpQYJGzjTrTRGF2YN
 GredCAHo2BRlhGO9QWLlggcyUMeRNiuX1ZIgevUV3fNO78GWg+nZMj9NCyNAdwOBMF+422I
 HeexK7LYEAaR1q7lLo5cA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mYX6NrRYLLo=:lcf3u9gA+oBLfn795BLZJR
 nG1JzEnYt8wLWGKra55je22yllRxT2fAIsEcsL3FIVVljQBNEKZvyriWl63clv236t8ghZvZS
 jo+TSs3mrKNKLgStHP+WG68/2fUpHLIAuQvdsHlo7P46u+PshNX0ndavFx+M9PKOSZ+KAiZfc
 zWmJI/U/fYyPu6slSoN9NP73m9xet6BnAcbbl37FABZ3GrY1KfL8ziwc858p/yL1FNMXr66g0
 JMDFU7yBW/SfcCQrateoS0Nj8sxJ0Gzwf8aLL9WNKrXpaojciJ3zW03fS9ndBPq9SED8xut7j
 3VuCzsYTpFKrKqZ+8WQgqs0Oh1cSECGXmQRyNshCP6brGPJgUpdwhRaWXAUFMlsRbXXfNJL+K
 NZVzpwFcD8O36PSKGSrxZcpv81aX8g/7nIdmqrnVHeYr5UvJ2XQghafKEH8DBJJnAlmIww3W4
 oA+KYSHhCLDod/nRcL83hlm6Kkly6JpeYWR2Qx5R9y7YnD9uED/bO6LYegkFj7VOk2ZnJJUqD
 cKlWSaXOS9kz4jJWJeYYWhoBzDEQng6O6LIrOkP+YeOXX2dQLzGfMdahiKvv1gg3+rbhhMGjw
 lfQNJcsrnsYfxVeCw5uuCw0/y6k2G8r1mQeUyRQGybsjWoE1tjq6kXuxJUStqk01t76s9fZwj
 3Tjygyrt54Aui/hNArj/yHKeimvON4AOnxBFZraSvTxcMAfdUYpqs0d2dbizcUy0pyEEAxFol
 Sux4tRRJ45HaRMA7xNaYyouhDb6oIt27D/cXAg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Le 28/05/2022 à 12:52, Helge Deller a écrit :
> Keep track of the new child tidptr given by a set_tid_address() syscall.
> 
> Do not call the host set_tid_address() syscall because we are emulating
> the behaviour of writing to child_tidptr in the exit() path.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> --
> v3:
> - Respin of the patch because the v2 version was mungled in-between the
>    mail of the v1 version. Now it's possible to get correct patch with b4
> - Rephrased commit message
> - Added Richard's Reviewed-by
> v2:
> - was mungled in v1 mail thread
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..1166e9f014 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -320,9 +320,6 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
>   #ifdef __NR_exit_group
>   _syscall1(int,exit_group,int,error_code)
>   #endif
> -#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
> -_syscall1(int,set_tid_address,int *,tidptr)
> -#endif
>   #if defined(__NR_futex)
>   _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
>             const struct timespec *,timeout,int *,uaddr2,int,val3)
> @@ -12200,9 +12197,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       }
>   #endif
> 
> -#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
> +#if defined(TARGET_NR_set_tid_address)
>       case TARGET_NR_set_tid_address:
> -        return get_errno(set_tid_address((int *)g2h(cpu, arg1)));
> +    {
> +        TaskState *ts = cpu->opaque;
> +        ts->child_tidptr = arg1;
> +        /* do not call host set_tid_address() syscall, instead return tid() */
> +        return get_errno(sys_gettid());
> +    }
>   #endif
> 
>       case TARGET_NR_tkill:
> 

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


