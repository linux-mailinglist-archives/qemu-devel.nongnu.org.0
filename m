Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890623B65CD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:36:08 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtIt-0001Qg-HF
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtFH-0005d8-Gv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:32:24 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtFF-0003WD-3l
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:32:23 -0400
Received: by mail-ed1-x534.google.com with SMTP id s15so26477763edt.13
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u/EFM1ifKJ6/7lkNFrvBoaY9vpYJkJsn/dEe3lHZRSs=;
 b=GQBTauioEzwmieqE4ymsFzOrTGJADU3EheIkwHd0kbxzafFg90kaXgbzAwwaL9FERM
 GZd9SFIAcHV6eaD59pdh98CV6oUPbvFaluMl8g8TH2e6RZhgAbcg2St28nVXcQ4qoZIi
 0h/GaQktuTHnFLFwQiVZ6TVunCcermz9Y+yth+cVfKPHaW9ICCF1d6DsUT8x+2sgv1Ec
 Afg2kTtlcHuM7aRW/gGNNe7WGojggRQcwhi4uLlCxDPbhlwrKQ/JMcSpEozyHUAASg42
 KJDC+72UmSgFPA/3goNEsAeFlIg6mBRHMdIoScJ5SlgoQ66heKK8n9kY9+HqE2yrt1iJ
 PypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u/EFM1ifKJ6/7lkNFrvBoaY9vpYJkJsn/dEe3lHZRSs=;
 b=TCT6xaHtWEckfhGkWUw3qm6skWdXd0bxUKsGjR3FWgzSZfu76S24ZqjPU2pWcKZOpi
 S7jZ8/U38hUFQ6KQAb4/q1r3xHP05pZY5/i2/9fMserQOEkKkMjd7mummqd2xBk9BnoN
 lMLT9xSFUqvMFCvXZxVdOZzEl4U03BlecWx7rYEdYQGPonH7hORNMBiVMDLm94xemdLo
 lVWUVjnM+aWMWSCPmuvIJ33QHzMSTYo4bdvb4ePsQOSF+muBh45k6ID7K5ZDGLu9o0uZ
 oZkjlU5d5R2/ypIkJoB8QfeYU7qMLoLfhOkIdxl5bcHRJRMl0udfzmlbvVRACsCezYVg
 UXFw==
X-Gm-Message-State: AOAM531zQmnPuxK096YVlJHv+rfEoLnJXW9eidXK1sp2i535eFq8vN0I
 MvZo1EyuiZo9j/UGSShee9+Wpg13iEUzB5BzcuPwiA==
X-Google-Smtp-Source: ABdhPJzD63qePFhPRkRGvgZTf8nfZScz/AYINsj9Z30p1+OVzKsLu+AHv743bM65StXVCNsig4QecpWcq2SrndkxW88=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr33350203edr.204.1624894339070; 
 Mon, 28 Jun 2021 08:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-7-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:31:42 +0100
Message-ID: <CAFEAcA-9h+vUQWR2GxZQZk+O_cE+-gyoKi3XeY1=VaTsTJXh_g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] target/nios2: Remove assignment to env in
 handle_instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Sun, 20 Jun 2021 at 23:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Direct assignments to env during translation do not work.
>
> As it happens, the only way we can get here is if env->pc
> is already set to dc->pc.

More to the point, t_gen_helper_raise_exception() does
    tcg_gen_movi_tl(dc->cpu_R[R_PC], dc->pc);
before raising the exception (as you would expect it to).

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 06705c894d..31f63d9faa 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -740,14 +740,15 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
>      uint32_t code;
>      uint8_t op;
>      const Nios2Instruction *instr;
> +
>  #if defined(CONFIG_USER_ONLY)
>      /* FIXME: Is this needed ? */
>      if (dc->pc >= 0x1000 && dc->pc < 0x2000) {
> -        env->regs[R_PC] = dc->pc;
>          t_gen_helper_raise_exception(dc, 0xaa);
>          return;
>      }
>  #endif
> +
>      code = cpu_ldl_code(env, dc->pc);
>      op = get_opcode(code);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
but you probably want to tweak the commit message.

thanks
-- PMM

