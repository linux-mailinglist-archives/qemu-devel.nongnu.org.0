Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C959BCEE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:36:39 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3rL-0001Ua-1E
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Q1-0001hG-Cr
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Pz-0007LF-VG
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:25 -0400
Received: by mail-pj1-x1036.google.com with SMTP id g18so10343254pju.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xlZh3k59/5+iFFhHlHitsL1nJoDHeLLXvjMfiF3l4Es=;
 b=CBJaKtL5UBx/1ce/sSXr0SUF3+CAdJWp8QrVkDE66CWVww35WXrvL/yIYg5cbFxq8d
 AVqzZeSZnnhkmmmNt2svnU4TcjLvlI2fUnKpmu8FAGimBZ/ApKZINF5NXWCZq20Rfkh6
 gYJquS2RTEPB9FD084c8UMxTHdSRCqNMObV5FdqdNiW8bcyFFVQS1CfxUZmdpeWxNZn2
 +N+lKX1HRt6/bJ1fHaclHTRJN/YojpQMVnKmY3+ycL1lAV06fjfOiCSTJvH8E5akg8du
 pKkSBGGb7nG6hiT7TKrCthPkEWNyqxqWX1pzNEEUN8VpSs9wI1OuF2Ag2w9/q0VcbjVH
 mK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xlZh3k59/5+iFFhHlHitsL1nJoDHeLLXvjMfiF3l4Es=;
 b=Sry6X8E11jqpXAnZfJtEZ6nlwk0NmwIi6+RZ3xmLAq4prq8ySO2RS/nkgYnn3xbcab
 Nqm6QcEHm3RRA+wFsUP0UXkzTVLPmqIuuQN75JXgkk8+f/EzdlsDCbr5m3I0isnkTGx4
 l0COkp4+Gxb05bW3z1JFBJivw9JSMDpI4iEG1R9zjSitstzHJ6LDGFRcBZTmB6y3XyOM
 Tn4MHH8dSWEI1menDbez3aZ7fTGmJXOnaFMMJyL//DFgaSnD0iIcW2HYsR0hhEYjOs+M
 rToNw4ddsgakCnrMN9Ul4eCB3igbgUFEgECPpJ27yd9fvc6D9d+etfrB0A8RSsWQa3GN
 S/RA==
X-Gm-Message-State: ACgBeo0urw25uiEChT7X3zU7bSKfVRNbhwTYylO1gXuLHevsM8ETzCsk
 IUbvtw53FlCWwWoD4xNdvp1XQL4XGC9A6w==
X-Google-Smtp-Source: AA6agR7etftzSk78bs3m90+iIybFYccWcaOvEPTd6TWEKpvEfkkuKFXL/Go8HPJYEH4qFHqrFNikeQ==
X-Received: by 2002:a17:902:d2c1:b0:172:c1af:fd26 with SMTP id
 n1-20020a170902d2c100b00172c1affd26mr14618553plc.4.1661159302466; 
 Mon, 22 Aug 2022 02:08:22 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 a20-20020a62d414000000b00535e6dbda16sm7364539pfh.35.2022.08.22.02.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:08:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 1/4] hw/acpi: allow changes to DSDT and DMAR tables
Date: Mon, 22 Aug 2022 14:38:08 +0530
Message-Id: <20220822090811.427029-2-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090811.427029-1-ani@anisinha.ca>
References: <20220822090811.427029-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Our next change modifies DMAR and DSDT tables. Make sure we whitelist those
changes so that bios-table-test does not break.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/q35/DSDT.dmar               | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 2 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.dmar

diff --git a/tests/data/acpi/q35/DSDT.dmar b/tests/data/acpi/q35/DSDT.dmar
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..4efed12b59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.dmar",
+"tests/data/acpi/q35/DMAR.dmar",
-- 
2.25.1


