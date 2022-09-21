Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430425BFEFD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:34:49 +0200 (CEST)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazsG-00025B-30
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazNE-0003nP-Hk
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:02:44 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazNB-0000Xn-Kq
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:02:44 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MI5YN-1oWutc2VaJ-00F8c2; Wed, 21 Sep 2022 15:02:39 +0200
Message-ID: <e5a30ba7-2c79-7c20-96d5-c28a13c4341f@vivier.eu>
Date: Wed, 21 Sep 2022 15:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] target/m68k: Perform writback before modifying SR
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <20220913142818.7802-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220913142818.7802-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lGlleCeQFwCNgkphIpfk1uh3UCe1orknrH+g4hnkJnEa782VLeN
 FrSH30h2CUxmjtpdTrkfuFpQR6Ls8BBBIoslQygVq8Zl8Bb1ZNwibze0IirNJF/VIZnGkrN
 juaf28KrzVCY+edu97xSsgZ0vhB9iPQ4+ipOz0fR5zm84V4lY1MX1PS63fOgZba6C4j5iUL
 lYNOnQfWYLN45a6WJcAFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s2d8NxWTbzo=:ajK9JrfzWSUE8h32czAo5a
 aUw/v2eWoNsvE5GPFhGXEKNW5oTOYjCADbkvrD/1I1lRMDrFXpa57KE5cwwwPn1/lQzpScehB
 onHn+igH/wAtxlKz1QNpcjsJ5R9WF3QBJIS0sA3EhHoJ5Y4EIFPLv+mx0QB/xXxstSBDjXSe6
 JUzHVacOOtBepKY2FuBv4nJQNxK5t+9INSgs8C+7clF+BM8yBbiC55dznPuCRRgdqMRKJUPiX
 NyVLOvy1RACMt8Hy9VxiCWy9SkI4nUXhLCVQ/8q7mDYkUtTSG0q729E034AKAOqZr59L3UZAl
 zhTWtsCNnFJgrEDeoPIBgclEmOz/8vnmaDFD8ITz3tzFmtZm6YVNL0brhQtgFa89/BlA4gXmo
 o5XNBXlJ9Yoo/BUDXNu3KBcg8bc5s/6w1LKT5vIVr58GXdlSD+QDolMhUC6Pi8YRmmLaWDA4I
 AR/FCKuGTO1+OOjAg7q07vqCIAeS8wBFfuWjicw6axqJdN3uN37VsRM4JFeg+RHzumFzsL533
 yyGA3I5XIevslsr0AnXi5oPLxw321KXXPzf38oWz0L2jwMTO4yNw51Z0PKfSrdWwFdhEWH69u
 /rBbHQ5taUKnoZxaUdtA0m/vVzpIiLjAQDEcd1kTz8k7I0q4vjm0AO6/T8zviwb3pIjR0HKpw
 8lkOIqoJutaapUIEnDWkbUo8jmKEddTTeZ/Nz1EeYv3GEHvcIyErTtgXNbgAVq5BMr5z5W66O
 VRyr5fZbPD7iCLG2svB85VPVXjXjNxP2mI5+LmwwgNWODJhSGN61Z9MFXa5b5KO99Yku/CS2k
 9lWpHZx
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/09/2022 à 16:28, Richard Henderson a écrit :
> Writes to SR may change security state, which may involve
> a swap of %ssp with %usp as reflected in %a7.  Finish the
> writeback of %sp@+ before swapping stack pointers.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1206
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 87044382c3..8506da0a0b 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2285,9 +2285,9 @@ static void gen_set_sr_im(DisasContext *s, uint16_t val, int ccr_only)
>           tcg_gen_movi_i32(QREG_CC_N, val & CCF_N ? -1 : 0);
>           tcg_gen_movi_i32(QREG_CC_X, val & CCF_X ? 1 : 0);
>       } else {
> -        TCGv sr = tcg_const_i32(val);
> -        gen_helper_set_sr(cpu_env, sr);
> -        tcg_temp_free(sr);
> +        /* Must writeback before changing security state. */
> +        do_writebacks(s);
> +        gen_helper_set_sr(cpu_env, tcg_constant_i32(val));
>       }
>       set_cc_op(s, CC_OP_FLAGS);
>   }
> @@ -2297,6 +2297,8 @@ static void gen_set_sr(DisasContext *s, TCGv val, int ccr_only)
>       if (ccr_only) {
>           gen_helper_set_ccr(cpu_env, val);
>       } else {
> +        /* Must writeback before changing security state. */
> +        do_writebacks(s);
>           gen_helper_set_sr(cpu_env, val);
>       }
>       set_cc_op(s, CC_OP_FLAGS);

Applied to my m68k-for-7.2 branch

Thanks,
Laurent



