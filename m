Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7CA1A269
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 19:36:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP9S6-0003ZC-SZ
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 13:36:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP9MM-0007Mt-7F
	for qemu-devel@nongnu.org; Fri, 10 May 2019 13:31:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hP9ML-00062F-8d
	for qemu-devel@nongnu.org; Fri, 10 May 2019 13:31:02 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hP9ML-00061w-2q
	for qemu-devel@nongnu.org; Fri, 10 May 2019 13:31:01 -0400
Received: by mail-pg1-x542.google.com with SMTP id 145so3326791pgg.9
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=z+TkCJ+Ncy1KMgA4q+7eFD+GiqzlCrNmhclplUZOTOM=;
	b=j3X58ZE1k7hy5YSY4BDHgwcCYZD3EhMDS84VcsG7JsqgUAFqVeGU42oVDvrITnrB8H
	5vDR+S35M/tU3ca9/dbv5x9qFGWivH4Dk3W54Oz1gdKw+LqRVM4oXGxh0g95w+3xz4T3
	m+ongJtMi+ZGN3TKijgLFYU1JudIKbnmF14IO74uQfLkHs5HaaosdtmCYKEMpbcStM5P
	MHw2/Lvh2L9dHR8IEIIruB7TcxBCt/gUk5MG/g6RnkXCRBRCDhVcNwswn0x07khxV1UP
	1d8tYyjn3orljsVlnVcJ3Ly+0DCaCMT+LPFyD8zn88gQppRRmzqZtkznDIeEpi9jmJck
	jW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z+TkCJ+Ncy1KMgA4q+7eFD+GiqzlCrNmhclplUZOTOM=;
	b=TQArVo5MjwkLw6hNzLdilmwlQK4lqlntV+/qqhpHiHzhwzWZrm6CCcr5bD/gmJhVnT
	6qH8SBxve6u8BTvlcK/R9JWSX+zbl+Yt2FJdLbW8Oe1+hCSwGnKIH7FRkBBxHswJ90zw
	WPvYc5pyUpQ8dl8ucbTdIQUT6yc/iF2JNoRLQwzmeie6i070soOWgmB4qF3X6bN8vmSF
	7n1lNYWS3UaW0xGS6BskckGtYtv5RLFscXeevVEdEc9AiI5L/zXkRqu0OvTzjHm9YZYh
	GNlaeYLBLkqvV7wNlcQv5Hsft6O1yHrND39mrkYfCivOF42zPjO9SMdrgeKLBQNbX6h4
	SxoA==
X-Gm-Message-State: APjAAAV/beMcNeDEfmTCqjTQhoLvmj6QNAmclQps8Gi+9hovdJymHMYz
	O1OBJ6NRYKdVUhiMRL6D5FAyFj6lyQ0=
X-Google-Smtp-Source: APXvYqyvU+R10Z68ltotgmq2A4wa6z3tDMH6ntZiRsBvhH8P2HYNFJDmQQl1lKfQvWlvAdeqHQuQTA==
X-Received: by 2002:aa7:842f:: with SMTP id q15mr16120205pfn.161.1557509459887;
	Fri, 10 May 2019 10:30:59 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	v64sm7936792pfv.106.2019.05.10.10.30.58 for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 10:30:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 10:30:31 -0700
Message-Id: <20190510173049.28171-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510173049.28171-1-richard.henderson@linaro.org>
References: <20190510173049.28171-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v6 07/25] crypto: Change the
 qcrypto_random_bytes buffer type to void*
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using uint8_t* merely requires useless casts for use with
other types to be filled with randomness.

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/random.h  | 2 +-
 crypto/random-gcrypt.c   | 2 +-
 crypto/random-gnutls.c   | 2 +-
 crypto/random-platform.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/crypto/random.h b/include/crypto/random.h
index 8764ca0562..fde592904e 100644
--- a/include/crypto/random.h
+++ b/include/crypto/random.h
@@ -34,7 +34,7 @@
  *
  * Returns 0 on success, -1 on error
  */
-int qcrypto_random_bytes(uint8_t *buf,
+int qcrypto_random_bytes(void *buf,
                          size_t buflen,
                          Error **errp);
 
diff --git a/crypto/random-gcrypt.c b/crypto/random-gcrypt.c
index 9f1c9ee60e..7aea4ac81f 100644
--- a/crypto/random-gcrypt.c
+++ b/crypto/random-gcrypt.c
@@ -24,7 +24,7 @@
 
 #include <gcrypt.h>
 
-int qcrypto_random_bytes(uint8_t *buf,
+int qcrypto_random_bytes(void *buf,
                          size_t buflen,
                          Error **errp G_GNUC_UNUSED)
 {
diff --git a/crypto/random-gnutls.c b/crypto/random-gnutls.c
index 445fd6a30b..ed6c9ca12f 100644
--- a/crypto/random-gnutls.c
+++ b/crypto/random-gnutls.c
@@ -26,7 +26,7 @@
 #include <gnutls/gnutls.h>
 #include <gnutls/crypto.h>
 
-int qcrypto_random_bytes(uint8_t *buf,
+int qcrypto_random_bytes(void *buf,
                          size_t buflen,
                          Error **errp)
 {
diff --git a/crypto/random-platform.c b/crypto/random-platform.c
index cb3ca1bc09..66624106fe 100644
--- a/crypto/random-platform.c
+++ b/crypto/random-platform.c
@@ -64,8 +64,8 @@ int qcrypto_random_init(Error **errp)
     return 0;
 }
 
-int qcrypto_random_bytes(uint8_t *buf G_GNUC_UNUSED,
-                         size_t buflen G_GNUC_UNUSED,
+int qcrypto_random_bytes(void *buf,
+                         size_t buflen,
                          Error **errp)
 {
 #ifdef _WIN32
-- 
2.17.1


