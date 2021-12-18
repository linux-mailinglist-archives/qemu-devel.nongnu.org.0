Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1E479BB9
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 17:15:31 +0100 (CET)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mycMs-0006eY-2S
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 11:15:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycHC-0001O6-Jj
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mycH7-0001Fv-FD
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 11:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639843772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZLLuHODOVtMhLOmlPDrG/zfRVSd45IQnERlOjWYvas=;
 b=gjxvLhGqSlroR5C+Y/kVYCY2ckP6FVHlmcN41yNVW0dv97rQH+Daz7Ffn4LG3dxw8JR3Zc
 fqtxB/RIrbRJt3sNyOP+jnbCTqvr8/91PpIJVsFzyguh2Vp4K5Bb7YFACnSsjYgngreON+
 Dq9A7WsDNeNZV98BmGJWl6hrHpxL7JA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-EmTd8TF9NHmZEZSSTQiABA-1; Sat, 18 Dec 2021 11:09:31 -0500
X-MC-Unique: EmTd8TF9NHmZEZSSTQiABA-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so2532701wmb.4
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 08:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZLLuHODOVtMhLOmlPDrG/zfRVSd45IQnERlOjWYvas=;
 b=sw5fxSySmXVdqOYLooCpKI4KFAqC7C67Q+Esa1PQaWiwLHHrQIoklx5kGk39+89bO8
 tIjlXQWPPoc2OLnKpkOgJCGKYA95j1IvjBU588W+w0RiMz67qzp/e7fVyr/4uWIb9A/0
 f9D9lu6n5LfHz1chdTnVsTWYnwalR/XtBc9+6BEs8GXpDjZh+e/3Nq2I0mAQtsH9QkFq
 +ge+r2nuyMuzqjTMGoipjeZA8hL0/PlxNtod5F6OX5ygLqVSMrqKBWLL86htsyQe2q/N
 c4o5n+N3Zs2+69KIuij6zSjVETD2oypWaU4pfAzjqhYbGbWsSG25iPqnS/ngwTtqTci8
 SchA==
X-Gm-Message-State: AOAM531mUtezrV4XAutiIarDxRhqYTU30Imjb6o/UzO2ECC3K/eQb/z+
 WndWh8SIewu05zMmYaUG4Y286nZVbH2qy0CnxNMsoFHN0O1NzcVrvVIRwhQsfYVDrR1xVCsZCfO
 bqh6iswqlxwP2vOZbmhixpho+BE6lEnC3o9DKHu7uoRrc92xO3i8h6ajljtaW//KQ
X-Received: by 2002:adf:c10e:: with SMTP id r14mr6754497wre.558.1639843770383; 
 Sat, 18 Dec 2021 08:09:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV0Q8eVxVaJaRWWfXlcaGLDWvjAxh0d+CSuVEv7p8MtpoE3df6WB3U5XeDOscbWdhOhApZPA==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr6754473wre.558.1639843770140; 
 Sat, 18 Dec 2021 08:09:30 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id k6sm8432876wrc.38.2021.12.18.08.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 08:09:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/3] tests/qtest/intel-hda-test: Add reproducer for issue
 #542
