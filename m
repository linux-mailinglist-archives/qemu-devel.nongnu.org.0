Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A52F4E574F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:20:06 +0100 (CET)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4eT-0004Xz-KG
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:20:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4ci-0001zx-8R
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:16 -0400
Received: from [2607:f8b0:4864:20::102b] (port=54090
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4cg-0004TD-Nm
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id bx5so2364235pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RdGe7OSna0pa6P1DCbP+tWeGpoxvWEJQjOuJ7sjX7ZM=;
 b=LfJoFD5fOViBkuqfE0KI6EMWLe6oYelEsiQii6kQMJ+pxD0zqcY9STqOMnDFSlW73M
 92ZYIUVnSjAEyM+0RN1XniYK9pmWDuGBo+SVmGf4sOHKTxRnTx7RfBfiXxSWznfHXIkq
 0ct06cT/vEr1W7QFb/EO+MjqCSN9t4/1zOTBHtezxjV3AkxnCTB6PF9fzrALv+p62nuR
 RTbDk67z0FYbVHfgSJqkxdDjD0ZVlUCIoQNiEBHCeZ0g3oW9bGRNmiBQyv4PmC07JGLY
 6pTUzjjLplNCGttiMQwTUmcJa0rxUNYiG8FiTe/ZrvXei+d0TJRUFxqUTgIUFjRYdCGL
 ZQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RdGe7OSna0pa6P1DCbP+tWeGpoxvWEJQjOuJ7sjX7ZM=;
 b=tOk19Fgod21bxo0U4zC3En8vgKLWKyG/s3TZ1xRoS1AxJkPNZNwPUbfXXazHWHyM/B
 dj4HdXzyheNzmrELRAeVc/NL4CG/iaMsw9g4yMz7vscSe1tmX1ZfvBybw0Wm/3YwESR9
 9r2NWPFjhOFrGNeWOJ1YE2oVg0HfIu5zjiJl2uvutjT8k+2r83egogKwbvbOXjuaI1FE
 UU5PJrAygvoYSUrBzUIATcWBNapW7g8oh5O3LtL7m4fDs+WtYHN5iOr3SmRtSYVzU43Y
 zgDS6Wamefy53EXzi73ELECrAZwGX7g6JUmfPGtaUnBGAYFL2hnm/NMvjARQWIg9Clx0
 h10w==
X-Gm-Message-State: AOAM531tNYHPaolzsh2UnZ+Iy/vP9aVWx2hus/RfG4GdvvPlBGNGtJWb
 eapHuCvHqk3R7Qil8oqALDcn3eIgBME=
X-Google-Smtp-Source: ABdhPJw8FuyQ7wLlVvP9x+Z8gtO3cPHdbxET9VHqz4Un8qAadu86lw/vl8rV1uYpDaorpMWUtuAyqg==
X-Received: by 2002:a17:90b:1c07:b0:1c7:5324:c68e with SMTP id
 oc7-20020a17090b1c0700b001c75324c68emr802630pjb.202.1648055893334; 
 Wed, 23 Mar 2022 10:18:13 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 l20-20020a056a00141400b004f65cedfb09sm498798pfu.48.2022.03.23.10.18.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/13] cpu: Free cpu->cpu_ases in
 cpu_address_space_destroy()
Date: Wed, 23 Mar 2022 18:17:39 +0100
Message-Id: <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Kanda <mark.kanda@oracle.com>

Create cpu_address_space_destroy() to free a CPU's cpu_ases list.

vCPU hotunplug related leak reported by Valgrind:

==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 8,549
==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
==132362==    by 0x93E26F: property_set_bool (object.c:2273)
==132362==    by 0x93C23E: object_property_set (object.c:1408)
==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
==132362==    by 0x933C81: qdev_realize (qdev.c:333)
==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220321141409.3112932-5-mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c                     | 1 +
 include/exec/cpu-common.h | 7 +++++++
 softmmu/physmem.c         | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/cpu.c b/cpu.c
index be1f8b074c..59352a1487 100644
--- a/cpu.c
+++ b/cpu.c
@@ -174,6 +174,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
         tcg_exec_unrealizefn(cpu);
     }
 
+    cpu_address_space_destroy(cpu);
     cpu_list_remove(cpu);
 }
 
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 50a7d2912e..b17ad61ae4 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -111,6 +111,13 @@ size_t qemu_ram_pagesize_largest(void);
  */
 void cpu_address_space_init(CPUState *cpu, int asidx,
                             const char *prefix, MemoryRegion *mr);
+/**
+ * cpu_address_space_destroy:
+ * @cpu: CPU for this address space
+ *
+ * Cleanup CPU's cpu_ases list.
+ */
+void cpu_address_space_destroy(CPUState *cpu);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 43ae70fbe2..aec61ca07a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -762,6 +762,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
     }
 }
 
+void cpu_address_space_destroy(CPUState *cpu)
+{
+    g_free(cpu->cpu_ases);
+}
+
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
 {
     /* Return the AddressSpace corresponding to the specified index */
-- 
2.35.1


