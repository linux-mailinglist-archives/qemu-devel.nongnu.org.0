Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE673C19A3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:11:51 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZR8-00051M-68
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Yyt-0008Ku-Ig
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:42:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Yyr-0004tE-UK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qOUSl0l0XNjkWfeN5aBCTGWcXvG0ZNR6FGwTACUju+Y=;
 b=RNvO77AxnFLa0AZnfnQ3AvyYZETDsfLubh07DvDHpT3pvfyIVzqSy7fSEyWFKVHLv/n1qA
 33hLPXOAComCfO3sQPmAfx/4giKG3w77pRajmus/OD4b44GKg4Hq6+iZ0IUEfOihZIzf1x
 unEKwJ8VDsfIzIW/HnMXhWOHupdpKnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-KzsNkfLPNfi-v39Ju-Crrw-1; Thu, 08 Jul 2021 14:42:34 -0400
X-MC-Unique: KzsNkfLPNfi-v39Ju-Crrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE5E1100C674
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:42:33 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 748E619D9F;
 Thu,  8 Jul 2021 18:42:33 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] contrib: add stub bridge.conf for qemu-bridge-helper
Date: Thu,  8 Jul 2021 14:42:24 -0400
Message-Id: <ee9afe9119004f9208eb0930e02138eed0873f43.1625769632.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The comment comes from OpenSUSE's bridge.conf, with some minor tweaks

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
Or should this be installed? If so where in git should it live?

 contrib/bridge.conf | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 contrib/bridge.conf

diff --git a/contrib/bridge.conf b/contrib/bridge.conf
new file mode 100644
index 0000000000..b83e46c34f
--- /dev/null
+++ b/contrib/bridge.conf
@@ -0,0 +1,14 @@
+# Access control file for qemu-bridge-helper
+# https://wiki.qemu.org/Features/HelperNetworking
+#
+# Syntax consists of:
+#   # comment (ignored)
+#   allow all
+#   allow <bridge_name>
+#   deny all
+#   deny <bridge_name>
+#   include /path/to/additional/ACL/file
+#
+# Users are blacklisted by default and 'deny' takes precedence over 'allow'.
+# Including additional ACL files allows file access permissions to be used as
+# a component of the policy to allow access or deny access to specific bridges.
-- 
2.31.1


