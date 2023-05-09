Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926646FC13C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:06:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGt-0008WV-5L; Tue, 09 May 2023 04:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGm-0008UN-0t
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGk-0008UZ-2x
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7+xqQntQkE3HAt4wEaVOsmQ0puw+812gLYvi5DYFe0=;
 b=aaoYq6jZi/p3Zs4ZkVA457w3tDW0fJ84K9adEmsG93ciboQuP11PHhWx9ZN7rYYHcsQwb5
 AnpfcctpPy61xj/xE0OhwJ3XhdpDtSNHcyVCKRUk7h3CcwSe+UKCdNk1a3+pYyuqpT04YZ
 x0S7FTJORc2VQkI3e0fKTB8GtlctPAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-xcMZZ7eSNWaTIZRaEZwLbw-1; Tue, 09 May 2023 04:00:18 -0400
X-MC-Unique: xcMZZ7eSNWaTIZRaEZwLbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D27B1884628;
 Tue,  9 May 2023 08:00:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5ADC15BA0;
 Tue,  9 May 2023 08:00:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F81B21E6609; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 08/17] qapi/dump: Indent bulleted lists consistently
Date: Tue,  9 May 2023 10:00:02 +0200
Message-Id: <20230509080011.3231661-9-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Documentation of dump-guest-memory contains two bulleted lists.  The
first one is indented, the second one isn't.  Delete the first one's
indentation for a more consistent look.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-9-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 qapi/dump.json | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/dump.json b/qapi/dump.json
index 6fc215dd47..24af1df7db 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -44,12 +44,12 @@
 #
 #          Also, paging=true has the following limitations:
 #
-#             1. The guest may be in a catastrophic state or can have corrupted
-#                memory, which cannot be trusted
-#             2. The guest can be in real-mode even if paging is enabled. For
-#                example, the guest uses ACPI to sleep, and ACPI sleep state
-#                goes in real-mode
-#             3. Currently only supported on i386 and x86_64.
+#          1. The guest may be in a catastrophic state or can have corrupted
+#             memory, which cannot be trusted
+#          2. The guest can be in real-mode even if paging is enabled. For
+#             example, the guest uses ACPI to sleep, and ACPI sleep state
+#             goes in real-mode
+#          3. Currently only supported on i386 and x86_64.
 #
 # @protocol: the filename or file descriptor of the vmcore. The supported
 #            protocols are:
-- 
2.39.2


