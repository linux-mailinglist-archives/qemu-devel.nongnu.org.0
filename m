Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C57682C27
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 13:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpLV-0006X7-7X; Tue, 31 Jan 2023 07:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpKo-0006T1-Qk
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:02:12 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpKm-0004kL-D4
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:01:58 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MDhQt-1pX2Kk2ZqJ-00Akv8; Tue, 31 Jan 2023 13:01:53 +0100
Message-ID: <4aed91aa-7d6e-0d6f-e7ff-7d8bd4a4351b@vivier.eu>
Date: Tue, 31 Jan 2023 13:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Enhance strace output for various syscalls
Content-Language: fr
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
References: <Y5dsfGB1RChGfraW@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y5dsfGB1RChGfraW@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bHwFfDW4ZDe2DcRC6AykXdhNKQWb9QKdrIpL0UM3Av6SineCmWE
 yNp+Gx2uRSJRmy7am72BuXmrGNilh24JjtgUKb5n41xC5k5pvfHmnTsq5osTVUtS9gCIAIU
 8gboQ13pBRt19N3vjRKJOFVPsm33oveESChtnQl5r55D2EQDr2kkTfi2hrGXoL3Q2Aip8rN
 nBF0UV9l3BCJlysAVSBsA==
UI-OutboundReport: notjunk:1;M01:P0:ofWYqUDHCLw=;guRt7kR4eO4sj28rpSESSApkKef
 EVX8y3J7qGAfw2a7Q/9/40V3PFc7pCzeoEwg7b4yu5ETGmeCEoVeLzYDaKwWZeyUMCqqsI3cG
 csD6J3uoDaVmxGAIIcThDlhQgcYjykmk05eh+M9pXXDERj4C9y1LoCR3NbPmg9KIzF8llN1Y9
 1n3gjkK/PfMTpErVlzeVOPKVAUIKoYYviOQW9kvvefjHaWbS9O6OrhQjc2Toi6aWH8zEA+yKI
 k//BTMvgefcYbTi3Kxx5/5NkTVCXaAKD8EXkwfCof3LoDxJTU15uQOYZa3lhTooz5U6OnIZcG
 WFAEkh9PsDxyRb+yj2kzBFa0lPbASHcrJREuaMBphXsCGLPdJFIbBInAySMD1h42HdFP+8ql0
 7thlRkFCp1slNTD3W0emDEBR93ut0WhQEtYcc/MY9Q8AAtPOXa5inWWxwf0K0SMFoOauEN85C
 sezjfP9pnctpiphuJzs0/OBrbf3ilGIRWPWDTTWA5K8uxLoqc2liy6Z1jS2axLD8vb8WzK3oF
 OISaBgHIEep3nuyA4AdOxPYtDz2wUP6vafnHoKxisGPgBRTgmdN81os0//NcBT+Ifi65oEZk8
 gxwv8jJH3aVpoqFnwJK9oa5xfNdHR9vXrZ/8cGQ0EvWWJ4XmQyxmOSCJCBBWZNmkTUyVJRStc
 f2+SU7Jgok+N1R+izmKbPFDa9tkfj01eeCTnpg6Jbw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 12/12/2022 à 19:01, Helge Deller a écrit :
