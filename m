Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240534D623
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:37:34 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvpU-0002fO-So
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvnX-0001kE-V3
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvnU-00082Y-Mw
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617039327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0oOUn/5XnN4U5yxiOL/g0nvuPWm4lF3yfeQRMQ3oyiY=;
 b=cWMYIcFVCmv+aPLeMGXKZDbFBMleEGLH/bXg3/g5zc1Bz1hvlITduoz752UooGp5grhtj5
 PZ+B8xSMC1qRCDJh2vtCZjeblvqoPc4UVwLPAatwArTGGdkHTOV0tgKhRcICy3gWLukfei
 cyyNxZB0jAg7kW275HJXsIA47Y7LEeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-_2q7Nb9XNvOrgsgg7m38Mw-1; Mon, 29 Mar 2021 13:35:22 -0400
X-MC-Unique: _2q7Nb9XNvOrgsgg7m38Mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9666D801814;
 Mon, 29 Mar 2021 17:35:21 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E7B607CB;
 Mon, 29 Mar 2021 17:35:17 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:35:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <YGIP1HKa5NsHqnj7@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qf8c0BCH3Mn3wUD2"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qf8c0BCH3Mn3wUD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:27PM +0100, Greg Kurz wrote:
> Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> a serious slow down may be observed on setups with a big enough number
> of vCPUs.
>=20
> Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threads=
):
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
> This series introduce generic APIs to allow batch creation and deletion
> of ioeventfds, and converts virtio-blk and virtio-scsi to use them. This
> greatly improves the numbers:
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

Excellent numbers!

I wonder if the code can be simplified since
memory_region_transaction_begin/end() supports nesting. Why not call
them directly from the device model instead of introducing callbacks in
core virtio and virtio-pci code?

Also, do you think there are other opportunities to have a long
transaction to batch up machine init, device hotplug, etc? It's not
clear to me when transactions must be ended. Clearly it's necessary to
end the transaction if we need to do something that depends on the
MemoryRegion, eventfd, etc being updated. But most of the time there is
no immediate need to end the transaction and more code could share the
same transaction before we go back to the event loop or vcpu thread.

Stefan

--qf8c0BCH3Mn3wUD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiD9QACgkQnKSrs4Gr
c8iRIwgAmmxk0RNOBfHOMHbttFE2oQRC0PsHYDfMMehCzvhaWDyMJHZMBGU69eIl
QNZqFZLTqebA1x8p8jbzUPWWJ7vkwKMROu/mI+tWqgw/164su5anXBWkax7NXcYp
Zdt121GA71/jdYgURstsdpSg8F+RC/GAEYComqDliRH7t1rhJE8y5gF5PDNQFLLP
wIN+6NsUFhG3iyKB8XXJqFQ1re23abVXF/qycQxSDvTeWSsY0ioXc0Y1gCbDNE2L
mD7hnuHdWvabzVqtQ41fQDyIiuesdQwgqZIu1ERG2XGhQzEUsfmdlQjmQ5VghsSz
2kAeEBAznis9Q5bmgLSrxVIByyEVUQ==
=ddAp
-----END PGP SIGNATURE-----

--qf8c0BCH3Mn3wUD2--


