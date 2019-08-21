Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3798267
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:11:40 +0200 (CEST)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0V59-0004xk-7U
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URY-0001WB-AI
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URW-0007sm-N5
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:43 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:40497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0URW-0007sR-HM
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:42 -0400
Received: by mail-yb1-xb43.google.com with SMTP id g7so1338695ybd.7
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4A9C2L46vAXwKZhyDA+ICHUAa54BeR9KBizREODjwCw=;
 b=uIGb93tRbzRUVZVwv0iIUcHpXW1wHM9igvLUkxucm/tkJdAA589fUkMeRtqm21aoaD
 q2XyYu9NsIioYe1gjp/EcqA9H+mG8Y5A9/5agYLu39i7rfXmZXrhJML02gEU/yJ7J3pP
 MTsrhOhAlcmozo7zbftPx+6+p1qbsscvtmh5R5Pu+MtTp/BBQYhHLaaRPtNPBztblpKO
 OpkIOwQ24QHW8OuRd0YemCiQOLBPMt+XUywxXQpkRke2SO1lNtg7/2vci2PwrALRJaec
 4NsPJ8RTKFJuuu4XD02Qs6WFMGDb4OHKYw5ueO8yefLydoskR3rVLrPzKqUxc1r+cbUB
 i95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4A9C2L46vAXwKZhyDA+ICHUAa54BeR9KBizREODjwCw=;
 b=ZP1APlFUANCJL5aNSGDFXUaEmVzBi0ms/eUJAPOWgTXibtqOetn0yFBXeEi9b2ENqY
 yI2tFP8ORp/x3JFqlN0cdE8Ug/nGHRb2Ww9YpcmtbMDMfj3I4juaecosH2zukos1oUXt
 5sGj1tHpq7SP4Ynat1rkyAqHvsXnr9GGccM8oP4LFCPcVWYHpue4uIeQkVY7D6zOy0Nu
 bMaNnY8kOI6fBhvjhXwOnVcsJMMuQm2mllHkeNE++w4K0+ZHfzWAtPO/GC75YlwKXtf5
 pajGWKZ3Rl2c9zp40iCuz2x8R9T0oIMV41odhFqfBPWPGzX474KuwNdO+lyqlYCo09OA
 8HWg==
X-Gm-Message-State: APjAAAVcGRa5+OoZ7Y+TYxA7DzmcpupYa0ZrDekpSxHYkHnnzD7bZwEx
 RX8nNFZfskkWMOQlb2cN9JVQTq9J
X-Google-Smtp-Source: APXvYqxa3saaZ9vn41bMqKBcTIv5N5cvJTYJCVTn+4BsDiMM4JPmVGo2gCdrdMBuf+BygAhad0J5UA==
X-Received: by 2002:a25:6b43:: with SMTP id o3mr24802663ybm.295.1566408641892; 
 Wed, 21 Aug 2019 10:30:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:41 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:29:18 -0400
Message-Id: <20190821172951.15333-43-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
Subject: [Qemu-devel] [RFC PATCH v4 42/75] target/i386: introduce SSE2
 translators
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the translator macros to define translators required by SSE2
instructions.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index d1537bc1b7..43917edc76 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -6064,14 +6064,20 @@ DEF_TRANSLATE_INSN1(Md)
     }
 
 DEF_TRANSLATE_INSN2(Ed, Pq)
+DEF_TRANSLATE_INSN2(Ed, Vdq)
 DEF_TRANSLATE_INSN2(Eq, Pq)
+DEF_TRANSLATE_INSN2(Eq, Vdq)
 DEF_TRANSLATE_INSN2(Gd, Nq)
 DEF_TRANSLATE_INSN2(Gd, Udq)
 DEF_TRANSLATE_INSN2(Gd, Wd)
+DEF_TRANSLATE_INSN2(Gd, Wq)
 DEF_TRANSLATE_INSN2(Gq, Nq)
 DEF_TRANSLATE_INSN2(Gq, Udq)
 DEF_TRANSLATE_INSN2(Gq, Wd)
+DEF_TRANSLATE_INSN2(Gq, Wq)
+DEF_TRANSLATE_INSN2(Md, Gd)
 DEF_TRANSLATE_INSN2(Mdq, Vdq)
+DEF_TRANSLATE_INSN2(Mq, Gq)
 DEF_TRANSLATE_INSN2(Mq, Pq)
 DEF_TRANSLATE_INSN2(Mq, Vdq)
 DEF_TRANSLATE_INSN2(Mq, Vq)
@@ -6079,15 +6085,30 @@ DEF_TRANSLATE_INSN2(Pq, Ed)
 DEF_TRANSLATE_INSN2(Pq, Eq)
 DEF_TRANSLATE_INSN2(Pq, Nq)
 DEF_TRANSLATE_INSN2(Pq, Qq)
