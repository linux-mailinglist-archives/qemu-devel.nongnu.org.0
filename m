Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBDA3ADF0F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:35:54 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyYD-0005RP-Cc
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyX9-0004Kx-6u
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:34:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:57119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyX7-00075z-D5
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:34:46 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8ojI-1lFoil31bK-015tgu; Sun, 20 Jun 2021 16:34:41 +0200
Subject: Re: [PATCH] linux-user: Check for ieee128 fpbits in PPC64 HWCAP2
 feature list
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20210614191729.2981488-1-raj.khem@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <280e98a9-9b2d-ce45-b32e-6cb3d274af7e@vivier.eu>
Date: Sun, 20 Jun 2021 16:34:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614191729.2981488-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W1ySWqtr3R/Iwf65CWP53ByusZAnZDqQoX0/UYx3D1UztT+GbTx
 0j1HCBN6BRW5UA0Tu1dmQqLrfY/lTuZrSgFxtKnXw8M9EN85r+6DtDp/kG1ZBq0V8Bqy9rF
 z2zs6N9+2OoFI4OMhFILRy3vdN0RZIEiRLRcPxtkSTrr4gvqfs5YxRFtBFSqv3CupTPf8pd
 HwpxCLNXj9vg5+VrVmxLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5NVxy6C7ta8=:/VcaRxUD/9Qtk4qPX20bSJ
 dC2Dcwic6089Avs4H8UWkQhAOBhr1ABUxYJfAhRV18Moa7lJWSKdJT6niSxFM28foWE+oNI7O
 Tz88S6dmM0pPRFysa56o13cnQ2cRBWNrd+j+92Iy2vRFclbwwJw1TzrdxwhXYGV5AioIsf9/c
 sYRcu05W0nuY/P1zYN7BRvKWjcLGS0lswHH9nuor4F2ZGbknliBC9dJMiLocpnZTIlZyTAmSB
 ynyL2Yqxdqo1Jvshte2gwblbXrRGjTF9qyXRXB9E8xOWu/xykmfwARSKdAe5rqWHmU0Eolzkv
 J0Fs0P+MCXyW9AM1GnUHg8CIJGjUq//FElCi2xX1zn5AJ4yvoxv1eTsPgS7/QaG8tauFe0ekt
 U7OfQSSiW3aXWNuERIRf46f4VViA2yVagyhHOLq/tPHSN26hSclji5s/hvslRoSbKJo7Ue9A+
 hkbdw98lgrYR7BRX7a48VyUK52pmGVFWRdjUuScadl5ptMdIYmpn/khx7QmJMLLupj6CD8lAl
 XE2aJvC/k7wOqX6FZqNfyI=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/06/2021 à 21:17, Khem Raj a écrit :
> glibc 2.34 is now checking for this in hwcaps at
> runtime [1] and failing to run the binary if machine
> does not support 128bit IEEE fp
> 
> Fixes
> Fatal glibc error: CPU lacks float128 support (POWER 9 or later required)
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d337345ce145e23c5f3a956f349d924fdf54ce2d;hp=eb24865637a271ab7dad13190330105eab0d478d
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Florian Weimer <fweimer@redhat.com>
> ---
>  linux-user/elfload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 17ab06f612..e7dd18fd40 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -830,7 +830,7 @@ static uint32_t get_elf_hwcap2(void)
>                    PPC2_ISA207S), QEMU_PPC_FEATURE2_ARCH_2_07 |
>                    QEMU_PPC_FEATURE2_VEC_CRYPTO);
>      GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
> -                 QEMU_PPC_FEATURE2_DARN);
> +                 QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
>  
>  #undef GET_FEATURE
>  #undef GET_FEATURE2
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


