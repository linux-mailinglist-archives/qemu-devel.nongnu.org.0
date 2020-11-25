Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E82C497C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:04:00 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1xH-00054u-US
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qu-0000km-Ki
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:57:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qm-0003SM-Om
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UOyTRf5mPJ5SvELwELeHhVkkroVx6KlWwJAA3CP5gcc=;
 b=WclvZFEyU/luvvL9De0aKdryl6JTnqkZeI/B95q8GFNm5/LPQk+YzX9rNpRc3BCdqt+beY
 9tgqfqmrD7p4A5dlZqCO/gJMshrxRo3qkKqqbWwgrOjs/WNOH1GOXi57RnmISwIUtvmLCW
 qMpAqfB3Eoe3hENkuZL26Kj85qfSmlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-AV3skdgSOB-WWkc1A2D6fQ-1; Wed, 25 Nov 2020 15:57:13 -0500
X-MC-Unique: AV3skdgSOB-WWkc1A2D6fQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92918185E49C;
 Wed, 25 Nov 2020 20:57:12 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E7719C46;
 Wed, 25 Nov 2020 20:57:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] Rename arch_init.h to arch_type.h
Date: Wed, 25 Nov 2020 15:56:36 -0500
Message-Id: <20201125205636.3305257-7-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only declarations in arch_init.h are related to the arch_type
variable (which is a useful feature that allows us to simplify
command line option handling).  Rename the header to reflect its
purpose.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/sysemu/{arch_init.h => arch_type.h} | 0
 blockdev.c                                  | 2 +-
 softmmu/arch_init.c                         | 2 +-
 softmmu/qdev-monitor.c                      | 2 +-
 softmmu/vl.c                                | 2 +-
 stubs/arch_type.c                           | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename include/sysemu/{arch_init.h => arch_type.h} (100%)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_type.h
similarity index 100%
rename from include/sysemu/arch_init.h
rename to include/sysemu/arch_type.h
diff --git a/blockdev.c b/blockdev.c
index fe6fb5dc1d..46c10b2609 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -56,7 +56,7 @@
 #include "sysemu/iothread.h"
 #include "block/block_int.h"
 #include "block/trace.h"
-#include "sysemu/arch_init.h"
+#include "sysemu/arch_type.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/replay.h"
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index f4770931f5..5a9bc56387 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -24,7 +24,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/arch_init.h"
+#include "sysemu/arch_type.h"
 #include "hw/pci/pci.h"
 #include "hw/audio/soundhw.h"
 #include "qapi/error.h"
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bf79d0bbcd..c8b7fb27dc 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -22,7 +22,7 @@
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
-#include "sysemu/arch_init.h"
+#include "sysemu/arch_type.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-qdev.h"
 #include "qapi/qmp/qdict.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 74b6ebf1e4..1dd63b2782 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -95,7 +95,7 @@
 #include "trace/control.h"
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
-#include "sysemu/arch_init.h"
+#include "sysemu/arch_type.h"
 
 #include "ui/qemu-spice.h"
 #include "qapi/string-input-visitor.h"
diff --git a/stubs/arch_type.c b/stubs/arch_type.c
index fc5423bc98..603a49deec 100644
--- a/stubs/arch_type.c
+++ b/stubs/arch_type.c
@@ -1,4 +1,4 @@
 #include "qemu/osdep.h"
-#include "sysemu/arch_init.h"
+#include "sysemu/arch_type.h"
 
 const uint32_t arch_type = QEMU_ARCH_NONE;
-- 
2.28.0


