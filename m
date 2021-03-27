Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0634B7C6
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:39:51 +0100 (CET)
Received: from localhost ([::1]:49124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQA6Q-0006do-VL
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA26-0001zi-QQ
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA25-0003wJ-5U
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id g20so4387076wmk.3
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nytHhpIU7AeijKNtnvMmrcHFDkiQRus2NJnfPr4I6fo=;
 b=BOjCA3RNMhoMy96GPk1renB8D1OmgEquL+RXIoSAGeO2EBMWUCN5fLMV7QW7lJN7Na
 gVA7uEgkwWNzpCfFNhj4iBmrxKNjhkLcRKBLbBh2PrGjnCiGLzw5ch1zHKHj7HtOSNQT
 SvVENWwBib7XF/6oNHtFUQfKuRkQfc4nqSEhncQmCUrFEJrzPDFJFFFIvWH5ekSzFCef
 t6JyfkxhII8mdc8IDyFsyq2MLCMRWsKWJ7ypsvdBSCgr7QjtWOC2sXG7vdqDn6WokLrX
 X9geT9gMhLb+nS4b0FEVFlo2sAIdUeEpguFBpyfzpL3R3/O09tzu7PleInhxkltEJh8n
 sudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nytHhpIU7AeijKNtnvMmrcHFDkiQRus2NJnfPr4I6fo=;
 b=TokgIGyBJp4LETkIGcaNT9zJf/h/herfqUKkbJrCSJuHK3L8aCMhMiOu4Tx+SfPb04
 rYT9SG8BYg+3P+Ypff8+yU5WCDBfvaMozKYvbAQd/ZMa2wQ6+ZveNMGTDgJDUIry0R2K
 B+RlmPSQXLugs7xMnkHfNotI6vSdXdGyxgfW4umOUyIRByqi4SslAISkqkxW3CtOKXiR
 C3bhwjRABxdgPnjN/1b1BssHnu9QTAiuPmuZ2zFEWH0LxSYSV0cbR90GN49DtqdjMRqW
 LJtANffdnkayW3U5QfplLCgUAt1XnjtJhET9k50BwwtWYTtNqOqKcd9vjKU/t8SHksr9
 zvCg==
X-Gm-Message-State: AOAM53149KTSBSF/oC6JM+/HOBxYFzX0/FUv2a7i56Tbu/F/rLaYhk2v
 cUt0RBJTwqtF5qZLM6fmIXRtfuGllASdnQ==
X-Google-Smtp-Source: ABdhPJwYHm79lmZgWYgnqDpoSfRLXF8jwwGqUC5r0DXr+zepArZllY/4lKwa2npbXEDEd+r9ayJf4A==
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr17529325wmj.58.1616855718118; 
 Sat, 27 Mar 2021 07:35:18 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w11sm19329536wrv.88.2021.03.27.07.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 07:35:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 5/5] memory: Add setter for MemoryRegion object
 'priority' property
Date: Sat, 27 Mar 2021 15:34:52 +0100
Message-Id: <20210327143452.1514392-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210327143452.1514392-1-f4bug@amsat.org>
References: <20210327143452.1514392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
index 1a5b8a62eb9..371e52b300e 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1227,6 +1227,18 @@ static void memory_region_priority_getter(Object *obj, Visitor *v,
     visit_type_int32(v, name, &value, errp);
 }
 
+static void memory_region_priority_setter(Object *obj, Visitor *v,
+                                          const char *name, void *opaque,
+                                          Error **errp)
+{
+    MemoryRegion *mr = MEMORY_REGION(obj);
+    int32_t priority;
+
+    if (visit_type_int32(v, name, &priority, errp)) {
+        memory_region_set_priority(mr, priority);
+    }
+}
+
 static void memory_region_size_getter(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
                                       Error **errp)
@@ -1272,7 +1284,7 @@ static void memory_region_initfn(Object *obj)
                                    &mr->addr, OBJ_PROP_FLAG_READ);
     object_property_add(OBJECT(mr), "priority", "int32",
                         memory_region_priority_getter,
-                        NULL, /* memory_region_priority_setter */
+                        memory_region_priority_setter,
                         NULL, NULL);
     object_property_add(OBJECT(mr), "size", "uint64",
                         memory_region_size_getter,
-- 
2.26.2


