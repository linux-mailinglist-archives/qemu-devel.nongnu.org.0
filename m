Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9103154626C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:41 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzazU-0005Bh-Lv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYU-0002e1-Q2
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYT-0006T8-5u
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L61B+iVPlX7SkWGOWZhE2yVC/NfYKFF+RYS5CqMawVI=;
 b=Of1oD4NOgmsPsRZMAa4PWvW519HbjeJ9gJyBSihlp2kwaCuohVM6jLkaCZrfs/Wdo6Kn+7
 jwrjgOvBubMXKQY7r3ee0ZR4+3BzZ9qg3trYOpLHImivXFRbm4V76UN8FILR94LmFY+BSM
 zGoRCg2S3oiHQ8ZHxSNINd+2RvFQAj4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-QT5SXQF-N4-eZLbO9ucqRQ-1; Fri, 10 Jun 2022 03:59:39 -0400
X-MC-Unique: QT5SXQF-N4-eZLbO9ucqRQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so1223226wmb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L61B+iVPlX7SkWGOWZhE2yVC/NfYKFF+RYS5CqMawVI=;
 b=sR1iAxI0XnpPzPFIFNukl7BJX307T+osTRUSOfGNVctZAHhn5FalcH2IBltsqVMj7E
 QoOknl7lW3QsXe2aeHZEjSYrojyuuX16XG/5aNujvEGq7AnUGTbyxfObBGtAMvNpwHr0
 qCTpGvs4eYMrQSc5XM6UQoCTnl9Fz9131XAh/FIHuqvFm1rwCavkL3jdWOp8E+y2dFCj
 Xtg4PT33sUGZHe0AeDhYYKOK77K/tnphwFixvm7IL3/2S94ktfJDuATIn8Rlkjrf1/+W
 HCEWjqLNQkVANM2Tj84iQe2wEvsZT/Z+c31TNSGwJn2IopOo05euUIKsQra6+BxcMDXA
 P3JA==
X-Gm-Message-State: AOAM532uyXPdzk7VeU5WYG8NpJgT9RPi/XAG6JlKp1XRhI6IWMGlIifr
 U14sqzfEIgkmbYRIkUcKePptnfDDwUaas6MpTx208lRBTmu+jZFGJ1L4uNu2GGu5aTd3yc3Ujls
 8J6xpRUXyOaUEEpnLI/HM1Qzg4TK0L2FqkG7IvhvlO/8iMooTukD349W08d4i
X-Received: by 2002:a05:6000:2c6:b0:216:7691:5395 with SMTP id
 o6-20020a05600002c600b0021676915395mr31449885wry.478.1654847977114; 
 Fri, 10 Jun 2022 00:59:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu50PfiUC/XEW0ruQXfM1Kr6b1/0kakobD+tQpaz+sNptMOzi2n8OPxFii4wVM9tYe7rFXVw==
X-Received: by 2002:a05:6000:2c6:b0:216:7691:5395 with SMTP id
 o6-20020a05600002c600b0021676915395mr31449857wry.478.1654847976795; 
 Fri, 10 Jun 2022 00:59:36 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 d14-20020a5d6dce000000b0020c5253d927sm26884766wrz.115.2022.06.10.00.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:36 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 51/54] tests/acpi: virt: update golden masters for VIOT
Message-ID: <20220610075631.367501-52-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Differences between disassembled ASL files for VIOT:

+++ /tmp/asl-V69GM1.dsl 2022-05-18 10:22:27.239796759 +0100
@@ -36,11 +36,11 @@
 [041h 0065   1]                     Reserved : 00
 [042h 0066   2]                       Length : 0018

-[044h 0068   4]               Endpoint start : 00003000
+[044h 0068   4]               Endpoint start : 00001000
 [048h 0072   2]            PCI Segment start : 0000
 [04Ah 0074   2]              PCI Segment end : 0000
-[04Ch 0076   2]                PCI BDF start : 3000
-[04Eh 0078   2]                  PCI BDF end : 30FF
+[04Ch 0076   2]                PCI BDF start : 1000
+[04Eh 0078   2]                  PCI BDF end : 10FF
 [050h 0080   2]                  Output node : 0030
 [052h 0082   6]                     Reserved : 000000000000

@@ -48,11 +48,11 @@
 [059h 0089   1]                     Reserved : 00
 [05Ah 0090   2]                       Length : 0018

-[05Ch 0092   4]               Endpoint start : 00001000
+[05Ch 0092   4]               Endpoint start : 00003000
 [060h 0096   2]            PCI Segment start : 0000
 [062h 0098   2]              PCI Segment end : 0000
-[064h 0100   2]                PCI BDF start : 1000
-[066h 0102   2]                  PCI BDF end : 10FF
+[064h 0100   2]                PCI BDF start : 3000
+[066h 0102   2]                  PCI BDF end : 30FF
 [068h 0104   2]                  Output node : 0030
 [06Ah 0106   6]                     Reserved : 000000000000

@@ -62,6 +62,6 @@
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 03 00 30 00 00 00 00 00 00 00 00 00  // ......0.........
     0030: 03 00 10 00 00 00 10 00 00 00 00 00 00 00 00 00  // ................
-    0040: 01 00 18 00 00 30 00 00 00 00 00 00 00 30 FF 30  // .....0.......0.0
-    0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 10 00 00  // 0...............
-    0060: 00 00 00 00 00 10 FF 10 30 00 00 00 00 00 00 00  // ........0.......
+    0040: 01 00 18 00 00 10 00 00 00 00 00 00 00 10 FF 10  // ................
+    0050: 30 00 00 00 00 00 00 00 01 00 18 00 00 30 00 00  // 0............0..
+    0060: 00 00 00 00 00 30 FF 30 30 00 00 00 00 00 00 00  // .....0.00.......

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220525173232.31429-7-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/VIOT.viot               | Bin 112 -> 112 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8367ffe1d4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/VIOT",
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index 9b179266ccbf84f1c250ee646812d17e27987764..275c78fbe8e93190321d957c91c3f17551f865d4 100644
GIT binary patch
delta 10
RcmXRYnBY1wR(PU=1OOI`1E2r^

delta 10
RcmXRYnBY1wR(PU=1OOI`1E2r^

-- 
MST


