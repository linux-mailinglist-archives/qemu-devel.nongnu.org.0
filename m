Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6921FA04D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 21:32:29 +0200 (CEST)
Received: from localhost ([::1]:42276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkuqK-00084N-Mf
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 15:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkuh7-0006iT-7H
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:57 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jkuh5-0003r2-Gj
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 15:22:56 -0400
Received: by mail-wm1-x335.google.com with SMTP id g10so663428wmh.4
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRfjs1hFOy491CKhnS7ZjwNiAbqWZlAj2pF2jE/WL4E=;
 b=GsjowcpHc/P8vTwSowG6BTtkrSOoV8PZ57y6r7MH5Qq5h0VvtWw1Q8ZUH/8x0eR048
 WsCCAyTQOjKajCoE5I+XbTBfIslI0dwYNpvgLmGqlyCKnTGh77+rwWaFB+2Kbswvspe0
 BHR7kpiEYyWmj0NlEb/Q5bTMuBxvCKUVig1PpUZQsWlaeCREFQrNjPt80LDai1tx2dyc
 375zcpJPNWnde8/htp5YHNoaWLUeAEPG/VyXGawFGmlahnlWm4gdZByqG4EX7O6+mGth
 FLpmCsLKDdTRcGT4vKhhZcOpGxrQ4qWRFzEIXGNfwN9H1nHRIa0C/d8LCGMk4ffI7eMv
 LQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRfjs1hFOy491CKhnS7ZjwNiAbqWZlAj2pF2jE/WL4E=;
 b=nJXUsMjXzl4QoqwXGE1zKp06WHmlCA3pS04EmJrH25Br4Z6BXR1+tEfJVc0gFcHVcN
 Cyr9EOLrZcLbSADu2cvUIitsi9J3jWFmMO7DlOL4zJR9sGmSge+4JyH6bSc1d7BeoTDS
 hEjrQW1d/MwSfuE3VA7K2sfqFxduB2AD2ONlMjLUJFFtoWD677oO8NGJTcp/ulgyvlbu
 LjydS3o3mPai483KyZ85AsKTClPescyyyIRMZr1+ZonC96CbwkX8DSzFQpk+BF7FXEVK
 ybvnDkRCnql3g55AORIBto9toCxeeZBpNO9J303yOu8xTL93IizGMh+SbjXV0vgBK3DQ
 mbWg==
X-Gm-Message-State: AOAM532TE1LFJgKtiyeCN0F9E3DlU3wrX2N4vm0JEMYvcszYglWJV3j5
 65m50RXs9Jf3u6AzPFiKASVqnO2P
X-Google-Smtp-Source: ABdhPJz7Yar2HfaqXx5pJtiZK9FKRjo6GKzSC++Lk/1AudPxx1SYsdOF9zXXmHMAtTZIlhkvmVcabQ==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr903854wmg.152.1592248973907;
 Mon, 15 Jun 2020 12:22:53 -0700 (PDT)
Received: from rtrkw774-lin.syrmia.com ([46.240.135.226])
 by smtp.gmail.com with ESMTPSA id 50sm27823909wra.1.2020.06.15.12.22.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:22:53 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 18/18] translations: Add Swedish language
Date: Mon, 15 Jun 2020 21:22:33 +0200
Message-Id: <1592248953-8162-19-git-send-email-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
References: <1592248953-8162-1-git-send-email-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.qemu.devel@gmail.com, Sebastian Rasmussen <sebras@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sebastian Rasmussen <sebras@gmail.com>

This patch adds translation of QEMU to Swedish.

Signed-off-by: Sebastian Rasmussen <sebras@gmail.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200611114523.15584-2-aleksandar.qemu.devel@gmail.com>
---
 po/sv.po | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 po/sv.po

diff --git a/po/sv.po b/po/sv.po
new file mode 100644
index 0000000..1e430ed
--- /dev/null
+++ b/po/sv.po
@@ -0,0 +1,75 @@
+# Swedish translation of qemu po-file.
+# This file is put in the public domain.
+# Sebastian Rasmussen <sebras@gmail.com>, 2019.
+#
+msgid ""
+msgstr ""
+"Project-Id-Version: QEMU 2.12.91\n"
+"Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
+"POT-Creation-Date: 2018-07-18 07:56+0200\n"
+"PO-Revision-Date: 2019-08-16 21:19+0200\n"
+"Last-Translator: Sebastian Rasmussen <sebras@gmail.com>\n"
+"Language-Team: Swedish <tp-sv@listor.tp-sv.se>\n"
+"Language: sv\n"
+"MIME-Version: 1.0\n"
+"Content-Type: text/plain; charset=UTF-8\n"
+"Content-Transfer-Encoding: 8bit\n"
+"Plural-Forms: nplurals=2; plural=(n != 1);\n"
+"X-Generator: Poedit 2.2.3\n"
+
+msgid " - Press Ctrl+Alt+G to release grab"
+msgstr " - Tryck Ctrl+Alt+G för att sluta fånga"
+
+msgid " [Paused]"
+msgstr " [Pausad]"
+
+msgid "_Pause"
+msgstr "_Paus"
+
+msgid "_Reset"
+msgstr "_Starta om"
+
+msgid "Power _Down"
+msgstr "Stäng _ner"
+
+msgid "_Quit"
+msgstr "_Avsluta"
+
+msgid "_Fullscreen"
+msgstr "_Helskärm"
+
+msgid "_Copy"
+msgstr "_Kopiera"
+
+msgid "Zoom _In"
+msgstr "Zooma _in"
+
+msgid "Zoom _Out"
+msgstr "Zooma _ut"
+
+msgid "Best _Fit"
+msgstr "Anpassad _storlek"
+
+msgid "Zoom To _Fit"
+msgstr "Zooma ti_ll anpassad storlek"
+
+msgid "Grab On _Hover"
+msgstr "Fånga vi_d hovring"
+
+msgid "_Grab Input"
+msgstr "Fån_ga inmatning"
+
+msgid "Show _Tabs"
+msgstr "Visa _flika"
+
+msgid "Detach Tab"
+msgstr "Frigör flik"
+
+msgid "Show Menubar"
+msgstr "Visa menyrad"
+
+msgid "_Machine"
+msgstr "_Maskin"
+
+msgid "_View"
+msgstr "_Visa"
-- 
2.7.4


