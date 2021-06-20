Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C026B3ADFD1
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 21:02:50 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv2iW-0002na-S2
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 15:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lv2XR-00012l-EC
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 14:51:21 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lv2XM-0006QN-El
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 14:51:21 -0400
Received: by mail-lj1-x22e.google.com with SMTP id a21so16981769ljj.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DbjWJch1UxigbHrZOoN/F9CAPL1ng0fS41z5peBaT8=;
 b=VP1OWzF8QtGj5AtgLrLqY4syItns+yRFtXBL6aLAj9kRDox6IhgoOKKfQpqLHYkN7K
 m/IJKLfgakNQ0h0pd86IjnbNHcbMFIeeNGPvBLbbWmk7KDe5GZhRqBnQquTM9pntzbFz
 Bd4M0KTtFCvj4Hcf4oxroDdNIyzy21iDKu3B2kaWlceKUcpTWkPrz7ofS0MOdqGfaXQu
 J7AgUX7oTqv3s3MJpsn+SweYAlryVZsb61+wGgrmuBLxafzkKVTPhKxYKCiKNW9NNhWX
 HKO0cAXrLmGM0MSFYpyQP40WANNwctwvrF8I0IM+H2/FIbzNIriQOKFdxKe40tjjNAm8
 L+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DbjWJch1UxigbHrZOoN/F9CAPL1ng0fS41z5peBaT8=;
 b=qRa64EAG0OPQTnlp2Y9Lf1ATjGSISXBj/3K04ibOz81J4B7yWlpiFVT3r8XU/zcjjv
 lUcGcwbLOlf9d3JNd3ZZFfrE07kG0h8GP3TluY7OdBBLgWYsAXcIs275pZ+p5iGz+akB
 d9UNJ7hXY7oVB35XysIdh9HPKH6QyEujQMI5ZDddHEKMhqaA6UpXrErp8Xdy/rquChF/
 NZh5BowtT275HDwRQ1m63Jp93oc2V121hnGT8kvLDv4R5B9kMyNxWHPQAkmxeOQbhKv8
 iNzkcr9fcJdPZnUxsqdoGR7u7D85aJlNnMGsdmaKyiGLYTCtyUqB0xTP5sVgTJf7yuJP
 FNWA==
X-Gm-Message-State: AOAM530YeLno2RQPq+HD4iOB90c5miUtZZ9TnxloyR50c/kmGdO1oqXY
 d5vtU6p0oYYBvx1Dn6vs98c3uYXmkaTUrFRI7Z8cCQ==
X-Google-Smtp-Source: ABdhPJyHTQUV45r/CsJYimGQ+2qOQGqK3oHaHVi5us/nKNli5r17JkbgWtRD8YlzR+eAIZ/2bSHK8g==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr23877766wri.60.1624211698268; 
 Sun, 20 Jun 2021 10:54:58 -0700 (PDT)
Received: from pythagoras.localdomain ([154.190.215.81])
 by smtp.gmail.com with ESMTPSA id f12sm18137220wru.81.2021.06.20.10.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 10:54:57 -0700 (PDT)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] sh4: Replace TAB indentations with spaces
Date: Sun, 20 Jun 2021 19:54:52 +0200
Message-Id: <20210620175452.10076-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=email@aabouzied.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NO_DNS_FOR_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Ahmed Abouzied <email@aabouzied.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaces TABs with spaces, making sure to have a consistent coding style
of 4 space indentations in the SH4 subsystem.

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/376
---
 hw/intc/sh_intc.c         |  208 ++---
 hw/sh4/r2d.c              |   36 +-
 hw/sh4/sh7750.c           |  516 ++++++------
 hw/sh4/sh7750_regnames.c  |  144 ++--
 hw/sh4/sh7750_regs.h      | 1592 ++++++++++++++++++-------------------
 linux-user/sh4/termbits.h |  204 ++---
 target/sh4/cpu.h          |   80 +-
 target/sh4/helper.c       |  236 +++---
 target/sh4/op_helper.c    |   68 +-
 target/sh4/translate.c    | 1588 ++++++++++++++++++------------------
 10 files changed, 2336 insertions(+), 2336 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 72a55e32dd..63efec6ea1 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -20,7 +20,7 @@
 #define INTC_A7(x) ((x) & 0x1fffffff)
 
 void sh_intc_toggle_source(struct intc_source *source,
-			   int enable_adj, int assert_adj)
+               int enable_adj, int assert_adj)
 {
     int enable_changed = 0;
     int pending_changed = 0;
@@ -54,22 +54,22 @@ void sh_intc_toggle_source(struct intc_source *source,
             if (source->parent->pending == 0) {
                 cpu_reset_interrupt(first_cpu, CPU_INTERRUPT_HARD);
             }
-	}
+    }
     }
 
   if (enable_changed || assert_adj || pending_changed) {
 #ifdef DEBUG_INTC_SOURCES
             printf("sh_intc: (%d/%d/%d/%d) interrupt source 0x%x %s%s%s\n",
-		   source->parent->pending,
-		   source->asserted,
-		   source->enable_count,
-		   source->enable_max,
-		   source->vect,
-		   source->asserted ? "asserted " :
-		   assert_adj ? "deasserted" : "",
-		   enable_changed == 1 ? "enabled " :
-		   enable_changed == -1 ? "disabled " : "",
-		   source->pending ? "pending" : "");
+           source->parent->pending,
+           source->asserted,
+           source->enable_count,
+           source->enable_max,
+           source->vect,
+           source->asserted ? "asserted " :
+           assert_adj ? "deasserted" : "",
+           enable_changed == 1 ? "enabled " :
+           enable_changed == -1 ? "disabled " : "",
+           source->pending ? "pending" : "");
 #endif
   }
 }
@@ -99,13 +99,13 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
     for (i = 0; i < desc->nr_sources; i++) {
         struct intc_source *source = desc->sources + i;
 
-	if (source->pending) {
+    if (source->pending) {
 #ifdef DEBUG_INTC_SOURCES
             printf("sh_intc: (%d) returning interrupt source 0x%x\n",
-		   desc->pending, source->vect);
+           desc->pending, source->vect);
 #endif
             return source->vect;
-	}
+    }
     }
 
     abort();
@@ -119,16 +119,16 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
 #define INTC_MODE_IS_PRIO    8
 
 static unsigned int sh_intc_mode(unsigned long address,
-				 unsigned long set_reg, unsigned long clr_reg)
+                 unsigned long set_reg, unsigned long clr_reg)
 {
     if ((address != INTC_A7(set_reg)) &&
-	(address != INTC_A7(clr_reg)))
+    (address != INTC_A7(clr_reg)))
         return INTC_MODE_NONE;
 
     if (set_reg && clr_reg) {
         if (address == INTC_A7(set_reg))
             return INTC_MODE_DUAL_SET;
-	else
+    else
             return INTC_MODE_DUAL_CLR;
     }
 
@@ -139,12 +139,12 @@ static unsigned int sh_intc_mode(unsigned long address,
 }
 
 static void sh_intc_locate(struct intc_desc *desc,
-			   unsigned long address,
-			   unsigned long **datap,
-			   intc_enum **enums,
-			   unsigned int *first,
-			   unsigned int *width,
-			   unsigned int *modep)
+               unsigned long address,
+               unsigned long **datap,
+               intc_enum **enums,
+               unsigned int *first,
+               unsigned int *width,
+               unsigned int *modep)
 {
     unsigned int i, mode;
 
@@ -152,54 +152,54 @@ static void sh_intc_locate(struct intc_desc *desc,
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-	    struct intc_mask_reg *mr = desc->mask_regs + i;
+        struct intc_mask_reg *mr = desc->mask_regs + i;
 
-	    mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
-	    if (mode == INTC_MODE_NONE)
+        mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
+        if (mode == INTC_MODE_NONE)
                 continue;
 
-	    *modep = mode;
-	    *datap = &mr->value;
-	    *enums = mr->enum_ids;
-	    *first = mr->reg_width - 1;
-	    *width = 1;
-	    return;
-	}
+        *modep = mode;
+        *datap = &mr->value;
+        *enums = mr->enum_ids;
+        *first = mr->reg_width - 1;
+        *width = 1;
+        return;
+    }
     }
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-	    struct intc_prio_reg *pr = desc->prio_regs + i;
+        struct intc_prio_reg *pr = desc->prio_regs + i;
 
-	    mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
-	    if (mode == INTC_MODE_NONE)
+        mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
+        if (mode == INTC_MODE_NONE)
                 continue;
 
-	    *modep = mode | INTC_MODE_IS_PRIO;
-	    *datap = &pr->value;
-	    *enums = pr->enum_ids;
-	    *first = (pr->reg_width / pr->field_width) - 1;
-	    *width = pr->field_width;
-	    return;
-	}
+        *modep = mode | INTC_MODE_IS_PRIO;
+        *datap = &pr->value;
+        *enums = pr->enum_ids;
+        *first = (pr->reg_width / pr->field_width) - 1;
+        *width = pr->field_width;
+        return;
+    }
     }
 
     abort();
 }
 
 static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
-				int enable, int is_group)
+                int enable, int is_group)
 {
     struct intc_source *source = desc->sources + id;
 
     if (!id)
-	return;
+    return;
 
     if (!source->next_enum_id && (!source->enable_max || !source->vect)) {
 #ifdef DEBUG_INTC_SOURCES
         printf("sh_intc: reserved interrupt source %d modified\n", id);
 #endif
-	return;
+    return;
     }
 
     if (source->vect)
@@ -237,7 +237,7 @@ static uint64_t sh_intc_read(void *opaque, hwaddr offset,
 #endif
 
     sh_intc_locate(desc, (unsigned long)offset, &valuep, 
-		   &enum_ids, &first, &width, &mode);
+           &enum_ids, &first, &width, &mode);
     return *valuep;
 }
 
@@ -258,7 +258,7 @@ static void sh_intc_write(void *opaque, hwaddr offset,
 #endif
 
     sh_intc_locate(desc, (unsigned long)offset, &valuep, 
-		   &enum_ids, &first, &width, &mode);
+           &enum_ids, &first, &width, &mode);
 
     switch (mode) {
     case INTC_MODE_ENABLE_REG | INTC_MODE_IS_PRIO: break;
@@ -270,11 +270,11 @@ static void sh_intc_write(void *opaque, hwaddr offset,
     for (k = 0; k <= first; k++) {
         mask = ((1 << width) - 1) << ((first - k) * width);
 
-	if ((*valuep & mask) == (value & mask))
+    if ((*valuep & mask) == (value & mask))
             continue;
 #if 0
-	printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n", 
-	       k, first, enum_ids[k], (unsigned int)mask);
+    printf("k = %d, first = %d, enum = %d, mask = 0x%08x\n", 
+           k, first, enum_ids[k], (unsigned int)mask);
 #endif
         sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
     }
@@ -333,74 +333,74 @@ static unsigned int sh_intc_register(MemoryRegion *sysmem,
 }
 
 static void sh_intc_register_source(struct intc_desc *desc,
-				    intc_enum source,
-				    struct intc_group *groups,
-				    int nr_groups)
+                    intc_enum source,
+                    struct intc_group *groups,
+                    int nr_groups)
 {
     unsigned int i, k;
     struct intc_source *s;
 
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-	    struct intc_mask_reg *mr = desc->mask_regs + i;
+        struct intc_mask_reg *mr = desc->mask_regs + i;
 
-	    for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
+        for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
                 if (mr->enum_ids[k] != source)
                     continue;
 
-		s = sh_intc_source(desc, mr->enum_ids[k]);
-		if (s)
+        s = sh_intc_source(desc, mr->enum_ids[k]);
+        if (s)
                     s->enable_max++;
-	    }
-	}
+        }
+    }
     }
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-	    struct intc_prio_reg *pr = desc->prio_regs + i;
+        struct intc_prio_reg *pr = desc->prio_regs + i;
 
-	    for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
+        for (k = 0; k < ARRAY_SIZE(pr->enum_ids); k++) {
                 if (pr->enum_ids[k] != source)
                     continue;
 
-		s = sh_intc_source(desc, pr->enum_ids[k]);
-		if (s)
+        s = sh_intc_source(desc, pr->enum_ids[k]);
+        if (s)
                     s->enable_max++;
-	    }
-	}
+        }
+    }
     }
 
     if (groups) {
         for (i = 0; i < nr_groups; i++) {
-	    struct intc_group *gr = groups + i;
+        struct intc_group *gr = groups + i;
 
-	    for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
+        for (k = 0; k < ARRAY_SIZE(gr->enum_ids); k++) {
                 if (gr->enum_ids[k] != source)
                     continue;
 
-		s = sh_intc_source(desc, gr->enum_ids[k]);
-		if (s)
+        s = sh_intc_source(desc, gr->enum_ids[k]);
+        if (s)
                     s->enable_max++;
-	    }
-	}
+        }
+    }
     }
 
 }
 
 void sh_intc_register_sources(struct intc_desc *desc,
-			      struct intc_vect *vectors,
-			      int nr_vectors,
-			      struct intc_group *groups,
-			      int nr_groups)
+                  struct intc_vect *vectors,
+                  int nr_vectors,
+                  struct intc_group *groups,
+                  int nr_groups)
 {
     unsigned int i, k;
     struct intc_source *s;
 
     for (i = 0; i < nr_vectors; i++) {
-	struct intc_vect *vect = vectors + i;
+    struct intc_vect *vect = vectors + i;
 
-	sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
-	s = sh_intc_source(desc, vect->enum_id);
+    sh_intc_register_source(desc, vect->enum_id, groups, nr_groups);
+    s = sh_intc_source(desc, vect->enum_id);
         if (s) {
             s->vect = vect->vect;
 
@@ -413,34 +413,34 @@ void sh_intc_register_sources(struct intc_desc *desc,
 
     if (groups) {
         for (i = 0; i < nr_groups; i++) {
-	    struct intc_group *gr = groups + i;
+        struct intc_group *gr = groups + i;
 
-	    s = sh_intc_source(desc, gr->enum_id);
-	    s->next_enum_id = gr->enum_ids[0];
+        s = sh_intc_source(desc, gr->enum_id);
+        s->next_enum_id = gr->enum_ids[0];
 
-	    for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
+        for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
                 if (!gr->enum_ids[k])
                     continue;
 
-		s = sh_intc_source(desc, gr->enum_ids[k - 1]);
-		s->next_enum_id = gr->enum_ids[k];
-	    }
+        s = sh_intc_source(desc, gr->enum_ids[k - 1]);
+        s->next_enum_id = gr->enum_ids[k];
+        }
 
 #ifdef DEBUG_INTC_SOURCES
-	    printf("sh_intc: registered group %d (%d/%d)\n",
-		   gr->enum_id, s->enable_count, s->enable_max);
+        printf("sh_intc: registered group %d (%d/%d)\n",
+           gr->enum_id, s->enable_count, s->enable_max);
 #endif
-	}
+    }
     }
 }
 
 int sh_intc_init(MemoryRegion *sysmem,
          struct intc_desc *desc,
-		 int nr_sources,
-		 struct intc_mask_reg *mask_regs,
-		 int nr_mask_regs,
-		 struct intc_prio_reg *prio_regs,
-		 int nr_prio_regs)
+         int nr_sources,
+         struct intc_mask_reg *mask_regs,
+         int nr_mask_regs,
+         struct intc_prio_reg *prio_regs,
+         int nr_prio_regs)
 {
     unsigned int i, j;
 
@@ -474,24 +474,24 @@ int sh_intc_init(MemoryRegion *sysmem,
         reg_struct->action##_reg, #type, #action, j
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
-	    struct intc_mask_reg *mr = desc->mask_regs + i;
+        struct intc_mask_reg *mr = desc->mask_regs + i;
 
             j += sh_intc_register(sysmem, desc,
                                   INT_REG_PARAMS(mr, mask, set, j));
             j += sh_intc_register(sysmem, desc,
                                   INT_REG_PARAMS(mr, mask, clr, j));
-	}
+    }
     }
 
     if (desc->prio_regs) {
         for (i = 0; i < desc->nr_prio_regs; i++) {
-	    struct intc_prio_reg *pr = desc->prio_regs + i;
+        struct intc_prio_reg *pr = desc->prio_regs + i;
 
             j += sh_intc_register(sysmem, desc,
                                   INT_REG_PARAMS(pr, prio, set, j));
             j += sh_intc_register(sysmem, desc,
                                   INT_REG_PARAMS(pr, prio, clr, j));
-	}
+    }
     }
 #undef INT_REG_PARAMS
 
@@ -505,10 +505,10 @@ void sh_intc_set_irl(void *opaque, int n, int level)
     struct intc_source *s = opaque;
     int i, irl = level ^ 15;
     for (i = 0; (s = sh_intc_source(s->parent, s->next_enum_id)); i++) {
-	if (i == irl)
-	    sh_intc_toggle_source(s, s->enable_count?0:1, s->asserted?0:1);
-	else
-	    if (s->asserted)
-	        sh_intc_toggle_source(s, 0, -1);
+    if (i == irl)
+        sh_intc_toggle_source(s, s->enable_count?0:1, s->asserted?0:1);
+    else
+        if (s->asserted)
+            sh_intc_toggle_source(s, 0, -1);
     }
 }
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 006010f30a..dadbe16390 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -1,4 +1,4 @@
-/*
+:wq/*
  * Renesas SH7751R R2D-PLUS emulation
  *
  * Copyright (c) 2007 Magnus Damm
@@ -56,10 +56,10 @@
 #define LINUX_LOAD_OFFSET  0x0800000
 #define INITRD_LOAD_OFFSET 0x1800000
 
-#define PA_IRLMSK	0x00
-#define PA_POWOFF	0x30
-#define PA_VERREG	0x32
-#define PA_OUTPORT	0x36
+#define PA_IRLMSK    0x00
+#define PA_POWOFF    0x30
+#define PA_VERREG    0x32
+#define PA_OUTPORT    0x36
 
 typedef struct {
     uint16_t bcr;
@@ -96,19 +96,19 @@ enum r2d_fpga_irq {
 };
 
 static const struct { short irl; uint16_t msk; } irqtab[NR_IRQS] = {
-    [CF_IDE]	= {  1, 1<<9 },
-    [CF_CD]	= {  2, 1<<8 },
-    [PCI_INTA]	= {  9, 1<<14 },
-    [PCI_INTB]	= { 10, 1<<13 },
-    [PCI_INTC]	= {  3, 1<<12 },
-    [PCI_INTD]	= {  0, 1<<11 },
-    [SM501]	= {  4, 1<<10 },
-    [KEY]	= {  5, 1<<6 },
-    [RTC_A]	= {  6, 1<<5 },
-    [RTC_T]	= {  7, 1<<4 },
-    [SDCARD]	= {  8, 1<<7 },
-    [EXT]	= { 11, 1<<0 },
-    [TP]	= { 12, 1<<15 },
+    [CF_IDE]    = {  1, 1<<9 },
+    [CF_CD]    = {  2, 1<<8 },
+    [PCI_INTA]    = {  9, 1<<14 },
+    [PCI_INTB]    = { 10, 1<<13 },
+    [PCI_INTC]    = {  3, 1<<12 },
+    [PCI_INTD]    = {  0, 1<<11 },
+    [SM501]    = {  4, 1<<10 },
+    [KEY]    = {  5, 1<<6 },
+    [RTC_A]    = {  6, 1<<5 },
+    [RTC_T]    = {  7, 1<<4 },
+    [SDCARD]    = {  8, 1<<7 },
+    [EXT]    = { 11, 1<<0 },
+    [TP]    = { 12, 1<<15 },
 };
 
 static void update_irl(r2d_fpga_t *fpga)
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index d53a436d8c..dd8be12756 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -60,17 +60,17 @@ typedef struct SH7750State {
     uint16_t gpioic;
     uint32_t pctra;
     uint32_t pctrb;
-    uint16_t portdira;		/* Cached */
-    uint16_t portpullupa;	/* Cached */
-    uint16_t portdirb;		/* Cached */
-    uint16_t portpullupb;	/* Cached */
+    uint16_t portdira;        /* Cached */
+    uint16_t portpullupa;    /* Cached */
+    uint16_t portdirb;        /* Cached */
+    uint16_t portpullupb;    /* Cached */
     uint16_t pdtra;
     uint16_t pdtrb;
-    uint16_t periph_pdtra;	/* Imposed by the peripherals */
-    uint16_t periph_portdira;	/* Direction seen from the peripherals */
-    uint16_t periph_pdtrb;	/* Imposed by the peripherals */
-    uint16_t periph_portdirb;	/* Direction seen from the peripherals */
-    sh7750_io_device *devices[NB_DEVICES];	/* External peripherals */
+    uint16_t periph_pdtra;    /* Imposed by the peripherals */
+    uint16_t periph_portdira;    /* Direction seen from the peripherals */
+    uint16_t periph_pdtrb;    /* Imposed by the peripherals */
+    uint16_t periph_portdirb;    /* Direction seen from the peripherals */
+    sh7750_io_device *devices[NB_DEVICES];    /* External peripherals */
 
     /* Cache */
     uint32_t ccr;
@@ -91,10 +91,10 @@ int sh7750_register_io_device(SH7750State * s, sh7750_io_device * device)
     int i;
 
     for (i = 0; i < NB_DEVICES; i++) {
-	if (s->devices[i] == NULL) {
-	    s->devices[i] = device;
-	    return 0;
-	}
+    if (s->devices[i] == NULL) {
+        s->devices[i] = device;
+        return 0;
+    }
     }
     return -1;
 }
@@ -103,37 +103,37 @@ static uint16_t portdir(uint32_t v)
 {
 #define EVENPORTMASK(n) ((v & (1<<((n)<<1))) >> (n))
     return
-	EVENPORTMASK(15) | EVENPORTMASK(14) | EVENPORTMASK(13) |
-	EVENPORTMASK(12) | EVENPORTMASK(11) | EVENPORTMASK(10) |
-	EVENPORTMASK(9) | EVENPORTMASK(8) | EVENPORTMASK(7) |
-	EVENPORTMASK(6) | EVENPORTMASK(5) | EVENPORTMASK(4) |
-	EVENPORTMASK(3) | EVENPORTMASK(2) | EVENPORTMASK(1) |
-	EVENPORTMASK(0);
+    EVENPORTMASK(15) | EVENPORTMASK(14) | EVENPORTMASK(13) |
+    EVENPORTMASK(12) | EVENPORTMASK(11) | EVENPORTMASK(10) |
+    EVENPORTMASK(9) | EVENPORTMASK(8) | EVENPORTMASK(7) |
+    EVENPORTMASK(6) | EVENPORTMASK(5) | EVENPORTMASK(4) |
+    EVENPORTMASK(3) | EVENPORTMASK(2) | EVENPORTMASK(1) |
+    EVENPORTMASK(0);
 }
 
 static uint16_t portpullup(uint32_t v)
 {
 #define ODDPORTMASK(n) ((v & (1<<(((n)<<1)+1))) >> (n))
     return
-	ODDPORTMASK(15) | ODDPORTMASK(14) | ODDPORTMASK(13) |
-	ODDPORTMASK(12) | ODDPORTMASK(11) | ODDPORTMASK(10) |
-	ODDPORTMASK(9) | ODDPORTMASK(8) | ODDPORTMASK(7) | ODDPORTMASK(6) |
-	ODDPORTMASK(5) | ODDPORTMASK(4) | ODDPORTMASK(3) | ODDPORTMASK(2) |
-	ODDPORTMASK(1) | ODDPORTMASK(0);
+    ODDPORTMASK(15) | ODDPORTMASK(14) | ODDPORTMASK(13) |
+    ODDPORTMASK(12) | ODDPORTMASK(11) | ODDPORTMASK(10) |
+    ODDPORTMASK(9) | ODDPORTMASK(8) | ODDPORTMASK(7) | ODDPORTMASK(6) |
+    ODDPORTMASK(5) | ODDPORTMASK(4) | ODDPORTMASK(3) | ODDPORTMASK(2) |
+    ODDPORTMASK(1) | ODDPORTMASK(0);
 }
 
 static uint16_t porta_lines(SH7750State * s)
 {
-    return (s->portdira & s->pdtra) |	/* CPU */
-	(s->periph_portdira & s->periph_pdtra) |	/* Peripherals */
-	(~(s->portdira | s->periph_portdira) & s->portpullupa);	/* Pullups */
+    return (s->portdira & s->pdtra) |    /* CPU */
+    (s->periph_portdira & s->periph_pdtra) |    /* Peripherals */
+    (~(s->portdira | s->periph_portdira) & s->portpullupa);    /* Pullups */
 }
 
 static uint16_t portb_lines(SH7750State * s)
 {
-    return (s->portdirb & s->pdtrb) |	/* CPU */
-	(s->periph_portdirb & s->periph_pdtrb) |	/* Peripherals */
-	(~(s->portdirb | s->periph_portdirb) & s->portpullupb);	/* Pullups */
+    return (s->portdirb & s->pdtrb) |    /* CPU */
+    (s->periph_portdirb & s->periph_pdtrb) |    /* Peripherals */
+    (~(s->portdirb | s->periph_portdirb) & s->portpullupb);    /* Pullups */
 }
 
 static void gen_port_interrupts(SH7750State * s)
@@ -148,26 +148,26 @@ static void porta_changed(SH7750State * s, uint16_t prev)
 
 #if 0
     fprintf(stderr, "porta changed from 0x%04x to 0x%04x\n",
-	    prev, porta_lines(s));
+        prev, porta_lines(s));
     fprintf(stderr, "pdtra=0x%04x, pctra=0x%08x\n", s->pdtra, s->pctra);
 #endif
     currenta = porta_lines(s);
     if (currenta == prev)
-	return;
+    return;
     changes = currenta ^ prev;
 
     for (i = 0; i < NB_DEVICES; i++) {
-	if (s->devices[i] && (s->devices[i]->portamask_trigger & changes)) {
-	    r |= s->devices[i]->port_change_cb(currenta, portb_lines(s),
-					       &s->periph_pdtra,
-					       &s->periph_portdira,
-					       &s->periph_pdtrb,
-					       &s->periph_portdirb);
-	}
+    if (s->devices[i] && (s->devices[i]->portamask_trigger & changes)) {
+        r |= s->devices[i]->port_change_cb(currenta, portb_lines(s),
+                           &s->periph_pdtra,
+                           &s->periph_portdira,
+                           &s->periph_pdtrb,
+                           &s->periph_portdirb);
+    }
     }
 
     if (r)
-	gen_port_interrupts(s);
+    gen_port_interrupts(s);
 }
 
 static void portb_changed(SH7750State * s, uint16_t prev)
@@ -177,21 +177,21 @@ static void portb_changed(SH7750State * s, uint16_t prev)
 
     currentb = portb_lines(s);
     if (currentb == prev)
-	return;
+    return;
     changes = currentb ^ prev;
 
     for (i = 0; i < NB_DEVICES; i++) {
-	if (s->devices[i] && (s->devices[i]->portbmask_trigger & changes)) {
-	    r |= s->devices[i]->port_change_cb(portb_lines(s), currentb,
-					       &s->periph_pdtra,
-					       &s->periph_portdira,
-					       &s->periph_pdtrb,
-					       &s->periph_portdirb);
-	}
+    if (s->devices[i] && (s->devices[i]->portbmask_trigger & changes)) {
+        r |= s->devices[i]->port_change_cb(portb_lines(s), currentb,
+                           &s->periph_pdtra,
+                           &s->periph_portdira,
+                           &s->periph_pdtrb,
+                           &s->periph_portdirb);
+    }
     }
 
     if (r)
-	gen_port_interrupts(s);
+    gen_port_interrupts(s);
 }
 
 /**********************************************************************
@@ -201,20 +201,20 @@ static void portb_changed(SH7750State * s, uint16_t prev)
 static void error_access(const char *kind, hwaddr addr)
 {
     fprintf(stderr, "%s to %s (0x" TARGET_FMT_plx ") not supported\n",
-	    kind, regname(addr), addr);
+        kind, regname(addr), addr);
 }
 
 static void ignore_access(const char *kind, hwaddr addr)
 {
     fprintf(stderr, "%s to %s (0x" TARGET_FMT_plx ") ignored\n",
-	    kind, regname(addr), addr);
+        kind, regname(addr), addr);
 }
 
 static uint32_t sh7750_mem_readb(void *opaque, hwaddr addr)
 {
     switch (addr) {
     default:
-	error_access("byte read", addr);
+    error_access("byte read", addr);
         abort();
     }
 }
@@ -225,30 +225,30 @@ static uint32_t sh7750_mem_readw(void *opaque, hwaddr addr)
 
     switch (addr) {
     case SH7750_BCR2_A7:
-	return s->bcr2;
+    return s->bcr2;
     case SH7750_BCR3_A7:
-	if(!has_bcr3_and_bcr4(s))
-	    error_access("word read", addr);
-	return s->bcr3;
+    if(!has_bcr3_and_bcr4(s))
+        error_access("word read", addr);
+    return s->bcr3;
     case SH7750_FRQCR_A7:
-	return 0;
+    return 0;
     case SH7750_PCR_A7:
-	return s->pcr;
+    return s->pcr;
     case SH7750_RFCR_A7:
-	fprintf(stderr,
-		"Read access to refresh count register, incrementing\n");
-	return s->rfcr++;
+    fprintf(stderr,
+        "Read access to refresh count register, incrementing\n");
+    return s->rfcr++;
     case SH7750_PDTRA_A7:
-	return porta_lines(s);
+    return porta_lines(s);
     case SH7750_PDTRB_A7:
-	return portb_lines(s);
+    return portb_lines(s);
     case SH7750_RTCOR_A7:
     case SH7750_RTCNT_A7:
     case SH7750_RTCSR_A7:
-	ignore_access("word read", addr);
-	return 0;
+    ignore_access("word read", addr);
+    return 0;
     default:
-	error_access("word read", addr);
+    error_access("word read", addr);
         abort();
     }
 }
@@ -260,11 +260,11 @@ static uint32_t sh7750_mem_readl(void *opaque, hwaddr addr)
 
     switch (addr) {
     case SH7750_BCR1_A7:
-	return s->bcr1;
+    return s->bcr1;
     case SH7750_BCR4_A7:
-	if(!has_bcr3_and_bcr4(s))
-	    error_access("long read", addr);
-	return s->bcr4;
+    if(!has_bcr3_and_bcr4(s))
+        error_access("long read", addr);
+    return s->bcr4;
     case SH7750_WCR1_A7:
     case SH7750_WCR2_A7:
     case SH7750_WCR3_A7:
@@ -288,31 +288,31 @@ static uint32_t sh7750_mem_readl(void *opaque, hwaddr addr)
     case SH7750_INTEVT_A7:
         return s->cpu->env.intevt;
     case SH7750_CCR_A7:
-	return s->ccr;
-    case 0x1f000030:		/* Processor version */
+    return s->ccr;
+    case 0x1f000030:        /* Processor version */
         scc = SUPERH_CPU_GET_CLASS(s->cpu);
         return scc->pvr;
-    case 0x1f000040:		/* Cache version */
+    case 0x1f000040:        /* Cache version */
         scc = SUPERH_CPU_GET_CLASS(s->cpu);
         return scc->cvr;
-    case 0x1f000044:		/* Processor revision */
+    case 0x1f000044:        /* Processor revision */
         scc = SUPERH_CPU_GET_CLASS(s->cpu);
         return scc->prr;
     default:
-	error_access("long read", addr);
+    error_access("long read", addr);
         abort();
     }
 }
 
 #define is_in_sdrmx(a, x) (a >= SH7750_SDMR ## x ## _A7 \
