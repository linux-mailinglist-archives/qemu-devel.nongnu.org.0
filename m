Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA960B662
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 20:56:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on2TF-0002T6-Pw; Mon, 24 Oct 2022 14:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1on2TA-0002Su-CP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:46:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1on2T8-0002wg-HI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666637193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igOo9pfpNUgpBxIPHtQymzZ50GVeNCSjwMgtjOdHUds=;
 b=OXraiG/ui8RVWoBjYmfuc2ZsE+xiTGxWHObu1L838wnwSPXveHJuwRz9+MndKaywRQL7MZ
 LmtPQvEl410dve4CwYeC6p6HoF6RbITupVxXoUUHBgZ/rFLFbzFb6BrSc8WEKCwCbrws3Z
 YRZdMz+x9RJUVwt61ijCpUOSm5P+8Mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-v7iQ84KCMIm8HslZgOWqpw-1; Mon, 24 Oct 2022 14:46:28 -0400
X-MC-Unique: v7iQ84KCMIm8HslZgOWqpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9681857F8F;
 Mon, 24 Oct 2022 18:46:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECFBDC16922;
 Mon, 24 Oct 2022 18:46:26 +0000 (UTC)
Date: Mon, 24 Oct 2022 14:46:25 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <Y1bdgdWXG2FYHm/K@fedora>
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
 <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
 <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
 <20221020220928.7gxd33eszrv7que5@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1Nkd8+r3F5w1s4TD"
Content-Disposition: inline
In-Reply-To: <20221020220928.7gxd33eszrv7que5@mozz.bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--1Nkd8+r3F5w1s4TD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 06:11:06PM -0400, Alexander Bulekov wrote:
> On 220712 1034, Stefan Hajnoczi wrote:
> > On Tue, Jun 21, 2022 at 11:53:06AM -0400, Alexander Bulekov wrote:
> > > On 220621 1630, Peter Maydell wrote:
> > > > On Thu, 9 Jun 2022 at 14:59, Alexander Bulekov <alxndr@bu.edu> wrot=
e:
> > > > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > > > index 44dacfa224..ab1ad0f7a8 100644
> > > > > --- a/include/hw/pci/pci.h
> > > > > +++ b/include/hw/pci/pci.h
> > > > > @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevi=
ce *dev, dma_addr_t addr,
> > > > >                                       void *buf, dma_addr_t len,
> > > > >                                       DMADirection dir, MemTxAttr=
s attrs)
> > > > >  {
> > > > > -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, =
len,
> > > > > -                         dir, attrs);
> > > > > +    bool prior_engaged_state;
> > > > > +    MemTxResult result;
> > > > > +
> > > > > +    prior_engaged_state =3D dev->qdev.engaged_in_io;
> > > > > +
> > > > > +    dev->qdev.engaged_in_io =3D true;
> > > > > +    result =3D dma_memory_rw(pci_get_address_space(dev), addr, b=
uf, len,
> > > > > +                           dir, attrs);
> > > > > +    dev->qdev.engaged_in_io =3D prior_engaged_state;
> > > > > +
> > > > > +    return result;
> > > >=20
> > > > Why do we need to do something in this pci-specific function ?
> > > > I was expecting this to only need changes at the generic-to-all-dev=
ices
> > > > level.
> > >=20
> > > Both of these handle the BH->DMA->MMIO case. Unlike MMIO, I don't thi=
nk
> > > there is any neat way to set the engaged_in_io flag as we enter a BH.=
 So
> > > instead, we try to set it when a device initiates DMA.
> > >=20
> > > The pci function lets us do that since we get a glimpse of the dev/qd=
ev
> > > (unlike the dma_memory_...  functions).
> > ...
> > > > > @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma=
_addr_t len, dma_addr_t *residual,
> > > > >          xresidual -=3D xfer;
> > > > >      }
> > > > >
> > > > > +    if (dev) {
> > > > > +        dev->engaged_in_io =3D prior_engaged_state;
> > > > > +    }
> > > >=20
> > > > Not all DMA goes through dma_buf_rw() -- why does it need changes?
> > >=20
> > > This one has the same goal, but accesses the qdev through sg, instead=
 of
> > > PCI.
> >=20
> > Should dma_*() APIs take a reentrancy guard argument so that all DMA
> > accesses are systematically covered?
> >=20
> >   /* Define this in the memory API */
> >   typedef struct {
> >       bool engaged_in_io;
> >   } MemReentrancyGuard;
> >=20
> >   /* Embed MemReentrancyGuard in DeviceState */
> >   ...
> >=20
> >   /* Require it in dma_*() APIs */
> >   static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t =
addr,
> >                                           void *buf, dma_addr_t len,
> >                                           DMADirection dir, MemTxAttrs =
attrs,
> > 					  MemReentrancyGuard *guard);
> >=20
> >   /* Call dma_*() APIs like this... */
> >   static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
> >                                        void *buf, dma_addr_t len,
> >                                        DMADirection dir, MemTxAttrs att=
rs)
> >   {
> >       return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> >                            dir, attrs, &dev->qdev.reentrancy_guard);
> >   }
> >=20
>=20
> Taking a stab at this. Here is the list of DMA APIs that appear to need
> changes:
> dma_memory_valid (1 usage)
> dma_memory_rw (~5 uses)
> dma_memory_read (~92 uses)
> dma_memory_write (~71 uses)
> dma_memory_set (~4 uses)
> dma_memory_map (~18 uses)
> dma_memory_unmap (~21 uses)
> {ld,st}_{le,be}_{uw,l,q}_dma (~10 uses)
> ldub_dma (does not appear to be used anywhere)
> stb_dma (1 usage)
> dma_buf_read (~18 uses)
> dma_buf_write (~7 uses)
>=20
> These appear to be internal to the DMA API and probably don't need to be
> changed:
> dma_memory_read_relaxed (does not appear to be used anywhere)
> dma_memory_write_relaxed (does not appear to be used anywhere)
> dma_memory_rw_relaxed=20
>=20
> I don't think the sglist APIs need to be changed since we can get
> DeviceState from the QEMUSGList.
>=20
> Does this look more-or-less right?

That's along the lines of what I would expect. Interesting that
map/unmap is also on the list; it makes sense when considering bounce
buffers.

Stefan

--1Nkd8+r3F5w1s4TD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNW3YEACgkQnKSrs4Gr
c8hH8Qf+KRQlZmT1fV63HheetpSi11TYPMNwu/T/YF5CYxWtmUbmerSOy+Ln4jen
Lqh/K4DwL5zcSjO+rbrXkI7C2+PCAM4mnVit5iBCNlSp3A4YAtnz2024uvDyODnh
/+TE066z1EXtBGsHuYF2Vwz42RnUVIZUincSteogDFPQhP3qr+/UJbzpjZRUTeit
ukko7okoLBSTrs1le9SVr/FOys/oKrLV6xHSX6qqkN6CSXZGlW3PvApZ0IdiYfnh
aRJAqjIwl6mTJFDwGgXf6dZYgR4WBi82lv4y0DVs1pOQofk879d5t73T6nyEOI3H
5ZwL/YiKKZtSSTFy6gGK5wGVRmmAbw==
=PnFt
-----END PGP SIGNATURE-----

--1Nkd8+r3F5w1s4TD--


