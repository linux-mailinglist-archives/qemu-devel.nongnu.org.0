Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5C4C5F7E
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:40:44 +0100 (CET)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSDb-0006OC-Mu
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8z-0006R9-NX
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:57 -0500
Received: from [2607:f8b0:4864:20::82a] (port=45585
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8l-00032F-0p
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:57 -0500
Received: by mail-qt1-x82a.google.com with SMTP id e2so7498015qte.12
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhmCSOC3CM9NyDHcskObyMbpau9QkFn/fvg6ws80gds=;
 b=UZV1M1C8CTpf8LGz0oD9dSH9vO2XTp9GVHg7vY0Id962rpmMWnoRouLuvdRIqhZVxj
 uyHJmGEKJnuSPjI1avpcWR8pDzL+q/pTdais2UOjn4RSfWe/KC57NRaHmTmjdSNVLJA/
 JI7T0eqiPPAlMvsalDVUPNXB4ZQzE1J8Ce2B3Df0/+8L6+/3ikLRMPSUSap5xyy0YtAP
 0RmHEoTNsHa812B/OHGsBnD9fSOGjAKT5yiPlgF+Z60WJTyb5f3Mgr6ZavN+fKso1xbX
 n48/DvS/HQz4ou8ij53azHs8T9Sei1HD9+1QUM7OTjqkuMLApreEj3/bYIc57rnsDVsA
 pY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhmCSOC3CM9NyDHcskObyMbpau9QkFn/fvg6ws80gds=;
 b=GF7I94M+bxgq1utia+WKLt2MXAhjV54+zmWW53bU2mJWjSJ37cJ2rWMCY3Csrh9J2e
 58BfRblOLbxUEFdKFLpuum0w2ShmxtVeV0ZOb44WBNxn4ZE3xoFtBODHP+grNYtkVpaj
 lHWT8npvEm/e9et1jqTF01fM5ICs3o+lCgVmppe9ff12KHbyVgK5S8qmJoxVhv1mSEXs
 cHg5xPwT5MCPJTpySQrZ6aabRfRzyyf3VV1Lt6+7KNMEngZpUdAZ0bwre1AQvJWBVT/r
 tlfX1horx7ytVVYVq+MGSa++Q+UXtJQsdL2YPsVuH233R6lsLe5Lll3OtEY4OH9CceOK
 6uEg==
X-Gm-Message-State: AOAM532zc0wZDYHdDpYDzhh0Sa97P/C6WmezlumrdJ1BgxjKgnlp3yrs
 hpTCqt2rohWMAyiXVX0/llsOV3sT/ss36A==
X-Google-Smtp-Source: ABdhPJxBWd/fi4EQURlP14wq/GoMvgtNC6uaTelFBoboQFi4WXDdiZuydKGR/pJ2AoivBPAWmeP/5A==
X-Received: by 2002:ac8:5fd5:0:b0:2de:6411:f1f5 with SMTP id
 k21-20020ac85fd5000000b002de6411f1f5mr14357946qta.470.1646001341867; 
 Sun, 27 Feb 2022 14:35:41 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:41 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Sun, 27 Feb 2022 17:35:13 -0500
Message-Id: <20220227223522.91937-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
2.35.1


