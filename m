Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A84AAEA1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:43:11 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGe4d-0006Dr-0t
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzs-00009T-Je
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzn-0003dI-5k
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djZWuMgvZEcanxSuVKi0jq5sfyl2x4cIrvJR3neBz+A=;
 b=VhxJIlo9HbY6QrD3+4N3j60l43HOA9GVjvtprTuPMmH0NMpBWc0O+L4Q9SePrHKDzkkUyM
 TimZO4GxjexDv3iABCWkDSjtG0Ihe/gOh+1Rt0xY93SDR1w0B+XSvYEs1y4jfF6Nv03I1e
 iTliQDBQ/7WIlYIyzjt3kLN92mFI1RU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-sDS0FTHoPi6MOvsJJZ3QSg-1; Sun, 06 Feb 2022 04:37:54 -0500
X-MC-Unique: sDS0FTHoPi6MOvsJJZ3QSg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c4f0400b0037bb2ce79d8so1951558wmq.9
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=djZWuMgvZEcanxSuVKi0jq5sfyl2x4cIrvJR3neBz+A=;
 b=XCTr29AVKhjjnSNQfI/Cf47kHd470PwMcwqAoMnETL1i/GCd6KbbD4SKUgK51AeMCR
 2Z7oiF6GQ85LdYwI4/KZjhdjKpHG1x4DNN0/rng1WL/HypR5mk6y+1FDT9wwZ9flXXk8
 wDXn7yJnwWxFC7gR8m2LBZ1nwbdJXttUblZkIFx/qCSrQ+QAL7IV4YeHvfsc3KD3OTp8
 +Eo70yNv6l/W9Qn/WhjfzSpI+YU0NWMJYK4u5FyrlaB13l28KCeIAsY79FNXGyqTtb+f
 B8x49nK30hOCVCvXCIr4Jw3iESup3+hODAiyWe+i3SvSGlldrCxefsNHsX5Tva51CtzO
 tImQ==
X-Gm-Message-State: AOAM530lFLPBZSEKkuWRkS0JvAO7rkGFa/SmWQzOUL8m46O7FTAUjIeh
 J+xaRRqicLo788yw9TxhSGRF+mlDOHKfbWazqHCRRIc8BfpYITsJPSGa+tlooxfqqjmt9I6Tcy6
 /Nv6c7ysXgRGTkYyWHc/4nlEGbSrOmTQh4TrtY/3Gk9vkxOi6HW6y27V2HZ5k
X-Received: by 2002:adf:eb05:: with SMTP id s5mr5934204wrn.298.1644140272971; 
 Sun, 06 Feb 2022 01:37:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5MxbZoHnBjb3rlieL3eSYbIOyVpnUWPU2Fbrxu2Lrz3rydC9lafWoRnbqYGcllMTTRJZx6w==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr5934184wrn.298.1644140272763; 
 Sun, 06 Feb 2022 01:37:52 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id n8sm5896605wmk.18.2022.02.06.01.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:37:52 -0800 (PST)
Date: Sun, 6 Feb 2022 04:37:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/24] hw/i386: Add the possibility to disable the 'isapc'
 machine
Message-ID: <20220206093702.1282676-3-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We already have a CONFIG_ISAPC switch - but we're not using it yet.
Add some "#ifdefs" to make it possible to disable this machine now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220107160713.235918-1-thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_piix.c        | 5 ++++-
 tests/qtest/cdrom-test.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7c7790a5ce..d9b344248d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -357,10 +357,12 @@ static void pc_compat_1_4_fn(MachineState *machine)
     pc_compat_1_5_fn(machine);
 }
 
+#ifdef CONFIG_ISAPC
 static void pc_init_isa(MachineState *machine)
 {
     pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
 }
+#endif
 
 #ifdef CONFIG_XEN
 static void pc_xen_hvm_init_pci(MachineState *machine)
@@ -916,6 +918,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
     pci_config_set_revision(bridge_dev->config, pch_rev_id);
 }
 
+#ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
@@ -935,7 +938,7 @@ static void isapc_machine_options(MachineClass *m)
 
 DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
                   isapc_machine_options);
-
+#endif
 
 #ifdef CONFIG_XEN
 static void xenfv_4_2_machine_options(MachineClass *m)
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index cfca24fa94..fdd889a487 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -138,7 +138,7 @@ static void add_x86_tests(void)
      * Unstable CI test under load
      * See https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05509.html
      */
-    if (g_test_slow()) {
+    if (g_test_slow() && qtest_has_machine("isapc")) {
         qtest_add_data_func("cdrom/boot/isapc", "-M isapc "
                             "-drive if=ide,media=cdrom,file=", test_cdboot);
     }
-- 
MST


