Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8069B3C2A5F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:31:48 +0200 (CEST)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xA3-0000UC-0L
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6z-00068l-0a; Fri, 09 Jul 2021 16:28:37 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6x-0007Ua-8D; Fri, 09 Jul 2021 16:28:36 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N79q6-1l5Y5g3Hmm-017Syl; Fri, 09
 Jul 2021 22:28:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] memory: Display MemoryRegion name in read/write ops trace
 events
Date: Fri,  9 Jul 2021 22:28:17 +0200
Message-Id: <20210709202824.578187-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+JiSKhJQ1fkJGmI7CYC2rkPMuSlNEiCmDEycVEZ8IzliXYGVpLa
 Lfl1m0iSBOpTmjX7xoSKYQFHpx94cP+3rpR6GazCgg0fXRWdefHIj0r67PNgepoi+gaK9Xo
 +VAwhvFxryN5UTLimwHvnHA+HLy5uW718hvJAyQdz2aH5gvaXJWHaISxOubmuP77KQD5SL8
 wj6ZKQIB6TuUd7cmvgl/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M+f8IyWKicg=:YRRcUhBgNKMQQiUaozo7AF
 3zXHJerBYK3ywklh1rY8miDm9RVMz+GW8h4wmLbmuh+RXqrnac1RjexhePNxMW4xXGQ02+ZaT
 vwo/BVqn2LILcaE3QkFZr4lMw4hAykpGo+QbhHjZshII8C5/QgsP5ANUi+ReAvOhbzTamXM1Z
 dCh8pR7fMh6zqgGW66NxUY/cOTKrbIyvy3A6prhqu8UreO1lE1XNg21TF6a+ph73iZSR7Faw4
 0EqaB9kxRIrw7vk+MBKbOiIt6XI0gvl8j0qIQ9iTNyn/VCF9iciUQ8//ozFISi+pAHedQn6Yi
 23sUR4QNl4Nie40oMITNlT3FJmHJ5gsfIXJjz0cMs3HszuaJuX6fbuHHrNCt5L4GfUnr+mXdN
 tDMiuPA+2pBfgJRP0TkrA2RcN0FfB0NknCXnZdelhZidUmh9aF1BKrgjhYaIxPUeUnu/DyFd4
 54GbzcgpT90l3cgvYqKPfXvZ+WzzjpGoB2Uypddc8ZRjRhaIRvnqIHJxig8nT/J6dL87y2ulz
 5SH1cE+aaz+M2h4tmBMpckU9WjcoP6DV6CPDPD3dZURCl5/1esKjwpB8+c7gFklIkO7v9t4u/
 mBpT1iHZ0V85P2RfV2g7iv2BagaSLxrorOKg0etAKooGgx8GhLrxzpA8rDQBgJG9uzGOiSzJQ
 Kg32gv3mbLDhKq8B3Q/W+7qDU3IOvgJRUBoSvdntUsdDEuEEdJfGLXMv4Q+NrjdP1B7gaH4eW
 Id8JravrSRMXcTIfV6UdX3k8a0tKgJNeUbY6M8B8XMVUwVVJN9WXYFyHPfe6DHxSuM3FDDV6s
 SwEYG7BW+38AhyaTppKQBHEs8/ZcjI3ar08tz3wdB/7LtiH26N/ABbCJeWb7MhArb/CAUK6
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

MemoryRegion names is cached on first call to memory_region_name(),
so displaying the name is trace events is cheap. Add it for read /
write ops.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210307074833.143106-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/memory.c     | 12 ++++++++----
 softmmu/trace-events |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index f0161515e96d..24a97c8b1f9a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -442,7 +442,8 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
+                                     memory_region_name(mr));
     }
     memory_region_shift_read_access(value, shift, mask, tmp);
     return MEMTX_OK;
@@ -464,7 +465,8 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
+                                     memory_region_name(mr));
     }
     memory_region_shift_read_access(value, shift, mask, tmp);
     return r;
@@ -484,7 +486,8 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
+                                      memory_region_name(mr));
     }
     mr->ops->write(mr->opaque, addr, tmp, size);
     return MEMTX_OK;
@@ -504,7 +507,8 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
         trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
-        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
+        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
+                                      memory_region_name(mr));
     }
     return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
 }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index d18ac41e4e34..7b278590a0e2 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -9,8 +9,8 @@ cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
 cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
 
 # memory.c
-memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
-memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
+memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
-- 
2.31.1


