Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486922B07C8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:49:22 +0100 (CET)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDub-0002Ea-B3
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmU-0000uu-JL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmR-0003n2-Dm
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c9so5464965wml.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pziHaU0zIsxgQQdqAtH9ftid9QZXJBnOnlOur0LxnCY=;
 b=RYTnSZGtm6x8XACL9dIJJCjfONMp5Sdrq3aBXVO1V6K7x3+stdYrWT4BKwkic37D2b
 gGno6l3clSafRF4C1YfOwANoWCxWSYZB7kTL2o81dzIRtMFBtkUaoXMND/8nw05HRp0u
 UcXYKGlRfok9NwqqcFU8xneMsPkE8FVFFcdPvHbpkgaekyR6oTJk9/Bb9sy5L5gBkKra
 16QFFhLilNyCGDFDFKEWUccI/r7ngrEIen+m2Rn3FOhci8P2KMoYxcSju1A82Wt4XbsW
 kOnnY2rb8lv+7YHjX/N5TjgvVasmTz0HqMTUAe4jYpSLZX0FPvu9GRkiIp+ldcEgULEA
 6gUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pziHaU0zIsxgQQdqAtH9ftid9QZXJBnOnlOur0LxnCY=;
 b=Cl/N25qcnObw7l39rclqfpgTE3PtanlM6w+MIsQkmHZ+L+DRYhZv/hzHOBurUNjivY
 PDZsSqAA3Qh1jW/CahL4CjxiUvOqWHZu/BkaSoWDegRcbwbiicaB95TIUXqYV+hKwlhP
 8oE36v2X/lGK6Z4iqBqrbL7IcKVt54oxTxanxxgxbLiJk1STNjUvQ6lGzfqhU2njgIXs
 j+WMHE+oAemRJl9E5kTQwgM1j32aZ6WAgTTIrcVSKemo/+aoQIFM/i+cCMjwpce3wEzJ
 yu/FXPE+P60ifYFoweh4O1xqeCaHHIvyiUgpmdOnxQc5ltGVZdN0OtJAVjenJQ334PZd
 Bnyg==
X-Gm-Message-State: AOAM533TWBGpHEQISt78UbSlrEykhO/AtC3RkFoi3yLLsVyyNrgXZQKS
 25eUnIA6XUvt5t6Y3ldDDXCH1VivxmkrPA==
X-Google-Smtp-Source: ABdhPJzhk4g5q7GZg02nSbeLHg7CNkJvOUpJI4IIbHnhH07rdHQdsyrQKI2ynwtB3baV9BWCW39W/Q==
X-Received: by 2002:a1c:3502:: with SMTP id c2mr13570wma.79.1605192053276;
 Thu, 12 Nov 2020 06:40:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 8/9] docs: Split qemu-pr-helper documentation into tools
 manual
Date: Thu, 12 Nov 2020 14:40:40 +0000
Message-Id: <20201112144041.32278-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Split the documentation of the qemu-pr-helper binary into the tools
manual, and give it a manpage like our other standalone executables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/meson.build              |  1 +
 docs/system/pr-manager.rst    | 38 ++-------------
 docs/tools/conf.py            |  2 +
 docs/tools/index.rst          |  1 +
 docs/tools/qemu-pr-helper.rst | 90 +++++++++++++++++++++++++++++++++++
 5 files changed, 99 insertions(+), 33 deletions(-)
 create mode 100644 docs/tools/qemu-pr-helper.rst

