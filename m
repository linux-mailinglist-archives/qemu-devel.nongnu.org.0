Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CE26F652
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 08:51:40 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJAF9-0002bq-8Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 02:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kJAE1-0001pQ-FX
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 02:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kJADz-0007QL-FJ
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 02:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600411826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=stQhjbmY26EZwRMyWZprYNgLaph2WmAJjyNYOreT0lw=;
 b=RgyQYT9aEuWhaRykhgH2djdjy0HrgeJOTHMsoyJm/bfC80ZCcjZcmnDNFcMsSiwvu9NWo2
 24UcwXjoz3Gt0Au2OXOnExwfOWqBaX/coI2rbezC2TIEcG6ePZE66YGUz43FYXP6y3yVoU
 pRmemEGvQLXhGaOMq9J48IyYPxZRSKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-eTDybSBfNjSKMVRNStrxOw-1; Fri, 18 Sep 2020 02:50:24 -0400
X-MC-Unique: eTDybSBfNjSKMVRNStrxOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93BA51008302;
 Fri, 18 Sep 2020 06:50:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8016878813;
 Fri, 18 Sep 2020 06:50:13 +0000 (UTC)
Date: Fri, 18 Sep 2020 08:50:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v2 3/4] hw/i386/acpi-build: Turn off support of PCIe
 native hot-plug and SHPC in _OSC
Message-ID: <20200918085011.63c087c3@redhat.com>
In-Reply-To: <CAMDeoFUJ3MM9k-FG7AX=1nri8KXZjZfc87pBKF8ZCfGKLfw++A@mail.gmail.com>
References: <20200818215227.181654-1-jusual@redhat.com>
 <20200818215227.181654-4-jusual@redhat.com>
 <20200821141339.00f2076c@redhat.com>
 <CAMDeoFU4nHJZ6FNtTKjnpA8h12AmLpycSEKGkUO85CNy643WyQ@mail.gmail.com>
 <CAMDeoFW+KC69j7GW_-w5n1iJashYmZ2i_f-nEsPOs3DQkzog7g@mail.gmail.com>
 <20200917080123.29b7e838@redhat.com>
 <CAMDeoFUJ3MM9k-FG7AX=1nri8KXZjZfc87pBKF8ZCfGKLfw++A@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Sep 2020 12:40:16 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> On Thu, Sep 17, 2020 at 8:01 AM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed, 16 Sep 2020 21:14:36 +0200
