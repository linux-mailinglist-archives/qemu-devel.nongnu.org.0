Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097D348913
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:27:30 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJSr-00018P-Ig
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6a-0002RJ-QV
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6U-0008Vh-Tk
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sw7R1cBgJixnLWr9WuPasbIbALSCCoW/WdvKs56ryik=;
 b=J/iiPEqnQyp8x0kkZW/w47gfJ18tuaF5l8zFbdkNSLOySua1bJHg0WDBdCxu4vABQX0KCn
 czbOkkB+G2jL+/3vX1AiuuOGnFexCIZx0GY1+mVNlPolt8aCVKO9znnBipKASo2fhrp5iU
 1/12ZyH6RhF6q51cY0JIH2J/tMObwWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-qZos7H-rOhe4vjgLr3MYPQ-1; Thu, 25 Mar 2021 02:04:17 -0400
X-MC-Unique: qZos7H-rOhe4vjgLr3MYPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 533168042BE;
 Thu, 25 Mar 2021 06:04:16 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75FC866C7;
 Thu, 25 Mar 2021 06:04:15 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 14/19] qapi/expr.py: Remove single-letter variable
Date: Thu, 25 Mar 2021 02:03:51 -0400
Message-Id: <20210325060356.4040114-15-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 5921fa34ab..1869ddf815 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -233,14 +233,14 @@ def check_features(features: Optional[object],
         raise QAPISemError(info, "'features' must be an array")
     features[:] = [f if isinstance(f, dict) else {'name': f}
                    for f in features]
-    for f in features:
+    for feat in features:
         source = "'features' member"
-        assert isinstance(f, dict)
-        check_keys(f, info, source, ['name'], ['if'])
-        check_name_is_str(f['name'], info, source)
-        source = "%s '%s'" % (source, f['name'])
-        check_name_lower(f['name'], info, source)
-        check_if(f, info, source)
+        assert isinstance(feat, dict)
+        check_keys(feat, info, source, ['name'], ['if'])
+        check_name_is_str(feat['name'], info, source)
+        source = "%s '%s'" % (source, feat['name'])
+        check_name_str(feat['name'], info, source)
+        check_if(feat, info, source)
 
 
 def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
-- 
2.30.2


