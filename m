Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7D2D759B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:29:49 +0100 (CET)
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhYS-00067S-NI
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhVz-0004Q6-1K
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhVt-0000xc-2k
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTR6ajFnVBvqLUOuaeayLvCRV/vrVbjOUhjKSN/1HKc=;
 b=btI7Gylcq+i53/Jbq6mKh2AFH0yFJ899oTN06GSsEFuugPy4fqK8eO+4CQi+TRxQVTm31X
 Uxv/XVvjSQ2FuMJR9hEQeGTHMM97BNUgeudiZ4vmkh/sZjGB7BmIu1SazaV0Yv/Doka7Qy
 A5EDln01SEEp9X800bB4mExpQGThkPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-SNMaESbOPh63s48IWHIPlg-1; Fri, 11 Dec 2020 07:27:05 -0500
X-MC-Unique: SNMaESbOPh63s48IWHIPlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58775107ACE8;
 Fri, 11 Dec 2020 12:27:04 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56C610023BD;
 Fri, 11 Dec 2020 12:27:02 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/6] hw/watchdog/wdt_diag288: Remove unnecessary includes
Date: Fri, 11 Dec 2020 13:26:53 +0100
Message-Id: <20201211122658.24481-2-cohuck@redhat.com>
In-Reply-To: <20201211122658.24481-1-cohuck@redhat.com>
References: <20201211122658.24481-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Neither sysbus.h nor module.h are required to compile this file.
diag288 is not a sysbus device, and module.h (for type_init) is
included eventually through qom/object.h.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <20201118090344.243117-1-thuth@redhat.com>
[CH: tweaked description]
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/watchdog/wdt_diag288.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
index 71a945f0bdf3..4c4b6a6ab704 100644
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
2.26.2


