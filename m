Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D0459BC71
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:13:22 +0200 (CEST)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3Un-0001Yf-FM
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3NC-0005WM-M1
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3N9-0006w5-1Y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:05:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id pm13so1384078pjb.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Azz5vk6wDfR35ZT3qWrT07xO9midi17bTkTu9HXEiMM=;
 b=z/J2Lxw6+eTvhWISLcb7ZLucj1r3IWzLEenzqK4y7Q/WJhuHb2BO61fKfYll4WB2Hj
 2cYsoSvyOi/uh5X7tAyc6duwHoPLvSBx39VtWKtiz8I0JRe5SSuC1pQyAIKjH/jRjZpL
 mzcvAIeQG58yR1T+ZLjT9VmVg3WPdQblwjUdpGXUNCYKA1UOyPxvqtsOHU50j/eKCbKe
 fHIKhzGy9z+F85PlWoUvqastSPrEYs6Z1XCQ2MC8ludJywid771FtxyT3VfYIWgFiKqV
 W3QFbyOI0MFIFaF+nOyjjSmaOttTzH4Qp6iesq3Tfnd1TYp2Gn5xCTX+gNETMtGYdmCP
 m7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Azz5vk6wDfR35ZT3qWrT07xO9midi17bTkTu9HXEiMM=;
 b=JDoBYaBF94c2tumLIOtiwjvVXevrj0ZDhd4Lmqp6LxIadS5l2yy0YzCRw3RNkhRB39
 TC5v0q5/Pk06mql4cytv+8YTS47d2WbhX6sBHuqWxgN2o0frjm5DBIQNBLOmNtxQJbiM
 NNF33ytbT5k0Wh2Q13kGw6gmu8DtwYlrf12XJsxoqkzYpRUGIs+wYaVUeqtJ6VoKyJaa
 u5GHjkMV4+UJnN8s/ws8VPK0O76hiKTtbR/W0oj/6CAgeMEjfMZTHh4pdgwH821RFFX4
 oLOOse5B6xvz4k1f2MLSE/5Z5meFgfsP0LzuyaqKfv62kjH9mz+DltKlElxhzI5X7QLD
 Z8sw==
X-Gm-Message-State: ACgBeo35YiIFf4Qz4YBoSSteeCAmX5Thg/Wm3GqHbUEN/aYI4KFUEgBu
 Vkv+u2LbPg7gfCfzJXIyrxK37r6boF9kAA==
X-Google-Smtp-Source: AA6agR64KvSC1C3hJnTmpEAeamQ6c1ah00kRd8c8w6yAjF+vcS1r8SdLS9C0vDPXUIKqP9PCIZToaw==
X-Received: by 2002:a17:902:cecd:b0:172:fa5b:2ec6 with SMTP id
 d13-20020a170902cecd00b00172fa5b2ec6mr62912plg.163.1661159125405; 
 Mon, 22 Aug 2022 02:05:25 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 n34-20020a635c62000000b0041c3ab14ca1sm7015428pgm.0.2022.08.22.02.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:05:24 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 3/4] tests/acpi/bios-table-test: add pcie root port device for
 DMAR test
Date: Mon, 22 Aug 2022 14:34:37 +0530
Message-Id: <20220822090438.426748-5-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090438.426748-1-ani@anisinha.ca>
References: <20220822090438.426748-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
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

In the previos commit, we are explicitly adding scopes for pcie root ports in
Root Port ATS capability reporting structure. We add a pcie root port in the
QEMU test command line for DMAR tests so that we can verify that the scope of
the root port has been correctly added and structure looks sane.

After the changes, the above structure will look like this:

+[078h 0120   2]                Subtable Type : 0002 [Root Port ATS Capability]
+[07Ah 0122   2]                       Length : 0010
+
+[07Ch 0124   1]                        Flags : 00
+[07Dh 0125   1]                     Reserved : 00
+[07Eh 0126   2]           PCI Segment Number : 0000
+
+[080h 0128   1]            Device Scope Type : 02 [PCI Bridge Device]
+[081h 0129   1]                 Entry Length : 08
+[082h 0130   2]                     Reserved : 0000
+[084h 0132   1]               Enumeration ID : 00
+[085h 0133   1]               PCI Bus Number : 00
+
+[086h 0134   2]                     PCI Path : 02,00
+
+

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7c5f736b51..dc79eafbb5 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1141,7 +1141,8 @@ static void test_acpi_q35_kvm_dmar(void)
     data.machine = MACHINE_Q35;
     data.variant = ".dmar";
     test_acpi_one("-machine kernel-irqchip=split -accel kvm"
-                  " -device intel-iommu,intremap=on,device-iotlb=on", &data);
+                  " -device intel-iommu,intremap=on,device-iotlb=on"
+                  " -device pcie-root-port,bus=pcie.0", &data);
     free_test_data(&data);
 }
 
-- 
2.25.1


