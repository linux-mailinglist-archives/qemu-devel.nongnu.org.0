Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2663D2CAD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:22:18 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6eGt-0000UH-Hp
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6eFM-0007OA-Hf
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:20:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6eF6-0001h1-AJ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:20:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id m2so7088233wrq.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIe6krsDhjD6FHv55m4MSZV1Dvrb6LjR3VitwnfK6eg=;
 b=i6gPzqZhLfLKhq6pCsuOhyldeSat9cTzNn2SyWJURhEFEliHD9eOX7yB7pOBT/xsm3
 23YuN88BIKqp1IsR2t89UOyGY+gLZqWXvpKaUN7zSe4Ate36tnRIndVrlrHm7g7qMvv0
 nJT56ugeKrTJbFXCg36N9hoqIp8koQnIjwgMqjPsL92JFLHs8bgI8bEoLnOQ25YRojba
 ufNjXdlKZPTzcNqMTG0E7akNZ2FM1wcV7YYpRdzC965wifbFkCbWMbZBQJvv3qsGW+UM
 lEuQG4r545mpYsHLS91i23y4YIFYQFj9qSKJ588pb40wILdMu2CBvqz3A8Dgf8hC72nd
 saCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HIe6krsDhjD6FHv55m4MSZV1Dvrb6LjR3VitwnfK6eg=;
 b=o4O7XwRkHt7e2Bk3XPD4hhvDcXEV8aHaIRhk37oWx88kUK1fGbWwThRsDulkipfwWB
 MBk8jvs0SUzuBXEHz5jYmJY+JhJBd5EZMpNaHhVJy5CjsJwhiUduW7V+WKr5rf2t6g5o
 /TQv7neXX4rpkY07VdLKqfg7FIaUn2CvmRcj4w+xtTOY6Hzf+1ekgtnN4j4qH8X+MXzx
 m5/aQqNxLNAcNJBrHXJJxVHbk6zCS4mxx4AS/UcEVLFnTiON4FWaQSbEnafCR2cSyIhC
 0ajCpc+uHlYF9240W9pZ0Z83ZL9b99tgAtiSX5rI3SisgEzoR5iIACk8Rd7jx3hhnJ2c
 Xrfw==
X-Gm-Message-State: AOAM531dqgXPz+q5xmLPBEU4dFTcdOaeSh+91eEjSq0DqKwzrV1gcW85
 n6QAA0iBNoak3mZEWcbkkG3/CbSuw4VUIQ==
X-Google-Smtp-Source: ABdhPJwZGKH8oisfR2mqiTcktt5W2yRoYyWt7ifjdPjtDJA6WBkaBn7CZKql8CtnTEyRuTycgpI4fQ==
X-Received: by 2002:adf:b318:: with SMTP id j24mr1509500wrd.361.1626981619366; 
 Thu, 22 Jul 2021 12:20:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z25sm26201612wmf.9.2021.07.22.12.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 1/2] docs: Remove stale TODO comments about license
 and version
Date: Thu, 22 Jul 2021 20:20:15 +0100
Message-Id: <20210722192016.24915-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722192016.24915-1-peter.maydell@linaro.org>
References: <20210722192016.24915-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commits 13f934e79fa and 3a50c8f3067aaf, our HTML docs include a
footer to all pages stating the license and version.  We can
therefore delete the TODO comments suggesting we should do that from
our .rst files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/interop/qemu-ga-ref.rst                 | 9 ---------
 docs/interop/qemu-qmp-ref.rst                | 9 ---------
 docs/interop/qemu-storage-daemon-qmp-ref.rst | 9 ---------
 3 files changed, 27 deletions(-)

diff --git a/docs/interop/qemu-ga-ref.rst b/docs/interop/qemu-ga-ref.rst
index db1e9461249..032d4924552 100644
--- a/docs/interop/qemu-ga-ref.rst
+++ b/docs/interop/qemu-ga-ref.rst
@@ -1,15 +1,6 @@
 QEMU Guest Agent Protocol Reference
 ===================================
 
-..
-   TODO: the old Texinfo manual used to note that this manual
-   is GPL-v2-or-later. We should make that reader-visible
-   both here and in our Sphinx manuals more generally.
-
-..
-   TODO: display the QEMU version, both here and in our Sphinx manuals
-   more generally.
-
 .. contents::
    :depth: 3
 
diff --git a/docs/interop/qemu-qmp-ref.rst b/docs/interop/qemu-qmp-ref.rst
index b5bebf6b9a9..357effd64f3 100644
--- a/docs/interop/qemu-qmp-ref.rst
+++ b/docs/interop/qemu-qmp-ref.rst
@@ -1,15 +1,6 @@
 QEMU QMP Reference Manual
 =========================
 
-..
-   TODO: the old Texinfo manual used to note that this manual
-   is GPL-v2-or-later. We should make that reader-visible
-   both here and in our Sphinx manuals more generally.
-
-..
-   TODO: display the QEMU version, both here and in our Sphinx manuals
-   more generally.
-
 .. contents::
    :depth: 3
 
diff --git a/docs/interop/qemu-storage-daemon-qmp-ref.rst b/docs/interop/qemu-storage-daemon-qmp-ref.rst
index d0ebb42ebd5..9fed68152f5 100644
--- a/docs/interop/qemu-storage-daemon-qmp-ref.rst
+++ b/docs/interop/qemu-storage-daemon-qmp-ref.rst
@@ -1,15 +1,6 @@
 QEMU Storage Daemon QMP Reference Manual
 ========================================
 
-..
-   TODO: the old Texinfo manual used to note that this manual
-   is GPL-v2-or-later. We should make that reader-visible
-   both here and in our Sphinx manuals more generally.
-
-..
-   TODO: display the QEMU version, both here and in our Sphinx manuals
-   more generally.
-
 .. contents::
    :depth: 3
 
-- 
2.20.1


