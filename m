Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C332A9527
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 23:31:48 +0200 (CEST)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5csU-00052J-GJ
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 17:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5c42-00015d-Uq
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5c40-0003aa-S1
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:37 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34757)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5c40-0003Zp-DJ
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:39:36 -0400
Received: by mail-wm1-x341.google.com with SMTP id y135so3360236wmc.1
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 13:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y72pQsH2+pAgJI3zXLgFu0D9M3OSNR6cGitEr7LgzBM=;
 b=aVW9+QGfM2cmEphKcYy9RxM+R59bNWc9o5f8QdQifQuUuP04tHNrIzbpRYWvAW9hhD
 8CsQ/a8OsgBjnsCMnjqKN/tdfVIfSA2vI2FSH+Q5TFvEkXYQ+gyKWBPFcQPhLhl3BL9i
 z7tXqXhVLfppHGjGDdBmpJNY11aZrjFqMG70RMVad0ma4XGJSaeF562KMBU2ojo6ayBy
 UfclIGgNAhLNhpqJs8S5ZGmI6B92YSijbM4I35ACCdiOaLRBZSbeACwBEFCARLUfWs39
 X66lNC2OPOvxyIucysw4qjjXzqZBqMyykk89VjQmvriSwCJ1BsZ8yL7jVqA6wMaXEcqt
 QxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y72pQsH2+pAgJI3zXLgFu0D9M3OSNR6cGitEr7LgzBM=;
 b=fR+SYJUx5MHv7V/lYle+o0cjcosxSDHSokapmId6YuO26nAV3/xsz3iMj3ImKlkyu3
 rR1vGyCBFwI/m7iDI5noWIvd0zfbjDY555BvJQ35AX/M9H3riBXu0y1pYoWOD75EOrxK
 BwoLNwHgtgzcZIk2ViJ2Fmhhk9wrlvUKoExHcAHyCwvpztS/Jc5gvoNvwucoeATmHHbi
 NnHjRJA/cuTVMgq1Jf7W1r1tYXPFad2vbicKKbKj8dP/wQPEqFz2JqIlhtTKnyx/30kn
 xpeIYsQBfsNdchZWZWioqZULrdAFdesTSmX1lmFCAI2gxqagxq/UFXoOU2+24izgTN6j
 7MBQ==
X-Gm-Message-State: APjAAAUfwHtwhkRYH87xxMtwgQSro6qVSXbMG9alqWZ/KmWiS5ceJPX+
 yC6XZwhPk9iRKa6bGMyC3BArvA==
X-Google-Smtp-Source: APXvYqzbf5nKlhw8nXXMWXhB4eSYvDFAEYPn1GdpJ78pkbB2mvBz5mwXFz/159K5wPsLJF3SEiAWjw==
X-Received: by 2002:a05:600c:2111:: with SMTP id
 u17mr149945wml.64.1567629575276; 
 Wed, 04 Sep 2019 13:39:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u83sm5732761wme.0.2019.09.04.13.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:39:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B39ED1FFAF;
 Wed,  4 Sep 2019 21:30:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 21:29:56 +0100
Message-Id: <20190904203013.9028-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v1 25/42] tests/docker: avoid $SHELL invoke
 bash directly
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On some images SHELL is pointing at a limited /bin/sh which doesn't
understand noprofile/norc. Given the run script is running bash just
invoke it directly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/run b/tests/docker/run
index 1014871fec0..8edc7026ee3 100755
--- a/tests/docker/run
+++ b/tests/docker/run
@@ -62,7 +62,7 @@ echo "* Prepared to run command:"
 echo "  $CMD"
 echo "* Hit Ctrl-D to continue, or type 'exit 1' to abort"
 echo
-$SHELL --noprofile --norc
+env bash --noprofile --norc
 
 if "$CMD"; then
     exit 0
@@ -72,7 +72,7 @@ elif test -n "$DEBUG"; then
     echo "* Hit Ctrl-D to exit"
     echo
     # Force error after shell exits
-    $SHELL --noprofile --norc && exit 1
+    env bash --noprofile --norc && exit 1
 else
     exit 1
 fi
-- 
2.20.1


