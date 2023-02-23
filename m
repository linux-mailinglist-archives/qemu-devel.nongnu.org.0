Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF4F6A0B17
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvj-000229-5S; Thu, 23 Feb 2023 08:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvf-0001zg-7n
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvd-0001Mb-4H
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOG2Y34FHrg9v8OV+YU5WBLbTgi4DJhYPYOKebiEnCA=;
 b=b6RzEwABwV1iGL3bOfPwsQAQjrXirCRlZIbfuGSLZh6G0fg5hidJQz1BnuAjGlUHzovyAp
 pr2wio+CWDlcG3i4XgnSykb5YADtpPDiGFqUXn4COzY6U7LLC2ITILhsKdVd/b9MET9222
 FcBOablx86TpWbaHTqq3AmIUDydckA8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-wkWPW_hiMfexIrCMjCPI2g-1; Thu, 23 Feb 2023 08:46:29 -0500
X-MC-Unique: wkWPW_hiMfexIrCMjCPI2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE8343810B1C;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9F6C15BAE;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACF9521E690F; Thu, 23 Feb 2023 14:46:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 12/12] rocker: Tweak stubbed out monitor commands' error
 messages
Date: Thu, 23 Feb 2023 14:46:26 +0100
Message-Id: <20230223134626.2107382-13-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
References: <20230223134626.2107382-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The QERR_ macros are leftovers from the days of "rich" error objects.
We've been trying to reduce their remaining use.

The stubbed out Rocker monitor commands are the last remaining users
of QERR_FEATURE_DISABLED.  They fail like this:

    (qemu) info rocker mumble
    Error: The feature 'rocker' is not enabled

The real rocker commands fail like this when the named object doesn't
exist:

    Error: rocker mumble not found

If that's good enough when Rocker is enabled, then it's good enough
when it's disabled, so replace QERR_FEATURE_DISABLED with that, and
drop the macro.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-13-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/qapi/qmp/qerror.h    |  3 ---
 hw/net/rocker/qmp-norocker.c | 12 +++++-------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 09006e69f7..8dd9fcb071 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -29,9 +29,6 @@
 #define QERR_DEVICE_NO_HOTPLUG \
     "Device '%s' does not support hotplugging"
 
-#define QERR_FEATURE_DISABLED \
-    "The feature '%s' is not enabled"
-
 #define QERR_INVALID_PARAMETER \
     "Invalid parameter '%s'"
 
diff --git a/hw/net/rocker/qmp-norocker.c b/hw/net/rocker/qmp-norocker.c
index 5ef4f9324c..f6c1196a24 100644
--- a/hw/net/rocker/qmp-norocker.c
+++ b/hw/net/rocker/qmp-norocker.c
@@ -1,6 +1,5 @@
 /*
- * QMP Target options - Commands handled based on a target config
- *                      versus a host config
+ * QMP command stubs
  *
  * Copyright (c) 2015 David Ahern <dsahern@gmail.com>
  *
@@ -18,17 +17,16 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-rocker.h"
-#include "qapi/qmp/qerror.h"
 
 RockerSwitch *qmp_query_rocker(const char *name, Error **errp)
 {
-    error_setg(errp, QERR_FEATURE_DISABLED, "rocker");
+    error_setg(errp, "rocker %s not found", name);
     return NULL;
 };
 
 RockerPortList *qmp_query_rocker_ports(const char *name, Error **errp)
 {
-    error_setg(errp, QERR_FEATURE_DISABLED, "rocker");
+    error_setg(errp, "rocker %s not found", name);
     return NULL;
 };
 
@@ -37,7 +35,7 @@ RockerOfDpaFlowList *qmp_query_rocker_of_dpa_flows(const char *name,
                                                    uint32_t tbl_id,
                                                    Error **errp)
 {
-    error_setg(errp, QERR_FEATURE_DISABLED, "rocker");
+    error_setg(errp, "rocker %s not found", name);
     return NULL;
 };
 
@@ -46,6 +44,6 @@ RockerOfDpaGroupList *qmp_query_rocker_of_dpa_groups(const char *name,
                                                      uint8_t type,
                                                      Error **errp)
 {
-    error_setg(errp, QERR_FEATURE_DISABLED, "rocker");
+    error_setg(errp, "rocker %s not found", name);
     return NULL;
 };
-- 
2.39.0


