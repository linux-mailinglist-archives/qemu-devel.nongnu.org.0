Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95968AEBA
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 08:45:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOZh7-0004PS-P2; Sun, 05 Feb 2023 02:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pOXYV-0004vK-VW; Sun, 05 Feb 2023 00:27:13 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pOXYT-000101-8E; Sun, 05 Feb 2023 00:27:11 -0500
Received: by mail-qv1-xf35.google.com with SMTP id e6so3230911qvp.1;
 Sat, 04 Feb 2023 21:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zkCXVLABK2qkEkox8WTVBUYOlF+Jr4yY8Kcm4bIe9FU=;
 b=LaCaaXOivHjMyQfk+W/+TOSkem2yuiPzw/6nZejTSzQxZSpAKZbVv/2+EOikMCxSDl
 JfeqPn7HKALDbjB9lL6cfsRVy2GGNMkPfE5qCf6C6v92czsm6EmkB+6RlyLTuXJNaK3Y
 4Ca8TXFK+jXtLgPAO5ej37k6MHe6CvESLm0ctVmEu0aKtCl1mhqmaM1dlIuW3k0MNL3L
 0VquhSTcmpQkZmLo3VeeySsV3GGv4g7o9/ymSaL6k5xo0baT9T5FNgL2vb02BLf/rGR8
 2zGkbmxJo2mNbbuyoILQCKa0W84gsAbcu4c+GQRDt7cjSfFVWexs6fTANU0h1DjwYPh8
 S8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zkCXVLABK2qkEkox8WTVBUYOlF+Jr4yY8Kcm4bIe9FU=;
 b=XSjexKxbEq7IaBYUJrgLjD4yn8WTBO249pVzAyn3YLjxL3ADG3Og0pRMCOjXACMFvp
 taYrmjXiEz5Hpl6Voq+zerFh/yQWQafE5ljwZALW3YSmJO2MtcmxIXRfTlHSSHDHHnrq
 fnrpehPDyozAiusmalt3rGwOs44Lt3IatecKA7D0xznNWLbn+GrKxcsE439I1eZKzzFb
 isxFc7tOBZ5ajYUzi12wO4S2W93NQhOJD1pIwyO4+R8oFDPiya6RGtnqU4fasXty7uEb
 u/YGquwzaVK5VCQUkZo7mMwesA0SC6S1oFmCTJo52L4IFUTznbJAej//smEHGhhnIQ35
 70cQ==
X-Gm-Message-State: AO0yUKVXB1asJtlBjk+lqumlTDIisFYWCfA53GOC39peBmJxChMQAzcB
 L/KeobbFb589HW9uiUwWJLwwPxNLKWP4zw==
X-Google-Smtp-Source: AK7set9laWqKgFo+iZGVZ8f3QY4T/KlsQ0h4pq0IvdK/HjJ++c4nsshg0f2GqiBZcukGb63zyu0W8w==
X-Received: by 2002:a05:6214:4a4f:b0:53a:a39f:b237 with SMTP id
 ph15-20020a0562144a4f00b0053aa39fb237mr20606415qvb.24.1675574825734; 
 Sat, 04 Feb 2023 21:27:05 -0800 (PST)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::2bf5])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a05620a16b400b0071f40a59fe5sm4956418qkj.127.2023.02.04.21.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 21:27:05 -0800 (PST)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dinah Baum <dinahbaum123@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] configure: Add 'mkdir build' check
Date: Sun,  5 Feb 2023 00:26:36 -0500
Message-Id: <20230205052636.11822-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Feb 2023 02:44:06 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU configure script goes into an infinite error printing loop
when in read only directory due to 'build' dir never being created.

Checking if 'mkdir dir' succeeds and if the directory is
writeable prevents this error.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321

Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
---
 configure | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 64960c6000..fe9028991f 100755
--- a/configure
+++ b/configure
@@ -32,9 +32,11 @@ then
     fi
 
     mkdir build
-    touch $MARKER
+    if [ -d build ] && [ -w build ]
+    then
+        touch $MARKER
 
-    cat > GNUmakefile <<'EOF'
+        cat > GNUmakefile <<'EOF'
 # This file is auto-generated by configure to support in-source tree
 # 'make' command invocation
 
@@ -56,8 +58,15 @@ force: ;
 GNUmakefile: ;
 
 EOF
-    cd build
-    exec "$source_path/configure" "$@"
+        cd build
+        exec "$source_path/configure" "$@"
+    elif ! [ -d build ]
+    then
+        echo "ERROR: Unable to create ./build dir, try using a ../qemu/configure build"
+    elif ! [ -w build ]
+    then
+        echo "ERROR: ./build dir not writeable, try using a ../qemu/configure build"
+    fi
 fi
 
 # Temporary directory used for files created while
@@ -181,9 +190,12 @@ compile_prog() {
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
 symlink() {
-  rm -rf "$2"
-  mkdir -p "$(dirname "$2")"
-  ln -s "$1" "$2"
+  if [ -d $source_path/build ] && [ -w $source_path/build ]
+  then
+      rm -rf "$2"
+      mkdir -p "$(dirname "$2")"
+      ln -s "$1" "$2"
+  fi
 }
 
 # check whether a command is available to this shell (may be either an
@@ -2287,7 +2299,18 @@ fi
 #######################################
 # generate config-host.mak
 
+if ! [ -d $source_path/build ] || ! [ -w $source_path/build ]
+then
+    echo "ERROR: ./build dir unusable, exiting"
+    # cleanup
+    rm -f config.log
+    rm -f Makefile.prereqs
+    rm -r "$TMPDIR1"
+    exit 1
+fi
+
 if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
+    echo "BAD"
     exit 1
 fi
 
-- 
2.30.2


