Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895863B3C5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:59:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozlCy-0000a5-QR; Mon, 28 Nov 2022 15:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <temuri.doghonadze@gmail.com>)
 id 1ozj4h-0000ev-Io
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:41:51 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <temuri.doghonadze@gmail.com>)
 id 1ozj4f-0001g8-5L
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:41:50 -0500
Received: by mail-ej1-x62b.google.com with SMTP id b2so11853778eja.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=80h2D/bc0jobZbshILVz4WoL/3L6WUK49DltGbr969E=;
 b=UPr1oiRvCSBnUU4vtMXDVUCPu/CYn76eDfoShj9N+uWD0nnIw7NzFIAnAHWp2rK6v9
 N8yw97/nT+gTzsOJu8e66qzF0qFV9gK0OvIolUFdnjRrnppkjHU+atjImIW5qyUswt9z
 CKME2beKSgScNKH3Yh6IUKU20dqliCG9opGZgtzJ+pJrfcrdsuvR/NmQW2J2l7KIg5KN
 HjSPH5h+ukU9kKiYsgY4eXgXPmgbWbeuTs4xsn+7GGhjEZzRdDMcQGlUtYo2nGX5p3rZ
 A6Pxsqc2/43UCxsuM6UDacZBuAv/TPtI1EJ8qCQosv9rX/7cAhkwAZoSr+uLLtjHg0Cu
 Vaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=80h2D/bc0jobZbshILVz4WoL/3L6WUK49DltGbr969E=;
 b=erl3EZBpzQIJl9aMs0bQJZjeXmEQilSgT2k5ghC1ezX1iJjsIBiHqECx3Wyinl8/5W
 g2iCN4RVMKmFUzOGx6HmS1qTJvfIXP/VHrH63zXn6NR45GtZ2zer30NIvooOdTWp8R8R
 3MSdUEF6h9GvMJAhJwcgp/e2hWqJh/c+49tu/n8CORrs0QO82b+AWPKKIq1cUOJMLpx6
 swPti0E96pNKN3pUWsN8FVfufkvYVXv1AbUrEYTmKW6D9M5sBPrCNuyFGyXWWDIuC3uL
 +MjMt8MHc9XigyoRFVtj4uCzZt34poq77PI75ZfMfT2DWeibsfuB62b0c2i6uDHNUoIe
 56EA==
X-Gm-Message-State: ANoB5pmJ0wueBnCLLEAfwAROKeJXuN7r3T38uhrMRfepqGWiJnfmVf8P
 DHroBfeA/GdWI5do5obWDUNjrii47iQ=
X-Google-Smtp-Source: AA0mqf5NYUphX+oz0GQoMGzgiu/7bCvBATNJvk2t9VMVU6fm5NmUwZYN2xq8Y3ipZ5orsiWI9jZX9g==
X-Received: by 2002:a17:906:b1c6:b0:7ad:e82b:b66b with SMTP id
 bv6-20020a170906b1c600b007ade82bb66bmr29034253ejb.453.1669660907360; 
 Mon, 28 Nov 2022 10:41:47 -0800 (PST)
Received: from fedora.. (ip-62-245-98-7.bb.vodafone.cz. [62.245.98.7])
 by smtp.googlemail.com with ESMTPSA id
 f16-20020a50fe10000000b004677b1b1a70sm5345319edt.61.2022.11.28.10.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 10:41:46 -0800 (PST)
From: Temuri Doghonadze <temuri.doghonadze@gmail.com>
To: qemu-devel@nongnu.org
Cc: Temuri Doghonadze <temuri.doghonadze@gmail.com>
Subject: [PATCH] po: Add Georgian translation
Date: Mon, 28 Nov 2022 19:41:21 +0100
Message-Id: <20221128184121.35400-1-temuri.doghonadze@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=temuri.doghonadze@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Nov 2022 15:58:31 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Temuri Doghonadze <temuri.doghonadze@gmail.com>
---
 po/LINGUAS |  1 +
 po/ka.po   | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 po/ka.po

