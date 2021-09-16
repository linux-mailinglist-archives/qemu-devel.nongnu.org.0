Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6E840D7B5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:46:44 +0200 (CEST)
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQouh-0004jr-Ic
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQoqo-0000yc-Tw; Thu, 16 Sep 2021 06:42:42 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQoqn-00082Z-Bo; Thu, 16 Sep 2021 06:42:42 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N2Unv-1mtvNL1Wxj-013w75; Thu, 16 Sep 2021 12:11:40 +0200
Subject: Re: [PATCH] target/avr: Fix compiler errors (-Werror=enum-conversion)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210706180936.249912-1-sw@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <60a4fa8a-490c-e82e-696b-35e563817e39@vivier.eu>
Date: Thu, 16 Sep 2021 12:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706180936.249912-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pAcPZAyL5+Cz2scP2Qzz1Ae2SEGxKp1oldpCY4Ph8kZXI+GOV9V
 SOf99OmoAAj80qn1iMfdHqevZ/NYKPu/jEbRfCFPxYN07e2G/lN5fOA4I6XJQBcZyS0dRZF
 YAt3ww2W4pXrfcj6iX9/UQ4+9CJ6OEw/Y6xeZa1V+j9g/eu6W0kvoCBCe2z4Z4orUrMmkkQ
 l5gO51LnLMOWkcjoMeFhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jpv7qPTpWp0=:9OwgNfHRg5esIbVApqYBUJ
 Ga32WNoR1GCZ0ClJOwXChVhMznF7Ugb4bOb6XZPin5BmpJ5Hu45r++bwR4Omw6Vrl2OJr98tM
 hhHFnf9gbDijr7C+hkkhhJVnXOwvv0DKbRd4Y+yU78zin2txaWITmPt6QpFgcHpBBLBNpHEMK
 vB9MMVIp63rPX+2o+gu1udomONtQcIAu2l1tZAVMg4SpiWoV7MiLv8s6pU/Xb5BqRS/s2jTEW
 ud06ezYKfiaKYFdbaXi22SyqrQ+rjMwvUs1DO21WhKu6ijPf5uMi3x5MlmxV9k4myZ+Kc4MWp
 +lLCPqK4Yqg6x5v5pG1NVbD2E2dYs4ctrYkqXqCU5lVkvJ1JQVPES2R7KIPRmipR2He2l3dcr
 Wp3S5ZfMvA4444xLMDbGcDuFhRLSP0V6BslKeQM/HL1IMFFZLJaahNVr+ArRbvJv++yxQ5eDZ
 pe1jNJkkyO4tVM9Kcg5V1ZqaLw5HMCgKHiBqpIKFDaACOZ+kFdgp7d95Y2wV9/u/HkFCUGpR7
 7VO6OuzCL14Wh9PonLT2ntDSaJ5NsdEV/GlpDt+fFMdb6Ezo5EzH2SkvFhJuSy7emcrSo//MV
 duccgdHFgKhleG2hr9NGEiNXwdiERorHro9l1ng8o1Qmw2Eo4qwVRVA8puoKleoJczoHkDQ+d
 +hFzGoak3FOH1foj+Ii1JUwaMIkJHgOrjpYWRQB4vfsP8ImY8d81G1QeKEUdjdRINJ1e+Yrlz
 7LjtFre8qIUMtAO0KY1xnBDKTtCfXkBCsxVc5ocToex00aEBxm1H6iSDXESCEwkR4qR9FvsbJ
 6vRSZrn
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
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
Cc: qemu-trivial@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/07/2021 à 20:09, Stefan Weil a écrit :
> ../target/avr/translate.c: In function ‘gen_jmp_ez’:
> ../target/avr/translate.c:1012:22: error: implicit conversion from ‘enum <anonymous>’ to ‘DisasJumpType’ [-Werror=enum-conversion]
>  1012 |     ctx->base.is_jmp = DISAS_LOOKUP;
>       |                      ^
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> -Werror=enum-conversion is not enabled by -Wall, but by -Weverything
> with clang for example.
> 
> As other targets use similar define statements, I think that's a simple fix.
> 
> Regards,
> Stefan
> 
> 
>  target/avr/translate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index c06ce45bc7..fcc839ac36 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -70,11 +70,9 @@ static const char reg_names[NUMBER_OF_CPU_REGISTERS][8] = {
>  };
>  #define REG(x) (cpu_r[x])
>  
> -enum {
> -    DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main loop.  */
> -    DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition exit.  */
> -    DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition exit.  */
> -};
> +#define DISAS_EXIT   DISAS_TARGET_0  /* We want return to the cpu main loop.  */
> +#define DISAS_LOOKUP DISAS_TARGET_1  /* We have a variable condition exit.  */
> +#define DISAS_CHAIN  DISAS_TARGET_2  /* We have a single condition exit.  */
>  
>  typedef struct DisasContext DisasContext;
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

