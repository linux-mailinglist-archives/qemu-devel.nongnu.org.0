Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91748A856
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:24:37 +0100 (CET)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7BWG-0008VE-Ml
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7BAt-0003hY-NT
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:02:33 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:40015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7BAg-0006aF-E9
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:02:21 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8yso-1n2FTY2kpK-0063eE; Tue, 11 Jan 2022 08:01:38 +0100
Message-ID: <26df0ffb-bddb-440d-4e9c-4f756d83f7c3@vivier.eu>
Date: Tue, 11 Jan 2022 08:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: Fix clang warning for nios2-linux-user code
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220110191751.3335516-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220110191751.3335516-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:m5ifg03EgFJwSdxf6Ocu5FYWavNvjxHqmuj0JLd7/3o/Do49ltA
 kaBvrTAEn01JLjbihf6BPXGZFkVAUQP98jk30xvm4yomXzi3UZRHBWFNdLzJxV23aF+S9bF
 99akCehLJkLBPDCxU8gPtE5kUCowza6vJ5H602uwC7rYNtjZJfED2yUUBvm9ZeHI1+ICX2/
 +SQhUVZ6mcyS2tHSn0WqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cCdN7LIV+sU=:BPNygSP0ltH2N26Ocu1vB/
 y2KgIDwHrhYeJ+gHcu78oyBafyQV6SOp5dVi+Wuu2rRGP828nnPPyloNuFvb3oYLi/vs7mCsm
 iOAbWVeMscli9oDwYSi3EdUsrpdYxxfFpaLm89j5mk8+8zbINALupmvA0bg2PGje6Kz5iiDY4
 V9xdqdNaEVIkHX1jRTs5OJIWG3u+S+aRSjRiAr/wyjlOd5RUGLnCzusAl8fTDnybNET7kd2W9
 mkyE991Y/IbXKBXcRINuLErey9ZEhIfCNhc5M/gQXn/OWBlzNz0GbI8fxNsZ48iTlXFI7DiSw
 ivWVJ5+OzeCqPgHVmpmJF1XWRr3t5yKVdRIN6pMXEGgh7piwTIyG7bElhYpi8mtbU/FkoAavi
 DcDEIlHL0g4A7MU5Yrp2tBEQo6bdhy6oRm0FzjtWksspI2CWDmooZJgz+JlQlBdmuf30+kYHu
 uIpwyWEHCNzGHHajdKiqwY5j37xYbDROsFYkiaYJEU66gizf6VwUO3CwY8G17DJ7GR05t0dPr
 16fFfOyHPZ7/D8X5Ey4uxFSBMebETaGaA05WTIABgaWApuJQ1HujbNCQzeAs+SD59jXah+9a6
 QdbCb7At/t6N741T56ygKIcH1RWpbXg/APO2DlSLSXFM+Nte6em9NdSGB8G/YNCwTr6FOYYxc
 EFFba2T7vhKsxQsZcGnr90WUNLmnkO6LTUzGYzvU0O4RVoNL+jEPu+A7JO15S3wsvvhw=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/01/2022 à 20:17, Peter Maydell a écrit :
> The clang in Ubuntu 18.04 (10.0.0-4ubuntu1) produces a warning
> on the code added in commit f5ef0e518d03 where we use a
> shifted expression in a boolean context:
> 
> ../../linux-user/elfload.c:2423:16: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
>      } else if (LO_COMMPAGE) {
>                 ^
> ../../linux-user/elfload.c:1102:22: note: expanded from macro 'LO_COMMPAGE'
> #define LO_COMMPAGE  TARGET_PAGE_SIZE
>                       ^
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/include/exec/cpu-all.h:231:31: note: expanded from macro 'TARGET_PAGE_SIZE'
> #define TARGET_PAGE_SIZE   (1 << TARGET_PAGE_BITS)
>                                ^
> 1 error generated.
> 
> The warning is bogus because whether LO_COMMPAGE is zero or not
> depends on compile-time ifdefs; shut the compiler up by adding
> an explicit comparison to zero.
> 
> Fixes: f5ef0e518d0331 ("linux-user/nios2: Map a real kuser page")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I'm probably going to apply this directly once it's reviewed, because
> it fixes a build-break on one of my machines.
> 
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 329b2375ef1..2993b01e60c 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>           } else {
>               offset = -(HI_COMMPAGE & -align);
>           }
> -    } else if (LO_COMMPAGE) {
> +    } else if (LO_COMMPAGE == 0) {

It seems to revert the logic should it be "(LO_COMMPAGE != 0)"?

Thanks,
Laurent
>           loaddr = MIN(loaddr, LO_COMMPAGE & -align);
>       }
>   


