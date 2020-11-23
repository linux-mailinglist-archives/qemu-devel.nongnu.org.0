Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C62C1769
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:13:51 +0100 (CET)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ9i-0002rh-IP
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjn-0002nU-Ek
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:47:03 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:32862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIjl-0001xd-Qr
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:47:03 -0500
Received: by mail-wr1-x443.google.com with SMTP id u12so20185500wrt.0
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sTFpJW58XZ2N3GcSvdqnh8S3DT54Pmk8KnHBCRTI0vQ=;
 b=RIbvTJfR3ywqs/D7FIrlCRH3BHF1yUV8z/SnP3C6ikiZ0GDklbmIjwbnEQslsrGb7G
 6ME4IADdc1mXd17r+UAk4WyOQaK+ehKkpALag601167IiszYzanNyGNsaAV6Uv/4a7EF
 4d2QGJFX0erCjPihXRfEFO8HAt21jkRkuPC2SVI+SRLVvbFp90PBPqd7ZUNE3cjowAQ+
 ITpWO1fMsht/LUlR2qcKKZUm/tyLy+M5DmKUH/kxk/ByuszP7uZIWhjnYhYH2nbi7n9H
 Y1mpth8WX9OZp8WfLrk9z254YRCHR2DOdTohiMLVUMscGD0hcIBqT0684b6y+WzahME0
 sIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sTFpJW58XZ2N3GcSvdqnh8S3DT54Pmk8KnHBCRTI0vQ=;
 b=XN+J8CndIbf9qJpp731Ce+9tknalD19sxFFCu85dz2aZkRxgo/SdSutDEoQamy0kKT
 Q9/4r7ciRhF4QYXDfAmFRmqSyRnXQKePhTWhISI+5n810HCEecfz8qFOyWS53Yh3zAVQ
 NaEMGLsOMMQZqaBZCz4TS1fvvmY3zBfS6XvG4xstO7jFSnH7JP5v8m3skfZj2stSaf9W
 QAAnjgTC7bB5JFoNky3CK5XijB05Ytuo4UDJbGik3CxwzOFj9cHVMhg9/j/oDDg++nUq
 uXavoo5J635s9t/6+DoCNsCdTOvISs/mGDvK19L2unHm61tXxzFHRDO2TQQaAbwbwhmF
 NKAQ==
X-Gm-Message-State: AOAM533GH+uOXt2+v+H+IpUkfDIp4kB4tE8XUX/kQuvuswpmCQCAOvnS
 /owVOcZjssb0CLaDcMIewK0kekEpRJ0=
X-Google-Smtp-Source: ABdhPJxK900Cdw6eRolrggEBV2XkAITvpYUxBvCq0j1KMxqMmbaMroLZv32tqQdSJRYLPg/hM0KJNg==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr1492704wrx.137.1606164420142; 
 Mon, 23 Nov 2020 12:47:00 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id j8sm21331543wrx.11.2020.11.23.12.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/28] MAINTAINERS: Add entry for MIPS Loongson TCG
Date: Mon, 23 Nov 2020 21:44:46 +0100
Message-Id: <20201123204448.3260804-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry for the TCG core related to Loongson.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Adding Huacai and Jiaxun in case they want to be notified of
changes, patch conditional to their individual approval.
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10e87d27eab..0f49b997f2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -241,6 +241,13 @@ F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 K: ^Subject:.*(?i)mips
 
+MIPS TCG CPUs (Loongson)
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Huacai Chen <chenhc@lemote.com>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Odd Fixes
+F: target/mips/vendor-loong*
+
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
 F: disas/nanomips.*
-- 
2.26.2


