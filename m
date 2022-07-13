Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5A9573A98
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:53:00 +0200 (CEST)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBefb-00056M-FP
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oBee1-0003h2-EL
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:51:21 -0400
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82]:34943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1oBedy-0006Hm-Lk
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:51:20 -0400
X-IronPort-RemoteIP: 209.85.166.70
X-IronPort-MID: 210948773
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:byAC0aAK7GczNhVW/6Lhw5YqxClBgxIJ4kV8jS/XYbTApDhw0zdRy
 jYdDWCAaPuPMWL9KNsnboSy801Vu5WDmNRqTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NAw2LBVPivW0
 T/Mi5yHULOa82MsWo4kw/rrRMRH5amaVJsw5zTSVNgS1LPsvyB94KE3fMldG0DFrrx8RYZWc
 QpiIIaRpQs19z91Yj+sfy2SnkciG9Y+NiDX4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Vlf1Q9
 fkQnqCoEzluMauLlNk3fUhhRnQW0a1uoNcrIFC6uM2XikzBKj7inK0oA0YxMokVvO1wBAmi9
 9RCcGFLPk3F3rzohu3jIgVvrp1LwM3DNYcPvH165TvES/sqXPgvRo2QvIcJgGdv2Zsm8fD2Z
 NUcVAd1QAT8cRhLP0cbUZAjssGxiSyqG9FfgBfPzUYt2EDKwQlslbTgLtfRUtqNQ8pTgwCfv
 G2uwojiKhQTNdjayD3ct3zz3qnAmiT0XI9UH7q9nhJ3vGCuKqUoIEV+fTOGTTOR0CZSh/o3x
 5QoxxcT
IronPort-HdrOrdr: A9a23:nF/s6aNBGJh3IsBcThKjsMiBIKoaSvp037BN7TESdfU1SL36qy
 nAppomPCHP+UossR0b8+xp1sG7MAvhHbAc2/hqAV6JZniBhIOQRLsSlrcLKVXbalDDH5dmpN
 5dmstFaOEYb2IasS+g2njeLz9I+rDum5xA492w855Dd3AUV0gK1WpE42igfnGfhWF9dP8E/B
 X13Lsimwad
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jul 2022 11:51:15 -0400
Received: by mail-io1-f70.google.com with SMTP id
 i16-20020a5d9350000000b0067bce490d06so37566ioo.14
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1GOQ5nyP5HY9Owk1I2rAuOdHMa3NtVmRtFzuDQgfqng=;
 b=PIcjQZWjs69D45HRMvARKMrzNrdumu7WBLqE+KuIsRX16GjNXZvYeFlEagi+re9DBF
 CA8NJjtDVLBJtz9D1YlnbYI7N29gNRgZmZUuAPsWb9ns/uUOCQBPF2OJeAVHkSRZlyPC
 oRzcUpjrSAU3iwG2227AMAdpX+deCYnG1ZCdQAXr3rdRkIUkrO9WWkzJOmWTeRTQ8ABi
 UmQcmKi26h1WFXFKUGXJ8lLbpZzxaAi/OHrMtlZjEtGnyQHpsD/a/VWy6S2sciuNczmN
 Eg7dT/ZUm2k++ouMSSlT4H5wubrb04QUSzzYa+Ucjk9eW7L9lqU2m8zobB/7wq17R+TK
 8aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1GOQ5nyP5HY9Owk1I2rAuOdHMa3NtVmRtFzuDQgfqng=;
 b=a2jdWVzs9ecNXUx+knFyBYWelqKN/e+grMl406h9QmSTnd5TkLYPimI+0aQwqwSnoj
 F036psAUrwP83HuUTXRJ60brldGzZkpacAAXmtLZJ6E+Cxy+gjsMizcsVB5sMrMptSf7
 +rNP42cUKXwPFb9jJYKFIz6OA31VY1qeX9ZnJOAGDn/5yY6NUXzQcCugALs2qin8djdY
 0u42hCGc3e6KBs1nsZA9YAB8T5NxkX483CfheBJpmaEMM/JmiiOXppp+6dic1lYesYZ/
 3k2gL2lvkSTemP18zDhfsuJ2j0LKwGXtMqDPxGeISDsy3VfypGMI3TZhIub7RSBPP57r
 AQkQ==
X-Gm-Message-State: AJIora99yDm9s5zoJmDSxKDDlFhCis5/iK6k6Jo00YaOA9rHofmnio3c
 dLAioskYe3DmpDlXyaVgzuo7vQzjsAEaS9Djp9KmUH65bwVq9S5t4DGaT3kd7A4dSt4LhoYenrt
 xqFqFuVm8duS86yKbPnlveN3Ic9D74A==
X-Received: by 2002:a05:6602:29a2:b0:67b:99b9:3aa4 with SMTP id
 u2-20020a05660229a200b0067b99b93aa4mr2147422ios.167.1657727474306; 
 Wed, 13 Jul 2022 08:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tuYZA+a737pHuAf3T7Cbkqhcmk3u4O/0+aTLOobHPzUiZOiAOJAGuAaMoGrXRxg+mD05T/nw==
X-Received: by 2002:a05:6602:29a2:b0:67b:99b9:3aa4 with SMTP id
 u2-20020a05660229a200b0067b99b93aa4mr2147406ios.167.1657727474057; 
 Wed, 13 Jul 2022 08:51:14 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a92c745000000b002dc10fd4b88sm4898518ilp.29.2022.07.13.08.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 08:51:13 -0700 (PDT)
Date: Wed, 13 Jul 2022 11:51:08 -0400
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
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <20220713155108.5kgycuvnqdnywjyf@mozz.bu.edu>
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
 <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
 <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
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

That seems like it would be the best option, though it carries the cost
of needing to tweak a lot of code in hw/. Maybe some refactoring tool
could help with this.
-Alex

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
> Stefan