-			&& a <= (SH7750_SDMR ## x ## _A7 + SH7750_SDMR ## x ## _REGNB))
+            && a <= (SH7750_SDMR ## x ## _A7 + SH7750_SDMR ## x ## _REGNB))
 static void sh7750_mem_writeb(void *opaque, hwaddr addr,
-			      uint32_t mem_value)
+                  uint32_t mem_value)
 {
 
     if (is_in_sdrmx(addr, 2) || is_in_sdrmx(addr, 3)) {
-	ignore_access("byte write", addr);
-	return;
+    ignore_access("byte write", addr);
+    return;
     }
 
     error_access("byte write", addr);
@@ -320,94 +320,94 @@ static void sh7750_mem_writeb(void *opaque, hwaddr addr,
 }
 
 static void sh7750_mem_writew(void *opaque, hwaddr addr,
-			      uint32_t mem_value)
+                  uint32_t mem_value)
 {
     SH7750State *s = opaque;
     uint16_t temp;
 
     switch (addr) {
-	/* SDRAM controller */
+    /* SDRAM controller */
     case SH7750_BCR2_A7:
         s->bcr2 = mem_value;
         return;
     case SH7750_BCR3_A7:
-	if(!has_bcr3_and_bcr4(s))
-	    error_access("word write", addr);
-	s->bcr3 = mem_value;
-	return;
+    if(!has_bcr3_and_bcr4(s))
+        error_access("word write", addr);
+    s->bcr3 = mem_value;
+    return;
     case SH7750_PCR_A7:
-	s->pcr = mem_value;
-	return;
+    s->pcr = mem_value;
+    return;
     case SH7750_RTCNT_A7:
     case SH7750_RTCOR_A7:
     case SH7750_RTCSR_A7:
-	ignore_access("word write", addr);
-	return;
-	/* IO ports */
+    ignore_access("word write", addr);
+    return;
+    /* IO ports */
     case SH7750_PDTRA_A7:
-	temp = porta_lines(s);
-	s->pdtra = mem_value;
-	porta_changed(s, temp);
-	return;
+    temp = porta_lines(s);
+    s->pdtra = mem_value;
+    porta_changed(s, temp);
+    return;
     case SH7750_PDTRB_A7:
-	temp = portb_lines(s);
-	s->pdtrb = mem_value;
-	portb_changed(s, temp);
-	return;
+    temp = portb_lines(s);
+    s->pdtrb = mem_value;
+    portb_changed(s, temp);
+    return;
     case SH7750_RFCR_A7:
-	fprintf(stderr, "Write access to refresh count register\n");
-	s->rfcr = mem_value;
-	return;
+    fprintf(stderr, "Write access to refresh count register\n");
+    s->rfcr = mem_value;
+    return;
     case SH7750_GPIOIC_A7:
-	s->gpioic = mem_value;
-	if (mem_value != 0) {
-	    fprintf(stderr, "I/O interrupts not implemented\n");
+    s->gpioic = mem_value;
+    if (mem_value != 0) {
+        fprintf(stderr, "I/O interrupts not implemented\n");
             abort();
-	}
-	return;
+    }
+    return;
     default:
-	error_access("word write", addr);
+    error_access("word write", addr);
         abort();
     }
 }
 
 static void sh7750_mem_writel(void *opaque, hwaddr addr,
-			      uint32_t mem_value)
+                  uint32_t mem_value)
 {
     SH7750State *s = opaque;
     uint16_t temp;
 
     switch (addr) {
-	/* SDRAM controller */
+    /* SDRAM controller */
     case SH7750_BCR1_A7:
         s->bcr1 = mem_value;
         return;
     case SH7750_BCR4_A7:
-	if(!has_bcr3_and_bcr4(s))
-	    error_access("long write", addr);
-	s->bcr4 = mem_value;
-	return;
+    if(!has_bcr3_and_bcr4(s))
+        error_access("long write", addr);
+    s->bcr4 = mem_value;
+    return;
     case SH7750_WCR1_A7:
     case SH7750_WCR2_A7:
     case SH7750_WCR3_A7:
     case SH7750_MCR_A7:
-	ignore_access("long write", addr);
-	return;
-	/* IO ports */
+    ignore_access("long write", addr);
+    return;
+    /* IO ports */
     case SH7750_PCTRA_A7:
-	temp = porta_lines(s);
-	s->pctra = mem_value;
-	s->portdira = portdir(mem_value);
-	s->portpullupa = portpullup(mem_value);
-	porta_changed(s, temp);
-	return;
+    temp = porta_lines(s);
+    s->pctra = mem_value;
+    s->portdira = portdir(mem_value);
+    s->portpullupa = portpullup(mem_value);
+    porta_changed(s, temp);
+    return;
     case SH7750_PCTRB_A7:
-	temp = portb_lines(s);
-	s->pctrb = mem_value;
-	s->portdirb = portdir(mem_value);
-	s->portpullupb = portpullup(mem_value);
-	portb_changed(s, temp);
-	return;
+    temp = portb_lines(s);
+    s->pctrb = mem_value;
+    s->portdirb = portdir(mem_value);
+    s->portpullupb = portpullup(mem_value);
+    portb_changed(s, temp);
+    return;
     case SH7750_MMUCR_A7:
         if (mem_value & MMUCR_TI) {
             cpu_sh4_invalidate_tlb(&s->cpu->env);
@@ -443,10 +443,10 @@ static void sh7750_mem_writel(void *opaque, hwaddr addr,
         s->cpu->env.intevt = mem_value & 0x000007ff;
         return;
     case SH7750_CCR_A7:
-	s->ccr = mem_value;
-	return;
+    s->ccr = mem_value;
+    return;
     default:
-	error_access("long write", addr);
+    error_access("long write", addr);
         abort();
     }
 }
@@ -496,151 +496,151 @@ static const MemoryRegionOps sh7750_mem_ops = {
  */
 
 enum {
-	UNUSED = 0,
-
-	/* interrupt sources */
-	IRL_0, IRL_1, IRL_2, IRL_3, IRL_4, IRL_5, IRL_6, IRL_7,
-	IRL_8, IRL_9, IRL_A, IRL_B, IRL_C, IRL_D, IRL_E,
-	IRL0, IRL1, IRL2, IRL3,
-	HUDI, GPIOI,
-	DMAC_DMTE0, DMAC_DMTE1, DMAC_DMTE2, DMAC_DMTE3,
-	DMAC_DMTE4, DMAC_DMTE5, DMAC_DMTE6, DMAC_DMTE7,
-	DMAC_DMAE,
-	PCIC0_PCISERR, PCIC1_PCIERR, PCIC1_PCIPWDWN, PCIC1_PCIPWON,
-	PCIC1_PCIDMA0, PCIC1_PCIDMA1, PCIC1_PCIDMA2, PCIC1_PCIDMA3,
-	TMU3, TMU4, TMU0, TMU1, TMU2_TUNI, TMU2_TICPI,
-	RTC_ATI, RTC_PRI, RTC_CUI,
-	SCI1_ERI, SCI1_RXI, SCI1_TXI, SCI1_TEI,
-	SCIF_ERI, SCIF_RXI, SCIF_BRI, SCIF_TXI,
-	WDT,
-	REF_RCMI, REF_ROVI,
-
-	/* interrupt groups */
-	DMAC, PCIC1, TMU2, RTC, SCI1, SCIF, REF,
-	/* irl bundle */
-	IRL,
-
-	NR_SOURCES,
+    UNUSED = 0,
+
+    /* interrupt sources */
+    IRL_0, IRL_1, IRL_2, IRL_3, IRL_4, IRL_5, IRL_6, IRL_7,
+    IRL_8, IRL_9, IRL_A, IRL_B, IRL_C, IRL_D, IRL_E,
+    IRL0, IRL1, IRL2, IRL3,
+    HUDI, GPIOI,
+    DMAC_DMTE0, DMAC_DMTE1, DMAC_DMTE2, DMAC_DMTE3,
+    DMAC_DMTE4, DMAC_DMTE5, DMAC_DMTE6, DMAC_DMTE7,
+    DMAC_DMAE,
+    PCIC0_PCISERR, PCIC1_PCIERR, PCIC1_PCIPWDWN, PCIC1_PCIPWON,
+    PCIC1_PCIDMA0, PCIC1_PCIDMA1, PCIC1_PCIDMA2, PCIC1_PCIDMA3,
+    TMU3, TMU4, TMU0, TMU1, TMU2_TUNI, TMU2_TICPI,
+    RTC_ATI, RTC_PRI, RTC_CUI,
+    SCI1_ERI, SCI1_RXI, SCI1_TXI, SCI1_TEI,
+    SCIF_ERI, SCIF_RXI, SCIF_BRI, SCIF_TXI,
+    WDT,
+    REF_RCMI, REF_ROVI,
+
+    /* interrupt groups */
+    DMAC, PCIC1, TMU2, RTC, SCI1, SCIF, REF,
+    /* irl bundle */
+    IRL,
+
+    NR_SOURCES,
 };
 
 static struct intc_vect vectors[] = {
-	INTC_VECT(HUDI, 0x600), INTC_VECT(GPIOI, 0x620),
-	INTC_VECT(TMU0, 0x400), INTC_VECT(TMU1, 0x420),
-	INTC_VECT(TMU2_TUNI, 0x440), INTC_VECT(TMU2_TICPI, 0x460),
-	INTC_VECT(RTC_ATI, 0x480), INTC_VECT(RTC_PRI, 0x4a0),
-	INTC_VECT(RTC_CUI, 0x4c0),
-	INTC_VECT(SCI1_ERI, 0x4e0), INTC_VECT(SCI1_RXI, 0x500),
-	INTC_VECT(SCI1_TXI, 0x520), INTC_VECT(SCI1_TEI, 0x540),
-	INTC_VECT(SCIF_ERI, 0x700), INTC_VECT(SCIF_RXI, 0x720),
-	INTC_VECT(SCIF_BRI, 0x740), INTC_VECT(SCIF_TXI, 0x760),
-	INTC_VECT(WDT, 0x560),
-	INTC_VECT(REF_RCMI, 0x580), INTC_VECT(REF_ROVI, 0x5a0),
+    INTC_VECT(HUDI, 0x600), INTC_VECT(GPIOI, 0x620),
+    INTC_VECT(TMU0, 0x400), INTC_VECT(TMU1, 0x420),
+    INTC_VECT(TMU2_TUNI, 0x440), INTC_VECT(TMU2_TICPI, 0x460),
+    INTC_VECT(RTC_ATI, 0x480), INTC_VECT(RTC_PRI, 0x4a0),
+    INTC_VECT(RTC_CUI, 0x4c0),
+    INTC_VECT(SCI1_ERI, 0x4e0), INTC_VECT(SCI1_RXI, 0x500),
+    INTC_VECT(SCI1_TXI, 0x520), INTC_VECT(SCI1_TEI, 0x540),
+    INTC_VECT(SCIF_ERI, 0x700), INTC_VECT(SCIF_RXI, 0x720),
+    INTC_VECT(SCIF_BRI, 0x740), INTC_VECT(SCIF_TXI, 0x760),
+    INTC_VECT(WDT, 0x560),
+    INTC_VECT(REF_RCMI, 0x580), INTC_VECT(REF_ROVI, 0x5a0),
 };
 
 static struct intc_group groups[] = {
-	INTC_GROUP(TMU2, TMU2_TUNI, TMU2_TICPI),
-	INTC_GROUP(RTC, RTC_ATI, RTC_PRI, RTC_CUI),
-	INTC_GROUP(SCI1, SCI1_ERI, SCI1_RXI, SCI1_TXI, SCI1_TEI),
-	INTC_GROUP(SCIF, SCIF_ERI, SCIF_RXI, SCIF_BRI, SCIF_TXI),
-	INTC_GROUP(REF, REF_RCMI, REF_ROVI),
+    INTC_GROUP(TMU2, TMU2_TUNI, TMU2_TICPI),
+    INTC_GROUP(RTC, RTC_ATI, RTC_PRI, RTC_CUI),
+    INTC_GROUP(SCI1, SCI1_ERI, SCI1_RXI, SCI1_TXI, SCI1_TEI),
+    INTC_GROUP(SCIF, SCIF_ERI, SCIF_RXI, SCIF_BRI, SCIF_TXI),
+    INTC_GROUP(REF, REF_RCMI, REF_ROVI),
 };
 
 static struct intc_prio_reg prio_registers[] = {
-	{ 0xffd00004, 0, 16, 4, /* IPRA */ { TMU0, TMU1, TMU2, RTC } },
-	{ 0xffd00008, 0, 16, 4, /* IPRB */ { WDT, REF, SCI1, 0 } },
-	{ 0xffd0000c, 0, 16, 4, /* IPRC */ { GPIOI, DMAC, SCIF, HUDI } },
-	{ 0xffd00010, 0, 16, 4, /* IPRD */ { IRL0, IRL1, IRL2, IRL3 } },
-	{ 0xfe080000, 0, 32, 4, /* INTPRI00 */ { 0, 0, 0, 0,
-						 TMU4, TMU3,
-						 PCIC1, PCIC0_PCISERR } },
+    { 0xffd00004, 0, 16, 4, /* IPRA */ { TMU0, TMU1, TMU2, RTC } },
+    { 0xffd00008, 0, 16, 4, /* IPRB */ { WDT, REF, SCI1, 0 } },
+    { 0xffd0000c, 0, 16, 4, /* IPRC */ { GPIOI, DMAC, SCIF, HUDI } },
+    { 0xffd00010, 0, 16, 4, /* IPRD */ { IRL0, IRL1, IRL2, IRL3 } },
+    { 0xfe080000, 0, 32, 4, /* INTPRI00 */ { 0, 0, 0, 0,
+                         TMU4, TMU3,
+                         PCIC1, PCIC0_PCISERR } },
 };
 
 /* SH7750, SH7750S, SH7751 and SH7091 all have 4-channel DMA controllers */
 
 static struct intc_vect vectors_dma4[] = {
-	INTC_VECT(DMAC_DMTE0, 0x640), INTC_VECT(DMAC_DMTE1, 0x660),
-	INTC_VECT(DMAC_DMTE2, 0x680), INTC_VECT(DMAC_DMTE3, 0x6a0),
-	INTC_VECT(DMAC_DMAE, 0x6c0),
+    INTC_VECT(DMAC_DMTE0, 0x640), INTC_VECT(DMAC_DMTE1, 0x660),
+    INTC_VECT(DMAC_DMTE2, 0x680), INTC_VECT(DMAC_DMTE3, 0x6a0),
+    INTC_VECT(DMAC_DMAE, 0x6c0),
 };
 
 static struct intc_group groups_dma4[] = {
-	INTC_GROUP(DMAC, DMAC_DMTE0, DMAC_DMTE1, DMAC_DMTE2,
-		   DMAC_DMTE3, DMAC_DMAE),
+    INTC_GROUP(DMAC, DMAC_DMTE0, DMAC_DMTE1, DMAC_DMTE2,
+           DMAC_DMTE3, DMAC_DMAE),
 };
 
 /* SH7750R and SH7751R both have 8-channel DMA controllers */
 
 static struct intc_vect vectors_dma8[] = {
-	INTC_VECT(DMAC_DMTE0, 0x640), INTC_VECT(DMAC_DMTE1, 0x660),
-	INTC_VECT(DMAC_DMTE2, 0x680), INTC_VECT(DMAC_DMTE3, 0x6a0),
-	INTC_VECT(DMAC_DMTE4, 0x780), INTC_VECT(DMAC_DMTE5, 0x7a0),
-	INTC_VECT(DMAC_DMTE6, 0x7c0), INTC_VECT(DMAC_DMTE7, 0x7e0),
-	INTC_VECT(DMAC_DMAE, 0x6c0),
+    INTC_VECT(DMAC_DMTE0, 0x640), INTC_VECT(DMAC_DMTE1, 0x660),
+    INTC_VECT(DMAC_DMTE2, 0x680), INTC_VECT(DMAC_DMTE3, 0x6a0),
+    INTC_VECT(DMAC_DMTE4, 0x780), INTC_VECT(DMAC_DMTE5, 0x7a0),
+    INTC_VECT(DMAC_DMTE6, 0x7c0), INTC_VECT(DMAC_DMTE7, 0x7e0),
+    INTC_VECT(DMAC_DMAE, 0x6c0),
 };
 
 static struct intc_group groups_dma8[] = {
-	INTC_GROUP(DMAC, DMAC_DMTE0, DMAC_DMTE1, DMAC_DMTE2,
-		   DMAC_DMTE3, DMAC_DMTE4, DMAC_DMTE5,
-		   DMAC_DMTE6, DMAC_DMTE7, DMAC_DMAE),
+    INTC_GROUP(DMAC, DMAC_DMTE0, DMAC_DMTE1, DMAC_DMTE2,
+           DMAC_DMTE3, DMAC_DMTE4, DMAC_DMTE5,
+           DMAC_DMTE6, DMAC_DMTE7, DMAC_DMAE),
 };
 
 /* SH7750R, SH7751 and SH7751R all have two extra timer channels */
 
 static struct intc_vect vectors_tmu34[] = {
-	INTC_VECT(TMU3, 0xb00), INTC_VECT(TMU4, 0xb80),
+    INTC_VECT(TMU3, 0xb00), INTC_VECT(TMU4, 0xb80),
 };
 
 static struct intc_mask_reg mask_registers[] = {
-	{ 0xfe080040, 0xfe080060, 32, /* INTMSK00 / INTMSKCLR00 */
-	  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	    0, 0, 0, 0, 0, 0, TMU4, TMU3,
-	    PCIC1_PCIERR, PCIC1_PCIPWDWN, PCIC1_PCIPWON,
-	    PCIC1_PCIDMA0, PCIC1_PCIDMA1, PCIC1_PCIDMA2,
-	    PCIC1_PCIDMA3, PCIC0_PCISERR } },
+    { 0xfe080040, 0xfe080060, 32, /* INTMSK00 / INTMSKCLR00 */
+      { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+        0, 0, 0, 0, 0, 0, TMU4, TMU3,
+        PCIC1_PCIERR, PCIC1_PCIPWDWN, PCIC1_PCIPWON,
+        PCIC1_PCIDMA0, PCIC1_PCIDMA1, PCIC1_PCIDMA2,
+        PCIC1_PCIDMA3, PCIC0_PCISERR } },
 };
 
 /* SH7750S, SH7750R, SH7751 and SH7751R all have IRLM priority registers */
 
 static struct intc_vect vectors_irlm[] = {
-	INTC_VECT(IRL0, 0x240), INTC_VECT(IRL1, 0x2a0),
-	INTC_VECT(IRL2, 0x300), INTC_VECT(IRL3, 0x360),
+    INTC_VECT(IRL0, 0x240), INTC_VECT(IRL1, 0x2a0),
+    INTC_VECT(IRL2, 0x300), INTC_VECT(IRL3, 0x360),
 };
 
 /* SH7751 and SH7751R both have PCI */
 
 static struct intc_vect vectors_pci[] = {
-	INTC_VECT(PCIC0_PCISERR, 0xa00), INTC_VECT(PCIC1_PCIERR, 0xae0),
-	INTC_VECT(PCIC1_PCIPWDWN, 0xac0), INTC_VECT(PCIC1_PCIPWON, 0xaa0),
-	INTC_VECT(PCIC1_PCIDMA0, 0xa80), INTC_VECT(PCIC1_PCIDMA1, 0xa60),
-	INTC_VECT(PCIC1_PCIDMA2, 0xa40), INTC_VECT(PCIC1_PCIDMA3, 0xa20),
+    INTC_VECT(PCIC0_PCISERR, 0xa00), INTC_VECT(PCIC1_PCIERR, 0xae0),
+    INTC_VECT(PCIC1_PCIPWDWN, 0xac0), INTC_VECT(PCIC1_PCIPWON, 0xaa0),
+    INTC_VECT(PCIC1_PCIDMA0, 0xa80), INTC_VECT(PCIC1_PCIDMA1, 0xa60),
+    INTC_VECT(PCIC1_PCIDMA2, 0xa40), INTC_VECT(PCIC1_PCIDMA3, 0xa20),
 };
 
 static struct intc_group groups_pci[] = {
-	INTC_GROUP(PCIC1, PCIC1_PCIERR, PCIC1_PCIPWDWN, PCIC1_PCIPWON,
-		   PCIC1_PCIDMA0, PCIC1_PCIDMA1, PCIC1_PCIDMA2, PCIC1_PCIDMA3),
+    INTC_GROUP(PCIC1, PCIC1_PCIERR, PCIC1_PCIPWDWN, PCIC1_PCIPWON,
+           PCIC1_PCIDMA0, PCIC1_PCIDMA1, PCIC1_PCIDMA2, PCIC1_PCIDMA3),
 };
 
 static struct intc_vect vectors_irl[] = {
-	INTC_VECT(IRL_0, 0x200),
-	INTC_VECT(IRL_1, 0x220),
-	INTC_VECT(IRL_2, 0x240),
-	INTC_VECT(IRL_3, 0x260),
-	INTC_VECT(IRL_4, 0x280),
-	INTC_VECT(IRL_5, 0x2a0),
-	INTC_VECT(IRL_6, 0x2c0),
-	INTC_VECT(IRL_7, 0x2e0),
-	INTC_VECT(IRL_8, 0x300),
-	INTC_VECT(IRL_9, 0x320),
-	INTC_VECT(IRL_A, 0x340),
-	INTC_VECT(IRL_B, 0x360),
-	INTC_VECT(IRL_C, 0x380),
-	INTC_VECT(IRL_D, 0x3a0),
-	INTC_VECT(IRL_E, 0x3c0),
+    INTC_VECT(IRL_0, 0x200),
+    INTC_VECT(IRL_1, 0x220),
+    INTC_VECT(IRL_2, 0x240),
+    INTC_VECT(IRL_3, 0x260),
+    INTC_VECT(IRL_4, 0x280),
+    INTC_VECT(IRL_5, 0x2a0),
+    INTC_VECT(IRL_6, 0x2c0),
+    INTC_VECT(IRL_7, 0x2e0),
+    INTC_VECT(IRL_8, 0x300),
+    INTC_VECT(IRL_9, 0x320),
+    INTC_VECT(IRL_A, 0x340),
+    INTC_VECT(IRL_B, 0x360),
+    INTC_VECT(IRL_C, 0x380),
+    INTC_VECT(IRL_D, 0x3a0),
+    INTC_VECT(IRL_E, 0x3c0),
 };
 
 static struct intc_group groups_irl[] = {
-	INTC_GROUP(IRL, IRL_0, IRL_1, IRL_2, IRL_3, IRL_4, IRL_5, IRL_6,
-		IRL_7, IRL_8, IRL_9, IRL_A, IRL_B, IRL_C, IRL_D, IRL_E),
+    INTC_GROUP(IRL, IRL_0, IRL_1, IRL_2, IRL_3, IRL_4, IRL_5, IRL_6,
+        IRL_7, IRL_8, IRL_9, IRL_A, IRL_B, IRL_C, IRL_D, IRL_E),
 };
 
 /**********************************************************************
@@ -679,7 +679,7 @@ static uint64_t sh7750_mmct_read(void *opaque, hwaddr addr,
     case MM_ICACHE_ADDR:
     case MM_ICACHE_DATA:
         /* do nothing */
-	break;
+    break;
     case MM_ITLB_ADDR:
         ret = cpu_sh4_read_mmaped_itlb_addr(&s->cpu->env, addr);
         break;
@@ -689,7 +689,7 @@ static uint64_t sh7750_mmct_read(void *opaque, hwaddr addr,
     case MM_OCACHE_ADDR:
     case MM_OCACHE_DATA:
         /* do nothing */
-	break;
+    break;
     case MM_UTLB_ADDR:
         ret = cpu_sh4_read_mmaped_utlb_addr(&s->cpu->env, addr);
         break;
@@ -722,27 +722,27 @@ static void sh7750_mmct_write(void *opaque, hwaddr addr,
     case MM_ICACHE_ADDR:
     case MM_ICACHE_DATA:
         /* do nothing */
-	break;
+    break;
     case MM_ITLB_ADDR:
         cpu_sh4_write_mmaped_itlb_addr(&s->cpu->env, addr, mem_value);
         break;
     case MM_ITLB_DATA:
         cpu_sh4_write_mmaped_itlb_data(&s->cpu->env, addr, mem_value);
         abort();
-	break;
+    break;
     case MM_OCACHE_ADDR:
     case MM_OCACHE_DATA:
         /* do nothing */
-	break;
+    break;
     case MM_UTLB_ADDR:
         cpu_sh4_write_mmaped_utlb_addr(&s->cpu->env, addr, mem_value);
-	break;
+    break;
     case MM_UTLB_DATA:
         cpu_sh4_write_mmaped_utlb_data(&s->cpu->env, addr, mem_value);
-	break;
+    break;
     default:
         abort();
-	break;
+    break;
     }
 }
 
@@ -758,7 +758,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
     s = g_malloc0(sizeof(SH7750State));
     s->cpu = cpu;
-    s->periph_freq = 60000000;	/* 60MHz */
+    s->periph_freq = 60000000;    /* 60MHz */
     memory_region_init_io(&s->iomem, NULL, &sh7750_mem_ops, s,
                           "memory", 0x1fc01000);
 
@@ -791,12 +791,12 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
     memory_region_add_subregion(sysmem, 0xf0000000, &s->mmct_iomem);
 
     sh_intc_init(sysmem, &s->intc, NR_SOURCES,
-		 _INTC_ARRAY(mask_registers),
-		 _INTC_ARRAY(prio_registers));
+         _INTC_ARRAY(mask_registers),
+         _INTC_ARRAY(prio_registers));
 
     sh_intc_register_sources(&s->intc,
-			     _INTC_ARRAY(vectors),
-			     _INTC_ARRAY(groups));
+                 _INTC_ARRAY(vectors),
+                 _INTC_ARRAY(groups));
 
     cpu->env.intc_handle = &s->intc;
 
@@ -817,50 +817,50 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
                    s->intc.irqs[SCIF_BRI]);
 
     tmu012_init(sysmem, 0x1fd80000,
-		TMU012_FEAT_TOCR | TMU012_FEAT_3CHAN | TMU012_FEAT_EXTCLK,
-		s->periph_freq,
-		s->intc.irqs[TMU0],
-		s->intc.irqs[TMU1],
-		s->intc.irqs[TMU2_TUNI],
-		s->intc.irqs[TMU2_TICPI]);
+        TMU012_FEAT_TOCR | TMU012_FEAT_3CHAN | TMU012_FEAT_EXTCLK,
+        s->periph_freq,
+        s->intc.irqs[TMU0],
+        s->intc.irqs[TMU1],
+        s->intc.irqs[TMU2_TUNI],
+        s->intc.irqs[TMU2_TICPI]);
 
     if (cpu->env.id & (SH_CPU_SH7750 | SH_CPU_SH7750S | SH_CPU_SH7751)) {
         sh_intc_register_sources(&s->intc,
-				 _INTC_ARRAY(vectors_dma4),
-				 _INTC_ARRAY(groups_dma4));
+                 _INTC_ARRAY(vectors_dma4),
+                 _INTC_ARRAY(groups_dma4));
     }
 
     if (cpu->env.id & (SH_CPU_SH7750R | SH_CPU_SH7751R)) {
         sh_intc_register_sources(&s->intc,
-				 _INTC_ARRAY(vectors_dma8),
-				 _INTC_ARRAY(groups_dma8));
+                 _INTC_ARRAY(vectors_dma8),
+                 _INTC_ARRAY(groups_dma8));
     }
 
     if (cpu->env.id & (SH_CPU_SH7750R | SH_CPU_SH7751 | SH_CPU_SH7751R)) {
         sh_intc_register_sources(&s->intc,
-				 _INTC_ARRAY(vectors_tmu34),
-				 NULL, 0);
+                 _INTC_ARRAY(vectors_tmu34),
+                 NULL, 0);
         tmu012_init(sysmem, 0x1e100000, 0, s->periph_freq,
-		    s->intc.irqs[TMU3],
-		    s->intc.irqs[TMU4],
-		    NULL, NULL);
+            s->intc.irqs[TMU3],
+            s->intc.irqs[TMU4],
+            NULL, NULL);
     }
 
     if (cpu->env.id & (SH_CPU_SH7751_ALL)) {
         sh_intc_register_sources(&s->intc,
-				 _INTC_ARRAY(vectors_pci),
-				 _INTC_ARRAY(groups_pci));
+                 _INTC_ARRAY(vectors_pci),
+                 _INTC_ARRAY(groups_pci));
     }
 
     if (cpu->env.id & (SH_CPU_SH7750S | SH_CPU_SH7750R | SH_CPU_SH7751_ALL)) {
         sh_intc_register_sources(&s->intc,
-				 _INTC_ARRAY(vectors_irlm),
-				 NULL, 0);
+                 _INTC_ARRAY(vectors_irlm),
+                 NULL, 0);
     }
 
     sh_intc_register_sources(&s->intc,
-				_INTC_ARRAY(vectors_irl),
-				_INTC_ARRAY(groups_irl));
+                _INTC_ARRAY(vectors_irl),
+                _INTC_ARRAY(groups_irl));
     return s;
 }
 
diff --git a/hw/sh4/sh7750_regnames.c b/hw/sh4/sh7750_regnames.c
index 0630fe3cf4..1aa9d016e7 100644
--- a/hw/sh4/sh7750_regnames.c
+++ b/hw/sh4/sh7750_regnames.c
@@ -12,76 +12,76 @@ typedef struct {
 
 static regname_t regnames[] = {
     REGNAME(SH7750_PTEH_A7)
-	REGNAME(SH7750_PTEL_A7)
-	REGNAME(SH7750_PTEA_A7)
-	REGNAME(SH7750_TTB_A7)
-	REGNAME(SH7750_TEA_A7)
-	REGNAME(SH7750_MMUCR_A7)
-	REGNAME(SH7750_CCR_A7)
-	REGNAME(SH7750_QACR0_A7)
-	REGNAME(SH7750_QACR1_A7)
-	REGNAME(SH7750_TRA_A7)
-	REGNAME(SH7750_EXPEVT_A7)
-	REGNAME(SH7750_INTEVT_A7)
-	REGNAME(SH7750_STBCR_A7)
-	REGNAME(SH7750_STBCR2_A7)
-	REGNAME(SH7750_FRQCR_A7)
-	REGNAME(SH7750_WTCNT_A7)
-	REGNAME(SH7750_WTCSR_A7)
-	REGNAME(SH7750_R64CNT_A7)
-	REGNAME(SH7750_RSECCNT_A7)
-	REGNAME(SH7750_RMINCNT_A7)
-	REGNAME(SH7750_RHRCNT_A7)
-	REGNAME(SH7750_RWKCNT_A7)
-	REGNAME(SH7750_RDAYCNT_A7)
-	REGNAME(SH7750_RMONCNT_A7)
-	REGNAME(SH7750_RYRCNT_A7)
-	REGNAME(SH7750_RSECAR_A7)
-	REGNAME(SH7750_RMINAR_A7)
-	REGNAME(SH7750_RHRAR_A7)
-	REGNAME(SH7750_RWKAR_A7)
-	REGNAME(SH7750_RDAYAR_A7)
-	REGNAME(SH7750_RMONAR_A7)
-	REGNAME(SH7750_RCR1_A7)
-	REGNAME(SH7750_RCR2_A7)
-	REGNAME(SH7750_BCR1_A7)
-	REGNAME(SH7750_BCR2_A7)
-	REGNAME(SH7750_WCR1_A7)
-	REGNAME(SH7750_WCR2_A7)
-	REGNAME(SH7750_WCR3_A7)
-	REGNAME(SH7750_MCR_A7)
-	REGNAME(SH7750_PCR_A7)
-	REGNAME(SH7750_RTCSR_A7)
-	REGNAME(SH7750_RTCNT_A7)
-	REGNAME(SH7750_RTCOR_A7)
-	REGNAME(SH7750_RFCR_A7)
-	REGNAME(SH7750_SAR0_A7)
-	REGNAME(SH7750_SAR1_A7)
-	REGNAME(SH7750_SAR2_A7)
-	REGNAME(SH7750_SAR3_A7)
-	REGNAME(SH7750_DAR0_A7)
-	REGNAME(SH7750_DAR1_A7)
-	REGNAME(SH7750_DAR2_A7)
-	REGNAME(SH7750_DAR3_A7)
-	REGNAME(SH7750_DMATCR0_A7)
-	REGNAME(SH7750_DMATCR1_A7)
-	REGNAME(SH7750_DMATCR2_A7)
-	REGNAME(SH7750_DMATCR3_A7)
-	REGNAME(SH7750_CHCR0_A7)
-	REGNAME(SH7750_CHCR1_A7)
-	REGNAME(SH7750_CHCR2_A7)
-	REGNAME(SH7750_CHCR3_A7)
-	REGNAME(SH7750_DMAOR_A7)
-	REGNAME(SH7750_PCTRA_A7)
-	REGNAME(SH7750_PDTRA_A7)
-	REGNAME(SH7750_PCTRB_A7)
-	REGNAME(SH7750_PDTRB_A7)
-	REGNAME(SH7750_GPIOIC_A7)
-	REGNAME(SH7750_ICR_A7)
-	REGNAME(SH7750_BCR3_A7)
-	REGNAME(SH7750_BCR4_A7)
-	REGNAME(SH7750_SDMR2_A7)
-	REGNAME(SH7750_SDMR3_A7) {(uint32_t) - 1, NULL}
+    REGNAME(SH7750_PTEL_A7)
+    REGNAME(SH7750_PTEA_A7)
+    REGNAME(SH7750_TTB_A7)
+    REGNAME(SH7750_TEA_A7)
+    REGNAME(SH7750_MMUCR_A7)
+    REGNAME(SH7750_CCR_A7)
+    REGNAME(SH7750_QACR0_A7)
+    REGNAME(SH7750_QACR1_A7)
+    REGNAME(SH7750_TRA_A7)
+    REGNAME(SH7750_EXPEVT_A7)
+    REGNAME(SH7750_INTEVT_A7)
+    REGNAME(SH7750_STBCR_A7)
+    REGNAME(SH7750_STBCR2_A7)
+    REGNAME(SH7750_FRQCR_A7)
+    REGNAME(SH7750_WTCNT_A7)
+    REGNAME(SH7750_WTCSR_A7)
+    REGNAME(SH7750_R64CNT_A7)
+    REGNAME(SH7750_RSECCNT_A7)
+    REGNAME(SH7750_RMINCNT_A7)
+    REGNAME(SH7750_RHRCNT_A7)
+    REGNAME(SH7750_RWKCNT_A7)
+    REGNAME(SH7750_RDAYCNT_A7)
+    REGNAME(SH7750_RMONCNT_A7)
+    REGNAME(SH7750_RYRCNT_A7)
+    REGNAME(SH7750_RSECAR_A7)
+    REGNAME(SH7750_RMINAR_A7)
+    REGNAME(SH7750_RHRAR_A7)
+    REGNAME(SH7750_RWKAR_A7)
+    REGNAME(SH7750_RDAYAR_A7)
+    REGNAME(SH7750_RMONAR_A7)
+    REGNAME(SH7750_RCR1_A7)
+    REGNAME(SH7750_RCR2_A7)
+    REGNAME(SH7750_BCR1_A7)
+    REGNAME(SH7750_BCR2_A7)
+    REGNAME(SH7750_WCR1_A7)
+    REGNAME(SH7750_WCR2_A7)
+    REGNAME(SH7750_WCR3_A7)
+    REGNAME(SH7750_MCR_A7)
+    REGNAME(SH7750_PCR_A7)
+    REGNAME(SH7750_RTCSR_A7)
+    REGNAME(SH7750_RTCNT_A7)
+    REGNAME(SH7750_RTCOR_A7)
+    REGNAME(SH7750_RFCR_A7)
+    REGNAME(SH7750_SAR0_A7)
+    REGNAME(SH7750_SAR1_A7)
+    REGNAME(SH7750_SAR2_A7)
+    REGNAME(SH7750_SAR3_A7)
+    REGNAME(SH7750_DAR0_A7)
+    REGNAME(SH7750_DAR1_A7)
+    REGNAME(SH7750_DAR2_A7)
+    REGNAME(SH7750_DAR3_A7)
+    REGNAME(SH7750_DMATCR0_A7)
+    REGNAME(SH7750_DMATCR1_A7)
+    REGNAME(SH7750_DMATCR2_A7)
+    REGNAME(SH7750_DMATCR3_A7)
+    REGNAME(SH7750_CHCR0_A7)
+    REGNAME(SH7750_CHCR1_A7)
+    REGNAME(SH7750_CHCR2_A7)
+    REGNAME(SH7750_CHCR3_A7)
+    REGNAME(SH7750_DMAOR_A7)
+    REGNAME(SH7750_PCTRA_A7)
+    REGNAME(SH7750_PDTRA_A7)
+    REGNAME(SH7750_PCTRB_A7)
+    REGNAME(SH7750_PDTRB_A7)
+    REGNAME(SH7750_GPIOIC_A7)
+    REGNAME(SH7750_ICR_A7)
+    REGNAME(SH7750_BCR3_A7)
+    REGNAME(SH7750_BCR4_A7)
+    REGNAME(SH7750_SDMR2_A7)
+    REGNAME(SH7750_SDMR3_A7) {(uint32_t) - 1, NULL}
 };
 
 const char *regname(uint32_t addr)
@@ -89,8 +89,8 @@ const char *regname(uint32_t addr)
     unsigned int i;
 
     for (i = 0; regnames[i].regaddr != (uint32_t) - 1; i++) {
-	if (regnames[i].regaddr == addr)
-	    return regnames[i].regname;
+    if (regnames[i].regaddr == addr)
+        return regnames[i].regname;
     }
 
     return "<unknown reg>";
diff --git a/hw/sh4/sh7750_regs.h b/hw/sh4/sh7750_regs.h
index ab073dadc7..a71f96b09e 100644
--- a/hw/sh4/sh7750_regs.h
+++ b/hw/sh4/sh7750_regs.h
@@ -43,9 +43,9 @@
  * All register has 2 addresses: in 0xff000000 - 0xffffffff (P4 address)  and
  * in 0x1f000000 - 0x1fffffff (area 7 address)
  */
-#define SH7750_P4_BASE       0xff000000	/* Accessible only in
-					   privileged mode */
-#define SH7750_A7_BASE       0x1f000000	/* Accessible only using TLB */
+#define SH7750_P4_BASE       0xff000000    /* Accessible only in
+                       privileged mode */
+#define SH7750_A7_BASE       0x1f000000    /* Accessible only using TLB */
 
 #define SH7750_P4_REG32(ofs) (SH7750_P4_BASE + (ofs))
 #define SH7750_A7_REG32(ofs) (SH7750_A7_BASE + (ofs))
@@ -55,84 +55,84 @@
  */
 
 /* Page Table Entry High register - PTEH */
-#define SH7750_PTEH_REGOFS    0x000000	/* offset */
+#define SH7750_PTEH_REGOFS    0x000000    /* offset */
 #define SH7750_PTEH           SH7750_P4_REG32(SH7750_PTEH_REGOFS)
 #define SH7750_PTEH_A7        SH7750_A7_REG32(SH7750_PTEH_REGOFS)
-#define SH7750_PTEH_VPN       0xfffffd00	/* Virtual page number */
+#define SH7750_PTEH_VPN       0xfffffd00    /* Virtual page number */
 #define SH7750_PTEH_VPN_S     10
-#define SH7750_PTEH_ASID      0x000000ff	/* Address space identifier */
+#define SH7750_PTEH_ASID      0x000000ff    /* Address space identifier */
 #define SH7750_PTEH_ASID_S    0
 
 /* Page Table Entry Low register - PTEL */
-#define SH7750_PTEL_REGOFS    0x000004	/* offset */
+#define SH7750_PTEL_REGOFS    0x000004    /* offset */
 #define SH7750_PTEL           SH7750_P4_REG32(SH7750_PTEL_REGOFS)
 #define SH7750_PTEL_A7        SH7750_A7_REG32(SH7750_PTEL_REGOFS)
-#define SH7750_PTEL_PPN       0x1ffffc00	/* Physical page number */
+#define SH7750_PTEL_PPN       0x1ffffc00    /* Physical page number */
 #define SH7750_PTEL_PPN_S     10
-#define SH7750_PTEL_V         0x00000100	/* Validity (0-entry is invalid) */
-#define SH7750_PTEL_SZ1       0x00000080	/* Page size bit 1 */
-#define SH7750_PTEL_SZ0       0x00000010	/* Page size bit 0 */
-#define SH7750_PTEL_SZ_1KB    0x00000000	/*   1-kbyte page */
-#define SH7750_PTEL_SZ_4KB    0x00000010	/*   4-kbyte page */
-#define SH7750_PTEL_SZ_64KB   0x00000080	/*   64-kbyte page */
-#define SH7750_PTEL_SZ_1MB    0x00000090	/*   1-Mbyte page */
-#define SH7750_PTEL_PR        0x00000060	/* Protection Key Data */
-#define SH7750_PTEL_PR_ROPO   0x00000000	/*   read-only in priv mode */
-#define SH7750_PTEL_PR_RWPO   0x00000020	/*   read-write in priv mode */
-#define SH7750_PTEL_PR_ROPU   0x00000040	/*   read-only in priv or user mode */
-#define SH7750_PTEL_PR_RWPU   0x00000060	/*   read-write in priv or user mode */
-#define SH7750_PTEL_C         0x00000008	/* Cacheability
-						   (0 - page not cacheable) */
-#define SH7750_PTEL_D         0x00000004	/* Dirty bit (1 - write has been
-						   performed to a page) */
-#define SH7750_PTEL_SH        0x00000002	/* Share Status bit (1 - page are
-						   shared by processes) */
-#define SH7750_PTEL_WT        0x00000001	/* Write-through bit, specifies the
-						   cache write mode:
-						   0 - Copy-back mode
-						   1 - Write-through mode */
+#define SH7750_PTEL_V         0x00000100    /* Validity (0-entry is invalid) */
+#define SH7750_PTEL_SZ1       0x00000080    /* Page size bit 1 */
+#define SH7750_PTEL_SZ0       0x00000010    /* Page size bit 0 */
+#define SH7750_PTEL_SZ_1KB    0x00000000    /*   1-kbyte page */
+#define SH7750_PTEL_SZ_4KB    0x00000010    /*   4-kbyte page */
+#define SH7750_PTEL_SZ_64KB   0x00000080    /*   64-kbyte page */
+#define SH7750_PTEL_SZ_1MB    0x00000090    /*   1-Mbyte page */
+#define SH7750_PTEL_PR        0x00000060    /* Protection Key Data */
+#define SH7750_PTEL_PR_ROPO   0x00000000    /*   read-only in priv mode */
+#define SH7750_PTEL_PR_RWPO   0x00000020    /*   read-write in priv mode */
+#define SH7750_PTEL_PR_ROPU   0x00000040    /*   read-only in priv or user mode */
+#define SH7750_PTEL_PR_RWPU   0x00000060    /*   read-write in priv or user mode */
+#define SH7750_PTEL_C         0x00000008    /* Cacheability
+                           (0 - page not cacheable) */
+#define SH7750_PTEL_D         0x00000004    /* Dirty bit (1 - write has been
+                           performed to a page) */
+#define SH7750_PTEL_SH        0x00000002    /* Share Status bit (1 - page are
+                           shared by processes) */
+#define SH7750_PTEL_WT        0x00000001    /* Write-through bit, specifies the
+                           cache write mode:
+                           0 - Copy-back mode
+                           1 - Write-through mode */
 
 /* Page Table Entry Assistance register - PTEA */
-#define SH7750_PTEA_REGOFS    0x000034	/* offset */
+#define SH7750_PTEA_REGOFS    0x000034    /* offset */
 #define SH7750_PTEA           SH7750_P4_REG32(SH7750_PTEA_REGOFS)
 #define SH7750_PTEA_A7        SH7750_A7_REG32(SH7750_PTEA_REGOFS)
-#define SH7750_PTEA_TC        0x00000008	/* Timing Control bit
-						   0 - use area 5 wait states
-						   1 - use area 6 wait states */
-#define SH7750_PTEA_SA        0x00000007	/* Space Attribute bits: */
-#define SH7750_PTEA_SA_UNDEF  0x00000000	/*    0 - undefined */
-#define SH7750_PTEA_SA_IOVAR  0x00000001	/*    1 - variable-size I/O space */
-#define SH7750_PTEA_SA_IO8    0x00000002	/*    2 - 8-bit I/O space */
-#define SH7750_PTEA_SA_IO16   0x00000003	/*    3 - 16-bit I/O space */
-#define SH7750_PTEA_SA_CMEM8  0x00000004	/*    4 - 8-bit common memory space */
-#define SH7750_PTEA_SA_CMEM16 0x00000005	/*    5 - 16-bit common memory space */
-#define SH7750_PTEA_SA_AMEM8  0x00000006	/*    6 - 8-bit attr memory space */
-#define SH7750_PTEA_SA_AMEM16 0x00000007	/*    7 - 16-bit attr memory space */
+#define SH7750_PTEA_TC        0x00000008    /* Timing Control bit
+                           0 - use area 5 wait states
+                           1 - use area 6 wait states */
+#define SH7750_PTEA_SA        0x00000007    /* Space Attribute bits: */
+#define SH7750_PTEA_SA_UNDEF  0x00000000    /*    0 - undefined */
+#define SH7750_PTEA_SA_IOVAR  0x00000001    /*    1 - variable-size I/O space */
+#define SH7750_PTEA_SA_IO8    0x00000002    /*    2 - 8-bit I/O space */
+#define SH7750_PTEA_SA_IO16   0x00000003    /*    3 - 16-bit I/O space */
+#define SH7750_PTEA_SA_CMEM8  0x00000004    /*    4 - 8-bit common memory space */
+#define SH7750_PTEA_SA_CMEM16 0x00000005    /*    5 - 16-bit common memory space */
+#define SH7750_PTEA_SA_AMEM8  0x00000006    /*    6 - 8-bit attr memory space */
+#define SH7750_PTEA_SA_AMEM16 0x00000007    /*    7 - 16-bit attr memory space */
 
 
 /* Translation table base register */
-#define SH7750_TTB_REGOFS     0x000008	/* offset */
+#define SH7750_TTB_REGOFS     0x000008    /* offset */
 #define SH7750_TTB            SH7750_P4_REG32(SH7750_TTB_REGOFS)
 #define SH7750_TTB_A7         SH7750_A7_REG32(SH7750_TTB_REGOFS)
 
 /* TLB exeption address register - TEA */
-#define SH7750_TEA_REGOFS     0x00000c	/* offset */
+#define SH7750_TEA_REGOFS     0x00000c    /* offset */
 #define SH7750_TEA            SH7750_P4_REG32(SH7750_TEA_REGOFS)
 #define SH7750_TEA_A7         SH7750_A7_REG32(SH7750_TEA_REGOFS)
 
 /* MMU control register - MMUCR */
-#define SH7750_MMUCR_REGOFS   0x000010	/* offset */
+#define SH7750_MMUCR_REGOFS   0x000010    /* offset */
 #define SH7750_MMUCR          SH7750_P4_REG32(SH7750_MMUCR_REGOFS)
 #define SH7750_MMUCR_A7       SH7750_A7_REG32(SH7750_MMUCR_REGOFS)
