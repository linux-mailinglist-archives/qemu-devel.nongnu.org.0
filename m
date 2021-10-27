Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3D43C788
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:19:57 +0200 (CEST)
Received: from localhost ([::1]:46286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfg2G-0006Cp-Va
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mffyU-0003Zp-TE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mffyS-0007Vh-Oo
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635329759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8RrIMa43+CDtWe02+sOZ/DmF+8SE2AFh8Rw9HUpvuIY=;
 b=DLLYROG0a7R5Pp7QytR6VdqCyje3YbPFv0OaVByqBto5P5v1Na8NEnUhuGb+NguYwgTpoI
 Bdhc26pZJu4OZOI1rvduOwdCiiJj0vzrDn87nJJSp/AMWyZc0yD4Mf2sn3DYUDAdUGOoeq
 o7jbs8eWIQ9ycvNOz5iKxcRs+2BGNa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-sBjZeUYqOq-DQLky1OoOqQ-1; Wed, 27 Oct 2021 06:15:54 -0400
X-MC-Unique: sBjZeUYqOq-DQLky1OoOqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC4419251A1;
 Wed, 27 Oct 2021 10:15:53 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1F401017CE7;
 Wed, 27 Oct 2021 10:15:36 +0000 (UTC)
Date: Wed, 27 Oct 2021 11:15:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <levon@movementarian.org>
Subject: Re: MMIO/PIO dispatch file descriptors (ioregionfd) design discussion
Message-ID: <YXkmx3V0VklA6qHl@stefanha-x1.localdomain>
References: <88ca79d2e378dcbfb3988b562ad2c16c4f929ac7.camel@gmail.com>
 <YWUeZVnTVI7M/Psr@heatpipe>
 <YXamUDa5j9uEALYr@stefanha-x1.localdomain>
 <20211025152122.GA25901@nuker> <YXhQk/Sh0nLOmA2n@movementarian.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J/R1b5NXlPlkwaQ9"
Content-Disposition: inline
In-Reply-To: <YXhQk/Sh0nLOmA2n@movementarian.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Elena <elena.ufimtseva@oracle.com>, john.g.johnson@oracle.com,
 jag.raman@oracle.com, kvm@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, eafanasova@gmail.com,
 felipe@nutanix.com, dinechin@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J/R1b5NXlPlkwaQ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 08:01:39PM +0100, John Levon wrote:
> On Mon, Oct 25, 2021 at 08:21:22AM -0700, Elena wrote:
>=20
> > > I'm curious what approach you want to propose for QEMU integration. A
> > > while back I thought about the QEMU API. It's possible to implement it
> > > along the lines of the memory_region_add_eventfd() API where each
> > > ioregionfd is explicitly added by device emulation code. An advantage=
 of
> > > this approach is that a MemoryRegion can have multiple ioregionfds, b=
ut
> > > I'm not sure if that is a useful feature.
> > >
> >=20
> > This is the approach that is currently in the works. Agree, I dont see
> > much of the application here at this point to have multiple ioregions
> > per MemoryRegion.
> > I added Memory API/eventfd approach to the vfio-user as well to try
> > things out.
> >=20
> > > An alternative is to cover the entire MemoryRegion with one ioregionf=
d.
> > > That way the device emulation code can use ioregionfd without much fu=
ss
> > > since there is a 1:1 mapping between MemoryRegions, which are already
> > > there in existing devices. There is no need to think deeply about whi=
ch
> > > ioregionfds to create for a device.
> > >
> > > A new API called memory_region_set_aio_context(MemoryRegion *mr,
> > > AioContext *ctx) would cause ioregionfd (or a userspace fallback for
> > > non-KVM cases) to execute the MemoryRegion->read/write() accessors fr=
om
> > > the given AioContext. The details of ioregionfd are hidden behind the
> > > memory_region_set_aio_context() API, so the device emulation code
> > > doesn't need to know the capabilities of ioregionfd.
> >=20
> > >=20
> > > The second approach seems promising if we want more devices to use
> > > ioregionfd inside QEMU because it requires less ioregionfd-specific
> > > code.
> > >=20
> > I like this approach as well.
> > As you have mentioned, the device emulation code with first approach
> > does have to how to handle the region accesses. The second approach will
> > make things more transparent. Let me see how can I modify what there is
> > there now and may ask further questions.
>=20
> Sorry I'm a bit late to this discussion, I'm not clear on the above WRT
> vfio-user. If an ioregionfd has to cover a whole BAR0 (?), how would this
> interact with partly-mmap()able regions like we do with SPDK/vfio-user/NV=
Me?

The ioregionfd doesn't need to cover an entire BAR. QEMU's MemoryRegions
form a hierarchy, so it's possible to sub-divide the BAR into several
MemoryRegions.

This means it's still possible to have mmap() sub-regions or even
ioeventfds sprinkled in between.

Stefan

--J/R1b5NXlPlkwaQ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5JscACgkQnKSrs4Gr
c8i1NAgAoVH+VwSZD4M/XspAXmHGqiveQebbCraCrI8p3xbEfQIMsEVErG1dHWCV
vcAYeO7X6J+X0flOygk0g7ZeFVYmGKKr9XPAFeiFPQ5MRPhfrDlHTxrtvhxWgLuF
F2K/jkp+fl4wFvGsUZB5i/kGojbw5U3G9YRUoIHvF5N++wHNG+0cxKiqvt/n24Pc
LxkSHer04M+XDB0nsjVSJ2fNu0bWmEx3d9pSuPaVK4POLmM21whWZ3VIomW7hAPk
U0FffmXnIFYjaXA2thLf0cMBJu7oyjbCDJnBpWkEUvd5DBqTircR2pZgjiWmXBfq
ty4XOCH6ltESi6kQcPmrgMd3/ZzYjw==
=6vzl
-----END PGP SIGNATURE-----

--J/R1b5NXlPlkwaQ9--


