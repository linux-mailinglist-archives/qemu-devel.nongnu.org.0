Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A886B2E08EB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:47:21 +0100 (CET)
Received: from localhost ([::1]:54096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfCK-0006a7-ML
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAN-0004jw-Ti
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAL-00074P-Hr
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NYdQNs/ALk76Ay0Qp8yr/nWVdKFByDeWgnZf5ev3mY=;
 b=TslyhOeXTID6nPkzBNaYcLTqWJMFk4Km+zOGo63Uj1+Wyt8EWiDWyESVe6x1W/I2lxeaSv
 ccaZsyWJH4SyrFk7D0u8+3z2sQDjrHbX1V3Gss18M1vWqCvjbhGX4f1I+QEyrNCPx1uGBC
 Fu3GBp2vK25R2oJ7i5BZD8ICGmetglk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-5moclBhqOtaWYR1r06PJ_Q-1; Tue, 22 Dec 2020 05:45:12 -0500
X-MC-Unique: 5moclBhqOtaWYR1r06PJ_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEBF0425F2;
 Tue, 22 Dec 2020 10:45:10 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA367A319;
 Tue, 22 Dec 2020 10:45:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/14] MAINTAINERS: move my git tree to gitlab
Date: Tue, 22 Dec 2020 11:44:51 +0100
Message-Id: <20201222104503.224510-3-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I push to gitlab anyway to get some CI coverage, so let's make
it my primary tree to avoid workflow duplication.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201214132628.56019-1-cohuck@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e7c8f04885d..dca762a66bfa 100644
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
@@ -417,7 +417,7 @@ F: hw/intc/s390_flic.c
 F: hw/intc/s390_flic_kvm.c
 F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
@@ -1436,7 +1436,7 @@ F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
 F: default-configs/s390x-softmmu.mak
 F: tests/acceptance/machine_s390_ccw_virtio.py
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
@@ -1767,7 +1767,7 @@ F: hw/vfio/ccw.c
 F: hw/s390x/s390-ccw.c
 F: include/hw/s390x/s390-ccw.h
 F: include/hw/s390x/vfio-ccw.h
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 vfio-ap
@@ -1838,7 +1838,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
 F: hw/s390x/vhost-vsock-ccw.c
-T: git https://github.com/cohuck/qemu.git s390-next
+T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
-- 
2.26.2


