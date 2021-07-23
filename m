Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA17A3D36DD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:36:19 +0200 (CEST)
Received: from localhost ([::1]:35872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qfJ-0004OZ-73
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6qdB-0002sw-Cj
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6qd8-0004dy-UT
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627029242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nvRMbBc5FYpsnEuAcCF6VN+L0qXB3tW/tYMPrv4k4Q=;
 b=hni1LRung/GQuu80ZULVrNh/254WwcXSYGvYkJ/VgngV8/Z1S1xeE0r/XawfPMCYlvBzUq
 tYOpCCAOPT4obqFVJOJvgV31X9KRRloYBwkriuVHv98I6ZF0em/mY1cR2dD+KfD86O/ehV
 6ED3g+UvY4Lr3xp4qCTVts+VjDqaeYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-mRG7HRV-OXabV0ikRb8Q-Q-1; Fri, 23 Jul 2021 04:34:00 -0400
X-MC-Unique: mRG7HRV-OXabV0ikRb8Q-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 n11-20020a05600c3b8bb029024c165e7f08so998151wms.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 01:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nvRMbBc5FYpsnEuAcCF6VN+L0qXB3tW/tYMPrv4k4Q=;
 b=a0W9JQRUZVS8oyvrqA9BDAyqlUw3PtCzfnPCB5tGGXJ6dcemdFFey2qStj4jYWkN+f
 wGkeFXofVilDkrBml3e8YceaQ59rdXVolpL5xHil0Y05nGAxBxlVE4zq5PmRT7dblAak
 oQZlvDkqOwwQKtGZ+uy/A3luiiMotdgrMJBZTPN7xl0ZS5w6nAcI9iJjfveaok8ATefy
 2DvTmRj/lBA8NnkpU/qwqf62M8bAIplDPTT9foukPP9Yp+owcyYROnHqdM4uxEdNm682
 NjDJkaWaEz2DBGwZqm6LPNVn1Y9jSgHJih9J+OuvU+mvNgwMe7u442ZHqxMyikahZMws
 Wwfg==
X-Gm-Message-State: AOAM532OB2g1+KDUv+VKRL0EcN9gbA4yvw06nQIgu/gis1Y3oDQapwGO
 dsw880qgc3nwHwmF3Q/uhj0GYrPov64dpfDJzvv6WZbsADChBfJqoMW8hAs3OEXC2zS/gpUuPlD
 K79qscW8WW6YcGQY=
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr4066409wri.38.1627029239756; 
 Fri, 23 Jul 2021 01:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwJ+zwwkdU8E76hCgY2SY2oWcMRF6zYGS6d8hh0CmeSEla9xL0FHVe7bKF+vieBEbdwJVG0A==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr4066379wri.38.1627029239433; 
 Fri, 23 Jul 2021 01:33:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n23sm27015584wmc.38.2021.07.23.01.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 01:33:58 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:33:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
Message-ID: <20210723103357.096c996c@redhat.com>
In-Reply-To: <20210723040328-mutt-send-email-mst@kernel.org>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
 <20210722133738-mutt-send-email-mst@kernel.org>
 <20210723094726.37036d68@redhat.com>
 <20210723040328-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 04:05:18 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jul 23, 2021 at 09:47:26AM +0200, Igor Mammedov wrote:
> > On Thu, 22 Jul 2021 13:49:34 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Thu, Jul 22, 2021 at 06:59:45AM -0400, Igor Mammedov wrote:  
> > > > Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
> > > > switched PCI hotplug from native to ACPI one by default.
> > > > 
> > > > That however breaks ihotplug on following CLI that used to work:    
> > > 
> > > s/ihotplug/hotplug/ ?
> > >   
> > > >    -nodefaults -machine q35 \
> > > >    -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
> > > >    -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
> > > > 
> > > > where PCI device is hotplugged to pcie-root-port-1 with error on guest side:
> > > > 
> > > >   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
> > > >   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
> > > >   ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
> > > >   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)
> > > > 
> > > > cause is that QEMU's ACPI hotplug never supported functions other then 0
> > > > and due to bug it was generating notification entries for not described
> > > > functions.
> > > > 
> > > > Technically there is no reason not to describe cold-plugged bridges
> > > > (root ports) on functions other then 0, as they similaraly to bridge
> > > > on function 0 are unpluggable.
> > > > 
> > > > Fix consists of describing cold-plugged bridges[root ports] on functions
> > > > other than 0.    
> > > 
> > > 
> > > I would add: since we need to describe multifunction devices  
> > 
> > ok
> >   
> > >   
> > > > 
> > > > Fixes: 17858a169508609ca9063c544833e5a1adeb7b52    
> > > 
> > > use short hash and include subject within ("subject here") please
> > >   
> > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > Reported-by: Laurent Vivier <lvivier@redhat.com>
> > > > ---
> > > >  hw/i386/acpi-build.c | 31 ++++++++++++++++++++++++-------
> > > >  1 file changed, 24 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > index b40e284b72..77cb7a338a 100644
> > > > --- a/hw/i386/acpi-build.c
> > > > +++ b/hw/i386/acpi-build.c
> > > > @@ -364,7 +364,7 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
> > > >      int32_t devfn = PCI_DEVFN(slot, 0);
> > > >  
> > > >      if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
> > > > -    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
> > > > +    aml_append(if_ctx, aml_notify(aml_name("^S%.03X", devfn), aml_arg(1)));
> > > >      aml_append(method, if_ctx);
> > > >  }
> > > >    
> > > 
> > > why are you adding a parent prefix here? anything wrong with
> > > relying on search rules?
> > > Seems like an unrelated change.  
> > it's remnants from time I was trying to figure out
> > why functions weren't visible, I'll drop it.
> > 
> >    
> > > Also there's always 8 bit in devfn. Why do we need an extra 0?  
> > 2 digits hold slot value, like it used to be and
> > the last one to hold function. Basically like it's shown in PCI.FW spec example.
> > 
> > but if you prefer to print raw devfn I can change to that,
> > it should work as well.  
> 
> will make the patch smaller, won't it? we can always change it
> separately to match spec examples more closely.

