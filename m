Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F89F3D0F2B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:06:29 +0200 (CEST)
Received: from localhost ([::1]:47528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Bvg-0001xx-4y
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6BuX-00012r-Bm
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6BuS-0003Jv-12
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626872710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wzAR5+DOejFj+AakWNwxdgt67pz+7RxeJ/MTEV8glGI=;
 b=Ctf77kdWGVFRFOyzWlqLvK155/0X6bbGetagJEciEfhUeT0WGqcqYbfWv3Fdkcs8FUbok4
 hU/ECdU5YcFb4fYu0jED8qJ2cfZBXPfvdCxdErRErrm3K27NWCv0zel11KYDcj/6y4l4B3
 sd/cC2diNmG+9qJQSl4iz1eaVKCCRwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-sd9zCb1AMYyijXZGqPsm9Q-1; Wed, 21 Jul 2021 09:05:02 -0400
X-MC-Unique: sd9zCb1AMYyijXZGqPsm9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F297B1084F57
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:05:01 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C64D60C5F;
 Wed, 21 Jul 2021 13:04:56 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] chardev/socket: print a more correct command-line address
Date: Wed, 21 Jul 2021 17:04:53 +0400
Message-Id: <20210721130453.1180878-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: pbonzini@redhat.com, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Better reflect the command line version of the socket address arguments,
following the now recommended long-form opt=on syntax.

Complement/fixes commit 9d902d51 "chardev: do not use short form boolean
options in non-QemuOpts character device descriptions".

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index d0fb545963..c43668cc15 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -468,9 +468,9 @@ static char *qemu_chr_socket_address(SocketChardev *s, const char *prefix)
 
 #ifdef CONFIG_LINUX
         if (sa->has_abstract && sa->abstract) {
-            abstract = ",abstract";
+            abstract = ",abstract=on";
             if (sa->has_tight && sa->tight) {
-                tight = ",tight";
+                tight = ",tight=on";
             }
         }
 #endif
-- 
2.32.0.264.g75ae10bc75


