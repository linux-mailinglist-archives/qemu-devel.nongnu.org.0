Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D6693C8A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROxK-0002Vn-UN; Sun, 12 Feb 2023 21:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxJ-0002OK-BT
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxG-0006wx-7k
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c995lDB1JAKlZY84gYHtgOp10ZlGZIqADTn8Uc7TQdI=;
 b=BgC6Pb6T2PWAsrJyzv+M9fnTAZqy2SzqOGPr7mGz7cASHb78R+94wjh7pkvQonYj6eWfXC
 QAir+I/GoLCZy3UW0iS7snkTV/44rg+aw87v3rXNVwCli8r45zQvGzVNwDRyndaPbgGpcZ
 M01HgXXrQn9J8PTGGu4AO3n1WQ0DkdY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-CIoZz1gJNYeuxkypfXTHDg-1; Sun, 12 Feb 2023 21:52:32 -0500
X-MC-Unique: CIoZz1gJNYeuxkypfXTHDg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p14-20020a05600c468e00b003e0107732f4so5448031wmo.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c995lDB1JAKlZY84gYHtgOp10ZlGZIqADTn8Uc7TQdI=;
 b=vEF8np5PpQnjIhPuNrXESDHVJnx1on5Xx8Nbjn1tNUV+tv3YrHwFJhtygr9EbsiHnr
 +u+b5cMMFbfRWFuf7p78jfbMGQSZd3wbIos+DT+d8lBwb/k4CakPh0wWHOtsXkAARjOc
 TNuRuvUysq612n41ujckUsptrCYpQpqiXdgY1gjscIsRTwbAyzWL+9EWaAeNvKS+FWob
 5vZSxfNpFjhA9dwqM/km56junThkdKmH3KslMqe8S6vxWr/7uUsUOpwuXCZtmBtNdsKp
 Yf+lRfR5a1nwY7okRjAQFkko5n/J+9o9w+v/igfxVk3Fx36P6lEZ37IQtP0Uix0SGJgW
 wA2A==
X-Gm-Message-State: AO0yUKVcxZ7BrMsWmCScYFXGluBPzDz/ZF/otNEn/jHA8gVd/dMcpaOb
 5A+bROHm7t4VNmUydMhg1mBPgZjSn/jCi/i2h48QQQ8/xRUPAn0CGhwY1oFOPXUVKCzCo69lhQT
 D8IVMi9c/L/du+mZdtwgjD58nS1peOTsq2F1EomxNyhy87fEwhMIGfK/63cgEc7N8bSEoqPpN
X-Received: by 2002:a05:600c:1688:b0:3dd:caa8:3ae2 with SMTP id
 k8-20020a05600c168800b003ddcaa83ae2mr18149191wmn.6.1676256750520; 
 Sun, 12 Feb 2023 18:52:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/dMZ2ZUSJfLWqLY2UApnuV78OOZJsuUZ90EHofczH2jOt/9V9vmU4+7z/snj4nrMRv4huVAg==
X-Received: by 2002:a05:600c:1688:b0:3dd:caa8:3ae2 with SMTP id
 k8-20020a05600c168800b003ddcaa83ae2mr18149171wmn.6.1676256750269; 
 Sun, 12 Feb 2023 18:52:30 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q14-20020a5d574e000000b002bfb02153d1sm9399532wrw.45.2023.02.12.18.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 22/22] ram: Document migration ram flags
Date: Mon, 13 Feb 2023 03:51:50 +0100
Message-Id: <20230213025150.71537-23-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

0x80 is RAM_SAVE_FLAG_HOOK, it is in qemu-file now.
Bigger usable flag is 0x200, noticing that.
We can reuse RAM_SAVe_FLAG_FULL.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 18ac68b181..521912385d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -67,21 +67,25 @@
 /***********************************************************/
 /* ram save/restore */
 
-/* RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
- * worked for pages that where filled with the same char.  We switched
+/*
+ * RAM_SAVE_FLAG_ZERO used to be named RAM_SAVE_FLAG_COMPRESS, it
+ * worked for pages that were filled with the same char.  We switched
  * it to only search for the zero value.  And to avoid confusion with
- * RAM_SSAVE_FLAG_COMPRESS_PAGE just rename it.
+ * RAM_SAVE_FLAG_COMPRESS_PAGE just rename it.
  */
-
-#define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
+/*
+ * RAM_SAVE_FLAG_FULL was obsoleted in 2009, it can be reused now
+ */
+#define RAM_SAVE_FLAG_FULL     0x01
 #define RAM_SAVE_FLAG_ZERO     0x02
 #define RAM_SAVE_FLAG_MEM_SIZE 0x04
 #define RAM_SAVE_FLAG_PAGE     0x08
 #define RAM_SAVE_FLAG_EOS      0x10
 #define RAM_SAVE_FLAG_CONTINUE 0x20
 #define RAM_SAVE_FLAG_XBZRLE   0x40
-/* 0x80 is reserved in migration.h start with 0x100 next */
+/* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+/* We can't use any flag that is bigger than 0x200 */
 
 int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
      uint8_t *, int) = xbzrle_encode_buffer;
-- 
2.39.1


