Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADEC616C2B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIVs-0000O0-En; Wed, 02 Nov 2022 14:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIVi-0000F7-HV; Wed, 02 Nov 2022 14:30:50 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIVf-0002GU-Pl; Wed, 02 Nov 2022 14:30:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1ML9ds-1oYDOL2Wqw-00I9rU; Wed, 02 Nov 2022 19:30:36 +0100
Message-ID: <89444fcc-d071-aa83-16d4-95f15fe53d6d@vivier.eu>
Date: Wed, 2 Nov 2022 19:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] target/tricore: Rename csfr.def -> csfr.h.inc
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
References: <20221025235006.7215-1-philmd@linaro.org>
 <20221025235006.7215-4-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221025235006.7215-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9lK6Jhn2Gt4juTJ/IK4+paYwy5vhVr3rm2RiDFsvFOn9MjyB78p
 evoiievk4tzJIcCZmsLtDlpr1DyMcKOMlGK6d1oIggSuzEcmHCGLlo0W2prS5oHMmWT7tMq
 hlBCIw1/0rO5YGFHbbk1MCF/qPmCuZD+lOWWEIG62sleBe7m2RD2GJVHeiQkLb+8UTdojmX
 +idGHcc7BU4sH2OQwbjIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gSK8k0AKow4=:K63to3yqtTWxq4ADsPYX4+
 mAF//y5KZ93ph/3PbxeUEDaHKiKNK6iazM2y2h6Y2Q+sMJfVoOjwJY3qMGzSbOKN+z+xZY5WP
 6+OGIOAO9tSCOm0yF7P1Hh+FdzmWLt2ScYIYWs7bZmfWPIeDzSmTyBvqL2wA9dXWyhqVI90LG
 c7/PsdVqIlDzWzNa+OrbDlMDUd2fOt64aqaEqgTYTkiubhjXUSCxFKi3n17gGW3TLNG1HA9F6
 p2i3En6cKsCSN8wvVMO6cNuKh9DsDPu7FcSZHexGt1d5qXMW7g+CyPGYIYFjprEKB1rWHy5HC
 U9555SNOAHbFbpMhA7fIE593yJsXG8Vu+H67BJPR3+g+TGvhCBc8wIdkTq55TnPwdHnOQqErG
 d5lpz9+sBKXewM6B3AU4b7D0QoE2kjpeXAmky6de8s23DLBBwcLXLQv0rXov2VBS//Blj0Mvc
 XUbNGjxmQsHnk4cqmIGR/iYzzvCfwBPqNWJXYiZL8hTLKJqLiq8vtTnws1OoxSJfZoX8Xt+/a
 FwIg0U9i6WtPxfkVTc8hYLW7UJrs0RxIP8TzHfYVUNIaMRHzbbNJzkMaggGrgHULH4hXBZkGC
 yxPw1pTp/ggz4lf2uBqWoxUXWi6m766/N4bTI9gEkZ938iQqetKR2Uhw7IEuOT02GWNG5o5/m
 GDqloIcqfnAhdJ23NJsvzb1mzXFoGyJCtQcubee57s72dEr+MNbw7VQLXtOBJFWvcu5zpuwfJ
 vcFVkt/sxw9TjNZwCQn160PzeVVTkeXMFxMP7ht7CA+XFQDThaDQ3h8nJuAr3a6W3zAVMDVuP
 /b/WDi+
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/10/2022 à 01:50, Philippe Mathieu-Daudé a écrit :
> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
> 
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/tricore/{csfr.def => csfr.h.inc} | 0
>   target/tricore/translate.c              | 4 ++--
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename target/tricore/{csfr.def => csfr.h.inc} (100%)
> 
> diff --git a/target/tricore/csfr.def b/target/tricore/csfr.h.inc
> similarity index 100%
> rename from target/tricore/csfr.def
> rename to target/tricore/csfr.h.inc
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index a0558ead71..f02090945d 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -388,7 +388,7 @@ static inline void gen_mfcr(DisasContext *ctx, TCGv ret, int32_t offset)
>           gen_helper_psw_read(ret, cpu_env);
>       } else {
>           switch (offset) {
> -#include "csfr.def"
> +#include "csfr.h.inc"
>           }
>       }
>   }
> @@ -418,7 +418,7 @@ static inline void gen_mtcr(DisasContext *ctx, TCGv r1,
>               gen_helper_psw_write(cpu_env, r1);
>           } else {
>               switch (offset) {
> -#include "csfr.def"
> +#include "csfr.h.inc"
>               }
>           }
>       } else {

Applied to my trivial-patches branch.

Thanks,
Laurent



