Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF65B0A0D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:27:42 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxtt-0004zx-30
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CMUYYwcKChUGz8EFCz19916z.x97Bz7F-yzGz689818F.9C1@flex--venture.bounces.google.com>)
 id 1oVxnx-0001b6-BI
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:21:39 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CMUYYwcKChUGz8EFCz19916z.x97Bz7F-yzGz689818F.9C1@flex--venture.bounces.google.com>)
 id 1oVxnv-0000Ow-IJ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:21:32 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-34546b03773so66226877b3.9
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 09:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=N528nELHISgJRpCN1kRQdQCiWiAUeOtlnYxRwqOB9wc=;
 b=EJwhGVN7RUCrkX8lGqlLaxvcXvngq4PBU4zvpz/QtBFoc9PE4/Vp1zAwOux6p10Ood
 zxve1QNmOMnctjykbe1bc6EF8RfPNjpeWKnMba8tGymt0E7MLykvwBjDWDzlAXC96o/g
 maFJ3V7KF71LureeAX2HYww/l3zlwGOIifotQfrmoP0RplTlWWxYxc+da8kP8v68z5RX
 GrgLs6OqdhIQvSK6F8wN+UkbcM6bkLcasMTlJGWFVv0qRZxnT+DkQ4+nbN22yTrlyFBZ
 M99LYwl1IfcT5jkiinZFK/H6qgkt32g/dTTrwj6ocUAWXhUomVZN+zff2+/krEOW4M0b
 Jp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=N528nELHISgJRpCN1kRQdQCiWiAUeOtlnYxRwqOB9wc=;
 b=FOAY0Gwy207w6dlvJOZ+1bT3tmRx+4lqkLkRGPCTaTXjcawiaGrlw9HlfnqtQdMyH+
 i8d/j5R4VqT7Anp13mfnVXI/csGdYbrmResJVGhMjRsDzoZgCbclQrK/7BiqOQPjsT/7
 wSj/4gNtkqgMvsCqqBptGixJUQWOL7n+mfx847l1ly+4M3y6IyH9OUzLLvNrYMzODlrK
 GB5rnAP9Gc7Mw3Cxxt8IgdFuKplkPOv5Rct3/16A8tXOBJhr3TYMeRNKo/db4YO5OLiO
 lplZW7k3+ZLhpxq2ePcIOnbAvFfo7rCIr2gNxy2Ke4moQeY8khksiB9GhJaLiQOlWaqu
 XEtw==
X-Gm-Message-State: ACgBeo0PS6V6PezyJcqcp+FPojMOc9il/kv+YDp9xluOFz1+JkqBeNTT
 HIapha8S3/dAMs7f0+Ji+ovSvBE8wRWF
X-Google-Smtp-Source: AA6agR4wActyXrSneEtP4SVQqju/WX1KzNPzt5wwN44voHXwoRqvb1y0jmVW1GgksuMR4Fw33BL0i/zGYZ9N
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:7358:4912:f10:4c09])
 (user=venture job=sendgmr) by 2002:a25:3c07:0:b0:69c:8b7d:ac3a with SMTP id
 j7-20020a253c07000000b0069c8b7dac3amr3293495yba.26.1662567688841; Wed, 07 Sep
 2022 09:21:28 -0700 (PDT)
Date: Wed,  7 Sep 2022 09:21:25 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220907162125.3950701-1-venture@google.com>
Subject: [PATCH] crypto/block-luks: always set splitkeylen to 0
From: Patrick Venture <venture@google.com>
To: berrange@redhat.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3CMUYYwcKChUGz8EFCz19916z.x97Bz7F-yzGz689818F.9C1@flex--venture.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was caught by a sanitized build, that was perhaps oversensitive.

Signed-off-by: Patrick Venture <venture@google.com>
---
 crypto/block-luks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index f62be6836b..8633fb7e9f 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -729,7 +729,7 @@ qcrypto_block_luks_store_key(QCryptoBlock *block,
     QCryptoBlockLUKS *luks = block->opaque;
     QCryptoBlockLUKSKeySlot *slot;
     g_autofree uint8_t *splitkey = NULL;
-    size_t splitkeylen;
+    size_t splitkeylen = 0;
     g_autofree uint8_t *slotkey = NULL;
     g_autoptr(QCryptoCipher) cipher = NULL;
     g_autoptr(QCryptoIVGen) ivgen = NULL;
@@ -901,7 +901,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
     QCryptoBlockLUKS *luks = block->opaque;
     const QCryptoBlockLUKSKeySlot *slot;
     g_autofree uint8_t *splitkey = NULL;
-    size_t splitkeylen;
+    size_t splitkeylen = 0;
     g_autofree uint8_t *possiblekey = NULL;
     int rv;
     g_autoptr(QCryptoCipher) cipher = NULL;
@@ -1147,7 +1147,7 @@ qcrypto_block_luks_erase_key(QCryptoBlock *block,
     QCryptoBlockLUKS *luks = block->opaque;
     QCryptoBlockLUKSKeySlot *slot;
     g_autofree uint8_t *garbagesplitkey = NULL;
-    size_t splitkeylen;
+    size_t splitkeylen = 0;
     size_t i;
     Error *local_err = NULL;
     int ret;
-- 
2.37.2.789.g6183377224-goog


