Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07677252012
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:35:27 +0200 (CEST)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAej8-0000Oc-0g
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWE-0007up-Jn
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:06 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60395
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeW9-00068z-Sd
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vv180Wmo3c/pciF/+u9hjq9dQDmbkoXr5hIUP+izzUk=;
 b=Jw7OqDT7d9JR4HZomGSKxE7RNAvWDs8HdS2uoCkSEblExFJgk1/IQDEnrIuc1mDQjf8N3C
 qolehKt2whJCcCreCEO/GjRhUFK2VcBYZi1T6qD9gDrfEph5/jrDqr83HTVN03yihPTUoR
 maayQbyYR23+vhgWK5cai+OV5H4UpN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-RW3fATsOPn6pSFZujOSx2g-1; Tue, 25 Aug 2020 15:21:59 -0400
X-MC-Unique: RW3fATsOPn6pSFZujOSx2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B6C41005E5C;
 Tue, 25 Aug 2020 19:21:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B85819C58;
 Tue, 25 Aug 2020 19:21:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/74] can_emu: Delete macros for non-existing typedef
Date: Tue, 25 Aug 2020 15:20:18 -0400
Message-Id: <20200825192110.3528606-23-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 15:21:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CanBusClass doesn't exist.  This will break when we automatically
convert the code to use OBJECT_DEFINE_TYPE().  Delete the macros
that reference the non-existing typedef.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes v1 -> v2: none

---
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/net/can_emu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/net/can_emu.h b/include/net/can_emu.h
index fce9770928..7e90fd8a45 100644
--- a/include/net/can_emu.h
+++ b/include/net/can_emu.h
@@ -100,10 +100,6 @@ struct CanBusClientState {
 };
 
 #define TYPE_CAN_BUS "can-bus"
-#define CAN_BUS_CLASS(klass) \
-     OBJECT_CLASS_CHECK(CanBusClass, (klass), TYPE_CAN_BUS)
-#define CAN_BUS_GET_CLASS(obj) \
-     OBJECT_GET_CLASS(CanBusClass, (obj), TYPE_CAN_BUS)
 #define CAN_BUS(obj) \
      OBJECT_CHECK(CanBusState, (obj), TYPE_CAN_BUS)
 
-- 
2.26.2


