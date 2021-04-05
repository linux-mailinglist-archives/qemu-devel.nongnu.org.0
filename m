Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB7354301
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:50:50 +0200 (CEST)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQYz-000796-5P
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHU-0001Yi-Qv
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHO-0001qX-Dv
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id a76so2599921wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=er4qANtgKvlPdPBqn0fMmfl5lq/j09+opELRIuQIrcI=;
 b=bO+JOMR9bTwo2Ud4OJC2BvmS3SVl+CPcpsRqBYC7OsFQsE66IcXGO+ZmuoYIif+TEd
 +DsATSozVZtlRUpr8wmHqVNaP6We3cnz54DOqz4q158HIovEhOPQXZLp9xTtpRcuPNbJ
 mnKQj+Gi0skcffE4sEbzTNA8F8OEe1HjpbEakHEuHc/TWNWu+QZdPX/oJ0eXDilhLD6t
 KkCooeeTIIiNnO3TFZ8h9ZWxWom1CPMMtdYCFRM0Kr0D2UCmz21RI2Mc9etkLtkAY5U2
 MrMrljDWT/Gxa9ui0N/or7U6H/rddbXIalw0UBZMcgUPGqIP0CGe3PJRAHigsOLQdUDE
 YRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=er4qANtgKvlPdPBqn0fMmfl5lq/j09+opELRIuQIrcI=;
 b=EXaxsY2HTQhzJ0rx76NVHS7aEXjrftCTbCHpGUvb8JMrN7YycbafmWX9afJtzIjoNW
 N5MEFtr5CYMkvvsTZhswBeVtxNHHkZDljW2KdS3dNdQlD5+9unNYlCPYQl0+dpm0MXJL
 ds6ca7F1Mo1i5Sx4GwNQzKREijDnwM3Dca6sFc/5tqaGal+Hfp8GZKRvjmDYkdLJSvRE
 4/K3KitxpV5KUtx4QqC/4IVf7Uf6A49joJP4IeHhmadDOGfLt0sCR+KrvQAHF8X0x3Xb
 pFgS6lUZ9k7AG6CiJ8+2wcHEkn8VglUGd84Icyunm6nApx2Urx+Wkww/nlY1agyHjqUZ
 JLRA==
X-Gm-Message-State: AOAM532/Eqx3aE6Rr1tSmxyvc4aVXPJOQEwJWiN0DfB3Oi8+w8cWCBLP
 iQWD0N04uL/wAqSZSKGxVIjPaZvWI46J5Q==
X-Google-Smtp-Source: ABdhPJwm4yJT+N++Gcn2c1pBVG5i7pxrWLCZx34E1tT9N0ktHF6Ducg1sEmXdhbKgpVN65tjhZS5tg==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr25510253wmq.96.1617633156388; 
 Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 25/27] arcv3: gdbstub changes and new XML files
Date: Mon,  5 Apr 2021 15:31:36 +0100
Message-Id: <20210405143138.17016-26-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 gdb-xml/arc-core-v3.xml       |  45 +++++++++
 gdb-xml/arc64-aux-minimal.xml |  32 ++++++
 gdb-xml/arc64-aux-other.xml   | 177 ++++++++++++++++++++++++++++++++++
 target/arc/gdbstub.c          |  23 +++++
 target/arc/gdbstub.h          |  10 ++
 5 files changed, 287 insertions(+)
 create mode 100644 gdb-xml/arc-core-v3.xml
 create mode 100644 gdb-xml/arc64-aux-minimal.xml
 create mode 100644 gdb-xml/arc64-aux-other.xml