-#define SH7750_MMUCR_AT       0x00000001	/* Address translation bit */
-#define SH7750_MMUCR_TI       0x00000004	/* TLB invalidate */
-#define SH7750_MMUCR_SV       0x00000100	/* Single Virtual Mode bit */
-#define SH7750_MMUCR_SQMD     0x00000200	/* Store Queue Mode bit */
-#define SH7750_MMUCR_URC      0x0000FC00	/* UTLB Replace Counter */
+#define SH7750_MMUCR_AT       0x00000001    /* Address translation bit */
+#define SH7750_MMUCR_TI       0x00000004    /* TLB invalidate */
+#define SH7750_MMUCR_SV       0x00000100    /* Single Virtual Mode bit */
+#define SH7750_MMUCR_SQMD     0x00000200    /* Store Queue Mode bit */
+#define SH7750_MMUCR_URC      0x0000FC00    /* UTLB Replace Counter */
 #define SH7750_MMUCR_URC_S    10
-#define SH7750_MMUCR_URB      0x00FC0000	/* UTLB Replace Boundary */
+#define SH7750_MMUCR_URB      0x00FC0000    /* UTLB Replace Boundary */
 #define SH7750_MMUCR_URB_S    18
-#define SH7750_MMUCR_LRUI     0xFC000000	/* Least Recently Used ITLB */
+#define SH7750_MMUCR_LRUI     0xFC000000    /* Least Recently Used ITLB */
 #define SH7750_MMUCR_LRUI_S   26
 
 
@@ -145,30 +145,30 @@
  */
 
 /* Cache Control Register - CCR */
-#define SH7750_CCR_REGOFS     0x00001c	/* offset */
+#define SH7750_CCR_REGOFS     0x00001c    /* offset */
 #define SH7750_CCR            SH7750_P4_REG32(SH7750_CCR_REGOFS)
 #define SH7750_CCR_A7         SH7750_A7_REG32(SH7750_CCR_REGOFS)
 
-#define SH7750_CCR_IIX      0x00008000	/* IC index enable bit */
-#define SH7750_CCR_ICI      0x00000800	/* IC invalidation bit:
-					   set it to clear IC */
-#define SH7750_CCR_ICE      0x00000100	/* IC enable bit */
-#define SH7750_CCR_OIX      0x00000080	/* OC index enable bit */
-#define SH7750_CCR_ORA      0x00000020	/* OC RAM enable bit
-					   if you set OCE = 0,
-					   you should set ORA = 0 */
-#define SH7750_CCR_OCI      0x00000008	/* OC invalidation bit */
-#define SH7750_CCR_CB       0x00000004	/* Copy-back bit for P1 area */
-#define SH7750_CCR_WT       0x00000002	/* Write-through bit for P0,U0,P3 area */
-#define SH7750_CCR_OCE      0x00000001	/* OC enable bit */
+#define SH7750_CCR_IIX      0x00008000    /* IC index enable bit */
+#define SH7750_CCR_ICI      0x00000800    /* IC invalidation bit:
+                       set it to clear IC */
+#define SH7750_CCR_ICE      0x00000100    /* IC enable bit */
+#define SH7750_CCR_OIX      0x00000080    /* OC index enable bit */
+#define SH7750_CCR_ORA      0x00000020    /* OC RAM enable bit
+                       if you set OCE = 0,
+                       you should set ORA = 0 */
+#define SH7750_CCR_OCI      0x00000008    /* OC invalidation bit */
+#define SH7750_CCR_CB       0x00000004    /* Copy-back bit for P1 area */
+#define SH7750_CCR_WT       0x00000002    /* Write-through bit for P0,U0,P3 area */
+#define SH7750_CCR_OCE      0x00000001    /* OC enable bit */
 
 /* Queue address control register 0 - QACR0 */
-#define SH7750_QACR0_REGOFS   0x000038	/* offset */
+#define SH7750_QACR0_REGOFS   0x000038    /* offset */
 #define SH7750_QACR0          SH7750_P4_REG32(SH7750_QACR0_REGOFS)
 #define SH7750_QACR0_A7       SH7750_A7_REG32(SH7750_QACR0_REGOFS)
 
 /* Queue address control register 1 - QACR1 */
-#define SH7750_QACR1_REGOFS   0x00003c	/* offset */
+#define SH7750_QACR1_REGOFS   0x00003c    /* offset */
 #define SH7750_QACR1          SH7750_P4_REG32(SH7750_QACR1_REGOFS)
 #define SH7750_QACR1_A7       SH7750_A7_REG32(SH7750_QACR1_REGOFS)
 
@@ -178,11 +178,11 @@
  */
 
 /* Immediate data for TRAPA instruction - TRA */
-#define SH7750_TRA_REGOFS     0x000020	/* offset */
+#define SH7750_TRA_REGOFS     0x000020    /* offset */
 #define SH7750_TRA            SH7750_P4_REG32(SH7750_TRA_REGOFS)
 #define SH7750_TRA_A7         SH7750_A7_REG32(SH7750_TRA_REGOFS)
 
-#define SH7750_TRA_IMM      0x000003fd	/* Immediate data operand */
+#define SH7750_TRA_IMM      0x000003fd    /* Immediate data operand */
 #define SH7750_TRA_IMM_S    2
 
 /* Exeption event register - EXPEVT */
@@ -190,14 +190,14 @@
 #define SH7750_EXPEVT         SH7750_P4_REG32(SH7750_EXPEVT_REGOFS)
 #define SH7750_EXPEVT_A7      SH7750_A7_REG32(SH7750_EXPEVT_REGOFS)
 
-#define SH7750_EXPEVT_EX      0x00000fff	/* Exeption code */
+#define SH7750_EXPEVT_EX      0x00000fff    /* Exeption code */
 #define SH7750_EXPEVT_EX_S    0
 
 /* Interrupt event register */
 #define SH7750_INTEVT_REGOFS  0x000028
 #define SH7750_INTEVT         SH7750_P4_REG32(SH7750_INTEVT_REGOFS)
 #define SH7750_INTEVT_A7      SH7750_A7_REG32(SH7750_INTEVT_REGOFS)
-#define SH7750_INTEVT_EX    0x00000fff	/* Exeption code */
+#define SH7750_INTEVT_EX    0x00000fff    /* Exeption code */
 #define SH7750_INTEVT_EX_S  0
 
 /*
@@ -206,683 +206,683 @@
 #define SH7750_EVT_TO_NUM(evt)  ((evt) >> 5)
 
 /* Reset exception category */
-#define SH7750_EVT_POWER_ON_RST        0x000	/* Power-on reset */
-#define SH7750_EVT_MANUAL_RST          0x020	/* Manual reset */
-#define SH7750_EVT_TLB_MULT_HIT        0x140	/* TLB multiple-hit exception */
+#define SH7750_EVT_POWER_ON_RST        0x000    /* Power-on reset */
+#define SH7750_EVT_MANUAL_RST          0x020    /* Manual reset */
+#define SH7750_EVT_TLB_MULT_HIT        0x140    /* TLB multiple-hit exception */
 
 /* General exception category */
-#define SH7750_EVT_USER_BREAK          0x1E0	/* User break */
-#define SH7750_EVT_IADDR_ERR           0x0E0	/* Instruction address error */
-#define SH7750_EVT_TLB_READ_MISS       0x040	/* ITLB miss exception /
-						   DTLB miss exception (read) */
-#define SH7750_EVT_TLB_READ_PROTV      0x0A0	/* ITLB protection violation /
-						   DTLB protection violation (read) */
-#define SH7750_EVT_ILLEGAL_INSTR       0x180	/* General Illegal Instruction
-						   exception */
-#define SH7750_EVT_SLOT_ILLEGAL_INSTR  0x1A0	/* Slot Illegal Instruction
-						   exception */
-#define SH7750_EVT_FPU_DISABLE         0x800	/* General FPU disable exception */
-#define SH7750_EVT_SLOT_FPU_DISABLE    0x820	/* Slot FPU disable exception */
-#define SH7750_EVT_DATA_READ_ERR       0x0E0	/* Data address error (read) */
-#define SH7750_EVT_DATA_WRITE_ERR      0x100	/* Data address error (write) */
-#define SH7750_EVT_DTLB_WRITE_MISS     0x060	/* DTLB miss exception (write) */
-#define SH7750_EVT_DTLB_WRITE_PROTV    0x0C0	/* DTLB protection violation
-						   exception (write) */
-#define SH7750_EVT_FPU_EXCEPTION       0x120	/* FPU exception */
-#define SH7750_EVT_INITIAL_PGWRITE     0x080	/* Initial Page Write exception */
-#define SH7750_EVT_TRAPA               0x160	/* Unconditional trap (TRAPA) */
+#define SH7750_EVT_USER_BREAK          0x1E0    /* User break */
+#define SH7750_EVT_IADDR_ERR           0x0E0    /* Instruction address error */
+#define SH7750_EVT_TLB_READ_MISS       0x040    /* ITLB miss exception /
+                           DTLB miss exception (read) */
+#define SH7750_EVT_TLB_READ_PROTV      0x0A0    /* ITLB protection violation /
+                           DTLB protection violation (read) */
+#define SH7750_EVT_ILLEGAL_INSTR       0x180    /* General Illegal Instruction
+                           exception */
+#define SH7750_EVT_SLOT_ILLEGAL_INSTR  0x1A0    /* Slot Illegal Instruction
+                           exception */
+#define SH7750_EVT_FPU_DISABLE         0x800    /* General FPU disable exception */
+#define SH7750_EVT_SLOT_FPU_DISABLE    0x820    /* Slot FPU disable exception */
+#define SH7750_EVT_DATA_READ_ERR       0x0E0    /* Data address error (read) */
+#define SH7750_EVT_DATA_WRITE_ERR      0x100    /* Data address error (write) */
+#define SH7750_EVT_DTLB_WRITE_MISS     0x060    /* DTLB miss exception (write) */
+#define SH7750_EVT_DTLB_WRITE_PROTV    0x0C0    /* DTLB protection violation
+                           exception (write) */
+#define SH7750_EVT_FPU_EXCEPTION       0x120    /* FPU exception */
+#define SH7750_EVT_INITIAL_PGWRITE     0x080    /* Initial Page Write exception */
+#define SH7750_EVT_TRAPA               0x160    /* Unconditional trap (TRAPA) */
 
 /* Interrupt exception category */
-#define SH7750_EVT_NMI                 0x1C0	/* Non-maskable interrupt */
-#define SH7750_EVT_IRQ0                0x200	/* External Interrupt 0 */
-#define SH7750_EVT_IRQ1                0x220	/* External Interrupt 1 */
-#define SH7750_EVT_IRQ2                0x240	/* External Interrupt 2 */
-#define SH7750_EVT_IRQ3                0x260	/* External Interrupt 3 */
-#define SH7750_EVT_IRQ4                0x280	/* External Interrupt 4 */
-#define SH7750_EVT_IRQ5                0x2A0	/* External Interrupt 5 */
-#define SH7750_EVT_IRQ6                0x2C0	/* External Interrupt 6 */
-#define SH7750_EVT_IRQ7                0x2E0	/* External Interrupt 7 */
-#define SH7750_EVT_IRQ8                0x300	/* External Interrupt 8 */
-#define SH7750_EVT_IRQ9                0x320	/* External Interrupt 9 */
-#define SH7750_EVT_IRQA                0x340	/* External Interrupt A */
-#define SH7750_EVT_IRQB                0x360	/* External Interrupt B */
-#define SH7750_EVT_IRQC                0x380	/* External Interrupt C */
-#define SH7750_EVT_IRQD                0x3A0	/* External Interrupt D */
-#define SH7750_EVT_IRQE                0x3C0	/* External Interrupt E */
+#define SH7750_EVT_NMI                 0x1C0    /* Non-maskable interrupt */
+#define SH7750_EVT_IRQ0                0x200    /* External Interrupt 0 */
+#define SH7750_EVT_IRQ1                0x220    /* External Interrupt 1 */
+#define SH7750_EVT_IRQ2                0x240    /* External Interrupt 2 */
+#define SH7750_EVT_IRQ3                0x260    /* External Interrupt 3 */
+#define SH7750_EVT_IRQ4                0x280    /* External Interrupt 4 */
+#define SH7750_EVT_IRQ5                0x2A0    /* External Interrupt 5 */
+#define SH7750_EVT_IRQ6                0x2C0    /* External Interrupt 6 */
+#define SH7750_EVT_IRQ7                0x2E0    /* External Interrupt 7 */
+#define SH7750_EVT_IRQ8                0x300    /* External Interrupt 8 */
+#define SH7750_EVT_IRQ9                0x320    /* External Interrupt 9 */
+#define SH7750_EVT_IRQA                0x340    /* External Interrupt A */
+#define SH7750_EVT_IRQB                0x360    /* External Interrupt B */
+#define SH7750_EVT_IRQC                0x380    /* External Interrupt C */
+#define SH7750_EVT_IRQD                0x3A0    /* External Interrupt D */
+#define SH7750_EVT_IRQE                0x3C0    /* External Interrupt E */
 
 /* Peripheral Module Interrupts - Timer Unit (TMU) */
-#define SH7750_EVT_TUNI0               0x400	/* TMU Underflow Interrupt 0 */
-#define SH7750_EVT_TUNI1               0x420	/* TMU Underflow Interrupt 1 */
-#define SH7750_EVT_TUNI2               0x440	/* TMU Underflow Interrupt 2 */
-#define SH7750_EVT_TICPI2              0x460	/* TMU Input Capture Interrupt 2 */
+#define SH7750_EVT_TUNI0               0x400    /* TMU Underflow Interrupt 0 */
+#define SH7750_EVT_TUNI1               0x420    /* TMU Underflow Interrupt 1 */
+#define SH7750_EVT_TUNI2               0x440    /* TMU Underflow Interrupt 2 */
+#define SH7750_EVT_TICPI2              0x460    /* TMU Input Capture Interrupt 2 */
 
 /* Peripheral Module Interrupts - Real-Time Clock (RTC) */
-#define SH7750_EVT_RTC_ATI             0x480	/* Alarm Interrupt Request */
-#define SH7750_EVT_RTC_PRI             0x4A0	/* Periodic Interrupt Request */
-#define SH7750_EVT_RTC_CUI             0x4C0	/* Carry Interrupt Request */
+#define SH7750_EVT_RTC_ATI             0x480    /* Alarm Interrupt Request */
+#define SH7750_EVT_RTC_PRI             0x4A0    /* Periodic Interrupt Request */
+#define SH7750_EVT_RTC_CUI             0x4C0    /* Carry Interrupt Request */
 
 /* Peripheral Module Interrupts - Serial Communication Interface (SCI) */
-#define SH7750_EVT_SCI_ERI             0x4E0	/* Receive Error */
-#define SH7750_EVT_SCI_RXI             0x500	/* Receive Data Register Full */
-#define SH7750_EVT_SCI_TXI             0x520	/* Transmit Data Register Empty */
-#define SH7750_EVT_SCI_TEI             0x540	/* Transmit End */
+#define SH7750_EVT_SCI_ERI             0x4E0    /* Receive Error */
+#define SH7750_EVT_SCI_RXI             0x500    /* Receive Data Register Full */
+#define SH7750_EVT_SCI_TXI             0x520    /* Transmit Data Register Empty */
+#define SH7750_EVT_SCI_TEI             0x540    /* Transmit End */
 
 /* Peripheral Module Interrupts - Watchdog Timer (WDT) */
-#define SH7750_EVT_WDT_ITI             0x560	/* Interval Timer Interrupt
-						   (used when WDT operates in
-						   interval timer mode) */
+#define SH7750_EVT_WDT_ITI             0x560    /* Interval Timer Interrupt
+                           (used when WDT operates in
+                           interval timer mode) */
 
 /* Peripheral Module Interrupts - Memory Refresh Unit (REF) */
-#define SH7750_EVT_REF_RCMI            0x580	/* Compare-match Interrupt */
-#define SH7750_EVT_REF_ROVI            0x5A0	/* Refresh Counter Overflow
-						   interrupt */
+#define SH7750_EVT_REF_RCMI            0x580    /* Compare-match Interrupt */
+#define SH7750_EVT_REF_ROVI            0x5A0    /* Refresh Counter Overflow
+                           interrupt */
 
 /* Peripheral Module Interrupts - Hitachi User Debug Interface (H-UDI) */
-#define SH7750_EVT_HUDI                0x600	/* UDI interrupt */
+#define SH7750_EVT_HUDI                0x600    /* UDI interrupt */
 
 /* Peripheral Module Interrupts - General-Purpose I/O (GPIO) */
-#define SH7750_EVT_GPIO                0x620	/* GPIO Interrupt */
+#define SH7750_EVT_GPIO                0x620    /* GPIO Interrupt */
 
 /* Peripheral Module Interrupts - DMA Controller (DMAC) */
-#define SH7750_EVT_DMAC_DMTE0          0x640	/* DMAC 0 Transfer End Interrupt */
-#define SH7750_EVT_DMAC_DMTE1          0x660	/* DMAC 1 Transfer End Interrupt */
-#define SH7750_EVT_DMAC_DMTE2          0x680	/* DMAC 2 Transfer End Interrupt */
-#define SH7750_EVT_DMAC_DMTE3          0x6A0	/* DMAC 3 Transfer End Interrupt */
-#define SH7750_EVT_DMAC_DMAE           0x6C0	/* DMAC Address Error Interrupt */
+#define SH7750_EVT_DMAC_DMTE0          0x640    /* DMAC 0 Transfer End Interrupt */
+#define SH7750_EVT_DMAC_DMTE1          0x660    /* DMAC 1 Transfer End Interrupt */
+#define SH7750_EVT_DMAC_DMTE2          0x680    /* DMAC 2 Transfer End Interrupt */
+#define SH7750_EVT_DMAC_DMTE3          0x6A0    /* DMAC 3 Transfer End Interrupt */
+#define SH7750_EVT_DMAC_DMAE           0x6C0    /* DMAC Address Error Interrupt */
 
 /* Peripheral Module Interrupts - Serial Communication Interface with FIFO */
 /*                                                                  (SCIF) */
-#define SH7750_EVT_SCIF_ERI            0x700	/* Receive Error */
-#define SH7750_EVT_SCIF_RXI            0x720	/* Receive FIFO Data Full or
-						   Receive Data ready interrupt */
-#define SH7750_EVT_SCIF_BRI            0x740	/* Break or overrun error */
-#define SH7750_EVT_SCIF_TXI            0x760	/* Transmit FIFO Data Empty */
+#define SH7750_EVT_SCIF_ERI            0x700    /* Receive Error */
+#define SH7750_EVT_SCIF_RXI            0x720    /* Receive FIFO Data Full or
+                           Receive Data ready interrupt */
+#define SH7750_EVT_SCIF_BRI            0x740    /* Break or overrun error */
+#define SH7750_EVT_SCIF_TXI            0x760    /* Transmit FIFO Data Empty */
 
 /*
  * Power Management
  */
-#define SH7750_STBCR_REGOFS   0xC00004	/* offset */
+#define SH7750_STBCR_REGOFS   0xC00004    /* offset */
 #define SH7750_STBCR          SH7750_P4_REG32(SH7750_STBCR_REGOFS)
 #define SH7750_STBCR_A7       SH7750_A7_REG32(SH7750_STBCR_REGOFS)
 
-#define SH7750_STBCR_STBY     0x80	/* Specifies a transition to standby mode:
-					   0 - Transition to SLEEP mode on SLEEP
-					   1 - Transition to STANDBY mode on SLEEP */
-#define SH7750_STBCR_PHZ      0x40	/* State of peripheral module pins in
-					   standby mode:
-					   0 - normal state
-					   1 - high-impendance state */
+#define SH7750_STBCR_STBY     0x80    /* Specifies a transition to standby mode:
+                       0 - Transition to SLEEP mode on SLEEP
+                       1 - Transition to STANDBY mode on SLEEP */
+#define SH7750_STBCR_PHZ      0x40    /* State of peripheral module pins in
+                       standby mode:
+                       0 - normal state
+                       1 - high-impendance state */
 
-#define SH7750_STBCR_PPU      0x20	/* Peripheral module pins pull-up controls */
-#define SH7750_STBCR_MSTP4    0x10	/* Stopping the clock supply to DMAC */
+#define SH7750_STBCR_PPU      0x20    /* Peripheral module pins pull-up controls */
+#define SH7750_STBCR_MSTP4    0x10    /* Stopping the clock supply to DMAC */
 #define SH7750_STBCR_DMAC_STP SH7750_STBCR_MSTP4
-#define SH7750_STBCR_MSTP3    0x08	/* Stopping the clock supply to SCIF */
+#define SH7750_STBCR_MSTP3    0x08    /* Stopping the clock supply to SCIF */
 #define SH7750_STBCR_SCIF_STP SH7750_STBCR_MSTP3
-#define SH7750_STBCR_MSTP2    0x04	/* Stopping the clock supply to TMU */
+#define SH7750_STBCR_MSTP2    0x04    /* Stopping the clock supply to TMU */
 #define SH7750_STBCR_TMU_STP  SH7750_STBCR_MSTP2
-#define SH7750_STBCR_MSTP1    0x02	/* Stopping the clock supply to RTC */
+#define SH7750_STBCR_MSTP1    0x02    /* Stopping the clock supply to RTC */
 #define SH7750_STBCR_RTC_STP  SH7750_STBCR_MSTP1
-#define SH7750_STBCR_MSPT0    0x01	/* Stopping the clock supply to SCI */
+#define SH7750_STBCR_MSPT0    0x01    /* Stopping the clock supply to SCI */
 #define SH7750_STBCR_SCI_STP  SH7750_STBCR_MSTP0
 
 #define SH7750_STBCR_STBY     0x80
 
 
-#define SH7750_STBCR2_REGOFS  0xC00010	/* offset */
+#define SH7750_STBCR2_REGOFS  0xC00010    /* offset */
 #define SH7750_STBCR2         SH7750_P4_REG32(SH7750_STBCR2_REGOFS)
 #define SH7750_STBCR2_A7      SH7750_A7_REG32(SH7750_STBCR2_REGOFS)
 
-#define SH7750_STBCR2_DSLP    0x80	/* Specifies transition to deep sleep mode:
-					   0 - transition to sleep or standby mode
-					   as it is specified in STBY bit
-					   1 - transition to deep sleep mode on
-					   execution of SLEEP instruction */
-#define SH7750_STBCR2_MSTP6   0x02	/* Stopping the clock supply to Store Queue
-					   in the cache controller */
+#define SH7750_STBCR2_DSLP    0x80    /* Specifies transition to deep sleep mode:
+                       0 - transition to sleep or standby mode
+                       as it is specified in STBY bit
+                       1 - transition to deep sleep mode on
+                       execution of SLEEP instruction */
+#define SH7750_STBCR2_MSTP6   0x02    /* Stopping the clock supply to Store Queue
+                       in the cache controller */
 #define SH7750_STBCR2_SQ_STP  SH7750_STBCR2_MSTP6
-#define SH7750_STBCR2_MSTP5   0x01	/* Stopping the clock supply to the User
-					   Break Controller (UBC) */
+#define SH7750_STBCR2_MSTP5   0x01    /* Stopping the clock supply to the User
+                       Break Controller (UBC) */
 #define SH7750_STBCR2_UBC_STP SH7750_STBCR2_MSTP5
 
 /*
  * Clock Pulse Generator (CPG)
  */
-#define SH7750_FRQCR_REGOFS   0xC00000	/* offset */
+#define SH7750_FRQCR_REGOFS   0xC00000    /* offset */
 #define SH7750_FRQCR          SH7750_P4_REG32(SH7750_FRQCR_REGOFS)
 #define SH7750_FRQCR_A7       SH7750_A7_REG32(SH7750_FRQCR_REGOFS)
 
-#define SH7750_FRQCR_CKOEN    0x0800	/* Clock Output Enable
-					   0 - CKIO pin goes to HiZ/pullup
-					   1 - Clock is output from CKIO */
-#define SH7750_FRQCR_PLL1EN   0x0400	/* PLL circuit 1 enable */
-#define SH7750_FRQCR_PLL2EN   0x0200	/* PLL circuit 2 enable */
-
-#define SH7750_FRQCR_IFC      0x01C0	/* CPU clock frequency division ratio: */
-#define SH7750_FRQCR_IFCDIV1  0x0000	/*    0 - * 1 */
-#define SH7750_FRQCR_IFCDIV2  0x0040	/*    1 - * 1/2 */
-#define SH7750_FRQCR_IFCDIV3  0x0080	/*    2 - * 1/3 */
-#define SH7750_FRQCR_IFCDIV4  0x00C0	/*    3 - * 1/4 */
-#define SH7750_FRQCR_IFCDIV6  0x0100	/*    4 - * 1/6 */
-#define SH7750_FRQCR_IFCDIV8  0x0140	/*    5 - * 1/8 */
-
-#define SH7750_FRQCR_BFC      0x0038	/* Bus clock frequency division ratio: */
-#define SH7750_FRQCR_BFCDIV1  0x0000	/*    0 - * 1 */
-#define SH7750_FRQCR_BFCDIV2  0x0008	/*    1 - * 1/2 */
-#define SH7750_FRQCR_BFCDIV3  0x0010	/*    2 - * 1/3 */
-#define SH7750_FRQCR_BFCDIV4  0x0018	/*    3 - * 1/4 */
-#define SH7750_FRQCR_BFCDIV6  0x0020	/*    4 - * 1/6 */
-#define SH7750_FRQCR_BFCDIV8  0x0028	/*    5 - * 1/8 */
-
-#define SH7750_FRQCR_PFC      0x0007	/* Peripheral module clock frequency
-					   division ratio: */
-#define SH7750_FRQCR_PFCDIV2  0x0000	/*    0 - * 1/2 */
-#define SH7750_FRQCR_PFCDIV3  0x0001	/*    1 - * 1/3 */
-#define SH7750_FRQCR_PFCDIV4  0x0002	/*    2 - * 1/4 */
-#define SH7750_FRQCR_PFCDIV6  0x0003	/*    3 - * 1/6 */
-#define SH7750_FRQCR_PFCDIV8  0x0004	/*    4 - * 1/8 */
+#define SH7750_FRQCR_CKOEN    0x0800    /* Clock Output Enable
+                       0 - CKIO pin goes to HiZ/pullup
+                       1 - Clock is output from CKIO */
+#define SH7750_FRQCR_PLL1EN   0x0400    /* PLL circuit 1 enable */
+#define SH7750_FRQCR_PLL2EN   0x0200    /* PLL circuit 2 enable */
+
+#define SH7750_FRQCR_IFC      0x01C0    /* CPU clock frequency division ratio: */
+#define SH7750_FRQCR_IFCDIV1  0x0000    /*    0 - * 1 */
+#define SH7750_FRQCR_IFCDIV2  0x0040    /*    1 - * 1/2 */
+#define SH7750_FRQCR_IFCDIV3  0x0080    /*    2 - * 1/3 */
+#define SH7750_FRQCR_IFCDIV4  0x00C0    /*    3 - * 1/4 */
+#define SH7750_FRQCR_IFCDIV6  0x0100    /*    4 - * 1/6 */
+#define SH7750_FRQCR_IFCDIV8  0x0140    /*    5 - * 1/8 */
+
+#define SH7750_FRQCR_BFC      0x0038    /* Bus clock frequency division ratio: */
+#define SH7750_FRQCR_BFCDIV1  0x0000    /*    0 - * 1 */
+#define SH7750_FRQCR_BFCDIV2  0x0008    /*    1 - * 1/2 */
+#define SH7750_FRQCR_BFCDIV3  0x0010    /*    2 - * 1/3 */
+#define SH7750_FRQCR_BFCDIV4  0x0018    /*    3 - * 1/4 */
+#define SH7750_FRQCR_BFCDIV6  0x0020    /*    4 - * 1/6 */
+#define SH7750_FRQCR_BFCDIV8  0x0028    /*    5 - * 1/8 */
+
+#define SH7750_FRQCR_PFC      0x0007    /* Peripheral module clock frequency
+                       division ratio: */
+#define SH7750_FRQCR_PFCDIV2  0x0000    /*    0 - * 1/2 */
+#define SH7750_FRQCR_PFCDIV3  0x0001    /*    1 - * 1/3 */
+#define SH7750_FRQCR_PFCDIV4  0x0002    /*    2 - * 1/4 */
+#define SH7750_FRQCR_PFCDIV6  0x0003    /*    3 - * 1/6 */
+#define SH7750_FRQCR_PFCDIV8  0x0004    /*    4 - * 1/8 */
 
 /*
  * Watchdog Timer (WDT)
  */
 
 /* Watchdog Timer Counter register - WTCNT */
-#define SH7750_WTCNT_REGOFS   0xC00008	/* offset */
+#define SH7750_WTCNT_REGOFS   0xC00008    /* offset */
 #define SH7750_WTCNT          SH7750_P4_REG32(SH7750_WTCNT_REGOFS)
 #define SH7750_WTCNT_A7       SH7750_A7_REG32(SH7750_WTCNT_REGOFS)
-#define SH7750_WTCNT_KEY      0x5A00	/* When WTCNT byte register written,
-					   you have to set the upper byte to
-					   0x5A */
+#define SH7750_WTCNT_KEY      0x5A00    /* When WTCNT byte register written,
+                       you have to set the upper byte to
+                       0x5A */
 
 /* Watchdog Timer Control/Status register - WTCSR */
-#define SH7750_WTCSR_REGOFS   0xC0000C	/* offset */
+#define SH7750_WTCSR_REGOFS   0xC0000C    /* offset */
 #define SH7750_WTCSR          SH7750_P4_REG32(SH7750_WTCSR_REGOFS)
 #define SH7750_WTCSR_A7       SH7750_A7_REG32(SH7750_WTCSR_REGOFS)
-#define SH7750_WTCSR_KEY      0xA500	/* When WTCSR byte register written,
-					   you have to set the upper byte to
-					   0xA5 */
-#define SH7750_WTCSR_TME      0x80	/* Timer enable (1-upcount start) */
-#define SH7750_WTCSR_MODE     0x40	/* Timer Mode Select: */
-#define SH7750_WTCSR_MODE_WT  0x40	/*    Watchdog Timer Mode */
-#define SH7750_WTCSR_MODE_IT  0x00	/*    Interval Timer Mode */
-#define SH7750_WTCSR_RSTS     0x20	/* Reset Select: */
-#define SH7750_WTCSR_RST_MAN  0x20	/*    Manual Reset */
-#define SH7750_WTCSR_RST_PWR  0x00	/*    Power-on Reset */
-#define SH7750_WTCSR_WOVF     0x10	/* Watchdog Timer Overflow Flag */
-#define SH7750_WTCSR_IOVF     0x08	/* Interval Timer Overflow Flag */
-#define SH7750_WTCSR_CKS      0x07	/* Clock Select: */
-#define SH7750_WTCSR_CKS_DIV32   0x00	/*   1/32 of frequency divider 2 input */
-#define SH7750_WTCSR_CKS_DIV64   0x01	/*   1/64 */
-#define SH7750_WTCSR_CKS_DIV128  0x02	/*   1/128 */
-#define SH7750_WTCSR_CKS_DIV256  0x03	/*   1/256 */
-#define SH7750_WTCSR_CKS_DIV512  0x04	/*   1/512 */
-#define SH7750_WTCSR_CKS_DIV1024 0x05	/*   1/1024 */
-#define SH7750_WTCSR_CKS_DIV2048 0x06	/*   1/2048 */
-#define SH7750_WTCSR_CKS_DIV4096 0x07	/*   1/4096 */
+#define SH7750_WTCSR_KEY      0xA500    /* When WTCSR byte register written,
+                       you have to set the upper byte to
+                       0xA5 */
+#define SH7750_WTCSR_TME      0x80    /* Timer enable (1-upcount start) */
+#define SH7750_WTCSR_MODE     0x40    /* Timer Mode Select: */
+#define SH7750_WTCSR_MODE_WT  0x40    /*    Watchdog Timer Mode */
+#define SH7750_WTCSR_MODE_IT  0x00    /*    Interval Timer Mode */
+#define SH7750_WTCSR_RSTS     0x20    /* Reset Select: */
+#define SH7750_WTCSR_RST_MAN  0x20    /*    Manual Reset */
+#define SH7750_WTCSR_RST_PWR  0x00    /*    Power-on Reset */
+#define SH7750_WTCSR_WOVF     0x10    /* Watchdog Timer Overflow Flag */
+#define SH7750_WTCSR_IOVF     0x08    /* Interval Timer Overflow Flag */
+#define SH7750_WTCSR_CKS      0x07    /* Clock Select: */
+#define SH7750_WTCSR_CKS_DIV32   0x00    /*   1/32 of frequency divider 2 input */
+#define SH7750_WTCSR_CKS_DIV64   0x01    /*   1/64 */
+#define SH7750_WTCSR_CKS_DIV128  0x02    /*   1/128 */
+#define SH7750_WTCSR_CKS_DIV256  0x03    /*   1/256 */
+#define SH7750_WTCSR_CKS_DIV512  0x04    /*   1/512 */
+#define SH7750_WTCSR_CKS_DIV1024 0x05    /*   1/1024 */
+#define SH7750_WTCSR_CKS_DIV2048 0x06    /*   1/2048 */
+#define SH7750_WTCSR_CKS_DIV4096 0x07    /*   1/4096 */
 
 /*
  * Real-Time Clock (RTC)
  */
 /* 64-Hz Counter Register (byte, read-only) - R64CNT */
-#define SH7750_R64CNT_REGOFS  0xC80000	/* offset */
+#define SH7750_R64CNT_REGOFS  0xC80000    /* offset */
 #define SH7750_R64CNT         SH7750_P4_REG32(SH7750_R64CNT_REGOFS)
 #define SH7750_R64CNT_A7      SH7750_A7_REG32(SH7750_R64CNT_REGOFS)
 
 /* Second Counter Register (byte, BCD-coded) - RSECCNT */
-#define SH7750_RSECCNT_REGOFS 0xC80004	/* offset */
+#define SH7750_RSECCNT_REGOFS 0xC80004    /* offset */
 #define SH7750_RSECCNT        SH7750_P4_REG32(SH7750_RSECCNT_REGOFS)
 #define SH7750_RSECCNT_A7     SH7750_A7_REG32(SH7750_RSECCNT_REGOFS)
 
 /* Minute Counter Register (byte, BCD-coded) - RMINCNT */
-#define SH7750_RMINCNT_REGOFS 0xC80008	/* offset */
+#define SH7750_RMINCNT_REGOFS 0xC80008    /* offset */
 #define SH7750_RMINCNT        SH7750_P4_REG32(SH7750_RMINCNT_REGOFS)
 #define SH7750_RMINCNT_A7     SH7750_A7_REG32(SH7750_RMINCNT_REGOFS)
 
 /* Hour Counter Register (byte, BCD-coded) - RHRCNT */
-#define SH7750_RHRCNT_REGOFS  0xC8000C	/* offset */
+#define SH7750_RHRCNT_REGOFS  0xC8000C    /* offset */
 #define SH7750_RHRCNT         SH7750_P4_REG32(SH7750_RHRCNT_REGOFS)
 #define SH7750_RHRCNT_A7      SH7750_A7_REG32(SH7750_RHRCNT_REGOFS)
 
 /* Day-of-Week Counter Register (byte) - RWKCNT */
-#define SH7750_RWKCNT_REGOFS  0xC80010	/* offset */
+#define SH7750_RWKCNT_REGOFS  0xC80010    /* offset */
 #define SH7750_RWKCNT         SH7750_P4_REG32(SH7750_RWKCNT_REGOFS)
 #define SH7750_RWKCNT_A7      SH7750_A7_REG32(SH7750_RWKCNT_REGOFS)
 
-#define SH7750_RWKCNT_SUN     0	/* Sunday */
-#define SH7750_RWKCNT_MON     1	/* Monday */
-#define SH7750_RWKCNT_TUE     2	/* Tuesday */
-#define SH7750_RWKCNT_WED     3	/* Wednesday */
-#define SH7750_RWKCNT_THU     4	/* Thursday */
-#define SH7750_RWKCNT_FRI     5	/* Friday */
-#define SH7750_RWKCNT_SAT     6	/* Saturday */
+#define SH7750_RWKCNT_SUN     0    /* Sunday */
+#define SH7750_RWKCNT_MON     1    /* Monday */
+#define SH7750_RWKCNT_TUE     2    /* Tuesday */
+#define SH7750_RWKCNT_WED     3    /* Wednesday */
+#define SH7750_RWKCNT_THU     4    /* Thursday */
+#define SH7750_RWKCNT_FRI     5    /* Friday */
+#define SH7750_RWKCNT_SAT     6    /* Saturday */
 
 /* Day Counter Register (byte, BCD-coded) - RDAYCNT */
-#define SH7750_RDAYCNT_REGOFS 0xC80014	/* offset */
+#define SH7750_RDAYCNT_REGOFS 0xC80014    /* offset */
 #define SH7750_RDAYCNT        SH7750_P4_REG32(SH7750_RDAYCNT_REGOFS)
 #define SH7750_RDAYCNT_A7     SH7750_A7_REG32(SH7750_RDAYCNT_REGOFS)
 
 /* Month Counter Register (byte, BCD-coded) - RMONCNT */
-#define SH7750_RMONCNT_REGOFS 0xC80018	/* offset */
+#define SH7750_RMONCNT_REGOFS 0xC80018    /* offset */
 #define SH7750_RMONCNT        SH7750_P4_REG32(SH7750_RMONCNT_REGOFS)
 #define SH7750_RMONCNT_A7     SH7750_A7_REG32(SH7750_RMONCNT_REGOFS)
 
 /* Year Counter Register (half, BCD-coded) - RYRCNT */
-#define SH7750_RYRCNT_REGOFS  0xC8001C	/* offset */
+#define SH7750_RYRCNT_REGOFS  0xC8001C    /* offset */
 #define SH7750_RYRCNT         SH7750_P4_REG32(SH7750_RYRCNT_REGOFS)
 #define SH7750_RYRCNT_A7      SH7750_A7_REG32(SH7750_RYRCNT_REGOFS)
 
 /* Second Alarm Register (byte, BCD-coded) - RSECAR */
-#define SH7750_RSECAR_REGOFS  0xC80020	/* offset */
+#define SH7750_RSECAR_REGOFS  0xC80020    /* offset */
 #define SH7750_RSECAR         SH7750_P4_REG32(SH7750_RSECAR_REGOFS)
 #define SH7750_RSECAR_A7      SH7750_A7_REG32(SH7750_RSECAR_REGOFS)
-#define SH7750_RSECAR_ENB     0x80	/* Second Alarm Enable */
+#define SH7750_RSECAR_ENB     0x80    /* Second Alarm Enable */
 
 /* Minute Alarm Register (byte, BCD-coded) - RMINAR */
-#define SH7750_RMINAR_REGOFS  0xC80024	/* offset */
+#define SH7750_RMINAR_REGOFS  0xC80024    /* offset */
 #define SH7750_RMINAR         SH7750_P4_REG32(SH7750_RMINAR_REGOFS)
 #define SH7750_RMINAR_A7      SH7750_A7_REG32(SH7750_RMINAR_REGOFS)
-#define SH7750_RMINAR_ENB     0x80	/* Minute Alarm Enable */
+#define SH7750_RMINAR_ENB     0x80    /* Minute Alarm Enable */
 
 /* Hour Alarm Register (byte, BCD-coded) - RHRAR */
