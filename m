Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667385A68D7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:54:19 +0200 (CEST)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4VG-0006nh-0J
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uO-00025Z-19
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uM-00024w-H5
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oj3WR2rGEhQN1x4OkvkAOD3VlzclnmFFLLkN7bKDLvE=;
 b=BYAi1nDtP7Rbzw8crHSprrgnmAzv6bBaSqgNeEpr82/NFNY66/qF74tlzU3Q8lwNDMOjWX
 VvCJ6hLPhn4llf3dKYH4P2NJIYZxA8Z0FMoMWNM+7srzkfwBuCj3ORktSoBvYSqH9lcp/Z
 SofhbL1b1iH6Gs4zo08NzUNnGSs5Pp4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-d87Frzm2Pha85OkX4U_E0A-1; Tue, 30 Aug 2022 12:16:05 -0400
X-MC-Unique: d87Frzm2Pha85OkX4U_E0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8459A2999B4F;
 Tue, 30 Aug 2022 16:16:04 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FFC01415133;
 Tue, 30 Aug 2022 16:16:02 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 09/16] qapi: fix example of DEVICE_UNPLUG_GUEST_ERROR event
Date: Tue, 30 Aug 2022 18:15:38 +0200
Message-Id: <20220830161545.84198-10-victortoso@redhat.com>
In-Reply-To: <20220830161545.84198-1-victortoso@redhat.com>
References: <20220830161545.84198-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output is missing a ',' delimiter and it has an extra ending
curly bracket. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/qdev.json | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 26cd10106b..2708fb4e99 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -150,10 +150,9 @@
 #
 # Example:
 #
-# <- { "event": "DEVICE_UNPLUG_GUEST_ERROR"
+# <- { "event": "DEVICE_UNPLUG_GUEST_ERROR",
 #      "data": { "device": "core1",
 #                "path": "/machine/peripheral/core1" },
-#      },
 #      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
 #
 ##
-- 
2.37.2


