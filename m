Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF5152E1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 19:39:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNhaS-0005Ud-7h
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 13:39:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhVA-00012B-GK
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hNhV9-0001J7-Ds
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:34:08 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hNhV9-0001Ge-4C
	for qemu-devel@nongnu.org; Mon, 06 May 2019 13:34:07 -0400
Received: by mail-pf1-x441.google.com with SMTP id l132so2178005pfc.8
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Jdxoq0cd07u7NwCDIf4s8w4ApIde8s71XHdZkh2CqpM=;
	b=mV1tPHz45dpuWrSvod7+7lKaee7aXsf5FBPuk2C13AMjacbAK6WA/YKpDSEqFPWP0o
	v3kfjGtFfB1LGynKc+uRc16OzXhdbxJRfFXxkOwXQykOBnqG5giiF89cO2OlV4XoNjpo
	8Yv1dgWeSFeUVOU0PoIeWGjTpeAbwuwcGMNtlvyUJe9IsvAFDva9gz5LUqnJnJRJhpPT
	2Oa8zeRLAYfmRJzCJTmSCsStXNWL1jBECLmMhlIrMGFgBSRW/aTUWJlZ/+GqI+gjbxZT
	U4lhxqzrQv+c/K3m69/+0OiJd06mhizauRz1WYqJaF6Zrg+979Bnb0WZ+gx0psMmDVre
	otcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jdxoq0cd07u7NwCDIf4s8w4ApIde8s71XHdZkh2CqpM=;
	b=dXAhbJRAbVgo3D8Sabr2sd7de/kDFlAjN7doi2xF/lAJgeiyX5RQDCXftChcWsR9IZ
	4/AV6SSs4sCH3W89GAmI5KTipW6tCQbHo8AJPre/nbSHqc1mevw2249LeZ8A/xATsF1P
	q0D/uoONBhO1VEJTl/2VFcvVrX/X+yYika++Ad9Tjj9NXqfhiox+sAiqxmKJrBGe/cW1
	qBkTxsSgPAIjUt3JXbWzW7aJpJ/JmizJJXMFzmswTVVuxiZid0lx69Mx3LIyI65J3+jq
	zCWlZf5tiZFYcuMY2fuxlBbKkcebISy4QuyS+0/fpm3cMICLUFIVv/TCj+0jDZTMH2AP
	8rPw==
X-Gm-Message-State: APjAAAUdA4eoSVJ5q6xXw4JPCWkXi8mCRFogoAzFg6X3wijh8b1DAmxX
	Re3YzD8Sx1Ar6ws4OH6eA/vWsp0BvAY=
X-Google-Smtp-Source: APXvYqyN2IMfHi0RoEekQO+Xg8qYmDltmFTD+aJuSbvcbxpIZh4SPn9IXYVjXABkgOfYGBR571UDdw==
X-Received: by 2002:a63:2c4c:: with SMTP id s73mr33490534pgs.42.1557164044062; 
	Mon, 06 May 2019 10:34:04 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	k9sm2268839pfa.180.2019.05.06.10.34.03 for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:34:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2019 10:33:36 -0700
Message-Id: <20190506173353.32206-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506173353.32206-1-richard.henderson@linaro.org>
References: <20190506173353.32206-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v4 07/24] crypto: Change the
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


