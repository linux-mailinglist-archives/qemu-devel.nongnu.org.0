Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3355B85A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:52:44 +0200 (CEST)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jY3-0006lY-KX
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jDE-00061I-An
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:31:12 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCz-00066F-2b
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:31:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id t21so8211279pfq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5EYrTNa6kHbbxzTm4ZvyO8emxTLy6z3Jg/Aga853dec=;
 b=wNIlDfVNS4SUvO4+UpTt+UgY8N86Z6GEOh46129s2J+y/KQ/bfn1xYH9P3vaHp6uDu
 4OlFV/7yPXcvzMslcfqb6FsJSvMhUZx+cHqNshsDW9yICOMFkkGEZlRFs6y3wW7iYAG4
 nraG4UWTFrvddVdrkzvUHOt16hX5wvshHG3Z9dOXj8JG/DcEtPPFT1DfeHp3v4vfeL6M
 1lEslkRhqvGxnpp6LVWrEsSUc1v+Fh3RmZ8IpkVnoDQ/5jDk5Z/PI9jclVQ3yk3SVP9Q
 udRTXkejZhBDWewcrHA2XAuFT4ZSxNECr2eR1tAlT3GH8zBgnljvitDHKijZyjoQSTKj
 FneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5EYrTNa6kHbbxzTm4ZvyO8emxTLy6z3Jg/Aga853dec=;
 b=irT9eNmGF+Td35vD1qIHDWaxfDt3jV4sPvYkF5RL/RkaX48Sk26wkhYJDSC+Jd7Erk
 mLHHuB1D2q1/xzEG1k94KDTDDlzab7VQFpBbtbTZraT2L4R3avyIhhIgXuyfaOBn2zcb
 QFuLzVPN7oBlajlMxBfYyaUmm0wBoRwUOBrMN2wmByofHRNjWAT8YX2bak96cPeFaq/x
 3vUbPAsWq77ATwQpncGKWVPNMsLW4dRNpUYy/Uil0wgHWyMx7s9CAH25Qoc43VPQXi/2
 Wz+UoxElRCOcYrAABkboSQMSMVA50d3QyDc5qZMp9vp7rRqxppPle41PZTcsswafxKoO
 35fg==
X-Gm-Message-State: AJIora8Fcrc/jwuYU+FexHvhkmJqcQAyA7ueyHYuajxbwRguwcgNsteG
 mf1Kc1Lt8bR1lMWX3RaIGtpSoXnkobdlQ/cuwi8=
X-Google-Smtp-Source: AGRyM1uQor/LkWLQ3SFg9tTPZS8x4XBXqK/dabTvh/y4bA869BD2L8671BnjTrkaXKgjE6xP2mtwwg==
X-Received: by 2002:a63:5c56:0:b0:3fc:824d:fc57 with SMTP id
 n22-20020a635c56000000b003fc824dfc57mr11426093pgm.561.1656315055527; 
 Mon, 27 Jun 2022 00:30:55 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:55 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com
Subject: [PATCH 10/12] acpi/tests/bits: add acpi bits qtest directory in meson
 for running tests
Date: Mon, 27 Jun 2022 12:58:54 +0530
Message-Id: <20220627072856.1529357-11-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

added acpi-bits subdirectory in meson.build so that the tests in that
subdirectory can be run as a part of make check.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/acpi-bits-test.py | 4 ++--
 tests/qtest/meson.build                 | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/acpi-bits/acpi-bits-test.py b/tests/qtest/acpi-bits/acpi-bits-test.py
index 673567bf8e..ef4ace8028 100644
--- a/tests/qtest/acpi-bits/acpi-bits-test.py
+++ b/tests/qtest/acpi-bits/acpi-bits-test.py
@@ -244,9 +244,9 @@ def parse_log(self):
 
         if os.getenv('V'):
             print('\nlogs from biosbits follows:')
-            print('==========================================\n\n')
+            print('==========================================\n')
             print(log)
-            print('\n==========================================\n')
+            print('==========================================\n')
 
         matchiter = re.finditer(r'(.*Summary: )(\d+ passed), (\d+ failed).*',
                                 log)
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ad52f1c81b..2c72c42933 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -312,6 +312,8 @@ endif
 qtest_executables = {}
 other_deps = []
 
+subdir('acpi-bits')
+
 foreach dir : target_dirs
   if not dir.endswith('-softmmu')
     continue
-- 
2.25.1


