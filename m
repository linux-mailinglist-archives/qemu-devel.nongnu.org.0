Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A63CC92E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:51:36 +0200 (CEST)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56Gd-0003oL-Rk
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bi-0003jm-Of
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:31 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Be-0003Ua-Uf
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id l6so8642752wmq.0
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QOX6scBkPNt+Kv7Yrbt4acFURX9zLi1ymADxEH31q2M=;
 b=ELLwmydXDlAcnquNKSk/KoLvnPI8w6+9fIsgpdxYtKBv5U4PAmfuZ+b1z3f32JXD3i
 9NlN00Pa51L3+GxtudwnEd9FRVy8XwQGnIFSD43W6YLoNF4FL7QZQ8eMtqBigWZ+8uMU
 sCC2CEN5s1PMUWABIircgipZZLE1/sOoJa5a5H0VChYKdqf21WKiABo04UcPuiRTNMWO
 flNsJpbn2a36szUuCB0EZEAhn9v39RlhEi+Lm8NzLqRAmaPZKvwthCCsEV5LM1GU9bqp
 ceFixVtifKYDb0Uqx/JfcZsZVIkS0pueVqxxMXjFeMwQyhFr+4W9E2Dv6MsQ6vLisopg
 MmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOX6scBkPNt+Kv7Yrbt4acFURX9zLi1ymADxEH31q2M=;
 b=Qk8gDC9tNYfKcfeDJuBM/iDIWEB+EtMoekXN/7QoaWlr5HcCLE5HdDh5gBVJE9YRgG
 KwJTXbGYXxlw8Zr3mM0wnfJL2KoqmVl5tPcASZgTgbKhW2wzaEdZWMsYO84WAyszGITo
 kWf2MTMWiMT98wCAiwDizC0liYx2qMQolP/KqX1yKF73cJpF5ngYVAyD6ZfteHWhHaxc
 zJcAcsIi+TGkAakSRf1wWJ6ot3eCnnw45tbHPrkSfSwHijiG2WTLiuzaW14oljvb6pK+
 4o+FQt4N548PwhYdTyieWXHxG17/ugpNIs9uWvtREy3B1Gl8h/WgnmPSv7HoNeELwpS9
 fa6w==
X-Gm-Message-State: AOAM530atH5k95woW+0QNHGgzBOM9WFIjoO0u9WekbEBld9nsxgLL3p6
 f/B3H2OHXHVAsYy7yop4fQmix/lJpYP3VQ==
X-Google-Smtp-Source: ABdhPJyWwPgU+ouGGRvaMKDMN7BzLPHnjAyLwc8gZU4TRODGUEqPHxp2oVo4vxinT7UFe/M2rGpE+w==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr21391812wmh.97.1626612385675; 
 Sun, 18 Jul 2021 05:46:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] docs: Stop calling the top level subsections of our
 manual 'manuals'
Date: Sun, 18 Jul 2021 13:46:12 +0100
Message-Id: <20210718124621.13395-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We merged our previous multiple-manual setup into a single Sphinx
manual, but we left some text in the various index.rst lines that
still calls the top level subsections separate 'manuals'.  Update
them to talk about "this section of the manual" instead, and remove
now-obsolete comments about how the index.rst files are the "top
level page for the 'foo' manual".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20210705095547.15790-3-peter.maydell@linaro.org
---
 docs/devel/index.rst   | 5 +----
 docs/interop/index.rst | 7 ++-----
 docs/specs/index.rst   | 5 ++---
 docs/system/index.rst  | 5 +----
 docs/tools/index.rst   | 5 ++---
 docs/user/index.rst    | 5 +----
 6 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 40a7e2ee6ff..9299d2a502d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -1,10 +1,7 @@
-.. This is the top level page for the 'devel' manual.
-
-
 Developer Information
 =====================
 
-This manual documents various parts of the internals of QEMU.
+This section of the manual documents various parts of the internals of QEMU.
 You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 219a5e5fc50..8b34da6f551 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -1,11 +1,8 @@
-.. This is the top level page for the 'interop' manual.
-
-
 System Emulation Management and Interoperability
 ================================================
 
-This manual contains documents and specifications that are useful
-for making QEMU interoperate with other software.
+This section of the manual contains documents and specifications that
+are useful for making QEMU interoperate with other software.
 
 Contents:
 
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 7b08314d334..4c0d2a37cb8 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -1,9 +1,8 @@
-.. This is the top level page for the 'specs' manual
-
-
 System Emulation Guest Hardware Specifications
 ==============================================
 
+This section of the manual contains specifications of
+guest hardware that is specific to QEMU.
 
 Contents:
 
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 6092eb2d91d..2a9bd759807 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,10 +1,7 @@
-.. This is the top level page for the 'system' manual.
-
-
 System Emulation
 ================
 
-This manual is the overall guide for users using QEMU
+This section of the manual is the overall guide for users using QEMU
 for full system emulation (as opposed to user-mode emulation).
 This includes working with hypervisors such as KVM, Xen, Hax
 or Hypervisor.Framework.
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index d923834a739..ffb14b9690b 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,9 +1,8 @@
-.. This is the top level page for the 'tools' manual
-
-
 Tools
 =====
 
+This section of the manual documents QEMU's "tools": its
+command line utilities and other standalone programs.
 
 Contents:
 
diff --git a/docs/user/index.rst b/docs/user/index.rst
index a5b47459ec7..6ac2ac089fd 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,10 +1,7 @@
-.. This is the top level page for the 'user' manual.
-
-
 User Mode Emulation
 ===================
 
-This manual is the overall guide for users using QEMU
+This section of the manual is the overall guide for users using QEMU
 for user-mode emulation.  In this mode, QEMU can launch
 processes compiled for one CPU on another CPU.
 
-- 
2.20.1


