Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC85BFEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:29:30 +0200 (CEST)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazn7-0004fz-Mg
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazKx-0001ir-KY
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:00:25 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oazKv-0000EZ-T8
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:00:23 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1HqM-1oYEBP1xwQ-002sSh; Wed, 21 Sep 2022 15:00:17 +0200
Message-ID: <41bc3a32-fe6a-068d-2cee-8b8fbfd56532@vivier.eu>
Date: Wed, 21 Sep 2022 15:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] target/m68k: Implement atomic test-and-set
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829051746.227094-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829051746.227094-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:m/uLkJ02ggLp22wmbvFGMs8wgrE+FvziKXhILwQGH35jU6kTlXs
 rWM5qwWEGAqphBSxvEpQLPNEnjRZNZt7UL3BSm4LIEHL1DCCYnpFHmgTlcxLtk2xBzT4CqA
 0unN0jGbqTZsuiOwyt+nS1Y6WrUoSMnau+iLIR7ZQc1tC32ilCjGt1q27Mp/bhm4Dg+wD08
 RD3+yXcUvp2Oi0+pdQzpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zjOedXGhGqM=:xYCsQyR5ZmgYLpQHWCz0LL
 ELSoTwh9p441XAb735aExeCYkD/O05WNhspJ3lbnKvsHkH0R0snsH/jDIpg5Cozws1feO4qQw
 oKn0CEF6zI4vmfUEVRT9Zc/ero6vzmz/IBaTWqa4bE8ryNS0p7D2DvojyiSeGKoQCgJaH6zFt
 +Pm2JXW4mLKSw16Sn7K68VIe0dkgLQ6Qo1fe5cFPCfbBjMpALOLO+WW7Umwp/bmeswcWC65IG
 PozjI5bxh58ux1lAR52ef5SMaoo0XC5UPfPPwVRhH1v8oBFlRzztRQUZRd0LFb6XSXk8nxoFn
 h/aAY1r87ppBj8fu4jg2XI++VbTuGqzjQH7ovbLvZvWp5GY2tMzuRZZlhU1N94qD4BjCTJi5d
 +fP/VVCmOivNzo4jKxl8DR9CuUPv25ZTUOAnu5gYcCQxvoD+zXF1yX3ND7mHofyuaaPzKQMaW
 itx4wCyTdpREXhXa2W1bRQuD9Ht8VPRLuGa9kOr22g1XI4HjIlxvq84Rn+hAJ/005tefX4e2r
 XhyH9uRi206oOwaBsfD3W5561FWDdpDSEdSpFwA5zpqwH/0H93a95nUE/aJz8M0ACIe8cSubN
 dEr9gEc3Zm7o8at+GkX90aYS/PWQ8FNXuYqAdxBeYSkFYpoky3wdUYqKyEj5nUTbqWN0h2v1u
 iEMaoXZqtSdilrdXPXeZOU1znIUJHgOqkRUyo1p6YmgqDqQ8tIxfqs98xD81Y2x2cvRWdPWhK
 n57MbdKptcyWQlzO5iyNjxGgKwMkOPLpKV/MSZuudNAzgzpGF0EJDSnd+AwQREl8CMVyz7681
 dVDYDdM
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Le 29/08/2022 à 07:17, Richard Henderson a écrit :
> This is slightly more complicated than cas,
> because tas is allowed on data registers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 40 ++++++++++++++++++++++++++++++----------
>   1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 8f3c298ad0..0aef827b38 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -2825,19 +2825,39 @@ DISAS_INSN(illegal)
>       gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
>   }
>   
> -/* ??? This should be atomic.  */
>   DISAS_INSN(tas)
>   {
> -    TCGv dest;
> -    TCGv src1;
> -    TCGv addr;
> +    int mode = extract32(insn, 3, 3);
> +    int reg0 = REG(insn, 0);
>   
> -    dest = tcg_temp_new();
> -    SRC_EA(env, src1, OS_BYTE, 1, &addr);
> -    gen_logic_cc(s, src1, OS_BYTE);
> -    tcg_gen_ori_i32(dest, src1, 0x80);
> -    DEST_EA(env, insn, OS_BYTE, dest, &addr);
> -    tcg_temp_free(dest);
> +    if (mode == 0) {
> +        /* data register direct */
> +        TCGv dest = cpu_dregs[reg0];
> +        gen_logic_cc(s, dest, OS_BYTE);
> +        tcg_gen_ori_tl(dest, dest, 0x80);
> +    } else {
> +        TCGv src1, addr;
> +
> +        addr = gen_lea_mode(env, s, mode, reg0, OS_BYTE);
> +        if (IS_NULL_QREG(addr)) {
> +            gen_addr_fault(s);
> +            return;
> +        }
> +        src1 = tcg_temp_new();
> +        tcg_gen_atomic_fetch_or_tl(src1, addr, tcg_constant_tl(0x80),
> +                                   IS_USER(s), MO_SB);
> +        gen_logic_cc(s, src1, OS_BYTE);
> +        tcg_temp_free(src1);
> +
> +        switch (mode) {
> +        case 3: /* Indirect postincrement.  */
> +            tcg_gen_addi_i32(AREG(insn, 0), addr, 1);
> +            break;
> +        case 4: /* Indirect predecrememnt.  */
> +            tcg_gen_mov_i32(AREG(insn, 0), addr);
> +            break;
> +        }
> +    }
>   }
>   
>   DISAS_INSN(mull)

Applied to my m68k-for-7.2 branch

Thanks,
Laurent


