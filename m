Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0716582803
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:54:14 +0200 (CEST)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhUL-00007g-Ef
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oGhPa-0004ht-Tb; Wed, 27 Jul 2022 09:49:19 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:45796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oGhPY-0005p6-AE; Wed, 27 Jul 2022 09:49:18 -0400
Received: by mail-oi1-x232.google.com with SMTP id u9so20842830oiv.12;
 Wed, 27 Jul 2022 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eV4aT0KDcgPkGv8AxRlSLrEjWDXsz7awevJBjh/3GRQ=;
 b=iKUaMMtQOc3RXOUIBBc7gBp1kqH8GkW0RlrgIcNuTqW8un5n8WvbnZ9SNvwygKdAck
 TSr1HhGyRXmvYQJtAsd2ZFOjSLXJiEoTNay54/X5301amCgN3vvLba/LjHpEvwYwU/hc
 XS/FjXc3zuTCsxmgInay2CqrXdqztObJ/aF2rGsfKNN/+HxiBnf5cS3pRReIoHX4UwiC
 Mz3lNjcmsC3SI/LlEvW0G8bfNtEu4HcGUTKyTkrQxnaHb0wek5PU1LvnN0zgviOib24J
 tyiD226rv2AaVEzFHfoYccnAvJm8P3aozBZErLIbP3RLl3gAtNLXDFbAH6oFEecfSWdb
 54EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eV4aT0KDcgPkGv8AxRlSLrEjWDXsz7awevJBjh/3GRQ=;
 b=cuKFDFwxcN04nFjkcH0brrmnMI9U57M+Y656DzAbZyrVW+rg6AvoyaAokKYde0t2ju
 X9z2O2m3HUd1hb8CRiXyez4jyytgyBOpsh+L6iqc8AjfTflE2YPNuHjJ2O7+w/CmpqqO
 8x9d228cpcdF4cp5WKekZDBDHNZPUNC0lyLlureXUN/whknq39X0wyv0h2wYb+WRRPp0
 INiq93pD7On22y00/21GFH2x/+3ZfBWkUUoRz2UmM/vPw+OyenznFQ7XKyMwjySriXNf
 aWl5OB+Kql5wk1Iy1V4zB2Yeq1DTPL6qoduJMR7Ei7D4nTqpADtdc4Fdf9Tb6VsoksUE
 8iNw==
X-Gm-Message-State: AJIora9oN9B8iBNdBjxRJ7nhCv3JOy+X1l6q1v11FWaa4NFoH3rHdA2j
 2aMT6slvGNzcBPdj367mY4g=
X-Google-Smtp-Source: AGRyM1vsBXTGpjhuxV7SrjQm/HkiMTEup67qKMbX31XGDqPgpcqQFYYXhkA3Nahsqc6v0kbUymhS0Q==
X-Received: by 2002:aca:e0d7:0:b0:33a:afba:2cd7 with SMTP id
 x206-20020acae0d7000000b0033aafba2cd7mr1836565oig.81.1658929754230; 
 Wed, 27 Jul 2022 06:49:14 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:1396:b354:ef67:bd69:305a?
 ([2804:431:c7c7:1396:b354:ef67:bd69:305a])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a4aca07000000b0041ba304546csm7256305ooq.1.2022.07.27.06.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 06:49:13 -0700 (PDT)
Message-ID: <5df2f253-7b74-1553-348c-370b78876c33@gmail.com>
Date: Wed, 27 Jul 2022 10:49:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] target/ppc: Implement new wait variants
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?V=c3=adctor_Colombo?=
 <victor.colombo@eldorado.org.br>
References: <20220720133352.904263-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220720133352.904263-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/22 10:33, Nicholas Piggin wrote:
> ISA v2.06 adds new variations of wait, specified by the WC field. These
> are not all compatible with the prior wait implementation, because they
> add additional conditions that cause the processor to resume, which can
> cause software to hang or run very slowly.

So I suppose this is not a new feature, but a bug fix to remediate these hangs
cause by the incompatibility of the WC field  with other ISA versions. Is
that right?

I'm explicitly asking for it because if it's a bug fix it's ok to pick it
during the freeze. Especially here, given that what you're doing is mostly
adding no-ops for conditions that we're not covering.

