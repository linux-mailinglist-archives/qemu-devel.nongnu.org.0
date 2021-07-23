Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0911F3D3458
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:56:48 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oAw-0004bD-Q5
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9K-00027J-FG
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9G-0006BG-FL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627019700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=38iJcERKcfW82aXWIGxKgK4aB2cYoifoqIzp8gH0K3s=;
 b=AeQP+z4vGaR1ihiuNIYyQt05C7WmBMSYQd6B/RHH4r+s/x48PAXcjFfTBXBPh4FQtzfkLh
 Ziq+jdcMwC7dRIVuMSXmMjQQdwPDRDs+rYu2/vX0JXEsi9aYkel5++oYTc7rzex7Cyn8yr
 /IKdc2GuvdeGsQF6CvxMcdZDmIWwIWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-LNDqrlzcOQ25pDHbclWmKQ-1; Fri, 23 Jul 2021 01:54:59 -0400
X-MC-Unique: LNDqrlzcOQ25pDHbclWmKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B04A1005D57
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:54:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9848560C5F;
 Fri, 23 Jul 2021 05:54:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D27751800926; Fri, 23 Jul 2021 07:54:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Vga 20210723 patches
Date: Fri, 23 Jul 2021 07:54:42 +0200
Message-Id: <20210723055448.1032115-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e77c8b8b8e933414ef07dbed04e02973fccffeb0=
:=0D
=0D
  Update version for v6.1.0-rc0 release (2021-07-21 17:10:15 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210723-pull-request=0D
=0D
for you to fetch changes up to 8a13b9bc0f283caff4333c75bc396a963f47ce5c:=0D
=0D
  hw/display: fix virgl reset regression (2021-07-22 15:46:54 +0200)=0D
=0D
----------------------------------------------------------------=0D
vga: fixes for qxl and virtio-gpu=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (2):=0D
  qxl: remove assert in qxl_pre_save.=0D
  Revert "qxl: add migration blocker to avoid pre-save assert"=0D
=0D
Marc-Andr=C3=A9 Lureau (3):=0D
  hw/display: fail early when multiple virgl devices are requested=0D
  vl: add virtio-vga-gl to the default_list=0D
  hw/display: fix virgl reset regression=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/display/virtio-gpu: Fix memory leak (CID 1453811)=0D
=0D
 hw/display/qxl.h               |  1 -=0D
 include/hw/virtio/virtio-gpu.h |  1 +=0D
 hw/display/qxl.c               | 35 +++-------------------------------=0D
 hw/display/virtio-gpu-gl.c     | 27 +++++++++++++++-----------=0D
 hw/display/virtio-gpu-virgl.c  |  8 ++++++--=0D
 hw/display/virtio-gpu.c        | 26 ++++++++++---------------=0D
 softmmu/vl.c                   |  1 +=0D
 7 files changed, 37 insertions(+), 62 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