diff --git a/gdb-xml/arc-core-v3.xml b/gdb-xml/arc-core-v3.xml
new file mode 100644
index 0000000000..fdca31b4c3
--- /dev/null
+++ b/gdb-xml/arc-core-v3.xml
@@ -0,0 +1,45 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arc.core">
+  <reg name="r0"       bitsize="64" regnum="0"                  />
+  <reg name="r1"       bitsize="64" regnum="1"                  />
+  <reg name="r2"       bitsize="64" regnum="2"                  />
+  <reg name="r3"       bitsize="64" regnum="3"                  />
+  <reg name="r4"       bitsize="64" regnum="4"                  />
+  <reg name="r5"       bitsize="64" regnum="5"                  />
+  <reg name="r6"       bitsize="64" regnum="6"                  />
+  <reg name="r7"       bitsize="64" regnum="7"                  />
+  <reg name="r8"       bitsize="64" regnum="8"                  />
+  <reg name="r9"       bitsize="64" regnum="9"                  />
+  <reg name="r10"      bitsize="64" regnum="10"                 />
+  <reg name="r11"      bitsize="64" regnum="11"                 />
+  <reg name="r12"      bitsize="64" regnum="12"                 />
+  <reg name="r13"      bitsize="64" regnum="13"                 />
+  <reg name="r14"      bitsize="64" regnum="14"                 />
+  <reg name="r15"      bitsize="64" regnum="15"                 />
+  <reg name="r16"      bitsize="64" regnum="16"                 />
+  <reg name="r17"      bitsize="64" regnum="17"                 />
+  <reg name="r18"      bitsize="64" regnum="18"                 />
+  <reg name="r19"      bitsize="64" regnum="19"                 />
+  <reg name="r20"      bitsize="64" regnum="20"                 />
+  <reg name="r21"      bitsize="64" regnum="21"                 />
+  <reg name="r22"      bitsize="64" regnum="22"                 />
+  <reg name="r23"      bitsize="64" regnum="23"                 />
+  <reg name="r24"      bitsize="64" regnum="24"                 />
+  <reg name="r25"      bitsize="64" regnum="25"                 />
+  <reg name="gp"       bitsize="64" regnum="26"                 />
+  <reg name="fp"       bitsize="64" regnum="27"                 />
+  <reg name="sp"       bitsize="64" regnum="28"                 />
+  <reg name="ilink"    bitsize="64" regnum="29"                 />
+  <reg name="r30"      bitsize="64" regnum="30"                 />
+  <reg name="blink"    bitsize="64" regnum="31"                 />
+  <reg name="accl"     bitsize="64" regnum="32"                 />
+  <reg name="acch"     bitsize="64" regnum="33"                 />
+  <reg name="lp_count" bitsize="64" regnum="34"                 />
+  <reg name="pcl"      bitsize="64" regnum="35"                 />
+</feature>
diff --git a/gdb-xml/arc64-aux-minimal.xml b/gdb-xml/arc64-aux-minimal.xml
new file mode 100644
index 0000000000..56c3f2f698
--- /dev/null
+++ b/gdb-xml/arc64-aux-minimal.xml
@@ -0,0 +1,32 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arc.aux-minimal">
+  <flags id="status32_type" size="8">
+      <field name="H"   start="0"  end="0"/>
+      <field name="E"   start="1"  end="4"/>
+      <field name="AE"  start="5"  end="5"/>
+      <field name="DE"  start="6"  end="6"/>
+      <field name="U"   start="7"  end="7"/>
+      <field name="V"   start="8"  end="8"/>
+      <field name="C"   start="9"  end="9"/>
+      <field name="N"   start="10" end="10"/>
+      <field name="Z"   start="11" end="11"/>
+      <field name="L"   start="12" end="12"/>
+      <field name="DZ"  start="13" end="13"/>
+      <field name="SC"  start="14" end="14"/>
+      <field name="ES"  start="15" end="15"/>
+      <field name="RB"  start="16" end="18"/>
+      <field name="AD"  start="19" end="19"/>
+      <field name="US"  start="20" end="20"/>
+      <field name="IE"  start="31" end="31"/>
+  </flags>
+  <reg name="pc"       bitsize="64" regnum="36" type="code_ptr"      group="general"/>
+  <reg name="lp_start" bitsize="64" regnum="37" type="code_ptr"      group="general"/>
+  <reg name="lp_end"   bitsize="64" regnum="38" type="code_ptr"      group="general"/>
+  <reg name="status32" bitsize="64" regnum="39" type="status32_type" group="general"/>
+</feature>
diff --git a/gdb-xml/arc64-aux-other.xml b/gdb-xml/arc64-aux-other.xml
new file mode 100644
index 0000000000..75a120b894
--- /dev/null
+++ b/gdb-xml/arc64-aux-other.xml
@@ -0,0 +1,177 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018 Free Software Foundation, Inc.
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.arc.aux-other">
+  <flags id="timer_build_type" size="8">
+    <field name="version" start="0"  end="7"/>
+    <field name="t0"      start="8"  end="8"/>
+    <field name="t1"      start="9"  end="9"/>
+    <field name="rtc"     start="10" end="10"/>
+    <field name="p0"      start="16" end="19"/>
+    <field name="p1"      start="20" end="23"/>
+  </flags>
+  <flags id="irq_build_type" size="8">
+    <field name="version" start="0"  end="7"/>
+    <field name="IRQs"    start="8"  end="15"/>
+    <field name="exts"    start="16" end="23"/>
+    <field name="p"       start="24" end="27"/>
+    <field name="f"       start="28" end="28"/>
+  </flags>
+  <flags id="vecbase_build_type" size="8">
+    <field name="version" start="2"  end="9"/>
+    <field name="addr"    start="10" end="31"/>
+  </flags>
+  <flags id="isa_config_type" size="8">
+    <field name="version"   start="0"  end="7"/>
+    <field name="va_size"   start="8"  end="11"/>
+    <field name="pa_size"   start="16" end="19"/>
+    <field name="b"         start="20" end="20"/>
+    <field name="a"         start="21" end="22"/>
+    <field name="n"         start="23" end="23"/>
+    <field name="m"         start="24" end="25"/>
+    <field name="c"         start="26" end="27"/>
+    <field name="d"         start="28" end="29"/>
+  </flags>
+  <flags id="timer_ctrl_type" size="8">
+    <field name="ie" start="0" end="0"/>
+    <field name="nh" start="1" end="1"/>
+    <field name="w"  start="2" end="2"/>
+    <field name="ip" start="3" end="3"/>
+    <field name="pd" start="4" end="4"/>
+  </flags>
+  <struct id="mmu_ctrl_type" size="4">
+    <field name="en"  start="0" end="0"/>
+    <field name="ku"  start="1" end="1"/>
+    <field name="wx"  start="2" end="2"/>
+    <field name="tce" start="3" end="3"/>
+  </struct>
+  <struct id="tlbindex_type" size="4">
+    <field name="index" start="0"  end="15"/>
+    <field name="rc"    start="28" end="30"/>
+    <field name="e"     start="31" end="31"/>
+  </struct>
+  <struct id="tlbcmd_type" size="4">
+    <field name="cmd" start="0" end="5"/>
+  </struct>
+  <flags id="erstatus_type" size="8">
+    <field name="e"  start="1"  end="4" />
+    <field name="ae" start="5"  end="5" />
+    <field name="de" start="6"  end="6" />
+    <field name="u"  start="7"  end="7" />
+    <field name="v"  start="8"  end="8" />
+    <field name="c"  start="9"  end="9" />
+    <field name="n"  start="10" end="10"/>
+    <field name="z"  start="11" end="11"/>
+    <field name="l"  start="12" end="12"/>
+    <field name="dz" start="13" end="13"/>
+    <field name="sc" start="14" end="14"/>
+    <field name="es" start="15" end="15"/>
+    <field name="rb" start="16" end="18"/>
+    <field name="ad" start="19" end="19"/>
+    <field name="us" start="20" end="20"/>
+    <field name="ie" start="31" end="31"/>
+  </flags>
+  <flags id="ecr_type" size="8">
+    <field name="parameter"    start="0"  end="7" />
+    <field name="causecode"    start="8"  end="15"/>
+    <field name="vectornumber" start="16" end="23"/>
+    <field name="u"            start="30" end="30"/>
+    <field name="p"            start="31" end="31"/>
+  </flags>
+  <flags id="irq_ctrl_type" size="8">
+    <field name="nr" start="0"  end="4"/>
+    <field name="b"  start="9"  end="9"/>
+    <field name="l"  start="10" end="10"/>
+    <field name="u"  start="11" end="11"/>
+    <field name="lp" start="13" end="13"/>
+  </flags>
+  <flags id="irq_act_type" size="8">
+    <field name="active" start="0" end="15"/>
+    <field name="u" start="31" end="31"/>
+  </flags>
+  <flags id="irq_status_type" size="8">
+    <field name="p"  start="0"  end="3"/>
+    <field name="e"  start="4"  end="4"/>
+    <field name="t"  start="5"  end="5"/>
+    <field name="ip" start="31" end="31"/>
+  </flags>
+  <flags id="mpu_build_type" size="8">
+    <field name="version" start="0" end="7"/>
+    <field name="regions" start="8" end="15"/>
+  </flags>
+  <flags id="mpuen_type" size="8">
+    <field name="ue" start="3"  end="3"/>
+    <field name="uw" start="4"  end="4"/>
+    <field name="ur" start="5"  end="5"/>
+    <field name="ke" start="6"  end="6"/>
+    <field name="kw" start="7"  end="7"/>
+    <field name="kr" start="8"  end="8"/>
+    <field name="en" start="30" end="30"/>
+  </flags>
+  <flags id="mpuecr_type" size="8">
+    <field name="mr"      start="0"  end="7"/>
+    <field name="vt"      start="8"  end="9"/>
+    <field name="ec_code" start="16" end="31"/>
+  </flags>
+  <flags id="mpurdb_type" size="8">
+    <field name="v"         start="0" end="0"/>
+    <field name="base_addr" start="5" end="31"/>
+  </flags>
+  <flags id="mpurdp_type" size="8">
+    <field name="size_lower" start="0"  end="1"/>
+    <field name="ue"         start="3"  end="3"/>
+    <field name="uw"         start="4"  end="4"/>
+    <field name="ur"         start="5"  end="5"/>
+    <field name="ke"         start="6"  end="6"/>
+    <field name="kw"         start="7"  end="7"/>
+    <field name="kr"         start="8"  end="8"/>
+    <field name="size_upper" start="9"  end="11"/>
+  </flags>
+  <struct id="mmu_rtp_type" size="8">
+    <field name="addr"   start="0"  end="47" type="code_ptr"/>
+    <field name="ASID"   start="48" end="63" type="code_ptr"/>
+  </struct>
+  <!-- build registers -->
+  <reg name="timer_build"   bitsize="64" regnum="40" type="timer_build_type"   group=""/>
+  <reg name="irq_build"     bitsize="64" regnum="41" type="irq_build_type"     group=""/>
+  <reg name="vecbase_build" bitsize="64" regnum="42" type="vecbase_build_type" group=""/>
+  <reg name="isa_config"    bitsize="64" regnum="43" type="isa_config_type"    group=""/>
+  <!-- timer registers -->
+  <reg name="timer_count0" bitsize="64" regnum="44"                        group="general"/>
+  <reg name="timer_ctrl0"  bitsize="64" regnum="45" type="timer_ctrl_type" group="general"/>
+  <reg name="timer_limit0" bitsize="64" regnum="46"                        group="general"/>
+  <reg name="timer_count1" bitsize="64" regnum="47"                        group="general"/>
+  <reg name="timer_ctrl1"  bitsize="64" regnum="48" type="timer_ctrl_type" group="general"/>
+  <reg name="timer_limit1" bitsize="64" regnum="49"                        group="general"/>
+  <!-- exception registers -->
+  <reg name="erstatus" bitsize="32" regnum="50" type="erstatus_type" group="general"/>
+  <reg name="erbta"    bitsize="64" regnum="51" type="code_ptr"      group="general"/>
+  <reg name="ecr"      bitsize="32" regnum="52" type="ecr_type"      group="general"/>
+  <reg name="eret"     bitsize="64" regnum="53" type="code_ptr"      group="general"/>
+  <reg name="efa"      bitsize="64" regnum="54" type="uint64"        group="general"/>
+  <!-- irq registers -->
+  <reg name="icause"               bitsize="64" regnum="55"  type="uint8"           group="general"/>
+  <reg name="aux_irq_ctrl"         bitsize="64" regnum="56"  type="irq_ctrl_type"   group="general"/>
+  <reg name="aux_irq_act"          bitsize="64" regnum="57"  type="irq_act_type"    group="general"/>
+  <reg name="irq_priority_pending" bitsize="64" regnum="58"  type="uint16"          group="general"/>
+  <reg name="aux_irq_hint"         bitsize="64" regnum="59"  type="uint8"           group="general"/>
+  <reg name="irq_select"           bitsize="64" regnum="60"  type="uint8"           group="general"/>
+  <reg name="irq_enable"           bitsize="64" regnum="61"  type="bool"            group="general"/>
+  <reg name="irq_trigger"          bitsize="64" regnum="62"  type="bool"            group="general"/>
+  <reg name="irq_status"           bitsize="64" regnum="63"  type="irq_status_type" group="general"/>
+  <reg name="irq_pulse_cancel"     bitsize="64" regnum="64"  type="bool"            group="general"/>
+  <reg name="irq_pending"          bitsize="64" regnum="65"  type="bool"            group="general"/>
+  <reg name="irq_priority"         bitsize="64" regnum="66"  type="uint8"           group="general"/>
+  <!-- miscellaneous -->
+  <reg name="bta" bitsize="64" regnum="67" type="code_ptr" group="general"/>
+  <!-- mmuv6 -->
+  <reg name="mmu_ctrl" bitsize="64" regnum="68" type="mmu_ctrl_type" group="general"/>
+  <reg name="mmu_rtp0" bitsize="64" regnum="69" type="mmu_rtp_type"  group="general"/>
+  <reg name="mmu_rtp1" bitsize="64" regnum="70" type="mmu_rtp_type"  group="general"/>
+  <reg name="tlbindex" bitsize="64" regnum="71" type="tlbindex_type" group="general"/>
+  <reg name="tlbcmd"   bitsize="64" regnum="72" type="tlbcmd_type"   group="general"/>
+</feature>
diff --git a/target/arc/gdbstub.c b/target/arc/gdbstub.c
index a09cdb3f45..84e31b02cc 100644
--- a/target/arc/gdbstub.c
+++ b/target/arc/gdbstub.c
@@ -30,7 +30,13 @@
 #define REG_ADDR(reg, processor_type) \
     arc_aux_reg_address_for((reg), (processor_type))
 
