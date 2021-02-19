Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4B31FE48
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:49:12 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9tv-0003jR-EL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kk-0002qG-MK
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9ka-0005Z8-UU
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lw4bfUfCEZBd00BTMjyws6AoTKQiuLTiPv1ON4ccv74=;
 b=bC8+1d15noKWKx8Hh745rCDU4HZoLgZ63FobWXUUsj7+SAcwubcsmypKDkqTgOylNdtPtm
 P4hFStTViFqfv7hCZ+qC+blMi3ehAFZTISC81djndPrZbuY468grpX78lSqs76nuRdC4Yj
 D1XKjd/TqWb1c51yphRt2OgTNG0YVA8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-zK-s3Y_jNJGJBwwKFd5jhg-1; Fri, 19 Feb 2021 12:39:26 -0500
X-MC-Unique: zK-s3Y_jNJGJBwwKFd5jhg-1
Received: by mail-wr1-f69.google.com with SMTP id x14so2174403wrr.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lw4bfUfCEZBd00BTMjyws6AoTKQiuLTiPv1ON4ccv74=;
 b=mdItbanFIJDqLmWEebmWpISjpS2ILMFBfXtAPMwv/CNcU90RTdxxY3cs5B7ezi3k+n
 QvFk30p/D9DniICWgwY+6ERdClrtuS6DUmn7SAnpyhbj8Ce84l3onGmRQNSsoZl+vgvM
 YxLM0+7swusLAfLu3qnmhTPNTUQHiJpZv6t4Tl39tOQDK7QiIrv7VKzlIp1WGGtOZ8eI
 dK3tpZG1q0RvGw1r0S4yJuZhO+opdQL130hcN5guModBjsWr3CoAJH+k4KKL2fGbeBfB
 Zn7RyKQPfNYpMo8TEk1dBnX+d6JahW8fIyH9TyoQfqY3qC1IXCOSBUFC0DoL1LQ5E0iO
 pdAQ==
X-Gm-Message-State: AOAM531nomkAWurnFmqfznx1ZB/dze/AARAp1ViLgu/IeRKh7k7t1xpX
 BirYqj0+UU+23w0Km1rI9ubvP5653FZx0krMChqJHCmQQASvTCETFdkZbnzjqzitDY3iy8/UinL
 sBcKdYoPv1MlaFepyOzvsLNJ32XH7q7ru+RPXzTIFnfwyXdp/iG1BQvEYau7xwhut
X-Received: by 2002:a1c:bb44:: with SMTP id l65mr8964776wmf.86.1613756364702; 
 Fri, 19 Feb 2021 09:39:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjqRkJ5Ff39xPwSCRnl3K5tBZjqMMFJ/FERHr0iybiVEhoAVRLgd8349suwi9XW5Y8/zboYw==
X-Received: by 2002:a1c:bb44:: with SMTP id l65mr8964730wmf.86.1613756364447; 
 Fri, 19 Feb 2021 09:39:24 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v66sm12701902wme.33.2021.02.19.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 06/11] hw/ppc: Restrict KVM to various PPC machines
Date: Fri, 19 Feb 2021 18:38:42 +0100
Message-Id: <20210219173847.2054123-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrit KVM to the following PPC machines:
- 40p
- bamboo
- g3beige
- mac99
- mpc8544ds
- ppce500
- pseries
- sam460ex
- virtex-ml507

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: I'm surprise by this list, but this is the result of
     auditing calls to kvm_enabled() checks.

 hw/ppc/e500plat.c      | 5 +++++
 hw/ppc/mac_newworld.c  | 6 ++++++
 hw/ppc/mac_oldworld.c  | 5 +++++
 hw/ppc/mpc8544ds.c     | 5 +++++
 hw/ppc/ppc440_bamboo.c | 5 +++++
 hw/ppc/prep.c          | 5 +++++
 hw/ppc/sam460ex.c      | 5 +++++
 hw/ppc/spapr.c         | 5 +++++
 8 files changed, 41 insertions(+)

diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index bddd5e7c48f..9701dbc2231 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -67,6 +67,10 @@ HotplugHandler *e500plat_machine_get_hotpug_handler(MachineState *machine,
 
 #define TYPE_E500PLAT_MACHINE  MACHINE_TYPE_NAME("ppce500")
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void e500plat_machine_class_init(ObjectClass *oc, void *data)
 {
     PPCE500MachineClass *pmc = PPCE500_MACHINE_CLASS(oc);
@@ -98,6 +102,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 32;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
+    mc->valid_accelerators = valid_accels;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);
  }
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e991db4addb..634f5ad19a0 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -578,6 +578,11 @@ static char *core99_fw_dev_path(FWPathProvider *p, BusState *bus,
 
     return NULL;
 }
+
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static int core99_kvm_type(MachineState *machine, const char *arg)
 {
     /* Always force PR KVM */
@@ -595,6 +600,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
     mc->default_boot_order = "cd";
     mc->default_display = "std";
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = core99_kvm_type;
 #ifdef TARGET_PPC64
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("970fx_v3.1");
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 44ee99be886..2c58f73b589 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -424,6 +424,10 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, BusState *bus,
     return NULL;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static int heathrow_kvm_type(MachineState *machine, const char *arg)
 {
     /* Always force PR KVM */
@@ -444,6 +448,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
 #endif
     /* TOFIX "cad" when Mac floppy is implemented */
     mc->default_boot_order = "cd";
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = heathrow_kvm_type;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("750_v3.1");
     mc->default_display = "std";
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f02..92b0e926c1b 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -36,6 +36,10 @@ static void mpc8544ds_init(MachineState *machine)
     ppce500_init(machine);
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void e500plat_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -56,6 +60,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 15;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
+    mc->valid_accelerators = valid_accels;
 }
 
 #define TYPE_MPC8544DS_MACHINE  MACHINE_TYPE_NAME("mpc8544ds")
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b156bcb9990..02501f489e4 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -298,12 +298,17 @@ static void bamboo_init(MachineState *machine)
     }
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void bamboo_machine_init(MachineClass *mc)
 {
     mc->desc = "bamboo";
     mc->init = bamboo_init;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("440epb");
     mc->default_ram_id = "ppc4xx.sdram";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("bamboo", bamboo_machine_init)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7e72f6e4a9b..90d884b0883 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -431,6 +431,10 @@ static void ibm_40p_init(MachineState *machine)
     }
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void ibm_40p_machine_init(MachineClass *mc)
 {
     mc->desc = "IBM RS/6000 7020 (40p)",
@@ -441,6 +445,7 @@ static void ibm_40p_machine_init(MachineClass *mc)
     mc->default_boot_order = "c";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("604");
     mc->default_display = "std";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("40p", ibm_40p_machine_init)
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index e459b43065b..79adb3352f0 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -506,6 +506,10 @@ static void sam460ex_init(MachineState *machine)
     boot_info->entry = entry;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void sam460ex_machine_init(MachineClass *mc)
 {
     mc->desc = "aCube Sam460ex";
@@ -513,6 +517,7 @@ static void sam460ex_machine_init(MachineClass *mc)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("460exb");
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc4xx.sdram";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("sam460ex", sam460ex_machine_init)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 85fe65f8947..c5f985f0187 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4397,6 +4397,10 @@ static void spapr_cpu_exec_exit(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
     }
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void spapr_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -4426,6 +4430,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc_spapr.ram";
     mc->default_display = "std";
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
     mc->pci_allow_0_address = true;
-- 
2.26.2


