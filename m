Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B039A7A05B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 07:34:42 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsKmX-0006FG-Rw
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 01:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1hsKlj-00050K-Ij
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1hsKli-0005t7-8A
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:33:51 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1hsKlh-0005re-VH
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:33:50 -0400
Received: by mail-pl1-x643.google.com with SMTP id a93so28366326pla.7
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 22:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3D9Q1e027P9J2/G4w6pvaWOpfZ+1Lu3Pruu0YOmPK/c=;
 b=CycbdNKtnGdXEoRJkU4ffhEkFTRCsiNq215C54YxwM+m7h7fzF8P8zxCrF57e8sIVy
 7DMkvIK2y9A3lV7oJymIMn020VNLLYif87YrH9gE1384kfGER2evObqib85HgIIZqcf/
 gVeTwrVW/mLbn+N9/t1CRpRbm14EYauLRwNIl7krZ29ej+KX5qDMFaD3/L/RtJQBF4To
 crT8W/GR8gubc2cM6WZbWO0/YNb6Ikxs9+lpHZUDfpR130Rqc8vdXF2zzzObjrwyrsRU
 H0zxoDZ0TbkCHEBhthyvqXy5VwdH8ekY7+cp+/vk2pXaIPkruHrRzsEg5UKBrnjeoNwb
 G39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3D9Q1e027P9J2/G4w6pvaWOpfZ+1Lu3Pruu0YOmPK/c=;
 b=ct+vcd6QxX3QRb2IH1lz4TrV8bUqINCSAGVhQtvno77UmkIB0OersMFWqek/Na7y8S
 7uO4Kg+8kfaRbST9wwfvaVLTy5TD2fx3ASCy67ZDDz2usmc+SASUIa/+OKfHLXkzpioR
 bj/qfh04Lua+5o8MP3RFpveKQaXDX2IudWf2zS/gWUYs3uiab5nqrp+HbDHt/OpQi1cP
 lPZkmlQv7vm4dMqpSmXag2P/bxsKDriwYlUkhin7VyC6fPNndBKk8P3ORGGPnWm4hm+Y
 GCJcspjfKiD4CKeie1gJ7191OwIL8EUBB7E1IHUw3LS4s6oquaN3y181e19mtZmU9BXA
 SIhw==
X-Gm-Message-State: APjAAAVwqT8FLLMAAuSiNk3ruXfTmeEjeHGWVS3P4BmmDAgCsfl4z1E+
 PHPbpEcaDmUxKXid92L0kSo=
X-Google-Smtp-Source: APXvYqyhko64pETdN+MYLF51zygJg/nNkEiEPHjGqnBVynRfBEva71g0QZYJPCahy1j2rjXn19AACA==
X-Received: by 2002:a17:902:a607:: with SMTP id
 u7mr114234932plq.43.1564464829173; 
 Mon, 29 Jul 2019 22:33:49 -0700 (PDT)
Received: from VM_85_204_centos.localdomain ([129.226.55.250])
 by smtp.gmail.com with ESMTPSA id 11sm64055886pfw.33.2019.07.29.22.33.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 22:33:48 -0700 (PDT)
From: Ivan Ren <renyime@gmail.com>
X-Google-Original-From: Ivan Ren <ivanren@tencent.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Date: Tue, 30 Jul 2019 13:33:34 +0800
Message-Id: <1564464816-21804-2-git-send-email-ivanren@tencent.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564464816-21804-1-git-send-email-ivanren@tencent.com>
References: <1564464816-21804-1-git-send-email-ivanren@tencent.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v3 1/3] migration: add
 qemu_file_update_transfer interface
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
Cc: richardw.yang@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Ren <ivanren@tencent.com>

Add qemu_file_update_transfer for just update bytes_xfer for speed
limitation. This will be used for further migration feature such as
multifd migration.

Signed-off-by: Ivan Ren <ivanren@tencent.com>
Reviewed-by: Wei Yang <richardw.yang@linux.intel.com> 
---
 migration/qemu-file.c | 5 +++++
 migration/qemu-file.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 0431585502..18f480529a 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -615,6 +615,11 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
     f->bytes_xfer = 0;
 }
 
+void qemu_file_update_transfer(QEMUFile *f, int64_t len)
+{
+    f->bytes_xfer += len;
+}
+
 void qemu_put_be16(QEMUFile *f, unsigned int v)
 {
     qemu_put_byte(f, v >> 8);
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 13baf896bd..5de9fa2e96 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -147,6 +147,7 @@ int qemu_peek_byte(QEMUFile *f, int offset);
 void qemu_file_skip(QEMUFile *f, int size);
 void qemu_update_position(QEMUFile *f, size_t size);
 void qemu_file_reset_rate_limit(QEMUFile *f);
+void qemu_file_update_transfer(QEMUFile *f, int64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
 int64_t qemu_file_get_rate_limit(QEMUFile *f);
 void qemu_file_set_error(QEMUFile *f, int ret);
-- 
2.17.2 (Apple Git-113)


