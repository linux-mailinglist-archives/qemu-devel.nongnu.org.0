Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C937A3F0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:44:28 +0200 (CEST)
Received: from localhost ([::1]:56058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOwF-0000ad-M3
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgOeE-0000Gx-Ve
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgOeB-0006zD-Ht
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620725146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6G+esEja/YdsbP7W4kJ5R/UPrvidOeVnxCOBTEXuaYw=;
 b=UyNfOQ0kKLyUWu9WRvOmx8YhxTzPOj4ihxCV+1ytvG5WSmZK6jOCp3b2NdrwbOGxTgZhJ1
 My2VDCugtE2Q3Z1IOz8boY0LSWDRhdABVGfHSU4QmQPFOUtIMCVgTOYFZWMyywJFzQLayU
 fpYhJMvaCdwRlMf0I3VzZURQ1Loq2FI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-DNFbFScXPK-7zMn1AC6A_Q-1; Tue, 11 May 2021 05:25:44 -0400
X-MC-Unique: DNFbFScXPK-7zMn1AC6A_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA363107ACC7;
 Tue, 11 May 2021 09:25:43 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D7246B8DF;
 Tue, 11 May 2021 09:25:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: add table of contents to QAPI references
Date: Tue, 11 May 2021 10:25:41 +0100
Message-Id: <20210511092541.962525-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QAPI reference docs for the guest agent, storage daemon and QMP are
all rather long and hard to navigate unless you already know the name of
the command and can do full text search for it.

A table of contents in each doc will help people locate stuff much more
easily.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/interop/qemu-ga-ref.rst                 | 3 +++
 docs/interop/qemu-qmp-ref.rst                | 3 +++
 docs/interop/qemu-storage-daemon-qmp-ref.rst | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/docs/interop/qemu-ga-ref.rst b/docs/interop/qemu-ga-ref.rst
index 3f1c4f908f..db1e946124 100644
--- a/docs/interop/qemu-ga-ref.rst
+++ b/docs/interop/qemu-ga-ref.rst
@@ -10,4 +10,7 @@ QEMU Guest Agent Protocol Reference
    TODO: display the QEMU version, both here and in our Sphinx manuals
    more generally.
 
+.. contents::
+   :depth: 3
+
 .. qapi-doc:: qga/qapi-schema.json
diff --git a/docs/interop/qemu-qmp-ref.rst b/docs/interop/qemu-qmp-ref.rst
index c8abaaf8e3..b5bebf6b9a 100644
--- a/docs/interop/qemu-qmp-ref.rst
+++ b/docs/interop/qemu-qmp-ref.rst
@@ -10,4 +10,7 @@ QEMU QMP Reference Manual
    TODO: display the QEMU version, both here and in our Sphinx manuals
    more generally.
 
+.. contents::
+   :depth: 3
+
 .. qapi-doc:: qapi/qapi-schema.json
diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/interop/qemu-storage-daemon-qmp-ref.rst
index caf9dad23a..d0ebb42ebd 100644
--- a/docs/interop/qemu-storage-daemon-qmp-ref.rst
+++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
@@ -10,4 +10,7 @@ QEMU Storage Daemon QMP Reference Manual
    TODO: display the QEMU version, both here and in our Sphinx manuals
    more generally.
 
+.. contents::
+   :depth: 3
+
 .. qapi-doc:: storage-daemon/qapi/qapi-schema.json
-- 
2.31.1


