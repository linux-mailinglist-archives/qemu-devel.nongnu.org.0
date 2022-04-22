Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09E650B864
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:24:23 +0200 (CEST)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtGo-00087D-Ug
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtEh-0005p0-Q2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:22:12 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtEe-00089q-9Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:22:10 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f17so14419491ybj.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=krNvCdy5GwksLTiZ6ZXKT0rQ6OUbZa3vyIGCSzCLTf0=;
 b=r6AAIQYCfRm3Y0rhBt9ML/TCVmDdr+PJ5Pfl/l0xtqLSVjlABDOT8WmNuWcim9F1rm
 kKodcMelcUW8t3CQvsfusIIplkqCLIbHY4w5cK8Nx08zPWTEUJmyR9wbjH2peFNVDTx5
 cejHS3CWT8NhIsEapZqJRZdYuJh4WHJN6rdoJJD7l9TkXZNh2PvPhMblxH5cjSOrcDz3
 usZWfg3sn64GmgUazoaLfmVY3Jowlx44Jzpwmj99OZDEj4RydZXpSD9BBJenwRY/QmPZ
 83ZxUkgaXo/ZBLy5WPp2WjRGyxAXjgf1x3KkBMujnGub94d0eD5EGyPSeRO728Flvlpw
 2CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=krNvCdy5GwksLTiZ6ZXKT0rQ6OUbZa3vyIGCSzCLTf0=;
 b=NxXWg7WJR0MiZ9ml45S+gM/73ktSCflv6CmUAh/k9lFH1gBznAaIkMM8ggZkVfrtd7
 OCcTnvidTf9BSCZ5XeN6VhyL0sQSFMeQ0c2G/T1cKIf4/eZ/cF4f+QTxMPy2QpGoFzwl
 pCxtKX98QPx3Vlzmxzao2OxT6ZDaXoeDxyPRsIZMijfQnTsRYhfsoQ2PIjULz2M3utA2
 tL0F054KsfUDVNusFmLhGeMiM/xh4R1hYjLd/uZ9oA7xuiHXc1DEKsYESfV/R4TOh5TN
 w8V2kt15Hq3PmxumGTWivbNKWeiQXOGzTZh+fI95fE8EqavJ0tD1NRLRD3FI2sEL0/d5
 v8Kg==
X-Gm-Message-State: AOAM532XYzsKGHXQNpQhsPpqWPOmxyTVpckVBHelg+WtQDW8MSYlhxlw
 hycU/ie3DDPC0CSLrh+JZktelk3MvfsDyAYmBSrLYQ==
X-Google-Smtp-Source: ABdhPJyESpwxjqQnip2BVxGKsIN11u3sDAPLdniCewV6MDXdMftrgTTq5BoAeI37Vr3fajp5xQrn8aJY2fVL5cKBAa4=
X-Received: by 2002:a25:c60a:0:b0:645:d925:64d3 with SMTP id
 k10-20020a25c60a000000b00645d92564d3mr1328636ybf.288.1650633726965; Fri, 22
 Apr 2022 06:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-54-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:21:55 +0100
Message-ID: <CAFEAcA-DG6RzAD3XAx_RURyWytPPFPH22Ojs0J4T7U=GCh3zvg@mail.gmail.com>
Subject: Re: [PATCH v7 53/64] target/nios2: Introduce shadow register sets
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not actually enable them so far, in terms of being able
> to change the current register set, but add all of the
> plumbing to address them.  Do not enable them for user-only.
>
> Add an env->regs pointer that handles the indirection to
> the current register set.  The naming of the pointer hides
> the difference between old and new, user-only and sysemu.
>
> From the notes on wrprs, which states that r0 must be initialized
> before use in shadow register sets, infer that R_ZERO is *not*
> hardwired to zero in shadow register sets, but that it is still
> read-only.  Introduce tbflags bit R0_0 to track that it has been
> properly set to zero.  Adjust load_gpr to reflect this.
>
> At the same time we might as well special case crs == 0 to avoid
> the indirection through env->regs during translation as well; this
> is intended to be the most common case for non-interrupt handlers.
>
> Init env->regs at reset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

