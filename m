Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD04A4059CA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 16:55:58 +0200 (CEST)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLT3-0004o4-EH
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 10:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLRe-0003Oc-Ol
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:54:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLRd-0004AW-9B
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 10:54:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v10so2988015wrd.4
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s37qy3pJpQotWQ5W3EedXxPZF2ZNAy2RUSXNbX8p3ks=;
 b=wnt2bYof7vY3gxi1ot3asNzLf+CiiLZSgmWzrORXlQEyFLQvSb/TFTbqqpRHkWJOxx
 WdWzsl1AJDe6aP+DnuByGY3fdi2pbYrl3rFfBLoIuLvF8nQ/i6VYU5vFwNr14LSBI95u
 tI2Gro59FXxsypZ2vzy7+uvyUBsL9eR0pne88f4W7X1oLGh9MBx3Vv1v5JnuTYbmV8lG
 IweJz2hQHoZmoa+PAEMi450R22hWYHCuvGWfnM0NQtN9+A+7AXduudOZJzprMg5NVrsS
 pR13+iotPdS9D4TAMKd9J+VSr9XFL+vn6xZBvg/jn2yEn1m++rF+guwp6sZJqV0irmN6
 uKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s37qy3pJpQotWQ5W3EedXxPZF2ZNAy2RUSXNbX8p3ks=;
 b=Qm2F7rVyAXtUN/BjSJMaRv+QA7bCBAG9ct7frMo4bRhGG/I/NgK+B+mgLlRkhEhrE9
 QoXr//IfHMX3GvaazIhO6G+3ZFn1qBoCkFPBTgH3gaSIFaR56EpphJOt3bMSubwUtV5j
 MP42rkrf8c7e3Tl0fDa3dtbEwMnAvxyh0rhjaijBNsrl3fCeNo9YTIMARppNqRe0VrdL
 9IlQrUYsbHbKIhGRnQAL71Lp0Ow8yqHvJz27arQ4NOk54cAzuwq6fqj7/5CvA2ibv+s9
 GUobog+8MPPlI/FGHNOCqnxzy2NnLOqhYkE63n62w9UMfO9ZqIlh48fRoJ0H1E0gdSx/
 KiLw==
X-Gm-Message-State: AOAM53294Gc9OcdFCYRy9PYMemdPr0BdEPXV1d6D0QQRb1ZVTFRTGKBF
 pj/ixqoWbJixVpHVMam4sQC3a4Rc8ioKfIX+aKA3xA==
X-Google-Smtp-Source: ABdhPJw1Of+eGtdYj4QkYIuBPO/dZ3msvYZ3HyhrJFWcJ0coHMhO6cBXHCeblFSyMbhg+0JmFah/yAGiqj1SfjFaz70=
X-Received: by 2002:a5d:4b4b:: with SMTP id w11mr993152wrs.302.1631199267201; 
 Thu, 09 Sep 2021 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
In-Reply-To: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 15:53:37 +0100
Message-ID: <CAFEAcA-k-6hLBXn+7S_WH3w2QHwXad5H6L_iSLYK+9dQxHvTxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 14:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/2/21 5:09 PM, Peter Maydell wrote:
> > Our current codegen for MVE always calls out to helper functions,
> > because some byte lanes might be predicated. The common case is
> > that in fact there is no predication active and all lanes should
> > be updated together, so we can produce better code by detecting
> > that and using the TCG generic vector infrastructure.
> >
> > Add a TB flag that is set when we can guarantee that there
> > is no active MVE predication, and a bool in the DisasContext.
> > Subsequent patches will use this flag to generate improved
> > code for some instructions.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Another of those awkward-to-review patches where the interesting
> > question is "did I miss anywhere where we set v7m.vpr to non-0
> > or v7m.ltpsize to non-4 while in the middle of a TB ?" ...
> >
> > I've left the TB flag as non-cached because there seemed to
> > be an irritatingly large set of places where we'd have to do
> > an hflags recomputation.
>
> Indeed, non-cached seems like the right option.
>
> > +static bool mve_no_predication(CPUARMState *env)
> > +{
> > +    /*
> > +     * Return true if there is definitely no predication of MVE
> > +     * instructions for any reason. (Returning false even if there
> > +     * isn't any predication is OK; generated code will just be
> > +     * a little worse.)
> > +     * We do not account here for partial insn execution due to
> > +     * ECI bits as those are already in the TB flags elsewhere.
> > +     */
>
> I think you should go ahead and include that here, as it makes the test self-contained,
> and avoids you having to do this:
>
> > +        dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED) && dc->eci == 0;

I found a reason why these should stay split, and it's related to the
discussion in this thread about TB flags whose state changes and whether
that means you need to end the TB. The TB flag state in the CONDEXEC bits
(ie including the ECI bits) changes for a lot of instructions, but we don't
need to end the TB because it always changes in the exact same way
regardless. A TB flag encoding just "MVE predication might happen
due to LTPSIZE and VPR" changes in only a few places, and we can end
the TB in those places. A single TB flag that mixes together all of
LTPSIZE, VPR and ECI can change state in a hard-to-disentangle way,
because a non-zero ECI can change to zero for just about any MVE insn.

If we keep MVE_NO_PRED and ECI distinct, then we don't need to consider
ECI updates when figuring out if we need to end the TB, which works out neater.

thanks
-- PMM

