Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433DAAE68F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:19:33 +0200 (CEST)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7cJ9-00019u-HO
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i7bqy-0000r3-CP
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:50:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i7bqx-0000ez-Dq
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:50:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42957)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i7bqx-0000ef-5i
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:50:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id q14so18392391wrm.9
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YlfluaHGLx72DnzBu/a39JxtiDjcvKmVMnNy0x5Tr94=;
 b=C/jE2z8Uc5vowk4G4n9qZm57bOlbvoRZ+8YPRGHDRoGSB6x1Ti+yh1wG44jeFHhO/v
 j8+BlrvIkttDOkdxiBvLs29vUtQKGDAB5FmFFoRaM/AM56coSAFdmGMfan/+UCuYCRZ0
 8fzUzjtdLrkN2g757VOm0ddRSUnIDr0xPdVs/y1HuM3KEi9tjJBRzOJLaK27FP1IpTYS
 821o6vSJUyFFQxggEO8FfTBxuXwn2UdMMwAcYn6ECqrogk1BqHMwECxuthPp6qCXXkaT
 oeQtCsqVenmVwjsZWIdov5/yWW97j2X/4ND7v+Ic+FuJV+NdsBQoqKa6ui84NgXVgki6
 FQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YlfluaHGLx72DnzBu/a39JxtiDjcvKmVMnNy0x5Tr94=;
 b=sLzcszAsKWype9n53Sc+8/edof9UBgEqELals4XzMgANDi+wl1uMSt//oKnbncC4dj
 YGiaSMN207VNcQ7v3F0F3I6l4v8L3J5R1KpA09c6AmchnzJPp/Qb2Aqmok82KCT7aNeo
 Flvj7TRTqsvltSX46Izj9uyFR0LR3hByfby8rdzCdvzEqgERdno2zOzbtejJql6R2uiV
 rLkf3R3Bag4q0AaDt9BEPZAweGMLXISNbahaEMRdX0dwFsSjWW5Czmr8lGqZyy6acPmy
 XBoihLsxHaMTjeAMtbJcmE2bgpGrelv5SAg0cTgbEgUdDKMhzNZb3Zw1medImaZcX4rX
 he4w==
X-Gm-Message-State: APjAAAUIxsUch1HmWd8iABrBqyR07seWYlGl9W4a0SbjJ2MeMRwbt6z8
 wJo6SY8Ja7fkpREXAjYGsb36qg==
X-Google-Smtp-Source: APXvYqxWf10HlCOpxJY7HrJldEuD0SxFmtEoJ/I6KcST3xhY2kPK9qU0x2YxO4IzuRiAONCrrJjBcg==
X-Received: by 2002:a5d:6306:: with SMTP id i6mr20257578wru.323.1568105422150; 
 Tue, 10 Sep 2019 01:50:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm21991496wrg.24.2019.09.10.01.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 01:50:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A30BC1FFB8;
 Tue, 10 Sep 2019 09:43:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 10 Sep 2019 09:43:37 +0100
Message-Id: <20190910084349.28817-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910084349.28817-1-alex.bennee@linaro.org>
References: <20190910084349.28817-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-devel] [PULL 33/45] configure: check if --no-pie is supported
 first
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For whatever reason this doesn't trigger normally but because
compile_prog uses QEMU_CFLAGS we end up trying to build a -pie
--no-pie build which confuses compilers on some non-x86 hosts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/configure b/configure
index 7860bbc3121..30aad233d17 100755
--- a/configure
+++ b/configure
@@ -2021,6 +2021,12 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 
 EOF
+  # check we support --no-pie first...
+  if compile_prog "-Werror -fno-pie" "-no-pie"; then
+    CFLAGS_NOPIE="-fno-pie"
+    LDFLAGS_NOPIE="-nopie"
+  fi
+
   if compile_prog "-fPIE -DPIE" "-pie"; then
     QEMU_CFLAGS="-fPIE -DPIE $QEMU_CFLAGS"
     LDFLAGS="-pie $LDFLAGS"
@@ -2036,11 +2042,6 @@ EOF
       pie="no"
     fi
   fi
-
-  if compile_prog "-Werror -fno-pie" "-nopie"; then
-    CFLAGS_NOPIE="-fno-pie"
-    LDFLAGS_NOPIE="-nopie"
-  fi
 fi
 
 ##########################################
-- 
2.20.1


