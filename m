Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79239DBBB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:49:53 +0200 (CEST)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDlQ-0000Rd-52
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqDkd-0008Ct-1H
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqDkX-0006S4-NT
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 07:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623066535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EiPVzRYhqzwPCZDnKP4frQe4TN2dL3RYpQyL27TIc8k=;
 b=bsVFF7zinxfEqTlkscO4CroPJxWm8BzFZZoHqpJHRTxZyCQio0Z77ehVKJgGgzqpmQSkQs
 bCX16ItdbUroZrSkjASVnSqBBZ1iFdXfeUTIj9dBFTTmRDA+B3yzIv7A3K5hS8xB/SyM1h
 pV9IKfMpw4KS04++hfpHr1g8cNXpA+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-BDeqZOkwMv24DtXxdb6tJw-1; Mon, 07 Jun 2021 07:48:53 -0400
X-MC-Unique: BDeqZOkwMv24DtXxdb6tJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3C3D8042A6;
 Mon,  7 Jun 2021 11:48:51 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF2F21002D71;
 Mon,  7 Jun 2021 11:48:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] RFC: net: document "-netdev user" explicitly as unsafe
Date: Mon,  7 Jun 2021 15:48:44 +0400
Message-Id: <20210607114844.2015685-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: samuel.thibault@ens-lyon.org, jasowang@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

libslirp is known to have several security flaws, we should make it
explicit by warning the users and in the documentation.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/system/net.rst | 9 +++++++++
 net/slirp.c         | 2 ++
 qemu-options.hx     | 4 +++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/system/net.rst b/docs/system/net.rst
index 4b2640c448..1caac062a4 100644
--- a/docs/system/net.rst
+++ b/docs/system/net.rst
@@ -41,6 +41,13 @@ download OpenVPN from : https://openvpn.net/.
 Using the user mode network stack
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+.. warning::
+   The user mode network stack (`slirp`_) is notoriously unsafe. We strongly
+   discourage its usage in a production environment. It is mostly useful for
+   developers or informed end-users. It is recommended to use other networking
+   solutions, or a dedicated standalone slirp process with the minimum
+   privileges.
+
 By using the option ``-net user`` (default configuration if no ``-net``
 option is specified), QEMU uses a completely user mode network stack
 (you don't need root privilege to use the virtual network). The virtual
@@ -98,3 +105,5 @@ option, it is possible to create emulated networks that span several
 QEMU instances. See the description of the ``-netdev socket`` option in
 :ref:`sec_005finvocation` to have a basic
 example.
+
+.. _slirp: https://gitlab.freedesktop.org/slirp/libslirp
diff --git a/net/slirp.c b/net/slirp.c
index ad3a838e0b..80891eefbb 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -388,6 +388,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     char *end;
     struct slirp_config_str *config;
 
+    warn_report("User mode network stack is unsafe!");
+
     if (!ipv4 && (vnetwork || vhost || vnameserver)) {
         error_setg(errp, "IPv4 disabled but netmask/host/dns provided");
         return -1;
diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..b46a231ba6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2652,7 +2652,9 @@ SRST
 
 ``-netdev user,id=id[,option][,option][,...]``
     Configure user mode host network backend which requires no
-    administrator privilege to run. Valid options are:
+    administrator privilege to run, but is notoriously **unsafe**!
+
+    Valid options are:
 
     ``id=id``
         Assign symbolic name for use in monitor commands.
-- 
2.29.0


