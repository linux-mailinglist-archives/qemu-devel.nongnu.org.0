Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CFA46016D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 21:22:46 +0100 (CET)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr4Dd-00061D-9b
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 15:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ah-0003q1-Ir
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:43 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=35807
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ag-0004uU-9d
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:43 -0500
Received: by mail-io1-xd2a.google.com with SMTP id 14so15818900ioe.2
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 12:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rtiy+rgX5dTfBlv3E94hpueK7awXe/1kmS2lnCTQDNA=;
 b=ytThQhic7MHv5GgTI0CHz+gKQaZcbKGT/EzTCpzGmQfYRK/ZeDk6ClRRq2ONoTMg2h
 t/qIoa67zhP/HD/3M0dWHiN4fZfFdd2OpG2d/zWvfLbCy5uOUAC+0Aqo4TDWkYoUWuGo
 Ta48VqESaF2tDE3nCywCIkYGMYMwCu0z++TE4KRVsJu/PgdbiTmdQ2/qtZI7kbraBngH
 7fW2SHIgkOptFl3BNWBnva2eb4zpQWwV6ey2cyuH7bxIbOxbl5SniQcowYgX5h2tFqVN
 6heX2y1opk6AY/YOUP4kv6t/6QAuTMCe+isJ5FCctXammM6KhaWagmvacZhbtncqiKSB
 PxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rtiy+rgX5dTfBlv3E94hpueK7awXe/1kmS2lnCTQDNA=;
 b=TJpG8FcA1azn6GXX57v+kjd73cf1noyYgi/DDglzQi3FkkWRmA27C525ruk25ImJU2
 2Z2S/MUsEO3sBgDWVMEAouttmq5AWTgFl2vNXczUnq89RvZbjVVwZJkv7B1qgFf+74cH
 2Pw6L86oGWF1mAGlkd1Gn/t8YyTjhrEvcti07bJOX0azMayDextIVXOs8rSqxPXld/on
 g5hwigMNtawRL0K8Coy7WaxmvxEjEWInLED25wY2BgpQ9uC9mxfamX+8/MENBCtGkmOK
 rHdJ9UfKP4iGh/oAAe1K5WGWtahA1ptBqWq17UyhRmz82XA1ffoGUvHumOcvPJOC899d
 lBkA==
X-Gm-Message-State: AOAM531V0hPXQVPBgdOfQFscQflqvrVdyWqg7Q6OX5oodenGBjGALkkx
 YEROKYzJYZzOXRotyMwQlvnJLdaMIls5Rzkk
X-Google-Smtp-Source: ABdhPJyd0EwU1g2XqEx79VhAB/Z+QApS8lDMHqw2RHJuJuEaAKSS08vC92UCrEEEdNPHuj6TxgjM0g==
X-Received: by 2002:a5e:c645:: with SMTP id s5mr44293413ioo.154.1638044381145; 
 Sat, 27 Nov 2021 12:19:41 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h12sm3091632ila.81.2021.11.27.12.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 12:19:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 7.0 5/5] bsd-user-smoke: Add to build
Date: Sat, 27 Nov 2021 13:18:46 -0700
Message-Id: <20211127201846.64187-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127201846.64187-1-imp@bsdimp.com>
References: <20211127201846.64187-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: arrowd@freebsd.org, kevans@freebsd.org, richard.henderson@linaro.org,
 f4bug@amsat.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a simple bsd-user smoke test for ensuring bsd-user is minimally
functional. This runs only when bsd-user has been configured. It adds a
simple execution of 'hello world' type binaries for bsd-user. At the
present these are tiny, hand-crafted binaries that are statically linked
and do not depend on any host libraries being present (they also take
advantage of the fact that on FreeBSD all system call numbers are
uniform on all architectures). This was done both for building and
testing simplicity, as well as recognizing the current state of bsd-user
in qemu upstream is extremely basic.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 tests/bsd-user-smoke/meson.build | 31 +++++++++++++++++++++++++++++++
 tests/meson.build                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 tests/bsd-user-smoke/meson.build

diff --git a/tests/bsd-user-smoke/meson.build b/tests/bsd-user-smoke/meson.build
new file mode 100644
index 00000000000..586697ab3b6
--- /dev/null
+++ b/tests/bsd-user-smoke/meson.build
@@ -0,0 +1,31 @@
+if not have_bsd_user
+   subdir_done()
+endif
+
+smoke_bsd_user = find_program('smoke-bsd-user')
+
+bsd_user_archs = [ 'armv7', 'amd64', 'i386' ]
+targs = []
+foreach i : bsd_user_archs
+    h = 'h.' + i
+    targs += custom_target('bsd-user h.' + i,
+        output : h,
+	input : h + '.S',
+	command : ['clang',
+	    '-target',
+	    i + '-unknown-freebsd14.0',
+	    '-o',
+	    '@OUTPUT@',
+	    '@INPUT@',
+	    '-nostdlib',
+	    '-Wl,-e',
+	    '-Wl,qemu_start',
+	    '-static'],
+	install : false)
+endforeach
+
+test('bsd-user-smoke', smoke_bsd_user,
+    args: [meson.project_build_root(), meson.current_build_dir()],
+    suite: 'smoke',
+    depends: targs
+)
diff --git a/tests/meson.build b/tests/meson.build
index 3f3882748ae..3b95efe8896 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,6 +1,7 @@
 py3 = import('python').find_installation()
 
 subdir('bench')
+subdir('bsd-user-smoke')
 
 test_qapi_outputs = [
   'qapi-builtin-types.c',
-- 
2.33.0


