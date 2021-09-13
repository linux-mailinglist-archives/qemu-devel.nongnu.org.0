Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA14098E8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:23:29 +0200 (CEST)
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPojw-0008MQ-Tm
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYw-00018R-1N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYr-0008FA-Og
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g16so15581577wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z+DQga4OxwpG9/mEVso6ZacpZ5heGCrmNENm1NfaNLY=;
 b=nFmS9GmT35wJVhZpaTjg4HI8rb4pZRHD7Hs9XQSQG3DhJNhZahkqrz5xNhrKAuwRee
 vnxHQIE/D2asZK1AiGESLm5JOPFesM8ZZfQsDs9Jo1YKjVw2i3hquEtsHSbaV0/j7csD
 tQdoX4dwnYZPhDd0ffUmytRXzYwNvlf1awKhe/DfsyX8UX2y8fBELvGGfw8XvYPXDYJo
 HrkOWtuj/OG2bc7PL/eluOe5xGEFTzA2qnerGHaPaeewnaTo7GXzV9yqdAAc1QDuUfSt
 Jfh+TA+UpYixp08RidqJz5njf73XbgkU9746tsvA0tvzJ9DDzT2CgP0Aqay/YZJr4KyT
 XtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+DQga4OxwpG9/mEVso6ZacpZ5heGCrmNENm1NfaNLY=;
 b=V5tVq+SilpiQCHTsyDDYQdC68LOCnnQgGTz/Pj+Yl3Q/3F1BryZiYgmRLPd956/IzC
 epUuocU1/vckPmsjmdrIb8LPS0vpUAsGnN8AYIFqTQ8jPVEFHMcr7iYTvEeMR1MN4mBj
 cvtWZBwoBeFdFE0+90JHqm9oYxqX4+hs4U+5wBGPSMpl4Ai0Zj57qXwKR4R/QnXs7uTF
 qRGJTa3LoremD+9GoEYQeIedObjA2RRzFMBgp85AVLBoXyeANSspzt0RovOSkQIpppoM
 Bch1r5JjMad+4ZLRcYh8W88VBqlcVI1p0580LUo4bDOpKn65tcHSCLNnICLec9OCwo6i
 RbDw==
X-Gm-Message-State: AOAM533E8vNqb4Iup+ItRZ7yyAVin2MeGuV7qzBw9hrTmJtbXFDejWex
 Yy6bhSRHb4MAWzSm8oSkB6zIyeIPSY+MZg==
X-Google-Smtp-Source: ABdhPJx3edlUWHAVtkoLtE9v0Jwk5h0XttZCpqpyVUvThDuIghFAK+7qU7VS8ec4zc3LnsoIFG//yg==
X-Received: by 2002:adf:c550:: with SMTP id s16mr13596119wrf.25.1631549520350; 
 Mon, 13 Sep 2021 09:12:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:12:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] tests/data/acpi/virt: Update IORT files for ITS
Date: Mon, 13 Sep 2021 17:11:38 +0100
Message-Id: <20210913161144.12347-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shashi Mallela <shashi.mallela@linaro.org>

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210910143951.92242-10-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/virt/IORT                   | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 0 -> 124 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 2ef211df597..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
-"tests/data/acpi/virt/IORT.memhp",
-"tests/data/acpi/virt/IORT.numamem",
-"tests/data/acpi/virt/IORT.pxb",
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

-- 
2.20.1


