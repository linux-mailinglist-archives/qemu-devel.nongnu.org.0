Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390193FD218
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 06:21:59 +0200 (CEST)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLHl7-0008O5-L3
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 00:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHig-0005tX-H1
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHic-0001Mg-DC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 00:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VHsSOuYKMljID1Uz+cfYkFla8EjGQYjZfunM5Z4lnVg=;
 b=KguCN1WvDP9och/P0KSucU7jNXDKDFG898/moi+mZPZCCdetcE3FKVltQs+Bqu2+fN/Tp8
 dthkmFUh4sYbNFiEpf5kwWsFll1z9EwElvpus7op3qMubAinIfZVbCCBsVMxOy5vXtZYal
 dmKZzrS5Zb72g8vzt8vn3f8/WbQ+v8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-R6yR0LtnODKTmcS0PNlHiw-1; Wed, 01 Sep 2021 00:19:16 -0400
X-MC-Unique: R6yR0LtnODKTmcS0PNlHiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3C77107ACCA;
 Wed,  1 Sep 2021 04:19:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BA9B1001281;
 Wed,  1 Sep 2021 04:19:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2BE7D180060F; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Vga 20210901 patches
Date: Wed,  1 Sep 2021 06:18:57 +0200
Message-Id: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827=
' into staging (2021-08-27 11:34:12 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/vga-20210901-pull-request=0D
=0D
for you to fetch changes up to 01f750f5fef1afd8f6abc0548910f87d473e26d5:=0D
=0D
  hw/display/artist: Fix bug in coordinate extraction in artist_vram_read()=
 and artist_vram_write() (2021-08-31 14:38:53 +0200)=0D
=0D
----------------------------------------------------------------=0D
vga: misc fixes and cleanups.=0D
=0D
----------------------------------------------------------------=0D
=0D
Dongwon Kim (1):=0D
  virtio-gpu: no point of checking res->iov=0D
=0D
Helge Deller (1):=0D
  hw/display/artist: Fix bug in coordinate extraction in=0D
    artist_vram_read() and artist_vram_write()=0D
=0D
Jose R. Ziviani (1):=0D
  vga: don't abort when adding a duplicate isa-vga device=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/display: Restrict virtio-gpu-udmabuf stubs to !Linux=0D
  ui/console: Restrict udmabuf_fd() to Linux=0D
=0D
Qiang Liu (1):=0D
  hw/display/xlnx_dp: fix an out-of-bounds read in xlnx_dp_read=0D
=0D
 include/ui/console.h                          |  2 ++=0D
 hw/display/artist.c                           |  8 ++---=0D
 hw/display/vga-isa.c                          | 10 ++++++=0D
 .../display/virtio-gpu-udmabuf-stubs.c        |  0=0D
 hw/display/virtio-gpu.c                       |  2 +-=0D
 hw/display/xlnx_dp.c                          |  6 +++-=0D
 tests/qtest/fuzz-xlnx-dp-test.c               | 33 +++++++++++++++++++=0D
 ui/udmabuf.c                                  | 11 -------=0D
 hw/display/meson.build                        |  3 +-=0D
 stubs/meson.build                             |  1 -=0D
 tests/qtest/meson.build                       |  1 +=0D
 ui/meson.build                                |  6 ++--=0D
 12 files changed, 62 insertions(+), 21 deletions(-)=0D
 rename stubs/virtio-gpu-udmabuf.c =3D> hw/display/virtio-gpu-udmabuf-stubs=
.c (100%)=0D
 create mode 100644 tests/qtest/fuzz-xlnx-dp-test.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


