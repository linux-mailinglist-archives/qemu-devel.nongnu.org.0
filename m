Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D794B74BA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:37:28 +0100 (CET)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3df-0006X1-TL
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK382-0000YO-4P
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:46 -0500
Received: from [2607:f8b0:4864:20::736] (port=37536
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK380-0002jK-4l
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:45 -0500
Received: by mail-qk1-x736.google.com with SMTP id 71so18211302qkf.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aU38QXrWIFeszm233oTiu8pqJG9R/BMWH8IeCEGMGvc=;
 b=if8EoBF93CN41Elg221j8HZak/5KMvhkebm5HhVaYmU1EifxoSEfxcvn6w7SLUsMKn
 vqNYZ8CpqKS1p/t0GAQQQrKp+Da637mzRsrXjucWqn+aotczT/RpWDS5yXVg7lKjIXQa
 Vnzvzecd/eTMoHp1Pqm/RRYhjcG9Tmn9Dga7/7EdcLY6LNVjA5EXnnpg75AkuCn5GrgB
 Sd+hrG2Y6vkBiP6iyAfsJatVNVar3qeqjIBlHig0Gz2gXN1Z9nimH8azDL0rHTk+Xrus
 rDUqQ25+MZG3XSgYVMe3H9x/i8EQaND0+O6ZH/kmnz2oz4fTplekDhO7hsFZo/JpEHOa
 MNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aU38QXrWIFeszm233oTiu8pqJG9R/BMWH8IeCEGMGvc=;
 b=1Kg2OWER27i0c58uhBIob+D+cGtTdsMWZSB57k9KGbSLls0u+AAHs4T4kxWhiZpAqv
 PM25/BoEoPRnuicXmDAnZh+bMjCrAIgeSQCjLwkRXO0E0rOOOTkE+cSRjr8egJZngZYH
 sCsMpBuBs5l3073YcIK/CsuUd9jn67/wknG45KUHQn2fQeRuynrc3eBkYCt4cPLxgl9J
 v3/gZ7NiWWdUfrpZPhWAOE1juT4SYi9Cz3g9vushR6A8RLDfdljcFzdvt1zUAvz4ZDdP
 5tTmE+yG0h5QLC5NRfZeczAn7bOGK1cN/iDdzXFbqbNkkfXhuSJJmollFHRM/3hHaVL1
 WEKg==
X-Gm-Message-State: AOAM532iblyB6KIC5VgZprSRHhDCE/xoZySbvJv3G4aP1Y0xWsAxFWau
 0zHWWYdqvCffXsd1EiEIxOUZYOSPiT+Wfw==
X-Google-Smtp-Source: ABdhPJxjm52TCK0k9w6f7K3clCuBvHUu7Rt7ecMeGIE0N6y7JRIwgAfOS1vQDsrlCZZimTVB1B86XQ==
X-Received: by 2002:a05:620a:70f:: with SMTP id
 15mr253071qkc.682.1644951882784; 
 Tue, 15 Feb 2022 11:04:42 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:41 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Tue, 15 Feb 2022 14:04:17 -0500
Message-Id: <20220215190426.56130-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
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


