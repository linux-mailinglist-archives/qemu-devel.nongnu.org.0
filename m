Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013BF261EAF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 21:54:49 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFjhX-0000WO-Ve
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 15:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFjcZ-00071j-LY; Tue, 08 Sep 2020 15:49:39 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:36944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFjcX-0002Yq-PF; Tue, 08 Sep 2020 15:49:39 -0400
Received: by mail-pj1-x1043.google.com with SMTP id kk9so140700pjb.2;
 Tue, 08 Sep 2020 12:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCgbOADJo9SgTrFvdP0jEa9PoTonwhtwSH4+oqHE/pQ=;
 b=qeZCYnAuB0kBO6Xa2vSII4TZV8F5o3T8ImYKprseime9E25SZUkMhgZeC4/iyWyy+z
 4wH3LK20LK7NNbe12EQ1GR1czMvTt+YAWW5x18htqeiGMae5fQjionmgaxqdAw8AoCcx
 OEpfaCFMOXa9Kk0MmzQXQnBpwlqiRfj3mtGvBnw2Ipi/N22C8wii1K5C/rflsAPN1K2w
 s25QsznwS4LcIKmsH7fFK5aq673WK96KZkzTaDAGp/0/nhF5eco2SvRwUwPxMuooxqWn
 nGZdCWzk3FBij9EEENrcQHd5kIwdqBXQFqnNHFfR61Ld6ncTvENwJA6tjU4QKAnpU4nu
 OfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCgbOADJo9SgTrFvdP0jEa9PoTonwhtwSH4+oqHE/pQ=;
 b=mBv4cVe+YW7s/y7KTUfCrlTXXu6UY/GHM0e/0XxW8YUcbuS2M6mRd6HaLliWX8QhVG
 3Fk0kmfNaEgkNttJ3ispokyYtUS8JPgn/uJxtQXPcnzutFGyYP/FrMwN4xY3ms2fDWrc
 8kjZF3QIypVQH2JyKMLLRlp1xY/bWGiElhb8Udqn+AHorjOUbRtbqkW1e8VBy3sLFilk
 jpjwd7xnfgxSSDJSBRRnjXwi4bS0aYIEYqL5bNZC3ky/IJbO+vln4Degeh9w6idVBS6+
 ItmWakiJiPx8B9mpyzuh2SBUMSCJf27SzyQ0z2wLOXitIYmakCL7mMoOIYOZMrsaUKN6
 ziFg==
X-Gm-Message-State: AOAM533Zlb73EbjlIWSvWQpU96kzybLirLYrO7NEJo6fvuJ7UbNmA2fO
 PIHL05CYk7sgqrY3f8WmELKPDfK5HvH4ga1m
X-Google-Smtp-Source: ABdhPJzesUiP89d2OpcpfflMG3gpwaXNh6vkkODppPb+vIW+h117zoi3dssKQIjuPN/2xYMHpMsavg==
X-Received: by 2002:a17:90b:317:: with SMTP id
 ay23mr402557pjb.68.1599594575549; 
 Tue, 08 Sep 2020 12:49:35 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id n127sm216922pfn.155.2020.09.08.12.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 12:49:34 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] cirrus: Building freebsd in a single short
Date: Wed,  9 Sep 2020 03:48:18 +0800
Message-Id: <20200908194820.702-15-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200908194820.702-1-luoyonggang@gmail.com>
References: <20200908194820.702-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1043.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

freebsd 1 hour limit not hit anymore

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 49335e68c9..b0004273bb 100644
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


