Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E37220E0E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 15:24:31 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvhOg-0006S1-Ue
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 09:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jvhNx-0005zv-6o
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 09:23:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24250
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jvhNu-0008AJ-06
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 09:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594819421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrZxBMAmm7/rjB4ekLHhW7DWAaR2tNZPxMxSX42WlrY=;
 b=L0tn9jMDOilKljVhGMXt0Hpw6SbiviUdUOSabBo3Hdc9phTqbO88HO+lfQnvEQQjIIoafW
 gOoQYRqiQURhYMDDcaeXr1XvFBfi2xJE8JCO/WjLtS7iCNF4pvopZLXzp5UbaVL02UgF+h
 3vuMu6N6d7QJ54PAv1DZxUOKX4AS9rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-fz45W7-0MOaXAQVB-b1_Nw-1; Wed, 15 Jul 2020 09:23:39 -0400
X-MC-Unique: fz45W7-0MOaXAQVB-b1_Nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A05D7106B250
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 13:23:38 +0000 (UTC)
Received: from localhost (unknown [10.40.208.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE32710A1;
 Wed, 15 Jul 2020 13:23:27 +0000 (UTC)
Date: Wed, 15 Jul 2020 15:23:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 4/5] hw/i386/acpi-build: Turn off support of PCIe
 native hot-plug and SHPC in _OSC
Message-ID: <20200715152326.2e38ddb8@redhat.com>
In-Reply-To: <20200714040118-mutt-send-email-mst@kernel.org>
References: <20200708224615.114077-1-jusual@redhat.com>
 <20200708224615.114077-5-jusual@redhat.com>
 <20200713165654.1f78af8f@redhat.com>
 <20200714040118-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 05:07:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Jul 2020 04:39:53 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jul 13, 2020 at 04:56:54PM +0200, Igor Mammedov wrote:
> > On Thu,  9 Jul 2020 00:46:14 +0200
> > Julia Suvorova <jusual@redhat.com> wrote:
> >   
> > > Other methods may be used if the system is capable of this and the _OSC bit
> > > is set. Disable them explicitly to force ACPI PCI hot-plug use. The older
> > > versions will still use PCIe native.  
> 
> Do we need that later part btw?
> 
> > > 
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  hw/i386/acpi-build.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 5c5ad88ad6..0e2891c3ea 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1599,6 +1599,7 @@ static Aml *build_q35_osc_method(AcpiPmInfo *pm)
> > >      Aml *method;
> > >      Aml *a_cwd1 = aml_name("CDW1");
> > >      Aml *a_ctrl = aml_local(0);
> > > +    unsigned osc_ctrl;
> > >  
> > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> > > @@ -1612,9 +1613,12 @@ static Aml *build_q35_osc_method(AcpiPmInfo *pm)
> > >  
> > >      /*
> > >       * Always allow native PME, AER (no dependencies)
> > > -     * Allow SHPC (PCI bridges can have SHPC controller)
> > > +     * Need to disable native and SHPC hot-plug to use acpihp
> > > +     *
> > > +     * PCI Firmware Specification, Revision 3.2  
> 
> I don't think you have to add a reference as part of this patchset.
> The spec in question documents _OSC so it's not a bad idea to
> add it, but it's a bit more work, e.g. we generally try to list
> the earliest spec that documents the given feature, since
> So I suspect this is 3.0 actually.
> 
> 
> > seems incomplete, were you going to point to a concrete chapter that requires this change?  
> 
> 
> It doesn't as such. A better description would be:
> 
> / * Guests seem to generally prefer native hotplug control. As we want them to
>   * use ACPI, don't enable it.
>   */
> 
> 
> 
> > >       */
> > > -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > > +    osc_ctrl = pm->pcihp_bridge_en ? 0x1C : 0x1F;  
> > Since you are touching this, how about converting this magic number to
> > something more readable?
> > i.e.
> >             set_bit(ACPI_OSC_SHPC_EN,  osc_ctrl)
> >           or
> >             osc_ctrl |= BIT(SOME_FEATURE)
> >   
> 
> ... if there is such a macro. If not I suspect it's better as a comment:
> 
> 	0x10 /* PCI Express Capability Structure control */ |
> 	0x80 /* PCI Express Advanced Error Reporting control */ |
> 	0x40 /* PCI Express Native Power Management Events control */

if that is a spec quoted nearby than, I like comments idea as it
follows the same style which we use with ACPI numbers.
We just need split single magic number onto separate features bits
so it would be readable.

> 
> 
> 
> > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(osc_ctrl), a_ctrl));
> > >  
> > >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> > >      /* Unknown revision */
> > > @@ -1696,7 +1700,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > >          aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > -        aml_append(dev, build_q35_osc_method());
> > > +        aml_append(dev, build_q35_osc_method(pm));
> > >          aml_append(sb_scope, dev);
> > >          aml_append(dsdt, sb_scope);
> > >  
> > > @@ -1771,7 +1775,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >              if (pci_bus_is_express(bus)) {
> > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > > -                aml_append(dev, build_q35_osc_method());
> > > +                aml_append(dev, build_q35_osc_method(pm));
> > >              } else {
> > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > >              }  
> 
> 


