Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834205536E8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:55:52 +0200 (CEST)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gEJ-0006kG-5P
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3gBp-0005Ei-39
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:53:18 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79]:3141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3gBm-0002xo-N4
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:53:16 -0400
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 210142317
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BSAOeq+dpWg2yOjb2YIuDrUDC3yTJUtcMsCJ2f8bNWPcYEJGY0x3x
 2obCDyDOK7cNmOhedlxOd638UgBucPczNdjTANr/yAxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjWlvU0
 T/Pi5a31GGNimYc3l08tvrrRCNH5JwebxtB4zTSzdgS1LPvvyB94KA3fMldHFOhKmVgJdNWc
 s6YpF2PEsI1yD92Yj+tuu6TnkTn2dc+NyDX4pZdc/HKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O1xv5GccAkLBfePub4dC1pITz9TEqITrdcrIVDn2SCS50jPcn+p2us3SU9pZ8sX/eF4BWwI/
 vsdQNwPRkrb1qTmnfThE7gq2Z5LwMrDZevzvllpySHfAewOS42FTqnXjTNd9G1p3pkSR62HO
 KL1bxJeUAnqeEZeHmtML7sUp/zz2UbxdQZH/Qf9Sa0fpjK7IBZK+KHgNceQdtGUSMF9mEGeq
 WTbuWPjDXkn2Me3zDOE9je1mLaKk3yhHo0VE7K8+7hhh1j7KnEvNSD6nGCT+ZGR4nNSkfoAQ
 6DI0kLCdZQPyXE=
IronPort-HdrOrdr: A9a23:VudoaKGGsdxWBMBhpLqE7MeALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rsCMc9wxhP03I9ergBED4ex3hHP1OkO0s1NWZLWvbUTCTQL2KhLGKqwEIcBeOldK1u5
 0BT0COYOeeMbFyt7ed3DWF
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2022 11:53:11 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 s11-20020a0562140cab00b0046e7d2b24b3so14092570qvs.16
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ani7Hyxf4d7s9VOSX7OoVRu57B+LQnkEDxKc7dAdYzc=;
 b=dw+h8jLXOE2K4z2w1a4QC5VlDB8z3DhVGRlc2P63llwvIvZ9akdyC6U53eYyxQCU2z
 k6oLrGQwFRtK3j2Na++obJa6s2kqeSqPu2LtzLZVhGRgnAFZqRyan2LgTXmdHRbw3V1A
 X3/d5GhS6ALCsgalNOPwX7gTijg6WpJ44bkeoUmRtTcc0jo3Ox7ZSoMRak9jE0pbkbey
 eYyLTtR+3GVDfPjMsFmoj9WNw4Y0moWFCSpeZVQWraraLlbZiACWPZCdC5aaxh1tCWBz
 3XAKGV3LXXxGalrEVjDn2Tq/q5+3MxyjauzGB3xcLQfc6AGwwLRSQSzwH7DimX1kKUXQ
 0XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ani7Hyxf4d7s9VOSX7OoVRu57B+LQnkEDxKc7dAdYzc=;
 b=Mqulcw/yeejmJvvYPhQ3TR0tGLnVAL5tCPjR3pudc5OsMSqvYIglj90tE7tHfxp8rX
 fLRrltqHkpoGR2xvJYo+2/u/9Pw58XMCsQGqJukmItUeGnFEFjviHdV9dABJHbGFEjje
 bicmSbikznD6CncmQOHnHXykosPNfarMx4dxJJZAVCwlnE3qFYEVZ0xld9odSIvOVgn5
 L51qW9HH5GS+FI6i89Yh3LSK2Jdd3nvppaX/dkTFtKxZYRpL4l6C4eLdEAQu3eHk0NDE
 UNsvYZ7qk0miMj6VIeU80+1vX5U68tNWIhTaYi+yNYL4lULWHLgsAjQShxDh9aIgSDi/
 q+ZQ==
X-Gm-Message-State: AJIora9Jp+483rtFt15lvyo2Q5amS7j2u7visKuWgJjT3QDlcOinYm8Q
 qO5/8AUEn309G6q2wDIuMH9vfVolbMJpEb7OQyBNZmmlIFdanLANV8cSzay2X5WpTynz1DwyYVv
 78BOLWsMCpmbQuZaGBl1cODWeyY+UYg==
