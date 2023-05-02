Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE26F41EB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:41:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnRr-0004PT-TD; Tue, 02 May 2023 06:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptnRp-0004PL-Mk
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:41:29 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ptnRn-0002gz-Vz
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:41:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2Plu-1pxe070dEE-003uK7; Tue, 02 May 2023 12:41:21 +0200
Message-ID: <13962a68-6bf3-03ed-0784-c37a1f526723@vivier.eu>
Date: Tue, 2 May 2023 12:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user: Fix mips fp64 executables loading
Content-Language: fr
To: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Aua2My8NFMqjmZLAuYqdc30+6wnMAuYMxW9L9Bn3M5TsA0bssYf
 FrqPiGtNUAkd5mEbM4lRG3lj3sQalVCxcSmaplXZmlUm+7Jre4fo4rb0CmeEaq14XILf0w6
 t86T9PzwJaWOCpq0NWzjp29pM02/IRZ8xce2Q9oca7HVpByJrEdQXASu9L1UPRfR8BKUVoK
 BT4aw75h1MMKmX4KPjrUQ==
UI-OutboundReport: notjunk:1;M01:P0:R+DJVGqCGfI=;lZaRsPJC/FV3PrtgXkAZ2YT4h1c
 kNIFCBQAoB7e0atOp/eu77O5UNJ1MnZFdp/YkEUHkHDLCwJFB4o8Z372Ha0zUFlmNDUMfgxnl
 Y8lvvINWBQTwbplSCmVwFiuUe0mrxPGLenJyt8DaoE5a2kdOEQ2LCZwUMgphXQbqXgiKfZ7Ik
 rTTj9OeQ9z0efhIgJ7U+R3VDfgm77dpYB84dziB39mXNSLtYeHxwxMVyKiH6WIeAagc3C+F+j
 7YUN2Uuwp4D6iAQVLOUooW6n7LW92DvbaIi4hMJaOCWzkzxkCjBsAL5srI4RmFBeVu+0LJrMA
 MwIMhZMOBvzMLSb+BuWirF5nuQd1VeqBCgB6pk6/f3bh6MUT0BKNU9jPHvrojVC9zRGJQOfiu
 PztPBylQI0v+yxIXJfG6zXcwQM5btVAjt9EklgYmk6B73xUUAMujTf/oADULZuaKSCaM8QGZF
 RF240+JHFw2KWWLN4iOXTpdbaSM0Flm1SJV8dmCoF9KTioeeK2xFHs5B6D+PH50upUQJp66A6
 VTaB+/lV9Ivt+jHEeShXR7TcMkV9oek/bK8FwqGtH4hrzyJ2LkgeoUavX26Qjx9qBbOxLH0Fy
 kpNIJZ19/My+qUotCY2QW8XDlVnRaR/Ws8N1bVUxSy/xOQHpmpgTaufUEGcjX8AjjKyYB/wgk
 ++RtPvDEbc8uMMMkMklXUSZwth2bgPqWKTecEF0Z1g==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 04/04/2023 à 07:21, Daniil Kovalev a écrit :
> If a program requires fr1, we should set the FR bit of CP0 control status
> register and add F64 hardware flag. The corresponding `else if` branch
> statement is copied from the linux kernel sources (see `arch_check_elf` function
> in linux/arch/mips/kernel/elf.c).
> 
> Signed-off-by: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
> ---
>   linux-user/mips/cpu_loop.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index d5c1c7941d..8735e58bad 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -290,7 +290,10 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>               env->CP0_Status |= (1 << CP0St_FR);
>               env->hflags |= MIPS_HFLAG_F64;
>           }
> -    } else  if (!prog_req.fre && !prog_req.frdefault &&
> +    } else if (prog_req.fr1) {
> +        env->CP0_Status |= (1 << CP0St_FR);
> +        env->hflags |= MIPS_HFLAG_F64;
> +    } else if (!prog_req.fre && !prog_req.frdefault &&
>             !prog_req.fr1 && !prog_req.single && !prog_req.soft) {
>           fprintf(stderr, "qemu: Can't find a matching FPU mode\n");
>           exit(1);

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent


