Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05454BE59
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 18:36:10 +0200 (CEST)
Received: from localhost ([::1]:40354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hddZB-0005oN-Ta
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 12:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58839)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hddLm-0002Yh-5R
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 12:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hddLb-0006g5-W7
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 12:22:12 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36115)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hddLb-0006eO-Lh
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 12:22:07 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MuUvU-1iTx533CF8-00rZ3I; Wed, 19 Jun 2019 18:21:51 +0200
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1560953834-29584-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1560953834-29584-6-git-send-email-aleksandar.markovic@rt-rk.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a45cb51c-68f0-f52e-17d0-a8926852c74c@vivier.eu>
Date: Wed, 19 Jun 2019 18:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560953834-29584-6-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rrqefQaezAYdRz65HnfIgM0FYovXtdDXvYJCKZ26qv8ErzzezQW
 +SKflSCHfqmzWxxqIkHaddqij0ENVoLmFNwttnm1vHasvqXxCdA2LNOKfN1OVIV9OxW7ljE
 sDPVS+W1PaucULhvdt7LK/UjyGHYbREHzTEgsRPv1CIQ1lqrONSt1AFgftG+u4Arn37zZZI
 Wi/erLpjXqQ1GvCrNHvfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dLioGXbc7o4=:QEljZEeReN6k9xHPEs3R9s
 qV7FBGSuCGQqWzif93mtEAv1/trCtKHCFvQYscUZ8oxeOJgdzi6YMQkPqzg0qJvZcfrZmF8de
 pt0ZiWmDzZeozvj2eeOVH45Mtj6mSCj91Kk8BBy6INrTT25aUnJ3NyQGxYLlOC0m/MXmqAJA7
 sYdueeMEcMaffORuuW7GqMBMazFc3C4v8WVVAceXtLyGTvF8K5v5mCV2hnavqBkGd9QrxC4tE
 I6aymmAvQEVzOvw3X4M3XXk1j2Zu5Th4xx0GwQqev7xZabeK5X87bqMqa+0mIFmX7zxpIL4vF
 +2F/US0u2bLP0RZagn1H+ccPFVOtyeM/kIk5hHC9MMHIeO9P/PmYtZeKDb1K/QcgbUgzjRmWo
 euikn/E+cv+MygZ32s9ApQKu6PcMlEZ67RiiWeFkL3nPrth1ANFiwnQpYMtc0KbFGVJUTY/a8
 I5q3tTT7/xgerg1sWJAs9yMFdiK5a+z2auD1yziE2PAVOnlkJ6fwG7/bbsN79dv6SnrUTODIN
 Rvoa3IbnPI7J2C21xCuQZaxkORa47ivdYk+i9BU/RDjTmWBktlsJij229QE1Orl9b3Ts0j/a8
 +pZzZtXBlKFcmoEyTPrILMD/UgdK3ETHarzoWyog3vsFZkJLi5QVPdHw7enQiHHJ0uMuhuTex
 tp5S+gANjHhkPLLTIfJQQg35daF39IYs4zGXF1zBA/mGdSkPKp41z+Ny3hYQrJRbUT3oiU0gy
 jX71/p+TJ+Ru7IRvSpkPddwpWHlmJjYX4o5d2OJTWiuRzBpD8h23B3xoklk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-devel] [PATCH v12 5/5] linux-user: Fix flock structure
 for MIPS O64 ABI
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/06/2019 à 16:17, Aleksandar Markovic a écrit :
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> Only MIPS O32 and N32 have special (different than other
> architectures) definition of structure flock in kernel.
> 
> Bring flock definition for MIPS O64 ABI to the correct state.
> 
> Reported-by: Dragan Mladjenovic <dmladjenovic@wavecomp.com>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  linux-user/generic/fcntl.h     | 2 +-
>  linux-user/mips/target_fcntl.h | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/generic/fcntl.h b/linux-user/generic/fcntl.h
> index a775a49..1b48dde 100644
> --- a/linux-user/generic/fcntl.h
> +++ b/linux-user/generic/fcntl.h
> @@ -129,7 +129,7 @@ struct target_flock {
>      short l_whence;
>      abi_long l_start;
>      abi_long l_len;
> -#if defined(TARGET_MIPS)
> +#if defined(TARGET_MIPS) && (TARGET_ABI_BITS == 32)
>      abi_long l_sysid;
>  #endif
>      int l_pid;
> diff --git a/linux-user/mips/target_fcntl.h b/linux-user/mips/target_fcntl.h
> index 000527c..795bba7 100644
> --- a/linux-user/mips/target_fcntl.h
> +++ b/linux-user/mips/target_fcntl.h
> @@ -27,7 +27,11 @@
>  #define TARGET_F_SETOWN        24       /*  for sockets. */
>  #define TARGET_F_GETOWN        23       /*  for sockets. */
>  
> +#if (TARGET_ABI_BITS == 32)
>  #define TARGET_ARCH_FLOCK_PAD abi_long pad[4];
> +#else
> +#define TARGET_ARCH_FLOCK_PAD
> +#endif
>  #define TARGET_ARCH_FLOCK64_PAD
>  
>  #define TARGET_F_GETLK64       33      /*  using 'struct flock64' */
> 

The patch is correct, but I think it would be cleaner to introduce an
"TARGET_HAVE_ARCH_STRUCT_FLOCK" as we have in the kernel for the mips case.

Thanks,
Laurent