X-Received: by 2002:ad4:5c4a:0:b0:464:5920:7c1a with SMTP id
 a10-20020ad45c4a000000b0046459207c1amr23614688qva.58.1655826791178; 
 Tue, 21 Jun 2022 08:53:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcuRfiPe/xY10Ch1EYeMALzqpaVXVQ8h66QfWbx/B6EhbjtFVgGbMztfUwryn35eHGTnIEng==
X-Received: by 2002:ad4:5c4a:0:b0:464:5920:7c1a with SMTP id
 a10-20020ad45c4a000000b0046459207c1amr23614649qva.58.1655826790866; 
 Tue, 21 Jun 2022 08:53:10 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05620a410600b006a6d3a6d597sm15456487qko.71.2022.06.21.08.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:53:10 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:53:06 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220621 1630, Peter Maydell wrote:
> On Thu, 9 Jun 2022 at 14:59, Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > This flag is set/checked prior to calling a device's MemoryRegion
> > handlers, and set when device code initiates DMA.  The purpose of this
> > flag is to prevent two types of DMA-based reentrancy issues:
> >
> > 1.) mmio -> dma -> mmio case
> > 2.) bh -> dma write -> mmio case
> >
> > These issues have led to problems such as stack-exhaustion and
> > use-after-frees.
> >
> > Summary of the problem from Peter Maydell:
> > https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  include/hw/pci/pci.h   | 13 +++++++++++--
> >  include/hw/qdev-core.h |  3 +++
> >  softmmu/dma-helpers.c  | 12 ++++++++++++
> >  softmmu/memory.c       | 15 +++++++++++++++
> >  softmmu/trace-events   |  1 +
> >  5 files changed, 42 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index 44dacfa224..ab1ad0f7a8 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> >                                       void *buf, dma_addr_t len,
> >                                       DMADirection dir, MemTxAttrs attrs)
> >  {
> > -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > -                         dir, attrs);
> > +    bool prior_engaged_state;
> > +    MemTxResult result;
> > +
> > +    prior_engaged_state = dev->qdev.engaged_in_io;
> > +
> > +    dev->qdev.engaged_in_io = true;
> > +    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > +                           dir, attrs);
> > +    dev->qdev.engaged_in_io = prior_engaged_state;
> > +
> > +    return result;
> 
> Why do we need to do something in this pci-specific function ?
> I was expecting this to only need changes at the generic-to-all-devices
> level.

Both of these handle the BH->DMA->MMIO case. Unlike MMIO, I don't think
there is any neat way to set the engaged_in_io flag as we enter a BH. So
instead, we try to set it when a device initiates DMA.

The pci function lets us do that since we get a glimpse of the dev/qdev
(unlike the dma_memory_...  functions).

> 
> 
> > diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> > index 7820fec54c..7a4f1fb9b3 100644
> > --- a/softmmu/dma-helpers.c
> > +++ b/softmmu/dma-helpers.c
> > @@ -288,8 +288,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
> >      uint8_t *ptr = buf;
> >      dma_addr_t xresidual;
> >      int sg_cur_index;
> > +    DeviceState *dev;
> > +    bool prior_engaged_state;
> >      MemTxResult res = MEMTX_OK;
> >
> > +    dev = sg->dev;
> > +    if (dev) {
> > +        prior_engaged_state = dev->engaged_in_io;
> > +        dev->engaged_in_io = true;
> > +    }
> > +
> >      xresidual = sg->size;
> >      sg_cur_index = 0;
> >      len = MIN(len, xresidual);
> > @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
> >          xresidual -= xfer;
> >      }
> >
> > +    if (dev) {
> > +        dev->engaged_in_io = prior_engaged_state;
> > +    }
> 
> Not all DMA goes through dma_buf_rw() -- why does it need changes?

This one has the same goal, but accesses the qdev through sg, instead of
PCI.
-Alex


> 
> > +
> >      if (residual) {
> >          *residual = xresidual;
> >      }
> 
> thanks
> -- PMM

