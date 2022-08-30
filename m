Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4C5A68D8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:54:24 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4VL-0006ye-BA
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uS-0002Bm-8A
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oT3uQ-00025k-GO
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwxJo7a0evujp3cUbss6kGVZN4H8g26VgXzDcACiWE8=;
 b=TxzMTUxZZ9qJQjMaPX7gcz6LJ5B/OhPJz9jzy7Pd8uPWq0rjH9LHHi6nhe9TEoCUrggLzV
 v+S3822FuC+OpwecfASTgUiGdYImZV+yqH1oPSYlRD5pufW4MWVTzgpZLCE4LEDlpGaZHD
 2Aa/XlIUWd2I0C7Zu5QNUbRthj3LQZs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-311BY0W5NIOs9t9qKVsL-A-1; Tue, 30 Aug 2022 12:16:12 -0400
X-MC-Unique: 311BY0W5NIOs9t9qKVsL-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05B8F2999B43;
 Tue, 30 Aug 2022 16:16:12 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4551415117;
 Tue, 30 Aug 2022 16:16:10 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v1 13/16] qapi: fix example of query-hotpluggable-cpus command
Date: Tue, 30 Aug 2022 18:15:42 +0200
Message-Id: <20220830161545.84198-14-victortoso@redhat.com>
In-Reply-To: <20220830161545.84198-1-victortoso@redhat.com>
References: <20220830161545.84198-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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


