Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A65B6F1581
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:30:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLLn-0006JE-7V; Fri, 28 Apr 2023 06:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLf-0006Gd-VM
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLd-0007Kg-U1
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IAvQIvUU5akD/LUkGh+xhH5oSnlpGRqYcHrsWij42c=;
 b=LBR/0jLgFfjILuXiPUz74A+Tuyl8G7sNFRhepe1pIHdw5Y7eOfQmApL4FB/nNd5H0wNyDi
 6P1210nq36x5I9crl0speFVN6H2X7RfVKzfa4GVGG5GSddX7IZEMbY9rcuFSz74ys0qEyo
 MCcgYutt40VOxA3o/nJFCKSqrbf9VQM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-QagTbcs7Pqqh0OFlUSEX4w-1; Fri, 28 Apr 2023 06:29:03 -0400
X-MC-Unique: QagTbcs7Pqqh0OFlUSEX4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B04B3C0DDAA;
 Fri, 28 Apr 2023 10:29:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A5A5440BC;
 Fri, 28 Apr 2023 10:29:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55F9121D0D5C; Fri, 28 Apr 2023 12:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 12/17] qapi: Fix argument documentation markup
Date: Fri, 28 Apr 2023 12:28:56 +0200
Message-Id: <20230428102901.1685375-13-armbru@redhat.com>
In-Reply-To: <20230428102901.1685375-1-armbru@redhat.com>
References: <20230428102901.1685375-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Member / argument documentation of BlockdevAmendOptionsQcow2,
job-resume, and RDMA_GID_STATUS_CHANGED is parsed as ordinary text due
to missing colon or space before the colon.  The generated
documentation shows these members / arguments as "Not documented".

The fix is obvious: add missing colons, delete extra spaces.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230425064223.820979-13-armbru@redhat.com>
---
 qapi/block-core.json | 2 +-
 qapi/job.json        | 2 +-
 qapi/rdma.json       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2382772e17..9dd5ed9a47 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5155,7 +5155,7 @@
 # Driver specific image amend options for qcow2.
 # For now, only encryption options can be amended
 #
-# @encrypt          Encryption options to be amended
+# @encrypt: Encryption options to be amended
 #
 # Since: 5.1
 ##
diff --git a/qapi/job.json b/qapi/job.json
index d5f84e9615..bc4104757a 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -148,7 +148,7 @@
 # This command returns immediately after resuming a paused job. Resuming an
 # already running job is an error.
 #
-# @id : The job identifier.
+# @id: The job identifier.
 #
 # Since: 3.0
 ##
diff --git a/qapi/rdma.json b/qapi/rdma.json
index a1d2175a8b..5b6b66afa4 100644
--- a/qapi/rdma.json
+++ b/qapi/rdma.json
@@ -17,7 +17,7 @@
 #
 # @subnet-prefix: Subnet Prefix
 #
-# @interface-id : Interface ID
+# @interface-id: Interface ID
 #
 # Since: 4.0
 #
-- 
2.39.2


