Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1FE1D0F6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 23:00:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQeXV-0000cM-9s
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 17:00:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1hQeUz-0007pr-OZ
	for qemu-devel@nongnu.org; Tue, 14 May 2019 16:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1hQeIW-0007Fc-36
	for qemu-devel@nongnu.org; Tue, 14 May 2019 16:45:17 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>) id 1hQeIV-0007Bz-Fg
	for qemu-devel@nongnu.org; Tue, 14 May 2019 16:45:16 -0400
Received: by mail-lf1-x144.google.com with SMTP id c17so261317lfi.2
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6XuVQs+UbdqBAxCFcAT1em7q9SaDATzG83gL/sJvK+Y=;
	b=HVQFqmA4xlQXaLzwLSp4bPZD8cQeF+msCahRfoJdaD/Qi+IvYwqtEqOOiYD5ZQgESE
	QGKdzrLN/uISL9pvNrE96nbdlbrJk8BjccYjtsQDzKLyMOdMStVhPUzzSjORQXNaP6sk
	xwqXi9+bzgt6p3M++O0+75YUjzPXqZGOTV2PCzqayDaw6uhDbRXfLaKf+xpXwWqpLEjV
	PvbWHJmP9Kh93mF8B1SGnteJbVEhnGoEPWTCdsZvnS5rja+JtnkLRrzygeecsTDvlOlQ
	OUfqHnYCisK5x63ak6Sz+6bTIiL+gehccJBhzlk2j3IZT9TjSdajnfDQTyear29Oncx3
	p5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6XuVQs+UbdqBAxCFcAT1em7q9SaDATzG83gL/sJvK+Y=;
	b=cxe3WCf0S0sxEDBYkoagcR1gZP6w0wzEkJnWPfFoeAZykC9PAQSqpx8GoHOjSqpOeo
	f4hHxAWJLHsVeC5lcGZeVBQFXQpkwEx8ZIHLW9ytZTEJik0l+qMAFZ3plRV95lLnhNq2
	1Rl7M1S92iCzT6C9O9RIEwegkIk+2Gm9PYJgyyIHWNezI98OVRP4wqcqCP1i9Kqk7/55
	kG3mP9i0yUFi3w014AWTT8Tjk8ku1GhKFRvG+oFtD8y6d+0ku3uVO3oBkzv2Pih+427m
	zXThDfQm4lTNyXINOD644b4foSEbf0HhKA1viTmibOH1bw5+01CV7qyBD8OZGl+ScyvG
	uRFg==
X-Gm-Message-State: APjAAAVeBT5XQ1CeHfzk1I8SBDuV6gZp5X9FTspsSpk/HUkbLe1W53sE
	XuFbAHRuhUSTiMBOw4+rMFhtExO/6RQ=
X-Google-Smtp-Source: APXvYqwgaB+XP3GWIHAopJCdjUY/U1ovWNM0GiU3jbX/UUmfdjvKPPQxcjv+D4xWGzqWMlPoKMssgA==
X-Received: by 2002:ac2:41da:: with SMTP id d26mr17719241lfi.34.1557866714106; 
	Tue, 14 May 2019 13:45:14 -0700 (PDT)
Received: from octofox.cadence.com
	(jcmvbkbc-1-pt.tunnel.tserv24.sto1.ipv6.he.net. [2001:470:27:1fa::2])
	by smtp.gmail.com with ESMTPSA id 78sm4011lje.81.2019.05.14.13.45.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 13:45:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 13:44:41 -0700
Message-Id: <20190514204447.17486-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514204447.17486-1-jcmvbkbc@gmail.com>
References: <20190514204447.17486-1-jcmvbkbc@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: [Qemu-devel] [PATCH 3/9] target/xtensa: define IDMA and
 gather/scatter IRQ types
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IDMA and scatter/gather features introduced new IRQ types that
overlay_tool.h need to initialize Xtensa configuration.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/cpu.h          | 3 +++
 target/xtensa/overlay_tool.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 502d41688365..d4258fcc6199 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -298,6 +298,9 @@ typedef enum {
     INTTYPE_DEBUG,
     INTTYPE_WRITE_ERR,
     INTTYPE_PROFILING,
+    INTTYPE_IDMA_DONE,
+    INTTYPE_IDMA_ERR,
+    INTTYPE_GS_ERR,
     INTTYPE_MAX
 } interrupt_type;
 
diff --git a/target/xtensa/overlay_tool.h b/target/xtensa/overlay_tool.h
index ea07576bc921..8b380ce5e329 100644
--- a/target/xtensa/overlay_tool.h
+++ b/target/xtensa/overlay_tool.h
@@ -200,6 +200,9 @@
 #define XTHAL_INTTYPE_TBD2 INTTYPE_WRITE_ERR
 #define XTHAL_INTTYPE_WRITE_ERROR INTTYPE_WRITE_ERR
 #define XTHAL_INTTYPE_PROFILING INTTYPE_PROFILING
+#define XTHAL_INTTYPE_IDMA_DONE INTTYPE_IDMA_DONE
+#define XTHAL_INTTYPE_IDMA_ERR INTTYPE_IDMA_ERR
+#define XTHAL_INTTYPE_GS_ERR INTTYPE_GS_ERR
 
 
 #define INTERRUPT(i) { \
-- 
2.11.0


