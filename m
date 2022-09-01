Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0935A9360
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:42:04 +0200 (CEST)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgi2-00027v-VA
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2V-0000P7-GR
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2T-0004vt-Tc
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwxJo7a0evujp3cUbss6kGVZN4H8g26VgXzDcACiWE8=;
 b=FTFVQPOoT8ulLvXTSK8YcD1A+4BrOxRezkzJAvEv7WOI3+BKcG9W87XNT9QW/gYcx7/n2+
 jbZbrt1Pdz3R+xpsIPmifEbta75Vuo2fcNvYOa2foXVbWPJICFuLvbuTuiqFtFTmDejwMA
 dPMcTSp39oOU05P9jCXZnBTkAORVlK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-PaFkyr6JOUisCISNMeaKcA-1; Thu, 01 Sep 2022 04:59:00 -0400
X-MC-Unique: PaFkyr6JOUisCISNMeaKcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A56D8032F1;
 Thu,  1 Sep 2022 08:59:00 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F202026D4C;
 Thu,  1 Sep 2022 08:58:57 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 09/10] qapi: fix example of query-hotpluggable-cpus command
Date: Thu,  1 Sep 2022 10:58:39 +0200
Message-Id: <20220901085840.22520-10-victortoso@redhat.com>
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com>
References: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

The example return type has the wrong member name. Fix it.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/machine.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 4782eea2c3..abb2f48808 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -958,9 +958,9 @@
 #
 # -> { "execute": "query-hotpluggable-cpus" }
 # <- {"return": [
-#      { "props": { "core": 8 }, "type": "POWER8-spapr-cpu-core",
+#      { "props": { "core-id": 8 }, "type": "POWER8-spapr-cpu-core",
 #        "vcpus-count": 1 },
-#      { "props": { "core": 0 }, "type": "POWER8-spapr-cpu-core",
+#      { "props": { "core-id": 0 }, "type": "POWER8-spapr-cpu-core",
 #        "vcpus-count": 1, "qom-path": "/machine/unattached/device[0]"}
 #    ]}'
 #
-- 
2.37.2


