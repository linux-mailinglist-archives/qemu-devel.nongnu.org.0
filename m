Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C46475801
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:40:01 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSdc-0000ID-QX
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRij-0007Mq-Jf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: from [2a00:1450:4864:20::431] (port=35580
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRig-0000P9-SM
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: by mail-wr1-x431.google.com with SMTP id k9so19581606wrd.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iMAiB5r+mPc3uOrkQsPd7yDF9l1lzlzDUXKlxyxg49k=;
 b=PGNyDaC4JZLT8Tx8hkpmQ8uiMsWUEsbDHBs9Fsav2R1JaW4k9gicwehaPbPoGw0fSt
 Y08vKkA0IZeNX+xH/qTjra8s+0YKUZ8jk9vgif87IiagLhWzPQDWRQrwA1OOyyD7Vecd
 FD6cG5uSOxrU9r5i0VZph424jN8z94PdxJR8JP9ts+YRopeXIpdu1SEEZySLpLIYxkBD
 yeweUW2aKDXc8CQqDCUlrzyUYS9HLrPr7IPvfQtO2574poQlFibI6uwJOpzqSSDnmMrF
 qk+P3nUiKYdXMOHJf3WqpJmlzxIKEm2HeS7GoOE+DVnzrwcCjXeT7GnLI/mS5hlBmgkd
 ymZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iMAiB5r+mPc3uOrkQsPd7yDF9l1lzlzDUXKlxyxg49k=;
 b=S1pw7ZAtjXq65qLM7xOorVsKrxmbqRfSj6tLruMM2FCDsHRfw3YGbXl8h44ifVfqop
 jegYtHJaRLgyRUQnx5uBWnXpaqAxF3PMMvPGsPaZBh3GIJKgIR9Pj9grCOizSlm79BQb
 TMIsjhMCYD7QMhiFiMbOKRSiYBih6jfOVaW03TC48LuUjAX+WS6EHaYYvpgqXOw5AH0s
 xMrTK7+JP5Igx5wdaUNqjHwC/SEucVbiOKL+klSGz2oHB0/PsCCBIYms474pkypkSBD0
 M+eIpqoSS4b1UAinsZbExu3fbIoeobex6ITasNychYaicZjRrnTVLJb+uVJZXZAUjRGX
 r+4A==
X-Gm-Message-State: AOAM530i+/lE9FXUpUcgiOvGCZBBluJi74c7UES4oanUJPlVW+afBECY
 ngrGzepftzx+y+hcug80gYfl59vjsVesLg==
X-Google-Smtp-Source: ABdhPJzcOxIo6lSU/Giqek4rWFELhjoWrWc2uiuTa5o8Ofq/+NykjWvIc7naiIokgZy7Hq2Uslc2QQ==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr3701778wrs.485.1639564869506; 
 Wed, 15 Dec 2021 02:41:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] tests/acpi: add expected blob for VIOT test on virt
 machine
Date: Wed, 15 Dec 2021 10:40:49 +0000
Message-Id: <20211215104049.2030475-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The VIOT blob contains the following:

[000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
[004h 0004   4]                 Table Length : 00000058
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 66
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]                   Node count : 0002
[026h 0038   2]                  Node offset : 0030
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
[031h 0049   1]                     Reserved : 00
[032h 0050   2]                       Length : 0010

[034h 0052   2]                  PCI Segment : 0000
[036h 0054   2]               PCI BDF number : 0008
[038h 0056   8]                     Reserved : 0000000000000000

[040h 0064   1]                         Type : 01 [PCI Range]
[041h 0065   1]                     Reserved : 00
[042h 0066   2]                       Length : 0018

[044h 0068   4]               Endpoint start : 00000000
[048h 0072   2]            PCI Segment start : 0000
[04Ah 0074   2]              PCI Segment end : 0000
[04Ch 0076   2]                PCI BDF start : 0000
[04Eh 0078   2]                  PCI BDF end : 00FF
[050h 0080   2]                  Output node : 0030
[052h 0082   6]                     Reserved : 000000000000

Acked-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-9-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8367ffe1d40..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/VIOT",
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
GIT binary patch
literal 88
zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
I{D-Rq0Q5fy0RR91

literal 0
HcmV?d00001

-- 
2.25.1


