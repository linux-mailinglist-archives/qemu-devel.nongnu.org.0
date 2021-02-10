Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A68316810
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:33:12 +0100 (CET)
Received: from localhost ([::1]:44904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9pcF-0006hw-EI
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9paU-00061M-Q7
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:31:23 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9paO-0002VX-Vq
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:31:22 -0500
Received: by mail-ed1-x529.google.com with SMTP id g10so3033073eds.2
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 05:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJhYaR9CevYTemmbv7BGfDIWBlbw4nEgNqgFocUEIRo=;
 b=xLPTKo0n/pne6QDi9eVAS3gdw8K/D4KzHVpROxfFYP6I2fKYtXDP0rFv6rQjOuPCpE
 7cHAEjlDYw7cLFDRdglx/hg8CQgTG6204rDnPYCnrGI0ZjwjK+jWPOOi+Sjo3ANxL8Hq
 hYfA38hm5grIZHwFtk/tiJo/V3DGDLyGPVr0ARI+IWwFCCFptpc4nrSzeAp6M7LFwHrG
 78eAkqTdeMdWMMDDh5CYwFO5rNVZJibFirZXHja22Nd3x3kDkCeG3MSm6Hn9u0wTwSbP
 rav7e7n3kQcsjGljL+3KUKJEbf+wRsgcktW+f9IkPVQl7AQ2qSGNFg6kCZUQXatFgbio
 XWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJhYaR9CevYTemmbv7BGfDIWBlbw4nEgNqgFocUEIRo=;
 b=g+oI9lUtqjVG4z1Qsc0x0Mi9Va0yx+CR2e6F6OG4c7CzvNtBelUkyeeLxFEhPBJApe
 tXrxtWHbo18KfwwiwTiogZnAEjlhLsYMV9wPj6Lf0RKEoaKyDP4+N5JQHP8LkfsiA/ha
 0OQAUPUnywkDm+pBnC7RB8IHBik59rRkSsHbBIOgcHAQsOpjM2y4sSoXFLLtdUoZHBda
 I+wFG2QZrs7huhuV184DbOac20JRv3m0keHenrhp+O0raIPx1m10n4UMOzlUUNt3AUR/
 cpjnX1KKosSKJafk6H8eP4tkp0ePv2BRC3c1i6vLBd89PhiPtMznSNV81J1wZAIP8BEx
 N9MQ==
X-Gm-Message-State: AOAM531gimcsAW05MFgjsiyTmds8Mm0CA1L7YwmE3b+ky8zLoRHOSD2U
 aKzwaNQ7TRmtvWFL0WUloHASO3uVUocIM/AibbstEA==
X-Google-Smtp-Source: ABdhPJwZhn1g6TfCYSL28tqJDe0nr5D6gIyvz1E1p+1eGuZMCjkSFVS1PXUxdWA6T+GtLCzb1Wnwuk2MsZukLONFYN8=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr3164287edx.36.1612963874261; 
 Wed, 10 Feb 2021 05:31:14 -0800 (PST)
MIME-Version: 1.0
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
 <YCO0Gy6ZKY5qGZgT@apples.localdomain>
 <CAEUhbmWB2PCYbe2Dd2Ui8C-=dE_FDjEMApDf1GkXzJe2LBQkRQ@mail.gmail.com>
 <YCO2BMwhJE/yoNav@apples.localdomain>
 <CAFEAcA-Pn1RPWuUaQ-g=80Zo1UYE=L+hGgQePaCaSsz3XxKvFg@mail.gmail.com>
 <YCPFaUxao63p/PKu@apples.localdomain>
In-Reply-To: <YCPFaUxao63p/PKu@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 13:31:03 +0000
Message-ID: <CAFEAcA-w+VeyfSmKoYxs4S0ENHAvh7VT1Ng5XxUguvyGeqprKA@mail.gmail.com>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 11:37, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Feb 10 11:01, Peter Maydell wrote:
> > On Wed, 10 Feb 2021 at 10:31, Klaus Jensen <its@irrelevant.dk> wrote:
> > > On Feb 10 18:24, Bin Meng wrote:
> > > > I am using the default GCC 5.4 on a Ubuntu 16.04 host.
> > > >
> > >
> > > Alright. I'm actually not sure why newer compilers does not report this.
> > > The warning looks reasonable.
> >
> > It's not actually ever possible for nvme_ns() to return
> > NULL in this loop, because nvme_ns() will only return NULL
> > if it is passed an nsid value that is 0 or > n->num_namespaces,
>
> NvmeCtrl.namespaces is an array of pointers and some of those will most
> likely be NULL (those are unallocated namespaces).

Whoops, yes.

> I know that "it's never the compiler". But in this case, wtf? If there
> are no allocated namespaces, then we will actually never hit the
> statement that initializes result. I just confirmed this with a
> configuration without any namespaces.
>
> The patch is good. I wonder why newer GCCs does NOT detect this. Trying
> to use `result` as the first statement in the loop also does not cause a
> warning. Only using the variable just before the loop triggers a
> warning on this.

My new hypothesis is that maybe newer GCCs are more cautious
about when they produce the 'may be used uninitialized' warning,
to avoid having too many false positives.

-- PMM

