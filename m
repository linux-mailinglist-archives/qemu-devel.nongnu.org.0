Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3B254EF5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 21:43:50 +0200 (CEST)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBNoM-0006ac-1q
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 15:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNTK-0006tg-UI
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21977
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kBNTJ-0000Oc-7A
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 15:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598556124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhsH3xgFuKTiTnROAKCu062OUg6Ii/r++IZgtgL2EIc=;
 b=frDNnoPv/+nmG5kw2vbkwJD6mLVHQ8ulTEtPTDemVcHg3la9P2icaUa0e7URa5W7zh8Sq3
 Ktq1gRlVPHWa1zn3/UmUIL1Ex/oc0eBQ+DOSnDHF8VRiNsoxuJxHPmVJNKM5PqEsEz0O5r
 nDRLqQ2VzO6cZAB8GvcKTtEeEKl/+C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-QBUA1lBxNIOt6EvcYVFKIw-1; Thu, 27 Aug 2020 15:22:02 -0400
X-MC-Unique: QBUA1lBxNIOt6EvcYVFKIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA1E801F98;
 Thu, 27 Aug 2020 19:22:00 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C525D9E8;
 Thu, 27 Aug 2020 19:22:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/53] tulip: Move TulipState typedef to header
Date: Thu, 27 Aug 2020 15:20:43 -0400
Message-Id: <20200827192122.658035-15-ehabkost@redhat.com>
In-Reply-To: <20200827192122.658035-1-ehabkost@redhat.com>
References: <20200827192122.658035-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:13:19
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
 Roman Bolshakov <r.bolshakov@yadro.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move typedef closer to the type check macros, to make it easier
to convert the code to OBJECT_DEFINE_TYPE() in the future.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200825192110.3528606-16-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/tulip.h | 1 +
 hw/net/tulip.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.h b/hw/net/tulip.h
index 5271aad8d5..c3fcd4d4e1 100644
--- a/hw/net/tulip.h
+++ b/hw/net/tulip.h
@@ -5,6 +5,7 @@
 #include "net/net.h"
 
 #define TYPE_TULIP "tulip"
+typedef struct TULIPState TULIPState;
 #define TULIP(obj) OBJECT_CHECK(TULIPState, (obj), TYPE_TULIP)
 
 #define CSR(_x) ((_x) << 3)
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 4487fd61cf..ca69f7ea5e 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -18,7 +18,7 @@
 #include "trace.h"
 #include "net/eth.h"
 
-typedef struct TULIPState {
+struct TULIPState {
     PCIDevice dev;
     MemoryRegion io;
     MemoryRegion memory;
@@ -44,7 +44,7 @@ typedef struct TULIPState {
 
     uint32_t rx_status;
     uint8_t filter[16][6];
-} TULIPState;
+};
 
 static const VMStateDescription vmstate_pci_tulip = {
     .name = "tulip",
-- 
2.26.2


