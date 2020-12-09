Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850012D4778
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:08:58 +0100 (CET)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2xV-000440-Gf
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2pz-0006Tg-95
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:11 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2pv-0000qY-9Y
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:10 -0500
Received: by mail-wr1-x442.google.com with SMTP id c1so2518333wrq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkh1pOxBAFBR4DvQb5PGpvC3TtGAei2QsfUU0F5c/aE=;
 b=ckJysN8HOzx3ttlb0XcW2eAeqz2HrC32iRk6dn8r1q1v93Cz/LDh4RjFf4pNevFMm/
 Bh7nxhY/bLs2Ndz1F+z2JAfbh6d2HxHMSWh1lkhguvSHMYr6eUrcN0dhAMfy2IH+lgVd
 h4AKufi7kK5o8O+AIs8eXGnPKx6DBfAhXUvEXZMgYrHnXLlP++HnvK9ZOiLT2PcqPvqU
 3rEM5amqiGAafpcjeeWBl590H2pk65Q0Hwh6dUY5640/xWxPYRu1jJ5Cg7uidNcc+Ep3
 tV3b8o671lC8ncZ9mSKV0pmthNttPXMMsOQX7MDxGRi9BPdce/h9tHOqVMdzTS7sF95M
 1ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkh1pOxBAFBR4DvQb5PGpvC3TtGAei2QsfUU0F5c/aE=;
 b=fm+UFTeLzHLF4o/PhFDzgvkEHfeShDLdNfNXulmihKNoPyd132+Sm96k6RikpKHn7s
 d+zUuxF9fOr7fxWRABtUQsHn/5ap6eCMPqfbgCgWPQd0mFejS1DUguza9B4bOeAVCvuK
 HfcSsVrd8W6h41pc/bmUaDoFU6uCBv0wqTchGktuGcq0nE3ZvnOUO5xmPk/p3mhmFsSP
 SrIjkgAZ3EcGzvCRzv8ElrVmSwfO/6ePfiOTfSJejjvcyGfBfHbYpCn0g5A8aAtIWl+G
 gkX7KCGcPtIe70KrHo83GJ4IFIEP1/yttaYR49BpucSf9rct4VKN+VYnxrxELiq9arws
 ZfKQ==
X-Gm-Message-State: AOAM533WP/Bc/FHwVfffxtxXORnXHq/hM/BMGGqJ871fTVoAvFN3cnaG
 2d7OCYDottOXQEs7H8vRixUocQ==
X-Google-Smtp-Source: ABdhPJxRNAbeINjxucsjxMh8MGtVMZCsmtyDtOQqQtbWv6WtuJ2LdfkqvtMi/lKJjGgjARZOOu9/Rw==
X-Received: by 2002:a5d:6105:: with SMTP id v5mr3604125wrt.178.1607533265257; 
 Wed, 09 Dec 2020 09:01:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w12sm5297333wre.57.2020.12.09.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:01:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 643BC1FF8C;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/6] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
Date: Wed,  9 Dec 2020 17:00:55 +0000
Message-Id: <20201209170059.20742-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209170059.20742-1-alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
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
balance it out add cris-softmmu and ppc-softmmu to the exclude list
which do get coverage elsewhere.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 03ebfabb3f..308f4cb755 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -8,8 +8,8 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
-        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
-          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
+        --target-list-exclude="cris-softmmu i386-softmmu microblaze-softmmu
+          mips-softmmu mipsel-softmmu mips64-softmmu ppc-softmmu sh4-softmmu
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
-- 
2.20.1


