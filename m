Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5856D066
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:16:42 +0200 (CEST)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaXy-000353-2N
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJI-0006ih-VM
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJH-0003PQ-Dm
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so6244355pjn.0
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSt/KXB+QPkzcqJElYbGV0pOi+RhJBmDL7INxYmtHuA=;
 b=TyFdSvtxMNHFHDdBnSfwXoLCi3YALB88GGR8N3O5aURQwLIj63HNp93cI+tNTV+j//
 8Ou5wbxfT3ixr/QX699P+YGct/WbEIF0+19+s0UcZvsX+oywpcwur0zIxoRaqsRjH/KC
 9Ywl2stp0dRgQ9fCwC6D0794FS3Z5Fj8WmLaKp9pjSFKO1gXTDQduSG8Gp9rgZG/ypFk
 ZoLWh+GHU+ExGkAROvNsTnzkwE3PtMI1F5xdYjFovRWRE1XBJ+HdtAr++E5eMfj6yFAh
 LgiiqbqFuz88fejFq+qotpLGKRvsbdCUWZvaltrBZksoqpl5CU7+Nk0AfdeUni2m7AVw
 T8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSt/KXB+QPkzcqJElYbGV0pOi+RhJBmDL7INxYmtHuA=;
 b=V1YFfD3sL1tYzMxd03bQM9iAaT6qYelMA5eegY10qnY8BD9Y4gE3ZXwuSJ+VwKQ7BW
 L5gM1m5toyKG3NK7Tw3SRFGC3+U3GnrdnDN8J3fgBD4wX+3he2RFBHfYY6yrHMftFCKE
 3o9eY6msOzQHpE5w+kE8MUjpIF6i16qYrtz2PyazCRVrt/J2AsmX71urlz2HdQxY7sss
 ZOrIdaJW3S3Axk5aD1JH409/zAn8Mq7lx/g0LkIvy7BwMNdSAzMRpXsh3835it0jU1ck
 y+IVGrf9rZ3AAoNa4Xpd096o+GnxPgS1lyDhkFKrGzzqda20ZIwURE6M3e+BbrWKTFK5
 Dukw==
X-Gm-Message-State: AJIora/nYOYyugLuLrpExDnCP5et23RXCL/dfiw7W4qZqbVYnIDgaYrS
 2m/V2+6Y8dgyzMhxvM4A6OsK4lsDxzoVRAAo
X-Google-Smtp-Source: AGRyM1snbJCAcXRXQ9SqFkyQkFK1DytjrAdak7VO1E+tz69GpG6QtAX657if/P9pdY4X9oWBxYPVrw==
X-Received: by 2002:a17:903:1104:b0:16c:2f71:7803 with SMTP id
 n4-20020a170903110400b0016c2f717803mr9837373plh.101.1657472489945; 
 Sun, 10 Jul 2022 10:01:29 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:29 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 06/11] acpi/tests/bits: disable smilatency test since it
 does not pass everytime
Date: Sun, 10 Jul 2022 22:30:09 +0530
Message-Id: <20220710170014.1673480-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

smilatency test is latency sensitive and does not pass deterministically when
run in QEMU environment under biosbits. Disable the test suite for now.

Example failure:

==== SMI latency test ====
Warning: touching the keyboard can affect the results of this test.
Starting test. Wait here, I will be back in 15 seconds.
[assert] SMI latency < 150us to minimize risk of OS timeouts FAIL
  1us   < t <=  10us; average = 1372ns; count = 10912449
   Times between first few observations:  176us 1646ns 1441ns 1450ns 1462ns
  10us  < t <= 100us; average = 16us; count = 1187
   Times between first few observations:   15ms 3148us 5856us   49ms   33ms
  100us < t <=   1ms; average = 259us; count = 8
   Times between first few observations:  111ms 2227ms 1779ms  999ms  219ms
  0 SMI detected using MSR_SMI_COUNT (MSR 0x34)
  Summary of impact: observed maximum latency = 298us
Summary: 0 passed, 1 failed

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/pytest/acpi-bits/bits-tests/smilatency.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/pytest/acpi-bits/bits-tests/smilatency.py b/tests/pytest/acpi-bits/bits-tests/smilatency.py
index 9b11623b2d..31d588fb18 100644
--- a/tests/pytest/acpi-bits/bits-tests/smilatency.py
+++ b/tests/pytest/acpi-bits/bits-tests/smilatency.py
@@ -35,8 +35,9 @@
 import usb
 
 def register_tests():
-    testsuite.add_test("SMI latency test", smi_latency);
-    testsuite.add_test("SMI latency test with USB disabled via BIOS handoff", test_with_usb_disabled, runall=False);
+    pass
+    # testsuite.add_test("SMI latency test", smi_latency);
+    # testsuite.add_test("SMI latency test with USB disabled via BIOS handoff", test_with_usb_disabled, runall=False);
 
 def smi_latency():
     MSR_SMI_COUNT = 0x34
-- 
2.25.1


