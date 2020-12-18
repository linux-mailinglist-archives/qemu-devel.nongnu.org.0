Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A92DE1C9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:09:50 +0100 (CET)
Received: from localhost ([::1]:43130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDdt-0003Jy-6b
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDD3-0003xC-SD
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDD0-0004h6-Hq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqkVfgLcyetc/UYffZiuz9r4dOhDMExN8KlzSzUwKBE=;
 b=dF18M+sO0gnSGTtW4n2Q7tAB371HHncHlsuWts/WriMSeWBJP3lFWYBYTNJZFp8gM1c+/Q
 gCKn5kPSS0StvQ3RQ0BDzWTFs6B1W5RkKF+3U1rpsIxzsBTWb4hfGYyqjQ71vPRG1SXdrT
 lPdetU+8/3zVtW0PDh3BkedRwWHkQJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Uth777BPO5il57-Fc3-C5A-1; Fri, 18 Dec 2020 05:41:57 -0500
X-MC-Unique: Uth777BPO5il57-Fc3-C5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E77801817;
 Fri, 18 Dec 2020 10:41:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62C9160C15;
 Fri, 18 Dec 2020 10:41:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 12/15] docs/devel/migration: Improve debugging section a bit
Date: Fri, 18 Dec 2020 10:41:14 +0000
Message-Id: <20201218104117.199096-13-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Fix typos, and make the example work out of the box.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217071450.701909-1-armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/devel/migration.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 49112bb27a..ad381b89b2 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -53,22 +53,23 @@ savevm/loadvm functionality.
 Debugging
 =========
 
-The migration stream can be analyzed thanks to `scripts/analyze_migration.py`.
+The migration stream can be analyzed thanks to `scripts/analyze-migration.py`.
 
 Example usage:
 
 .. code-block:: shell
 
-  $ qemu-system-x86_64
-   (qemu) migrate "exec:cat > mig"
-  $ ./scripts/analyze_migration.py -f mig
+  $ qemu-system-x86_64 -display none -monitor stdio
+  (qemu) migrate "exec:cat > mig"
+  (qemu) q
+  $ ./scripts/analyze-migration.py -f mig
   {
     "ram (3)": {
         "section sizes": {
             "pc.ram": "0x0000000008000000",
   ...
 
-See also ``analyze_migration.py -h`` help for more options.
+See also ``analyze-migration.py -h`` help for more options.
 
 Common infrastructure
 =====================
-- 
2.29.2


