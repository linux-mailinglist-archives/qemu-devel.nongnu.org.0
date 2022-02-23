Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56484C1A9E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 19:06:24 +0100 (CET)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMw1v-0001JU-Np
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 13:06:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMw0J-0000XN-B3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMw07-0001WM-2Y
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 13:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645639470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D1uhc7P8c7vdwWfJT6qqyuB9ojegxgiSoG3qWpAy3AU=;
 b=dB+5gDL3+C+8qIx/ET1ZwExLuuh5/5bPyfvUzebs7sUup2RKhArggNphBwho9A5wI2BFV/
 yHbT6aT8t7/xPZWJosyNVeLn4uTbMzrm4edGfUd+IV7rDshdMOKzVi+D1isBO3J+2uG0Fy
 5mPsgEv37vj1Th8b6MgIdfQvyEIwDTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-EzefyHpPNZ64I-POLf66Pg-1; Wed, 23 Feb 2022 13:04:28 -0500
X-MC-Unique: EzefyHpPNZ64I-POLf66Pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6559801AAD
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 18:04:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF3E286B99;
 Wed, 23 Feb 2022 18:04:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: fix mistake in example command illustration
Date: Wed, 23 Feb 2022 18:04:18 +0000
Message-Id: <20220223180418.2098303-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The snapshot-load/save/delete commands illustrated their usage, but
mistakenly used 'data' rather than 'arguments' as the field name.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/migration.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 5975a0e104..1c6296897d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1888,7 +1888,7 @@
 # Example:
 #
 # -> { "execute": "snapshot-save",
-#      "data": {
+#      "arguments": {
 #         "job-id": "snapsave0",
 #         "tag": "my-snap",
 #         "vmstate": "disk0",
@@ -1949,7 +1949,7 @@
 # Example:
 #
 # -> { "execute": "snapshot-load",
-#      "data": {
+#      "arguments": {
 #         "job-id": "snapload0",
 #         "tag": "my-snap",
 #         "vmstate": "disk0",
@@ -2002,7 +2002,7 @@
 # Example:
 #
 # -> { "execute": "snapshot-delete",
-#      "data": {
+#      "arguments": {
 #         "job-id": "snapdelete0",
 #         "tag": "my-snap",
 #         "devices": ["disk0", "disk1"]
-- 
2.34.1


