Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A72CAB81
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:12:28 +0100 (CET)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkB4d-0005kc-1o
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB39-0004Pu-05
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkB35-0001C1-Gm
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606849850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXHlJ1LzCveRD1iPVL/bW/urLeua1wvjxYp+o+bw888=;
 b=hGhRm5+fJR6aflw9emB7T1uZDF1VDmawEf+lCC2hyE6pFp+5dbrd+mzQ8TK3KMFq2asEQ1
 wP11TR1EbHWS9aC5hKWCb3sL+/FasFBLytzUAKAqhRSQh/sUkjvbed/1MKROoqq9SgQqfn
 RpV4gyNj03albg9bQL0z6wAzzOKJ5UQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-iL76CMxtPzWzic9H8UoZVA-1; Tue, 01 Dec 2020 14:10:49 -0500
X-MC-Unique: iL76CMxtPzWzic9H8UoZVA-1
Received: by mail-wm1-f71.google.com with SMTP id k128so1309526wme.7
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXHlJ1LzCveRD1iPVL/bW/urLeua1wvjxYp+o+bw888=;
 b=HQ9JDIsmqqwpPNcsnSpwUMmdZOLFyFTxFsXLpQ9f1vB6DyAmOY0TqovrK7CI57V3Es
 4QJS1b698M99JCsh7X1JGnwY0qfEzcroUCU2ifSvp5scuqEzQ4x/PdBmeCD/O9FaausE
 vsBYQCiZoRx13c/gskF1rTZjwcxEPpuFafDNo5uN4zG3Z6/tk7xi+07sxkHwBDap7u/w
 +LsWe2mgG1k/BFCRzTepZRD4QXwpXZqUJvlAt+StmZ7yGymdie2JJKfjdkFOfFS+g1Lo
 JPlMy3MJUbNoYq440nOOCtIX2PYjGtXcbLprTF/qbpQagbP/UIwl2V+OWCs6HrPHJG20
 hEJg==
X-Gm-Message-State: AOAM530GPRvMurM+0QBkq4KRwdwUI93Tc2Pj7FIREchustBzYA2b5IQq
 1SnTyX8Eg8sbJHiYjEdzFc6RpL+IWYXjTr/zqAxuCldnvNlbFJXJnHCq7HlCx8jxiEonVveHyup
 y5o6rqNLdx0gSovo/e4fc4s/t4Y+G3+RCEVJ2tyisvJvzVFmWJTia0a3oir73Zk3d
X-Received: by 2002:a1c:2c8a:: with SMTP id s132mr4292319wms.119.1606849847295; 
 Tue, 01 Dec 2020 11:10:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyguvbVskkuL/r+yZY/0Mjhmu35cbiiRs8KSnpxVbQF/m8IAeMZCDY6ayVIxMEw6A3/olCeQw==
X-Received: by 2002:a1c:2c8a:: with SMTP id s132mr4292074wms.119.1606849844088; 
 Tue, 01 Dec 2020 11:10:44 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id p4sm808598wrm.51.2020.12.01.11.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:10:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] tests/qtest/fuzz-test: Add test_megasas_cdb_len_zero()
 reproducer
Date: Tue,  1 Dec 2020 20:10:25 +0100
Message-Id: <20201201191026.4149955-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201191026.4149955-1-philmd@redhat.com>
References: <20201201191026.4149955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a reproducer which triggers (without the previous patch):

  $ make check-qtest-x86_64
  Running test qtest-x86_64/fuzz-test
  qemu-system-x86_64: hw/scsi/megasas.c:1679: megasas_handle_scsi: Assertion `cdb_len > 0 && scsi_cdb_length(cdb) <= cdb_len' failed.
  tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
  ERROR qtest-x86_64/fuzz-test - too few tests run (expected 1, got 0)

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz-test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 87b72307a5b..31f90cfb4fc 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -48,6 +48,23 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_quit(s);
 }
 
+static void test_megasas_cdb_len_zero(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M pc -nodefaults "
+                   "-device megasas-gen2 -device scsi-cd,drive=null0 "
+                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
+
+    qtest_outl(s, 0xcf8, 0x80001011);
+    qtest_outb(s, 0xcfc, 0xbb);
+    qtest_outl(s, 0xcf8, 0x80001002);
+    qtest_outl(s, 0xcfc, 0xf3ff2966);
+    qtest_writeb(s, 0x4600, 0x03);
+    qtest_outw(s, 0xbb40, 0x460b);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -59,6 +76,8 @@ int main(int argc, char **argv)
                        test_lp1878263_megasas_zero_iov_cnt);
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
+        qtest_add_func("fuzz/test_megasas_cdb_len_zero",
+                       test_megasas_cdb_len_zero);
     }
 
     return g_test_run();
-- 
2.26.2


