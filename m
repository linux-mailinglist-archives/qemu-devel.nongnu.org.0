Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B10F3D3E84
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:22:32 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ysZ-0000by-Bz
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygC-0005wX-Df
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygA-0008GQ-RN
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id h15so1226538wmq.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvYwZmYtXKv7T39rkMEAc/2GKSIETpKxhUXh+rpSwYM=;
 b=zb2gBkefS+LjWo7Ua1gdqGIbVnf0CMnMPD34k9lYRlBBr2CuZLByml3tgTcQwfVfO9
 shNru1WTasLdrjp8LSmejwaTgalC2J9znOqTQIB+PIo9AMidN0uKhsBpCcdPohJJfy7R
 Cc4tU/TLSVtyG9sEk66o7NIHMWUBMbmppjRpTr3LBqQf4H/YCj4cPLNQkBKVDGk3uHPZ
 NmDsTWXANJ8JsZp3BgTI/chpN+198zG58v8xM/HMwR6WjxtuWwaUnynmFtT+rsvF6av5
 YPaSXetrsYwMrl0NQesmj1kT6pYpFAy0P+plpYVUuqQptnxUz+zz8xluWBxaj6w8/ItJ
 DpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QvYwZmYtXKv7T39rkMEAc/2GKSIETpKxhUXh+rpSwYM=;
 b=oVZj8jJPvCbTU5+4VH2ujv2Qkmzf8EiFsc0yw2R9H0XCOkHdy3Ca+AzhOEUT+DdPtm
 4GPfYYyZ68jkwAb4vxSw14KxfGN+dtfhBOElajNAoffyczPWPE6LdOP1RNA++TfyOMVM
 8uLk2hRXCoF7D+t5wmK3dB4VZF4MmkvWq16CntEXLb9e3L+fS+g5tO5jPYviXioKodiQ
 jQqU1hnffSHs23Ia/eCw9hUMw5k7W5PkiblaZ6OCw3DEPC+NLxHBg1ng4ddiNGaSTfCo
 4p1C+35KH5+bDqbFi10ednvzS5FoK+MkWw8WV6Bv2C3XVq5XqqXKD8R2eYi+tnrUfdny
 EJKw==
X-Gm-Message-State: AOAM533oTwrV5/jKB08WLwSrdVvoLuJAyXjRTSsbRJ/lGxM0309gYp7U
 1p84vu+kY145mFskpFfVw6Ce1w==
X-Google-Smtp-Source: ABdhPJxqKWp3zV56QosDNWs/Qi7I44L6woY2DX3X7d9TOZPmUZ2TKQ4X6GrCEHeiq5gdHr1/kWBH0g==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr5478377wma.126.1627060181521; 
 Fri, 23 Jul 2021 10:09:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w16sm19823345wru.58.2021.07.23.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C6C31FFB1;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 25/28] tests/tcg/configure.sh: add handling for assembler only
 builds
Date: Fri, 23 Jul 2021 18:03:51 +0100
Message-Id: <20210723170354.18975-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
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
Message-Id: <20210720232703.10650-27-alex.bennee@linaro.org>

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
2.20.1


