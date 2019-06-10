Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F13B693
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 15:58:17 +0200 (CEST)
Received: from localhost ([::1]:46746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKoS-00071W-I2
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 09:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1haKgL-0008Gh-SD
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:49:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1haKgL-0001c4-12
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:49:53 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45141)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1haKgK-0001aM-MR; Mon, 10 Jun 2019 09:49:52 -0400
Received: by mail-pl1-x641.google.com with SMTP id bi6so3292786plb.12;
 Mon, 10 Jun 2019 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HgaHVcqeBW+nZCkmUpXRplMouOFQrkux2rCciZCM+MQ=;
 b=ZFulTqjxA8OKF9INWv+WuvQIPvJ8Bfb97GSpbjQ1T0IQ1wHwjoh8bqAXQJx3EWm3Q0
 rUwzLntoeNPw4briBgTdXms+KV8ZpsTtq5hKFH015tJ+5jEYce3n1IG1XsSzGrpSVb8X
 D4BE3xhjJ0ttkUgyNdfcMkBLkiJZAM2PIL7jSq0xiYkZBq6FPOWNMkLJcV3s8p8zWHxH
 fkEbypp2ZfjnHzUANV2Iog+D6VxVoVjipz+aFJP16fxK7FkICeKnMxmb3QsHLqnyVKGU
 tqfcf5IL+dixNW4TVql5zNNTI5h1K8f4uu3xVZT9sGpUUbMHVizWCMweQEppCsOXPF9Q
 h4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HgaHVcqeBW+nZCkmUpXRplMouOFQrkux2rCciZCM+MQ=;
 b=PnlpvrONQ1Ow5E9j8ip+MwfnV1lJxHdoRTd8jpDZYY9CtrevEOzLXBE6I+BzW9+xXo
 cTiP5I91/l8vQh8AFFHT8DdWuy7ARcz9W575A/MCVEJjSI3ZzU+1FSs7c6/UaqZ3tti4
 ebT7P0iwpSKoBXU5AhYa4DJF6NP7wzjqOSRB9yNuAg0juKstOtjQ2CTxum9KB/Ht+SO1
 ylnCtBQxLkgvKy3fESN6HDMAv1/BbTSo5XdKhfTAbdaOe8taaQni1YHCIFeUZZDlkoIK
 a5tP7zA2HpTeXqfUpQvl2f0iTb4W8urnVDqS9JS8RZhyrmXLGL286h1BpItqbr8NTnHt
 eTgw==
X-Gm-Message-State: APjAAAUnUH+6m48W6U0SkF8l+ZqbRBvggDdZ2ZLo1+VpRLKGvXiexdIg
 UyZquEr1Zq1a93w3XYixjXW5eAjWtqkFPQ==
X-Google-Smtp-Source: APXvYqwad4+DtpL9QfTCOjAafAbnhgksTuYXOX1HnvZWcezRWilT7UT0jBAAltnuEgGIsB+24HkY7A==
X-Received: by 2002:a17:902:8609:: with SMTP id
 f9mr65784658plo.252.1560174591211; 
 Mon, 10 Jun 2019 06:49:51 -0700 (PDT)
Received: from localhost.localdomain ([136.233.9.100])
 by smtp.gmail.com with ESMTPSA id d4sm13969837pfc.149.2019.06.10.06.49.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 06:49:50 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 19:18:56 +0530
Message-Id: <20190610134905.22294-4-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610134905.22294-1-mehta.aaru20@gmail.com>
References: <20190610134905.22294-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v5 03/12] block/block: add BDRV flag for
 io_uring
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Julia Suvorova <jusual@mail.ru>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 include/block/block.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/block.h b/include/block/block.h
index f9415ed740..5e08df716f 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -121,6 +121,7 @@ typedef struct HDGeometry {
                                       ignoring the format layer */
 #define BDRV_O_NO_IO       0x10000 /* don't initialize for I/O */
 #define BDRV_O_AUTO_RDONLY 0x20000 /* degrade to read-only if opening read-write fails */
+#define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the thread pool */
 
 #define BDRV_O_CACHE_MASK  (BDRV_O_NOCACHE | BDRV_O_NO_FLUSH)
 
-- 
2.17.1