-#define SH7750_RHRAR_REGOFS   0xC80028	/* offset */
+#define SH7750_RHRAR_REGOFS   0xC80028    /* offset */
 #define SH7750_RHRAR          SH7750_P4_REG32(SH7750_RHRAR_REGOFS)
 #define SH7750_RHRAR_A7       SH7750_A7_REG32(SH7750_RHRAR_REGOFS)
-#define SH7750_RHRAR_ENB      0x80	/* Hour Alarm Enable */
+#define SH7750_RHRAR_ENB      0x80    /* Hour Alarm Enable */
 
 /* Day-of-Week Alarm Register (byte) - RWKAR */
-#define SH7750_RWKAR_REGOFS   0xC8002C	/* offset */
+#define SH7750_RWKAR_REGOFS   0xC8002C    /* offset */
 #define SH7750_RWKAR          SH7750_P4_REG32(SH7750_RWKAR_REGOFS)
 #define SH7750_RWKAR_A7       SH7750_A7_REG32(SH7750_RWKAR_REGOFS)
-#define SH7750_RWKAR_ENB      0x80	/* Day-of-week Alarm Enable */
+#define SH7750_RWKAR_ENB      0x80    /* Day-of-week Alarm Enable */
 
-#define SH7750_RWKAR_SUN      0	/* Sunday */
-#define SH7750_RWKAR_MON      1	/* Monday */
-#define SH7750_RWKAR_TUE      2	/* Tuesday */
-#define SH7750_RWKAR_WED      3	/* Wednesday */
-#define SH7750_RWKAR_THU      4	/* Thursday */
-#define SH7750_RWKAR_FRI      5	/* Friday */
-#define SH7750_RWKAR_SAT      6	/* Saturday */
+#define SH7750_RWKAR_SUN      0    /* Sunday */
+#define SH7750_RWKAR_MON      1    /* Monday */
+#define SH7750_RWKAR_TUE      2    /* Tuesday */
+#define SH7750_RWKAR_WED      3    /* Wednesday */
+#define SH7750_RWKAR_THU      4    /* Thursday */
+#define SH7750_RWKAR_FRI      5    /* Friday */
+#define SH7750_RWKAR_SAT      6    /* Saturday */
 
 /* Day Alarm Register (byte, BCD-coded) - RDAYAR */
-#define SH7750_RDAYAR_REGOFS  0xC80030	/* offset */
+#define SH7750_RDAYAR_REGOFS  0xC80030    /* offset */
 #define SH7750_RDAYAR         SH7750_P4_REG32(SH7750_RDAYAR_REGOFS)
 #define SH7750_RDAYAR_A7      SH7750_A7_REG32(SH7750_RDAYAR_REGOFS)
-#define SH7750_RDAYAR_ENB     0x80	/* Day Alarm Enable */
+#define SH7750_RDAYAR_ENB     0x80    /* Day Alarm Enable */
 
 /* Month Counter Register (byte, BCD-coded) - RMONAR */
-#define SH7750_RMONAR_REGOFS  0xC80034	/* offset */
+#define SH7750_RMONAR_REGOFS  0xC80034    /* offset */
 #define SH7750_RMONAR         SH7750_P4_REG32(SH7750_RMONAR_REGOFS)
 #define SH7750_RMONAR_A7      SH7750_A7_REG32(SH7750_RMONAR_REGOFS)
-#define SH7750_RMONAR_ENB     0x80	/* Month Alarm Enable */
+#define SH7750_RMONAR_ENB     0x80    /* Month Alarm Enable */
 
 /* RTC Control Register 1 (byte) - RCR1 */
-#define SH7750_RCR1_REGOFS    0xC80038	/* offset */
+#define SH7750_RCR1_REGOFS    0xC80038    /* offset */
 #define SH7750_RCR1           SH7750_P4_REG32(SH7750_RCR1_REGOFS)
 #define SH7750_RCR1_A7        SH7750_A7_REG32(SH7750_RCR1_REGOFS)
-#define SH7750_RCR1_CF        0x80	/* Carry Flag */
-#define SH7750_RCR1_CIE       0x10	/* Carry Interrupt Enable */
-#define SH7750_RCR1_AIE       0x08	/* Alarm Interrupt Enable */
-#define SH7750_RCR1_AF        0x01	/* Alarm Flag */
+#define SH7750_RCR1_CF        0x80    /* Carry Flag */
+#define SH7750_RCR1_CIE       0x10    /* Carry Interrupt Enable */
+#define SH7750_RCR1_AIE       0x08    /* Alarm Interrupt Enable */
+#define SH7750_RCR1_AF        0x01    /* Alarm Flag */
 
 /* RTC Control Register 2 (byte) - RCR2 */
-#define SH7750_RCR2_REGOFS    0xC8003C	/* offset */
+#define SH7750_RCR2_REGOFS    0xC8003C    /* offset */
 #define SH7750_RCR2           SH7750_P4_REG32(SH7750_RCR2_REGOFS)
 #define SH7750_RCR2_A7        SH7750_A7_REG32(SH7750_RCR2_REGOFS)
-#define SH7750_RCR2_PEF        0x80	/* Periodic Interrupt Flag */
-#define SH7750_RCR2_PES        0x70	/* Periodic Interrupt Enable: */
-#define SH7750_RCR2_PES_DIS    0x00	/*   Periodic Interrupt Disabled */
-#define SH7750_RCR2_PES_DIV256 0x10	/*   Generated at 1/256 sec interval */
-#define SH7750_RCR2_PES_DIV64  0x20	/*   Generated at 1/64 sec interval */
-#define SH7750_RCR2_PES_DIV16  0x30	/*   Generated at 1/16 sec interval */
-#define SH7750_RCR2_PES_DIV4   0x40	/*   Generated at 1/4 sec interval */
-#define SH7750_RCR2_PES_DIV2   0x50	/*   Generated at 1/2 sec interval */
-#define SH7750_RCR2_PES_x1     0x60	/*   Generated at 1 sec interval */
-#define SH7750_RCR2_PES_x2     0x70	/*   Generated at 2 sec interval */
-#define SH7750_RCR2_RTCEN      0x08	/* RTC Crystal Oscillator is Operated */
-#define SH7750_RCR2_ADJ        0x04	/* 30-Second Adjastment */
-#define SH7750_RCR2_RESET      0x02	/* Frequency divider circuits are reset */
-#define SH7750_RCR2_START      0x01	/* 0 - sec, min, hr, day-of-week, month,
-					   year counters are stopped
-					   1 - sec, min, hr, day-of-week, month,
-					   year counters operate normally */
+#define SH7750_RCR2_PEF        0x80    /* Periodic Interrupt Flag */
+#define SH7750_RCR2_PES        0x70    /* Periodic Interrupt Enable: */
+#define SH7750_RCR2_PES_DIS    0x00    /*   Periodic Interrupt Disabled */
+#define SH7750_RCR2_PES_DIV256 0x10    /*   Generated at 1/256 sec interval */
+#define SH7750_RCR2_PES_DIV64  0x20    /*   Generated at 1/64 sec interval */
+#define SH7750_RCR2_PES_DIV16  0x30    /*   Generated at 1/16 sec interval */
+#define SH7750_RCR2_PES_DIV4   0x40    /*   Generated at 1/4 sec interval */
+#define SH7750_RCR2_PES_DIV2   0x50    /*   Generated at 1/2 sec interval */
+#define SH7750_RCR2_PES_x1     0x60    /*   Generated at 1 sec interval */
+#define SH7750_RCR2_PES_x2     0x70    /*   Generated at 2 sec interval */
+#define SH7750_RCR2_RTCEN      0x08    /* RTC Crystal Oscillator is Operated */
+#define SH7750_RCR2_ADJ        0x04    /* 30-Second Adjastment */
+#define SH7750_RCR2_RESET      0x02    /* Frequency divider circuits are reset */
+#define SH7750_RCR2_START      0x01    /* 0 - sec, min, hr, day-of-week, month,
+                       year counters are stopped
+                       1 - sec, min, hr, day-of-week, month,
+                       year counters operate normally */
 /*
  * Bus State Controller - BSC
  */
 /* Bus Control Register 1 - BCR1 */
-#define SH7750_BCR1_REGOFS    0x800000	/* offset */
+#define SH7750_BCR1_REGOFS    0x800000    /* offset */
 #define SH7750_BCR1           SH7750_P4_REG32(SH7750_BCR1_REGOFS)
 #define SH7750_BCR1_A7        SH7750_A7_REG32(SH7750_BCR1_REGOFS)
-#define SH7750_BCR1_ENDIAN    0x80000000	/* Endianness (1 - little endian) */
-#define SH7750_BCR1_MASTER    0x40000000	/* Master/Slave mode (1-master) */
-#define SH7750_BCR1_A0MPX     0x20000000	/* Area 0 Memory Type (0-SRAM,1-MPX) */
-#define SH7750_BCR1_IPUP      0x02000000	/* Input Pin Pull-up Control:
-						   0 - pull-up resistor is on for
-						   control input pins
-						   1 - pull-up resistor is off */
-#define SH7750_BCR1_OPUP      0x01000000	/* Output Pin Pull-up Control:
-						   0 - pull-up resistor is on for
-						   control output pins
-						   1 - pull-up resistor is off */
-#define SH7750_BCR1_A1MBC     0x00200000	/* Area 1 SRAM Byte Control Mode:
-						   0 - Area 1 SRAM is set to
-						   normal mode
-						   1 - Area 1 SRAM is set to byte
-						   control mode */
-#define SH7750_BCR1_A4MBC     0x00100000	/* Area 4 SRAM Byte Control Mode:
-						   0 - Area 4 SRAM is set to
-						   normal mode
-						   1 - Area 4 SRAM is set to byte
-						   control mode */
-#define SH7750_BCR1_BREQEN    0x00080000	/* BREQ Enable:
-						   0 - External requests are  not
-						   accepted
-						   1 - External requests are
-						   accepted */
-#define SH7750_BCR1_PSHR      0x00040000	/* Partial Sharing Bit:
-						   0 - Master Mode
-						   1 - Partial-sharing Mode */
-#define SH7750_BCR1_MEMMPX    0x00020000	/* Area 1 to 6 MPX Interface:
-						   0 - SRAM/burst ROM interface
-						   1 - MPX interface */
-#define SH7750_BCR1_HIZMEM    0x00008000	/* High Impendance Control. Specifies
-						   the state of A[25:0], BS\, CSn\,
-						   RD/WR\, CE2A\, CE2B\ in standby
-						   mode and when bus is released:
-						   0 - signals go to High-Z mode
-						   1 - signals driven */
-#define SH7750_BCR1_HIZCNT    0x00004000	/* High Impendance Control. Specifies
-						   the state of the RAS\, RAS2\, WEn\,
-						   CASn\, DQMn, RD\, CASS\, FRAME\,
-						   RD2\ signals in standby mode and
-						   when bus is released:
-						   0 - signals go to High-Z mode
-						   1 - signals driven */
-#define SH7750_BCR1_A0BST     0x00003800	/* Area 0 Burst ROM Control */
-#define SH7750_BCR1_A0BST_SRAM    0x0000	/*   Area 0 accessed as SRAM i/f */
-#define SH7750_BCR1_A0BST_ROM4    0x0800	/*   Area 0 accessed as burst ROM
-						   interface, 4 cosequtive access */
-#define SH7750_BCR1_A0BST_ROM8    0x1000	/*   Area 0 accessed as burst ROM
-						   interface, 8 cosequtive access */
-#define SH7750_BCR1_A0BST_ROM16   0x1800	/*   Area 0 accessed as burst ROM
-						   interface, 16 cosequtive access */
-#define SH7750_BCR1_A0BST_ROM32   0x2000	/*   Area 0 accessed as burst ROM
-						   interface, 32 cosequtive access */
-
-#define SH7750_BCR1_A5BST     0x00000700	/* Area 5 Burst ROM Control */
-#define SH7750_BCR1_A5BST_SRAM    0x0000	/*   Area 5 accessed as SRAM i/f */
-#define SH7750_BCR1_A5BST_ROM4    0x0100	/*   Area 5 accessed as burst ROM
-						   interface, 4 cosequtive access */
-#define SH7750_BCR1_A5BST_ROM8    0x0200	/*   Area 5 accessed as burst ROM
-						   interface, 8 cosequtive access */
-#define SH7750_BCR1_A5BST_ROM16   0x0300	/*   Area 5 accessed as burst ROM
-						   interface, 16 cosequtive access */
-#define SH7750_BCR1_A5BST_ROM32   0x0400	/*   Area 5 accessed as burst ROM
-						   interface, 32 cosequtive access */
-
-#define SH7750_BCR1_A6BST     0x000000E0	/* Area 6 Burst ROM Control */
-#define SH7750_BCR1_A6BST_SRAM    0x0000	/*   Area 6 accessed as SRAM i/f */
-#define SH7750_BCR1_A6BST_ROM4    0x0020	/*   Area 6 accessed as burst ROM
-						   interface, 4 cosequtive access */
-#define SH7750_BCR1_A6BST_ROM8    0x0040	/*   Area 6 accessed as burst ROM
-						   interface, 8 cosequtive access */
-#define SH7750_BCR1_A6BST_ROM16   0x0060	/*   Area 6 accessed as burst ROM
-						   interface, 16 cosequtive access */
-#define SH7750_BCR1_A6BST_ROM32   0x0080	/*   Area 6 accessed as burst ROM
-						   interface, 32 cosequtive access */
-
-#define SH7750_BCR1_DRAMTP        0x001C	/* Area 2 and 3 Memory Type */
-#define SH7750_BCR1_DRAMTP_2SRAM_3SRAM   0x0000	/* Area 2 and 3 are SRAM or MPX
-						   interface. */
-#define SH7750_BCR1_DRAMTP_2SRAM_3SDRAM  0x0008	/* Area 2 - SRAM/MPX, Area 3 -
-						   synchronous DRAM */
-#define SH7750_BCR1_DRAMTP_2SDRAM_3SDRAM 0x000C	/* Area 2 and 3 are synchronous
-						   DRAM interface */
-#define SH7750_BCR1_DRAMTP_2SRAM_3DRAM   0x0010	/* Area 2 - SRAM/MPX, Area 3 -
-						   DRAM interface */
-#define SH7750_BCR1_DRAMTP_2DRAM_3DRAM   0x0014	/* Area 2 and 3 are DRAM
-						   interface */
-
-#define SH7750_BCR1_A56PCM    0x00000001	/* Area 5 and 6 Bus Type:
-						   0 - SRAM interface
-						   1 - PCMCIA interface */
+#define SH7750_BCR1_ENDIAN    0x80000000    /* Endianness (1 - little endian) */
+#define SH7750_BCR1_MASTER    0x40000000    /* Master/Slave mode (1-master) */
+#define SH7750_BCR1_A0MPX     0x20000000    /* Area 0 Memory Type (0-SRAM,1-MPX) */
+#define SH7750_BCR1_IPUP      0x02000000    /* Input Pin Pull-up Control:
+                           0 - pull-up resistor is on for
+                           control input pins
+                           1 - pull-up resistor is off */
+#define SH7750_BCR1_OPUP      0x01000000    /* Output Pin Pull-up Control:
+                           0 - pull-up resistor is on for
+                           control output pins
+                           1 - pull-up resistor is off */
+#define SH7750_BCR1_A1MBC     0x00200000    /* Area 1 SRAM Byte Control Mode:
+                           0 - Area 1 SRAM is set to
+                           normal mode
+                           1 - Area 1 SRAM is set to byte
+                           control mode */
+#define SH7750_BCR1_A4MBC     0x00100000    /* Area 4 SRAM Byte Control Mode:
+                           0 - Area 4 SRAM is set to
+                           normal mode
+                           1 - Area 4 SRAM is set to byte
+                           control mode */
+#define SH7750_BCR1_BREQEN    0x00080000    /* BREQ Enable:
+                           0 - External requests are  not
+                           accepted
+                           1 - External requests are
+                           accepted */
+#define SH7750_BCR1_PSHR      0x00040000    /* Partial Sharing Bit:
+                           0 - Master Mode
+                           1 - Partial-sharing Mode */
+#define SH7750_BCR1_MEMMPX    0x00020000    /* Area 1 to 6 MPX Interface:
+                           0 - SRAM/burst ROM interface
+                           1 - MPX interface */
+#define SH7750_BCR1_HIZMEM    0x00008000    /* High Impendance Control. Specifies
+                           the state of A[25:0], BS\, CSn\,
+                           RD/WR\, CE2A\, CE2B\ in standby
+                           mode and when bus is released:
+                           0 - signals go to High-Z mode
+                           1 - signals driven */
+#define SH7750_BCR1_HIZCNT    0x00004000    /* High Impendance Control. Specifies
+                           the state of the RAS\, RAS2\, WEn\,
+                           CASn\, DQMn, RD\, CASS\, FRAME\,
+                           RD2\ signals in standby mode and
+                           when bus is released:
+                           0 - signals go to High-Z mode
+                           1 - signals driven */
+#define SH7750_BCR1_A0BST     0x00003800    /* Area 0 Burst ROM Control */
+#define SH7750_BCR1_A0BST_SRAM    0x0000    /*   Area 0 accessed as SRAM i/f */
+#define SH7750_BCR1_A0BST_ROM4    0x0800    /*   Area 0 accessed as burst ROM
+                           interface, 4 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM8    0x1000    /*   Area 0 accessed as burst ROM
+                           interface, 8 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM16   0x1800    /*   Area 0 accessed as burst ROM
+                           interface, 16 cosequtive access */
+#define SH7750_BCR1_A0BST_ROM32   0x2000    /*   Area 0 accessed as burst ROM
+                           interface, 32 cosequtive access */
+
+#define SH7750_BCR1_A5BST     0x00000700    /* Area 5 Burst ROM Control */
+#define SH7750_BCR1_A5BST_SRAM    0x0000    /*   Area 5 accessed as SRAM i/f */
+#define SH7750_BCR1_A5BST_ROM4    0x0100    /*   Area 5 accessed as burst ROM
+                           interface, 4 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM8    0x0200    /*   Area 5 accessed as burst ROM
+                           interface, 8 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM16   0x0300    /*   Area 5 accessed as burst ROM
+                           interface, 16 cosequtive access */
+#define SH7750_BCR1_A5BST_ROM32   0x0400    /*   Area 5 accessed as burst ROM
+                           interface, 32 cosequtive access */
+
+#define SH7750_BCR1_A6BST     0x000000E0    /* Area 6 Burst ROM Control */
+#define SH7750_BCR1_A6BST_SRAM    0x0000    /*   Area 6 accessed as SRAM i/f */
+#define SH7750_BCR1_A6BST_ROM4    0x0020    /*   Area 6 accessed as burst ROM
+                           interface, 4 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM8    0x0040    /*   Area 6 accessed as burst ROM
+                           interface, 8 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM16   0x0060    /*   Area 6 accessed as burst ROM
+                           interface, 16 cosequtive access */
+#define SH7750_BCR1_A6BST_ROM32   0x0080    /*   Area 6 accessed as burst ROM
+                           interface, 32 cosequtive access */
+
+#define SH7750_BCR1_DRAMTP        0x001C    /* Area 2 and 3 Memory Type */
+#define SH7750_BCR1_DRAMTP_2SRAM_3SRAM   0x0000    /* Area 2 and 3 are SRAM or MPX
+                           interface. */
+#define SH7750_BCR1_DRAMTP_2SRAM_3SDRAM  0x0008    /* Area 2 - SRAM/MPX, Area 3 -
+                           synchronous DRAM */
+#define SH7750_BCR1_DRAMTP_2SDRAM_3SDRAM 0x000C    /* Area 2 and 3 are synchronous
+                           DRAM interface */
+#define SH7750_BCR1_DRAMTP_2SRAM_3DRAM   0x0010    /* Area 2 - SRAM/MPX, Area 3 -
+                           DRAM interface */
+#define SH7750_BCR1_DRAMTP_2DRAM_3DRAM   0x0014    /* Area 2 and 3 are DRAM
+                           interface */
+
+#define SH7750_BCR1_A56PCM    0x00000001    /* Area 5 and 6 Bus Type:
+                           0 - SRAM interface
+                           1 - PCMCIA interface */
 
 /* Bus Control Register 2 (half) - BCR2 */
-#define SH7750_BCR2_REGOFS    0x800004	/* offset */
+#define SH7750_BCR2_REGOFS    0x800004    /* offset */
 #define SH7750_BCR2           SH7750_P4_REG32(SH7750_BCR2_REGOFS)
 #define SH7750_BCR2_A7        SH7750_A7_REG32(SH7750_BCR2_REGOFS)
 
-#define SH7750_BCR2_A0SZ      0xC000	/* Area 0 Bus Width */
+#define SH7750_BCR2_A0SZ      0xC000    /* Area 0 Bus Width */
 #define SH7750_BCR2_A0SZ_S    14
-#define SH7750_BCR2_A6SZ      0x3000	/* Area 6 Bus Width */
+#define SH7750_BCR2_A6SZ      0x3000    /* Area 6 Bus Width */
 #define SH7750_BCR2_A6SZ_S    12
-#define SH7750_BCR2_A5SZ      0x0C00	/* Area 5 Bus Width */
+#define SH7750_BCR2_A5SZ      0x0C00    /* Area 5 Bus Width */
 #define SH7750_BCR2_A5SZ_S    10
-#define SH7750_BCR2_A4SZ      0x0300	/* Area 4 Bus Width */
+#define SH7750_BCR2_A4SZ      0x0300    /* Area 4 Bus Width */
 #define SH7750_BCR2_A4SZ_S    8
-#define SH7750_BCR2_A3SZ      0x00C0	/* Area 3 Bus Width */
+#define SH7750_BCR2_A3SZ      0x00C0    /* Area 3 Bus Width */
 #define SH7750_BCR2_A3SZ_S    6
-#define SH7750_BCR2_A2SZ      0x0030	/* Area 2 Bus Width */
+#define SH7750_BCR2_A2SZ      0x0030    /* Area 2 Bus Width */
 #define SH7750_BCR2_A2SZ_S    4
-#define SH7750_BCR2_A1SZ      0x000C	/* Area 1 Bus Width */
+#define SH7750_BCR2_A1SZ      0x000C    /* Area 1 Bus Width */
 #define SH7750_BCR2_A1SZ_S    2
-#define SH7750_BCR2_SZ_64     0	/* 64 bits */
-#define SH7750_BCR2_SZ_8      1	/* 8 bits */
-#define SH7750_BCR2_SZ_16     2	/* 16 bits */
-#define SH7750_BCR2_SZ_32     3	/* 32 bits */
-#define SH7750_BCR2_PORTEN    0x0001	/* Port Function Enable :
-					   0 - D51-D32 are not used as a port
-					   1 - D51-D32 are used as a port */
+#define SH7750_BCR2_SZ_64     0    /* 64 bits */
+#define SH7750_BCR2_SZ_8      1    /* 8 bits */
+#define SH7750_BCR2_SZ_16     2    /* 16 bits */
+#define SH7750_BCR2_SZ_32     3    /* 32 bits */
+#define SH7750_BCR2_PORTEN    0x0001    /* Port Function Enable :
+                       0 - D51-D32 are not used as a port
+                       1 - D51-D32 are used as a port */
 
 /* Wait Control Register 1 - WCR1 */
-#define SH7750_WCR1_REGOFS    0x800008	/* offset */
+#define SH7750_WCR1_REGOFS    0x800008    /* offset */
 #define SH7750_WCR1           SH7750_P4_REG32(SH7750_WCR1_REGOFS)
 #define SH7750_WCR1_A7        SH7750_A7_REG32(SH7750_WCR1_REGOFS)
-#define SH7750_WCR1_DMAIW     0x70000000	/* DACK Device Inter-Cycle Idle
-						   specification */
+#define SH7750_WCR1_DMAIW     0x70000000    /* DACK Device Inter-Cycle Idle
+                           specification */
 #define SH7750_WCR1_DMAIW_S   28
-#define SH7750_WCR1_A6IW      0x07000000	/* Area 6 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A6IW      0x07000000    /* Area 6 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A6IW_S    24
-#define SH7750_WCR1_A5IW      0x00700000	/* Area 5 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A5IW      0x00700000    /* Area 5 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A5IW_S    20
-#define SH7750_WCR1_A4IW      0x00070000	/* Area 4 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A4IW      0x00070000    /* Area 4 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A4IW_S    16
-#define SH7750_WCR1_A3IW      0x00007000	/* Area 3 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A3IW      0x00007000    /* Area 3 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A3IW_S    12
-#define SH7750_WCR1_A2IW      0x00000700	/* Area 2 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A2IW      0x00000700    /* Area 2 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A2IW_S    8
-#define SH7750_WCR1_A1IW      0x00000070	/* Area 1 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A1IW      0x00000070    /* Area 1 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A1IW_S    4
-#define SH7750_WCR1_A0IW      0x00000007	/* Area 0 Inter-Cycle Idle spec. */
+#define SH7750_WCR1_A0IW      0x00000007    /* Area 0 Inter-Cycle Idle spec. */
 #define SH7750_WCR1_A0IW_S    0
 
 /* Wait Control Register 2 - WCR2 */
-#define SH7750_WCR2_REGOFS    0x80000C	/* offset */
+#define SH7750_WCR2_REGOFS    0x80000C    /* offset */
 #define SH7750_WCR2           SH7750_P4_REG32(SH7750_WCR2_REGOFS)
 #define SH7750_WCR2_A7        SH7750_A7_REG32(SH7750_WCR2_REGOFS)
 
-#define SH7750_WCR2_A6W       0xE0000000	/* Area 6 Wait Control */
+#define SH7750_WCR2_A6W       0xE0000000    /* Area 6 Wait Control */
 #define SH7750_WCR2_A6W_S     29
-#define SH7750_WCR2_A6B       0x1C000000	/* Area 6 Burst Pitch */
+#define SH7750_WCR2_A6B       0x1C000000    /* Area 6 Burst Pitch */
 #define SH7750_WCR2_A6B_S     26
-#define SH7750_WCR2_A5W       0x03800000	/* Area 5 Wait Control */
+#define SH7750_WCR2_A5W       0x03800000    /* Area 5 Wait Control */
 #define SH7750_WCR2_A5W_S     23
-#define SH7750_WCR2_A5B       0x00700000	/* Area 5 Burst Pitch */
+#define SH7750_WCR2_A5B       0x00700000    /* Area 5 Burst Pitch */
 #define SH7750_WCR2_A5B_S     20
-#define SH7750_WCR2_A4W       0x000E0000	/* Area 4 Wait Control */
+#define SH7750_WCR2_A4W       0x000E0000    /* Area 4 Wait Control */
 #define SH7750_WCR2_A4W_S     17
-#define SH7750_WCR2_A3W       0x0000E000	/* Area 3 Wait Control */
+#define SH7750_WCR2_A3W       0x0000E000    /* Area 3 Wait Control */
 #define SH7750_WCR2_A3W_S     13
-#define SH7750_WCR2_A2W       0x00000E00	/* Area 2 Wait Control */
+#define SH7750_WCR2_A2W       0x00000E00    /* Area 2 Wait Control */
 #define SH7750_WCR2_A2W_S     9
-#define SH7750_WCR2_A1W       0x000001C0	/* Area 1 Wait Control */
+#define SH7750_WCR2_A1W       0x000001C0    /* Area 1 Wait Control */
 #define SH7750_WCR2_A1W_S     6
-#define SH7750_WCR2_A0W       0x00000038	/* Area 0 Wait Control */
+#define SH7750_WCR2_A0W       0x00000038    /* Area 0 Wait Control */
 #define SH7750_WCR2_A0W_S     3
-#define SH7750_WCR2_A0B       0x00000007	/* Area 0 Burst Pitch */
+#define SH7750_WCR2_A0B       0x00000007    /* Area 0 Burst Pitch */
 #define SH7750_WCR2_A0B_S     0
 
-#define SH7750_WCR2_WS0       0	/* 0 wait states inserted */
-#define SH7750_WCR2_WS1       1	/* 1 wait states inserted */
-#define SH7750_WCR2_WS2       2	/* 2 wait states inserted */
-#define SH7750_WCR2_WS3       3	/* 3 wait states inserted */
-#define SH7750_WCR2_WS6       4	/* 6 wait states inserted */
-#define SH7750_WCR2_WS9       5	/* 9 wait states inserted */
-#define SH7750_WCR2_WS12      6	/* 12 wait states inserted */
-#define SH7750_WCR2_WS15      7	/* 15 wait states inserted */
-
-#define SH7750_WCR2_BPWS0     0	/* 0 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS1     1	/* 1 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS2     2	/* 2 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS3     3	/* 3 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS4     4	/* 4 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS5     5	/* 5 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS6     6	/* 6 wait states inserted from 2nd access */
-#define SH7750_WCR2_BPWS7     7	/* 7 wait states inserted from 2nd access */
+#define SH7750_WCR2_WS0       0    /* 0 wait states inserted */
+#define SH7750_WCR2_WS1       1    /* 1 wait states inserted */
+#define SH7750_WCR2_WS2       2    /* 2 wait states inserted */
+#define SH7750_WCR2_WS3       3    /* 3 wait states inserted */
+#define SH7750_WCR2_WS6       4    /* 6 wait states inserted */
+#define SH7750_WCR2_WS9       5    /* 9 wait states inserted */
+#define SH7750_WCR2_WS12      6    /* 12 wait states inserted */
+#define SH7750_WCR2_WS15      7    /* 15 wait states inserted */
+
+#define SH7750_WCR2_BPWS0     0    /* 0 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS1     1    /* 1 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS2     2    /* 2 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS3     3    /* 3 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS4     4    /* 4 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS5     5    /* 5 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS6     6    /* 6 wait states inserted from 2nd access */
+#define SH7750_WCR2_BPWS7     7    /* 7 wait states inserted from 2nd access */
 
 /* DRAM CAS\ Assertion Delay (area 3,2) */
-#define SH7750_WCR2_DRAM_CAS_ASW1   0	/* 1 cycle */
-#define SH7750_WCR2_DRAM_CAS_ASW2   1	/* 2 cycles */
-#define SH7750_WCR2_DRAM_CAS_ASW3   2	/* 3 cycles */
-#define SH7750_WCR2_DRAM_CAS_ASW4   3	/* 4 cycles */
-#define SH7750_WCR2_DRAM_CAS_ASW7   4	/* 7 cycles */
-#define SH7750_WCR2_DRAM_CAS_ASW10  5	/* 10 cycles */
-#define SH7750_WCR2_DRAM_CAS_ASW13  6	/* 13 cycles */
-#define SH7750_WCR2_DRAM_CAS_ASW16  7	/* 16 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW1   0    /* 1 cycle */
+#define SH7750_WCR2_DRAM_CAS_ASW2   1    /* 2 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW3   2    /* 3 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW4   3    /* 4 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW7   4    /* 7 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW10  5    /* 10 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW13  6    /* 13 cycles */
+#define SH7750_WCR2_DRAM_CAS_ASW16  7    /* 16 cycles */
 
 /* SDRAM CAS\ Latency Cycles */
-#define SH7750_WCR2_SDRAM_CAS_LAT1  1	/* 1 cycle */
-#define SH7750_WCR2_SDRAM_CAS_LAT2  2	/* 2 cycles */
-#define SH7750_WCR2_SDRAM_CAS_LAT3  3	/* 3 cycles */
-#define SH7750_WCR2_SDRAM_CAS_LAT4  4	/* 4 cycles */
-#define SH7750_WCR2_SDRAM_CAS_LAT5  5	/* 5 cycles */
+#define SH7750_WCR2_SDRAM_CAS_LAT1  1    /* 1 cycle */
+#define SH7750_WCR2_SDRAM_CAS_LAT2  2    /* 2 cycles */
+#define SH7750_WCR2_SDRAM_CAS_LAT3  3    /* 3 cycles */
+#define SH7750_WCR2_SDRAM_CAS_LAT4  4    /* 4 cycles */
+#define SH7750_WCR2_SDRAM_CAS_LAT5  5    /* 5 cycles */
 
 /* Wait Control Register 3 - WCR3 */
-#define SH7750_WCR3_REGOFS    0x800010	/* offset */
+#define SH7750_WCR3_REGOFS    0x800010    /* offset */
 #define SH7750_WCR3           SH7750_P4_REG32(SH7750_WCR3_REGOFS)
 #define SH7750_WCR3_A7        SH7750_A7_REG32(SH7750_WCR3_REGOFS)
 
-#define SH7750_WCR3_A6S       0x04000000	/* Area 6 Write Strobe Setup time */
-#define SH7750_WCR3_A6H       0x03000000	/* Area 6 Data Hold Time */
+#define SH7750_WCR3_A6S       0x04000000    /* Area 6 Write Strobe Setup time */
+#define SH7750_WCR3_A6H       0x03000000    /* Area 6 Data Hold Time */
 #define SH7750_WCR3_A6H_S     24
-#define SH7750_WCR3_A5S       0x00400000	/* Area 5 Write Strobe Setup time */
-#define SH7750_WCR3_A5H       0x00300000	/* Area 5 Data Hold Time */
+#define SH7750_WCR3_A5S       0x00400000    /* Area 5 Write Strobe Setup time */
+#define SH7750_WCR3_A5H       0x00300000    /* Area 5 Data Hold Time */
 #define SH7750_WCR3_A5H_S     20
-#define SH7750_WCR3_A4S       0x00040000	/* Area 4 Write Strobe Setup time */
-#define SH7750_WCR3_A4H       0x00030000	/* Area 4 Data Hold Time */
+#define SH7750_WCR3_A4S       0x00040000    /* Area 4 Write Strobe Setup time */
+#define SH7750_WCR3_A4H       0x00030000    /* Area 4 Data Hold Time */
 #define SH7750_WCR3_A4H_S     16
-#define SH7750_WCR3_A3S       0x00004000	/* Area 3 Write Strobe Setup time */
-#define SH7750_WCR3_A3H       0x00003000	/* Area 3 Data Hold Time */
+#define SH7750_WCR3_A3S       0x00004000    /* Area 3 Write Strobe Setup time */
+#define SH7750_WCR3_A3H       0x00003000    /* Area 3 Data Hold Time */
 #define SH7750_WCR3_A3H_S     12
-#define SH7750_WCR3_A2S       0x00000400	/* Area 2 Write Strobe Setup time */
-#define SH7750_WCR3_A2H       0x00000300	/* Area 2 Data Hold Time */
+#define SH7750_WCR3_A2S       0x00000400    /* Area 2 Write Strobe Setup time */
+#define SH7750_WCR3_A2H       0x00000300    /* Area 2 Data Hold Time */
 #define SH7750_WCR3_A2H_S     8
-#define SH7750_WCR3_A1S       0x00000040	/* Area 1 Write Strobe Setup time */
-#define SH7750_WCR3_A1H       0x00000030	/* Area 1 Data Hold Time */
+#define SH7750_WCR3_A1S       0x00000040    /* Area 1 Write Strobe Setup time */
+#define SH7750_WCR3_A1H       0x00000030    /* Area 1 Data Hold Time */
 #define SH7750_WCR3_A1H_S     4
-#define SH7750_WCR3_A0S       0x00000004	/* Area 0 Write Strobe Setup time */
-#define SH7750_WCR3_A0H       0x00000003	/* Area 0 Data Hold Time */
+#define SH7750_WCR3_A0S       0x00000004    /* Area 0 Write Strobe Setup time */
+#define SH7750_WCR3_A0H       0x00000003    /* Area 0 Data Hold Time */
 #define SH7750_WCR3_A0H_S     0
 
-#define SH7750_WCR3_DHWS_0    0	/* 0 wait states data hold time */
-#define SH7750_WCR3_DHWS_1    1	/* 1 wait states data hold time */
-#define SH7750_WCR3_DHWS_2    2	/* 2 wait states data hold time */
-#define SH7750_WCR3_DHWS_3    3	/* 3 wait states data hold time */
+#define SH7750_WCR3_DHWS_0    0    /* 0 wait states data hold time */
+#define SH7750_WCR3_DHWS_1    1    /* 1 wait states data hold time */
+#define SH7750_WCR3_DHWS_2    2    /* 2 wait states data hold time */
+#define SH7750_WCR3_DHWS_3    3    /* 3 wait states data hold time */
 
-#define SH7750_MCR_REGOFS     0x800014	/* offset */
+#define SH7750_MCR_REGOFS     0x800014    /* offset */
 #define SH7750_MCR            SH7750_P4_REG32(SH7750_MCR_REGOFS)
 #define SH7750_MCR_A7         SH7750_A7_REG32(SH7750_MCR_REGOFS)
 
-#define SH7750_MCR_RASD       0x80000000	/* RAS Down mode */
-#define SH7750_MCR_MRSET      0x40000000	/* SDRAM Mode Register Set */
-#define SH7750_MCR_PALL       0x00000000	/* SDRAM Precharge All cmd. Mode */
-#define SH7750_MCR_TRC        0x38000000	/* RAS Precharge Time at End of
-						   Refresh: */
-#define SH7750_MCR_TRC_0      0x00000000	/*    0 */
-#define SH7750_MCR_TRC_3      0x08000000	/*    3 */
-#define SH7750_MCR_TRC_6      0x10000000	/*    6 */
-#define SH7750_MCR_TRC_9      0x18000000	/*    9 */
-#define SH7750_MCR_TRC_12     0x20000000	/*    12 */
-#define SH7750_MCR_TRC_15     0x28000000	/*    15 */
-#define SH7750_MCR_TRC_18     0x30000000	/*    18 */
-#define SH7750_MCR_TRC_21     0x38000000	/*    21 */
-
-#define SH7750_MCR_TCAS       0x00800000	/* CAS Negation Period */
-#define SH7750_MCR_TCAS_1     0x00000000	/*    1 */
-#define SH7750_MCR_TCAS_2     0x00800000	/*    2 */
-
-#define SH7750_MCR_TPC        0x00380000	/* DRAM: RAS Precharge Period
-						   SDRAM: minimum number of cycles
-						   until the next bank active cmd
-						   is output after precharging */
+#define SH7750_MCR_RASD       0x80000000    /* RAS Down mode */
+#define SH7750_MCR_MRSET      0x40000000    /* SDRAM Mode Register Set */
+#define SH7750_MCR_PALL       0x00000000    /* SDRAM Precharge All cmd. Mode */
+#define SH7750_MCR_TRC        0x38000000    /* RAS Precharge Time at End of
+                           Refresh: */
+#define SH7750_MCR_TRC_0      0x00000000    /*    0 */
+#define SH7750_MCR_TRC_3      0x08000000    /*    3 */
+#define SH7750_MCR_TRC_6      0x10000000    /*    6 */
+#define SH7750_MCR_TRC_9      0x18000000    /*    9 */
+#define SH7750_MCR_TRC_12     0x20000000    /*    12 */
+#define SH7750_MCR_TRC_15     0x28000000    /*    15 */
+#define SH7750_MCR_TRC_18     0x30000000    /*    18 */
+#define SH7750_MCR_TRC_21     0x38000000    /*    21 */
+
+#define SH7750_MCR_TCAS       0x00800000    /* CAS Negation Period */
+#define SH7750_MCR_TCAS_1     0x00000000    /*    1 */
+#define SH7750_MCR_TCAS_2     0x00800000    /*    2 */
+
+#define SH7750_MCR_TPC        0x00380000    /* DRAM: RAS Precharge Period
+                           SDRAM: minimum number of cycles
+                           until the next bank active cmd
+                           is output after precharging */
 #define SH7750_MCR_TPC_S      19
