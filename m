Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23B31953E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:38:05 +0100 (CET)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJf2-0001S0-FP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAJbG-0008Cr-W8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:34:11 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:35085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAJbF-0001z1-9u
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:34:10 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxVfj-1m7OUK1r4L-00xssl; Thu, 11 Feb 2021 22:33:45 +0100
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9d78be45-dbd9-af14-6d6e-4360d3d21c20@vivier.eu>
Date: Thu, 11 Feb 2021 22:33:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TNlgzMzbMTDodVi6rZJfamdD4b8XHz6IMz2BJL0CYW/hA8FdRbK
 RNVUvjW1k7PNGzRrtHry7xdCL0TPk/tP40eYirPrue3hu87dLPBToMD52tMMyCjYBU59eKa
 wmRvg1VIw4toy2NeSlYXF4gEb1rkaeiyMJMytvYKTPugnWv6SvoHVNUXTYjCgghmvzAE92p
 OidRe+4aalN4GvXI2ekHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sjKFXaDUXco=:cbQYSUEbceM52d61SdYq9A
 ZKGYcVEsgookvP/LB1O99ZQQzV2XABkE1ljZhfLNdNeIrMp/2QeEGcnEgEm0xng71dEMJD1qM
 izKdM1euqX8Zo8aWfIxJgEXV4HpSkTkP4D/Vl5IO2JbZ+dvStRO6ehimaLaxtQ5+f2gJBbYfQ
 lRpZWz4YWCLQFFEMKRPYjyF3NFfYoNJY5uQB0DyllGWfXR1703gvhAN9iozOxqijIhB0mnX6h
 TwW08rFyiVtqworXK/4mcd+uMzRB+vgdKn8Qi7j5+IZkzscgeORbvhe4aqETDbejCwFQ8KJOB
 530rbuqsc4y3KrWYPqcw4d0FlV6Svq44z1yJu3Q5TPX6N7luDqD9wLNJBQF8w652a0PWAueJg
 KoRp+XY0tpS85kgkAWCTBmJcO/novhjlRBtOJ+iJP+fZ/Anedj9XOvaCVTW6+dXvDwwnppUlp
 gTyyR2t/qA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/11/2020 à 17:17, Philippe Mathieu-Daudé a écrit :
> o32 ABI syscalls start at offset 4000.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/mips64/syscall_nr.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
> index 672f2fa51cb..6579421fa63 100644
> --- a/linux-user/mips64/syscall_nr.h
> +++ b/linux-user/mips64/syscall_nr.h
> @@ -1,4 +1,7 @@
> -#ifdef TARGET_ABI_MIPSN32
> +#if defined(TARGET_ABI_MIPSO32)
> +#define TARGET_SYSCALL_OFFSET 4000
> +#include "syscall_o32_nr.h"
> +#elif defined(TARGET_ABI_MIPSN32)
>  #define TARGET_SYSCALL_OFFSET 6000
>  #include "syscall_n32_nr.h"
>  #else
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


