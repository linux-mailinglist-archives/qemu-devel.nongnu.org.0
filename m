Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3DB254ED3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:39:45 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNkO-0007pp-Ql
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNT8-0006Ph-CZ
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:21:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48270
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNT2-0000Mo-K1
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xt81pdNSq5rc3Hsma4qNtuOpDfrLPUaLyoqm32S1pDE=;
 b=J9JUNvEoOWo5B+xkfizHbP4KS8d3ey3Y66NmQTOPviAew4gnhktC33vUTycp7LMSSLBTSr
 PaYLznx+2DwOr9p5uTRno10pZVsFwJQiAqXXCRqk6YMVX+eftZYVA6Gfzq5zEyPhtj+HWr
 8ozyhkbqqZKTr1kRSxXxr6PCHkY1sbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-bJIrujhcMSead-nKSxWekQ-1; Thu, 27 Aug 2020 15:21:45 -0400
X-MC-Unique: bJIrujhcMSead-nKSxWekQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31DDB802B7C;
 Thu, 27 Aug 2020 19:21:44 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE99F7E466;
 Thu, 27 Aug 2020 19:21:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/53] aspeed_timer: Fix ASPEED_TIMER macro definition
Date: Thu, 27 Aug 2020 15:20:38 -0400
Message-Id: <20200827192122.658035-10-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:56:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro definition had an extra semicolon.  This was never
noticed because the macro was only being used where it didn't
make a difference.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200825192110.3528606-11-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/timer/aspeed_timer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 948329893c..d7c7d8ad28 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -26,7 +26,7 @@
 #include "hw/misc/aspeed_scu.h"
 
 #define ASPEED_TIMER(obj) \
-    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
+    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER)
 #define TYPE_ASPEED_TIMER "aspeed.timer"
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
-- 
2.26.2


