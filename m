Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D194B537C91
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:34:08 +0200 (CEST)
Received: from localhost ([::1]:34400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfX5-00082I-Cd
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvfSJ-0005HH-M9
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:29:11 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvfSH-0004JL-P8
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:29:11 -0400
Received: by mail-yb1-xb36.google.com with SMTP id t31so6123180ybi.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 06:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z3naccpEvkJZgvKWQtBL1OaHkTvNVjbzwHoaKVZL33E=;
 b=NTWzbhg/B4piWx08UA1uq5CK47tUMCL5mKiD7ZufQ3MZ/fLQr3JZgcJ4LxZqfWwfU0
 Z4OxqUPFXvH9W4bVR2XUoFMCtisKrvHCgN+Sp2yw5MYNCb5BvIQPuh+cyF03VnlDG/Ui
 Lki3ftkEAAUw7mjJYHk0of/+ghs+ntqwSsWEEKHo8mYHWAWoil5mwNUrUnZ+VB5SbdP9
 qbqtRoZ1WqM4UyX5A5SUhXzCjQJFYd2iKFRruBwMSDVweVuVlyL3LpkR2DTQCNxiopdl
 Vs1/KKZncdO/YFrB1SgBxi4W50E7T0wabLr18kPChzl9IqzGqHB/HWApr1m1xfAyPhgX
 WmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3naccpEvkJZgvKWQtBL1OaHkTvNVjbzwHoaKVZL33E=;
 b=dAvpmze3Yk7ScVvfHNtYjbXZ4WaBe13g2rkZaN/fTwrnVjazY2BANaMMWwxpkr2J+y
 1WhYGk8V4XgqW+uL416BqZ3IBN6PJT6dFdUCSoLBQ5w7K4+tD0rVh4qNFD0fmCzfYRsp
 87tCGf6rLHoGvs6JZ1vH/mD+DiBrieQYGh3dO1FxCTft+gUA/bLeaorqNX4uUPzdXjMo
 2zGJYUET0R6NGXD/4vTH7jnmK7SUT4eTIJPRrpmew5+beGHjlN7k9/vjgWAnqe7HTL2z
 42kZO5pn31XkLdOZH1LpVRbHVfVji5I3vZIueLMVGnNbn3Y5wxf+ZsMTsxQ/EXyATjHI
 KzUQ==
X-Gm-Message-State: AOAM533eUGjtXFhiOX4E0lQ/5nVMmIOxJ/HWT8NXpcM5BgxYKAAzs/oW
 a53IXrAKnwcib6gvOFRkx+Wj7gk4v9q+olv7WgjjGA==
X-Google-Smtp-Source: ABdhPJwUunrLtiaYeDICxtV2MnFH8L85qHQWiCJZDI9MAZ7io2aN5PEqxArVbytCoD05ng7/oO2aFed2LCMfZ9jHlps=
X-Received: by 2002:a25:ab2a:0:b0:65c:bdcf:44be with SMTP id
 u39-20020a25ab2a000000b0065cbdcf44bemr6966200ybi.85.1653917348465; Mon, 30
 May 2022 06:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220527161937.328754-1-alxndr@bu.edu>
 <20220527161937.328754-2-alxndr@bu.edu>
 <CAFEAcA-PXO8ZGS_DA6E65MK2pvnnepbpA-vc_90xdARLj73=iA@mail.gmail.com>
 <20220530130944.27md44gr2yp7gx5i@mozz.bu.edu>
In-Reply-To: <20220530130944.27md44gr2yp7gx5i@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 14:28:57 +0100
Message-ID: <CAFEAcA_uNwY582GuCw6xqiDqyG3K6uqZB-ojB-Qcn5Hkzp4ZRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] memory: Track whether a Device is engaged in IO
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Mon, 30 May 2022 at 14:10, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 220530 1219, Peter Maydell wrote:
> > On Fri, 27 May 2022 at 17:19, Alexander Bulekov <alxndr@bu.edu> wrote:
> > >
> > > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > > This flag should be set/checked prior to calling a device's MemoryRegion
> > > handlers, and set when device code initiates DMA.  The purpose of this
> > > flag is to prevent DMA reentrancy issues. E.g.:
> > > sdhci pio -> dma write -> sdhci mmio
> > > nvme bh -> dma write -> nvme mmio
> > >
> > > These issues have led to problems such as stack-exhaustion and
> > > use-after-frees.
> > >
> > > Assumptions:
> > >  * Devices do not interact with their own PIO/MMIO memory-regions using
> > >    DMA.
> >
> > If you're trying to protect against malicious guest-controlled
> > DMA operations, you can't assume that. The guest can program
> > a DMA controller to DMA to its own MMIO register bank if it likes.
>
> If this is the case, then it seems the only way to fix this class of
> problems is to rewrite device code so that it is safe for re-entrancy.
> That seems to require significant upfront work to support behavior that
> is often not even specified.
> Simply spot-fixing the fuzzer re-entracy bugs seems like a dangerous,
> incomplete solution.
>
> Can we disable re-entracy by default, to fix the security issues, and
> allow device code to "opt-in" to re-entrancy?

That's a different question, ie "are there legitimate cases where
devices try to DMA to themselves?". I don't know the answer, but
I suspect not.

-- PMM

