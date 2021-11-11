Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F244D5AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:17:01 +0100 (CET)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml84i-0003nN-D6
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v6-00050w-Dv
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:04 -0500
Received: from [2a00:1450:4864:20::430] (port=35536
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v4-0001jU-Rf
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id i5so9184246wrb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bh9kIk+bt83GJ1fKJT1mekYlH7elEbiEfE8/vcn0SLk=;
 b=haHowDRp7jRrau8od0cTGi7Zxo9JjrtoQyrGAhKr0lKsHF9Gw2vcheNXuJJ5p0cixU
 PFL2qywGltAlQtt+OLBY+Cb+I26RIH9KwluwLKMyvzir0AkminSeNPDjl9Iw9CQCLHfa
 JYpEx/zIjM6g9Dd+6slJooyqrgYVN3LeQ5NMO0nGr244rAy6ntk55Ik8M9FN5y1ZCmJg
 oTCiUiY9HTedrGFnOU+b8z9nII/PTyQ1nbMuOGabrz15aC2LfKlUJiCJ+hVEa2gqFLHg
 QQQYrF3WEd6ygfu5j9S1rw2+2fW2+iYGim4OVGtdSRaXFv7ZzYktXlirCgE3Dwqo6kOC
 uHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bh9kIk+bt83GJ1fKJT1mekYlH7elEbiEfE8/vcn0SLk=;
 b=DTdgk5e8OF8qfWd6KmNBnaSaLyDSkfEra4ybM7Gcq1/f3cYmPquYXZaaNkXRdHLkCt
 u7fsc9AUnfRXcaJ5OXVh1A/MRD7m1arWMcgPayyuGiBzDjFoQzZFlRlX7F7N1FQVmOfr
 qwWxGhZfWmGamI6HlK94RZ06uyAdVTeyAodFa0r9+sSBmb+AD46q4rqd/JsItoNGVW61
 yOrcppq+7He107FIFUsvsQ9Ql3mibBk3BojmvKdnvFcS21a0NVuUZk51kSp+DbxJyPux
 3PkyzsIppaqy0UZeVfbYMKspX0/pVCKA9/MH7sIQ/DSNEaeyiMUEze5ASJu4PNZsjzqD
 Kipg==
X-Gm-Message-State: AOAM533qWZ1vhVH5Baj0XHG1IZVVI2zoaCEHMkMNGZYKfuWKE85ZsVbK
 KXhI8Z90I3pMEDsUlny5jAU6cnPb/hML0Pew9pc=
X-Google-Smtp-Source: ABdhPJwNgotYgQ8s50EJR5QGpMmqJ+84TSOij6Pm/ITA4Q/uCN+tR63FlL6eHIpRXMwzDNfcdndi0A==
X-Received: by 2002:adf:ee04:: with SMTP id y4mr7732908wrn.0.1636628821389;
 Thu, 11 Nov 2021 03:07:01 -0800 (PST)
Received: from localhost.localdomain
 (10.red-95-125-227.dynamicip.rima-tde.net. [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id j8sm2536684wrh.16.2021.11.11.03.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:07:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] tcg: Remove TCI experimental status
Date: Thu, 11 Nov 2021 12:06:54 +0100
Message-Id: <20211111110656.237727-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111110656.237727-1-richard.henderson@linaro.org>
References: <20211111110656.237727-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following commits (released in v6.0.0) made raised the
quality of the TCI backend to the other TCG architectures,
thus is is not considerated experimental anymore:
- c6fbea47664..2f74f45e32b
- dc09f047edd..9e9acb7b348
- b6139eb0578..2fc6f16ca5e
- dbcbda2cd84..5e8892db93f

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211106111457.517546-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/about/build-platforms.rst | 10 ++++++----
 meson.build                    |  4 ++--
 meson_options.txt              |  2 +-
 scripts/meson-buildoptions.sh  |  3 +--
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index bcb1549721..c29a4b8fe6 100644
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
index 9702fdce6d..2ece4fe088 100644
--- a/meson.build
+++ b/meson.build
@@ -335,7 +335,7 @@ tcg_arch = config_host['ARCH']
 if not get_option('tcg').disabled()
   if cpu not in supported_cpus
     if get_option('tcg_interpreter')
-      warning('Unsupported CPU @0@, will use TCG with TCI (experimental and slow)'.format(cpu))
+      warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
     else
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
@@ -3290,7 +3290,7 @@ endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
   if get_option('tcg_interpreter')
-    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, experimental and slow)'}
+    summary_info += {'TCG backend':   'TCI (TCG with bytecode interpreter, slow)'}
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
diff --git a/meson_options.txt b/meson_options.txt
index e740dce2a5..411952bc91 100644
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
index 55b8a78560..45e1f2e20d 100644
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
2.25.1


