Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E648F26A584
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 14:48:36 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIANv-0000b2-V9
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 08:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9rF-0001Pg-RP; Tue, 15 Sep 2020 08:14:52 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kI9rD-0008H2-K0; Tue, 15 Sep 2020 08:14:49 -0400
Received: by mail-pf1-x443.google.com with SMTP id d9so1835143pfd.3;
 Tue, 15 Sep 2020 05:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xS967nwniiPoKExhe31AY1Igl1jhGzMmH4nTv98GjJU=;
 b=LWGL2jH0BhQweSb6xxy55FJjQVE3jDYJNfQFFor3yCUYooR7DdVxjqQH43pUSSohZk
 TKRiE3Y50Mblh5SRGjKGE4pWYmwJ7K+Do7XZhsqR+TURXAljFDNVOuxXdRUK5m1Kx/ux
 9lVP5DBAcylwmDyw9hMqHszk3aCXdKAVKEpERVA9yZen9YgFSJGztk4mMnaslEt9UiZM
 ppkA/4E52s0kjWU8axONwhzqzPY44CAMGGa7MB2Ei6Fndv3ec6W9weTAiGo0el3qam8A
 UdtjLT8z2lZhbTgnL1SckJpR3/aJ7C/4yLi32c8HeaYu281b0qofbvcperNbR0F16IUu
 Iq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xS967nwniiPoKExhe31AY1Igl1jhGzMmH4nTv98GjJU=;
 b=TEikNU7MZbUgtr1t2enW2vMRtB2sBvOl/thmYzi3g0g9icbI0wh43OwvcnqARptLIJ
 ytMyPGLFWrBM9IQlZ7pDzippyVJJzL3mMTnTRwkUcPhSWePj6dpZzxXAXHM9GjjQ8IE2
 BQ0aCFHymSjAr7R4kXqWRfjfOSPz5zVIbc6ne2lqZ+xrjwAWuAYsdxBZuMwYAfNcEUj/
 Wqz2V5UsxGljvQz4BMiA+tSzSmuI0jdMC3Fhsu+xuXZ39ywQdPyIrV+2zVR0JqSelAJg
 kk0UXJUhIAA73MPlyuB2uIBLKSmkaGQO9OdkUg7F8R8GXy+mzRpG/YTFv2hYTPnGCh2E
 3eOw==
X-Gm-Message-State: AOAM533qYukHcZ/97/Oyz5ziUtAFL0L5h4+JdDRJB5zq4ZtOa76cgb33
 ZZQW71tXboBhQDkwHQLdLiXvyPBYdEcUTqNOtpI=
X-Google-Smtp-Source: ABdhPJwJGmwIT40KYnBDQSmL9gdh68crtqnv2UfXC/ET6mmmH80HrfikHaIWOQrOrMG4h8jXSOknDQ==
X-Received: by 2002:a05:6a00:22d2:b029:142:2501:3966 with SMTP id
 f18-20020a056a0022d2b029014225013966mr1635057pfj.43.1600172085532; 
 Tue, 15 Sep 2020 05:14:45 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 k28sm13683061pfh.196.2020.09.15.05.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:14:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 15/26] cirrus: Building freebsd in a single short
Date: Tue, 15 Sep 2020 20:13:07 +0800
Message-Id: <20200915121318.247-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200915121318.247-1-luoyonggang@gmail.com>
References: <20200915121318.247-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@FreeBSD.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 45f7b7b9f38f5c4d1529a37c93dedfc26a231bba
("cirrus.yml: Split FreeBSD job into two parts").

freebsd 1 hour limit not hit anymore

I think we going to a wrong direction, I think there is some tests a stall the test runner,
please look at
https://cirrus-ci.com/task/5110577531977728
When its running properly, the consumed time are little, but when tests running too long,
look at the cpu usage, the cpu usage are nearly zero. doesn't consuming time.

And look at
https://cirrus-ci.com/task/6119341601062912

If the tests running properly, the time consuming are little
We should not hide the error by split them

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Ed Maste <emaste@FreeBSD.org>
---
 .cirrus.yml | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 3dd9fcff7f..690c6882e8 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,38 +1,19 @@
 env:
   CIRRUS_CLONE_DEPTH: 1
 
-freebsd_1st_task:
+freebsd_12_task:
   freebsd_instance:
     image_family: freebsd-12-1
-    cpu: 4
-    memory: 4G
-  install_script: ASSUME_ALWAYS_YES=yes pkg bootstrap -f ; pkg install -y
-    bash curl cyrus-sasl git glib gmake gnutls gsed
-    nettle perl5 pixman pkgconf png usbredir
+    cpu: 8
+    memory: 8G
+  install_script:
+    - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
+    - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed 
+          nettle perl5 pixman pkgconf png usbredir
   script:
     - mkdir build
     - cd build
-    - ../configure --disable-user --target-list-exclude='alpha-softmmu
-        ppc64-softmmu ppc-softmmu riscv32-softmmu riscv64-softmmu s390x-softmmu
-        sparc64-softmmu sparc-softmmu x86_64-softmmu i386-softmmu'
-        --enable-werror || { cat config.log; exit 1; }
-    - gmake -j$(sysctl -n hw.ncpu)
-    - gmake -j$(sysctl -n hw.ncpu) check
-
-freebsd_2nd_task:
-  freebsd_instance:
-    image_family: freebsd-12-1
-    cpu: 4
-    memory: 4G
-  install_script: ASSUME_ALWAYS_YES=yes pkg bootstrap -f ; pkg install -y
-    bash curl cyrus-sasl git glib gmake gnutls gtk3 gsed libepoxy mesa-libs
-    nettle perl5 pixman pkgconf png SDL2 usbredir
-  script:
-    - ./configure --enable-werror --target-list='alpha-softmmu ppc64-softmmu
-        ppc-softmmu riscv32-softmmu riscv64-softmmu s390x-softmmu
-        sparc64-softmmu sparc-softmmu x86_64-softmmu i386-softmmu
-        sparc-bsd-user sparc64-bsd-user x86_64-bsd-user i386-bsd-user'
-        || { cat config.log; exit 1; }
+    - ../configure --enable-werror || { cat config.log; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake -j$(sysctl -n hw.ncpu) check
 
-- 
2.28.0.windows.1


