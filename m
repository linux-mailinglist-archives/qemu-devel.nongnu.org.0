Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F995715E7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCMx-00010y-DD
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBCID-0004c0-2l
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBCIA-00061P-Gm
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y0Cw41L5uvaCp5LxeQbylHUyp1eAk47TWc+uZAPsZis=;
 b=Oo63O7qpf90n2iEVO2ab6rqEKJJGDu0GhchKcC3m0WEW52NKYyEuFVpuAD4su1k/s7eovd
 GOFU27hWaFrIDVo/gXI/kOjxo8Jz2Wd66gddhNvu63RTZVide+eHiQvqVz78OAxr6EmwSe
 yjBhfMJ+MI5h4g3n2/zyxWKTLOl64LI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-J1U-_XKEM9mDKh7EJ96Jyg-1; Tue, 12 Jul 2022 05:34:50 -0400
X-MC-Unique: J1U-_XKEM9mDKh7EJ96Jyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E93C801755;
 Tue, 12 Jul 2022 09:34:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803C71410F38;
 Tue, 12 Jul 2022 09:34:49 +0000 (UTC)
Date: Tue, 12 Jul 2022 10:34:48 +0100
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
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
 <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N64uyCRIMCLOnmBv"
Content-Disposition: inline
In-Reply-To: <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--N64uyCRIMCLOnmBv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 11:53:06AM -0400, Alexander Bulekov wrote:
> On 220621 1630, Peter Maydell wrote:
> > On Thu, 9 Jun 2022 at 14:59, Alexander Bulekov <alxndr@bu.edu> wrote:
> > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > index 44dacfa224..ab1ad0f7a8 100644
> > > --- a/include/hw/pci/pci.h
> > > +++ b/include/hw/pci/pci.h
> > > @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *=
dev, dma_addr_t addr,
> > >                                       void *buf, dma_addr_t len,
> > >                                       DMADirection dir, MemTxAttrs at=
trs)
> > >  {
> > > -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> > > -                         dir, attrs);
> > > +    bool prior_engaged_state;
> > > +    MemTxResult result;
> > > +
> > > +    prior_engaged_state =3D dev->qdev.engaged_in_io;
> > > +
> > > +    dev->qdev.engaged_in_io =3D true;
> > > +    result =3D dma_memory_rw(pci_get_address_space(dev), addr, buf, =
len,
> > > +                           dir, attrs);
> > > +    dev->qdev.engaged_in_io =3D prior_engaged_state;
> > > +
> > > +    return result;
> >=20
> > Why do we need to do something in this pci-specific function ?
> > I was expecting this to only need changes at the generic-to-all-devices
> > level.
>=20
> Both of these handle the BH->DMA->MMIO case. Unlike MMIO, I don't think
> there is any neat way to set the engaged_in_io flag as we enter a BH. So
> instead, we try to set it when a device initiates DMA.
>=20
> The pci function lets us do that since we get a glimpse of the dev/qdev
> (unlike the dma_memory_...  functions).
=2E..
> > > @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_add=
r_t len, dma_addr_t *residual,
> > >          xresidual -=3D xfer;
> > >      }
> > >
> > > +    if (dev) {
> > > +        dev->engaged_in_io =3D prior_engaged_state;
> > > +    }
> >=20
> > Not all DMA goes through dma_buf_rw() -- why does it need changes?
>=20
> This one has the same goal, but accesses the qdev through sg, instead of
> PCI.

Should dma_*() APIs take a reentrancy guard argument so that all DMA
accesses are systematically covered?

  /* Define this in the memory API */
  typedef struct {
      bool engaged_in_io;
  } MemReentrancyGuard;

  /* Embed MemReentrancyGuard in DeviceState */
  ...

  /* Require it in dma_*() APIs */
  static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
                                          void *buf, dma_addr_t len,
                                          DMADirection dir, MemTxAttrs attr=
s,
					  MemReentrancyGuard *guard);

  /* Call dma_*() APIs like this... */
  static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                       void *buf, dma_addr_t len,
                                       DMADirection dir, MemTxAttrs attrs)
  {
      return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
                           dir, attrs, &dev->qdev.reentrancy_guard);
  }

Stefan

--N64uyCRIMCLOnmBv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNQDgACgkQnKSrs4Gr
c8hgAgf9GMjHDni/IlsRb61Edn1D7GutZ9MznqDHnMAl9NHgC/xCQ+MQ4X4OhPLU
ps3AyW9na7aEUcVHPTyKiGLw/MGKlANPhzFHsrD4FgSjPoGY/kAyB4DTtjXEyJ5A
VEEUvzmUR67hPZjIhPIr6qR1wyVGmAwei/FpnBQ+AzW+VMbDypUQDCkB6HJVFUqP
unHdyiDiCkPxIkz7aBbQ+eVKmLaXhN6Tqd1nCUMy8pebw4/KFkmd3fPhjqttQsKJ
C8eWlnWJZZ2Tq9yRg9HthkSRaW5k0cC/edch5B3GYytnC9vPEfAgITE4uvfIxtsj
//QMHe2A0y7GnmeQnQ0+UC9yM1z0Iw==
=cQ+t
-----END PGP SIGNATURE-----

--N64uyCRIMCLOnmBv--


