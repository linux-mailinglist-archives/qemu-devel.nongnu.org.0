Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485C67CF82
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3vY-0002mi-Fu; Thu, 26 Jan 2023 10:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL3vX-0002mY-Cp
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:12:35 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL3vT-0005ny-Lv
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:12:35 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuUza-1oTeKF2VDm-00rWA0; Thu, 26 Jan 2023 16:12:29 +0100
Message-ID: <61da915f-7914-4c6e-edc6-6226250b5dbf@vivier.eu>
Date: Thu, 26 Jan 2023 16:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Improve strace output of pread64() and
 pwrite64()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20230115090415.6936-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230115090415.6936-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D3j1whrtYvYZseBxbRmtGt2FryWjSeSJ4TwgtDdsHI+uaUH2DIv
 KyDFFoVVAV2KfI50+VTcR4TJezXOYg02qQFBpXBsJ2pS8NZRaJbo5xmyoWR6EwNK7a/bYhD
 e6IjmY9ljoWlkzdolgckvTBlV083YvFOtRZfIwbAFjQO25eeliPgb2EAxKkuo1KjReE9AGA
 hFis7KULEiPxByzbjohvw==
UI-OutboundReport: notjunk:1;M01:P0:1KeJNkBBzvQ=;piRABF8OaHnZ6NUvP/ErzSQYC0u
 EPUtoMHjG++w5rndnROrnzytIL+43OfdUrCp1id4EXyR3f29U+5a/3XOx63PmdGs+XwmpFkMJ
 TJrYnXrE9RGE0BfWEGZFM9Kj/fZf3G0BwJM/RaYzU3A4QSDurPwMWcgebQyCnXJcoWiBNiPMK
 XypS3AqKdNl6IPLz7/YFOJPhnLyhLd22JQjdfiNlbSTVrnTXnRyPQJt1D/NUHN9eR93KeeKXV
 O2BMWHfSVE+xCBNDs/pokXFwMs57Yib7XflZ9SzAS81HzR0KacTLrYyOmwt0+XEY5cmnRrjad
 odzJVVliTpSoghkDxtf9GjqwKntijugCC9lhct3Q0HpVaId58MJT+NiT/upkfsxVPBmau/WgD
 qpPpsOSxNUF7Yu19pMRZb6/vFvf2tOdDKyc2MyIJcSJRS4Wcfq/KT7kE6WKNJtWbJMraf2nzz
 3yVMpf8inCHODCRoM1VUXSx/li4VHSNrpHOnUKwlfnabzKRZCTjfLGelOgn4x5dI01y/NFKRB
 gSItNjTR82kK5mpkjF0txndzeFzHG+0HUtshHCFiaW59fz2sO0dCGdLS82eXXrJsyhVFix+Y/
 qz/6ESQGPt+VDcXZgIlHaeB32H1KCma/Rdz5i38jTHgu8PTFP4zFQKrK2uIWA2p2+rbszRqfC
 5fclMgyN0qB7ZHhg5QTUbNY6Lgsg7uB5vAbEnYvQ+A==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 15/01/2023 à 10:04, Helge Deller a écrit :
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 909298099e..41bb6bbfbc 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1061,7 +1061,7 @@
>   { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_pread64
> -{ TARGET_NR_pread64, "pread64" , NULL, NULL, NULL },
> +{ TARGET_NR_pread64, "pread64" , "%s(%d,%p,%d,%u,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_preadv
>   { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
> @@ -1092,7 +1092,7 @@
>   { TARGET_NR_putpmsg, "putpmsg" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_pwrite64
> -{ TARGET_NR_pwrite64, "pwrite64" , NULL, NULL, NULL },
> +{ TARGET_NR_pwrite64, "pwrite64" , "%s(%d,%p,%d,%u,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_pwritev
>   { TARGET_NR_pwritev, "pwritev" , NULL, NULL, NULL },
> --
> 2.38.1
> 
> 

You need to use regpairs_aligned() and target_offset64() to correctly display the offset.

Thanks,
Laurent

