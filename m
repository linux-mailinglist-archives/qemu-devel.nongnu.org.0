Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9B68FB37
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:33:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtuW-0003Be-Py; Wed, 08 Feb 2023 18:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPtuO-00038i-Kc
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:31:24 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPtuM-0005rH-Rx
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:31:24 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id i1so278856qvo.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OnazYuHyxNSCi+Fg8vSUtnrPTevUheyj/KShdTnQ70o=;
 b=mHuinZ+Pr+r6EOgQDbjF8TD67lBunn2GBRphwRQIOym43bAB38hKJH1TFMVLzDN+Up
 DljKawni9RFSoKLW+NpgYApHWiPp5SqbTc+KMK2oloxrWbGcwILZNUlEav3wHgwJyk0t
 cMLojlfN9rUYDRo39ey0psbs1eYG/iysirNYJ//ulkEg1SpKGUa0y2OxEhE1z/t8GiCC
 4ZCRE4Wa1CrwXS5ZH0RAutFwXUNuChogC7bySP7JeVmR9w4C51Q3SOy+JMUUpNilyunw
 PXCOtdLzdOzbLl7mD5bZzoEwTPBqwrc4KRrbEzuWUR5h5qhKJZ4vy7FM8w+/qyc5oWnY
 LbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OnazYuHyxNSCi+Fg8vSUtnrPTevUheyj/KShdTnQ70o=;
 b=VlGj54vk/GD6/2trVvmXcQpbQ9689RoPA0E6n/+bnbuXnXAUu9ZIAAk6HS0WpJiXWi
 YOcIP1XBkLzpkUQKnkuqsypYK8Mc3G3sDYMYuuLsFo7blg4/qKOujAmAPJxV+KOCneoo
 o9Z4M3h2HKfUoovHaBgdZDoK03l0y1fIlSbn3fW7kEnZlrQqjJ/wHkn9Fq+23w79DhOD
 aHa878nzLW6FBxhQHgEC+lKIobfQp6yZTuZNAODe2MFHWDNI7gz7+CQ+iol4lECDMW+6
 zmnJwiIylHQZVwzY1Zo8QjLUZEjemRDIC4WZc/3XdyovYq7er6pINglGTYrMfR4fB4Km
 GFpg==
X-Gm-Message-State: AO0yUKXjI+9uodKaEndx1Bk2SPyezgwUMmRpn6cCUZ3dkHTk6H9dj2a9
 9SLJPGr0k8kOl32UpHxY5s7bYmlLYoaLjw==
X-Google-Smtp-Source: AK7set/5Llpnr8HWLOGRexJaCTj0JxO3y/ZkEUG4GC1ioJI5ZezGaI1S2WbAMWoR1M7lV21nMf1oPg==
X-Received: by 2002:a05:6214:5299:b0:536:ba5e:6aa8 with SMTP id
 kj25-20020a056214529900b00536ba5e6aa8mr14039909qvb.49.1675899081369; 
 Wed, 08 Feb 2023 15:31:21 -0800 (PST)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::2bf5])
 by smtp.gmail.com with ESMTPSA id
 s63-20020a37a942000000b0071c9eea2056sm168048qke.14.2023.02.08.15.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 15:31:20 -0800 (PST)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/2] configure: Add 'mkdir build' check
Date: Wed,  8 Feb 2023 18:31:10 -0500
Message-Id: <20230208233111.398577-2-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208233111.398577-1-dinahbaum123@gmail.com>
References: <20230208233111.398577-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU configure script goes into an infinite error printing loop
when in read only directory due to 'build' dir never being created.

Checking if 'mkdir dir' succeeds prevents this error.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
---
 configure | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 64960c6000..3b384914ce 100755
--- a/configure
+++ b/configure
@@ -31,10 +31,11 @@ then
         fi
     fi
 
-    mkdir build
-    touch $MARKER
+    if mkdir build
+    then
+        touch $MARKER
 
-    cat > GNUmakefile <<'EOF'
+        cat > GNUmakefile <<'EOF'
 # This file is auto-generated by configure to support in-source tree
 # 'make' command invocation
 
@@ -56,8 +57,12 @@ force: ;
 GNUmakefile: ;
 
 EOF
-    cd build
-    exec "$source_path/configure" "$@"
+        cd build
+        exec "$source_path/configure" "$@"
+    else
+        echo "ERROR: Unable to use ./build dir, try using a ../qemu/configure build"
+        exit 1
+    fi
 fi
 
 # Temporary directory used for files created while
-- 
2.30.2


