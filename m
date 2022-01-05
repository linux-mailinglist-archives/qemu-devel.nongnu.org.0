Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEADB485136
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:38:35 +0100 (CET)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53gg-00069Y-Nr
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:38:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n53b4-00006t-UE
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n53b1-0000ZF-6L
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:32:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641378762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W11lvguwbWqyTIsBOu9WzQYJ9vH7ztTxY0/+TGCRvzo=;
 b=UywLPPUA/kXTQ3HzmVxXprVPk05xDC5UNatqDdDEbjuLW5SapZCI1zFB0GWJOfupBhVh6C
 M19g7tr4LP20DWwJPDXfKgG4lxPw8vcoFQEiDIB25SCOZ492gmBslT+N2KztVqMVsDjxU7
 H9y3BTXbkVV9mShhGxGIulR3EcFLkDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-WyHrH9UfN-qN1mbB-CVMVQ-1; Wed, 05 Jan 2022 05:32:37 -0500
X-MC-Unique: WyHrH9UfN-qN1mbB-CVMVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F387B81EE60;
 Wed,  5 Jan 2022 10:32:35 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22C71694D8;
 Wed,  5 Jan 2022 10:32:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Subject: [PATCH] docs/system/ppc: Merge the PEF information into the pseries
 page
Date: Wed,  5 Jan 2022 11:32:32 +0100
Message-Id: <20220105103232.405204-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Protected Execution Facility is only available with the pseries
machine, so let's merge the old ASCII text into the new RST file now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/papr-pef.txt           | 30 ------------------------------
 docs/system/ppc/pseries.rst | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 30 deletions(-)
 delete mode 100644 docs/papr-pef.txt

diff --git a/docs/papr-pef.txt b/docs/papr-pef.txt
deleted file mode 100644
index 72550e9bf8..0000000000
--- a/docs/papr-pef.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-POWER (PAPR) Protected Execution Facility (PEF)
-===============================================
-
-Protected Execution Facility (PEF), also known as Secure Guest support
-is a feature found on IBM POWER9 and POWER10 processors.
-
-If a suitable firmware including an Ultravisor is installed, it adds
-an extra memory protection mode to the CPU.  The ultravisor manages a
-pool of secure memory which cannot be accessed by the hypervisor.
-
-When this feature is enabled in QEMU, a guest can use ultracalls to
-enter "secure mode".  This transfers most of its memory to secure
-memory, where it cannot be eavesdropped by a compromised hypervisor.
-
-Launching
----------
-
-To launch a guest which will be permitted to enter PEF secure mode:
-
-# ${QEMU} \
-    -object pef-guest,id=pef0 \
-    -machine confidential-guest-support=pef0 \
-    ...
-
-Live Migration
-----------------
-
-Live migration is not yet implemented for PEF guests.  For
-consistency, we currently prevent migration if the PEF feature is
-enabled, whether or not the guest has actually entered secure mode.
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 72e315eff6..16394fa521 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -230,6 +230,39 @@ nested. Combinations not shown in the table are not available.
 
 .. [3] Introduced on Power10 machines.
 
+
+POWER (PAPR) Protected Execution Facility (PEF)
+-----------------------------------------------
+
+Protected Execution Facility (PEF), also known as Secure Guest support
+is a feature found on IBM POWER9 and POWER10 processors.
+
+If a suitable firmware including an Ultravisor is installed, it adds
+an extra memory protection mode to the CPU.  The ultravisor manages a
+pool of secure memory which cannot be accessed by the hypervisor.
+
+When this feature is enabled in QEMU, a guest can use ultracalls to
+enter "secure mode".  This transfers most of its memory to secure
+memory, where it cannot be eavesdropped by a compromised hypervisor.
+
+Launching
+^^^^^^^^^
+
+To launch a guest which will be permitted to enter PEF secure mode::
+
+  $ qemu-system-ppc64 \
+      -object pef-guest,id=pef0 \
+      -machine confidential-guest-support=pef0 \
+      ...
+
+Live Migration
+^^^^^^^^^^^^^^
+
+Live migration is not yet implemented for PEF guests.  For
+consistency, QEMU currently prevents migration if the PEF feature is
+enabled, whether or not the guest has actually entered secure mode.
+
+
 Maintainer contact information
 ------------------------------
 
-- 
2.27.0


