Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ACE5796C5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:54:42 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDjw8-0003OR-U9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjth-00062L-Ot; Tue, 19 Jul 2022 05:52:09 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjtf-0003tB-9T; Tue, 19 Jul 2022 05:52:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d8so861588wrp.6;
 Tue, 19 Jul 2022 02:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgFp5zOF42tjkuFZIymPuUiFCLe5D4wT6/F4dB5zLnI=;
 b=X31CtW4S9pnuMfJ7EG616ZkHEbyEw/JNqTVlchb5/hv+YsfTEm0LlznZklB72POemr
 maOcG3bhSuQBH+U/GkRPTql53ybUDWsstQ6+QYYXuRoE9XgI4GC7r5qeGcaKfCYCXa2j
 vuFjmDbjtkxKw4Hd+r0izq1kzJUCmfsUUONGxOia/WR9tRjYs0NR7Lm9WZ80NnKq0RUT
 sXPmID9HshDXu7YrlD6H8IyW+yGu4DVWHkQaz4BG77LYuoYgl0oZhpUXgtFM+QbzoF7G
 SwFqsJ1oKAaHYkZSdi8sveEqifkPs8E1gegJqeVO+P+Sv+2RVAPIXPycK2+NCC3KJ58c
 D3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IgFp5zOF42tjkuFZIymPuUiFCLe5D4wT6/F4dB5zLnI=;
 b=fCI9WtpsyIAlVPKbwBBSCuNucrSgksmSKvC3cP/RrsMEzavPvk5uzFThBkNo0+JYUK
 sxo0R50YLw/UZbTosIPOanEjofsVr7eVNbEOQW9TYvTUsxU8Iw3vpFD3OEy/G9rE45fF
 YvNkdQeOK4evWUzDqf2ZdjoERW0Iwzk281vldEegAXIBPMV2B8L1WA8wgPYOSkZ0+rGu
 7gdmGbQgcqYY+4zJifiOF1YnIl8KBRcD1T3g51SBQIZt2nRUpFKLuYBYC7O0WF43cTP6
 EzuGfqrDDWbU9C0y6mzzMeot6dHp2t4olEYylRmwYPzPt9xWfm8i4GrDx/jnu0Hfpmr6
 7UVQ==
X-Gm-Message-State: AJIora8ziJAmzsuoflbv8wo1q4sozpl+Z8CsFftudTfR5GlkptZkjwcl
 +bSM03ZEiMdruSBLDvGugRo=
X-Google-Smtp-Source: AGRyM1vlLsaFTARcB98tU7E2nrdFmMoLu7u6cDA4fTr3TwtN/nlCue4eLHTsC9MHWHDqZRNds0M++g==
X-Received: by 2002:a05:6000:1a8d:b0:21d:9055:96a6 with SMTP id
 f13-20020a0560001a8d00b0021d905596a6mr25152762wry.245.1658224324730; 
 Tue, 19 Jul 2022 02:52:04 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 p42-20020a05600c1daa00b003a30f84a9aasm13792654wms.26.2022.07.19.02.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:52:04 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 4/8] tests: acpi: q35: update expected blobs
 *.hmat-noinitiators
Date: Tue, 19 Jul 2022 10:49:46 +0100
Message-Id: <20220719094950.1049516-5-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brice Goglin <Brice.Goglin@inria.fr>


expected HMAT:

[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
[004h 0004   4]                 Table Length : 00000120
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4F
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[02Ah 0042   2]                     Reserved : 0000
[02Ch 0044   4]                       Length : 00000028
[030h 0048   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[032h 0050   2]                    Reserved1 : 0000
[034h 0052   4] Attached Initiator Proximity Domain : 00000000
[038h 0056   4]      Memory Proximity Domain : 00000000
[03Ch 0060   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
            Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4] Attached Initiator Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4] Attached Initiator Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[090h 0144   8]                    Reserved3 : 0000000000000000
[098h 0152   8]                    Reserved4 : 0000000000000000

[0A0h 0160   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Raw Table Data: Length 288 (0x120)

    0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT ....OBOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
    0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  // ....(...........
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ............(...
    0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  // ....@...........
    00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  // .........'......
    00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  // ................
    00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  // ....@...........
    00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ................
    0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  // ................

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
 tests/qtest/bios-tables-test-allowed-diff.h   |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d904d4a70ddecbb79a83a267af8e26f925e9f4c6 100644
GIT binary patch
literal 144
zcmZ<^@N}NQz`(%h?d0$55v<@85#X!<1dKp25F11@Fg*ANra6G>KwJ(+MhMNs1fiLk
tK{O)|Nb<lx5Xr;^#2^NU#mWk#c|j~rP8f>|r~o3y%?)O;u>A)b0RWi;3;_TD

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..c767d11cb1d088f613c49e55a7139cccababf66c 100644
GIT binary patch
literal 8553
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
E0Xe$wY5)KL

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6494d11b9fff54f8c403ec9e4893fdff72bde9c9 100644
GIT binary patch
literal 288
zcmaJ)F%Ezr5IZ0&Og@24pP{g@7)*5VIX>Ms;S4dxCU-4Odz5uKq7kt*)m-+N&Mij(
zmQa%w6GZ=3|IM0X_Ak#IabYaQ2iTvR&x~t&7@Gj;A7o|>w!;|gr;lRa*AB0!)_xEV
I&r86*0dKzu0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a11d3119ab3538d9cf821a4fe0fccb0f1dc96359 100644
GIT binary patch
literal 312
zcmWFzatyIxWME)?>E!S15v<@85#X!<1VAAM5F12;FdPVA@EK9%8JW=d%*cF34Y)~A
u1{YiayE>qSVDJGh4QBww88zTMCa6LfjpA-b4Y)81R2_^)QwNnLKmh<Kp$P#1

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 245fa66bcc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
-"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
-"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
-"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
-- 
2.25.1


