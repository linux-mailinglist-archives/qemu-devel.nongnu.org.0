Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0355A7956
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:48:35 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJOk-0008Td-45
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aburgess@redhat.com>)
 id 1oTJJQ-0003Zy-2f
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aburgess@redhat.com>)
 id 1oTJJN-0007tk-Qg
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661935381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuN1AbMHxaL8zO8+2+jI/oXQZ565O/pfjes8Gp/0XuM=;
 b=Ob7eBuoWFxpd5AwRwU5DIikIO5NaImYj5AFp2smr3in2UTxOmUwTTnWsgtKH4rDse0/eD5
 az/jLM3kdhPmK3nkw5+PQUU3v/QLO8i288sc6MyUI0ha65htYN2eliJZ+pYRZX5E0CSyNu
 yduE7U2wUCNnwvXogLTf4JewJ0xOwgs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-MpAIe5g9OLO4GZhI8-4-YA-1; Wed, 31 Aug 2022 04:41:31 -0400
X-MC-Unique: MpAIe5g9OLO4GZhI8-4-YA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so11425013wma.1
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 01:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xuN1AbMHxaL8zO8+2+jI/oXQZ565O/pfjes8Gp/0XuM=;
 b=QL7Sik6yrUnPIIjp7W9oxi4HeQqHg4Ts0VYol1Z7Zu38xKWO6GDaY9Kfp4lc31PDfQ
 N/iOUrniHbyQi4olPdZVK087NQ7ruAfaPM3+2cyt5Uwd/kk8c6i8iMnRTAiWQ+vS4pP8
 Ce6jXhj6Y6UdKOgNt1lE7P0AuR7PtqWkyn3bX4IqxbRXKOQRA8+PY8Bv+4TGUIN6MeYA
 jRDIAQ5XL4+YUcUyHTSbAOuwXrsEeZXAH426C2JkfKgRIntOu4B1CEJHCYMxL7SkR9gb
 S5MRVYQKxhoJuNl/OnM+wyuUB61NAKuXNKmLET+vVNnaoh15kBT/PorXARsGJC2bLX/o
 i6Sw==
X-Gm-Message-State: ACgBeo2zQxTvDOhBbnQ/KmP469EtFOGKE7fR3DIb/pKVkF0BRwemn0vz
 picRb14Xss54Iyld6wQPA9AQOQ4j8AYC9J1fPRSis90qHFGv6yYM5zHhFqtRU6fw+3RwQoO++Rp
 PyzX8DGZ9Hrt6KS3baucd0Taxb+dcIBE3RbGk32a8CIXMyqaF5jKyIkWa1VKwybK2Bv4=
X-Received: by 2002:a05:6000:54d:b0:225:4d5c:4615 with SMTP id
 b13-20020a056000054d00b002254d5c4615mr10385489wrf.107.1661935290436; 
 Wed, 31 Aug 2022 01:41:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+4HvfXdz5482ZCK5FAZC9mCEmXeh0wryNV6+N5dD9bcr+dH0SJCzfbmKC/+7So0lyjRoUBQ==
X-Received: by 2002:a05:6000:54d:b0:225:4d5c:4615 with SMTP id
 b13-20020a056000054d00b002254d5c4615mr10385474wrf.107.1661935290056; 
 Wed, 31 Aug 2022 01:41:30 -0700 (PDT)
Received: from localhost ([31.111.84.229]) by smtp.gmail.com with ESMTPSA id
 ay21-20020a05600c1e1500b003a536d5aa2esm1464030wmb.11.2022.08.31.01.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 01:41:29 -0700 (PDT)
From: Andrew Burgess <aburgess@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrew Burgess <aburgess@redhat.com>
Subject: [PATCH 2/2] target/riscv: remove fixed numbering from GDB xml feature
 files
Date: Wed, 31 Aug 2022 09:41:23 +0100
Message-Id: <6069395f90e6fc24dac92197be815fedf42f5974.1661934573.git.aburgess@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1661934573.git.aburgess@redhat.com>
References: <cover.1661934573.git.aburgess@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aburgess@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fixed register numbering in the various GDB feature files for
RISC-V only exists because these files were originally copied from the
GDB source tree.

