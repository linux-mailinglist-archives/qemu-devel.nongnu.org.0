Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E782D2D5B2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:48:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsOB-0005wJ-KO
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:48:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsI1-0001Cr-8F
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arilou@gmail.com>) id 1hVsI0-0002wo-CA
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:21 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <arilou@gmail.com>) id 1hVsI0-0002qw-6M
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:42:20 -0400
Received: by mail-wr1-x442.google.com with SMTP id f8so821167wrt.1
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 23:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GBKnE31GL9OCTYapbjGnGJ705BbyWe9rrqLVzVNFM+0=;
	b=GuOpxM6xf0dSzZQQV2+bQ8b3KXdOP6CkWQlX3l+ru5CZZwhW4i7i95KBkfrgFNpbCr
	6uYiV7nAnlY+VSqkkso9OFTeQh/E0GLAtwo0qUoNk7tp9af1R75kxgcWXNSlajVsb6DL
	s664wS6hIVNgiMxZezp6WfSteubYnssbnLJgBKimiSn2eud1ngMh/JQsvyW1EpEHKj1I
	swUqcNChO0BnmvqwieOPEKXEVHMc4InJQARQvE///RhmzxLzLtI2ZoV8ePwbIyfQadmq
	4Kc5chIXy9KL0iHoEy8KKj0kknyFOhL8due9u97NKrgVMLAl9cxYiCW301DZcZGrAeFF
	LZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GBKnE31GL9OCTYapbjGnGJ705BbyWe9rrqLVzVNFM+0=;
	b=qokgp0k3w/W0RrVipfdotyef7h0Zh9zFGvcZvfx6V5L5vEYocNAm3f2g1+QDTt7xWl
	zBquL5dO2ZMmEkrybD8VYXkqg4duDGQFTgvrvum6TbPcfgoqpX3elnF8zF30EpLO12rH
	KgW3HjC8xMONjLIzww1jW04pec0Ov03DSroJwEb9hIjlAS+aOeHGl44dgcfhu+eje8ia
	yk9sAcOoHqESZ7Erb3lrpG/dWNr3m/TGjfrwGUZ0/0KzoTu4OudQoeCNvK4YGXObNwIT
	nUydlp+yYnPpjgI2weENoyVRnMIjDmbGxzG5UTHmOD0pcf58BmopjXONuVwJyzFmej1c
	HzvA==
X-Gm-Message-State: APjAAAVducaZeVLmPw8dRA7CQfLypte5hFYMCFxsmrE6AsVovsphmgkx
	txAKJt9WqDNpDTrAh0nUXC53Jiwu
X-Google-Smtp-Source: APXvYqzqCXN0PNUZrCwnAMu0/pDS7IsKeSOwfZNGI+BrxPjUaTzas29VPMrRbs8eWcp7rXuMnBEpyA==
X-Received: by 2002:a5d:4581:: with SMTP id p1mr9538934wrq.228.1559112138991; 
	Tue, 28 May 2019 23:42:18 -0700 (PDT)
Received: from linux.local ([31.154.166.148])
	by smtp.gmail.com with ESMTPSA id f2sm6831168wme.12.2019.05.28.23.42.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 23:42:18 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 09:41:47 +0300
Message-Id: <20190529064148.19856-20-arilou@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529064148.19856-1-arilou@gmail.com>
References: <20190529064148.19856-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v12 19/20] gdbstub: Clear unused variables in
 gdb_handle_packet
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
Cc: alex.bennee@linaro.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jon Doron <arilou@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index a474f2c755..a0ff0017f6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2284,17 +2284,11 @@ static void handle_target_halt(GdbCmdContext *gdb_ctx, void *user_ctx)
 
 static int gdb_handle_packet(GDBState *s, const char *line_buf)
 {
-    const char *p;
-    int ch;
-    uint8_t mem_buf[MAX_PACKET_LENGTH];
-    char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
     const GdbCmdParseEntry *cmd_parser = NULL;
 
     trace_gdbstub_io_command(line_buf);
 
-    p = line_buf;
-    ch = *p++;
-    switch(ch) {
+    switch (line_buf[0]) {
     case '!':
         put_packet(s, "OK");
         break;
@@ -2511,8 +2505,7 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
         break;
     default:
         /* put empty packet */
-        buf[0] = '\0';
-        put_packet(s, buf);
+        put_packet(s, "");
         break;
     }
 
-- 
2.21.0


