Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAEC39DE18
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:53:05 +0200 (CEST)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFgf-0004XZ-2E
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqFfm-0003h8-SP
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:52:10 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqFfk-0000Dl-FU
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:52:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id l1so26805583ejb.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+TDBhkBq5qPqD65EoTuXDFW2B8QqnPLsAWxNaV4SBbs=;
 b=mxlAKnntmKROJexHMz+68i/qcuqIBgE3RWGCMaR7GXwWGnvI88J/+9Q7cyzFz7AiCs
 t8XFBqGbQhSchRgGQe5l4lS+vUYYnKntocsRM+V5Y6FZK0itEl0DFIWejY5/17yfSsA8
 TFrmrfeLbf4hMrzZcP0qEyL8mIFiSEtngU1Hui/7sOCdjlWPBlZS04yJuYrePo3KGg9U
 my48M+/X8vxpvnF8/KPdY5kr+1P+GIyXVbJQbfJ1PgnE9pOCUfsuAkct2Cuf2n0wsuCe
 o7aNC7lUbKu+BwO2Vlw3Ex9HOfLvbh1lTxgmKi6deUKv8vUVVux5CyshLwcQmddIMsPp
 6Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TDBhkBq5qPqD65EoTuXDFW2B8QqnPLsAWxNaV4SBbs=;
 b=rJbU/6nUzqg6O0drgBXMs93fuVJqSSKL11AAt1Oe5D0YIvUvXrDYgler+NKKSB8nDn
 3Dw1ZQVYDZwDi3tNba0x49coa4ln/y7+Xqm/s9M7WQU96vEgzjcZfHXANDLsbzMfGS9d
 s3LyD7nyxZnHTqy7aHfovsHHz/0+LEV5qXoEBSUzM+oO7canlTFYbiTX+u6PEsuIqQL5
 ELPD1ARKQtQH46MxLezaowahl7rit0qDgu9ws+mb3RHxms2a8c/UZXJ829cQ1aXrWNAV
 f3kcnFO5csysZNFMjlSodFi6PE4BzxR6YXlGynfVBtbetHbWNIOYG9q4LZsRe4f7ewwd
 QLIQ==
X-Gm-Message-State: AOAM531HK57E11PWUdlrA1Axh8+hmLKpaaQycLY1s3f/EoRSK0hY0oSR
 yZqtF7fiKU7veA61Tcw2CjDqM4YhOp/IMe5Qltdqc49Xruw=
X-Google-Smtp-Source: ABdhPJyr6tU00tPGWYMRBgsaUuaHkzWwmBkR6zByS3ocp57UWRF54avk1PTy0dhbDU3fImZkXHPe4Tvbk84uMz8B8RU=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr17663787ejz.382.1623073926747; 
 Mon, 07 Jun 2021 06:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210604212747.959028-1-richard.henderson@linaro.org>
In-Reply-To: <20210604212747.959028-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Jun 2021 14:51:33 +0100
Message-ID: <CAFEAcA-EFkuWb8aHhiiN7Wu9n302A8hdoHUzn7txOVhEyOX=Fg@mail.gmail.com>
Subject: Re: [PATCH] tcg: Introduce tcg_remove_ops_after
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 22:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce a function to remove everything emitted
> since a given point.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h |  1 +
>  tcg/tcg.c         | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 74cb345308..6895246fab 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -1081,6 +1081,7 @@ TCGOp *tcg_emit_op(TCGOpcode opc);
>  void tcg_op_remove(TCGContext *s, TCGOp *op);
>  TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op, TCGOpcode opc);
>  TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
> +void tcg_remove_ops_after(TCGOp *op);

A doc comment would be nice.

>  void tcg_optimize(TCGContext *s);
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 0dc271aac9..262dbba1fd 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2649,6 +2649,19 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
>  #endif
>  }
>
> +void tcg_remove_ops_after(TCGOp *op)
> +{
> +    TCGContext *s = tcg_ctx;
> +
> +    while (true) {
> +        TCGOp *last = tcg_last_op();
> +        if (last == op) {
> +            return;
> +        }
> +        tcg_op_remove(s, last);
> +    }
> +}

This looks OK as far as TCG proper goes, but is it going to confuse
the TCG plugin infrastructure if a frontend generates a bunch of
TCG IR and then winds back the insn stream and generates something
else instead ? I see some calls from tcg/ into plugin related
functions, so I'm not sure...

thanks
-- PMM

