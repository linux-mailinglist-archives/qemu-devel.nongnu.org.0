Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78A299C3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 16:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUAtZ-0006nZ-FY
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 10:10:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hUAo9-0003KZ-M2
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mehta.aaru20@gmail.com>) id 1hUAo8-0002hm-Qa
	for qemu-devel@nongnu.org; Fri, 24 May 2019 10:04:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
	id 1hUAo8-0002hC-H8; Fri, 24 May 2019 10:04:28 -0400
Received: by mail-pf1-x444.google.com with SMTP id v80so5410456pfa.3;
	Fri, 24 May 2019 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bhbpjK0JQSStbd9y2pHNMHs1B0N4hnvXiiUW+QxkFQ4=;
	b=Oyf7mzRbIXIQby8DetG/3EjqhHBVqDNz9Y1nM/7bDJBnz7izbKc4ZzHBAbOyCdyXTD
	GArTtt7UgKx91rvU8Sn3yYtB/DAeQqN/z09uhD7mxo9nDuD+tCiQ17WF1B0n/Krciz6K
	dXXrkKy6G/w/Bcj+UjwtM4Xj2Zvh1CWy6ARQUfVYe7voE64rQBFJfErCwidNCgDwNUKM
	Q9/8Y8l+WzFLTubJpfJg93yLpHN0pY9WW+zxO/L7dba6ygmsbkc/3iXS+Lg3nlZv37vM
	Ij+p+IpK2AeWdS/EBHj2NDS1OJiEK4tnRqQU0QMGkzSK5vBhfLYQ+TNTvld/n35sQ8/4
	j2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bhbpjK0JQSStbd9y2pHNMHs1B0N4hnvXiiUW+QxkFQ4=;
	b=fcb9nwjcLNJNm3AjNB1OB9oXeWmSjS5smDC5oQ9/MKofABv75YrLhhoPVDjrpOyQoe
	6kss7OcWXN1qNCvt1r1NIXeBTWlXQRCRNB7tPB8nG1EE65iQgnRaW1OOsutezg3JHvDh
	S9WbHwtq7t/ZTfvtx0yLP6KIUIyJfY8bDeHELUXT244Yb/PBPSYlgpDLZ8raVLZp1faH
	HSGahLA+5KtqqJxvhy4j3xfFhoHoiuWjHVK/0f4z1P/iiamxXqLOSmx5gk9SZlHMNKOl
	hFfxOHUa8LkuKg5WUTKP/2ksun3L7xUBDeWpWEeutt+xL5l1tLOzFe9CGpezBeRZBLhI
	gmkA==
X-Gm-Message-State: APjAAAX/6fY2/N/TFFazmd3HxZWJImkZ67PN++DvR9AZTDm/aBOxV+vf
	INGh2KfENmv6O8OgRWxsWoIf5KifRmeRjA==
X-Google-Smtp-Source: APXvYqzpUrPhyOLEahTBrIgFjV89enubrXhSOEQ9zwPafgN7rEwry7KLVKssKuwOFyBNu0q9HFI0Cw==
X-Received: by 2002:a63:5342:: with SMTP id t2mr2778154pgl.410.1558706667199; 
	Fri, 24 May 2019 07:04:27 -0700 (PDT)
Received: from localhost.localdomain ([120.57.120.132])
	by smtp.gmail.com with ESMTPSA id
	u11sm2556766pfh.130.2019.05.24.07.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 07:04:26 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 19:33:35 +0530
Message-Id: <20190524140337.13415-8-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190524140337.13415-1-mehta.aaru20@gmail.com>
References: <20190524140337.13415-1-mehta.aaru20@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [RFC PATCH v2 7/9] blockdev: accept io_uring as option
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 blockdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 79fbac8450..b44b9d660d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -386,6 +386,8 @@ static void extract_common_blockdev_options(QemuOpts *opts, int *bdrv_flags,
         if ((aio = qemu_opt_get(opts, "aio")) != NULL) {
             if (!strcmp(aio, "native")) {
                 *bdrv_flags |= BDRV_O_NATIVE_AIO;
+            } else if (!strcmp(aio, "io_uring")) {
+                *bdrv_flags |= BDRV_O_IO_URING;
             } else if (!strcmp(aio, "threads")) {
                 /* this is the default */
             } else {
@@ -4547,7 +4549,7 @@ QemuOptsList qemu_common_drive_opts = {
         },{
             .name = "aio",
             .type = QEMU_OPT_STRING,
-            .help = "host AIO implementation (threads, native)",
+            .help = "host AIO implementation (threads, native, io_uring)",
         },{
             .name = BDRV_OPT_CACHE_WB,
             .type = QEMU_OPT_BOOL,
--
2.17.1

