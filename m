Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794813FEFC1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 16:58:53 +0200 (CEST)
Received: from localhost ([::1]:59130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoB2-0002gQ-JM
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 10:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLo92-0001R5-Qt
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 10:56:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLo8y-0001Ci-GW
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 10:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630594600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6kg+Kuz3TB3djgrZzcwNe/7HdyQV/ns3tqUZHzV03o=;
 b=YqDW1fNt48j5CbuVZekc/WHXJBAyJS98EDNx1A4aCL9C7XE2ZBfzse8xp1seIctpgBjt0j
 1/17GAFu1Unb9HU4vG+R+FoP8QKVrFsy6hjUxbp6PtLcMSyyq5ktNG8tzCJiyjADdngS3F
 bmX1Y8pBXBYCHBNuJXvaL6obtqrza+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-wD7jS3eVMIWRhUvn_bdAyQ-1; Thu, 02 Sep 2021 10:56:36 -0400
X-MC-Unique: wD7jS3eVMIWRhUvn_bdAyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB301966321;
 Thu,  2 Sep 2021 14:56:35 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85A760C4A;
 Thu,  2 Sep 2021 14:56:31 +0000 (UTC)
Date: Thu, 2 Sep 2021 15:56:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
Message-ID: <YTDmHpgzzK+GVmqS@stefanha-x1.localdomain>
References: <20210825224256.1750286-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210825224256.1750286-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QsmeTRxHRHpI6qFV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QsmeTRxHRHpI6qFV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 12:42:56AM +0200, Philippe Mathieu-Daud=E9 wrote:
> When a ring queue size is modified, we need to call
> virtio_queue_update_rings() to re-init the memory region
> caches. Otherwise the region might have outdated memory
> size, and later load/store access might trigger an
> assertion, such:
>=20
>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t ad=
dress_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxRe=
sult *):
>   Assertion `addr < cache->len && 2 <=3D cache->len - addr' failed.
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>   (gdb) bt
>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=3D0x61300=
010a7c0, addr=3D134, attrs=3D..., result=3D0x0) at include/exec/memory_ldst=
_cached.h.inc:30
>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=3D0x61300010a7c0, =
addr=3D134) at include/exec/memory_ldst_phys.h.inc:67
>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=3D0x62d00003a68=
0, cache=3D0x61300010a7c0, pa=3D134) at include/hw/virtio/virtio-access.h:1=
66
>   #7  0x0000555558f300ea in vring_avail_ring (vq=3D0x7fffdd55d8a0, i=3D65=
) at hw/virtio/virtio.c:326
>   #8  0x0000555558f33b10 in vring_get_used_event (vq=3D0x7fffdd55d8a0) at=
 hw/virtio/virtio.c:332
>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=3D0x62d00003=
a680, vq=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>   #10 0x0000555558f1859f in virtio_should_notify (vdev=3D0x62d00003a680, =
vq=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>   #11 0x0000555558f188cc in virtio_notify (vdev=3D0x62d00003a680, vq=3D0x=
7fffdd55d8a0) at hw/virtio/virtio.c:2565
>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=3D0x62d00003a68=
0, vq=3D0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=3D0x62d00003a680, n=
=3D1) at hw/virtio/virtio.c:2363
>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=3D0x62d000032=
400, addr=3D7, val=3D0, size=3D1) at hw/virtio/virtio-pci.c:1369
>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=3D0x62d00003=
3190, addr=3D7, value=3D0x7fffffff8eb0, size=3D1, shift=3D0, mask=3D255, at=
trs=3D...) at softmmu/memory.c:492
>=20
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a7..04ffe5f420e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n=
, int num)
>          return;
>      }
>      vdev->vq[n].vring.num =3D num;
> +    virtio_queue_update_rings(vdev, n);
>  }

Can this line in hw/virtio/virtio-mmio.c be removed now?

    case VIRTIO_MMIO_QUEUE_NUM:
        trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
        virtio_queue_set_num(vdev, vdev->queue_sel, value);

        if (proxy->legacy) {
            virtio_queue_update_rings(vdev, vdev->queue_sel);
=09    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stefan

--QsmeTRxHRHpI6qFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEw5h4ACgkQnKSrs4Gr
c8ha5Af9ETF2P2zFoznmywLWtSK2G6Y5VyVC8i7mCsnXx9BV9Ie2oB0VuJGOhaJv
fYAr7UfgLlmY+CTOhx8VUJUdTRf1f+0hCzrtBUoK3ZW4bzKL7lGFnaCjmh223qX/
aoNCHdpngyYvjOIsaW5SKS8PIu9Sk2Af3WgErKg2f550G0nZl4jnGLyBEfjnntrI
AJ2o6D3f6tHsFoniOrfd26YigTObxbdSiJMT3xFXOQthujYjx/0petgaZibV8RtM
ywAByJ8lIWnxvcTPdZ+UNkaBdFmMvm4aE42q379QJAESloeTWGm5oR2zo8LJWk4j
0m1i+b1KmrNqafEvaCXr4pOEJk38mA==
=UzoE
-----END PGP SIGNATURE-----

--QsmeTRxHRHpI6qFV--


