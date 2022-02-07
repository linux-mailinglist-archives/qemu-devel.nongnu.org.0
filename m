Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFD4ACC51
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:51:13 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCqm-0001RP-FO
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgY-0003ut-KS
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:41 -0500
Received: from [2607:f8b0:4864:20::730] (port=37792
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHCgR-0005h1-JS
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:40:37 -0500
Received: by mail-qk1-x730.google.com with SMTP id 71so12312869qkf.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 14:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xx52lzOqgL622oobwORa3EEAhlIX9nVPMGqj3BmF8qk=;
 b=qc/AUDv4DUOCDUVXwYIT64cI1SL3qpb5W4KtVxrP5jkZQDWeQoWTVIOgPIENR03TBz
 Zg65Vey0Qp0iMtF9H+lcqMvWgWkz2y5ycjb/YPhyRqrw51AnfOeVCzaDQsqJxnvOm8u3
 sRXLBbreR85ZPGP8ug6AjvqNjsYyGJd3ThVduLrj6f2JcVkZXPwtXettzabIayMFgJCp
 eN1OnAuCb2YndvzDbFK5ZF7vIAyfyQ5815Zeg/UoVEee1fUFmUWHikaJvk15cZ1dDq6R
 KGXOowAvzf/OHBNVku2Lx/WOLlbRqfpn3mi02kr/SW8+WH3HdHs5SCc04SJlDa1grGkX
 L9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xx52lzOqgL622oobwORa3EEAhlIX9nVPMGqj3BmF8qk=;
 b=OqpcprI0arH9lgC+RKki3dIqsfY4njW8r6MXox1Ow8w348aSjlo3pFDJ7qqizgPu3z
 3VIFm9K5YlzEHnqtlairER5VJpeSN2IBfFdfWv1xY4G8RvLJwS6u1ew1GQISbwbhlQwy
 +OvGqK4uTunNUb37v69iHzGHnmf4VNFfNlrZpgDj0fTjJfCILK3OtXObjsNuGeEa8fAU
 pzXJsbNY1fR1w8m5RV7PexLIZfrP0E49GTArUom858t61JDQLjoiY3SviS/7dHO84L6P
 HvHjiQoKdZ4mRlqZsPMhNz6FbsjNEPLNPssS95nLSp5Up3aqXtluNLv2YjsdnfG0KJmB
 +mTQ==
X-Gm-Message-State: AOAM530tauZQ/3o4qh7pmrFR6KMOBjmIPKRCMpsYEKEwQldNzsUMIx8s
 F2ESQ5ZDYfmczLmg4atNz3qG68N3V/9dSw==
X-Google-Smtp-Source: ABdhPJzg//J+okULWRgXhQz0Pv1GYP1Go5VK2pKQ83boc9C+cKDNpwDbCZ0ZCD8eHZsYCnECUXBkEw==
X-Received: by 2002:a05:620a:31a7:: with SMTP id
 bi39mr1195904qkb.124.1644273629574; 
 Mon, 07 Feb 2022 14:40:29 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j14sm6444744qko.10.2022.02.07.14.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:40:28 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Mon,  7 Feb 2022 17:40:15 -0500
Message-Id: <20220207224024.87745-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220207224024.87745-1-wwcohen@gmail.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
2.32.0 (Apple Git-132)