-#define SH7750_MCR_TPC_SDRAM_1 0x00000000	/* 1 cycle */
-#define SH7750_MCR_TPC_SDRAM_2 0x00080000	/* 2 cycles */
-#define SH7750_MCR_TPC_SDRAM_3 0x00100000	/* 3 cycles */
-#define SH7750_MCR_TPC_SDRAM_4 0x00180000	/* 4 cycles */
-#define SH7750_MCR_TPC_SDRAM_5 0x00200000	/* 5 cycles */
-#define SH7750_MCR_TPC_SDRAM_6 0x00280000	/* 6 cycles */
-#define SH7750_MCR_TPC_SDRAM_7 0x00300000	/* 7 cycles */
-#define SH7750_MCR_TPC_SDRAM_8 0x00380000	/* 8 cycles */
-
-#define SH7750_MCR_RCD        0x00030000	/* DRAM: RAS-CAS Assertion Delay time
-						   SDRAM: bank active-read/write cmd
-						   delay time */
-#define SH7750_MCR_RCD_DRAM_2  0x00000000	/* DRAM delay 2 clocks */
-#define SH7750_MCR_RCD_DRAM_3  0x00010000	/* DRAM delay 3 clocks */
-#define SH7750_MCR_RCD_DRAM_4  0x00020000	/* DRAM delay 4 clocks */
-#define SH7750_MCR_RCD_DRAM_5  0x00030000	/* DRAM delay 5 clocks */
-#define SH7750_MCR_RCD_SDRAM_2 0x00010000	/* DRAM delay 2 clocks */
-#define SH7750_MCR_RCD_SDRAM_3 0x00020000	/* DRAM delay 3 clocks */
-#define SH7750_MCR_RCD_SDRAM_4 0x00030000	/* DRAM delay 4 clocks */
-
-#define SH7750_MCR_TRWL       0x0000E000	/* SDRAM Write Precharge Delay */
-#define SH7750_MCR_TRWL_1     0x00000000	/*    1 */
-#define SH7750_MCR_TRWL_2     0x00002000	/*    2 */
-#define SH7750_MCR_TRWL_3     0x00004000	/*    3 */
-#define SH7750_MCR_TRWL_4     0x00006000	/*    4 */
-#define SH7750_MCR_TRWL_5     0x00008000	/*    5 */
-
-#define SH7750_MCR_TRAS       0x00001C00	/* DRAM: CAS-Before-RAS Refresh RAS
-						   asserting period
-						   SDRAM: Command interval after
-						   synchronous DRAM refresh */
-#define SH7750_MCR_TRAS_DRAM_2         0x00000000	/* 2 */
-#define SH7750_MCR_TRAS_DRAM_3         0x00000400	/* 3 */
-#define SH7750_MCR_TRAS_DRAM_4         0x00000800	/* 4 */
-#define SH7750_MCR_TRAS_DRAM_5         0x00000C00	/* 5 */
-#define SH7750_MCR_TRAS_DRAM_6         0x00001000	/* 6 */
-#define SH7750_MCR_TRAS_DRAM_7         0x00001400	/* 7 */
-#define SH7750_MCR_TRAS_DRAM_8         0x00001800	/* 8 */
-#define SH7750_MCR_TRAS_DRAM_9         0x00001C00	/* 9 */
-
-#define SH7750_MCR_TRAS_SDRAM_TRC_4    0x00000000	/* 4 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_5    0x00000400	/* 5 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_6    0x00000800	/* 6 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_7    0x00000C00	/* 7 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_8    0x00001000	/* 8 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_9    0x00001400	/* 9 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_10   0x00001800	/* 10 + TRC */
-#define SH7750_MCR_TRAS_SDRAM_TRC_11   0x00001C00	/* 11 + TRC */
-
-#define SH7750_MCR_BE         0x00000200	/* Burst Enable */
-#define SH7750_MCR_SZ         0x00000180	/* Memory Data Size */
-#define SH7750_MCR_SZ_64      0x00000000	/*    64 bits */
-#define SH7750_MCR_SZ_16      0x00000100	/*    16 bits */
-#define SH7750_MCR_SZ_32      0x00000180	/*    32 bits */
-
-#define SH7750_MCR_AMX        0x00000078	/* Address Multiplexing */
+#define SH7750_MCR_TPC_SDRAM_1 0x00000000    /* 1 cycle */
+#define SH7750_MCR_TPC_SDRAM_2 0x00080000    /* 2 cycles */
+#define SH7750_MCR_TPC_SDRAM_3 0x00100000    /* 3 cycles */
+#define SH7750_MCR_TPC_SDRAM_4 0x00180000    /* 4 cycles */
+#define SH7750_MCR_TPC_SDRAM_5 0x00200000    /* 5 cycles */
+#define SH7750_MCR_TPC_SDRAM_6 0x00280000    /* 6 cycles */
+#define SH7750_MCR_TPC_SDRAM_7 0x00300000    /* 7 cycles */
+#define SH7750_MCR_TPC_SDRAM_8 0x00380000    /* 8 cycles */
+
+#define SH7750_MCR_RCD        0x00030000    /* DRAM: RAS-CAS Assertion Delay time
+                           SDRAM: bank active-read/write cmd
+                           delay time */
+#define SH7750_MCR_RCD_DRAM_2  0x00000000    /* DRAM delay 2 clocks */
+#define SH7750_MCR_RCD_DRAM_3  0x00010000    /* DRAM delay 3 clocks */
+#define SH7750_MCR_RCD_DRAM_4  0x00020000    /* DRAM delay 4 clocks */
+#define SH7750_MCR_RCD_DRAM_5  0x00030000    /* DRAM delay 5 clocks */
+#define SH7750_MCR_RCD_SDRAM_2 0x00010000    /* DRAM delay 2 clocks */
+#define SH7750_MCR_RCD_SDRAM_3 0x00020000    /* DRAM delay 3 clocks */
+#define SH7750_MCR_RCD_SDRAM_4 0x00030000    /* DRAM delay 4 clocks */
+
+#define SH7750_MCR_TRWL       0x0000E000    /* SDRAM Write Precharge Delay */
+#define SH7750_MCR_TRWL_1     0x00000000    /*    1 */
+#define SH7750_MCR_TRWL_2     0x00002000    /*    2 */
+#define SH7750_MCR_TRWL_3     0x00004000    /*    3 */
+#define SH7750_MCR_TRWL_4     0x00006000    /*    4 */
+#define SH7750_MCR_TRWL_5     0x00008000    /*    5 */
+
+#define SH7750_MCR_TRAS       0x00001C00    /* DRAM: CAS-Before-RAS Refresh RAS
+                           asserting period
+                           SDRAM: Command interval after
+                           synchronous DRAM refresh */
+#define SH7750_MCR_TRAS_DRAM_2         0x00000000    /* 2 */
+#define SH7750_MCR_TRAS_DRAM_3         0x00000400    /* 3 */
+#define SH7750_MCR_TRAS_DRAM_4         0x00000800    /* 4 */
+#define SH7750_MCR_TRAS_DRAM_5         0x00000C00    /* 5 */
+#define SH7750_MCR_TRAS_DRAM_6         0x00001000    /* 6 */
+#define SH7750_MCR_TRAS_DRAM_7         0x00001400    /* 7 */
+#define SH7750_MCR_TRAS_DRAM_8         0x00001800    /* 8 */
+#define SH7750_MCR_TRAS_DRAM_9         0x00001C00    /* 9 */
+
+#define SH7750_MCR_TRAS_SDRAM_TRC_4    0x00000000    /* 4 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_5    0x00000400    /* 5 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_6    0x00000800    /* 6 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_7    0x00000C00    /* 7 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_8    0x00001000    /* 8 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_9    0x00001400    /* 9 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_10   0x00001800    /* 10 + TRC */
+#define SH7750_MCR_TRAS_SDRAM_TRC_11   0x00001C00    /* 11 + TRC */
+
+#define SH7750_MCR_BE         0x00000200    /* Burst Enable */
+#define SH7750_MCR_SZ         0x00000180    /* Memory Data Size */
+#define SH7750_MCR_SZ_64      0x00000000    /*    64 bits */
+#define SH7750_MCR_SZ_16      0x00000100    /*    16 bits */
+#define SH7750_MCR_SZ_32      0x00000180    /*    32 bits */
+
+#define SH7750_MCR_AMX        0x00000078    /* Address Multiplexing */
 #define SH7750_MCR_AMX_S      3
-#define SH7750_MCR_AMX_DRAM_8BIT_COL    0x00000000	/* 8-bit column addr */
-#define SH7750_MCR_AMX_DRAM_9BIT_COL    0x00000008	/* 9-bit column addr */
-#define SH7750_MCR_AMX_DRAM_10BIT_COL   0x00000010	/* 10-bit column addr */
-#define SH7750_MCR_AMX_DRAM_11BIT_COL   0x00000018	/* 11-bit column addr */
-#define SH7750_MCR_AMX_DRAM_12BIT_COL   0x00000020	/* 12-bit column addr */
+#define SH7750_MCR_AMX_DRAM_8BIT_COL    0x00000000    /* 8-bit column addr */
+#define SH7750_MCR_AMX_DRAM_9BIT_COL    0x00000008    /* 9-bit column addr */
+#define SH7750_MCR_AMX_DRAM_10BIT_COL   0x00000010    /* 10-bit column addr */
+#define SH7750_MCR_AMX_DRAM_11BIT_COL   0x00000018    /* 11-bit column addr */
+#define SH7750_MCR_AMX_DRAM_12BIT_COL   0x00000020    /* 12-bit column addr */
 /* See SH7750 Hardware Manual for SDRAM address multiplexor selection */
 
-#define SH7750_MCR_RFSH       0x00000004	/* Refresh Control */
-#define SH7750_MCR_RMODE      0x00000002	/* Refresh Mode: */
-#define SH7750_MCR_RMODE_NORMAL 0x00000000	/* Normal Refresh Mode */
-#define SH7750_MCR_RMODE_SELF   0x00000002	/* Self-Refresh Mode */
-#define SH7750_MCR_RMODE_EDO    0x00000001	/* EDO Mode */
+#define SH7750_MCR_RFSH       0x00000004    /* Refresh Control */
+#define SH7750_MCR_RMODE      0x00000002    /* Refresh Mode: */
+#define SH7750_MCR_RMODE_NORMAL 0x00000000    /* Normal Refresh Mode */
+#define SH7750_MCR_RMODE_SELF   0x00000002    /* Self-Refresh Mode */
+#define SH7750_MCR_RMODE_EDO    0x00000001    /* EDO Mode */
 
 /* SDRAM Mode Set address */
 #define SH7750_SDRAM_MODE_A2_BASE  0xFF900000
@@ -894,119 +894,119 @@
 
 
 /* PCMCIA Control Register (half) - PCR */
-#define SH7750_PCR_REGOFS     0x800018	/* offset */
+#define SH7750_PCR_REGOFS     0x800018    /* offset */
 #define SH7750_PCR            SH7750_P4_REG32(SH7750_PCR_REGOFS)
 #define SH7750_PCR_A7         SH7750_A7_REG32(SH7750_PCR_REGOFS)
 
-#define SH7750_PCR_A5PCW      0xC000	/* Area 5 PCMCIA Wait - Number of wait
-					   states to be added to the number of
-					   waits specified by WCR2 in a low-speed
-					   PCMCIA wait cycle */
-#define SH7750_PCR_A5PCW_0    0x0000	/*    0 waits inserted */
-#define SH7750_PCR_A5PCW_15   0x4000	/*    15 waits inserted */
-#define SH7750_PCR_A5PCW_30   0x8000	/*    30 waits inserted */
-#define SH7750_PCR_A5PCW_50   0xC000	/*    50 waits inserted */
-
-#define SH7750_PCR_A6PCW      0x3000	/* Area 6 PCMCIA Wait - Number of wait
-					   states to be added to the number of
-					   waits specified by WCR2 in a low-speed
-					   PCMCIA wait cycle */
-#define SH7750_PCR_A6PCW_0    0x0000	/*    0 waits inserted */
-#define SH7750_PCR_A6PCW_15   0x1000	/*    15 waits inserted */
-#define SH7750_PCR_A6PCW_30   0x2000	/*    30 waits inserted */
-#define SH7750_PCR_A6PCW_50   0x3000	/*    50 waits inserted */
-
-#define SH7750_PCR_A5TED      0x0E00	/* Area 5 Address-OE\/WE\ Assertion Delay,
-					   delay time from address output to
-					   OE\/WE\ assertion on the connected
-					   PCMCIA interface */
+#define SH7750_PCR_A5PCW      0xC000    /* Area 5 PCMCIA Wait - Number of wait
+                       states to be added to the number of
+                       waits specified by WCR2 in a low-speed
+                       PCMCIA wait cycle */
+#define SH7750_PCR_A5PCW_0    0x0000    /*    0 waits inserted */
+#define SH7750_PCR_A5PCW_15   0x4000    /*    15 waits inserted */
+#define SH7750_PCR_A5PCW_30   0x8000    /*    30 waits inserted */
+#define SH7750_PCR_A5PCW_50   0xC000    /*    50 waits inserted */
+
+#define SH7750_PCR_A6PCW      0x3000    /* Area 6 PCMCIA Wait - Number of wait
+                       states to be added to the number of
+                       waits specified by WCR2 in a low-speed
+                       PCMCIA wait cycle */
+#define SH7750_PCR_A6PCW_0    0x0000    /*    0 waits inserted */
+#define SH7750_PCR_A6PCW_15   0x1000    /*    15 waits inserted */
+#define SH7750_PCR_A6PCW_30   0x2000    /*    30 waits inserted */
+#define SH7750_PCR_A6PCW_50   0x3000    /*    50 waits inserted */
+
+#define SH7750_PCR_A5TED      0x0E00    /* Area 5 Address-OE\/WE\ Assertion Delay,
+                       delay time from address output to
+                       OE\/WE\ assertion on the connected
+                       PCMCIA interface */
 #define SH7750_PCR_A5TED_S    9
-#define SH7750_PCR_A6TED      0x01C0	/* Area 6 Address-OE\/WE\ Assertion Delay */
+#define SH7750_PCR_A6TED      0x01C0    /* Area 6 Address-OE\/WE\ Assertion Delay */
 #define SH7750_PCR_A6TED_S    6
 
-#define SH7750_PCR_TED_0WS    0	/* 0 Waits inserted */
-#define SH7750_PCR_TED_1WS    1	/* 1 Waits inserted */
-#define SH7750_PCR_TED_2WS    2	/* 2 Waits inserted */
-#define SH7750_PCR_TED_3WS    3	/* 3 Waits inserted */
-#define SH7750_PCR_TED_6WS    4	/* 6 Waits inserted */
-#define SH7750_PCR_TED_9WS    5	/* 9 Waits inserted */
-#define SH7750_PCR_TED_12WS   6	/* 12 Waits inserted */
-#define SH7750_PCR_TED_15WS   7	/* 15 Waits inserted */
-
-#define SH7750_PCR_A5TEH      0x0038	/* Area 5 OE\/WE\ Negation Address delay,
-					   address hold delay time from OE\/WE\
-					   negation in a write on the connected
-					   PCMCIA interface */
+#define SH7750_PCR_TED_0WS    0    /* 0 Waits inserted */
+#define SH7750_PCR_TED_1WS    1    /* 1 Waits inserted */
+#define SH7750_PCR_TED_2WS    2    /* 2 Waits inserted */
+#define SH7750_PCR_TED_3WS    3    /* 3 Waits inserted */
+#define SH7750_PCR_TED_6WS    4    /* 6 Waits inserted */
+#define SH7750_PCR_TED_9WS    5    /* 9 Waits inserted */
+#define SH7750_PCR_TED_12WS   6    /* 12 Waits inserted */
+#define SH7750_PCR_TED_15WS   7    /* 15 Waits inserted */
+
+#define SH7750_PCR_A5TEH      0x0038    /* Area 5 OE\/WE\ Negation Address delay,
+                       address hold delay time from OE\/WE\
+                       negation in a write on the connected
+                       PCMCIA interface */
 #define SH7750_PCR_A5TEH_S    3
 
-#define SH7750_PCR_A6TEH      0x0007	/* Area 6 OE\/WE\ Negation Address delay */
+#define SH7750_PCR_A6TEH      0x0007    /* Area 6 OE\/WE\ Negation Address delay */
 #define SH7750_PCR_A6TEH_S    0
 
-#define SH7750_PCR_TEH_0WS    0	/* 0 Waits inserted */
-#define SH7750_PCR_TEH_1WS    1	/* 1 Waits inserted */
-#define SH7750_PCR_TEH_2WS    2	/* 2 Waits inserted */
-#define SH7750_PCR_TEH_3WS    3	/* 3 Waits inserted */
-#define SH7750_PCR_TEH_6WS    4	/* 6 Waits inserted */
-#define SH7750_PCR_TEH_9WS    5	/* 9 Waits inserted */
-#define SH7750_PCR_TEH_12WS   6	/* 12 Waits inserted */
-#define SH7750_PCR_TEH_15WS   7	/* 15 Waits inserted */
+#define SH7750_PCR_TEH_0WS    0    /* 0 Waits inserted */
+#define SH7750_PCR_TEH_1WS    1    /* 1 Waits inserted */
+#define SH7750_PCR_TEH_2WS    2    /* 2 Waits inserted */
+#define SH7750_PCR_TEH_3WS    3    /* 3 Waits inserted */
+#define SH7750_PCR_TEH_6WS    4    /* 6 Waits inserted */
+#define SH7750_PCR_TEH_9WS    5    /* 9 Waits inserted */
+#define SH7750_PCR_TEH_12WS   6    /* 12 Waits inserted */
+#define SH7750_PCR_TEH_15WS   7    /* 15 Waits inserted */
 
 /* Refresh Timer Control/Status Register (half) - RTSCR */
-#define SH7750_RTCSR_REGOFS   0x80001C	/* offset */
+#define SH7750_RTCSR_REGOFS   0x80001C    /* offset */
 #define SH7750_RTCSR          SH7750_P4_REG32(SH7750_RTCSR_REGOFS)
 #define SH7750_RTCSR_A7       SH7750_A7_REG32(SH7750_RTCSR_REGOFS)
 
-#define SH7750_RTCSR_KEY      0xA500	/* RTCSR write key */
-#define SH7750_RTCSR_CMF      0x0080	/* Compare-Match Flag (indicates a
-					   match between the refresh timer
-					   counter and refresh time constant) */
-#define SH7750_RTCSR_CMIE     0x0040	/* Compare-Match Interrupt Enable */
-#define SH7750_RTCSR_CKS      0x0038	/* Refresh Counter Clock Selects */
-#define SH7750_RTCSR_CKS_DIS          0x0000	/* Clock Input Disabled */
-#define SH7750_RTCSR_CKS_CKIO_DIV4    0x0008	/* Bus Clock / 4 */
-#define SH7750_RTCSR_CKS_CKIO_DIV16   0x0010	/* Bus Clock / 16 */
-#define SH7750_RTCSR_CKS_CKIO_DIV64   0x0018	/* Bus Clock / 64 */
-#define SH7750_RTCSR_CKS_CKIO_DIV256  0x0020	/* Bus Clock / 256 */
-#define SH7750_RTCSR_CKS_CKIO_DIV1024 0x0028	/* Bus Clock / 1024 */
-#define SH7750_RTCSR_CKS_CKIO_DIV2048 0x0030	/* Bus Clock / 2048 */
-#define SH7750_RTCSR_CKS_CKIO_DIV4096 0x0038	/* Bus Clock / 4096 */
-
-#define SH7750_RTCSR_OVF      0x0004	/* Refresh Count Overflow Flag */
-#define SH7750_RTCSR_OVIE     0x0002	/* Refresh Count Overflow Interrupt
-					   Enable */
-#define SH7750_RTCSR_LMTS     0x0001	/* Refresh Count Overflow Limit Select */
-#define SH7750_RTCSR_LMTS_1024 0x0000	/* Count Limit is 1024 */
-#define SH7750_RTCSR_LMTS_512  0x0001	/* Count Limit is 512 */
+#define SH7750_RTCSR_KEY      0xA500    /* RTCSR write key */
+#define SH7750_RTCSR_CMF      0x0080    /* Compare-Match Flag (indicates a
+                       match between the refresh timer
+                       counter and refresh time constant) */
+#define SH7750_RTCSR_CMIE     0x0040    /* Compare-Match Interrupt Enable */
+#define SH7750_RTCSR_CKS      0x0038    /* Refresh Counter Clock Selects */
+#define SH7750_RTCSR_CKS_DIS          0x0000    /* Clock Input Disabled */
+#define SH7750_RTCSR_CKS_CKIO_DIV4    0x0008    /* Bus Clock / 4 */
+#define SH7750_RTCSR_CKS_CKIO_DIV16   0x0010    /* Bus Clock / 16 */
+#define SH7750_RTCSR_CKS_CKIO_DIV64   0x0018    /* Bus Clock / 64 */
+#define SH7750_RTCSR_CKS_CKIO_DIV256  0x0020    /* Bus Clock / 256 */
+#define SH7750_RTCSR_CKS_CKIO_DIV1024 0x0028    /* Bus Clock / 1024 */
+#define SH7750_RTCSR_CKS_CKIO_DIV2048 0x0030    /* Bus Clock / 2048 */
+#define SH7750_RTCSR_CKS_CKIO_DIV4096 0x0038    /* Bus Clock / 4096 */
+
+#define SH7750_RTCSR_OVF      0x0004    /* Refresh Count Overflow Flag */
+#define SH7750_RTCSR_OVIE     0x0002    /* Refresh Count Overflow Interrupt
+                       Enable */
+#define SH7750_RTCSR_LMTS     0x0001    /* Refresh Count Overflow Limit Select */
+#define SH7750_RTCSR_LMTS_1024 0x0000    /* Count Limit is 1024 */
+#define SH7750_RTCSR_LMTS_512  0x0001    /* Count Limit is 512 */
 
 /* Refresh Timer Counter (half) - RTCNT */
-#define SH7750_RTCNT_REGOFS   0x800020	/* offset */
+#define SH7750_RTCNT_REGOFS   0x800020    /* offset */
 #define SH7750_RTCNT          SH7750_P4_REG32(SH7750_RTCNT_REGOFS)
 #define SH7750_RTCNT_A7       SH7750_A7_REG32(SH7750_RTCNT_REGOFS)
 
-#define SH7750_RTCNT_KEY      0xA500	/* RTCNT write key */
+#define SH7750_RTCNT_KEY      0xA500    /* RTCNT write key */
 
 /* Refresh Time Constant Register (half) - RTCOR */
-#define SH7750_RTCOR_REGOFS   0x800024	/* offset */
+#define SH7750_RTCOR_REGOFS   0x800024    /* offset */
 #define SH7750_RTCOR          SH7750_P4_REG32(SH7750_RTCOR_REGOFS)
 #define SH7750_RTCOR_A7       SH7750_A7_REG32(SH7750_RTCOR_REGOFS)
 
-#define SH7750_RTCOR_KEY      0xA500	/* RTCOR write key */
+#define SH7750_RTCOR_KEY      0xA500    /* RTCOR write key */
 
 /* Refresh Count Register (half) - RFCR */
-#define SH7750_RFCR_REGOFS    0x800028	/* offset */
+#define SH7750_RFCR_REGOFS    0x800028    /* offset */
 #define SH7750_RFCR           SH7750_P4_REG32(SH7750_RFCR_REGOFS)
 #define SH7750_RFCR_A7        SH7750_A7_REG32(SH7750_RFCR_REGOFS)
 
-#define SH7750_RFCR_KEY       0xA400	/* RFCR write key */
+#define SH7750_RFCR_KEY       0xA400    /* RFCR write key */
 
 /* Synchronous DRAM mode registers - SDMR */
-#define SH7750_SDMR2_REGOFS   0x900000	/* base offset */
-#define SH7750_SDMR2_REGNB    0x0FFC	/* nb of register */
+#define SH7750_SDMR2_REGOFS   0x900000    /* base offset */
+#define SH7750_SDMR2_REGNB    0x0FFC    /* nb of register */
 #define SH7750_SDMR2          SH7750_P4_REG32(SH7750_SDMR2_REGOFS)
 #define SH7750_SDMR2_A7       SH7750_A7_REG32(SH7750_SDMR2_REGOFS)
 
-#define SH7750_SDMR3_REGOFS   0x940000	/* offset */
-#define SH7750_SDMR3_REGNB    0x0FFC	/* nb of register */
+#define SH7750_SDMR3_REGOFS   0x940000    /* offset */
+#define SH7750_SDMR3_REGNB    0x0FFC    /* nb of register */
 #define SH7750_SDMR3          SH7750_P4_REG32(SH7750_SDMR3_REGOFS)
 #define SH7750_SDMR3_A7       SH7750_A7_REG32(SH7750_SDMR3_REGOFS)
 
@@ -1015,7 +1015,7 @@
  */
 
 /* DMA Source Address Register - SAR0, SAR1, SAR2, SAR3 */
-#define SH7750_SAR_REGOFS(n)  (0xA00000 + ((n)*16))	/* offset */
+#define SH7750_SAR_REGOFS(n)  (0xA00000 + ((n)*16))    /* offset */
 #define SH7750_SAR(n)         SH7750_P4_REG32(SH7750_SAR_REGOFS(n))
 #define SH7750_SAR_A7(n)      SH7750_A7_REG32(SH7750_SAR_REGOFS(n))
 #define SH7750_SAR0           SH7750_SAR(0)
@@ -1028,7 +1028,7 @@
 #define SH7750_SAR3_A7        SH7750_SAR_A7(3)
 
 /* DMA Destination Address Register - DAR0, DAR1, DAR2, DAR3 */
-#define SH7750_DAR_REGOFS(n)  (0xA00004 + ((n)*16))	/* offset */
+#define SH7750_DAR_REGOFS(n)  (0xA00004 + ((n)*16))    /* offset */
 #define SH7750_DAR(n)         SH7750_P4_REG32(SH7750_DAR_REGOFS(n))
 #define SH7750_DAR_A7(n)      SH7750_A7_REG32(SH7750_DAR_REGOFS(n))
 #define SH7750_DAR0           SH7750_DAR(0)
@@ -1041,7 +1041,7 @@
 #define SH7750_DAR3_A7        SH7750_DAR_A7(3)
 
 /* DMA Transfer Count Register - DMATCR0, DMATCR1, DMATCR2, DMATCR3 */
-#define SH7750_DMATCR_REGOFS(n)  (0xA00008 + ((n)*16))	/* offset */
+#define SH7750_DMATCR_REGOFS(n)  (0xA00008 + ((n)*16))    /* offset */
 #define SH7750_DMATCR(n)      SH7750_P4_REG32(SH7750_DMATCR_REGOFS(n))
 #define SH7750_DMATCR_A7(n)   SH7750_A7_REG32(SH7750_DMATCR_REGOFS(n))
 #define SH7750_DMATCR0_P4     SH7750_DMATCR(0)
@@ -1054,7 +1054,7 @@
 #define SH7750_DMATCR3_A7     SH7750_DMATCR_A7(3)
 
 /* DMA Channel Control Register - CHCR0, CHCR1, CHCR2, CHCR3 */
-#define SH7750_CHCR_REGOFS(n)  (0xA0000C + ((n)*16))	/* offset */
+#define SH7750_CHCR_REGOFS(n)  (0xA0000C + ((n)*16))    /* offset */
 #define SH7750_CHCR(n)        SH7750_P4_REG32(SH7750_CHCR_REGOFS(n))
 #define SH7750_CHCR_A7(n)     SH7750_A7_REG32(SH7750_CHCR_REGOFS(n))
 #define SH7750_CHCR0          SH7750_CHCR(0)
@@ -1066,227 +1066,227 @@
 #define SH7750_CHCR2_A7       SH7750_CHCR_A7(2)
 #define SH7750_CHCR3_A7       SH7750_CHCR_A7(3)
 
-#define SH7750_CHCR_SSA       0xE0000000	/* Source Address Space Attribute */
-#define SH7750_CHCR_SSA_PCMCIA  0x00000000	/* Reserved in PCMCIA access */
-#define SH7750_CHCR_SSA_DYNBSZ  0x20000000	/* Dynamic Bus Sizing I/O space */
-#define SH7750_CHCR_SSA_IO8     0x40000000	/* 8-bit I/O space */
-#define SH7750_CHCR_SSA_IO16    0x60000000	/* 16-bit I/O space */
-#define SH7750_CHCR_SSA_CMEM8   0x80000000	/* 8-bit common memory space */
-#define SH7750_CHCR_SSA_CMEM16  0xA0000000	/* 16-bit common memory space */
-#define SH7750_CHCR_SSA_AMEM8   0xC0000000	/* 8-bit attribute memory space */
-#define SH7750_CHCR_SSA_AMEM16  0xE0000000	/* 16-bit attribute memory space */
-
-#define SH7750_CHCR_STC       0x10000000	/* Source Address Wait Control Select,
-						   specifies CS5 or CS6 space wait
-						   control for PCMCIA access */
-
-#define SH7750_CHCR_DSA       0x0E000000	/* Source Address Space Attribute */
-#define SH7750_CHCR_DSA_PCMCIA  0x00000000	/* Reserved in PCMCIA access */
-#define SH7750_CHCR_DSA_DYNBSZ  0x02000000	/* Dynamic Bus Sizing I/O space */
-#define SH7750_CHCR_DSA_IO8     0x04000000	/* 8-bit I/O space */
-#define SH7750_CHCR_DSA_IO16    0x06000000	/* 16-bit I/O space */
-#define SH7750_CHCR_DSA_CMEM8   0x08000000	/* 8-bit common memory space */
-#define SH7750_CHCR_DSA_CMEM16  0x0A000000	/* 16-bit common memory space */
-#define SH7750_CHCR_DSA_AMEM8   0x0C000000	/* 8-bit attribute memory space */
-#define SH7750_CHCR_DSA_AMEM16  0x0E000000	/* 16-bit attribute memory space */
-
-#define SH7750_CHCR_DTC       0x01000000	/* Destination Address Wait Control
-						   Select, specifies CS5 or CS6
-						   space wait control for PCMCIA
-						   access */
-
-#define SH7750_CHCR_DS        0x00080000	/* DREQ\ Select : */
-#define SH7750_CHCR_DS_LOWLVL 0x00000000	/*     Low Level Detection */
-#define SH7750_CHCR_DS_FALL   0x00080000	/*     Falling Edge Detection */
-
-#define SH7750_CHCR_RL        0x00040000	/* Request Check Level: */
-#define SH7750_CHCR_RL_ACTH   0x00000000	/*     DRAK is an active high out */
-#define SH7750_CHCR_RL_ACTL   0x00040000	/*     DRAK is an active low out */
-
-#define SH7750_CHCR_AM        0x00020000	/* Acknowledge Mode: */
-#define SH7750_CHCR_AM_RD     0x00000000	/*     DACK is output in read cycle */
-#define SH7750_CHCR_AM_WR     0x00020000	/*     DACK is output in write cycle */
-
-#define SH7750_CHCR_AL        0x00010000	/* Acknowledge Level: */
-#define SH7750_CHCR_AL_ACTH   0x00000000	/*     DACK is an active high out */
-#define SH7750_CHCR_AL_ACTL   0x00010000	/*     DACK is an active low out */
-
-#define SH7750_CHCR_DM        0x0000C000	/* Destination Address Mode: */
-#define SH7750_CHCR_DM_FIX    0x00000000	/*     Destination Addr Fixed */
-#define SH7750_CHCR_DM_INC    0x00004000	/*     Destination Addr Incremented */
-#define SH7750_CHCR_DM_DEC    0x00008000	/*     Destination Addr Decremented */
-
-#define SH7750_CHCR_SM        0x00003000	/* Source Address Mode: */
-#define SH7750_CHCR_SM_FIX    0x00000000	/*     Source Addr Fixed */
-#define SH7750_CHCR_SM_INC    0x00001000	/*     Source Addr Incremented */
-#define SH7750_CHCR_SM_DEC    0x00002000	/*     Source Addr Decremented */
-
-#define SH7750_CHCR_RS        0x00000F00	/* Request Source Select: */
-#define SH7750_CHCR_RS_ER_DA_EA_TO_EA   0x000	/* External Request, Dual Address
-						   Mode (External Addr Space->
-						   External Addr Space) */
-#define SH7750_CHCR_RS_ER_SA_EA_TO_ED   0x200	/* External Request, Single
-						   Address Mode (External Addr
-						   Space -> External Device) */
-#define SH7750_CHCR_RS_ER_SA_ED_TO_EA   0x300	/* External Request, Single
-						   Address Mode, (External
-						   Device -> External Addr
-						   Space) */
-#define SH7750_CHCR_RS_AR_EA_TO_EA      0x400	/* Auto-Request (External Addr
-						   Space -> External Addr Space) */
-
-#define SH7750_CHCR_RS_AR_EA_TO_OCP     0x500	/* Auto-Request (External Addr
-						   Space -> On-chip Peripheral
-						   Module) */
-#define SH7750_CHCR_RS_AR_OCP_TO_EA     0x600	/* Auto-Request (On-chip
-						   Peripheral Module ->
-						   External Addr Space */
-#define SH7750_CHCR_RS_SCITX_EA_TO_SC   0x800	/* SCI Transmit-Data-Empty intr
-						   transfer request (external
-						   address space -> SCTDR1) */
-#define SH7750_CHCR_RS_SCIRX_SC_TO_EA   0x900	/* SCI Receive-Data-Full intr
-						   transfer request (SCRDR1 ->
-						   External Addr Space) */
-#define SH7750_CHCR_RS_SCIFTX_EA_TO_SC  0xA00	/* SCIF Transmit-Data-Empty intr
-						   transfer request (external
-						   address space -> SCFTDR1) */
-#define SH7750_CHCR_RS_SCIFRX_SC_TO_EA  0xB00	/* SCIF Receive-Data-Full intr
-						   transfer request (SCFRDR2 ->
-						   External Addr Space) */
-#define SH7750_CHCR_RS_TMU2_EA_TO_EA    0xC00	/* TMU Channel 2 (input capture
-						   interrupt), (external address
-						   space -> external address
-						   space) */
-#define SH7750_CHCR_RS_TMU2_EA_TO_OCP   0xD00	/* TMU Channel 2 (input capture
-						   interrupt), (external address
-						   space -> on-chip peripheral
-						   module) */
-#define SH7750_CHCR_RS_TMU2_OCP_TO_EA   0xE00	/* TMU Channel 2 (input capture
-						   interrupt), (on-chip
-						   peripheral module -> external
-						   address space) */
-
-#define SH7750_CHCR_TM        0x00000080	/* Transmit mode: */
-#define SH7750_CHCR_TM_CSTEAL 0x00000000	/*     Cycle Steal Mode */
-#define SH7750_CHCR_TM_BURST  0x00000080	/*     Burst Mode */
-
-#define SH7750_CHCR_TS        0x00000070	/* Transmit Size: */
-#define SH7750_CHCR_TS_QUAD   0x00000000	/*     Quadword Size (64 bits) */
-#define SH7750_CHCR_TS_BYTE   0x00000010	/*     Byte Size (8 bit) */
-#define SH7750_CHCR_TS_WORD   0x00000020	/*     Word Size (16 bit) */
-#define SH7750_CHCR_TS_LONG   0x00000030	/*     Longword Size (32 bit) */
-#define SH7750_CHCR_TS_BLOCK  0x00000040	/*     32-byte block transfer */
-
-#define SH7750_CHCR_IE        0x00000004	/* Interrupt Enable */
-#define SH7750_CHCR_TE        0x00000002	/* Transfer End */
-#define SH7750_CHCR_DE        0x00000001	/* DMAC Enable */
+#define SH7750_CHCR_SSA       0xE0000000    /* Source Address Space Attribute */
+#define SH7750_CHCR_SSA_PCMCIA  0x00000000    /* Reserved in PCMCIA access */
+#define SH7750_CHCR_SSA_DYNBSZ  0x20000000    /* Dynamic Bus Sizing I/O space */
+#define SH7750_CHCR_SSA_IO8     0x40000000    /* 8-bit I/O space */
+#define SH7750_CHCR_SSA_IO16    0x60000000    /* 16-bit I/O space */
+#define SH7750_CHCR_SSA_CMEM8   0x80000000    /* 8-bit common memory space */
+#define SH7750_CHCR_SSA_CMEM16  0xA0000000    /* 16-bit common memory space */
+#define SH7750_CHCR_SSA_AMEM8   0xC0000000    /* 8-bit attribute memory space */
+#define SH7750_CHCR_SSA_AMEM16  0xE0000000    /* 16-bit attribute memory space */
+
+#define SH7750_CHCR_STC       0x10000000    /* Source Address Wait Control Select,
+                           specifies CS5 or CS6 space wait
+                           control for PCMCIA access */
+
+#define SH7750_CHCR_DSA       0x0E000000    /* Source Address Space Attribute */
+#define SH7750_CHCR_DSA_PCMCIA  0x00000000    /* Reserved in PCMCIA access */
+#define SH7750_CHCR_DSA_DYNBSZ  0x02000000    /* Dynamic Bus Sizing I/O space */
+#define SH7750_CHCR_DSA_IO8     0x04000000    /* 8-bit I/O space */
+#define SH7750_CHCR_DSA_IO16    0x06000000    /* 16-bit I/O space */
+#define SH7750_CHCR_DSA_CMEM8   0x08000000    /* 8-bit common memory space */
+#define SH7750_CHCR_DSA_CMEM16  0x0A000000    /* 16-bit common memory space */
+#define SH7750_CHCR_DSA_AMEM8   0x0C000000    /* 8-bit attribute memory space */
+#define SH7750_CHCR_DSA_AMEM16  0x0E000000    /* 16-bit attribute memory space */
+
+#define SH7750_CHCR_DTC       0x01000000    /* Destination Address Wait Control
+                           Select, specifies CS5 or CS6
+                           space wait control for PCMCIA
+                           access */
+
+#define SH7750_CHCR_DS        0x00080000    /* DREQ\ Select : */
+#define SH7750_CHCR_DS_LOWLVL 0x00000000    /*     Low Level Detection */
+#define SH7750_CHCR_DS_FALL   0x00080000    /*     Falling Edge Detection */
+
+#define SH7750_CHCR_RL        0x00040000    /* Request Check Level: */
+#define SH7750_CHCR_RL_ACTH   0x00000000    /*     DRAK is an active high out */
+#define SH7750_CHCR_RL_ACTL   0x00040000    /*     DRAK is an active low out */
+
+#define SH7750_CHCR_AM        0x00020000    /* Acknowledge Mode: */
+#define SH7750_CHCR_AM_RD     0x00000000    /*     DACK is output in read cycle */
+#define SH7750_CHCR_AM_WR     0x00020000    /*     DACK is output in write cycle */
+
+#define SH7750_CHCR_AL        0x00010000    /* Acknowledge Level: */
+#define SH7750_CHCR_AL_ACTH   0x00000000    /*     DACK is an active high out */
+#define SH7750_CHCR_AL_ACTL   0x00010000    /*     DACK is an active low out */
+
+#define SH7750_CHCR_DM        0x0000C000    /* Destination Address Mode: */
+#define SH7750_CHCR_DM_FIX    0x00000000    /*     Destination Addr Fixed */
+#define SH7750_CHCR_DM_INC    0x00004000    /*     Destination Addr Incremented */
+#define SH7750_CHCR_DM_DEC    0x00008000    /*     Destination Addr Decremented */
+
+#define SH7750_CHCR_SM        0x00003000    /* Source Address Mode: */
+#define SH7750_CHCR_SM_FIX    0x00000000    /*     Source Addr Fixed */
+#define SH7750_CHCR_SM_INC    0x00001000    /*     Source Addr Incremented */
+#define SH7750_CHCR_SM_DEC    0x00002000    /*     Source Addr Decremented */
+
+#define SH7750_CHCR_RS        0x00000F00    /* Request Source Select: */
+#define SH7750_CHCR_RS_ER_DA_EA_TO_EA   0x000    /* External Request, Dual Address
+                           Mode (External Addr Space->
+                           External Addr Space) */
+#define SH7750_CHCR_RS_ER_SA_EA_TO_ED   0x200    /* External Request, Single
+                           Address Mode (External Addr
+                           Space -> External Device) */
+#define SH7750_CHCR_RS_ER_SA_ED_TO_EA   0x300    /* External Request, Single
+                           Address Mode, (External
+                           Device -> External Addr
+                           Space) */
+#define SH7750_CHCR_RS_AR_EA_TO_EA      0x400    /* Auto-Request (External Addr
+                           Space -> External Addr Space) */
+
+#define SH7750_CHCR_RS_AR_EA_TO_OCP     0x500    /* Auto-Request (External Addr
+                           Space -> On-chip Peripheral
+                           Module) */
+#define SH7750_CHCR_RS_AR_OCP_TO_EA     0x600    /* Auto-Request (On-chip
+                           Peripheral Module ->
+                           External Addr Space */
+#define SH7750_CHCR_RS_SCITX_EA_TO_SC   0x800    /* SCI Transmit-Data-Empty intr
+                           transfer request (external
+                           address space -> SCTDR1) */
+#define SH7750_CHCR_RS_SCIRX_SC_TO_EA   0x900    /* SCI Receive-Data-Full intr
+                           transfer request (SCRDR1 ->
+                           External Addr Space) */
+#define SH7750_CHCR_RS_SCIFTX_EA_TO_SC  0xA00    /* SCIF Transmit-Data-Empty intr
+                           transfer request (external
+                           address space -> SCFTDR1) */
+#define SH7750_CHCR_RS_SCIFRX_SC_TO_EA  0xB00    /* SCIF Receive-Data-Full intr
+                           transfer request (SCFRDR2 ->
+                           External Addr Space) */
+#define SH7750_CHCR_RS_TMU2_EA_TO_EA    0xC00    /* TMU Channel 2 (input capture
+                           interrupt), (external address
+                           space -> external address
+                           space) */
+#define SH7750_CHCR_RS_TMU2_EA_TO_OCP   0xD00    /* TMU Channel 2 (input capture
+                           interrupt), (external address
+                           space -> on-chip peripheral
+                           module) */
+#define SH7750_CHCR_RS_TMU2_OCP_TO_EA   0xE00    /* TMU Channel 2 (input capture
+                           interrupt), (on-chip
+                           peripheral module -> external
+                           address space) */
+
+#define SH7750_CHCR_TM        0x00000080    /* Transmit mode: */
+#define SH7750_CHCR_TM_CSTEAL 0x00000000    /*     Cycle Steal Mode */
+#define SH7750_CHCR_TM_BURST  0x00000080    /*     Burst Mode */
+
+#define SH7750_CHCR_TS        0x00000070    /* Transmit Size: */
+#define SH7750_CHCR_TS_QUAD   0x00000000    /*     Quadword Size (64 bits) */
+#define SH7750_CHCR_TS_BYTE   0x00000010    /*     Byte Size (8 bit) */
+#define SH7750_CHCR_TS_WORD   0x00000020    /*     Word Size (16 bit) */
+#define SH7750_CHCR_TS_LONG   0x00000030    /*     Longword Size (32 bit) */
+#define SH7750_CHCR_TS_BLOCK  0x00000040    /*     32-byte block transfer */
+
+#define SH7750_CHCR_IE        0x00000004    /* Interrupt Enable */
+#define SH7750_CHCR_TE        0x00000002    /* Transfer End */
+#define SH7750_CHCR_DE        0x00000001    /* DMAC Enable */
 
 /* DMA Operation Register - DMAOR */
