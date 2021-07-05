Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE63BB882
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:01:17 +0200 (CEST)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0JXZ-0005c5-12
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0JVs-0004un-FJ
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:59:32 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0JVq-0000uE-Pz
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 03:59:31 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so8259422pjl.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FtVcWEj/4UR25ehzqUOT+tHbl8LIEPyu/OBdU+gKko=;
 b=MT5c/rHfX47NSvjSeVfg7xBt+IflIYDWxFsLMs1mwrKwtKMG7T1ze304baWcLB2qqb
 4E1Go5TFriTO+NCRLBtoQL93680NsNrcYCOyA8mK/Vr6UKd6tGP5JtLUmEC0ZZr8IClk
 Ee0Rk5yvoEBKH0uqL+a56Amw9GS7Sax2UPZ8+W4ioPbLjHKU9ulE/Qm6vGL6lx60ABG+
 ml5LfuVN1WM48FU+Y7X+euerPsOSP23CzurhKG127fOB2gBpDKzbtyEfNlPxONbeDGCw
 FY8iKzayL/XseF+cBBCX2giSWNqpi38DAn80oU1kkojI0wCnhia2UQxqYbq5xlythGey
 wtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/FtVcWEj/4UR25ehzqUOT+tHbl8LIEPyu/OBdU+gKko=;
 b=kMJUxBxOnSUJmfDHqgzix4e+7np6iQ7D2n5LnbU4Jk9wiqt5bUkQeZSXR/GrcJkrSC
 eFFJCzbLPPv42tq5S5CG4f/alTyItVF5guBVyxg6+sm7BxmWx6y2p1KFX3RdV/zAVCau
 RGVWYMavWiHA2gJKuwNpUZu8sGnZCPXKYPa3kQ661N4qHTPjo+SIsJ5cghBD/GGHKOt6
 bSMIfDkfrnFGGagJqENoqJxVN59koCFlTzx+JRiGe7nRo+8/uERseebV1nhQa3Kwp2mK
 JO7gWV5pdrP9DD2KDtW8yGAKiGQ5/Y8jcC4aIaASrXRLxyryd4hXVs6kv/WBjlKmZNKO
 6Jag==
X-Gm-Message-State: AOAM532LrsstSeuXbGEzdCEFxOzyS2ENHQGnmWDZ4rcSMn2Mc/TAVbDH
 7L6GkY/v6gr9BOSrLN9fN+9zL2TPzQfvCg==
X-Google-Smtp-Source: ABdhPJxp/2xNrzmhv5IFlnQh1xs3IJ1jjYJQKuj+eA8dVWkWW3G7E7ESKOl7w2x2OszpgKu00idlrw==
X-Received: by 2002:a17:90a:be09:: with SMTP id
 a9mr13352960pjs.185.1625471968360; 
 Mon, 05 Jul 2021 00:59:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ad14:b651:2921:88e5])
 by smtp.gmail.com with ESMTPSA id d129sm11903543pfd.218.2021.07.05.00.59.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 00:59:27 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui: update keycodemapdb submodule commit
Date: Mon,  5 Jul 2021 16:59:12 +0900
Message-Id: <20210705075912.2280-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The change of ui/keycodemapdb effective on QEMU is only commit
d21009b1c9f94b740ea66be8e48a1d8ad8124023, which adds mappings for key
codes added in commit d7696ff884e35c6dacf83a7cbe3355e3b0a90125.

d21009b1c9f94b740ea66be8e48a1d8ad8124023 Add QEMU QKeyCode "lang1" and "lang2"
320f92c36a80bfafc5d57834592a7be5fd79f104 rust: fix cargo clippy
e62d42f0fd76f7bb8bf78385a83c060e66ff52b0 tests: add rust test
3e25e1ca1772fc3f2039f739f8f920450dc68e50 gen: add --lang rust
9133a0b8022d1fb063a81cc2ba3b627c14ccdfd1 tests: fix argument order

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/keycodemapdb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index 6119e6e19a0..d21009b1c9f 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit 6119e6e19a050df847418de7babe5166779955e4
+Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
-- 
2.30.1 (Apple Git-130)


