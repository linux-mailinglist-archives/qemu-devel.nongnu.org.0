Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC55E941A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:52:36 +0200 (CEST)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTvn-0002va-Sh
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTt1-0008Tm-R7
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:49:48 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTt0-0001UK-5C
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:49:43 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9Fvl-1oZzqG3PeR-006MiX; Sun, 25 Sep 2022 17:49:40 +0200
Message-ID: <8d29c43d-7224-b56e-452a-acae4a28465e@vivier.eu>
Date: Sun, 25 Sep 2022 17:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/7] linux-user: Fix TARGET_PROT_SEM for XTENSA
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220924114501.21767-1-deller@gmx.de>
 <20220924114501.21767-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220924114501.21767-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yTWkR1jZvcFNQgMe832qqTWpLY+bx4MHgyia93qa3H0lvLmP9qA
 wklAFgnK5qvsAT4BwlW7X42gw8be3b3otbdGe4dxU+Gva4B3mCMIZtPunL/ujdmShs2bpad
 RhzeB6xHvkrk7CXREr/8hAk7fcM1lwtOeJuGNa17YSyRNZy2B3DQLdb2xEC5xJZOb+ftCKr
 Sef38EhBn9yYKGK2zEoEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0VYZQPZLJPw=:LMq16uiqKKNJMu1kHEX4T7
 xmqV5uGJhquTdzbzl1mWFd+05nmWcUX/QCy1so8US7C5GBg+ueLgWImAplwJR+HA1DAj4x2gV
 dpyg4jxyiPWuDZ9yuDg8rQgCi/PBxdvrI4qla2skvrKd8kRzTNBfNyaYNQbtPU+CLCvzjKIqX
 GGCl4H51mKC8GZt7PUHdK+nafJLydtRUxw2DJ5Pf7A5l9dfSPQuFkGa1vPU3MuABgrVErapcc
 sJlQEd1hFn26gOWfizFs+BUHw79fm5TbayH9S37ZS2d2jc8+U9kWrJpevTRJC8jrn82GEZkad
 QVeuaGXo2AIm6K3bHHF061D9cqDrSnVdwkwEDz2lX7zI+reMA7wrbffyM5MkyT5qgsEwA2jJ+
 jfSw5XbtpeBR4LEsHCExLIBRcKrfhQhJstlA85MpLLg8CbZalxV4IJy4smz/uc6tCX4bz+ZQn
 n9IKQSivDVlSI78jvR4cQvQNz1DT3aukLyGbeGTvOEHZnLwfaCaTazjb97LXJf5xPN0lulUmB
 2wxfpZUBRVIIiOtz1eis6lklTwxR4311JPDwEhD/hBGmSs8q74LnJnCVpQ5kmjAlzYhfHMZuI
 VNQ8BzwKGLQBfobmGxAnrFfDV2iwbM2oi8cu/vKQCoN2zz/x7wbHyiF69OgQLapzAOZWmSXDK
 ldLASCgfR0FHWHXaIq2AiBIeTR4qjTulMdX679FQ4Ak9u2nfR10JwuoeUfa52mzogPRP501/X
 akQrl9dRufQ3jorUPLZUr4MivFZAzTgYysq9ctDKZ/g7cVRnSHdZ8CwQBFRdHo3Bpf62OSSId
 SkjSSk+
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/09/2022 à 13:44, Helge Deller a écrit :
> The xtensa platform has a value of 0x10 for PROT_SEM.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/syscall_defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 85b0f33e91..1e3577bfa5 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -1246,7 +1246,7 @@ struct target_winsize {
> 
>   #include "termbits.h"
> 
> -#if defined(TARGET_MIPS)
> +#if defined(TARGET_MIPS) || defined(TARGET_XTENSA)
>   #define TARGET_PROT_SEM         0x10
>   #else
>   #define TARGET_PROT_SEM         0x08
> --
> 2.37.3
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


