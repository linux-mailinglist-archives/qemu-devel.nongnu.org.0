Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C773F573C0A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:33:59 +0200 (CEST)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBgFK-0000bV-VI
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oBgDa-0005vy-N9
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:32:10 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oBgDV-00087l-RX
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 13:32:10 -0400
Received: by mail-yb1-xb32.google.com with SMTP id i14so20454761yba.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eSAOaEVnS5uGDlM8AAIP9Qq/TyO80MQXyeoxVbMjgd0=;
 b=BqSW27rItYvxJkZukqX5pgGP4oPIKSidb2heZAkdzpmMICQAxdk1Y5yMDH/IYCvXS8
 U175nAP3KAuMTenpAUsuGQfF6sWf0wK/phZXkxg1d2GzxJHLgAKw8XlOJykhEIn85LzG
 8wSRSlagDLGyfbnK8oVvBTyKsRINBa8ToQmNKFE+BvRQeG89c/Epx36KOQBXzKLuDU+H
 APqi3lS0vxS0WxMgexnubJiWFumZIoZWViOhArNgGXFIZyiPsac0f2BQF410rTOLfuxi
 VzsaHCX/gs+KLkvsOlc9hg3Wtc1erw0L05dNzcqnhSbNrHqhzEfgI/hpO8EmnqEb1Cix
 HaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eSAOaEVnS5uGDlM8AAIP9Qq/TyO80MQXyeoxVbMjgd0=;
 b=JYsbbRIUQtg1Lnu2qEwmrH3FtTK9UqttbtQG8ghG/O4FLe8ls+8wsqFgcbrfoLTO43
 Vmf1G4l9rQd0pBISRwNAi8VT4+tfV+DfjMz8GtXp2qK7Tg1eYrgq/sBIRppSm60RPOEp
 O24zeXfYrFZCsib/dwcLCmetQnuHlPRHPOoTjHwaYXxC00QPjBkrmA1CEuCu9Yu6lZeX
 YEeQKAvQ3Zgqn9umdcMZr0vOwDCd76F84DpAzLVb5N+iQr6wzUs8PQCuEVU91iMKYSVT
 WYfIV1X+7kLFn+RxzViv77+mIXcToOYVpfjNKXyORTVriQroCQz0leJe25HTQyUfe5Ze
 umjg==
X-Gm-Message-State: AJIora+Y1qGpFT9nsJfku7XLDe/QhQeu4dRsW8SYy1jzDEZih9mpp793
 hrMAPqgdPht+/6hOx7GNi02zcKXNJjnqRFWk0Xs=
X-Google-Smtp-Source: AGRyM1t6NBXGnq268BWpA9p6DKWbWTuvAfRs0o2kDbeUl5rUH1ULFls0TxAkhpyPb3B4++4RP39QvnGU4b5btJ0G4JQ=
X-Received: by 2002:a05:6902:4e8:b0:66f:a7f4:fbdf with SMTP id
 w8-20020a05690204e800b0066fa7f4fbdfmr4191116ybs.58.1657733524630; Wed, 13 Jul
 2022 10:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
 <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
 <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
 <20220713155108.5kgycuvnqdnywjyf@mozz.bu.edu>
In-Reply-To: <20220713155108.5kgycuvnqdnywjyf@mozz.bu.edu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 13 Jul 2022 18:31:52 +0100
Message-ID: <CAJSP0QUbBh5e7VDpn0N0evvq36+NLA=4+QpT0QKQJgyNy+pGcg@mail.gmail.com>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 13 Jul 2022 at 16:51, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 220712 1034, Stefan Hajnoczi wrote:
> > On Tue, Jun 21, 2022 at 11:53:06AM -0400, Alexander Bulekov wrote:
> > > On 220621 1630, Peter Maydell wrote:
> > > > On Thu, 9 Jun 2022 at 14:59, Alexander Bulekov <alxndr@bu.edu> wrote:
> > > > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > > > index 44dacfa224..ab1ad0f7a8 100644
> > > > > --- a/include/hw/pci/pci.h
> > > > > +++ b/include/hw/pci/pci.h
> > > > > @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> > > > >                                       void *buf, dma_addr_t len,
> > > > >                                       DMADirection dir, MemTxAttrs attrs)
> > > > >  {
> > > > > -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > > > > -                         dir, attrs);
> > > > > +    bool prior_engaged_state;
> > > > > +    MemTxResult result;
> > > > > +
> > > > > +    prior_engaged_state = dev->qdev.engaged_in_io;
> > > > > +
> > > > > +    dev->qdev.engaged_in_io = true;
> > > > > +    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > > > > +                           dir, attrs);
> > > > > +    dev->qdev.engaged_in_io = prior_engaged_state;
> > > > > +
> > > > > +    return result;
> > > >
> > > > Why do we need to do something in this pci-specific function ?
> > > > I was expecting this to only need changes at the generic-to-all-devices
> > > > level.
> > >
> > > Both of these handle the BH->DMA->MMIO case. Unlike MMIO, I don't think
> > > there is any neat way to set the engaged_in_io flag as we enter a BH. So
> > > instead, we try to set it when a device initiates DMA.
> > >
> > > The pci function lets us do that since we get a glimpse of the dev/qdev
> > > (unlike the dma_memory_...  functions).
> > ...
> > > > > @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
> > > > >          xresidual -= xfer;
> > > > >      }
> > > > >
> > > > > +    if (dev) {
> > > > > +        dev->engaged_in_io = prior_engaged_state;
> > > > > +    }
> > > >
> > > > Not all DMA goes through dma_buf_rw() -- why does it need changes?
> > >
> > > This one has the same goal, but accesses the qdev through sg, instead of
> > > PCI.
> >
> > Should dma_*() APIs take a reentrancy guard argument so that all DMA
> > accesses are systematically covered?
>
> That seems like it would be the best option, though it carries the cost
> of needing to tweak a lot of code in hw/. Maybe some refactoring tool
> could help with this.

Coccinelle is good at adding/removing arguments, but it doesn't know
how to get the DeviceState from, say, a PCIDevice. It may be possible
to cover the majority of cases automatically by writing a cocci
pattern that applies when the containing function takes a PCIDevice*
argument, for example. Some manual work would still be necessary.

Stefan

