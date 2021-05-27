Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB783930D8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:25:10 +0200 (CEST)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGwf-0006pZ-Jn
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGvZ-0004zC-DQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGvX-00047S-9H
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RlGwRTPsyEgndLG4syFpfaaISXn2KKM5gKxVM9opyH4=;
 b=OQfI5A5cEul215ewznk9VR9oq0EDXBNssYjKXKopxl26UrvNM8LMwrj2PTztT1ngpqaFh/
 OGG+SjDz61IVr+fRLQ6joMBXAfy4jBksg20+Vy/UGouF+GTX15ddk8TnlpThhofe1RAwI/
 aXyOkUnRJtN4Rr//y3R2TTwrgFofLVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-lIoAkTsKNiC6d5cW2p15_g-1; Thu, 27 May 2021 10:23:55 -0400
X-MC-Unique: lIoAkTsKNiC6d5cW2p15_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE630107ACE6
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 14:23:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A2CC5D9D3;
 Thu, 27 May 2021 14:23:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA63B180038E; Thu, 27 May 2021 16:23:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] Vga 20210527 patches
Date: Thu, 27 May 2021 16:23:17 +0200
Message-Id: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2ab2dad01f6dc3667c0d53d2b1ba46b511031207=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/input-20210526-pull-req=
uest' into staging (2021-05-26 15:27:20 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210527-pull-request=0D
=0D
for you to fetch changes up to bdd53f739273e97b5e5617b699d1763c42a5ea7e:=0D
=0D
  virtio-gpu: Update cursor data using blob (2021-05-27 12:07:37 +0200)=0D
=0D
----------------------------------------------------------------=0D
virtio-gpu: add blob resource support.=0D
vhost-user-gpu: security fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Li Qiang (8):=0D
  vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info=0D
    (CVE-2021-3545)=0D
  vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'=0D
    (CVE-2021-3544)=0D
  vhost-user-gpu: fix memory leak in vg_resource_attach_backing=0D
    (CVE-2021-3544)=0D
  vhost-user-gpu: fix memory leak while calling 'vg_resource_unref'=0D
    (CVE-2021-3544)=0D
  vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'=0D
    (CVE-2021-3544)=0D
  vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'=0D
    (CVE-2021-3544)=0D
  vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'=0D
    (CVE-2021-3546)=0D
  vhost-user-gpu: abstract vg_cleanup_mapping_iov=0D
=0D
Vivek Kasireddy (14):=0D
  ui: Get the fd associated with udmabuf driver=0D
  headers: Add udmabuf.h=0D
  virtio-gpu: Add udmabuf helpers=0D
  stubs: Add stubs for udmabuf helpers=0D
  virtio-gpu: Add virtio_gpu_find_check_resource=0D
  virtio-gpu: Refactor virtio_gpu_set_scanout=0D
  virtio-gpu: Refactor virtio_gpu_create_mapping_iov=0D
  virtio-gpu: Add initial definitions for blob resources=0D
  virtio-gpu: Add virtio_gpu_resource_create_blob=0D
  ui/pixman: Add qemu_pixman_to_drm_format()=0D
  virtio-gpu: Add helpers to create and destroy dmabuf objects=0D
  virtio-gpu: Factor out update scanout=0D
  virtio-gpu: Add virtio_gpu_set_scanout_blob=0D
  virtio-gpu: Update cursor data using blob=0D
=0D
maobibo (1):=0D
  hw/display/qxl: Set pci rom address aligned with page size=0D
=0D
 contrib/vhost-user-gpu/vugpu.h           |   2 +-=0D
 include/hw/virtio/virtio-gpu-bswap.h     |  16 +=0D
 include/hw/virtio/virtio-gpu.h           |  39 +-=0D
 include/standard-headers/linux/udmabuf.h |  32 ++=0D
 include/ui/console.h                     |   3 +=0D
 include/ui/qemu-pixman.h                 |   1 +=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c  |  29 +-=0D
 contrib/vhost-user-gpu/virgl.c           |  20 +-=0D
 hw/display/qxl.c                         |   2 +-=0D
 hw/display/virtio-gpu-base.c             |   3 +=0D
 hw/display/virtio-gpu-udmabuf.c          | 223 ++++++++++++=0D
 hw/display/virtio-gpu-virgl.c            |   3 +-=0D
 hw/display/virtio-gpu.c                  | 441 +++++++++++++++++------=0D
 stubs/virtio-gpu-udmabuf.c               |  27 ++=0D
 ui/qemu-pixman.c                         |  35 +-=0D
 ui/udmabuf.c                             |  40 ++=0D
 hw/display/meson.build                   |   1 +=0D
 hw/display/trace-events                  |   2 +=0D
 meson.build                              |   2 +-=0D
 scripts/update-linux-headers.sh          |   3 +=0D
 stubs/meson.build                        |   1 +=0D
 ui/meson.build                           |   1 +=0D
 22 files changed, 804 insertions(+), 122 deletions(-)=0D
 create mode 100644 include/standard-headers/linux/udmabuf.h=0D
 create mode 100644 hw/display/virtio-gpu-udmabuf.c=0D
 create mode 100644 stubs/virtio-gpu-udmabuf.c=0D
 create mode 100644 ui/udmabuf.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


