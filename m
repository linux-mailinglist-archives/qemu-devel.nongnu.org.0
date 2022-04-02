Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB544EFDF5
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:30:24 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTWw-0007gl-Ne
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:30:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1naTVT-0005Zc-L6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:28:51 -0400
Received: from [2607:f8b0:4864:20::731] (port=40678
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1naTVQ-0000qq-KD
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:28:51 -0400
Received: by mail-qk1-x731.google.com with SMTP id q200so3550879qke.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 19:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2XkKUPx+UDhBJ9rg/c8lN99LCUH+q5iXJoBX4wiVhfs=;
 b=YUZfBcdYZif+cNuuqyJT6bOsN4zwl+rgxWTERSU0O3JbgoF2Af6N9I+FDUvM9xHSOX
 0nXaKm4rqd+ewNtmizkok16UjkHIerKgPzhQTf8qLGDlnTfOev+/x5wm8lkN3DNjpGIx
 Cy4BMSpCDPmoLQcTiOWIe5W4kXLP0KKlD/+F8qVqYuZV5//6K4AZ7Bhv0v8xZ9Mvzl77
 SxuRKf8xOYpamhjxEHQHVTcbKJuQo40dx44IDPma0peDMqPWjGo58vD4aSfHjYjXhsGr
 ksPlUeKtX4jvVjt1Vzv6IC0tgSw5bWwlRXf1Axc66f8BmLkL551hm6wmCwlMWbC4Q2W+
 i0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XkKUPx+UDhBJ9rg/c8lN99LCUH+q5iXJoBX4wiVhfs=;
 b=rapqQsBqolhifSaX6j3qoj8BPVqztcg6DRrvPlZlNccX/9Wv0MaWxjMhSqUYBzzcj7
 Agf6PRvmudHhULBAJ2RAA2KBfpvKFFVpJD42KymjzYii5BCtAfMVLj5RQSo+wknmzPLs
 8O0M4C5sdgSWJENVNfgqcgRdMbw/I1tV8Clp29+0PqJBSCXZ5Q+aambPrerJqtroOB1W
 i2tbJacO/sAwzfe4VR+S9lq/Wrih4VvVYyNABtTK/Hb1A2/nv10qVEqeXD8WIU1Gwrcd
 6/NeoEvpXgSBAzaxvwUTlPYOo+39T4+eNnZ17nitRcypq+ATUXx558022im+QUNIH3uM
 t2lw==
X-Gm-Message-State: AOAM531Q2qr6xDQoBtuLGPHECoEQPewqrar3OlWi3qgpuxoiLCql1gIc
 oDp4fD+YvxZkwv4LRiyrfOhBixXViwITLQbe5z3akoEKC8E5SCHGXG4=
X-Google-Smtp-Source: ABdhPJxYFGeosDtFHIPujocownQ4QIE32WCBP63dAA/ymcCLJQhTnVlSCVx4dyS+TEus5q+drbBO/ymyJGymaStBJ3I=
X-Received: by 2002:a05:620a:2847:b0:67d:2bad:422f with SMTP id
 h7-20020a05620a284700b0067d2bad422fmr8402072qkp.559.1648866526670; Fri, 01
 Apr 2022 19:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
 <CAFEAcA_rMuWkobjBoFJdYQqc=qvyUPrq9_-W+TkrNdTf+iBgsw@mail.gmail.com>
In-Reply-To: <CAFEAcA_rMuWkobjBoFJdYQqc=qvyUPrq9_-W+TkrNdTf+iBgsw@mail.gmail.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Sat, 2 Apr 2022 10:28:35 +0800
Message-ID: <CADXGpufhJn9L4U_Y6gcdyzy1XMV3C5PM5T+T0ruaqvBnHicyhA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::731;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 9:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 24 Mar 2022 at 18:16, Zongyuan Li <zongyuan.li@smartx.com> wrote:
> >
> > Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> > ---
> >  hw/arm/exynos4210.c           | 26 +++++++++++
> >  hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
> >  hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
> >  include/hw/arm/exynos4210.h   | 11 ++---
> >  include/hw/core/split-irq.h   |  5 +--
> >  5 files changed, 126 insertions(+), 33 deletions(-)
>
> Looking at this patch, I think it's ended up quite complicated
> because the exynos4210 code as it stands today is doing
> some rather odd things with interrupts. I'm going to have a
> go at some refactoring patches which try to clean some of that
> oddness up into code more like what we'd write today, which
> should make getting rid of the use of qemu_split_irq() a bit easier.

Should we wait for the refactoring to be done and rebase this patch set on it,
or just remove exynos4210 related code? I'm glad to see if there's anything I
can help with the refactoring.

Thanks for your review.
Li

