Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63425252000
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:30:58 +0200 (CEST)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAeen-00085W-Ci
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWM-0008Fc-EN
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45291
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeWK-0006Am-Q2
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iejIKgBg1U3shXkoq0brzCR2iMpLMz2PuI1sLa1JeGI=;
 b=F7RJ+ryB3ePTa8YgXRhzHq7wgTV3wvRGvqfVoIbI/fHunhvp3Lrqg8IKOi6j7GB4CeUiU+
 T6n3g4KwP1pQBXZYZz83eJBBCBy1cMZKn2yIEYCtbqmb1+kIaXwxq9EeAN81nHiTbEuoTe
 sIeWUNW2cuavseUiHkecagmRKb1QYzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-AzkbMvgZNLus-kuaIiNVJQ-1; Tue, 25 Aug 2020 15:22:08 -0400
X-MC-Unique: AzkbMvgZNLus-kuaIiNVJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCC0281CAFA;
 Tue, 25 Aug 2020 19:22:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B28D5D9E4;
 Tue, 25 Aug 2020 19:22:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/74] s390x: Move typedef SCLPEventFacility to
 event-facility.h
Date: Tue, 25 Aug 2020 15:20:24 -0400
Message-Id: <20200825192110.3528606-29-ehabkost@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will make future conversion to OBJECT_DECLARE* easier.

In sclp.h, use "struct SCLPEventFacility" to avoid introducing
unnecessary header dependencies.

Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes series v1 -> v2: new patch in series v2

Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/s390x/event-facility.h | 1 +
 include/hw/s390x/sclp.h           | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/s390x/event-facility.h b/include/hw/s390x/event-facility.h
index 700a610f33..e61c4651d7 100644
--- a/include/hw/s390x/event-facility.h
+++ b/include/hw/s390x/event-facility.h
@@ -195,6 +195,7 @@ typedef struct SCLPEventClass {
 } SCLPEventClass;
 
 #define TYPE_SCLP_EVENT_FACILITY "s390-sclp-event-facility"
+typedef struct SCLPEventFacility SCLPEventFacility;
 #define EVENT_FACILITY(obj) \
      OBJECT_CHECK(SCLPEventFacility, (obj), TYPE_SCLP_EVENT_FACILITY)
 #define EVENT_FACILITY_CLASS(klass) \
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index 822eff4396..a87ed2a0ab 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -185,12 +185,12 @@ typedef struct SCCB {
 #define SCLP_CLASS(oc) OBJECT_CLASS_CHECK(SCLPDeviceClass, (oc), TYPE_SCLP)
 #define SCLP_GET_CLASS(obj) OBJECT_GET_CLASS(SCLPDeviceClass, (obj), TYPE_SCLP)
 
-typedef struct SCLPEventFacility SCLPEventFacility;
+struct SCLPEventFacility;
 
 typedef struct SCLPDevice {
     /* private */
     DeviceState parent_obj;
-    SCLPEventFacility *event_facility;
+    struct SCLPEventFacility *event_facility;
     int increment_size;
 
     /* public */
-- 
2.26.2


