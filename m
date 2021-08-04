Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5B3DFFC8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:03:34 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBEgP-0004Up-LM
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBEdu-00024c-9R
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBEds-0002cK-Ct
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628074855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wX5OzPigr/0nFFNKgHtIs+VJnTwvmJ5AdIwoEk7NqwA=;
 b=G0REwv74MtS6p7t79AH3lsB9x9AT+RxOpmGARiEljLydk4AAwDmj8ZFrGn+qvGNnBtcnxb
 B9o3XZZjNRqFVPcqmM0fHCbMnVS5wwLuCoAKz1Ut5rDmXS5UGZ7cwEN1eZH1gcx8dJ4pw5
 L11pq5w74qNA1PKNO7/hzrA0cTDHC7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-FeHS7KdKPfWoiYtSf5JQhA-1; Wed, 04 Aug 2021 07:00:53 -0400
X-MC-Unique: FeHS7KdKPfWoiYtSf5JQhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2207B1966320;
 Wed,  4 Aug 2021 11:00:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D44860BF4;
 Wed,  4 Aug 2021 11:00:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Update broken links to point to the new page with
 deprecated features
Date: Wed,  4 Aug 2021 13:00:32 +0200
Message-Id: <20210804110032.191669-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The deprecated.html file has been moved from the "system" to the "about"
folder recently.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 _posts/2017-08-10-deprecation.md | 2 +-
 download.html                    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/_posts/2017-08-10-deprecation.md b/_posts/2017-08-10-deprecation.md
index 4d007fc..e76c04a 100644
--- a/_posts/2017-08-10-deprecation.md
+++ b/_posts/2017-08-10-deprecation.md
@@ -16,7 +16,7 @@ it.
 Thus we are currently considering to get rid of some of the old interfaces
 and features in a future release and have started to collect a list of such
 old items in our
-[QEMU documentation](https://qemu.org/docs/master/system/deprecated.html).
+[QEMU documentation](https://www.qemu.org/docs/master/about/deprecated.html).
 If you are running QEMU directly, please have a look at this deprecation
 chapter of the QEMU documentation to see whether you are still using one of
 these old interfaces or features, so you can adapt your setup to use the new
diff --git a/download.html b/download.html
index a2e4187..7df1bde 100644
--- a/download.html
+++ b/download.html
@@ -59,9 +59,9 @@ permalink: /download/
     <strong>do not</strong> have any bearing on the scope of changes
     included in the release. Non-backward compatible changes may be made
     in any master branch release, provided they have followed the
-    <a href="https://qemu.org/docs/master/system/deprecated.html">deprecation policy</a>
-    which calls for warnings to be emitted for a minimum of two releases
-    prior to the change.
+    <a href="https://www.qemu.org/docs/master/about/deprecated.html">deprecation
+    policy</a> which calls for warnings to be emitted for a minimum of two
+    releases prior to the change.
   </p>
 </div>
 <script>
-- 
2.27.0


