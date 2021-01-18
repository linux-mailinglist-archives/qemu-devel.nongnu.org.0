Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D3B2FA7F9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:54:37 +0100 (CET)
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Yjc-0008G4-Py
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1YOz-0008Dn-5u; Mon, 18 Jan 2021 12:33:17 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:58325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1YOu-00062G-0c; Mon, 18 Jan 2021 12:33:16 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAwPf-1lCK2y1jUv-00BJaI; Mon, 18 Jan 2021 18:33:05 +0100
Subject: Re: [PATCH v2] linux-user: Remove obsolete F_SHLCK and F_EXLCK
 translation
To: Michael Forney <mforney@mforney.org>, qemu-devel@nongnu.org
References: <20201028032727.31326-1-mforney@mforney.org>
 <20210114223602.9004-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <663b0b8b-4fd3-cdf6-aaa8-0b66f633bcdc@vivier.eu>
Date: Mon, 18 Jan 2021 18:33:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114223602.9004-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eYuEeSUtJMBf6oRKjRvoMtgtwgd1UVWttPP+VOsi9Zm/H249sb8
 iBOFVipJh1Dk7pi2t44xIyaz052rNO034Henrbl0+KuiYxQ0Mrm8BsyB/QY5g3q/3RpnVAK
 PQZc7haT4KKfGjudwWYWr/VCYS5XsnS44EbHN0jAM5A2S72kb78Flk/o3Hh/+LmonGj15p/
 JewUmj0ARU3gHgUO0HQ5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bk+64ZYDeT4=:pwzciXtlgdnqfuces9UH3T
 d8EgFfZ9XTMrNKF5/0CvgKZId1F8VEpZzRVhE8329qcTlQI/lSYS324A6doE7Om6hdZjZ47Vd
 aj6FWh4ToyF4NaT8eJ8t72iIea9duMTPbgaKCggjBc0qsHLdJ/785U2Xei+ZlrlBZUXVXBF8y
 5zvKx4UOKho73QF8bIVArMzNE5vacFhb/kcSHFzW/f0AE+d2gvC3zcDwVla4gaxeQaQwT8sbW
 ALjdzbuM2L7/K58D1VnK1JjTivpR2XgYqObcnhsYDVWLSXywNhnDxUL/Atp1LT6MZlTT3ILNZ
 FvUbSf/kvNEev8hmxBIX7ZL31AmjJjvjWl3Fp2m1898zikljCfQIblUkoy/BYhZv6EGvSodah
 3JmRbhxUjc1aSWRMWP/2TvbjaSmVxAorQ4L4xhVtCD9qYraJX8SxAmJ8sP0lCG0rJIMpUNTKw
 6qNgjx2mqw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.194,
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

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


