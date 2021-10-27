Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593143D026
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:54:41 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfn8K-0004cv-94
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfm0j-0000N5-BK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:42:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfm0g-0005PI-TK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635352961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5IJevb7UogFyfrwEoqgbv4GNfEhOeYMannAoS7LywvA=;
 b=E05ZcynxurXYEadw82kiEaNKyeB4bcOLv5Qxux68y6qH8IA3n1qAMif72eT8QiMAuzWsDn
 6pUwIZQnB84SrjTn4860/UqOP9IdE9/JyWnt07SL2vpPb3Cs+lIL2OYEF2Y2sLlsRj3IEj
 /59pO68jRWxuaTyRqw6lk3JnHIVTKYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-xv54k4MqOpq3YfQeAKx9kQ-1; Wed, 27 Oct 2021 12:42:38 -0400
X-MC-Unique: xv54k4MqOpq3YfQeAKx9kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6C6F8066F3;
 Wed, 27 Oct 2021 16:42:36 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA6B61B4B8;
 Wed, 27 Oct 2021 16:42:14 +0000 (UTC)
Date: Wed, 27 Oct 2021 17:42:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 12/12] vfio-user: acceptance test
Message-ID: <YXmBZQha5XpDzo8D@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <b5d78f1452a85057c257e1f9efca527d05ff0388.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b5d78f1452a85057c257e1f9efca527d05ff0388.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w/rJ/qJU78ovK1wZ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w/rJ/qJU78ovK1wZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:17AM -0400, Jagannathan Raman wrote:
> Acceptance test for libvfio-user in QEMU
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  MAINTAINERS                   |  1 +
>  tests/acceptance/vfio-user.py | 96 +++++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 tests/acceptance/vfio-user.py
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 79ff8331dc..a98d37423b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3422,6 +3422,7 @@ F: hw/remote/iohub.c
>  F: include/hw/remote/iohub.h
>  F: subprojects/libvfio-user
>  F: hw/remote/vfio-user-obj.c
> +F: tests/acceptance/vfio-user.py
> =20
>  EBPF:
>  M: Jason Wang <jasowang@redhat.com>
> diff --git a/tests/acceptance/vfio-user.py b/tests/acceptance/vfio-user.p=
y
> new file mode 100644
> index 0000000000..5eb5cabc68
> --- /dev/null
> +++ b/tests/acceptance/vfio-user.py
> @@ -0,0 +1,96 @@
> +# vfio-user protocol sanity test
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +
> +import os
> +import socket
> +import uuid
> +
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +from avocado_qemu import exec_command
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +
> +class VfioUser(Test):
> +    """
> +    :avocado: tags=3Dvfiouser
> +    """
> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> +
> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> +                machine_type):
> +        """Main test method"""
> +        self.require_accelerator('kvm')
> +
> +        kernel_path =3D self.fetch_asset(kernel_url)
> +        initrd_path =3D self.fetch_asset(initrd_url)
> +
> +        socket =3D os.path.join('/tmp', str(uuid.uuid4()))
> +        if os.path.exists(socket):
> +            os.remove(socket)
> +
> +        # Create remote process
> +        remote_vm =3D self.get_vm()
> +        remote_vm.add_args('-machine', 'x-remote')
> +        remote_vm.add_args('-nodefaults')
> +        remote_vm.add_args('-device', 'lsi53c895a,id=3Dlsi1')
> +        remote_vm.add_args('-object', 'vfio-user,id=3Dvfioobj1,'
> +                           'devid=3Dlsi1,socket=3D'+socket)

The object is called "vfio-user-server" and the parameter syntax seems
to be outdated. Does this test pass?

--w/rJ/qJU78ovK1wZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5gWUACgkQnKSrs4Gr
c8jhIgf/V3zOl5ZOqx+WfS3SxBIK2GCrX2xRGSWki9Il0xboVXuuR1dXytKuMWMM
OQG+dRecsKs3QuXlzUSNGZiSP+VBtGsR80Lh+K/ZuWt3fypoy48FjakpEjRq2p6T
UWIEEP7sUhLYdUc/KXMT6D4bRBwuCxYk046dz8+jG2+hELvDNX9koACTKtEur62w
azbAZHfF+Y9oN7f3XW4yGfuWE1luUKjUEhZzNKYNCp9P0b9lU6nlamj0ib/aCb68
BCLwwPn82xEOgLhawEN4hsrNcw4+EcvRad5s/nQe9QZJ+3Kkj87GQWxqv7MWBaNN
SpOcOJnxvZoUqJgeMRjK9ubFZ4cxfA==
=GwyJ
-----END PGP SIGNATURE-----

--w/rJ/qJU78ovK1wZ--


