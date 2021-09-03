Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C274B40045B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:54:02 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDO5-000497-P5
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFe-0006zi-VX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFc-0000Oy-Rq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5pxglglrBjktMPrcMnRa0MQmvg3ha7aIsW8uhOkppUs=;
 b=YY5smGxTavBhN3EOlYKVPcuQGSPLAJBTXL/A6HtBdaeEaI0wkOdhuUodySYrMJJ8ORPAMk
 p3iassQXNmBZXKAcRf9x73KtR7L/14tbNlCY1RwiNClswA1rSgN2LlwRvzOMhzUl8qaopH
 +9d9LuqE4ESXE2gPPl3iYZKHHCbqksI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-Us7WWN5tPAGSwrD5Zfnkvw-1; Fri, 03 Sep 2021 13:45:14 -0400
X-MC-Unique: Us7WWN5tPAGSwrD5Zfnkvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso44699wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scQC4+mFjIe2ASr4s0NfJ0tOtGyU6KRT6zsforUnNCg=;
 b=o8KUiHw2MsOifUV4/aNGF4/qwNpj7PJs6/1OBDJMHgwyCaaqHg/kWZ+hgwC3PxhvJD
 dS5k0/PhdzFVe6zeNsOGwmrD2wY5sU3iURoLX9KIJmeEssWguSorxSt+ILqpZTacMLIi
 anlV0kioysbNMXAXQhp0xSV92HFFfHxgYqpiKCY+rKTT2EOYCTLwx+cfS/Po89//2o4d
 q1+MpE0UsOnGZ26eTs6G4S88yRaB4dYYNA1QsXseYFUaFLP3POpxzMDdrNfFxoRzt0kj
 omKzlgiQHsco0OOzAv1E5Mb85hTUrYplXtGfL28zoa6w44h2mLu+W0nw48NdPcaPmb0l
 HVJQ==
X-Gm-Message-State: AOAM531KClzFz74WVLpasi0n2SiJwy+9hpJJ4wtkAnY3IK0TUoodB42Y
 yA4y/WqF4dWV+qriiItMW6jS3xICWoOaxftBY4j1rnfVOekd7LTemG7mDzB314moN4XV8mzuC0V
 PtGxi0KzeDGtmHCbMTWdSX5CJwe1tD9aQVQK3uk3Mi7fFvgT9iRGfvpLt+PJOWSVJ
X-Received: by 2002:adf:e68b:: with SMTP id r11mr273953wrm.394.1630691112691; 
 Fri, 03 Sep 2021 10:45:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfaorDhaZgd7Il9OcYLqMKVldGIhalwsexT83SykhTCAo51zUyY6dGWgUk8dkPBqSMkrwkGw==
X-Received: by 2002:adf:e68b:: with SMTP id r11mr273914wrm.394.1630691112462; 
 Fri, 03 Sep 2021 10:45:12 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v5sm5111506wrw.44.2021.09.03.10.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:42 +0200
Message-Id: <20210903174510.751630-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdu=
p2-now/5538=0D
=0D
  The old API took the size of the memory to duplicate as a guint,=0D
  whereas most memory functions take memory sizes as a gsize. This=0D
  made it easy to accidentally pass a gsize to g_memdup(). For large=0D
  values, that would lead to a silent truncation of the size from 64=0D
  to 32 bits, and result in a heap area being returned which is=0D
  significantly smaller than what the caller expects. This can likely=0D
  be exploited in various modules to cause a heap buffer overflow.=0D
=0D
g_memdup() as been deprecated in GLib 2.68. Since QEMU defines=0D
GLIB_VERSION_MAX_ALLOWED to GLIB_VERSION_2_56, the deprecation=0D
is not displayed (on GLib >=3D 2.68 such available on Fedora 34).=0D
However the function is still unsafe, so it is better to avoid=0D
its use.=0D
=0D
This series provides the safely equivalent g_memdup2() wrapper,=0D
and replace all g_memdup() calls by it.=0D
=0D
The previous link recommend to audit the call sites. Most of the=0D
calls use byte_size=3Dsizeof(STRUCT), and no STRUCT appears to be=0D
> 4GiB.  Few calls use unsigned/size_t/uint16_t. Where code is=0D
doing multiplication, patches are sent as RFC. In particular:=0D
    hw/net/virtio-net.c=0D
    hw/virtio/virtio-crypto.c=0D
=0D
Since v1:=0D
- Added missing g_memdup2 -> g_memdup2_qemu compat definition (danpb)=0D
- Do not call g_memdup2_qemu() but directly g_memdup2() (danpb)=0D
=0D
Tested with the following snippet:=0D
-- >8 --=0D
diff --git a/include/glib-compat.h b/include/glib-compat.h=0D
index 8d01a8c01fb..2b33dea71a8 100644=0D
--- a/include/glib-compat.h=0D
+++ b/include/glib-compat.h=0D
@@ -21,3 +21,3 @@=0D
  */=0D
