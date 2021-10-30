Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70368440A81
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:18:41 +0200 (CEST)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs08-0003ht-7b
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpr-0003xZ-SO
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpp-0004so-FO
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j35-20020a05600c1c2300b0032caeca81b7so7421165wms.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zODO12VHWUSxx1Lh1L9MdKocBSLtHOXZu5x4L+V7Cn8=;
 b=QqqKCxxdL8Bfa+mTmNYEZNYYI0h4vwXNBHutKi9tWctVcEk5K1nTjBXBSZzB2OkI94
 V0lAu6YYAXhS4FS/00kF0sCCQ4beWq4uJpCqWd5mNiSshA8mqAB3kACVrFpLYp9I9KuW
 CRBdAmIpAVWhQye2ixvkcRrtnBJExI2OJ2tLe0iYZ+vZhRjD7d41smwNu2niwbnUMwOl
 sf3Yo2KYG70FWK0mNxT5CAW19PyyC4scmn2kUKd5MllqITRahjzwjEd7fWuGo7W0Lgv9
 m+S+ODjeU9yl5EXx8yTeNqnezMXINhi4ZgHoBQwPC2Hn9xhmIeReqJkXqjRikIDY2wie
 QA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zODO12VHWUSxx1Lh1L9MdKocBSLtHOXZu5x4L+V7Cn8=;
 b=d9J3N0uGyxlKtTa7rhT+Hzdbl3JHwX4CSpSzjNYZ1lKis6D3QNjXMmRmxT4BxEz+ak
 KA2m+XK5v6a0sfrFI3avWSoVQbOtihGr7X7GaC2YYJo4ubHiyuVr3CJmlb4t4yaJ6qaD
 cBZqYby4qh4us6pn1P29KuPQp4yG5JAGyijOcGdJr8CUF16FKlyMkLqwwYiEE9D/ZfyP
 W4CCiXXyFB3CvOetEFFNoF0RXTAGQ11rawtej75vYK2y7u+SKxQ5M564esSNeLEwrIDI
 RFXsj7U2I0h9j354y4sDweXOGXAUPGGBgBtQaoe0uEPbXcZUjbhb+Usa0YJovGu4WmUc
 kQ0Q==
X-Gm-Message-State: AOAM532apZfoptplO5mbDAAshfOFo6hMsjkWX+qu6yKQ1p5w5N3OVjPt
 d/NV+iGlU83oqjtBmfpHZT+DZNYN/mk=
X-Google-Smtp-Source: ABdhPJzDL3TRheWu3wveqRWPpwstyP6pL7oZVrMupGJY9jaS+KhHcWzJyaCafqYmPBQSzj9ppoW4aw==
X-Received: by 2002:a7b:cc1a:: with SMTP id f26mr9173064wmh.39.1635613679838; 
 Sat, 30 Oct 2021 10:07:59 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l6sm7701782wmq.17.2021.10.30.10.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] hw/intc/sh_intc: Use array index instead of pointer
 arithmetics
Date: Sat, 30 Oct 2021 19:06:06 +0200
Message-Id: <20211030170615.2636436-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Address of element i is one word thus clearer than array + i.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <f49c9b1dee1fcaf374b092d862a6821907d5fcdc.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 416581dc07a..e6e01428f9f 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -89,7 +89,7 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
     }
 
     for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = desc->sources + i;
+        struct intc_source *source = &desc->sources[i];
 
         if (source->pending) {
             trace_sh_intc_pending(desc->pending, source->vect);
@@ -137,7 +137,7 @@ static void sh_intc_locate(struct intc_desc *desc,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-            struct intc_mask_reg *mr = desc->mask_regs + i;
+            struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
             if (mode == INTC_MODE_NONE) {
@@ -154,7 +154,7 @@ static void sh_intc_locate(struct intc_desc *desc,
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-            struct intc_prio_reg *pr = desc->prio_regs + i;
+            struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
             if (mode == INTC_MODE_NONE) {
@@ -175,7 +175,7 @@ static void sh_intc_locate(struct intc_desc *desc,
 static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
                                 int enable, int is_group)
 {
-    struct intc_source *source = desc->sources + id;
+    struct intc_source *source = &desc->sources[id];
 
     if (!id) {
         return;
@@ -265,7 +265,7 @@ static const MemoryRegionOps sh_intc_ops = {
 struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
 {
     if (id) {
-        return desc->sources + id;
+        return &desc->sources[id];
     }
     return NULL;
 }
@@ -280,7 +280,7 @@ static void sh_intc_register_source(struct intc_desc *desc,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-            struct intc_mask_reg *mr = desc->mask_regs + i;
+            struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
                 if (mr->enum_ids[k] != source) {
@@ -296,7 +296,7 @@ static void sh_intc_register_source(struct intc_desc *desc,
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-            struct intc_prio_reg *pr = desc->prio_regs + i;
+            struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
                 if (pr->enum_ids[k] != source) {
@@ -312,7 +312,7 @@ static void sh_intc_register_source(struct intc_desc *desc,
 
     if (groups) {
         for (i = 0; i < nr_groups; i++) {
-            struct intc_group *gr = groups + i;
+            struct intc_group *gr = &groups[i];
 
             for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
                 if (gr->enum_ids[k] != source) {
@@ -338,7 +338,7 @@ void sh_intc_register_sources(struct intc_desc *desc,
     struct intc_source *s;
 
     for (i = 0; i < nr_vectors; i++) {
-        struct intc_vect *vect = vectors + i;
+        struct intc_vect *vect = &vectors[i];
 
         sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
         s = sh_intc_source(desc, vect->enum_id);
@@ -351,7 +351,7 @@ void sh_intc_register_sources(struct intc_desc *desc,
 
     if (groups) {
         for (i = 0; i < nr_groups; i++) {
-            struct intc_group *gr = groups + i;
+            struct intc_group *gr = &groups[i];
 
             s = sh_intc_source(desc, gr->enum_id);
             s->next_enum_id = gr->enum_ids[0];
@@ -384,7 +384,7 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
     }
 
     iomem = &desc->iomem;
-    iomem_p4 = desc->iomem_aliases + index;
+    iomem_p4 = &desc->iomem_aliases[index];
     iomem_a7 = iomem_p4 + 1;
 
     snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
@@ -424,7 +424,7 @@ int sh_intc_init(MemoryRegion *sysmem,
     desc->sources = g_malloc0(i);
 
     for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = desc->sources + i;
+        struct intc_source *source = &desc->sources[i];
 
         source->parent = desc;
     }
@@ -435,7 +435,7 @@ int sh_intc_init(MemoryRegion *sysmem,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-            struct intc_mask_reg *mr = desc->mask_regs + i;
+            struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             j += sh_intc_register(sysmem, desc, mr->set_reg, "mask", "set", j);
             j += sh_intc_register(sysmem, desc, mr->clr_reg, "mask", "clr", j);
@@ -444,7 +444,7 @@ int sh_intc_init(MemoryRegion *sysmem,
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-            struct intc_prio_reg *pr = desc->prio_regs + i;
+            struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             j += sh_intc_register(sysmem, desc, pr->set_reg, "prio", "set", j);
             j += sh_intc_register(sysmem, desc, pr->clr_reg, "prio", "clr", j);
-- 
2.31.1


