Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4A514FE8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:51:14 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkStl-0004KU-Lt
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSo-0001tH-LL
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSm-00068Y-GH
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id y21so9477235edo.2
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShlFAMo9vIx7fPh6AcvtW8Q3VA/Fy2DGTEg/pChtEAo=;
 b=DUZ0DSywLhWDpMIblDCCsFwyEy9Ne3OorHP60GPwiJmMneoN7O+V+ws2pHPQ0gDDW8
 YMqyGEDuYlZf5prRAUgGXfV9r+uF+xqRUoPMQI2usRWINbsuWHLUmbIw5iAwofDYR5/5
 VTTdTVX3rRS2id/kbXNRsH0VwAvBvID4CWv3+476LGdohPxd8H7gZYG0QBo3bg2enTeC
 /SEDspPcsPlJP9SMaKI5p6R4kXE29LdzhnMgn/SBXd9lR8lnNlbGAkGjkc8Z7i8T5shL
 VkaEID0730mkcBxoyQsiuO/By2EvAgosaBFy16ktKukns8zZgo/VknF+r6WkfHukOMAy
 Oa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ShlFAMo9vIx7fPh6AcvtW8Q3VA/Fy2DGTEg/pChtEAo=;
 b=VCzWGZowErl/uA5e6B4LynbPcODZX/yEpla5Lfs04JE+nCsJ8pwMrKwAqCwnGepAZI
 RFB4mrfatmUxtAlVXdqYIwlfg6FssZTV1vQbjO1wHlvDVP/duk2qWIveEdJDY83ECRUH
 hQ3+UVIete3WUBZalpujxLZ4+ELwqUIe+y+DJSsBG20Us5Q/7R2da3kc+BKnBpJMyzsf
 aJ9TQefTxnpyn4sxHg+WDpDHhny3O0mSBXCtQYTVrnKaWkGUOUEcqb6NKQuBjDwccBVr
 iERhytWsG/bSbekhHwM9UN1J8j1Id00kfx+4nzMVC2TbwgCoKU+4Rq9ocIVXbeWsGpXk
 o/eQ==
X-Gm-Message-State: AOAM531mRLXEf1CTZ60ZwReTZalxIjBdancKZbVZYZVZaqxNFGT52E63
 TgEnIrXxkwLz1rkNiKDq56yoFATRz21nzA==
X-Google-Smtp-Source: ABdhPJw1xFxS0zdAdGeJ5w/Aj8uU+wXoUL1ahQULPB0DwIbtkwPyzUiXUV1TyiEXP95p8HtMUNYNeg==
X-Received: by 2002:aa7:c5c8:0:b0:426:34a7:f8b with SMTP id
 h8-20020aa7c5c8000000b0042634a70f8bmr5562994eds.321.1651245799225; 
 Fri, 29 Apr 2022 08:23:19 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/25] configure: move Windows flags detection to meson
Date: Fri, 29 Apr 2022 17:22:54 +0200
Message-Id: <20220429152312.335715-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 20 --------------------
 meson.build |  8 ++++++++
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index b146763fbd..c54e10ea26 100755
--- a/configure
+++ b/configure
@@ -224,10 +224,6 @@ glob() {
     eval test -z '"${1#'"$2"'}"'
 }
 
-ld_has() {
-    $ld --help 2>/dev/null | grep ".$1" >/dev/null 2>&1
-}
-
 if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
 then
   error_exit "main directory cannot contain spaces nor colons"
@@ -2089,22 +2085,6 @@ if test "$solaris" = "no" && test "$tsan" = "no"; then
     fi
 fi
 
-# Use ASLR, no-SEH and DEP if available
-if test "$mingw32" = "yes" ; then
-    flags="--no-seh --nxcompat"
-
-    # Disable ASLR for debug builds to allow debugging with gdb
-    if test "$debug" = "no" ; then
-        flags="--dynamicbase $flags"
-    fi
-
-    for flag in $flags; do
-        if ld_has $flag ; then
-            QEMU_LDFLAGS="-Wl,$flag $QEMU_LDFLAGS"
-        fi
-    done
-fi
-
 # Guest agent Windows MSI package
 
 if test "$QEMU_GA_MANUFACTURER" = ""; then
diff --git a/meson.build b/meson.build
index 84f3ae7bd6..31380f1f2e 100644
--- a/meson.build
+++ b/meson.build
@@ -182,6 +182,14 @@ qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
+if targetos == 'windows'
+  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl,--nxcompat')
+  # Disable ASLR for debug builds to allow debugging with gdb
+  if get_option('optimization') == '0'
+    qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase')
+  endif
+endif
+
 if get_option('gprof')
   qemu_cflags += ['-p']
   qemu_cxxflags += ['-p']
-- 
2.35.1