-#define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_56=0D
+#define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_68=0D
=0D
@@ -26,3 +26,3 @@=0D
  */=0D
-#define GLIB_VERSION_MAX_ALLOWED GLIB_VERSION_2_56=0D
+#define GLIB_VERSION_MAX_ALLOWED GLIB_VERSION_2_68=0D
=0D
---=0D
=0D
Philippe Mathieu-Daud=C3=A9 (28):=0D
  hw/hyperv/vmbus: Remove unused vmbus_load/save_req()=0D
  glib-compat: Introduce g_memdup2() wrapper=0D
  qapi: Replace g_memdup() by g_memdup2()=0D
  accel/tcg: Replace g_memdup() by g_memdup2()=0D
  block/qcow2-bitmap: Replace g_memdup() by g_memdup2()=0D
  softmmu: Replace g_memdup() by g_memdup2()=0D
  hw/9pfs: Replace g_memdup() by g_memdup2()=0D
  hw/acpi: Avoid truncating acpi_data_len() to 32-bit=0D
  hw/acpi: Replace g_memdup() by g_memdup2()=0D
  hw/core/machine: Replace g_memdup() by g_memdup2()=0D
  hw/hppa/machine: Replace g_memdup() by g_memdup2()=0D
  hw/i386/multiboot: Replace g_memdup() by g_memdup2()=0D
  hw/net/eepro100: Replace g_memdup() by g_memdup2()=0D
  hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()=0D
  hw/scsi/mptsas: Replace g_memdup() by g_memdup2()=0D
  hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()=0D
  hw/rdma: Replace g_memdup() by g_memdup2()=0D
  hw/vfio/pci: Replace g_memdup() by g_memdup2()=0D
  hw/virtio: Replace g_memdup() by g_memdup2()=0D
  net/colo: Replace g_memdup() by g_memdup2()=0D
  ui/clipboard: Replace g_memdup() by g_memdup2()=0D
  linux-user: Replace g_memdup() by g_memdup2()=0D
  tests/unit: Replace g_memdup() by g_memdup2()=0D
  tests/qtest: Replace g_memdup() by g_memdup2()=0D
  target/arm: Replace g_memdup() by g_memdup2()=0D
  target/ppc: Replace g_memdup() by g_memdup2()=0D
  contrib: Replace g_memdup() by g_memdup2()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
=0D
 include/glib-compat.h       | 37 +++++++++++++++++++++++=0D
 include/hw/hyperv/vmbus.h   |  3 --=0D
 accel/tcg/cputlb.c          |  8 ++---=0D
 block/qcow2-bitmap.c        |  2 +-=0D
 contrib/plugins/lockstep.c  |  2 +-=0D
 contrib/rdmacm-mux/main.c   | 10 +++----=0D
 hw/9pfs/9p-synth.c          |  2 +-=0D
 hw/9pfs/9p.c                |  2 +-=0D
 hw/acpi/core.c              |  3 +-=0D
 hw/arm/virt-acpi-build.c    |  2 +-=0D
 hw/core/machine.c           |  4 +--=0D
 hw/hppa/machine.c           |  8 ++---=0D
 hw/hyperv/vmbus.c           | 59 -------------------------------------=0D
 hw/i386/acpi-build.c        |  6 ++--=0D
 hw/i386/multiboot.c         |  2 +-=0D
 hw/net/eepro100.c           |  2 +-=0D
 hw/net/virtio-net.c         |  3 +-=0D
 hw/nvram/fw_cfg.c           |  9 +++---=0D
 hw/ppc/spapr_pci.c          |  7 ++---=0D
 hw/rdma/rdma_utils.c        |  2 +-=0D
 hw/scsi/mptsas.c            |  5 ++--=0D
 hw/vfio/pci.c               |  2 +-=0D
 hw/virtio/virtio-crypto.c   |  6 ++--=0D
 linux-user/syscall.c        |  2 +-=0D
 linux-user/uaccess.c        |  2 +-=0D
 net/colo.c                  |  4 +--=0D
 qapi/qapi-clone-visitor.c   | 16 +++++-----=0D
 qapi/qapi-visit-core.c      |  6 ++--=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/vl.c                |  2 +-=0D
 target/arm/helper.c         |  6 ++--=0D
 target/ppc/mmu-hash64.c     |  2 +-=0D
 tests/qtest/libqos/ahci.c   |  6 ++--=0D
 tests/qtest/libqos/qgraph.c |  2 +-=0D
 tests/unit/ptimer-test.c    | 22 +++++++-------=0D
 tests/unit/test-iov.c       | 26 ++++++++--------=0D
 ui/clipboard.c              |  2 +-=0D
 scripts/checkpatch.pl       |  5 ++++=0D
 38 files changed, 138 insertions(+), 153 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


