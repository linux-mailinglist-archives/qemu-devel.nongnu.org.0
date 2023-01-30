Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B66807AC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPkb-0000Pj-KU; Mon, 30 Jan 2023 03:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPkV-0000Jd-61
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:42:47 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPkT-00076D-Ef
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:42:46 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSswA-1pEHMr0imU-00ULV3; Mon, 30 Jan 2023 09:42:43 +0100
Message-ID: <968b1bda-bd12-e26d-93c5-326b8dea4b30@vivier.eu>
Date: Mon, 30 Jan 2023 09:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] linux-user: Fix /proc/cpuinfo output for hppa
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y6ywbxuxqQ/cGPJW@p100>
 <b645585a-1093-fb97-60a1-5acc40b17271@vivier.eu> <Y9QvyRSq1I1k5/JW@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9QvyRSq1I1k5/JW@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+qQGNfo8Naspfan8i5GGqdDgNqJ4sd5NIy4+DkdfRUDnq9fQQHY
 pI0tn9r9qh1RtdZKld3XwnKxTTeqTa+b1dk1W3M2530gq4IAWaa8v1DmHS3c/zXV2+f7xQ+
 eGWEoKl5KIIKzIUceKjbDYkYSwtotu+WP1Itl11n1mvBl22dmxPto92HqPZFd/1orSM2vqG
 HmE40cp9wWpfgzQJh4KYw==
UI-OutboundReport: notjunk:1;M01:P0:HCWupuFbDxs=;pr3FuYiCkGbqksoOwEtsy5/NGvU
 wtCC7xI18sfNPsSa27haF0jup5FVH+sGzhjQ777/4gkUq6CNWElqqp1QPhGyXWhtwaGcnRKci
 pZrnWXFhfAUGpCoZFziY2+JrRolJOKBhVkT7SUxPqZkxJaYijWPRdRfqLI1JvbOpb0+SBLHZ/
 JOFwxxRr4iNNeKx7Wfb26Ar53qL7V+QhpP1Uudowt1iWp23roijqAlvbaZ5gs85Em2zUol+Tr
 Gn3smVhoz7j+6rKKQ7m5x0xktPLvMtbHketJHEETT1aiXzR4vE8JuNDRXVDG+1QrhZgYWyZpK
 IEZnD0L5ZifSszjLLBdR/HUsGIUPxovgcW495H1YMKY+TjsxQ3S6R+LWKA3D0H6a1HKHvMOzt
 tpPAuVY7iL++saR3Cp0HR0mtr8klEWv9AXxkLNguZ+o5dPH4kC3ynpjmmF2FqWc4V9SmYGinG
 Qf6W40BziL1zu7AnbxBkgs0pFhQKnasybSSuOt6fdaO1D9ARLcvamq65IA5VZ1pPiL1UuFdeK
 BqiQVG8/WlUlzeghosn8ZxjNxL0DZJM5K234Qibf15rqfaBNGLMT83AAwzfkJJeBU/Pt4nMzW
 UU6Z3RC+u1F0PnMjbM5Yqn2jovk/1QFvfgWJ5XTHBo+QiEwLIeRR5keOVXFxFityPlZjP2Knx
 amJMytZYUOy+CiK5ZW+okLUcLlmhSRRAmzv9PNRxKQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Le 27/01/2023 à 21:10, Helge Deller a écrit :
> The hppa architectures provides an own output for the emulated
> /proc/cpuinfo file.
> 
> Some userspace applications count (even if that's not the recommended
> way) the number of lines which start with "processor:" and assume that
> this number then reflects the number of online CPUs. Since those 3
> architectures don't provide any such line, applications may assume "0"
> CPUs.  One such issue can be seen in debian bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653
> 
> Avoid such issues by adding a "processor:" line for each of the online
> CPUs.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v4:
> - Drop sparc changes
> 
> v3:
> - add trailing newline at end of /proc/cpuinfo file (needed by procps)
> 
> v2:
> - drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.eu>)
> - change commit message
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index afb24fd0b9..5fa2ae6c8a 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8318,11 +8318,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   #if defined(TARGET_HPPA)
>   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   {
> -    dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
> -    dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
> -    dprintf(fd, "capabilities\t: os32\n");
> -    dprintf(fd, "model\t\t: 9000/778/B160L\n");
> -    dprintf(fd, "model name\t: Merlin L2 160 QEMU (9000/778/B160L)\n");
> +    int i, num_cpus;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
> +        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
> +        dprintf(fd, "capabilities\t: os32\n");
> +        dprintf(fd, "model\t\t: 9000/778/B160L - "
> +                    "Merlin L2 160 QEMU (9000/778/B160L)\n\n");
> +    }
>       return 0;
>   }
>   #endif
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


