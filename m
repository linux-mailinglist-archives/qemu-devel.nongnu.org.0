Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867B6C310F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 12:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peaba-0007Y7-6C; Tue, 21 Mar 2023 07:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peabY-0007X0-C3
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:56:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peabW-0000hJ-I8
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 07:56:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so19933709pjt.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679399797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VlJS+u43HNbluzwvLNlW8VPzjUtn6/93XEfoWrNaWR0=;
 b=M6s5642LuwELp1cEjmIVaksfC9Ke3FvoRg91tejM7Bm+rB5NHTblhAy8BzjyPJ9ymF
 HYmwii7NWHb0CQ9VqC7zyfkk+Pxzd3ksF4erpwVcoSp03jA8TvSyiWNfY1xgAXE3d/ic
 qGawUXTKRfS/FNcNH+qLSfr6qz0BlFJKdfg6NoJ1qQWOS1b+qcLKz/53fHPSXOVQ2DCf
 0+/0c8K8Knq8D/utoQ9Wvq3eEKStnumLN6FLVTNLopmgbK72hd1AllE1HJTUmozcC/i0
 EuJlF6cPLnhbkK913HMPWaU3nYn85eGv044Tf4WyrzLJmVAwMWsKsKHR//Hr9E/l3omP
 UhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679399797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VlJS+u43HNbluzwvLNlW8VPzjUtn6/93XEfoWrNaWR0=;
 b=q3WFk/QOseKDKRvgeR7P2BJIioSuFsEGeL1KtZ7mBzzKgKoqVFn58DxNa8t/Rew2kA
 KVG2ewki+SEznboV3oWe4bQZNAapb1k2M0rXbQi1RR8/8EbKT/1YHoLbZx+8o51DLWYD
 C+Y5sjE+ZImPPLtaNItJJb0zP36VShdNyBbmQnUHpOz9lv6WmkbP4LdMFVu1q+bI6DtW
 nwE7ceo9a3bYBNrcFGVLxoziXsvGmDZkR5pNCcTaUeaxsMnkXswWGQGrXv6iwpEgqJ4A
 VCjhePQhoee1Y5sKv4p4nrQfY1XJbuHa2ohjpLqABNgPYnk1Xk2cJxXRaRkVjgu0JCGF
 HW2g==
X-Gm-Message-State: AO0yUKUrLmtvsriqFVFdjQJaJ7+u6buV6AWTQIYCaseW6qngLItocWVN
 3Jqa494Va0/YP0mtiwseANZi8f0BrbLw5RwiBAg5gg==
X-Google-Smtp-Source: AK7set+zxkMaOZiZhriH2j3wvBDkWatu0+1uQBoAMQjirBjJ3pUfyDEtTM1u5PzwgYcrjA9004sTLZZu9uG2HcWIyos=
X-Received: by 2002:a17:903:452:b0:199:1a40:dccc with SMTP id
 iw18-20020a170903045200b001991a40dcccmr621618plb.9.1679399796770; Tue, 21 Mar
 2023 04:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230316105808.1414003-1-peter.maydell@linaro.org>
 <87h6ul0x4m.fsf@redhat.com>
 <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
In-Reply-To: <CAFEAcA_NiizU4RjRDNFU2==sHSAMZxYJm9dkAXw6M1AZGGyA0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 11:56:25 +0000
Message-ID: <CAFEAcA_qQ_iRQWgdLoYeQh3tjMRbqqJ+C49==aed7n7S_xZFYA@mail.gmail.com>
Subject: Re: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 at 11:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 16 Mar 2023 at 11:11, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > On Thu, Mar 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > > The markup for the Arm CPU feature documentation is incorrect,
> > > and results in the HTML not rendering correctly -- the first
> > > line of each description is rendered in boldface as if it
> > > were part of the option name.
> > >
> > > Reformat to match the styling used in cpu-models-x86.rst.inc.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
> > >  1 file changed, 30 insertions(+), 38 deletions(-)
> >
> > (...)
> >
> > > @@ -217,16 +210,15 @@ TCG VCPU Features
> > >  TCG VCPU features are CPU features that are specific to TCG.
> > >  Below is the list of TCG VCPU features and their descriptions.
> > >
> > > -  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
> > > -                           *impdef* (Implementation Defined) algorithm
> > > -                           is enabled or the *architected* QARMA algorithm
> > > -                           is enabled.  By default the impdef algorithm
> > > -                           is disabled, and QARMA is enabled.
> > > +``pauth-impdef``
> > > +  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
> > > +  Defined) algorithm is enabled or the *architected* QARMA algorithm
> > > +  is enabled.  By default the impdef algorithm is disabled, and QARMA
> > > +  is enabled.
> > >
> > > -                           The architected QARMA algorithm has good
> > > -                           cryptographic properties, but can be quite slow
> > > -                           to emulate.  The impdef algorithm used by QEMU
> > > -                           is non-cryptographic but significantly faster.
> > > +  The architected QARMA algorithm has good ryptographic properties,
> >
> > You dropped a 'c' here ----------------------^
>
> Well spotted...

There weren't any review comments other than the typo, so I'm going
to fix that and apply to target-arm.next.

thanks
-- PMM

