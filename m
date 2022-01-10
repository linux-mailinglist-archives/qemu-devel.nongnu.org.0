Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6748A3A0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:28:04 +0100 (CET)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7455-0004AZ-2B
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:28:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n743A-0001B2-Vv
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7439-0007vH-Cs
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GAkPbAP3QTtD8i7jq4aPj7bx9HsKuinWnJaYnfoWiE=;
 b=hD30qacqy3460LiiPbk04jej8HiS41tKw3yOcCqxvCnwvr49EsYM0bE3oZLqRm09xA0DfZ
 8ag/9DPPOJpaZUbsfe69Q1sd3GVVTmjLxAQ9jawbFz+8ZGAXxg3R7rosa4xHd2s16BXItb
 gCf8uHmX1fRBO9YpfXrjOSnvs+CfIXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-WQ3417FFNeSVh0iy5K91PQ-1; Mon, 10 Jan 2022 18:25:59 -0500
X-MC-Unique: WQ3417FFNeSVh0iy5K91PQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9C242F25;
 Mon, 10 Jan 2022 23:25:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD175E27A;
 Mon, 10 Jan 2022 23:25:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] simplebench: Fix Python syntax error (reported by LGTM)
Date: Mon, 10 Jan 2022 18:25:21 -0500
Message-Id: <20220110232521.1922962-5-jsnow@redhat.com>
In-Reply-To: <20220110232521.1922962-1-jsnow@redhat.com>
References: <20220110232521.1922962-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20220107153019.504124-1-sw@weilnetz.de
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench-example.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
index 4864435f39..fc370691e0 100644
--- a/scripts/simplebench/bench-example.py
+++ b/scripts/simplebench/bench-example.py
@@ -25,7 +25,7 @@
 
 def bench_func(env, case):
     """ Handle one "cell" of benchmarking table. """
-    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
+    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
                             case['source'], case['target'])
 
 
-- 
2.31.1


