Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA8252002
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:31:19 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAef8-0000WN-2G
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeW0-0007T7-81
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:21:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48625
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeVy-00067V-G0
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9BnBXehIJ3Tqr/idd1RL3FGJh59dDMhAnsmRaBJ3TI=;
 b=fH3lpxHVE5q01akS0vw4NGjCP6/k1Ek/vow0acC2FnQgTicVOGmdB4+SEe6cg2nrW5jH+t
 cWEf+Saz1dIpNTRU2kRRWN3OrQn9RXQ7uWO5tr5VTAE0pqllyKjtUN3w1iK5yoriEkiIYF
 egAldcZlgYg7uDmSqIxJ4k0G67/NbEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-Iie0AamENtKAFpqFOXpG5w-1; Tue, 25 Aug 2020 15:21:47 -0400
X-MC-Unique: Iie0AamENtKAFpqFOXpG5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8F32800468;
 Tue, 25 Aug 2020 19:21:45 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 544AD5D9E4;
 Tue, 25 Aug 2020 19:21:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/74] throttle-groups: Move ThrottleGroup typedef to header
Date: Tue, 25 Aug 2020 15:20:12 -0400
Message-Id: <20200825192110.3528606-17-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 10:39:45
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Alberto Garcia <berto@igalia.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Alberto Garcia <berto@igalia.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/block/throttle-groups.h | 1 +
 block/throttle-groups.c         | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/block/throttle-groups.h b/include/block/throttle-groups.h
index 712a8e64b4..5e77db700f 100644
--- a/include/block/throttle-groups.h
+++ b/include/block/throttle-groups.h
@@ -59,6 +59,7 @@ typedef struct ThrottleGroupMember {
 } ThrottleGroupMember;
 
 #define TYPE_THROTTLE_GROUP "throttle-group"
+typedef struct ThrottleGroup ThrottleGroup;
 #define THROTTLE_GROUP(obj) OBJECT_CHECK(ThrottleGroup, (obj), TYPE_THROTTLE_GROUP)
 
 const char *throttle_group_get_name(ThrottleGroupMember *tgm);
diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index 98fea7fd47..4e28365d8d 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -63,7 +63,7 @@ static void timer_cb(ThrottleGroupMember *tgm, bool is_write);
  * access some other ThrottleGroupMember's timers only after verifying that
  * that ThrottleGroupMember has throttled requests in the queue.
  */
-typedef struct ThrottleGroup {
+struct ThrottleGroup {
     Object parent_obj;
 
     /* refuse individual property change if initialization is complete */
@@ -79,7 +79,7 @@ typedef struct ThrottleGroup {
 
     /* This field is protected by the global QEMU mutex */
     QTAILQ_ENTRY(ThrottleGroup) list;
-} ThrottleGroup;
+};
 
 /* This is protected by the global QEMU mutex */
 static QTAILQ_HEAD(, ThrottleGroup) throttle_groups =
-- 
2.26.2


