Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0429228BF
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 22:29:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSSQj-0004RB-2s
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 16:29:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSHt-0005TH-V6
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:20:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSHs-0007Q5-Tb
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:20:05 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSHs-0007P4-OL
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:20:04 -0400
Received: by mail-pl1-x641.google.com with SMTP id d21so5714097plr.3
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YyTYkMwm92ztd6dS65T9tL/otWEXmt+Z9GOHdiUg3L0=;
	b=dEbW89JOxhl4goqUeqjzjcGhBl4DSTSNDfUkk5i129OTweZziUjDMNu7fWwQl2VYsv
	HngB4CVHSva9RTL25TZGBNizVx1gMP06JPQz3M0yiyUqjwQu8f1OhUFE3o9o8DZalUxb
	eYYdQKmRQeehRt7ruSCfM3jsNyHugB3eUhwQhRqw186IGJbJtj3ifRqC4dK+pQRKcnIb
	JOvvPakkDS13a7Ts1P4eI9yc24mV/Ee//6rUejGNKHhUPB7B5w43+JPz2aOfhcgg3FoS
	bGUfDOQWVNWYSJPikfXFAJbxUPtUOupbqUN4PFmdS5FeOb5TLxHgWqfdIk2CQNDuiM6M
	1MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YyTYkMwm92ztd6dS65T9tL/otWEXmt+Z9GOHdiUg3L0=;
	b=YOyupgBMeDi6/flw/hE6dEG5vHTeZ+pZ6x3/bMLtECv51MJpo7Eyr/OS+JeIVQwUKV
	655hiCaLOQrIs9HWxQKWTA0M/0GEW0T1JhdoDZ2NNr/wRF8yFSZzwcXD8mGvTVBeW79O
	Bc2CPbJ3Hzuo+IOH5xQ7wumOKLURhsb9agWl0NL7pt3ZggK74d7TsJgH3a9fOmQmuAXZ
	zTU2OTUcb++43Le9mc9hk2Tm+eaSLM7Qg2SgM4eoRA6kQY913Kw5NpdVkNCGKmDTm9M3
	gy8/AJq8+map0czLacFq4tLzNKqWnNHKtm3yTTnoZwBJPO8o+2XpxDiQ8hUhJ01sKQ3D
	fZyg==
X-Gm-Message-State: APjAAAXtjhF5NvqNPJyje8Cyi0jE7t66Qn6wBJG1+ZvvuLfjq3QRrNhv
	xh6UYNbPNjFTlPjXjIxElvmK3uu8vIk=
X-Google-Smtp-Source: APXvYqwzW2cNxFDZhE++oPT2bPEhqjlxfisS8zaqhPhgcdQrIqWDEtavGz4Ap4Mj6la5RIxk/12sMA==
X-Received: by 2002:a17:902:8214:: with SMTP id
	x20mr49272305pln.308.1558297202809; 
	Sun, 19 May 2019 13:20:02 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	e14sm18166264pff.60.2019.05.19.13.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:20:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:19:45 -0700
Message-Id: <20190519201953.20161-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519201953.20161-1-richard.henderson@linaro.org>
References: <20190519201953.20161-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH 05/13] target/sparc: Define an enumeration for
 accessing env->regwptr
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index f31e8535df..f0ac3ac086 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -31,6 +31,39 @@
 
 /*#define EXCP_INTERRUPT 0x100*/
 
+/* Windowed register indexes.  */
+enum {
+    WREG_O0,
+    WREG_O1,
+    WREG_O2,
+    WREG_O3,
+    WREG_O4,
+    WREG_O5,
+    WREG_O6,
+    WREG_O7,
+
+    WREG_L0,
+    WREG_L1,
+    WREG_L2,
+    WREG_L3,
+    WREG_L4,
+    WREG_L5,
+    WREG_L6,
+    WREG_L7,
+
+    WREG_I0,
+    WREG_I1,
+    WREG_I2,
+    WREG_I3,
+    WREG_I4,
+    WREG_I5,
+    WREG_I6,
+    WREG_I7,
+
+    WREG_SP = WREG_O6,
+    WREG_FP = WREG_I6,
+};
+
 /* trap definitions */
 #ifndef TARGET_SPARC64
 #define TT_TFAULT   0x01
-- 
2.17.1


