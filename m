Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B97432E4B9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:25:51 +0100 (CET)
Received: from localhost ([::1]:33038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6iU-0002KX-JX
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gL-000136-7N
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gG-0004GQ-Ro
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so1301516wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEfIOEPful5NjNoG4+Pf/ZTRrzPfAxfv9TXcP60ZkCg=;
 b=PCWLajtnZTQ6J9nFVfwFRFeQ7a+D2OX2q3uEh5exF/hBD5leWbJReuYHaonc/bjjJD
 Gx0vY9nScDbKcDYU15pM7PhfUbEweaxnv4OhcEjSOxSlW/a3tTubQLP30/S2OsuACtd6
 PzrvVHHbm1jJYSn/ci5nfSY174H+lfT1V9saiNSmY4OCCKxxcovqOihHluOzmkS94397
 +o6FpPYEgp75vchPm9m4leBfKmCQLxPTSvNSapLd64crNlrsNJv09+BbO8C55yPrkGFa
 4PqqlMBkvf+8qE5Q2YOoeW71kN+JCL+nwImcdSrdbyEGiagbQx4/NHn0fuDLZLwQ0t/D
 v/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEfIOEPful5NjNoG4+Pf/ZTRrzPfAxfv9TXcP60ZkCg=;
 b=pzAIvASTv8ywJP+q07/iWG8N88IG8eNEKzCeHSe5pNlQNrwZ/Ge8EyMOwxKeVrUScB
 VadaACmc4sadQTeN4pUfTN8zGWbZzhSzmypM3km0X+VKwVqyIrV60bzy0wZxl7ElGZYQ
 C0i4697hYp/jJR7Uqk1JKXpZqkBqFnvSGjGDPzMbKhw2h1/H94OTTiskQVvIRbaejYau
 AOruOnzcxgCwi2JiyFmb5nY+50wdD1WbIW5LnCNVNaaCZoLzAM9pFdYeNkqptbVwJpuw
 PoVUYkYh3BesFkbACwKtuzNxrqMMdamCpLltV0zkD8YyZnCqbeDQ0ew6K6BkFIEUJfcm
 eOBQ==
X-Gm-Message-State: AOAM532JNMgt7LFBIsueMEBP3pmxjphaizIUtfsOytX2GEI4UDNOjYqF
 d33zNidMHnnYi8//KrAtdY9INw==
X-Google-Smtp-Source: ABdhPJyyLrbSje4BS1hVoTIiq7x+hV2niMKf7MH7fPs8vZ8mGggVmeZAXPozbnVrllWlbT6dJgpqzw==
X-Received: by 2002:adf:e409:: with SMTP id g9mr8031007wrm.423.1614936210466; 
 Fri, 05 Mar 2021 01:23:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm3332428wrx.5.2021.03.05.01.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 083B31FF87;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/9] docs/devel: re-organise the developers guide into
 sections
Date: Fri,  5 Mar 2021 09:23:20 +0000
Message-Id: <20210305092328.31792-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list of sub-sections was getting a bit long and sporadically
organised. Let's try and impose some order on this hairball of
documentation.

[AJB: RFC because I wonder if we should make a more concerted effort
to move bits of the wiki into a canonical maintained document. There
is also probably a need for a quickbuild or tldr section of the
build-system for users who just want to build something.]

Based-on: 20210223095931.16908-1-alex.bennee@linaro.org
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/index.rst                 | 32 ++++++----------------------
 docs/devel/multi-thread-tcg.rst      |  5 +++--
 docs/devel/section-apis.rst          | 16 ++++++++++++++
 docs/devel/section-building.rst      | 13 +++++++++++
 docs/devel/section-concepts.rst      | 21 ++++++++++++++++++
 docs/devel/section-process.rst       | 11 ++++++++++
 docs/devel/section-tcg-emulation.rst | 19 +++++++++++++++++
 docs/devel/section-testing.rst       | 20 +++++++++++++++++
 docs/devel/tcg-icount.rst            |  6 +++---
 docs/devel/testing.rst               |  6 +++---
 10 files changed, 115 insertions(+), 34 deletions(-)
 create mode 100644 docs/devel/section-apis.rst
 create mode 100644 docs/devel/section-building.rst
 create mode 100644 docs/devel/section-concepts.rst
 create mode 100644 docs/devel/section-process.rst
 create mode 100644 docs/devel/section-tcg-emulation.rst
 create mode 100644 docs/devel/section-testing.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index ae664da00c..2af7bf8736 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -13,29 +13,9 @@ Contents:
 .. toctree::
    :maxdepth: 2
 
-   build-system
-   style
-   kconfig
-   testing
-   fuzzing
-   control-flow-integrity
-   loads-stores
-   memory
-   migration
-   atomics
-   stable-process
-   qtest
-   decodetree
-   secure-coding-practices
-   tcg
-   tcg-icount
-   tracing
-   multi-thread-tcg
-   tcg-plugins
-   bitops
-   reset
-   s390-dasd-ipl
-   clocks
-   qom
-   block-coroutine-wrapper
-   multi-process
+   section-building
+   section-testing
+   section-concepts
+   section-apis
+   section-tcg-emulation
+   section-process
diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 92a9eba13c..5b446ee08b 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -4,8 +4,9 @@
   This work is licensed under the terms of the GNU GPL, version 2 or
   later. See the COPYING file in the top-level directory.
 
