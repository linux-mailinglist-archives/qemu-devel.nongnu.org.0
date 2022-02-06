Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49FA4AB1F6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:15:02 +0100 (CET)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnw5-0000zK-K2
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp1-0000zY-D5
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:44 -0500
Received: from [2607:f8b0:4864:20::833] (port=44969
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnoy-0001MP-PE
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:43 -0500
Received: by mail-qt1-x833.google.com with SMTP id b5so10370198qtq.11
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRawlGntANMvftiiUCe4tAsAdu6ihoZUG3xl9ZVAmto=;
 b=piE/I2vNBWfT2vQAkzIj/tUBeFgFlS0Sy+f15t/q8DtYiMW5jT3quc/Z4ZupncM7pk
 24ss+N2MI63GTT15kw7viFmjq+eIBmmrSpWJG4A6PXjGkIpRE+AShV6TewuskuhUML/7
 47oNcwZn2a6He9P+2wGV9t1VKDM4R68f7xv4iVshCLspjToYw63y95FmYkzbXHRY0HKu
 uqp4GrgIqQIiXsTuF9jnizZqMatGdqvLpNoj3vcFIbI2+JXtpVs8N3SkXFmTzftMg6V1
 2DWt7fYkEXC/gS2N3FJ+ohscEgVg1eTRRcFL/FEqAqChLUX+2ptHyDV+wAPj7OGVYm4J
 e79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRawlGntANMvftiiUCe4tAsAdu6ihoZUG3xl9ZVAmto=;
 b=uH3H7BThGfWhYhU84zvRrnOZ6OkzsFvnpka0DW12kXH1A6luMFVOSlqmljm9rBr5FR
 H3esvO6HicQkeNZT4s50/hqNASAftNVuxYtD/27NnV04EvqjIuI+/I6OKf/BbiIyhqav
 Cp4dPF+mgjIjrT4vSZ3QtnaSrnI3vaY8wR0leb69AUIs8Oe2U6Y57uCebCDNXkj6sr46
 zDI0qBin/MlVk+DasqCXmQAaXYLV/Dzla/DAj206EXhYkUPFTtPSyIGHHg4hLeKwFr+2
 Yazyq7KWyhqMFWAt/8uPD6I3ICVixN6pmaaOVOMEOmTHYsa0T7Xd64skvVrVoKKhlyC8
 /s0A==
X-Gm-Message-State: AOAM533Sl6oKJg/V09lSjPGo2A0vAwOUUrnlYyzmnf+Zei1YSu556tPo
 RqWDxymVvH6rOduW45NDjLlC0aQrbmzuGA==
X-Google-Smtp-Source: ABdhPJxzIiOYUIRS5HbSHgxYmfxJowCbhnNpRXDUZtv6ur2kbsbgDaQppQut/GttjuMm0zlf4pZjEg==
X-Received: by 2002:a05:622a:514:: with SMTP id
 l20mr5926523qtx.26.1644178059036; 
 Sun, 06 Feb 2022 12:07:39 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:38 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Sun,  6 Feb 2022 15:07:10 -0500
Message-Id: <20220206200719.74464-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

The current file only has the Linux versions of these functions.
Rename the file accordingly and update the Makefile to only build
it on Linux. A Darwin version of these will follow later in the
series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
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
2.32.0 (Apple Git-132)


