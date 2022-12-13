Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75464BD5B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:33:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5B0W-00039x-50; Tue, 13 Dec 2022 14:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1p5B0C-00039O-Vw
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 14:31:46 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1p5B0B-0007YI-1A
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 14:31:44 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M7v18-1p1J730JeM-0052ig; Tue, 13 Dec 2022 20:31:39 +0100
Message-ID: <577ccfca-2767-c8a2-5b05-0b02c898e486@vivier.eu>
Date: Tue, 13 Dec 2022 20:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y5ij6ST3s5dLNHPM@p100>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Enhance /proc/cpuinfo output for sparc, hppa
 and m68k
In-Reply-To: <Y5ij6ST3s5dLNHPM@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UUodov8FHGYvd2NjpTn7z8aQm0O/TNoWT3M56+XODletmo/DovZ
 6MRpfZ1iPwo+8STKVcINRXOwSu3kA6oQg+O3cmHx0z9ugJJkeqzJxmF3POwqBZSWwDeVjmb
 j3Tn7bcxkXbgv8P9hubaL1nQwsxTE4KQOJdNZka9vjYrmRbobAhosxDnsL31u3NZAFu5TCy
 tPWxe0G+mNscpkSoqeNUg==
UI-OutboundReport: notjunk:1;M01:P0:fSBF6tmSWak=;VhSwptXuIFKoPFzfnzH09tp3Kcw
 UfUM5q6hsHJxsNCqCVQPP5odMog4Z0lIELVevq3REIbGJmZGfAnEGwH6eUiK93LGgYHVQMCXn
 xQFGsagTSJ7ABZRTp7afMayrMKsnkHiuSSBSMcQ3zRFuWISmoJalwH3LI4q2sdJvAkI1LIJZZ
 J9dAX7zaKUO45Y/5zOZJ1ONqU4PtC6MnXU57awbPMI9X+9e4gcDT45MEnySFdLaHI6/IFtZFb
 qnBkDEMZXlBggCldwuMyIq154sBGL+xyIbWK3kWhytIB83jLlEHHciUqP0KNI/kbvG03/dSUM
 wciegwsxYh7ySI8KIhdBUpMiSLOBmJV2s7udayLkjnRDx/p/2qQUrtsnWQr94Lpw7B+y/NKL/
 nnoFufXWOpWvgrp5hb/eUVQ4klDgxN0HTQoOGBS2HYsoA21Ai06odmElqZ0hWhva2JalCwqd8
 2TZIMLLcohUfAzoF7gi/Xz1kSS937/81ceR0qhDMLrR/k6oKQAX6qtGWkTV7+rb4vg9yUZOmN
 0NYjXZspL7e2b8D2wpDO5mrunRJmDRWxU7IpAtvUs2ociWTM9oekMgnBicN7itvLg+snk4AfN
 T53tRz24V0TtZxqQPd26kX5yEgUUxx6gZjF6E/FZIGmrCOYHmBGIXi6Ho/dTUra4H7FowfMss
 xoN5QuItzg2si1JZPEDQH/6MPRjAdU4Hft7uRtaBSA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 13/12/2022 à 17:10, Helge Deller a écrit :
> The sparc, hppa and m68k architectures provide an own output for the
> emulated /proc/cpuinfo file.
> 
> Some userspace applications count (even if that's not the recommended
> way) the number of lines which start with "processor:" and assume that
> this number then reflects the number of online CPUs. Since those 3
> architectures don't provide any such line, applications may assume "0"
> CPUs.  One such issue can be seen in debian bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653

Why don't they use something like system("getconf _NPROCESSORS_CONF") ?

> 
> Avoid such issues by adding a "processor:" line for each of the online
> CPUs.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9e2c0a18fc..d58e9b8d10 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
...
> @@ -8319,6 +8331,7 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   #if defined(TARGET_M68K)
>   static int open_hardware(CPUArchState *cpu_env, int fd)
>   {
> +    dprintf(fd, "processor\t: 0\n");
>       dprintf(fd, "Model:\t\tqemu-m68k\n");
>       return 0;
>   }

This is /proc/hardware, not /proc/cpuinfo.

root@debian10-vm1:~# cat /proc/hardware
Model:		Macintosh Quadra 800
System Memory:	1025024K
root@debian10-vm1:~# cat /proc/cpuinfo
CPU:		68040
MMU:		68040
FPU:		68040
Clocking:	1529.8MHz
BogoMips:	1019.90
Calibration:	5099520 loops

And on m68k, no one expects to have a "processor" line.

Thanks,
Laurent


