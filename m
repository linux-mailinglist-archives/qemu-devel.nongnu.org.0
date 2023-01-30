Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A006807E5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPuV-0004ee-HY; Mon, 30 Jan 2023 03:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPuS-0004do-L7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:53:04 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPuR-00009Q-2M
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:53:04 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6lYs-1pIags2Jiw-008I3r; Mon, 30 Jan 2023 09:53:00 +0100
Message-ID: <821a6b07-93e5-0c06-f4a1-6ee6de56dd3e@vivier.eu>
Date: Mon, 30 Jan 2023 09:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Improve strace output of personality() and
 sysinfo()
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
 <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
 <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
 <16e8f5c4-45c7-de0f-f53d-2fe4549fff7e@vivier.eu> <Y9QxskymWJjrKQmT@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9QxskymWJjrKQmT@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jieDjeLq6kLqAAT7x3xQGe3HBxqsH4xi7t4Ki9qQnzgV13uxzFN
 tmEudG8TPAxfIQX4H6Z56GR/yuCNNMykTy8gikXit635zug/bjI8XbVG5/TDuQZH/Rrikqq
 RWsq0a14yLn4H3mUSOgv33K3ogsZONSTgc7eJCpYZKC5zvbscTeavd6V/VTaLSzPP1JCUkw
 xuC6nHYNZKVlOa9Nb7SIA==
UI-OutboundReport: notjunk:1;M01:P0:96CGPYi6PDA=;h8NPa/RrSgjB/jM/3ATiRtdyt/x
 dERpcFrCvf72xRc2P1ZXe168bre15SvIrUWfC552Erjhr4Iig+Ss68kYdMi46xaNzLN+hLyK/
 9+t7fkoxsGYp7UbqQFeaeerUuFb0yXCmKzdKEkit33H1SFO9IlEha40Nz4JO56HHBDknJ0oGT
 5iqkfGIyNti/EDW88wRhd553bqVk89FT/Ogq8YjyFWR8cqPfprT8u8HpoI/qi+t8mLF4GGCtJ
 +nDjALCOoNDnsG3SlTjS1oa9bMD5LJ2ldYAbJavq3etuEM/SVA2jSRGmrC+p2CeP1LvsrvgIO
 f31havnl6vgkcYnzjxE83G4pbYeBiixNogPtG5lZFCrBnO8b8W7xGg0K2sGVnRphh/qJgg0Mi
 WDzzYKFV+DqMfOgTVxyGxPFPyARS9WjzIYSgovEculhiIgsuKkFkLpVY5z9O3JLIUtkKMR8D0
 LE4kovEM/nFFK0wuZIPTucSZXXUurVYK8HKPArGdm+ixtFQlQfeimPyoUGqvrqWCD+mlZ3kYv
 O7e9qNlpbc+zdl+PlIp+xmRdxdNK0qCvcny6J9NEdKQyNyoDpIWcKwppNKcm9uElLrKXmA5yu
 rUF34v1ANFUZD5WMym/9C8AJMcTVA5dl4W4Yv5Qj63ThpdGNmW1BBhpoeFfkLZIayCWqJ1W9k
 CGecd4XoK3tzE03WWntFbda2pkwEhbbGAdDvdxhFQg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

Le 27/01/2023 à 21:18, Helge Deller a écrit :
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> --
> v2: use TARGET_ABI_FMT_lx instead of %p in personality output
>      as suggested by Philippe Mathieu-Daudé and Laurent Vivier
> 
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index f9254725a1..703c0f1608 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1043,7 +1043,8 @@
>   { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_personality
> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
> +{ TARGET_NR_personality, "personality" , "%s(0x"TARGET_ABI_FMT_lx")", NULL,
> +  print_syscall_ret_addr },
>   #endif
>   #ifdef TARGET_NR_pipe
>   { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
> @@ -1502,7 +1503,7 @@
>   { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sysinfo
> -{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
> +{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_sys_kexec_load
>   { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL },
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


