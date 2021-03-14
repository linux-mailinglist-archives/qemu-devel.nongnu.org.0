Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40433A8D5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:35:02 +0100 (CET)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaGD-0005ez-46
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaB7-0008D8-Dz
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:45 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaB5-0003cm-Ty
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1547440wmq.1
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=70oiTPRv0w7FE2MLsRVbgiZ8dTQJ/B4k2Scty1V1FuU=;
 b=O3RPy4rqGH8KkAP9tNHKtelgXjEIHJ/q+IGzTj/RHP6qVTpSzef7VZ9jPcp1Yev19u
 aFAa4Kr/DqXbD0DK7+tZqJFYFGPLiT3Vu4jOceIlJdg45+a4Je6HHo39/I6SoW9CVTsk
 EuAzY3Ym2YyY+nPp9vfsHi/StLuHhi/1biptIAb4kuFOkjGA2ZZSQ6oRVR/z1PV0lRbS
 qX6jpKzkFX5bT6UQSAeGUj8pMQ5wBYY490zTejvw9Ig79CKtXEEaBbckMx5umTbGJLoL
 jTdyqx/AL1IaccQ6IHMEXkSLHmolQtwS1sOvfAmiIekqyhDETsQoB3YYjKjnbxLoiaF1
 sH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=70oiTPRv0w7FE2MLsRVbgiZ8dTQJ/B4k2Scty1V1FuU=;
 b=fBk2Rt4qlALiJc6Ubi60Hl1jIRG5ur5B5P5esg5rtBGoUuQKnWNmBzlG/ksWhbLgqi
 7m18kj+zPJunbL07YCEmKJtA+V+EHN+aYbg4ENDR0pbpp9ZPuj6KCcJp95tRV8Q57fZl
 1QLx6ynrqqryDoehOdPFJ/+Ds7igx6IpzTCJd5+JkaQK0VYholanOgyUgA8ZV6g5ddg1
 vtNiO7V/Z3iCPBsJxfJA7UK3m5q2tm0sogC/gzkF5DMDISjr+aHjupeoEd+sSMlV/wPm
 cHGcINGLf32xeo7XJhlMyHtd33whaFO7pHwIr5R1RikQVGOod2IjlwEgDE/JKO/LXJZB
 IjEA==
X-Gm-Message-State: AOAM532ap933ymuw/9r8Zc03ZE44LsyuYiqx5VwqRG4bHBVK8Efgj7t6
 OGfwSGx9xlCt66etqbumTNe6YsNFQP4VCA==
X-Google-Smtp-Source: ABdhPJy66fgwB1Ba3PO0EzjRIMd2orHQBICO/MbU+2p/kHOK2oRT4j2q7ViAewvH9o5kiQ+h43/psQ==
X-Received: by 2002:a05:600c:1550:: with SMTP id
 f16mr23245428wmg.97.1615764582442; 
 Sun, 14 Mar 2021 16:29:42 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm12054487wmd.41.2021.03.14.16.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
Date: Mon, 15 Mar 2021 00:29:10 +0100
Message-Id: <20210314232913.2607360-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict CPU I/O instructions to architectures providing
I/O bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/libqos/fw_cfg.h | 3 +++
 tests/qtest/libqos/fw_cfg.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
index c6a7cf8cf05..3bfb6d6d55b 100644
--- a/tests/qtest/libqos/fw_cfg.h
+++ b/tests/qtest/libqos/fw_cfg.h
@@ -36,6 +36,8 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char *filename,
 
 QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
 void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
+
+#ifdef TARGET_HAS_IOPORT
 QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
 void io_fw_cfg_uninit(QFWCFG *fw_cfg);
 
@@ -48,6 +50,7 @@ static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
 {
     io_fw_cfg_uninit(fw_cfg);
 }
+#endif /* TARGET_HAS_IOPORT */
 
 G_DEFINE_AUTOPTR_CLEANUP_FUNC(QFWCFG, mm_fw_cfg_uninit)
 
diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
index 6b8e1babe51..db2b83f5212 100644
--- a/tests/qtest/libqos/fw_cfg.c
+++ b/tests/qtest/libqos/fw_cfg.c
@@ -131,6 +131,7 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
     g_free(fw_cfg);
 }
 
+#ifdef TARGET_HAS_IOPORT
 static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
 {
     qtest_outw(fw_cfg->qts, fw_cfg->base, key);
@@ -162,3 +163,4 @@ void io_fw_cfg_uninit(QFWCFG *fw_cfg)
 {
     g_free(fw_cfg);
 }
+#endif /* TARGET_HAS_IOPORT */
-- 
2.26.2


