Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E22287EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 20:03:55 +0200 (CEST)
Received: from localhost ([::1]:45300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxwcM-0002DE-00
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 14:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxwaI-0000ax-GC
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 14:01:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jxwaG-0003ut-RK
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 14:01:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y3so4714591wrl.4
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qgnMWdA6GNo7AWlQMpq/zRkLjbt1h9TvjUdYX6CVScw=;
 b=HPSpeOeu3CjvdDLSOuXfMdGwH300aFkQ4O4JLvYu3bm3amBQTVDyzCBoYT7WECskPA
 bv+RnLbtUoJKfFocGHyNGQM6AyPN7jXVf7VqmhmqK6LL8AiMicnno5ufQgu4yNxYoC4D
 DsHjAO9WEXoFUTjOml4o5nG0R4k0T3gJk1lgiKTkast5ALUqsJcwapAGjMLnl5bNHcso
 +cjXxV4V9W6y09F04mg/Re639awSGFxAB40d1S/PuO2lCN+kFxYnjh+V3QmRqtBjuY/3
 SsJD0gTSZ3KbBzNKs7FqdoZa5S3z2qGemSsLT4O5afaq/RRSwDCiivaM8xIWjrro4a1j
 Wx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qgnMWdA6GNo7AWlQMpq/zRkLjbt1h9TvjUdYX6CVScw=;
 b=Lnr8c0i+cYHLa3eI6pvIPU5Xrd4246UGGdbWrrilL7mdNJSY5i4JxUavr1itZig0AF
 rifyEoVr7Dvr/5hAHKPABK872z3UG26mvaqVJ3oShtOEMEIRkeoIdB473wcgOUWymtCv
 PqVv09kowUkHpzqxCVTFdxXjMz/p+R9i5fviACgu/IgKqOhvFw5mlcUY2F7I+71T14Gf
 Bk4nTnEf4TwVNj3pt1YJNoN2NjxS6mKquu8jAqTVBIbXF87SsDObuhIfxfWtTBxDeK64
 BSFIMd+lhYpoYrNiySuPMXVKHcjG2BxW95r9HTtkctTk56KATXL1Q8VJd+ZDg72v/OD4
 RD0w==
X-Gm-Message-State: AOAM531/sKbM5Y+jNfLwwFUlPk6+YhB+YfdjhExY2PUgDV0iiLE1uzmg
 cBOH2eyWd53Spy4nqs3PPtkyg/F2oG8=
X-Google-Smtp-Source: ABdhPJyjOHL7RbdyGU3qt9khevryKoH6p22/ZHcAiiAvd3lWqhaCpbNMnO8Tql9iGUbqrV/4L7bI6g==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr27867714wrc.260.1595354502628; 
 Tue, 21 Jul 2020 11:01:42 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id t2sm3557249wmb.25.2020.07.21.11.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:01:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] qemu-common: Document qemu_find_file()
Date: Tue, 21 Jul 2020 20:01:36 +0200
Message-Id: <20200721180137.11136-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200721180137.11136-1-f4bug@amsat.org>
References: <20200721180137.11136-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document qemu_find_file(), in particular the returned
value which must be freed.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200714164257.23330-4-f4bug@amsat.org>
---
 include/qemu-common.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index d0142f29ac..bb9496bd80 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -110,6 +110,23 @@ const char *qemu_get_vm_name(void);
 
 #define QEMU_FILE_TYPE_BIOS   0
 #define QEMU_FILE_TYPE_KEYMAP 1
+/**
+ * qemu_find_file:
+ * @type: QEMU_FILE_TYPE_BIOS (for BIOS, VGA BIOS)
+ *        or QEMU_FILE_TYPE_KEYMAP (for keymaps).
+ * @name: Relative or absolute file name
+ *
+ * If @name exists on disk as an absolute path, or a path relative
+ * to the current directory, then returns @name unchanged.
+ * Otherwise searches for @name file in the data directories, either
+ * configured at build time (DATADIR) or registered with the -L command
+ * line option.
+ *
+ * The caller must use g_free() to free the returned data when it is
+ * no longer required.
+ *
+ * Returns: a path that can access @name, or NULL if no matching file exists.
+ */
 char *qemu_find_file(int type, const char *name);
 
 /* OS specific functions */
-- 
2.21.3


