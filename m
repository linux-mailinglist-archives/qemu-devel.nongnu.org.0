Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DCF4D9BB0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:58:15 +0100 (CET)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6kg-0006Mt-12
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:58:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6gj-0003pt-VP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:10 -0400
Received: from [2607:f8b0:4864:20::429] (port=46635
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6gh-0007e4-QN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:09 -0400
Received: by mail-pf1-x429.google.com with SMTP id s11so19477424pfu.13
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3t4JkKVu4nm0xKX1SYsaS01qBX8DSvVvUSoQ9fq1mk=;
 b=K1cGaLA9q0/2ZwF74aQJkteTvs8UTZSxMorNNVEzT/M+8uoHDLPtY6XFcWaC9inJi1
 HaZTKXV27FYsPlMjFoa79pPrHsI7kOYIgn42PL9ZFvVcAbFJ/rsUscCH9raimYOTOCk5
 F/yI+JhvwvojrODI74HazFv8Ha+c+SoAPUP6xaXEUkp7wQ2HAExre/Jtj+ls5EYj4rgc
 dqwSCfOWfQazO/e96LlZrxKSl5g/0Gw/2hKq1LB80Jr+OeCH0+fHvkvQYDJBnzhaHlxi
 P+CbJD5WyeDarUUDuZdjtk7NVtKrOc4OEJLt5T1+6X6L0Ym8g4IaINbdXEml7p68ilgb
 Rttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3t4JkKVu4nm0xKX1SYsaS01qBX8DSvVvUSoQ9fq1mk=;
 b=lysle1YnNBMDmatmqqPlrvki5EZuZM6FiPW18TtlqvpVH6zjc4WE2ADzoxigDLv2PQ
 yacOVtdtYKRE1IzOU5dj4BfE2jkHMTo8dZ4jPb+B3n+jxgQhpNOpCGUdagE2RLzNTtOn
 Hc7wSVoz98xs2+iaedw17SsARJSIkrVlOEWZUfv3rPDAbrObWS3ZIivYBb31RU4vVv9B
 UG4nzYFhakb23VYtk/2Zck94JQ0entzNktVjKTfDZl/FzzSAYnmxpLr/SPGJTbp7WSA+
 VcksdP+sbnvqkKUv8W8uHApU49mPwkJQp/9uSgRlKPcwSESp/Gf053CX96+eJ7eybbSd
 kcQQ==
X-Gm-Message-State: AOAM533PesZDWhbrXTvmBd5OgWSxS6NkGAI/ojP5Tjwx9TFIaaGIoUfN
 EDD0ELoxU+uoEllcta8AlxF9CRLAYkM=
X-Google-Smtp-Source: ABdhPJzlJ0NhDwHc9Acce4poCLmRYeHICI27GbCK1xQsKpZyIE5r/GUBcYLO3jjKEsT56qGfR8GjdQ==
X-Received: by 2002:a05:6a00:1483:b0:4f7:af9a:c807 with SMTP id
 v3-20020a056a00148300b004f7af9ac807mr14885607pfu.17.1647348845692; 
 Tue, 15 Mar 2022 05:54:05 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm24445749pfx.81.2022.03.15.05.54.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:54:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] configure: Allow passing extra Objective C compiler flags
Date: Tue, 15 Mar 2022 13:53:30 +0100
Message-Id: <20220315125350.82452-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
variables, or via configure --extra-cflags / --extra-cxxflags /
--extra-ldflags options. Provide similar behavior for Objective C:
use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 8 ++++++++
 meson.build | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/configure b/configure
index 886000346a..2bf40d9eeb 100755
--- a/configure
+++ b/configure
@@ -285,6 +285,7 @@ done
 
 EXTRA_CFLAGS=""
 EXTRA_CXXFLAGS=""
+EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
 xen_ctrl_version="$default_feature"
@@ -366,9 +367,12 @@ for opt do
   --extra-cflags=*)
     EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
     EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
+    EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
     ;;
   --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
   ;;
+  --extra-objcflags=*) EXTRA_OBJCFLAGS="$EXTRA_OBJCFLAGS $optarg"
+  ;;
   --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
   --enable-debug-info) debug_info="yes"
@@ -748,6 +752,8 @@ for opt do
   ;;
   --extra-cxxflags=*)
   ;;
+  --extra-objcflags=*)
+  ;;
   --extra-ldflags=*)
   ;;
   --enable-debug-info)
@@ -1172,6 +1178,7 @@ Advanced options (experts only):
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
+  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
@@ -3137,6 +3144,7 @@ if test "$skip_meson" = no; then
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
diff --git a/meson.build b/meson.build
index 2d6601467f..351f9f4360 100644
--- a/meson.build
+++ b/meson.build
@@ -3467,6 +3467,11 @@ if link_language == 'cpp'
                                                + ['-O' + get_option('optimization')]
                                                + (get_option('debug') ? ['-g'] : []))}
 endif
+if targetos == 'darwin'
+  summary_info += {'OBJCFLAGS':       ' '.join(get_option('objc_args')
+                                               + ['-O' + get_option('optimization')]
+                                               + (get_option('debug') ? ['-g'] : []))}
+endif
 link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
-- 
2.34.1


