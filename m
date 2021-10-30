Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D7440AA0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:33:07 +0200 (CEST)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsE6-0005Da-Ug
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpw-0004CZ-Ci
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpu-0004t4-7z
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso4877840wmc.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WJPqv7zpyprAfWAj4SAgtpTfimABdVANbuRjgx08JY=;
 b=YXPZXRu2vKw39TY82Na++MetCVVAodpac3NtntydU0vp7bTYJWONDkEqZsMB0MU6mV
 EebEDkQ9tj9e/95vPr+QNriJ31xsB1vP8E2MrtWeKbFxn/gAUVwEWmoLBgl5g/YkCIeI
 ijGOl6Jtz8bzE2f939rlSFVgE0DNoZIHGPbkgDXhajik8PrvqDYmzcL2OyY9/xP5Bbww
 RgIH08rMEsAXjI1if5hmbk+tHcgJRQcw5mhYk/cRWfS5BQMwC+7IHSL24MZAfR9ePbR3
 lfmiKnwrnZpRj96hD6CYj+cFBhqDPJjRdIdknwqwnQkPeJXtjL6vgLNcKfINmfSFWbKI
 9vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7WJPqv7zpyprAfWAj4SAgtpTfimABdVANbuRjgx08JY=;
 b=7soXfAMmvpFfwSkwnAehmQ9HUAZY8kLOFOQ/ULu+z2Y8vMT0pAxoiuLMhL+YT6EVxH
 WZsSANU+GSs+WiJib2kN28U9sD7Ba8t1KT4fYEqM412jcyjEY4f0yP2D8f+trfD1GpNC
 3a9mMVVutFSa9sKypXr7oxR52ABxKht+dAlD8oZm5UV+LuxeNOtSxrJ11DMptIdLQ9f1
 k4cXAOePi0AJgEVci2kM8j5MOWHIJ7gxrP+S++qcuWgVbhmOEk2U5ou6NS25/lx59zgN
 IMC5TMyuV/MU8SrEvtg5XQ0zZ40f7bgcGkZmdGGQRDgbinpRhKVF92QfKryScyk5uTuw
 tpkw==
X-Gm-Message-State: AOAM5323ANgf3AOk/sWL/8/Dql2cIy9XKoFdYbGlxZplgFjzxKFGJwtx
 xUG2PsCsAUZ0dsf4TrNBwsHJgkH8kgU=
X-Google-Smtp-Source: ABdhPJyYuat/aJfRn+c5K9itSls3zuGEhBgweUs/Nw5iOiCC0I5UsDleZgJANqHOK4YDLWpKz4boow==
X-Received: by 2002:a05:600c:40b:: with SMTP id
 q11mr1146454wmb.185.1635613684703; 
 Sat, 30 Oct 2021 10:08:04 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z135sm14281303wmc.45.2021.10.30.10.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] hw/intc/sh_intc: Inline and drop sh_intc_source()
 function
Date: Sat, 30 Oct 2021 19:06:07 +0200
Message-Id: <20211030170615.2636436-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This function is very simple and provides no advantage. Call sites
become simpler without it so just write it in line and drop the
separate function.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <a98d1f7f94e91a42796b7d91e9153a7eaa3d1c44.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sh4/sh_intc.h |  2 +-
 hw/intc/sh_intc.c        | 54 ++++++++++++++++------------------------
 hw/sh4/sh7750.c          |  4 +--
 3 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/include/hw/sh4/sh_intc.h b/include/hw/sh4/sh_intc.h
index 65f34250572..f62d5c5e136 100644
--- a/include/hw/sh4/sh_intc.h
+++ b/include/hw/sh4/sh_intc.h
@@ -58,7 +58,7 @@ struct intc_desc {
 };
 
 int sh_intc_get_pending_vector(struct intc_desc *desc, int imask);
-struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id);
+
 void sh_intc_toggle_source(struct intc_source *source,
                            int enable_adj, int assert_adj);
 
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index e6e01428f9f..9995213cb0b 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -262,33 +262,22 @@ static const MemoryRegionOps sh_intc_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
-{
-    if (id) {
-        return &desc->sources[id];
-    }
-    return NULL;
-}
-
 static void sh_intc_register_source(struct intc_desc *desc,
                                     intc_enum source,
                                     struct intc_group *groups,
                                     int nr_groups)
 {
     unsigned int i, k;
-    struct intc_source *s;
+    intc_enum id;
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
             struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
-                if (mr->enum_ids[k] != source) {
-                    continue;
-                }
-                s = sh_intc_source(desc, mr->enum_ids[k]);
-                if (s) {
-                    s->enable_max++;
+                id = mr->enum_ids[k];
+                if (id && id == source) {
+                    desc->sources[id].enable_max++;
                 }
             }
         }
@@ -299,12 +288,9 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
-                if (pr->enum_ids[k] != source) {
-                    continue;
-                }
-                s = sh_intc_source(desc, pr->enum_ids[k]);
-                if (s) {
-                    s->enable_max++;
+                id = pr->enum_ids[k];
+                if (id && id == source) {
+                    desc->sources[id].enable_max++;
                 }
             }
         }
@@ -315,12 +301,9 @@ static void sh_intc_register_source(struct intc_desc *desc,
             struct intc_group *gr = &groups[i];
 
             for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
-                if (gr->enum_ids[k] != source) {
-                    continue;
-                }
-                s = sh_intc_source(desc, gr->enum_ids[k]);
-                if (s) {
-                    s->enable_max++;
+                id = gr->enum_ids[k];
+                if (id && id == source) {
+                    desc->sources[id].enable_max++;
                 }
             }
         }
@@ -335,14 +318,16 @@ void sh_intc_register_sources(struct intc_desc *desc,
                               int nr_groups)
 {
     unsigned int i, k;
+    intc_enum id;
     struct intc_source *s;
 
     for (i = 0; i < nr_vectors; i++) {
         struct intc_vect *vect = &vectors[i];
 
         sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
-        s = sh_intc_source(desc, vect->enum_id);
-        if (s) {
+        id = vect->enum_id;
+        if (id) {
+            s = &desc->sources[id];
             s->vect = vect->vect;
             trace_sh_intc_register("source", vect->enum_id, s->vect,
                                    s->enable_count, s->enable_max);
@@ -353,14 +338,16 @@ void sh_intc_register_sources(struct intc_desc *desc,
         for (i = 0; i < nr_groups; i++) {
             struct intc_group *gr = &groups[i];
 
-            s = sh_intc_source(desc, gr->enum_id);
+            id = gr->enum_id;
+            s = &desc->sources[id];
             s->next_enum_id = gr->enum_ids[0];
 
             for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
                 if (!gr->enum_ids[k]) {
                     continue;
                 }
-                s = sh_intc_source(desc, gr->enum_ids[k - 1]);
+                id = gr->enum_ids[k - 1];
+                s = &desc->sources[id];
                 s->next_enum_id = gr->enum_ids[k];
             }
             trace_sh_intc_register("group", gr->enum_id, 0xffff,
@@ -462,7 +449,10 @@ void sh_intc_set_irl(void *opaque, int n, int level)
 {
     struct intc_source *s = opaque;
     int i, irl = level ^ 15;
-    for (i = 0; (s = sh_intc_source(s->parent, s->next_enum_id)); i++) {
+    intc_enum id = s->next_enum_id;
+
+    for (i = 0; id; id = s->next_enum_id, i++) {
+        s = &s->parent->sources[id];
         if (i == irl) {
             sh_intc_toggle_source(s, s->enable_count ? 0 : 1,
                                   s->asserted ? 0 : 1);
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index f7d21f61702..43dfb6497b5 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -899,6 +899,6 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
 qemu_irq sh7750_irl(SH7750State *s)
 {
-    sh_intc_toggle_source(sh_intc_source(&s->intc, IRL), 1, 0); /* enable */
-    return qemu_allocate_irq(sh_intc_set_irl, sh_intc_source(&s->intc, IRL), 0);
+    sh_intc_toggle_source(&s->intc.sources[IRL], 1, 0); /* enable */
+    return qemu_allocate_irq(sh_intc_set_irl, &s->intc.sources[IRL], 0);
 }
-- 
2.31.1


