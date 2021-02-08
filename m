Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D403139A3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:39:28 +0100 (CET)
Received: from localhost ([::1]:58144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99ZP-0003hx-Ut
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l92pw-00083v-DJ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l92pb-0006fD-UW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612776455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=trq91t2iwhKj5MKyzu2frHbq1Ivu63QHEGl6wBLhlxQ=;
 b=PWvpmcKIW9KUAzL3mHkgXFugUWoNZQajbq46jXpzD+MRiVueVS35sUPJuehiueCywKjlCD
 caTGl5oRmXUD50Gurzvv3jbJqpGRF9PzQhGySoiuatzk86zhgMLEGItGZbAEDkjyAv+Dvi
 7IEL8WwtsVlF+NiSVo5ShEtF0WODqlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-M5_tzgIePsevslFrTvA4XQ-1; Mon, 08 Feb 2021 04:27:33 -0500
X-MC-Unique: M5_tzgIePsevslFrTvA4XQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC4ECBBEE5;
 Mon,  8 Feb 2021 09:27:31 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC2125D9D5;
 Mon,  8 Feb 2021 09:27:24 +0000 (UTC)
Date: Mon, 8 Feb 2021 09:27:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PULL v3 00/27] Block patches
Message-ID: <20210208092723.GA18298@stefanha-x1.localdomain>
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
 <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 06, 2021 at 05:03:20PM +0000, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 22:53, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Fri, 5 Feb 2021 at 16:45, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > >
> > > The following changes since commit e2c5093c993ef646e4e28f7aa78429853b=
cc06ac:
> > >
> > >   iotests: 30: drop from auto group (and effectively from make check)=
 (2021-02-05 15:16:13 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> > >
> > > for you to fetch changes up to b07011f375bda3319cf72eee7cb18d31007838=
7b:
> > >
> > >   docs: fix Parallels Image "dirty bitmap" section (2021-02-05 16:36:=
36 +0000)
> > >
> > > ----------------------------------------------------------------
> > > Pull request
> > >
> > > v3:
> > >  * Replace {0} array initialization with {} to make clang happy [Pete=
r]
> > >
> > > ----------------------------------------------------------------
> >
> >
> > Fails 'make check' on s390x host:
>=20
> I gave this a rerun to check it was reproducible (it is) and realised
> I missed what looks like an important line in the log. As usual,
> trying to disentangle which lines of a parallel make check correspond
> to the failure is pretty tricky, but the lines
>  Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
>=20
> are probably the proximate causes of the assertion failures.
>=20
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=3D./qemu-img
> G_TEST_DBUS_DAEMON=3D/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=3D./qemu-system-rx tests/qtest/qos-test --tap -k
> PASS 45 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-size-summary
> SKIP
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=3D./qemu-img
> G_TEST_DBUS_DAEMON=3D/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=3D./qemu-system-s390x tests/qtest/pxe-test --tap -k
> PASS 46 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-devices
> Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
> PASS 47 qtest-rx/qmp-cmd-test /rx/qmp/query-replay
> PASS 48 qtest-rx/qmp-cmd-test /rx/qmp/query-yank
> PASS 49 qtest-rx/qmp-cmd-test /rx/qmp/query-name
> PASS 50 qtest-rx/qmp-cmd-test /rx/qmp/query-iothreads
> PASS 51 qtest-rx/qmp-cmd-test /rx/qmp/query-fdsets
> PASS 52 qtest-rx/qmp-cmd-test /rx/qmp/query-command-line-options
> PASS 53 qtest-rx/qmp-cmd-test /rx/qmp/query-acpi-ospm-status
> PASS 54 qtest-rx/qmp-cmd-test /rx/qmp/object-add-failure-modes
> MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=3D./qemu-img
> G_TEST_DBUS_DAEMON=3D/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=3D./qemu-system-s390x tests/qtest/test-netfilter --tap
> -k
> Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
> socket_accept failed: Resource temporarily unavailable
> socket_accept failed: Resource temporarily unavailable
> **
> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> **
> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> ../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> ERROR qtest-s390x/pxe-test - Bail out!
> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> ERROR qtest-s390x/test-netfilter - Bail out!
> ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
> Makefile.mtest:3113: recipe for target 'run-test-387' failed
> make: *** [run-test-387] Error 1
> make: *** Waiting for unfinished jobs....
> Makefile.mtest:3121: recipe for target 'run-test-388' failed

Hi Elena and Jag,
Please take a look at this QOM failure. I guess remote-pcihost is being
built but pcie-host-bridge is missing from the s390x-softmmu target.

Thanks,
Stefan

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAhA/kACgkQnKSrs4Gr
c8itkgf/VmddG13wSAXZ3TWjcueija39LCWYoPpju6F1dgld3iPZLXuPRV6WagCo
PAPfT21VNI8NFtKevuVtRuyIv8EVIKd/TIw8RrMhLl/kyHeXrKMf2M5FGd/ZdVME
Rswxrj5e8qmhf8O5uMaE9EF7+P/yYCsZuIWmJJI0Z5svBN94m9WNEM3bmtJrvKft
GR2IhmJkHwf11oAL/0yIP7nVTZqGOlPz3OyWMUtlbupNe8omkNEybvg+G/6G+3yK
vlRtkil7mDUnvlxdCKq21kfCZWirSxJmM2LHHfiEwf4K3tbTnJiK5whAd8eNmZ5q
GzkZQJm7abVN9mbFB9S12CiqfWuEzA==
=hqjG
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--


