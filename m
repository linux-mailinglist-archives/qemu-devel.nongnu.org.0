Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB09578B7C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 22:08:23 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDX2U-0003uk-18
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 16:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oDWAG-00079V-Qx
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 15:12:21 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:50495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oDWAF-0002xH-8n
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 15:12:20 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkEdF-1nosjQ3ejx-00kgJz for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022
 21:12:17 +0200
Message-ID: <0514b078-aceb-58a4-1b22-e3a711d91621@vivier.eu>
Date: Mon, 18 Jul 2022 21:12:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Unconditionally use pipe2() syscall
Content-Language: fr
To: qemu-devel@nongnu.org
References: <YtWLeE8C4uutvgwP@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YtWLeE8C4uutvgwP@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sSNQe8CvAemcs2NKdMwNWXkfqYcU3a9BMCOYnRoEpTeWN5o/HSY
 xM/jNNEuNGonfhEcI4a5JTIOAxI0uwI0SBg/mLU9DFlrfX3NDhLXYxiZCXQjNOEUF/di5+i
 BRVnaKamRbIeMmz+ZTcg5AHNTqNiChGiqgXn9bDUkTJlVcBweD0JuyuZlOR0v1pO5m44xbG
 6wYqUbvjj84UdliuM4sBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4M51mGi7dNk=:U8LN4hXgZeT/4yTetNKpUM
 7iDjg4BMpJwsqEHovXx5PUb4gmF0k+xAhsRIud+bW+13WANzFMmwD/J+gK00GQ/1aX+URD1uN
 nm6p1ADlo9vTLGvhiF0Eo/+t3lmJaJ91VN7HxOoNIALRkWswvJPoTmLzhchPQUf/WKc+ySHET
 gh8NM95O5Ew2Ghp0MNYePKzRdk/mYyR1VQ75DwaAYr4//UBgKNxMOEfno45ymto8v2Y35NMeU
 pJs0Pt3TMusIjAxuEOi4d/y7cpnbqvI/a5BRLrLuHGC2DSxdHHkf1rvbY9Jklboy5yXz4ddSE
 71ZP3nur31SUuB+CbXdHmQwKijVtW/LZewT4W3ADwSPOiHHhaB/oP8eqlRcyPFvYrUEyLuRHK
 Of84EN+yGrPXTaeTdx1YU6J41fi9lbKbrP5d/LdcP97hwiC8xA5/JqKnn+BtmGka+0swTe3Ym
 gT4j97egFiV/XWf42LLgniUzauo+vzLzZBaT96F8nF1s17gtisvbx7+BIIwxlx4egw9kewdtZ
 5wrKEB7nsDYDkTOnmV5f+gAkjr3wk9g10ddAphEBp13gg37Js9a/k7/2Acrn9QCEswOw4JyO6
 fBtye0Q3+G3ejmBqmULj9pdQh/STduECIrfP+Jp3mEvFnSYWNAL5m9rRiJm2mT3CsYl1fKgw/
 lqwuk77UtzAdQEj9sFfbsZkZ5sAum/2WZUfelQO+ByyfMpdUeHA2NSSU9FFPfDuqPrq1SeeKl
 XQqNqJG++y4dOUr0x4uIlpNag2qTz2Lu9frZdw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/07/2022 à 18:34, Helge Deller a écrit :
> The pipe2() syscall is available on all Linux platforms since kernel
> 2.6.27, so use it unconditionally to emulate pipe() and pipe2().
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index dbebfa4a8b..b27a6552aa 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1586,21 +1586,12 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
>   }
>   #endif
> 
> -static abi_long do_pipe2(int host_pipe[], int flags)
> -{
> -#ifdef CONFIG_PIPE2
> -    return pipe2(host_pipe, flags);
> -#else
> -    return -ENOSYS;
> -#endif
> -}
> -
>   static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
>                           int flags, int is_pipe2)
>   {
>       int host_pipe[2];
>       abi_long ret;
> -    ret = is_pipe2 ? do_pipe2(host_pipe, flags) : pipe(host_pipe);

It doesn't apply cleanly:

It seems this patch is applied on top of the one you want to replace (is_pipe2 rather than flags).

Thanks,
Laurent

