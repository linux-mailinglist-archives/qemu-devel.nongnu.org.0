Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4F274C35
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:39:27 +0200 (CEST)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKqwY-00013F-Ew
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKqsu-0004EE-1Y
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKqss-0007cj-Cp
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HY4iHPLX+Mtqs4MtwyCFbQw0nV6/SF3Tme+QPV8lnWE=;
 b=UtG/i6b55LRmpw6+VIHwyXurFRim34/lZgmCivFaejuKY23ahFSvIB8Byz0mc9f5p9vOvm
 iswsy4O439K6d3PCCYiqJRS82LCly7i6TKwUBxy46hA2OMP8irXqUExnJxDBIzmjDL0xAY
 TjLP9gKwdPRUkjW/79VPiKsqGsXWRjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-wAUacH1bOYyLil5r-ogUwg-1; Tue, 22 Sep 2020 18:35:35 -0400
X-MC-Unique: wAUacH1bOYyLil5r-ogUwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2AEB186DD27;
 Tue, 22 Sep 2020 22:35:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA1A760BF4;
 Tue, 22 Sep 2020 22:35:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 07/26] qapi/parser.py: fully remove 'null' constant
Date: Tue, 22 Sep 2020 18:35:06 -0400
Message-Id: <20200922223525.4085762-8-jsnow@redhat.com>
In-Reply-To: <20200922223525.4085762-1-jsnow@redhat.com>
References: <20200922223525.4085762-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based on the docs, we don't support the null constant, and the code
agrees. There's a few remnants where callers check .tok for 'n', and
these can be removed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py                    | 8 ++++----
 tests/qapi-schema/leading-comma-list.err  | 2 +-
 tests/qapi-schema/trailing-comma-list.err | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 5a7233bc76..78355ca93f 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -274,9 +274,9 @@ def get_values(self):
         if self.tok == ']':
             self.accept()
             return expr
-        if self.tok not in "{['tfn":
+        if self.tok not in "{['tf":
             raise self._parse_error(
-                "expected '{', '[', ']', string, boolean or 'null'")
+                "expected '{', '[', ']', string, or boolean")
         while True:
             expr.append(self.get_expr(True))
             if self.tok == ']':
@@ -295,12 +295,12 @@ def get_expr(self, nested):
         elif self.tok == '[':
             self.accept()
             expr = self.get_values()
-        elif self.tok in "'tfn":
+        elif self.tok in "'tf":
             expr = self.val
             self.accept()
         else:
             raise self._parse_error(
-                "expected '{', '[', string, boolean or 'null'")
+                "expected '{', '[', string, or boolean")
         return expr
 
     def _get_doc(self, info):
diff --git a/tests/qapi-schema/leading-comma-list.err b/tests/qapi-schema/leading-comma-list.err
index 76eed2b5b3..0725d6529f 100644
--- a/tests/qapi-schema/leading-comma-list.err
+++ b/tests/qapi-schema/leading-comma-list.err
@@ -1 +1 @@
-leading-comma-list.json:2:13: expected '{', '[', ']', string, boolean or 'null'
+leading-comma-list.json:2:13: expected '{', '[', ']', string, or boolean
diff --git a/tests/qapi-schema/trailing-comma-list.err b/tests/qapi-schema/trailing-comma-list.err
index ad2f2d7c97..bb5f8c3c90 100644
--- a/tests/qapi-schema/trailing-comma-list.err
+++ b/tests/qapi-schema/trailing-comma-list.err
@@ -1 +1 @@
-trailing-comma-list.json:2:36: expected '{', '[', string, boolean or 'null'
+trailing-comma-list.json:2:36: expected '{', '[', string, or boolean
-- 
2.26.2


