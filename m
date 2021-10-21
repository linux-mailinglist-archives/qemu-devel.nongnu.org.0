Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F84366EA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:56:21 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaQW-0003Vz-DW
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZxA-0000Zo-IM
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:26:00 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx7-0002rp-OX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:26:00 -0400
Received: by mail-pl1-x636.google.com with SMTP id i1so629248plr.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuSVT6Jeal3XVHWytRnTfXOtr84gMm7/3+2VSVYEgGI=;
 b=VYyna40uD+G+5YQbHm0OtsBX595D9R62bz9cGqaYR31/YzxhYvW61pBu5/cEqMqhs0
 DWitsiElx53prKVnOs/5XtkX3KKZoQmpyJSmB0Mg/LHb39kCYzf2qPcAr52gL1g3OLRA
 SRL4RWN+dxYn7nNFNd88g5UclOIIoK9Zkggh/aOoYSOEDVtw2/0WeYMJ2qFi1rbCuZUD
 N4X5U2Y1O1bwi3k0xDK5FO8S5G9FaFCyd8k7+Umd5KqEyX7IL82MVct/NW+Lup8iqpvR
 E+WerXBnLVsvV3f8E4kb4uOrd0Ba5xS7zZ4NnHXGLfFcZf9bYT1qxI62l0hzbHb/qMcI
 6eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuSVT6Jeal3XVHWytRnTfXOtr84gMm7/3+2VSVYEgGI=;
 b=FlsniU9YC8lh/0T4Tav+er72PqYy+zoS93ZAhLubkV9iCZb37JmY926nsVbWWNeNGu
 rXeIWcvXU/HF0rbBQbuctLYQleBvX3mYPJ/KUn/1TBBm8JiDEpd8g4DYuA6HPqGXLcae
 0iPRe5U9g0Z6J/0wX0aJWelJPcR+0dZpadyBfIeehfHHD72V5Kq7RhPUjlI3HVg76bPB
 8avLCcqqWYq/B5x/9CPBGxNezq28n1yS08SrRhYySBCe2ldOU9q8f6Dx1Ea7libf3uTo
 ECDWF1djkks+Pi3ud2yGOr8KNaUi3VHxacDo4G6MI9FYiACc3VS8g1YVyZmgEnacJDKm
 L2Dg==
X-Gm-Message-State: AOAM533UfM5jYirMxnsVjzp1UK3CXW1t4Z1uB9GG4UPLHsnSHo01jZ+f
 0kAMAWCX2zOh826eClY54/ctb4Nt6m4xfg==
X-Google-Smtp-Source: ABdhPJwbPyhMzBLSHs5zRbqMdYBM8ii7jhYQcxM7rIGlABVJv0dPxjNeAnVRPRy5uw6dDMJopaFZ+Q==
X-Received: by 2002:a17:902:7246:b0:138:a6ed:66cc with SMTP id
 c6-20020a170902724600b00138a6ed66ccmr5997416pll.22.1634829956467; 
 Thu, 21 Oct 2021 08:25:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] tests/data/acpi/virt: Update the empty expected file for
 PPTT
Date: Thu, 21 Oct 2021 08:25:41 -0700
Message-Id: <20211021152541.781175-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.

Disassembled output of the updated new file:

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180810 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 *
 * Disassembly of tests/data/acpi/virt/PPTT, Fri Oct  8 10:12:32 2021
 *
 * ACPI Data Table [PPTT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
[004h 0004   4]                 Table Length : 0000004C
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : A8
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
[025h 0037   1]                       Length : 14
[026h 0038   2]                     Reserved : 0000
[028h 0040   4]        Flags (decoded below) : 00000001
                            Physical package : 1
                     ACPI Processor ID valid : 0
[02Ch 0044   4]                       Parent : 00000000
[030h 0048   4]            ACPI Processor ID : 00000000
[034h 0052   4]      Private Resource Number : 00000000

[038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
[039h 0057   1]                       Length : 14
[03Ah 0058   2]                     Reserved : 0000
[03Ch 0060   4]        Flags (decoded below) : 0000000A
                            Physical package : 0
                     ACPI Processor ID valid : 1
[040h 0064   4]                       Parent : 00000024
[044h 0068   4]            ACPI Processor ID : 00000000
[048h 0072   4]      Private Resource Number : 00000000

Raw Table Data: Length 76 (0x4C)

    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211020142125.7516-9-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/PPTT                   | Bin 0 -> 76 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index cb143a55a6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/PPTT",
diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
GIT binary patch
literal 76
zcmWFt2nq3FU|?Wc;pFe^5v<@85#X!<1dKp25F11@h%hjKX%HI*fMQ%gwhD|7qyeJ>
B2LS*8

literal 0
HcmV?d00001

-- 
2.25.1


