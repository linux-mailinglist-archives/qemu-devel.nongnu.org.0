Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1323B700E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:24:22 +0200 (CEST)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9yf-0002gh-44
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9xO-0000vb-7G
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:23:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9xL-0008DT-SZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:23:01 -0400
Received: by mail-ej1-x634.google.com with SMTP id c17so9268544ejk.13
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkD0e2YEAT95Cjyl9n43QyHjoKQfb0wrYLLLMV/WAmE=;
 b=aYaucxJzMpcOG7Jyk2R0JlLVDWdMpyuXfeAh6nu5cRxWoRpkZih7Pm/bvWtBHggdKF
 u0dZlDJD3PCF51IE0XwoR+9ASRWSN4OfWwCTGW8MhP783sVtxC3NFj7G721GyTzRhSkd
 sGq3xYr1KUfJJGksf98bwufs2EUEc0RPKBnZy/6WDtlM6lmDtTbYOlclsRCTKkIG5Qsn
 xfyArNvHSY0wdJMzkWhHMcO29nkR6LTF6vtIUmzhOQnQ/Fh1QBIol4h/Fhs+pCZ0LA3h
 4gGmky6imUzJtEmqu/3/i0W0vKGNoqU/uf96lbs5mKXRhjycBDbI5xEovIViZLYt0tSI
 m9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkD0e2YEAT95Cjyl9n43QyHjoKQfb0wrYLLLMV/WAmE=;
 b=VpPHb23BvwAIxa7XcR2RMbE7uUWAY3CiCld/RaDWdchyb1gaptBzrl6oKoOn0tWG+k
 MR4E9S5S8U+aXkTvk8cSiPpn0G2gwZO5cm/zfO3DJptbxC1Mn02y1/2HMUaF8gdXK1Jr
 EL/5B0LJDVwUFHoXdlPnSUQC/I82pBbOYVpCXCcN1z/oyU+eLkf0fT8U4BrT5KBmd6OV
 Iqu8p8xNEEcsB6FZHrMw6odrq1dSBht4PEUtHCK5thPvGEctGZO1gddowKoq57nrkv4A
 ZGfnfC4jE7C4aqB1H+0X0Kw/db3WO51U+5M4R1RidPglqje9zRdxulO8oE0kHQ4p7BCp
 LMOQ==
X-Gm-Message-State: AOAM5330Kb5KoE8oRvHiu5d2Tj6AE7bnoYbDEHgDM0W1qZZrrGWnJObw
 El895rL/7tCo+UWzcE6rMXC6viYIihZie+ChT+ryYg==
X-Google-Smtp-Source: ABdhPJw7WetbElqAz+IcNCXHJxpC4NSV3qxc0htAfzhe+kUuNJ0x4QS9QmGZVrHF2JfFN+E3YdJ1n+4QGTm2YbN8ABU=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr29497528ejb.56.1624958577717; 
 Tue, 29 Jun 2021 02:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-7-richard.henderson@linaro.org>
In-Reply-To: <20210628220810.2919600-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:22:20 +0100
Message-ID: <CAFEAcA-7MCfCHwBjPmQw5B5z5cBv4vSYJ3=7KKtx26tSXpPeMw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] target/nios2: Remove assignment to env in
 handle_instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Mon, 28 Jun 2021 at 23:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Direct assignments to env during translation do not work.
>
> As it happens, the only way we can get here is if env->pc
> is already set to dc->pc.  We will trap on the first insn
> we execute anywhere on the page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 66f4c25b06..6fd4330b31 100644
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

