Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D54CEBA5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:11:06 +0100 (CET)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqfB-0006hm-0c
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVK-0000b5-0q
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:54 -0500
Received: from [2a00:1450:4864:20::42a] (port=33479
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVI-0003v3-JR
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:53 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j17so19401897wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRKKtrjpp0+1DXkNAVw3eWJwoNJF/xGOZH7P/rcwfrk=;
 b=Xfq84Lx9yoMyx5TzzP05HhBAbwQtDgLorefKBpAm1NhTM9obz/l06xAwAKKs3W71tZ
 o2H88kUJnuG2Uy7T2lPLM58m5pX1y2mXbqpNKf4y5N2NEEOFZEc04eY9o/EZbBb6O6nC
 f8jl+i4jsQoJmlHiuVCVeSfff49NRBIzQIipb1jxu3dQKkPzo5gCxW3zqWZJNRAcxYEf
 +VcnxGOK6PrTZZ+hw2H4NZ4FCK3e3pAtbql7f/mmNl1nX+SiZIyQzGPeP2u1BTqN6iBJ
 uLbyBlIzimVmEI4M3MM84L3LYmrXFPXmDgwR7mtDSKXvSiBh6Y/DHwTAcOoeRHTvz9IU
 Ireg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRKKtrjpp0+1DXkNAVw3eWJwoNJF/xGOZH7P/rcwfrk=;
 b=LdxZpod6BJiBL2sA2s1bGcncyQvhDXN2RR9xKJzoOm1XLyf28ET3RRL3hdd4eD3r5j
 ZIWfiPtJWgIBg2SSCCdLNWBpGTjlPyXdiZQqpm7uaCtdzNSk6ItypfyfNDbvxU95kEHz
 cYZ23cOP1rUiuSP8gL+E8iZD80VcSiF3HQCssbAemgg9YBje4TVWy44Bhnvh8XMpkOTw
 JnVSPBorbY0c0nJincs7WWGfnIR5Tqql4b262z4iXuEavyODdocfCMpomr2iIezDyMW/
 jTVOVOkHSqqcqVfyydGUeHWwnfXu0OYLvKuosrzNbFwIE03RDK3QqfqbS9RZY6vxYpge
 Io0w==
X-Gm-Message-State: AOAM532OXf8nKp2ViPXUory3VNbBL2VspIFRWJAJ79zhz06cp7lW/lUF
 CiCKFogPMA6ix6P7g8YOIUpufe6cFCc=
X-Google-Smtp-Source: ABdhPJyjQ+ZbJUP+C2ABsS6u2kt3FFjRW6P7GhI36Ae8nO7PiDxIceSsEP9Cr+bd707G44O0anCVfQ==
X-Received: by 2002:a05:6000:1862:b0:1f1:f526:7901 with SMTP id
 d2-20020a056000186200b001f1f5267901mr1318560wri.485.1646571651161; 
 Sun, 06 Mar 2022 05:00:51 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 e4-20020adffc44000000b001f1dba38a65sm3797010wrs.105.2022.03.06.05.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] softmmu/cpus: Code movement
Date: Sun,  6 Mar 2022 13:59:36 +0100
Message-Id: <20220306130000.8104-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want cpu_thread_is_idle() to use cpus_accel, so declare this
variable earlier.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-10-f4bug@amsat.org>
---
 softmmu/cpus.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 3f8fae43ba6..ac6bec56038 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -67,6 +67,11 @@
 
 static QemuMutex qemu_global_mutex;
 
+/*
+ * The chosen accelerator is supposed to register this.
+ */
+static const AccelOpsClass *cpus_accel;
+
 bool cpu_is_stopped(CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
@@ -122,11 +127,6 @@ void hw_error(const char *fmt, ...)
     abort();
 }
 
-/*
- * The chosen accelerator is supposed to register this.
- */
-static const AccelOpsClass *cpus_accel;
-
 void cpu_synchronize_all_states(void)
 {
     CPUState *cpu;
-- 
2.35.1


