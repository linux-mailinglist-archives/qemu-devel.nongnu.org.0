Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21963A9B9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeIU-0006bU-7y; Mon, 28 Nov 2022 08:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozeID-0006Ys-Bd
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ozeIB-0006Di-Tz
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669642527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7canvGOQLQ8xGcNBRV1oL6tkKd0wqtuphf5WnxljrmY=;
 b=PaC00s7A/eLCF1ph/ON1vXkAIW040lwPpfO8DsH7fVUcARa2RIWld5cCVQ+KWCpY4I4xRv
 7YPwsnyeKOie6AOFCNgRAU0i6jG43EwREFSa60CsQ5uOGVmFUP05Z6i2+vK4kHxkTZtT3Y
 ctFlIhjaoYCZr8lGpZQJkK2VbfkkgJ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-ergRC35KPHe9I8FoF16M_w-1; Mon, 28 Nov 2022 08:35:25 -0500
X-MC-Unique: ergRC35KPHe9I8FoF16M_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D13800186;
 Mon, 28 Nov 2022 13:35:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDBF2166B2E;
 Mon, 28 Nov 2022 13:35:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH for-8.0] monitor/misc: Remove superfluous include statements
Date: Mon, 28 Nov 2022 14:35:14 +0100
Message-Id: <20221128133514.220919-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These #includes are not required anymore (the likely got superfluous
with commit da76ee76f7 - "hmp-commands-info: move info_cmds content
out of monitor.c").

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 monitor/misc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 205487e2b9..e2c017d69c 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -25,10 +25,8 @@
 #include "qemu/osdep.h"
 #include "monitor-internal.h"
 #include "monitor/qdev.h"
-#include "hw/usb.h"
 #include "hw/pci/pci.h"
 #include "sysemu/watchdog.h"
-#include "hw/loader.h"
 #include "exec/gdbstub.h"
 #include "net/net.h"
 #include "net/slirp.h"
@@ -39,16 +37,13 @@
 #include "ui/input.h"
 #include "audio/audio.h"
 #include "disas/disas.h"
-#include "sysemu/balloon.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "authz/list.h"
 #include "qapi/util.h"
-#include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/tpm.h"
 #include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
@@ -77,7 +72,6 @@
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp-event.h"
-#include "sysemu/cpus.h"
 #include "qemu/cutils.h"
 
 #if defined(TARGET_S390X)
-- 
2.31.1


