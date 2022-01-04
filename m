Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63257483FFA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 11:36:18 +0100 (CET)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4hAs-0001VQ-T6
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 05:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4h8f-0008LK-4O
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:33:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n4h8M-0004Wy-IZ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641292416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ap9PDePh7zBvSaMkUaV2AUuIQWtrJpQnMVCdSik/z/k=;
 b=SqxWk7zMX2qu+J7Gdx8UmwP0UicUhdaQrO7IGaSgN2e8O5OQob/JiZcapkbhi9P+Xb5WxF
 hD1VS4zM/i3zDYYwSwJmzld146y1ULtG4sTHOWZHThe1cBPOlzZy7iVCOzSP3n7cqoMeeR
 sKQTTKb91EKrd11PKJaZx1V/ULf7J2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-jFvwUvOeNwyFrGq528vQsQ-1; Tue, 04 Jan 2022 05:33:35 -0500
X-MC-Unique: jFvwUvOeNwyFrGq528vQsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D19CB344B0
 for <qemu-devel@nongnu.org>; Tue,  4 Jan 2022 10:33:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 161E81007607;
 Tue,  4 Jan 2022 10:33:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU
 binary name
Date: Tue,  4 Jan 2022 11:33:19 +0100
Message-Id: <20220104103319.179870-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In downstream, we want to use a different name for the QEMU binary,
and some people might also use the docs for non-x86 binaries, that's
why we already created the |qemu_system| placeholder in the past.
Use it now in the stap trace doc, too.

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


