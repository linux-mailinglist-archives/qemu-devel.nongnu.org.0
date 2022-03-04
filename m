Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65394CD7E7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:33:40 +0100 (CET)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9w3-0004pz-RM
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:33:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9X4-0004ro-Ku
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:50 -0500
Received: from [2607:f8b0:4864:20::636] (port=36779
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ9X3-0003l3-4J
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:07:50 -0500
Received: by mail-pl1-x636.google.com with SMTP id e13so7978535plh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 07:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mt6B7mT4/5OJ0gJ2i6HNdOP8FrYBdmtR2VW9Nn/GzUA=;
 b=WaHXq+SrQC8WaqSDykRHbLhI4FBqTRlhKIyxmsB/iAhAa4sVja1fj5aPhdk9TCE4kK
 eqtNDfzV/x/F9YmCtGYO3y5zivTjQ24UMLM9JUsJG63h8rhggfzTeDQFPzse7KY0pa6i
 Mt4qdSLM2iRlh+wTrDIEVYT/EN0thVMFXRkCYj3nN78cAtIJVURdt5G6sZgMchulthLA
 0seNUmAqivCUiimWpvbSvhleg0rkMR+W0lXLn7Y6r+fCvWDbZTnAEHk3djAexzT2swZp
 XiCh/mQpGLX3ZlZ0+Wh8BwL5MoU7vJKQqFJIbzWXmHH2tBQVpZJbvp1nJRIvHjE7PdVi
 D84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mt6B7mT4/5OJ0gJ2i6HNdOP8FrYBdmtR2VW9Nn/GzUA=;
 b=DppvOFSu7JV9S5EHjhW1DikA4i1RBdfkINxY4FCnS3Qvct+/YVc5prPx67oC73QjrF
 4atobN7n95VEdnPmkcktmVwC/yWZuNqKhQbbUNwJu5pqQKxlXNP4C6zLVPhVBvFvaavK
 GHuG1S6a8epsQdrzCYubnb5YuESJ/lWlnlOQloTXhAvJFaijloM3Hyo5ZySsUdwGHKv2
 Q3F6vgEoKxpymVgJA1U3tv3yQe89ROcQu9YCZNImrpBiVWEVTb1APz/S873OWxycmoic
 9xyItimUOfPEKvS3U1r/0db/MziiPXx80JHWfZJObSHGNXwLnrVyXYoSlMRqdKm27lvy
 vMdQ==
X-Gm-Message-State: AOAM530Vn6pbLzv2R7HYcDYrVy0SKb2kdmqArFqYGG5R1DV6N2VSecaf
 vKQR1WcKkrTcF4bw0jvRRlbb+g/XO/3/aw==
X-Google-Smtp-Source: ABdhPJwyvpZTY+B0JcQEaTEnsRW7Dl1T3iBhEf3yXM7qYTq7ftE1LzPECwaebm9URqp0k4ndHBD0zg==
X-Received: by 2002:a17:903:24f:b0:14f:73fa:2b30 with SMTP id
 j15-20020a170903024f00b0014f73fa2b30mr41900043plh.174.1646406467550; 
 Fri, 04 Mar 2022 07:07:47 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.152.50])
 by smtp.googlemail.com with ESMTPSA id
 nr22-20020a17090b241600b001bef1964ec7sm8278861pjb.21.2022.03.04.07.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:07:47 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v6 3/4] tests/acpi: i386: update FACP table differences
Date: Fri,  4 Mar 2022 20:37:21 +0530
Message-Id: <20220304150722.2069132-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304150722.2069132-1-ani@anisinha.ca>
References: <20220304150722.2069132-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liav Albani <liavalb@gmail.com>

After changing the IAPC boot flags register to indicate support of i8042
in the machine chipset to help the guest OS to determine its existence
"faster", we need to have the updated FACP ACPI binary images in tree.

The ASL changes introduced are shown by the following diff:

