Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41441FAC9
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:07:35 +0200 (CEST)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbva-0003sj-0k
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblW-00018a-L3
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblQ-0004Uy-Pk
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrQNbndszkbyLnVgSiSsMNLAJoKPYsBG8U4pLvwlImo=;
 b=daPyszjfkgoj09t8PV6EqT12h4CUoVJOz6H3TBaIlqKnee3vZ5AJbAQhj/3os4/9kMvF9K
 cOpAEbF9eXI95OuZ2ZDwbCNeThfu/wUq3JxBCSbV1SvQowyWfc7bsG5PZ2j69vzP8aK0pw
 kUkoYwQ/EbF6Sn09RaMz5tfkiLUODoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-mWG9qA2WMmGt7dflj0-luA-1; Sat, 02 Oct 2021 05:56:59 -0400
X-MC-Unique: mWG9qA2WMmGt7dflj0-luA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 666CE1006AA2;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39C3660BF4;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CAB31138529; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] qapi/parser: remove FIXME comment from _append_body_line
Date: Sat,  2 Oct 2021 11:56:47 +0200
Message-Id: <20211002095655.1944970-6-armbru@redhat.com>
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
References: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

True, we do not check the validity of this symbol -- but we don't check
the validity of definition names during parse, either -- that happens
later, during the expr check. I don't want to introduce a dependency on
expr.py:check_name_str here and introduce a cycle.

Instead, rest assured that a documentation block is required for each
definition. This requirement uses the names of each section to ensure
that we fulfilled this requirement.

e.g., let's say that block-core.json has a comment block for
"Snapshot!Info" by accident. We'll see this error message:

In file included from ../../qapi/block.json:8:
../../qapi/block-core.json: In struct 'SnapshotInfo':
../../qapi/block-core.json:38: documentation comment is for 'Snapshot!Info'

That's a pretty decent error message.

Now, let's say that we actually mangle it twice, identically:

../../qapi/block-core.json: In struct 'Snapshot!Info':
../../qapi/block-core.json:38: struct has an invalid name

That's also pretty decent. If we forget to fix it in both places, we'll
just be back to the first error.

Therefore, let's just drop this FIXME and adjust the error message to
not imply a more thorough check than is actually performed.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210930205716.1148693-6-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py                 | 6 ++++--
 tests/qapi-schema/doc-empty-symbol.err | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index bfd2dbfd9a..23898ab1dc 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -556,9 +556,11 @@ def _append_body_line(self, line):
             if not line.endswith(':'):
                 raise QAPIParseError(self._parser, "line should end with ':'")
             self.symbol = line[1:-1]
-            # FIXME invalid names other than the empty string aren't flagged
+            # Invalid names are not checked here, but the name provided MUST
+            # match the following definition, which *is* validated in expr.py.
             if not self.symbol:
-                raise QAPIParseError(self._parser, "invalid name")
+                raise QAPIParseError(
+                    self._parser, "name required after '@'")
         elif self.symbol:
             # This is a definition documentation block
             if name.startswith('@') and name.endswith(':'):
diff --git a/tests/qapi-schema/doc-empty-symbol.err b/tests/qapi-schema/doc-empty-symbol.err
index 81b90e882a..aa51be41b2 100644
--- a/tests/qapi-schema/doc-empty-symbol.err
+++ b/tests/qapi-schema/doc-empty-symbol.err
@@ -1 +1 @@
-doc-empty-symbol.json:4:1: invalid name
+doc-empty-symbol.json:4:1: name required after '@'
-- 
2.31.1


