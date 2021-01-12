Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624262F2767
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:57:45 +0100 (CET)
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBkW-0006W6-8x
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzBfU-00016i-UQ; Mon, 11 Jan 2021 23:52:34 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:47085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzBfP-0001mB-1p; Mon, 11 Jan 2021 23:52:32 -0500
Received: by mail-qt1-x832.google.com with SMTP id h19so817837qtq.13;
 Mon, 11 Jan 2021 20:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QgX6agwUnQmnYZ6ZfDECac9t1Naxg5gpQKV07AZuIAk=;
 b=teZe3iVs0RJFo1SVmfN1EKHVWoxaCryepQg+ea5w55pqt6OBNJsDnYwR9tZc/RRQaf
 bXJSmq8ANXMc5Gs+pjdB5vRbmfndCfossdfAdfs9v1zlZgZEUw9Azc2eClVMYqx8WQDX
 SGnvXrMN4RWRQJZmHES5QM/xlBfTMHJ36v0ZWEg53+RNQc/N/Ug0nXb/c0oCikO3HO0/
 IPqvjCsJzjZsmvgafzG5r9w3xVquDv7tm6DAgtfFir5JLsunj4EzBmI9AAjhsSlw70h5
 vvxNQqxv5uH12dap8tClYzHb3v3qZECGpkhy9pmzmVpG+d97sfSFNBoSwJjsy3c+BA1U
 yNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QgX6agwUnQmnYZ6ZfDECac9t1Naxg5gpQKV07AZuIAk=;
 b=bn5awZjAWPfnKEbvtrZZzjTo8euWDkDCQUzJB2/KOc2VTDxRZwYZJw82Uvew/h1Gkq
 e1hi/rVUayGxDyHjXEUu6h0MklRLK2YfjKl5DfZoScBd9ZUbw4j2FW6UCt4JBQ6RWVgC
 utCEsnrUdWQ7wWvH1tU4vRibjAesEJ7vBZNFeczcI0UHnRbyeCMoT+G952Fd0/lCEuy1
 TPNuel4YmGZAeq34l6Ig2JFSKJZdYBk+0GLNaB4L0KOsFdPm1g+evJNmwzkoLYflYk/A
 yuWbXaxiLdwP6j5VOyuGra6SrUTFcOukJ2gVg4NJnPnHYKAZyFtTbkzlL3eYL1ZQmGyO
 9ujQ==
X-Gm-Message-State: AOAM532mftQg0hPrzdNpClJPGr7L95hJE8sGyPdTE1dZt6A+nfPQD3gB
 oJVLU3a9MV+Ktwa+mWuOv9M=
X-Google-Smtp-Source: ABdhPJwNgwq5lHpqyMJsYmVUEVkCWeqM7aj7QGthwRDsTJex3TWOJCXc3pvGtAVDLruLi8idy7UD4Q==
X-Received: by 2002:aed:3bfb:: with SMTP id s56mr2919478qte.109.1610427145584; 
 Mon, 11 Jan 2021 20:52:25 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id b67sm863814qkc.44.2021.01.11.20.52.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 20:52:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 4/4] target/riscv: Remove built-in GDB XML files for CSRs
Date: Tue, 12 Jan 2021 12:52:04 +0800
Message-Id: <1610427124-49887-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have switched to generate the RISC-V CSR XML dynamically,
remove the built-in hardcoded XML files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 default-configs/targets/riscv32-linux-user.mak |   2 +-
 default-configs/targets/riscv32-softmmu.mak    |   2 +-
 default-configs/targets/riscv64-linux-user.mak |   2 +-
 default-configs/targets/riscv64-softmmu.mak    |   2 +-
 gdb-xml/riscv-32bit-csr.xml                    | 250 -------------------------
 gdb-xml/riscv-64bit-csr.xml                    | 250 -------------------------
 6 files changed, 4 insertions(+), 504 deletions(-)
 delete mode 100644 gdb-xml/riscv-32bit-csr.xml
 delete mode 100644 gdb-xml/riscv-64bit-csr.xml

diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-configs/targets/riscv32-linux-user.mak
index dfb259e..07e6ca1 100644
--- a/default-configs/targets/riscv32-linux-user.mak
+++ b/default-configs/targets/riscv32-linux-user.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
-TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
+TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
diff --git a/default-configs/targets/riscv32-softmmu.mak b/default-configs/targets/riscv32-softmmu.mak
index 9446d96..d8b71cd 100644
--- a/default-configs/targets/riscv32-softmmu.mak
+++ b/default-configs/targets/riscv32-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
+TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
 TARGET_NEED_FDT=y
diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-configs/targets/riscv64-linux-user.mak
index b13895f..191c2c4 100644
--- a/default-configs/targets/riscv64-linux-user.mak
+++ b/default-configs/targets/riscv64-linux-user.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
-TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
+TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
diff --git a/default-configs/targets/riscv64-softmmu.mak b/default-configs/targets/riscv64-softmmu.mak
index d809bd6..7c0e7ee 100644
--- a/default-configs/targets/riscv64-softmmu.mak
+++ b/default-configs/targets/riscv64-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
+TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
 TARGET_NEED_FDT=y
diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
deleted file mode 100644
index da1bf19..0000000
--- a/gdb-xml/riscv-32bit-csr.xml
+++ /dev/null
@@ -1,250 +0,0 @@
-<?xml version="1.0"?>
-<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
-
-     Copying and distribution of this file, with or without modification,
-     are permitted in any medium without royalty provided the copyright
-     notice and this notice are preserved.  -->
-
-<!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.csr">
-  <reg name="ustatus" bitsize="32"/>
-  <reg name="uie" bitsize="32"/>
-  <reg name="utvec" bitsize="32"/>
-  <reg name="uscratch" bitsize="32"/>
-  <reg name="uepc" bitsize="32"/>
-  <reg name="ucause" bitsize="32"/>
-  <reg name="utval" bitsize="32"/>
-  <reg name="uip" bitsize="32"/>
-  <reg name="fflags" bitsize="32"/>
-  <reg name="frm" bitsize="32"/>
-  <reg name="fcsr" bitsize="32"/>
-  <reg name="cycle" bitsize="32"/>
-  <reg name="time" bitsize="32"/>
-  <reg name="instret" bitsize="32"/>
-  <reg name="hpmcounter3" bitsize="32"/>
-  <reg name="hpmcounter4" bitsize="32"/>
-  <reg name="hpmcounter5" bitsize="32"/>
-  <reg name="hpmcounter6" bitsize="32"/>
-  <reg name="hpmcounter7" bitsize="32"/>
-  <reg name="hpmcounter8" bitsize="32"/>
-  <reg name="hpmcounter9" bitsize="32"/>
-  <reg name="hpmcounter10" bitsize="32"/>
-  <reg name="hpmcounter11" bitsize="32"/>
-  <reg name="hpmcounter12" bitsize="32"/>
-  <reg name="hpmcounter13" bitsize="32"/>
-  <reg name="hpmcounter14" bitsize="32"/>
-  <reg name="hpmcounter15" bitsize="32"/>
-  <reg name="hpmcounter16" bitsize="32"/>
-  <reg name="hpmcounter17" bitsize="32"/>
-  <reg name="hpmcounter18" bitsize="32"/>
-  <reg name="hpmcounter19" bitsize="32"/>
-  <reg name="hpmcounter20" bitsize="32"/>
-  <reg name="hpmcounter21" bitsize="32"/>
-  <reg name="hpmcounter22" bitsize="32"/>
-  <reg name="hpmcounter23" bitsize="32"/>
-  <reg name="hpmcounter24" bitsize="32"/>
-  <reg name="hpmcounter25" bitsize="32"/>
-  <reg name="hpmcounter26" bitsize="32"/>
-  <reg name="hpmcounter27" bitsize="32"/>
-  <reg name="hpmcounter28" bitsize="32"/>
-  <reg name="hpmcounter29" bitsize="32"/>
-  <reg name="hpmcounter30" bitsize="32"/>
-  <reg name="hpmcounter31" bitsize="32"/>
-  <reg name="cycleh" bitsize="32"/>
-  <reg name="timeh" bitsize="32"/>
-  <reg name="instreth" bitsize="32"/>
-  <reg name="hpmcounter3h" bitsize="32"/>
-  <reg name="hpmcounter4h" bitsize="32"/>
-  <reg name="hpmcounter5h" bitsize="32"/>
-  <reg name="hpmcounter6h" bitsize="32"/>
-  <reg name="hpmcounter7h" bitsize="32"/>
-  <reg name="hpmcounter8h" bitsize="32"/>
-  <reg name="hpmcounter9h" bitsize="32"/>
-  <reg name="hpmcounter10h" bitsize="32"/>
-  <reg name="hpmcounter11h" bitsize="32"/>
-  <reg name="hpmcounter12h" bitsize="32"/>
-  <reg name="hpmcounter13h" bitsize="32"/>
-  <reg name="hpmcounter14h" bitsize="32"/>
-  <reg name="hpmcounter15h" bitsize="32"/>
-  <reg name="hpmcounter16h" bitsize="32"/>
-  <reg name="hpmcounter17h" bitsize="32"/>
-  <reg name="hpmcounter18h" bitsize="32"/>
-  <reg name="hpmcounter19h" bitsize="32"/>
-  <reg name="hpmcounter20h" bitsize="32"/>
-  <reg name="hpmcounter21h" bitsize="32"/>
-  <reg name="hpmcounter22h" bitsize="32"/>
-  <reg name="hpmcounter23h" bitsize="32"/>
-  <reg name="hpmcounter24h" bitsize="32"/>
-  <reg name="hpmcounter25h" bitsize="32"/>
-  <reg name="hpmcounter26h" bitsize="32"/>
-  <reg name="hpmcounter27h" bitsize="32"/>
-  <reg name="hpmcounter28h" bitsize="32"/>
-  <reg name="hpmcounter29h" bitsize="32"/>
-  <reg name="hpmcounter30h" bitsize="32"/>
-  <reg name="hpmcounter31h" bitsize="32"/>
-  <reg name="sstatus" bitsize="32"/>
-  <reg name="sedeleg" bitsize="32"/>
-  <reg name="sideleg" bitsize="32"/>
-  <reg name="sie" bitsize="32"/>
-  <reg name="stvec" bitsize="32"/>
-  <reg name="scounteren" bitsize="32"/>
-  <reg name="sscratch" bitsize="32"/>
-  <reg name="sepc" bitsize="32"/>
-  <reg name="scause" bitsize="32"/>
-  <reg name="stval" bitsize="32"/>
-  <reg name="sip" bitsize="32"/>
-  <reg name="satp" bitsize="32"/>
-  <reg name="mvendorid" bitsize="32"/>
-  <reg name="marchid" bitsize="32"/>
-  <reg name="mimpid" bitsize="32"/>
-  <reg name="mhartid" bitsize="32"/>
-  <reg name="mstatus" bitsize="32"/>
-  <reg name="misa" bitsize="32"/>
-  <reg name="medeleg" bitsize="32"/>
-  <reg name="mideleg" bitsize="32"/>
-  <reg name="mie" bitsize="32"/>
-  <reg name="mtvec" bitsize="32"/>
-  <reg name="mcounteren" bitsize="32"/>
-  <reg name="mscratch" bitsize="32"/>
-  <reg name="mepc" bitsize="32"/>
-  <reg name="mcause" bitsize="32"/>
-  <reg name="mtval" bitsize="32"/>
-  <reg name="mip" bitsize="32"/>
-  <reg name="pmpcfg0" bitsize="32"/>
-  <reg name="pmpcfg1" bitsize="32"/>
-  <reg name="pmpcfg2" bitsize="32"/>
-  <reg name="pmpcfg3" bitsize="32"/>
-  <reg name="pmpaddr0" bitsize="32"/>
-  <reg name="pmpaddr1" bitsize="32"/>
-  <reg name="pmpaddr2" bitsize="32"/>
-  <reg name="pmpaddr3" bitsize="32"/>
-  <reg name="pmpaddr4" bitsize="32"/>
-  <reg name="pmpaddr5" bitsize="32"/>
-  <reg name="pmpaddr6" bitsize="32"/>
-  <reg name="pmpaddr7" bitsize="32"/>
-  <reg name="pmpaddr8" bitsize="32"/>
-  <reg name="pmpaddr9" bitsize="32"/>
-  <reg name="pmpaddr10" bitsize="32"/>
-  <reg name="pmpaddr11" bitsize="32"/>
-  <reg name="pmpaddr12" bitsize="32"/>
-  <reg name="pmpaddr13" bitsize="32"/>
-  <reg name="pmpaddr14" bitsize="32"/>
-  <reg name="pmpaddr15" bitsize="32"/>
-  <reg name="mcycle" bitsize="32"/>
-  <reg name="minstret" bitsize="32"/>
-  <reg name="mhpmcounter3" bitsize="32"/>
-  <reg name="mhpmcounter4" bitsize="32"/>
-  <reg name="mhpmcounter5" bitsize="32"/>
-  <reg name="mhpmcounter6" bitsize="32"/>
-  <reg name="mhpmcounter7" bitsize="32"/>
-  <reg name="mhpmcounter8" bitsize="32"/>
-  <reg name="mhpmcounter9" bitsize="32"/>
-  <reg name="mhpmcounter10" bitsize="32"/>
-  <reg name="mhpmcounter11" bitsize="32"/>
-  <reg name="mhpmcounter12" bitsize="32"/>
-  <reg name="mhpmcounter13" bitsize="32"/>
-  <reg name="mhpmcounter14" bitsize="32"/>
-  <reg name="mhpmcounter15" bitsize="32"/>
-  <reg name="mhpmcounter16" bitsize="32"/>
-  <reg name="mhpmcounter17" bitsize="32"/>
-  <reg name="mhpmcounter18" bitsize="32"/>
-  <reg name="mhpmcounter19" bitsize="32"/>
-  <reg name="mhpmcounter20" bitsize="32"/>
-  <reg name="mhpmcounter21" bitsize="32"/>
-  <reg name="mhpmcounter22" bitsize="32"/>
-  <reg name="mhpmcounter23" bitsize="32"/>
-  <reg name="mhpmcounter24" bitsize="32"/>
-  <reg name="mhpmcounter25" bitsize="32"/>
-  <reg name="mhpmcounter26" bitsize="32"/>
-  <reg name="mhpmcounter27" bitsize="32"/>
-  <reg name="mhpmcounter28" bitsize="32"/>
-  <reg name="mhpmcounter29" bitsize="32"/>
-  <reg name="mhpmcounter30" bitsize="32"/>
-  <reg name="mhpmcounter31" bitsize="32"/>
-  <reg name="mcycleh" bitsize="32"/>
-  <reg name="minstreth" bitsize="32"/>
-  <reg name="mhpmcounter3h" bitsize="32"/>
-  <reg name="mhpmcounter4h" bitsize="32"/>
-  <reg name="mhpmcounter5h" bitsize="32"/>
-  <reg name="mhpmcounter6h" bitsize="32"/>
-  <reg name="mhpmcounter7h" bitsize="32"/>
-  <reg name="mhpmcounter8h" bitsize="32"/>
-  <reg name="mhpmcounter9h" bitsize="32"/>
-  <reg name="mhpmcounter10h" bitsize="32"/>
-  <reg name="mhpmcounter11h" bitsize="32"/>
-  <reg name="mhpmcounter12h" bitsize="32"/>
-  <reg name="mhpmcounter13h" bitsize="32"/>
-  <reg name="mhpmcounter14h" bitsize="32"/>
-  <reg name="mhpmcounter15h" bitsize="32"/>
-  <reg name="mhpmcounter16h" bitsize="32"/>
-  <reg name="mhpmcounter17h" bitsize="32"/>
-  <reg name="mhpmcounter18h" bitsize="32"/>
-  <reg name="mhpmcounter19h" bitsize="32"/>
-  <reg name="mhpmcounter20h" bitsize="32"/>
-  <reg name="mhpmcounter21h" bitsize="32"/>
-  <reg name="mhpmcounter22h" bitsize="32"/>
-  <reg name="mhpmcounter23h" bitsize="32"/>
-  <reg name="mhpmcounter24h" bitsize="32"/>
-  <reg name="mhpmcounter25h" bitsize="32"/>
-  <reg name="mhpmcounter26h" bitsize="32"/>
-  <reg name="mhpmcounter27h" bitsize="32"/>
-  <reg name="mhpmcounter28h" bitsize="32"/>
-  <reg name="mhpmcounter29h" bitsize="32"/>
-  <reg name="mhpmcounter30h" bitsize="32"/>
-  <reg name="mhpmcounter31h" bitsize="32"/>
-  <reg name="mhpmevent3" bitsize="32"/>
-  <reg name="mhpmevent4" bitsize="32"/>
-  <reg name="mhpmevent5" bitsize="32"/>
-  <reg name="mhpmevent6" bitsize="32"/>
-  <reg name="mhpmevent7" bitsize="32"/>
-  <reg name="mhpmevent8" bitsize="32"/>
-  <reg name="mhpmevent9" bitsize="32"/>
-  <reg name="mhpmevent10" bitsize="32"/>
-  <reg name="mhpmevent11" bitsize="32"/>
-  <reg name="mhpmevent12" bitsize="32"/>
-  <reg name="mhpmevent13" bitsize="32"/>
-  <reg name="mhpmevent14" bitsize="32"/>
-  <reg name="mhpmevent15" bitsize="32"/>
-  <reg name="mhpmevent16" bitsize="32"/>
-  <reg name="mhpmevent17" bitsize="32"/>
-  <reg name="mhpmevent18" bitsize="32"/>
-  <reg name="mhpmevent19" bitsize="32"/>
-  <reg name="mhpmevent20" bitsize="32"/>
-  <reg name="mhpmevent21" bitsize="32"/>
-  <reg name="mhpmevent22" bitsize="32"/>
-  <reg name="mhpmevent23" bitsize="32"/>
-  <reg name="mhpmevent24" bitsize="32"/>
-  <reg name="mhpmevent25" bitsize="32"/>
-  <reg name="mhpmevent26" bitsize="32"/>
-  <reg name="mhpmevent27" bitsize="32"/>
-  <reg name="mhpmevent28" bitsize="32"/>
-  <reg name="mhpmevent29" bitsize="32"/>
-  <reg name="mhpmevent30" bitsize="32"/>
-  <reg name="mhpmevent31" bitsize="32"/>
-  <reg name="tselect" bitsize="32"/>
-  <reg name="tdata1" bitsize="32"/>
-  <reg name="tdata2" bitsize="32"/>
-  <reg name="tdata3" bitsize="32"/>
-  <reg name="dcsr" bitsize="32"/>
-  <reg name="dpc" bitsize="32"/>
-  <reg name="dscratch" bitsize="32"/>
-  <reg name="hstatus" bitsize="32"/>
-  <reg name="hedeleg" bitsize="32"/>
-  <reg name="hideleg" bitsize="32"/>
-  <reg name="hie" bitsize="32"/>
-  <reg name="htvec" bitsize="32"/>
-  <reg name="hscratch" bitsize="32"/>
-  <reg name="hepc" bitsize="32"/>
-  <reg name="hcause" bitsize="32"/>
-  <reg name="hbadaddr" bitsize="32"/>
-  <reg name="hip" bitsize="32"/>
-  <reg name="mbase" bitsize="32"/>
-  <reg name="mbound" bitsize="32"/>
-  <reg name="mibase" bitsize="32"/>
-  <reg name="mibound" bitsize="32"/>
-  <reg name="mdbase" bitsize="32"/>
-  <reg name="mdbound" bitsize="32"/>
-  <reg name="mucounteren" bitsize="32"/>
-  <reg name="mscounteren" bitsize="32"/>
-  <reg name="mhcounteren" bitsize="32"/>
-</feature>
diff --git a/gdb-xml/riscv-64bit-csr.xml b/gdb-xml/riscv-64bit-csr.xml
deleted file mode 100644
index 6aa4bed..0000000
--- a/gdb-xml/riscv-64bit-csr.xml
+++ /dev/null
@@ -1,250 +0,0 @@
-<?xml version="1.0"?>
-<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
-
-     Copying and distribution of this file, with or without modification,
-     are permitted in any medium without royalty provided the copyright
-     notice and this notice are preserved.  -->
-
-<!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.csr">
-  <reg name="ustatus" bitsize="64"/>
-  <reg name="uie" bitsize="64"/>
-  <reg name="utvec" bitsize="64"/>
-  <reg name="uscratch" bitsize="64"/>
-  <reg name="uepc" bitsize="64"/>
-  <reg name="ucause" bitsize="64"/>
-  <reg name="utval" bitsize="64"/>
-  <reg name="uip" bitsize="64"/>
-  <reg name="fflags" bitsize="64"/>
-  <reg name="frm" bitsize="64"/>
-  <reg name="fcsr" bitsize="64"/>
-  <reg name="cycle" bitsize="64"/>
-  <reg name="time" bitsize="64"/>
-  <reg name="instret" bitsize="64"/>
-  <reg name="hpmcounter3" bitsize="64"/>
-  <reg name="hpmcounter4" bitsize="64"/>
-  <reg name="hpmcounter5" bitsize="64"/>
-  <reg name="hpmcounter6" bitsize="64"/>
-  <reg name="hpmcounter7" bitsize="64"/>
-  <reg name="hpmcounter8" bitsize="64"/>
-  <reg name="hpmcounter9" bitsize="64"/>
-  <reg name="hpmcounter10" bitsize="64"/>
-  <reg name="hpmcounter11" bitsize="64"/>
-  <reg name="hpmcounter12" bitsize="64"/>
-  <reg name="hpmcounter13" bitsize="64"/>
-  <reg name="hpmcounter14" bitsize="64"/>
-  <reg name="hpmcounter15" bitsize="64"/>
-  <reg name="hpmcounter16" bitsize="64"/>
-  <reg name="hpmcounter17" bitsize="64"/>
-  <reg name="hpmcounter18" bitsize="64"/>
-  <reg name="hpmcounter19" bitsize="64"/>
-  <reg name="hpmcounter20" bitsize="64"/>
-  <reg name="hpmcounter21" bitsize="64"/>
-  <reg name="hpmcounter22" bitsize="64"/>
-  <reg name="hpmcounter23" bitsize="64"/>
-  <reg name="hpmcounter24" bitsize="64"/>
-  <reg name="hpmcounter25" bitsize="64"/>
-  <reg name="hpmcounter26" bitsize="64"/>
-  <reg name="hpmcounter27" bitsize="64"/>
-  <reg name="hpmcounter28" bitsize="64"/>
-  <reg name="hpmcounter29" bitsize="64"/>
-  <reg name="hpmcounter30" bitsize="64"/>
-  <reg name="hpmcounter31" bitsize="64"/>
-  <reg name="cycleh" bitsize="64"/>
-  <reg name="timeh" bitsize="64"/>
-  <reg name="instreth" bitsize="64"/>
-  <reg name="hpmcounter3h" bitsize="64"/>
-  <reg name="hpmcounter4h" bitsize="64"/>
-  <reg name="hpmcounter5h" bitsize="64"/>
-  <reg name="hpmcounter6h" bitsize="64"/>
-  <reg name="hpmcounter7h" bitsize="64"/>
-  <reg name="hpmcounter8h" bitsize="64"/>
-  <reg name="hpmcounter9h" bitsize="64"/>
-  <reg name="hpmcounter10h" bitsize="64"/>
-  <reg name="hpmcounter11h" bitsize="64"/>
-  <reg name="hpmcounter12h" bitsize="64"/>
-  <reg name="hpmcounter13h" bitsize="64"/>
-  <reg name="hpmcounter14h" bitsize="64"/>
-  <reg name="hpmcounter15h" bitsize="64"/>
-  <reg name="hpmcounter16h" bitsize="64"/>
-  <reg name="hpmcounter17h" bitsize="64"/>
-  <reg name="hpmcounter18h" bitsize="64"/>
-  <reg name="hpmcounter19h" bitsize="64"/>
-  <reg name="hpmcounter20h" bitsize="64"/>
-  <reg name="hpmcounter21h" bitsize="64"/>
-  <reg name="hpmcounter22h" bitsize="64"/>
-  <reg name="hpmcounter23h" bitsize="64"/>
-  <reg name="hpmcounter24h" bitsize="64"/>
-  <reg name="hpmcounter25h" bitsize="64"/>
-  <reg name="hpmcounter26h" bitsize="64"/>
-  <reg name="hpmcounter27h" bitsize="64"/>
-  <reg name="hpmcounter28h" bitsize="64"/>
-  <reg name="hpmcounter29h" bitsize="64"/>
-  <reg name="hpmcounter30h" bitsize="64"/>
-  <reg name="hpmcounter31h" bitsize="64"/>
-  <reg name="sstatus" bitsize="64"/>
-  <reg name="sedeleg" bitsize="64"/>
-  <reg name="sideleg" bitsize="64"/>
-  <reg name="sie" bitsize="64"/>
-  <reg name="stvec" bitsize="64"/>
-  <reg name="scounteren" bitsize="64"/>
-  <reg name="sscratch" bitsize="64"/>
-  <reg name="sepc" bitsize="64"/>
-  <reg name="scause" bitsize="64"/>
-  <reg name="stval" bitsize="64"/>
-  <reg name="sip" bitsize="64"/>
-  <reg name="satp" bitsize="64"/>
-  <reg name="mvendorid" bitsize="64"/>
-  <reg name="marchid" bitsize="64"/>
-  <reg name="mimpid" bitsize="64"/>
-  <reg name="mhartid" bitsize="64"/>
-  <reg name="mstatus" bitsize="64"/>
-  <reg name="misa" bitsize="64"/>
-  <reg name="medeleg" bitsize="64"/>
-  <reg name="mideleg" bitsize="64"/>
-  <reg name="mie" bitsize="64"/>
-  <reg name="mtvec" bitsize="64"/>
-  <reg name="mcounteren" bitsize="64"/>
-  <reg name="mscratch" bitsize="64"/>
-  <reg name="mepc" bitsize="64"/>
-  <reg name="mcause" bitsize="64"/>
-  <reg name="mtval" bitsize="64"/>
-  <reg name="mip" bitsize="64"/>
-  <reg name="pmpcfg0" bitsize="64"/>
-  <reg name="pmpcfg1" bitsize="64"/>
-  <reg name="pmpcfg2" bitsize="64"/>
-  <reg name="pmpcfg3" bitsize="64"/>
-  <reg name="pmpaddr0" bitsize="64"/>
-  <reg name="pmpaddr1" bitsize="64"/>
-  <reg name="pmpaddr2" bitsize="64"/>
-  <reg name="pmpaddr3" bitsize="64"/>
-  <reg name="pmpaddr4" bitsize="64"/>
-  <reg name="pmpaddr5" bitsize="64"/>
-  <reg name="pmpaddr6" bitsize="64"/>
-  <reg name="pmpaddr7" bitsize="64"/>
-  <reg name="pmpaddr8" bitsize="64"/>
-  <reg name="pmpaddr9" bitsize="64"/>
-  <reg name="pmpaddr10" bitsize="64"/>
-  <reg name="pmpaddr11" bitsize="64"/>
-  <reg name="pmpaddr12" bitsize="64"/>
-  <reg name="pmpaddr13" bitsize="64"/>
-  <reg name="pmpaddr14" bitsize="64"/>
-  <reg name="pmpaddr15" bitsize="64"/>
-  <reg name="mcycle" bitsize="64"/>
-  <reg name="minstret" bitsize="64"/>
-  <reg name="mhpmcounter3" bitsize="64"/>
-  <reg name="mhpmcounter4" bitsize="64"/>
-  <reg name="mhpmcounter5" bitsize="64"/>
-  <reg name="mhpmcounter6" bitsize="64"/>
-  <reg name="mhpmcounter7" bitsize="64"/>
-  <reg name="mhpmcounter8" bitsize="64"/>
-  <reg name="mhpmcounter9" bitsize="64"/>
-  <reg name="mhpmcounter10" bitsize="64"/>
-  <reg name="mhpmcounter11" bitsize="64"/>
-  <reg name="mhpmcounter12" bitsize="64"/>
-  <reg name="mhpmcounter13" bitsize="64"/>
-  <reg name="mhpmcounter14" bitsize="64"/>
-  <reg name="mhpmcounter15" bitsize="64"/>
-  <reg name="mhpmcounter16" bitsize="64"/>
-  <reg name="mhpmcounter17" bitsize="64"/>
-  <reg name="mhpmcounter18" bitsize="64"/>
-  <reg name="mhpmcounter19" bitsize="64"/>
-  <reg name="mhpmcounter20" bitsize="64"/>
-  <reg name="mhpmcounter21" bitsize="64"/>
-  <reg name="mhpmcounter22" bitsize="64"/>
-  <reg name="mhpmcounter23" bitsize="64"/>
-  <reg name="mhpmcounter24" bitsize="64"/>
-  <reg name="mhpmcounter25" bitsize="64"/>
-  <reg name="mhpmcounter26" bitsize="64"/>
-  <reg name="mhpmcounter27" bitsize="64"/>
-  <reg name="mhpmcounter28" bitsize="64"/>
-  <reg name="mhpmcounter29" bitsize="64"/>
-  <reg name="mhpmcounter30" bitsize="64"/>
-  <reg name="mhpmcounter31" bitsize="64"/>
-  <reg name="mcycleh" bitsize="64"/>
-  <reg name="minstreth" bitsize="64"/>
-  <reg name="mhpmcounter3h" bitsize="64"/>
-  <reg name="mhpmcounter4h" bitsize="64"/>
-  <reg name="mhpmcounter5h" bitsize="64"/>
-  <reg name="mhpmcounter6h" bitsize="64"/>
-  <reg name="mhpmcounter7h" bitsize="64"/>
-  <reg name="mhpmcounter8h" bitsize="64"/>
-  <reg name="mhpmcounter9h" bitsize="64"/>
-  <reg name="mhpmcounter10h" bitsize="64"/>
-  <reg name="mhpmcounter11h" bitsize="64"/>
-  <reg name="mhpmcounter12h" bitsize="64"/>
-  <reg name="mhpmcounter13h" bitsize="64"/>
-  <reg name="mhpmcounter14h" bitsize="64"/>
-  <reg name="mhpmcounter15h" bitsize="64"/>
-  <reg name="mhpmcounter16h" bitsize="64"/>
-  <reg name="mhpmcounter17h" bitsize="64"/>
-  <reg name="mhpmcounter18h" bitsize="64"/>
-  <reg name="mhpmcounter19h" bitsize="64"/>
-  <reg name="mhpmcounter20h" bitsize="64"/>
-  <reg name="mhpmcounter21h" bitsize="64"/>
-  <reg name="mhpmcounter22h" bitsize="64"/>
-  <reg name="mhpmcounter23h" bitsize="64"/>
-  <reg name="mhpmcounter24h" bitsize="64"/>
-  <reg name="mhpmcounter25h" bitsize="64"/>
-  <reg name="mhpmcounter26h" bitsize="64"/>
-  <reg name="mhpmcounter27h" bitsize="64"/>
-  <reg name="mhpmcounter28h" bitsize="64"/>
-  <reg name="mhpmcounter29h" bitsize="64"/>
-  <reg name="mhpmcounter30h" bitsize="64"/>
-  <reg name="mhpmcounter31h" bitsize="64"/>
-  <reg name="mhpmevent3" bitsize="64"/>
-  <reg name="mhpmevent4" bitsize="64"/>
-  <reg name="mhpmevent5" bitsize="64"/>
-  <reg name="mhpmevent6" bitsize="64"/>
-  <reg name="mhpmevent7" bitsize="64"/>
-  <reg name="mhpmevent8" bitsize="64"/>
-  <reg name="mhpmevent9" bitsize="64"/>
-  <reg name="mhpmevent10" bitsize="64"/>
-  <reg name="mhpmevent11" bitsize="64"/>
-  <reg name="mhpmevent12" bitsize="64"/>
-  <reg name="mhpmevent13" bitsize="64"/>
-  <reg name="mhpmevent14" bitsize="64"/>
-  <reg name="mhpmevent15" bitsize="64"/>
-  <reg name="mhpmevent16" bitsize="64"/>
-  <reg name="mhpmevent17" bitsize="64"/>
-  <reg name="mhpmevent18" bitsize="64"/>
-  <reg name="mhpmevent19" bitsize="64"/>
-  <reg name="mhpmevent20" bitsize="64"/>
-  <reg name="mhpmevent21" bitsize="64"/>
-  <reg name="mhpmevent22" bitsize="64"/>
-  <reg name="mhpmevent23" bitsize="64"/>
-  <reg name="mhpmevent24" bitsize="64"/>
-  <reg name="mhpmevent25" bitsize="64"/>
-  <reg name="mhpmevent26" bitsize="64"/>
-  <reg name="mhpmevent27" bitsize="64"/>
-  <reg name="mhpmevent28" bitsize="64"/>
-  <reg name="mhpmevent29" bitsize="64"/>
-  <reg name="mhpmevent30" bitsize="64"/>
-  <reg name="mhpmevent31" bitsize="64"/>
-  <reg name="tselect" bitsize="64"/>
-  <reg name="tdata1" bitsize="64"/>
-  <reg name="tdata2" bitsize="64"/>
-  <reg name="tdata3" bitsize="64"/>
-  <reg name="dcsr" bitsize="64"/>
-  <reg name="dpc" bitsize="64"/>
-  <reg name="dscratch" bitsize="64"/>
-  <reg name="hstatus" bitsize="64"/>
-  <reg name="hedeleg" bitsize="64"/>
-  <reg name="hideleg" bitsize="64"/>
-  <reg name="hie" bitsize="64"/>
-  <reg name="htvec" bitsize="64"/>
-  <reg name="hscratch" bitsize="64"/>
-  <reg name="hepc" bitsize="64"/>
-  <reg name="hcause" bitsize="64"/>
-  <reg name="hbadaddr" bitsize="64"/>
-  <reg name="hip" bitsize="64"/>
-  <reg name="mbase" bitsize="64"/>
-  <reg name="mbound" bitsize="64"/>
-  <reg name="mibase" bitsize="64"/>
-  <reg name="mibound" bitsize="64"/>
-  <reg name="mdbase" bitsize="64"/>
-  <reg name="mdbound" bitsize="64"/>
-  <reg name="mucounteren" bitsize="64"/>
-  <reg name="mscounteren" bitsize="64"/>
-  <reg name="mhcounteren" bitsize="64"/>
-</feature>
-- 
2.7.4


