Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC03475B8E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:13:46 +0100 (CET)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVyT-0001Hs-6i
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:13:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV8Z-00010s-1I
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV8U-0001Bc-5y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639578001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BCMgp+LAEQDCQwtoBTmGedB6jpjN68Lr/1xO0CTyCc=;
 b=E5txlxD7jpsMJxTIaMv8vKvPrWfJW/3t7faaz4BRoxg/6HWCjQpj/SQnY4/QfdW1198UnW
 NKjCtX5Ziu6afOmGsz13sAM2uYQH0STLRGyskx6weSbGCzXZ3MgNID9WtQMzG2HP5zchw2
 TEtDxG0Pjj4GOyY0tZznM/e11Rs38sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-ZyPBu0j8PZ6T1uCDquZwaA-1; Wed, 15 Dec 2021 09:19:57 -0500
X-MC-Unique: ZyPBu0j8PZ6T1uCDquZwaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F24510168C0;
 Wed, 15 Dec 2021 14:19:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B49E0101E59B;
 Wed, 15 Dec 2021 14:19:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/18] ui: avoid compiler warnings from unused clipboard
 info variable
Date: Wed, 15 Dec 2021 14:19:32 +0000
Message-Id: <20211215141949.3512719-2-berrange@redhat.com>
In-Reply-To: <20211215141949.3512719-1-berrange@redhat.com>
References: <20211215141949.3512719-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