However, the fixed numbering only exists in the GDB source tree so
that GDB, when it connects to a target that doesn't provide a target
description, will use a specific numbering scheme.

That numbering scheme is designed to be compatible with the first
versions of QEMU (for RISC-V), that didn't send a target description,
and relied on a fixed numbering scheme.

Because of the way that QEMU manages its target descriptions,
recording the number of registers in each feature, and just relying on
GDB's numbering starting from 0, then I propose that we remove all the
fixed numbering from the RISC-V feature xml files, and just rely on
the standard numbering scheme.  Plenty of other targets manage their
xml files this way, e.g. ARM, AArch64, Loongarch, m68k, rx, and s390.

Signed-off-by: Andrew Burgess <aburgess@redhat.com>
---
 gdb-xml/riscv-32bit-cpu.xml | 6 +-----
 gdb-xml/riscv-32bit-fpu.xml | 6 +-----
 gdb-xml/riscv-64bit-cpu.xml | 6 +-----
 gdb-xml/riscv-64bit-fpu.xml | 6 +-----
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/gdb-xml/riscv-32bit-cpu.xml b/gdb-xml/riscv-32bit-cpu.xml
index 0d07aaec85..466f2c0648 100644
--- a/gdb-xml/riscv-32bit-cpu.xml
+++ b/gdb-xml/riscv-32bit-cpu.xml
@@ -5,13 +5,9 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.cpu">
-  <reg name="zero" bitsize="32" type="int" regnum="0"/>
+  <reg name="zero" bitsize="32" type="int"/>
   <reg name="ra" bitsize="32" type="code_ptr"/>
   <reg name="sp" bitsize="32" type="data_ptr"/>
   <reg name="gp" bitsize="32" type="data_ptr"/>
diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
index 84a44ba8df..24aa087031 100644
--- a/gdb-xml/riscv-32bit-fpu.xml
+++ b/gdb-xml/riscv-32bit-fpu.xml
@@ -5,13 +5,9 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.fpu">
-  <reg name="ft0" bitsize="32" type="ieee_single" regnum="33"/>
+  <reg name="ft0" bitsize="32" type="ieee_single"/>
   <reg name="ft1" bitsize="32" type="ieee_single"/>
   <reg name="ft2" bitsize="32" type="ieee_single"/>
   <reg name="ft3" bitsize="32" type="ieee_single"/>
diff --git a/gdb-xml/riscv-64bit-cpu.xml b/gdb-xml/riscv-64bit-cpu.xml
index b8aa424ae4..c4d83de09b 100644
--- a/gdb-xml/riscv-64bit-cpu.xml
+++ b/gdb-xml/riscv-64bit-cpu.xml
@@ -5,13 +5,9 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.cpu">
-  <reg name="zero" bitsize="64" type="int" regnum="0"/>
+  <reg name="zero" bitsize="64" type="int"/>
   <reg name="ra" bitsize="64" type="code_ptr"/>
   <reg name="sp" bitsize="64" type="data_ptr"/>
   <reg name="gp" bitsize="64" type="data_ptr"/>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
index 9856a9d1d3..d0f17f9984 100644
--- a/gdb-xml/riscv-64bit-fpu.xml
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -5,10 +5,6 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
-<!-- Register numbers are hard-coded in order to maintain backward
-     compatibility with older versions of tools that didn't use xml
-     register descriptions.  -->
-
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.riscv.fpu">
 
@@ -17,7 +13,7 @@
     <field name="double" type="ieee_double"/>
   </union>
 
-  <reg name="ft0" bitsize="64" type="riscv_double" regnum="33"/>
+  <reg name="ft0" bitsize="64" type="riscv_double"/>
   <reg name="ft1" bitsize="64" type="riscv_double"/>
   <reg name="ft2" bitsize="64" type="riscv_double"/>
   <reg name="ft3" bitsize="64" type="riscv_double"/>
-- 
2.25.4


