Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968E6B2437
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFS3-0002xs-NQ; Thu, 09 Mar 2023 07:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1paFS2-0002v9-Aw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:32:54 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1paFS0-0007zo-4X
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:32:53 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK5BG-1prF8h13YE-00LXV3; Thu, 09 Mar 2023 13:32:49 +0100
Message-ID: <20edcf58-d5f0-4b11-06a6-7b811d30586d@vivier.eu>
Date: Thu, 9 Mar 2023 13:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-13-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 12/25] target/m68k: Reject immediate as destination in
 gen_ea_mode
In-Reply-To: <20230307183503.2512684-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SD/Ydqz4oR7Mn0z1AR+FT64mxMAp1zKxcrhFh5M4eLrTAdCDIbl
 Q7LS/yfPuSaXyDcJabVJdHSuyFZJu6UmNW64vjp8uqef71z+DggaVieN3+SCZDpjUytpRww
 PvdBJnI/W3Bi+uILSsWqiy9LPzLjmAvrDo7ZMrJVqgCNs2wh9Yr8igJxR5X0cMq8rh1Hkcw
 /7tVpGLPfU0uMzM3PuIxQ==
UI-OutboundReport: notjunk:1;M01:P0:SsKuWUBTvws=;xFbqmFb5kVikOBnsBOz8RBaFhoH
 8t2l6kY96kx7x/hwQagZgfPfb6lppvjyCinT0L4bzozKZwAE6k75Frj+4+6jYiSzd2gNGBT+e
 jeKx7ZgBb3RDKZxfBKC5hEC54H/BLsRCgsGx8fOnY1iPYm2haxntmGiRPb29uB/2DdJEcBFTj
 NON/lEDiSOFzs9RZzEIWGABkOOuut+XuXyfLYG09F2lDcwBJfxuBL+ka1ltWt/KpbQrdRDOn1
 IYmVWvbAiyWBbdYaHyiA7AoF81yyV5pSsWFGSNp7zq6UYe4vlqQh3VLbgSwI1QSilDz+4KH6y
 somTHFH7HChV07gKCWCsfwBT8VZxXM26b0bj++y+ODUW3JpQAELhLwJlT76QciasY006welTS
 3WnUFBzNepO6Q3/KQrFR/pg55EzRBJEq+SjbcGmrZUMHc2O7+VEwl6nxKi3Hs/gzboO7BLsEq
 HVBiFdToh3p3xh+1HPvtf6/dN2aiBr0qfDPik9cgr1LGs6U0VJknBBmhtCgdJBga89SMwZ8pm
 BIDAHNacdnX+jR2HORsrZzIGkI/+QnGJn84Snghj7CRKUmIJtcsCLetL33w8UfYaJQ2GQ77HE
 tq93+s5bDukXXZkv1VBrcdo2ensYUShTpE0emYeAHzLqwljCQGpU22AcBUb68oN2zgbVNfo2j
 uUL8RtFgegZZfaLQ4ubrbvdbSsjcYF80t8Flta2ZQw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

Le 07/03/2023 à 19:34, Richard Henderson a écrit :
> In theory this should never happen, as all such instructions
> are illegal.  This is checked in e.g. gen_lea_mode and
> gen_ea_mode_fp but not here.  In case something higher up
> isn't checking modes properly, return NULL_QREG.  This will
> result in an illegal instruction exception being raised.

NULL_QREG generates an address exception, not illegal instruction.

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>   target/m68k/translate.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 44c3ac0bc3..fc65dad190 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -894,6 +894,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
>           case 3: /* pc index+displacement.  */
>               goto do_indirect;
>           case 4: /* Immediate.  */
> +            /* Should never be used for an output or RMW input. */
> +            if (what == EA_STORE || addrp) {

Why do you check addrp?

What happens for an instruction that provides addrp to SRC_EA() when it is used with immediate mode?
In this case addrp is unused, but it should not trigger an exception.

Thanks,
Laurent
> +                return NULL_QREG;
> +            }
>               /* Sign extend values for consistency.  */
>               switch (opsize) {
>               case OS_BYTE:


