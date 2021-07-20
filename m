Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143773D05CC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:47:06 +0200 (CEST)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zS4-0007rf-2r
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFv-00049E-LE
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFt-0001gY-Tj
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n4so302905wms.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8eMrVQMHix+Odc2dF0jkwacRstSKfnaeNgv6a3FIAM=;
 b=qCK+MUd1mKXLXwz41ySS5aGVk9n4O7YI1j3BDUullPmNV042OB6LtyUGC8iCqfcOV0
 XK8au+9GXAFYXxJ5EhGpAhaUlA5ze3NLhEOu4VV4pp9hExvzn7EtpSvaIc3JKO5h9el3
 e+GmBU7fhm8Or6olhDShAR5cYenV6JNM50QhbW05U2mL8Tt+zkOZJ09OWY/cqED7yAwp
 2IH4gJf0QuKtnJLkWyjKbXNoRc9rPdNWzZ/AB6ieLXCv6IJ0eI3mHHgkdZNNIhZs4Ql7
 F0t7fNU5JMR4o0N3K8pYVo6b3beUTqKTlkYsldM+PnTcuV2wLU1ee02kLDjR6yyY1wf+
 PbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8eMrVQMHix+Odc2dF0jkwacRstSKfnaeNgv6a3FIAM=;
 b=hyFb9+YAvqDY/fgzlh8Rk9B82XSV3pfUpSA8Y51e4S6oqXFBNcfe73TzV6hZEjUESN
 piG34gMQQENIzRg/RgshsHu3NVyuAi3gktGNAN1a/IH8dr524iby6jGu3873096fNVGD
 lkR+ZYxvAAh+kDATeTwW0EdFl2lHjXBD8DLoRFKHnHkxqNQBPZReebnhMaBSFSDdI9YR
 3GSh7eRNxPu6hdSCdXehjwgkh0KoIPVjXdkJokZb31Rp/k0nVZAAoBOzFcPd+w4z5LxM
 0JZnz88UbEWte/AqJ04XdN8Ynffhe+e8i9WvSh601bhMzJHOwXS1GCOgBeF/6pby0QGe
 SEQQ==
X-Gm-Message-State: AOAM530eoFlltSidG2pe05e92Rks5YnD2kKx4ehbL9FzfUCgkbCnyzmi
 M2pwYX+Ez9R9M2XfYzidxck1Ew==
X-Google-Smtp-Source: ABdhPJwey5b2y+FaQkoqvimAnRsOKPza4gvQCQSeBX9ytNE8uKmJtQDWhV8q4J0HmNciK/De+ioiSg==
X-Received: by 2002:a05:600c:ac3:: with SMTP id
 c3mr35249809wmr.4.1626824068509; 
 Tue, 20 Jul 2021 16:34:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q72sm18164624wme.14.2021.07.20.16.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 475F21FFAF;
 Wed, 21 Jul 2021 00:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 26/29] tests/tcg/configure.sh: add handling for assembler
 only builds
Date: Wed, 21 Jul 2021 00:27:00 +0100
Message-Id: <20210720232703.10650-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up until this point we only handled local compilers or assumed we had
everything in the container. This falls down when we are building QEMU
inside the container.

This special handling only affects tricore for now but I put it in a
case just in case we add any other "special" targets. Setting
CROSS_CC_GUEST is a bit of a hack just to ensure the test runs as we
gate on a detected compiler even though the Makefile won't actually
use it. It also means we display something sane in the configure
output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210720114057.32053-3-alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index aa7c24328a..1f985ccfc0 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -72,6 +72,10 @@ fi
 : ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
+# tricore is special as it doesn't have a compiler
+: ${cross_as_tricore="tricore-as"}
+: ${cross_ld_tricore="tricore-ld"}
+
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -247,6 +251,20 @@ for target in $target_list; do
               fi
           fi
       fi
+
+      # Special handling for assembler only tests
+      eval "target_as=\"\${cross_as_$arch}\""
+      eval "target_ld=\"\${cross_ld_$arch}\""
+      if has $target_as && has $target_ld; then
+          case $target in
+              tricore-softmmu)
+                  echo "CROSS_CC_GUEST=$target_as" >> $config_target_mak
+                  echo "CROSS_AS_GUEST=$target_as" >> $config_target_mak
+                  echo "CROSS_LD_GUEST=$target_ld" >> $config_target_mak
+                  got_cross_cc=yes
+                  ;;
+          esac
+      fi
   fi
 
   if test $got_cross_cc = yes; then
-- 
2.32.0.264.g75ae10bc75


