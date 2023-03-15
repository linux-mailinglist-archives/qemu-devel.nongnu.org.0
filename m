Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B576BBA10
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 17:43:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcUCU-0000cM-4t; Wed, 15 Mar 2023 12:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pcUCS-0000ad-DF
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:42:04 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pcUCQ-0007Yi-PI
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:42:04 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2NqA-1pgLHc08OU-003wjw; Wed, 15 Mar 2023 17:41:58 +0100
Message-ID: <a427c95b-277e-2ade-bf1a-b94f30cefa32@vivier.eu>
Date: Wed, 15 Mar 2023 17:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] target/m68k: Reject immediate as destination in
 gen_ea_mode
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230309201604.3885359-1-richard.henderson@linaro.org>
 <20230309201604.3885359-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230309201604.3885359-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iwOBqqTkkWkBRZjjMtthVItfwF3JupezGfCwM8cNAFH9VOKx8AN
 KOcxRS368x98qTopB9mzNa3F0WAuk5iUDvgPEzF6MPeNih2AjD6vO2tQNYQtq7jIOKXEw7+
 JGpUiEZUZea24VeMSiND3g6OgcSVFB0jonNJnQcgbFXnwx19esI63j31mRjUEuBLt5KgPCR
 o7fDry5weVcDoFaSjhmFA==
UI-OutboundReport: notjunk:1;M01:P0:Vf3lGe9krhY=;utTGDSsWpN7aMcoyrY+vVlrcsKD
 zeFwrq39t48bAnKQ0wb/QYqGlVHkdFMWcHl4StXeZ/S41+W5kMoTyn6Rrx9DnZ5UXQ0QiyBV4
 C1toW2z2QsUi5mK4dl23n4oOWCDi9cseI5uhxsGrpazeNK7s04nZmrw1syozac1rprEaTa+qs
 8ErWtYxZFB61dMQjVwOjy1A9eeGuM0PBBRESef0amn5afBpp3ywZ8pSLhBmyTmMReZSwmVm/a
 oCkmh+lKl7F/IZo34NBLzTkflDKhGV+LeR1EY9wGYJZgiiYdfb91jyoQifg3sIVOAiTg35sxh
 eTAmliCk+lgIwGm/Wxc06c6f4MtZMB1u+pdkLO/ZuojFnVAZtpdL6vQ/Xso7htYbTXgEPeBFL
 n848jW411MfsaKyOCRknviRVv80N7Nj5a0tE9BcK8U8NYolSOj9e3Zdag0ncrFgRSFNrQk0x7
 nqgMxogI5jm06xwy22AHYJjXeU2TG/33btgIBHWyCoouEqHLg+qL6zbx1C4iJEVefichI+TRp
 ALhpDxjMIvi9dL2VDiLGY0K9xumjleMW1GjJhPliol00K06YcXuWWKIZR9stTDe19NZTcGk1q
 Dd/ZePLSmbF1JvmQ/9oYpiwndfMnA/6G6NzsBzRjWgUtdeIUqePg2x2Bo8hs9lN+Gj3jevsbv
 PRiqd0dGVrFFO9SV8RabbUt3cH+/T75IugEpQiD8tA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 09/03/2023 à 21:16, Richard Henderson a écrit :
> In theory this should never happen, as all such instructions
> are illegal.  This is checked in e.g. gen_lea_mode and
> gen_ea_mode_fp but not here.  In case something higher up
> isn't checking modes properly, return NULL_QREG.  This will
> result in an illegal instruction exception being raised.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 422f4652f1..e16c608ef8 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -894,6 +894,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
>           case 3: /* pc index+displacement.  */
>               goto do_indirect;
>           case 4: /* Immediate.  */
> +            /* Should never be used for an output or RMW input. */
> +            if (what == EA_STORE || addrp) {
> +                return NULL_QREG;
> +            }
>               /* Sign extend values for consistency.  */
>               switch (opsize) {
>               case OS_BYTE:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

