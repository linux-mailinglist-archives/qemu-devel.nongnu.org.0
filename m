Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AA41EE4B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:14:53 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWINI-0003q6-LE
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWILB-0002FN-6S
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWIL6-0000ID-VO
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633093954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G2N0R9SUhuRBNmJf5pHae3J8YnosiDq2GuWFT0dGtTU=;
 b=VB/H+6/1jLLi/4RRSfbXP0d77GFqFVtZIuf7P1PR3CPYd4eEdLY/p0BOqR5rlHfu4dkJlR
 WJAErnwKyfBs5N69HneSmCUhOfWTVRq5xVuJQYH38wvCVidZxYQ16/ij7uj+/fRbuQK6dy
 3FRgt6xawtwwY9KQe4cCbERv3pQJwVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-nEPdLweyOAGdYJp0LmUIow-1; Fri, 01 Oct 2021 09:12:28 -0400
X-MC-Unique: nEPdLweyOAGdYJp0LmUIow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2E9D802CBF;
 Fri,  1 Oct 2021 13:12:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 493FB5C1B4;
 Fri,  1 Oct 2021 13:12:26 +0000 (UTC)
Date: Fri, 1 Oct 2021 14:12:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and
 the 405 CPU models
Message-ID: <YVcJNzs6zULuMEC+@redhat.com>
References: <20211001121943.1016447-1-thuth@redhat.com>
 <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
 <ee30cba8-9da1-eefa-0e91-3f5f85708348@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ee30cba8-9da1-eefa-0e91-3f5f85708348@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 03:01:08PM +0200, Thomas Huth wrote:
> On 01/10/2021 14.46, Peter Maydell wrote:
> > On Fri, 1 Oct 2021 at 13:22, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > These machines need a firmware image called 'ppc405_rom.bin', and nobody
> > > seems to have such a firmware image left for testing, so the machines are
> > > currently unusable. There used to be support in U-Boot, but it has been
> > > removed a couple of year ago already.
> > > Thus let's mark these boards and the 405 CPU as deprecated now, so that we
> > > could remove them in a couple of releases (unless somebody speaks up and
> > > says that these are still usefull for them).
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   docs/about/deprecated.rst | 15 +++++++++++++++
> > >   hw/ppc/ppc405_boards.c    |  2 ++
> > >   2 files changed, 17 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index 2f7db9a98d..27c03ef624 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
> > >   (the ISA has never been upstreamed to a compiler toolchain). Therefore
> > >   this CPU is also deprecated.
> > > 
> > > +PPC 405 CPU models (since 6.2)
> > > +''''''''''''''''''''''''''''''
> > > +
> > > +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
> > > +
> > 
> > What is this "too" a reference to? The immediately preceding section
> > in the document is about the MIPS I7200 CPU model.
> 
> It was meant as a reference to the machines below. I'll try to rephrase in v2.
> (As far as I can see, the 405 can only be used on these boards, it does not
> seem to be possible to use these CPU types on other boards)
> 
> > The not-being-deprecated sam460ex board also uses the ppc405 CPU
> > I think, so I don't think we can drop the CPU models.
> 
> No, that board uses a 460exb CPU which is a slightly different kind of
> embedded PPC CPU, as far as I know.
> 
> > >   QEMU API (QAPI) events
> > >   ----------------------
> > > @@ -258,6 +263,16 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
> > >   machines. It can be easily replaced by the ``witherspoon-bmc`` or the
> > >   ``romulus-bmc`` machines.
> > > 
> > > +``ref405ep`` and ``taihu`` machines (since 6.2)
> > > +'''''''''''''''''''''''''''''''''''''''''''''''
> > > +
> > > +These machines need a firmware image called 'ppc405_rom.bin', and nobody seems
> > > +to have a working copy of such a firmware image anymore. `Support in U-Boot
> > 
> > "any more".
> > 
> > > +<https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdfdba62c069>`__
> > > +has been removed a couple of years ago, too, so it is very unlikely that
> > > +anybody is still using this code at all.
> > 
> > (I'm not sure whether anybody ever actually successfully booted a
> > u-boot binary on QEMU's taihu/ref405ep boards.)
> 
> Me neither. Maybe I should rather drop that reference in v2...
> but I still wonder where that "ppc405_rom.bin" originally came from...
> 
> > >   Backend options
> > >   ---------------
> > > 
> > > diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> > > index 972a7a4a3e..1578c0dac8 100644
> > > --- a/hw/ppc/ppc405_boards.c
> > > +++ b/hw/ppc/ppc405_boards.c
> > > @@ -317,6 +317,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
> > >       mc->init = ref405ep_init;
> > >       mc->default_ram_size = 0x08000000;
> > >       mc->default_ram_id = "ef405ep.ram";
> > > +    mc->deprecation_reason = "ppc405 CPU is deprecated";
> > >   }
> > > 
> > >   static const TypeInfo ref405ep_type = {
> > > @@ -547,6 +548,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
> > >       mc->init = taihu_405ep_init;
> > >       mc->default_ram_size = 0x08000000;
> > >       mc->default_ram_id = "taihu_405ep.ram";
> > > +    mc->deprecation_reason = "ppc405 CPU is deprecated";
> > >   }
> > 
> > We're not deprecating the machine types because we're deprecating
> > the CPU types. We're deprecating them because we believe that
> > nobody's using them.
> 
> Ok, I'll try to come up with a different text instead.

IIUC, the user isn't specifying the CPU on the command line, they
are specifying the machine type, and getting the fixed CPU model
as a side effect. With that in mind it is probably clearer to talk
about the machine type in the deprecation message as that corresponds
to their CLI args.

IOW   "machine taihu is deprecated"


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


