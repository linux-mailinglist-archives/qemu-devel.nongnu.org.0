Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854E3D7F6A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 22:43:18 +0200 (CEST)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Tv3-0008EJ-Iw
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 16:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8TtB-000630-3J
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Tt7-00054s-Sz
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z4so4792702wrv.11
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 13:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VcnYq3eD55Uy8c+Us62gnxQHgFPVpGFNIkhFMkhcYog=;
 b=o18IXIMahWe4d85bKA4JjiqEFVSQqmlG3xRw+KIh5FeC/Z9MiebZsKikFrZe6evVXp
 +wuae/ZlXQh3qL1hj+2x1Y1yC+T6/DQCdIwJ8ZGsd81smkFT41gbcMXyrufHtUbU9Ydq
 qKzxO09YYF0xfWYA/r3vChmY/CQT2ELTUmXSkjZWvotZhW4jjbq0cdYY8LsbM4sRNkPt
 nQ4xFB3HjWeLGbSllx2x5XnO+k9PjKKjOcZg3gqlbIvx89UgRXzp7z2uBEOxTflDqA/j
 8tlHnQXQqTnCb86jIZqcuyRgrW8oHb7+oC1uvVqYkK28LbnCQ34ss1OqQtSArVcgGXIj
 MlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VcnYq3eD55Uy8c+Us62gnxQHgFPVpGFNIkhFMkhcYog=;
 b=gvl+JPdyNFt5FJau3kWJamygpxxI0uSHa91x8E2NTwD5e0c/FbdoURLRichk4Hmdx1
 ibtJYUPdD/hDoyLH8sw0wVpL7NrKDDsNOaeRCy2MHsUK6EjxhR18buEbiUsLkE1UElHE
 62GmCy8QAJepOQ7XkOBuCZe532nk+lxLxXMyt7N1pdJ1TiTV/PeOCKF8XDVkv9IQFeMf
 zlovXu8O8LBNsuNn8X7RsZhOIIMQ8gvRKzs3x848SbotU9UC+s+dAJFFKctuduF6xfPJ
 jJv82Whp5hGwQax6einRzGfS5RJizJAyzSrHjTfX5RLxt0/u5QCgjBAPho4hTpj237l7
 9YPw==
X-Gm-Message-State: AOAM533pE/77xngiFMqb56seS0ztEhwjWLONkdWLajfAFvEef7gxuQd5
 x1/7qgFSsDlsFL3gV1rQy0ZVGCvawKJ0Pw==
X-Google-Smtp-Source: ABdhPJzxfUi0ZYCqKnpkGUYZiEwuyjnbkozX08d11/33sA6fjPLCB81Xs5Vh7vxV2i70HOc+8WmyDw==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr3176104wrs.365.1627418476442; 
 Tue, 27 Jul 2021 13:41:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h16sm4276302wre.52.2021.07.27.13.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] ui/input-barrier: Move TODOs from barrier.txt to a comment
Date: Tue, 27 Jul 2021 21:41:11 +0100
Message-Id: <20210727204112.12579-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727204112.12579-1-peter.maydell@linaro.org>
References: <20210727204112.12579-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

docs/barrier.txt has a couple of TODO notes about things to be
implemented in this device; move them into a comment in the
source code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


