Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C305E355571
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:41:42 +0200 (CEST)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTlxd-0006FU-S1
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTlvt-0005XG-V7
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTlvr-0007o9-I9
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617716390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PIo2bUtEV+ltcwMSsfh85ITODKunH+9eCcWMQh7XGFg=;
 b=EJmYlm0m/ucFEcxMhb591ZhkVfmTAyNFWwpJVQJNtdpvl5KN6daXqZQEQ1/CG11wVv1ffd
 ibDUgC7UQG1ccp/rBvffQ8Zg85SmE45CmO855dM1YeXCaMOduZgoyfsdjvOm9wOAs1w22v
 W2L0ysg+arMRYqSFaFDTb4nXMaFRuIU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-tQi2CWWENASvbmOZdD_GVw-1; Tue, 06 Apr 2021 09:39:48 -0400
X-MC-Unique: tQi2CWWENASvbmOZdD_GVw-1
Received: by mail-ed1-f71.google.com with SMTP id a2so10416368edx.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 06:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PIo2bUtEV+ltcwMSsfh85ITODKunH+9eCcWMQh7XGFg=;
 b=BoSsnaiK0hi2h04UiX63scf9qvc7EBzJmlQYceDkVXuQ9y4ehSUC7ZQr1zLgtyBU0m
 PC+tV/cPhSTTsU4G+Uy4g3JCJ4VrjMAAbe3W7QhGGAI2MKIYQeVPD6yXMTUReDc6kGko
 kPZNqOtSm0Rp65KxQ9k0uDPj+XPWv1qfjltKZnXfozTDPe5Ihm/x6OsUTZa9ijbRHMNR
 ufuj+PJ+cd6tap44NyFkff21srA/Jo5wBLjWjl+Nd+clWXY+swKFn4rmOTiaDfppqA4N
 tnxdI2cTM2LqlIFGiwbvM/tqcbBBYbvJCeXgfPSL9fMwUTvMrWpaKYEaD31TsrDhcjSA
 TQag==
X-Gm-Message-State: AOAM530COudq9VLFv95Lm4aqpo+wbY475V4uyx+6DrHxQQMBadR2rr2Y
 LY2bo8sLFLMyX4VJF5Q79PJAG18FwTnLBNA4am448Be1M/9X95rmaeF6GEeqyNPbnjINCXI2tCV
 l2tyQuvavNi6pmLMwWlDVucIhV3DcLKCTz5K9NdlNQrNb8TsTpvOiOWoQ9j6gQIMu
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr7653615ejd.359.1617716387174; 
 Tue, 06 Apr 2021 06:39:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlkugmCZ0VE57OMRrehrcS/E6dae4qJaTK5g2g9DfSSI4E592kgrVfaAt4/eu95N1KaDETXw==
X-Received: by 2002:a17:906:813:: with SMTP id
 e19mr7653579ejd.359.1617716386896; 
 Tue, 06 Apr 2021 06:39:46 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id jt18sm4883029ejc.96.2021.04.06.06.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 06:39:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
Date: Tue,  6 Apr 2021 15:39:44 +0200
Message-Id: <20210406133944.4193691-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sparse-mem.c is added to the 'mem_ss' source set, which itself
is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
selected.
But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
even if CONFIG_FUZZ is selected:

  /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
  tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
  clang-10: error: linker command failed with exit code 1 (use -v to see invocation)

Fix by adding sparse-mem.c directly to the softmmu_ss set.

Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mem/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index ef79e046787..3c8fdef9f9e 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,8 +1,9 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
-mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
+
+softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
-- 
2.26.3


