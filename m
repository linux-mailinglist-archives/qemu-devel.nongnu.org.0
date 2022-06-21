Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676755535A9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:15:20 +0200 (CEST)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fb5-0002YX-6K
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3fZC-0001cE-4E
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:13:22 -0400
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83]:7837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3fZ7-0003nQ-T8
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:13:20 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 206651744
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eXn65qm3ZXg8DWaSm/110Dro5gwXJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXjvUOf2MZTCgKogjOt7kpE4O75Lcz4NlQAVl/HpkHy4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXVnU4
 YqaT/D3YzdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VfrzF4noR5fLatA88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiM+t6OK23CuqsGuu0qS2TV1hUp/0l20c95NJ
 NplkrKOViE2PLf1qe0SbiVxNx5xGIxr9+qSSZS/mZT7I0zudnLtx7B3DxhzM9RJq6B4BmZB8
 fFeIzcIBvyBr7jukfTrF6823J5ldZi6VG8ckigIITXxBPI2R5zZa6/Xo9JUwV/cg+gURaiAO
 pNGNWYHgBLoZiJkHEcMMp0Hs732vVXWKjZ5pkOpuv9ii4TU5EkruFT3C/LMd9mXAMlYgEucj
 mTB+Wv/H1cdLtP39Nae2nelh+uKhCCiHYxLRez++fltj1megGcUDXX6SGeGnBVwsWbmM/o3F
 qDe0nB/8sDeKGTDogHBYiCF
IronPort-HdrOrdr: A9a23:8W4Xv6oycSJqlUXWV6+zj00aV5oReYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCBghrLEGgI1/qA/9SPIVyYysdtkY
 tmbqhiGJnRIDFB/KDHCdCDYrMdKQ+8gcSVuds=
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2022 11:11:37 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 bk10-20020a05620a1a0a00b006a6b1d676ebso16800943qkb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3564t5inNECPQfljHlkXjTypxztSqnkwZTSaQ9fJQw8=;
 b=UU3L80P558wczjgxdL72vfJS5cdfOn4WB76rEfr4UyLxwa1qbEIv/vsRTLJcP58dBT
 zfIlmEEdNHWgF1rsVWpnUrs0r81cA2c7+EzE57A3r98Sa1tXsrS4EHQPqgEr3Krg+PBX
 vLWRBjULuMmYUtkTTfs35ZbSlbZ37Fo0v6qSzGVzpxnz2q3rSHEcUtF7x/vjVCsvN48q
 PYGDb24JLnZCtWE3mvt+Vd7uBGrtXaUSv17RQK+yca8w5ikbTMTIsEKzfVRoj6GIWlkh
 2cKRfzSNapyU6ahZVC17Bse+Tc3KrJOGJT83Z/2CBHwVgJhWytY82LjsrgS1NJrkwOTL
 oBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3564t5inNECPQfljHlkXjTypxztSqnkwZTSaQ9fJQw8=;
 b=2TYXuULUCMW9EkgTpl7f71JI0EpVF9z9nU0W05lRb5ORjfT9cbLFa4eo9C9hlj+BcX
 m/REBkW4uLO9G0f5j4zOudmKq589TbfztqgrXPJ4DLUwYUdq9B5ZWhaS/c4/640CZQz0
 NvXgvsuD+kZY4SQOdo80p+vkdufJ5vIw00a1TPgu8K44dCzdRtGEhVHN7XjPmDwXdC7t
 o/zR3jQTtSQHiPsqsVMsokdjgk+EG/FUYWhzy4olZnd7ZXDWbtXfMxmn0TzkajvwXQ6a
 GZ3OTvXs1Fl4GIx5ZpEdOCNt9WWui7fmNyOdvSpTsE/iTFQHXzSetspt7Cxpr6wz6SRl
 qOUg==
X-Gm-Message-State: AJIora8z6E3v13lmDid033F62jGk+L9yTt1ykUDHVQ94QMLDRGNO0HZY
 1YI3d3ZNg6l5dOHVh+HBiTD9zb3ouBVvC1jJa7bhbSvDWnihWow3nMrDiOArJK+kvP6OpxjJj+Y
 D70IdIYcQ5CT7rttXS8WmUSgga8e/5w==
X-Received: by 2002:a05:620a:4454:b0:6ab:956a:1628 with SMTP id
 w20-20020a05620a445400b006ab956a1628mr13827295qkp.475.1655824295315; 
 Tue, 21 Jun 2022 08:11:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvCEcZV75v2hfWM7uAwFRTVncGdCin2RfiTpMu2itQ2eJfTXSliYhrRoqgx25Z+B11IKzgdQ==
X-Received: by 2002:a05:620a:4454:b0:6ab:956a:1628 with SMTP id
 w20-20020a05620a445400b006ab956a1628mr13827239qkp.475.1655824294687; 
 Tue, 21 Jun 2022 08:11:34 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 b24-20020ac84f18000000b00304de7561a8sm12571426qte.27.2022.06.21.08.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:11:33 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:11:30 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Li Qiang <liq3ea@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <20220621151130.6qrsjcn3aqjks7fn@mozz.bu.edu>
References: <20220609135851.42193-1-alxndr@bu.edu>
 <05eab126-b789-ccdf-6d99-f80ffab0c00a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05eab126-b789-ccdf-6d99-f80ffab0c00a@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
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

On 220621 1034, David Hildenbrand wrote:
> On 09.06.22 15:58, Alexander Bulekov wrote:
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
> >  }
> >  
> >  /**
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index 92c3d65208..6474dc51fa 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -193,6 +193,9 @@ struct DeviceState {
> >      int instance_id_alias;
> >      int alias_required_for_version;
> >      ResettableState reset;
> > +
> > +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> > +    int engaged_in_io;
> >  };
> >  
> >  struct DeviceListener {
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
> > +
> >      if (residual) {
> >          *residual = xresidual;
> >      }
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 7ba2048836..44a14bb4f5 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >      uint64_t access_mask;
> >      unsigned access_size;
> >      unsigned i;
> > +    DeviceState *dev = NULL;
> >      MemTxResult r = MEMTX_OK;
> >  
> >      if (!access_size_min) {
> > @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >          access_size_max = 4;
> >      }
> >  
> > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> > +    if (mr->owner &&
> > +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> 
> Would it make sense to define some helper function like
> memory_region_is_XXX (I assume XXX -> DEVICE_IO), to make that code
> easier to be consumed by humans?

Yes - There are a few other places that have similar checks. It probably
makes sense to consolidate them.
Thanks

> 
> Unfortunately I cannot really comment on the sanity of the approach,
> because the underlying problem isn't completely clear to me (I think
> other people on CC were involved in the discussions around DMA reentry
> and failed attempts in the past). Having that said, that approach
> doesn't look wrong to me.
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

