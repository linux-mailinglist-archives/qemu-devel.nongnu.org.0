Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B12B79E5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:05:38 +0100 (CET)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJPF-0006ks-Qo
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfJNe-0005WY-LG
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfJNc-00019n-79
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605690233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=1DApVncJElBk58F4P6BBDCzUtJVVlFe8mZPLnaJW9Es=;
 b=TfJGQM8TQT68HZpm3vSBMSA/E30iWjJfD7CelGSqfCr8BSIIIwo74ekJ+ywnr/ixZt/l2Z
 d7UYO48DlyNKZggPZ5JSRt5SG/HvbmM9rIvTLCNU9LaUifCabFSXxdK5tIIUpVe/oCzYpQ
 klUoXo0UfTNECz02FgcklxhD09RvflU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-V_etS2shOOWtJ-Ew2RpHVQ-1; Wed, 18 Nov 2020 04:03:49 -0500
X-MC-Unique: V_etS2shOOWtJ-Ew2RpHVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14BF16D241;
 Wed, 18 Nov 2020 09:03:48 +0000 (UTC)
Received: from thuth.com (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 688D755764;
 Wed, 18 Nov 2020 09:03:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
Date: Wed, 18 Nov 2020 10:03:44 +0100
Message-Id: <20201118090344.243117-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both headers, sysbus.h and module.h, are not required to compile this file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/watchdog/wdt_diag288.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
index 71a945f0bd..4c4b6a6ab7 100644
--- a/hw/watchdog/wdt_diag288.c
+++ b/hw/watchdog/wdt_diag288.c
@@ -14,12 +14,10 @@
 #include "qemu/osdep.h"
 #include "sysemu/reset.h"
 #include "sysemu/watchdog.h"
-#include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/watchdog/wdt_diag288.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
-#include "qemu/module.h"
 
 static WatchdogTimerModel model = {
     .wdt_name = TYPE_WDT_DIAG288,
-- 
2.18.4


