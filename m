Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D822C3D3A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:08:58 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrjN-0006ri-Cl
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrhW-0005kG-On
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1khrhU-0002ti-Vd
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606298820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VDLTlS8pmpvUQ1Zf4VKxWbTWzZZz/HDUQGuT97/7tZ0=;
 b=KhHCoU8kpDGnwNSlkaBTYtOz5yIdZtspzFNVOwY9xDcSGf6PR0886KdmNCyxHbXsawRkF8
 C1kcmdgzwLr+ML8o05jPHPIQP/4mUyFta9nIHi8K8TgabqnLEmOorqf56SC1aqmN1Ga4R6
 h78UY20NnDl+SOamX5AW/VUOZtL3oto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-UJQPFDzjPHCpC1l6C99O1A-1; Wed, 25 Nov 2020 05:06:56 -0500
X-MC-Unique: UJQPFDzjPHCpC1l6C99O1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF9A85C739
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 10:06:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 824E160BE5;
 Wed, 25 Nov 2020 10:06:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] libvhost-user: make it a subproject (was: "lower
 dependency on QEMU headers")
Date: Wed, 25 Nov 2020 14:06:32 +0400
Message-Id: <20201125100640.366523-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
libvhost-user is meant to be free of glib dependency, and easily=0D
copyable/reusable outside of QEMU. Clean-up some dependencies that crept in=
=0D
recently (the one remaining is qemu/atomic.h, from which a subset is used)=
=0D
=0D
v2:=0D
- fix memfd flags argument (spotted by D. Gilbert)=0D
- new patches to remove dependency from QEMU headers=0D
- make it a standalone meson subproject=0D
- check subproject build in gitlab CI (suggested by S. Hajnoczi)=0D
- add some r-b tags=0D
=0D
Marc-Andr=C3=A9 Lureau (8):=0D
  libvhost-user: replace qemu/bswap.h with glibc endian.h=0D
  libvhost-user: replace qemu/memfd.h usage=0D
  libvhost-user: remove qemu/compiler.h usage=0D
  libvhost-user: drop qemu/osdep.h dependency=0D
  libvhost-user: make it a meson subproject=0D
  libvhost-user: check memfd API=0D
  libvhost-user: add a simple link test without glib=0D
  .gitlab-ci: add build-libvhost-user=0D
=0D
 meson.build                                   |   7 +-=0D
 contrib/vhost-user-gpu/vugpu.h                |   2 +-=0D
 include/qemu/vhost-user-server.h              |   2 +-=0D
 .../libvhost-user/libvhost-user-glib.h        |   0=0D
 .../libvhost-user/libvhost-user.h             |   0=0D
 block/export/vhost-user-blk-server.c          |   2 +-=0D
 contrib/vhost-user-blk/vhost-user-blk.c       |   3 +-=0D
 contrib/vhost-user-input/main.c               |   3 +-=0D
 contrib/vhost-user-scsi/vhost-user-scsi.c     |   2 +-=0D
 .../libvhost-user/libvhost-user-glib.c        |  10 +-=0D
 .../libvhost-user/libvhost-user.c             | 126 +++++++++++-------=0D
 subprojects/libvhost-user/link-test.c         |  45 +++++++=0D
 tests/vhost-user-bridge.c                     |   2 +-=0D
 tools/virtiofsd/fuse_virtio.c                 |   2 +-=0D
 .gitlab-ci.yml                                |  11 ++=0D
 contrib/libvhost-user/meson.build             |   4 -=0D
 contrib/vhost-user-blk/meson.build            |   3 +-=0D
 contrib/vhost-user-gpu/meson.build            |   3 +-=0D
 contrib/vhost-user-input/meson.build          |   3 +-=0D
 contrib/vhost-user-scsi/meson.build           |   3 +-=0D
 subprojects/libvhost-user/meson.build         |  36 +++++=0D
 tests/meson.build                             |   3 +-=0D
 tools/virtiofsd/meson.build                   |   3 +-=0D
 23 files changed, 201 insertions(+), 74 deletions(-)=0D
 rename {contrib =3D> subprojects}/libvhost-user/libvhost-user-glib.h (100%=
)=0D
 rename {contrib =3D> subprojects}/libvhost-user/libvhost-user.h (100%)=0D
 rename {contrib =3D> subprojects}/libvhost-user/libvhost-user-glib.c (93%)=
=0D
 rename {contrib =3D> subprojects}/libvhost-user/libvhost-user.c (96%)=0D
 create mode 100644 subprojects/libvhost-user/link-test.c=0D
 delete mode 100644 contrib/libvhost-user/meson.build=0D
 create mode 100644 subprojects/libvhost-user/meson.build=0D
=0D
--=20=0D
2.29.0=0D
=0D


