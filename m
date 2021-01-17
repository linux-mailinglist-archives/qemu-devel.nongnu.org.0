Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEAD2F9239
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 13:04:04 +0100 (CET)
Received: from localhost ([::1]:41492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16mp-0003LH-Uu
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 07:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16ZJ-0003SM-Qg
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16ZH-0001E2-NY
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610884202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXweFu7zyB4HULBBVa+BgbvF5SsimgWtXkJJQCi1yZ8=;
 b=UmsF0PhSQLIWGSG+pvaYV/aj8ukhmDjAW3JuTaZH947pmbvlpgkRaCaOGn7T/wPh+wa+4C
 lZ8ccfqLcNaZ1D5lqKz+XdwRoVD+5u36pu0ymBF9Sr5OPghSbji0WXUJ8rpsBnRcKXmM8B
 r3MxEX8CT6W96TLNW2t0QT6ZuVELqA8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-J-n0Q9A_PC2bJwn8CiULTg-1; Sun, 17 Jan 2021 06:46:43 -0500
X-MC-Unique: J-n0Q9A_PC2bJwn8CiULTg-1
Received: by mail-wr1-f70.google.com with SMTP id e12so6788299wrp.10
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OXweFu7zyB4HULBBVa+BgbvF5SsimgWtXkJJQCi1yZ8=;
 b=S/aOysLUZWncMAOUczl9HuY5GPpG98Vg8aL2RbRYU2fB/y20V6G8tsD4q6Hb4b+m6t
 YvRrHSPbnxOvytUdPPrTHhgS8RL8sJApXmdkSF/VL1AJvyzTi7ZPQL+GL0inetyHdrKx
 oP/tFSmcX6ALjbWdNtYRzMcx6TdonQukGJU3Fh8tSlF48Usq2+05E+kvVqFdJ3Wnn7BQ
 QkLA4IELyXSxXt1Egw1jiBfvvJOgbmXv8CWVPjDmIqFkaQNarkaapM0OmJokWAHENzc+
 LNy14Zoh3jQDuU2ij+hEOvlp2OoIfPM/bglHhY/jN8tPggaFqZdrBXUJpcqbdo1lmorD
 eX1g==
X-Gm-Message-State: AOAM5321JNHHXOOOp7QZARCcNB5aSa1CrHtpLkSsFv1xs9OZt21Nql/F
 AToFc+abQef3aaLbPzdE44+z3DP93KDB9WWD0nc4nLPA6uMwv3ZzWecc75Lgs4eQaZ61QLoRP6S
 vdVKm8r2QnQus88yQNeFL6gajHfJ4bK9mehPCyjwqpaOOvl98+tFZmhhIy3a9
X-Received: by 2002:adf:fd05:: with SMTP id e5mr21599979wrr.225.1610884001828; 
 Sun, 17 Jan 2021 03:46:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSiJv5zAJUqsqGAWsiHYNlqwfQd4So6crFCNOzWqKEa0psdHtucsGyBqovknlys37zXzd8Yw==
X-Received: by 2002:adf:fd05:: with SMTP id e5mr21599959wrr.225.1610884001571; 
 Sun, 17 Jan 2021 03:46:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 p15sm23116730wrt.15.2021.01.17.03.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:41 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] acpi: Update _DSM method in expected files
Message-ID: <20210117114519.539647-11-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

A new _DSM #5 method is added.

Update expected DSDT files accordingly, and re-enable their testing.

Full diff of changed files disassembly:

tests/data/acpi/microvm/DSDT.pcie.dsl:
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/microvm/DSDT.pcie, Thu Jan 14 13:39:35 2021
+ * Disassembly of tests/data/acpi/microvm/DSDT.pcie, Thu Jan 14 13:51:13 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00000BCF (3023)
+ *     Length           0x00000BD7 (3031)
  *     Revision         0x02
- *     Checksum         0x29
+ *     Checksum         0x99
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1302,9 +1302,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

tests/data/acpi/virt/DSDT.dsl:
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT, Thu Jan 14 13:39:35 2021
+ * Disassembly of tests/data/acpi/virt/DSDT, Thu Jan 14 13:51:13 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000144C (5196)
+ *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0xF0
+ *     Checksum         0x60
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1838,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