diff --git a/docs/meson.build b/docs/meson.build
index bf8204a08fa..ebd85d59f98 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -60,6 +60,7 @@ if build_docs
     'tools': {
         'qemu-img.1': (have_tools ? 'man1' : ''),
         'qemu-nbd.8': (have_tools ? 'man8' : ''),
+        'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
         'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
         'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
diff --git a/docs/system/pr-manager.rst b/docs/system/pr-manager.rst
index 9b1de198b1b..3f5b9f94dcd 100644
--- a/docs/system/pr-manager.rst
+++ b/docs/system/pr-manager.rst
@@ -50,39 +50,11 @@ Alternatively, using ``-blockdev``::
           -blockdev node-name=hd,driver=raw,file.driver=host_device,file.filename=/dev/sdb,file.pr-manager=helper0
           -device scsi-block,drive=hd
 
-----------------------------------
-Invoking :program:`qemu-pr-helper`
-----------------------------------
-
-QEMU provides an implementation of the persistent reservation helper,
-called :program:`qemu-pr-helper`.  The helper should be started as a
-system service and supports the following option:
-
--d, --daemon              run in the background
--q, --quiet               decrease verbosity
--v, --verbose             increase verbosity
--f, --pidfile=path        PID file when running as a daemon
--k, --socket=path         path to the socket
--T, --trace=trace-opts    tracing options
-
-By default, the socket and PID file are placed in the runtime state
-directory, for example :file:`/var/run/qemu-pr-helper.sock` and
-:file:`/var/run/qemu-pr-helper.pid`.  The PID file is not created
-unless :option:`-d` is passed too.
-
-:program:`qemu-pr-helper` can also use the systemd socket activation
-protocol.  In this case, the systemd socket unit should specify a
-Unix stream socket, like this::
-
-    [Socket]
-    ListenStream=/var/run/qemu-pr-helper.sock
-
-After connecting to the socket, :program:`qemu-pr-helper`` can optionally drop
-root privileges, except for those capabilities that are needed for
-its operation.  To do this, add the following options:
-
--u, --user=user           user to drop privileges to
--g, --group=group         group to drop privileges to
+You will also need to ensure that the helper program
+:command:`qemu-pr-helper` is running, and that it has been
+set up to use the same socket filename as your QEMU commandline
+specifies. See the qemu-pr-helper documentation or manpage for
+further details.
 
 ---------------------------------------------
 Multipath devices and persistent reservations
diff --git a/docs/tools/conf.py b/docs/tools/conf.py
index 9052d17d6d4..4760d36ff2a 100644
--- a/docs/tools/conf.py
+++ b/docs/tools/conf.py
@@ -22,6 +22,8 @@ man_pages = [
      ['Fabrice Bellard'], 1),
     ('qemu-nbd', 'qemu-nbd', u'QEMU Disk Network Block Device Server',
      ['Anthony Liguori <anthony@codemonkey.ws>'], 8),
+    ('qemu-pr-helper', 'qemu-pr-helper', 'QEMU persistent reservation helper',
+     [], 8),
     ('qemu-trace-stap', 'qemu-trace-stap', u'QEMU SystemTap trace tool',
      [], 1),
     ('virtfs-proxy-helper', 'virtfs-proxy-helper',
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index 232ce9f3e46..b99f86c7c66 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -12,6 +12,7 @@ Contents:
 
    qemu-img
    qemu-nbd
+   qemu-pr-helper
    qemu-trace-stap
    virtfs-proxy-helper
    virtiofsd
diff --git a/docs/tools/qemu-pr-helper.rst b/docs/tools/qemu-pr-helper.rst
new file mode 100644
index 00000000000..ac036180ac1
--- /dev/null
+++ b/docs/tools/qemu-pr-helper.rst
@@ -0,0 +1,90 @@
+QEMU persistent reservation helper
+==================================
+
+Synopsis
+--------
+
+**qemu-pr-helper** [*OPTION*]
+
+Description
+-----------
+
+Implements the persistent reservation helper for QEMU.
+
+SCSI persistent reservations allow restricting access to block devices
+to specific initiators in a shared storage setup.  When implementing
+clustering of virtual machines, it is a common requirement for virtual
+machines to send persistent reservation SCSI commands.  However,
+the operating system restricts sending these commands to unprivileged
+programs because incorrect usage can disrupt regular operation of the
+storage fabric. QEMU's SCSI passthrough devices ``scsi-block``
+and ``scsi-generic`` support passing guest persistent reservation
+requests to a privileged external helper program. :program:`qemu-pr-helper`
+is that external helper; it creates a socket which QEMU can
+connect to to communicate with it.
+
+If you want to run VMs in a setup like this, this helper should be
+started as a system service, and you should read the QEMU manual
+section on "persistent reservation managers" to find out how to
+configure QEMU to connect to the socket created by
+:program:`qemu-pr-helper`.
+
+After connecting to the socket, :program:`qemu-pr-helper` can
+optionally drop root privileges, except for those capabilities that
+are needed for its operation.
+
+:program:`qemu-pr-helper` can also use the systemd socket activation
+protocol.  In this case, the systemd socket unit should specify a
+Unix stream socket, like this::
+
+    [Socket]
+    ListenStream=/var/run/qemu-pr-helper.sock
+
+Options
+-------
+
+.. program:: qemu-pr-helper
+
+.. option:: -d, --daemon
+
+  run in the background (and create a PID file)
+
+.. option:: -q, --quiet
+
+  decrease verbosity
+
+.. option:: -v, --verbose
+
+  increase verbosity
+
+.. option:: -f, --pidfile=PATH
+
+  PID file when running as a daemon. By default the PID file
+  is created in the system runtime state directory, for example
+  :file:`/var/run/qemu-pr-helper.pid`.
+
+.. option:: -k, --socket=PATH
+
+  path to the socket. By default the socket is created in
+  the system runtime state directory, for example
+  :file:`/var/run/qemu-pr-helper.sock`.
+
+.. option:: -T, --trace [[enable=]PATTERN][,events=FILE][,file=FILE]
+
+  .. include:: ../qemu-option-trace.rst.inc
+
+.. option:: -u, --user=USER
+
+  user to drop privileges to
+
+.. option:: -g, --group=GROUP
+
+  group to drop privileges to
+
+.. option:: -h, --help
+
+  Display a help message and exit.
+
+.. option:: -V, --version
+
+  Display version information and exit.
-- 
2.20.1


