Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DD48AA15
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:04:16 +0100 (CET)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7D4c-0002VU-7d
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:04:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7D1G-0001GP-DU
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:00:45 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:52735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7D1E-0007B9-N3
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:00:42 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MeTwa-1mX2qv0EYG-00aTNv; Tue, 11 Jan 2022 10:00:37 +0100
Message-ID: <788123b9-1d4a-3f70-52d9-416e7f5c0e9b@vivier.eu>
Date: Tue, 11 Jan 2022 10:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] linux-user: Fix clang warning for nios2-linux-user code
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220111082900.3341274-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220111082900.3341274-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qA2ffYh59l/siB5AwYSEEQmHqBPQ8jdj4hC0TCOww91SYWwtnH/
 YBdN9pW7Hs+bpPZNH/XiCNZ85Wa62uiwmgYtV52ulhFyLa+j74AqkTgnMY8TxFsawqXBM1V
 ldNOVVA7BuuiFoY+hpqstJrzqZAWwRRQGpBGpsaYH36RXverDWLCD+6ooTzxhdfbzNufEPs
 x6qys27lbwYvpwllpDBcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tBkiVOYTNRg=:u0yovrDe+7cAPJe2rnSl7X
 UfON27IYEwgNuY1dEPZWdOKj28ZZJDADpOMzHoWOHziFCxdOv5ME4qO/tPW4hcnscwsYA4Hxf
 8pu8vwe5YQfze3L5lg8P3+3RfhEvF3QPHalClNC2fTRKzqNVYc9QXdHfyD71b+cE0OhcQPpiD
 EIPJeS765adxv0DiPdEDTBoFapERkc6ZVPR5yfjKnoi/WK1iz1jA+ah1KkD2KcR8g2HqgHz9s
 E9vzbdGO5/66dGn2Z1H1mM/2UDHiunW88QFA8D+0htL0tDY01fp9t8oP5ene10yQt/dvP7y1y
 hF9BVRFLGlfWRvhAD+5XmcRlpNNc1XJ+B9b/QjVX2TRvjk0btbK4P2+B0ZSQEMH9jQE0hyABq
 svFwxjZ4+8W5Ty4T00QtN5hilPII44CJl5Rah9+n7xumfEVbFHjkSfmx/qkLLmthnOg21HDLn
 dYTvmH/TEL+ynX5WsOfPduKkNpOdYfAoYIySCRCJLmz1dZUKHE3Gjmnas8QaZMIJKCznirfYg
 K/Yhmbry37smbNvun5Gy+9P321zhfhzVusCFovfKZQMW4RoViG7z6w9xZ13plAWFem4PeyhTb
 pSiSmqbhN+XmTfxj4CdMWf17PCQHNW6uW1xB/4kw/YO/9254mCSMh2JIWKQjDBW8Cy7pUTwRM
 7xVD5n5SxFZJW/O8VOMZeDtMNtbaZwedmv9mBQ7zeCCfLgTJ+dqoyEBXhVSzHHJ+aqkQ=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/01/2022 à 09:29, Peter Maydell a écrit :
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
> v1->v2: fix sense of comparison (oops!)
> 
>   linux-user/elfload.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 329b2375ef1..d3274edfdb7 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2420,7 +2420,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>           } else {
>               offset = -(HI_COMMPAGE & -align);
>           }
> -    } else if (LO_COMMPAGE) {
> +    } else if (LO_COMMPAGE != 0) {
>           loaddr = MIN(loaddr, LO_COMMPAGE & -align);
>       }
>   

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

