Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446364ED74F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:50:34 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrRp-0007XH-9i
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:50:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZrQA-00068V-Ap
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZrQ7-0000cf-2Q
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648720125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbOFbV5cLo3LMIKMbNgsuxkL/vBhIxzJ5ncpwH8wgcM=;
 b=HA5wIohQaKPSeqZE40RcgMqKRXmPGLaTMsJfnxLsOisH0uCY37su3LW+3M1Fxhdd0Nm4oG
 qkQzgGFu+T/kvSLTUiv7gvAGJu4rTlNrBkGJ94f2qY7dpxCjuag9zo627MhyROiY0t+Zc9
 JKUr0ZeLP5YrGRkEroCqvFvzM2YulpQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-ar3Q2nB3N8yVLu9cwOLQgw-1; Thu, 31 Mar 2022 05:48:41 -0400
X-MC-Unique: ar3Q2nB3N8yVLu9cwOLQgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B37028078E4;
 Thu, 31 Mar 2022 09:48:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 469037AD5;
 Thu, 31 Mar 2022 09:47:34 +0000 (UTC)
Date: Thu, 31 Mar 2022 10:47:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkV4tfgh3yD3uGMG@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
 <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
 <YkRSvDscyY+c+9yM@xz-m1.local>
 <YkSAeJTGAdYkYC09@stefanha-x1.localdomain>
 <YkSPnw2Z+980+dhF@xz-m1.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gsMnw1+Xcm2UvC+Z"
Content-Disposition: inline
In-Reply-To: <YkSPnw2Z+980+dhF@xz-m1.local>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gsMnw1+Xcm2UvC+Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 01:13:03PM -0400, Peter Xu wrote:
> On Wed, Mar 30, 2022 at 05:08:24PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Mar 30, 2022 at 08:53:16AM -0400, Peter Xu wrote:
> > > On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:
> > > > This makes me wonder whether there is a deeper issue with the
> > > > pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> > > > Per-device IOMMU resources should be freed when a device is hot
> > > > unplugged.
> > > >=20
> > > > From what I can tell this is not the case today:
> > > >=20
> > > > - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
> > > >   address spaces but I can't find where they are removed and freed.
> > > >   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are l=
eaked.
> > > >=20
> > > > - hw/i386/amd_iommu.c has similar leaks.
> > >=20
> > > AFAICT it's because there's no device-specific data cached in the
> > > per-device IOMMU address space, at least so far.  IOW, all the data
> > > structures allocated here can be re-used when a new device is plugged=
 in
> > > after the old device unplugged.
> > >=20
> > > It's definitely not ideal since after unplug (and before a new device
> > > plugged in) the resource is not needed at all so it's kind of wasted,=
 but
> > > it should work functionally.  If to achieve that, some iommu_unplug()=
 or
> > > iommu_cleanup() hook sounds reasonable.
> >=20
> > I guess the question is whether PCI busses can be hotplugged with
> > IOMMUs. If yes, then there is a memory leak that matters for
> > intel_iommu.c and amd_iommu.c.
>=20
> It can't, and we only support one vIOMMU so far for both (commit
> 1b3bf13890fd849b26).  Thanks,

I see, thanks!

Okay, summarizing options for the vfio-user IOMMU:

1. Use the same singleton approach as existing IOMMUs where the
   MemoryRegion/AddressSpace are never freed. Don't bother deleting.

2. Keep the approach in this patch where vfio-user code manually calls a
   custom delete function (not part of the pci_setup_iommu() API). This
   is slightly awkward to do without global state and that's what
   started this discussion.

3. Introduce an optional pci_setup_iommu() callback:

   typdef void (*PCIIOMMUDeviceUnplug)(PCIBus *bus, void *opaque, int devfn=
);

   Solves the awkwardness of option #2. Not needed by existing IOMMU
   devices.

Any preferences anyone?

Stefan

--gsMnw1+Xcm2UvC+Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJFeLUACgkQnKSrs4Gr
c8g1WAgAybjit22UJF+ZlWTAqrBZc216J6ckkYGgUqftDqxcMbKGGJHqY515QrVe
g5CkcNLhBi35Nv1vhIohCW2IVF4ibSmqe8IM35gukbB3mExm7Dv9x+Ql2O/O47J0
chq9I0KlzpvdkuSY+8DJ8TERWoAGnmA7bRlCy4Dd0ZIqZpsNp9v3xdM6Y+IQAhTJ
Qs4eu7V9nEFD4p2oVPsOOjBCNwH2CPK2vSnAjaF5tWKOPNlIal1E+zCcCeYkxgS1
Ayqse7U5mHPZT45uA6SN94J+tE2fUGxKZ8leRiOOSIOuQ3/xWR7Epi4DZnHm7KR6
i12SOJwICMU2NQU9nkcQlK6HEE0D0w==
=QKHm
-----END PGP SIGNATURE-----

--gsMnw1+Xcm2UvC+Z--


