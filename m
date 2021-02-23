Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD97322344
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:44:37 +0100 (CET)
Received: from localhost ([::1]:53560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELoa-0003Zx-Q7
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgc-0002DC-KO
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELeg-0005N4-75
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znM4lXZQcNIpQy212wOqWagwMWra20PZb3sCvjr3AX4=;
 b=HH99iC052Od62wf3bH8B0JwjlpDWJgHHAI2rqED2eenAOHQVfDbF9/ADMF65Fe2F2ew330
 +wOBB/lFEhlYOCEwgcA4JBzTBKtb60c0qPwYhKR/KxWLe6K/TmZySERvKtPpEyGeVtA+xe
 V6ZfihnBrq00BWuNvmXOyM2/KjvEQkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-dg7L6HV0OWGhJXIH2OeQTg-1; Mon, 22 Feb 2021 19:34:19 -0500
X-MC-Unique: dg7L6HV0OWGhJXIH2OeQTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D24BA186DD21;
 Tue, 23 Feb 2021 00:34:18 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC3A5D6D5;
 Tue, 23 Feb 2021 00:34:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 10/16] qapi/expr.py: Remove single-letter variable
Date: Mon, 22 Feb 2021 19:34:02 -0500
Message-Id: <20210223003408.964543-11-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3235a3b809e..473ee4f7f7e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -214,14 +214,14 @@ def check_features(features: Optional[object],
         raise QAPISemError(info, "'features' must be an array")
     features[:] = [f if isinstance(f, dict) else {'name': f}
                    for f in features]
-    for f in features:
+    for feature in features:
         source = "'features' member"
-        assert isinstance(f, dict)
-        check_keys(f, info, source, ['name'], ['if'])
-        check_name_is_str(f['name'], info, source)
-        source = "%s '%s'" % (source, f['name'])
-        check_name_str(f['name'], info, source)
-        check_if(f, info, source)
+        assert isinstance(feature, dict)
+        check_keys(feature, info, source, ['name'], ['if'])
+        check_name_is_str(feature['name'], info, source)
+        source = "%s '%s'" % (source, feature['name'])
+        check_name_str(feature['name'], info, source)
+        check_if(feature, info, source)
 
 
 def check_enum(expr: Expression, info: QAPISourceInfo) -> None:
-- 
2.29.2


