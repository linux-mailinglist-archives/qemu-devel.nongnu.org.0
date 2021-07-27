Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B623D7F6B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 22:43:29 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8TvE-0008PR-DG
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 16:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8TtA-00062w-H6
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Tt8-00055H-Go
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 16:41:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id c16so6824708wrp.13
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xjc6qbYEkUxvCWIP95+CKztLYP2Wu1QJjbcbEUgKUfQ=;
 b=Po55Q4E/YH79msJrPO/X0jhBUaMvk0oKjJhRE+mniSwMntNq0WmN1q1aJWoX0m7UmC
 1CuTqADnv8bq1pEU4TSYdyV2i0WbL+A0/zeH5kidbvde646Wv3hDv3JDrDcHpuXCmb8i
 qXDpdS15TnBpvkfskW2qbD0KPrlOQxhGaZvWtDcjFgcZncLNgC6w702VIGtJT/0jyxxC
 QanSjoLvEOIQVdm7JpT8lBpKPgVvbWSJZdqdV3OmmTmiExqGCuGku37YC+wZBafrFZL4
 qf64RhAQWEkQth4AqHh2rDKTuHdZMfDsLaU/rjxEZk3ZQlSVImznWpx/Ut2J1HhGFwTv
 tc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xjc6qbYEkUxvCWIP95+CKztLYP2Wu1QJjbcbEUgKUfQ=;
 b=jeGujHelmWsGi67BufYVdiCHpheODMbBmEmH/L2q/RZ9uVjN4nBpPFb5g9XRgA/7gH
 SHVe0ceTAmfb6JzR6D0F8K2sOQyNAVHxQnMRO1n5IH/ZHAqzEmrXA7OaYqn+3L5wF0hb
 vD3/BEZINAxIn+MhtQEIN8pnPJE/JHfoEXUqzcjQA49SDfKhehcpCUE393SMiNDKG0pO
 +XDB5NbeOJ+V+6kSYKVAVal7UYE6rsE3Kr2RKrCXCG0tNzEjhV2GFjM91Mq07RFORc+g
 1D3sH4tUtBox1tv4qzg409G8EuPt0MS3m5AGnpsM1CaAIX6mu/4ZrQkuH0Q32GOuNYpD
 F5hA==
X-Gm-Message-State: AOAM533WPk/Poj5QpGGjFkSKCiZlHRbXxxuq8o5Uds/z598ZzfB+U5gN
 PbcLjW7MZm9dE9s6RhUL2afFnknbs2F5qw==
X-Google-Smtp-Source: ABdhPJwhC5Ljuevn2ugi7qK1Rhj0S+ImZCfoAjVXmh06xmNvsmBU3oWFdaeOj+YErOXKm1tawzH1GQ==
X-Received: by 2002:a5d:65c1:: with SMTP id e1mr15638488wrw.320.1627418477173; 
 Tue, 27 Jul 2021 13:41:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h16sm4276302wre.52.2021.07.27.13.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] docs: Move user-facing barrier docs into system manual
Date: Tue, 27 Jul 2021 21:41:12 +0100
Message-Id: <20210727204112.12579-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727204112.12579-1-peter.maydell@linaro.org>
References: <20210727204112.12579-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The remaining text in docs/barrier.txt is user-facing description
of what the device is and how to use it. Move this into the
system manual and rstify it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/barrier.txt        | 48 -----------------------------------------
 docs/system/barrier.rst | 44 +++++++++++++++++++++++++++++++++++++
 docs/system/index.rst   |  1 +
 3 files changed, 45 insertions(+), 48 deletions(-)
 delete mode 100644 docs/barrier.txt
 create mode 100644 docs/system/barrier.rst

