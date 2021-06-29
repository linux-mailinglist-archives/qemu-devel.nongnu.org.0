Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B53B7008
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:20:34 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9uz-0005D4-Qb
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9tW-00046B-UK
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:19:02 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9tR-0004rN-T8
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:19:02 -0400
Received: by mail-ed1-x52e.google.com with SMTP id q14so30307083eds.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nsOr2MXozNHoz+Hiw33l9S3kwMNr/89KFNrEdQQ9C7A=;
 b=IbTgaKbQK0gQV3/Jcfa4WoZ9Dlr2PSMFO18Th7TPLYhsvNVSMj5Z/YcUjKfzHPop43
 HkJigmVMTq5d2wjcvrPDXk/TLMAgA2izTxC1SWx1z4iAGee5Oq+mfwD897kTkOjBXSUS
 YsxJmHOSR4NHHEzzHmhgphLeu/pYfI5GLPgLEAMu/0PSseSRudS84oG6a+sIFueebSFg
 ZjzYfsSsX91kRnJzo3L0kea2E6zsT841LgflLXKjF27wwokAidkGgf8TqCyC5CATdF3I
 B9+ACtpR1ucoJb0ivZHlzftwiejEZWGgD3J5BDW/FppuKLbK7IodLjJRLQHCfzZUAh93
 cZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nsOr2MXozNHoz+Hiw33l9S3kwMNr/89KFNrEdQQ9C7A=;
 b=r+jJ15Vbe5BnSz6f7Ed0bxMgPCiQ58lD5l9nDIVQml08hwrhzUVV65AjiB4zQtd6M2
 4CuENSQmJyCrUP9yoCbGl79V7G19OTebii6H1MD4yde11MaOLTaSeiaWKAhc5YZ1I2Fo
 FV3mctvLM2aJUhfNLIOQ8yegb9/P6RUSxR8ebvRcNsgthz/fgYeCLB44gs1kEAxm+WhG
 R8r90HGI0S8eubKrSpieZAyG99/xTsbWozL0vqqKjroUAUMyK1b7ihOmDsvyd4JX8cCf
 5K1C2Lv2RykvN2nQE3t2YPgplaCYCoHX/vU78ReSvnuFXIuZhOpXQdfpZ/j77droJDsI
 VfXg==
X-Gm-Message-State: AOAM532xYlFpsufP1wwSeTkP1TjmX+OL6h61Rr4f9Z5zv7uITAdPrtSw
 zM1NAAUTfNPnME7B5edIAFsvWeBnlSQE+C/+7j4k5A==
X-Google-Smtp-Source: ABdhPJzF9UYJgeMoA64ycvZbRqlgs+lIfQCdQpqau9bE7e15uZ5RwCqMDMPLa8kYedWGpw5DmRBf793QPR0RxOzQEWg=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr38647008edz.36.1624958335161; 
 Tue, 29 Jun 2021 02:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-5-richard.henderson@linaro.org>
In-Reply-To: <20210628220810.2919600-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:18:18 +0100
Message-ID: <CAFEAcA8afYFgw4Dp45s8GSXrLJvZUXpbCjhwtATtTbkmxJ+ORg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] target/nios2: Add DisasContextBase to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 23:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Migrate the is_jmp, tb and singlestep_enabled fields from
> DisasContext into the base.  Use pc_first instead of tb->pc.
> Increment pc_next prior to decode, leaving the address of
> the current insn in dc->pc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 70 +++++++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
>

>
>      /* Indicate where the next block should start */
> -    switch (dc->is_jmp) {
> +    switch (dc->base.is_jmp) {
>      case DISAS_NEXT:
>      case DISAS_UPDATE:
>          /* Save the current PC back into the CPU register */
> -        tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
> +        tcg_gen_movi_tl(cpu_R[R_PC], dc->base.pc_next);
>          tcg_gen_exit_tb(NULL, 0);
>          break;
>
> @@ -883,15 +885,15 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>      gen_tb_end(tb, num_insns);
>
>      /* Mark instruction starts for the final generated instruction */
> -    tb->size = dc->pc - tb->pc;
> +    tb->size = dc->pc - dc->base.pc_first;

Shouldn't this one be "dc->base.pc_next - dc->base.pc_first" ?

>      tb->icount = num_insns;
>
>  #ifdef DEBUG_DISAS
>      if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
> -        && qemu_log_in_addr_range(tb->pc)) {
> +        && qemu_log_in_addr_range(dc->base.pc_first)) {
>          FILE *logfile = qemu_log_lock();
> -        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
> -        log_target_disas(cs, tb->pc, dc->pc - tb->pc);
> +        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
> +        log_target_disas(cs, tb->pc, dc->base.pc_next - dc->base.pc_first);

Here you could use tb->size for the 3rd argument (which
makes it clearer that the arguments are right -- we disassemble
the whole size of the TB starting at its first PC value).

>          qemu_log("\n");
>          qemu_log_unlock(logfile);
>      }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