Date: Sat, 18 Dec 2021 17:09:12 +0100
Message-Id: <20211218160912.1591633-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218160912.1591633-1-philmd@redhat.com>
References: <20211218160912.1591633-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Thomas Huth <thuth@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include the qtest reproducer provided by Alexander Bulekov
in https://gitlab.com/qemu-project/qemu/-/issues/542.
Without the previous commit, we get:

  $ make check-qtest-i386
  ...
  Running test tests/qtest/intel-hda-test
  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==1580408==ERROR: AddressSanitizer: stack-overflow on address 0x7ffc3d566fe0
      #0 0x63d297cf in address_space_translate_internal softmmu/physmem.c:356
      #1 0x63d27260 in flatview_do_translate softmmu/physmem.c:499:15
      #2 0x63d27af5 in flatview_translate softmmu/physmem.c:565:15
      #3 0x63d4ce84 in flatview_write softmmu/physmem.c:2850:10
      #4 0x63d4cb18 in address_space_write softmmu/physmem.c:2950:18
      #5 0x63d4d387 in address_space_rw softmmu/physmem.c:2960:16
      #6 0x62ae12f2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #7 0x62ae104a in dma_memory_rw include/sysemu/dma.h:132:12
      #8 0x62ae6157 in dma_memory_write include/sysemu/dma.h:173:12
      #9 0x62ae5ec0 in stl_le_dma include/sysemu/dma.h:275:1
      #10 0x62ae5ba2 in stl_le_pci_dma include/hw/pci/pci.h:871:1
      #11 0x62ad59a6 in intel_hda_response hw/audio/intel-hda.c:372:12
      #12 0x62ad2afb in hda_codec_response hw/audio/intel-hda.c:107:5
      #13 0x62aec4e1 in hda_audio_command hw/audio/hda-codec.c:655:5
      #14 0x62ae05d9 in intel_hda_send_command hw/audio/intel-hda.c:307:5
      #15 0x62adff54 in intel_hda_corb_run hw/audio/intel-hda.c:342:9
      #16 0x62adc13b in intel_hda_set_corb_wp hw/audio/intel-hda.c:548:5
      #17 0x62ae5942 in intel_hda_reg_write hw/audio/intel-hda.c:977:9
      #18 0x62ada10a in intel_hda_mmio_write hw/audio/intel-hda.c:1054:5
      #19 0x63d8f383 in memory_region_write_accessor softmmu/memory.c:492:5
      #20 0x63d8ecc1 in access_with_adjusted_size softmmu/memory.c:554:18
      #21 0x63d8d5d6 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #22 0x63d5e85e in flatview_write_continue softmmu/physmem.c:2812:23
      #23 0x63d4d05b in flatview_write softmmu/physmem.c:2854:12
      #24 0x63d4cb18 in address_space_write softmmu/physmem.c:2950:18
      #25 0x63d4d387 in address_space_rw softmmu/physmem.c:2960:16
      #26 0x62ae12f2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #27 0x62ae104a in dma_memory_rw include/sysemu/dma.h:132:12
      #28 0x62ae6157 in dma_memory_write include/sysemu/dma.h:173:12
      #29 0x62ae5ec0 in stl_le_dma include/sysemu/dma.h:275:1
      #30 0x62ae5ba2 in stl_le_pci_dma include/hw/pci/pci.h:871:1
      #31 0x62ad59a6 in intel_hda_response hw/audio/intel-hda.c:372:12
      #32 0x62ad2afb in hda_codec_response hw/audio/intel-hda.c:107:5
      #33 0x62aec4e1 in hda_audio_command hw/audio/hda-codec.c:655:5
      #34 0x62ae05d9 in intel_hda_send_command hw/audio/intel-hda.c:307:5
      #35 0x62adff54 in intel_hda_corb_run hw/audio/intel-hda.c:342:9
      #36 0x62adc13b in intel_hda_set_corb_wp hw/audio/intel-hda.c:548:5
      #37 0x62ae5942 in intel_hda_reg_write hw/audio/intel-hda.c:977:9
      #38 0x62ada10a in intel_hda_mmio_write hw/audio/intel-hda.c:1054:5
      #39 0x63d8f383 in memory_region_write_accessor softmmu/memory.c:492:5
      #40 0x63d8ecc1 in access_with_adjusted_size softmmu/memory.c:554:18
      #41 0x63d8d5d6 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #42 0x63d5e85e in flatview_write_continue softmmu/physmem.c:2812:23
      #43 0x63d4d05b in flatview_write softmmu/physmem.c:2854:12
      #44 0x63d4cb18 in address_space_write softmmu/physmem.c:2950:18
      #45 0x63d4d387 in address_space_rw softmmu/physmem.c:2960:16
      #46 0x62ae12f2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #47 0x62ae104a in dma_memory_rw include/sysemu/dma.h:132:12
      #48 0x62ae6157 in dma_memory_write include/sysemu/dma.h:173:12
      ...
  SUMMARY: AddressSanitizer: stack-overflow softmmu/physmem.c:356 in address_space_translate_internal
  ==1580408==ABORTING
  Broken pipe
  Aborted (core dumped)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/intel-hda-test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
index fc25ccc33cc..a58c98e4d11 100644
--- a/tests/qtest/intel-hda-test.c
+++ b/tests/qtest/intel-hda-test.c
@@ -29,11 +29,45 @@ static void ich9_test(void)
     qtest_end();
 }
 
+/*
+ * https://gitlab.com/qemu-project/qemu/-/issues/542
+ * Used to trigger:
+ *  AddressSanitizer: stack-overflow
+ */
+static void test_issue542_ich6(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-nographic -nodefaults -M pc-q35-6.2 "
+                   "-device intel-hda,id=" HDA_ID CODEC_DEVICES);
+
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x06);
+    qtest_bufwrite(s, 0xff0d060f, "\x03", 1);
+    qtest_bufwrite(s, 0x0, "\x12", 1);
+    qtest_bufwrite(s, 0x2, "\x2a", 1);
+    qtest_writeb(s, 0x0, 0x12);
+    qtest_writeb(s, 0x2, 0x2a);
+    qtest_outl(s, 0xcf8, 0x80000811);
+    qtest_outl(s, 0xcfc, 0x006a4400);
+    qtest_bufwrite(s, 0x6a44005a, "\x01", 1);
+    qtest_bufwrite(s, 0x6a44005c, "\x02", 1);
+    qtest_bufwrite(s, 0x6a442050, "\x00\x00\x44\x6a", 4);
+    qtest_bufwrite(s, 0x6a44204a, "\x01", 1);
+    qtest_bufwrite(s, 0x6a44204c, "\x02", 1);
+    qtest_bufwrite(s, 0x6a44005c, "\x02", 1);
+    qtest_bufwrite(s, 0x6a442050, "\x00\x00\x44\x6a", 4);
+    qtest_bufwrite(s, 0x6a44204a, "\x01", 1);
+    qtest_bufwrite(s, 0x6a44204c, "\x02", 1);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
     qtest_add_func("/intel-hda/ich6", ich6_test);
     qtest_add_func("/intel-hda/ich9", ich9_test);
+    qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
 
     return g_test_run();
 }
-- 
2.33.1


