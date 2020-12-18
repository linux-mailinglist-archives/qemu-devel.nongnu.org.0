Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D602DE6C7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:40:24 +0100 (CET)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHrj-0008Ke-NM
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS4-0002m8-QB
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHS2-0005YG-1X
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFaj4vG+3JigRX7CV2Nf7Y5YVospHy1rjKNyw3vchPA=;
 b=SmgVwqD11TyOhZFAGugXJLdp65kDegno6vNbvO0PTdYFtc/d7pMhjmImg6CJem1OSay1wQ
 a4OLZxqt6yxLft7Qrrux3gNB9WkwCzfyfCZs57L6Vvoio+OpmKggguf6yyH2ynruz8EL2B
 xGzQNJk58lUoUQN2USDCImtabWH8AHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-aB-8zljbPpia8m1OpyWFCw-1; Fri, 18 Dec 2020 10:13:47 -0500
X-MC-Unique: aB-8zljbPpia8m1OpyWFCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44F1A190B2A0;
 Fri, 18 Dec 2020 15:13:46 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AFB614FF;
 Fri, 18 Dec 2020 15:13:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/30] simplebench/results_to_text: make executable
Date: Fri, 18 Dec 2020 16:12:43 +0100
Message-Id: <20201218151249.715731-25-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Make results_to_text a tool to dump results saved in JSON file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-21-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 scripts/simplebench/results_to_text.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 mode change 100644 => 100755 scripts/simplebench/results_to_text.py

diff --git a/scripts/simplebench/results_to_text.py b/scripts/simplebench/results_to_text.py
old mode 100644
new mode 100755
index e46940fdf2..d561e5e2db
--- a/scripts/simplebench/results_to_text.py
+++ b/scripts/simplebench/results_to_text.py
@@ -1,3 +1,5 @@
+#!/usr/bin/env python3
+#
 # Simple benchmarking framework
 #
 # Copyright (c) 2019 Virtuozzo International GmbH.
@@ -110,3 +112,15 @@ def results_to_text(results):
         tab.append(row)
 
     return f'All results are in {dim}\n\n' + tabulate.tabulate(tab)
+
+
+if __name__ == '__main__':
+    import sys
+    import json
+
+    if len(sys.argv) < 2:
+        print(f'USAGE: {sys.argv[0]} results.json')
+        exit(1)
+
+    with open(sys.argv[1]) as f:
+        print(results_to_text(json.load(f)))
-- 
2.29.2


