Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203101D1CA6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 19:54:59 +0200 (CEST)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYvas-0005WD-5w
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 13:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jYvXh-0000jS-H4
 for qemu-devel@nongnu.org; Wed, 13 May 2020 13:51:41 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jYvXg-0004xc-Ci
 for qemu-devel@nongnu.org; Wed, 13 May 2020 13:51:41 -0400
Received: by mail-wr1-x442.google.com with SMTP id y3so567639wrt.1
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZ7Kz7mTKR6F85RFkM8gYJqayYGL/UEHlzggZx2/D6I=;
 b=Hewj1P5TdhhgUKPudvdnzaBTw1wD+rS6hItKNQ+o/MlUR1xpwEtapYYZvzP2ha2udC
 P8GGrL7w6Iulx4T42llediNkBOWnWn0S3HBHBCJuGS+QeLWQef5e0x0xUVbjk5mfmwEA
 xGJ196Hizcgsw2QldS34Et1VGioPsW/VuoYn9r6JmeSLwiiZymeNEenykwfOkunEyGnP
 4PS9gvoLMiIcvo3+lBbWBCW5gHi/RQStGJ3tgvJ2wHPt5WCqlwQv0xx5oOinppV7288g
 3aLRK6lPrggMTrtadLk5v7Put1Boy75RE8qI0hWkch9r8qvdMnIfMBxITBdw0BZm6Zwq
 Eb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZ7Kz7mTKR6F85RFkM8gYJqayYGL/UEHlzggZx2/D6I=;
 b=CpnmXl2cBCQb7RqXUX5YCqAI+7LFCH2XLmEbVtQ7KbhDCqwiK8cHffAEnrcxgGXCO+
 6PB4mIWI45qF5xWBWWOPuKbEsYo39TQhwWnGxD3IPxAKHwk1pe5PnLNLxtrhgA2CI9/Y
 HZsDfvnx8mMeT3UUtOJUlaiJ/jYka0k6aREqCBHkUlmK35HOtWmEdm5l4mCJcq7TNG8u
 76svRZew6dEgYoZNBYKVXD+cBfR2ISuXAETJPGZFKtnEfmbwH424XHE91vjFqIex6ORd
 36TWIM1IIjicxinjKm404D4kmlsA5l/tB/1bA+03xaynXZHpemf3GQOPgJ/9C/uLGqpO
 NDug==
X-Gm-Message-State: AOAM5300fVovLcGFrUicBHTadJKeor5k8PqitmA9UwzpAmps8hBevqKB
 STXzBcf7wYx7vNZmomhH2uV/NQ==
X-Google-Smtp-Source: ABdhPJzo0F2eCpzJaZ7q/lTE5hd09h5NPTqtvEMUYNOIUfvROrhN7TNDy9ksN8hdlCCI/+bGC8AmOw==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr482206wrn.137.1589392299029; 
 Wed, 13 May 2020 10:51:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q17sm19462878wmk.36.2020.05.13.10.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 10:51:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E21DB1FF87;
 Wed, 13 May 2020 18:51:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/10] tests/guest-debug: catch hanging guests
Date: Wed, 13 May 2020 18:51:25 +0100
Message-Id: <20200513175134.19619-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200513175134.19619-1-alex.bennee@linaro.org>
References: <20200513175134.19619-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If gdb never actually connected with the guest we need to catch that
and clean-up after ourselves.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200512104338.27365-1-alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index d9af9573b9e..71c55690546 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -80,4 +80,10 @@ if __name__ == '__main__':
         print("GDB crashed? SKIPPING")
         exit(0)
 
+    try:
+        inferior.wait(2)
+    except subprocess.TimeoutExpired:
+        print("GDB never connected? Killed guest")
+        inferior.kill()
+
     exit(result)
-- 
2.20.1


