Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722AE2F37
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 12:37:51 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNaV3-0006dC-Mw
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 06:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNaGZ-0002Ds-Jn
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNaGY-000471-Hs
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:22:51 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNaGY-00046I-C0
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:22:50 -0400
Received: by mail-wm1-x341.google.com with SMTP id v6so2042122wmj.0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIE39M6WEo2MphCpMZQ+O6lu2X6W83TgfKFvtWGX81M=;
 b=v+Wi+cjTON7oQSupsAjJ5Np2yyUurnz7cVEfxLwFtAGyWVRiXfg6IvkTyoMHW8NDk2
 KOM8PzwFo/Z8wKzQVfoUByT5063VGwdDEUkc4uTMqZnytriID6GGCi2hzEYexeH+MH6q
 /ZGUEzEN8Os9QJzKbIQVhuSxFbvuajlpRT9CdVuoAR2wlFUg3USa7N00ET6JDJ/bKxHt
 JvD91hs43a3hU+H09opkxPhSY+bruTxjimAn04gcPOrXL8zB3xxTrTEHRhQCeZik2Ii7
 Is8GZK2otEvvuF5kRCqeMHQ0KRXwXTJkyM3P9Ia3ohh6n//hCKPtkV5So9Y30gklttlG
 E7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIE39M6WEo2MphCpMZQ+O6lu2X6W83TgfKFvtWGX81M=;
 b=r5YG77+iPxkwdqSQk0CohbGS6dtDzI7n4dARw0e8UJfd8I8uYG/iSKRCEfGoRoh20Q
 hh16s9Ms1zUrfvjAxyvFMQ4r2AnzNqaTS629KVF4XAPID8h+Fc4x739RXhMHmd1HpKyM
 VltbwPTiQV5940q5Ij6a1droBaCYTHT9pnSEIFNOxUnMr76d4PNSCEH61t1Zst3qqvmS
 L/DbImPW/KNj0SDgnUQTPR7hGWogwvZ9NKMpM4W0PFDp0m2scYodcplK53FRXE5OHfKP
 vR73/QLh8T/7uOnn+lKCouFZQA0zBWCmA03wNE8UbBGOJIDqAUGKfi+hvJdG5Aw0AluA
 9bvA==
X-Gm-Message-State: APjAAAXX7EMM+45spY4y5tZyvfyvYxi2arOItGZHgrYwjaqe/oyUlG3A
 XfeskHy11JQOfGAN6Cec/DNYLw==
X-Google-Smtp-Source: APXvYqygkZObJlotIMQS2u4j2CLy6/eGg0rMvXEwnxpRQLzLEPrJNBxZKocg/2mg3xiwVOCSuI6Ijw==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr4273570wmg.105.1571912569242; 
 Thu, 24 Oct 2019 03:22:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm2057374wmi.4.2019.10.24.03.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 03:22:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26C771FF99;
 Thu, 24 Oct 2019 11:22:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 09/17] cirrus.yml: add latest Xcode build target
Date: Thu, 24 Oct 2019 11:22:32 +0100
Message-Id: <20191024102240.2778-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024102240.2778-1-alex.bennee@linaro.org>
References: <20191024102240.2778-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, Ed Maste <emaste@freebsd.org>,
 cota@braap.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, Li-Wen Hsu <lwhsu@freebsd.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CirrusCI provides a mojave-xcode alias for the latest Xcode available.
Let's use it to make sure we track the latest releases.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 4b042c0e12c..59146a89c83 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -26,3 +26,14 @@ macos_task:
     - ./configure --python=/usr/local/bin/python3 --target-list=${MACOS_ARCHES} || { cat config.log; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake check -j$(sysctl -n hw.ncpu)
+
+macos_xcode_task:
+  osx_instance:
+    # this is an alias for the latest Xcode
+    image: mojave-xcode
+  install_script:
+    - brew install pkg-config gnu-sed glib pixman make sdl2
+  script:
+    - ./configure --cc=clang --target-list=${MACOS_ARCHES} || { cat config.log; exit 1; }
+    - gmake -j$(sysctl -n hw.ncpu)
+    - gmake check -j$(sysctl -n hw.ncpu)
-- 
2.20.1


