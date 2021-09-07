Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E4402E55
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:27:21 +0200 (CEST)
Received: from localhost ([::1]:41974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfoW-0003Ug-O5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNfnU-0002lh-RH
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:26:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNfnS-0006V5-VD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:26:16 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so11445wml.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FhXgO4soHUfxUZvgfxgTnbg0Q339mdYzMA/DtCHulwM=;
 b=XujAKCsnSv1SoIEqIFBQX0tSV/UFdURbpRl6b/A2AzaV6EgVVpRy4fvqRJVNkfktOX
 XgjoLQtKKvIP1kxEyMRpoFzl4pPsgCNTm6Maus1bw1cg4j7VovCDgC3FeuTGZa6Q8P6Z
 7rnnb6gVceVdPykWLjsC8x4JFbHsqMK9HqkgsmK1F1AuHUxmTZuOYPrn1iKWo37teFlf
 XyNBkiSk1IDWaMvYWR6D2aoS9EWu25NKX0eSuR1FAqWNn3zM+4SMFeOLiaWQSQcOVheA
 oOlcrn9LQGeM+m4Y2PQ8vztisubnmJ3/mvJFjxngs4HaqH69lQlE3bXs7fb5qn4z7xoq
 7WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FhXgO4soHUfxUZvgfxgTnbg0Q339mdYzMA/DtCHulwM=;
 b=iBgQPr0zwXv4tiVVTFeCrv2eRUWdO7MRN6gRGdOc1NSLQTerRhF6KBXsuBKrasBZPC
 QOgncE3NToZAmt/XapDKtZkNxxirgYYBMHaT0lXBN8bowfEZpx/kmDIOQtLeR2+eDAhE
 Bnop92CAEXUs4QVQG/Sydv5v2pdyduaAzmJ6Ihnef3AM37GTQcoSFkCPfekQ1HPxvTH4
 5g0RQqSi6rzWLO4rg6CBnh/0I3rtemUZFPKRmRH32PgmZVSKMjmcodf7YGUkCusMmyrI
 i3UHoOHsLmnjPdqZ5F/N9h0rJSWoXKw9vicCgPzenc6axD6GfQK11GuUIC/3uOMjG0J8
 h0XQ==
X-Gm-Message-State: AOAM532U0M1ELTWlUDqfOlI2b8sqtpfzE+bPHvTuRutinN+VbBRHRXwv
 VxcQJKvGRZHz8uPwvz3FPN7GeB9MsT5/PRqR2eBtRA==
X-Google-Smtp-Source: ABdhPJwMBtgoNU1DNZ3wjpbNoTr8qYBDuvceJ9eIxrnJpE3hgXpGIxe2N2Hyd1ZrAxjAa2aJTCxvA5d0Q8jsAy15RLE=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr5288352wmq.21.1631039172877; 
 Tue, 07 Sep 2021 11:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210822144441.1290891-1-maz@kernel.org>
 <20210822144441.1290891-4-maz@kernel.org>
 <CAFEAcA_J5W6kaaZ-oYtcRcQ5=z5nFv6bOVVu5n_ad0N8-NGzpg@mail.gmail.com>
 <87bl54cnx5.wl-maz@kernel.org>
In-Reply-To: <87bl54cnx5.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 19:25:23 +0100
Message-ID: <CAFEAcA_MRyd2AcgAhvEwJY8LGbHoyz_JgTdMGAEtGegvZB0d7A@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/system/arm/virt: Fix documentation for the
 'highmem' option
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 Android Kernel Team <kernel-team@android.com>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 18:10, Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Peter,
>
> On Tue, 07 Sep 2021 13:51:13 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sun, 22 Aug 2021 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > The documentation for the 'highmem' option indicates that it controls
> > > the placement of both devices and RAM. The actual behaviour of QEMU
> > > seems to be that RAM is allowed to go beyond the 4GiB limit, and
> > > that only devices are constraint by this option.
> > >
> > > Align the documentation with the actual behaviour.
> >
> > I think it would be better to align the behaviour with the documentation.
> >
> > The intent of 'highmem' is to allow a configuration for use with guests
> > that can't address more than 32 bits (originally, 32-bit guests without
> > LPAE support compiled in). It seems like a bug that we allow the user
> > to specify more RAM than will fit into that 32-bit range. We should
> > instead make QEMU exit with an error if the user tries to specify
> > both highmem=off and a memory size that's too big to fit.
>
> I'm happy to address this if you are OK with the change in user
> visible behaviour.
>
> However, I am still struggling with my original goal, which is to
> allow QEMU to create a usable KVM_based VM on systems with a small IPA
> space (36 bits on the system I have). What would an acceptable way to
> convey this to the code that deals with the virt memory map so that it
> falls back to something that actually works?

Hmm, so at the moment we can either do "fits in 32 bits" or
"assumes at least 40 bits" but not 36 ?

thanks
-- PMM

