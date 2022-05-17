Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E02529E72
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:47:56 +0200 (CEST)
Received: from localhost ([::1]:46670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqto3-0000eV-Nu
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTr-0000LA-Sn
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTl-0003gP-Fg
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFQ1xQgSmcMha81R6gI1HzNhrYejEQ7lol5HB06VvyU=;
 b=dowJfjxp+AhKVUhaHUX+gH4GNjsPInKsD7OmWTAKdwy5VZz9U1mGx0nrtyZj5Ecqk4teAO
 sN2KCVmXwCfBeH7aqr2QCCtU+1I5MpeZA5P2iufaot5Uc1teO90Ftj3SOXenFaRGXUQ0s5
 eXPHgUn3gzfRQEarS+VYFVDx1xokPMI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-lLFVq0mHMZqyUc6tqwHJOg-1; Tue, 17 May 2022 05:26:50 -0400
X-MC-Unique: lLFVq0mHMZqyUc6tqwHJOg-1
Received: by mail-ej1-f69.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso6983767ejy.19
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFQ1xQgSmcMha81R6gI1HzNhrYejEQ7lol5HB06VvyU=;
 b=A4UtvDl+RgCqcGFwwSqUJrGcGFBZNOlWh8RjxVuGVgTRTYWmurB5Pdyc13l5qayAfs
 yD8tOX58fJ5tYZdR79t3RIqEY67lkHKsh9V5X0n5xavrnWReVs0tt4+B9QItY4ww6056
 wWy/8+TCyCA8OITGQp8hH++onVVqDQWZ0BFTp710SyPUYeraJcHDOUi8k7UJ/xiYe8F2
 ydvTEAxeO4xDBt6OoRIZvsBbY6Jevk58S4HES1xIm/DjUoOV4x+aQV4c3TSBEjk2DWOM
 /u4g6QhG0lphk09wkr7KKfOrE81mpS37RlLwuJ5PxVC0MJOvKXK90B8CnMWS/2/qsupd
 /oiQ==
X-Gm-Message-State: AOAM532NBPLPAk1hNPj4pmOJIG1dTyldU8W6Sn9Y4QQE77xHc5d3rQtK
 x5VikNzYtfgBULNK+D0EDHb0x25eIjs0Gs1XtJ0cbVtzqGMj2q1wL/tmxVu/xb/E5nZkBXzHDI4
 O50m5IZoov4F+2cm4/nPALEhYYmJg95UaH2ZHT1TEEarCJm8evcpNZubk1tIKJyGJ6hc=
X-Received: by 2002:a05:6402:5202:b0:427:f1a2:305c with SMTP id
 s2-20020a056402520200b00427f1a2305cmr17548171edd.39.1652779608936; 
 Tue, 17 May 2022 02:26:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlTbq6iwVy3Ym/I1wCYpBn1NBeHAaqLiyo/kHX4lri6Xkw8++wADi5IZ/MYo8KUXUKmA3MHA==
X-Received: by 2002:a05:6402:5202:b0:427:f1a2:305c with SMTP id
 s2-20020a056402520200b00427f1a2305cmr17548144edd.39.1652779608601; 
 Tue, 17 May 2022 02:26:48 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 zp8-20020a17090684e800b006f3ef214e2csm819817ejb.146.2022.05.17.02.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 12/16] configure: move symlink configuration earlier
Date: Tue, 17 May 2022 11:26:12 +0200
Message-Id: <20220517092616.1272238-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Ensure that the pc-bios/optionrom and pc-bios/s390-ccw directory
exist at the time when we'll write out the compiler configuration
for them.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 49 ++++++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index 5db0082ddc..cf439e2deb 100755
--- a/configure
+++ b/configure
@@ -2205,6 +2205,30 @@ fi
 
 QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
+# Set up build tree symlinks that point back into the source tree
+# (these can be both files and directories).
+# Caution: avoid adding files or directories here using wildcards. This
+# will result in problems later if a new file matching the wildcard is
+# added to the source tree -- nothing will cause configure to be rerun
+# so the build tree will be missing the link back to the new file, and
+# tests might fail. Prefer to keep the relevant files in their own
+# directory and symlink the directory instead.
+LINKS="Makefile"
+LINKS="$LINKS tests/tcg/Makefile.target"
+LINKS="$LINKS pc-bios/optionrom/Makefile"
+LINKS="$LINKS pc-bios/s390-ccw/Makefile"
+LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
+LINKS="$LINKS tests/avocado tests/data"
+LINKS="$LINKS tests/qemu-iotests/check"
+LINKS="$LINKS python"
+LINKS="$LINKS contrib/plugins/Makefile "
+for f in $LINKS ; do
+    if [ -e "$source_path/$f" ]; then
+        mkdir -p `dirname ./$f`
+        symlink "$source_path/$f" "$f"
+    fi
+done
+
 # Mac OS X ships with a broken assembler
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
@@ -2423,31 +2447,6 @@ if test "$safe_stack" = "yes"; then
   echo "CONFIG_SAFESTACK=y" >> $config_host_mak
 fi
 
-# If we're using a separate build tree, set it up now.
-# LINKS are things to symlink back into the source tree
-# (these can be both files and directories).
-# Caution: do not add files or directories here using wildcards. This
-# will result in problems later if a new file matching the wildcard is
-# added to the source tree -- nothing will cause configure to be rerun
-# so the build tree will be missing the link back to the new file, and
-# tests might fail. Prefer to keep the relevant files in their own
-# directory and symlink the directory instead.
-LINKS="Makefile"
-LINKS="$LINKS tests/tcg/Makefile.target"
-LINKS="$LINKS pc-bios/optionrom/Makefile"
-LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
-LINKS="$LINKS tests/avocado tests/data"
-LINKS="$LINKS tests/qemu-iotests/check"
-LINKS="$LINKS python"
-LINKS="$LINKS contrib/plugins/Makefile "
-for f in $LINKS ; do
-    if [ -e "$source_path/$f" ]; then
-        mkdir -p `dirname ./$f`
-        symlink "$source_path/$f" "$f"
-    fi
-done
-
 # tests/tcg configuration
 (makefile=tests/tcg/Makefile.prereqs
 echo "# Automatically generated by configure - do not modify" > $makefile
-- 
2.36.0


