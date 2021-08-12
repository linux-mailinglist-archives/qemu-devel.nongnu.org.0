Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCC3EA914
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:03:43 +0200 (CEST)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE7K-0008EH-Bl
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxy-00080o-Uv
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:54:02 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxs-00065Y-2x
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:54:02 -0400
Received: by mail-qk1-x72b.google.com with SMTP id t3so7341351qkg.11
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJCUwL5f6au4sf1X95Z6GuyjBnhdb6xqOI0T8mpWiLg=;
 b=hRwXxtxIzPGPq8lH7irNhpscQwbDpqFXdYOD0gtTtNsSKwSnGmJxets0Nc6hCeSJa6
 Xesv2j43X6jT1OVLRaIik8FyBZuannpmMvO9+txSr3GozesKEJgUGQaCr7KQgNxBDJ50
 5FzuzQDt0/+vHYm7+IouZGYkcTovTryqaYigCKf/rP1RHcQF34CKddDY/Awc/rSIiyM5
 n+P2rGk60AvWGShH8Tz5d4BXqGlMg/6qOZVVM0aQLtK6dOiZr58c1O02wxiEuVt2NptP
 1KJbYUmXIPBZ0W9ICCprcjXdBl54sut+SohY7zY3z7CztQzM/JGLpcoC5Krcb2jtJEoK
 GwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJCUwL5f6au4sf1X95Z6GuyjBnhdb6xqOI0T8mpWiLg=;
 b=sF0MnWyWgc08htccNvKuoRhgrSMMe3Tcog3xCxIf4jrunXuRKFLJ3rVcJudDJJ7eYB
 lAM63wOn1GWC+icSuv4WOhxQBEyVnBUHsjPeeUxzAyPXnvV8M1PtuGfUZSShK9Oh6t7n
 qtg4qc+87c/QUNIqhPvUTndIMe/YxBSUYGB7nTclbJHRFx8cVRQ475oVCK1Vi07zhRwz
 7xDAR1E/Mx7E3F+76MoUpubh+z6tJXeuaIUIpKeZbZGSgdhuJs6p6401kFz6MYzruYvK
 3Xn137UMFghu3vsRqFoxddwxV8U7NnuhdNdZmqipjtAJ+0dWSlvOADeXbhNWN4xVfFVI
 AU6g==
X-Gm-Message-State: AOAM531RnxHm5dWwPwho1K9nTxI9Ze+NvrvYuKkL7m7A+8EGwnX6CvCy
 gZ5J2E3oOIv4EeI+ZHxsptZGxXdmUCr8Bg==
X-Google-Smtp-Source: ABdhPJwcT8F8cuIJmQT9b8sEEDuX772Ry91ccoKFllpRsGZNMgq8dWkSfTXmRE8aIRe69t7BWktCXQ==
X-Received: by 2002:a37:8406:: with SMTP id g6mr5627045qkd.105.1628787234115; 
 Thu, 12 Aug 2021 09:53:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:53 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 10/10] tests/data/acpi/virt: Update IORT files for ITS
Date: Thu, 12 Aug 2021 12:53:41 -0400
Message-Id: <20210812165341.40784-11-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated expected IORT files applicable with latest GICv3
ITS changes.

Full diff of new file disassembly:

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180629 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 *
 * Disassembly of tests/data/acpi/virt/IORT.pxb, Tue Jun 29 17:35:38 2021
 *
 * ACPI Data Table [IORT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
[004h 0004   4]                 Table Length : 0000007C
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 07
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                   Node Count : 00000002
[028h 0040   4]                  Node Offset : 00000030
[02Ch 0044   4]                     Reserved : 00000000

[030h 0048   1]                         Type : 00
[031h 0049   2]                       Length : 0018
[033h 0051   1]                     Revision : 00
[034h 0052   4]                     Reserved : 00000000
[038h 0056   4]                Mapping Count : 00000000
[03Ch 0060   4]               Mapping Offset : 00000000

[040h 0064   4]                     ItsCount : 00000001
[044h 0068   4]                  Identifiers : 00000000

[048h 0072   1]                         Type : 02
[049h 0073   2]                       Length : 0034
[04Bh 0075   1]                     Revision : 00
[04Ch 0076   4]                     Reserved : 00000000
[050h 0080   4]                Mapping Count : 00000001
[054h 0084   4]               Mapping Offset : 00000020

[058h 0088   8]            Memory Properties : [IORT Memory Access Properties]
[058h 0088   4]              Cache Coherency : 00000001
[05Ch 0092   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[05Dh 0093   2]                     Reserved : 0000
[05Fh 0095   1] Memory Flags (decoded below) : 03
                                   Coherency : 1
                            Device Attribute : 1
[060h 0096   4]                ATS Attribute : 00000000
[064h 0100   4]           PCI Segment Number : 00000000
[068h 0104   1]            Memory Size Limit : 00
[069h 0105   3]                     Reserved : 000000

[068h 0104   4]                   Input base : 00000000
[06Ch 0108   4]                     ID Count : 0000FFFF
[070h 0112   4]                  Output Base : 00000000
[074h 0116   4]             Output Reference : 00000030
[078h 0120   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

Raw Table Data: Length 124 (0x7C)

    0000: 49 4F 52 54 7C 00 00 00 00 07 42 4F 43 48 53 20  // IORT|.....BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 02 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0030: 00 18 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 01 00 00 00 00 00 00 00 02 34 00 00 00 00 00 00  // .........4......
    0050: 01 00 00 00 20 00 00 00 01 00 00 00 00 00 00 03  // .... ...........
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 FF FF 00 00  // ................
    0070: 00 00 00 00 30 00 00 00 00 00 00 00              // ....0.......

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/virt/IORT                   | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 0 -> 124 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 2ef211df59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
-"tests/data/acpi/virt/IORT.memhp",
-"tests/data/acpi/virt/IORT.numamem",
-"tests/data/acpi/virt/IORT.pxb",
-- 
2.27.0


