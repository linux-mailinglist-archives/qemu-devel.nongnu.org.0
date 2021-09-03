Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 451FA40061B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:49:59 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFCI-0004EL-AL
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvM-0005xs-4Y
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mMEvK-0003hM-CK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630697545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k0ZkL//WewHwyhqypAwyHjGL6um2gnP23oBFyE94eTE=;
 b=F56sz6Soz+UvaJ4X7TKPsla3JDGynmB54+NJhgC7FaEFHErx4ZT5UVUZCEQJIvYtxqqd/o
 C+4NRSgqMYdyVtSZfuIoPC2NsyRAzKT/lkX+IZKLjJWjqtbgxxrF0CFzl2c5iOcxV3SxBn
 0k/olO4Q/qU1th7sr0Eu6GpvPJl5H6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-LEoHCQD5O7m8OD_F8isEMg-1; Fri, 03 Sep 2021 15:32:22 -0400
X-MC-Unique: LEoHCQD5O7m8OD_F8isEMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5154884A5E1;
 Fri,  3 Sep 2021 19:32:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35FE55C1C5;
 Fri,  3 Sep 2021 19:32:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0B27D11380D0; Fri,  3 Sep 2021 21:32:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] qapi: Tweak error messages for unknown / conflicting
 'if' keys
Date: Fri,  3 Sep 2021 21:32:09 +0200
Message-Id: <20210903193209.1426791-14-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
References: <20210903193209.1426791-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210831123809.1107782-13-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/expr.py                  | 7 +++----
 tests/qapi-schema/bad-if-key.err      | 2 +-
 tests/qapi-schema/bad-if-keys.err     | 2 +-
 tests/qapi-schema/enum-if-invalid.err | 2 +-
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index ae4437ba08..b62f0a3640 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -286,13 +286,12 @@ def _check_if(cond: Union[str, object]) -> None:
             raise QAPISemError(
                 info,
                 "'if' condition of %s must be a string or an object" % source)
+        check_keys(cond, info, "'if' condition of %s" % source, [],
+                   ["all", "any", "not"])
         if len(cond) != 1:
             raise QAPISemError(
                 info,
-                "'if' condition dict of %s must have one key: "
-                "'all', 'any' or 'not'" % source)
-        check_keys(cond, info, "'if' condition", [],
-                   ["all", "any", "not"])
+                "'if' condition of %s has conflicting keys" % source)
 
         oper, operands = next(iter(cond.items()))
         if not operands:
diff --git a/tests/qapi-schema/bad-if-key.err b/tests/qapi-schema/bad-if-key.err
index a69dc9ee86..38cf44b687 100644
--- a/tests/qapi-schema/bad-if-key.err
+++ b/tests/qapi-schema/bad-if-key.err
@@ -1,3 +1,3 @@
 bad-if-key.json: In struct 'TestIfStruct':
-bad-if-key.json:2: 'if' condition has unknown key 'value'
+bad-if-key.json:2: 'if' condition of struct has unknown key 'value'
 Valid keys are 'all', 'any', 'not'.
diff --git a/tests/qapi-schema/bad-if-keys.err b/tests/qapi-schema/bad-if-keys.err
index aceb31dc6d..fe87bd30ac 100644
--- a/tests/qapi-schema/bad-if-keys.err
+++ b/tests/qapi-schema/bad-if-keys.err
@@ -1,2 +1,2 @@
 bad-if-keys.json: In struct 'TestIfStruct':
-bad-if-keys.json:2: 'if' condition dict of struct must have one key: 'all', 'any' or 'not'
+bad-if-keys.json:2: 'if' condition of struct has conflicting keys
diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/enum-if-invalid.err
index 3bb84075a9..2b2bbffb65 100644
--- a/tests/qapi-schema/enum-if-invalid.err
+++ b/tests/qapi-schema/enum-if-invalid.err
@@ -1,3 +1,3 @@
 enum-if-invalid.json: In enum 'TestIfEnum':
-enum-if-invalid.json:2: 'if' condition has unknown key 'val'
+enum-if-invalid.json:2: 'if' condition of 'data' member 'bar' has unknown key 'val'
 Valid keys are 'all', 'any', 'not'.
-- 
2.31.1


