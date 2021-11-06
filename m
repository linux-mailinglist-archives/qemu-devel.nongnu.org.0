Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B237F446D8F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:16:06 +0100 (CET)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjJg5-0000sg-Bi
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjJf4-0008Rq-Ul; Sat, 06 Nov 2021 07:15:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjJf2-0005F9-Nq; Sat, 06 Nov 2021 07:15:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id v127so9097127wme.5;
 Sat, 06 Nov 2021 04:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTcXNGWKRza87XKImQt6K3icJ0I/BqQ9EWb0BFs0g20=;
 b=SnCbX1lvh7Hf40D4EklqSftfL3SANd4Qp4v4XKGArCxLzDzT6Kgnwrw7uJayYEIGmp
 EZ5RmaCOi+RdnzUO/FMHYBK/oi1XQ1yxXBxLxPZNN/SKdhndrJFfsklQWT9iPBbvaLZF
 RfJ5tU3B7cnCUheiECBilbb1w3UeD5mq6C4nTfM0bFYxPQpUfR0ww4ubqlyT29rqbekI
 MAUQfvcI+2h8z628I3/Bfz28bPpma7I7x+TVSbw7TXWtaRZaZbJb4Y2J2HhYL2jJ5o+D
 iZ3+ycRbsYmYY365zKL4NwnE5n84CE1kQcxmFb5SHW4+8PKTRIMNK2ySdpGHe0PL2IeQ
 djWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tTcXNGWKRza87XKImQt6K3icJ0I/BqQ9EWb0BFs0g20=;
 b=4tM5U2btBrFHZmSOW7Qep7gvB5Sm4K7Fqyahx51muY/+OiGsqff00QHVJzhb7IGll1
 VK4HIbq4N6xQ3okA8bciHjB0t+E/xFiZA96CmlUguBjZwThTtsvWpXfqi4YDksNI1qlA
 4sj7bbEdVw1MXTq8n9+tf5oVjvnkG+tmCqr8fDzOfQ1pZiE6Y+ka43vSuWKR+ljt3bZs
 o1TK1/8x9HbPUtBpZZvEWsWsJr/7a6WGvQdgvHaogRl+nUh4Vq4jWYWRUArAnhgmD9On
 mhcqw+T+n2zO23uUVhDsWgQjLjp1t+Hglgf6vEgAtlEUsvQoBDZR6Vjcy6VGcYzEMZVW
 6iRg==
X-Gm-Message-State: AOAM530x89+Ru6YylBoB8HIjGPJVtDK8YZDNfSWUZKED1Km9PJy4vfsZ
 XLSzIxTgady4ma9WJ3w3DU351ASs4/0=
X-Google-Smtp-Source: ABdhPJzddH+2+Yx8vbx1WVGRWB7m8CiuwHrQP0pt78vB31nFYjzfVANyx0tdKb327AYQsgzG92fmKw==
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr36218629wml.146.1636197298640; 
 Sat, 06 Nov 2021 04:14:58 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t17sm3138529wmq.13.2021.11.06.04.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 04:14:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tcg: Remove TCI experimental status
Date: Sat,  6 Nov 2021 12:14:57 +0100
Message-Id: <20211106111457.517546-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following commits (released in v6.0.0) made raised the
quality of the TCI backend to the other TCG architectures,
thus is is not considerated experimental anymore:
- c6fbea47664..2f74f45e32b
- dc09f047edd..9e9acb7b348
- b6139eb0578..2fc6f16ca5e
- dbcbda2cd84..5e8892db93f

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- rebase
- precise sysemu/user (Richard)

Supersedes: <20210920062306.2723797-1-f4bug@amsat.org>
---
 docs/about/build-platforms.rst | 10 ++++++----
 meson.build                    |  4 ++--
 meson_options.txt              |  2 +-
 scripts/meson-buildoptions.sh  |  3 +--
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index bcb15497213..c29a4b8fe64 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -54,10 +54,12 @@ Those hosts are officially supported, with various accelerators:
    * - x86
      - hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
 
-Other host architectures are not supported. It is possible to build QEMU on an
-unsupported host architecture using the configure ``--enable-tcg-interpreter``
-option to enable the experimental TCI support, but note that this is very slow
-and is not recommended.
+Other host architectures are not supported. It is possible to build QEMU system
+emulation on an unsupported host architecture using the configure
+``--enable-tcg-interpreter`` option to enable the TCI support, but note that
+this is very slow and is not recommended for normal use. QEMU user emulation
+requires host-specific support for signal handling, therefore TCI won't help
+on unsupported host architectures.
 
 Non-supported architectures may be removed in the future following the
 :ref:`deprecation process<Deprecated features>`.
diff --git a/meson.build b/meson.build
index 47df10afc21..16de7103d69 100644
--- a/meson.build
+++ b/meson.build
@@ -331,7 +331,7 @@
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -3286,7 +3286,7 @@
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   if get_option('tcg_interpreter')
-    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, slow)'}
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
diff --git a/meson_options.txt b/meson_options.txt
index e740dce2a51..411952bc91a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -59,7 +59,7 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
-       description: 'TCG with bytecode interpreter (experimental and slow)')
+       description: 'TCG with bytecode interpreter (slow)')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 55b8a785600..45e1f2e20da 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -13,8 +13,7 @@ meson_options_help() {
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
   printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
-  printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (experimental and'
-  printf "%s\n" '                           slow)'
+  printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
   printf "%s\n" '  --enable-trace-backends=CHOICE'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
-- 
2.31.1


