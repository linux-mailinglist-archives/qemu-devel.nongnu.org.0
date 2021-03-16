Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C333DDFB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:46:49 +0100 (CET)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFeS-0000Fy-L2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFIT-0000Ff-3c
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMFII-0002Nf-1L
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615922633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJYjNgajbdrKPGVso9nBBfcftq7OGhSEEJq33Mank1w=;
 b=efMNI4j219+j8niJXkp6Evo3IPuWtuqtx6+43VuywFPT2Z8a8W3l9Mfb7VbQBxNV94hTxV
 n5SgHGnGv/dgdh8lPzXIuulgFfXHCH3V5yno9OBJfP74PSlPEPbii9wbVOry24TNwxCcH8
 vvUGUHbcp9hS/4wQUgeOgTwQXUox1CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-T55jRDyjOAqAbuMssyZKTQ-1; Tue, 16 Mar 2021 15:23:49 -0400
X-MC-Unique: T55jRDyjOAqAbuMssyZKTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE031760C7;
 Tue, 16 Mar 2021 19:23:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF05D5D768;
 Tue, 16 Mar 2021 19:23:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F44A1132C13; Tue, 16 Mar 2021 20:23:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 1/6] docs/system/deprecated: Fix note on fdc drive properties
Date: Tue, 16 Mar 2021 20:23:42 +0100
Message-Id: <20210316192347.3918857-2-armbru@redhat.com>
In-Reply-To: <20210316192347.3918857-1-armbru@redhat.com>
References: <20210316192347.3918857-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 4a27a638e7 "fdc: Deprecate configuring floppies with -global
isa-fdc" actually deprecated any use of floppy controller driver
properties, not just with -global.  Correct the deprecation note
accordingly.

Fixes: 4a27a638e718b445648de6b27c709353551d9b44
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20210309161214.1402527-2-armbru@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/system/deprecated.rst | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 5e3a31c123..c89d0a207c 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -94,10 +94,11 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``Configuring floppies with ``-global``
-'''''''''''''''''''''''''''''''''''''''
+Floppy controllers' drive properties (since 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''
 
-Use ``-device floppy,...`` instead:
+Use ``-device floppy,...`` instead.  When configuring onboard floppy
+controllers
 ::
 
     -global isa-fdc.driveA=...
@@ -120,8 +121,30 @@ become
 
     -device floppy,unit=1,drive=...
 
-``-drive`` with bogus interface type
-''''''''''''''''''''''''''''''''''''
+When plugging in a floppy controller
+::
+
+    -device isa-fdc,...,driveA=...
+
+becomes
+::
+
+    -device isa-fdc,...
+    -device floppy,unit=0,drive=...
+
+and
+::
+
+    -device isa-fdc,...,driveB=...
+
+becomes
+::
+
+    -device isa-fdc,...
+    -device floppy,unit=1,drive=...
+
+``-drive`` with bogus interface type (since 5.1)
+''''''''''''''''''''''''''''''''''''''''''''''''
 
 Drives with interface types other than ``if=none`` are for onboard
 devices.  It is possible to use drives the board doesn't pick up with
-- 
2.26.2


