Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C53D9F69
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:23:57 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91Kd-0006jo-TY
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m91J1-00058C-KP
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m91Iz-000750-Bv
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgND34KZhv2lz5lblYZqJxLnCyE0EAleLBb07JNJCmw=;
 b=TKQZ1WK0W7xh+0xGy4T56N50hn/WwGA+xX2XgJq/esHy9adOStdzoiicY5hItiNXbQ91xg
 zkytmiZYjqdnrJdCSvi1Lhh46a6/hkeo3qfFztXtE+VEjU8U5tEUuAFy+vnCYLdlwyssLA
 AnjeDE8nCRv9F3TZ82LCj0cp/TzT4D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-2aLi51I6OkG7uqmqHVwoyQ-1; Thu, 29 Jul 2021 04:22:07 -0400
X-MC-Unique: 2aLi51I6OkG7uqmqHVwoyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B768799EE;
 Thu, 29 Jul 2021 08:22:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5358B60843;
 Thu, 29 Jul 2021 08:22:01 +0000 (UTC)
Date: Thu, 29 Jul 2021 09:22:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC 04/19] vfio-user: Define type vfio_user_pci_dev_info
Message-ID: <YQJlKG/RWZa3x+21@stefanha-x1.localdomain>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <c65908895de707a0532aa9dd09932bff329ea416.1626675354.git.elena.ufimtseva@oracle.com>
 <YQEudt/G5zilt702@stefanha-x1.localdomain>
 <239B3640-8D08-4380-9812-E55501EE2F5D@oracle.com>
MIME-Version: 1.0
In-Reply-To: <239B3640-8D08-4380-9812-E55501EE2F5D@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DQYBW6EfCnRp7YfD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DQYBW6EfCnRp7YfD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 12:55:08AM +0000, John Johnson wrote:
>=20
>=20
> > On Jul 28, 2021, at 3:16 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Sun, Jul 18, 2021 at 11:27:43PM -0700, Elena Ufimtseva wrote:
> >> From: John G Johnson <john.g.johnson@oracle.com>
> >>=20
> >> New class for vfio-user with its class and instance
> >> constructors and destructors.
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/vfio/pci.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
> >> 1 file changed, 49 insertions(+)
> >>=20
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index bea95efc33..554b562769 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c
> >> @@ -42,6 +42,7 @@
> >> #include "qapi/error.h"
> >> #include "migration/blocker.h"
> >> #include "migration/qemu-file.h"
> >> +#include "hw/vfio/user.h"
> >>=20
> >> #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> >>=20
> >> @@ -3326,3 +3327,51 @@ static void register_vfio_pci_dev_type(void)
> >> }
> >>=20
> >> type_init(register_vfio_pci_dev_type)
> >> +
> >> +static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
> >> +{
> >> +    ERRP_GUARD();
> >> +    VFIOUserPCIDevice *udev =3D VFIO_USER_PCI(pdev);
> >> +
> >> +    if (!udev->sock_name) {
> >> +        error_setg(errp, "No socket specified");
> >> +        error_append_hint(errp, "Use -device vfio-user-pci,socket=3D<=
name>\n");
> >> +        return;
> >> +    }
> >> +}
> >> +
> >> +static void vfio_user_instance_finalize(Object *obj)
> >> +{
> >> +}
> >> +
> >> +static Property vfio_user_pci_dev_properties[] =3D {
> >> +    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
> >=20
> > Please use SocketAddress so that alternative socket connection details
> > can be supported without inventing custom syntax for vfio-user-pci. For
> > example, file descriptor passing should be possible.
> >=20
> > I think this requires a bit of command-line parsing work, so don't worr=
y
> > about it for now, but please add a TODO comment. When the -device
> > vfio-user-pci syntax is finalized (i.e. when the code is merged and the
> > device name doesn't start with the experimental x- prefix), then it
> > needs to be solved.
> >=20
>=20
> =09What do you want the options to look like at the endgame?  I=E2=80=99d
> rather work backward from that than have several different flavors of
> options as new socket options are added.  I did look at -chardev socket,
> and it was confusing enough that I went for the simple string.

The standard socket syntax is present in qemu-storage-daemon's --export
and --nbd-server options:

  addr.type=3Dinet,addr.host=3D<host>,addr.port=3D<port>
  addr.type=3Dunix,addr.path=3D<socket-path>
  addr.type=3Dfd,addr.str=3D<fd>

--export and --nbd-server use QAPI to generate parsers for these options
(they use 'SocketAddress' from qapi/sockets.json). I'm not sure whether
it's easier to reuse the QAPI parser or to simply add qdev properties
mimicking the same syntax. Either way, there should probably be a common
qdev property API for SocketAddress values.

> >> +    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure, false),
> >=20
> > I'm not sure what "secure-dma" means and the "secure" variable name is
> > even more inscrutable. Does this mean don't share memory so that each
> > DMA access is checked individually?
> >=20
>=20
> =09Yes.  Do you have another name you=E2=80=99d prefer? =E2=80=9Cno-share=
d-mem=E2=80=9D?

I'm not sure other property names are much clearer, so feel free to
stick with "secure-dma". Renaming the "secure" field to "secure_dma" and
adding a comment that clarifies its purpose would be enough.

Here are some options:
- The vfio-user protocol message for sharing memory is called
  VFIO_USER_DMA_MAP. The option could be dma-map=3Don|off (default on).
  But this is based on protocol internals and may not be clear to users.
- shared-mem=3Don|off
- shared-ram=3Don|off

Thanks,
Stefan

--DQYBW6EfCnRp7YfD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmECZSgACgkQnKSrs4Gr
c8gG9Af+IcbJwS1pksIQCwNzs+V74VS2BPLv6U3xopSjgfhowfjWGafscTtwd8qf
OZufSmKQLCXaCHc49SI5DdnvWEKjwLMgl0FxKy+e3LNEZNYGyZ5dq3Sg2Zd58905
6R/PdBV2koEDs62Pq7k6mslL9Je8pGECPW4qPbaplXvbKvZOwUAW/5MD/Qt3+FNz
E/xSaakdR01RIId6HhpZtepCX6hYD9z69qp4qtP3FHIKWJ4aavNaHbX64M+4QBw7
Re/CXLBKrL/9wFo3NMbkG3SaBEbKR0oq7N48gRp7cZZu1OgP7SE0l7peItRAiIJq
4zbWu8WcH5qSKZ3w0lw6gM4Jsgebfg==
=wKOL
-----END PGP SIGNATURE-----

--DQYBW6EfCnRp7YfD--


