Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F544F9B14
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 18:51:37 +0200 (CEST)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrpg-00013L-3r
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 12:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmH-00075U-UD
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrlz-00031D-HF
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:47:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so4445836wmn.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfyzv/itU9SEN9fxyUmMdmNwMeyB+oe9163CObc2A6g=;
 b=NzRFYbjOQGWCXWmTBUWB0x6HQ42WEqzv11MIO5CjyRK1LrFGCgtQU52Qt3l09zbRGz
 cPAh75ofRIc5mnPzP9Ih0Da+KGnEI6jJdSr3XlO1J15gkHBMdnNbEL9hdtZd8zzvY/w/
 PQkeiknKdkBt1v2YUuKVkwvhqil+RANX7RgmIBQvdJXOkmgh1RS8HkqmrstqCXxMwjsT
 cDBvRkyFl0A4F6BFfPvjrQKXZHUzdSp8tlSxWkckAA3rD4/Vsa7IoanPId4xyshJqK05
 IPlpVYPxU3GCF9QVxrzL+ikAiqjS3HkcIEk23EewHsfY7V6hJV4J/BFSUsq9xtx0wbuT
 Twiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfyzv/itU9SEN9fxyUmMdmNwMeyB+oe9163CObc2A6g=;
 b=d7vgpuKPhJdBgSFKLWSzjiWmPRmg4jC8b6BW9g7gRQUasqASviDlmr3iDfm+oYBq2K
 iVe3m81SI+eFwukftiEI6aW7s+i/0HQw4lncr+DYVd+HZmJv/DuyZ6j/w7delqbl1CVP
 RrHlFcJhYep6moX/OTyIIATE3b1CT2AHq7j9IHZwTdZQOq/l/zeOxhMSrJxxYbhRvyVr
 EpMrts1D52xACtQDyNbob1pZhdm5XmXy10oKuBmnS5Uy2MU2tee4qnZs911FTjIqfahR
 rmqmftouaxT8O9YBQMr/E92uL/e0p5ahZsXm2TlGa6iJOgfFbe+sAiVUoeDYR+75vXZq
 Udmg==
X-Gm-Message-State: AOAM531NJPsQm+BV466VORI4D1Imu/GLQJypjZkQUgvT7Ns3RVGyNqAx
 Fw65fyN4nUIbTVXxWVj/topS1Q==
X-Google-Smtp-Source: ABdhPJxiKcZIr2yVVQI8QjH5tNzv1e3WqVKbk6nEbHPbKXDJ0cmpetRw1yUJwFkOljuq0NxZb7ZRbg==
X-Received: by 2002:a7b:c77a:0:b0:38c:2c33:d8f1 with SMTP id
 x26-20020a7bc77a000000b0038c2c33d8f1mr17662018wmk.115.1649436465370; 
 Fri, 08 Apr 2022 09:47:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d59a1000000b002078c8b6dabsm5188076wrr.9.2022.04.08.09.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0FE371FFBA;
 Fri,  8 Apr 2022 17:47:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/15] docs/devel: add some notes on the
 binfmt-image-debian targets
Date: Fri,  8 Apr 2022 17:47:29 +0100
Message-Id: <20220408164742.2844631-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 aaron@os.amperecomputing.com, robhenry@microsoft.com, f4bug@amsat.org,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, pbonzini@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We document some of this on the wiki but lets move it into our
official developer notes documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>

---
v2
  - fix some trailing ws
---
 docs/devel/testing.rst | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 92d40cdd19..5b60a31807 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -637,6 +637,44 @@ The full set of annotations can be found here:
 
 https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_interface_ann.cpp
 
+docker-binfmt-image-debian-% targets
+------------------------------------
+
+It is possible to combine Debian's bootstrap scripts with a configured
+``binfmt_misc`` to bootstrap a number of Debian's distros including
+experimental ports not yet supported by a released OS. This can
+simplify setting up a rootfs by using docker to contain the foreign
+rootfs rather than manually invoking chroot.
+
+Setting up ``binfmt_misc``
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+You can use the script ``qemu-binfmt-conf.sh`` to configure a QEMU
+user binary to automatically run binaries for the foreign
+architecture. While the scripts will try their best to work with
+dynamically linked QEMU's a statically linked one will present less
+potential complications when copying into the docker image. Modern
+kernels support the ``F`` (fix binary) flag which will open the QEMU
+executable on setup and avoids the need to find and re-open in the
+chroot environment. This is triggered with the ``--persistent`` flag.
+
+Example invocation
+~~~~~~~~~~~~~~~~~~
+
+For example to setup the HPPA ports builds of Debian::
+
+  make docker-binfmt-image-debian-sid-hppa \
+    DEB_TYPE=sid DEB_ARCH=hppa \
+    DEB_URL=http://ftp.ports.debian.org/debian-ports/ \
+    DEB_KEYRING=/usr/share/keyrings/debian-ports-archive-keyring.gpg \
+    EXECUTABLE=(pwd)/qemu-hppa V=1
+
+The ``DEB_`` variables are substitutions used by
+``debian-boostrap.pre`` which is called to do the initial debootstrap
+of the rootfs before it is copied into the container. The second stage
+is run as part of the build. The final image will be tagged as
+``qemu/debian-sid-hppa``.
+
 VM testing
 ----------
 
-- 
2.30.2


