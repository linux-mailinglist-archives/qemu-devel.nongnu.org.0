Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C85B8E22
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:27:57 +0200 (CEST)
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYWB0-0000Kb-K1
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oYVKK-0003Oo-KQ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:33:28 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oYVKI-0008QS-Sc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:33:28 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOAJt-1ox4aO2cJt-00OUcF; Wed, 14 Sep 2022 18:33:21 +0200
Message-ID: <3aab1e0f-418f-3e74-e178-404ee6d9e6d8@vivier.eu>
Date: Wed, 14 Sep 2022 18:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] target/m68k: Implement atomic test-and-set
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829051746.227094-1-richard.henderson@linaro.org>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829051746.227094-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qhVA8nKwNmvpqU2+JaneAwrpf76axKtp4Ba1Ge3y4NJi6oveohL
 PJYL+UWqxBMPduvihLu9+lHGPKhRy8kUeKnECJ2Hhg4EsVrfe8JC/LvHVA5KQ7lKagpeaCj
 +BWL6tDAA646mBvH7KK2Mjd0Vwn+OwyOZ9fXzmc2+iDfU5/EDICRBVFc0qS9TnuFmmxqUpn
 H5CefO6Wj4n53WOswAtMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o3n72C+Daa8=:RKc/GHQX1u1GqCgKC1rYzC
 mX7H3Op+RkyPzJhPmt22TKtaDtazysSxqh1GYhGXx3bOl/5smbUpYEhOISaU6nUZRYzrGmgAi
 SL48CBeMDWlMlaTFaJvE+Do+od/gZ+2E0crKdfP7ZLVDEndC+kvVJpWCVG/0wU8Yij2hx698a
 tm1sFNDl/WDF2DbbiRyuBcTIKyWeXdBWabNC6AYgLVlgRI2EH5T6+cWs3GxyCSHVm9X47QkaB
 7DVCwFnhupQj7JNFrxpfzBnB3if1nflKx/UuBS1I4/V3gi4orAMDMOIJyvMhSmz3G3+ma8UXl
 tvXlkV7w8YHHzTjZcXKwxQ11LTZwka2vrGUgOd9xIysch2ZTKk6Wo8kSXrHtmOWRR62Hobw3Q
 CAzMUid63w3/yDtv/8/c6/vJBOovIc15ASpCgTf/0d8DBvrw/NUyYksctffzvwQ3GsoRcgkVa
 FO+cZytMWL3+6NveAq0YFjc9IdF3Np+vcEHxnF1bDOgKCZlm5BB9h08iJGxgzTt5kiVZYd+Qg
 8KOpLTpb1PRnEBjy/aDL8x+HVMd9rzvxF+4KO56q2YjKmoKWqz4J8fGr5u854rNzxplB3SZLC
 7yUbx6i7XyB9ziWRx9zFDPsJ/vwVywA/h/MMV3VZbQOgDvfX3nMC0kiZNxQy1KVFRbwSqziij
 Q5cHh6YIa+lIIKIsIu9nlTcj8Qa215puvgeKlw59NEQnRG6WWtVSYqgeWA71VgpG79a6Gvjpp
 076yL7dJo/39qcLRli7ALio1PiUgZpZqR0ORTBwbGYjnzGOpSu/PqPhZX0Me/BMPzNHcI9Y9m
 nmNrF4D
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

