Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C784436FDC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:18:07 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdk8E-0000ho-IE
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdk6y-0007Zi-3A
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdk6w-00024k-3Q
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634869005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvbAugsF0qoOP2fHztNR3WBoqHsUEhZQQ/NJsr72qb0=;
 b=IfGysROtfRxRAAVasTmsCbgfyxk8mz+8M2eXU1Fz0dc0Z/bCGrIEiVoryTbioKfpskBTxG
 aY8cRMNum5xuM9UPEfxeMLUFWDzX67Jot4CGiCv8Zv/H7HmO7nOPGR2J0ouMt3tCHsXuLf
 JfOHyZ/WQc/jz0VUia2IOeODEWbIjYU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-VpYDF6I_MqOE58s6_0_inw-1; Thu, 21 Oct 2021 22:16:44 -0400
X-MC-Unique: VpYDF6I_MqOE58s6_0_inw-1
Received: by mail-pf1-f199.google.com with SMTP id
 p10-20020a056a000b4a00b0044cf01eccdbso1419099pfo.19
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 19:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UvbAugsF0qoOP2fHztNR3WBoqHsUEhZQQ/NJsr72qb0=;
 b=ufWmvH2l/cHhz69bds2Td/E6eek6R+yfxUz2Dmop4QlFsoZ/qDm9AWilgizYIMdXS+
 4mqVQ4gR71at3TpqMeziBjFXqob2gUgBim26BqiHhFza/Zg5dWH4uIrOSkyb8r99SnbE
 9Mb4vjlUDc3SJHHHm/dF7dK9EnuJC/9hCoelMF7gmdYM3r3yAk38Cy6Z7sxoY5M3BqkO
 5uQlOX6uj1CDsAIfVzFl++GJjo1h96vzMw5l19HU/R4121/muXxoWEmqrLv53q3iJnkl
 2tqUchD2vsR82QCPPo5k1Ni1BHLLH33SUW+VOy3EXcCujeouiBmLt6M+hr73lxQfh4i5
 Smcw==
X-Gm-Message-State: AOAM531CzY1cV4WHxNMPv0Hk5PGQJTX0lVlshUwQZ74fdHbEnWUBPGU5
 DqzRsbE4J8xD36Hx/elShxKNmBPIjnmMljOl4iYk7RTkRR7urKdwYWsrI2QKbu+2qMFKps2ggsW
 5SfF/uIEAVhKVx4k=
X-Received: by 2002:a17:90a:9744:: with SMTP id
 i4mr11267956pjw.241.1634869003102; 
 Thu, 21 Oct 2021 19:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdKSWuZUHtX8RosYhWliq5vzM+WZ0QNTYNtrnv+CNbl/Ld3p+3V7YVMciHtb/XvKKzXHFscQ==
X-Received: by 2002:a17:90a:9744:: with SMTP id
 i4mr11267912pjw.241.1634869002826; 
 Thu, 21 Oct 2021 19:16:42 -0700 (PDT)
Received: from xz-m1.local ([94.177.118.50])
 by smtp.gmail.com with ESMTPSA id g11sm6568881pgn.41.2021.10.21.19.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 19:16:42 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:16:33 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 1/8] pci: Define pci_bus_dev_fn type
Message-ID: <YXIfAbWwnvkSETkT@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-2-peterx@redhat.com>
 <f9531d03-e6ca-50ce-22c7-3616fae9d6fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f9531d03-e6ca-50ce-22c7-3616fae9d6fc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 01:15:03PM +0200, Eric Auger wrote:
> Hi Peter,
> 
> On 10/21/21 12:42 PM, Peter Xu wrote:
> > It's used in quite a few places of pci.c and also in the rest of the code base.
> > Define such a hook so that it doesn't need to be defined all over the places.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  hw/pci/pci.c         | 14 ++++----------
> >  include/hw/pci/pci.h |  7 ++++---
> >  2 files changed, 8 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > index 186758ee11..1ab2b78321 100644
> > --- a/hw/pci/pci.c
> > +++ b/hw/pci/pci.c
> > @@ -1655,9 +1655,7 @@ static const pci_class_desc pci_class_descriptions[] =
> >  };
> >  
> >  static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> > -                                                  void (*fn)(PCIBus *b,
> > -                                                             PCIDevice *d,
> > -                                                             void *opaque),
> > +                                                  pci_bus_dev_fn fn,
> >                                                    void *opaque)
> >  {
> >      PCIDevice *d;
> > @@ -1672,8 +1670,7 @@ static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> >  }
> >  
> >  void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
> > -                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
> > -                         void *opaque)
> > +                                 pci_bus_dev_fn fn, void *opaque)
> >  {
> >      bus = pci_find_bus_nr(bus, bus_num);
> >  
> > @@ -1683,9 +1680,7 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
> >  }
> >  
> >  static void pci_for_each_device_under_bus(PCIBus *bus,
> > -                                          void (*fn)(PCIBus *b, PCIDevice *d,
> > -                                                     void *opaque),
> > -                                          void *opaque)
> > +                                          pci_bus_dev_fn fn, void *opaque)
> >  {
> >      PCIDevice *d;
> >      int devfn;
> > @@ -1699,8 +1694,7 @@ static void pci_for_each_device_under_bus(PCIBus *bus,
> >  }
> >  
> >  void pci_for_each_device(PCIBus *bus, int bus_num,
> > -                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
> > -                         void *opaque)
> > +                         pci_bus_dev_fn fn, void *opaque)
> >  {
> >      bus = pci_find_bus_nr(bus, bus_num);
> >  
> > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > index 7fc90132cf..8e2d80860b 100644
> > --- a/include/hw/pci/pci.h
> > +++ b/include/hw/pci/pci.h
> > @@ -401,6 +401,8 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> >  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> >  #define TYPE_PCIE_BUS "PCIE"
> >  
> > +typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
> > +
> >  bool pci_bus_is_express(PCIBus *bus);
> >  
> >  void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
> > @@ -458,11 +460,10 @@ static inline int pci_dev_bus_num(const PCIDevice *dev)
> >  
> >  int pci_bus_numa_node(PCIBus *bus);
> >  void pci_for_each_device(PCIBus *bus, int bus_num,
> > -                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
> > +                         pci_bus_dev_fn fn,
> >                           void *opaque);
> >  void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
> > -                                 void (*fn)(PCIBus *bus, PCIDevice *d,
> > -                                            void *opaque),
> > +                                 pci_bus_dev_fn fn,
> >                                   void *opaque);
> >  void pci_for_each_bus_depth_first(PCIBus *bus,
> >                                    void *(*begin)(PCIBus *bus, void *parent_state),
> There is another candidate in
> hw/ppc/pegasos2.c:    void (*dtf)(PCIBus *bus, PCIDevice *d, FDTInfo *fi);
> but this may be coverted later by the maintainer of this file.

That one has the last parameter a specific type, rather than "void *".

> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

-- 
Peter Xu


