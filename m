Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F443520C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:54:12 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFn1-0002C5-7s
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUf-0005QE-26
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUd-0002j0-DS
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id g39so16312939wmp.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dozp0i//DXBHAKKI5F8x2p4gKun2eWFo2D6lVjmBtXQ=;
 b=DnI5xCZ5JtuflUZ6Heb0yVGyQZb2oI1pdMhC5kVs8D7JrVu/4rbtWUH5rtSUwldj/r
 deYgEZXlleVD2ijeBcpa+hVhcb4KUurpDyt/6BrJfppNJEtUQqp6FlE62DmtKCa073C4
 c4e+mA+LEoAvcTXWNfgj90hpaV7xx7VC6vYquKDRuv2PmasItq7AM//DNYRSs4CVZjBZ
 LwOd4rbla+dZfHQZTJwWG7Io440nZI1jUHmgo+1zIDgw4CQaued05/TAvz0tFkrwnr7P
 Vj+dqx3rXyilg/Yg2xi7ubZXvLvoMOycAtvMYDzHqLjtdxfyMgU2zE4+8Q1o3xFlxLbF
 09KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dozp0i//DXBHAKKI5F8x2p4gKun2eWFo2D6lVjmBtXQ=;
 b=AonnfMLYN81hpuN7DBrWjDt58PL8Ewlg+aGY+91oYpvKEQyH8e8X7zGZ1pourgcw2f
 QMI+vNEWiUlm2RYaoJPht13v2p9jxkQHYD/YvsvvhHytCtx4+uODw0pKjSU97cRwzrcl
 cPRjZWMtPmVKtm7UtVVdF7UB/F0xdpoukpyl8j5Kl5LMjQY3gm4EVI2uMzzsbzA8STNx
 UNsFKHvq6DiI4Nvhp2yNKNN7T2lrtX6GrGpnako6PQVn++fki+vOfSmJrEzMF+nPA39Q
 /G6EEW5LoUx46aIJDFrpsthdYBtsEIT8MfCHiUauKfaXE7ChxSvQw5zfyQJRLgGDl+zN
 a+lA==
X-Gm-Message-State: AOAM5304P9DAFKT/SvCCVSC9dx78XSiLoYZYk0AMz9saGpT47yFKFu8X
 svgJ38+XPgchkCbWC9uvVHly5Q==
X-Google-Smtp-Source: ABdhPJzjQDC6jHVE9Or2dwytfllYv/TuZRcHY9ZmWe6TddQNZPhsyPV0oi+trrlT+rrRDCAlJhjLeQ==
X-Received: by 2002:a1c:4645:: with SMTP id t66mr654638wma.179.1634751310134; 
 Wed, 20 Oct 2021 10:35:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:09 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 11/12] tests/acpi: add expected blob for VIOT test on virt
 machine
Date: Wed, 20 Oct 2021 18:27:45 +0100
Message-Id: <20211020172745.620101-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 29b5b1eabc..fa213e4738 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/VIOT",
 "tests/data/acpi/q35/DSDT.viot",
 "tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
GIT binary patch
literal 88
zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
I{D-Rq0Q5fy0RR91

literal 0
HcmV?d00001

-- 
2.33.0


