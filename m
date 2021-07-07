Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0F3BF044
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:30:42 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DFp-0007di-IA
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DEd-0006qQ-Ai
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:29:27 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DEb-0006wM-Lb
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:29:27 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHG0U-1lwrel2dJA-00DFCY; Wed, 07 Jul 2021 21:29:07 +0200
Subject: Re: [PATCH 04/12] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-5-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d6511ff6-f99b-cd24-71b0-28aaa17beeea@vivier.eu>
Date: Wed, 7 Jul 2021 21:29:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a78M+JzHLdomPERBcNVMuROY2q6Pk1cbm6n3mP/HgbOB8Yec6u5
 ZG1+kPZBaG9vimJLm1LPlY+Pry7Nz4mMu2C9l+YQHcDXpwgCE/NDltxiZjlFt8/b7xcNPmz
 YnKjAk83XtMIbXoNO1Mo0BehDqj0iqnGKHpvmyB22DY7GMdrKVmsLYJ+/oVwgmE1X2VxshB
 oLsYZSAcyOTpDkYwuosVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qzSNdk1QfrE=:JHHGLzej3eYxTXSCQtEgM5
 vuD6L/jNHnCsxexxkofVX+nwYu38ADaHLipvrowPm5Nh5nqiuGRvJgkqW5UvS+y7R0HIZa681
 YKS/tWg5yCkqNA9VrghjvnKK5tMg159opBu6d+ggxibAjpYRIxx0GJP6hfCGLR4afq2n3ywoT
 LOCl3BDvcq5PZS4myrIfytaLwB1+pjceiBtJExCV8IMieERVJ3vxzcFeKrxPIntd+u9JlO2hA
 l9NTviCFCnIeDgeHAhbj55MHjRsyBj1x6ErG2i/ujRqMx36uLvGtqbwkhXYoKeV24LYUVHtna
 DYAhjbGtrEhULG24zmAs0BNUteoKkSfBastAOqQlgLmH0jGcuFKB7ex9mFvlfmUgGZ2d+NdMk
 ZN/z1la8ydxN8oww+wxf8wL2aSLLS8BbRB5gyPn0MNzqkngPEdU3oVMIE3TQynbpoUvIsJ65v
 agt5Sty1OERek1ZH3WBVhxxRmuN6wjONGXMI5Lw355zfPNSy63OB9rwGOHPat6aDPS0DTpvrS
 XLgLQe8Ued9Rc0oy6eKHNABw+AbdWRxFgU+9+PZtL2QysxTrYhrI8/0veFmwPmkbMBEKRrdOq
 ZR2lqM337UNwQnluE/O8Cfkwffdjs1TFjb349QDZG/EWXGDeGeyJ+Snce5HLfa8PaSXSOuXxI
 OupGwTY2uoqnu0cZlMX31OoLrZyg/SR16b0JBsIvw8wT2MIxq2mkp4OumMdO/uc+Rza0M3dxt
 exG6KmEkaVmtMdCjUKqVgLla5PMubGXY6jHycybXQ/pW9P0V+FDkoFMau8gSRkNm4iElKkmLw
 Xb5WHIpjSfh2RSaiXt0oLwkVExYNFew8/IKahaFh6qxnGfr3p6IvqxRMFI4K515ICK07vjA
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/07/2021 à 20:37, Philippe Mathieu-Daudé a écrit :
> We want to have one generic target_errno.h (API to access target
> errno), and will add target errno definitions in target_errno_defs.h.
> The sparc target already have its errnos in an header, simply rename
> it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/sparc/{target_errno.h => target_errno_defs.h} | 0

Please update the header guard in the file you move.

Thanks,
Laurent

>  linux-user/sparc/target_syscall.h                        | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (100%)
> 
> diff --git a/linux-user/sparc/target_errno.h b/linux-user/sparc/target_errno_defs.h
> similarity index 100%
> rename from linux-user/sparc/target_errno.h
> rename to linux-user/sparc/target_errno_defs.h
> diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
> index 15d531f3897..dad501d008c 100644
> --- a/linux-user/sparc/target_syscall.h
> +++ b/linux-user/sparc/target_syscall.h
> @@ -1,7 +1,7 @@
>  #ifndef SPARC_TARGET_SYSCALL_H
>  #define SPARC_TARGET_SYSCALL_H
>  
> -#include "target_errno.h"
> +#include "target_errno_defs.h"
>  
>  #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
>  struct target_pt_regs {
> 