diff --git a/po/LINGUAS b/po/LINGUAS
index 9b33a3659f..f3a9b1a802 100644
--- a/po/LINGUAS
+++ b/po/LINGUAS
@@ -3,6 +3,7 @@ de_DE
 fr_FR
 hu
 it
+ka
 sv
 tr
 uk
diff --git a/po/ka.po b/po/ka.po
new file mode 100644
index 0000000000..9cdaed2ded
--- /dev/null
+++ b/po/ka.po
@@ -0,0 +1,95 @@
+# Georgian translation for qemu.
+# Copyright (C) 2022 qemu authors
+# This file is distributed under the same license as the qemu package.
+# Temuri Doghonadze <temuri.doghonadze@gmail.com>, 2022.
+#
+msgid ""
+msgstr ""
+"Project-Id-Version: qemu\n"
+"Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
+"POT-Creation-Date: 2022-11-28 19:32+0100\n"
+"PO-Revision-Date: 2022-11-28 19:35+0100\n"
+"Last-Translator: Temuri Doghonadze <temuri.doghonadze@gmail.com>\n"
+"Language-Team: Georgian <(nothing)>\n"
+"Language: ka\n"
+"MIME-Version: 1.0\n"
+"Content-Type: text/plain; charset=UTF-8\n"
+"Content-Transfer-Encoding: 8bit\n"
+"Plural-Forms: nplurals=2; plural=(n != 1);\n"
+"X-Generator: Poedit 3.2\n"
+
+#: ui/gtk.c:229
+msgid " - Press Ctrl+Alt+G to release grab"
+msgstr " - ჩაჭერის მოსახსნელად დააწექით: Ctrl+Alt+G"
+
+#: ui/gtk.c:233
+msgid " [Paused]"
+msgstr " [შეჩერებულია]"
+
+#: ui/gtk.c:2047
+msgid "_Pause"
+msgstr "_შეჩერება"
+
+#: ui/gtk.c:2053
+msgid "_Reset"
+msgstr "_გადატვირთვა"
+
+#: ui/gtk.c:2056
+msgid "Power _Down"
+msgstr "_გამორთვა"
+
+#: ui/gtk.c:2062
+msgid "_Quit"
+msgstr "_გასვლა"
+
+#: ui/gtk.c:2185
+msgid "_Fullscreen"
+msgstr "_მთელ ეკრანზე"
+
+#: ui/gtk.c:2188
+msgid "_Copy"
+msgstr "ასლი"
+
+#: ui/gtk.c:2202
+msgid "Zoom _In"
+msgstr "გა_დიდება"
+
+#: ui/gtk.c:2211
+msgid "Zoom _Out"
+msgstr "_დაპატარავება"
+
+#: ui/gtk.c:2218
+msgid "Best _Fit"
+msgstr "საუკეთესოდ _ჩატევა"
+
+#: ui/gtk.c:2225
+msgid "Zoom To _Fit"
+msgstr "გადიდება _ჩასატევად"
+
+#: ui/gtk.c:2231
+msgid "Grab On _Hover"
+msgstr "ჩაჭერა _გადატარებისას"
+
+#: ui/gtk.c:2234
+msgid "_Grab Input"
+msgstr "შეტანის _ჩაჭერა"
+
+#: ui/gtk.c:2263
+msgid "Show _Tabs"
+msgstr "_ჩანართების ჩვენება"
+
+#: ui/gtk.c:2266
+msgid "Detach Tab"
+msgstr "ჩანართის მოხსნა"
+
+#: ui/gtk.c:2270
+msgid "Show Menubar"
+msgstr "მენიუს ზოლის ჩვენება"
+
+#: ui/gtk.c:2292
+msgid "_Machine"
+msgstr "_მანქანა"
+
+#: ui/gtk.c:2297
+msgid "_View"
+msgstr "_ხედი"
-- 
2.38.1


