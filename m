Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378959BC42
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:06:22 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3Ny-00061j-9N
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3JH-00027P-08
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:01:28 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3JC-0006Aj-Os
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:01:26 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-324ec5a9e97so274227637b3.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=q7/0VJ80uqa1ouLnINRrqRT6ituxker7a/1wGsOkwfo=;
 b=U3alWppkcvVizfwJi8Qsen6gOu3cXTf9YCgqG3WLxw8A9dUa21DfBrGwQKcbXFL8DB
 KWIfslygk9yor2dICE6YpY3rNV7SVmu2b7R24TMo56pt61INrXtkySB9wTccYARE4pP8
 oJTChRVsCmjQAoA8ns04cM498cdl8cIOtCNlX3AO5RUNY73cbM0jqDYoxqGVialUHlMO
 Vjz7xiVp/fpmDB8EHXzlDNT02GLN7ZySTkQGCLhRwDkaGbcuel0ltoPCyqRw4gc57w8D
 QooK3vETbesGCvPisHiIEoRGSzMy9T8VPPuhbsKhRwCPYJwYpcOdW29H74Apuf1BJwwV
 o1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=q7/0VJ80uqa1ouLnINRrqRT6ituxker7a/1wGsOkwfo=;
 b=usna4zY+yC//6WBUxTg60yW/R0Dx1M2rACZ6AQn4sMc3cU9XR7fO7SHzG2VJwXU7zO
 /HYgZLXOfkjM5SGUnGjdwKUuiqRzLTvTxEELy1u/NPOTh8c2U+/FF/OiCP3DYPCwAXDN
 ObUvd4LIcyzQQDUwrXKDjDNlI6PXht8V/7EVLBwhID3/r9BH/HA7brxMFSIyWBwiUvHk
 64T/AEOefhYDMchf7dsmaFIShtjPSsbtyoGZTmhecLpSFVQpnFJ6Rk1fQaU21D8SlqM9
 c//h5bSl3fkp3adfr5ZBvnTILeZ58UGcWZt1lEWxMKa9i4RRdbMX9g12BPSwTaQCukEM
 3RnQ==
X-Gm-Message-State: ACgBeo1vVpZ3XMCjPMvuNlb6lt7nw5mD/G2H3jO5LzmWpsybAJhl6JoW
 lkmLNmsNArQri5kpmNKhUAeRJG32+PFtWYDOvLxCJvRCdNo=
X-Google-Smtp-Source: AA6agR5bE0+Q1VjoytvEjURUWvaZB9JWVkg7bDKBchAumf17T03vgeWfdEuz3FO3qRtibbSHYu5xMovgmWHavesohXQ=
X-Received: by 2002:a25:4e85:0:b0:695:8a88:903f with SMTP id
 c127-20020a254e85000000b006958a88903fmr7563529ybb.85.1661158881464; Mon, 22
 Aug 2022 02:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-10-peter.maydell@linaro.org>
 <2d2e3bf8-76cc-2364-7f72-956dd0ebe510@linaro.org>
In-Reply-To: <2d2e3bf8-76cc-2364-7f72-956dd0ebe510@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 10:00:39 +0100
Message-ID: <CAFEAcA_CThC5mc4uPiuknPbBYm5nMg5GwFSNfzyAtrOu3ZRUYQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] target/arm: Support 64-bit event counters for
 FEAT_PMUv3p5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Aug 2022 at 19:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/11/22 10:16, Peter Maydell wrote:
> > +static bool pmevcntr_is_64_bit(CPUARMState *env, int counter)
> > +{
> > +    /* Return true if the specified event counter is configured to be 64 bit */
> > +
> > +    /* This isn't intended to be used with the cycle counter */
> > +    assert(counter < 31);
> > +
> > +    if (!cpu_isar_feature(any_pmuv3p5, env_archcpu(env))) {
> > +        return false;
> > +    }
> > +
> > +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> > +        /*
> > +         * MDCR_EL2.HLP still applies even when EL2 is disabled in the
> > +         * current security state, so we don't use arm_mdcr_el2_eff() here.
> > +         */
> > +        bool hlp = env->cp15.mdcr_el2 & MDCR_HLP;
> > +        int hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
>
> The specs could be improved here, as the top of MDCR_EL2 says it doesn't apply if EL2
> isn't enabled in the security state, HLP has the exception noted above, but HPMN does not.
>   I conclude that HPMN is missing the exception, because nothing else makes sense.

I suspect (but haven't thought through) that not all of the things HPMN
controls apply when EL2 is disabled, so it's probably more complicated
than a blanket "applies even when EL2 is disabled" tag the way HLP does it.

thanks
-- PMM

