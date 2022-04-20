Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57C508C78
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:51:20 +0200 (CEST)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCbv-00084u-HX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCLY-0001J0-0S
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCLW-0000uM-05
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650468861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oySDhZA9J5UG6sYPr8nXS+VNQ80pqiy+FOzXpqHvHWY=;
 b=DO3N+gghtE3cXE+i4us0GC5snF/CmjLINaknfk7Ob1yyXMcpYlJOBlG4EMhokh0rv4OH3X
 AxGkQEPv1xsDHWAP75IwXHo51qlTMPmC7yJc/m21CEmNRAlwX69LwoKiFwBwoY3L9VUTVC
 MqOcWNw9b8ia5bfS9V8khqXBy1YF3bs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-BVyFkWHuPvqrgoILmtGiMw-1; Wed, 20 Apr 2022 11:34:16 -0400
X-MC-Unique: BVyFkWHuPvqrgoILmtGiMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6639C1C0513F;
 Wed, 20 Apr 2022 15:34:16 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0184E40D0166;
 Wed, 20 Apr 2022 15:34:14 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qapi: Fix documentation for query-xen-replication-status
Date: Wed, 20 Apr 2022 17:34:07 +0200
Message-Id: <20220420153408.243584-3-abologna@redhat.com>
In-Reply-To: <20220420153408.243584-1-abologna@redhat.com>
References: <20220420153408.243584-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The correct return type is ReplicationStatus, not
ReplicationResult.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 27d7b28158..409eb086a2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1619,7 +1619,7 @@
 #
 # Query replication status while the vm is running.
 #
-# Returns: A @ReplicationResult object showing the status.
+# Returns: A @ReplicationStatus object showing the status.
 #
 # Example:
 #
-- 
2.35.1


