Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368E383523
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:19:37 +0200 (CEST)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lif1r-0000nR-9f
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1liezu-0006GQ-TT
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:17:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1liezi-0005iT-6e
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621264632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PeW7Sn+jQoPDCuN+RhrChYe8Qaw13f4RtHsUm86e6Yg=;
 b=Kh5G/b/TcO78nTLvI50yZKSlMSOp7eEfV60bPwoEB3nQg6FotL+Iz8pqoMkq/XfIfAXjZ+
 mCtGawGECbFQbsq0O/V+VK2KhEOmGUWzMXx9gwr1NzuMzX588wvNvS04FThly1F5pUq+8g
 lV6OjE8Rzan7jKPIPz4dl8UtqgG8VQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-RhVBrzvmM4yb7c2mNo3BGg-1; Mon, 17 May 2021 11:17:06 -0400
X-MC-Unique: RhVBrzvmM4yb7c2mNo3BGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD4F189C446;
 Mon, 17 May 2021 15:17:05 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-84.ams2.redhat.com
 [10.36.115.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D04025C26D;
 Mon, 17 May 2021 15:17:03 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] docs: fix references to files converted to rST
Date: Mon, 17 May 2021 17:16:57 +0200
Message-Id: <20210517151702.109066-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches that fix references to old files in docs/ converted
to rST.

Broken references found running:

    for f in $(git grep -oh "docs.*txt")
    do
        test -f "$f" || echo "$f not exists"
    done

Stefano Garzarella (5):
  docs: fix references to docs/devel/tracing.rst
  docs: fix references to docs/devel/atomics.rst
  docs: fix references to docs/devel/build-system.rst
  docs: fix references to docs/specs/tpm.rst
  docs: fix references to docs/devel/s390-dasd-ipl.rst

 docs/devel/lockcnt.txt          | 2 +-
 include/qemu/atomic.h           | 4 ++--
 include/qemu/atomic128.h        | 2 +-
 hw/acpi/tpm.c                   | 2 +-
 hw/tpm/tpm_ppi.c                | 2 +-
 pc-bios/s390-ccw/dasd-ipl.c     | 2 +-
 MAINTAINERS                     | 4 ++--
 accel/kvm/trace-events          | 2 +-
 accel/tcg/trace-events          | 2 +-
 audio/trace-events              | 2 +-
 authz/trace-events              | 2 +-
 backends/tpm/trace-events       | 2 +-
 backends/trace-events           | 2 +-
 block/trace-events              | 2 +-
 chardev/trace-events            | 2 +-
 crypto/trace-events             | 2 +-
 hw/9pfs/trace-events            | 2 +-
 hw/acpi/trace-events            | 2 +-
 hw/adc/trace-events             | 2 +-
 hw/alpha/trace-events           | 2 +-
 hw/arm/trace-events             | 2 +-
 hw/audio/trace-events           | 2 +-
 hw/block/dataplane/trace-events | 2 +-
 hw/block/trace-events           | 2 +-
 hw/char/trace-events            | 2 +-
 hw/display/trace-events         | 2 +-
 hw/dma/trace-events             | 2 +-
 hw/gpio/trace-events            | 2 +-
 hw/hppa/trace-events            | 2 +-
 hw/i2c/trace-events             | 2 +-
 hw/i386/trace-events            | 2 +-
 hw/i386/xen/trace-events        | 2 +-
 hw/ide/trace-events             | 2 +-
 hw/input/trace-events           | 2 +-
 hw/intc/trace-events            | 2 +-
 hw/isa/trace-events             | 2 +-
 hw/mem/trace-events             | 2 +-
 hw/misc/macio/trace-events      | 2 +-
 hw/misc/trace-events            | 2 +-
 hw/net/trace-events             | 2 +-
 hw/nvram/trace-events           | 2 +-
 hw/pci-host/trace-events        | 2 +-
 hw/pci/trace-events             | 2 +-
 hw/ppc/trace-events             | 2 +-
 hw/rdma/trace-events            | 2 +-
 hw/rdma/vmw/trace-events        | 2 +-
 hw/rtc/trace-events             | 2 +-
 hw/s390x/trace-events           | 2 +-
 hw/scsi/trace-events            | 2 +-
 hw/sd/trace-events              | 2 +-
 hw/sparc/trace-events           | 2 +-
 hw/sparc64/trace-events         | 2 +-
 hw/timer/trace-events           | 2 +-
 hw/tpm/trace-events             | 2 +-
 hw/usb/trace-events             | 2 +-
 hw/vfio/trace-events            | 2 +-
 hw/virtio/trace-events          | 2 +-
 hw/watchdog/trace-events        | 2 +-
 hw/xen/trace-events             | 2 +-
 io/trace-events                 | 2 +-
 linux-user/trace-events         | 2 +-
 migration/trace-events          | 2 +-
 monitor/trace-events            | 2 +-
 nbd/trace-events                | 2 +-
 net/trace-events                | 2 +-
 qapi/trace-events               | 2 +-
 qom/trace-events                | 2 +-
 scripts/simpletrace.py          | 2 +-
 scsi/trace-events               | 2 +-
 softmmu/trace-events            | 2 +-
 target/arm/trace-events         | 2 +-
 target/hppa/trace-events        | 2 +-
 target/i386/kvm/trace-events    | 2 +-
 target/i386/trace-events        | 2 +-
 target/mips/trace-events        | 2 +-
 target/ppc/trace-events         | 2 +-
 target/s390x/trace-events       | 2 +-
 target/sparc/trace-events       | 2 +-
 tcg/README                      | 2 +-
 tests/qapi-schema/meson.build   | 2 +-
 trace-events                    | 2 +-
 ui/trace-events                 | 2 +-
 util/trace-events               | 2 +-
 83 files changed, 85 insertions(+), 85 deletions(-)

-- 
2.31.1


