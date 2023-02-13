Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2EF693C5C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb1-0001XC-FB; Sun, 12 Feb 2023 21:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROay-0001Wy-0L
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROaw-00033w-Gp
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UptCkJZZ1oFnZpYoUHipdojg2SHE5Vc15YVv+FVTq60=;
 b=C/R1S3Qj05XImtPv4bua4UgfLw8mvoZ7vNEVOTbNHmBTjC6Y9Kl+CskRvTSNReN6GaWWqG
 mYwUGfZ/jicTObehWLDZe1clzm+OFVvnhJJawdW416/s6ewQxboi5TZWAwAVqu9SkxnXZe
 PlDzRvvD26dCgfTPuYM1oR0Ug0/Av5E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-PKx16lsoO5KaEwtWTzsTZg-1; Sun, 12 Feb 2023 21:29:28 -0500
X-MC-Unique: PKx16lsoO5KaEwtWTzsTZg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso8356344wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UptCkJZZ1oFnZpYoUHipdojg2SHE5Vc15YVv+FVTq60=;
 b=n9lCo4VH3PG98hgs3xxhV83C08zAfBE9UPEuOwfz6fdjXfEqHi5VghuVkybdwURiuU
 4KYLWu6rFQOMx2jVp7Y3DU2EszMi6eRv0fAHNqIe8rGlg/9fjCsos5JbL9jOjrlO64dg
 VSylvjaZSVvV9soVyYE+m6zA5clC3rgfnm6CUHwiEgjn1QXwVwflKjx3ZPs5aE8xndOk
 GcaYpKXqCp+qEA5ergUTI2pL8PHxMQyDWmK5i3TsXC/Nd1Yq1IYV65hGb4cTafIHwdfP
 pSCumDvzGpVFX1Tv3Uegpln6mDcZCMxxUcE9kGIWJRJEXgKvIQYbgjqMVX6ugl02AfV/
 lPzg==
X-Gm-Message-State: AO0yUKXf7ldfHBOqjfI5m3h6xNzByRECAxwOib2R8ivpfF3LVE/toAsv
 OowqkZb0POFF1XbV5TUvEZwdt37UiX9Dx+2R7yHFU7V60NCD3j2IorSj2j9S7mbYc12veKOZyoc
 DZ0RgD60ONk/SYdzVm/Dm6tT1CpgduNahH+n023MDUYDR+zqcQ8icryiEuq2TWF5uFFI9Sv48
X-Received: by 2002:a05:600c:920:b0:3df:d817:df98 with SMTP id
 m32-20020a05600c092000b003dfd817df98mr18108859wmp.10.1676255366925; 
 Sun, 12 Feb 2023 18:29:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZZNvjk2tGZ5tQzckq/asqm2AH0dpNmfP8JVO5494f3UTMZP5AV7bWiTgPrGjmhPGeypFXpw==
X-Received: by 2002:a05:600c:920:b0:3df:d817:df98 with SMTP id
 m32-20020a05600c092000b003dfd817df98mr18108841wmp.10.1676255366678; 
 Sun, 12 Feb 2023 18:29:26 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003e001119927sm15091501wmc.24.2023.02.12.18.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:26 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 08/22] migration: Split ram_bytes_total_common() in two
 functions
Date: Mon, 13 Feb 2023 03:28:57 +0100
Message-Id: <20230213022911.68490-9-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Juan Quintela <quintela@redhat.com>

It is just a big if in the middle of the function, and we need two
functions anways.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Reindent to make Phillipe happy (and CODING_STYLE)
---
 migration/ram.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index cf577fce5c..1727fe5ef6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2601,28 +2601,30 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     }
 }
 
-static uint64_t ram_bytes_total_common(bool count_ignored)
+static uint64_t ram_bytes_total_with_ignored(void)
 {
     RAMBlock *block;
     uint64_t total = 0;
 
     RCU_READ_LOCK_GUARD();
 
-    if (count_ignored) {
-        RAMBLOCK_FOREACH_MIGRATABLE(block) {
-            total += block->used_length;
-        }
-    } else {
-        RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-            total += block->used_length;
-        }
+    RAMBLOCK_FOREACH_MIGRATABLE(block) {
+        total += block->used_length;
     }
     return total;
 }
 
 uint64_t ram_bytes_total(void)
 {
-    return ram_bytes_total_common(false);
+    RAMBlock *block;
+    uint64_t total = 0;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
+        total += block->used_length;
+    }
+    return total;
 }
 
 static void xbzrle_load_setup(void)
@@ -3227,7 +3229,8 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
-        qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
+        qemu_put_be64(f, ram_bytes_total_with_ignored()
+                         | RAM_SAVE_FLAG_MEM_SIZE);
 
         RAMBLOCK_FOREACH_MIGRATABLE(block) {
             qemu_put_byte(f, strlen(block->idstr));
-- 
2.39.1


