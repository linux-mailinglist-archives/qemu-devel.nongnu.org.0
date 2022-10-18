Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51EB602D8E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:41 +0200 (CEST)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6B-0003V9-U9
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgh-0002KC-7z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmga-000504-MJ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oE+3E3jGm4iDUWdYfIF6C9CXXTBvieh4iAWsUTJZKNI=;
 b=M58V63JBrDFLdXpRM5aTGroEe7bHB2t3naYDvDVpHuoCFRZ+vDuGXkOYrdG0stU7CoqG58
 oF4nkjmSj2UtBfK3CdYv1wEF+kklrvAOJaY4sI7h8oVhV2PJ+pXbavE1mTub7zUisTP2+X
 WABfbKKtNhw/MbPt3kS90u3J62tjDvg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-577-0mN55wOLO4G8Osntzo1KiQ-1; Tue, 18 Oct 2022 09:31:10 -0400
X-MC-Unique: 0mN55wOLO4G8Osntzo1KiQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c9-20020a05640227c900b0045d4a88c750so6973093ede.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oE+3E3jGm4iDUWdYfIF6C9CXXTBvieh4iAWsUTJZKNI=;
 b=5xguZYY5kA/Id43DYaOi/rBvLCSimrzcW10piDrEX0CXunP22DEMv8GPc4cmcvTF2k
 YFlay1DEwqy7uN0jMjHVbip3nLvpQp3mZUWjUzt9glh/hytJcmmfIV28s1YHu60Za/qw
 BKPNBYCzGlmCORKfZpfaKzhvldeJlAfC/jQU0/LrcyNaDUix772CRvk0Uni9jfECshNf
 +JBhZpWF4mphm97cexcsKt8uxQi3fVvmE214HbMdvOkqH+JkzIVEaumLNzQ4II5RXYb8
 skcOch3kAAD5vnT9B603o9IUGpc9OpKp0mJQJXDiM/6vIrOjyS4qW0HpgFUPrBQn4VBD
 kmcA==
X-Gm-Message-State: ACrzQf0gL2+0KqT+aehklENYMdEKnfDmhb/9/XPpPGpdIiukbBrIZ/HZ
 KKWKIrIxPIL8PS2GTGcjVZTOZvj3LYH0+1BJwSCVaFdN2jhszZOEKFUq+2LbM1LAaxNG22KiHmV
 f9TmzExmqR4EfQsNLU44FjIMwi9avzzye46mtWD9XJUys1xuY/RnCHs6S53CLaLLK62c=
X-Received: by 2002:a17:907:e87:b0:78e:2b3c:f672 with SMTP id
 ho7-20020a1709070e8700b0078e2b3cf672mr2442009ejc.74.1666099868695; 
 Tue, 18 Oct 2022 06:31:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6O6U19SyyzRj1WVbO1Be7mCNSSXm5/yGMq4x+uQwWIZXufy936ztrkFyr8dXkqSkYAQfVmjQ==
X-Received: by 2002:a17:907:e87:b0:78e:2b3c:f672 with SMTP id
 ho7-20020a1709070e8700b0078e2b3cf672mr2441985ejc.74.1666099868379; 
 Tue, 18 Oct 2022 06:31:08 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 sz15-20020a1709078b0f00b0078d9b967962sm7418575ejc.65.2022.10.18.06.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michal Privoznik <mprivozn@redhat.com>,
	qemu-stable@nongnu.org
Subject: [PULL 06/53] configure: Avoid using strings binary
Date: Tue, 18 Oct 2022 15:29:55 +0200
Message-Id: <20221018133042.856368-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Michal Privoznik <mprivozn@redhat.com>

When determining the endiandness of the target architecture we're
building for a small program is compiled, which in an obfuscated
way declares two strings. Then, we look which string is in
correct order (using strings binary) and deduct the endiandness.
But using the strings binary is problematic, because it's part of
toolchain (strings is just a symlink to
x86_64-pc-linux-gnu-strings or llvm-strings). And when
(cross-)compiling, it requires users to set the symlink to the
correct toolchain.

Fortunately, we have a better alternative anyways. We can mimic
what compiler.h is already doing: comparing __BYTE_ORDER__
against values for little/big endiandness.

Bug: https://bugs.gentoo.org/876933
Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Message-Id: <d6d9c7043cfe6d976d96694f2b4ecf85cf3206f1.1665732504.git.mprivozn@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/configure b/configure
index f9ec050bf8..81561be7c1 100755
--- a/configure
+++ b/configure
@@ -1423,30 +1423,31 @@ if test "$tcg" = "enabled"; then
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 fi
 
-# ---
+##########################################
 # big/little endian test
 cat > $TMPC << EOF
-#include <stdio.h>
-short big_endian[] = { 0x4269, 0x4765, 0x4e64, 0x4961, 0x4e00, 0, };
-short little_endian[] = { 0x694c, 0x7454, 0x654c, 0x6e45, 0x6944, 0x6e41, 0, };
-int main(int argc, char *argv[])
-{
-    return printf("%s %s\n", (char *)big_endian, (char *)little_endian);
-}
+#if defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+# error LITTLE
+#endif
+int main(void) { return 0; }
 EOF
 
-if compile_prog ; then
-    if strings -a $TMPE | grep -q BiGeNdIaN ; then
-        bigendian="yes"
-    elif strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
-        bigendian="no"
-    else
-        echo big/little test failed
-        exit 1
-    fi
+if ! compile_prog ; then
+  bigendian="no"
 else
+  cat > $TMPC << EOF
+#if defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+# error BIG
+#endif
+int main(void) { return 0; }
+EOF
+
+  if ! compile_prog ; then
+    bigendian="yes"
+  else
     echo big/little test failed
     exit 1
+  fi
 fi
 
 ##########################################
-- 
2.37.3


