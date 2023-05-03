Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2216F5FDF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puIp5-0006Q7-0x; Wed, 03 May 2023 16:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puIp2-0006Pd-VH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:11:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puIp1-0002YW-5c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3hpP0b+aFHm54gL1ZpY0Y5OwPzG240ET8xe3CB0Fr8=; b=zwbBR0qHRpxu6lTU6zkF2uOUN1
 62wcNsr2DUzgxipUiSGmOeUBUzoU2QDAw8isHKjV9WnWB+DvgSNChrZ1RbL0Yjenj9YHnbqUYPSYw
 YXTW7KakmwHY4EnX+UjmHaIO+ue1aIscOH/gA41B4QHkswCqNhPKTHahhfHBEHgv9mJVdh086uy7e
 5zD7xFATMkZllvdonSj7c/Rlfgg2FI//JnCxY7qGRkw7TSULVgqUB78TDM6rHWZVV6E3Q4tJFDqwD
 opW3elrNkH49/UNlFoRuSVpk540+EmWIAIIeJBbGrZEp3mbfXftLljockfWmmoT4NbczOPRuVipKX
 588mHSGJeOvIFXiNT18EDjFRs0B2DCrlgzRaime9WLMVPkTO/fU7uX8PI9irNom4lO2PPq9R+sEZM
 hlKEmVMDX0rzYXL9Z6NtWoTyx/fUY7noEl0fh3TnPQUp8+Bd4ey8qp4OJsP520wygnivoYOxJsxlG
 1mZwNa0TgruvR8q/mCAf02l/lmEaYkvUub4BHNeq7RHUA5A0EbOe3HT/Y0GmamyN3Yyw5UcEJBEj+
 K0nI20GbSklfffFjJTw7yJHI4ZzvfSNHE2CE8AZXaA6tm9VeaMyb/vd+LUgx3jBi8Wi93J3n+UnhM
 Xx6/t6t6GAmJ+Dd6AtzAJh/iqkNuBjd3knRcXNs94=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puInz-0003sV-UR; Wed, 03 May 2023 21:10:31 +0100
Message-ID: <f06b8aed-cfa0-adc3-f86e-833928c4b179@ilande.co.uk>
Date: Wed, 3 May 2023 21:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, atar4qemu@gmail.com, jcmvbkbc@gmail.com
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
 <20230502135741.1158035-8-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230502135741.1158035-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 7/9] target/sparc: Finish conversion to tcg_gen_qemu_{ld, 
 st}_*
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/05/2023 14:57, Richard Henderson wrote:

> Convert away from the old interface with the implicit
> MemOp argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 43 ++++++++++++++++++++++++++--------------
>   1 file changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 137bdc5159..bc71e44e66 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -5179,15 +5179,18 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                   switch (xop) {
>                   case 0x0:       /* ld, V9 lduw, load unsigned word */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld32u(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TEUL);
>                       break;
>                   case 0x1:       /* ldub, load unsigned byte */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld8u(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_UB);
>                       break;
>                   case 0x2:       /* lduh, load unsigned halfword */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld16u(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TEUW);
>                       break;
>                   case 0x3:       /* ldd, load double word */
>                       if (rd & 1)
> @@ -5197,7 +5200,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>   
>                           gen_address_mask(dc, cpu_addr);
>                           t64 = tcg_temp_new_i64();
> -                        tcg_gen_qemu_ld64(t64, cpu_addr, dc->mem_idx);
> +                        tcg_gen_qemu_ld_i64(t64, cpu_addr,
> +                                            dc->mem_idx, MO_TEUQ);
>                           tcg_gen_trunc_i64_tl(cpu_val, t64);
>                           tcg_gen_ext32u_tl(cpu_val, cpu_val);
>                           gen_store_gpr(dc, rd + 1, cpu_val);
> @@ -5208,11 +5212,12 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                       break;
>                   case 0x9:       /* ldsb, load signed byte */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld8s(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr, dc->mem_idx, MO_SB);
>                       break;
>                   case 0xa:       /* ldsh, load signed halfword */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld16s(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TESW);
>                       break;
>                   case 0xd:       /* ldstub */
>                       gen_ldstub(dc, cpu_val, cpu_addr, dc->mem_idx);
> @@ -5266,11 +5271,13 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>   #ifdef TARGET_SPARC64
>                   case 0x08: /* V9 ldsw */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld32s(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TESL);
>                       break;
>                   case 0x0b: /* V9 ldx */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_ld64(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_ld_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TEUQ);
>                       break;
>                   case 0x18: /* V9 ldswa */
>                       gen_ld_asi(dc, cpu_val, cpu_addr, insn, MO_TESL);
> @@ -5369,15 +5376,17 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                   switch (xop) {
>                   case 0x4: /* st, store word */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_st32(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TEUL);
>                       break;
>                   case 0x5: /* stb, store byte */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_st8(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr, dc->mem_idx, MO_UB);
>                       break;
>                   case 0x6: /* sth, store halfword */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_st16(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TEUW);
>                       break;
>                   case 0x7: /* std, store double word */
>                       if (rd & 1)
> @@ -5390,7 +5399,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                           lo = gen_load_gpr(dc, rd + 1);
>                           t64 = tcg_temp_new_i64();
>                           tcg_gen_concat_tl_i64(t64, lo, cpu_val);
> -                        tcg_gen_qemu_st64(t64, cpu_addr, dc->mem_idx);
> +                        tcg_gen_qemu_st_i64(t64, cpu_addr,
> +                                            dc->mem_idx, MO_TEUQ);

Should this be tcg_gen_qemu_st_tl() compared to the ones below? Or is there some 
extra tidying up whereby _st64() is converted to _st_tl() in a #defined 
TARGET_SPARC64 section?

>                       }
>                       break;
>   #if !defined(CONFIG_USER_ONLY) || defined(TARGET_SPARC64)
> @@ -5413,7 +5423,8 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>   #ifdef TARGET_SPARC64
>                   case 0x0e: /* V9 stx */
>                       gen_address_mask(dc, cpu_addr);
> -                    tcg_gen_qemu_st64(cpu_val, cpu_addr, dc->mem_idx);
> +                    tcg_gen_qemu_st_tl(cpu_val, cpu_addr,
> +                                       dc->mem_idx, MO_TEUQ);
>                       break;
>                   case 0x1e: /* V9 stxa */
>                       gen_st_asi(dc, cpu_val, cpu_addr, insn, MO_TEUQ);
> @@ -5438,11 +5449,13 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>   #ifdef TARGET_SPARC64
>                           gen_address_mask(dc, cpu_addr);
>                           if (rd == 1) {
> -                            tcg_gen_qemu_st64(cpu_fsr, cpu_addr, dc->mem_idx);
> +                            tcg_gen_qemu_st_tl(cpu_fsr, cpu_addr,
> +                                               dc->mem_idx, MO_TEUQ);
>                               break;
>                           }
>   #endif
> -                        tcg_gen_qemu_st32(cpu_fsr, cpu_addr, dc->mem_idx);
> +                        tcg_gen_qemu_st_tl(cpu_fsr, cpu_addr,
> +                                           dc->mem_idx, MO_TEUL);

Similar question here.

>                       }
>                       break;
>                   case 0x26:


ATB,

Mark.


