Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC42D6633
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:18:51 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRSk-000443-BK
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREw-0005Xw-Vb
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:39 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREv-0003Sk-3Q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:34 -0500
Received: by mail-wr1-x443.google.com with SMTP id l9so6583078wrt.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TICSptmRquseAr/MW7mzIdwFqUHsR5vAFCTCP5aYKdg=;
 b=u0tK1SXpPkExod3LEfkRjh40XawRT4w5Wizr9J7L0918kXxHg6N2fc2L5K2hR+lpvy
 RrTwRXM5Wpgv6yhrNhgiC+L3/jwh+X5pwCJ+2EESoatRUyEjOHLGCn1+phDw+cu8zNWj
 bwpbyXIUrM/Y71y1kPEAGUVWMO4+5lXtEZjeZybMCPvoLrcOURiFcm/gSjsLXeQ03zYY
 cNxsIdf9VTd3PAFfcQ0NL28ih3NE6KZgzbbwDkr2qSK3xh/v0q/89Y8vgGcLnDRpKZGk
 b4BNjrQJHj7wHNSspp9ofqT+pp69r8NWASck1Kr6pkqyDkIR1tLgfAIUS5vx1BKplUyM
 wGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TICSptmRquseAr/MW7mzIdwFqUHsR5vAFCTCP5aYKdg=;
 b=jmyJplc466TkuJVjAbc/0P7FBdmJU1omKoUMfcyV2jhCEZ6oWk/7Zd51OzIPzOC2ts
 U811hUvSqzmWIMuSV8EqARU7XxGAq8Vyk9ckVcSxzlCzI9tctkmgT3Vt85PiRSnnXMBQ
 5rL1Hqzx7RrJw/xxINakJQHVAi+B1miGh9FAD4g53lS4hiuukmYlAnqOiU2M8me/ViJY
 iLl/dnobTa3VceWFysavqV8lJTk6DZqWUOPWfa/Lixj+9ksVntHWHpqGAaXcoZPYlBBK
 QpVeyfDGjHlGvpsvULmMYd7gPa7ph/CyAoYOHdHnU3iuQDoxRvjXIg0Vb8K3sFg7RTf0
 Q6Cw==
X-Gm-Message-State: AOAM532uxWLCZAtW5/hgRES0ukvbOuIzp3UYRZmnjaYsIa2rQ9Cl8CxT
 tQpogtZGQ5il7xIZivQpWmToeg==
X-Google-Smtp-Source: ABdhPJzSB3G3ypc6y1xKISgGO4UZpSL6311n6250VPKViewt/ulsIIIc4w4LgIXGjZ5ErGUgOY2qcw==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr10237974wrp.161.1607627071676; 
 Thu, 10 Dec 2020 11:04:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k18sm12488440wrd.45.2020.12.10.11.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2367F1FF8C;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
Date: Thu, 10 Dec 2020 19:04:11 +0000
Message-Id: <20201210190417.31673-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise we miss coverage of KVM support in the cross build. To
balance it out add arm-softmmu (no kvm, subset of aarch64),
cris-softmmu and ppc-softmmu to the exclude list which do get coverage
elsewhere.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index bd6473a75a..fcc1b95290 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -7,9 +7,9 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
-        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
-          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
-          xtensa-softmmu"
+        --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
+          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
+          ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
 # Job to cross-build specific accelerators.
-- 
2.20.1