sure, done

> 
> > > > @@ -389,18 +389,26 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> > > >          PCIDeviceClass *pc;
> > > >          PCIDevice *pdev = bus->devices[devfn];
> > > >          int slot = PCI_SLOT(devfn);
> > > > +        int func = PCI_FUNC(devfn);
> > > > +        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
> > > > +        int adr = slot << 16 | func;
> > > >          bool hotplug_enabled_dev;
> > > >          bool bridge_in_acpi;
> > > >          bool cold_plugged_bridge;
> > > >  
> > > >          if (!pdev) {
> > > > -            if (bsel) { /* add hotplug slots for non present devices */
> > > > +            /*
> > > > +             * add hotplug slots for non present devices.
> > > > +             * hotplug is supported only for non-multifunction device
> > > > +             * so generate device description only for function 0
> > > > +             */
> > > > +            if (bsel && !PCI_FUNC(devfn)) {    
> > > 
> > > replace with func here and elsewhere?  
> > 
> > ok
> >   
> > >   
> > > >                  if (pci_bus_is_express(bus) && slot > 0) {
> > > >                      break;
> > > >                  }
> > > > -                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> > > > +                dev = aml_device("S%.03X", devfn);
> > > >                  aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> > > > -                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> > > > +                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
> > > >                  method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> > > >                  aml_append(method,
> > > >                      aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> > > > @@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> > > >              continue;
> > > >          }
> > > >  
> > > > +        /*
> > > > +         * allow describing coldplugged bridges in ACPI even if they are not
> > > > +         * on function 0, as they are not unpluggale, for all other devices    
> > > 
> > > 
> > > unpluggable 
> > >   
> > > > +         * generate description only for function 0 per slot
> > > > +         */
> > > > +        if (PCI_FUNC(devfn) && !bridge_in_acpi) {
> > > > +            continue;
> > > > +        }
> > > > +
> > > >          /* start to compose PCI slot descriptor */
> > > > -        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
> > > > -        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
> > > > +        dev = aml_device("S%.03X", devfn);
> > > > +        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
> > > >  
> > > >          if (bsel) {
> > > >              /*
> > > > @@ -529,7 +546,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
> > > >                      continue;
> > > >                  }
> > > >  
> > > > -                aml_append(method, aml_name("^S%.02X.PCNT",
> > > > +                aml_append(method, aml_name("^S%.03X.PCNT",
> > > >                                              sec->parent_dev->devfn));
> > > >              }
> > > >          }
> > > > -- 
> > > > 2.27.0    
> > >   
> 