-#define SH7750_DMAOR_REGOFS   0xA00040	/* offset */
+#define SH7750_DMAOR_REGOFS   0xA00040    /* offset */
 #define SH7750_DMAOR          SH7750_P4_REG32(SH7750_DMAOR_REGOFS)
 #define SH7750_DMAOR_A7       SH7750_A7_REG32(SH7750_DMAOR_REGOFS)
 
-#define SH7750_DMAOR_DDT      0x00008000	/* On-Demand Data Transfer Mode */
+#define SH7750_DMAOR_DDT      0x00008000    /* On-Demand Data Transfer Mode */
 
-#define SH7750_DMAOR_PR       0x00000300	/* Priority Mode: */
-#define SH7750_DMAOR_PR_0123  0x00000000	/*     CH0 > CH1 > CH2 > CH3 */
-#define SH7750_DMAOR_PR_0231  0x00000100	/*     CH0 > CH2 > CH3 > CH1 */
-#define SH7750_DMAOR_PR_2013  0x00000200	/*     CH2 > CH0 > CH1 > CH3 */
-#define SH7750_DMAOR_PR_RR    0x00000300	/*     Round-robin mode */
+#define SH7750_DMAOR_PR       0x00000300    /* Priority Mode: */
+#define SH7750_DMAOR_PR_0123  0x00000000    /*     CH0 > CH1 > CH2 > CH3 */
+#define SH7750_DMAOR_PR_0231  0x00000100    /*     CH0 > CH2 > CH3 > CH1 */
+#define SH7750_DMAOR_PR_2013  0x00000200    /*     CH2 > CH0 > CH1 > CH3 */
+#define SH7750_DMAOR_PR_RR    0x00000300    /*     Round-robin mode */
 
-#define SH7750_DMAOR_COD      0x00000010	/* Check Overrun for DREQ\ */
-#define SH7750_DMAOR_AE       0x00000004	/* Address Error flag */
-#define SH7750_DMAOR_NMIF     0x00000002	/* NMI Flag */
-#define SH7750_DMAOR_DME      0x00000001	/* DMAC Master Enable */
+#define SH7750_DMAOR_COD      0x00000010    /* Check Overrun for DREQ\ */
+#define SH7750_DMAOR_AE       0x00000004    /* Address Error flag */
+#define SH7750_DMAOR_NMIF     0x00000002    /* NMI Flag */
+#define SH7750_DMAOR_DME      0x00000001    /* DMAC Master Enable */
 
 /*
  * I/O Ports
  */
 /* Port Control Register A - PCTRA */
-#define SH7750_PCTRA_REGOFS   0x80002C	/* offset */
+#define SH7750_PCTRA_REGOFS   0x80002C    /* offset */
 #define SH7750_PCTRA          SH7750_P4_REG32(SH7750_PCTRA_REGOFS)
 #define SH7750_PCTRA_A7       SH7750_A7_REG32(SH7750_PCTRA_REGOFS)
 
-#define SH7750_PCTRA_PBPUP(n) 0	/* Bit n is pulled up */
-#define SH7750_PCTRA_PBNPUP(n) (1 << ((n)*2+1))	/* Bit n is not pulled up */
-#define SH7750_PCTRA_PBINP(n) 0	/* Bit n is an input */
-#define SH7750_PCTRA_PBOUT(n) (1 << ((n)*2))	/* Bit n is an output */
+#define SH7750_PCTRA_PBPUP(n) 0    /* Bit n is pulled up */
+#define SH7750_PCTRA_PBNPUP(n) (1 << ((n)*2+1))    /* Bit n is not pulled up */
+#define SH7750_PCTRA_PBINP(n) 0    /* Bit n is an input */
+#define SH7750_PCTRA_PBOUT(n) (1 << ((n)*2))    /* Bit n is an output */
 
 /* Port Data Register A - PDTRA(half) */
-#define SH7750_PDTRA_REGOFS   0x800030	/* offset */
+#define SH7750_PDTRA_REGOFS   0x800030    /* offset */
 #define SH7750_PDTRA          SH7750_P4_REG32(SH7750_PDTRA_REGOFS)
 #define SH7750_PDTRA_A7       SH7750_A7_REG32(SH7750_PDTRA_REGOFS)
 
 #define SH7750_PDTRA_BIT(n) (1 << (n))
 
 /* Port Control Register B - PCTRB */
-#define SH7750_PCTRB_REGOFS   0x800040	/* offset */
+#define SH7750_PCTRB_REGOFS   0x800040    /* offset */
 #define SH7750_PCTRB          SH7750_P4_REG32(SH7750_PCTRB_REGOFS)
 #define SH7750_PCTRB_A7       SH7750_A7_REG32(SH7750_PCTRB_REGOFS)
 
-#define SH7750_PCTRB_PBPUP(n) 0	/* Bit n is pulled up */
-#define SH7750_PCTRB_PBNPUP(n) (1 << ((n-16)*2+1))	/* Bit n is not pulled up */
-#define SH7750_PCTRB_PBINP(n) 0	/* Bit n is an input */
-#define SH7750_PCTRB_PBOUT(n) (1 << ((n-16)*2))	/* Bit n is an output */
+#define SH7750_PCTRB_PBPUP(n) 0    /* Bit n is pulled up */
+#define SH7750_PCTRB_PBNPUP(n) (1 << ((n-16)*2+1))    /* Bit n is not pulled up */
+#define SH7750_PCTRB_PBINP(n) 0    /* Bit n is an input */
+#define SH7750_PCTRB_PBOUT(n) (1 << ((n-16)*2))    /* Bit n is an output */
 
 /* Port Data Register B - PDTRB(half) */
-#define SH7750_PDTRB_REGOFS   0x800044	/* offset */
+#define SH7750_PDTRB_REGOFS   0x800044    /* offset */
 #define SH7750_PDTRB          SH7750_P4_REG32(SH7750_PDTRB_REGOFS)
 #define SH7750_PDTRB_A7       SH7750_A7_REG32(SH7750_PDTRB_REGOFS)
 
 #define SH7750_PDTRB_BIT(n) (1 << ((n)-16))
 
 /* GPIO Interrupt Control Register - GPIOIC(half) */
-#define SH7750_GPIOIC_REGOFS  0x800048	/* offset */
+#define SH7750_GPIOIC_REGOFS  0x800048    /* offset */
 #define SH7750_GPIOIC         SH7750_P4_REG32(SH7750_GPIOIC_REGOFS)
 #define SH7750_GPIOIC_A7      SH7750_A7_REG32(SH7750_GPIOIC_REGOFS)
 
-#define SH7750_GPIOIC_PTIREN(n) (1 << (n))	/* Port n is used as a GPIO int */
+#define SH7750_GPIOIC_PTIREN(n) (1 << (n))    /* Port n is used as a GPIO int */
 
 /*
  * Interrupt Controller - INTC
  */
 /* Interrupt Control Register - ICR (half) */
-#define SH7750_ICR_REGOFS     0xD00000	/* offset */
+#define SH7750_ICR_REGOFS     0xD00000    /* offset */
 #define SH7750_ICR            SH7750_P4_REG32(SH7750_ICR_REGOFS)
 #define SH7750_ICR_A7         SH7750_A7_REG32(SH7750_ICR_REGOFS)
 
-#define SH7750_ICR_NMIL       0x8000	/* NMI Input Level */
-#define SH7750_ICR_MAI        0x4000	/* NMI Interrupt Mask */
+#define SH7750_ICR_NMIL       0x8000    /* NMI Input Level */
+#define SH7750_ICR_MAI        0x4000    /* NMI Interrupt Mask */
 
-#define SH7750_ICR_NMIB       0x0200	/* NMI Block Mode: */
-#define SH7750_ICR_NMIB_BLK   0x0000	/*   NMI requests held pending while
-					   SR.BL bit is set to 1 */
-#define SH7750_ICR_NMIB_NBLK  0x0200	/*   NMI requests detected when SR.BL bit
-					   set to 1 */
+#define SH7750_ICR_NMIB       0x0200    /* NMI Block Mode: */
+#define SH7750_ICR_NMIB_BLK   0x0000    /*   NMI requests held pending while
+                       SR.BL bit is set to 1 */
+#define SH7750_ICR_NMIB_NBLK  0x0200    /*   NMI requests detected when SR.BL bit
+                       set to 1 */
 
-#define SH7750_ICR_NMIE       0x0100	/* NMI Edge Select: */
-#define SH7750_ICR_NMIE_FALL  0x0000	/*   Interrupt request detected on falling
-					   edge of NMI input */
-#define SH7750_ICR_NMIE_RISE  0x0100	/*   Interrupt request detected on rising
-					   edge of NMI input */
+#define SH7750_ICR_NMIE       0x0100    /* NMI Edge Select: */
+#define SH7750_ICR_NMIE_FALL  0x0000    /*   Interrupt request detected on falling
+                       edge of NMI input */
+#define SH7750_ICR_NMIE_RISE  0x0100    /*   Interrupt request detected on rising
+                       edge of NMI input */
 
-#define SH7750_ICR_IRLM       0x0080	/* IRL Pin Mode: */
-#define SH7750_ICR_IRLM_ENC   0x0000	/*   IRL\ pins used as a level-encoded
-					   interrupt requests */
-#define SH7750_ICR_IRLM_RAW   0x0080	/*   IRL\ pins used as a four independent
-					   interrupt requests */
+#define SH7750_ICR_IRLM       0x0080    /* IRL Pin Mode: */
+#define SH7750_ICR_IRLM_ENC   0x0000    /*   IRL\ pins used as a level-encoded
+                       interrupt requests */
+#define SH7750_ICR_IRLM_RAW   0x0080    /*   IRL\ pins used as a four independent
+                       interrupt requests */
 
 /*
  * User Break Controller registers
  */
-#define SH7750_BARA           0x200000	/* Break address regiser A */
-#define SH7750_BAMRA          0x200004	/* Break address mask regiser A */
-#define SH7750_BBRA           0x200008	/* Break bus cycle regiser A */
-#define SH7750_BARB           0x20000c	/* Break address regiser B */
-#define SH7750_BAMRB          0x200010	/* Break address mask regiser B */
-#define SH7750_BBRB           0x200014	/* Break bus cycle regiser B */
-#define SH7750_BASRB          0x000018	/* Break ASID regiser B */
-#define SH7750_BDRB           0x200018	/* Break data regiser B */
-#define SH7750_BDMRB          0x20001c	/* Break data mask regiser B */
-#define SH7750_BRCR           0x200020	/* Break control register */
-
-#define SH7750_BRCR_UDBE        0x0001	/* User break debug enable bit */
+#define SH7750_BARA           0x200000    /* Break address regiser A */
+#define SH7750_BAMRA          0x200004    /* Break address mask regiser A */
+#define SH7750_BBRA           0x200008    /* Break bus cycle regiser A */
+#define SH7750_BARB           0x20000c    /* Break address regiser B */
+#define SH7750_BAMRB          0x200010    /* Break address mask regiser B */
+#define SH7750_BBRB           0x200014    /* Break bus cycle regiser B */
+#define SH7750_BASRB          0x000018    /* Break ASID regiser B */
+#define SH7750_BDRB           0x200018    /* Break data regiser B */
+#define SH7750_BDMRB          0x20001c    /* Break data mask regiser B */
+#define SH7750_BRCR           0x200020    /* Break control register */
+
+#define SH7750_BRCR_UDBE        0x0001    /* User break debug enable bit */
 
 /*
  * Missing in RTEMS, added for QEMU
diff --git a/linux-user/sh4/termbits.h b/linux-user/sh4/termbits.h
index f91b5c51cf..e0e577d106 100644
--- a/linux-user/sh4/termbits.h
+++ b/linux-user/sh4/termbits.h
@@ -39,86 +39,86 @@ struct target_termios {
 #define TARGET_VEOL2 16
 
 /* c_iflag bits */
-#define TARGET_IGNBRK	0000001
-#define TARGET_BRKINT	0000002
-#define TARGET_IGNPAR	0000004
-#define TARGET_PARMRK	0000010
-#define TARGET_INPCK	0000020
-#define TARGET_ISTRIP	0000040
-#define TARGET_INLCR	0000100
-#define TARGET_IGNCR	0000200
-#define TARGET_ICRNL	0000400
-#define TARGET_IUCLC	0001000
-#define TARGET_IXON	0002000
-#define TARGET_IXANY	0004000
-#define TARGET_IXOFF	0010000
-#define TARGET_IMAXBEL	0020000
-#define TARGET_IUTF8	0040000
+#define TARGET_IGNBRK    0000001
+#define TARGET_BRKINT    0000002
+#define TARGET_IGNPAR    0000004
+#define TARGET_PARMRK    0000010
+#define TARGET_INPCK    0000020
+#define TARGET_ISTRIP    0000040
+#define TARGET_INLCR    0000100
+#define TARGET_IGNCR    0000200
+#define TARGET_ICRNL    0000400
+#define TARGET_IUCLC    0001000
+#define TARGET_IXON    0002000
+#define TARGET_IXANY    0004000
+#define TARGET_IXOFF    0010000
+#define TARGET_IMAXBEL    0020000
+#define TARGET_IUTF8    0040000
 
 /* c_oflag bits */
-#define TARGET_OPOST	0000001
-#define TARGET_OLCUC	0000002
-#define TARGET_ONLCR	0000004
-#define TARGET_OCRNL	0000010
-#define TARGET_ONOCR	0000020
-#define TARGET_ONLRET	0000040
-#define TARGET_OFILL	0000100
-#define TARGET_OFDEL	0000200
-#define TARGET_NLDLY	0000400
-#define TARGET_NL0	0000000
-#define TARGET_NL1	0000400
-#define TARGET_CRDLY	0003000
-#define TARGET_CR0	0000000
-#define TARGET_CR1	0001000
-#define TARGET_CR2	0002000
-#define TARGET_CR3	0003000
-#define TARGET_TABDLY	0014000
-#define TARGET_TAB0	0000000
-#define TARGET_TAB1	0004000
-#define TARGET_TAB2	0010000
-#define TARGET_TAB3	0014000
-#define TARGET_XTABS	0014000
-#define TARGET_BSDLY	0020000
-#define TARGET_BS0	0000000
-#define TARGET_BS1	0020000
-#define TARGET_VTDLY	0040000
-#define TARGET_VT0	0000000
-#define TARGET_VT1	0040000
-#define TARGET_FFDLY	0100000
-#define TARGET_FF0	0000000
-#define TARGET_FF1	0100000
+#define TARGET_OPOST    0000001
+#define TARGET_OLCUC    0000002
+#define TARGET_ONLCR    0000004
+#define TARGET_OCRNL    0000010
+#define TARGET_ONOCR    0000020
+#define TARGET_ONLRET    0000040
+#define TARGET_OFILL    0000100
+#define TARGET_OFDEL    0000200
+#define TARGET_NLDLY    0000400
+#define TARGET_NL0    0000000
+#define TARGET_NL1    0000400
+#define TARGET_CRDLY    0003000
+#define TARGET_CR0    0000000
+#define TARGET_CR1    0001000
+#define TARGET_CR2    0002000
+#define TARGET_CR3    0003000
+#define TARGET_TABDLY    0014000
+#define TARGET_TAB0    0000000
+#define TARGET_TAB1    0004000
+#define TARGET_TAB2    0010000
+#define TARGET_TAB3    0014000
+#define TARGET_XTABS    0014000
+#define TARGET_BSDLY    0020000
+#define TARGET_BS0    0000000
+#define TARGET_BS1    0020000
+#define TARGET_VTDLY    0040000
+#define TARGET_VT0    0000000
+#define TARGET_VT1    0040000
+#define TARGET_FFDLY    0100000
+#define TARGET_FF0    0000000
+#define TARGET_FF1    0100000
 
 /* c_cflag bit meaning */
-#define TARGET_CBAUD	0010017
-#define TARGET_B0	0000000		/* hang up */
-#define TARGET_B50	0000001
-#define TARGET_B75	0000002
-#define TARGET_B110	0000003
-#define TARGET_B134	0000004
-#define TARGET_B150	0000005
-#define TARGET_B200	0000006
-#define TARGET_B300	0000007
-#define TARGET_B600	0000010
-#define TARGET_B1200	0000011
-#define TARGET_B1800	0000012
-#define TARGET_B2400	0000013
-#define TARGET_B4800	0000014
-#define TARGET_B9600	0000015
-#define TARGET_B19200	0000016
-#define TARGET_B38400	0000017
+#define TARGET_CBAUD    0010017
+#define TARGET_B0    0000000        /* hang up */
+#define TARGET_B50    0000001
+#define TARGET_B75    0000002
+#define TARGET_B110    0000003
+#define TARGET_B134    0000004
+#define TARGET_B150    0000005
+#define TARGET_B200    0000006
+#define TARGET_B300    0000007
+#define TARGET_B600    0000010
+#define TARGET_B1200    0000011
+#define TARGET_B1800    0000012
+#define TARGET_B2400    0000013
+#define TARGET_B4800    0000014
+#define TARGET_B9600    0000015
+#define TARGET_B19200    0000016
+#define TARGET_B38400    0000017
 #define TARGET_EXTA B19200
 #define TARGET_EXTB B38400
-#define TARGET_CSIZE	0000060
-#define TARGET_CS5	0000000
-#define TARGET_CS6	0000020
-#define TARGET_CS7	0000040
-#define TARGET_CS8	0000060
-#define TARGET_CSTOPB	0000100
-#define TARGET_CREAD	0000200
-#define TARGET_PARENB	0000400
-#define TARGET_PARODD	0001000
-#define TARGET_HUPCL	0002000
-#define TARGET_CLOCAL	0004000
+#define TARGET_CSIZE    0000060
+#define TARGET_CS5    0000000
+#define TARGET_CS6    0000020
+#define TARGET_CS7    0000040
+#define TARGET_CS8    0000060
+#define TARGET_CSTOPB    0000100
+#define TARGET_CREAD    0000200
+#define TARGET_PARENB    0000400
+#define TARGET_PARODD    0001000
+#define TARGET_HUPCL    0002000
+#define TARGET_CLOCAL    0004000
 #define TARGET_CBAUDEX 0010000
 #define TARGET_B57600 0010001
 #define TARGET_B115200 0010002
@@ -135,44 +135,44 @@ struct target_termios {
 #define TARGET_B3000000 0010015
 #define TARGET_B3500000 0010016
 #define TARGET_B4000000 0010017
-#define TARGET_CIBAUD	  002003600000	/* input baud rate (not used) */
-#define TARGET_CMSPAR	  010000000000		/* mark or space (stick) parity */
-#define TARGET_CRTSCTS	  020000000000		/* flow control */
+#define TARGET_CIBAUD      002003600000    /* input baud rate (not used) */
+#define TARGET_CMSPAR      010000000000        /* mark or space (stick) parity */
+#define TARGET_CRTSCTS      020000000000        /* flow control */
 
 /* c_lflag bits */
-#define TARGET_ISIG	0000001
-#define TARGET_ICANON	0000002
-#define TARGET_XCASE	0000004
-#define TARGET_ECHO	0000010
-#define TARGET_ECHOE	0000020
-#define TARGET_ECHOK	0000040
-#define TARGET_ECHONL	0000100
-#define TARGET_NOFLSH	0000200
-#define TARGET_TOSTOP	0000400
-#define TARGET_ECHOCTL	0001000
-#define TARGET_ECHOPRT	0002000
-#define TARGET_ECHOKE	0004000
-#define TARGET_FLUSHO	0010000
-#define TARGET_PENDIN	0040000
-#define TARGET_IEXTEN	0100000
+#define TARGET_ISIG    0000001
+#define TARGET_ICANON    0000002
+#define TARGET_XCASE    0000004
+#define TARGET_ECHO    0000010
+#define TARGET_ECHOE    0000020
+#define TARGET_ECHOK    0000040
+#define TARGET_ECHONL    0000100
+#define TARGET_NOFLSH    0000200
+#define TARGET_TOSTOP    0000400
+#define TARGET_ECHOCTL    0001000
+#define TARGET_ECHOPRT    0002000
+#define TARGET_ECHOKE    0004000
+#define TARGET_FLUSHO    0010000
+#define TARGET_PENDIN    0040000
+#define TARGET_IEXTEN    0100000
 #define TARGET_EXTPROC  0200000
 
 
 /* tcflow() and TCXONC use these */
-#define TARGET_TCOOFF		0
-#define TARGET_TCOON		1
-#define TARGET_TCIOFF		2
-#define TARGET_TCION		3
+#define TARGET_TCOOFF        0
+#define TARGET_TCOON        1
+#define TARGET_TCIOFF        2
+#define TARGET_TCION        3
 
 /* tcflush() and TCFLSH use these */
-#define TARGET_TCIFLUSH	0
-#define TARGET_TCOFLUSH	1
-#define TARGET_TCIOFLUSH	2
+#define TARGET_TCIFLUSH    0
+#define TARGET_TCOFLUSH    1
+#define TARGET_TCIOFLUSH    2
 
 /* tcsetattr uses these */
-#define TARGET_TCSANOW		0
-#define TARGET_TCSADRAIN	1
-#define TARGET_TARGET_TCSAFLUSH	2
+#define TARGET_TCSANOW        0
+#define TARGET_TCSADRAIN    1
+#define TARGET_TARGET_TCSAFLUSH    2
 
 /* ioctl */
 #define TARGET_FIOCLEX         TARGET_IO('f', 1)
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c4344082..fd453208c1 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -98,19 +98,19 @@
 #define TB_FLAG_ENVFLAGS_MASK  (DELAY_SLOT_MASK | GUSA_MASK)
 
 typedef struct tlb_t {
-    uint32_t vpn;		/* virtual page number */
-    uint32_t ppn;		/* physical page number */
-    uint32_t size;		/* mapped page size in bytes */
-    uint8_t asid;		/* address space identifier */
-    uint8_t v:1;		/* validity */
-    uint8_t sz:2;		/* page size */
-    uint8_t sh:1;		/* share status */
-    uint8_t c:1;		/* cacheability */
-    uint8_t pr:2;		/* protection key */
-    uint8_t d:1;		/* dirty */
-    uint8_t wt:1;		/* write through */
-    uint8_t sa:3;		/* space attribute (PCMCIA) */
-    uint8_t tc:1;		/* timing control */
+    uint32_t vpn;        /* virtual page number */
+    uint32_t ppn;        /* physical page number */
+    uint32_t size;        /* mapped page size in bytes */
+    uint8_t asid;        /* address space identifier */
+    uint8_t v:1;        /* validity */
+    uint8_t sz:2;        /* page size */
+    uint8_t sh:1;        /* share status */
+    uint8_t c:1;        /* cacheability */
+    uint8_t pr:2;        /* protection key */
+    uint8_t d:1;        /* dirty */
+    uint8_t wt:1;        /* write through */
+    uint8_t sa:3;        /* space attribute (PCMCIA) */
+    uint8_t tc:1;        /* timing control */
 } tlb_t;
 
 #define UTLB_SIZE 64
@@ -130,44 +130,44 @@ typedef struct memory_content {
 } memory_content;
 
 typedef struct CPUSH4State {
-    uint32_t flags;		/* general execution flags */
-    uint32_t gregs[24];		/* general registers */
-    float32 fregs[32];		/* floating point registers */
+    uint32_t flags;        /* general execution flags */
+    uint32_t gregs[24];        /* general registers */
+    float32 fregs[32];        /* floating point registers */
     uint32_t sr;                /* status register (with T split out) */
     uint32_t sr_m;              /* M bit of status register */
     uint32_t sr_q;              /* Q bit of status register */
     uint32_t sr_t;              /* T bit of status register */
-    uint32_t ssr;		/* saved status register */
-    uint32_t spc;		/* saved program counter */
-    uint32_t gbr;		/* global base register */
-    uint32_t vbr;		/* vector base register */
-    uint32_t sgr;		/* saved global register 15 */
-    uint32_t dbr;		/* debug base register */
-    uint32_t pc;		/* program counter */
+    uint32_t ssr;        /* saved status register */
+    uint32_t spc;        /* saved program counter */
+    uint32_t gbr;        /* global base register */
+    uint32_t vbr;        /* vector base register */
+    uint32_t sgr;        /* saved global register 15 */
+    uint32_t dbr;        /* debug base register */
+    uint32_t pc;        /* program counter */
     uint32_t delayed_pc;        /* target of delayed branch */
     uint32_t delayed_cond;      /* condition of delayed branch */
-    uint32_t mach;		/* multiply and accumulate high */
-    uint32_t macl;		/* multiply and accumulate low */
-    uint32_t pr;		/* procedure register */
-    uint32_t fpscr;		/* floating point status/control register */
-    uint32_t fpul;		/* floating point communication register */
+    uint32_t mach;        /* multiply and accumulate high */
+    uint32_t macl;        /* multiply and accumulate low */
+    uint32_t pr;        /* procedure register */
+    uint32_t fpscr;        /* floating point status/control register */
+    uint32_t fpul;        /* floating point communication register */
 
     /* float point status register */
     float_status fp_status;
 
     /* Those belong to the specific unit (SH7750) but are handled here */
-    uint32_t mmucr;		/* MMU control register */
-    uint32_t pteh;		/* page table entry high register */
-    uint32_t ptel;		/* page table entry low register */
-    uint32_t ptea;		/* page table entry assistance register */
+    uint32_t mmucr;        /* MMU control register */
+    uint32_t pteh;        /* page table entry high register */
+    uint32_t ptel;        /* page table entry low register */
+    uint32_t ptea;        /* page table entry assistance register */
     uint32_t ttb;               /* translation table base register */
-    uint32_t tea;		/* TLB exception address register */
-    uint32_t tra;		/* TRAPA exception register */
-    uint32_t expevt;		/* exception event register */
-    uint32_t intevt;		/* interrupt event register */
+    uint32_t tea;        /* TLB exception address register */
+    uint32_t tra;        /* TRAPA exception register */
+    uint32_t expevt;        /* exception event register */
+    uint32_t intevt;        /* interrupt event register */
 
-    tlb_t itlb[ITLB_SIZE];	/* instruction translation table */
-    tlb_t utlb[UTLB_SIZE];	/* unified translation table */
+    tlb_t itlb[ITLB_SIZE];    /* instruction translation table */
+    tlb_t utlb[UTLB_SIZE];    /* unified translation table */
 
     /* LDST = LOCK_ADDR != -1.  */
     uint32_t lock_addr;
@@ -177,13 +177,13 @@ typedef struct CPUSH4State {
     struct {} end_reset_fields;
 
     /* Fields from here on are preserved over CPU reset. */
-    int id;			/* CPU model */
+    int id;            /* CPU model */
 
     /* The features that we should emulate. See sh_features above.  */
     uint32_t features;
 
     void *intc_handle;
-    int in_sleep;		/* SR_BL ignored during sleep */
+    int in_sleep;        /* SR_BL ignored during sleep */
     memory_content *movcal_backup;
     memory_content **movcal_backup_tail;
 } CPUSH4State;
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 2d622081e8..f177fc59fc 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -89,60 +89,60 @@ void superh_cpu_do_interrupt(CPUState *cs)
 
     if (do_irq) {
         irq_vector = sh_intc_get_pending_vector(env->intc_handle,
-						(env->sr >> 4) & 0xf);
+                        (env->sr >> 4) & 0xf);
         if (irq_vector == -1) {
             return; /* masked */
-	}
+    }
     }
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
-	const char *expname;
+    const char *expname;
         switch (cs->exception_index) {
-	case 0x0e0:
-	    expname = "addr_error";
-	    break;
-	case 0x040:
-	    expname = "tlb_miss";
-	    break;
-	case 0x0a0:
-	    expname = "tlb_violation";
-	    break;
-	case 0x180:
-	    expname = "illegal_instruction";
-	    break;
-	case 0x1a0:
-	    expname = "slot_illegal_instruction";
-	    break;
-	case 0x800:
-	    expname = "fpu_disable";
-	    break;
-	case 0x820:
-	    expname = "slot_fpu";
-	    break;
-	case 0x100:
-	    expname = "data_write";
-	    break;
-	case 0x060:
-	    expname = "dtlb_miss_write";
-	    break;
-	case 0x0c0:
-	    expname = "dtlb_violation_write";
-	    break;
-	case 0x120:
-	    expname = "fpu_exception";
-	    break;
-	case 0x080:
-	    expname = "initial_page_write";
-	    break;
-	case 0x160:
-	    expname = "trapa";
-	    break;
-	default:
+    case 0x0e0:
+        expname = "addr_error";
+        break;
+    case 0x040:
+        expname = "tlb_miss";
+        break;
+    case 0x0a0:
+        expname = "tlb_violation";
+        break;
+    case 0x180:
+        expname = "illegal_instruction";
+        break;
+    case 0x1a0:
+        expname = "slot_illegal_instruction";
+        break;
+    case 0x800:
+        expname = "fpu_disable";
+        break;
+    case 0x820:
+        expname = "slot_fpu";
+        break;
+    case 0x100:
+        expname = "data_write";
+        break;
+    case 0x060:
+        expname = "dtlb_miss_write";
+        break;
+    case 0x0c0:
+        expname = "dtlb_violation_write";
+        break;
+    case 0x120:
+        expname = "fpu_exception";
+        break;
+    case 0x080:
+        expname = "initial_page_write";
+        break;
+    case 0x160:
+        expname = "trapa";
+        break;
+    default:
             expname = do_irq ? "interrupt" : "???";
             break;
-	}
-	qemu_log("exception 0x%03x [%s] raised\n",
-		  irq_vector, expname);
+    }
+    qemu_log("exception 0x%03x [%s] raised\n",
+          irq_vector, expname);
         log_cpu_state(cs, 0);
     }
 
@@ -154,8 +154,8 @@ void superh_cpu_do_interrupt(CPUState *cs)
 
     if (env->flags & DELAY_SLOT_MASK) {
         /* Branch instruction should be executed again before delay slot. */
-	env->spc -= 2;
-	/* Clear flags for exception/interrupt routine. */
+    env->spc -= 2;
+    /* Clear flags for exception/interrupt routine. */
         env->flags &= ~DELAY_SLOT_MASK;
     }
 
@@ -196,19 +196,19 @@ static void update_itlb_use(CPUSH4State * env, int itlbnb)
 
     switch (itlbnb) {
     case 0:
-	and_mask = 0x1f;
-	break;
+    and_mask = 0x1f;
+    break;
     case 1:
-	and_mask = 0xe7;
-	or_mask = 0x80;
-	break;
+    and_mask = 0xe7;
+    or_mask = 0x80;
+    break;
     case 2:
-	and_mask = 0xfb;
-	or_mask = 0x50;
-	break;
+    and_mask = 0xfb;
+    or_mask = 0x50;
+    break;
     case 3:
-	or_mask = 0x2c;
-	break;
+    or_mask = 0x2c;
+    break;
     }
 
     env->mmucr &= (and_mask << 24) | 0x00ffffff;
@@ -218,16 +218,16 @@ static void update_itlb_use(CPUSH4State * env, int itlbnb)
 static int itlb_replacement(CPUSH4State * env)
 {
     if ((env->mmucr & 0xe0000000) == 0xe0000000) {
-	return 0;
+    return 0;
     }
     if ((env->mmucr & 0x98000000) == 0x18000000) {
-	return 1;
+    return 1;
     }
     if ((env->mmucr & 0x54000000) == 0x04000000) {
-	return 2;
+    return 2;
     }
     if ((env->mmucr & 0x2c000000) == 0x00000000) {
-	return 3;
+    return 3;
     }
     cpu_abort(env_cpu(env), "Unhandled itlb_replacement");
 }
@@ -236,7 +236,7 @@ static int itlb_replacement(CPUSH4State * env)
    Return entry, MMU_DTLB_MISS or MMU_DTLB_MULTIPLE
 */
 static int find_tlb_entry(CPUSH4State * env, target_ulong address,
-			  tlb_t * entries, uint8_t nbtlb, int use_asid)
+              tlb_t * entries, uint8_t nbtlb, int use_asid)
 {
     int match = MMU_DTLB_MISS;
     uint32_t start, end;
@@ -246,17 +246,17 @@ static int find_tlb_entry(CPUSH4State * env, target_ulong address,
     asid = env->pteh & 0xff;
 
     for (i = 0; i < nbtlb; i++) {
-	if (!entries[i].v)
-	    continue;		/* Invalid entry */
-	if (!entries[i].sh && use_asid && entries[i].asid != asid)
-	    continue;		/* Bad ASID */
-	start = (entries[i].vpn << 10) & ~(entries[i].size - 1);
-	end = start + entries[i].size - 1;
-	if (address >= start && address <= end) {	/* Match */
-	    if (match != MMU_DTLB_MISS)
-		return MMU_DTLB_MULTIPLE;	/* Multiple match */
-	    match = i;
-	}
+    if (!entries[i].v)
+        continue;        /* Invalid entry */
+    if (!entries[i].sh && use_asid && entries[i].asid != asid)
+        continue;        /* Bad ASID */
+    start = (entries[i].vpn << 10) & ~(entries[i].size - 1);
+    end = start + entries[i].size - 1;
+    if (address >= start && address <= end) {    /* Match */
+        if (match != MMU_DTLB_MISS)
+        return MMU_DTLB_MULTIPLE;    /* Multiple match */
+        match = i;
+    }
     }
     return match;
 }
@@ -270,7 +270,7 @@ static void increment_urc(CPUSH4State * env)
     urc = ((env->mmucr) >> 10) & 0x3f;
     urc++;
     if ((urb > 0 && urc > urb) || urc > (UTLB_SIZE - 1))
-	urc = 0;
+    urc = 0;
     env->mmucr = (env->mmucr & 0xffff03ff) | (urc << 10);
 }
 
@@ -302,11 +302,11 @@ static int find_itlb_entry(CPUSH4State * env, target_ulong address,
 
     e = find_tlb_entry(env, address, env->itlb, ITLB_SIZE, use_asid);
     if (e == MMU_DTLB_MULTIPLE) {
-	e = MMU_ITLB_MULTIPLE;
+    e = MMU_ITLB_MULTIPLE;
     } else if (e == MMU_DTLB_MISS) {
-	e = MMU_ITLB_MISS;
+    e = MMU_ITLB_MISS;
     } else if (e >= 0) {
-	update_itlb_use(env, e);
+    update_itlb_use(env, e);
     }
     return e;
 }
