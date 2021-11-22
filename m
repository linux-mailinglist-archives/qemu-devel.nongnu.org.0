Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F288C458784
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:53:22 +0100 (CET)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxaE-00044r-1A
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWS-00040O-PR
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:28 -0500
Received: from [2607:f8b0:4864:20::736] (port=42629
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWQ-0000wf-UJ
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:28 -0500
Received: by mail-qk1-x736.google.com with SMTP id g28so16438322qkk.9
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfvDuN4c+KD+ZY9ZO1rBZCxrfBxNV/dpt9cgp26yubM=;
 b=Q292t0QmbzK/2IccnKBFmjFaxx/iNaI1DUGeYM1vM2z9wBNxAHNuNvh58TA3gSaWA0
 H9VqNxRtjdH8CstIMOsXEGb6x0Mj41v+fmaLN6aCoTI6SO/MZaaur0j4xweRCuPYjnKQ
 5VjZczxv55oEa6HuLgOSZ7Ys830qrhKzYHUs0i579zvmc8hPQw8KYkKxDNNlBhjuSADf
 +wWGGgipoZ77ScsPRGu13FabzDu4a5yg7LwkFldrZN12izDAbERAePT3WWbY5GHUMA18
 QaMuonS9La67DS8kUYXYZndZgMkyNHMlxl8uY8AK0kh832mpKo7GlCO49hmEdGTkzHr3
 /O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfvDuN4c+KD+ZY9ZO1rBZCxrfBxNV/dpt9cgp26yubM=;
 b=RT4HaQRQb/xaxcXrZvbj64AnUV73IkNeiqCG3/TOT+QFsNW4VKhnEOZMzVjNOxNN/M
 XuwwE3KFEE2WuX6Z2yOvr4lbuml6w65kI0W/IRhCZMS/uo6b315DHl79DU7R1cLUr8tX
 ek+NuCJ5ZswEtL1SfF1/3DmeK27+GV4nm9Ci5xQBefLJeYZOT8P//K9marCVRjIhMDPD
 Xh8qjl498d3iNjEpPZ79ATUXKWLYJrsdCaurcwFyx03WJxKSlT8urOopspEfa2jAO7BE
 PbP2ZbVzwZL/xXiwr+GqYE4u7ji4kT+/MA/EqVtYlEClBE/i8iNA+PvpwfrRKy4IpqnK
 9PDg==
X-Gm-Message-State: AOAM532BvTwKf10KLtuF1N3lrOuYWVdP78NG0ENWJFtKPPlnHaMpxm4R
 4ZSqnKZvBAjveGbPgYfE0syABxcxPVv+Bw==
X-Google-Smtp-Source: ABdhPJxMIQGfiC7pI7OsocUSK3v9ziKeDqUTF8JIyTS+qy/HHee7rs74f6FacX9IVwjOQbSsYSc00w==
X-Received: by 2002:a05:620a:298a:: with SMTP id
 r10mr44411601qkp.447.1637542166055; 
 Sun, 21 Nov 2021 16:49:26 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:25 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Sun, 21 Nov 2021 19:49:04 -0500
Message-Id: <20211122004913.20052-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
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
2.34.0