> 
> ISA v3.0 changed the wait opcode and removed the new variants (retaining
> the WC field but making non-zero values reserved).
> 
> ISA v3.1 added new WC values to the new wait opcode, and added a PL
> field.
> 
> This implements the new wait encoding and supports WC variants with
> no-op implementations, which provides basic correctness as explained in
> comments.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> v3:
> - Add EXTRACT_HELPERs
> - Reserved fields should be ignored, not trap.
> - v3.1 defines special case of reserved PL values being treated as
>    a no-op when WC=2.
> - Change code organization to (hopefully) be easier to follow each
>    ISA / variation.
> - Tested old wait variant with Linux e6500 boot and verify that
>    gen_wait is called and takes the expected path.
> 
> Thanks,
> Nick
> 
>   target/ppc/internal.h  |  3 ++
>   target/ppc/translate.c | 96 ++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 91 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 2add128cd1..57c0a42a6b 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -168,6 +168,9 @@ EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
>   /* darn */
>   EXTRACT_HELPER(L, 16, 2);
>   #endif
> +/* wait */
> +EXTRACT_HELPER(WC, 21, 2);
> +EXTRACT_HELPER(PL, 16, 2);
>   
>   /***                            Jump target decoding                       ***/
>   /* Immediate address */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 1d6daa4608..e0a835ac90 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4066,12 +4066,91 @@ static void gen_sync(DisasContext *ctx)
>   /* wait */
>   static void gen_wait(DisasContext *ctx)
>   {
> -    TCGv_i32 t0 = tcg_const_i32(1);
> -    tcg_gen_st_i32(t0, cpu_env,
> -                   -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
> -    tcg_temp_free_i32(t0);
> -    /* Stop translation, as the CPU is supposed to sleep from now */
> -    gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> +    uint32_t wc;
> +
> +    if (ctx->insns_flags & PPC_WAIT) {
> +        /* v2.03-v2.07 define an older incompatible 'wait' encoding. */
> +
> +        if (ctx->insns_flags2 & PPC2_PM_ISA206) {
> +            /* v2.06 introduced the WC field. WC > 0 may be treated as no-op. */
> +            wc = WC(ctx->opcode);
> +        } else {
> +            wc = 0;
> +        }
> +
> +    } else if (ctx->insns_flags2 & PPC2_ISA300) {
> +        /* v3.0 defines a new 'wait' encoding. */
> +        wc = WC(ctx->opcode);


The ISA seems to indicate that WC=3 is always reserved in both ISA300 and
ISA310. I believe you can check for WC=3 and gen_invalid() return right
off the bat at this point.


Thanks,


Daniel



> +        if (ctx->insns_flags2 & PPC2_ISA310) {
> +            uint32_t pl = PL(ctx->opcode);
> +
> +            /* WC 1,2 may be treated as no-op. WC 3 is reserved. */
> +            if (wc == 3) {
> +                gen_invalid(ctx);
> +                return;
> +            }
> +
> +            /* PL 1-3 are reserved. If WC=2 then the insn is treated as noop. */
> +            if (pl > 0 && wc != 2) {
> +                gen_invalid(ctx);
> +                return;
> +            }
> +
> +        } else { /* ISA300 */
> +            /* WC 1-3 are reserved */
> +            if (wc > 0) {
> +                gen_invalid(ctx);
> +                return;
> +            }
> +        }
> +
> +    } else {
> +        warn_report("wait instruction decoded with wrong ISA flags.");
> +        gen_invalid(ctx);
> +        return;
> +    }
> +
> +    /*
> +     * wait without WC field or with WC=0 waits for an exception / interrupt
> +     * to occur.
> +     */
> +    if (wc == 0) {
> +        TCGv_i32 t0 = tcg_const_i32(1);
> +        tcg_gen_st_i32(t0, cpu_env,
> +                       -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
> +        tcg_temp_free_i32(t0);
> +        /* Stop translation, as the CPU is supposed to sleep from now */
> +        gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
> +    }
> +
> +    /*
> +     * Other wait types must not just wait until an exception occurs because
> +     * ignoring their other wake-up conditions could cause a hang.
> +     *
> +     * For v2.06 and 2.07, wc=1,2,3 are architected but may be implemented as
> +     * no-ops.
> +     *
> +     * wc=1 and wc=3 explicitly allow the instruction to be treated as a no-op.
> +     *
> +     * wc=2 waits for an implementation-specific condition, such could be
> +     * always true, so it can be implemented as a no-op.
> +     *
> +     * For v3.1, wc=1,2 are architected but may be implemented as no-ops.
> +     *
> +     * wc=1 (waitrsv) waits for an exception or a reservation to be lost.
> +     * Reservation-loss may have implementation-specific conditions, so it
> +     * can be implemented as a no-op.
> +     *
> +     * wc=2 waits for an exception or an amount of time to pass. This
> +     * amount is implementation-specific so it can be implemented as a
> +     * no-op.
> +     *
> +     * ISA v3.1 allows for execution to resume "in the rare case of
> +     * an implementation-dependent event", so in any case software must
> +     * not depend on the architected resumption condition to become
> +     * true, so no-op implementations should be architecturally correct
> +     * (if suboptimal).
> +     */
>   }
>   
>   #if defined(TARGET_PPC64)
> @@ -6852,8 +6931,9 @@ GEN_HANDLER2(stdcx_, "stdcx.", 0x1F, 0x16, 0x06, 0x00000000, PPC_64B),
>   GEN_HANDLER_E(stqcx_, 0x1F, 0x16, 0x05, 0, PPC_NONE, PPC2_LSQ_ISA207),
>   #endif
>   GEN_HANDLER(sync, 0x1F, 0x16, 0x12, 0x039FF801, PPC_MEM_SYNC),
> -GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x03FFF801, PPC_WAIT),
> -GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039FF801, PPC_NONE, PPC2_ISA300),
> +/* ISA v3.0 changed the extended opcode from 62 to 30 */
> +GEN_HANDLER(wait, 0x1F, 0x1E, 0x01, 0x039FF801, PPC_WAIT),
> +GEN_HANDLER_E(wait, 0x1F, 0x1E, 0x00, 0x039CF801, PPC_NONE, PPC2_ISA300),
>   GEN_HANDLER(b, 0x12, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
>   GEN_HANDLER(bc, 0x10, 0xFF, 0xFF, 0x00000000, PPC_FLOW),
>   GEN_HANDLER(bcctr, 0x13, 0x10, 0x10, 0x00000000, PPC_FLOW),

