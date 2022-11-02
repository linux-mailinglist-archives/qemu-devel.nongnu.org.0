Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4AA61689F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:24:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGV1-0003ce-Lx; Wed, 02 Nov 2022 12:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGUj-0003Ma-5Z
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:21:37 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGUh-0000w8-5E
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:21:36 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3lkT-1opzVi1JmV-000wIg; Wed, 02 Nov 2022 17:21:29 +0100
Message-ID: <3fb91389-29cb-7d0e-47d4-04f07df2ed7e@vivier.eu>
Date: Wed, 2 Nov 2022 17:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: Add strace output for timer_settime64()
 syscall
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <Y1b5eIXFoMRDcDL9@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y1b5eIXFoMRDcDL9@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tJ3KZHTNyPVhHF8PEaZDbpMuzgyp8EF0NEihLgBh7+moRy2dXl1
 kZ8n9HsVU7NbpYQ2oO7aQ/fhnlByXhKKNCcMg3aYhjA53blUtC1Y4AIBda4gwtDeCGePBKE
 y9GwaWfFAFFj+UdklikBZSV1kr75Re4GxM/0eLg9scbqvzAUCA9+ELxPJIG+wtdmb1ypnKv
 D8UxY3qiMTPFOEfrx5N8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2vpX/LmUoH0=:LyQy+vXSxt4/dlqe4NAqbh
 R5guiUzLHh4Q+xkaCkx4XR8i7tWPSWYFHxl3UTynfPpxlnFA0I2RAFKEV9RoOxQ81lxmcQWhR
 otNYKL4aF8unrWlLmKC+OmpxQVc9Pa/iuUYvhQv+PuiIjPPT0mVqHOi/PVWB50sR4DfVF5dQh
 wAVtBcyaVmKzK82qPaV09oYPlBzAncn77arliWWe3keCnhrsfQ6fQH1D2luCPv4Cy/MJ7Q9iq
 dLetXMfEIPAVi1oh/hp1/FTosloshD0ATSPXYRzEjmOnkLqKZf+mJRR/bPEb2wXPG2qd5quEh
 vH7DUQBpo9smDYPfOK7rLmA/QShqI/3ZXL/ENID3BdAQ0rXnwfjwmgw8N7hDfSCX5j6D6IVml
 88diqyISvm9Y6LAHrvWTC62NvoYDvc/z4tBVfKY+FJqc58+x0ZofqG/l2jYvbfi9OxjRugICa
 Hs5XHSXalQi+LKvYm7bSoOO07M0GgAgprCQA8s4+8s5okMMnn8vLbbsADzRw8IkTdXcF0ZuZE
 QpfP5F3JzPitmKPQKl7SSCYpZAnsknZf9w6Br1Fb8GBpI/N0zow6loXzj2kc4Hv8GuWUfFXJz
 bf0aVvEfrJJvEZqgacMwKxtFSbE2sDX6D7h0sQoeVmjGPyCM4hh2LP92+uNoYSJL2ukqsPNla
 PU0AKw77BXRm5fkex3Ua5FXOXNdd5OLvCjwzFbnC7Eqxs+o+2nhEjO27aVOSR8ijztP17vzmb
 A2IrekWtP5P508DbW4NTJvUxyKiwsKgWBSgj4YwrSzv09LmfmLDNfMGhXD7aQI05cntJ6VHpu
 oIjPpxd
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 24/10/2022 à 22:45, Helge Deller a écrit :
> Add missing timer_settime64() strace output and specify format for
> timer_settime().
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index cd995e5d56..3a898e2532 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1534,7 +1534,10 @@
>   { TARGET_NR_timer_gettime, "timer_gettime" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_timer_settime
> -{ TARGET_NR_timer_settime, "timer_settime" , NULL, NULL, NULL },
> +{ TARGET_NR_timer_settime, "timer_settime" , "%s(%d,%d,%p,%p)", NULL, NULL },
> +#endif
> +#ifdef TARGET_NR_timer_settime64
> +{ TARGET_NR_timer_settime64, "timer_settime64" , "%s(%d,%d,%p,%p)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_timerfd
>   { TARGET_NR_timerfd, "timerfd" , NULL, NULL, NULL },
> 

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


