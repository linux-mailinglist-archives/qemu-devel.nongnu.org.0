Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9E433B02
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:46:19 +0200 (CEST)
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrJi-0004aH-9u
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQk-0001R5-KY
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQf-000816-Tp
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFN5HkVnwSJHDwa5VA8vEXZe4FujxOdTMuaJiULY1Ns=;
 b=Et9SFew6/zAZBOxDEAIQI9e2v7+aHevdEnjpywXEJcFZERR7NdZRlCbcaGQuyr+8HneIhQ
 WfefX6pdfq/QrhtFEFDUjXZlWocLNfAMfWjQdPS0QkJZJqkNNwYKGIEZmfbvfGnsA7XRrd
 HlzwicgwACNH/L5twU/IkWyXzfuObcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-a4P1Nm3KOlmlZ-bWGHZ8jA-1; Tue, 19 Oct 2021 10:49:22 -0400
X-MC-Unique: a4P1Nm3KOlmlZ-bWGHZ8jA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 250F711B4C00;
 Tue, 19 Oct 2021 14:49:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27A005F4E0;
 Tue, 19 Oct 2021 14:49:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] iotests/297: Move pylint config into pylintrc
Date: Tue, 19 Oct 2021 10:49:04 -0400
Message-Id: <20211019144918.3159078-2-jsnow@redhat.com>
In-Reply-To: <20211019144918.3159078-1-jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move --score=n and --notes=XXX,FIXME into pylintrc. This pulls
configuration out of code, which I think is probably a good thing in
general.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/297      |  4 +---
 tests/qemu-iotests/pylintrc | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 91ec34d9521..bc3a0ceb2aa 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -65,10 +65,8 @@ def run_linters():
     print('=== pylint ===')
     sys.stdout.flush()
 
-    # Todo notes are fine, but fixme's or xxx's should probably just be
-    # fixed (in tests, at least)
     env = os.environ.copy()
-    subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
+    subprocess.run(('pylint-3', *files),
                    env=env, check=False)
 
     print('=== mypy ===')
diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index 8cb4e1d6a6d..32ab77b8bb9 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -31,6 +31,22 @@ disable=invalid-name,
         too-many-statements,
         consider-using-f-string,
 
+
+[REPORTS]
+
+# Activate the evaluation score.
+score=no
+
+
+[MISCELLANEOUS]
+
+# List of note tags to take in consideration, separated by a comma.
+# TODO notes are fine, but FIXMEs or XXXs should probably just be
+# fixed (in tests, at least).
+notes=FIXME,
+      XXX,
+
+
 [FORMAT]
 
 # Maximum number of characters on a single line.
-- 
2.31.1


