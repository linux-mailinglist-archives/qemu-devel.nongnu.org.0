Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7614427D824
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 22:30:12 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNMGJ-0006mL-E5
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 16:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM6C-0001qK-Rh
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:19:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM64-0003Us-Nh
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:19:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601410776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40f9tgZFYep5/ErNI9LfjYixYwjmeRJrENUq4jNkvEQ=;
 b=d+5eq0C84yG+Qoid+XWsLKS7avGvdId0S6+SUMhjfL7z7jw2rhMeI60V52k4cc+zZ2C5L0
 VMAlMMWYuynjEZNPxW11DKT9uz8Y+2NZegZKOWhuEPa6BCiVQ+ZtKYi7o8mD5dlEbTYEaP
 qzkilHuisuuRsnOOTVx8TvqYy3dJlfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-4wJvenHqOCGZSEnJtAvfvA-1; Tue, 29 Sep 2020 16:19:32 -0400
X-MC-Unique: 4wJvenHqOCGZSEnJtAvfvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A5A510BBED1;
 Tue, 29 Sep 2020 20:19:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D0755C1C4;
 Tue, 29 Sep 2020 20:19:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D130C11358CF; Tue, 29 Sep 2020 22:19:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/29] qapi: Use rST markup for literal blocks
Date: Tue, 29 Sep 2020 22:19:15 +0200
Message-Id: <20200929201926.2155622-19-armbru@redhat.com>
In-Reply-To: <20200929201926.2155622-1-armbru@redhat.com>
References: <20200929201926.2155622-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

There are exactly two places in our json doc comments where we
use the markup accepted by the texi doc generator where a '|' in
the first line of a doc comment means the line should be emitted
as a literal block (fixed-width font, whitespace preserved).

Since we use this syntax so rarely, instead of making the rST
generator support it, instead just convert the two uses to
rST-format literal blocks, which are indented and introduced
with '::'.

(The rST generator doesn't complain about the old style syntax,
it just emits it with the '|' and with the whitespace not
preserved, which looks odd, but means we can safely leave this
change until after we've stopped generating texinfo.)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200925162316.21205-11-peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json  | 16 +++++++++-------
 qapi/qapi-schema.json |  6 ++++--
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index dd77a91174..86ed72ef9f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -570,13 +570,15 @@
 #        For the example above, @bins may be something like [3, 1, 5, 2],
 #        and corresponding histogram looks like:
 #
-# |      5|           *
-# |      4|           *
-# |      3| *         *
-# |      2| *         *    *
-# |      1| *    *    *    *
-# |       +------------------
-# |           10   50   100
+# ::
+#
+#        5|           *
+#        4|           *
+#        3| *         *
+#        2| *         *    *
+#        1| *    *    *    *
+#         +------------------
+#             10   50   100
 #
 # Since: 4.0
 ##
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 54c8ba6444..0c6ca5c000 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -21,8 +21,10 @@
 #
 # Example:
 #
-# | -> data issued by the Client
-# | <- Server data response
+# ::
+#
+#   -> data issued by the Client
+#   <- Server data response
 #
 # Please, refer to the QMP specification (docs/interop/qmp-spec.txt) for
 # detailed information on the Server command and response formats.
-- 
2.26.2


