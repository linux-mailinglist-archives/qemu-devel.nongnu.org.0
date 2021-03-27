Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD934B7C0
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:37:58 +0100 (CET)
Received: from localhost ([::1]:42014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQA4b-0003iX-AY
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1x-0001tW-7Q
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1v-0003r3-CA
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso6323228wmi.3
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZSQ/WCssKLmHlUaPDSC0DxTm9vWcj4v5D5bG9alzR5g=;
 b=O1nigOrEMwzhW/F0qG4KfBY3DUy4REYNmef6sc8SL1xNKPPYBodcERf5R0VESaChOq
 7/kJ2RMYhZFdqcWT4OiiYIcPag0Cpw3kMC2VLoCi+kcXdZpLmWlWJSc/T+j+Cy33FiEn
 jTufZCeJhVnK5ssZmvgv4NvclfAxXyjphpbPLfMrY5mRrbfV/iaRV58QHrlLF5jppM6v
 5+jlhbYscD5afRuqn4Xu0q16b+gtzVUHWEuJf9ea99oD4ZHPPPsfPHlWb/WK9UCi4V6O
 uzxCbGdtUmt7nCBEGbNY5e8MYiGNSshzyk8dZGVjpbiCO1IV4TENhp31NQKk9BLqykaN
 2KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZSQ/WCssKLmHlUaPDSC0DxTm9vWcj4v5D5bG9alzR5g=;
 b=MAU9zwYbiqHXdiA3U2HSp9J8ttpGfGjegWHDB9Xm6aSRrsx6xXkdP5f785njvhUqRY
 AO1enffYCtCvR5SBQd/l+/lkAWZzW9pcS5SAQAQnvywqm7OhXU8JHSd3a8Q+7yFx6T4y
 W/7xMz78dxnToWd3ZTWvHBXv33/hIHuwAOAFQx0C8LHthy9j6EKb/Kv016cb51L/+sTw
 O2JrADRLGE7xxzU6i3abrzMtzYBE8/YtYQU8JrJi4EptvxgdZj70JEw+tcMdKK1JnW6E
 08BCWP0w0hXL+ke4r6KW51XLxK8/QYAeQGIbH/+d2N9p43HzuKL7c0p2W0p9lLklqbNA
 +zPw==
X-Gm-Message-State: AOAM5314qzpi+Wqq5MPM/cQ/nnCrPPIsJkKCgV95ep69PsuHe9DPhKOz
 9WD0vXBT4XoSFHhIWnjjRepbRDluK+ox6A==
X-Google-Smtp-Source: ABdhPJx9DbdTn4lViZoKoCVcUBfKRmM3h0sos5DiPbJD1XiJuFgQAd6mR3YCC1gxaMnJTVOAt3NBxg==
X-Received: by 2002:a1c:e383:: with SMTP id
 a125mr17601260wmh.125.1616855708990; 
 Sat, 27 Mar 2021 07:35:08 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d13sm19796103wro.23.2021.03.27.07.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 07:35:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 3/5] memory: Rename MemoryRegion object getters
Date: Sat, 27 Mar 2021 15:34:50 +0100
Message-Id: <20210327143452.1514392-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210327143452.1514392-1-f4bug@amsat.org>
References: <20210327143452.1514392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

We want to add the corresponding object setters, but the
memory_region_set_size() / memory_region_set_priority()
functions already exist. Rename the getters so match with
the setters we are going to add in the next patches.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index fdba938f299..3f4cd4e85d7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1217,9 +1217,9 @@ static Object *memory_region_resolve_container(Object *obj, void *opaque,
     return OBJECT(mr->container);
 }
 
-static void memory_region_get_priority(Object *obj, Visitor *v,
-                                       const char *name, void *opaque,
-                                       Error **errp)
+static void memory_region_priority_getter(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
 {
     MemoryRegion *mr = MEMORY_REGION(obj);
     int32_t value = mr->priority;
@@ -1227,8 +1227,9 @@ static void memory_region_get_priority(Object *obj, Visitor *v,
     visit_type_int32(v, name, &value, errp);
 }
 
-static void memory_region_get_size(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+static void memory_region_size_getter(Object *obj, Visitor *v,
+                                      const char *name, void *opaque,
+                                      Error **errp)
 {
     MemoryRegion *mr = MEMORY_REGION(obj);
     uint64_t value = memory_region_size(mr);
@@ -1258,12 +1259,12 @@ static void memory_region_initfn(Object *obj)
     object_property_add_uint64_ptr(OBJECT(mr), "addr",
                                    &mr->addr, OBJ_PROP_FLAG_READ);
     object_property_add(OBJECT(mr), "priority", "int32",
-                        memory_region_get_priority,
-                        NULL, /* memory_region_set_priority */
+                        memory_region_priority_getter,
+                        NULL, /* memory_region_priority_setter */
                         NULL, NULL);
     object_property_add(OBJECT(mr), "size", "uint64",
-                        memory_region_get_size,
-                        NULL, /* memory_region_set_size, */
+                        memory_region_size_getter,
+                        NULL, /* memory_region_size_setter, */
                         NULL, NULL);
 }
 
-- 
2.26.2


