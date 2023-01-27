Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829667EF9C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVSI-0007mz-Uj; Fri, 27 Jan 2023 15:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pLUJ0-0000qT-Bh
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 14:22:34 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pLUIy-0004FC-Nb
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 14:22:34 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ud5so16397073ejc.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 11:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EEW8adIjusI0mjfhcKGlDH91Eq8RVGkbtAfe/wtsKHc=;
 b=nNfaTDQyjcanHhIQVJCb1OkMVraoEGlUnqq12R8r43SzNbTGuSnPYoez0EOYPiPwJO
 fHaYz/yWenbqpitMlwGDsA4FqpTmHVAmJWqLD+BxgKtADizZ8pysPcDHY+ykqs7cyzgZ
 IXYyaV/GbxFB5aFoCP+JuM10ozDyE7ccGJm3z95/eNpgkyN6ZzHNEQ18cmnWNfPTi8k/
 GW2/lkA6iWb9p45/jknXvqhIgTpK9QZ1aid7AhSNR1MXqARtQEWxIFlLkgH4iK4cvYlm
 jDUMgTLbFon68TGD81hrPDCAOWbef2+TiTk1aMuqWyy7I1h5JqYxX7oVZZtUfZiCVKzL
 PzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEW8adIjusI0mjfhcKGlDH91Eq8RVGkbtAfe/wtsKHc=;
 b=i7Wm8khZN+pU6wgxUCRIUXoHrRk8PUWQ6Dn8sRR7OrT6+B2OncHPcCJQ8yNtDyFZwa
 qnmdXFq9EuE7o5RzuNmU1obT4f5gHAxRHatwBosMMBBEqhsPbHXNYyYQ77gskFuhYeJq
 xAHh7wuxxS+s+JOLVwjrKtpLAUzCHRstfynjQdXPtNc32qdjB9Rt4ad8Yq9yDXDGRR3e
 xb2lVr26d/NDYvoCXY3BsIdP6hHwAIrMl2MmyV992Q7wH0/lXzRQdheHgku6j+/jP9Gl
 L+5RqiVyLg9B8HiQmr4vELsQuvXhcoImmu651sqWGVBmqvUI7qx5PwihENfKQ5U862LI
 2tIA==
X-Gm-Message-State: AFqh2komDCDF/N9nCwUD2uy55ZQb3BQ0po0iqvHzgwjPFxWoNDtSslFf
 b8kHe7+uWfc1PLulD3U4xul6TOBKkAGu8eqjcFdZpout6G62wHFB
X-Google-Smtp-Source: AMrXdXu7bzMEIs8UKhot4gTrjwW3odRuvGGxQ8kYBC64qhH9mgvuVoUdLvvdIRqsL/4D5n33FPbU8soYu4u8NNOJra8=
X-Received: by 2002:a17:907:9392:b0:870:5467:3bce with SMTP id
 cm18-20020a170907939200b0087054673bcemr7431292ejc.283.1674847349796; Fri, 27
 Jan 2023 11:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20230127191758.755844-1-debug@rivosinc.com>
In-Reply-To: <20230127191758.755844-1-debug@rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Sat, 28 Jan 2023 00:52:18 +0530
Message-ID: <CAKC1njS_wY2J7d-BDMZA9O0eOnxd0xqCU=ns+DJ8B-W9e5PowA@mail.gmail.com>
Subject: Re: [PATCH: fix for virt instr exception] target/riscv: fix for
 virtual instr exception
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Jan 2023 15:36:12 -0500
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

Please dis-regard this.
I've sent the patch to qemu-riscv@nongnu.org

On Sat, Jan 28, 2023 at 12:48 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> commit fb3f3730e4 added mechanism to generate virtual instruction
> exception during instruction decode when virt is enabled.
>
> However in some situations, illegal instruction exception can be raised
> due to state of CPU. One such situation is implementing branch tracking.
> [1] An indirect branch if doesn't land on a landing pad instruction, then
> cpu must raise an illegal instruction exception.
> Implementation would raise such expcetion due to missing landing pad inst
> and not due to decode. Thus DisasContext must have `virt_inst_excp`
> initialized to false during DisasContxt initialization for TB.
>
> [1] - https://github.com/riscv/riscv-cfi
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  target/riscv/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..76f61a39d3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>      ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero = tcg_constant_tl(0);
> +    ctx->virt_inst_excp = false;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.25.1
>