@@ -523,7 +523,7 @@ uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
 }
 
 void cpu_sh4_write_mmaped_itlb_addr(CPUSH4State *s, hwaddr addr,
-				    uint32_t mem_value)
+                    uint32_t mem_value)
 {
     uint32_t vpn = (mem_value & 0xfffffc00) >> 10;
     uint8_t v = (uint8_t)((mem_value & 0x00000100) >> 8);
@@ -606,7 +606,7 @@ uint32_t cpu_sh4_read_mmaped_utlb_addr(CPUSH4State *s,
 }
 
 void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
-				    uint32_t mem_value)
+                    uint32_t mem_value)
 {
     int associate = addr & 0x0000080;
     uint32_t vpn = (mem_value & 0xfffffc00) >> 10;
@@ -617,48 +617,48 @@ void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
 
     if (associate) {
         int i;
-	tlb_t * utlb_match_entry = NULL;
-	int needs_tlb_flush = 0;
+    tlb_t * utlb_match_entry = NULL;
+    int needs_tlb_flush = 0;
 
-	/* search UTLB */
-	for (i = 0; i < UTLB_SIZE; i++) {
+    /* search UTLB */
+    for (i = 0; i < UTLB_SIZE; i++) {
             tlb_t * entry = &s->utlb[i];
             if (!entry->v)
-	        continue;
+            continue;
 
             if (entry->vpn == vpn
                 && (!use_asid || entry->asid == asid || entry->sh)) {
-	        if (utlb_match_entry) {
+            if (utlb_match_entry) {
                     CPUState *cs = env_cpu(s);
 
-		    /* Multiple TLB Exception */
+            /* Multiple TLB Exception */
                     cs->exception_index = 0x140;
-		    s->tea = addr;
-		    break;
-	        }
-		if (entry->v && !v)
-		    needs_tlb_flush = 1;
-		entry->v = v;
-		entry->d = d;
-	        utlb_match_entry = entry;
-	    }
-	    increment_urc(s); /* per utlb access */
-	}
-
-	/* search ITLB */
-	for (i = 0; i < ITLB_SIZE; i++) {
+            s->tea = addr;
+            break;
+            }
+        if (entry->v && !v)
+            needs_tlb_flush = 1;
+        entry->v = v;
+        entry->d = d;
+            utlb_match_entry = entry;
+        }
+        increment_urc(s); /* per utlb access */
+    }
+
+    /* search ITLB */
+    for (i = 0; i < ITLB_SIZE; i++) {
             tlb_t * entry = &s->itlb[i];
             if (entry->vpn == vpn
                 && (!use_asid || entry->asid == asid || entry->sh)) {
-	        if (entry->v && !v)
-		    needs_tlb_flush = 1;
-	        if (utlb_match_entry)
-		    *entry = *utlb_match_entry;
-	        else
-		    entry->v = v;
-		break;
-	    }
-	}
+            if (entry->v && !v)
+            needs_tlb_flush = 1;
+            if (utlb_match_entry)
+            *entry = *utlb_match_entry;
+            else
+            entry->v = v;
+        break;
+        }
+    }
 
         if (needs_tlb_flush) {
             tlb_flush_page(env_cpu(s), vpn << 10);
@@ -666,18 +666,18 @@ void cpu_sh4_write_mmaped_utlb_addr(CPUSH4State *s, hwaddr addr,
     } else {
         int index = (addr & 0x00003f00) >> 8;
         tlb_t * entry = &s->utlb[index];
-	if (entry->v) {
+    if (entry->v) {
             CPUState *cs = env_cpu(s);
 
-	    /* Overwriting valid entry in utlb. */
+        /* Overwriting valid entry in utlb. */
             target_ulong address = entry->vpn << 10;
             tlb_flush_page(cs, address);
-	}
-	entry->asid = asid;
-	entry->vpn = vpn;
-	entry->d = d;
-	entry->v = v;
-	increment_urc(s);
+    }
+    entry->asid = asid;
+    entry->vpn = vpn;
+    entry->d = d;
+    entry->v = v;
+    increment_urc(s);
     }
 }
 
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..b910724dd3 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -113,12 +113,12 @@ void helper_movcal(CPUSH4State *env, uint32_t address, uint32_t value)
     {
         memory_content *r = g_new(memory_content, 1);
 
-	r->address = address;
-	r->value = value;
-	r->next = NULL;
+    r->address = address;
+    r->value = value;
+    r->next = NULL;
 
-	*(env->movcal_backup_tail) = r;
-	env->movcal_backup_tail = &(r->next);
+    *(env->movcal_backup_tail) = r;
+    env->movcal_backup_tail = &(r->next);
     }
 }
 
@@ -128,11 +128,11 @@ void helper_discard_movcal_backup(CPUSH4State *env)
 
     while(current)
     {
-	memory_content *next = current->next;
+    memory_content *next = current->next;
         g_free(current);
-	env->movcal_backup = current = next;
-	if (current == NULL)
-	    env->movcal_backup_tail = &(env->movcal_backup);
+    env->movcal_backup = current = next;
+    if (current == NULL)
+        env->movcal_backup_tail = &(env->movcal_backup);
     } 
 }
 
@@ -141,21 +141,21 @@ void helper_ocbi(CPUSH4State *env, uint32_t address)
     memory_content **current = &(env->movcal_backup);
     while (*current)
     {
-	uint32_t a = (*current)->address;
-	if ((a & ~0x1F) == (address & ~0x1F))
-	{
-	    memory_content *next = (*current)->next;
+    uint32_t a = (*current)->address;
+    if ((a & ~0x1F) == (address & ~0x1F))
+    {
+        memory_content *next = (*current)->next;
             cpu_stl_data(env, a, (*current)->value);
-	    
-	    if (next == NULL)
-	    {
-		env->movcal_backup_tail = current;
-	    }
+        
+        if (next == NULL)
+        {
+        env->movcal_backup_tail = current;
+        }
 
             g_free(*current);
-	    *current = next;
-	    break;
-	}
+        *current = next;
+        break;
+    }
     }
 }
 
@@ -168,10 +168,10 @@ void helper_macl(CPUSH4State *env, uint32_t arg0, uint32_t arg1)
     env->mach = (res >> 32) & 0xffffffff;
     env->macl = res & 0xffffffff;
     if (env->sr & (1u << SR_S)) {
-	if (res < 0)
-	    env->mach |= 0xffff0000;
-	else
-	    env->mach &= 0x00007fff;
+    if (res < 0)
+        env->mach |= 0xffff0000;
+    else
+        env->mach &= 0x00007fff;
     }
 }
 
@@ -184,13 +184,13 @@ void helper_macw(CPUSH4State *env, uint32_t arg0, uint32_t arg1)
     env->mach = (res >> 32) & 0xffffffff;
     env->macl = res & 0xffffffff;
     if (env->sr & (1u << SR_S)) {
-	if (res < -0x80000000) {
-	    env->mach = 1;
-	    env->macl = 0x80000000;
-	} else if (res > 0x000000007fffffff) {
-	    env->mach = 1;
-	    env->macl = 0x7fffffff;
-	}
+    if (res < -0x80000000) {
+        env->mach = 1;
+        env->macl = 0x80000000;
+    } else if (res > 0x000000007fffffff) {
+        env->mach = 1;
+        env->macl = 0x7fffffff;
+    }
     }
 }
 
@@ -198,9 +198,9 @@ void helper_ld_fpscr(CPUSH4State *env, uint32_t val)
 {
     env->fpscr = val & FPSCR_MASK;
     if ((val & FPSCR_RM_MASK) == FPSCR_RM_ZERO) {
-	set_float_rounding_mode(float_round_to_zero, &env->fp_status);
+    set_float_rounding_mode(float_round_to_zero, &env->fp_status);
     } else {
-	set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
+    set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
     }
     set_flush_to_zero((val & FPSCR_DN) != 0, &env->fp_status);
 }
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 9312790623..28a768c6fa 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -136,10 +136,10 @@ void sh4_translate_init(void)
                                       offsetof(CPUSH4State, fpul), "FPUL");
 
     cpu_flags = tcg_global_mem_new_i32(cpu_env,
-				       offsetof(CPUSH4State, flags), "_flags_");
+                       offsetof(CPUSH4State, flags), "_flags_");
     cpu_delayed_pc = tcg_global_mem_new_i32(cpu_env,
-					    offsetof(CPUSH4State, delayed_pc),
-					    "_delayed_pc_");
+                        offsetof(CPUSH4State, delayed_pc),
+                        "_delayed_pc_");
     cpu_delayed_cond = tcg_global_mem_new_i32(cpu_env,
                                               offsetof(CPUSH4State,
                                                        delayed_cond),
@@ -171,15 +171,15 @@ void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->sgr, env->dbr, env->delayed_pc, env->fpul);
     for (i = 0; i < 24; i += 4) {
         qemu_printf("r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
-		    i, env->gregs[i], i + 1, env->gregs[i + 1],
-		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
+            i, env->gregs[i], i + 1, env->gregs[i + 1],
+            i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
     }
     if (env->flags & DELAY_SLOT) {
         qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+            env->delayed_pc);
     } else if (env->flags & DELAY_SLOT_CONDITIONAL) {
         qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+            env->delayed_pc);
     } else if (env->flags & DELAY_SLOT_RTE) {
         qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
                      env->delayed_pc);
@@ -260,9 +260,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 static void gen_jump(DisasContext * ctx)
 {
     if (ctx->delayed_pc == -1) {
-	/* Target is not statically known, it comes necessarily from a
-	   delayed jump as immediate jump are conditinal jumps */
-	tcg_gen_mov_i32(cpu_pc, cpu_delayed_pc);
+    /* Target is not statically known, it comes necessarily from a
+       delayed jump as immediate jump are conditinal jumps */
+    tcg_gen_mov_i32(cpu_pc, cpu_delayed_pc);
         tcg_gen_discard_i32(cpu_delayed_pc);
         if (ctx->base.singlestep_enabled) {
             gen_helper_debug(cpu_env);
@@ -273,7 +273,7 @@ static void gen_jump(DisasContext * ctx)
         }
         ctx->base.is_jmp = DISAS_NORETURN;
     } else {
-	gen_goto_tb(ctx, 0, ctx->delayed_pc);
+    gen_goto_tb(ctx, 0, ctx->delayed_pc);
     }
 }
 
@@ -421,103 +421,103 @@ static void _decode_opc(DisasContext * ctx)
        TB, or if we already saw movca.l in this TB and did not flush stores
        yet.  */
     if (ctx->has_movcal)
-	{
-	  int opcode = ctx->opcode & 0xf0ff;
-	  if (opcode != 0x0093 /* ocbi */
-	      && opcode != 0x00c3 /* movca.l */)
-	      {
+    {
+      int opcode = ctx->opcode & 0xf0ff;
+      if (opcode != 0x0093 /* ocbi */
+          && opcode != 0x00c3 /* movca.l */)
+          {
                   gen_helper_discard_movcal_backup(cpu_env);
-		  ctx->has_movcal = 0;
-	      }
-	}
+          ctx->has_movcal = 0;
+          }
+    }
 
 #if 0
     fprintf(stderr, "Translating opcode 0x%04x\n", ctx->opcode);
 #endif
 
     switch (ctx->opcode) {
-    case 0x0019:		/* div0u */
+    case 0x0019:        /* div0u */
         tcg_gen_movi_i32(cpu_sr_m, 0);
         tcg_gen_movi_i32(cpu_sr_q, 0);
         tcg_gen_movi_i32(cpu_sr_t, 0);
-	return;
-    case 0x000b:		/* rts */
-	CHECK_NOT_DELAY_SLOT
-	tcg_gen_mov_i32(cpu_delayed_pc, cpu_pr);
+    return;
+    case 0x000b:        /* rts */
+    CHECK_NOT_DELAY_SLOT
+    tcg_gen_mov_i32(cpu_delayed_pc, cpu_pr);
         ctx->envflags |= DELAY_SLOT;
-	ctx->delayed_pc = (uint32_t) - 1;
-	return;
-    case 0x0028:		/* clrmac */
-	tcg_gen_movi_i32(cpu_mach, 0);
-	tcg_gen_movi_i32(cpu_macl, 0);
-	return;
-    case 0x0048:		/* clrs */
+    ctx->delayed_pc = (uint32_t) - 1;
+    return;
+    case 0x0028:        /* clrmac */
+    tcg_gen_movi_i32(cpu_mach, 0);
+    tcg_gen_movi_i32(cpu_macl, 0);
+    return;
+    case 0x0048:        /* clrs */
         tcg_gen_andi_i32(cpu_sr, cpu_sr, ~(1u << SR_S));
-	return;
-    case 0x0008:		/* clrt */
+    return;
+    case 0x0008:        /* clrt */
         tcg_gen_movi_i32(cpu_sr_t, 0);
-	return;
-    case 0x0038:		/* ldtlb */
-	CHECK_PRIVILEGED
+    return;
+    case 0x0038:        /* ldtlb */
+    CHECK_PRIVILEGED
         gen_helper_ldtlb(cpu_env);
-	return;
-    case 0x002b:		/* rte */
-	CHECK_PRIVILEGED
-	CHECK_NOT_DELAY_SLOT
+    return;
+    case 0x002b:        /* rte */
+    CHECK_PRIVILEGED
+    CHECK_NOT_DELAY_SLOT
         gen_write_sr(cpu_ssr);
-	tcg_gen_mov_i32(cpu_delayed_pc, cpu_spc);
+    tcg_gen_mov_i32(cpu_delayed_pc, cpu_spc);
         ctx->envflags |= DELAY_SLOT_RTE;
-	ctx->delayed_pc = (uint32_t) - 1;
+    ctx->delayed_pc = (uint32_t) - 1;
         ctx->base.is_jmp = DISAS_STOP;
-	return;
-    case 0x0058:		/* sets */
+    return;
+    case 0x0058:        /* sets */
         tcg_gen_ori_i32(cpu_sr, cpu_sr, (1u << SR_S));
-	return;
-    case 0x0018:		/* sett */
+    return;
+    case 0x0018:        /* sett */
         tcg_gen_movi_i32(cpu_sr_t, 1);
-	return;
-    case 0xfbfd:		/* frchg */
+    return;
+    case 0xfbfd:        /* frchg */
         CHECK_FPSCR_PR_0
-	tcg_gen_xori_i32(cpu_fpscr, cpu_fpscr, FPSCR_FR);
+    tcg_gen_xori_i32(cpu_fpscr, cpu_fpscr, FPSCR_FR);
         ctx->base.is_jmp = DISAS_STOP;
-	return;
-    case 0xf3fd:		/* fschg */
+    return;
+    case 0xf3fd:        /* fschg */
         CHECK_FPSCR_PR_0
         tcg_gen_xori_i32(cpu_fpscr, cpu_fpscr, FPSCR_SZ);
         ctx->base.is_jmp = DISAS_STOP;
-	return;
+    return;
     case 0xf7fd:                /* fpchg */
         CHECK_SH4A
         tcg_gen_xori_i32(cpu_fpscr, cpu_fpscr, FPSCR_PR);
         ctx->base.is_jmp = DISAS_STOP;
         return;
-    case 0x0009:		/* nop */
-	return;
-    case 0x001b:		/* sleep */
-	CHECK_PRIVILEGED
+    case 0x0009:        /* nop */
+    return;
+    case 0x001b:        /* sleep */
+    CHECK_PRIVILEGED
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next + 2);
         gen_helper_sleep(cpu_env);
-	return;
+    return;
     }
 
     switch (ctx->opcode & 0xf000) {
-    case 0x1000:		/* mov.l Rm,@(disp,Rn) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
+    case 0x1000:        /* mov.l Rm,@(disp,Rn) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x5000:		/* mov.l @(disp,Rm),Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x5000:        /* mov.l @(disp,Rm),Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xe000:		/* mov #imm,Rn */
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xe000:        /* mov #imm,Rn */
 #ifdef CONFIG_USER_ONLY
         /* Detect the start of a gUSA region.  If so, update envflags
            and end the TB.  This will allow us to see the end of the
@@ -528,179 +528,179 @@ static void _decode_opc(DisasContext * ctx)
             ctx->base.is_jmp = DISAS_STOP;
         }
 #endif
-	tcg_gen_movi_i32(REG(B11_8), B7_0s);
-	return;
-    case 0x9000:		/* mov.w @(disp,PC),Rn */
-	{
+    tcg_gen_movi_i32(REG(B11_8), B7_0s);
+    return;
+    case 0x9000:        /* mov.w @(disp,PC),Rn */
+    {
             TCGv addr = tcg_const_i32(ctx->base.pc_next + 4 + B7_0 * 2);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xd000:		/* mov.l @(disp,PC),Rn */
-	{
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xd000:        /* mov.l @(disp,PC),Rn */
+    {
             TCGv addr = tcg_const_i32((ctx->base.pc_next + 4 + B7_0 * 4) & ~3);
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x7000:		/* add #imm,Rn */
-	tcg_gen_addi_i32(REG(B11_8), REG(B11_8), B7_0s);
-	return;
-    case 0xa000:		/* bra disp */
-	CHECK_NOT_DELAY_SLOT
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x7000:        /* add #imm,Rn */
+    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), B7_0s);
+    return;
+    case 0xa000:        /* bra disp */
+    CHECK_NOT_DELAY_SLOT
         ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
         ctx->envflags |= DELAY_SLOT;
-	return;
-    case 0xb000:		/* bsr disp */
-	CHECK_NOT_DELAY_SLOT
+    return;
+    case 0xb000:        /* bsr disp */
+    CHECK_NOT_DELAY_SLOT
         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
         ctx->delayed_pc = ctx->base.pc_next + 4 + B11_0s * 2;
         ctx->envflags |= DELAY_SLOT;
-	return;
+    return;
     }
 
     switch (ctx->opcode & 0xf00f) {
-    case 0x6003:		/* mov Rm,Rn */
-	tcg_gen_mov_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x2000:		/* mov.b Rm,@Rn */
+    case 0x6003:        /* mov Rm,Rn */
+    tcg_gen_mov_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x2000:        /* mov.b Rm,@Rn */
         tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_UB);
-	return;
-    case 0x2001:		/* mov.w Rm,@Rn */
+    return;
+    case 0x2001:        /* mov.w Rm,@Rn */
         tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUW);
-	return;
-    case 0x2002:		/* mov.l Rm,@Rn */
+    return;
+    case 0x2002:        /* mov.l Rm,@Rn */
         tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
-	return;
-    case 0x6000:		/* mov.b @Rm,Rn */
+    return;
+    case 0x6000:        /* mov.b @Rm,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_SB);
-	return;
-    case 0x6001:		/* mov.w @Rm,Rn */
+    return;
+    case 0x6001:        /* mov.w @Rm,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
-	return;
-    case 0x6002:		/* mov.l @Rm,Rn */
+    return;
+    case 0x6002:        /* mov.l @Rm,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
-	return;
-    case 0x2004:		/* mov.b Rm,@-Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_subi_i32(addr, REG(B11_8), 1);
+    return;
+    case 0x2004:        /* mov.b Rm,@-Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_subi_i32(addr, REG(B11_8), 1);
             /* might cause re-execution */
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_UB);
-	    tcg_gen_mov_i32(REG(B11_8), addr);			/* modify register status */
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x2005:		/* mov.w Rm,@-Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_subi_i32(addr, REG(B11_8), 2);
+        tcg_gen_mov_i32(REG(B11_8), addr);            /* modify register status */
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x2005:        /* mov.w Rm,@-Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_subi_i32(addr, REG(B11_8), 2);
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
-	    tcg_gen_mov_i32(REG(B11_8), addr);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x2006:		/* mov.l Rm,@-Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
+        tcg_gen_mov_i32(REG(B11_8), addr);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x2006:        /* mov.l Rm,@-Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_subi_i32(addr, REG(B11_8), 4);
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
-	    tcg_gen_mov_i32(REG(B11_8), addr);
+        tcg_gen_mov_i32(REG(B11_8), addr);
         tcg_temp_free(addr);
-	}
-	return;
-    case 0x6004:		/* mov.b @Rm+,Rn */
+    }
+    return;
+    case 0x6004:        /* mov.b @Rm+,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_SB);
-	if ( B11_8 != B7_4 )
-		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 1);
-	return;
-    case 0x6005:		/* mov.w @Rm+,Rn */
+    if ( B11_8 != B7_4 )
+        tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 1);
+    return;
+    case 0x6005:        /* mov.w @Rm+,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
-	if ( B11_8 != B7_4 )
-		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
-	return;
-    case 0x6006:		/* mov.l @Rm+,Rn */
+    if ( B11_8 != B7_4 )
+        tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
+    return;
+    case 0x6006:        /* mov.l @Rm+,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
-	if ( B11_8 != B7_4 )
-		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
-	return;
-    case 0x0004:		/* mov.b Rm,@(R0,Rn) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
+    if ( B11_8 != B7_4 )
+        tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
+    return;
+    case 0x0004:        /* mov.b Rm,@(R0,Rn) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x0005:		/* mov.w Rm,@(R0,Rn) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x0005:        /* mov.w Rm,@(R0,Rn) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x0006:		/* mov.l Rm,@(R0,Rn) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x0006:        /* mov.l Rm,@(R0,Rn) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x000c:		/* mov.b @(R0,Rm),Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x000c:        /* mov.b @(R0,Rm),Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_SB);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x000d:		/* mov.w @(R0,Rm),Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x000d:        /* mov.w @(R0,Rm),Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x000e:		/* mov.l @(R0,Rm),Rn */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x000e:        /* mov.l @(R0,Rm),Rn */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x6008:		/* swap.b Rm,Rn */
-	{
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x6008:        /* swap.b Rm,Rn */
+    {
             TCGv low = tcg_temp_new();
-	    tcg_gen_ext16u_i32(low, REG(B7_4));
-	    tcg_gen_bswap16_i32(low, low);
+        tcg_gen_ext16u_i32(low, REG(B7_4));
+        tcg_gen_bswap16_i32(low, low);
             tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
-	    tcg_temp_free(low);
-	}
-	return;
-    case 0x6009:		/* swap.w Rm,Rn */
+        tcg_temp_free(low);
+    }
+    return;
+    case 0x6009:        /* swap.w Rm,Rn */
         tcg_gen_rotli_i32(REG(B11_8), REG(B7_4), 16);
-	return;
-    case 0x200d:		/* xtrct Rm,Rn */
-	{
-	    TCGv high, low;
-	    high = tcg_temp_new();
-	    tcg_gen_shli_i32(high, REG(B7_4), 16);
-	    low = tcg_temp_new();
-	    tcg_gen_shri_i32(low, REG(B11_8), 16);
-	    tcg_gen_or_i32(REG(B11_8), high, low);
-	    tcg_temp_free(low);
-	    tcg_temp_free(high);
-	}
-	return;
-    case 0x300c:		/* add Rm,Rn */
-	tcg_gen_add_i32(REG(B11_8), REG(B11_8), REG(B7_4));
-	return;
-    case 0x300e:		/* addc Rm,Rn */
+    return;
+    case 0x200d:        /* xtrct Rm,Rn */
+    {
+        TCGv high, low;
+        high = tcg_temp_new();
+        tcg_gen_shli_i32(high, REG(B7_4), 16);
+        low = tcg_temp_new();
+        tcg_gen_shri_i32(low, REG(B11_8), 16);
+        tcg_gen_or_i32(REG(B11_8), high, low);
+        tcg_temp_free(low);
+        tcg_temp_free(high);
+    }
+    return;
+    case 0x300c:        /* add Rm,Rn */
+    tcg_gen_add_i32(REG(B11_8), REG(B11_8), REG(B7_4));
+    return;
+    case 0x300e:        /* addc Rm,Rn */
         {
             TCGv t0, t1;
             t0 = tcg_const_tl(0);
@@ -711,8 +711,8 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(t0);
             tcg_temp_free(t1);
         }
-	return;
-    case 0x300f:		/* addv Rm,Rn */
+    return;
+    case 0x300f:        /* addv Rm,Rn */
         {
             TCGv t0, t1, t2;
             t0 = tcg_temp_new();
@@ -728,44 +728,44 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_mov_i32(REG(B7_4), t0);
             tcg_temp_free(t0);
         }
-	return;
-    case 0x2009:		/* and Rm,Rn */
-	tcg_gen_and_i32(REG(B11_8), REG(B11_8), REG(B7_4));
-	return;
-    case 0x3000:		/* cmp/eq Rm,Rn */
+    return;
+    case 0x2009:        /* and Rm,Rn */
+    tcg_gen_and_i32(REG(B11_8), REG(B11_8), REG(B7_4));
+    return;
+    case 0x3000:        /* cmp/eq Rm,Rn */
         tcg_gen_setcond_i32(TCG_COND_EQ, cpu_sr_t, REG(B11_8), REG(B7_4));
-	return;
-    case 0x3003:		/* cmp/ge Rm,Rn */
+    return;
+    case 0x3003:        /* cmp/ge Rm,Rn */
         tcg_gen_setcond_i32(TCG_COND_GE, cpu_sr_t, REG(B11_8), REG(B7_4));
-	return;
-    case 0x3007:		/* cmp/gt Rm,Rn */
+    return;
+    case 0x3007:        /* cmp/gt Rm,Rn */
         tcg_gen_setcond_i32(TCG_COND_GT, cpu_sr_t, REG(B11_8), REG(B7_4));
-	return;
-    case 0x3006:		/* cmp/hi Rm,Rn */
+    return;
+    case 0x3006:        /* cmp/hi Rm,Rn */
         tcg_gen_setcond_i32(TCG_COND_GTU, cpu_sr_t, REG(B11_8), REG(B7_4));
-	return;
-    case 0x3002:		/* cmp/hs Rm,Rn */
+    return;
+    case 0x3002:        /* cmp/hs Rm,Rn */
         tcg_gen_setcond_i32(TCG_COND_GEU, cpu_sr_t, REG(B11_8), REG(B7_4));
-	return;
-    case 0x200c:		/* cmp/str Rm,Rn */
-	{
-	    TCGv cmp1 = tcg_temp_new();
-	    TCGv cmp2 = tcg_temp_new();
+    return;
+    case 0x200c:        /* cmp/str Rm,Rn */
+    {
+        TCGv cmp1 = tcg_temp_new();
+        TCGv cmp2 = tcg_temp_new();
             tcg_gen_xor_i32(cmp2, REG(B7_4), REG(B11_8));
             tcg_gen_subi_i32(cmp1, cmp2, 0x01010101);
             tcg_gen_andc_i32(cmp1, cmp1, cmp2);
             tcg_gen_andi_i32(cmp1, cmp1, 0x80808080);
             tcg_gen_setcondi_i32(TCG_COND_NE, cpu_sr_t, cmp1, 0);
-	    tcg_temp_free(cmp2);
-	    tcg_temp_free(cmp1);
-	}
-	return;
-    case 0x2007:		/* div0s Rm,Rn */
+        tcg_temp_free(cmp2);
+        tcg_temp_free(cmp1);
+    }
+    return;
+    case 0x2007:        /* div0s Rm,Rn */
         tcg_gen_shri_i32(cpu_sr_q, REG(B11_8), 31);         /* SR_Q */
         tcg_gen_shri_i32(cpu_sr_m, REG(B7_4), 31);          /* SR_M */
         tcg_gen_xor_i32(cpu_sr_t, cpu_sr_q, cpu_sr_m);      /* SR_T */
-	return;
-    case 0x3004:		/* div1 Rm,Rn */
+    return;
+    case 0x3004:        /* div1 Rm,Rn */
         {
             TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
@@ -799,84 +799,84 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(t1);
             tcg_temp_free(t0);
         }
-	return;
-    case 0x300d:		/* dmuls.l Rm,Rn */
+    return;
+    case 0x300d:        /* dmuls.l Rm,Rn */
         tcg_gen_muls2_i32(cpu_macl, cpu_mach, REG(B7_4), REG(B11_8));
-	return;
-    case 0x3005:		/* dmulu.l Rm,Rn */
+    return;
+    case 0x3005:        /* dmulu.l Rm,Rn */
         tcg_gen_mulu2_i32(cpu_macl, cpu_mach, REG(B7_4), REG(B11_8));
-	return;
-    case 0x600e:		/* exts.b Rm,Rn */
-	tcg_gen_ext8s_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x600f:		/* exts.w Rm,Rn */
-	tcg_gen_ext16s_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x600c:		/* extu.b Rm,Rn */
-	tcg_gen_ext8u_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x600d:		/* extu.w Rm,Rn */
-	tcg_gen_ext16u_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x000f:		/* mac.l @Rm+,@Rn+ */
-	{
-	    TCGv arg0, arg1;
-	    arg0 = tcg_temp_new();
+    return;
+    case 0x600e:        /* exts.b Rm,Rn */
+    tcg_gen_ext8s_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x600f:        /* exts.w Rm,Rn */
+    tcg_gen_ext16s_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x600c:        /* extu.b Rm,Rn */
+    tcg_gen_ext8u_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x600d:        /* extu.w Rm,Rn */
+    tcg_gen_ext16u_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x000f:        /* mac.l @Rm+,@Rn+ */
+    {
+        TCGv arg0, arg1;
+        arg0 = tcg_temp_new();
             tcg_gen_qemu_ld_i32(arg0, REG(B7_4), ctx->memidx, MO_TESL);
-	    arg1 = tcg_temp_new();
+        arg1 = tcg_temp_new();
             tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx, MO_TESL);
             gen_helper_macl(cpu_env, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
-	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
-	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
-	}
-	return;
-    case 0x400f:		/* mac.w @Rm+,@Rn+ */
-	{
-	    TCGv arg0, arg1;
-	    arg0 = tcg_temp_new();
+        tcg_temp_free(arg1);
+        tcg_temp_free(arg0);
+        tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
+        tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
+    }
+    return;
+    case 0x400f:        /* mac.w @Rm+,@Rn+ */
+    {
+        TCGv arg0, arg1;
+        arg0 = tcg_temp_new();
             tcg_gen_qemu_ld_i32(arg0, REG(B7_4), ctx->memidx, MO_TESL);
-	    arg1 = tcg_temp_new();
+        arg1 = tcg_temp_new();
             tcg_gen_qemu_ld_i32(arg1, REG(B11_8), ctx->memidx, MO_TESL);
             gen_helper_macw(cpu_env, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
-	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 2);
-	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
-	}
-	return;
-    case 0x0007:		/* mul.l Rm,Rn */
-	tcg_gen_mul_i32(cpu_macl, REG(B7_4), REG(B11_8));
-	return;
-    case 0x200f:		/* muls.w Rm,Rn */
-	{
-	    TCGv arg0, arg1;
-	    arg0 = tcg_temp_new();
-	    tcg_gen_ext16s_i32(arg0, REG(B7_4));
-	    arg1 = tcg_temp_new();
-	    tcg_gen_ext16s_i32(arg1, REG(B11_8));
-	    tcg_gen_mul_i32(cpu_macl, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
-	}
-	return;
-    case 0x200e:		/* mulu.w Rm,Rn */
-	{
-	    TCGv arg0, arg1;
-	    arg0 = tcg_temp_new();
-	    tcg_gen_ext16u_i32(arg0, REG(B7_4));
-	    arg1 = tcg_temp_new();
-	    tcg_gen_ext16u_i32(arg1, REG(B11_8));
-	    tcg_gen_mul_i32(cpu_macl, arg0, arg1);
-	    tcg_temp_free(arg1);
-	    tcg_temp_free(arg0);
-	}
-	return;
-    case 0x600b:		/* neg Rm,Rn */
-	tcg_gen_neg_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x600a:		/* negc Rm,Rn */
+        tcg_temp_free(arg1);
+        tcg_temp_free(arg0);
+        tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 2);
+        tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
+    }
+    return;
+    case 0x0007:        /* mul.l Rm,Rn */
+    tcg_gen_mul_i32(cpu_macl, REG(B7_4), REG(B11_8));
+    return;
+    case 0x200f:        /* muls.w Rm,Rn */
+    {
+        TCGv arg0, arg1;
+        arg0 = tcg_temp_new();
+        tcg_gen_ext16s_i32(arg0, REG(B7_4));
+        arg1 = tcg_temp_new();
+        tcg_gen_ext16s_i32(arg1, REG(B11_8));
+        tcg_gen_mul_i32(cpu_macl, arg0, arg1);
+        tcg_temp_free(arg1);
+        tcg_temp_free(arg0);
+    }
+    return;
+    case 0x200e:        /* mulu.w Rm,Rn */
+    {
+        TCGv arg0, arg1;
+        arg0 = tcg_temp_new();
+        tcg_gen_ext16u_i32(arg0, REG(B7_4));
+        arg1 = tcg_temp_new();
+        tcg_gen_ext16u_i32(arg1, REG(B11_8));
+        tcg_gen_mul_i32(cpu_macl, arg0, arg1);
+        tcg_temp_free(arg1);
+        tcg_temp_free(arg0);
+    }
+    return;
+    case 0x600b:        /* neg Rm,Rn */
+    tcg_gen_neg_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x600a:        /* negc Rm,Rn */
         {
             TCGv t0 = tcg_const_i32(0);
             tcg_gen_add2_i32(REG(B11_8), cpu_sr_t,
@@ -886,15 +886,15 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_andi_i32(cpu_sr_t, cpu_sr_t, 1);
             tcg_temp_free(t0);
         }
-	return;
-    case 0x6007:		/* not Rm,Rn */
-	tcg_gen_not_i32(REG(B11_8), REG(B7_4));
-	return;
-    case 0x200b:		/* or Rm,Rn */
-	tcg_gen_or_i32(REG(B11_8), REG(B11_8), REG(B7_4));
-	return;
-    case 0x400c:		/* shad Rm,Rn */
-	{
+    return;
+    case 0x6007:        /* not Rm,Rn */
+    tcg_gen_not_i32(REG(B11_8), REG(B7_4));
+    return;
+    case 0x200b:        /* or Rm,Rn */
+    tcg_gen_or_i32(REG(B11_8), REG(B11_8), REG(B7_4));
+    return;
+    case 0x400c:        /* shad Rm,Rn */
+    {
             TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
@@ -917,10 +917,10 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(t0);
             tcg_temp_free(t1);
             tcg_temp_free(t2);
-	}
-	return;
-    case 0x400d:		/* shld Rm,Rn */
-	{
+    }
+    return;
+    case 0x400d:        /* shld Rm,Rn */
+    {
             TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
@@ -943,12 +943,12 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(t0);
             tcg_temp_free(t1);
             tcg_temp_free(t2);
-	}
-	return;
-    case 0x3008:		/* sub Rm,Rn */
-	tcg_gen_sub_i32(REG(B11_8), REG(B11_8), REG(B7_4));
-	return;
-    case 0x300a:		/* subc Rm,Rn */
+    }
+    return;
+    case 0x3008:        /* sub Rm,Rn */
+    tcg_gen_sub_i32(REG(B11_8), REG(B11_8), REG(B7_4));
+    return;
+    case 0x300a:        /* subc Rm,Rn */
         {
             TCGv t0, t1;
             t0 = tcg_const_tl(0);
@@ -960,8 +960,8 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(t0);
             tcg_temp_free(t1);
         }
-	return;
-    case 0x300b:		/* subv Rm,Rn */
+    return;
+    case 0x300b:        /* subv Rm,Rn */
         {
             TCGv t0, t1, t2;
             t0 = tcg_temp_new();
@@ -977,66 +977,66 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_mov_i32(REG(B11_8), t0);
             tcg_temp_free(t0);
         }
-	return;
-    case 0x2008:		/* tst Rm,Rn */
-	{
-	    TCGv val = tcg_temp_new();
-	    tcg_gen_and_i32(val, REG(B7_4), REG(B11_8));
+    return;
+    case 0x2008:        /* tst Rm,Rn */
+    {
+        TCGv val = tcg_temp_new();
+        tcg_gen_and_i32(val, REG(B7_4), REG(B11_8));
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-	    tcg_temp_free(val);
-	}
-	return;
-    case 0x200a:		/* xor Rm,Rn */
-	tcg_gen_xor_i32(REG(B11_8), REG(B11_8), REG(B7_4));
-	return;
+        tcg_temp_free(val);
+    }
+    return;
+    case 0x200a:        /* xor Rm,Rn */
+    tcg_gen_xor_i32(REG(B11_8), REG(B11_8), REG(B7_4));
+    return;
     case 0xf00c: /* fmov {F,D,X}Rm,{F,D,X}Rn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
             int xsrc = XHACK(B7_4);
             int xdst = XHACK(B11_8);
             tcg_gen_mov_i32(FREG(xdst), FREG(xsrc));
             tcg_gen_mov_i32(FREG(xdst + 1), FREG(xsrc + 1));
-	} else {
+    } else {
             tcg_gen_mov_i32(FREG(B11_8), FREG(B7_4));
-	}
-	return;
+    }
+    return;
     case 0xf00a: /* fmov {F,D,X}Rm,@Rn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
             TCGv_i64 fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, XHACK(B7_4));
             tcg_gen_qemu_st_i64(fp, REG(B11_8), ctx->memidx, MO_TEQ);
             tcg_temp_free_i64(fp);
-	} else {
+    } else {
             tcg_gen_qemu_st_i32(FREG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
-	}
-	return;
+    }
+    return;
     case 0xf008: /* fmov @Rm,{F,D,X}Rn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
             TCGv_i64 fp = tcg_temp_new_i64();
             tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEQ);
             gen_store_fpr64(ctx, fp, XHACK(B11_8));
             tcg_temp_free_i64(fp);
-	} else {
+    } else {
             tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx, MO_TEUL);
-	}
-	return;
+    }
+    return;
     case 0xf009: /* fmov @Rm+,{F,D,X}Rn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_SZ) {
             TCGv_i64 fp = tcg_temp_new_i64();
             tcg_gen_qemu_ld_i64(fp, REG(B7_4), ctx->memidx, MO_TEQ);
             gen_store_fpr64(ctx, fp, XHACK(B11_8));
             tcg_temp_free_i64(fp);
             tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 8);
-	} else {
+    } else {
             tcg_gen_qemu_ld_i32(FREG(B11_8), REG(B7_4), ctx->memidx, MO_TEUL);
-	    tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
-	}
-	return;
+        tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
+    }
+    return;
     case 0xf00b: /* fmov {F,D,X}Rm,@-Rn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         {
             TCGv addr = tcg_temp_new_i32();
             if (ctx->tbflags & FPSCR_SZ) {
@@ -1052,110 +1052,110 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_mov_i32(REG(B11_8), addr);
             tcg_temp_free(addr);
         }
-	return;
+    return;
     case 0xf006: /* fmov @(R0,Rm),{F,D,X}Rm - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
-	{
-	    TCGv addr = tcg_temp_new_i32();
-	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
+    CHECK_FPU_ENABLED
+    {
+        TCGv addr = tcg_temp_new_i32();
+        tcg_gen_add_i32(addr, REG(B7_4), REG(0));
             if (ctx->tbflags & FPSCR_SZ) {
                 TCGv_i64 fp = tcg_temp_new_i64();
                 tcg_gen_qemu_ld_i64(fp, addr, ctx->memidx, MO_TEQ);
                 gen_store_fpr64(ctx, fp, XHACK(B11_8));
                 tcg_temp_free_i64(fp);
-	    } else {
+        } else {
                 tcg_gen_qemu_ld_i32(FREG(B11_8), addr, ctx->memidx, MO_TEUL);
-	    }
-	    tcg_temp_free(addr);
-	}
-	return;
+        }
+        tcg_temp_free(addr);
+    }
+    return;
     case 0xf007: /* fmov {F,D,X}Rn,@(R0,Rn) - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
+    CHECK_FPU_ENABLED
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(B11_8), REG(0));
             if (ctx->tbflags & FPSCR_SZ) {
                 TCGv_i64 fp = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp, XHACK(B7_4));
                 tcg_gen_qemu_st_i64(fp, addr, ctx->memidx, MO_TEQ);
                 tcg_temp_free_i64(fp);
-	    } else {
+        } else {
                 tcg_gen_qemu_st_i32(FREG(B7_4), addr, ctx->memidx, MO_TEUL);
-	    }
-	    tcg_temp_free(addr);
-	}
-	return;
+        }
+        tcg_temp_free(addr);
+    }
+    return;
     case 0xf000: /* fadd Rm,Rn - FPSCR: R[PR,Enable.O/U/I]/W[Cause,Flag] */
     case 0xf001: /* fsub Rm,Rn - FPSCR: R[PR,Enable.O/U/I]/W[Cause,Flag] */
     case 0xf002: /* fmul Rm,Rn - FPSCR: R[PR,Enable.O/U/I]/W[Cause,Flag] */
     case 0xf003: /* fdiv Rm,Rn - FPSCR: R[PR,Enable.O/U/I]/W[Cause,Flag] */
     case 0xf004: /* fcmp/eq Rm,Rn - FPSCR: R[PR,Enable.V]/W[Cause,Flag] */
     case 0xf005: /* fcmp/gt Rm,Rn - FPSCR: R[PR,Enable.V]/W[Cause,Flag] */
-	{
-	    CHECK_FPU_ENABLED
+    {
+        CHECK_FPU_ENABLED
             if (ctx->tbflags & FPSCR_PR) {
                 TCGv_i64 fp0, fp1;
 
                 if (ctx->opcode & 0x0110) {
                     goto do_illegal;
                 }
-		fp0 = tcg_temp_new_i64();
-		fp1 = tcg_temp_new_i64();
+        fp0 = tcg_temp_new_i64();
+        fp1 = tcg_temp_new_i64();
                 gen_load_fpr64(ctx, fp0, B11_8);
                 gen_load_fpr64(ctx, fp1, B7_4);
                 switch (ctx->opcode & 0xf00f) {
-                case 0xf000:		/* fadd Rm,Rn */
+                case 0xf000:        /* fadd Rm,Rn */
                     gen_helper_fadd_DT(fp0, cpu_env, fp0, fp1);
                     break;
-                case 0xf001:		/* fsub Rm,Rn */
+                case 0xf001:        /* fsub Rm,Rn */
                     gen_helper_fsub_DT(fp0, cpu_env, fp0, fp1);
                     break;
-                case 0xf002:		/* fmul Rm,Rn */
+                case 0xf002:        /* fmul Rm,Rn */
                     gen_helper_fmul_DT(fp0, cpu_env, fp0, fp1);
                     break;
-                case 0xf003:		/* fdiv Rm,Rn */
+                case 0xf003:        /* fdiv Rm,Rn */
                     gen_helper_fdiv_DT(fp0, cpu_env, fp0, fp1);
                     break;
-                case 0xf004:		/* fcmp/eq Rm,Rn */
+                case 0xf004:        /* fcmp/eq Rm,Rn */
                     gen_helper_fcmp_eq_DT(cpu_sr_t, cpu_env, fp0, fp1);
                     return;
-                case 0xf005:		/* fcmp/gt Rm,Rn */
+                case 0xf005:        /* fcmp/gt Rm,Rn */
                     gen_helper_fcmp_gt_DT(cpu_sr_t, cpu_env, fp0, fp1);
                     return;
                 }
                 gen_store_fpr64(ctx, fp0, B11_8);
                 tcg_temp_free_i64(fp0);
                 tcg_temp_free_i64(fp1);
-	    } else {
+        } else {
                 switch (ctx->opcode & 0xf00f) {
-                case 0xf000:		/* fadd Rm,Rn */
+                case 0xf000:        /* fadd Rm,Rn */
                     gen_helper_fadd_FT(FREG(B11_8), cpu_env,
                                        FREG(B11_8), FREG(B7_4));
                     break;
-                case 0xf001:		/* fsub Rm,Rn */
+                case 0xf001:        /* fsub Rm,Rn */
                     gen_helper_fsub_FT(FREG(B11_8), cpu_env,
                                        FREG(B11_8), FREG(B7_4));
                     break;
-                case 0xf002:		/* fmul Rm,Rn */
+                case 0xf002:        /* fmul Rm,Rn */
                     gen_helper_fmul_FT(FREG(B11_8), cpu_env,
                                        FREG(B11_8), FREG(B7_4));
                     break;
-                case 0xf003:		/* fdiv Rm,Rn */
+                case 0xf003:        /* fdiv Rm,Rn */
                     gen_helper_fdiv_FT(FREG(B11_8), cpu_env,
                                        FREG(B11_8), FREG(B7_4));
                     break;
-                case 0xf004:		/* fcmp/eq Rm,Rn */
+                case 0xf004:        /* fcmp/eq Rm,Rn */
                     gen_helper_fcmp_eq_FT(cpu_sr_t, cpu_env,
                                           FREG(B11_8), FREG(B7_4));
                     return;
-                case 0xf005:		/* fcmp/gt Rm,Rn */
+                case 0xf005:        /* fcmp/gt Rm,Rn */
                     gen_helper_fcmp_gt_FT(cpu_sr_t, cpu_env,
                                           FREG(B11_8), FREG(B7_4));
                     return;
                 }
-	    }
-	}
-	return;
+        }
+    }
+    return;
     case 0xf00e: /* fmac FR0,RM,Rn */
         CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_0
