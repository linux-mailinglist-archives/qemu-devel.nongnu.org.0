Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE0454F16
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 22:08:16 +0100 (CET)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnSAB-0006Jq-Iw
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 16:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1mnS97-0005fG-BX
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 16:07:09 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:56960
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1mnS94-0002q4-Ux
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 16:07:09 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 826ACDA04AC;
 Wed, 17 Nov 2021 22:07:04 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 76B89460131; Wed, 17 Nov 2021 22:07:04 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2] Fix some typos in documentation (found by codespell)
Date: Wed, 17 Nov 2021 22:07:02 +0100
Message-Id: <20211117210702.1393570-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/devel/multi-process.rst            | 2 +-
 docs/devel/qgraph.rst                   | 2 +-
 docs/devel/writing-monitor-commands.rst | 2 +-
 docs/hyperv.txt                         | 2 +-
 docs/system/cpu-models-x86.rst.inc      | 2 +-
 docs/system/devices/nvme.rst            | 2 +-
 docs/system/gdb.rst                     | 2 +-
 docs/system/ppc/ppce500.rst             | 2 +-
 docs/system/riscv/shakti-c.rst          | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/devel/multi-process.rst b/docs/devel/multi-process.rst
index e5758a79ab..5c857ff3b9 100644
--- a/docs/devel/multi-process.rst
+++ b/docs/devel/multi-process.rst
@@ -641,7 +641,7 @@ the CPU that issued the MMIO.
 +==========+========================+
 | rid      | range MMIO is within   |
 +----------+------------------------+
-| offset   | offset withing *rid*   |
+| offset   | offset within *rid*    |
 +----------+------------------------+
 | type     | e.g., load or store    |
 +----------+------------------------+
diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index db44d71002..43342d9d65 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -14,7 +14,7 @@ support that device.
 Using only libqos APIs, the test has to manually take care of
 covering all the setups, and build the correct command line.
 
-This also introduces backward compability issues: if a device/driver command
+This also introduces backward compatibility issues: if a device/driver command
 line name is changed, all tests that use that will not work
 properly anymore and need to be adjusted.
 
diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index b3e2c8481d..1693822f8f 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -677,7 +677,7 @@ return a single text string::
 
 The ``HumanReadableText`` struct is intended to be used for all
 commands, under the ``x-`` name prefix that are returning unstructured
-text targetted at humans. It should never be used for commands outside
+text targeted at humans. It should never be used for commands outside
 the ``x-`` name prefix, as those should be using structured QAPI types.
 
 Implementing the QMP command
diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5d99fd9a72..0417c183a3 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -195,7 +195,7 @@ The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC enabled.
 Normally, Hyper-V SynIC disables these hardware feature and suggests the guest
 to use paravirtualized AutoEOI feature.
 Note: enabling this feature on old hardware (without APICv/AVIC support) may
-have negative effect on guest's performace.
+have negative effect on guest's performance.
 
 3.19. hv-no-nonarch-coresharing=on/off/auto
 ===========================================
diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 6e8be7d79b..884b6d20fb 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -49,7 +49,7 @@ future OS and toolchains are likely to target newer ABIs. The
 table that follows illustrates which ABI compatibility levels
 can be satisfied by the QEMU CPU models. Note that the table only
 lists the long term stable CPU model versions (eg Haswell-v4).
-In addition to whats listed, there are also many CPU model
+In addition to what's listed, there are also many CPU model
 aliases which resolve to a different CPU model version,
 depending on the machine type is in use.
 
diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index bff72d1c24..00b006a604 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -70,7 +70,7 @@ namespaces and additional features, the ``nvme-ns`` device must be used.
 
 The namespaces defined by the ``nvme-ns`` device will attach to the most
 recently defined ``nvme-bus`` that is created by the ``nvme`` device. Namespace
-identifers are allocated automatically, starting from ``1``.
+identifiers are allocated automatically, starting from ``1``.
 
 There are a number of parameters available:
 
diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index bdb42dae2f..453eb73f6c 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -56,7 +56,7 @@ machine has more than one CPU, QEMU exposes each CPU cluster as a
 separate "inferior", where each CPU within the cluster is a separate
 "thread". Most QEMU machine types have identical CPUs, so there is a
 single cluster which has all the CPUs in it.  A few machine types are
-heterogenous and have multiple clusters: for example the ``sifive_u``
+heterogeneous and have multiple clusters: for example the ``sifive_u``
 machine has a cluster with one E51 core and a second cluster with four
 U54 cores. Here the E51 is the only thread in the first inferior, and
 the U54 cores are all threads in the second inferior.
diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index afc58f60f5..9beef39171 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -75,7 +75,7 @@ as the BIOS. QEMU follows below truth table to select which payload to execute:
 When both -bios and -kernel are present, QEMU loads U-Boot and U-Boot in turns
 automatically loads the kernel image specified by the -kernel parameter via
 U-Boot's built-in "bootm" command, hence a legacy uImage format is required in
-such senario.
+such scenario.
 
 Running Linux kernel
 --------------------
diff --git a/docs/system/riscv/shakti-c.rst b/docs/system/riscv/shakti-c.rst
index a6035d42b0..fea57f7b6b 100644
--- a/docs/system/riscv/shakti-c.rst
+++ b/docs/system/riscv/shakti-c.rst
@@ -45,7 +45,7 @@ Shakti SDK can be used to generate the baremetal example UART applications.
 Binary would be generated in:
   software/examples/uart_applns/loopback/output/loopback.shakti
 
-You could also download the precompiled example applicatons using below
+You could also download the precompiled example applications using below
 commands.
 
 .. code-block:: bash
-- 
2.30.2


