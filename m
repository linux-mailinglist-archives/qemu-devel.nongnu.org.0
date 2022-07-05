Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BA456686E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:46:15 +0200 (CEST)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g4M-0003ku-HL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fx8-0006m7-Kn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fx7-00060n-0H
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQu3YHVBjKsRM7PvpRyZC6AEw1ZwpIrH40kn4jkYVGQ=;
 b=XJuySWSpyCGkK2GkzaQBSiBX4fcf+XZEmxQmk5ISdG8f2osp5cpCgQ2u7EmJ87OunRWbOT
 ZS+Nwk7tPVhnvzU+VeFu/ocuKlL1hvJGGq+LrNxbC+SzaB+hfOjxHp3g1TKgMI57hsK+xx
 8vkLTP6KWQ8Dug/LjIZvtGsdLUHsHbc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-5pczuiujNA-Wn8gFNMWMrg-1; Tue, 05 Jul 2022 06:38:41 -0400
X-MC-Unique: 5pczuiujNA-Wn8gFNMWMrg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04B1B8339A5;
 Tue,  5 Jul 2022 10:38:41 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10886492C3B;
 Tue,  5 Jul 2022 10:38:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Andrij Mizyk <andmizyk@gmail.com>
Subject: [PULL 12/14] po: add ukrainian translation
Date: Tue,  5 Jul 2022 12:38:14 +0200
Message-Id: <20220705103816.608166-13-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrij Mizyk <andmizyk@gmail.com>

Signed-off-by: Andrij Mizyk <andmizyk@gmail.com>
Message-Id: <20220613123758.13280-1-andmizyk@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 po/LINGUAS |  1 +
 po/uk.po   | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 po/uk.po

diff --git a/po/LINGUAS b/po/LINGUAS
index cc4b5c3b36..9b33a3659f 100644
--- a/po/LINGUAS
+++ b/po/LINGUAS
@@ -5,4 +5,5 @@ hu
 it
 sv
 tr
+uk
 zh_CN
diff --git a/po/uk.po b/po/uk.po
new file mode 100644
index 0000000000..ff037808bf
--- /dev/null
+++ b/po/uk.po
@@ -0,0 +1,75 @@
+# Ukrainian translation for QEMU.
+# This file is put in the public domain.
+# Andrij Mizyk <andmizyk@gmail.com>, 2022.
+#
+msgid ""
+msgstr ""
+"Project-Id-Version: QEMU 1.4.50\n"
+"Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
+"POT-Creation-Date: 2018-07-18 07:56+0200\n"
+"PO-Revision-Date: 2022-06-13 01:33+0300\n"
+"Last-Translator: Andrij Mizyk <andmizyk@gmail.com>\n"
+"Language-Team: Ukrainian\n"
+"Language: uk\n"
+"MIME-Version: 1.0\n"
+"Content-Type: text/plain; charset=UTF-8\n"
+"Content-Transfer-Encoding: 8bit\n"
+"Plural-Forms: nplurals=1; plural=0;\n"
+"X-Generator: Gtranslator 2.91.6\n"
+
+msgid " - Press Ctrl+Alt+G to release grab"
+msgstr " - Натисніть Ctrl+Alt+G, щоб відпустити захоплення"
+
+msgid " [Paused]"
+msgstr " [Призупинено]"
+
+msgid "_Pause"
+msgstr "_Призупинити"
+
+msgid "_Reset"
+msgstr "_Скинути"
+
+msgid "Power _Down"
+msgstr "Вимкнути _живлення"
+
+msgid "_Quit"
+msgstr "_Вийти"
+
+msgid "_Fullscreen"
+msgstr "Повний _екран"
+
+msgid "_Copy"
+msgstr "_Копіювати"
+
+msgid "Zoom _In"
+msgstr "_Збільшити"
+
+msgid "Zoom _Out"
+msgstr "З_меншити"
+
+msgid "Best _Fit"
+msgstr "Найкращий _розмір"
+
+msgid "Zoom To _Fit"
+msgstr "Збільшити до _розміру"
+
+msgid "Grab On _Hover"
+msgstr "Захопити при _наведенні"
+
+msgid "_Grab Input"
+msgstr "Захопити _введення"
+
+msgid "Show _Tabs"
+msgstr "Показувати _вкладки"
+
+msgid "Detach Tab"
+msgstr "Відʼєднати вкладку"
+
+msgid "Show Menubar"
+msgstr "Показувати рядок меню"
+
+msgid "_Machine"
+msgstr "_Машина"
+
+msgid "_View"
+msgstr "_Вигляд"
-- 
2.31.1


