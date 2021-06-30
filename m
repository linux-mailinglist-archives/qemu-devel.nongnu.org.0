Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3CC3B8676
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:45:47 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycPK-0004G8-Dn
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycCL-00057C-Qe
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:21 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC7-00059F-Dx
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:21 -0400
Received: by mail-qv1-xf36.google.com with SMTP id f5so1283408qvu.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orJerE+sAGar3RteiqHorORXurc9lV+yj7IQakLWvZE=;
 b=gm8p9+fmur2D5hz591KVhwDaMRMiB25LcdsMR31WdkJ2DPvuMVuLp5MTIZAItAKHiV
 gHy63Rr+X0jeWA5x5hZHc6Ym9gX/1UL25cqltPnz85MSnkGL+eOZmUVO6F5Vd4GvPoUW
 RcDB/R6YzfOhxtDW1FX0agl+SHgoJeLjqMGA/tvxa+FwwLcJhesAG7V3Wot0XYokULnm
 kgW2fdj97P1uPttxXBuWP6T5ro+dn33Ze0aDsqDUL2HHpg6IZH7wIxPqSXN3LaQUmIh1
 zd8aNpplK/hwN3DFH69s1ps7W2VmwnpoR79s66MEoLVm7H+x2LrUmluHe1c1DwrS5eNc
 TxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orJerE+sAGar3RteiqHorORXurc9lV+yj7IQakLWvZE=;
 b=EieamWgqbDodxGkJo24JTLDZTjIWDZSLISjs2QaG4r7oxyAsoFSQ6RVfMZ/ErHi3pA
 iqXfmj4MOU+H+JJVTYk+AS7fFanmnTA2W8xgJLjZpy7suE0FmT/TEd4zOEzdswb6UaHZ
 8JqfY/ZgSTEUiDvs8tN0NtbX/kmEipIkvYmpzC+H/qWYKlbyTvv4qdEX1djBuJ17RK4c
 5jcDKNoRHm4z/0vn8EGxOMd0+XBTxW95PlOyVnsunKOQBmN/yPqnanre5eUBdctuJ1Wx
 18gGxew6UdfCx3sephqzjNgAvlhTj64TNrzMNGCA+idB0IUa5OXTiMUmkBxg7nT6gPXc
 h/zg==
X-Gm-Message-State: AOAM531T76Gn9IkwmkFGv6R5upX5vpjKHpfGKgO4fph9d9QMnIivdD+i
 S4NJb8bEBbIGDsttI1S/vIIZ+g==
X-Google-Smtp-Source: ABdhPJxXE2dwgIX/KyK6sXjee3vVRmeiY1heIp30+9fv/NeSQBH81N1S8/p2QaRUa+uCvlSyps5PqQ==
X-Received: by 2002:ad4:408a:: with SMTP id l10mr22881018qvp.31.1625067126608; 
 Wed, 30 Jun 2021 08:32:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:32:06 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 10/10] tests/data/acpi/virt: Update IORT files for ITS
Date: Wed, 30 Jun 2021 11:31:56 -0400
Message-Id: <20210630153156.9421-11-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated expected IORT files applicable with latest GICv3
ITS changes.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
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


