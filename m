Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4E3CFE24
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:48:23 +0200 (CEST)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ryo-0002fb-Mw
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsm-0007c0-Gr
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsk-0004nY-Ci
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIRyzvMQuaJErMkX8WoS4zVpb7DIIEK+HZuTqe1W6SM=;
 b=FwuCFodq3MLhDWxiw+zGY4NDQPy1efdwaBDgo/yRxYSK9TR1TRatnFtj6nXb9JXz+MyVjQ
 RWKS/DjyHj0ZYwe+DjrLoUJVhJhZ475ZaI14AE8jQ90Qvi4QWmlp3UjTIwUxRueYIB0kO/
 KA7/2veTR8sPzrHGjyL00pqFH9H5jdA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-IcV8V0SuP_Ws2HMNFYooBg-1; Tue, 20 Jul 2021 11:42:01 -0400
X-MC-Unique: IcV8V0SuP_Ws2HMNFYooBg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m9-20020a5d4a090000b029013e2b4a9d1eso10491741wrq.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NIRyzvMQuaJErMkX8WoS4zVpb7DIIEK+HZuTqe1W6SM=;
 b=qIp+bqkbGaPQkNMeVXtPbhtf2K9bwBRIECL6MPRGDN+MZj5m9aHIm/Ey9FN7Tnv3ob
 KG9NvDPz65/5nzuhoADHqIHaJWq8T5JbCRDOatfrq3PyDfFMJr+AH2SZhUI/Ut4kxdhi
 USDZn02BrMo7kk8X9KlX5NfXfaYaL9tCP2O7OJrdZ0CC/0xRK/UaxG8TwrAy6LY8jHCW
 2yDPSW2SkOURK+MIqEZLeKsIaQP7T2jFbMqJZxlIhyDg/sChksImdVDu2L2eFp5zZ2iR
 8/jJlAzaXeyhHaXfWntiqoAr048jVPk3xOcf0SM8NWwd/uRfB7n40xFdjZmJVRGT9Ei0
 emhA==
X-Gm-Message-State: AOAM531PelRid2fpJKm7+1KfG2N3FGS4RH5vNQaPWsp9fo0D+7nHM2sF
 h7SjA+RfMK9ZYFG8W1WMJ7lRyITmViJRcyJ7m0MotYL7WHLFaOCfui9QuWasDZVNbQan8DELiL0
 0NjoDB2ms1FP5ZbQMuoCsUfZM9Ho7rSj4hKVsU2Ks1eMFcM+lNUg011MAzUsO8fDL
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr18718937wrs.194.1626795720489; 
 Tue, 20 Jul 2021 08:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiv47LbIJtOeQ3ezPyWzWI5rKHj7W1ioa07D7gqNu+PfDAo0o5nvWnvyzmedKNq6cHDTHaSQ==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr18718922wrs.194.1626795720268; 
 Tue, 20 Jul 2021 08:42:00 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 e11sm29629239wrt.0.2021.07.20.08.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:41:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/17] hw/acpi/Kconfig: Add missing Kconfig dependencies (build
 error)
Date: Tue, 20 Jul 2021 17:41:28 +0200
Message-Id: <20210720154141.3919817-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'microvm' machine misses various dependencies:

  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_setup_microvm':
  hw/i386/acpi-microvm.c:247: undefined reference to `acpi_build_tables_init'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_build_microvm':
  hw/i386/acpi-microvm.c:192: undefined reference to `bios_linker_loader_alloc'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `build_dsdt_microvm':
  hw/i386/acpi-microvm.c:121: undefined reference to `init_aml_allocator'
  /usr/bin/ld: hw/i386/acpi-microvm.c:124: undefined reference to `acpi_data_push'
  /usr/bin/ld: hw/i386/acpi-microvm.c:126: undefined reference to `aml_scope'
  /usr/bin/ld: hw/i386/acpi-microvm.c:129: undefined reference to `build_ged_aml'
  /usr/bin/ld: hw/i386/acpi-microvm.c:131: undefined reference to `acpi_dsdt_add_power_button'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_dsdt_add_virtio':
  hw/i386/acpi-microvm.c:77: undefined reference to `aml_string'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `build_dsdt_microvm':
  hw/i386/acpi-microvm.c:138: undefined reference to `aml_scope'
  /usr/bin/ld: hw/i386/acpi-microvm.c:149: undefined reference to `build_header'
  /usr/bin/ld: hw/i386/acpi-microvm.c:152: undefined reference to `free_aml_allocator'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_build_microvm':
  hw/i386/acpi-microvm.c:202: undefined reference to `acpi_add_table'
  /usr/bin/ld: hw/i386/acpi-microvm.c:203: undefined reference to `build_fadt'
  /usr/bin/ld: hw/i386/acpi-microvm.c:206: undefined reference to `acpi_add_table'
  /usr/bin/ld: hw/i386/acpi-microvm.c:207: undefined reference to `acpi_build_madt'
  /usr/bin/ld: hw/i386/acpi-microvm.c:212: undefined reference to `build_xsdt'
  /usr/bin/ld: hw/i386/acpi-microvm.c:224: undefined reference to `build_rsdp'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_setup_microvm':
  hw/i386/acpi-microvm.c:251: undefined reference to `acpi_add_rom_blob'
  /usr/bin/ld: hw/i386/acpi-microvm.c:253: undefined reference to `acpi_add_rom_blob'
  /usr/bin/ld: hw/i386/acpi-microvm.c:255: undefined reference to `acpi_add_rom_blob'
  /usr/bin/ld: hw/i386/acpi-microvm.c:258: undefined reference to `acpi_build_tables_cleanup'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_dsdt_add_pci':
  hw/i386/acpi-microvm.c:105: undefined reference to `acpi_dsdt_add_gpex'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.

Update the ACPI_HW_REDUCED symbol to select ACPI_MEMORY_HOTPLUG /
ACPI_NVDIMM / ACPI.

Fixes: 8045df14bcc ("microvm/acpi: add minimal acpi support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210616204328.2611406-23-philmd@redhat.com>
---
 hw/acpi/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1932f66af8d..cfc4ede8d91 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -42,3 +42,7 @@ config ACPI_VMGENID
     depends on PC
 
 config ACPI_HW_REDUCED
+    bool
+    select ACPI
+    select ACPI_MEMORY_HOTPLUG
+    select ACPI_NVDIMM
-- 
2.31.1


