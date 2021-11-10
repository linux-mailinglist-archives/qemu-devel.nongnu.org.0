Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD2D44C45C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:27:52 +0100 (CET)
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpVv-0000OC-Qk
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:27:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1mkpU8-0007iz-Om
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1mkpU5-0004WR-AO
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636557956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zN6Q2dIzPyQXOgBHquEJ+ixG2wGCctiCvyXRCyputow=;
 b=NdPZquBchFfru5KkSGuccuFF3ej3+Aw1GAC1DG12cJOnEacmfngHdPIbzMQgq+DgxhBstA
 HYnot4h6/7vVJh7DtOhR68E3D0POFSJOjQEsBuLGHRrLPiOWqCWbZX5jC8OkY1h+hVS4zZ
 wXUI8rau10oEzBS8H2i2G6c79wDvC50=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-ri9l2xeDOyWGP0bGdQ8Tiw-1; Wed, 10 Nov 2021 10:25:53 -0500
X-MC-Unique: ri9l2xeDOyWGP0bGdQ8Tiw-1
Received: by mail-oo1-f72.google.com with SMTP id
 r22-20020a4ad4d6000000b002bb8cc2ea41so1308928oos.4
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zN6Q2dIzPyQXOgBHquEJ+ixG2wGCctiCvyXRCyputow=;
 b=FqeG2ArAvfY5ByCpSSXT9iPjx+U5IAkKVLvjqBhDOE8L1HQENw1F06cifOZlyPkpM+
 0Ryn0mufVBBOP77w/kKGp1RtBnN+KIk2tNsDli9WPk0Jmh+PmWPk3QYE3c4ag/k6yzuv
 7Rcl6bXD8ikq9YLGeXmrCQKkliP8484t5EaprlbG4lmYM9tCUgk+n4XLXAhjBXa1+Trs
 wvDiobWaPpMVw8fT6qazNF3M+v0ExxlMqFHxTxkZegb5n6Y+EBVk4rZ7d0375Yr22RrO
 r6eCiEXmV9VKH1A1iaFAG0h7DthS5YvUw5WTFhieumORWF6PrRMVShrxAoAkpRsz0t1a
 2A4g==
X-Gm-Message-State: AOAM532eywg+kT/OZ6V892l7S2egSvU60nMuI5ya8OC44fLI0CeZzLBW
 vMKIaCtgf3EVI6LkQvnM6sTpqAqpQxrnD/tlan75ezG9R5yzL8mgGcpTKU6p8EMv9Wn10BzFkEO
 sbOFL46gRyOfe9EVwWk9h36Yp27hmMvI=
X-Received: by 2002:a05:6830:19c5:: with SMTP id
 p5mr49466otp.195.1636557952250; 
 Wed, 10 Nov 2021 07:25:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuzfaydRdKn0DYubZH7NymDYxfZZAqmlFPbqC2fqBDPxl51nPjRB0bSp4vyPCLZVPN7GBcaY6Py66uCxR8aaY=
X-Received: by 2002:a05:6830:19c5:: with SMTP id
 p5mr49429otp.195.1636557951761; 
 Wed, 10 Nov 2021 07:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-5-jusual@redhat.com>
 <20211110011557-mutt-send-email-mst@kernel.org>
 <20211110145759.6570170e@redhat.com>
In-Reply-To: <20211110145759.6570170e@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 10 Nov 2021 16:25:40 +0100
Message-ID: <CAMDeoFXyZffTgcckpfZ8HLKZGVWROnBxteh2G5LcZP7RoSNO-A@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/i386/acpi-build: Deny control on PCIe Native
 Hot-plug in _OSC
To: Igor Mammedov <imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <mapfelba@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 2:58 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 10 Nov 2021 02:21:34 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > On Wed, Nov 10, 2021 at 06:30:13AM +0100, Julia Suvorova wrote:
> > > There are two ways to enable ACPI PCI Hot-plug:
> > >
> > >         * Disable the Hot-plug Capable bit on PCIe slots.
> > >
> > > This was the first approach which led to regression [1-2], as
> > > I/O space for a port is allocated only when it is hot-pluggable,
> > > which is determined by HPC bit.
> > >
> > >         * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
> > >           method.
> > >
> > > This removes the (future) ability of hot-plugging switches with PCIe
> > > Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
> > > bridges. If the user wants to explicitely use this feature, they can
> > > disable ACPI PCI Hot-plug with:
> > >         --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> > >
> > > Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
> > > instead of PCIe Native.
> > >
> > > [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > > [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  hw/i386/acpi-build.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index a3ad6abd33..a2f92ab32b 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1337,7 +1337,7 @@ static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
> > >      aml_append(table, scope);
> > >  }
> > >
> > > -static Aml *build_q35_osc_method(void)
> > > +static Aml *build_q35_osc_method(bool acpi_pcihp)
> > >  {
> > >      Aml *if_ctx;
> > >      Aml *if_ctx2;
> > > @@ -1345,6 +1345,7 @@ static Aml *build_q35_osc_method(void)
> > >      Aml *method;
> > >      Aml *a_cwd1 = aml_name("CDW1");
> > >      Aml *a_ctrl = aml_local(0);
> > > +    const uint64_t hotplug = acpi_pcihp ? 0x1E : 0x1F;
> >
> > drop this variable and open-code at use point below.
> > As it is the comment is misplaced.
> > Also a slightly better way to write this:
> > 0x1E | (acpi_pcihp ? 0x0 : 0x1)
> >
> >
> >
> > >
> > >      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> > >      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> >
> > So what acpi_pcihp does is enable/disable native pcie hotplug.
> > How about we call the option exactly that?
> >
> >
> > > @@ -1359,8 +1360,9 @@ static Aml *build_q35_osc_method(void)
> > >      /*
> > >       * Always allow native PME, AER (no dependencies)
> > >       * Allow SHPC (PCI bridges can have SHPC controller)
> > > +     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
> > >       */
> > > -    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
> > > +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(hotplug), a_ctrl));
> > >
> >
> > using the variable hotplug just made things confusing,
> > open-coding will be clearer.
> >
> >
> > >      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
> > >      /* Unknown revision */
> > > @@ -1449,7 +1451,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > >          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> > >          aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
> > > -        aml_append(dev, build_q35_osc_method());
> > > +        aml_append(dev, build_q35_osc_method(pm->pcihp_bridge_en));
> > >          aml_append(sb_scope, dev);
> > >          if (mcfg_valid) {
> > >              aml_append(sb_scope, build_q35_dram_controller(&mcfg));
> >
> > One of the complaints of libvirt people was that the
> > name is confusing. It seems to say whether to describe bridges
> > in ACPI but it also disables native hotplug, but only for PCIe.
> >
> > Maybe we should address this with flags saying whether to enable each of
> > acpi,pcie,shpc hotplug separately...
>
> yep, mask with field defines would be better,
> but I'd hold off such change to post 6.2 time.
>
> >
> > > @@ -1565,7 +1567,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >              if (pci_bus_is_express(bus)) {
> > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> > >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> > > -                aml_append(dev, build_q35_osc_method());
>
>
> > > +                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> > > +                aml_append(dev, build_q35_osc_method(false));
>
> this's it not obvious, why PXBs aren't capable of ACPI PCI Hot-plug?

Lack of support from the original patchset.

> > >              } else {
> > >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > >              }
> > > --
> > > 2.31.1
> >
>


