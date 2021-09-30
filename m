Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309CB41E2F2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 22:59:27 +0200 (CEST)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW39K-0001Kn-7P
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 16:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37S-0006tb-Dl
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37Q-0008Vf-Mm
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GS5VDi9xzUI5VOfRjL0L/Nzcx9R7MRvJGeqmfWwEi0=;
 b=ge1v4sDk0JyaFdW3xD2kCMadaEjCHP1I9wjK+gI+tPAzy6L+bdD3InB8Lo1kXOm0Kh+FUM
 k7gC9xcxC5P4MW53HjAlO2L56Sv3AtteXpqNFunOhEM8O2G0X5zvnO0y35Q2sqFhcqfU7v
 Z/FT1lpQ519mEq9Df/u0qfquxNV5VPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-4JBOAeoPMG--1vkYwoxxZA-1; Thu, 30 Sep 2021 16:57:25 -0400
X-MC-Unique: 4JBOAeoPMG--1vkYwoxxZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599F5802947;
 Thu, 30 Sep 2021 20:57:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3699C60936;
 Thu, 30 Sep 2021 20:57:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/13] qapi/parser: remove FIXME comment from
 _append_body_line
Date: Thu, 30 Sep 2021 16:57:08 -0400
Message-Id: <20210930205716.1148693-6-jsnow@redhat.com>
In-Reply-To: <20210930205716.1148693-1-jsnow@redhat.com>
References: <20210930205716.1148693-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
index bfd2dbfd9a2..23898ab1dcd 100644
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
index 81b90e882a7..aa51be41b2d 100644
--- a/tests/qapi-schema/doc-empty-symbol.err
+++ b/tests/qapi-schema/doc-empty-symbol.err
@@ -1 +1 @@
-doc-empty-symbol.json:4:1: invalid name
+doc-empty-symbol.json:4:1: name required after '@'
-- 
2.31.1