+#ifdef TARGET_ARCV2
 #define GDB_GET_REG gdb_get_reg32
+#elif TARGET_ARCV3
+#define GDB_GET_REG gdb_get_reg64
+#else
+    #error No target is selected.
+#endif
 
 int arc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
@@ -272,6 +278,18 @@ arc_aux_other_gdb_get_reg(CPUARCState *env, GByteArray *mem_buf, int regnum)
     case GDB_AUX_OTHER_REG_BTA:
         regval = helper_lr(env, REG_ADDR(AUX_ID_bta, cpu->family));
         break;
+#ifdef TARGET_ARCV3
+    /* MMUv6 */
+    case GDB_AUX_OTHER_REG_MMU_CTRL:
+        regval = helper_lr(env, REG_ADDR(AUX_ID_mmu_ctrl, cpu->family));
+        break;
+    case GDB_AUX_OTHER_REG_RTP0:
+        regval = helper_lr(env, REG_ADDR(AUX_ID_mmu_rtp0, cpu->family));
+        break;
+    case GDB_AUX_OTHER_REG_RTP1:
+        regval = helper_lr(env, REG_ADDR(AUX_ID_mmu_rtp1, cpu->family));
+        break;
+#endif
     default:
         assert(!"Unsupported other auxiliary register is being read.");
     }
