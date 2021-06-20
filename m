Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF293ADF0D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:34:48 +0200 (CEST)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyX9-0003Hm-40
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyVx-0001Ts-2g
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:33:33 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyVs-0006MM-KQ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:33:32 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXYAj-1lmPff0Jg7-00Yxji; Sun, 20 Jun 2021 16:33:24 +0200
Subject: Re: [PATCH] linux-user: Check for ieee128 fpbits in PPC64 HWCAP2
 feature list
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20210614191729.2981488-1-raj.khem@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <08a6f0e9-696b-6244-fd30-1199a5b08004@vivier.eu>
Date: Sun, 20 Jun 2021 16:33:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614191729.2981488-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UOCm47BUouwxRRdArlabvJvVDIPiUfNV0V0p1V8vn9tOaKf5aKv
 oxm/YE5irIx850XmVa4jvp6r5+M5dYlRN27HOE/9ZUDwI+oYdUOtq3nD0PNvhpJqT/PUAnM
 C638H3MZq0tv+G47OrpoizVvjjRGFEzmCOKR4nqOnuf+FZAW+1WBccb0TAVkZ/pOLzwOBAS
 WbvHZvtOhcTz5a+kOpmOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mEyykkvBPM0=:FUSjMyawkRTxpZ3bXWwprj
 5ecSitL7VZCE8VYNkthbPvxqBPIpPeyRpbRJ9Zmq9Hub9ihQhOyD7jcBcSls094NNiIyC56l/
 Kk69sIu1eR474CURchly2QGuCKYF3Bbfl3ZbMHJBbPz4wGQnpscwElEJv0Ku+z/Evy+PfPOJF
 x+zAv7Qqudi6Tj8Hzm10FVBlpUTBmx6OtsqSyUAZzg2OSCAw95w2GvsQc4Nhx/DNjmBJh7zxM
 uTzysMnjxo6SM1byb47xCt5b31BLm4rm+IL+1VtQzY18xQq6DEDLhye4bBW6611EfGj6ckICF
 g5S2NHWdcLXgAURgyUgpjprqkUKTkcsFpPT2GFdCowKScuhfy1Wt79rVnMCez6xHwcT16OnVn
 kHuCjh8S538poLo+/QIeuojikUznXGRnYVgAfDbZIJfLtjXkdGncwDSOuUYy6M/P45N+hRWv4
 ezXh55AALPXyKfIqixpGI0fA8EyWVLMRKfOoCTF6I4O5BTWtjs+WcsvdAZpa7dejwdWWzHexW
 3TP4qG2xMUrJmd2xxjIxk4=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

