Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1BC2AF1CD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:14:38 +0100 (CET)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpxN-0007sg-F9
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcprt-0002xY-8L
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcprr-0000wW-Fp
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INbi8SjPMiuP+vUI4harRaI+Fcap0Y8skIp2bvpuoFw=;
 b=YP5TR/+9amjT02FH70qQ+Jxx2lzDr7ODJYyIXG57Nqg4p6xQE2McazFM7PtzVfuTyV7OjV
 yKKt10qBGgLGcjmwB8CoX/4OAZcszhcLSUVJlK4qEkhM/AyIDMNtj/a+SlnIzZcS/5Wbz9
 AuiSLHPMsPc3i6/MABtHFDeUCqcygAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-nPsZVdpGO5uXemk5oc06_A-1; Wed, 11 Nov 2020 08:08:53 -0500
X-MC-Unique: nPsZVdpGO5uXemk5oc06_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E1CD801FDB
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 13:08:52 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06F725C1C4;
 Wed, 11 Nov 2020 13:08:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] char: Deprecate backend aliases 'tty' and 'parport'
Date: Wed, 11 Nov 2020 14:08:34 +0100
Message-Id: <20201111130834.33985-3-kwolf@redhat.com>
In-Reply-To: <20201111130834.33985-1-kwolf@redhat.com>
References: <20201111130834.33985-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, libvir-list@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPI doesn't know the aliases 'tty' and 'parport' and there is no
reason to prefer them to the real names of the backends 'serial' and
'parallel'.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/deprecated.rst |  6 ++++++
 chardev/char.c             | 11 ++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bbaae0d97c..7e313eae4f 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -81,6 +81,12 @@ error in the future.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
+``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+``tty`` and ``parport`` are aliases that will be removed. Instead, the
+actual backend names ``serial`` and ``parallel`` should be used.
+
 RISC-V ``-bios`` (since 5.1)
 ''''''''''''''''''''''''''''
 
diff --git a/chardev/char.c b/chardev/char.c
index c406e61db6..f9e297185d 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -534,9 +534,10 @@ static const ChardevClass *char_get_class(const char *driver, Error **errp)
     return cc;
 }
 
-static const struct ChardevAlias {
+static struct ChardevAlias {
     const char *typename;
     const char *alias;
+    bool deprecation_warning_printed;
 } chardev_alias_table[] = {
 #ifdef HAVE_CHARDEV_PARPORT
     { "parallel", "parport" },
@@ -585,6 +586,9 @@ help_string_append(const char *name, bool is_cli_alias, void *opaque)
     GString *str = opaque;
 
     g_string_append_printf(str, "\n  %s", name);
+    if (is_cli_alias) {
+        g_string_append(str, " (deprecated)");
+    }
 }
 
 static const char *chardev_alias_translate(const char *name)
@@ -592,6 +596,11 @@ static const char *chardev_alias_translate(const char *name)
     int i;
     for (i = 0; i < (int)ARRAY_SIZE(chardev_alias_table); i++) {
         if (g_strcmp0(chardev_alias_table[i].alias, name) == 0) {
+            if (!chardev_alias_table[i].deprecation_warning_printed) {
+                warn_report("The alias '%s' is deprecated, use '%s' instead",
+                            name, chardev_alias_table[i].typename);
+                chardev_alias_table[i].deprecation_warning_printed = true;
+            }
             return chardev_alias_table[i].typename;
         }
     }
-- 
2.28.0


