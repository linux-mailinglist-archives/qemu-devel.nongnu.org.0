Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C564E6820
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:54:36 +0100 (CET)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRfP-0005NT-Hy
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:54:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcS-0002Us-4C
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcP-0006Xb-2z
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OG3SGzxUyg8w+R2DLS2Z3RhgRMZdmtAZAIXaL+Bstp4=;
 b=P+MWBXayISjhZF0qMJ2HVFIzFPC3/g37a6ovGohFfMK6ARB+QrL1iRRYnyRmbY/aDSMqdG
 CIpdMvotr1BeTKN4OrZInV7deLyvmAxNcuAEVV1gTfMuwLUbhauQRVomTEZWOupzep+M0G
 CMlt+pk4pHU65UrGoEsExv87HCsDZvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-9G8q8rvoO-u8tAdCc497CQ-1; Thu, 24 Mar 2022 13:50:19 -0400
X-MC-Unique: 9G8q8rvoO-u8tAdCc497CQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 489B880281D
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:50:19 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.195.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C164417E47;
 Thu, 24 Mar 2022 17:50:17 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/14] qapi: BlockExportRemoveMode: move comments to TODO
Date: Thu, 24 Mar 2022 18:50:02 +0100
Message-Id: <20220324175015.232794-2-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-1-victortoso@redhat.com>
References: <20220324175015.232794-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


