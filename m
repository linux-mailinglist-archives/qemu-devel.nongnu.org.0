Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB860C6C6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:45:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVk-0002yS-6o; Tue, 25 Oct 2022 04:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwz-0004hz-JG
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwV-0007uO-Tc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z92wlYHzG8YqVuZjM+YtEkhEmcCuepev65oIpiHr1Xs=;
 b=QbkNLwUnferPNAJ3cQEcCvRynmr+8IsV9HmeNQ1Fb3ZCd/oWYjXVHEe246TqABHXUi4xLm
 Sbll3b57+SW2Kzfx9vx0+xxPzor0yJSqql+Qnmn2EZuNNMc6qRQ77fC486ytDNME9e/1wV
 Vb5i02ZWcgK+ZR/a4iQVRDdiZghGJOo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-l6U1EQS_MgSvkR0OTvB2OQ-1; Tue, 25 Oct 2022 04:05:42 -0400
X-MC-Unique: l6U1EQS_MgSvkR0OTvB2OQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47F19185A7A9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:05:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195C42166B2A;
 Tue, 25 Oct 2022 08:05:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1988121E66CB; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 02/28] qapi: Tidy up whitespace in generated code
Date: Tue, 25 Oct 2022 10:05:15 +0200
Message-Id: <20221025080541.271547-3-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221018062849.3420573-3-armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 1 -
 scripts/qapi/commands.py     | 7 +++----
 scripts/qapi/events.py       | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 997313fce7..b56ea4546d 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1664,7 +1664,6 @@ Example::
     $ cat qapi-generated/example-qapi-commands.c
     [Uninteresting stuff omitted...]
 
-
     static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in,
                                     QObject **ret_out, Error **errp)
     {
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 38ca38a7b9..cf68aaf0bf 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -83,7 +83,7 @@ def gen_call(name: str,
 
         trace_qmp_enter_%(name)s(req_json->str);
     }
-    ''',
+''',
                      upper=upper, name=name)
 
     ret += mcgen('''
@@ -124,13 +124,13 @@ def gen_call(name: str,
 
         trace_qmp_exit_%(name)s(ret_json->str, true);
     }
-    ''',
+''',
                          upper=upper, name=name)
         else:
             ret += mcgen('''
 
     trace_qmp_exit_%(name)s("{}", true);
-    ''',
+''',
                          name=name)
 
     return ret
@@ -316,7 +316,6 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/error.h"
 #include "%(visit)s.h"
 #include "%(commands)s.h"
-
 ''',
                              commands=commands, visit=visit))
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 27b44c49f5..e762d53d19 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -196,7 +196,6 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp-event.h"
-
 ''',
                              events=events, visit=visit,
                              prefix=self._prefix))
-- 
2.37.3


