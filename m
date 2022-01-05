Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B960485329
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:02:46 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55wC-0001Kc-R5
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55XN-0003uw-W4
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55XM-0000W9-4W
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFk5HJ9ux/N6KIcTp600+tVkXs6uUnZe2/t4sdasXOU=;
 b=AYXoEmu9ocuY85ktf0o2SZN3Mx6IIhFt31GKNTcqB7cNVi6HYaEapHpMalWezaSm4V3HaK
 kA77zf8sGbLSUNFxxcZpL6ktisYFdKAWu22AT/S22Ag1R/TcPYphIFvQkaP66MZgwm7Fca
 X+z2x0Y+NfYh6sAy2ZUL1aWxCMn1Zbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-9DRJ-JsZN8iNmcn8wSwLMQ-1; Wed, 05 Jan 2022 07:37:02 -0500
X-MC-Unique: 9DRJ-JsZN8iNmcn8wSwLMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57CE785B660;
 Wed,  5 Jan 2022 12:37:01 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8BC2376B;
 Wed,  5 Jan 2022 12:37:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU
 binary name
Date: Wed,  5 Jan 2022 13:36:12 +0100
Message-Id: <20220105123612.432038-9-thuth@redhat.com>
In-Reply-To: <20220105123612.432038-1-thuth@redhat.com>
References: <20220105123612.432038-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In downstream, we want to use a different name for the QEMU binary,
and some people might also use the docs for non-x86 binaries, that's
why we already created the |qemu_system| placeholder in the past.
Use it now in the stap trace doc, too.

Message-Id: <20220104103319.179870-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/tools/qemu-trace-stap.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/docs/tools/qemu-trace-stap.rst b/docs/tools/qemu-trace-stap.rst
index d53073b52b..2169ce5d17 100644
--- a/docs/tools/qemu-trace-stap.rst
+++ b/docs/tools/qemu-trace-stap.rst
@@ -46,19 +46,19 @@ The following commands are valid:
   any of the listed names. If no *PATTERN* is given, the all possible
   probes will be listed.
 
-  For example, to list all probes available in the ``qemu-system-x86_64``
+  For example, to list all probes available in the |qemu_system|
   binary:
 
-  ::
+  .. parsed-literal::
 
-    $ qemu-trace-stap list qemu-system-x86_64
+    $ qemu-trace-stap list |qemu_system|
 
   To filter the list to only cover probes related to QEMU's cryptographic
   subsystem, in a binary outside ``$PATH``
 
-  ::
+  .. parsed-literal::
 
-    $ qemu-trace-stap list /opt/qemu/4.0.0/bin/qemu-system-x86_64 'qcrypto*'
+    $ qemu-trace-stap list /opt/qemu/|version|/bin/|qemu_system| 'qcrypto*'
 
 .. option:: run OPTIONS BINARY PATTERN...
 
@@ -90,26 +90,26 @@ The following commands are valid:
     Restrict the tracing session so that it only triggers for the process
     identified by *PID*.
 
-  For example, to monitor all processes executing ``qemu-system-x86_64``
+  For example, to monitor all processes executing |qemu_system|
   as found on ``$PATH``, displaying all I/O related probes:
 
-  ::
+  .. parsed-literal::
 
-    $ qemu-trace-stap run qemu-system-x86_64 'qio*'
+    $ qemu-trace-stap run |qemu_system| 'qio*'
 
   To monitor only the QEMU process with PID 1732
 
-  ::
+  .. parsed-literal::
 
-    $ qemu-trace-stap run --pid=1732 qemu-system-x86_64 'qio*'
+    $ qemu-trace-stap run --pid=1732 |qemu_system| 'qio*'
 
   To monitor QEMU processes running an alternative binary outside of
   ``$PATH``, displaying verbose information about setup of the
   tracing environment:
 
-  ::
+  .. parsed-literal::
 
-    $ qemu-trace-stap -v run /opt/qemu/4.0.0/qemu-system-x86_64 'qio*'
+    $ qemu-trace-stap -v run /opt/qemu/|version|/bin/|qemu_system| 'qio*'
 
 See also
 --------
-- 
2.27.0


