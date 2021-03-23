Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46CC346BFC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:17:49 +0100 (CET)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpLQ-0008BG-U8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1p-0007Re-Kk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1R-0002nu-5R
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xpZanZqGb7TazAu0Z6lqnwzuWa8Bs2h1wE77WIvK9c=;
 b=gpxf4U04bijNW/vS0XGvleAPFXceDjGesxpbI/R6T9erhhTG09t3t03d/EgI/cIfTcsr/+
 OWOZQVT/cmJT4yNulQGi/fWSfUyo2NrlyFKFQif7FfFOAaRqkdZRbHYNivkB5csu2vSx1O
 ZVDME62afVNG8KHGICeBovh9nXLrRCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-BZko93RxMUqUQT_zokf34g-1; Tue, 23 Mar 2021 17:57:05 -0400
X-MC-Unique: BZko93RxMUqUQT_zokf34g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E99101B2C983;
 Tue, 23 Mar 2021 21:57:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 319FF1F41B;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C174811326A4; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] tests/qapi-schema: Rename pragma-*-crap to
 pragma-value-not-*
Date: Tue, 23 Mar 2021 22:56:46 +0100
Message-Id: <20210323215658.3840228-18-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename pragma-doc-required-crap to pragma-not-bool,
pragma-returns-whitelist-crap to pragma-value-not-list, and
pragma-name-case-whitelist-crap to pragma-value-not-list-of-str.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-18-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qapi-schema/meson.build                               | 6 +++---
 tests/qapi-schema/pragma-doc-required-crap.err              | 1 -
 tests/qapi-schema/pragma-name-case-whitelist-crap.err       | 1 -
 tests/qapi-schema/pragma-returns-whitelist-crap.err         | 1 -
 tests/qapi-schema/pragma-value-not-bool.err                 | 1 +
 ...ma-doc-required-crap.json => pragma-value-not-bool.json} | 2 +-
 ...agma-doc-required-crap.out => pragma-value-not-bool.out} | 0
 tests/qapi-schema/pragma-value-not-list-of-str.err          | 1 +
 ...hitelist-crap.json => pragma-value-not-list-of-str.json} | 2 +-
 ...-whitelist-crap.out => pragma-value-not-list-of-str.out} | 0
 tests/qapi-schema/pragma-value-not-list.err                 | 1 +
 ...-case-whitelist-crap.json => pragma-value-not-list.json} | 2 +-
 ...returns-whitelist-crap.out => pragma-value-not-list.out} | 0
 13 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 tests/qapi-schema/pragma-doc-required-crap.err
 delete mode 100644 tests/qapi-schema/pragma-name-case-whitelist-crap.err
 delete mode 100644 tests/qapi-schema/pragma-returns-whitelist-crap.err
 create mode 100644 tests/qapi-schema/pragma-value-not-bool.err
 rename tests/qapi-schema/{pragma-doc-required-crap.json => pragma-value-not-bool.json} (55%)
 rename tests/qapi-schema/{pragma-doc-required-crap.out => pragma-value-not-bool.out} (100%)
 create mode 100644 tests/qapi-schema/pragma-value-not-list-of-str.err
 rename tests/qapi-schema/{pragma-returns-whitelist-crap.json => pragma-value-not-list-of-str.json} (57%)
 rename tests/qapi-schema/{pragma-name-case-whitelist-crap.out => pragma-value-not-list-of-str.out} (100%)
 create mode 100644 tests/qapi-schema/pragma-value-not-list.err
 rename tests/qapi-schema/{pragma-name-case-whitelist-crap.json => pragma-value-not-list.json} (50%)
 rename tests/qapi-schema/{pragma-returns-whitelist-crap.out => pragma-value-not-list.out} (100%)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 664f9ee22d..ffc276b765 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -144,12 +144,12 @@ schemas = [
   'oob-coroutine.json',
   'oob-test.json',
   'allow-preconfig-test.json',
-  'pragma-doc-required-crap.json',
   'pragma-extra-junk.json',
-  'pragma-name-case-whitelist-crap.json',
   'pragma-non-dict.json',
   'pragma-unknown.json',
-  'pragma-returns-whitelist-crap.json',
+  'pragma-value-not-bool.json',
+  'pragma-value-not-list-of-str.json',
+  'pragma-value-not-list.json',
   'qapi-schema-test.json',
   'quoted-structural-chars.json',
   'redefined-command.json',
diff --git a/tests/qapi-schema/pragma-doc-required-crap.err b/tests/qapi-schema/pragma-doc-required-crap.err
deleted file mode 100644
index 717062cb14..0000000000
--- a/tests/qapi-schema/pragma-doc-required-crap.err
+++ /dev/null
@@ -1 +0,0 @@
-pragma-doc-required-crap.json:3: pragma 'doc-required' must be boolean
diff --git a/tests/qapi-schema/pragma-name-case-whitelist-crap.err b/tests/qapi-schema/pragma-name-case-whitelist-crap.err
deleted file mode 100644
index fbea90d6c5..0000000000
--- a/tests/qapi-schema/pragma-name-case-whitelist-crap.err
+++ /dev/null
@@ -1 +0,0 @@
-pragma-name-case-whitelist-crap.json:3: pragma name-case-whitelist must be a list of strings
diff --git a/tests/qapi-schema/pragma-returns-whitelist-crap.err b/tests/qapi-schema/pragma-returns-whitelist-crap.err
deleted file mode 100644
index 69784259df..0000000000
--- a/tests/qapi-schema/pragma-returns-whitelist-crap.err
+++ /dev/null
@@ -1 +0,0 @@
-pragma-returns-whitelist-crap.json:3: pragma returns-whitelist must be a list of strings
diff --git a/tests/qapi-schema/pragma-value-not-bool.err b/tests/qapi-schema/pragma-value-not-bool.err
new file mode 100644
index 0000000000..6247539616
--- /dev/null
+++ b/tests/qapi-schema/pragma-value-not-bool.err
@@ -0,0 +1 @@
+pragma-value-not-bool.json:3: pragma 'doc-required' must be boolean
diff --git a/tests/qapi-schema/pragma-doc-required-crap.json b/tests/qapi-schema/pragma-value-not-bool.json
similarity index 55%
rename from tests/qapi-schema/pragma-doc-required-crap.json
rename to tests/qapi-schema/pragma-value-not-bool.json
index ed763c5ffc..feb489f15b 100644
--- a/tests/qapi-schema/pragma-doc-required-crap.json
+++ b/tests/qapi-schema/pragma-value-not-bool.json
@@ -1,3 +1,3 @@
-# 'doc-required' must be bool
+# pragma value must be bool
 
 { 'pragma': { 'doc-required': {} } }
diff --git a/tests/qapi-schema/pragma-doc-required-crap.out b/tests/qapi-schema/pragma-value-not-bool.out
similarity index 100%
rename from tests/qapi-schema/pragma-doc-required-crap.out
rename to tests/qapi-schema/pragma-value-not-bool.out
diff --git a/tests/qapi-schema/pragma-value-not-list-of-str.err b/tests/qapi-schema/pragma-value-not-list-of-str.err
new file mode 100644
index 0000000000..44870fe5d9
--- /dev/null
+++ b/tests/qapi-schema/pragma-value-not-list-of-str.err
@@ -0,0 +1 @@
+pragma-value-not-list-of-str.json:3: pragma returns-whitelist must be a list of strings
diff --git a/tests/qapi-schema/pragma-returns-whitelist-crap.json b/tests/qapi-schema/pragma-value-not-list-of-str.json
similarity index 57%
rename from tests/qapi-schema/pragma-returns-whitelist-crap.json
rename to tests/qapi-schema/pragma-value-not-list-of-str.json
index f6b81b093f..12bbbed2e8 100644
--- a/tests/qapi-schema/pragma-returns-whitelist-crap.json
+++ b/tests/qapi-schema/pragma-value-not-list-of-str.json
@@ -1,3 +1,3 @@
-# 'returns-whitelist' must be list of strings
+# pragma value must be list of strings
 
 { 'pragma': { 'returns-whitelist': [ 'good', [ 'bad' ] ] } }
diff --git a/tests/qapi-schema/pragma-name-case-whitelist-crap.out b/tests/qapi-schema/pragma-value-not-list-of-str.out
similarity index 100%
rename from tests/qapi-schema/pragma-name-case-whitelist-crap.out
rename to tests/qapi-schema/pragma-value-not-list-of-str.out
diff --git a/tests/qapi-schema/pragma-value-not-list.err b/tests/qapi-schema/pragma-value-not-list.err
new file mode 100644
index 0000000000..21736c5723
--- /dev/null
+++ b/tests/qapi-schema/pragma-value-not-list.err
@@ -0,0 +1 @@
+pragma-value-not-list.json:3: pragma name-case-whitelist must be a list of strings
diff --git a/tests/qapi-schema/pragma-name-case-whitelist-crap.json b/tests/qapi-schema/pragma-value-not-list.json
similarity index 50%
rename from tests/qapi-schema/pragma-name-case-whitelist-crap.json
rename to tests/qapi-schema/pragma-value-not-list.json
index 734e1c617b..2c61a97dd3 100644
--- a/tests/qapi-schema/pragma-name-case-whitelist-crap.json
+++ b/tests/qapi-schema/pragma-value-not-list.json
@@ -1,3 +1,3 @@
-# 'name-case-whitelist' must be list of strings
+# pragma value must be list
 
 { 'pragma': { 'name-case-whitelist': false } }
diff --git a/tests/qapi-schema/pragma-returns-whitelist-crap.out b/tests/qapi-schema/pragma-value-not-list.out
similarity index 100%
rename from tests/qapi-schema/pragma-returns-whitelist-crap.out
rename to tests/qapi-schema/pragma-value-not-list.out
-- 
2.26.3


