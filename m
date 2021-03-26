Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53134A791
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 13:52:54 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPlxN-0006ad-Si
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 08:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluV-0005B1-2g
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPluS-0003ir-V3
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 08:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616762992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pHjn04yQnmWHzA/Ou+esA8tktXoinWG3j+Hp1sjNCL0=;
 b=P3qF/vW7qyOdw6EpjSG1VMC/lSyvlBXlJayIPIwYm77ATsfPy/y4r82AC9qFK8xr8JpzYy
 yACecNrlj9R3efGn/DvVFsCRSQwdJ4ibBqKbpNfB3xNrVgMTAIXNjPooZJ7u+Pdhrw8iJw
 EOePVYZF4ktgucRGMCoPQO0myySrgoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-TbMm0r_CNP-uMWgLcw9K2A-1; Fri, 26 Mar 2021 08:49:48 -0400
X-MC-Unique: TbMm0r_CNP-uMWgLcw9K2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5523C101963C;
 Fri, 26 Mar 2021 12:49:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B786E6F5;
 Fri, 26 Mar 2021 12:49:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F77C1800385; Fri, 26 Mar 2021 13:49:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Fixes 20210326 patches
Date: Fri, 26 Mar 2021 13:49:23 +0100
Message-Id: <20210326124932.481942-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9e2e9fe3df9f539f8b6941ceb96d25355fdae47e=
:=0D
=0D
  Update version for v6.0.0-rc0 release (2021-03-24 19:50:49 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20210326-pull-request=0D
=0D
for you to fetch changes up to db0b034185824ac33e1a85ba62ab2030eb17b00d:=0D
=0D
  hw/usb/hcd-ehci: Fix crash when showing help of EHCI devices (2021-03-26 =
11:10:49 +0100)=0D
=0D
----------------------------------------------------------------=0D
fixes for usb, virtio-gpu and vhost-gpu=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (3):=0D
  s390x: move S390_ADAPTER_SUPPRESSIBLE=0D
  s390x: add have_virtio_ccw=0D
  s390x: modularize virtio-gpu-ccw=0D
=0D
Marc-Andr=C3=A9 Lureau (3):=0D
  vhost-user-gpu: glFlush before notifying clients=0D
  vhost-user-gpu: fix vugbm_device_init fallback=0D
  vhost-user-gpu: fix cursor move/update=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/usb/hcd-ehci-sysbus: Free USBPacket on instance finalize()=0D
=0D
Thomas Huth (2):=0D
  usb: Remove "-usbdevice ccid"=0D
  hw/usb/hcd-ehci: Fix crash when showing help of EHCI devices=0D
=0D
 contrib/vhost-user-gpu/vugbm.h          |  2 +-=0D
 hw/s390x/virtio-ccw.h                   |  5 +++=0D
 include/hw/s390x/css.h                  |  7 ----=0D
 include/hw/s390x/s390_flic.h            |  3 ++=0D
 target/s390x/cpu.h                      |  9 +++--=0D
 contrib/vhost-user-gpu/vhost-user-gpu.c | 24 +++++++-------=0D
 contrib/vhost-user-gpu/virgl.c          |  3 ++=0D
 contrib/vhost-user-gpu/vugbm.c          | 44 +++++++++++--------------=0D
 hw/s390x/virtio-ccw-gpu.c               |  4 ++-=0D
 hw/s390x/virtio-ccw.c                   |  2 ++=0D
 hw/usb/dev-smartcard-reader.c           |  1 -=0D
 hw/usb/hcd-ehci-sysbus.c                |  9 +++++=0D
 hw/usb/hcd-ehci.c                       | 10 +++---=0D
 util/module.c                           |  1 +=0D
 contrib/vhost-user-gpu/meson.build      |  2 +-=0D
 docs/system/removed-features.rst        |  6 ++++=0D
 hw/s390x/meson.build                    |  8 ++++-=0D
 qemu-options.hx                         |  3 --=0D
 18 files changed, 85 insertions(+), 58 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


