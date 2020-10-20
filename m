Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E529369E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 10:17:59 +0200 (CEST)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmqE-0001y6-Or
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 04:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kUmmC-0006g3-BC
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kUmmA-0001gC-OF
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603181625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kY52Pk7M04KQoU/rKrPNfI3H3mP/dsppHZkYxLjjcA=;
 b=BmdhRYBfawHc+WfvIFOYZ/5K4sL6LogRArnUM69vrr5p/sRcwXRdD9bhuIIpoHh1Zjq1W0
 0og8U9LQg2mOZ0Fk+velTUIDT5aRotPBEkAn7ARSqjGyVWRM+B5F+uY3Q+CL2/vtG2r28P
 fB3o7++Hd9iHvy+GYbf1o+qltqyy9XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-JXawvBeFOJmYmR-OEHFiLw-1; Tue, 20 Oct 2020 04:13:41 -0400
X-MC-Unique: JXawvBeFOJmYmR-OEHFiLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10A7C18C9F40;
 Tue, 20 Oct 2020 08:13:40 +0000 (UTC)
Received: from localhost (unknown [10.36.110.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4452E55763;
 Tue, 20 Oct 2020 08:13:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] fixup! qga: add ssh-{add,remove}-authorized-keys
Date: Tue, 20 Oct 2020 12:12:54 +0400
Message-Id: <20201020081257.2054548-5-marcandre.lureau@redhat.com>
In-Reply-To: <20201020081257.2054548-1-marcandre.lureau@redhat.com>
References: <20201020081257.2054548-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: berrange@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Use 'if' condition, as suggested by E. Blake.
---
 qga/commands-win32.c | 12 ------------
 qga/qapi-schema.json |  6 ++++--
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 1e188b03d3..0c3c05484f 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2457,15 +2457,3 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
     }
     return head;
 }
-
-void qmp_guest_ssh_add_authorized_keys(const char *username,
-                                       strList *keys, Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-}
-
-void qmp_guest_ssh_remove_authorized_keys(const char *username,
-                                          strList *keys, Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-}
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 361883f870..90615f95d4 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1321,7 +1321,8 @@
 # Since: 5.2
 ##
 { 'command': 'guest-ssh-add-authorized-keys',
-  'data': { 'username': 'str', 'keys': ['str'] } }
+  'data': { 'username': 'str', 'keys': ['str'] },
+  'if': 'defined(CONFIG_POSIX)' }
 
 ##
 # @guest-ssh-remove-authorized-keys:
@@ -1338,4 +1339,5 @@
 # Since: 5.2
 ##
 { 'command': 'guest-ssh-remove-authorized-keys',
-  'data': { 'username': 'str', 'keys': ['str'] } }
+  'data': { 'username': 'str', 'keys': ['str'] },
+  'if': 'defined(CONFIG_POSIX)' }
-- 
2.28.0


