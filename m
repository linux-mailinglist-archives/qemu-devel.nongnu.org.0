Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E989367295
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:32:17 +0200 (CEST)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHe4-0002O5-I2
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTD-0002eo-Vo
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT6-0003jJ-Ip
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cwfQBjf9lsMKoyMGuJA5u2wvERoemFHLtBrUwqTk/k=;
 b=NteEpw5JqHgLzpPw62M9zkQ2818Vy5ThmjGjYgVj0AoqLuBtkPbkn6nzVr6++D3yLxLlDb
 gZvW9O1yYfb0KBCBD9MneELRfWo8aOmE61oRj0DhfSy2YJ1U/R1Lf366y2ari5tkiQYuOp
 JXNmEDmNapHUfzMkJEdeLO9vhAaB5m4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-J8FAnJenOH2jLS3LDhIvgg-1; Wed, 21 Apr 2021 14:20:52 -0400
X-MC-Unique: J8FAnJenOH2jLS3LDhIvgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A26B18B6142;
 Wed, 21 Apr 2021 18:20:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 589D419701;
 Wed, 21 Apr 2021 18:20:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 12/17] qapi/expr.py: Remove single-letter variable
Date: Wed, 21 Apr 2021 14:20:27 -0400
Message-Id: <20210421182032.3521476-13-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
index de7fc16fac2..5e4d5f80aa7 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -238,14 +238,14 @@ def check_features(features: Optional[object],
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