@@ -1165,257 +1165,257 @@ static void _decode_opc(DisasContext * ctx)
     }
 
     switch (ctx->opcode & 0xff00) {
-    case 0xc900:		/* and #imm,R0 */
-	tcg_gen_andi_i32(REG(0), REG(0), B7_0);
-	return;
-    case 0xcd00:		/* and.b #imm,@(R0,GBR) */
-	{
-	    TCGv addr, val;
-	    addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(0), cpu_gbr);
-	    val = tcg_temp_new();
+    case 0xc900:        /* and #imm,R0 */
+    tcg_gen_andi_i32(REG(0), REG(0), B7_0);
+    return;
+    case 0xcd00:        /* and.b #imm,@(R0,GBR) */
+    {
+        TCGv addr, val;
+        addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(0), cpu_gbr);
+        val = tcg_temp_new();
             tcg_gen_qemu_ld_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_gen_andi_i32(val, val, B7_0);
+        tcg_gen_andi_i32(val, val, B7_0);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(val);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x8b00:		/* bf label */
-	CHECK_NOT_DELAY_SLOT
+        tcg_temp_free(val);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x8b00:        /* bf label */
+    CHECK_NOT_DELAY_SLOT
         gen_conditional_jump(ctx, ctx->base.pc_next + 4 + B7_0s * 2, false);
-	return;
-    case 0x8f00:		/* bf/s label */
-	CHECK_NOT_DELAY_SLOT
+    return;
+    case 0x8f00:        /* bf/s label */
+    CHECK_NOT_DELAY_SLOT
         tcg_gen_xori_i32(cpu_delayed_cond, cpu_sr_t, 1);
         ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
         ctx->envflags |= DELAY_SLOT_CONDITIONAL;
-	return;
-    case 0x8900:		/* bt label */
-	CHECK_NOT_DELAY_SLOT
+    return;
+    case 0x8900:        /* bt label */
+    CHECK_NOT_DELAY_SLOT
         gen_conditional_jump(ctx, ctx->base.pc_next + 4 + B7_0s * 2, true);
-	return;
-    case 0x8d00:		/* bt/s label */
-	CHECK_NOT_DELAY_SLOT
+    return;
+    case 0x8d00:        /* bt/s label */
+    CHECK_NOT_DELAY_SLOT
         tcg_gen_mov_i32(cpu_delayed_cond, cpu_sr_t);
         ctx->delayed_pc = ctx->base.pc_next + 4 + B7_0s * 2;
         ctx->envflags |= DELAY_SLOT_CONDITIONAL;
-	return;
-    case 0x8800:		/* cmp/eq #imm,R0 */
+    return;
+    case 0x8800:        /* cmp/eq #imm,R0 */
         tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, REG(0), B7_0s);
-	return;
-    case 0xc400:		/* mov.b @(disp,GBR),R0 */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0);
+    return;
+    case 0xc400:        /* mov.b @(disp,GBR),R0 */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, cpu_gbr, B7_0);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_SB);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc500:		/* mov.w @(disp,GBR),R0 */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc500:        /* mov.w @(disp,GBR),R0 */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc600:		/* mov.l @(disp,GBR),R0 */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc600:        /* mov.l @(disp,GBR),R0 */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc000:		/* mov.b R0,@(disp,GBR) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc000:        /* mov.b R0,@(disp,GBR) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, cpu_gbr, B7_0);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc100:		/* mov.w R0,@(disp,GBR) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc100:        /* mov.w R0,@(disp,GBR) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 2);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc200:		/* mov.l R0,@(disp,GBR) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc200:        /* mov.l R0,@(disp,GBR) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, cpu_gbr, B7_0 * 4);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUL);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x8000:		/* mov.b R0,@(disp,Rn) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x8000:        /* mov.b R0,@(disp,Rn) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, REG(B7_4), B3_0);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x8100:		/* mov.w R0,@(disp,Rn) */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x8100:        /* mov.w R0,@(disp,Rn) */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
             tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x8400:		/* mov.b @(disp,Rn),R0 */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x8400:        /* mov.b @(disp,Rn),R0 */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, REG(B7_4), B3_0);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_SB);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0x8500:		/* mov.w @(disp,Rn),R0 */
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0x8500:        /* mov.w @(disp,Rn),R0 */
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
             tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc700:		/* mova @(disp,PC),R0 */
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc700:        /* mova @(disp,PC),R0 */
         tcg_gen_movi_i32(REG(0), ((ctx->base.pc_next & 0xfffffffc) +
                                   4 + B7_0 * 4) & ~3);
-	return;
-    case 0xcb00:		/* or #imm,R0 */
-	tcg_gen_ori_i32(REG(0), REG(0), B7_0);
-	return;
-    case 0xcf00:		/* or.b #imm,@(R0,GBR) */
-	{
-	    TCGv addr, val;
-	    addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(0), cpu_gbr);
-	    val = tcg_temp_new();
+    return;
+    case 0xcb00:        /* or #imm,R0 */
+    tcg_gen_ori_i32(REG(0), REG(0), B7_0);
+    return;
+    case 0xcf00:        /* or.b #imm,@(R0,GBR) */
+    {
+        TCGv addr, val;
+        addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(0), cpu_gbr);
+        val = tcg_temp_new();
             tcg_gen_qemu_ld_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_gen_ori_i32(val, val, B7_0);
+        tcg_gen_ori_i32(val, val, B7_0);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(val);
-	    tcg_temp_free(addr);
-	}
-	return;
-    case 0xc300:		/* trapa #imm */
-	{
-	    TCGv imm;
-	    CHECK_NOT_DELAY_SLOT
+        tcg_temp_free(val);
+        tcg_temp_free(addr);
+    }
+    return;
+    case 0xc300:        /* trapa #imm */
+    {
+        TCGv imm;
+        CHECK_NOT_DELAY_SLOT
             gen_save_cpu_state(ctx, true);
-	    imm = tcg_const_i32(B7_0);
+        imm = tcg_const_i32(B7_0);
             gen_helper_trapa(cpu_env, imm);
-	    tcg_temp_free(imm);
+        tcg_temp_free(imm);
             ctx->base.is_jmp = DISAS_NORETURN;
-	}
-	return;
-    case 0xc800:		/* tst #imm,R0 */
-	{
-	    TCGv val = tcg_temp_new();
-	    tcg_gen_andi_i32(val, REG(0), B7_0);
+    }
+    return;
+    case 0xc800:        /* tst #imm,R0 */
+    {
+        TCGv val = tcg_temp_new();
+        tcg_gen_andi_i32(val, REG(0), B7_0);
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-	    tcg_temp_free(val);
-	}
-	return;
-    case 0xcc00:		/* tst.b #imm,@(R0,GBR) */
-	{
-	    TCGv val = tcg_temp_new();
-	    tcg_gen_add_i32(val, REG(0), cpu_gbr);
+        tcg_temp_free(val);
+    }
+    return;
+    case 0xcc00:        /* tst.b #imm,@(R0,GBR) */
+    {
+        TCGv val = tcg_temp_new();
+        tcg_gen_add_i32(val, REG(0), cpu_gbr);
             tcg_gen_qemu_ld_i32(val, val, ctx->memidx, MO_UB);
-	    tcg_gen_andi_i32(val, val, B7_0);
+        tcg_gen_andi_i32(val, val, B7_0);
             tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-	    tcg_temp_free(val);
-	}
-	return;
-    case 0xca00:		/* xor #imm,R0 */
-	tcg_gen_xori_i32(REG(0), REG(0), B7_0);
-	return;
-    case 0xce00:		/* xor.b #imm,@(R0,GBR) */
-	{
-	    TCGv addr, val;
-	    addr = tcg_temp_new();
-	    tcg_gen_add_i32(addr, REG(0), cpu_gbr);
-	    val = tcg_temp_new();
+        tcg_temp_free(val);
+    }
+    return;
+    case 0xca00:        /* xor #imm,R0 */
+    tcg_gen_xori_i32(REG(0), REG(0), B7_0);
+    return;
+    case 0xce00:        /* xor.b #imm,@(R0,GBR) */
+    {
+        TCGv addr, val;
+        addr = tcg_temp_new();
+        tcg_gen_add_i32(addr, REG(0), cpu_gbr);
+        val = tcg_temp_new();
             tcg_gen_qemu_ld_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_gen_xori_i32(val, val, B7_0);
+        tcg_gen_xori_i32(val, val, B7_0);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_UB);
-	    tcg_temp_free(val);
-	    tcg_temp_free(addr);
-	}
-	return;
+        tcg_temp_free(val);
+        tcg_temp_free(addr);
+    }
+    return;
     }
 
     switch (ctx->opcode & 0xf08f) {
-    case 0x408e:		/* ldc Rm,Rn_BANK */
-	CHECK_PRIVILEGED
-	tcg_gen_mov_i32(ALTREG(B6_4), REG(B11_8));
-	return;
-    case 0x4087:		/* ldc.l @Rm+,Rn_BANK */
-	CHECK_PRIVILEGED
+    case 0x408e:        /* ldc Rm,Rn_BANK */
+    CHECK_PRIVILEGED
+    tcg_gen_mov_i32(ALTREG(B6_4), REG(B11_8));
+    return;
+    case 0x4087:        /* ldc.l @Rm+,Rn_BANK */
+    CHECK_PRIVILEGED
         tcg_gen_qemu_ld_i32(ALTREG(B6_4), REG(B11_8), ctx->memidx, MO_TESL);
-	tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
-	return;
-    case 0x0082:		/* stc Rm_BANK,Rn */
-	CHECK_PRIVILEGED
-	tcg_gen_mov_i32(REG(B11_8), ALTREG(B6_4));
-	return;
-    case 0x4083:		/* stc.l Rm_BANK,@-Rn */
-	CHECK_PRIVILEGED
-	{
-	    TCGv addr = tcg_temp_new();
-	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
+    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
+    return;
+    case 0x0082:        /* stc Rm_BANK,Rn */
+    CHECK_PRIVILEGED
+    tcg_gen_mov_i32(REG(B11_8), ALTREG(B6_4));
+    return;
+    case 0x4083:        /* stc.l Rm_BANK,@-Rn */
+    CHECK_PRIVILEGED
+    {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_subi_i32(addr, REG(B11_8), 4);
             tcg_gen_qemu_st_i32(ALTREG(B6_4), addr, ctx->memidx, MO_TEUL);
-	    tcg_gen_mov_i32(REG(B11_8), addr);
-	    tcg_temp_free(addr);
-	}
-	return;
+        tcg_gen_mov_i32(REG(B11_8), addr);
+        tcg_temp_free(addr);
+    }
+    return;
     }
 
     switch (ctx->opcode & 0xf0ff) {
-    case 0x0023:		/* braf Rn */
-	CHECK_NOT_DELAY_SLOT
+    case 0x0023:        /* braf Rn */
+    CHECK_NOT_DELAY_SLOT
         tcg_gen_addi_i32(cpu_delayed_pc, REG(B11_8), ctx->base.pc_next + 4);
         ctx->envflags |= DELAY_SLOT;
-	ctx->delayed_pc = (uint32_t) - 1;
-	return;
-    case 0x0003:		/* bsrf Rn */
-	CHECK_NOT_DELAY_SLOT
+    ctx->delayed_pc = (uint32_t) - 1;
+    return;
+    case 0x0003:        /* bsrf Rn */
+    CHECK_NOT_DELAY_SLOT
         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
-	tcg_gen_add_i32(cpu_delayed_pc, REG(B11_8), cpu_pr);
+    tcg_gen_add_i32(cpu_delayed_pc, REG(B11_8), cpu_pr);
         ctx->envflags |= DELAY_SLOT;
-	ctx->delayed_pc = (uint32_t) - 1;
-	return;
-    case 0x4015:		/* cmp/pl Rn */
+    ctx->delayed_pc = (uint32_t) - 1;
+    return;
+    case 0x4015:        /* cmp/pl Rn */
         tcg_gen_setcondi_i32(TCG_COND_GT, cpu_sr_t, REG(B11_8), 0);
-	return;
-    case 0x4011:		/* cmp/pz Rn */
+    return;
+    case 0x4011:        /* cmp/pz Rn */
         tcg_gen_setcondi_i32(TCG_COND_GE, cpu_sr_t, REG(B11_8), 0);
-	return;
-    case 0x4010:		/* dt Rn */
-	tcg_gen_subi_i32(REG(B11_8), REG(B11_8), 1);
+    return;
+    case 0x4010:        /* dt Rn */
+    tcg_gen_subi_i32(REG(B11_8), REG(B11_8), 1);
         tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, REG(B11_8), 0);
-	return;
-    case 0x402b:		/* jmp @Rn */
-	CHECK_NOT_DELAY_SLOT
-	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
+    return;
+    case 0x402b:        /* jmp @Rn */
+    CHECK_NOT_DELAY_SLOT
+    tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
         ctx->envflags |= DELAY_SLOT;
-	ctx->delayed_pc = (uint32_t) - 1;
-	return;
-    case 0x400b:		/* jsr @Rn */
-	CHECK_NOT_DELAY_SLOT
+    ctx->delayed_pc = (uint32_t) - 1;
+    return;
+    case 0x400b:        /* jsr @Rn */
+    CHECK_NOT_DELAY_SLOT
         tcg_gen_movi_i32(cpu_pr, ctx->base.pc_next + 4);
-	tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
+    tcg_gen_mov_i32(cpu_delayed_pc, REG(B11_8));
         ctx->envflags |= DELAY_SLOT;
-	ctx->delayed_pc = (uint32_t) - 1;
-	return;
-    case 0x400e:		/* ldc Rm,SR */
-	CHECK_PRIVILEGED
+    ctx->delayed_pc = (uint32_t) - 1;
+    return;
+    case 0x400e:        /* ldc Rm,SR */
+    CHECK_PRIVILEGED
         {
             TCGv val = tcg_temp_new();
             tcg_gen_andi_i32(val, REG(B11_8), 0x700083f3);
@@ -1423,110 +1423,110 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(val);
             ctx->base.is_jmp = DISAS_STOP;
         }
-	return;
-    case 0x4007:		/* ldc.l @Rm+,SR */
-	CHECK_PRIVILEGED
-	{
-	    TCGv val = tcg_temp_new();
+    return;
+    case 0x4007:        /* ldc.l @Rm+,SR */
+    CHECK_PRIVILEGED
+    {
+        TCGv val = tcg_temp_new();
             tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx, MO_TESL);
             tcg_gen_andi_i32(val, val, 0x700083f3);
             gen_write_sr(val);
-	    tcg_temp_free(val);
-	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
+        tcg_temp_free(val);
+        tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
             ctx->base.is_jmp = DISAS_STOP;
-	}
-	return;
-    case 0x0002:		/* stc SR,Rn */
-	CHECK_PRIVILEGED
+    }
+    return;
+    case 0x0002:        /* stc SR,Rn */
+    CHECK_PRIVILEGED
         gen_read_sr(REG(B11_8));
-	return;
-    case 0x4003:		/* stc SR,@-Rn */
-	CHECK_PRIVILEGED
-	{
-	    TCGv addr = tcg_temp_new();
+    return;
+    case 0x4003:        /* stc SR,@-Rn */
+    CHECK_PRIVILEGED
+    {
+        TCGv addr = tcg_temp_new();
             TCGv val = tcg_temp_new();
-	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
+        tcg_gen_subi_i32(addr, REG(B11_8), 4);
             gen_read_sr(val);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL);
-	    tcg_gen_mov_i32(REG(B11_8), addr);
+        tcg_gen_mov_i32(REG(B11_8), addr);
             tcg_temp_free(val);
-	    tcg_temp_free(addr);
-	}
-	return;
-#define LD(reg,ldnum,ldpnum,prechk)		\
-  case ldnum:							\
-    prechk    							\
-    tcg_gen_mov_i32 (cpu_##reg, REG(B11_8));			\
-    return;							\
-  case ldpnum:							\
-    prechk    							\
+        tcg_temp_free(addr);
+    }
+    return;
+#define LD(reg,ldnum,ldpnum,prechk)        \
+  case ldnum:                            \
+    prechk                                \
+    tcg_gen_mov_i32 (cpu_##reg, REG(B11_8));            \
+    return;                            \
+  case ldpnum:                            \
+    prechk                                \
     tcg_gen_qemu_ld_i32(cpu_##reg, REG(B11_8), ctx->memidx, MO_TESL); \
-    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);		\
-    return;
-#define ST(reg,stnum,stpnum,prechk)		\
-  case stnum:							\
-    prechk    							\
-    tcg_gen_mov_i32 (REG(B11_8), cpu_##reg);			\
-    return;							\
-  case stpnum:							\
-    prechk    							\
-    {								\
-	TCGv addr = tcg_temp_new();				\
-	tcg_gen_subi_i32(addr, REG(B11_8), 4);			\
+    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);        \
+    return;
+#define ST(reg,stnum,stpnum,prechk)        \
+  case stnum:                            \
+    prechk                                \
+    tcg_gen_mov_i32 (REG(B11_8), cpu_##reg);            \
+    return;                            \
+  case stpnum:                            \
+    prechk                                \
+    {                                \
+    TCGv addr = tcg_temp_new();                \
+    tcg_gen_subi_i32(addr, REG(B11_8), 4);            \
         tcg_gen_qemu_st_i32(cpu_##reg, addr, ctx->memidx, MO_TEUL); \
-	tcg_gen_mov_i32(REG(B11_8), addr);			\
-	tcg_temp_free(addr);					\
-    }								\
-    return;
-#define LDST(reg,ldnum,ldpnum,stnum,stpnum,prechk)		\
-	LD(reg,ldnum,ldpnum,prechk)				\
-	ST(reg,stnum,stpnum,prechk)
-	LDST(gbr,  0x401e, 0x4017, 0x0012, 0x4013, {})
-	LDST(vbr,  0x402e, 0x4027, 0x0022, 0x4023, CHECK_PRIVILEGED)
-	LDST(ssr,  0x403e, 0x4037, 0x0032, 0x4033, CHECK_PRIVILEGED)
-	LDST(spc,  0x404e, 0x4047, 0x0042, 0x4043, CHECK_PRIVILEGED)
-	ST(sgr,  0x003a, 0x4032, CHECK_PRIVILEGED)
+    tcg_gen_mov_i32(REG(B11_8), addr);            \
+    tcg_temp_free(addr);                    \
+    }                                \
+    return;
+#define LDST(reg,ldnum,ldpnum,stnum,stpnum,prechk)        \
+    LD(reg,ldnum,ldpnum,prechk)                \
+    ST(reg,stnum,stpnum,prechk)
+    LDST(gbr,  0x401e, 0x4017, 0x0012, 0x4013, {})
+    LDST(vbr,  0x402e, 0x4027, 0x0022, 0x4023, CHECK_PRIVILEGED)
+    LDST(ssr,  0x403e, 0x4037, 0x0032, 0x4033, CHECK_PRIVILEGED)
+    LDST(spc,  0x404e, 0x4047, 0x0042, 0x4043, CHECK_PRIVILEGED)
+    ST(sgr,  0x003a, 0x4032, CHECK_PRIVILEGED)
         LD(sgr,  0x403a, 0x4036, CHECK_PRIVILEGED CHECK_SH4A)
-	LDST(dbr,  0x40fa, 0x40f6, 0x00fa, 0x40f2, CHECK_PRIVILEGED)
-	LDST(mach, 0x400a, 0x4006, 0x000a, 0x4002, {})
-	LDST(macl, 0x401a, 0x4016, 0x001a, 0x4012, {})
-	LDST(pr,   0x402a, 0x4026, 0x002a, 0x4022, {})
-	LDST(fpul, 0x405a, 0x4056, 0x005a, 0x4052, {CHECK_FPU_ENABLED})
-    case 0x406a:		/* lds Rm,FPSCR */
-	CHECK_FPU_ENABLED
+    LDST(dbr,  0x40fa, 0x40f6, 0x00fa, 0x40f2, CHECK_PRIVILEGED)
+    LDST(mach, 0x400a, 0x4006, 0x000a, 0x4002, {})
+    LDST(macl, 0x401a, 0x4016, 0x001a, 0x4012, {})
+    LDST(pr,   0x402a, 0x4026, 0x002a, 0x4022, {})
+    LDST(fpul, 0x405a, 0x4056, 0x005a, 0x4052, {CHECK_FPU_ENABLED})
+    case 0x406a:        /* lds Rm,FPSCR */
+    CHECK_FPU_ENABLED
         gen_helper_ld_fpscr(cpu_env, REG(B11_8));
         ctx->base.is_jmp = DISAS_STOP;
-	return;
-    case 0x4066:		/* lds.l @Rm+,FPSCR */
-	CHECK_FPU_ENABLED
-	{
-	    TCGv addr = tcg_temp_new();
+    return;
+    case 0x4066:        /* lds.l @Rm+,FPSCR */
+    CHECK_FPU_ENABLED
+    {
+        TCGv addr = tcg_temp_new();
             tcg_gen_qemu_ld_i32(addr, REG(B11_8), ctx->memidx, MO_TESL);
-	    tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
+        tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
             gen_helper_ld_fpscr(cpu_env, addr);
-	    tcg_temp_free(addr);
+        tcg_temp_free(addr);
             ctx->base.is_jmp = DISAS_STOP;
-	}
-	return;
-    case 0x006a:		/* sts FPSCR,Rn */
-	CHECK_FPU_ENABLED
-	tcg_gen_andi_i32(REG(B11_8), cpu_fpscr, 0x003fffff);
-	return;
-    case 0x4062:		/* sts FPSCR,@-Rn */
-	CHECK_FPU_ENABLED
-	{
-	    TCGv addr, val;
-	    val = tcg_temp_new();
-	    tcg_gen_andi_i32(val, cpu_fpscr, 0x003fffff);
-	    addr = tcg_temp_new();
-	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
+    }
+    return;
+    case 0x006a:        /* sts FPSCR,Rn */
+    CHECK_FPU_ENABLED
+    tcg_gen_andi_i32(REG(B11_8), cpu_fpscr, 0x003fffff);
+    return;
+    case 0x4062:        /* sts FPSCR,@-Rn */
+    CHECK_FPU_ENABLED
+    {
+        TCGv addr, val;
+        val = tcg_temp_new();
+        tcg_gen_andi_i32(val, cpu_fpscr, 0x003fffff);
+        addr = tcg_temp_new();
+        tcg_gen_subi_i32(addr, REG(B11_8), 4);
             tcg_gen_qemu_st_i32(val, addr, ctx->memidx, MO_TEUL);
-	    tcg_gen_mov_i32(REG(B11_8), addr);
-	    tcg_temp_free(addr);
-	    tcg_temp_free(val);
-	}
-	return;
-    case 0x00c3:		/* movca.l R0,@Rm */
+        tcg_gen_mov_i32(REG(B11_8), addr);
+        tcg_temp_free(addr);
+        tcg_temp_free(val);
+    }
+    return;
+    case 0x00c3:        /* movca.l R0,@Rm */
         {
             TCGv val = tcg_temp_new();
             tcg_gen_qemu_ld_i32(val, REG(B11_8), ctx->memidx, MO_TEUL);
@@ -1535,7 +1535,7 @@ static void _decode_opc(DisasContext * ctx)
             tcg_temp_free(val);
         }
         ctx->has_movcal = 1;
-	return;
+    return;
     case 0x40a9:                /* movua.l @Rm,R0 */
         CHECK_SH4A
         /* Load non-boundary-aligned data */
@@ -1549,9 +1549,9 @@ static void _decode_opc(DisasContext * ctx)
                             MO_TEUL | MO_UNALN);
         tcg_gen_addi_i32(REG(B11_8), REG(B11_8), 4);
         return;
-    case 0x0029:		/* movt Rn */
+    case 0x0029:        /* movt Rn */
         tcg_gen_mov_i32(REG(B11_8), cpu_sr_t);
-	return;
+    return;
     case 0x0073:
         /* MOVCO.L
          *     LDST -> T
@@ -1613,89 +1613,89 @@ static void _decode_opc(DisasContext * ctx)
             tcg_gen_movi_i32(cpu_lock_addr, 0);
         }
         return;
-    case 0x0093:		/* ocbi @Rn */
-	{
+    case 0x0093:        /* ocbi @Rn */
+    {
             gen_helper_ocbi(cpu_env, REG(B11_8));
-	}
-	return;
-    case 0x00a3:		/* ocbp @Rn */
-    case 0x00b3:		/* ocbwb @Rn */
+    }
+    return;
+    case 0x00a3:        /* ocbp @Rn */
+    case 0x00b3:        /* ocbwb @Rn */
         /* These instructions are supposed to do nothing in case of
            a cache miss. Given that we only partially emulate caches
            it is safe to simply ignore them. */
-	return;
-    case 0x0083:		/* pref @Rn */
-	return;
-    case 0x00d3:		/* prefi @Rn */
+    return;
+    case 0x0083:        /* pref @Rn */
+    return;
+    case 0x00d3:        /* prefi @Rn */
         CHECK_SH4A
         return;
-    case 0x00e3:		/* icbi @Rn */
+    case 0x00e3:        /* icbi @Rn */
         CHECK_SH4A
         return;
-    case 0x00ab:		/* synco */
+    case 0x00ab:        /* synco */
         CHECK_SH4A
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         return;
-    case 0x4024:		/* rotcl Rn */
-	{
-	    TCGv tmp = tcg_temp_new();
+    case 0x4024:        /* rotcl Rn */
+    {
+        TCGv tmp = tcg_temp_new();
             tcg_gen_mov_i32(tmp, cpu_sr_t);
             tcg_gen_shri_i32(cpu_sr_t, REG(B11_8), 31);
-	    tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 1);
+        tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 1);
             tcg_gen_or_i32(REG(B11_8), REG(B11_8), tmp);
-	    tcg_temp_free(tmp);
-	}
-	return;
-    case 0x4025:		/* rotcr Rn */
-	{
-	    TCGv tmp = tcg_temp_new();
+        tcg_temp_free(tmp);
+    }
+    return;
+    case 0x4025:        /* rotcr Rn */
+    {
+        TCGv tmp = tcg_temp_new();
             tcg_gen_shli_i32(tmp, cpu_sr_t, 31);
             tcg_gen_andi_i32(cpu_sr_t, REG(B11_8), 1);
-	    tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 1);
+        tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 1);
             tcg_gen_or_i32(REG(B11_8), REG(B11_8), tmp);
-	    tcg_temp_free(tmp);
-	}
-	return;
-    case 0x4004:		/* rotl Rn */
-	tcg_gen_rotli_i32(REG(B11_8), REG(B11_8), 1);
+        tcg_temp_free(tmp);
+    }
+    return;
+    case 0x4004:        /* rotl Rn */
+    tcg_gen_rotli_i32(REG(B11_8), REG(B11_8), 1);
         tcg_gen_andi_i32(cpu_sr_t, REG(B11_8), 0);
-	return;
-    case 0x4005:		/* rotr Rn */
+    return;
+    case 0x4005:        /* rotr Rn */
         tcg_gen_andi_i32(cpu_sr_t, REG(B11_8), 0);
-	tcg_gen_rotri_i32(REG(B11_8), REG(B11_8), 1);
-	return;
-    case 0x4000:		/* shll Rn */
-    case 0x4020:		/* shal Rn */
+    tcg_gen_rotri_i32(REG(B11_8), REG(B11_8), 1);
+    return;
+    case 0x4000:        /* shll Rn */
+    case 0x4020:        /* shal Rn */
         tcg_gen_shri_i32(cpu_sr_t, REG(B11_8), 31);
-	tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 1);
-	return;
-    case 0x4021:		/* shar Rn */
+    tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 1);
+    return;
+    case 0x4021:        /* shar Rn */
         tcg_gen_andi_i32(cpu_sr_t, REG(B11_8), 1);
-	tcg_gen_sari_i32(REG(B11_8), REG(B11_8), 1);
-	return;
-    case 0x4001:		/* shlr Rn */
+    tcg_gen_sari_i32(REG(B11_8), REG(B11_8), 1);
+    return;
+    case 0x4001:        /* shlr Rn */
         tcg_gen_andi_i32(cpu_sr_t, REG(B11_8), 1);
-	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 1);
-	return;
-    case 0x4008:		/* shll2 Rn */
-	tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 2);
-	return;
-    case 0x4018:		/* shll8 Rn */
-	tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 8);
-	return;
-    case 0x4028:		/* shll16 Rn */
-	tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 16);
-	return;
-    case 0x4009:		/* shlr2 Rn */
-	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 2);
-	return;
-    case 0x4019:		/* shlr8 Rn */
-	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 8);
-	return;
-    case 0x4029:		/* shlr16 Rn */
-	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 16);
-	return;
-    case 0x401b:		/* tas.b @Rn */
+    tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 1);
+    return;
+    case 0x4008:        /* shll2 Rn */
+    tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 2);
+    return;
+    case 0x4018:        /* shll8 Rn */
+    tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 8);
+    return;
+    case 0x4028:        /* shll16 Rn */
+    tcg_gen_shli_i32(REG(B11_8), REG(B11_8), 16);
+    return;
+    case 0x4009:        /* shlr2 Rn */
+    tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 2);
+    return;
+    case 0x4019:        /* shlr8 Rn */
+    tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 8);
+    return;
+    case 0x4029:        /* shlr16 Rn */
+    tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 16);
+    return;
+    case 0x401b:        /* tas.b @Rn */
         {
             TCGv val = tcg_const_i32(0x80);
             tcg_gen_atomic_fetch_or_i32(val, REG(B11_8), val,
@@ -1705,101 +1705,101 @@ static void _decode_opc(DisasContext * ctx)
         }
         return;
     case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         tcg_gen_mov_i32(FREG(B11_8), cpu_fpul);
-	return;
+    return;
     case 0xf01d: /* flds FRm,FPUL - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         tcg_gen_mov_i32(cpu_fpul, FREG(B11_8));
-	return;
+    return;
     case 0xf02d: /* float FPUL,FRn/DRn - FPSCR: R[PR,Enable.I]/W[Cause,Flag] */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_PR) {
-	    TCGv_i64 fp;
+        TCGv_i64 fp;
             if (ctx->opcode & 0x0100) {
                 goto do_illegal;
             }
-	    fp = tcg_temp_new_i64();
+        fp = tcg_temp_new_i64();
             gen_helper_float_DT(fp, cpu_env, cpu_fpul);
             gen_store_fpr64(ctx, fp, B11_8);
-	    tcg_temp_free_i64(fp);
-	}
-	else {
+        tcg_temp_free_i64(fp);
+    }
+    else {
             gen_helper_float_FT(FREG(B11_8), cpu_env, cpu_fpul);
-	}
-	return;
+    }
+    return;
     case 0xf03d: /* ftrc FRm/DRm,FPUL - FPSCR: R[PR,Enable.V]/W[Cause,Flag] */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_PR) {
-	    TCGv_i64 fp;
+        TCGv_i64 fp;
             if (ctx->opcode & 0x0100) {
                 goto do_illegal;
             }
-	    fp = tcg_temp_new_i64();
+        fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, B11_8);
             gen_helper_ftrc_DT(cpu_fpul, cpu_env, fp);
-	    tcg_temp_free_i64(fp);
-	}
-	else {
+        tcg_temp_free_i64(fp);
+    }
+    else {
             gen_helper_ftrc_FT(cpu_fpul, cpu_env, FREG(B11_8));
-	}
-	return;
+    }
+    return;
     case 0xf04d: /* fneg FRn/DRn - FPSCR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         tcg_gen_xori_i32(FREG(B11_8), FREG(B11_8), 0x80000000);
-	return;
+    return;
     case 0xf05d: /* fabs FRn/DRn - FPCSR: Nothing */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         tcg_gen_andi_i32(FREG(B11_8), FREG(B11_8), 0x7fffffff);
-	return;
+    return;
     case 0xf06d: /* fsqrt FRn */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         if (ctx->tbflags & FPSCR_PR) {
             if (ctx->opcode & 0x0100) {
                 goto do_illegal;
             }
-	    TCGv_i64 fp = tcg_temp_new_i64();
+        TCGv_i64 fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, B11_8);
             gen_helper_fsqrt_DT(fp, cpu_env, fp);
             gen_store_fpr64(ctx, fp, B11_8);
-	    tcg_temp_free_i64(fp);
-	} else {
+        tcg_temp_free_i64(fp);
+    } else {
             gen_helper_fsqrt_FT(FREG(B11_8), cpu_env, FREG(B11_8));
-	}
-	return;
+    }
+    return;
     case 0xf07d: /* fsrra FRn */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_0
         gen_helper_fsrra_FT(FREG(B11_8), cpu_env, FREG(B11_8));
-	break;
+    break;
     case 0xf08d: /* fldi0 FRn - FPSCR: R[PR] */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_0
         tcg_gen_movi_i32(FREG(B11_8), 0);
         return;
     case 0xf09d: /* fldi1 FRn - FPSCR: R[PR] */
-	CHECK_FPU_ENABLED
+    CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_0
         tcg_gen_movi_i32(FREG(B11_8), 0x3f800000);
         return;
     case 0xf0ad: /* fcnvsd FPUL,DRn */
-	CHECK_FPU_ENABLED
-	{
-	    TCGv_i64 fp = tcg_temp_new_i64();
+    CHECK_FPU_ENABLED
+    {
+        TCGv_i64 fp = tcg_temp_new_i64();
             gen_helper_fcnvsd_FT_DT(fp, cpu_env, cpu_fpul);
             gen_store_fpr64(ctx, fp, B11_8);
-	    tcg_temp_free_i64(fp);
-	}
-	return;
+        tcg_temp_free_i64(fp);
+    }
+    return;
     case 0xf0bd: /* fcnvds DRn,FPUL */
-	CHECK_FPU_ENABLED
-	{
-	    TCGv_i64 fp = tcg_temp_new_i64();
+    CHECK_FPU_ENABLED
+    {
+        TCGv_i64 fp = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp, B11_8);
             gen_helper_fcnvds_DT_FT(cpu_fpul, cpu_env, fp);
-	    tcg_temp_free_i64(fp);
-	}
-	return;
+        tcg_temp_free_i64(fp);
+    }
+    return;
     case 0xf0ed: /* fipr FVm,FVn */
         CHECK_FPU_ENABLED
         CHECK_FPSCR_PR_1
@@ -1877,10 +1877,10 @@ static void decode_opc(DisasContext * ctx)
 
         tcg_gen_movi_i32(cpu_flags, ctx->envflags);
         if (old_flags & DELAY_SLOT_CONDITIONAL) {
-	    gen_delayed_conditional_jump(ctx);
+        gen_delayed_conditional_jump(ctx);
         } else {
             gen_jump(ctx);
-	}
+    }
     }
 }
 
-- 
2.25.1


