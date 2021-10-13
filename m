Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C0842CFC0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 02:58:41 +0200 (CEST)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map4y-0003Rm-FH
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 20:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIV-000436-QH
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:31 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIU-0003t8-4I
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:31 -0400
Received: by mail-qt1-x834.google.com with SMTP id i1so4195423qtr.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NiXYdyvLdDkYrckOfygRcIbU5uw8eEtfOT8dVCkJXPk=;
 b=gGdJKYzntdhZ8jJ6EWy5jreZelgkdVBhzXhN3jWSBuo+EZEcMlQencpz4gDy8N5En3
 V1NJ+OJjQUzIKi0t7qgAk1QCoYDaS2hfWSRiD0RGi7BLnJFX3kDyh2Y0Jf6GfoX2qgnO
 qSzMWO8jG2AzjtbBvEpQRy4udWiVHxxps6MOuo44MIEI4HrzDHyG+7z5Dy9LHyGK8UPh
 Pvn9wKd6AC97AxMY5IT/6GWfpBSrUo6JHUQyG0qbBFVRorQxgLAwNkDYm/S0ZX1HfOet
 +gx0T5ymuJS0Iu9rfQrsZmnbvEFKBVXyuP5vzjk+ZXLSpdMhChh8Ylvlk5nN58NrQuAv
 TxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NiXYdyvLdDkYrckOfygRcIbU5uw8eEtfOT8dVCkJXPk=;
 b=6/UOWcTZnZiFx6SYiV3pR2WskcNf6zGktG6jYBKhyb5+CMd+wVBAcrs1R90IB+EcrC
 WsFoyFFSXDU6hUGZUoBFe8pBtS1vtK6onH3Zj4YpNaRNcBVXAMTie/fu43MpcZmI2YWJ
 aaZHdSZSlcFbLHXwDb/sbHSlBgemsakZHll6PIi1CCUrqjxu5ZSUiVTW/kyPz2x4n0Y/
 FYmZqlUDIwnGNrU8OFUJ9lp/2TOmVo/2OEXt+S1m+/V4QpMa6e98r83mHdK6XQ7/GM9a
 ZAzyL077AYgHPIUDbvWsaOHsdTdQZwZEmZoyouEZ42MCJbjfvZTN8j9+8thRBqaU94D3
 iyOw==
X-Gm-Message-State: AOAM531NEhZfT+XFRPsECkQb5eR+FdCXGzyq9MvHv9Qyuh0cIb556kN+
 NuwwvZYFYkE0TaABTKL/RXa304v8/I11rQ==
X-Google-Smtp-Source: ABdhPJwTlx0WSYReYlAXlkThyyvs0bsTusMg/xiUPU0db82qlYk+/QW+r0mzfUx8TZKYz0RBpN1ikw==
X-Received: by 2002:a05:622a:1187:: with SMTP id
 m7mr2518283qtk.336.1634166269146; 
 Wed, 13 Oct 2021 16:04:29 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:28 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Wed, 13 Oct 2021 19:03:56 -0400
Message-Id: <20211013230405.32170-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

The current file only has the Linux versions of these functions.
Rename the file accordingly and update the Makefile to only build
it on Linux. A Darwin version of these will follow later in the
series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
---
 hw/9pfs/{9p-util.c => 9p-util-linux.c} | 2 +-
 hw/9pfs/meson.build                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

diff --git a/hw/9pfs/9p-util.c b/hw/9pfs/9p-util-linux.c
similarity index 97%
rename from hw/9pfs/9p-util.c
rename to hw/9pfs/9p-util-linux.c
index 3221d9b498..398614a5d0 100644
--- a/hw/9pfs/9p-util.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -1,5 +1,5 @@
 /*
- * 9p utilities
+ * 9p utilities (Linux Implementation)
  *
  * Copyright IBM, Corp. 2017
  *
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 99be5d9119..1b28e70040 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -4,7 +4,6 @@ fs_ss.add(files(
   '9p-posix-acl.c',
   '9p-proxy.c',
   '9p-synth.c',
-  '9p-util.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
   '9p.c',
@@ -14,6 +13,7 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.33.0


