Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107EA2DCFA0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:42:08 +0100 (CET)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqjX-0004Dj-5E
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpqic-0003nf-Uf
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:41:12 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpqiZ-0003uc-9L
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:41:10 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2mWA-1k6vaL0n8u-0138zs; Thu, 17 Dec 2020 11:40:45 +0100
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a081586a-c136-3766-6c28-9c054b24e84b@vivier.eu>
Date: Thu, 17 Dec 2020 11:40:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119161710.1985083-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+PGQyj/skV2B3FYUgsQjBXhfaqOSA3l477s7TFtuzVM1Zf9mFUL
 KSS0SRczDVg4TIdmm+eOdsqQJjCtkCBtl4Z3mWFoo98nZfV3W9im4e26GPRc4sDlIWF30Lk
 +BMvUzeQja+YTS8FXca2Lh1QrhjlMXfL8D2+M+mI+awUE4t9RgwXJBmasLplTx3uMHhVZ4y
 1ITlVhR8vrVI7IYcxJSYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6SxruHNSPW8=:0zlO1ALSbjdrbAet1VnPyD
 A2UPwbGaOs9A0aA/uz+MrKu2YnICbqNoY0/JA4Fl2VUk3LHmd6F6iXOZr/Lcb+x3GxgqlS5zK
 HfaPtXsN17LAjlygDVgd7pYkue7V9R7Xuj0xjF3XP5V5HhLGXutBRu4SlMxmz4gWW+bj0k6Ye
 UuKAdZ2qVjMz0+2pRakyrD0GV8neKb1vc+qz8GXc3zLbWF9lutYzXt4rRhFo8Bz33/j2gJhYe
 UEDJi6A5BIZ1KRFBLIA8d0zGJzhJmkZy2FAuqBFurFzRAzPZHGAekVYzDlU/sA/3BsYjRRpFB
 m515glONesBfPIVoZjX0pjVF1iW4MdZqTfzfFhx76Pfvmg/RftlzffSLgIIA/Xm1RVeuKbYVI
 Ht1bJ8CJ+7tVRe7g91ZXYqZ/X/YqmcMPw73Vi4zewL2b5mWFkiOWaKQSlhI/v
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

The value of the offset is hardcoded in linux-user/mips/meson.build, so either you remove
TARGET_SYSCALL_OFFSET here or you update meson.build to use it.

> +#include "syscall_o32_nr.h"
> +#elif defined(TARGET_ABI_MIPSN32)
>  #define TARGET_SYSCALL_OFFSET 6000
>  #include "syscall_n32_nr.h"
>  #else
> 

Thanks,
Laurent

