Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC3D67D039
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4Cu-0001Vr-H7; Thu, 26 Jan 2023 10:30:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL4Cn-0001VP-Vd
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:30:25 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL4Cm-0003tQ-3M
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:30:25 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MyK1E-1oT4Td2KNA-00yk7x; Thu, 26 Jan 2023 16:30:17 +0100
Message-ID: <b645585a-1093-fb97-60a1-5acc40b17271@vivier.eu>
Date: Thu, 26 Jan 2023 16:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y6ywbxuxqQ/cGPJW@p100>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3] linux-user: Fix /proc/cpuinfo output for sparc and hppa
In-Reply-To: <Y6ywbxuxqQ/cGPJW@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+ix66RfOx26NDtKeOJVsjhFmwZ9zYEpmcdDQBtG4/UAq7qQ8nUv
 s/W1GUT5facKV3b6rhMEKM2Js7pxfyc0oernUP+8ad6bMBq0X5RxaUQRrq0sZ8Y0t95EizX
 /ZXa8/VkipHKKOdmyofAbqeAb2IaLBRqSi3rmQQLCo33OMWHS3TcB/Z1J5GsPp8FXM1KDhN
 upY7UMD2BQTROYC/43EbQ==
UI-OutboundReport: notjunk:1;M01:P0:ItqdHoNsfvk=;3OHn2yszttDP32edM8oq2v+nSdL
 cfWwryAjSWcVOjA2dFkqUnA8HFPC8HROkXmH2l9OmiysSUiRmNfDXUZXfkpFd+wGJDUZHVydA
 6fmzmN3R95yeoxbxl5rGiK+TeOldkVFqfAEZKpI7H2ujDSR4DpC/gmuC1LzOnn/gzubSiW9nX
 kOi7/cg4wGQ+Oi5g1zkXYDcZOH2xBTbti0vgq1I1d5rv9V9WHXv1jPGXU+ACLwtcDMDM2Fnmm
 v+Nkh5tcEkWPqH1fXssYCBZoNfJflIJT2ULC9wrlsaJmMtMrOBAvUlX+gXPIYZkLLHYQVWItk
 466+GF7EuuTwGcWKASNYaYiYCSNnCfsh40EsJxiRNK5HsINcE0se+jyabdnwMz1y3oF0G6yYz
 3GgXAXabUXkHCxIbOcho7lU2fLbPr7txF3c6/iRNKoMxrrVipU0D1jAC6Zn7317waFGZ8VapS
 nktlekf+cZlaBN8PSoaGYNlkdu8hd6NnqdViYVI2fqmV4y4ULB0Wp5OCEekHhHXUV6+7/O0nw
 Bmf+WUi2m7SuyhVO8VhOHLXSYnB973Nv8925zlK16B9b3HLO/AeAohHbQaq/vBHlV9f9kUjgP
 W25aGbjLAxUOd2wEbq5cTt1MnEFjWFVcxKEYssgS2m1Njao6A8a+aiQ5iczOdiVV9k3wCMYkF
 H1heFvfPsPc51xshUcFkbleNEtEjNzYk/FRfjBCVRg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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

Le 28/12/2022 à 22:09, Helge Deller a écrit :
> The sparc and hppa architectures provide an own output for the emulated
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
> 
> ---
> v3:
> - add trailing newline at end of /proc/cpuinfo file (needed by procps)
> 
> v2:
> - drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.eu>)
> - change commit message
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index afb24fd0b9..5ec11a3683 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8310,7 +8310,13 @@ static int open_net_route(CPUArchState *cpu_env, int fd)
>   #if defined(TARGET_SPARC)
>   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   {
> -    dprintf(fd, "type\t\t: sun4u\n");
> +    int i, num_cpus;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "type\t\t: sun4u\n\n");
> +    }

I'm sorry, kernel on real hardware doesn't use the "processor:" entry on sparc.
See show_cpuinfo() in arch/sparc/kernel/cpu.c.

In this case, fix the userspace application, as it would not work on the real hardware too.

>       return 0;
>   }
>   #endif
> @@ -8318,11 +8324,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
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

It's good for hppa. Please, send a v4 with only hppa.

Thanks,
Laurent


