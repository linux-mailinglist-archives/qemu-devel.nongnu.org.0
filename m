Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E09114698
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 19:08:16 +0100 (CET)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icvXz-00054h-GY
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 13:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDe-00083P-9o
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDc-0004t2-5e
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:47:14 -0500
Received: from relay.sw.ru ([185.231.240.75]:48372)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvDa-0003Vc-7l; Thu, 05 Dec 2019 12:47:12 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvD8-00013M-4R; Thu, 05 Dec 2019 20:46:42 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/21] hw/s390x: rename Error ** parameter to more common
 errp
Date: Thu,  5 Dec 2019 20:46:28 +0300
Message-Id: <20191205174635.18758-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205174635.18758-1-vsementsov@virtuozzo.com>
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: vsementsov@virtuozzo.com, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/event-facility.c | 2 +-
 hw/s390x/s390-stattrib.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index 66205697ae..dc733ee2af 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -439,7 +439,7 @@ static void sclp_event_set_allow_all_mask_sizes(Object *obj, bool value,
     ef->allow_all_mask_sizes = value;
 }
 
-static bool sclp_event_get_allow_all_mask_sizes(Object *obj, Error **e)
+static bool sclp_event_get_allow_all_mask_sizes(Object *obj, Error **errp)
 {
     SCLPEventFacility *ef = (SCLPEventFacility *)obj;
 
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index bf5ac014c4..58121b9f68 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -352,7 +352,8 @@ static void s390_stattrib_class_init(ObjectClass *oc, void *data)
     dc->realize = s390_stattrib_realize;
 }
 
-static inline bool s390_stattrib_get_migration_enabled(Object *obj, Error **e)
+static inline bool s390_stattrib_get_migration_enabled(Object *obj,
+                                                       Error **errp)
 {
     S390StAttribState *s = S390_STATTRIB(obj);
 
-- 
2.21.0


