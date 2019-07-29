Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4EF7835E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 04:33:57 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrvU5-0003OF-4p
	for lists+qemu-devel@lfdr.de; Sun, 28 Jul 2019 22:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38789)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1hrvTD-0002ZP-KQ
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 22:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1hrvTC-00054b-HB
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 22:33:03 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1hrvTC-00052Q-BD
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 22:33:02 -0400
Received: by mail-pf1-x443.google.com with SMTP id u14so27205748pfn.2
 for <qemu-devel@nongnu.org>; Sun, 28 Jul 2019 19:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TbzlDEvDxIuyOQWIbuLi6m5rfzHvVICvY/nMg/pguQk=;
 b=OjN5iV92yPvj/pnjYOpuNeD10dzyZ1e0579VYzq6fdS+LySiNOkvBZYiP2egs52YP9
 WKepw4aMXJsjzOzf2PxwRjCspp+Zx1aLuH0Hvvue00OR/RkOpRyUeswsNJzRYMbo9art
 XdZ7tyFezLtP/zQxZFkInKClacM9owpFirD8SdN/+o6CUjWZjxaI+bd+kmik2UmFQYgF
 xoQ5drF442BCrhlLcfaLus1KLuBDrB/CaLl0H0UncDfIVm/kkHvyui78/H3T0MQgiQkF
 oKVeEqPdj26HMLjKprAUn9IcJ6AG9oxuphK+ppJJbyXz/SL6BWnHXWR9vKNLXKb4RIOl
 dxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TbzlDEvDxIuyOQWIbuLi6m5rfzHvVICvY/nMg/pguQk=;
 b=TNvzyrm72eUdVTL0Tj9CfYDZTTYue8DFeczYd8eczHaS87FrvKJqzAOaKXUAYwCXSX
 dLyr6ZJyPHdROTeLKVY7NcNjEpWcU8NsRDEdLT5R1B/zQ8JqSPZgp7rx19sLbSGnz8iG
 8hGDUmu2+uDxndJRMTl8Iz/bCdb4jKhGIXSHOWkpkqo5j8cT0CgYttrpXSEIeHZkmTwY
 8lkh3M+5yO1oQsPwz4KtE/53SmuIoJ8cbtlhtKVfucs4cJmsrylLgf2ozq3CY7PDybNF
 j6VSx2PWqvpTiNQI5WeTqvjZ6e9qTtCDznFNt0FdsQGpbft62ECWGMuHjWS3wo7m+ZUP
 4bRQ==
X-Gm-Message-State: APjAAAWDJumfRoXXEy6OiUDPxlkT8gcBnJksDCRimS0pNZR36M8Op+Gh
 6xSHzVT2UnO3tvIU1dCyp8Q=
X-Google-Smtp-Source: APXvYqz/BGDYUayEAjqccl3xU5GK4hpqluX/0pWV+F+FPC9cKP++SaQephjwAuoPZmvRjYoh9jxSrw==
X-Received: by 2002:aa7:9407:: with SMTP id x7mr35390339pfo.163.1564367581410; 
 Sun, 28 Jul 2019 19:33:01 -0700 (PDT)
Received: from VM_85_204_centos.localdomain ([129.226.55.250])
 by smtp.gmail.com with ESMTPSA id m9sm103281519pgr.24.2019.07.28.19.33.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 19:33:01 -0700 (PDT)
From: Ivan Ren <renyime@gmail.com>
X-Google-Original-From: Ivan Ren <ivanren@tencent.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Date: Mon, 29 Jul 2019 10:32:52 +0800
Message-Id: <1564367573-6327-2-git-send-email-ivanren@tencent.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564367573-6327-1-git-send-email-ivanren@tencent.com>
References: <1564367573-6327-1-git-send-email-ivanren@tencent.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH 1/2] migration: add
 qemu_file_update_rate_transfer interface
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add qemu_file_update_rate_transfer for just update bytes_xfer for
speed limitation. This will be used for further migration feature
such as multifd migration.

Signed-off-by: Ivan Ren <ivanren@tencent.com>
---
 migration/qemu-file.c | 5 +++++
 migration/qemu-file.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 0431585502..13e7f03f9b 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -615,6 +615,11 @@ void qemu_file_reset_rate_limit(QEMUFile *f)
     f->bytes_xfer = 0;
 }
 
+void qemu_file_update_rate_transfer(QEMUFile *f, int64_t len)
+{
+    f->bytes_xfer += len;
+}
+
 void qemu_put_be16(QEMUFile *f, unsigned int v)
 {
     qemu_put_byte(f, v >> 8);
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 13baf896bd..6145d10aca 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -147,6 +147,7 @@ int qemu_peek_byte(QEMUFile *f, int offset);
 void qemu_file_skip(QEMUFile *f, int size);
 void qemu_update_position(QEMUFile *f, size_t size);
 void qemu_file_reset_rate_limit(QEMUFile *f);
+void qemu_file_update_rate_transfer(QEMUFile *f, int64_t len);
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);
 int64_t qemu_file_get_rate_limit(QEMUFile *f);
 void qemu_file_set_error(QEMUFile *f, int ret);
-- 
2.17.2 (Apple Git-113)


