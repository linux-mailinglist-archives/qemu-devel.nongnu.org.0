Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8D3BF041
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:28:30 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DDh-0005UO-7F
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DCq-0004PV-2o
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:27:36 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1DCo-0006gx-Bx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:27:35 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MekGB-1lRKgQ1qeD-00aoKH; Wed, 07 Jul 2021 21:27:07 +0200
Subject: Re: [PATCH 03/12] linux-user/mips: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d2dc1d43-c0f8-6360-418b-546a1a967bcc@vivier.eu>
Date: Wed, 7 Jul 2021 21:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wJjwNGEdF/3w8L6j7sPzQ9h/fm0L8vATadxkdN9Im+nFuaa7Xo9
 k5vm10dA+tLmJGizC7hoolykiTJJLhI/PjEN9QajLCBuuZ/3NLgEQDOI8ThpP8XXTZTx2+I
 Ifv+vBpmCsVc/KOBeskiTaD/P+KS+80rafgNfTf8v41bqRhrH/z+n2Q7MQjED+At+Uo6ug6
 zFmmz9o+CKVDbtwWZxlVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h45kCyraDh0=:aEN2uQ1FbBMjEKg5VlH6DY
 tORn1ZO58irQ/x+YrbODh7l/VKgGW6t36w2EzOxjrfieSMo7IgdAZIPHi4Y/IIY6gOahSnTYQ
 blB24QnCI78wn5l9Zl/Uw0fS6tPXJjA347WraSZJwMQKjSV4QGpIl85coqnDqBNmhEB5k382A
 PetN51kcV8nHuqygp0k4hMLhdqkoq5W4RLxl0+tnfAgLQSXFaZUzTkMmqmb/AJhFEybY4cMRE
 t7lpEaQnuYJnq6wYgMO26raApNaCAoAhLhzaZHRyy/CnPQuME5wb9LQB+Vnbsd5HOUSyQpvt+
 F66yhjQxbdrcK1CwCpbYfa046pxS89sDuZfpvgo4cMjG5daP0eHxTjnZNFHD4oO+KQtMPxDZV
 h8h9VyYX97XqYg5Gy5LgQnHuvRSAZhxV5pfzHlVoIuVP5jhF/4Vnlaiy0fGJgJ7BBdwACyAYr
 waPTCn/6UmqSFQh3iTvwTI/v/jk4mPK40uALxFHAo/J5kPCrCLoO1dOjWlv4rUp0SPbIII8la
 qQDA0AYPvawnIlwcy+WcbmRzR7PrtU+5dliqs+yPf2UFOXBDrtexi2WQCTabEWuMBD8N8VLOA
 7Dt5eY3cXDJnPpDb7PKgYms3HOE6faNwEvQSC6t1KBSqq/FWQf1Sfx0CJWisLdyT5UlfCh11N
 4huLR/C4Se681BRa63JIXWRQ1E6F33mSSeUo27I9FxrWsEwPARGR/l0rfLuT/n6TbOKSNCn6/
 NpBmRtzfsQnPQyXGJvy66yRruWI7AfkkzT7lVXlcom7SpXkUkDdSRilyRa32MDLoWLcHAh/yr
 sFUoZoi19SdGxUOSjk4nF95spsV0CE6zdMFAYM1qSIvPfkVylgZnsc1THsjekkuL/RFJjGw
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
> Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/mips/target_syscall.h   | 2 ++
>  linux-user/mips64/target_syscall.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
> index dd6fd7af8ea..3e558fdb4b4 100644
> --- a/linux-user/mips/target_syscall.h
> +++ b/linux-user/mips/target_syscall.h
> @@ -21,6 +21,8 @@ struct target_pt_regs {
>  };
>  
>  /* Target errno definitions taken from asm-mips/errno.h */
> +#undef TARGET_EWOULDBLOCK
> +#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
>  #undef TARGET_ENOMSG
>  #define TARGET_ENOMSG          35      /* Identifier removed */
>  #undef TARGET_EIDRM
> diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
> index 8594955eec2..c54374c5a29 100644
> --- a/linux-user/mips64/target_syscall.h
> +++ b/linux-user/mips64/target_syscall.h
> @@ -18,6 +18,8 @@ struct target_pt_regs {
>  };
>  
>  /* Target errno definitions taken from asm-mips/errno.h */
> +#undef TARGET_EWOULDBLOCK
> +#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
>  #undef TARGET_ENOMSG
>  #define TARGET_ENOMSG          35      /* Identifier removed */
>  #undef TARGET_EIDRM
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


