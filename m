Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604E6682BE0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpBL-0005Am-P9; Tue, 31 Jan 2023 06:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpBK-0005Ac-Ft
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:52:10 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMpBJ-00029R-0B
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 06:52:10 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJFpj-1p3Ngj3IPD-00KhaB; Tue, 31 Jan 2023 12:52:06 +0100
Message-ID: <55200444-cdee-d0bd-e4f9-92e1015323a1@vivier.eu>
Date: Tue, 31 Jan 2023 12:52:05 +0100
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
X-Provags-ID: V03:K1:w/jPQtNiiA9vjqionjij3lX/ev9r+K4g9BTYTbURzMCAr+NOIDE
 bnle2/S1ae8owZ5pMYwP28OGZIrrQdS22955YZxkNvCugSv+Qrruc8R7wDCFoSpZ4OZ+SnU
 xX+o2Y1pTvMQTpQQ3TWqlvawlGgiST3vG0OZSwJMmeb6G73xBk6/wmVFo3ObC49D9qnNC3p
 XNArXc63btBoM95REyrLA==
UI-OutboundReport: notjunk:1;M01:P0:KiAM8DOOJZY=;iW4Nm4xIQ+fnOLWvEem3Q9lOEAQ
 TZ7FLlUWMZcxcoSK6dKevIU3xUM11rViYkbR7bIvyiR7xewkUwRSwUs50u7cU3wwTeK3IAfkG
 1hKS6JuwTK3Vj5sDnDXrHPyL5xDPyde/WvF29lIOuZnCLcQHa78JD461k4+bZgUKcvOBONmxb
 Dat8wr3u78pT0ZttM1PCb791ugvVgbsHJVlwWLwbtojDbEmbEVESPw0BHooLC1NVPX4bUNSSZ
 8G5webWimAuHTkAm7hCdPh3jsvUtzm4LbW9ZBvoGQYitlkfZRHUfORzjAvVDlJJjByfcRi2Iv
 8p4Y4AG9uONggcjYrfgcQL+XF7KXP56iBRTWnL06a0VgWVezmiGrFGGC0Dq9FcW2mRaAJ4QrS
 91MUIsTRFxilw7UV7S63Gb7PiJwPWN6D29oxbP0l2ETo3c01cLyWUJV1+SYKbT0cBAzNxBoE0
 NHorBDjCiJ8EUjfWA5kIDleWXgNYGnafdGr2jUwQNdoHFSYc6MibhZLWcPqF1V2sS42+u1dxo
 JahftsynepIo1u5WyV6PQwaAdcRrXVd0Ciw04tIg3QrL86tPVcTL55jtwSLT/zwJaJdpKjoGw
 F/Jr+yo7VVrxBWlValc3SdhHV8D6ybUEGlKbA1oQHfWWrTn+lHnD8jGnHi/bjw8Yz3Z9LMiDa
 Awu3aow3ny65XBLDgLGNg7/bDc0SjP//V0ciPKKGgQ==
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


