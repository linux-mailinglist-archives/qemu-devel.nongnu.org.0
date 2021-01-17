Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3D2F9321
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 15:59:36 +0100 (CET)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19Wh-0001Up-1S
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 09:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RI-0004QZ-Lm; Sun, 17 Jan 2021 09:54:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RG-00042q-Ti; Sun, 17 Jan 2021 09:54:00 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u4so8049924pjn.4;
 Sun, 17 Jan 2021 06:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LPwEuV0/04eVLqoLUFPzyx3q6xjC8+PXkwPXg+pptj4=;
 b=byfhCWBSdqF5R6vdqmx/S05qNCC3AWQ9oePLjRmHjV7Xe5uYCww3sDqOe8FaJjH91P
 7q/BWlYVk6bnRoyd8U9Il0p4dUcQ4UsmtfNI6vhe3LudY1ss3j4nWO6YG+BBDUErqZ+f
 xhINovf+lmGrSD+SohsalO4gh/w4X+FddzVBZuaBbNGdLFa92AACL5DeYhkJfAHa2q3C
 HOYZB5tdQOa5GlqukghRdvweApdGHnVj7eezru3DaaBnL69IZp8gI5cTjHQw54Tai3Y9
 z1xaZZawZp+DLkBOkwcXLkF31ztYC2zG0WCNPnIqkoXzpEu0yPVc0U7tET2LN5FhpOyl
 dI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LPwEuV0/04eVLqoLUFPzyx3q6xjC8+PXkwPXg+pptj4=;
 b=ah8tQjDgbbZTrGip/bIUUPGQBgcUS+/q8qLaUo8x4DrfxNQnQuv/zA7R5P9YLDvT1e
 XommEju9KQ/ghy0ARfq8FaWptHRAyeeMrb1sflR/Z8fHc1a4+KGe76dhsXeZ5mfQufyB
 rkvxPoIDyReD9M+3zGnyftEsmdOx50koMo59EC3W5zr0fLnj6w13eadgkOzToXLGJokO
 Qjwfch3RjMSj2vrsI3+90q4Y//w0pKIZbXTkKTScWtFgI7vclhMBGBIEWT8ir8yKQJBj
 a3c3//PFCiFR64TPzPxrWeCM/6HPMI/FbjCYREwieKyPvIDrmXTV+LxPkTMRzyYOC97E
 5BwQ==
X-Gm-Message-State: AOAM5312Hhh89vgCZZGwXdM112LdCbAvAW6VzWAn92LK5BrkIqXwBRHW
 yqPy6A8hg6za739+lnwFWg4g4eCcOVpYgQ==
X-Google-Smtp-Source: ABdhPJxhhz9LCy77eyWRjQFyJJDMPo7BHNb80WR6nPRpXwLjx6NRkSFp5uknaE/p64LYZq5qm39a7w==
X-Received: by 2002:a17:90a:a60d:: with SMTP id
 c13mr21587281pjq.11.1610895237212; 
 Sun, 17 Jan 2021 06:53:57 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:53:56 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 03/11] hw/block/nvme: remove unused argument in
 nvme_ns_init_blk
Date: Sun, 17 Jan 2021 23:53:33 +0900
Message-Id: <20210117145341.23310-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102b.google.com
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

Removed no longer used aregument NvmeCtrl object in nvme_ns_init_blk().

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index c403cd36b6bd..fc42ae184e01 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -66,7 +66,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 {
     if (!blkconf_blocksizes(&ns->blkconf, errp)) {
         return -1;
@@ -306,7 +306,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (nvme_ns_init_blk(n, ns, errp)) {
+    if (nvme_ns_init_blk(ns, errp)) {
         return -1;
     }
 
-- 
2.17.1


