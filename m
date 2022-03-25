Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C2D4E7AEB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:09:34 +0100 (CET)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXs7h-00070D-0Z
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:09:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5U-0004Se-4G
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXs5R-0002kt-RM
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcMYkzs+SdOWIAdNnYWwFluyta0X0IVzhusqVoPMs8I=;
 b=ImhsDlOL6GMV2g1GWHWfuRADoHl9oKDpmdlkeq2LgEDTIpLR+al03HhQeYm6tWpO2rhhUp
 Rm23n+y1DZlHrh1mbupajA9IRK5eftU4Spp54J2nLOrbXBlz1Oc9TETE5XOVlNcp4YpynH
 0+K925785TfbTKMmZ0k30uQbk2gUtLk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-kpPfmZcgM_aI5RTEdspsag-1; Fri, 25 Mar 2022 18:07:12 -0400
X-MC-Unique: kpPfmZcgM_aI5RTEdspsag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3352802809
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:07:11 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D4C9400F8C2;
 Fri, 25 Mar 2022 22:07:10 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/14] qapi: BlockExportRemoveMode: move comments to TODO
Date: Fri, 25 Mar 2022 23:06:54 +0100
Message-Id: <20220325220707.52118-2-victortoso@redhat.com>
In-Reply-To: <20220325220707.52118-1-victortoso@redhat.com>
References: <20220325220707.52118-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@hide and @soft are potential additions which fits the TODO section
perfectly.

The main motivation is to avoid this whole block of comment entering
the wrong section in the python parser.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
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


