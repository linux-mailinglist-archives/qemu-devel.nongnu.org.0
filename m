Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF6446528
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:41:23 +0100 (CET)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0PC-0003Fg-4Q
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0Ia-0002Yw-1y
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:32 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0IY-0006r2-4C
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so6566864wmb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUXnrrtPJ+o1kaG8ccIu9sfTqlabICw/ainFxnAC26E=;
 b=KESZbC21w8CZbg+EUlmh/k6lGcN+vd2LYqIRQ53fu50TuL2wTlCH8+UM8R18tYQNSG
 wYmCQ8Nt4z47nyVmDuxfwTzzWsu+9MpvZAUSuUPkLqqXialSJk+Is3nV3cbPOwk2uLjZ
 WBELNwXVl75BlHr2igvXQQIGC8Kx3V6bK68uwBymxMCwIgBzqwzN3t90aVWWyMQ4YMT8
 k7e+G/0yD6kcyufJoWAyyCt4NyOXetoglyuKtsvHUPS37Wi0N8WfoDAI7URLrEinL3Zh
 wPhxUz6KunNPpOcbnYWnSEdYxUiO3qRWB8GbAqrnCr+ILbCFC4Oe5pVKZwH0qSdZpgqf
 HgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SUXnrrtPJ+o1kaG8ccIu9sfTqlabICw/ainFxnAC26E=;
 b=aRvv+NjxARJdInmIAXCBogtlj9MtBTzzaeIan9DTAqTMJXozsM0OUZBPQ7p6UUGwCT
 Rf55wEKeTxGVMrsxDyvRkKAcyQ/8ltcdTvIHZYVerO9s2uSFXY+XpZPsvKRbentZFlF1
 /OtqhWylHzF3KVTrxi2tIdlDG0V74CjFhyoDKhV+3EeBtBRDmdOD984I3q0fimmVgFSH
 loOOe5lefzGQJbGILQmsh92/C1QQGiB7PY9vy56n88BDtz/G2dhQUmIMfldxZ4g8v2CL
 RVvJDvv8aqYSi3nVIhC4L4SLq624o0fJxd2Fhfhg2v1DFWuyx0vGPIOWdQYF0Sf7j4rK
 /BQA==
X-Gm-Message-State: AOAM530vLfrhjzpAbiSFOQlo63x/jaF8aka8w8qWJNTwfVvFroK5B7Wb
 C1FXLUfOSYS47ICjo5XbHtlSfwBBM4w=
X-Google-Smtp-Source: ABdhPJxzmcWC2QBjitjZhH1YFrCyrH2zSwzi7UPDOBA2Df6HJ7mL0Kx4k2zuws0NjDjkywHPia+DvQ==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr30922132wmj.91.1636122868632; 
 Fri, 05 Nov 2021 07:34:28 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l8sm12698557wmc.40.2021.11.05.07.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:34:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/6] tests/acceptance: Make pick_default_qemu_bin() more
 generic
Date: Fri,  5 Nov 2021 15:34:12 +0100
Message-Id: <20211105143416.148332-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105143416.148332-1-f4bug@amsat.org>
References: <20211105143416.148332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pick_default_qemu_bin() generic to find qemu-system or
qemu-user binaries.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211102084232.2965062-3-f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index a495e106d03..984c554e7d6 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -45,7 +45,7 @@ def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
 
-def pick_default_qemu_bin(arch=None):
+def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     """
     Picks the path of a QEMU binary, starting either in the current working
     directory or in the source tree root directory.
@@ -64,7 +64,7 @@ def pick_default_qemu_bin(arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = "./qemu-system-%s" % arch
+    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
     if is_readable_executable_file(qemu_bin_relative_path):
         return qemu_bin_relative_path
 
@@ -179,14 +179,14 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
-    def setUp(self):
+    def setUp(self, bin_prefix):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
         self.cpu = self.params.get('cpu',
                                    default=self._get_unique_tag_val('cpu'))
 
-        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
+        default_qemu_bin = pick_default_qemu_bin(bin_prefix, arch=self.arch)
         self.qemu_bin = self.params.get('qemu_bin',
                                         default=default_qemu_bin)
         if self.qemu_bin is None:
@@ -214,7 +214,7 @@ class Test(QemuBaseTest):
     def setUp(self):
         self._vms = {}
 
-        super().setUp()
+        super().setUp('qemu-system-')
 
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
-- 
2.31.1


