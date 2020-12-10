Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322192D62D8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:02:30 +0100 (CET)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPKm-0003F0-Gj
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrj-0008NI-Ep
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrZ-0003TX-3K
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpIOkMETxTNvn4IdWCeFq9C+flnFXsj4VtwtYrpYdrM=;
 b=Xpq38H5Ke9+G/ncbtqwFCfjTG4IcFSd65O08slfwajs8Iaro5VHz6IYj1Iu15twH69kIqD
 n/sdQdW5kn4Ek2e3SbCqh59XeRjAB1Z4/osZ5dGTEbWDp5ZxaM/6bSG+4jWqm9canvYB62
 tYcv1wITDrwQjqFKt8jHiQV5qBkt1x4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-1b8KuS0iMk-NfnP1f36pFA-1; Thu, 10 Dec 2020 11:32:10 -0500
X-MC-Unique: 1b8KuS0iMk-NfnP1f36pFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76A39100A959;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44FAA5C6B8;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD20610FA0AD; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] Tweak a few "Parameter 'NAME' expects THING" error
 message
Date: Thu, 10 Dec 2020 17:31:30 +0100
Message-Id: <20201210163132.2919935-12-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change to "expects a THING" where that's an obvious improvement

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-11-armbru@redhat.com>
---
 block/quorum.c                   | 2 +-
 blockdev.c                       | 2 +-
 chardev/char.c                   | 2 +-
 hw/core/qdev-properties-system.c | 2 +-
 softmmu/qdev-monitor.c           | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index b10fc2089e..4b08a199b7 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -856,7 +856,7 @@ static int quorum_valid_threshold(int threshold, int num_children, Error **errp)
 
     if (threshold < 1) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "vote-threshold", "value >= 1");
+                   "vote-threshold", "a value >= 1");
         return -ERANGE;
     }
 
diff --git a/blockdev.c b/blockdev.c
index d05a8740f4..6c7be7c522 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2991,7 +2991,7 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
     }
     if (granularity & (granularity - 1)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "granularity",
-                   "power of 2");
+                   "a power of 2");
         return;
     }
 
diff --git a/chardev/char.c b/chardev/char.c
index aa4282164a..a9b8c5a9aa 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -521,7 +521,7 @@ static const ChardevClass *char_get_class(const char *driver, Error **errp)
 
     if (object_class_is_abstract(oc)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "abstract device type");
+                   "an abstract device type");
         return NULL;
     }
 
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 9d80a07d26..8912fb4e9c 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -776,7 +776,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
         }
         if (value < -1 || value > 255) {
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                       name ? name : "null", "pci_devfn");
+                       name ? name : "null", "a value between -1 and 255");
             return;
         }
         *ptr = value;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 301089eaea..31e5b589b7 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -237,7 +237,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     if (object_class_is_abstract(oc)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "non-abstract device type");
+                   "a non-abstract device type");
         return NULL;
     }
 
@@ -245,7 +245,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
     if (!dc->user_creatable ||
         (qdev_hotplug && !dc->hotpluggable)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "pluggable device type");
+                   "a pluggable device type");
         return NULL;
     }
 
-- 
2.26.2


