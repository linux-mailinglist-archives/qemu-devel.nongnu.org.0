Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6D4ED813
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:59:42 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsWj-000757-Cg
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:59:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRG-0006i4-LF
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRD-0007hw-S3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbGsBJqH5D6VwDdDcOqgMTAVJp1U3Jolt3hAcWCrsS8=;
 b=gwf8qMB5Yy2OYDA2YHSmTZ0yR6bDVEFQgJZFAQW4VmzDly97SxLVKdwzGezkgFqHLr63m3
 DT1eRDLxqS5qkg7kCVvj1GR3KpoMNOAXCh/DH50+MztsuosxtrsLfHQabC0pm9AUFQ9zRi
 dw22TGI7JREX0TinljtxPaI0bPZEKrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-q9Agk773MlCzfuO7_iK9Rw-1; Thu, 31 Mar 2022 06:53:56 -0400
X-MC-Unique: q9Agk773MlCzfuO7_iK9Rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C58E3899ECF;
 Thu, 31 Mar 2022 10:53:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95DAA40D0160;
 Thu, 31 Mar 2022 10:53:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F17D21E6923; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] qapi: BlockExportRemoveMode: move comments to TODO
Date: Thu, 31 Mar 2022 12:53:31 +0200
Message-Id: <20220331105344.3471295-3-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

@hide and @soft are potential additions which fits the TODO section
perfectly.

The main motivation is to avoid this whole block of comment entering
the wrong section in the python parser.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20220328140604.41484-2-victortoso@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-export.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f183522d0d..1e34927f85 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -219,13 +219,13 @@
 #
 # @hard: Drop all connections immediately and remove export.
 #
-# Potential additional modes to be added in the future:
+# TODO: Potential additional modes to be added in the future:
 #
-# hide: Just hide export from new clients, leave existing connections as is.
-# Remove export after all clients are disconnected.
+#       hide: Just hide export from new clients, leave existing connections as is.
+#       Remove export after all clients are disconnected.
 #
-# soft: Hide export from new clients, answer with ESHUTDOWN for all further
-# requests from existing clients.
+#       soft: Hide export from new clients, answer with ESHUTDOWN for all further
+#       requests from existing clients.
 #
 # Since: 2.12
 ##
-- 
2.35.1


