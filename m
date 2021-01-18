Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67F2FA4D3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:34:27 +0100 (CET)
Received: from localhost ([::1]:42668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WXy-0001qd-Nc
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1WWY-0000w7-OP; Mon, 18 Jan 2021 10:32:58 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:49021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1WWW-000179-Lm; Mon, 18 Jan 2021 10:32:58 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MvJsF-1lryib4A77-00rIAl; Mon, 18 Jan 2021 16:32:53 +0100
Subject: Re: [PATCH v2] linux-user: Remove obsolete F_SHLCK and F_EXLCK
 translation
To: Michael Forney <mforney@mforney.org>, qemu-devel@nongnu.org
References: <20201028032727.31326-1-mforney@mforney.org>
 <20210114223602.9004-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ab02f165-21ae-1d6f-ebf6-c9a32b4ec424@vivier.eu>
Date: Mon, 18 Jan 2021 16:32:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114223602.9004-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sIjgJcuFdFf7dCVf33abFgt1eDMb7ZKJ/WZffbTS6XwZTkULcTi
 8TzK9+2dcTTRfP5oqdIzN+knDYvj584g7tzyjqfaRSnspwJ2OnI/uriKPYrb5NqT5PEbS+m
 YFtBaseW+j+aTHmAyLZyvIHM3ZZx4RtGBFiP6JJoWD/HUjDY8SW0ORjoLZnFp2/al7BIMT6
 C0sE4RmUeWZ56ZahIzeQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pU0UyofcXnc=:7QIS+HpEPJSsCUiIGz/Vsu
 qkHrN1UBOZCdDtgzNXypgIt12Ygj4tkqXIGaF7v6ZkLoLuL5JyD3uWKTBpQDqedStdDH5iTF9
 Xc5apOyGBJ1Knq1MzDHX4RJfBBK+LerO8UZ+McYRYFjF9VFjjuNO5fWPQa2kmpsyOy/rguFmN
 uk9Oa+m/Q091t92Ivn87RDGzS8lPtBUM0sfhxOvmXX050WH/Bx0BVpUTyM+Xgm8/ss/oOA7nV
 hEPttMbZeP9hJ76GhKJWs5RepSZ4Y7LT+Z1/BI/6zEMWAPYS+RjebXmYS7sHvADyd7Nrrw37H
 fK3SruIKOoMxGh0CJOnHsmv/Wcaawvzg5vYRsJ6tdU00B3cLctZdMwwxhf+8ihRQaC+QLkg1h
 buNvzMfsjtxhIi9UYToaYINkNsD1gUGIXw4TApguKmX7xgBrJirYrNGay11MzJTR1Qh1cYD+C
 3FLCWsQZXA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2021 à 23:36, Michael Forney a écrit :
> These lock types are unsupported by Linux since v2.2[0][1] and
> always return EINVAL (except on SPARC up until v2.6, which just
> warned).
> 
> musl libc does not define these constants, so just remove them from
> the translation cases.
> 
> [0] https://github.com/mpe/linux-fullhistory/blob/v2.2.0/fs/locks.c#L322-L324
> [1] https://github.com/mpe/linux-fullhistory/blob/v2.2.0/fs/locks.c#L429-L445
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
> Changes since v1: fixed typo in commit message, resend to qemu-trivial.
> 
>  linux-user/alpha/target_fcntl.h | 2 --
>  linux-user/generic/fcntl.h      | 5 -----
>  linux-user/syscall.c            | 2 --
>  3 files changed, 9 deletions(-)
> 
> diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
> index 2617e73472..e16ed1d415 100644
> --- a/linux-user/alpha/target_fcntl.h
> +++ b/linux-user/alpha/target_fcntl.h
> @@ -33,8 +33,6 @@
>  #define TARGET_F_RDLCK         1
>  #define TARGET_F_WRLCK         2
>  #define TARGET_F_UNLCK         8
> -#define TARGET_F_EXLCK         16
> -#define TARGET_F_SHLCK         32
>  
>  #include "../generic/fcntl.h"
>  #endif
> diff --git a/linux-user/generic/fcntl.h b/linux-user/generic/fcntl.h
> index c85c5b9fed..4568d1f42b 100644
> --- a/linux-user/generic/fcntl.h
> +++ b/linux-user/generic/fcntl.h
> @@ -119,11 +119,6 @@ struct target_f_owner_ex {
>  #define TARGET_F_UNLCK         2
>  #endif
>  
> -#ifndef TARGET_F_EXLCK
> -#define TARGET_F_EXLCK         4
> -#define TARGET_F_SHLCK         8
> -#endif
> -
>  #ifndef TARGET_HAVE_ARCH_STRUCT_FLOCK
>  #ifndef TARGET_ARCH_FLOCK_PAD
>  #define TARGET_ARCH_FLOCK_PAD
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index d182890ff0..f238edf715 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6664,8 +6664,6 @@ static int target_to_host_fcntl_cmd(int cmd)
>      TRANSTBL_CONVERT(F_RDLCK); \
>      TRANSTBL_CONVERT(F_WRLCK); \
>      TRANSTBL_CONVERT(F_UNLCK); \
> -    TRANSTBL_CONVERT(F_EXLCK); \
> -    TRANSTBL_CONVERT(F_SHLCK); \
>      }
>  
>  static int target_to_host_flock(int type)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

