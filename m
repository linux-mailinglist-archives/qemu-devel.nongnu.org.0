Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6B56466C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:30:13 +0200 (CEST)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vvg-0006D8-T2
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7vQX-0000Fw-Hw
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:58:01 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7vQW-0003zv-43
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:58:01 -0400
Received: by mail-yb1-xb30.google.com with SMTP id c143so3090101ybf.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=giS5ElRI5j5XP8hg8TPxbz+8XigNg6BhzCD2ooGHIgc=;
 b=wtrSD27c5uqpXMqAnRwMGDA4eUUd2kykee1jV84a2scPEf7/WMhZxInXYai8TxiXGK
 vLStaPF+EMGfLfUoxBu9l/0hWJ3yg8+kcj9YxfPIweawvn3nfAR2qmRqVDG1AKKzigIT
 acKjja43KFkjjZsFGlucUx3gN6WgUsQYDOv6amsPvuLW5CMrMkce8DCAH61OBiq7G/1w
 DKQvRQt0CWtXm+oLTKs8EEHQ23TNzuG6H0pje+wW3U30sbyBMvmkVmckFGmDs9lBlMIY
 /oTtFpAS4IFdnDMYHRw4/YHYq/7/uhHC2zMWVNcZV/fuSjY/fkalg3bTYiMuT9lqTt1v
 lxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giS5ElRI5j5XP8hg8TPxbz+8XigNg6BhzCD2ooGHIgc=;
 b=2vU/+LhIEytx5BmGAjSpambXf/A0CWzaZr1DlceUTpfg8EY7c3uUd/3vau7gzz+CW8
 Q/LHJoDPg0T8jU8I4R0nmybjVv+dEw25rzNnANAq3YeHQtogTJWfZL3T28h+oO4neZ5L
 rK0U1L6AgdsdnzDokUWV2isWGQf1/wqRWGRiP77GP7pFqRWUA0ph4qI+EgLTJOEE9i4/
 82zJBzz4yrExSZOuFWD9nElbAQuS36FTcUoFfsh3ag6LKphRXs/6VvaeE0yGwNL2kL7A
 tNpOICACAdHpiLtmTDTWK+QR21uKaxhzh+5TbSdn7SywQq6r5+wcs0wzNrdlvV65GtIw
 uXCw==
X-Gm-Message-State: AJIora9fivQAuiapQB2Wr1sLLy6/rGv8pwsFPnZ+IugNA5nyggAzpnnJ
 OBaHi4xG66sASGWclTwAQ56b0WKYzXZG/I5ClxTFuA==
X-Google-Smtp-Source: AGRyM1vJ7kinEHBglJ+JGgbzJh164C1Nc+wSVf7rVJaf2FEtUnCwIkOP7KsTxFVtXpcZLBkXxParXSGyb94fpNYDFGs=
X-Received: by 2002:a25:d74a:0:b0:66d:eddf:c495 with SMTP id
 o71-20020a25d74a000000b0066deddfc495mr11741128ybg.479.1656838678836; Sun, 03
 Jul 2022 01:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
In-Reply-To: <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 3 Jul 2022 09:57:20 +0100
Message-ID: <CAFEAcA_E1OWmuTpdqSUXc7kQs7ZkuiHNSWf6P0KQTquaovaVSw@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Jul 2022 at 15:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 01:11, Peter Maydell wrote:
> > +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> > +{
> > +    /*
> > +     * We can't just OR together the aa32 and aa64 checks, because
> > +     * if there is no AArch64 support the aa64 function will default
> > +     * to returning true for a zero id_aa64dfr0.
> > +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> > +     * the AArch64 ID register values in id", because it's always the
> > +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> > +     */
> > +    if (id->id_aa64pfr0) {
> > +        return isar_feature_aa64_doublelock(id);
> > +    }
> > +    return isar_feature_aa32_doublelock(id);
> > +}
>
> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.

Why? The AArch32 version of the CPU is going to either implement or not
implement DoubleLock the same as the AArch64 version: the answer
will be the same in both ID registers. We only need to avoid looking
at the AA64 ID value if we don't have it at all.

thanks
-- PMM

