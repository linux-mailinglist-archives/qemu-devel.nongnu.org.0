Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7AB52B293
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 08:42:03 +0200 (CEST)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrDNi-0001aw-DZ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 02:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrDCv-0006wA-Tp
 for qemu-devel@nongnu.org; Wed, 18 May 2022 02:30:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrDCq-0006sa-Oh
 for qemu-devel@nongnu.org; Wed, 18 May 2022 02:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652855447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=HiUpgPTTlKwXv4we5H4dCAID8KOjBHxi0Xtt24lk5jI=;
 b=gCsHJ7NndDTq3S/1d08gvXS7/f26u1OZae55U4+tKOZk/cUE830XQzmkeBZn+cwygdqQOO
 cQnmKgr1rAYk+GzmpxX6XfHaCTr7IAwNPdq6/Ap6NNyMqxFJ/koEMWj30aY0PRdIddnvw2
 asO63bqc3EgI/nzK5JObFFKB4/O0nFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-guaH5da3M3KxDG2S8TfNzQ-1; Wed, 18 May 2022 02:30:42 -0400
X-MC-Unique: guaH5da3M3KxDG2S8TfNzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 472348032EA;
 Wed, 18 May 2022 06:30:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D72E6492C3B;
 Wed, 18 May 2022 06:30:41 +0000 (UTC)
Date: Wed, 18 May 2022 07:30:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kirill Tkhai <kirill.tkhai@openvz.org>
Cc: qemu-devel@nongnu.org, dm-devel@redhat.com,
 linux-kernel@vger.kernel.org, Kevin Wolf <kwolf@redhat.com>,
 hreitz@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 sgarzare@redhat.com
Subject: Attaching qcow2 images to containers
Message-ID: <YoSSkOQaGL0sBNOI@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VxVmuJGtHcUMbdkL"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VxVmuJGtHcUMbdkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,
I saw your "[PATCH 0/4] dm: Introduce dm-qcow2 driver to attach QCOW2
files as block device" patch series:
https://lore.kernel.org/linux-kernel/YkME5ZS2CpXuNmN6@infradead.org/T/

There has been recent work in vDPA (VIRTIO Data Path Acceleration) to
achieve similar functionality. The qemu-storage-daemon VDUSE export
attaches a virtio-blk device to the host kernel and QEMU's qcow2
implementation can be used:
https://patchew.org/QEMU/20220504074051.90-1-xieyongji@bytedance.com/

A container can then access this virtio-blk device (/dev/vda). Note that
the virtio-blk device is implemented in software using vDPA/VDUSE, there
is no virtio-pci device.

As a quick comparison with a dm-qcow2 target, this approach keeps the
qcow2 code in QEMU userspace and can take advantage of QEMU block layer
features (storage migration/mirroring/backup, snapshots, etc). On the
other hand, it's likely to be more heavyweight because bounce buffers
are required in VDUSE for security reasons, there is a separate
userspace process involved, and there's the virtio_blk.ko driver and an
emulated virtio-blk device involved.

Another similar feature that was recently added to QEMU is the
qemu-storage-daemon FUSE export:

  $ qemu-storage-daemon \
        --blockdev file,filename=test.img,node-name=drive0 \
	--export fuse,node-name=drive0,id=fuse0,mountpoint=/tmp/foo
  $ ls -alF /tmp/foo
  -r--------. 1 me me 10737418240 May 18 07:22 /tmp/foo

This exports a disk image as a file via FUSE. Programs can access it
like a regular file and qemu-storage-daemon will do the qcow2 I/O on the
underlying file.

I wanted to mention these options for exposing qcow2 disk images to
processes/containers on the host. Depending on your use cases they might
be interesting. Performance comparisons against VDUSE and FUSE exports
would be interesting since these new approaches seem to be replacing
qemu-nbd.

Can you share more about your use cases for the dm-qcow2 target? It
could be useful for everyone I've CCed to be aware of various efforts in
this area.

Thanks,
Stefan

--VxVmuJGtHcUMbdkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKEkpAACgkQnKSrs4Gr
c8hBOggAjwLYdNLqHIo1rQgUfb93kau+ER5YddjUvSxG65CLZGYWeB86JOUfT+rR
hVi2bBGX1OkL1a66tWLK2Tcbakc6XfQXQ6JCbzJUoKCTI9gIA9i3ztjqrQEzoagn
liMWkk89XmdrLE8gsA7MOKHdFELKRiFds8JKU0Pny/VDJkOlYO/6gcqCw5fcXkrv
58PTohwKlOgOVdQ1wzlkFGRtTPtc5/JeFzJOIUs4i+GnqtjubKl4VfbjRiAoqTEj
uOO5gsJ9mdTHyWd1lugxiSqttqVVZZb6VEQvsnZUwFUoNkB/KHoILTcMWd9GWRn0
HNO2R2xD/zhG2j+x7dw6n7RBczgUdw==
=Wa4Q
-----END PGP SIGNATURE-----

--VxVmuJGtHcUMbdkL--


