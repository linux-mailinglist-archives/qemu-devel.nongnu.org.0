Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD44936F1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:13:17 +0100 (CET)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA71o-0002oN-7J
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:13:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6P9-0006qm-R2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:33:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6P7-0006Ho-T0
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5nylxmugxBBVbAlG4CHf8UnyZlRsHhcSQwZV3YafFg=;
 b=iNzlf6jhki2hv19Cvsrxxp9BSHyuZlS61ZF8RsHXuRGGEv0zRGKvjjaw0Wy4clnAD24o8S
 hNXTf+CmiFvGPzbz+SFAACFT+AWLwJELY3Lh+l+rUAtjI2yy9+so9CQdCpg9tlXHbyPfkx
 lu3fEJWu2US/swYSErogYVwocM0HRSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-sWgllIRTOySzpvM0VYHP9A-1; Wed, 19 Jan 2022 03:33:12 -0500
X-MC-Unique: sWgllIRTOySzpvM0VYHP9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBCF41966324;
 Wed, 19 Jan 2022 08:33:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 347014F85F;
 Wed, 19 Jan 2022 08:32:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] MAINTAINERS: split out s390x sections
Date: Wed, 19 Jan 2022 09:32:12 +0100
Message-Id: <20220119083215.120911-8-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Split out some more specialized devices etc., so that we can build
smarter lists of people to be put on cc: in the future.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20211222105548.356852-1-cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 85 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fd74c4642..793d6edd2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -297,7 +297,6 @@ M: David Hildenbrand <david@redhat.com>
 S: Maintained
 F: target/s390x/
 F: target/s390x/tcg
-F: target/s390x/cpu_models_*.[ch]
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
@@ -396,16 +395,10 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: target/s390x/kvm/
-F: target/s390x/ioinst.[ch]
 F: target/s390x/machine.c
 F: target/s390x/sigp.c
-F: target/s390x/cpu_features*.[ch]
-F: target/s390x/cpu_models.[ch]
 F: hw/s390x/pv.c
 F: include/hw/s390x/pv.h
-F: hw/intc/s390_flic.c
-F: hw/intc/s390_flic_kvm.c
-F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
@@ -1533,12 +1526,8 @@ S390 Virtio-ccw
 M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
-F: hw/char/sclp*.[hc]
-F: hw/char/terminal3270.c
 F: hw/s390x/
 F: include/hw/s390x/
-F: hw/watchdog/wdt_diag288.c
-F: include/hw/watchdog/wdt_diag288.h
 F: configs/devices/s390x-softmmu/default.mak
 F: tests/avocado/machine_s390_ccw_virtio.py
 T: git https://github.com/borntraeger/qemu.git s390-next
@@ -1563,6 +1552,37 @@ F: hw/s390x/s390-pci*
 F: include/hw/s390x/s390-pci*
 L: qemu-s390x@nongnu.org
 
+S390 channel subsystem
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+S: Supported
+F: hw/s390x/ccw-device.[ch]
+F: hw/s390x/css.c
+F: hw/s390x/css-bridge.c
+F: include/hw/s390x/css.h
+F: include/hw/s390x/css-bridge.h
+F: include/hw/s390x/ioinst.h
+F: target/s390x/ioinst.c
+L: qemu-s390x@nongnu.org
+
+S390 CPU models
+M: David Hildenbrand <david@redhat.com>
+S: Maintained
+F: target/s390x/cpu_features*.[ch]
+F: target/s390x/cpu_models.[ch]
+L: qemu-s390x@nongnu.org
+
+S390 SCLP-backed devices
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+S: Supported
+F: include/hw/s390x/event-facility.h
+F: include/hw/s390x/sclp.h
+F: hw/char/sclp*.[hc]
+F: hw/s390x/event-facility.c
+F: hw/s390x/sclp*.c
+L: qemu-s390x@nongnu.org
+
 X86 Machines
 ------------
 PC
@@ -1970,6 +1990,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
 F: hw/s390x/vhost-vsock-ccw.c
+F: hw/s390x/vhost-user-fs-ccw.c
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
@@ -2308,6 +2329,48 @@ F: hw/timer/mips_gictimer.c
 F: include/hw/intc/mips_gic.h
 F: include/hw/timer/mips_gictimer.h
 
+S390 3270 device
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+S: Odd fixes
+F: include/hw/s390x/3270-ccw.h
+F: hw/char/terminal3270.c
+F: hw/s390x/3270-ccw.c
+L: qemu-s390x@nongnu.org
+
+S390 diag 288 watchdog
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+S: Supported
+F: hw/watchdog/wdt_diag288.c
+F: include/hw/watchdog/wdt_diag288.h
+L: qemu-s390x@nongnu.org
+
+S390 storage key device
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+S: Supported
+F: hw/s390x/storage-keys.h
+F: hw/390x/s390-skeys*.c
+L: qemu-s390x@nongnu.org
+
+S390 storage attribute device
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+S: Supported
+F: hw/s390x/storage-attributes.h
+F: hw/s390/s390-stattrib*.c
+L: qemu-s390x@nongnu.org
+
+S390 floating interrupt controller
+M: Halil Pasic <pasic@linux.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
+M: David Hildenbrand <david@redhat.com>
+S: Supported
+F: hw/intc/s390_flic*.c
+F: include/hw/s390x/s390_flic.h
+L: qemu-s390x@nongnu.org
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.27.0


