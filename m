Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1D3DD57B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:16:17 +0200 (CEST)
Received: from localhost ([::1]:58828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWrg-0006pN-SI
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaX-0000y3-5h
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:33 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaU-0003en-SM
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:32 -0400
Received: by mail-wr1-x436.google.com with SMTP id k4so10353243wrc.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nGpfpSEqJjfEaG1N2BaqzOf+zX9fc5AolwWGoQxIdJg=;
 b=Ss/mBjYikQSQbyqi8kwR1W7m3JHs7fcLCDQ5LQtpfF0+zHsEe8Rhasisu2J3Fhxp5S
 ix2Sfq7Fy2hVHJ3Gyvi1DyYH80iKrxj/Yi2YOcLXanDoVsR1i3z4I4Iz4ew37XFHOrIT
 wTZ2CcVy1lX7ntdu1CcUwXo9cLRTi2ZWy3LPeDBY8OlpqZkk1nbOlO52Lsbu6n6bxSfm
 +P1cpu0kq+juAVyQtqOFZEg0qlVFxoWSx5ILHnf7+zeXuqaI2unHQOlAJ4JRmS4X76K5
 R5DF5guLqc9Xco4Td/HWiylWjGeyiCRqoCgQiWCCoUM8wD8+gVlJZVIThrlJq+/Xbpvy
 vLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nGpfpSEqJjfEaG1N2BaqzOf+zX9fc5AolwWGoQxIdJg=;
 b=ntAvMs+jwHJlfj7b86LQgAVzwuzBjTeMKq1mWSbhQsHMc8SzkW8dsHz4q+vYc1zBRf
 dJqhx1U8BBSjZyP5k+aKUko72AtpuwSVSO498RnQGYEKve55kR9vhJvDegVBe3SP4127
 wTieLZ4qMDKlGoa/RfTJoEMTCCa6IC92LOaiV+Se5AlIeZv3nMTdmqiYdLK5pnAn/9lx
 EdqLNzIqhklTesyfHXRW2q7sNf2fZSMxmW4Hfn24MUy6Tb89VtsBIw4RxWn2F2UIuNwS
 aHFJ2mIBfiHdlDTzGMArQerVWhIzfXud1xb4IVT+PTgn8Gdf03MMgHU+z0kdksJ3gsM+
 EesA==
X-Gm-Message-State: AOAM530lxwjJiaklKRMxdKAtaJtnBmPaQpYEucZef2zlZzWXk/l8gFq1
 TDdEhTMurFYDS+CNyYGQNtXKYGbCbvB5Tg==
X-Google-Smtp-Source: ABdhPJzX8UAP0Lx+lEmPEy/XjmlZr88msGdhegztmsOXW4Y8bRMoLL4mY4VUJQzqocKK6PLqSBgNIw==
X-Received: by 2002:a5d:4b48:: with SMTP id w8mr17322681wrs.109.1627905509595; 
 Mon, 02 Aug 2021 04:58:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] docs: Move user-facing barrier docs into system manual
Date: Mon,  2 Aug 2021 12:58:12 +0100
Message-Id: <20210802115812.10731-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The remaining text in docs/barrier.txt is user-facing description
of what the device is and how to use it. Move this into the
system manual and rstify it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210727204112.12579-4-peter.maydell@linaro.org
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
index 00000000000..155d7d29013
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
+where VM-1 is the name the display configured in the Barrier server
+on the host providing the mouse and the keyboard events.
+
+by default ``<barrier server address>`` is ``localhost``,
+``<port>`` is ``24800``, ``<x-origin>`` and ``<y-origin>`` are set to ``0``,
+``<width>`` and ``<height>`` to ``1920`` and ``1080``.
+
+If the Barrier server is stopped QEMU needs to be reconnected manually,
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


