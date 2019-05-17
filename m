Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1622069
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 00:48:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRldv-0003BE-Sv
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 18:47:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.bobek@gmail.com>) id 1hRlbE-0001CU-HM
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.bobek@gmail.com>) id 1hRlbD-0005KU-Hv
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:12 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:44836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hRlbD-0005J7-D8
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:11 -0400
Received: by mail-yb1-xb43.google.com with SMTP id t62so3219782ybi.11
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 15:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+Po4c2MYiwQPlsRFoqhNsViqq9vMYTJOCyBm8w65Nqc=;
	b=fVaNQVbg0fWUhbvU1EH8c+BfXdwtFT979URQ3vs5ko2dSTc2q5vE5/G4luk40Q+w8Y
	XebEbYoEvomTbOWubJJjXM4Gyc7aVoPXV7LkySHgUwRkWlfbOWePXPV0wkDgmJVnqnex
	d//HEJAAuDlLEYkrr6Ywa6d+Jb5mTom57KsZ9HsfENGkCFBOxYiP5sWRLXEOmnhOsz3u
	jqO8024lLGeJUydXVCg6glvuBdfc5JvitEZtc6q8bJhNK6hdPQCFTX6jM8ez2FxYwecn
	XfOQ2jP2oVs8B+gb52csewY/mXDDQaTb3XkHpzZ9jynAz8iXKeZcnPbAbtF/2hFsrr+C
	sBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+Po4c2MYiwQPlsRFoqhNsViqq9vMYTJOCyBm8w65Nqc=;
	b=pFC1m8UEsOQ87LLMHMO7QIkpJUvK/yDK+x3DmhTQ9kmI05Yrxr8RFbMNpjH1jYPh56
	IMuKtzO8K5o4Js4PAyahaJTIsmgotalNX3qX1/LCuRRXYnREgSensR8RWzeMhpCZezz4
	bwOaCZsjEqoszn6u0C5Pi3rhwaE++XuTY6uLxJLGEHSRLNQTXa6luqY/TxJ7M0Z6pS6h
	bD4GnWEcD1CNxCuOtKTmRHomHzVx4Nt2t4y4j1RK88GkRxkWkYAjnnEzmb5+UTCNUZeI
	uLKw0j088iANNDlDr/VyWgzhbj28EkOfNbkZQ1MvU6krFakS7Mn6gsFk2d2CdDMLIR2R
	W9pA==
X-Gm-Message-State: APjAAAX46wT1TyrIyz8Zh0wO+oae8Z740wYGreXSXEQkhkGx4rCCbdji
	qls6G/2dunzOmNsApvUGM29QpbI9vxDScg==
X-Google-Smtp-Source: APXvYqzcR0Qh4qGAqXnNRK8Sx6MPmUA6lqDBUpKaPIrWMZsIzYeAEusAnmxpP9EX7QqDCnGFj+xGSw==
X-Received: by 2002:a25:828c:: with SMTP id r12mr414403ybk.94.1558133110729;
	Fri, 17 May 2019 15:45:10 -0700 (PDT)
Received: from dionysus.attlocal.net
	(69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
	by smtp.gmail.com with ESMTPSA id
	u73sm2480260ywf.62.2019.05.17.15.45.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 15:45:10 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:44:40 -0400
Message-Id: <20190517224450.15566-2-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517224450.15566-1-jan.bobek@gmail.com>
References: <20190517224450.15566-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b43
Subject: [Qemu-devel] [RISU v2 01/11] Makefile: undefine the arch name symbol
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least GCC defines the symbol "i386" to 1 to signal the target
platform. We need to use "i386" as an undefined symbol in order to
correctly include risu_reginfo_i386.h from risu.h. Add an -U option to
the build command to make sure the symbol remains undefined.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4aad448..b362dbe 100644
--- a/Makefile
+++ b/Makefile
@@ -17,7 +17,7 @@ VPATH=$(SRCDIR)
 
 CFLAGS ?= -g
 
-ALL_CFLAGS = -Wall -D_GNU_SOURCE -DARCH=$(ARCH) $(BUILD_INC) $(CFLAGS) $(EXTRA_CFLAGS)
+ALL_CFLAGS = -Wall -D_GNU_SOURCE -DARCH=$(ARCH) -U$(ARCH) $(BUILD_INC) $(CFLAGS) $(EXTRA_CFLAGS)
 
 PROG=risu
 SRCS=risu.c comms.c reginfo.c risu_$(ARCH).c risu_reginfo_$(ARCH).c
-- 
2.20.1


