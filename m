Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2DCB39B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 05:55:41 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGEgu-00018S-M6
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 23:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53146)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mattkilgore12@gmail.com>) id 1iGEfN-0000DN-A8
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:54:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mattkilgore12@gmail.com>) id 1iGEfM-0005cm-Am
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:54:05 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45993)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mattkilgore12@gmail.com>)
 id 1iGEfM-0005bs-5S
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 23:54:04 -0400
Received: by mail-io1-xd44.google.com with SMTP id c25so10483332iot.12
 for <qemu-devel@nongnu.org>; Thu, 03 Oct 2019 20:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DRplJ7s5wS8wWAiJ0s8iSyGbDczl1bzm8yyvKstkRwM=;
 b=WBGKMJ5+R5bTQYTON78PqI+80rbTZksQCK7GvyyE9s6XwrbJ1y8JlXiTkzoWAW15IT
 ZgOStmyoVQNr/LAmfzyrgOseEW05bnXWiSu99ZTWvVFCEjdSOHPpVNVZ3Hvsa4Nbjorb
 UmauygC1Xf8SBY29BNMcfbSAGVbzJldP955lbn8xCA+Lf9XyyDIaKcHDJWBbZfpa8cZB
 kUlfrgMiRicHd6cqRhptWq5Z9cGFCCR58C35dYTJpsuuWkjlkuktnqBTckg9UOedmQVQ
 hWCVtZawY+dXvvykqTn2gONdyiktHnh9AOQp4XiPfuoaZfKhD4WBqORdmIx5b3+cH3Yw
 gywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DRplJ7s5wS8wWAiJ0s8iSyGbDczl1bzm8yyvKstkRwM=;
 b=il78UVqFjfAePczRQfScSlwY+aCfiLcSh6tJEET/wMjphskN05tfO6ehAHH8ADYyWT
 cDJfKptAZSD9B+/YdZKKtAvrQm5XHqiKrQVkZwaSoNuNPjvLd2+XTfi1awUDsxB789rs
 Ov9zGLtkslGAvOzT1HevbOzL4oVWVj5LK26a4AynfYsZGkHj7WYSpE/eVd/Tru3+02sQ
 ThvbivRwVx1QO81E5rxAXhnPvmD60Th+UtSnWFk67+Xt9j7lbdRfLhdQFDgXKh3hBP9B
 hwZtho4U4iSBHuLALiRLU4mcDuxW5NWmdN5C8vTXocq1JUWW1RS/o6cUeY6tPNhDuH3H
 U5oA==
X-Gm-Message-State: APjAAAUbgrrGT5UK5V/eSTYP1XvChUjRZVJw4cRulUAiLggVYW9O/VqU
 h086dV/Z4JMYIXQQYnLpSYUe63yh
X-Google-Smtp-Source: APXvYqzWmnAn93FQyCdk8ZKB9fDfmc/k2GvS+BnHJDPMDAXIjNee8vW06LdAWKSNqwhm5pwzb4tpUw==
X-Received: by 2002:a92:5fd7:: with SMTP id i84mr13149817ill.125.1570161243222; 
 Thu, 03 Oct 2019 20:54:03 -0700 (PDT)
Received: from matt-laptop3.localdomain (d118-75-38-58.col.wideopenwest.com.
 [75.118.58.38])
 by smtp.gmail.com with ESMTPSA id n17sm1570274ioj.73.2019.10.03.20.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 20:54:02 -0700 (PDT)
From: Matthew Kilgore <mattkilgore12@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] curses: use the bit mask constants provided by curses
Date: Thu,  3 Oct 2019 23:53:37 -0400
Message-Id: <20191004035338.25601-2-mattkilgore12@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004035338.25601-1-mattkilgore12@gmail.com>
References: <20191004035338.25601-1-mattkilgore12@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: samuel.thibault@ens-lyon.org, Matthew Kilgore <mattkilgore12@gmail.com>,
 philmd@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The curses API provides the A_ATTRIBUTES and A_CHARTEXT bit masks for
getting the attributes and character parts of a chtype, respectively. We
should use provided constants instead of using 0xff.

Signed-off-by: Matthew Kilgore <mattkilgore12@gmail.com>
---
 ui/curses.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/curses.c b/ui/curses.c
index ec281125acbd..84003f56a323 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -75,8 +75,8 @@ static void curses_update(DisplayChangeListener *dcl,
     line = screen + y * width;
     for (h += y; y < h; y ++, line += width) {
         for (x = 0; x < width; x++) {
-            chtype ch = line[x] & 0xff;
-            chtype at = line[x] & ~0xff;
+            chtype ch = line[x] & A_CHARTEXT;
+            chtype at = line[x] & A_ATTRIBUTES;
             ret = getcchar(&vga_to_curses[ch], wch, &attrs, &colors, NULL);
             if (ret == ERR || wch[0] == 0) {
                 wch[0] = ch;
-- 
2.23.0


