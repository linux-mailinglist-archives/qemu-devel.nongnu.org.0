Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79453275680
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 12:39:21 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL2BE-0006aC-6p
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 06:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kL29j-0005hS-Dk
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 06:37:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31287
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kL29g-0006RG-Mb
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 06:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600857461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mvX5xugWIEjJw4+F8rmiVRDRWdJAKWxSfuR8Mm9ndJg=;
 b=PylZCCC1Oc1B2UYiSkNZICgXVtmUftMrKUfKNlG5XW25+uJ40SdfDlY+Dw6Op75gq55I4W
 vB8py+rOga1oCdYGRSmGr2qlRW20cio0AQPednFIiPZwcWKd13FF+/29f5iHCPr71yKod9
 DMo0AR0vOVKHcchWEHMY0varG9KVEC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-yJmIiC6xNH-k3L42caSaGA-1; Wed, 23 Sep 2020 06:37:39 -0400
X-MC-Unique: yJmIiC6xNH-k3L42caSaGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFE141006707
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 10:37:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A49935D9CC;
 Wed, 23 Sep 2020 10:37:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C3E719D5A; Wed, 23 Sep 2020 12:37:34 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] modules: update qom object module comment
Date: Wed, 23 Sep 2020 12:37:28 +0200
Message-Id: <20200923103728.12026-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 06:37:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 520986bd70ff..6eb1e917860e 100644
--- a/util/module.c
+++ b/util/module.c
@@ -255,8 +255,10 @@ bool module_load_one(const char *prefix, const char *lib_name)
  * only a very few devices & objects.
  *
  * So with the expectation that this will be rather the exception than
- * to rule and the list will not gain that many entries go with a
+ * the rule and the list will not gain that many entries, go with a
  * simple manually maintained list for now.
+ *
+ * The list must be sorted by module (module_load_qom_all() needs this).
  */
 static struct {
     const char *type;
-- 
2.27.0


