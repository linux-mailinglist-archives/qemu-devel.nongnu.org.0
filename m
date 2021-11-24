Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E260445C082
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:06:31 +0100 (CET)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpryo-0006yW-Bd
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:06:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpruT-0004gI-8E
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpruR-0005eX-2h
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ELIT9O6f0aFxW51BRV7p/d45dLoJvpe7wXHyazeIbI=;
 b=dUCnBmc64HcU4ynyJLI4EgYTw+XyeIuXZBzRPeaviPnklQNya42qm5Txs3IABzvtTPr7ks
 dvUYUemMPzL6pz5sZKpCHy8b7L0sKORLtxoPvGwUeV/U2qEttEYm2I9vdAD37nhGl0ptfU
 wCRrLi2apwYH+Kqd17Wn4lokq9PZK5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-zs7IKl6hMyS9mI8o15Umpg-1; Wed, 24 Nov 2021 08:01:57 -0500
X-MC-Unique: zs7IKl6hMyS9mI8o15Umpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33210107B0F3;
 Wed, 24 Nov 2021 13:01:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E570379457;
 Wed, 24 Nov 2021 13:01:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/18] ui: avoid compiler warnings from unused clipboard
 info variable
Date: Wed, 24 Nov 2021 13:01:33 +0000
Message-Id: <20211124130150.268230-2-berrange@redhat.com>
In-Reply-To: <20211124130150.268230-1-berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With latest clang 13.0.0 we get

../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
    g_autoptr(QemuClipboardInfo) old = NULL;
                                 ^

The compiler can't tell that we only declared this variable in
order to get the side effect of free'ing it when out of scope.

This pattern is a little dubious for a use of g_autoptr, so
rewrite the code to avoid it.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/clipboard.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a..7672058e84 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
 
 void qemu_clipboard_update(QemuClipboardInfo *info)
 {
-    g_autoptr(QemuClipboardInfo) old = NULL;
     assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
 
     notifier_list_notify(&clipboard_notifiers, info);
 
-    old = cbinfo[info->selection];
+    qemu_clipboard_info_unref(cbinfo[info->selection]);
     cbinfo[info->selection] = qemu_clipboard_info_ref(info);
 }
 
-- 
2.33.1


