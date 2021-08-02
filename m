Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52083DD512
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:02:08 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWdz-0005q8-N6
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaV-0000sz-LA
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaU-0003eE-7U
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id b13so10310611wrs.3
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9dbyq1yCrycHM80bLpDWIuG3WyndUcqs1WyZ9Er/ZQc=;
 b=f+TQGJrljWqI9gvMnmZe/gNs2kuoEiMJaZ9vJlhCiY2Xg7Df5lD4S6DG1vVyuuT1Mq
 xlZMPH2AA4vJw8nZFhULTPbDSmmyRq4cYGs/javuJuKufkYx8WbMDhI5IlyE9uR95f9Z
 kyWXguN4doqXE2VGisr0vR2LkT4OW1gh2Iv6uLB3iw4Ukh/FCA5ySYjf8pzjV3Jf8wzc
 fZ6ZFWODkNq0vNOSIKeykYN1t+GcxDH7m+Aef61pQQGut6YrlTSJDgiydO8aUxPHK/MW
 g0QtF/8425UkoM4dP4+UP3sRg7h+sfS+pDaVjrAWLdgW5/iwqFJJjKowFhVI4sHiaAtl
 tW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dbyq1yCrycHM80bLpDWIuG3WyndUcqs1WyZ9Er/ZQc=;
 b=LUkaqo5lJNvijmVe5a5OygGL6HgXhO2F5Yh1jbE6oaX56/1vATWAQKam5lpiR5QVwU
 bkjs8KKvPDFSQShN2AX2p7/ZjD3nIpmRWRxRxgyiyEyMmMN9+LsGuqKWE1dX1q+sDsbD
 VhLVxUnk/1RR0voCKNJb2DW8eCn9bSsl3qWjv+nlNwIrkrkXuYMIVxoYm2ofkenebsOy
 kvZgT2WN5vPf+j0tAlbUb2apN37w6k3lvk2bpoCYLUxGAKGnULIIcmjRAQaFbR1bhWT/
 ReL/7eZvF/FCYHAL2hykIKP47jP6SYSew6/GPohAl9szxuzhtOpF99FdI98FbTvBkMv3
 HfBQ==
X-Gm-Message-State: AOAM530E9WWzPyGHjSMyfFZfhHJYE8rLs0SLWp4NvziWUtMCGlkJJ9gZ
 sueeFVJcexUtqPjsVUxBS8rnm4tu9Ittpg==
X-Google-Smtp-Source: ABdhPJz5wYoJYlTs/x2/YV03b3J0eGcLPmDoo/kxOIxAlN4S/faOTJHUhmSBQ909tw2wCJZmwHMDhA==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr16871132wrv.329.1627905508971; 
 Mon, 02 Aug 2021 04:58:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] ui/input-barrier: Move TODOs from barrier.txt to a
 comment
Date: Mon,  2 Aug 2021 12:58:11 +0100
Message-Id: <20210802115812.10731-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

docs/barrier.txt has a couple of TODO notes about things to be
implemented in this device; move them into a comment in the
source code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210727204112.12579-3-peter.maydell@linaro.org
---
 docs/barrier.txt   | 4 ----
 ui/input-barrier.c | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/barrier.txt b/docs/barrier.txt
index 376d0b2d709..54cb5fd8efc 100644
--- a/docs/barrier.txt
+++ b/docs/barrier.txt
@@ -45,8 +45,4 @@
 
         (qemu) object_del barrier0
         (qemu) object_add input-barrier,id=barrier0,name=VM-1
-* TO DO
-
-    - Enable SSL
-    - Manage SetOptions/ResetOptions commands
 
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index 81b8d04ec8d..2d57ca70791 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -3,6 +3,11 @@
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
+ *
+ * TODO:
+ *
+ *  - Enable SSL
+ *  - Manage SetOptions/ResetOptions commands
  */
 
 #include "qemu/osdep.h"
-- 
2.20.1


