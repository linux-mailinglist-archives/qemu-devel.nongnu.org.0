Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326333C16BE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:03:29 +0200 (CEST)
Received: from localhost ([::1]:49976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WUq-0002bv-9H
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1VpO-0007Nl-OY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:20:38 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1VpM-0000aE-P9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:20:38 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MsqIi-1lD8813nfk-00t91I; Thu, 08 Jul 2021 17:20:18 +0200
Subject: Re: [PATCH v2 2/8] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <15a9db9d-6b4e-85fc-51bd-96981ae79bbb@vivier.eu>
Date: Thu, 8 Jul 2021 17:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Hkdos79KWKClvZmSsSozIMwHj2gphDeK7mD/1Petm0cZ7DO597J
 Po76vqsnC2zu97Ts0HdEbyrtUCVaRcTwN0UHAN14ptCHkKT/i2d87ddkfk4G89TL7icM+qy
 k32txIuZ1IhejmK6SrmXnTlT1O+BuWiBHPcZAudpYepCMViWAzUJho9TMYz1M4dXjDNNLAK
 IG+bO9vgaTVLslTC/sKgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E+tsPl29gwg=:fkHJxUb8PcCsyRBmLTlNlx
 BDwK+AlqaZK3sSXnpTvVesOuIiPmk09tPDUbgUucbT2TUIOvC+qZWBMvUN+W690BkBYoOV54h
 lMJu1F0fdvFJ0VQ6Gnw40+0wuJdL7WAEyKo9n8RblAMUald/XZbqjNK26LyMaPWaET2XYwFJH
 6x/jRMeoNTpVGAqyNkJDciG4pUmXeKRMZMj6AvRlzrnmQc02bO3WCNn9wGQhe1o7wpIXrvesu
 en1jDktHeqi8pb1ogCG6qtVBVXNkZZ0rbaqRHLxfU4IrGWZlxIR4vBl2LSlmniVn3dbFNpnYu
 /mrRMmJzZW2F/IgfIshyS1JroG4rW43V0jfAp4rBHxIJ5qeoldFWMI1r5/5DePo7uksk+++e9
 Y1XsarJiFZEimhfxA4D07b0rzhiRGkTilA+p0y9tlJ2jkgCVMmeJHoEngEamb+XX3RFzZoFYG
 xaBgoitHfoAk+Q70MTU3cM7HbwSe5qaeVMgpWibXmBtCxz8hgnmwHFDBotIm3B2/LpB0P/PMn
 Ki1xd1BS4iWkakUVEOmXVgM1ERmEgJ5jYw0n8UmmiKl7/zKNjEkM+No0gYKbbOA/M/fuLlSka
 TP5iE6ZiLUuL7xX4c7zN1nV3QaFniPJqChsr4DGgfmVLAwzxMhly1WaGnl8XZTG/qQ2YtEqKn
 QQDkWy79B2UMp55mL+2cBtfAX0A96fjRhZPIrjfyz8ZgfKSIpBSOCsTqjI+D6wEVYz/z8+ylv
 3XZwNWf8c43lSPpCSQEQ2jNujwNYAPSBjZPputDxeu0yJQ8RCE0C+29Wpdal5Zh2oWp7fPf7P
 ml67xRCn+LCwpWBL4CCVkLn+/KzW9oTrBB8lRYbov5a+KpYiDLLg7iny0e9mZM+hcQUBzSR
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> We want to have one generic target_errno.h (API to access target
> errno), and will add target errno definitions in target_errno_defs.h.
> The sparc target already have its errnos in an header, simply rename
> it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/sparc/{target_errno.h => target_errno_defs.h} | 4 ++--
>  linux-user/sparc/target_syscall.h                        | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (99%)
> 
> diff --git a/linux-user/sparc/target_errno.h b/linux-user/sparc/target_errno_defs.h
> similarity index 99%
> rename from linux-user/sparc/target_errno.h
> rename to linux-user/sparc/target_errno_defs.h
> index 9b846899cd4..e0008109867 100644
> --- a/linux-user/sparc/target_errno.h
> +++ b/linux-user/sparc/target_errno_defs.h
> @@ -1,5 +1,5 @@
> -#ifndef SPARC_TARGET_ERRNO_H
> -#define SPARC_TARGET_ERRNO_H
> +#ifndef SPARC_TARGET_ERRNO_DEFS_H
> +#define SPARC_TARGET_ERRNO_DEFS_H
>  
>  /* Target errno definitions taken from asm-sparc/errno.h */
>  #undef TARGET_EWOULDBLOCK
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

