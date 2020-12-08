Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E902D2063
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 02:55:50 +0100 (CET)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmSEH-0006PR-KS
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 20:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmSCp-0005ve-Ee; Mon, 07 Dec 2020 20:54:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43995 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmSCl-0000cL-PN; Mon, 07 Dec 2020 20:54:19 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CqjsF5WlBz9sWF; Tue,  8 Dec 2020 12:54:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607392449;
 bh=AexoOEEhA6+9jjhuMsVG1acI2Ih+hqkNZX3YsplyDNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJ0bk6rfBb49iGteqQ1UAWkGLCiwtME7vCXkRZ10rUMxYHzGztB1qrtXeY5RFURnZ
 JiEIrhPnvEqqxwgdEAQqlwUy1NrUmLl6MC3J3Hw6rzX47PjPms6zH6zFCdHtsngnq6
 QUc0l8b8VcI7PL4DycdGWwkAYnpTJZEZtIBIYgu0=
Date: Tue, 8 Dec 2020 12:54:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [for-6.0 v5 12/13] securable guest memory: Alter virtio default
 properties for protected guests
Message-ID: <20201208015403.GB2555@yekko.fritz.box>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-13-david@gibson.dropbear.id.au>
 <d739cae2-9197-76a5-1c19-057bfe832187@de.ibm.com>
 <20201204091706.4432dc1e.cohuck@redhat.com>
 <038214d1-580d-6692-cd1e-701cd41b5cf8@de.ibm.com>
 <20201204154310.158b410e.pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <20201204154310.158b410e.pasic@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, frankja@linux.ibm.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
 thuth@redhat.com, berrange@redhat.com, david@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 03:43:10PM +0100, Halil Pasic wrote:
> On Fri, 4 Dec 2020 09:29:59 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>=20
> > On 04.12.20 09:17, Cornelia Huck wrote:
> > > On Fri, 4 Dec 2020 09:10:36 +0100
> > > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> > >=20
> > >> On 04.12.20 06:44, David Gibson wrote:
> > >>> The default behaviour for virtio devices is not to use the platform=
s normal
> > >>> DMA paths, but instead to use the fact that it's running in a hyper=
visor
> > >>> to directly access guest memory.  That doesn't work if the guest's =
memory
> > >>> is protected from hypervisor access, such as with AMD's SEV or POWE=
R's PEF.
> > >>>
> > >>> So, if a securable guest memory mechanism is enabled, then apply the
> > >>> iommu_platform=3Don option so it will go through normal DMA mechani=
sms.
> > >>> Those will presumably have some way of marking memory as shared with
> > >>> the hypervisor or hardware so that DMA will work.
> > >>>
> > >>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > >>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > >>> ---
> > >>>  hw/core/machine.c | 13 +++++++++++++
> > >>>  1 file changed, 13 insertions(+)
> > >>>
> > >>> diff --git a/hw/core/machine.c b/hw/core/machine.c
> > >>> index a67a27d03c..d16273d75d 100644
> > >>> --- a/hw/core/machine.c
> > >>> +++ b/hw/core/machine.c
> > >>> @@ -28,6 +28,8 @@
> > >>>  #include "hw/mem/nvdimm.h"
> > >>>  #include "migration/vmstate.h"
> > >>>  #include "exec/securable-guest-memory.h"
> > >>> +#include "hw/virtio/virtio.h"
> > >>> +#include "hw/virtio/virtio-pci.h"
> > >>> =20
> > >>>  GlobalProperty hw_compat_5_1[] =3D {
> > >>>      { "vhost-scsi", "num_queues", "1"},
> > >>> @@ -1169,6 +1171,17 @@ void machine_run_board_init(MachineState *ma=
chine)
> > >>>           * areas.
> > >>>           */
> > >>>          machine_set_mem_merge(OBJECT(machine), false, &error_abort=
);
> > >>> +
> > >>> +        /*
> > >>> +         * Virtio devices can't count on directly accessing guest
> > >>> +         * memory, so they need iommu_platform=3Don to use normal =
DMA
> > >>> +         * mechanisms.  That requires also disabling legacy virtio
> > >>> +         * support for those virtio pci devices which allow it.
> > >>> +         */
> > >>> +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-legac=
y",
> > >>> +                                   "on", true);
> > >>> +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_plat=
form",
> > >>> +                                   "on", false); =20
> > >>
> > >> I have not followed all the history (sorry). Should we also set iomm=
u_platform
> > >> for virtio-ccw? Halil?
> > >>
> > >=20
> > > That line should add iommu_platform for all virtio devices, shouldn't
> > > it?
> >=20
> > Yes, sorry. Was misreading that with the line above.=20
> >=20
>=20
> I believe this is the best we can get. In a sense it is still a
> pessimization,

I'm not really clear on what you're getting at here.

> but it is a big usability improvement compared to having
> to set iommu_platform manually.=20
>=20
> Regards,
> Halil
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/O3LkACgkQbDjKyiDZ
s5IRxQ//cmGUbtEIT1HBgw1z4WsymknaXfK7BFJcNdIpLJmKZqe+XQjynq2EWLh5
wIbQneKKyRlZo1WlurkAvMgOexL1g4JujE/eUBGLQ1Itrf3zG6+eLbsUijFhTCxs
VdyNP6sVyijEZ3yTqb3It0UnT6spNszYO0SwWY6/b1K/7m1hJ6c5M1I8fwYtlOpx
FsYiErMGpYLP2d9zWLgbKfwGmv6K6joCireNmYMsf+IDK5qdxDDou3WnEuTZte2f
m1g9wlQQPDmDD7+k2x1gkMXgiIUXtsm0stEsdCiwe27PWLWaNSJFo98EqDRxcX32
Qe1PIvjQuLQQxI/UqHaX2u8me1LShhwvrMPzSRYEC+fmglSi5VnyJVNwEs0XIxeg
TNt9KROHKyC9c9r7oCcp40mzmS3YcngOuTxHsX8+5x3Xtix9r4Xv14dwzwF1mGRT
e0wL7sD4FZKIVNkjA4+tAQ5allBPY1pwZIRsC1LTp2jGaxI2jSLwA8eksHCps+0U
5hA8pHqR8rROloq88rtyVU5mJXXp7nORoT5w4GtSivl8v+DGC3x/+VR8YKnE6OLq
h7S4fyyysVSe1towkrOGJdCNw6vvN/u4emrVG28dISre75GcAuh3sdSsxgOI+GlL
Q/5e5ZCsOvtyejOInniCi7c1EPrzpoKSQijvVMpvJgOu9MynBZc=
=JfQj
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

