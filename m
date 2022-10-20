Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD5606B19
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:15:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldpC-0004dI-8W
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:15:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldlR-0000cB-Rh
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oldlG-0000Sg-Ic
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:11:37 -0400
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oldlE-0003OS-Nh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:11:34 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 231676339
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tglX/aMl9xJ/UyDvrR0UlcFynXyQoLVcMsEvi/4bfWQNrUomgjcEx
 2UYC2uAa6uDYmLwKdwnOdvjpBgGupbTx4RjHAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOZTdJ5xYuajhOsvrZ8Es11BjPkGhwUmIWNKgjUGD2yiF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56iGqE4aue60Tum0xK6b5Ofbi1q/UTe5Eqa2M00Mi+7gx3R9zx4J
 U4kWZaYEG/FNYWV8AgRvoUx/4iT8sSq9ZeeSUVTv/B/wGXINGDTwdsyEHsuIIki0KVMPn1p0
 K0xfWVlghCr34pawZq+Q+how909dYzlY9pZtXZnwjXUS/0hRPgvQY2QvY4ejGp23JkfW6mHD
 yYaQWMHgBDoahlfPFsNIJgj2uqkmxETdhUC8wvL+vRsuDm7IApZ8p3BYPHZc8KzZIZ4shaTl
 l3D9H7WHURPXDCY4X/fmp62vcfWkCbmHY4fCrC83vhthlKV2yoUEhJ+aLegifywi0r7QswGb
 kJLo2whqq898EHtRd74N/GlnEO5Utcnc4I4O4UHBMulkMI4Py7x6rA4cwN8
IronPort-HdrOrdr: A9a23:j3mLHqyb5yl+V5XtCo1rKrPwGL1zdoMgy1knxilNoH1uA6mlfq
 WV954mPHDP5Ar5NEtOpTn4Atj6fZq+z+8W3WByB9eftWDd0QPEEGgF1+XfKlbbak7DH4BmtJ
 uIPJIOb+EYSWIK9PoT3WGDYrIdKObuytHRuQ/9p00dKz1XVw==
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 18:11:27 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 q16-20020a0ce210000000b004ba8976d3aaso390685qvl.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cmCDRjsUmYobkjUhhgvmMYj33PcU4au5ANOt49iQ6FY=;
 b=PaBxC6AkeAdLo/hx8bnsgdom9j1k9Q/7m9pwKK+S4DDGrdtfsfF1lYIoHBxB05jzk0
 TGMAVoAFjULO8m5TLwaTA7DYMgETCy86sP6s+zE6FiBL3cmq0+LEGxPpNq9scuOvu2qD
 kJaB2zTArItKghuHfSyKC/24wpbnEjoz+nMFUO3vuqdInkpgZ++4YWpPzGMbvFP8+4A4
 pcRWpK3Q7+Oh68BUAlzS2lt1/aVOKTw/iyBC9vfIdzDeF6Vu/gGJRJWk2YHhtKTP/xPE
 bbO0f1V05RDIYy0VidhJ/L0hZHYxmrsONxeSLYDGTOn5N/Ce512SVlUfhputs+HVKOrI
 POBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmCDRjsUmYobkjUhhgvmMYj33PcU4au5ANOt49iQ6FY=;
 b=zvVg46eH/zWB6HU1/fd2qzEyMDj33j8TC2S1RPKwK00JtnnMrVnBj3QUmQq5zrJGR9
 E/jYsns00fWhLRU3tJFw+e5FOYZRMPQVthkCKi3CE8ywsxETB8ISFIMkABswDC5LJQn0
 jWYjvZpDOclpOYhSCX485vkHAZxF2oAV5zuSwATUxroiJNuKNylmweGkepCVT9VcYT3x
 Py9cFrGVVThYaFBYLB/zB0yKUopgcL3qsQKwJ4qPLKVdOqYgtYqYfiJwG5Xu+CsiFexS
 GFN3Jrm7sIN4qeIrhvvLnig63nEmx4D+dBTYZXUR/4pAkWmCGmJPU8TrNhK59ezMNyf7
 k3kg==
X-Gm-Message-State: ACrzQf3QKPWGUCPyGHI3ePx1WfpiY37oWcWdC0y436c/tMegygZe++7i
 EmNe54skPAXiXTNFOgR+DW+LTyLhyCXSCFlIGUb/lhDuSJtNy23NgkWnRpNerSLWzqknfFKF8gh
 XEYyaatiLpqIyYRgc7tLNrVB/13qKcQ==
