Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CE4B1209
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:49:11 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBh0-0006pb-2I
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:49:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9X6-00037H-1F
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:49 -0500
Received: from [2607:f8b0:4864:20::f35] (port=35537
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WO-0004F4-MH
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:16 -0500
Received: by mail-qv1-xf35.google.com with SMTP id d7so4935699qvk.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aU38QXrWIFeszm233oTiu8pqJG9R/BMWH8IeCEGMGvc=;
 b=eSDOFOCyyXy7FiJ3eNpjbDHdRZN16NikpCNGjpvDYSh+6vnH5A/kT8B1Qs+re6C5Jp
 AIswkxIop5UPfT+t09LlwIlRstWH1EyGjZeMG0W+6og41HolDwYjTnp3Q9elwmiPV1/D
 q/09rQMngT6ybGPYqB45DIvoq7VS/VYemF00o5US379AUBI6rBrjcH++ExJ2orWFu7fs
 QlbT/pZq2Q+0Y8NVFnX96Fho8JKM4gDgrIb32fgLHwv52Jx/3he7SrlAjd/9wQNj3DL1
 oxWyBE8yEubXOx1qLHUcUqUUfxpc5LsFyst+Y51HVobtlXaHzfnHgUfz3svVuGDxfJzI
 H/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aU38QXrWIFeszm233oTiu8pqJG9R/BMWH8IeCEGMGvc=;
 b=v4gHFwpHchVUYwFacpI1KCt+HAX+sQXT7z5pnNCgQnOLYjDARd1R2S8P3kPKZuTceM
 zIHvPR16wm89gPvsc3v8hTY5a42QyoK3TlkJr8RjH7OMPVvLcADynK8aDnxpURytDyvL
 FKerIRNSXsIi+Q/qDfabCP4lz1PcME7iPgzUC0DtONHgcXR6NIQjR+/I8Y5C3G049XMA
 lSIC6PjDHlln4ZxyTtjhTBsXsfEw7cB4n4gSDuPbT+7zvcfGTmpTKPFu2H2qwe8GUJDJ
 hjfpbXQjdZx6DgRwHuoQACVp/T1rEXwxN9R4B+huWUf1bmcJMKlZG5vg1ElQSzM9dwr+
 dQpw==
X-Gm-Message-State: AOAM5304R0gf/naeDfQ3dfp0zcuMvTOo2mnR56NksHbJ37QwuP68dTGv
 RqiN8com0yrZ6E4tqI39q/r7tRFseuip0g==
X-Google-Smtp-Source: ABdhPJyOGNckJFWEecdYjkb5Ng0cYbvVuL3l+pAW/gsK+N117zAikOLOMUyH4vdLBrA1pzTR7T5B7A==
X-Received: by 2002:a0c:e7d0:: with SMTP id c16mr2957298qvo.49.1644499803029; 
 Thu, 10 Feb 2022 05:30:03 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:02 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Thu, 10 Feb 2022 08:29:37 -0500
Message-Id: <20220210132946.2303-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.34.1


