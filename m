Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA8461BC7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 17:32:46 +0100 (CET)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrja9-00081O-Cz
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 11:32:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mrjYf-0007KM-1t
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:31:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mrjYc-0003t6-TU
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638203469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bjbx6Uad6iJ9OTkO0Ecdsv5+F49EsJCGgppN9MlXM/A=;
 b=VnDLf6mkF99ob9R8XkaarJ8BaZp6zmGcleSdc3x0FMEO6jIJi+FbWRG6PD4Vqv3+LJxVHp
 H3Xqxhe3fxQzyAxKnrig9h6U48sSyu56DWFumDjcn3pAXvAHetkwJ8ir2kuXYxTghCFOUR
 M7pXuF2mWWoMAVetQpX0d31bwf/DLQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-po03b7DMMBarb-3HZGKiHQ-1; Mon, 29 Nov 2021 11:31:05 -0500
X-MC-Unique: po03b7DMMBarb-3HZGKiHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73F6283DD20;
 Mon, 29 Nov 2021 16:31:04 +0000 (UTC)
Received: from localhost (unknown [10.22.8.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DD3219724;
 Mon, 29 Nov 2021 16:31:04 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Change my email address
Date: Mon, 29 Nov 2021 11:30:53 -0500
Message-Id: <20211129163053.2506734-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ehabkost@redhat.com email address will stop working on
2021-12-01, change it to my personal email address.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Note: I will probably step down as maintainer of some areas, but
I will do this later because I will need a few weeks to figure
out how much time I will be able to dedicate to QEMU.
---
 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c12..7e8a586b2ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -324,7 +324,7 @@ F: disas/sparc.c
 X86 TCG CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Richard Henderson <richard.henderson@linaro.org>
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 S: Maintained
 F: target/i386/tcg/
 F: tests/tcg/i386/
@@ -1628,7 +1628,7 @@ F: include/hw/i386/microvm.h
 F: pc-bios/bios-microvm.bin
 
 Machine core
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
@@ -2648,13 +2648,13 @@ F: backends/cryptodev*.c
 Python library
 M: John Snow <jsnow@redhat.com>
 M: Cleber Rosa <crosa@redhat.com>
-R: Eduardo Habkost <ehabkost@redhat.com>
+R: Eduardo Habkost <eduardo@habkost.net>
 S: Maintained
 F: python/
 T: git https://gitlab.com/jsnow/qemu.git python
 
 Python scripts
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 M: Cleber Rosa <crosa@redhat.com>
 S: Odd Fixes
 F: scripts/*.py
@@ -2730,7 +2730,7 @@ T: git https://github.com/mdroth/qemu.git qga
 QOM
 M: Paolo Bonzini <pbonzini@redhat.com>
 R: Daniel P. Berrange <berrange@redhat.com>
-R: Eduardo Habkost <ehabkost@redhat.com>
+R: Eduardo Habkost <eduardo@habkost.net>
 S: Supported
 F: docs/qdev-device-use.txt
 F: hw/core/qdev*
@@ -2750,7 +2750,7 @@ F: tests/unit/check-qom-proplist.c
 F: tests/unit/test-qdev-global-props.c
 
 QOM boilerplate conversion script
-M: Eduardo Habkost <ehabkost@redhat.com>
+M: Eduardo Habkost <eduardo@habkost.net>
 S: Maintained
 F: scripts/codeconverter/
 
-- 
2.32.0


