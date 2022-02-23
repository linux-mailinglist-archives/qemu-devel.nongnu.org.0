Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD44C17E8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 16:58:12 +0100 (CET)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMu1r-0006oT-8e
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 10:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMtzV-0005N8-H3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMtzR-0002nl-KN
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645631737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xCgK7Y0toJ4NGDJzOXAZMg571ydlJp/jwgzV5rjqkHg=;
 b=Nwd8c43HuLrsCpJyRfsAge4y66wZzr14ebPAM7+Yo12fvw7P6lJfgoqsX186V9hYQEaThK
 smrl/AVTxgSB/xO0pzkIkQ61rzXja38Dcnm20tJJxu0Yww6/cEPUIcAj3J0Qo24+v4Ih5K
 /aLJjfZ4v9Mmz53kr3omm7vC5VbRe3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-PI-816RkNvK-An1lWfsvTg-1; Wed, 23 Feb 2022 10:55:35 -0500
X-MC-Unique: PI-816RkNvK-An1lWfsvTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF248835DE0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 15:55:34 +0000 (UTC)
Received: from localhost (unknown [10.39.195.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48AEE832B1;
 Wed, 23 Feb 2022 15:55:34 +0000 (UTC)
Date: Wed, 23 Feb 2022 15:55:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: virtio-blk issue with vIOMMU
Message-ID: <YhZY9dnAvBmiakgw@stefanha-x1.localdomain>
References: <7ef3d447-1ee5-dbeb-b1c8-4b471d556e2a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1NyJzGn4EQFiguJv"
Content-Disposition: inline
In-Reply-To: <7ef3d447-1ee5-dbeb-b1c8-4b471d556e2a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1NyJzGn4EQFiguJv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 12:37:03PM +0800, Jason Wang wrote:
> Hi Stefan:
>=20
> Recently I found intel vIOMMU gives the following warning when using
> virtio-blk:
>=20
> qemu-system-x86_64: vtd_iova_to_slpte: detected slpte permission error
> (iova=3D0x7ffde000, level=3D0x3, slpte=3D0x0, write=3D0)
> qemu-system-x86_64: vtd_iommu_translate: detected translation failure
> (dev=3D01:00:00, iova=3D0x7ffde000)
> qemu-system-x86_64: New fault is not recorded due to compression of faults
> qemu-system-x86_64: virtio: zero sized buffers are not allowed
>=20
> It happens on the boot (device start), and virtio-blk works well after th=
is.
> A quick stack trace is:
>=20
> Thread 1 "qemu-system-x86" hit Breakpoint 1, vtd_iova_to_slpte
> (s=3D0x555557a9f710, ce=3D0x7fffffffd6e0, iova=3D2147344384, is_write=3Df=
alse,
> slptep=3D0x7fffffffd6b8,
> =A0=A0=A0 slpte_level=3D0x7fffffffd6b0, reads=3D0x7fffffffd6aa, writes=3D=
0x7fffffffd6ab,
> aw_bits=3D39 '\'') at ../hw/i386/intel_iommu.c:1055
> 1055=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error_report_once("%s: de=
tected slpte permission error "
> (gdb) bt
> #0=A0 vtd_iova_to_slpte
> =A0=A0=A0 (s=3D0x555557a9f710, ce=3D0x7fffffffd6e0, iova=3D2147344384, is=
_write=3Dfalse,
> slptep=3D0x7fffffffd6b8, slpte_level=3D0x7fffffffd6b0, reads=3D0x7fffffff=
d6aa,
> writes=3D0x7fffffffd6ab, aw_bits=3D39 '\'') at ../hw/i386/intel_iommu.c:1=
055
> #1=A0 0x0000555555b45734 in vtd_do_iommu_translate (vtd_as=3D0x5555574cd0=
00,
> bus=3D0x55555766e700, devfn=3D0 '\000', addr=3D2147344384, is_write=3Dfal=
se,
> entry=3D0x7fffffffd780)
> =A0=A0=A0 at ../hw/i386/intel_iommu.c:1785
> #2=A0 0x0000555555b48543 in vtd_iommu_translate (iommu=3D0x5555574cd070,
> addr=3D2147344384, flag=3DIOMMU_RO, iommu_idx=3D0) at
> ../hw/i386/intel_iommu.c:2996
> #3=A0 0x0000555555bd3f4d in address_space_translate_iommu
> =A0=A0=A0 (iommu_mr=3D0x5555574cd070, xlat=3D0x7fffffffd9f0, plen_out=3D0=
x7fffffffd9e8,
> page_mask_out=3D0x0, is_write=3Dfalse, is_mmio=3Dtrue, target_as=3D0x7fff=
ffffd938,
> attrs=3D...)
> =A0=A0=A0 at ../softmmu/physmem.c:433
> #4=A0 0x0000555555bdbdd1 in address_space_translate_cached
> (cache=3D0x7fffed3d02e0, addr=3D0, xlat=3D0x7fffffffd9f0, plen=3D0x7fffff=
ffd9e8,
> is_write=3Dfalse, attrs=3D...)
> =A0=A0=A0 at ../softmmu/physmem.c:3388
> #5=A0 0x0000555555bdc519 in address_space_lduw_internal_cached_slow
> (cache=3D0x7fffed3d02e0, addr=3D0, attrs=3D..., result=3D0x0,
> endian=3DDEVICE_LITTLE_ENDIAN)
> =A0=A0=A0 at /home/devel/git/qemu/memory_ldst.c.inc:209
> #6=A0 0x0000555555bdc6ac in address_space_lduw_le_cached_slow
> (cache=3D0x7fffed3d02e0, addr=3D0, attrs=3D..., result=3D0x0) at
> /home/devel/git/qemu/memory_ldst.c.inc:253
> #7=A0 0x0000555555c71719 in address_space_lduw_le_cached
> (cache=3D0x7fffed3d02e0, addr=3D0, attrs=3D..., result=3D0x0)
> =A0=A0=A0 at /home/devel/git/qemu/include/exec/memory_ldst_cached.h.inc:35
> #8=A0 0x0000555555c7196a in lduw_le_phys_cached (cache=3D0x7fffed3d02e0, =
addr=3D0)
> at /home/devel/git/qemu/include/exec/memory_ldst_phys.h.inc:67
> #9=A0 0x0000555555c728fd in virtio_lduw_phys_cached (vdev=3D0x55555774372=
0,
> cache=3D0x7fffed3d02e0, pa=3D0) at
> /home/devel/git/qemu/include/hw/virtio/virtio-access.h:166
> #10 0x0000555555c73485 in vring_used_flags_set_bit (vq=3D0x7ffff4ee5010,
> mask=3D1) at ../hw/virtio/virtio.c:383
> #11 0x0000555555c736a8 in virtio_queue_split_set_notification
> (vq=3D0x7ffff4ee5010, enable=3D0) at ../hw/virtio/virtio.c:433
> #12 0x0000555555c73896 in virtio_queue_set_notification (vq=3D0x7ffff4ee5=
010,
> enable=3D0) at ../hw/virtio/virtio.c:490
> #13 0x0000555555c19064 in virtio_blk_handle_vq (s=3D0x555557743720,
> vq=3D0x7ffff4ee5010) at ../hw/block/virtio-blk.c:782
> #14 0x0000555555c191f5 in virtio_blk_handle_output (vdev=3D0x555557743720,
> vq=3D0x7ffff4ee5010) at ../hw/block/virtio-blk.c:819
> #15 0x0000555555c78453 in virtio_queue_notify_vq (vq=3D0x7ffff4ee5010) at
> ../hw/virtio/virtio.c:2315
> #16 0x0000555555c7b523 in virtio_queue_host_notifier_aio_poll_ready
> (n=3D0x7ffff4ee5084) at ../hw/virtio/virtio.c:3516
> #17 0x0000555555eff158 in aio_dispatch_handler (ctx=3D0x55555680fac0,
> node=3D0x7fffeca5bbe0) at ../util/aio-posix.c:350
> #18 0x0000555555eff390 in aio_dispatch_handlers (ctx=3D0x55555680fac0) at
> ../util/aio-posix.c:406
> #19 0x0000555555eff3ea in aio_dispatch (ctx=3D0x55555680fac0) at
> ../util/aio-posix.c:416
> #20 0x0000555555f184eb in aio_ctx_dispatch (source=3D0x55555680fac0,
> callback=3D0x0, user_data=3D0x0) at ../util/async.c:311
> #21 0x00007ffff7b6b17d in g_main_context_dispatch () at
> /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #22 0x0000555555f299ed in glib_pollfds_poll () at ../util/main-loop.c:232
> #23 0x0000555555f29a6b in os_host_main_loop_wait (timeout=3D0) at
> ../util/main-loop.c:255
> #24 0x0000555555f29b7c in main_loop_wait (nonblocking=3D0) at
> ../util/main-loop.c:531
> #25 0x0000555555be097c in qemu_main_loop () at ../softmmu/runstate.c:727
> #26 0x00005555558367fa in main (argc=3D26, argv=3D0x7fffffffe058,
> envp=3D0x7fffffffe130) at ../softmmu/main.c:50
>=20
> The slpte is 0x0 and level is 3 which probably means the device is kicked
> before it was attached to any IOMMU domain.
>=20
> Bisecting points to the first bad commit:
>=20
> commit 826cc32423db2a99d184dbf4f507c737d7e7a4ae
> Author: Stefan Hajnoczi <stefanha@redhat.com>
> Date:=A0=A0 Tue Dec 7 13:23:31 2021 +0000
>=20
> =A0=A0=A0 aio-posix: split poll check from ready handler
>=20
> A wild guess is that this lead some false kick to the device, any thought=
 on
> this?

Funny, I hit the same bug but a different symptom today. I'm sending a
fix and will CC you.

Stefan

--1NyJzGn4EQFiguJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIWWPUACgkQnKSrs4Gr
c8hHUwgAk4HCkVCEpaBbfeQcKbqkphYpjXfxDXRFcz3ZsntzYUcdmNIfF6Ziu6X6
gfbLj7+SBy04aGh9WKaq90N9jIH5hyOucrYkO3RyuRJC0lBqbUDBNdc7vCKhr80Y
6DYirlz0GdmLgEnRMFjZqVT8+iMwdL+gKeTAW+jFEPuRUyd80rpunWZTAZ7ESVOq
ln0xaB5Z68/Im8TEAvYiRvkPE3Q1YP+/JW2QSHBgIVEUCRL03ybc1xMDNE6Clqua
/Ff1B31LR+EluzJbhQYnCfT3jrTN6SpEZRLSVuw8GxKckGeNFgKNxMLTtnjxPrUR
ptIEUhYxK9KXMWpk61d7F2r1xqGhhQ==
=HlJd
-----END PGP SIGNATURE-----

--1NyJzGn4EQFiguJv--


