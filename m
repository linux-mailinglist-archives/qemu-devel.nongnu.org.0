Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A976221225
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 04:42:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRSov-0006qz-Nd
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 22:42:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRSmT-0005N7-Vg
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRSmS-00020F-Su
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:33 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hRSmS-0001z1-Hg
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:32 -0400
Received: by mail-pf1-x444.google.com with SMTP id g3so2874892pfi.4
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 19:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WcaPjSSW8mCEGy+vfZffpT+ukMC7uteGhxOw5c2wJXo=;
	b=eMIrOXYTkmwdbKy0BVDOdex8ZRzpUfMt2rt4b2otHHA2EQkAH1bntzSRkGXeZWLxjw
	6vG2a8zUMiGNOSDdHPlFqnvbdQMcduQBOb8uuyB4P+r0QBQW1CqGAo2ZIxLdz4ZLTjqW
	LWpKDqd72/ycLmktsQ25J9RaWGP6G+qM+VCBKgW61oyMSUaoV/AYrxa9lDStiJodHE9E
	fsPSBoCh3F5PGFJ5fPhByf5jvbL0XSF4PFhJtkOtSHc+wBgJQBGMPHxfi0WjJ7zeEMqE
	BOsBvDFZV1/Yz35aTE9Kf1Vk/N4VHc28Lv/ZpkoZaIcw3HWQbIQuHjCnhUjUmbDXIkUi
	Z+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WcaPjSSW8mCEGy+vfZffpT+ukMC7uteGhxOw5c2wJXo=;
	b=b4nK+q8Hq8sr03lPg3dVWsRdaHpQQ4ttz1N9X8NOgkkH4sAsfLqadyRrOcpChxyFkv
	Zvb7QRoOeNspwpcq88J67htM0Zx3LDyuFRdJLVyPXrFcJGTXLrI+lbODrLMyLezuZgnb
	2z4k7zmvII6QIvtbB/NZY7k1P3KMN8ewd0V4BmqGBWNMrPjU2TlKI7f9vH5k5t1yvU1a
	IKlHNBlOhVi2Jlk+H/16A2+HzAn+KqjZ0Eqj5SwTrSCa+HfZW2YSJuz6onQBdPxdD10J
	0Yn/iATG/cE7yNM3At+PmrQll+x77rHBlZsiVGtYHzwtLiEcW7UurPxE4I7MVAyMT7pK
	8HDA==
X-Gm-Message-State: APjAAAXdh1tqxeAsD8Ht4MYHCkRvCUZrPo8OL0OrENU70vjJhSSXI7bW
	QWuILP5oPqC4ngMJ4VWd6XoWtmtBr1w=
X-Google-Smtp-Source: APXvYqxMdAeSNFxLA4hUHR/ZkJ2EyqEF8U02Xq7k1Fr8dATDTzKgaPE2GBdHXI8meJRLfPsKRx0IeA==
X-Received: by 2002:a65:5c89:: with SMTP id a9mr54354788pgt.334.1558060770900; 
	Thu, 16 May 2019 19:39:30 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id w6sm6984152pge.30.2019.05.16.19.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 19:39:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 16 May 2019 19:39:02 -0700
Message-Id: <20190517023924.1686-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517023924.1686-1-richard.henderson@linaro.org>
References: <20190517023924.1686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v8 03/25] crypto: Reverse code blocks in
 random-platform.c
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
Cc: lvivier@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use #ifdef _WIN32 instead of #ifndef _WIN32.
This will make other tests easier to sequence.

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/random-platform.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/crypto/random-platform.c b/crypto/random-platform.c
index 7541b4cae7..f995fc0ef1 100644
--- a/crypto/random-platform.c
+++ b/crypto/random-platform.c
@@ -32,7 +32,14 @@ static int fd; /* a file handle to either /dev/urandom or /dev/random */
 
 int qcrypto_random_init(Error **errp)
 {
-#ifndef _WIN32
+#ifdef _WIN32
+    if (!CryptAcquireContext(&hCryptProv, NULL, NULL, PROV_RSA_FULL,
+                             CRYPT_SILENT | CRYPT_VERIFYCONTEXT)) {
+        error_setg_win32(errp, GetLastError(),
+                         "Unable to create cryptographic provider");
+        return -1;
+    }
+#else
     /* TBD perhaps also add support for BSD getentropy / Linux
      * getrandom syscalls directly */
     fd = open("/dev/urandom", O_RDONLY);
@@ -44,15 +51,7 @@ int qcrypto_random_init(Error **errp)
         error_setg(errp, "No /dev/urandom or /dev/random found");
         return -1;
     }
-#else
-    if (!CryptAcquireContext(&hCryptProv, NULL, NULL, PROV_RSA_FULL,
-                             CRYPT_SILENT | CRYPT_VERIFYCONTEXT)) {
-        error_setg_win32(errp, GetLastError(),
-                         "Unable to create cryptographic provider");
-        return -1;
-    }
 #endif
-
     return 0;
 }
 
@@ -60,7 +59,15 @@ int qcrypto_random_bytes(uint8_t *buf G_GNUC_UNUSED,
                          size_t buflen G_GNUC_UNUSED,
                          Error **errp)
 {
-#ifndef _WIN32
+#ifdef _WIN32
+    if (!CryptGenRandom(hCryptProv, buflen, buf)) {
+        error_setg_win32(errp, GetLastError(),
+                         "Unable to read random bytes");
+        return -1;
+    }
+
+    return 0;
+#else
     int ret = -1;
     int got;
 
@@ -82,13 +89,5 @@ int qcrypto_random_bytes(uint8_t *buf G_GNUC_UNUSED,
     ret = 0;
  cleanup:
     return ret;
-#else
-    if (!CryptGenRandom(hCryptProv, buflen, buf)) {
-        error_setg_win32(errp, GetLastError(),
-                         "Unable to read random bytes");
-        return -1;
-    }
-
-    return 0;
 #endif
 }
-- 
2.17.1