+DEF_TRANSLATE_INSN2(Pq, Uq)
+DEF_TRANSLATE_INSN2(Pq, Wdq)
 DEF_TRANSLATE_INSN2(Pq, Wq)
 DEF_TRANSLATE_INSN2(Qq, Pq)
+DEF_TRANSLATE_INSN2(UdqMq, Vq)
 DEF_TRANSLATE_INSN2(Vd, Ed)
 DEF_TRANSLATE_INSN2(Vd, Eq)
 DEF_TRANSLATE_INSN2(Vd, Wd)
+DEF_TRANSLATE_INSN2(Vd, Wq)
+DEF_TRANSLATE_INSN2(Vdq, Ed)
+DEF_TRANSLATE_INSN2(Vdq, Eq)
+DEF_TRANSLATE_INSN2(Vdq, Nq)
 DEF_TRANSLATE_INSN2(Vdq, Qq)
+DEF_TRANSLATE_INSN2(Vdq, Udq)
 DEF_TRANSLATE_INSN2(Vdq, Wdq)
+DEF_TRANSLATE_INSN2(Vdq, Wq)
+DEF_TRANSLATE_INSN2(Vq, Ed)
+DEF_TRANSLATE_INSN2(Vq, Eq)
+DEF_TRANSLATE_INSN2(Vq, Wd)
+DEF_TRANSLATE_INSN2(Vq, Wq)
 DEF_TRANSLATE_INSN2(Wd, Vd)
 DEF_TRANSLATE_INSN2(Wdq, Vdq)
+DEF_TRANSLATE_INSN2(Wq, Vq)
+DEF_TRANSLATE_INSN2(modrm_mod, modrm)
 
 #define DEF_TRANSLATE_INSN3(opT1, opT2, opT3)                           \
     static void translate_insn3(opT1, opT2, opT3)(                      \
@@ -6128,15 +6149,22 @@ DEF_TRANSLATE_INSN2(Wdq, Vdq)
     }
 
 DEF_TRANSLATE_INSN3(Gd, Nq, Ib)
+DEF_TRANSLATE_INSN3(Gd, Udq, Ib)
 DEF_TRANSLATE_INSN3(Gq, Nq, Ib)
+DEF_TRANSLATE_INSN3(Gq, Udq, Ib)
 DEF_TRANSLATE_INSN3(Nq, Nq, Ib)
 DEF_TRANSLATE_INSN3(Pq, Pq, Qd)
 DEF_TRANSLATE_INSN3(Pq, Pq, Qq)
 DEF_TRANSLATE_INSN3(Pq, Qq, Ib)
+DEF_TRANSLATE_INSN3(Udq, Udq, Ib)
 DEF_TRANSLATE_INSN3(Vd, Vd, Wd)
+DEF_TRANSLATE_INSN3(Vdq, Vdq, Mq)
 DEF_TRANSLATE_INSN3(Vdq, Vdq, UdqMhq)
 DEF_TRANSLATE_INSN3(Vdq, Vdq, Wdq)
+DEF_TRANSLATE_INSN3(Vdq, Vq, Mq)
 DEF_TRANSLATE_INSN3(Vdq, Vq, Wq)
+DEF_TRANSLATE_INSN3(Vdq, Wdq, Ib)
+DEF_TRANSLATE_INSN3(Vq, Vq, Wq)
 
 #define DEF_TRANSLATE_INSN4(opT1, opT2, opT3, opT4)                     \
     static void translate_insn4(opT1, opT2, opT3, opT4)(                \
@@ -6184,8 +6212,11 @@ DEF_TRANSLATE_INSN3(Vdq, Vq, Wq)
 
 DEF_TRANSLATE_INSN4(Pq, Pq, RdMw, Ib)
 DEF_TRANSLATE_INSN4(Vd, Vd, Wd, Ib)
+DEF_TRANSLATE_INSN4(Vdq, Vdq, RdMw, Ib)
 DEF_TRANSLATE_INSN4(Vdq, Vdq, Wd, modrm_mod)
 DEF_TRANSLATE_INSN4(Vdq, Vdq, Wdq, Ib)
+DEF_TRANSLATE_INSN4(Vdq, Vdq, Wq, modrm_mod)
+DEF_TRANSLATE_INSN4(Vq, Vq, Wq, Ib)
 
 #define DEF_TRANSLATE_INSN5(opT1, opT2, opT3, opT4, opT5)               \
     static void translate_insn5(opT1, opT2, opT3, opT4, opT5)(          \
-- 
2.20.1


