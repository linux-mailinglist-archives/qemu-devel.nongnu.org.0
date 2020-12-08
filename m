Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5612D2A3C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:05:00 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbjn-0006oa-1m
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcq-0001Rr-I3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcn-000531-QE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607428664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uNKilwWVAH7hHlfFA8GmXIISF8LfSAOs/eZ0rlZAhP4=;
 b=Jimrskf9KgoCth1lknwsvE97cYE9HRd2uNyHEt56dReEmml9FvnRHvkCXMMLGQpLwmgU4/
 GhlNeCLFkRuorkm/winDWh7XX+D1xUYPjjoHj7GSAepn/v5/FJ5GEXobrwzw2tmqItyLHD
 5uVk2naXPh6jcGB/20LVD4RSugeaG80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-iHLs5TtdPtGraWoZDog-8Q-1; Tue, 08 Dec 2020 06:57:42 -0500
X-MC-Unique: iHLs5TtdPtGraWoZDog-8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F58B18C89C4
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:57:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D1BD10021B3;
 Tue,  8 Dec 2020 11:57:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2BDDDA1E2; Tue,  8 Dec 2020 12:57:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] console: drop qemu_console_get_ui_info
Date: Tue,  8 Dec 2020 12:57:29 +0100
Message-Id: <20201208115737.18581-2-kraxel@redhat.com>
In-Reply-To: <20201208115737.18581-1-kraxel@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unused and duplicate (there is dpy_get_ui_info).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 1 -
 ui/console.c         | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index e7303d8b98a8..5dd21976a376 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -390,7 +390,6 @@ bool qemu_console_is_gl_blocked(QemuConsole *con);
 char *qemu_console_get_label(QemuConsole *con);
 int qemu_console_get_index(QemuConsole *con);
 uint32_t qemu_console_get_head(QemuConsole *con);
-QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con);
 int qemu_console_get_width(QemuConsole *con, int fallback);
 int qemu_console_get_height(QemuConsole *con, int fallback);
 /* Return the low-level window id for the console */
diff --git a/ui/console.c b/ui/console.c
index 53dee8e26b17..f995639e45f6 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2122,12 +2122,6 @@ uint32_t qemu_console_get_head(QemuConsole *con)
     return con ? con->head : -1;
 }
 
-QemuUIInfo *qemu_console_get_ui_info(QemuConsole *con)
-{
-    assert(con != NULL);
-    return &con->ui_info;
-}
-
 int qemu_console_get_width(QemuConsole *con, int fallback)
 {
     if (con == NULL) {
-- 
2.27.0


