Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995C033DB24
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:43:17 +0100 (CET)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDiu-0004lS-IW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMDIr-00075U-9k
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lMDIp-0000cM-6z
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JJCgXW0WicY64wAM90gzEUZAVxsZkafocIrZdkJeIiQ=;
 b=WaEEHC5GVph4Jn/2vZY/h1f7dsUlLeEbvuZUgPseDaneuqvajNpcZLUj7XZfeyJyoHwLoQ
 wzdJyHu//0htbOFuAC+hnx0jq8asOqNHh3cKnVHVC6G397XWyMMCVNvdvdlQrv6jkAX4Ac
 EI1HH1ZaGJ7hrgd+CDBR7I7rM+mpe8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-zZlD4QNjM4Oc-SMgGblYDQ-1; Tue, 16 Mar 2021 13:16:09 -0400
X-MC-Unique: zZlD4QNjM4Oc-SMgGblYDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B6231084C98;
 Tue, 16 Mar 2021 17:16:08 +0000 (UTC)
Received: from localhost (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41EB06BC0C;
 Tue, 16 Mar 2021 17:16:08 +0000 (UTC)
Date: Tue, 16 Mar 2021 17:16:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PULL v2 00/42] Block layer patches and object-add QAPIfication
Message-ID: <YFDn1yIMHk39tfMV@stefanha-x1.localdomain>
References: <20210315123520.118752-1-kwolf@redhat.com>
 <CAFEAcA8ckSBYcONgQKXeWnSwL9inGAchUAAwy9=xcb2HEP=qVQ@mail.gmail.com>
 <YFDCSMHXeP/qbeUZ@merkur.fritz.box>
 <YFDG/xfWFQoH9kMq@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YFDG/xfWFQoH9kMq@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RH4vunh12x208PIr"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--RH4vunh12x208PIr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 03:55:59PM +0100, Kevin Wolf wrote:
> Am 16.03.2021 um 15:35 hat Kevin Wolf geschrieben:
> > Am 16.03.2021 um 14:17 hat Peter Maydell geschrieben:
> > > On Mon, 15 Mar 2021 at 12:35, Kevin Wolf <kwolf@redhat.com> wrote:
> > > >
> > > > The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924a=
f6144b14:
> > > >
> > > >   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for=
-6.0-pull-request' into staging (2021-03-14 17:47:49 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> > > >
> > > > for you to fetch changes up to 078ee48ef7d172df1b3ad020255d1eb6beda=
2daf:
> > > >
> > > >   qom: Support JSON in HMP object_add and tools --object (2021-03-1=
5 13:04:27 +0100)
> > > >
> > > > ----------------------------------------------------------------
> > > > Block layer patches and object-add QAPIfication
> > > >
> > > > - QAPIfy object-add and --object for tools (keyval and JSON support=
)
> > > > - Add vhost-user-blk-test
> > > > - stream: Fail gracefully if permission is denied
> > > > - storage-daemon: Fix crash on quit when job is still running
> > > > - curl: Fix use after free
> > > > - char: Deprecate backend aliases, fix QMP query-chardev-backends
> > > > - Fix image creation option defaults that exist in both the format =
and
> > > >   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qco=
w2
> > > >   default was incorrectly applied to the rbd layer)
> > > >
> > > > ----------------------------------------------------------------
> > >=20
> > > Fails 'make check' on x86-64 linux:
> > >=20
> > > PASS 61 qtest-x86_64/qos-test
> > > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-bl=
k/virtio-blk-tests/config
> > > PASS 62 qtest-x86_64/qos-test
> > > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-bl=
k/virtio-blk-tests/basic
> > > PASS 63 qtest-x86_64/qos-test
> > > /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-blk-pci/virtio-bl=
k/virtio-blk-tests/resize
> > > **
> > > ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_=
no_isr:
> > > assertion failed: (!d->bus->get_queue_isr_status(d, vq))
> > > ERROR qtest-x86_64/qos-test - Bail out!
> > > ERROR:../../tests/qtest/libqos/virtio.c:194:qvirtio_wait_status_byte_=
no_isr:
> > > assertion failed: (!d->bus->get_queue_isr_status(d, vq))
> > > Makefile.mtest:1008: recipe for target 'run-test-124' failed
> > > make: *** [run-test-124] Error 1
> >=20
> > It didn't fail to me, so the condition must be a little more specific
> > than just x86_64 Linux.
> >=20
> > Stefan, can you have a look? I may have to drop these patches again.
>=20
> Actually, these are not the new vhost-user-blk test, but just the normal
> virtio-blk ones and it's probably unrelated. This is weird, because this
> pull request doesn't include any change to virtio-blk or the related
> qtests. Could this be intermittent failure of a change introduced by an
> earlier pull request?
>=20
> Peter, which environment was this and are full logs available? It
> doesn't seem to be the Gitlab CI (because the build is still running
> there and hasn't failed yet). My first attempts to reproduce have failed
> so far.

This patch fixes the failure. You can squash it into the
vhost-user-blk-test.c patch or if you've already dropped the patches
then I can send a new revision.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk=
-test.c
index dc9d7a31ae..8796c74ca4 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -580,6 +580,12 @@ static void idx(void *obj, void *u_data, QGuestAllocat=
or *t_alloc)

     qvirtio_set_driver_ok(dev);

+    /*
+     * libvhost-user signals the call fd in VHOST_USER_SET_VRING_CALL, mak=
e
+     * sure to wait for the isr here so we don't race and confuse it later=
 on.
+     */
+    qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
+
     /* Write request */
     req.type =3D VIRTIO_BLK_T_OUT;
     req.ioprio =3D 1;


--RH4vunh12x208PIr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBQ59cACgkQnKSrs4Gr
c8jF5Af+MuNlMd3U2xBNpXvXJCs5i1rieu3liv39oYVzyMURSM5nDoVcUjGJNInh
YNBetyDpvTDuwq4fLKIFE3YiZU3ZE7d7+M70UZpndy+6hwb3u4XuceDhE8pGbcyD
p/Yy4a7l6/wHHnBfTYY7QAmW51zKELvYxDg6/QM48GIGLZI3oiCS13JZWoSjEgEq
Mt23Os4n9PfOeRFLN4Ucxx6XOWj0BIWT0VeljKpm2aDakwSNRhp+5GT5FVbx2gv4
wCXVnZT3b022ZtCOKysLWAzMqqTP+u0mbxdj2a9c1dDlUldepsO/GU/dzgKrJeju
zPaQkNLi23zDLsfvOCWEIc7pLC32IA==
=p0EA
-----END PGP SIGNATURE-----

--RH4vunh12x208PIr--