> Add appropriate strace printf formats for various Linux syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> ---
> v2: Fixed a few entries based on review by Philippe Mathieu-Daudé
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 3a898e2532..a75101fca1 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -337,7 +337,7 @@
>   { TARGET_NR_getpagesize, "getpagesize" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getpeername
> -{ TARGET_NR_getpeername, "getpeername" , NULL, NULL, NULL },
> +{ TARGET_NR_getpeername, "getpeername" , "%s(%d,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getpgid
>   { TARGET_NR_getpgid, "getpgid" , "%s(%u)", NULL, NULL },
> @@ -361,19 +361,19 @@
>   { TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getresgid
> -{ TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
> +{ TARGET_NR_getresgid, "getresgid" , "%s(%p,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getresgid32
>   { TARGET_NR_getresgid32, "getresgid32" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getresuid
> -{ TARGET_NR_getresuid, "getresuid" , NULL, NULL, NULL },
> +{ TARGET_NR_getresuid, "getresuid" , "%s(%p,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getresuid32
>   { TARGET_NR_getresuid32, "getresuid32" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getrlimit
> -{ TARGET_NR_getrlimit, "getrlimit" , NULL, NULL, NULL },
> +{ TARGET_NR_getrlimit, "getrlimit" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_get_robust_list
>   { TARGET_NR_get_robust_list, "get_robust_list" , NULL, NULL, NULL },
> @@ -385,10 +385,10 @@
>   { TARGET_NR_getsid, "getsid" , "%s(%d)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getsockname
> -{ TARGET_NR_getsockname, "getsockname" , NULL, NULL, NULL },
> +{ TARGET_NR_getsockname, "getsockname" , "%s(%d,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getsockopt
> -{ TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
> +{ TARGET_NR_getsockopt, "getsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_get_thread_area
>   #if defined(TARGET_I386) && defined(TARGET_ABI32)
> @@ -1052,10 +1052,10 @@
>   { TARGET_NR_pivot_root, "pivot_root" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_poll
> -{ TARGET_NR_poll, "poll" , NULL, NULL, NULL },
> +{ TARGET_NR_poll, "poll" , "%s(%p,%u,%d)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_ppoll
> -{ TARGET_NR_ppoll, "ppoll" , NULL, NULL, NULL },
> +{ TARGET_NR_ppoll, "ppoll" , "%s(%p,%u,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_prctl
>   { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
> @@ -1124,7 +1124,7 @@
>   { TARGET_NR_reboot, "reboot" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_recv
> -{ TARGET_NR_recv, "recv" , NULL, NULL, NULL },
> +{ TARGET_NR_recv, "recv" , "%s(%d,%p,%u,%d)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_recvfrom
>   { TARGET_NR_recvfrom, "recvfrom" , NULL, NULL, NULL },
> @@ -1184,7 +1184,7 @@
>   { TARGET_NR_rt_sigqueueinfo, "rt_sigqueueinfo" , NULL, print_rt_sigqueueinfo, NULL },
>   #endif
>   #ifdef TARGET_NR_rt_sigreturn
> -{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , NULL, NULL, NULL },
> +{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , "%s(%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_rt_sigsuspend
>   { TARGET_NR_rt_sigsuspend, "rt_sigsuspend" , NULL, NULL, NULL },
> @@ -1196,16 +1196,19 @@
>   { TARGET_NR_rt_tgsigqueueinfo, "rt_tgsigqueueinfo" , NULL, print_rt_tgsigqueueinfo, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_getaffinity
> -{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , NULL, NULL, NULL },
> +{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , "%s(%d,%u,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_get_affinity
>   { TARGET_NR_sched_get_affinity, "sched_get_affinity" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_getattr
> -{ TARGET_NR_sched_getattr, "sched_getattr" , NULL, NULL, NULL },
> +{ TARGET_NR_sched_getattr, "sched_getattr" , "%s(%d,%p,%u,%u)", NULL, NULL },
> +#endif
> +#ifdef TARGET_NR_sched_setattr
> +{ TARGET_NR_sched_setattr, "sched_setattr" , "%s(%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_getparam
> -{ TARGET_NR_sched_getparam, "sched_getparam" , NULL, NULL, NULL },
> +{ TARGET_NR_sched_getparam, "sched_getparam" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_get_priority_max
>   { TARGET_NR_sched_get_priority_max, "sched_get_priority_max" , NULL, NULL, NULL },
> @@ -1220,7 +1223,7 @@
>   { TARGET_NR_sched_rr_get_interval, "sched_rr_get_interval" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_setaffinity
> -{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , NULL, NULL, NULL },
> +{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , "%s(%d,%u,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sched_setatt
>   { TARGET_NR_sched_setatt, "sched_setatt" , NULL, NULL, NULL },
> @@ -1353,23 +1356,23 @@
>   { TARGET_NR_setreuid32, "setreuid32" , "%s(%u,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_setrlimit
> -{ TARGET_NR_setrlimit, "setrlimit" , NULL, NULL, NULL },
> +{ TARGET_NR_setrlimit, "setrlimit" , "%s(%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_set_robust_list
> -{ TARGET_NR_set_robust_list, "set_robust_list" , NULL, NULL, NULL },
> +{ TARGET_NR_set_robust_list, "set_robust_list" , "%s(%p,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_setsid
>   { TARGET_NR_setsid, "setsid" , "%s()", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_setsockopt
> -{ TARGET_NR_setsockopt, "setsockopt" , NULL, NULL, NULL },
> +{ TARGET_NR_setsockopt, "setsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_set_thread_area
>   { TARGET_NR_set_thread_area, "set_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
>     NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_set_tid_address
> -{ TARGET_NR_set_tid_address, "set_tid_address" , NULL, NULL, NULL },
> +{ TARGET_NR_set_tid_address, "set_tid_address" , "%s(%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_settimeofday
>   { TARGET_NR_settimeofday, "settimeofday" , NULL, print_settimeofday, NULL },
> @@ -1648,7 +1651,7 @@
>   { TARGET_NR_vserver, "vserver" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_wait4
> -{ TARGET_NR_wait4, "wait4" , NULL, NULL, NULL },
> +{ TARGET_NR_wait4, "wait4" , "%s(%d,%p,%d,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_waitid
>   { TARGET_NR_waitid, "waitid" , "%s(%#x,%d,%p,%#x)", NULL, NULL },
> @@ -1672,7 +1675,7 @@
>   { TARGET_NR_sync_file_range2, "sync_file_range2", NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_pipe2
> -{ TARGET_NR_pipe2, "pipe2", NULL, NULL, NULL },
> +{ TARGET_NR_pipe2, "pipe2", "%s(%p,%d)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_pidfd_open
>   { TARGET_NR_pidfd_open, "pidfd_open", "%s(%d,%u)", NULL, NULL },
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


