Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C85400440
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:43:54 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDEH-0004Ne-V8
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDAq-0002L5-02
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDAk-0004qX-9r
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630690813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4NNCT/6mJQHBezCMyj/1zWFUy+TBscSgBk0G568aq7s=;
 b=HgZvnJQQ1lsXH2+uNa6Mkxx47t/xSlJwgvZJRNgipXRpdOmiRMM5HUEhFU7VRJm9lV8ZH3
 YnDqaxWrFnd18lEP4pHDLhAUpO6oEoEgQEkNDYwfJn2y1QISXnpndXZAJi2Tomvq/3xz+R
 vIhaMjqjydxqpUi1NKNese/ptqWBG1s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-dZacTQASP3qq9TWyUTW6hQ-1; Fri, 03 Sep 2021 13:40:12 -0400
X-MC-Unique: dZacTQASP3qq9TWyUTW6hQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so34428wmj.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/YkcMeWujQMsGibHR8EV4yAq+i22iiMCz7mye6vm8XE=;
 b=gwso93DuTZ5qZ3JaEezq7Ap3Ws2qp+4Un7V5Wa7Z1HEPYVz9x6hngF5zFCU0GdhprJ
 ufWag5g9au3k9nXFkAzCAjHovM53i19uJWw60e86iECoqdfuH1aHz7aYpukhbYNZbVEv
 xDLCcDBOJo46EiTp20NYiXHoSe28TiC6NxJgdnF0bXVmNogs20gEifkZhPZ48r9xLERv
 REiNQHOGcOuE1HT0B/LDeffd84DryaIaxfYo9X6Nrwv4SvKexbpFha7XbeA8OthvEWJh
 50xnzToGFdgnRs8IOucIVktkfXWH7v6WeIeOP8Jaxtio2qV4ENLjR7bbbHUYOvzlfUo2
 D2aA==
X-Gm-Message-State: AOAM5338rGtLuzxTlorBvW1zIQHvV1UVrTsnGN9eEwNo+9qBqRTk4TIe
 eNqRQezR2qPRWdpkKAsIB+8oaISrNSsdjT9K9MbEsBiMcLcHdNYYfpKlCWW51U5sazZCG9SkKtL
 cmt+cNCLnXHV4e8ZmjzYDiAEzWLL/VmKahCVAe6SOn4ZssmtGikw0Q3P86zLC1PJu
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr32511wmh.66.1630690810563;
 Fri, 03 Sep 2021 10:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk/z85zICKnCl4IuOzrie/j4oiJW6/xfWkYRhb5aQOJ6snWo1AeU5yQ1K5iZuDPbFkIY13sw==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr32465wmh.66.1630690810240;
 Fri, 03 Sep 2021 10:40:10 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u5sm5225206wrr.94.2021.09.03.10.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:40:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] glib: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:39:38 +0200
Message-Id: <20210903174008.749126-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
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
Philippe Mathieu-Daud=C3=A9 (30):=0D
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
  RFC hw/virtio: Replace g_memdup() by g_memdup2()=0D
  net/colo: Replace g_memdup() by g_memdup2()=0D
  RFC ui/clipboard: Replace g_memdup() by g_memdup2()=0D
  RFC linux-user: Replace g_memdup() by g_memdup2()=0D
  tests/unit: Replace g_memdup() by g_memdup2()=0D
  tests/qtest: Replace g_memdup() by g_memdup2()=0D
  target/arm: Replace g_memdup() by g_memdup2()=0D
  target/ppc: Replace g_memdup() by g_memdup2()=0D
  contrib: Replace g_memdup() by g_memdup2()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
  f=0D
  test=0D
=0D
 include/glib-compat.h       | 41 ++++++++++++++++++++++++--=0D
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
 38 files changed, 140 insertions(+), 155 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


