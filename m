Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B1441A0E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:41:04 +0100 (CET)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUkQ-0001yl-Nj
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhUhz-0008N0-04
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhUhx-00045r-9R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635763108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+z42+sv6vTMKHbNeMslB1o+OyWZ3HqgZ1rZGqn0e7A=;
 b=A6qgy7fXMILN7vc8szwDzYqFX33y3orGsX9MjA4CfOz0VvNOaeB2NM3sGJ1iK/OKksbp5C
 J0I6yhzgVZwt7Dork56/xhFifL/aw+6KWOv1PTB/tHAGTlpHUk7GVUVcOdlgOOLheeP3e4
 ORZnTiuDcbkSyWLvpF9V+NmCa5miKBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-NZ436jk9OFOfqGJ3ipNKMg-1; Mon, 01 Nov 2021 06:38:25 -0400
X-MC-Unique: NZ436jk9OFOfqGJ3ipNKMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3C8802B61;
 Mon,  1 Nov 2021 10:38:23 +0000 (UTC)
Received: from localhost (unknown [10.39.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DABA35D9DC;
 Mon,  1 Nov 2021 10:38:20 +0000 (UTC)
Date: Mon, 1 Nov 2021 10:38:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 05/12] vfio-user: find and init PCI device
Message-ID: <YX/DmwVv19IA5sSe@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <697ee91edc2af1aae07a01d49a27156d0e87c00c.1633929457.git.jag.raman@oracle.com>
 <YXl4wsLA1/+pCfTb@stefanha-x1.localdomain>
 <1D478072-7D63-482A-B32C-6108942BE9F0@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1D478072-7D63-482A-B32C-6108942BE9F0@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ArYG3/vwUMFgkfds"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ArYG3/vwUMFgkfds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 03:58:28PM +0000, Jag Raman wrote:
>=20
>=20
> > On Oct 27, 2021, at 12:05 PM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >=20
> > On Mon, Oct 11, 2021 at 01:31:10AM -0400, Jagannathan Raman wrote:
> >> Find the PCI device with specified id. Initialize the device context
> >> with the QEMU PCI device
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/remote/vfio-user-obj.c | 32 ++++++++++++++++++++++++++++++++
> >> 1 file changed, 32 insertions(+)
> >>=20
> >> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> >> index d26e5ec9e9..7ce4e5b256 100644
> >> --- a/hw/remote/vfio-user-obj.c
> >> +++ b/hw/remote/vfio-user-obj.c
> >> @@ -44,6 +44,8 @@
> >> #include "qemu/notify.h"
> >> #include "sysemu/sysemu.h"
> >> #include "libvfio-user.h"
> >> +#include "hw/qdev-core.h"
> >> +#include "hw/pci/pci.h"
> >>=20
> >> #define TYPE_VFU_OBJECT "vfio-user-server"
> >> OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> >> @@ -68,6 +70,8 @@ struct VfuObject {
> >>     Notifier machine_done;
> >>=20
> >>     vfu_ctx_t *vfu_ctx;
> >> +
> >> +    PCIDevice *pci_dev;
> >> };
> >>=20
> >> static void vfu_object_set_socket(Object *obj, Visitor *v, const char =
*name,
> >> @@ -112,6 +116,9 @@ static void vfu_object_set_device(Object *obj, con=
st char *str, Error **errp)
> >> static void vfu_object_machine_done(Notifier *notifier, void *data)
> >> {
> >>     VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
> >> +    DeviceState *dev =3D NULL;
> >> +    vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
> >> +    int ret;
> >>=20
> >>     o->vfu_ctx =3D vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.=
path, 0,
> >>                                 o, VFU_DEV_TYPE_PCI);
> >> @@ -120,6 +127,31 @@ static void vfu_object_machine_done(Notifier *not=
ifier, void *data)
> >>                    strerror(errno));
> >>         return;
> >>     }
> >> +
> >> +    dev =3D qdev_find_recursive(sysbus_get_default(), o->device);
> >> +    if (dev =3D=3D NULL) {
> >> +        error_setg(&error_abort, "vfu: Device %s not found", o->devic=
e);
> >> +        return;
> >> +    }
> >> +
> >> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> >> +        error_setg(&error_abort, "vfu: %s not a PCI device", o->devic=
e);
> >> +        return;
> >> +    }
> >> +
> >> +    o->pci_dev =3D PCI_DEVICE(dev);
> >> +
> >> +    if (pci_is_express(o->pci_dev)) {
> >> +        pci_type =3D VFU_PCI_TYPE_EXPRESS;
> >> +    }
> >> +
> >> +    ret =3D vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL=
, 0);
> >> +    if (ret < 0) {
> >> +        error_setg(&error_abort,
> >> +                   "vfu: Failed to attach PCI device %s to context - =
%s",
> >> +                   o->device, strerror(errno));
> >> +        return;
> >> +    }
> >=20
> > It's unclear what happens when one of these error code paths is taken.
> > o->vfu_ctx and o->pci_dev might both be initialized, so how does the
> > code know not to service the vfio-user connection? It would be easy to
> > tell that this is correct if o->pci_dev and o->vfu_ctx were destroyed
> > when an error occurs.
>=20
> Hey Stefan, if I understand your question correctly, you=E2=80=99re wonde=
ring
> if the server would still service the connection if it takes the above
> error path.
>=20
> I don=E2=80=99t believe that would happen. When the above error path is t=
aken,
> =E2=80=9Cerror_abort=E2=80=9D is set. Setting error_abort immediately ter=
minates the
> QEMU process. Additionally, vfu_object_ctx_run() won=E2=80=99t be
> attached to the unix socket as the function exits early - so the
> connection wouldn=E2=80=99t be serviced.

Thanks. I'll revisit this next revision because error_abort cannot be
used for hotplug. It's okay to terminate the process on startup, but for
hotplug the expected behavior is to report an error and continue
running.

Stefan

--ArYG3/vwUMFgkfds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF/w5sACgkQnKSrs4Gr
c8inFQf9GCpxfnd+b6TF85nLgQjSnVG0PThgKvO/RaGzTqM0WAKBKJr3CLryUv4o
POQ8lcpNLdGsiprKCY7tAlb9XULcz9YZSiapEn/QZ/0P1UOk4E8ZMMwAgM2r0KWF
blsFFTZsH8NdYGezu6jqERU/skVVdu7IvArpDjCjjVQ6qpRBQYgTncy2U4u134i4
yEb90/Gzx7MbjMPI7kaWYJcUhiBP2OnzZdzmjIMfEIzh7FVteVF4zOhVEnkbQi9U
a5fMKIZo4nCgT461qd4Z0hSAcIAA8Zk670hla00LKd7Fl1A0g7SsQtZXIBFVGDB3
xojP6uMHYUTte43jw+FMPacsFufpTQ==
=N6as
-----END PGP SIGNATURE-----

--ArYG3/vwUMFgkfds--


