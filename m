Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2824B69DE6F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:07:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQUD-0006zQ-T2; Tue, 21 Feb 2023 06:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pUQU2-0006z7-UT; Tue, 21 Feb 2023 06:06:55 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pUQU0-00070E-UW; Tue, 21 Feb 2023 06:06:54 -0500
Received: by mail-qt1-x834.google.com with SMTP id h19so1139512qtk.7;
 Tue, 21 Feb 2023 03:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H/7hifj/TdQErbbFrIHWXuABFcNzRKLymVMeIp6GJ6Y=;
 b=We461EPJApD0WYFZm0Pkot1O9xzonXG/AFtJHl/iWetFJOWVXl0WDfLKV0rPOk2vg2
 SZQ69wpa9O8LiuXe23awPvU6xNypc3IXy5FbHD30TOzU7JIs732EPpH7QqjjgC/gIXdq
 Hpitce0fU9OWWAjg+EizyHL1/HJpLJY0Q67pYi9JNqqeMOOJR9sg5eulWhHlBD1eyyzO
 tskIZfGS2mTfWSHnBAdiY2Q49DmxSEPie7DtgXafdP90akfDjybtCglsmsgiFRVU4Nvu
 KyvNxGII13V/sjUXyo97OVAn4CC+hyShwsKWVNAnkVznjkV23wpJNF3p21+1Gsom8NAD
 nwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/7hifj/TdQErbbFrIHWXuABFcNzRKLymVMeIp6GJ6Y=;
 b=rDHCwz6nV5oMbm2NKeRo/uN29Lrxl0Q6qRocraiUUynr7srk8+wzE1CkPz087UStrn
 on3kG++Gk2kJPLZN4Pqn2mcdaUniBJ86+ltvxd+gjI4nfyqK5rEixnXQWpCk+0Y5bxud
 1vpQN0CFhO8eyIRe8uNlGqwI7W3iLpbUo+OYPyRHzqjRpXQcRsikzBs2JZ+EYjaGU04u
 n5MLDU7zVg3VuXo4ZxGT5s+OXD/CZrjzL4UPex2ncMIgfZZ57R/QoHm2zGEN6JbxLeEh
 cs9/EmL2nQnV3B/95STuYzloZFQv8f+BwU0VzMBRBYmRRxEC/xx0AY62l/e1i2+QKW47
 US3A==
X-Gm-Message-State: AO0yUKVWy4UdLxk8qW7XkTlAcefRjOpOQgg43+ccKqE/TTbyC7HFfXkN
 RMuwtq96xWiNqZ5tX9MBoR4IWTnbi0Hlsw==
X-Google-Smtp-Source: AK7set9AR23O2xW+O2Nvueep48RUF/Y6yuFw3RAt9IGpOeOVInX529pgehHFyrHG7iC6vklrir3sAg==
X-Received: by 2002:ac8:5c08:0:b0:3b8:63fa:11be with SMTP id
 i8-20020ac85c08000000b003b863fa11bemr5227631qti.66.1676977610905; 
 Tue, 21 Feb 2023 03:06:50 -0800 (PST)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::675])
 by smtp.gmail.com with ESMTPSA id
 q65-20020ae9dc44000000b0073bb50640d8sm7423871qkf.71.2023.02.21.03.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 03:06:50 -0800 (PST)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Dinah Baum <dinahbaum123@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4] configure: Add 'mkdir build' check
Date: Tue, 21 Feb 2023 06:06:30 -0500
Message-Id: <20230221110631.4142-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x834.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index cf6db3d551..1ef3e7f77d 100755
--- a/configure
+++ b/configure
@@ -31,7 +31,12 @@ then
         fi
     fi
 
-    mkdir build
+    if ! mkdir build || ! touch $MARKER
+    then
+        echo "ERROR: Could not create ./build directory. Check the permissions on"
+        echo "your source directory, or try doing an out-of-tree build."
+        exit 1
+    fi
     touch $MARKER
 
     cat > GNUmakefile <<'EOF'
-- 
2.30.2


