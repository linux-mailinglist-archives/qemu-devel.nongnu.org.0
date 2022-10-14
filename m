Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081295FF22A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:20:42 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNQO-0007Rn-R8
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1ojNK7-0002LS-PE
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:14:13 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1ojNK6-0003Hr-5e
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:14:11 -0400
Received: by mail-qv1-xf29.google.com with SMTP id h10so3521005qvq.7
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4Ct5XQcTz3V+0pwCxYvBX4Giynio3Jtm0kNb2Mz1IU=;
 b=ljpu+N+r6XgiCyp+wcvNKvY5anYcuUWUYWW8d2WbUA6bIxf5XkC/iztqxNmJnT11B4
 F4z7m413bVZMrI4LYho7Iw05qH7upVf9dFE84DapetnD1yvlN1fUqP0HJg4FjuJLeAH7
 frWoKJQtkmFLkEheQzHuNZtqhnfyAgAGGQwCh/QngRSRKBH576uJssNLAA9etmblEYJC
 hW+anm5MKXeMiRitzYkv7mC6ogfycCWpq6UqIKcPYw3dcmL8SjWYIe7DQeO7ZdsATu99
 9j/+RvCCtIZUS/IIryPbRhHtn5/4UOVVGOW/lVtNFtXbLg9M0o2s9HOc7t8FHbxTUtXj
 zbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4Ct5XQcTz3V+0pwCxYvBX4Giynio3Jtm0kNb2Mz1IU=;
 b=B3OlDZ2fRGacxJBEbphq6ncmDFSYUfOIxypJ3vnNHevXXcxa7DFIDbMxkbnJweY0RR
 sKboIWHeuT9HOkDxTz69FvwzzqmHK+izw7s+Xb1zQJ8eL7xlX4v6lgran5ER3bRDaBZ6
 giLZFJGxKQkN9m7EctZqY2xvgrU/pfONG6x1T4OuOUbeeYs8XWlmKIqLNDAf4MJ7OihM
 qchjvQNjI2CEZrj1lMrQs25w22IBuNoDszUxwMlD4LBDKdxu4ItUFwzb5O2l+a69xofm
 i23wBUGrrnKFRhfIpRINmJlj1gWddbC+SMwZywbSJWBBSEr7JwUjQFPG9q4QlZfd7CZk
 bWCQ==
X-Gm-Message-State: ACrzQf2Wr3MJSCR2pR9AHghvqVOnYJKnh0LOUzo/aFoRLaussETflzIe
 Ch+Vz2fPy7XXhLkHqPNYS5AuYYVrvCq2JQ==
X-Google-Smtp-Source: AMsMyM4T0Pxx56suP0dO6PhpKG4nwQuFXmumABLFMA8oxyM5HlbPgNPGvuOwua6cpzaJr78koL1TJA==
X-Received: by 2002:a05:6214:e47:b0:4b4:a09c:ee61 with SMTP id
 o7-20020a0562140e4700b004b4a09cee61mr3524481qvc.10.1665764047469; 
 Fri, 14 Oct 2022 09:14:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:1970:50d6:9900::765d])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006e07228ed53sm2562076qkb.18.2022.10.14.09.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Oct 2022 09:14:05 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz,
	Chris Friedt <chrisfriedt@gmail.com>
Subject: [PATCH] hw: misc: edu: fix 2 off-by-one errors
Date: Fri, 14 Oct 2022 12:12:47 -0400
Message-Id: <20221014161247.38843-1-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qv1-xf29.google.com
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
is 'end1 >= addr' (or 'addr <= end1').

EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x3ffff)!

At the opposite end, in the case that size1 was 4096, within()
would fail because of the non-inclusive check 'end1 < end2',
which should have been 'end1 <= end2'. The error message would
previously say

EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!

Note: the original change (and error message) was when parameters
were uint32_t.

Signed-off-by: Chris Friedt <chrisfriedt@gmail.com>

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254
---
 hw/misc/edu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d4..a6f5f97f13 100644
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
 static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
                 uint64_t size2)
 {
     uint64_t end1 = addr + size1;
     uint64_t end2 = start + size2;
 
-    if (within(addr, start, end2) &&
-            end1 > addr && within(end1, start, end2)) {
+    /*
+     * 1. ensure we aren't overflowing
+     * 2. ensure that [start, end2) is within [addr, end1)
+     */
+    if (end1 >= addr && end2 >= start && start >= addr && end2 <= end1)
+    {
         return;
     }
 
-- 
2.36.1


