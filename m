Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF12D98BA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:28:16 +0100 (CET)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kontf-0001oS-MG
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1konsB-00018X-VA
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kons6-0007X3-TG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607952397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9aWyyk5wsfOjGOJGhaI9+MRpZAUWqgHObKPa/9SsMWs=;
 b=QT8Ej2fGq2ZuW7S9ARumchfxNyolOHxyg2i7mZMCR74OfVKC+IjH9IPeablMpOv83gIV0i
 YqA/A2yBMuM09pkSB3KTk0dFugyKie22c8BcDEeVM3QEIZ5kR7XD4kgJ3nxcD35v2PC/8b
 IVPtjU+4LJM0xSjPkWKeKqnHnOQggqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-_rzQg-y7PVyd4_mm1sydLg-1; Mon, 14 Dec 2020 08:26:33 -0500
X-MC-Unique: _rzQg-y7PVyd4_mm1sydLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5641934101;
 Mon, 14 Dec 2020 13:26:32 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-171.ams2.redhat.com
 [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D57555C1BB;
 Mon, 14 Dec 2020 13:26:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH] MAINTAINERS: move my git tree to gitlab
Date: Mon, 14 Dec 2020 14:26:28 +0100
Message-Id: <20201214132628.56019-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I push to gitlab anyway to get some CI coverage, so let's make
it my primary tree to avoid workflow duplication.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d48a4e8a8b75..0d559635f0e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -106,7 +106,7 @@ F: docs/system/target-s390x.rst
 F: docs/system/s390x/
 F: tests/migration/s390x/
 K: ^Subject:.*(?i)s390x?
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 Guest CPU cores (TCG)
@@ -416,7 +416,7 @@ F: hw/intc/s390_flic.c
 F: hw/intc/s390_flic_kvm.c
 F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
@@ -1428,7 +1428,7 @@ F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
 F: default-configs/s390x-softmmu.mak
 F: tests/acceptance/machine_s390_ccw_virtio.py
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
@@ -1759,7 +1759,7 @@ F: hw/vfio/ccw.c
 F: hw/s390x/s390-ccw.c
 F: include/hw/s390x/s390-ccw.h
 F: include/hw/s390x/vfio-ccw.h
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 vfio-ap
@@ -1830,7 +1830,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
 F: hw/s390x/vhost-vsock-ccw.c
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
-- 
2.26.2