@@ -395,8 +413,13 @@ arc_aux_other_gdb_set_reg(CPUARCState *env, uint8_t *mem_buf, int regnum)
     return 4;
 }
 
+#ifdef TARGET_ARCV2
 #define GDB_TARGET_MINIMAL_XML "arc-v2-aux.xml"
 #define GDB_TARGET_AUX_XML     "arc-v2-other.xml"
+#else
+#define GDB_TARGET_MINIMAL_XML "arc64-aux-minimal.xml"
+#define GDB_TARGET_AUX_XML     "arc64-aux-other.xml"
+#endif
 
 void arc_cpu_register_gdb_regs_for_features(ARCCPU *cpu)
 {
diff --git a/target/arc/gdbstub.h b/target/arc/gdbstub.h
index 2ced52ee57..ff00c592e1 100644
--- a/target/arc/gdbstub.h
+++ b/target/arc/gdbstub.h
@@ -20,7 +20,11 @@
 #ifndef ARC_GDBSTUB_H
 #define ARC_GDBSTUB_H
 
+#ifdef TARGET_ARCV2
 #define GDB_TARGET_STRING "arc:ARCv2"
+#else
+#define GDB_TARGET_STRING "arc:ARCv3_64"
+#endif
 
 enum gdb_regs {
     GDB_REG_0 = 0,
@@ -147,6 +151,12 @@ enum gdb_aux_other_regs {
     GDB_AUX_OTHER_REG_TLBPD1,           /* page descriptor 1 */
     GDB_AUX_OTHER_REG_TLB_INDEX,        /* tlb index         */
     GDB_AUX_OTHER_REG_TLB_CMD,          /* tlb command       */
+#ifdef TARGET_ARCV3
+    /* mmuv6 */
+    GDB_AUX_OTHER_REG_MMU_CTRL,         /* mmuv6 control */
+    GDB_AUX_OTHER_REG_RTP0,             /* region 0 ptr  */
+    GDB_AUX_OTHER_REG_RTP1,             /* region 1 ptr  */
+#endif
 
     GDB_AUX_OTHER_REG_LAST
 };
-- 
2.20.1


