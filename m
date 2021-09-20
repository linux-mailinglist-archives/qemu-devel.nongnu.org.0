Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D38410F7B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:24:50 +0200 (CEST)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSCjR-00051S-Ab
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSChr-000427-Ki
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:23:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSChp-00066Q-VG
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:23:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id s24so12212165wmh.4
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FmmmkJcVLp3VrlEU4lnz8fBK/zlo9tzrGDjRgdWbG3k=;
 b=ODcfiPji3XeHeamZ1YQ6498JaHjwA+i0bq7XQ7dU1F8GB5oq76Tz13YoIGEe5YVdWJ
 UoYoSd4QKVfRBJAsyn7uiL+TNPYxuCNIk8CHM3nvDDX29okVKJS/MXQDMkjCkabpkEI7
 1V0MCRgLw9tpAX7HjiwaDVUKla7yEX+xrpnFqGVtBzM6RxIYyQ+oxbbqjRx2bmp41pSp
 JCgB2mMPs/P56UpQFlYNLqSXBsEKpUaELhb5Q+S/HAva1k2XaoXozWbRvPuTIYHWsQmn
 Ud8T84iA6/9TVwDXvToTGmqnNg+Bc/+nzsOVWe8UMshhl6u1/0cmiRfdVvKv4NiFfZyU
 Sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FmmmkJcVLp3VrlEU4lnz8fBK/zlo9tzrGDjRgdWbG3k=;
 b=tW2ZRGC40F1B17fDsyCIOUflzATU6mla1b1O+IwTTCP5rHdvW0AgOh33iYpVwaP6eF
 D/GAZ8CIQpaAfipaplnj7KE0OsdpBAO8y3rKdWcq1Gd/J7e2vPLcZXjWkRx2Ecqy676S
 nHDaXzL8Qv1E0IJwwGzcU/gJmEO0yk5swvGCMVQslrDrayLtA+cAFVnHuUPDoiRQxGbR
 wXXo0Ded3o+061cG3xkouBshB2Tl8z/4oxD/BolxlRg3RWnCqiDTpnwd3/dVfOY6MAyC
 rV4JNACmOGoZG6xb+M3NSY+fydXx+qg8qa/8q9wvWaaRtRFG9YrEgb5+dVU76fmo+uyz
 oRzA==
X-Gm-Message-State: AOAM533tLUNyV9m7vwEG6Idu+7T23THOHjlC5ywv3fmU5n2Q1//d74Cs
 Hpip+5LPi7v9ViORNiblFOO36UALb7s=
X-Google-Smtp-Source: ABdhPJxhucOM0Wc2T+I5SmPVLHN7Lke4cykjwdvfEiuDTkOC+lIdnB6L3fQ99c/hjrHCG1pF8zYJJQ==
X-Received: by 2002:a7b:cf09:: with SMTP id l9mr22359228wmg.115.1632118988265; 
 Sun, 19 Sep 2021 23:23:08 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id s14sm14619937wrp.84.2021.09.19.23.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:23:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/tci: Remove its experimental status
Date: Mon, 20 Sep 2021 08:23:06 +0200
Message-Id: <20210920062306.2723797-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
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
 docs/about/build-platforms.rst | 4 ++--
 configure                      | 2 +-
 meson.build                    | 4 ++--
 meson_options.txt              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index bcb15497213..2eff89e8cba 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -56,8 +56,8 @@ Those hosts are officially supported, with various accelerators:
 
 Other host architectures are not supported. It is possible to build QEMU on an
 unsupported host architecture using the configure ``--enable-tcg-interpreter``
-option to enable the experimental TCI support, but note that this is very slow
-and is not recommended.
+option to enable the TCI support, but note that this is very slow and is not
+recommended.
 
 Non-supported architectures may be removed in the future following the
 :ref:`deprecation process<Deprecated features>`.
diff --git a/configure b/configure
index 1043ccce4f9..26c0d0128c0 100755
--- a/configure
+++ b/configure
@@ -1814,7 +1814,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
+  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
diff --git a/meson.build b/meson.build
index 2711cbb789c..8b52675d7e8 100644
--- a/meson.build
+++ b/meson.build
@@ -249,7 +249,7 @@
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -2987,7 +2987,7 @@
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   if get_option('tcg_interpreter')
-    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, slow)'}
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6a..3a77a93ad7f 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -42,7 +42,7 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
-       description: 'TCG with bytecode interpreter (experimental and slow)')
+       description: 'TCG with bytecode interpreter (slow)')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
-- 
2.31.1


