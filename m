Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AE634B7C5
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:39:51 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQA6Q-0006cy-Mv
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA23-0001wO-2W
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1z-0003t7-7y
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:16 -0400
Received: by mail-wm1-x331.google.com with SMTP id 12so4379418wmf.5
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0cta43JTlGaCsAnxU5rDI7aZy/sAhROjdwP1D0Tj/QM=;
 b=Oo8g1PQ3sEFbeDMOgJZwU+6VDZzfk52kmpV2EEPzciayy8i8TBuBfG4EIrh+681J7B
 121cdfZ9BwkqUzhsFWpzTWP8EQnd+3OgSwTeQR34MMrdhGihj3mEbqERNO4syVUo5pSo
 j6SOLYtNY1sTKfuf7Pzo6EJUZkmEXgIu2qeQH+KaVzRmjbxODh/UIVPFro2DI9JjhFpp
 qPKA4eSFUeJNPQpcvXnC6RzzmVZrGu+Q38aTAKJK11ndn9CEk3Ezt8vlBHYSqPTZtD3B
 yRRFXNJm8pUiHcoT+jaf4eI+rhtgFE+IjxQjGf0XNL+cOiHvBYh965DKa0//f2F41bAO
 Cr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0cta43JTlGaCsAnxU5rDI7aZy/sAhROjdwP1D0Tj/QM=;
 b=ClTAkAF515Vo4zX4qPRPHGQm+gFabZz04CsToJSD270I9KzH/R1Hm+QKjfsgzTd04i
 Vb6H+N3ASWG+5Lqmkk0iLtS4QVBVwRD4qJi+WCAaoxIH/b8g9KdCqSsmTFAW0zpf5w6P
 euWTe/yP7IzRZYFbIEWpEGGPJ8ec/f4b3TY4lV9EhEhazfKZ7Nci69OwDl6PR5nxXTSp
 hjxqVWl4d4rE7wgyUze2aSQxtOi9cvlLxA6VF4yKVmyQ4FQ1OYVkGUOOWnZYFdOfRcxF
 yROXQVkBa4JY2m+W2xaxzu5FR7S1IgxtEHg4OtWZGigh511bets28JwxT+cDBAs7FZT0
 dYTg==
X-Gm-Message-State: AOAM531VK2TbPow8guVkvzcGqOTciXRjSsW/s/fTRn3CMm52PRgoi+gC
 wE5cFyRqmXDSDI6WuS1JB/8XaiOQvLiRoA==
X-Google-Smtp-Source: ABdhPJzwO7+rprhwYNbyZ7xhl0q3btMfwb/U75apQZw5MRrS5XggvDi6XXxGWaVohSncRyOij8dI6g==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr17931588wmc.132.1616855713540; 
 Sat, 27 Mar 2021 07:35:13 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s8sm19267478wrn.97.2021.03.27.07.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 07:35:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 4/5] memory: Add setter for MemoryRegion object
 'size' property
Date: Sat, 27 Mar 2021 15:34:51 +0100
Message-Id: <20210327143452.1514392-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210327143452.1514392-1-f4bug@amsat.org>
References: <20210327143452.1514392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 3f4cd4e85d7..1a5b8a62eb9 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1237,6 +1237,18 @@ static void memory_region_size_getter(Object *obj, Visitor *v,
     visit_type_uint64(v, name, &value, errp);
 }
 
+static void memory_region_size_setter(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
+{
+    MemoryRegion *mr = MEMORY_REGION(obj);
+    uint64_t size;
+
+    if (visit_type_uint64(v, name, &size, errp)) {
+        memory_region_set_size(mr, size);
+    }
+}
+
 static void memory_region_initfn(Object *obj)
 {
     MemoryRegion *mr = MEMORY_REGION(obj);
@@ -1264,7 +1276,7 @@ static void memory_region_initfn(Object *obj)
                         NULL, NULL);
     object_property_add(OBJECT(mr), "size", "uint64",
                         memory_region_size_getter,
-                        NULL, /* memory_region_size_setter, */
+                        memory_region_size_setter,
                         NULL, NULL);
 }
 
-- 
2.26.2


