Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C493548543
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:43:07 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jPN-0006TC-JQ
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andmizyk@gmail.com>)
 id 1o0jKc-0003k7-3F
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:38:10 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andmizyk@gmail.com>)
 id 1o0jKZ-0003w9-FT
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:38:08 -0400
Received: by mail-lj1-x231.google.com with SMTP id m25so6007438lji.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=93fdOpqR1k+zbhE1lA0zy/52F/erGydbrOVS/ZQOOfA=;
 b=ZLp8vLdlSJuy+1clgcRa6MWTUVIZJSriXvQjF5Nliv7RCrk/tkzycdSdepk5K0mG2J
 A1b6Ikan3D8QFzmvMKrVhIdsyjW4kyALNsMWlz+fXPUUTUEI59aixngNZMK1W0/HTYOu
 4n/Oa1xsWOFT0/VqlY1oXhQ0STPUAKF8pjNRKPlm9+6oH5OolYYI+y9VhNmjQJEVuTmv
 h4ZwVu+x8Y6NMaU5kffD/bxV7Ag2uywKWIuN/gNU7K+WCn5FzFifxOf3YEojBH/LHT2b
 T0yBn9UTGbfdYu0Gl6fJknnxcQXUfHqNJ4aVDbhdGiOufC4YFqvo9ztAgcxAKyLGFS6j
 bPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=93fdOpqR1k+zbhE1lA0zy/52F/erGydbrOVS/ZQOOfA=;
 b=s9pLCHNlHTlcwrRa8hp7ukylsK6c8JvDnyu7M+vR+Bob6Tei94xTvBIbbNpstRKAFi
 J0BPhiGS5fs2gYirMx0Nn/wGqmTkGuNiMAR7ydalpwxf6FPsu2B+yDWUCfwBGKk+jLOQ
 +vXoGTny/gyJZ/yZa2jQATaceSSr+7dEy9bLv0jGDBTMV19gqJlUli3igjpDqDBeme+N
 GMEKs+d3Al9M+8qctg7mZqQKlE4vL4SGNE88iu7UWrF85v6fnB/rU/L5XkEmAwL/mT0T
 D0HsBEsCOjOwj8joe5MroHhQ+/I6z9lpVF1e8prQzBxfeJuQ929pFuuWstO9v93w0td6
 rsmA==
X-Gm-Message-State: AOAM531zkfTbI6EKestpvUsP+1TUvj76zWTZnX3KF/FnK/bWkqVpvb94
 ru6njo0kEuQZc5GVkh5iXYaUHWMog1RbLA==
X-Google-Smtp-Source: ABdhPJxUkfi0IRfLlEgjksKV04BjYrpEX332bhtZf/sRX9DaTRXFKo534i5BMcTUPEYk+xNb83YhOA==
X-Received: by 2002:a05:651c:210f:b0:255:847d:391d with SMTP id
 a15-20020a05651c210f00b00255847d391dmr24702462ljq.354.1655123885041; 
 Mon, 13 Jun 2022 05:38:05 -0700 (PDT)
Received: from localhost.localdomain ([46.173.170.11])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a2e8517000000b0025561ce1275sm993790lji.135.2022.06.13.05.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:38:04 -0700 (PDT)
From: Andrij Mizyk <andmizyk@gmail.com>
To: qemu-devel@nongnu.org
Cc: Andrij Mizyk <andmizyk@gmail.com>
Subject: [PATCH] po: add ukrainian translation
Date: Mon, 13 Jun 2022 15:37:58 +0300
Message-Id: <20220613123758.13280-1-andmizyk@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=andmizyk@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Andrij Mizyk <andmizyk@gmail.com>
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
2.30.2


