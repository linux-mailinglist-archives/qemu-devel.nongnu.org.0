Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0B3A33B7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:10:18 +0200 (CEST)
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQ4H-0003Zx-DE
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQ3S-0002i6-7j
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:09:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQ3Q-0005oY-KK
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:09:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r7so19930837edv.12
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PoR1hE3Olfip3z0NofjDscUf1eIC0FJ9k+LWBvMJzzE=;
 b=i4/zwVNgKlSzJ0mRUQBvwmHhjRh7tsw/t4XUeMrgmNU6TCan/zVAvc/4R3aICt91I4
 8zHDlOfRt+7oKGMpE/TTamVpwG6CNUtYjfAuBPKbJoCeWsakAZUaEChlFs76RzoD4yu9
 QFTKHjj86p6ndW/+IwSpdPJVfi2B91ptrRV2jVxgL4JHuWwC2pAl5VjaFJUYD3GBGfKK
 2jV0LgNlVEMJCDP7aEq6pZrketOT9r4+yEB9Br/NaBMeuYfKbsrWDtmy0SkiPOJwOtV4
 uxgo1lqc2gYlCKB/faIuLzSarV55P8RnwhDB5ItVP+nh5u5ur+pMYRRSy5LPLXw16IDp
 Gffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoR1hE3Olfip3z0NofjDscUf1eIC0FJ9k+LWBvMJzzE=;
 b=Zvs1U8tpW0DEpWeEcfbqXEcgmo2RB5IXd1vWspch8zloHs4B9954Ljr3mMrjJsy8Xh
 c3BdU1JMDEk0XiMxT7SeqHb2aGPFRmrU2lUR0wzP+cCRsUZO6thT/mxYwk2RPcfyk2vR
 Z21p/Vq87MZ3TyKRFh7ckuOBPo+m1X9iQHpLEsRnBzGMpB6U6GvilP3Z3VUsXJlHBSVc
 0vMDfhPHIvTc1vJ0NsibxAeKMFTOWH8at5Tx72YDr8F2N/BbqPKJd8Z1JO1BpeOgq+r4
 wakzggknWG2d1n/OZfG7g3m3TSK3UwDXEkgtL1DOyQP529apWCCX1kaVr5Q9tptSXGJ8
 8/AQ==
X-Gm-Message-State: AOAM5325lIeyqiV7ZL4OOk0RWOPyTatJVLN5mzKI1MFkycssrb8QOhzN
 5Wc0s4NlAaPu7x8dScYPIRspF1GcHjlYyiDRswbejA==
X-Google-Smtp-Source: ABdhPJwoNtAGxnSPEiD/RSvOEGlJ/CHcFu2QuHPkG/8BQ/7FAVhvPp1Y4Cjeejk5kv4jMzSicI8nEKMIwYMDJ3fmaW4=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr35774edt.100.1623352162024;
 Thu, 10 Jun 2021 12:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-50-peter.maydell@linaro.org>
 <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
In-Reply-To: <5b0a7b23-7e96-4d0e-abe9-5f137da131da@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 20:08:48 +0100
Message-ID: <CAFEAcA8UNnD_gzdNTAVb=Qow7rLc_a7W7r2H37MBz=+e-JSVwA@mail.gmail.com>
Subject: Re: [PATCH 49/55] target/arm: Implement MVE VQDMULL (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:58 AM, Peter Maydell wrote:
> > +++ b/target/arm/mve.decode
> > @@ -39,6 +39,8 @@
> >   @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
> >   @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
> >   @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
> > +@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
> > +     size=%size_28
>
> Move this back to VQDMULL[BT]_scalar, I think.

Why? VQDMULL[BT]_scalar uses an entirely different format
(as a scalar it uses the &2scalar arg struct with an rm field
for the gp register).

-- PMM

