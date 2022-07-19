Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8475796F7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 11:59:43 +0200 (CEST)
Received: from localhost ([::1]:51998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDk10-0004Hf-DP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 05:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjtC-0004v9-52; Tue, 19 Jul 2022 05:51:38 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <heshamelmatary@gmail.com>)
 id 1oDjt9-0003kq-Fu; Tue, 19 Jul 2022 05:51:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so8829712wmb.5; 
 Tue, 19 Jul 2022 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZDTyp1S6HEHLmFjsat/agY1zZrNf6qFg9Tltc3kKBw=;
 b=enFOmqAfTKzuzQOY+Ty5DLEG8UB2KS++ncfvpQQhRf70PsVQIlnnJAp5iyn9kJbpbF
 yg6+4fsjST+CHsfZCN/gp9CYZ8wsEFKAkAX2KWmF1ErIX2GZ93PMBM/6+i+5tD3SBmGB
 gvTbK5qdOSCoHRkqmiVgV6RWJ3j7AvZds7+2Dfd6GSwB7UcCbfadLwWLnD4omrruWsZn
 fFTbDk6IHB3tFHaZ8tplP+2o8oLHiVCY7mSl1JLtHIyyiijf46BSmRoF1q9oZ31UR9Jo
 RGrzDLdRLKtroLHy2SQ3BeghpXTqBasb27cadM0IjJZvr0tWwd8Ym+n2o+mwP5qoxALI
 GI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JZDTyp1S6HEHLmFjsat/agY1zZrNf6qFg9Tltc3kKBw=;
 b=af6MzocwbgFZwnIpEK6Zl6OgZ0paXObZf+XvLOJmnI/sSkuzpqY3Sq3lSnu4BVkz0v
 YsFRenA6P/wbMVuLYzLIIDM7zum+c5gF8Jx67l93odK0tBeSLMZdSSsc67TKpeVLPHTw
 XYUUkHnnUhCOGP6Q4Nq0gL6J2CkWp8iYyWQRTDYsrzqRIEurc8i51nR2J4kvHIeeG6tU
 ZcfVYsAiBEPK4VGEURDuhoqg/uStDNvc/o2X8rz8YDinMO8oLM32jrURRR4188vUn+tA
 MHcLzOWjviV+gHhUQZXeKak9n9vRS5egjF7Vg4ScR3TcCUeBUYUFpwV2k/3BbphNZESB
 FA3g==
X-Gm-Message-State: AJIora+OmeBYTKUqMYUbTI5gk+jPLDk9C3GAYIjgAGRTgTKz/s12t9bg
 R9KxR28UBb86J6GUcR+ETaI=
X-Google-Smtp-Source: AGRyM1u3u35DZmB5V7Vvyxtnth0lrxg8+E9GB9c32JHnCdEPtYjs0vu29MGFW6hgnbxVZ2UmKHhjbA==
X-Received: by 2002:a05:600c:211:b0:3a3:194d:7282 with SMTP id
 17-20020a05600c021100b003a3194d7282mr9866227wmi.132.1658224293460; 
 Tue, 19 Jul 2022 02:51:33 -0700 (PDT)
Received: from localhost.localdomain ([86.188.218.117])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b003a31fd05e0fsm3487735wms.2.2022.07.19.02.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 02:51:33 -0700 (PDT)
From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
X-Google-Original-From: Hesham Almatary <hesham.almatary@huawei.com>
To: jonathan.cameron@huawei.com,
	qemu-devel@nongnu.org
Cc: yangyicong@huawei.com, chenxiang66@hisilicon.com, linuxarm@huawei.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 wangyanan55@huawei.com, marcel.apfelbaum@gmail.com, eduardo@habkost.net,
 Brice.Goglin@inria.fr, mst@redhat.com, jingqi.liu@intel.com
Subject: [PATCH v2 3/8] tests: acpi: q35: add test for hmat nodes without
 initiators
Date: Tue, 19 Jul 2022 10:49:45 +0100
Message-Id: <20220719094950.1049516-4-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719094950.1049516-1-hesham.almatary@huawei.com>
References: <20220719094950.1049516-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=heshamelmatary@gmail.com; helo=mail-wm1-x32a.google.com
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
 tests/qtest/bios-tables-test.c | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 359916c228..db14908bb4 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1461,6 +1461,54 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".acpihmat-noinitiator";
+    test_acpi_one(" -machine hmat=on"
+                  " -smp 4,sockets=2"
+                  " -m 128M"
+                  " -object memory-backend-ram,size=32M,id=ram0"
+                  " -object memory-backend-ram,size=32M,id=ram1"
+                  " -object memory-backend-ram,size=64M,id=ram2"
+                  " -numa node,nodeid=0,memdev=ram0"
+                  " -numa node,nodeid=1,memdev=ram1"
+                  " -numa node,nodeid=2,memdev=ram2"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_erst(const char *machine)
 {
     gchar *tmp_path = g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
@@ -1803,6 +1851,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
         qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+        qtest_add_func("acpi/q35/acpihmat-noinitiator",
+                        test_acpi_q35_tcg_acpi_hmat_noinitiator);
         qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
         qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
-- 
2.25.1


