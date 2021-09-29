Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C37E41CCEA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:51:32 +0200 (CEST)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfc3-0007p5-8k
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWI-0007gs-Dv
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWF-0006X8-Ox
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbt2BBmASD3BBGEUtvZ/jnjqitVT1BlXIqz/f6NvVvQ=;
 b=Us0xakTwxL3xK15WaKLiNlrL4N8MfsjGK6lgQOeOqT+aYqI5qZWAS48dbgaIz5paB8c2ix
 yJn3U2Kvik6cVDmatWYY2ybJOQ200ICyb4+PoO0CSjpdONDGeS24h91UBf7fcCyv4K0Rt1
 wk+3s+I+UHxmKUgfvWx7yWABYtR84oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Nfxin3UfMuiRPL9x4krc9g-1; Wed, 29 Sep 2021 15:45:29 -0400
X-MC-Unique: Nfxin3UfMuiRPL9x4krc9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D8181C872;
 Wed, 29 Sep 2021 19:45:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F9026573;
 Wed, 29 Sep 2021 19:45:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] qapi/parser: remove FIXME comment from
 _append_body_line
Date: Wed, 29 Sep 2021 15:44:21 -0400
Message-Id: <20210929194428.1038496-7-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 scripts/qapi/parser.py                 | 6 ++++--
 tests/qapi-schema/doc-empty-symbol.err | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 2f93a752f66..52748e8e462 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -558,9 +558,11 @@ def _append_body_line(self, line):
                 raise QAPIParseError(
                     self._parser, "extra whitespace around symbol declaration")
             self.symbol = line[1:-1]
-            # FIXME invalid names other than the empty string aren't flagged
+            # Invalid names are not checked here, but the name provided MUST
+            # match the following definition, which *is* validated.
             if not self.symbol:
-                raise QAPIParseError(self._parser, "invalid name")
+                raise QAPIParseError(
+                    self._parser, "doc symbol name cannot be blank")
         elif self.symbol:
             # This is a definition documentation block
             name = line.split(' ', 1)[0]
diff --git a/tests/qapi-schema/doc-empty-symbol.err b/tests/qapi-schema/doc-empty-symbol.err
index 81b90e882a7..a4981ee28ea 100644
--- a/tests/qapi-schema/doc-empty-symbol.err
+++ b/tests/qapi-schema/doc-empty-symbol.err
@@ -1 +1 @@
-doc-empty-symbol.json:4:1: invalid name
+doc-empty-symbol.json:4:1: doc symbol name cannot be blank
-- 
2.31.1


