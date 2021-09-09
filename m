Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71483405A1F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:21:38 +0200 (CEST)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLrr-0007WG-Fm
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mOLpw-0006fa-Td
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mOLpt-0000Cm-Uk
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631200771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RXqVAyfK5iXid/A/t2T42+LCMVBqyWdcWrh4GRl3aXA=;
 b=NzdzNuoaU/yCel1zOphiogM8pe0tlLV68tywqnsYCOhxkZOvv3ZJD91e8Zi/WXp2wwyB1k
 DwCaegyNp5C8ajIyqw+J/yFxvmcrcrwKhUq64EtsE4MjAYhnIL7PKgxzquyUHavDPE5axe
 sN8qlTQOVSBvwo9emZRzuVO55wrRyeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-jSKLmaoiOEyd3JSY8eiryw-1; Thu, 09 Sep 2021 11:19:31 -0400
X-MC-Unique: jSKLmaoiOEyd3JSY8eiryw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E65BA1006AA0
 for <qemu-devel@nongnu.org>; Thu,  9 Sep 2021 15:19:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B0A55C25D;
 Thu,  9 Sep 2021 15:19:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-options: show -spice options only if #ifdef
 CONFIG_SPICE
Date: Thu,  9 Sep 2021 19:19:22 +0400
Message-Id: <20210909151922.4042793-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=1982600

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 softmmu/vl.c    | 4 +++-
 qemu-options.hx | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97..1e60d286b9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1931,7 +1931,7 @@ static void qemu_create_early_backends(void)
     object_option_foreach_add(object_create_early);
 
     /* spice needs the timers to be initialized by this point */
-    /* spice must initialize before audio as it changes the default auiodev */
+    /* spice must initialize before audio as it changes the default audiodev */
     /* spice must initialize before chardevs (for spicevmc and spiceport) */
     qemu_spice.init();
 
@@ -3488,6 +3488,7 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_readconfig:
                 qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
+#ifdef CONFIG_SPICE
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
                 if (!olist) {
@@ -3500,6 +3501,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 display_remote++;
                 break;
+#endif
             case QEMU_OPTION_writeconfig:
                 {
                     FILE *fp;
diff --git a/qemu-options.hx b/qemu-options.hx
index 8f603cc7e6..204028408c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2003,6 +2003,7 @@ SRST
     Enable SDL.
 ERST
 
+#ifdef CONFIG_SPICE
 DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
     "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
@@ -2024,6 +2025,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "   enable spice\n"
     "   at least one of {port, tls-port} is mandatory\n",
     QEMU_ARCH_ALL)
+#endif
 SRST
 ``-spice option[,option[,...]]``
     Enable the spice remote desktop protocol. Valid options are
-- 
2.33.0.113.g6c40894d24


