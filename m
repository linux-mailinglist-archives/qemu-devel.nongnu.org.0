Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D22F931F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 15:57:37 +0100 (CET)
Received: from localhost ([::1]:59174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19Um-0007Zk-Dk
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 09:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RQ-0004VM-3o; Sun, 17 Jan 2021 09:54:09 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RM-00044c-Fm; Sun, 17 Jan 2021 09:54:07 -0500
Received: by mail-pl1-x635.google.com with SMTP id d4so7211969plh.5;
 Sun, 17 Jan 2021 06:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aclMKN2i9RpYbDHlyEF8ouvTN8y3ptaLtduB2besBSc=;
 b=fTS+m3dQnk71GBJVmcuWE4yMoOeWlaRfgSjNpDB4eQHJ5bmIFrSYI8ANatlGJEwCum
 TBaMBNYd6IDamd2QHANJp4ruWCiynV/cj63hI+xQvOocxafPibhmhXF9lbqBMu61AU0N
 ZAnYhxnT8RbIQgezfbBKX1Oj06LFEOilj3Hyhhy3q1R/p83vr/vZdDZk7rgqZaapvZR4
 UIjneai5/52L40kHMGUU7PbEbCf9Fk8kCC9bgim/y79E5i1yZDs8tURF/ZsTBbrXGiyH
 8/LMtnYbyckAXh9mUVxqi6GD7SMU+v32f9cKbyX8g2OZdvFIT/ReN/mDFPk3EdL2FqvY
 IESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aclMKN2i9RpYbDHlyEF8ouvTN8y3ptaLtduB2besBSc=;
 b=c9cgmrroYdYR2z0d4vb7S1zQ7609E/O43tnFcn6283kYQFhoGrcTQKyq3xi+53cTZq
 aNIMaIySV5lRpp/gBaFFVQv91l3fDIAE0tGaieg+eDUt10u0FwUVi9tSiOd+b8ynhYLo
 Wf0eJz7BA+MOH8L5XQOG26aH6oQOEk2dZ7YLJLUmARM1ifp4A7odPWKe7gUC5UFzQnj/
 xh3nWZM20ylilkKRLPVBpWBewdd4oX31nwoLojds1qZ+G28Tz9mlhKAg/eLYMF3sSvCs
 t6shM/7HiMYdFctHzUUAOQAeOplPzsT8mjcaxNCsfW8LI5b8ZYzM+JIC7IOugay0a4sz
 C1Zg==
X-Gm-Message-State: AOAM533MiAkUE0z6mI9I1TO/Xww/GmnQDLv5k5/eKVWGBBNk3m0FXrzI
 nwtV6qnqW0YTiZt/BwvX/6aYG26DmxVGjw==
X-Google-Smtp-Source: ABdhPJyJDpUKOcpGfxC7uqhOLMCBA3HgZ/mwSBKGNVGf9ELtAPQXHvZkK2k9WkxbuvWHxCHlKpk+lA==
X-Received: by 2002:a17:90a:7e90:: with SMTP id
 j16mr20992578pjl.163.1610895242016; 
 Sun, 17 Jan 2021 06:54:02 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:54:01 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 05/11] hw/block/nvme: remove unused argument in
 nvme_ns_setup
Date: Sun, 17 Jan 2021 23:53:35 +0900
Message-Id: <20210117145341.23310-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_ns_setup() finally does not have nothing to do with NvmeCtrl
instance.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 4 ++--
 hw/block/nvme-ns.h | 2 +-
 hw/block/nvme.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 3f0e4e461420..c8b75fa02138 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -300,7 +300,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
         return -1;
@@ -352,7 +352,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     NvmeCtrl *n = NVME(s->parent);
     Error *local_err = NULL;
 
-    if (nvme_ns_setup(n, ns, &local_err)) {
+    if (nvme_ns_setup(ns, &local_err)) {
         error_propagate_prepend(errp, local_err,
                                 "could not setup namespace: ");
         return;
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index f8f3c28c360b..d87c025b0ab6 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -174,7 +174,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
     assert(ns->nr_active_zones >= 0);
 }
 
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b2a9c48a9d81..9e890ce84f5e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4313,7 +4313,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(n, ns, errp)) {
+        if (nvme_ns_setup(ns, errp)) {
             return;
         }
     }
-- 
2.17.1