tests/data/acpi/virt/DSDT.memhp.dsl:
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.memhp, Thu Jan 14 13:39:35 2021
+ * Disassembly of tests/data/acpi/virt/DSDT.memhp, Thu Jan 14 13:51:13 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000199D (6557)
+ *     Length           0x000019A5 (6565)
  *     Revision         0x02
- *     Checksum         0x11
+ *     Checksum         0x90
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1840,9 +1840,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

tests/data/acpi/virt/DSDT.numamem.dsl:
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.numamem, Thu Jan 14 13:39:35 2021
+ * Disassembly of tests/data/acpi/virt/DSDT.numamem, Thu Jan 14 13:51:13 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000144C (5196)
+ *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0xF0
+ *     Checksum         0x60
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1838,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

tests/data/acpi/virt/DSDT.pxb.dsl:
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/virt/DSDT.pxb, Thu Jan 14 13:39:35 2021
+ * Disassembly of tests/data/acpi/virt/DSDT.pxb, Thu Jan 14 13:51:13 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001DF9 (7673)
+ *     Length           0x00001E09 (7689)
  *     Revision         0x02
- *     Checksum         0x42
+ *     Checksum         0x30
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1810,9 +1810,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
@@ -3025,9 +3030,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-9-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 tests/data/acpi/microvm/DSDT.pcie           | Bin 3023 -> 3031 bytes
 tests/data/acpi/virt/DSDT                   | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp             | Bin 6557 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem           | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb               | Bin 7673 -> 7689 bytes
 6 files changed, 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 42418e58e7..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/microvm/DSDT.pcie",
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/DSDT.numamem",
-"tests/data/acpi/virt/DSDT.pxb",
diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
index 4b765541e372f4ba4e25529c14acf696516c8f61..e590b98f9960025f75dd0544492d3088781406dc 100644
GIT binary patch
delta 59
zcmV-B0L1^#7uOdGL{mgm*9!mu0-2Et8v;SPu_reH0Z6l70pke>HD5$iO$4ARlS&I8
R2_c{dlWGbDqyUp@3uOk*5ZC|!

delta 51
zcmcaEeqNl*CD<k8JU0UaljcM&X(rE|8`aGj867sqGd||z(2aKq_GMY1IN6I^o{@2K
H5qBy8b(js<

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index bc519abff9cadc1552e4e586b0a3f5f0db498f4a..ea8a0869af1637ab75fe335e100256a2acf85e16 100644
GIT binary patch
delta 58
zcmX@3aYcj6CD<h-M1+BXDPba)G-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{T<qzlp

delta 50
zcmcbjaYlp7CD<jzM}&ca>BB@WX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%yeGTXU

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
index 54728e2b4b8b959f3f829386f6a388ef2600e747..897648637cc6c8af47c67a9a349477c0240f833b 100644
GIT binary patch
delta 60
zcmV-C0K@;CGo>>ML{mgmr5OMK0+5jk8v=lsu_qV_0!FB#K?w>7HD5$iO$4ARlSvaF
S2_c{dlWGbDqyV#N6Ep_<;t(eQ

delta 52
zcmZ2#JlB}ZCD<iot|S8kli)-yX{L_p8`UK^nf#V7cI4#Z(2aKq_GMY1IN4KJo{@2L
Ip|A-X0Bmp#CjbBd

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
index bc519abff9cadc1552e4e586b0a3f5f0db498f4a..ea8a0869af1637ab75fe335e100256a2acf85e16 100644
GIT binary patch
delta 58
zcmX@3aYcj6CD<h-M1+BXDPba)G-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{T<qzlp

delta 50
zcmcbjaYlp7CD<jzM}&ca>BB@WX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%yeGTXU

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index 76f5f1c2fd487644c6b4f827a70ad770edb9fdc9..ce3b67dff277e23f43925b1adcbb55c9d0b4eee3 100644
GIT binary patch
delta 95
zcmexq-D$(+66_MfDaXLTWH6CShVkA;bqP);=h>SbIcqpMOygaGeOVT0PW~n%FQmAD
ieR38T>k@_~g3OEz(M@hE7QYkXLQ%sBS2I~m_AvnX%^QRO

delta 79
zcmeCQ`DxAN66_N4Q<i~&$!Q{&4CCF6>Jpqx-m^A4a@KHi=*GJQ`?4%hocvElo{Mpb
ZATuLFbd%rm#ovUuP~;dHC#%Um1^}tB7n}e9

-- 
MST


