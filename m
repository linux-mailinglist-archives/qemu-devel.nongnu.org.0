Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E352648B6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 17:28:21 +0200 (CEST)
Received: from localhost ([::1]:44352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGOUm-0002r7-OT
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 11:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGOPj-0004Bp-54
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 11:23:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59775
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGOPg-00082T-U2
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 11:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599751384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AFeQPAzVVhz+6GgdLSr+TbEOa0+V0j3040P7zvKLpM=;
 b=hO4cBcI83/um0tt0ifjFQX2gWRz5uRfIYsIT4A3VZgvQ/Nzv+GQgBxRqf61vH/qmnKSCi1
 6+GmmWOHrLD6ToTYmWo+7XGBC4OdHhLPOK6gs0y1IhPxmKh6HAXTj236qWoSw4zaqSPrRn
 KkaHomeR2XaCV7E53O7YN4ZjU++eWdw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-g_yWMMMwNQK_Wx9ME5YvIg-1; Thu, 10 Sep 2020 11:23:02 -0400
X-MC-Unique: g_yWMMMwNQK_Wx9ME5YvIg-1
Received: by mail-wm1-f71.google.com with SMTP id b14so128605wmj.3
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 08:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0AFeQPAzVVhz+6GgdLSr+TbEOa0+V0j3040P7zvKLpM=;
 b=UMiJN0achG6tBnNODBjQ9eX6XKcpigDAUIsQl8FoCkwnUZVJrSTqrPBfNlLD2yosdc
 /GDlGlwpmlrc5H6Ld/XUANXEre8AhBWn5KZL3bxtvoC0LD4rcDwKEX0E+q5LXC0kR6Lh
 kvrjleje8uoZJCpLDAKWhb1Hi3c2Fx6szrgmc4AjCFWDMJ64mt+vMP+37XRrDTgmBAIg
 ZhgFLi7Zw52Kc5A9lO0XGgx5K6sIlYHG4kkGoHsdNFmoFH8teeSnak9IciBk6KVgnxLN
 fxYs4WYrrnwfL3SIXQqH4rIEPw6ec1vjmC2RCW5ibFDfGpdFBhdgOoNrOkYb1yR+uN1/
 3EYg==
X-Gm-Message-State: AOAM531XkG+CQ9Qfp3/8kM8Ccs8aXfbasswX7UxqogNmVzeA5AhxjWn/
 LamzD9ICZ/5gRRdHFFKjlVvl8d5JM+bKmaVUeP3JceihDfK93tkJRLV+0oB1fwkjRuUEhNskPWx
 1Axc8RUC3b5l9re8=
X-Received: by 2002:a1c:99c7:: with SMTP id b190mr532449wme.44.1599751380617; 
 Thu, 10 Sep 2020 08:23:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlJkaAW8h2mLyXwfntdZgkY1IMOIiICgj0RwYSoBNV5xtkrWrMpnykq6FYsWeTKpFELPayqw==
X-Received: by 2002:a1c:99c7:: with SMTP id b190mr532414wme.44.1599751380372; 
 Thu, 10 Sep 2020 08:23:00 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q18sm9692188wre.78.2020.09.10.08.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 08:22:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/9] qapi: Restrict query-uuid command to machine code
Date: Thu, 10 Sep 2020 17:22:22 +0200
Message-Id: <20200910152225.524322-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910152225.524322-1-philmd@redhat.com>
References: <20200910152225.524322-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only qemu-system-FOO and qemu-storage-daemon provide QMP
monitors, therefore such declarations and definitions are
irrelevant for user-mode emulation.

Restricting the query-uuid command to machine.json allows
pulling less declarations/definitions to user-mode.

Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine.json | 30 ++++++++++++++++++++++++++++++
 qapi/misc.json    | 30 ------------------------------
 block/iscsi.c     |  2 +-
 stubs/uuid.c      |  2 +-
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index ba61e6ccea4..eb3bf81d008 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -426,6 +426,36 @@
 ##
 { 'command': 'query-target', 'returns': 'TargetInfo' }
 
+##
+# @UuidInfo:
+#
+# Guest UUID information (Universally Unique Identifier).
+#
+# @UUID: the UUID of the guest
+#
+# Since: 0.14.0
+#
+# Notes: If no UUID was specified for the guest, a null UUID is returned.
+##
+{ 'struct': 'UuidInfo', 'data': {'UUID': 'str'} }
+
+##
+# @query-uuid:
+#
+# Query the guest UUID information.
+#
+# Returns: The @UuidInfo for the guest
+#
+# Since: 0.14.0
+#
+# Example:
+#
+# -> { "execute": "query-uuid" }
+# <- { "return": { "UUID": "550e8400-e29b-41d4-a716-446655440000" } }
+#
+##
+{ 'command': 'query-uuid', 'returns': 'UuidInfo', 'allow-preconfig': true }
+
 ##
 # @GuidInfo:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index edcc91e1060..05db6295fe0 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -98,36 +98,6 @@
 ##
 { 'command': 'query-kvm', 'returns': 'KvmInfo' }
 
-##
-# @UuidInfo:
-#
-# Guest UUID information (Universally Unique Identifier).
-#
-# @UUID: the UUID of the guest
-#
-# Since: 0.14.0
-#
-# Notes: If no UUID was specified for the guest, a null UUID is returned.
-##
-{ 'struct': 'UuidInfo', 'data': {'UUID': 'str'} }
-
-##
-# @query-uuid:
-#
-# Query the guest UUID information.
-#
-# Returns: The @UuidInfo for the guest
-#
-# Since: 0.14.0
-#
-# Example:
-#
-# -> { "execute": "query-uuid" }
-# <- { "return": { "UUID": "550e8400-e29b-41d4-a716-446655440000" } }
-#
-##
-{ 'command': 'query-uuid', 'returns': 'UuidInfo', 'allow-preconfig': true }
-
 ##
 # @IOThreadInfo:
 #
diff --git a/block/iscsi.c b/block/iscsi.c
index bd2122a3a44..e30a7e3606b 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -42,7 +42,7 @@
 #include "qemu/uuid.h"
 #include "sysemu/replay.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
 #include "crypto/secret.h"
diff --git a/stubs/uuid.c b/stubs/uuid.c
index 67f182fa3aa..e5112eb3f60 100644
--- a/stubs/uuid.c
+++ b/stubs/uuid.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qemu/uuid.h"
 
 UuidInfo *qmp_query_uuid(Error **errp)
-- 
2.26.2


