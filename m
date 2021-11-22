Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2645908C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:49:01 +0100 (CET)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAcu-0007r0-Gg
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:49:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXy-000832-BR
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXu-0004KH-7P
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlDuw6JepQCnCpYigO7jx1fwgi1pLU0iPUo6TOJ8NwI=;
 b=KnxcJXkiqbzlkZgMpYGK72+mX3I4HsUlLpJLAt35hQueZTvXx+EVfcvwaXqzrMpuEs8aYp
 LwKF9xoQox7E/+jILfZ1GFtqBUXIOYp2JL0g1zF+hu2KELipILk1JzX6rGzN3Fed5O+oSc
 O+dU2YqeFCKz2k8jTuZy8btbT/JjieE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-NFLs9pVtPSm1W_d7VJ9V1w-1; Mon, 22 Nov 2021 09:43:43 -0500
X-MC-Unique: NFLs9pVtPSm1W_d7VJ9V1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A351804157;
 Mon, 22 Nov 2021 14:43:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 120CC607D5;
 Mon, 22 Nov 2021 14:43:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/6] Fix some typos in documentation (found by codespell)
Date: Mon, 22 Nov 2021 15:43:17 +0100
Message-Id: <20211122144320.29178-4-thuth@redhat.com>
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
References: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20211117210702.1393570-1-sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[thuth: "what's" --> "what is" as suggested by philmd]
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
index 6e8be7d79b..7f6368f999 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -49,7 +49,7 @@ future OS and toolchains are likely to target newer ABIs. The
 table that follows illustrates which ABI compatibility levels
 can be satisfied by the QEMU CPU models. Note that the table only
 lists the long term stable CPU model versions (eg Haswell-v4).
-In addition to whats listed, there are also many CPU model
+In addition to what is listed, there are also many CPU model
 aliases which resolve to a different CPU model version,
 depending on the machine type is in use.
 
diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index a1c0db01f6..b5acb2a9c1 100644
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
2.27.0