diff --git a/docs/barrier.txt b/docs/barrier.txt
deleted file mode 100644
index 54cb5fd8efc..00000000000
--- a/docs/barrier.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-                                QEMU Barrier Client
-
-
-* About
-
-    Barrier is a KVM (Keyboard-Video-Mouse) software forked from Symless's
-    synergy 1.9 codebase.
-
-    See https://github.com/debauchee/barrier
-
-* QEMU usage
-
-    Generally, mouse and keyboard are grabbed through the QEMU video
-    interface emulation.
-
-    But when we want to use a video graphic adapter via a PCI passthrough
-    there is no way to provide the keyboard and mouse inputs to the VM
-    except by plugging a second set of mouse and keyboard to the host
-    or by installing a KVM software in the guest OS.
-
-    The QEMU Barrier client avoids this by implementing directly the Barrier
-    protocol into QEMU.
-
-    This protocol is enabled by adding an input-barrier object to QEMU.
-
-    Syntax: input-barrier,id=<object-id>,name=<guest display name>
-            [,server=<barrier server address>][,port=<barrier server port>]
-            [,x-origin=<x-origin>][,y-origin=<y-origin>]
-            [,width=<width>][,height=<height>]
-
-    The object can be added on the QEMU command line, for instance with:
-
-        ... -object input-barrier,id=barrier0,name=VM-1 ...
-
-    where VM-1 is the name the display configured int the Barrier server
-    on the host providing the mouse and the keyboard events.
-
-    by default <barrier server address> is "localhost", port is 24800,
-    <x-origin> and <y-origin> are set to 0, <width> and <height> to
-    1920 and 1080.
-
-    If Barrier server is stopped QEMU needs to be reconnected manually,
-    by removing and re-adding the input-barrier object, for instance
-    with the help of the HMP monitor:
-
-        (qemu) object_del barrier0
-        (qemu) object_add input-barrier,id=barrier0,name=VM-1
-
diff --git a/docs/system/barrier.rst b/docs/system/barrier.rst
new file mode 100644
index 00000000000..a15742b5bc9
--- /dev/null
+++ b/docs/system/barrier.rst
@@ -0,0 +1,44 @@
+QEMU Barrier Client
+===================
+
+Generally, mouse and keyboard are grabbed through the QEMU video
+interface emulation.
+
+But when we want to use a video graphic adapter via a PCI passthrough
+there is no way to provide the keyboard and mouse inputs to the VM
+except by plugging a second set of mouse and keyboard to the host
+or by installing a KVM software in the guest OS.
+
+The QEMU Barrier client avoids this by implementing directly the Barrier
+protocol into QEMU.
+
+`Barrier <https://github.com/debauchee/barrier>`__
+is a KVM (Keyboard-Video-Mouse) software forked from Symless's
+synergy 1.9 codebase.
+
+This protocol is enabled by adding an input-barrier object to QEMU.
+
+Syntax::
+
+    input-barrier,id=<object-id>,name=<guest display name>
+    [,server=<barrier server address>][,port=<barrier server port>]
+    [,x-origin=<x-origin>][,y-origin=<y-origin>]
+    [,width=<width>][,height=<height>]
+
+The object can be added on the QEMU command line, for instance with::
+
+    -object input-barrier,id=barrier0,name=VM-1
+
+where VM-1 is the name the display configured int the Barrier server
+on the host providing the mouse and the keyboard events.
+
+by default ``<barrier server address>`` is ``localhost``,
+``<port>`` is ``24800``, ``<x-origin>`` and ``<y-origin>`` are set to ``0``,
+``<width>`` and ``<height>`` to ``1920`` and ``1080``.
+
+If Barrier server is stopped QEMU needs to be reconnected manually,
+by removing and re-adding the input-barrier object, for instance
+with the help of the HMP monitor::
+
+    (qemu) object_del barrier0
+    (qemu) object_add input-barrier,id=barrier0,name=VM-1
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 650409d1566..7b9276c05f0 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -20,6 +20,7 @@ or Hypervisor.Framework.
    linuxboot
    generic-loader
    guest-loader
+   barrier
    vnc-security
    tls
    secrets
-- 
2.20.1