> > Julia Suvorova <jusual@redhat.com> wrote:
> >  
> > > On Wed, Sep 16, 2020 at 8:03 PM Julia Suvorova <jusual@redhat.com> wrote:  
> > > >
> > > > On Fri, Aug 21, 2020 at 2:13 PM Igor Mammedov <imammedo@redhat.com> wrote:  
> > > > >
> > > > > On Tue, 18 Aug 2020 23:52:26 +0200
> > > > > Julia Suvorova <jusual@redhat.com> wrote:
> > > > >  
> > > > > > Other methods may be used if the system is capable of this and the _OSC bit
> > > > > > is set. Disable them explicitly to force ACPI PCI hot-plug use. The older
> > > > > > versions will still use PCIe native.
> > > > > >
> > > > > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > > > > ---
> > > > > >  hw/i386/acpi-build.h | 11 +++++++++++
> > > > > >  hw/i386/acpi-build.c | 21 +++++++++++++++------
> > > > > >  2 files changed, 26 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> > > > > > index 74df5fc612..6f94312c39 100644
> > > > > > --- a/hw/i386/acpi-build.h
> > > > > > +++ b/hw/i386/acpi-build.h
> > > > > > @@ -5,6 +5,17 @@
> > > > > >
> > > > > >  extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
> > > > > >
> > > > > > +/* PCI Firmware Specification 3.2, Table 4-5 */
> > > > > > +typedef enum {
> > > > > > +    ACPI_OSC_NATIVE_HP_EN = 0,
> > > > > > +    ACPI_OSC_SHPC_EN = 1,
> > > > > > +    ACPI_OSC_PME_EN = 2,
> > > > > > +    ACPI_OSC_AER_EN = 3,
> > > > > > +    ACPI_OSC_PCIE_CAP_EN = 4,
> > > > > > +    ACPI_OSC_LTR_EN = 5,
> > > > > > +    ACPI_OSC_ALLONES_INVALID = 6,
> > > > > > +} AcpiOSCField;
> > > > > > +
> > > > > >  void acpi_setup(void);
> > > > > >
> > > > > >  #endif
> > > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > > index f3cd52bd06..c5f4802b8c 100644
> > > > > > --- a/hw/i386/acpi-build.c
> > > > > > +++ b/hw/i386/acpi-build.c
> > > > > > @@ -1411,7 +1411,7 @@ static void build_i386_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> > > > > >      aml_append(table, scope);
> > > > > >  }
> > > > > >
> > > > > > -static Aml *build_q35_osc_method(void)
> > > > > > +static Aml *build_q35_osc_method(AcpiPmInfo *pm)
> > > > > >  {
> > > > > >      Aml *if_ctx;
> > > > > >      Aml *if_ctx2;
> > > > > > @@ -1419,6 +1419,7 @@ static Aml *build_q35_osc_method(void)
> > > > > >      Aml *method;
> > > > > >      Aml *a_cwd1 = aml_name("CDW1");
> > > > > >      Aml *a_ctrl = aml_local(0);
> > > > > > +    unsigned osc_ctrl;
> > > > > >
> > > > > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > > > > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > > > > > @@ -1430,11 +1431,19 @@ static Aml *build_q35_osc_method(void)
> > > > > >
> > > > > >      aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
> > > > > >
> > > > > > +    /* Always allow native PME, AER (depend on PCIE Capability Control) */
> > > > > > +    osc_ctrl = BIT(ACPI_OSC_PME_EN) | BIT(ACPI_OSC_AER_EN) |
> > > > > > +               BIT(ACPI_OSC_PCIE_CAP_EN);
> > > > > > +
> > > > > >      /*
> > > > > > -     * Always allow native PME, AER (no dependencies)
> > > > > > -     * Allow SHPC (PCI bridges can have SHPC controller)
> > > > > > +     * Guests seem to generally prefer native hot-plug control.
> > > > > > +     * Enable it only when we do not use ACPI hot-plug.
> > > > > >       */
> > > > > > -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > > > > > +    if (!pm->pcihp_bridge_en) {
> > > > > > +        osc_ctrl |= BIT(ACPI_OSC_NATIVE_HP_EN) | BIT(ACPI_OSC_SHPC_EN);
> > > > > > +    }  
> > > > >
> > > > > ACPI hotplug works only for coldplugged bridges, and native one is used
> > > > > on hotplugged ones.
> > > > > Wouldn't that break SHPC/Native hotplug on hotplugged PCI/PCI-E bridge?  
> > >
> > > Wait, what configuration are you talking about exactly?  
> > Currently on piix4, we have ACPI and native hotplug working simultaneously
> > the former works on cold-plugged bridges and if you hotplug another bridge,
> > that one will use native method.
> > With above hunk it probably will break.  
> 
> Ok, I will add a check for piix4.

can we have the same behavior for q35 as well?
i.e. 
   could-plugged => ACPI hotplug
   hotplugged ports, bridges, whatnot => native hotplug


> 
> > >  
> > > > > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(osc_ctrl), a_ctrl));
> > > > > >
> > > > > >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> > > > > >      /* Unknown revision */
> > > > > > @@ -1514,7 +1523,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > > >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > > > > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > > > > >          aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > > > > -        aml_append(dev, build_q35_osc_method());
> > > > > > +        aml_append(dev, build_q35_osc_method(pm));
> > > > > >          aml_append(sb_scope, dev);
> > > > > >          aml_append(dsdt, sb_scope);
> > > > > >
> > > > > > @@ -1590,7 +1599,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > > > > >              if (pci_bus_is_express(bus)) {
> > > > > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > > > > >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > > > > > -                aml_append(dev, build_q35_osc_method());
> > > > > > +                aml_append(dev, build_q35_osc_method(pm));
> > > > > >              } else {
> > > > > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > > > > >              }  
> > > > >  
> > >  
> >  
> 


