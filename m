Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669014BF0C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 18:59:47 +0100 (CET)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwV9O-0004Ua-8s
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 12:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV3q-0005pt-1R
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:54:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV3o-0007S7-N8
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:54:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV3o-0007Pr-FY
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:54:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g1so3491840wmh.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oy+iZyCBorIM63EY2Md4vrVEQjwIf0u0WuvCdwfh8WQ=;
 b=Hnv7cETyQudHvcI0Q+i9EwLUwbd91pAU4DcxA/ku4jxJw1Wtr/GvYfh6pN/8Ac/xJo
 FsYPYz8zlA8dYu4D7xunhmXZS0e31ConzMGJIYlV/OQ/xVUr9KgHamIGOkqvJWP757tk
 Q5CLuPSN/qiCMaw0pOYti0N1DDLBfs+Bt2B9q0VK7VNmqXGEvb4hzMl4N2n5kvWftznX
 NuiEb98DBTFAixw9QfEHUJXQJcfhvzaHvaPLZbdFIIVRhWFFLdvSTrDqTDQbie7h1qxB
 s6tx7QRnX2boFTJqayGzhTFF9nVLDbGcV2GjKm//QbZofkhSno/YgyVfFHx66xrEaqUa
 xOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Oy+iZyCBorIM63EY2Md4vrVEQjwIf0u0WuvCdwfh8WQ=;
 b=clzj7vRSFWdEfB0A54h82U+DeafmDaV7zrnYsTG3/Xq42P6wiIrxB11Fhe1sTWhK9W
 QS1ZJlygY86cuDwHgauI/Ab0X343BUoyqqse/dvgx7wtwsKJowlNVKMT921AYJ0e7D2X
 xz/mUNvVMD7IZB81MZO760GjMJ017NlaZo4tGRVHsPbRzRma4HkiqGGKNWz+1MlRPYey
 ofKaAsI/Rc3p3dQTHnzVv7tTMc/F9ybaJ2Us5cfAx87X3kIVUOj1Arz3Yc6U7BP4cA2g
 HY/ELyp4hkJ5Bc0XNzZD0XJGgO4Pw660K2qVt6SRwsZr/ZCP2sLcBLVJKPG0urmKU7Q+
 ylkw==
X-Gm-Message-State: APjAAAV77M3up5Gy8ziss0VlZiW5HiHE421NbfPwPbCQZuRoZKjBp+o5
 nJ8tIjqdIWWiDjLiFz7aGl7whLWQ
X-Google-Smtp-Source: APXvYqwNfXNj8yjia4dBO+HrVf07prk6LJTt6Od9HQsEdm7DS5EGFTR3FmHZFthtWh5mj+vyM1Dnuw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr6667684wmc.154.1580234039288; 
 Tue, 28 Jan 2020 09:53:59 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:53:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 004/142] build-sys hack: ensure target directory is there
Date: Tue, 28 Jan 2020 18:51:24 +0100
Message-Id: <20200128175342.9066-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

By removing some unnest-vars calls, we miss some directory creation
that may be required by some/dir/object.d.

This will go away once everything is converted to Meson.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 rules.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rules.mak b/rules.mak
index 967295dd2b..e19ad194af 100644
--- a/rules.mak
+++ b/rules.mak
@@ -66,6 +66,7 @@ expand-objs = $(strip $(sort $(filter %.o,$1)) \
                   $(filter-out %.o %.mo,$1))
 
 %.o: %.c
+	@mkdir -p $(dir $@)
 	$(call quiet-command,$(CC) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
 	       $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) $($@-cflags) \
 	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
-- 
2.21.0



