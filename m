Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673B2DCCE0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 08:17:58 +0100 (CET)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpnXw-0003Xn-QD
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 02:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpnV9-0002ub-3d
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpnV6-0007kH-OX
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 02:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608189298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sy42yN206COdMqtae45DfhxkJxzZSW0JvbQVAKpApDY=;
 b=aFW2QzppqhCBL+mlg7zGujnDRszlQa2ULADMD9rvubrLGIjGK5fat/szgHmQvLtnhJRIbg
 fyC4gf0QeLquVcL45xRs06OVBVQ3J7JvsI5AEoN3hYMGq72ZQB3jAmuqreQMD9iHMenKYe
 f4OfiClUUueEtDJXmxsxk7H5P7Pb9l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-t5BpvfdSNCKHPk1UXLUODQ-1; Thu, 17 Dec 2020 02:14:56 -0500
X-MC-Unique: t5BpvfdSNCKHPk1UXLUODQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D73515720
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 07:14:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 448C260CEE;
 Thu, 17 Dec 2020 07:14:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFC0A11329A5; Thu, 17 Dec 2020 08:14:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel/migration: Improve debugging section a bit
Date: Thu, 17 Dec 2020 08:14:50 +0100
Message-Id: <20201217071450.701909-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: marcandre.lureau@redhat.com, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typos, and make the example work out of the box.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
2.26.2


