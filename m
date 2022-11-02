Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7596616881
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGM8-00057i-F9; Wed, 02 Nov 2022 12:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLU-0003Th-Ut
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLP-0003rN-Bp
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LoRWgXZnJl5wTyyG8LpcfJKDITqhbgcLm6vI6YmaZ9M=;
 b=T8EthTO+yVohRjwbuL9pEF7zRYFP+7iJLsM331AHwHlzKFh6lImUHcinyC/EnTyNAL/ytp
 fY9kVxOisNS8RP2KGjB2UYsRtRSkgoRHrNoqhLHu5YJQhLbK7egMeW9/C8AKQh4Li6H40T
 SkOuXqdZQaiblIqx23YPtsWBCS1pL/A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-w8v0mDxtNxOjZSGp0_2lvw-1; Wed, 02 Nov 2022 12:11:55 -0400
X-MC-Unique: w8v0mDxtNxOjZSGp0_2lvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso8096542wmb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoRWgXZnJl5wTyyG8LpcfJKDITqhbgcLm6vI6YmaZ9M=;
 b=kY4INA9NtVFNncHUW+Jy3ACOd/QI09Z2QtQ6pb3JvDsqruDayI7ZIpgO9nObC0CbUX
 RipXZBbKEZ6wipoewixMdX9q1FYtF6dsWQkNbhLKhFo9cv57R3kqIpE8UUlHFWjp/wsA
 Q2S8Ku0gZJ/wrWlcwOh155UmjVlPRZLm0ovFZbbQI2EnxR1taDnCVe3sb6WhI2r/qzrU
 M86JTDYvuLpSCAkEHRM2p1jQPyiG+bXKQGZ9CKgbgXGB3cEpIt3pFSC6uzAxP1wXhqfd
 z7UZ4sraBPOrmWe0W6gTrmejE7XeQwyTzD6wXbw8BLHPPaOfSztOlMgUiDelA5UwmSq2
 QuPw==
X-Gm-Message-State: ACrzQf1dOKtW7SN9iEGlMW68dg3mOKH3Kl8d4einZz3dbm/gSZXrj5/N
 mOEaqJOt6g0b5zfn677FpUjf6k8A5Nfendk6e1iNY0KGAwOP3eEgPN6jfNQWsRphUQfC87Sxs7G
 zNoEUd5M3X+ZDPIk/MzD8ZySF7rGEHJlVxpJg+qi7obiKBRg2nEVk0dyiD6VM
X-Received: by 2002:adf:ffc2:0:b0:236:61e8:de52 with SMTP id
 x2-20020adfffc2000000b0023661e8de52mr15971777wrs.59.1667405512002; 
 Wed, 02 Nov 2022 09:11:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Kn+z7DP6kApTmHbMx8kvijR4ZSidECJIbZxJvSbIlI1rsMXTkn5ddHA/6P9GVyUI2nDOuXg==
X-Received: by 2002:adf:ffc2:0:b0:236:61e8:de52 with SMTP id
 x2-20020adfffc2000000b0023661e8de52mr15971731wrs.59.1667405511572; 
 Wed, 02 Nov 2022 09:11:51 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003cf47fdead5sm2467459wmq.30.2022.11.02.09.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:51 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 72/82] tests: acpi: q35: add test for hmat nodes without
 initiators
Message-ID: <20221102160336.616599-73-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: permerror client-ip=216.145.221.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221027100037.251-4-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ee6b1b483d..669432585b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1543,6 +1543,54 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
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
 #ifdef CONFIG_POSIX
 static void test_acpi_erst(const char *machine)
 {
@@ -1906,6 +1954,8 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
             qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
             qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+            qtest_add_func("acpi/q35/acpihmat-noinitiator",
+                           test_acpi_q35_tcg_acpi_hmat_noinitiator);
 #ifdef CONFIG_POSIX
             qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
 #endif
-- 
MST


