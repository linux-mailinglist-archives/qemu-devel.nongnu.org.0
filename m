Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587B4577A5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:14:08 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moAGt-0000lR-9c
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1moAEq-0007Xh-2f
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1moAEn-0007qp-17
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637352716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Gq6HjzogQNFDfIqJXgnhwFRKV1Nym1r+WR9nIUiBJQ=;
 b=AKLtLROLWNJC8eNekTUSR+KjiuafqHf60GnD2silcG6QYoGhbDnqeMEccIihxkx+NNYbza
 g/J935lTH/dZyRTitotY7zsIJ6jWefTybpL/Voh/1yzcttgTw17BAR+Hy1zx8lTdd26rcb
 ZpI2dpFP5YUL2e04LyHdk1greeVryQw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-242-t-17hVdqPe6A-e1rJS6z8w-1; Fri, 19 Nov 2021 15:11:55 -0500
X-MC-Unique: t-17hVdqPe6A-e1rJS6z8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so6420472wmc.7
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 12:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Gq6HjzogQNFDfIqJXgnhwFRKV1Nym1r+WR9nIUiBJQ=;
 b=HeR3z4BGjQass8SP/Ea6NCsl7rHVaAy+lSFDiJ541JSWBdemOl9J8K6uoKO1EP77uW
 SA3SVZ0qwMwiNKeylkjI6peobfjCX+xVTjRis6lDvyZUQhSVK/JD6UUweu00KLWm1nSr
 FGRcrB7D4M/Vb6W7g6mGoUdcfaVn+PVu9to4GqVub+TDIT35OYNLqcqdfGPUtwOy+tg6
 ZUZjjjqmohvTOfNtopBYYN6uujRCespnyhD0OJMehCW7tH+ezO9dJRHQ6sxsGzxrfPt0
 IGMq1papQijSzr85u0Fj3SNnfwk6A629Y3jT6haJcJ7razjInWiR9CwpTd++phOQdp76
 DcQQ==
X-Gm-Message-State: AOAM531fDIIuv9olhIoriBrjvzJQ5ykZMvqH0/J4/4699H9vqVWGUG7l
 1Er0M1yTaHmbWn3lGDYHnoFGP3mG87+GGuIVBU64BR2Aj/lTjag7RAeXJxA5oIxVL2IXgTEdb96
 9zI0tzApF58BFsaHQAdEw/0xaE5A9qoPaj1e1+JI0Rkk8+L19bbigtlWCL5IK5uhW
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr2998148wms.192.1637352713679; 
 Fri, 19 Nov 2021 12:11:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2DR61AiYTQSjxr7lCwpna4EFDXr4+2H7nfm6nlE4D0DPmRfDoyyW44n+WUc/VzfHX/4rmSg==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr2998101wms.192.1637352713491; 
 Fri, 19 Nov 2021 12:11:53 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 e12sm937189wrq.20.2021.11.19.12.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 12:11:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/2] tests/qtest/fuzz-megasas-test: Add test for
 GitLab issue #521
Date: Fri, 19 Nov 2021 21:11:41 +0100
Message-Id: <20211119201141.532377-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119201141.532377-1-philmd@redhat.com>
References: <20211119201141.532377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without the previous commit, this test triggers:

  $ make check-qtest-x86_64
  [...]
  Running test qtest-x86_64/fuzz-megasas-test
  qemu-system-x86_64: softmmu/physmem.c:3229: address_space_unmap: Assertion `mr != NULL' failed.
  Broken pipe
  ERROR qtest-x86_64/fuzz-megasas-test - too few tests run (expected 2, got 1)

Suggested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz-megasas-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
index 940a76bf25a..e1141c58a4e 100644
--- a/tests/qtest/fuzz-megasas-test.c
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -34,6 +34,34 @@ static void test_lp1878263_megasas_zero_iov_cnt(void)
     qtest_quit(s);
 }
 
+/*
+ * Overflow SGL buffer.
+ * https://gitlab.com/qemu-project/qemu/-/issues/521
+ */
+static void test_gitlab_issue521_megasas_sgl_ovf(void)
+{
+    QTestState *s = qtest_init("-display none -m 32M -machine q35 "
+                               "-nodefaults -device megasas "
+                               "-device scsi-cd,drive=null0 "
+                               "-blockdev "
+                               "driver=null-co,read-zeroes=on,node-name=null0");
+    qtest_outl(s, 0xcf8, 0x80000818);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80000804);
+    qtest_outw(s, 0xcfc, 0x05);
+    qtest_bufwrite(s, 0x0, "\x01", 0x1);
+    qtest_bufwrite(s, 0x7, "\x01", 0x1);
+    qtest_bufwrite(s, 0x10, "\x02", 0x1);
+    qtest_bufwrite(s, 0x16, "\x01", 0x1);
+    qtest_bufwrite(s, 0x28, "\x01", 0x1);
+    qtest_bufwrite(s, 0x33, "\x01", 0x1);
+    qtest_outb(s, 0xc040, 0x0);
+    qtest_outb(s, 0xc040, 0x20);
+    qtest_outl(s, 0xc040, 0x20000000);
+    qtest_outb(s, 0xc040, 0x20);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -43,6 +71,8 @@ int main(int argc, char **argv)
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
                        test_lp1878263_megasas_zero_iov_cnt);
+        qtest_add_func("fuzz/gitlab_issue521_megasas_sgl_ovf",
+                       test_gitlab_issue521_megasas_sgl_ovf);
     }
 
     return g_test_run();
-- 
2.31.1


