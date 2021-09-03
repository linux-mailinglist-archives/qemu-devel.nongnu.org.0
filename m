Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0443FFEBA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:10:59 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM760-0000dK-Db
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72R-00047v-3v
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72N-0008Fl-Ad
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PF/xnGXQTIoJHa57WKQQPyvoyaxxjuKOqyDKhhHUMA0=;
 b=bD95BwEnd6jLtsE1fqujz3OSSU9tKtXJpuJXQUcFkKjaaUTXEmT8JfpEZqSAB6pNZQUB9o
 gd+FEGHQE0hzbALeEzJEREi17wQzAQMMMWx9/4U028vZ6iXzsW4PS4AznFDvH7DcT447Zp
 IrJfjJWU3/GntPzYQTS8ObDbJeYA2g8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-yiOaW-3mNNeI156gudqSZg-1; Fri, 03 Sep 2021 07:07:08 -0400
X-MC-Unique: yiOaW-3mNNeI156gudqSZg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so1458248wrm.15
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hT4rpMU7gMMiB6PN8r96+Od1up6S2/wmxgTRnbJrmUA=;
 b=KEiHHG4X/6PsUBJKnFqus4kjl/P30k74OU87OMlW9abP0tjOWksO+8Wkvwzyi8olQz
 imoOdMTYBYKfRtMZ9FnUAbfzOU6CDAp1E0xhkwA9zSbXiN8BeJaSR3TcPSexn/GNbveg
 Fv1U0F+GWExLPnejOK2xXJU+VufhPja0iSvEM3VqHuhHD0whFCF9jg5Qm+QyAcO+U0dP
 JWYog2oQXK6h8vAOVYqwkrPpfje0oZfj1clXb2G3P9nwxEXrZqihhrrrEeWZl/hRHu8R
 siDnyyLjCUhl+kgCBduqXmZWDolReZK4oxmZfLXXA52fB1L1fljMBxoDEPALmUeppeg2
 Ix1Q==
X-Gm-Message-State: AOAM533GQjgbBzTS4hBg0sfHfzN7Jthlhmw5mui4/tsMZS6mFMvvTRCE
 nRQFoQAqHSYFfMGrhE/8cmPK6U5zY9Xb+gK2OaUaTI++rmV27YZnLnqLb6po4L1ZT2VVLLgE49o
 32JOoLGF1YNIgtI1igqsI32WeWnUmXbd1wKAN9fuUrrWe24NYEQIm6Po0wP5zmAmR
X-Received: by 2002:a05:600c:5102:: with SMTP id
 o2mr2726548wms.104.1630667226855; 
 Fri, 03 Sep 2021 04:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaINVrz2Oo6Ll0VUL1B7or1/Wu6l6LXRuExjk8CK/rA79v/WgMkhb7LDE02QVwLZ8ojY+26Q==
X-Received: by 2002:a05:600c:5102:: with SMTP id
 o2mr2726472wms.104.1630667226343; 
 Fri, 03 Sep 2021 04:07:06 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 r10sm4631717wrc.85.2021.09.03.04.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/28] glib: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:34 +0200
Message-Id: <20210903110702.588291-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
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
This series provides the safely equivalent g_memdup2_qemu()=0D
wrapper, and replace all g_memdup() calls by it.=0D
=0D
The previous link recommend to audit the call sites. Most of the=0D
calls use byte_size=3Dsizeof(STRUCT), and no STRUCT appears to be=0D
> 4GiB.  Few calls use unsigned/size_t/uint16_t. Where code is=0D
doing multiplication, patches are sent as RFC. In particular:=0D
    hw/net/virtio-net.c=0D
    hw/virtio/virtio-crypto.c=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (28):=0D
  hw/hyperv/vmbus: Remove unused vmbus_load/save_req()=0D
  glib-compat: Introduce g_memdup2() wrapper=0D
  qapi: Replace g_memdup() by g_memdup2_qemu()=0D
  accel/tcg: Replace g_memdup() by g_memdup2_qemu()=0D
  block/qcow2-bitmap: Replace g_memdup() by g_memdup2_qemu()=0D
  softmmu: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/9pfs: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/acpi: Avoid truncating acpi_data_len() to 32-bit=0D
  hw/acpi: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/core/machine: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/hppa/machine: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/i386/multiboot: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/net/eepro100: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/scsi/mptsas: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/rdma: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/vfio/pci: Replace g_memdup() by g_memdup2_qemu()=0D
  RFC hw/virtio: Replace g_memdup() by g_memdup2_qemu()=0D
  net/colo: Replace g_memdup() by g_memdup2_qemu()=0D
  RFC ui/clipboard: Replace g_memdup() by g_memdup2_qemu()=0D
  RFC linux-user: Replace g_memdup() by g_memdup2_qemu()=0D
  tests/unit: Replace g_memdup() by g_memdup2_qemu()=0D
  tests/qtest: Replace g_memdup() by g_memdup2_qemu()=0D
  target/arm: Replace g_memdup() by g_memdup2_qemu()=0D
  target/ppc: Replace g_memdup() by g_memdup2_qemu()=0D
  contrib: Replace g_memdup() by g_memdup2_qemu()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
=0D
 include/glib-compat.h       | 36 ++++++++++++++++++++++=0D
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
 hw/ppc/spapr_pci.c          |  8 ++---=0D
 hw/rdma/rdma_utils.c        |  2 +-=0D
 hw/scsi/mptsas.c            |  5 ++--=0D
 hw/vfio/pci.c               |  2 +-=0D
 hw/virtio/virtio-crypto.c   |  7 +++--=0D
 linux-user/syscall.c        |  2 +-=0D
 linux-user/uaccess.c        |  2 +-=0D
 net/colo.c                  |  4 +--=0D
 qapi/qapi-clone-visitor.c   | 16 +++++-----=0D
 qapi/qapi-visit-core.c      |  6 ++--=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/vl.c                |  2 +-=0D
 target/arm/helper.c         |  7 +++--=0D
 target/ppc/mmu-hash64.c     |  3 +-=0D
 tests/qtest/libqos/ahci.c   |  6 ++--=0D
 tests/qtest/libqos/qgraph.c |  2 +-=0D
 tests/unit/ptimer-test.c    | 22 +++++++-------=0D
 tests/unit/test-iov.c       | 26 ++++++++--------=0D
 ui/clipboard.c              |  2 +-=0D
 scripts/checkpatch.pl       |  5 ++++=0D
 38 files changed, 141 insertions(+), 153 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


