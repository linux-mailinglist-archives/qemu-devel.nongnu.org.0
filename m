Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FF31FE4E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:49:53 +0100 (CET)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9ua-0004AU-9W
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kP-0002le-7b
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kM-0005WE-CU
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHXCPuc7uWQdwucv7FWJOUQ8ceg9IO3ZY73rXU3+wF0=;
 b=Q//+IvXATgpteRyAb5zA5a1N4Jbhh7Y/VARQF41rbKKoehBpCZYfXiN3A6qzJk5otpfWBT
 uw5m8qoBe1OPLYjujE3N/rS37CPpwruk1TvjrUAZsP+GZaWmypi55xt1xrlg28tmuTKSY9
 cEK7Zj28mrsA6D3UfjtmIdRRfrUfZo0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-N4p_Rgt6NoGgGtrbyufGfA-1; Fri, 19 Feb 2021 12:39:14 -0500
X-MC-Unique: N4p_Rgt6NoGgGtrbyufGfA-1
Received: by mail-wr1-f70.google.com with SMTP id c16so934547wro.21
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHXCPuc7uWQdwucv7FWJOUQ8ceg9IO3ZY73rXU3+wF0=;
 b=DRy1kqCKFgafyFFTox3v2awUNYBkiZwQQBQYIz0qgmnJ8hmmVwvk+ubs0+QAxVu7lo
 7Gm/jGqfNn7+zAXNkwyjPRmxJMqPenYqpSccDd4cpWr3QHMAtJFc5WCr8jGEBpZUHTVj
 VZLtjqtxwK4kdro+tok0qDWmNX+m9cij+WsZcFGrapJGqXWh+ghAhl1DEa8lJTs866fF
 rgjxukYRUysxeinfyQ067Q4wXICgJP8Sod7zALm9sTIMeoTb9EtP4yWSv3pqWjWhpplc
 yPMCYhProPMuQs73LOyIOsAriHrIvbdNYEqm4gJmxy/vxE6Q94awelfH1YFw3ZzkbItC
 JLvA==
X-Gm-Message-State: AOAM532NhbrbEJccP579757ji4ezEzqpcSf5XFbs7vMfE6NWF4W56ZOY
 Ho47yrzR8fP99g7POfRc1+TJVLy3YA/jlkFqvcOwSPZkoY37x9D5Mt4PA5jgxzBluNlgDTNO/Z9
 sKFCzcFF4DTf5f1s+p2pXp1kIzr6T93BvglV3dX9H13CuDHWSINgbnpAZCzdfComS
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr10610963wri.105.1613756353547; 
 Fri, 19 Feb 2021 09:39:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrzSzq1o4kGieINb1Q744LtUd4TVffu+lfi/YVrFtocFVQ1Ale5KqgmXk7Upte5EwmyzFbHA==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr10610915wri.105.1613756353383; 
 Fri, 19 Feb 2021 09:39:13 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q20sm12010000wmc.14.2021.02.19.09.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] hw/arm: Restrit KVM to the virt & versal machines
Date: Fri, 19 Feb 2021 18:38:40 +0100
Message-Id: <20210219173847.2054123-5-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Restrit KVM to the following ARM machines:
- virt
- xlnx-versal-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/virt.c             | 5 +++++
 hw/arm/xlnx-versal-virt.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae9..8e9861b61a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2527,6 +2527,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", "hvf", NULL
+};
+
 /*
  * for arm64 kvm_type [7-0] encodes the requested number of bits
  * in the IPA address space
@@ -2582,6 +2586,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd61960..d424813cae1 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -610,6 +610,10 @@ static void versal_virt_machine_instance_init(Object *obj)
 {
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -621,6 +625,7 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
+    mc->valid_accelerators = valid_accels;
 }
 
 static const TypeInfo versal_virt_machine_init_typeinfo = {
-- 
2.26.2


