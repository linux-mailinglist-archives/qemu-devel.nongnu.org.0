Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D3251FF9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:29:05 +0200 (CEST)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAecy-00048B-GP
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeW6-0007kT-FS
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:21:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31619
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeW4-00068H-Tb
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Mq7dwXYNXegViKtoA/+pqo7nZrnutR+O8qT2sovQ/g=;
 b=U6J0TyclTUkhg7/nNs9Vvdru6e9QzhNU/1mTXTezjMwJhwgv+XzmgmoTgHWT27Lt1+PTrM
 XQ7Kp9Sizrx6Zr0VTQoLMTK3jmreE94n51m1wM86wiXZYr5+YWkJ+PP1+jxuedmjZEkZxh
 6eYuIKwSqd5MNdLEvFqG+BH9hlUB30E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-GXEgW18BMpq2d6DPtYznuw-1; Tue, 25 Aug 2020 15:21:54 -0400
X-MC-Unique: GXEgW18BMpq2d6DPtYznuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 572EA81CAF9;
 Tue, 25 Aug 2020 19:21:53 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70E7960E1C;
 Tue, 25 Aug 2020 19:21:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/74] i8254: Move PITCommonState/PITCommonClass typedefs
 to i8254.h
Date: Tue, 25 Aug 2020 15:20:14 -0400
Message-Id: <20200825192110.3528606-19-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:37:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move typedef closer to the type check macros, to make it easier
to convert the code to OBJECT_DEFINE_TYPE() in the future.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes v1 -> v2: none

---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/timer/i8254.h          | 2 ++
 include/hw/timer/i8254_internal.h | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index e75b4a5a08..206b8f8464 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -39,6 +39,8 @@ typedef struct PITChannelInfo {
 } PITChannelInfo;
 
 #define TYPE_PIT_COMMON "pit-common"
+typedef struct PITCommonState PITCommonState;
+typedef struct PITCommonClass PITCommonClass;
 #define PIT_COMMON(obj) \
      OBJECT_CHECK(PITCommonState, (obj), TYPE_PIT_COMMON)
 #define PIT_COMMON_CLASS(klass) \
diff --git a/include/hw/timer/i8254_internal.h b/include/hw/timer/i8254_internal.h
index 3db462aecd..a9a600d941 100644
--- a/include/hw/timer/i8254_internal.h
+++ b/include/hw/timer/i8254_internal.h
@@ -50,14 +50,14 @@ typedef struct PITChannelState {
     uint32_t irq_disabled;
 } PITChannelState;
 
-typedef struct PITCommonState {
+struct PITCommonState {
     ISADevice dev;
     MemoryRegion ioports;
     uint32_t iobase;
     PITChannelState channels[3];
-} PITCommonState;
+};
 
-typedef struct PITCommonClass {
+struct PITCommonClass {
     ISADeviceClass parent_class;
 
     void (*set_channel_gate)(PITCommonState *s, PITChannelState *sc, int val);
@@ -65,7 +65,7 @@ typedef struct PITCommonClass {
                              PITChannelInfo *info);
     void (*pre_save)(PITCommonState *s);
     void (*post_load)(PITCommonState *s);
-} PITCommonClass;
+};
 
 int pit_get_out(PITChannelState *s, int64_t current_time);
 int64_t pit_get_next_transition_time(PITChannelState *s, int64_t current_time);
-- 
2.26.2