@@ -42,35 +42,35 @@
 [059h 0089   1]     PM1 Control Block Length : 02
 [05Ah 0090   1]     PM2 Control Block Length : 00
 [05Bh 0091   1]        PM Timer Block Length : 04
 [05Ch 0092   1]            GPE0 Block Length : 10
 [05Dh 0093   1]            GPE1 Block Length : 00
 [05Eh 0094   1]             GPE1 Base Offset : 00
 [05Fh 0095   1]                 _CST Support : 00
 [060h 0096   2]                   C2 Latency : 0FFF
 [062h 0098   2]                   C3 Latency : 0FFF
 [064h 0100   2]               CPU Cache Size : 0000
 [066h 0102   2]           Cache Flush Stride : 0000
 [068h 0104   1]            Duty Cycle Offset : 00
 [069h 0105   1]             Duty Cycle Width : 00
 [06Ah 0106   1]          RTC Day Alarm Index : 00
 [06Bh 0107   1]        RTC Month Alarm Index : 00
 [06Ch 0108   1]            RTC Century Index : 32
-[06Dh 0109   2]   Boot Flags (decoded below) : 0000
+[06Dh 0109   2]   Boot Flags (decoded below) : 0002
                Legacy Devices Supported (V2) : 0
-            8042 Present on ports 60/64 (V2) : 0
+            8042 Present on ports 60/64 (V2) : 1
                         VGA Not Present (V4) : 0
                       MSI Not Supported (V4) : 0
                 PCIe ASPM Not Supported (V4) : 0
                    CMOS RTC Not Present (V5) : 0
 [06Fh 0111   1]                     Reserved : 00
 [070h 0112   4]        Flags (decoded below) : 000084A5
       WBINVD instruction is operational (V1) : 1
               WBINVD flushes all caches (V1) : 0
                     All CPUs support C1 (V1) : 1
                   C2 works on MP system (V1) : 0
             Control Method Power Button (V1) : 0
             Control Method Sleep Button (V1) : 1
         RTC wake not in fixed reg space (V1) : 0
             RTC can wake system from S4 (V1) : 1
                         32-bit PM Timer (V1) : 0
                       Docking Supported (V1) : 0

Signed-off-by: Liav Albani <liavalb@gmail.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/FACP                    | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.nosmm              | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.xapic              | Bin 244 -> 244 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/q35/FACP b/tests/data/acpi/q35/FACP
index f6a864cc863c7763f6c09d3814ad184a658fa0a0..a8f6a8961109d01059aceef9f1869cde09a2f10c 100644
GIT binary patch
delta 23
ecmeyu_=S<n&CxmF3j+fK^Y)2c$&5@B^V$GgGY3Ne

delta 23
ecmeyu_=S<n&CxmF3j+fK^UjG}$&3sW^V$GgJqJSo

diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
index 6a9aa5f370eb9af6a03dc739d8a159be58fdee01..c4e6d18ee5fc64159160d4589aa96b4d648c913a 100644
GIT binary patch
delta 23
ecmeyu_=S<n&CxmF3j+fKbKXR*WJacmd2Ik#q6Yc^

delta 23
ecmeyu_=S<n&CxmF3j+fKbHPNeWJZRGd2Ik#tOoi3

diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index 15986e095cf2db7ee92f7ce113c1d46d54018c62..48bbb1cf5ad0ceda1d2f6d56edf5c1e207bd1a04 100644
GIT binary patch
delta 23
ecmeyu_=S<n&CxmF3j+fK^M#3A$&5@B^V$Gh6bD=Y

delta 23
ecmeyu_=S<n&CxmF3j+fK^QDPg$&3sW^V$Gh9tT_i

diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
index 2d3659c9c6753d07c3d48742343cb8e8cc034de7..31fa5dd19c213034eef4eeefa6a04e61dadd8a2a 100644
GIT binary patch
delta 23
ecmeyu_=S<n&CxmF3j+fK^X7?M$&5@B^V$Gg4+lR0

delta 23
ecmeyu_=S<n&CxmF3j+fK^VW%6$&3sW^V$Gg83#WA

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7570e39369..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/FACP",
-"tests/data/acpi/q35/FACP.nosmm",
-"tests/data/acpi/q35/FACP.slic",
-"tests/data/acpi/q35/FACP.xapic",
-- 
2.25.1


