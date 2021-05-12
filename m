Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5C37C760
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:10:45 +0200 (CEST)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrRc-0004Wb-9M
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrN8-0002fV-Sf
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrN5-0003rp-5y
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620835561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U9BT1srrARPSGy5aDYfiInQUXNENEr/AA0MDcG3KJg8=;
 b=ZU6XHhCw5jHJaxC27HIQ4wp521ET/JUFURTAz/+IMaOsgaTeEomYKaA7nMuB98NPghmJzN
 w4qjZq6x/gUNNogpGIzDJxtvhZmAdArzq6E3m098D1qDnWn/KKaCBiaYxZLF2JabL/XYKs
 nDjcyZFlzbw+BgZDNvAMaj0Cu64jKXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-8roR7ofkP6KejV-LWw4-tw-1; Wed, 12 May 2021 12:05:59 -0400
X-MC-Unique: 8roR7ofkP6KejV-LWw4-tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6448A1922961;
 Wed, 12 May 2021 16:05:58 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D5DE1E6;
 Wed, 12 May 2021 16:05:54 +0000 (UTC)
Date: Wed, 12 May 2021 17:05:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/4] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <YJv84RIViv6KvCHb@stefanha-x1.localdomain>
References: <20210507165905.748196-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210507165905.748196-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NYu4nCYvJK5eBz7F"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NYu4nCYvJK5eBz7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 06:59:01PM +0200, Greg Kurz wrote:
> Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> a serious slow down may be observed on setups with a big enough number
> of vCPUs.
>=20
> Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads=
):
>=20
>               virtio-scsi      virtio-blk
>=20
> 1=09=090m20.922s=090m21.346s
> 2=09=090m21.230s=090m20.350s
> 4=09=090m21.761s=090m20.997s
> 8=09=090m22.770s=090m20.051s
> 16=09=090m22.038s=090m19.994s
> 32=09=090m22.928s=090m20.803s
> 64=09=090m26.583s=090m22.953s
> 128=09=090m41.273s=090m32.333s
> 256=09=092m4.727s =091m16.924s
> 384=09=096m5.563s =093m26.186s
>=20
> Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> the ioeventfds:
>=20
>  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
>   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
>   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> =3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeventfd=
_before
> =3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_io=
eventfds
>   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
>=20
> address_space_update_ioeventfds() is called when committing an MR
> transaction, i.e. for each ioeventfd with the current code base,
> and it internally loops on all ioventfds:
>=20
> static void address_space_update_ioeventfds(AddressSpace *as)
> {
> [...]
>     FOR_EACH_FLAT_RANGE(fr, view) {
>         for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
>=20
> This means that the setup of ioeventfds for these devices has
> quadratic time complexity.
>=20
> This series simply changes the device models to extend the transaction
> to all virtqueueues, like already done in the past in the generic
> code with 710fccf80d78 ("virtio: improve virtio devices initialization
> time").
>=20
> Only virtio-scsi and virtio-blk are covered here, but a similar change
> might also be beneficial to other device types such as host-scsi-pci,
> vhost-user-scsi-pci and vhost-user-blk-pci.
>=20
>               virtio-scsi      virtio-blk
>=20
> 1=09=090m21.271s=090m22.076s
> 2=09=090m20.912s=090m19.716s
> 4=09=090m20.508s=090m19.310s
> 8=09=090m21.374s=090m20.273s
> 16=09=090m21.559s=090m21.374s
> 32=09=090m22.532s=090m21.271s
> 64=09=090m26.550s=090m22.007s
> 128=09=090m29.115s=090m27.446s
> 256=09=090m44.752s=090m41.004s
> 384=09=091m2.884s=090m58.023s
>=20
> This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108
> which reported the issue for virtio-scsi-pci.
>=20
> Changes since v1:
> - Add some comments (Stefan)
> - Drop optimization on the error path in patch 2 (Stefan)
>=20
> Changes since RFC:
>=20
> As suggested by Stefan, splimplify the code by directly beginning and
> committing the memory transaction from the device model, without all
> the virtio specific proxying code and no changes needed in the memory
> subsystem.
>=20
> Greg Kurz (4):
>   virtio-blk: Fix rollback path in virtio_blk_data_plane_start()
>   virtio-blk: Configure all host notifiers in a single MR transaction
>   virtio-scsi: Set host notifiers and callbacks separately
>   virtio-scsi: Configure all host notifiers in a single MR transaction
>=20
>  hw/block/dataplane/virtio-blk.c | 45 ++++++++++++++++++++-
>  hw/scsi/virtio-scsi-dataplane.c | 72 ++++++++++++++++++++++++---------
>  2 files changed, 97 insertions(+), 20 deletions(-)
>=20
> --=20
> 2.26.3
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--NYu4nCYvJK5eBz7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb/OEACgkQnKSrs4Gr
c8hJPAgAyMGTWpdGDCG/vLaGz6a1yKQOFqfoMZW2tOboSmZY1MFeafcZFDuXIpmG
+Cj+cJGoO6N8CdXLfrR7gfXRE+Eyv4wvRiuOW8UyPM7p3dn/qc3z7cD+qrlVaFN+
xFwOn6j2QpefqxAhMCh50TbDTbkXXapH93f/lkDOlK5yfPvn1D8qMCoSwftdEJgc
eeXI5Xqfty+bUFmURxb9y3IGy9Ogw5j3Iyop8eiwwOHpmHpdzdKOOCvOHDBirg7o
ynGSdpfNvovEwE8hMkXwueGMmO+Eta06IA8HmCGelKK9Csp21iRWEYNf1sLfu1Ia
t7NQELaMqY/R1pGcCByAbYwAuXdq/Q==
=9Umt
-----END PGP SIGNATURE-----

--NYu4nCYvJK5eBz7F--


