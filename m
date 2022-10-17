Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DAD6015EC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 20:05:17 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okUUF-0007bG-Q3
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 14:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1okUOC-00023l-31
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:59:00 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1okUO5-000721-Vg
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:58:56 -0400
Received: by mail-qt1-x82b.google.com with SMTP id f22so8205029qto.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PQ0qIGsYiDvPnusVvYgIkHS9kmDVoBcNqbvx4Ls/EFo=;
 b=I4MkwjjCASMjcUO23W7DUIbGWZ7/+dsIgfxbBAm8QwWTK01LSr76wfqWb5S7OebtJ2
 u3S2ULWkNdBibmyF4P1xWXdxykdRZFs5r17NQWbx/lLIT4Xyn1a8Grc7yUnWiaPwCiLC
 EDVIs47avyyMEolmYzvLR7fJLFjpVvRPMXwPV9kJX3hIeCnQ4YPJhAIU5CLL+ccmfvti
 fuDvqN5S17lsyAyM0YWf0Rp0gdFK/EQBvgvEo87StDTnGb3gw1cYALx3S03UdR+uqCi2
 ZjYbEoTc4NOxmtdfeNMmGuOJgxArBWKtRxr7h80m4oOkzb8/PKD/TGGKW/KdUWhGAdk7
 pn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQ0qIGsYiDvPnusVvYgIkHS9kmDVoBcNqbvx4Ls/EFo=;
 b=A1WNPEp8OOqWyqXaOkjF2+9vmEeAPPLmBQMqOrfr2fmmRLRosBBNx1TQEUEfP9yf1t
 jI/DHsX68qCvqM3dNkOjncXutnfWbPG7NJm/cJph1je80y0PtRliWYrSOSpQ/ayJHjwZ
 Q+UMpX/kdtgMSrTkHjWq//sCkkCRQGAfTQdk+koQXcjy8ZAOuvMXdji8xupPxWBH9rmZ
 YMREbtpCXlKOB5RHCepJyo30Uvtc9N3jL2pH7hpWHJmRGwg0ptOkDHtRLGE1zcHKTIvt
 Fkk/JARMt4kji0gcp9CR5MA/t+KiStLkU5UKJdi/rq88hKdCHqz6SubRc44Fk9iPQmLo
 FcUw==
X-Gm-Message-State: ACrzQf3ZruBKkmjSrJir+OqBd+qfXw797ZYt8CLMSwnX8ICFacQakIvW
 /8tbMKkpAK48xv6ZY9b3ILRGswL7y0YiJg==
X-Google-Smtp-Source: AMsMyM7FDq9u9WmXpL3N62Np0EgQd/jHSltOBndKgFRmf2HTVQOXMK4tfn1x43LWCMzp+WZEYtqi/w==
X-Received: by 2002:a05:622a:14cd:b0:39b:f0b5:4157 with SMTP id
 u13-20020a05622a14cd00b0039bf0b54157mr9544487qtx.533.1666029531151; 
 Mon, 17 Oct 2022 10:58:51 -0700 (PDT)
Received: from ChristophersAir.hitronhub.home ([2001:1970:50d6:9900::765d])
 by smtp.gmail.com with ESMTPSA id
 r2-20020ae9d602000000b006ceb933a9fesm291685qkk.81.2022.10.17.10.58.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Oct 2022 10:58:46 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
X-Google-Original-From: Chris Friedt <cfriedt@meta.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz
Subject: [PATCH v3 1/2] hw: misc: edu: fix 2 off-by-one errors
Date: Mon, 17 Oct 2022 13:58:28 -0400
Message-Id: <20221017175829.92074-1-cfriedt@meta.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In the case that size1 was zero, because of the explicit
'end1 > addr' check, the range check would fail and the error
message would read as shown below. The correct comparison
is 'end1 >= addr'.

EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!

At the opposite end, in the case that size1 was 4096, within()
would fail because of the non-inclusive check 'end1 < end2',
which should have been 'end1 <= end2'. The error message would
previously say

EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254

Signed-off-by: Chris Friedt <cfriedt@meta.com>
---
 hw/misc/edu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d4..b3de8d206a 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -103,19 +103,18 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
     }
 }
 
-static bool within(uint64_t addr, uint64_t start, uint64_t end)
-{
-    return start <= addr && addr < end;
-}
-
-static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
-                uint64_t size2)
+static void edu_check_range(uint64_t addr, uint64_t size1,
+                uint64_t start, uint64_t size2)
 {
     uint64_t end1 = addr + size1;
     uint64_t end2 = start + size2;
 
-    if (within(addr, start, end2) &&
-            end1 > addr && within(end1, start, end2)) {
+    /*
+     * 1. ensure we aren't overflowing
+     * 2. ensure that [addr, end1) is within [start, size2)
+     */
+    if (end2 >= start && end1 >= addr &&
+        addr >= start && end1 <= end2) {
         return;
     }
 
-- 
2.36.1


