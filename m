Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF28328618
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:03:59 +0100 (CET)
Received: from localhost ([::1]:38574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlxe-0007Q8-6M
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danny.milo@datacom.wien>)
 id 1lGlvV-0005HD-Um
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:01:45 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danny.milo@datacom.wien>)
 id 1lGlvT-0002ax-KD
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:01:45 -0500
Received: by mail-lf1-x130.google.com with SMTP id v9so8860859lfa.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 09:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=datacom-wien.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44OqtTdmRAqB/qDl8aHIglfXx1OZ8jOsH1N9SPLE0bE=;
 b=czNliKm0+F3AOC2f+YTDTF1t+7sFpnkHP6YCVA6UXZ3c3Yr4N+d+kSEuh8KHDZuUcM
 c5QS9hO9g7yZxU6rbjrQmwkAmhypAmOba/iOk2lJFeX7AlJ9ODXNQVwA4zdSe8PLV6vv
 w69rIEE4oattKIaEL/Y2b4qPCTzAMOMGRVd3LOq3G3I0td/4zwA9lWrLWGsND4l6BMiR
 Ug6i4disxJk7WSZZL8Sz7t4XSoO3ssm5e3zNUFSdmm3eEqNQxIslE/79KuanwfC0pnrh
 usp669iDNICAlkqwygByoqEd3zVClpvnXGLaCy6xjY5xfqtkQ+p+7vA4o5zDeHvyNvJv
 OPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44OqtTdmRAqB/qDl8aHIglfXx1OZ8jOsH1N9SPLE0bE=;
 b=JkOcGej0YKWYjRluiD+TbBx13JQZoPYjlGciFE+t5XVfZ5e4e7OCnOHb7lZheg0zKc
 wXz+HWGuqOMQZHay1lj+5EuG8a3/FJErby4IcA3rs8gIhkYd7wNiV7+FIZea/GMfzqW5
 CwtXEv97balwjUycwI9v/BUY0OkoHnyqMJBh187618OGnOHBY5U1Pn45W4rCbgMD6jRb
 HbyLeG8fM7WYwFLEbDRxZqhNE0Jb7rcWxc4pt9QkYNcFuPfwvNLPdjX0+wLjN7K/ua8L
 rVaJVBb7waTWwGgTHjL/xIwC5mopnUH81/N7mgm9chTZpgrfrdBvQeWbgWUWj6FAocOt
 E65A==
X-Gm-Message-State: AOAM5318d4KCJ1pFdyn6YXsV/J/lH439XuogwGIli3PWxGYOwclU4/D/
 WtxkRECB3ELMaPHIuRGxy4ncmA96toHdHA==
X-Google-Smtp-Source: ABdhPJzQKtn67T9MTPGCKhwNHGgAxWKl3sJ+hy5u2zM29pLGV867JMCvMjbj2BZ13X6ijt3GSlomeA==
X-Received: by 2002:a05:6512:b18:: with SMTP id
 w24mr1597312lfu.212.1614618099784; 
 Mon, 01 Mar 2021 09:01:39 -0800 (PST)
Received: from dayas.lan
 (2a02-8388-0281-94f0-b958-b6e3-fc53-344d.cable.dynamic.v6.surfer.at.
 [2a02:8388:281:94f0:b958:b6e3:fc53:344d])
 by smtp.gmail.com with ESMTPSA id c12sm1409914ljk.11.2021.03.01.09.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 09:01:39 -0800 (PST)
From: Danny Milosavljevic <danny.milo@datacom.wien>
To: qemu-devel@nongnu.org,
	rminnich@google.com
Subject: [PATCH 1/1] i386: Add support for AMD new-style boot mechanism.
Date: Mon,  1 Mar 2021 17:14:32 +0100
Message-Id: <20210301161432.22554-2-danny.milo@datacom.wien>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301161432.22554-1-danny.milo@datacom.wien>
References: <20210301161432.22554-1-danny.milo@datacom.wien>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=danny.milo@datacom.wien; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 01 Mar 2021 12:02:00 -0500
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
Cc: Danny Milosavljevic <danny.milo@datacom.wien>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces a new generic-loader setting "csbaseaddr" that
allows you to set the segment base address of CS.

Signed-off-by: Danny Milosavljevic <danny.milo@datacom.wien>
---
 hw/core/generic-loader.c         |  5 ++++-
 include/hw/core/cpu.h            |  1 +
 include/hw/core/generic-loader.h |  1 +
 target/i386/cpu.c                | 11 +++++++++++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 2b2a7b5e9a..a151dcdd89 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -53,6 +53,8 @@ static void generic_loader_reset(void *opaque)
         cpu_reset(s->cpu);
         if (cc) {
             cc->set_pc(s->cpu, s->addr);
+            if (cc->set_csbase)
+                cc->set_csbase(s->cpu, s->csbaseaddr);
         }
     }
 
@@ -103,7 +105,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         if (s->cpu_num != CPU_NONE) {
             s->set_pc = true;
         }
-    } else if (s->addr) {
+    } else if (s->addr || s->csbaseaddr) {
         /* User is setting the PC */
         if (s->data || s->data_len || s->data_be) {
             error_setg(errp, "data can not be specified when setting a "
@@ -180,6 +182,7 @@ static void generic_loader_unrealize(DeviceState *dev)
 }
 
 static Property generic_loader_props[] = {
+    DEFINE_PROP_UINT64("csbaseaddr", GenericLoaderState, csbaseaddr, 0xffff0000),
     DEFINE_PROP_UINT64("addr", GenericLoaderState, addr, 0),
     DEFINE_PROP_UINT64("data", GenericLoaderState, data, 0),
     DEFINE_PROP_UINT8("data-len", GenericLoaderState, data_len, 0),
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d..9998b6b986 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -161,6 +161,7 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
+    void (*set_csbase)(CPUState *cpu, vaddr value);
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
diff --git a/include/hw/core/generic-loader.h b/include/hw/core/generic-loader.h
index 19d87b39c8..b407d8e8e9 100644
--- a/include/hw/core/generic-loader.h
+++ b/include/hw/core/generic-loader.h
@@ -29,6 +29,7 @@ struct GenericLoaderState {
     /* <public> */
     CPUState *cpu;
 
+    uint64_t csbaseaddr;
     uint64_t addr;
     uint64_t data;
     uint8_t data_len;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a..7cb4634e18 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7171,6 +7171,16 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.eip = value;
 }
 
+static void x86_cpu_set_csbase(CPUState *cs, vaddr value)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    cpu_x86_load_seg_cache(env, R_CS, 0xf000, value, 0xffff,
+                            DESC_P_MASK | DESC_S_MASK | DESC_CS_MASK |
+                            DESC_R_MASK | DESC_A_MASK);
+}
+
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -7412,6 +7422,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
+    cc->set_csbase = x86_cpu_set_csbase;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-- 
2.29.2


