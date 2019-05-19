Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C89228C2
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 22:31:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSSTG-0006U0-Hk
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 16:31:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSI2-0005kB-FB
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSI1-0007gX-77
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:20:14 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSHy-0007Yi-TD
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:20:12 -0400
Received: by mail-pf1-x441.google.com with SMTP id s11so6138582pfm.12
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IbY6I9DzAmMV/VMKU0boKo5CQjvFhhAqBWPLdeOiiQg=;
	b=tEbvvc7t1WACcnjP/5ylyqvnQoRBTCzCRHsXBCK4TES4dQkIQcGYyu7qbaF4/F8uDb
	GEaZCNUUcDsHpV83mTzUaWlektLdYY3Ip8WBvahvVH427Nbxd3Byg6D1EX2eF4JyT8R/
	iOFhN48bZQNbT1f5jVc/3J+xeYBfs2ru0h4thwxI5NeYw5o7TWfg/dZoVDJ95kEODmbR
	Uo5BLpHe2ADscRrU9Pd0kyhO22TNvtTVJNo7yoznF07C7nKr+YQMIFDDP4SGuiI/w156
	lhsE6mdaiCkWJCIWoypQHiYx1KNiY39SM68ZLyIbx5jVG0DiH7FORxHOnsUwzf2wO+fw
	hIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IbY6I9DzAmMV/VMKU0boKo5CQjvFhhAqBWPLdeOiiQg=;
	b=lU3xUnquejtW52I7uwPuPiRW5ij2R3RRHPsE9UogYdnFoOym+ZIeJw+4g3LZhiZZb+
	HgbvbJ7la6plswzqgb6yH8ozBc873IeEUmbqtu5G3tigXZZ8Fh5uuSAK+FAgaGoLVxFN
	1dsgnAStPuLXonIEPvNCYGLpkTT1W8moAAjzkLt4nrLyMn+U1NjwjdpnpUuiqYwURv5j
	wCDPdvGmwa903+sIiyGn/L/IEMciafg9qUb+fB4B2HLCzphPnXnuZEi1EtmZCUEp0+A0
	LTQnievTAnkVi2t7siI/69L6z7EEhVzgns4TDs8nI93g8JpSeMALY2aye4V5ZBxRKMhg
	wWfQ==
X-Gm-Message-State: APjAAAU5N8yZWAOBH/1M8phm9mVwhL37EiSROVfEImXMxleDRxIOukAc
	CLJ0I3lXfWvJrvd+iHIMrFLD/JBG7sQ=
X-Google-Smtp-Source: APXvYqzV4ly4FxYMXhEttULuXS3wtcrIZgVwDR0TWaplV9ItPC3Dqugk8Mg4ftahv3h1Auwy5dHxvQ==
X-Received: by 2002:a63:700b:: with SMTP id l11mr15541010pgc.449.1558297209546;
	Sun, 19 May 2019 13:20:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	e14sm18166264pff.60.2019.05.19.13.20.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:20:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:19:51 -0700
Message-Id: <20190519201953.20161-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519201953.20161-1-richard.henderson@linaro.org>
References: <20190519201953.20161-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH 11/13] tests/tcg/multiarch/linux-test: Fix
 error check for shmat
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error indicator for this syscall is -1, not 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/linux-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
index fa4243fc04..673d7c8a1c 100644
--- a/tests/tcg/multiarch/linux-test.c
+++ b/tests/tcg/multiarch/linux-test.c
@@ -503,8 +503,9 @@ static void test_shm(void)
 
     shmid = chk_error(shmget(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | 0777));
     ptr = shmat(shmid, NULL, 0);
-    if (!ptr)
+    if (ptr == (void *)-1) {
         error("shmat");
+    }
 
     memset(ptr, 0, SHM_SIZE);
 
-- 
2.17.1


