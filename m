Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C07E3141E6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:34:36 +0100 (CET)
Received: from localhost ([::1]:43254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EB0-00012y-S2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Aa5-0000Sw-U6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:44:13 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AZx-0007nn-NN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:44:13 -0500
Received: by mail-ed1-x531.google.com with SMTP id c6so19520954ede.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86SXquzZ2n5uqLm3OZjLFku3Fa48aY+clsQOqJVpbGc=;
 b=gN1s0q/tijlnlTGIWB0kO68wN80VxbmFwYLxYIi42PgCzjsAMrMdOuorVf3F49ETef
 KGjJu/mDXmqN0b4OkY5/1fxgHg5NQ1x51dR8saeXtUK9t8WhvhKmp81X16BKN9P/wpwO
 uiuzaWtkHMNf/dRXyiVnPb9KfAyc9pWowZOlSNThSxLZCaRucyA4b0jE420n53zqymXu
 hmi5iPrfsCi2TrMAuL0MNp3Z+Ufj6Kgq8cHMQfqR9B/1W31wBT0nDg9DjPAXGDMCJY3q
 jzqTfk20v9khaeZNPZ26Ke3SLp75ddvyRs82VuWL3DP10x7omQIvgjjifsjB81K8GpwR
 6BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86SXquzZ2n5uqLm3OZjLFku3Fa48aY+clsQOqJVpbGc=;
 b=VMRiiRNewtA1gleGPn4z67BkyZXva2Uhzdr4GnWpqDcxJLPq1GhY985BDY9yfKqdVs
 CCygX16xWGj87z2tbViXcgw16L7/st/iNQBEgB/LzEu/hOsENMeO21lvHGRh6RaaL12C
 fppiDBWuaimTWFiQHkBFIsmH83Rky/l/8KI1z0heo4Iop7n1hHtqrBKgSWn8RloBVvre
 GuJcPEK2fS2VMmUGMXk8fXGCu0+gR3IkGGEy3xV3UyrMD+9EA72hxsErhLM06YDUNkhy
 vlahPqaw/Xsij47lh4Jsa+8gWSij9vuUfxi1Gzv39rbaxuS71VgpYFdUOzdI7dMo0XM0
 HXzg==
X-Gm-Message-State: AOAM532dREKFPx4nh3IGdf/t9+nvkDAkThkuAxBg7dSRNGPo3oE6W188
 +WUMfJzqP62JUxkez8JxEKGfkpSkQK1FgscwA7e8Xg==
X-Google-Smtp-Source: ABdhPJzlPGJT64unwscHtP3pkp6o0pQTy8yCe4uTF85MyS6DR5P90jtF+DhOo7kr4MJ2W2Pp4R4El4o7EWfCN0SZUHI=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr17874475edd.100.1612806243538; 
 Mon, 08 Feb 2021 09:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-2-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:43:52 +0000
Message-ID: <CAFEAcA_eGWkMi63w90tKr5siAmkpw3OC2NpGUjWM-A7CKSxVbg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] tcg: Change parameters for tcg_target_const_match
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 03:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Change the return value to bool, because that's what is should
> have been from the start.  Pass the ct mask instead of the whole
> TCGArgConstraint, as that's the only part that's relevant.
>
> Change the value argument to int64_t.  We will need the extra
> width for 32-bit hosts wanting to match vector constants.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                    | 5 ++---
>  tcg/aarch64/tcg-target.c.inc | 5 +----
>  tcg/arm/tcg-target.c.inc     | 5 +----
>  tcg/i386/tcg-target.c.inc    | 4 +---
>  tcg/mips/tcg-target.c.inc    | 5 +----
>  tcg/ppc/tcg-target.c.inc     | 4 +---
>  tcg/riscv/tcg-target.c.inc   | 4 +---
>  tcg/s390/tcg-target.c.inc    | 5 +----
>  tcg/sparc/tcg-target.c.inc   | 5 +----
>  tcg/tci/tcg-target.c.inc     | 6 ++----
>  10 files changed, 12 insertions(+), 36 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

