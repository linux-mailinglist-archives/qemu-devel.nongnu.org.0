Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CB9553989
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:30:38 +0200 (CEST)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ie4-0004jI-JY
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iab-0002gE-LK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:27:02 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:38399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iaY-0002ev-IY
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:27:00 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFsAJ-1ntaEb1edr-00HPb8; Tue, 21 Jun 2022 20:26:54 +0200
Message-ID: <6fc571d1-f7e2-33db-7406-4a0f42a76875@vivier.eu>
Date: Tue, 21 Jun 2022 20:26:53 +0200
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
X-Provags-ID: V03:K1:DsdyCNxC0N5e5ci4bDrP/uOOQCrN0lRop3UP2Hr0j+5AQC4v0vB
 TphMbW+jQNJIUIYlyE3tmzYsRCPXiyMbCiuoLyE1mwbNS0maKabqabE5Fn2KjxlqgKcleHP
 cE4aCW32+TL7OTuN8D/u2deza9bUoWcH+WEsJgrxi0U+107Fwnllc+2WguTtlWB3bbBmTLo
 7t6aeFfMxBL6M41TFCSLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yABOAjk5IeY=:SBkKEQdkgx+bWpwrrB4uT8
 k0c2mwN6zfO8wM90TxgTZVjqbSGLkFKuD0Pe2QX46+jMVWtjUalN3O660q56cK/vRANWI3VEm
 ypML0xgyvFtUc4asCK5LQdiyJadguyt2qDU3kJj1yAHRoqEDhUuxiiK0mwxHaiittNxOtrqBI
 8RRZ+x7Ugd93xyjoJTNbWdSp06RPBA95pUO7dtC9l+rLV9aKi45R8Sbln01n90XEybTnVCcGK
 mh9/39t7FhM0nmEuOM30aHWCmZ84Hqf0mEPMrei7YVwJBum3viNweNHjUD4PS8ZSF1h/s35Bo
 g10OT6pc3T1kWv6iXnx683/pThZtzEG5dslB0qMqsSHHLnzCaSNXWo1iD2FI33SGgDAaVUz7/
 tRyKn2QyBdNRnht2JUQf3GYunzFhxDSqGFWa4rtKWakTXOsFqE+wxDl4q7I2wtvqYSpZ3YVXO
 OCoxgRvBXLBrWH0Ntt7PvCgApeBZPLcCCc1lrPNwQ4vLxvIJ+ZH2Shmg6Q1OYGZOVeRofetHY
 tL7g/DyNz90kNW7TT/m6RvG5IJA//Iq4CbrOqDoO76wCufHpHpVI9u/ICB1Ds8cdLX/tVrwnM
 zNLRez7g4B1RVwaHw0qWTtv8CEuFMgmigJMA83eXDNSIZ8xg5CNvOwsmu5ZgnAIYprVvnFS0Z
 NhLRS673lpOT3OZeAAFVrFODX/cfxuf5Sjzf10EjrwznHsVQuo0fI08iq4xvFUD0PSBU12ClQ
 kmvQw+6uGqC9DF6ZVLuxdviKWwrDHMTmF/BLyQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