-Introduction
-============
+==================
+Multi-threaded TCG
+==================
 
 This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
 system-mode emulation. user-mode emulation has always mirrored the
diff --git a/docs/devel/section-apis.rst b/docs/devel/section-apis.rst
new file mode 100644
index 0000000000..ab1f6bed60
--- /dev/null
+++ b/docs/devel/section-apis.rst
@@ -0,0 +1,16 @@
+*********
+QEMU APIs
+*********
+
+There are a number of APIs in QEMU and the following sections document
+some of the most important ones. For tose that aren't documented here
+you can also find notes on usage in the header definitions.
+
+.. toctree::
+   :maxdepth: 2
+
+   atomics
+   bitops
+   loads-stores
+   memory
+   tracing
diff --git a/docs/devel/section-building.rst b/docs/devel/section-building.rst
new file mode 100644
index 0000000000..e6e9fa1d6a
--- /dev/null
+++ b/docs/devel/section-building.rst
@@ -0,0 +1,13 @@
+*************
+Building QEMU
+*************
+
+The following sections deal with how the build system works, how it is
+configured and some basic guidance on how code should be written.
+
+.. toctree::
+   :maxdepth: 2
+
+   build-system
+   kconfig
+   style
diff --git a/docs/devel/section-concepts.rst b/docs/devel/section-concepts.rst
new file mode 100644
index 0000000000..566c52e90a
--- /dev/null
+++ b/docs/devel/section-concepts.rst
@@ -0,0 +1,21 @@
+*************
+QEMU Concepts
+*************
+
+There are a number of high level concepts that are useful to
+understand when working with the code base. Perhaps the most pervasive
+is the QEMU Object Model (QOM) which underpins much of the flexibility
+and configurable of the project. The following sections document that
+as well as diving into other concepts that are useful to know if
+working on some areas of the code.
+
+.. toctree::
+   :maxdepth: 2
+
+   qom
+   clocks
+   reset
+   block-coroutine-wrapper
+   migration
+   multi-process
+   s390-dasd-ipl
diff --git a/docs/devel/section-process.rst b/docs/devel/section-process.rst
new file mode 100644
index 0000000000..3b0ae4f19b
--- /dev/null
+++ b/docs/devel/section-process.rst
@@ -0,0 +1,11 @@
+===================
+Development Process
+===================
+
+The following sections detail aspects of the development process.
+
+.. toctree::
+   :maxdepth: 2
+
+   secure-coding-practices
+   stable-process
diff --git a/docs/devel/section-tcg-emulation.rst b/docs/devel/section-tcg-emulation.rst
new file mode 100644
index 0000000000..81fa131de7
--- /dev/null
+++ b/docs/devel/section-tcg-emulation.rst
@@ -0,0 +1,19 @@
+*************
+TCG Emulation
+*************
+
+QEMU was originally built as an emulator capable of running binaries
+for one architecture on another. The following sections describe the
+internals of how the Just In Time (JIT) Tiny Code Generator (TCG)
+works. You only really need to read this if you are interested in
+adding new architectures or fixing existing architecture emulation.
+
+
+.. toctree::
+   :maxdepth: 2
+
+   tcg
+   multi-thread-tcg
+   tcg-icount
+   decodetree
+   tcg-plugins
diff --git a/docs/devel/section-testing.rst b/docs/devel/section-testing.rst
new file mode 100644
index 0000000000..c93ff4c4dd
--- /dev/null
+++ b/docs/devel/section-testing.rst
@@ -0,0 +1,20 @@
+***************
+Testing in QEMU
+***************
+
+QEMU is a large and complex project which can be configured in a
+multitude of ways. As it's impossible for an individual developer to
+manually test all of these we rely on a whole suite of automated
+testing approaches to ensure regressions are kept to a minimum.
+
+The following sections give a broad overview of the testing
+infrastructure as well as some detailed introductions into more
+advanced testing topics.
+
+.. toctree::
+   :maxdepth: 2
+
+   testing
+   fuzzing
+   control-flow-integrity
+   qtest
diff --git a/docs/devel/tcg-icount.rst b/docs/devel/tcg-icount.rst
index 8d67b6c076..eb990b0976 100644
--- a/docs/devel/tcg-icount.rst
+++ b/docs/devel/tcg-icount.rst
@@ -3,9 +3,9 @@
    Written by Alex Bennée
 
 
-========================
-TCG Instruction Counting
-========================
+=================================
+TCG Instruction Counting (icount)
+=================================
 
 TCG has long supported a feature known as icount which allows for
 instruction counting during execution. This should not be confused
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1434a50cc4..af98efec8c 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1,6 +1,6 @@
-===============
-Testing in QEMU
-===============
+=======
+Testing
+=======
 
 This document describes the testing infrastructure in QEMU.
 
-- 
2.20.1


