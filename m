Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F45513161
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:37:47 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1Ws-0004nX-RU
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk12d-0006H5-0A
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:06:31 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk12b-0002ti-Ha
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:06:30 -0400
Received: by mail-yb1-xb33.google.com with SMTP id w187so8112593ybe.2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MzkyQT+gL0SRzBfwVMvaDW2y8xk5bm/j+LxgF1JYX0=;
 b=P1GjDFeb0Dl948S6N1MnQJ0OMThHRsNDyz4/00cFuM3mtnEl/NnC/DLfP2hXQtuzd8
 tmuyzVaAqPrSH92sreAz44y1Ueyq4QmwJnEnGA2TfJk5gnvR2Rq1ZTfJZ/4HdcpqBX+C
 jTMfEkB8MkRqvNAct9LqCcPcskx5DRcafca9P+bBs0+doZF/+lC6ufXdygK02InWJGhe
 0/1qFTmgP95GAyz1IpNtwfMAIk04c1jFneoNAAOCuaBnbBFidDygRyje0jF8n45IUeas
 i3EDnTwUpmoFaKRpcuCZumUBCq9FEvSno2sgajrJOvjDbuZiUUdJ1/EgWYHFzpmFN3at
 rRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MzkyQT+gL0SRzBfwVMvaDW2y8xk5bm/j+LxgF1JYX0=;
 b=mfm1QdUxm4aNHZnbeZHVDhOIyMS8HazInFb6xCrQmcUx8Y5+9dbon8vapdyyH2M2Ke
 WyIJVlLwjYCQepV85q/4nDP6oD+oYvX8T0G36YGuI+84Hy3DuMMrkZ5TbMIBGRsugG+C
 h3kb0R84gz5a6dcEz+gRSuzAHNgBzBYBZqfrNU8KhVEM20w5HoyK6u+tM36FuLHaLsc2
 2qPkGUOn0JqqlkWLFrALarzUvRe3qWTG9X/BZQzlQRUR6HohE1XdbcmcUkVl8i2MMmum
 pMJQpTs/auqQKnupSQ5FMsaAZ1zboLXhXGsiNnDxTcU0E3Nn7OW1NS3kUOW3IWNX4+E/
 Copg==
X-Gm-Message-State: AOAM533tyVlTwby/l9cCzuf+I0hkTI5J30m7wr3Q5TQIdT7DbgcIffvv
 4H6W3b9GaR7eF0i9WD1Gg2rZoTV+cpDbTYTS/aIGqPSaiGA=
X-Google-Smtp-Source: ABdhPJwV9l4u+S/SN8lMkRIYvDvRAP1MT6qrymLabVnaEl14KzGNNXNqF7l8DN4luQXnoVv7o4fTWeEG0YQPMmx3lZ4=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr19942211ybk.479.1651140388381; Thu, 28
 Apr 2022 03:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-18-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:06:17 +0100
Message-ID: <CAFEAcA9Uz98h8v7ARw-8ZmeZD==+=ntPtMhxgq7Php6a_pUhOg@mail.gmail.com>
Subject: Re: [PATCH 17/47] target/arm: Use tcg_constant in disas_fp*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)

> @@ -6052,7 +6049,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
>  static void disas_fp_csel(DisasContext *s, uint32_t insn)
>  {
>      unsigned int mos, type, rm, cond, rn, rd;
> -    TCGv_i64 t_true, t_false, t_zero;
> +    TCGv_i64 t_true, t_false;
>      DisasCompare64 c;
>      MemOp sz;
>
> @@ -6097,10 +6094,8 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
>      read_vec_element(s, t_false, rm, 0, sz);
>
>      a64_test_cc(&c, cond);
> -    t_zero = tcg_const_i64(0);
> -    tcg_gen_movcond_i64(c.cond, t_true, c.value, t_zero, t_true, t_false);
> -    tcg_temp_free_i64(t_zero);
> -    tcg_temp_free_i64(t_false);
> +    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
> +                        t_true, t_false);
>      a64_free_cc(&c);
>
>      /* Note that sregs & hregs write back zeros to the high bits,

This incorrectly drops the free of t_false, which isn't a
tcg_constant_*.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

