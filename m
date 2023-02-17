Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F235F69B413
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 21:41:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT7X5-0000Pa-30; Fri, 17 Feb 2023 15:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pT7Wy-0000LT-KV; Fri, 17 Feb 2023 15:40:32 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pT7Wt-0000rq-ES; Fri, 17 Feb 2023 15:40:31 -0500
Received: by mail-qt1-x831.google.com with SMTP id l23so1914299qtj.1;
 Fri, 17 Feb 2023 12:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tUyuG/CRTSQnQCWXCu0mkyQIzHGiIdCBSGldULbzDRE=;
 b=GLyFXytDU/3BSAswHFdtOsELDH1MwRB8wzgc9tKlqn1CR+ZriXdAsGCFlUhkFOK3cw
 ZlmHWJMydGdD+Me2I8lMX00r1w0xxW0vUF+118JfnDO6lB/jkZegrRULgWpDfOk44Aml
 BsGLZL23moO4/lf/vHxPLA5YoMIi5loxOI4NlauJpgMRpYtPe1vigc5Y6Tv/8P60+lhU
 0JTiTzKP8ygOPY5gw0xp6NkltcbEkA+owWEw3OJSmmrLkbbyfplsB1Sm1Lekw2CN5TqI
 tTcGsoG7ymgSic5RgFjG9J4ix25INPz2Vnq56FrQVmAVcqkIowHB0fS0xgfNaWvXG+iV
 Yr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUyuG/CRTSQnQCWXCu0mkyQIzHGiIdCBSGldULbzDRE=;
 b=q/+thdLPOODi9FUW7xvZVU/a49MuZHc1gxbTeBERnavKllQggagkyU+FaVrl7IjeIl
 KhoCRytxFUzo6LC++jcPEtPcIVaRPoiKCeKzydENTrXLrMmvwNrpZyIVpt1nLSZBo6wo
 8blmeJ4At41GDO1IBCis761h6InVyqZUut8eHyJSEH1AGrGXwV32YnnnDdZj18zkmcYU
 AOlv5i7bywFzCWdqX9W4GpVz2wXDkotIqURru6hV9G0ljw7Vr21O9c8JA9fkX4aikmTy
 VxRDdq0h86HeSSmK3xq1Vkcwz/LBnk+QIYrOSX5ukoZ43mYZLpnfiLHuH+Z7q2aqZVM0
 nKNg==
X-Gm-Message-State: AO0yUKWDJe5Rm4P0UCgn9/o6QdFx+yiR5Jt0AnxMhYXl6Usn9vm+1xqW
 p79AheXNQPuXg46oONAAhiegdgIa1vC52w==
X-Google-Smtp-Source: AK7set8LYT3/ODu1GLwPoHIRlbp21jXV+4sfRnKRcTqy2BcCUQ5azYuMOY/i60nBbWtmV6Z9y/3FXA==
X-Received: by 2002:ac8:5742:0:b0:3b8:6dc8:a9b5 with SMTP id
 2-20020ac85742000000b003b86dc8a9b5mr11528936qtx.34.1676666424970; 
 Fri, 17 Feb 2023 12:40:24 -0800 (PST)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::2bf5])
 by smtp.gmail.com with ESMTPSA id
 l28-20020ac8459c000000b003b9bf862c04sm3952363qtn.55.2023.02.17.12.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:40:24 -0800 (PST)
From: Dinah Baum <dinahbaum123@gmail.com>
To: dinahbaum123@gmail.com
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3] configure: Add 'mkdir build' check
Date: Fri, 17 Feb 2023 15:40:06 -0500
Message-Id: <20230217204007.371525-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x831.google.com
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
Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
---
Changes since v2:
Updated error message
Reverted changes to 'help' command

 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 00415f0b48..784f9d18a5 100755
--- a/configure
+++ b/configure
@@ -31,7 +31,12 @@ then
         fi
     fi
 
-    mkdir build
+    if ! mkdir build || ! touch $MARKER
+    then
+        echo "ERROR: Could not create ./build directory. Check the permissions on
+            your source directory, or try doing an out-of-tree build."
+        exit 1
+    fi
     touch $MARKER
 
     cat > GNUmakefile <<'EOF'
-- 
2.30.2


