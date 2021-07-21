Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CC23D0AB0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:44:29 +0200 (CEST)
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67q8-0001yr-J3
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67o0-0006tV-FE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67ny-00052D-VX
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8DWW4GTGc5bGckpzifXOx+F24qr9GjY3WY4ez/Gmhc=;
 b=cL2dRBTzoB9x67WNBXYoKLx67+ZDwAEAleH7qKU6ESL/1HQJN25hlc7lrVnyhb9C4uoVfx
 IVWbUyA30MxMOctz8+qouq0v4PgEoW3dwzgrDbVPc9n2vfeiwbzTKId3DqLbE5u1H4xMUH
 sDKGZznR7n3MlhfZsUtgSuNjaajWXyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-sNdo5nNqMLuOGoVknbMuIw-1; Wed, 21 Jul 2021 04:42:12 -0400
X-MC-Unique: sNdo5nNqMLuOGoVknbMuIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484A5845F2C
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:42:11 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38F8619D7C;
 Wed, 21 Jul 2021 08:42:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/13] ui/gtk-clipboard: fix clipboard enum typo
Date: Wed, 21 Jul 2021 12:41:30 +0400
Message-Id: <20210721084139.1124779-5-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk-clipboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 5e817ae55c..2c78de9500 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -155,7 +155,7 @@ static void gd_owner_change(GtkClipboard *clipboard,
 
 
     switch (event->owner_change.reason) {
-    case GDK_SETTING_ACTION_NEW:
+    case GDK_OWNER_CHANGE_NEW_OWNER:
         info = qemu_clipboard_info_new(&gd->cbpeer, s);
         if (gtk_clipboard_wait_is_text_available(clipboard)) {
             info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
-- 
2.32.0.264.g75ae10bc75


