Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7641C786
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:57:27 +0200 (CEST)
Received: from localhost ([::1]:60924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVb1S-0003OM-I9
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVazk-0001nq-J7; Wed, 29 Sep 2021 10:55:40 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVazi-0000Wm-FH; Wed, 29 Sep 2021 10:55:40 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEVBa-1mcgP01Qio-00G2GJ; Wed, 29 Sep 2021 16:55:24 +0200
Subject: Re: [PATCH v2 1/2] qemu-options: Tweak [, maxcpus=cpus] to [,
 maxcpus=maxcpus]
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-2-wangyanan55@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <acc0eef9-a109-fd03-94c2-c7a901de1013@vivier.eu>
Date: Wed, 29 Sep 2021 16:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-2-wangyanan55@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y3LpZmABDaLD7J2LMYW/3Wcq+IIjSJ0Id4ktYY7pOGvFdVBv7Vl
 H4MwsLvWECXaXPThn3i5Yb52+P0FqEtGovsR9svFT8bN1rDV86OttU2lIUmPSQeNLcTCwOu
 dAIzfYhmzRU2rdvaMv6/P7oner3kRs11Htd8bqZVroPzrE4Nfv557W4mY0SzWPDb1ktsQSS
 ijRE+ZF5RxFJuiXsWgPSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XeywGmFzrLY=:RJ0a0E2XFxyzAyhQyUIm9K
 AIIGkxoPcO7iLFWgn/ZZg9nMXYaGKXZ3zFQhn0ysjGGTipHdVhPeD9kD90wmFoG1a1/bs6l7w
 J7L/6ZLhp1sa5zowBvhq5BE0+85nBLne67dP8OUQWpmej3DaJe+XxnoQIGCKNEY9U20wEL60m
 807zzvtLaGIe5HaEFci4Rw32vVJgM7Z4pRqJbpRRMeoszsXdjs/yrvAHTwbUW8nc18DBXsEoY
 aJyiX9yOdDBVybr3XY97hKPpH08B6u35VGWN4iCi02kYAymRaZHnEMuzmQ6WB0Yd1Vl5wl7iB
 MfAcD9yPW0ttTa4N2woj0O3nbLJQW6JIhtQ+UGY53Gq7XuLBrsVf2aE3Xwcsatq+LcPC5MjYL
 2wYPc55NLEK3tafaGKCU1HIrC3Q1xH2uy2NgG+gV3yJGRO/msh8UOvRWLalVNFTWF/bkbg0Wv
 yi8bHDGa77WtlDycDtlYjGK+NvSu0U2GX9y/sgVTjcF+zZor8+U+un2hkzqFD6P1gWzfbCwSu
 p3Vn8a7xt2tLStVFxhw6ta84Az38bO2zfxSwp+Uq3D/H9ruBL7PAz4awNDWR3cEJ2ln1vYNUQ
 yZn0iGNVNZvfJblysyYmfAt4nU1eHxA1Nj/yc3rkx3ozilMuToEKioieYAR2vQyvYDm0g/VEa
 LVZmwaLgXX/EsP8Rjh01sSDOFvj1uIvghNJxJRFlInHjwSfi9+k10DY+Z8eGrXVrxvhQSRTr5
 Ln4T5K2TEe5yiEgG6jXvIbIxn+25+2gRWiGJig==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
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
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/09/2021 à 14:11, Yanan Wang a écrit :
> In qemu-option.hx, there is "-smp [[cpus=]n][,maxcpus=cpus]..." in the
> DEF part, and "-smp [[cpus=]n][,maxcpus=maxcpus]..." in the RST part.
> Obviously the later is right, let's fix the previous one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5c1b0311c0..dcd9595650 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -200,7 +200,7 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [[cpus=]n][,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
> +    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>      "                set the number of CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total CPUs, including\n"
>      "                offline CPUs for hotplug, etc\n"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