X-Received: by 2002:a05:6214:ca8:b0:4b1:87f8:c4ef with SMTP id
 s8-20020a0562140ca800b004b187f8c4efmr13303383qvs.50.1666303885359; 
 Thu, 20 Oct 2022 15:11:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XVzMrY0IEjs2lyYCPLcR0gvtjdnT9pnLLPJkkwfK/aifAwXVrUeKPSF/Nbc9Po9XniTA7MQ==
X-Received: by 2002:a05:6214:ca8:b0:4b1:87f8:c4ef with SMTP id
 s8-20020a0562140ca800b004b187f8c4efmr13303352qvs.50.1666303885063; 
 Thu, 20 Oct 2022 15:11:25 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a05620a448600b006eecc4a0de9sm8487725qkp.62.2022.10.20.15.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:11:24 -0700 (PDT)
Date: Thu, 20 Oct 2022 18:11:06 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <20221020220928.7gxd33eszrv7que5@mozz.bu.edu>
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
 <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
 <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.781, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 220712 1034, Stefan Hajnoczi wrote:
> On Tue, Jun 21, 2022 at 11:53:06AM -0400, Alexander Bulekov wrote:
> > On 220621 1630, Peter Maydell wrote:
> > > On Thu, 9 Jun 2022 at 14:59, Alexander Bulekov <alxndr@bu.edu> wrote:
> > > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > > index 44dacfa224..ab1ad0f7a8 100644
> > > > --- a/include/hw/pci/pci.h
> > > > +++ b/include/hw/pci/pci.h
> > > > @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> > > >                                       void *buf, dma_addr_t len,
> > > >                                       DMADirection dir, MemTxAttrs attrs)
> > > >  {
> > > > -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > > > -                         dir, attrs);
> > > > +    bool prior_engaged_state;
> > > > +    MemTxResult result;
> > > > +
> > > > +    prior_engaged_state = dev->qdev.engaged_in_io;
> > > > +
> > > > +    dev->qdev.engaged_in_io = true;
> > > > +    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > > > +                           dir, attrs);
> > > > +    dev->qdev.engaged_in_io = prior_engaged_state;
> > > > +
> > > > +    return result;
> > > 
> > > Why do we need to do something in this pci-specific function ?
> > > I was expecting this to only need changes at the generic-to-all-devices
> > > level.
> > 
> > Both of these handle the BH->DMA->MMIO case. Unlike MMIO, I don't think
> > there is any neat way to set the engaged_in_io flag as we enter a BH. So
> > instead, we try to set it when a device initiates DMA.
> > 
> > The pci function lets us do that since we get a glimpse of the dev/qdev
> > (unlike the dma_memory_...  functions).
> ...
> > > > @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
> > > >          xresidual -= xfer;
> > > >      }
> > > >
> > > > +    if (dev) {
> > > > +        dev->engaged_in_io = prior_engaged_state;
> > > > +    }
> > > 
> > > Not all DMA goes through dma_buf_rw() -- why does it need changes?
> > 
> > This one has the same goal, but accesses the qdev through sg, instead of
> > PCI.
> 
> Should dma_*() APIs take a reentrancy guard argument so that all DMA
> accesses are systematically covered?
> 
>   /* Define this in the memory API */
>   typedef struct {
>       bool engaged_in_io;
>   } MemReentrancyGuard;
> 
>   /* Embed MemReentrancyGuard in DeviceState */
>   ...
> 
>   /* Require it in dma_*() APIs */
>   static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
>                                           void *buf, dma_addr_t len,
>                                           DMADirection dir, MemTxAttrs attrs,
> 					  MemReentrancyGuard *guard);
> 
>   /* Call dma_*() APIs like this... */
>   static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                        void *buf, dma_addr_t len,
>                                        DMADirection dir, MemTxAttrs attrs)
>   {
>       return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
>                            dir, attrs, &dev->qdev.reentrancy_guard);
>   }
> 

Taking a stab at this. Here is the list of DMA APIs that appear to need
changes:
dma_memory_valid (1 usage)
dma_memory_rw (~5 uses)
dma_memory_read (~92 uses)
dma_memory_write (~71 uses)
dma_memory_set (~4 uses)
dma_memory_map (~18 uses)
dma_memory_unmap (~21 uses)
{ld,st}_{le,be}_{uw,l,q}_dma (~10 uses)
ldub_dma (does not appear to be used anywhere)
stb_dma (1 usage)
dma_buf_read (~18 uses)
dma_buf_write (~7 uses)

These appear to be internal to the DMA API and probably don't need to be
changed:
dma_memory_read_relaxed (does not appear to be used anywhere)
dma_memory_write_relaxed (does not appear to be used anywhere)
dma_memory_rw_relaxed 

I don't think the sglist APIs need to be changed since we can get
DeviceState from the QEMUSGList.

Does this look more-or-less right?
-Alex

