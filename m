Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA3682C10
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpGV-0001ig-Eq; Tue, 31 Jan 2023 06:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpGS-0001Pw-CZ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:57:28 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpGQ-0003KN-QZ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:57:28 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M27Bp-1pKMQO0bpR-002ah5; Tue, 31 Jan 2023 12:57:25 +0100
Message-ID: <3ab3cf3f-a27e-2134-6373-da33cfc9c995@vivier.eu>
Date: Tue, 31 Jan 2023 12:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Show 4th argument of rt_sigprocmask() in
 strace
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org
References: <Y9hCxdvdM1o+/iHC@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9hCxdvdM1o+/iHC@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xghdp7CEgIq6hSRixQpnHxTEi2e42C1BcWJuf4bdUM+1pve998K
 0eU1hDkprqNDRukBa0BRwN0uRaVRddwobTERZ30Oe7SnX3u+YtAN37Vt4taZPTwJHA1u76I
 TPzbrfNHoV6/yGJu6F4/2AYHprXhT8wI7dVfxmwVe8q6SQ6M7VN6LT7z8tIVsSmg1foefvL
 LTBiadNiG3V1KSelhrndA==
UI-OutboundReport: notjunk:1;M01:P0:9A/Fs5Ajyho=;J9RGtz7wESjK8hyDmZa3B5FwlPE
 vsm/FXel7y/2hu/SWk8O55R5uifVhwtbkFui9zTYUNbkhkGvXaApdahWt122pvoCFQ6mBfIU6
 XxEWPCFAbwS8tPv7u5p0aWUcWeKS/d4ULR7ttEcL4z6gD11MPs9npXoy3G0T3wcnCw5Xe2d3U
 bV8dcwbFoTCB1x+luj0z2v3EB3wy+zMq4SbtxjpWnerCwZQbbEymmACaemT+PTBdZPvCSccF6
 ZKk7TEtX5T3pJremIekUl47hewNtRuRDtlXDNOO9akdd/ZrhR3Tcs5YxXHhe4yMRsXw7zfRcF
 fRdTk2MrhdSNM/Lg1AsVwIo10rAFndOXIk4R/9DJ7pGMoxOVEnFwoohEGX6SiIgJo6wq4z4xR
 cv+jjCFlJqzVRSdZ7mfOKKYKNTpUJCwOifxPVlD2bAh2crBq1pree6yHMqvDn9EQIPdlSJkq6
 mjhOGF2bfKKZVoDx01S0loc9H/CiOoi+D0lbb9zeRw1aSgcinhleVNGZvj+dmf87eqBxK8OzC
 5oysPxMbh7/MyBi1kzVlY4otkgYuBW5eIc2G4mkW0iJv7znK4Yi/uNg26XRjTby1z2vsjHhuK
 7qV5FncFpkZ+UT+WKOXTDjpVpZNEk+J57A9M++PBJR3cJNLLeQWjpwbbn3fzZhE/IvIgEfiip
 QVGxrMm/s9XbdWbRmNQnN08oY99rvn81jV9FcT+22w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

Le 30/01/2023 à 23:20, Helge Deller a écrit :
> Add output for the missing 4th parameter (size_t sigsetsize).
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> v2: Use %u instead of %d, as suggested by Laurent Vivier
> 
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 3157e4b420..f0f6ada8cb 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3146,7 +3146,8 @@ print_rt_sigprocmask(CPUArchState *cpu_env, const struct syscallname *name,
>       }
>       qemu_log("%s,", how);
>       print_pointer(arg1, 0);
> -    print_pointer(arg2, 1);
> +    print_pointer(arg2, 0);
> +    print_raw_param("%u", arg3, 1);
>       print_syscall_epilogue(name);
>   }
>   #endif
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


