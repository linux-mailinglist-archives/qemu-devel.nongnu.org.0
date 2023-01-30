Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0E6807C9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPpz-0003NE-81; Mon, 30 Jan 2023 03:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPpx-0003Mx-AL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:48:25 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPpu-0007zB-IZ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:48:24 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MY5XR-1pAAPu2NsT-00YNLV; Mon, 30 Jan 2023 09:48:19 +0100
Message-ID: <ca9c5570-43ca-9017-fe3a-abc6539c7d3a@vivier.eu>
Date: Mon, 30 Jan 2023 09:48:18 +0100
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
X-Provags-ID: V03:K1:G9f93sYXopp2z329mazLW+NSQk/JH06PTqMLTaKx10d+FiiZxlq
 +kOn81v9B7j6Xnl/1NREnQH2GwOf2lMCuQBX9lemypzdtKrLUQyoJN09nL0jzgUmnQY18ey
 DJpEUMjxVd4E0lK6fjwhJVHiK5mZV9t2/CqP0X4GDDIuFWMuXWOOj0qRLAOsGqcbW5v27Uj
 unzNSwPDzEYj1QiHYTMYw==
UI-OutboundReport: notjunk:1;M01:P0:TEIO7Zl+QBA=;IsDGYjhjO2FUWXKNqHGIYVi8phz
 RiMwW23POEts3Jx40pOHTlCZovoyvrEvDe1h8QYUFQzNIfaaj0kpE/ctlIk+YmDYQN5FyPXTY
 b3ND7/5WoC8lXLN6jq4eGPjyy7H79u/XwMfrdqgI38jWjD5o/L5LvX0F87efvIhUHpMY7V4e5
 NGiWK8t8CnNpNSdexv40SOL2N6lVqMz4n0JJ8GS4BBfMJ8OR+nto93jCF9KVcpwz31mfBQAgL
 DA2M+mcRbuBwvs6RP4jrVPPRrb5ukoj3QiO4Nd9Osy3KTnhgAZegOoFdSGZLK4ROTH7laIeLI
 lTUX2PffRqF/4bm1uYPOrH4HRDdSQqXt1uInVF6TvbM+1PZWVE1kSOWt5+q8+C/7+edd77CVw
 GGE1ndE0fQ6z1udUWODrTvMxTJMFn6JkquA8ABRMOTEPhjvCU7U8ejL3DsonNO2KPIPRXmVa+
 GbrGgXPGKALY6T2bIJGYl2kos66iflIs8KwIArJPA0jeNd5PcNcvJ+qxlt3Im/xhOzOETdKfE
 iEY3SVxWURhKdRTVNdHezINxpVXg6pF41kkVhH0IywAwy73FYvyAGPGYb4P+fwXNnHbflE56Z
 oGHlRuirE6BS5yPTWCMYyUXH4GQiSs/xVKWweW+17WwT0oUQwyQRRQpnUJqzTWI+exqwkhYb1
 UrnLoj9jOEZsKMF6nZ/fP7VX6BSU6hs1H1c84XZVsg==
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

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent



