Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424424210B7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:51:03 +0200 (CEST)
Received: from localhost ([::1]:45660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOMv-0001GX-Nd
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJy-0006Ge-3q
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:58 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJs-0007Ik-PD
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id v127so13493033wme.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XKksSNJpzNeevRjjy+0RRvABj/O0e/8A0w+HPwQEvE=;
 b=f7tmgdThQJhz/46AoxeZAdAwLhUtYZHGEyLZq6KVONi5FNORKwuEXJ/EnGMb5fDf8o
 QEhe1lt9tAPwVGAofqzFQdXDSKbpCxudOpH7xt0i3YOItlBTVe8DSd+HZ4aycSBVW9DM
 gLIai21BOTecgVMnWPPmapFOaEqO542CO8spxanY+7v6t6Uk9xgBga6KG+cAFHduWb8t
 0kCjYF/TnXZssJlsqUC0DCLGxzVOZunaWf6SY4kN04hBVW+Qdw/nRkGHCdBycm96s04M
 9XxET0o9Tc0lyjFz+YIut+ZDyBl9GhSCG2+O2ic4Q+rZEbp44bAlocBzNiSlv5hHTPy5
 V5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XKksSNJpzNeevRjjy+0RRvABj/O0e/8A0w+HPwQEvE=;
 b=mRJlkeIyRclo9sXYDGkYJ7GZTj5TxYpZamsUD/GWqWHQ/nUlcp8ADNaR3zUg0LqaIu
 j19g+RMoVbHgdypPzxnTFodp6KBp+5GjC3zcF9nKwI1YGvoQsWmWZtS32r+CltLVG9Hz
 LeJhvY3C5UmQC4dkIXtqi74MXDYldOP2f7kgwF0k+5tmek2LQhtxpSY9giXiMd7lEbTU
 InpfG2IosLsypeTWHNc+IE0qac3UoIW0NYQwhAvLFnAxQTqrdqc/fohEV961ZIPVG0zL
 40iSTBzoRgjBaOD2DOm21oDob0frVdnCh4Ie+6UQ47O1bjt6XmkinbdCq/rB23UTzWwA
 ey2g==
X-Gm-Message-State: AOAM53140+KRTtk2nJMbwM8PI4Ta33OYSGaKJ6Xps5DgKEH3jifWJIar
 FNyzthrVv/eg4XW3MwLEqE/zhg==
X-Google-Smtp-Source: ABdhPJxT+tN8C4WJJ2mxvtayiHaCFfGTYyhA8z6LYwqP1faz9rNM61m6/B6crrwm+vVJHqdrahpEFQ==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr18783275wma.53.1633355270873; 
 Mon, 04 Oct 2021 06:47:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm15890484wmi.1.2021.10.04.06.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:47:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9660D1FF9E;
 Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 7/7] hw/arm/raspi: Add the Raspberry Pi 4B board
Date: Mon,  4 Oct 2021 14:47:41 +0100
Message-Id: <20211004134742.2044280-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:
  - use 8gb version
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 03f54887f4..0342aeab03 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -369,6 +369,15 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
+
+static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xd03114;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
 #endif /* TARGET_AARCH64 */
 
 static const TypeInfo raspi_machine_types[] = {
@@ -393,6 +402,10 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi4b"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi4b_machine_class_init,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.30.2


