Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577B337A01
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:51:46 +0100 (CET)
Received: from localhost ([::1]:44342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOXJ-0001xO-Dh
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOOx-0002bw-5s
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOOv-0003Qx-76
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615480984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qY0MKBAjygJuChHuHKyLKZalvVa7pH9p5w4z80tfA4=;
 b=asPHWrKXdVgPFgxC64eSEi6v1j5PA+erEAlNOckZVkELgfvUzR4IpOa7y6HF9rZIvZOzHT
 lcOSA1//PxoCGZMWfc/dOpgsJLF76vcjQiYl+g3qgBNIXXbrEZD/azI7+W3No6EoPFfHTd
 doJwtRD8XY518YnoqBM0803VG5Udwvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-hcSQWvpRMRCP3qsM3kVZHQ-1; Thu, 11 Mar 2021 11:43:02 -0500
X-MC-Unique: hcSQWvpRMRCP3qsM3kVZHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4DA65152
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 16:43:01 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE2795D9F0;
 Thu, 11 Mar 2021 16:43:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] char: Deprecate backend aliases 'tty' and 'parport'
Date: Thu, 11 Mar 2021 17:42:52 +0100
Message-Id: <20210311164253.338723-3-kwolf@redhat.com>
In-Reply-To: <20210311164253.338723-1-kwolf@redhat.com>
References: <20210311164253.338723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPI doesn't know the aliases 'tty' and 'parport' and there is no
reason to prefer them to the real names of the backends 'serial' and
'parallel'.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst |  6 ++++++
 chardev/char.c             | 12 +++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 3e9e3a26f6..11da79ea5b 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -75,6 +75,12 @@ The ``pretty=on|off`` switch has no effect for HMP monitors, but is
 silently ignored. Using the switch with HMP monitors will become an
 error in the future.
 
+``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+``tty`` and ``parport`` are aliases that will be removed. Instead, the
+actual backend names ``serial`` and ``parallel`` should be used.
+
 RISC-V ``-bios`` (since 5.1)
 ''''''''''''''''''''''''''''
 
diff --git a/chardev/char.c b/chardev/char.c
index dd925cf9a4..7be9579dd8 100644
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
@@ -584,6 +585,10 @@ help_string_append(const char *name, bool is_cli_alias, void *opaque)
 {
     GString *str = opaque;
 
+    if (is_cli_alias) {
+        return;
+    }
+
     g_string_append_printf(str, "\n  %s", name);
 }
 
@@ -592,6 +597,11 @@ static const char *chardev_alias_translate(const char *name)
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
2.29.2


